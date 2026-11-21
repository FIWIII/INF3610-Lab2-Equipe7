#include "xparameters.h"
#include "xscugic.h"
#include "xaxidma.h"
#include "xhls_accel.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "lib_xmmult_hw.h"
#include "xtmrctr_l.h"
#include "xil_io.h"

extern XAxiDma AxiDma;
static XHls_accel xmmult_dev;
static XScuGic ScuGic;
static volatile int ResultExample = 0;

/* Debugger-readable records preserve the first observed error before UART output.
 * reason: 0=checkpoint, 1=DMA error, 2=timeout, 3=submit failure.
 * HLS AP_CTRL is read once per record (done/ready are clear-on-read).
 */
volatile DmaDiagnosticSnapshot DmaDiagnosticTrace[DMA_DIAG_TRACE_CAPACITY];
volatile DmaDiagnosticSnapshot DmaDiagnosticFirstFailure;
volatile uint32_t DmaDiagnosticTraceCount = 0;
volatile uint32_t DmaDiagnosticFailed = 0;

static uint32_t diagnostic_ticks(void)
{
    return XTmrCtr_ReadReg(XPAR_AXI_TIMER_1_BASEADDR, 0, XTC_TCR_OFFSET);
}

void DmaDiagnosticCapture(uint32_t stage, uint32_t reason,
                          uint32_t tx_status, uint32_t rx_status)
{
    DmaDiagnosticSnapshot s;
    const UINTPTR dma = XPAR_XAXIDMA_0_BASEADDR;
    const UINTPTR hls = XPAR_XHLS_ACCEL_0_BASEADDR;
    s.stage = stage; s.reason = reason; s.ticks = diagnostic_ticks();
    s.mm2s_sr = tx_status; s.s2mm_sr = rx_status;
    s.mm2s_cr = Xil_In32(dma + 0x00); s.s2mm_cr = Xil_In32(dma + 0x30);
    s.mm2s_addr = Xil_In32(dma + 0x18); s.mm2s_length = Xil_In32(dma + 0x28);
    s.s2mm_addr = Xil_In32(dma + 0x48); s.s2mm_length = Xil_In32(dma + 0x58);
    s.hls_ctrl = Xil_In32(hls + 0x00); s.hls_gie = Xil_In32(hls + 0x04);
    s.hls_ier = Xil_In32(hls + 0x08); s.hls_isr = Xil_In32(hls + 0x0c);
    s.hls_isr_seen = ResultExample;
    if (reason && !DmaDiagnosticFailed) {
        DmaDiagnosticFirstFailure = s;
        DmaDiagnosticFailed = 1;
    }
    if (DmaDiagnosticTraceCount < DMA_DIAG_TRACE_CAPACITY)
        DmaDiagnosticTrace[DmaDiagnosticTraceCount++] = s;

}

int DmaDiagnosticCheck(uint32_t stage)
{
    uint32_t tx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x04);
    uint32_t rx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x34);
    if ((tx | rx) & XAXIDMA_ERR_ALL_MASK) {
        if (!DmaDiagnosticFailed) DmaDiagnosticCapture(stage, 1, tx, rx);
        return XST_FAILURE;
    }
    return DmaDiagnosticFailed ? XST_FAILURE : XST_SUCCESS;
}

static int diagnostic_checkpoint(uint32_t stage)
{
    uint32_t tx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x04);
    uint32_t rx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x34);
    uint32_t reason = ((tx | rx) & XAXIDMA_ERR_ALL_MASK) ? 1U : 0U;
    if (reason) DmaDiagnosticCapture(stage, reason, tx, rx);
#if INT4_A_DIAGNOSTIC_VERBOSE
    else DmaDiagnosticCapture(stage, 0, tx, rx);
#endif
    return DmaDiagnosticFailed ? XST_FAILURE : XST_SUCCESS;
}

static int diagnostic_wait(uint32_t stage, int direction)
{
    uint32_t start = diagnostic_ticks();
    for (;;) {
        /* Check both channels before interpreting Idle. Halted != completed. */
        uint32_t tx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x04);
        uint32_t rx = Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x34);
        if ((tx | rx) & XAXIDMA_ERR_ALL_MASK) {
            DmaDiagnosticCapture(stage, 1, tx, rx);
            return XST_FAILURE;
        }
        if ((direction == XAXIDMA_DMA_TO_DEVICE ? tx : rx) & XAXIDMA_IDLE_MASK)
            return diagnostic_checkpoint(stage);
        if ((uint32_t)(diagnostic_ticks() - start) >= DMA_DIAG_TIMEOUT_TICKS) {
            DmaDiagnosticCapture(stage, 2, tx, rx);
            return XST_FAILURE;
        }
    }
}

int DmaDiagnosticWaitReset(void)
{
    uint32_t start = diagnostic_ticks();
    while (!XAxiDma_ResetIsDone(&AxiDma)) {
        if ((uint32_t)(diagnostic_ticks() - start) >= DMA_DIAG_TIMEOUT_TICKS) {
            DmaDiagnosticCapture(DMA_DIAG_RESET, 2,
                Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x04),
                Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x34));
            return XST_FAILURE;
        }
    }
    return diagnostic_checkpoint(DMA_DIAG_INITIALIZED);
}

/* Breakpoint target: reaching this never resets, retries, or starts hardware. */
void __attribute__((noinline)) DmaDiagnosticEnd(void)
{
    __asm__ volatile ("nop");
}

static void XMmultIsr(void *InstancePtr)
{
    XHls_accel *dev = (XHls_accel *)InstancePtr;
    XHls_accel_InterruptGlobalDisable(dev);
    XHls_accel_InterruptDisable(dev, 0xffffffffU);
    XHls_accel_InterruptClear(dev, 1);
    ResultExample = 1;
}

int Setup_HW_Accelerator(void)
{
    XHls_accel_Config config = {0, XPAR_XHLS_ACCEL_0_BASEADDR};
    XScuGic_Config *gic_cfg;
    int status;

    status = XHls_accel_CfgInitialize(&xmmult_dev, &config);
    if (status != XST_SUCCESS) return status;

    gic_cfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (!gic_cfg) return XST_FAILURE;
    status = XScuGic_CfgInitialize(&ScuGic, gic_cfg, gic_cfg->CpuBaseAddress);
    if (status != XST_SUCCESS) return status;

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
            (Xil_ExceptionHandler)XScuGic_InterruptHandler, &ScuGic);
    status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_XHLS_ACCEL_0_INTR,
            (Xil_InterruptHandler)XMmultIsr, &xmmult_dev);
    if (status != XST_SUCCESS) return status;
    XScuGic_Enable(&ScuGic, XPAR_FABRIC_XHLS_ACCEL_0_INTR);
    Xil_ExceptionEnable();
    return XST_SUCCESS;
}

int Start_HW_Accelerator(void)
{
    if (DmaDiagnosticCheck(DMA_DIAG_HLS_START) != XST_SUCCESS) return XST_FAILURE;
    ResultExample = 0;
    XHls_accel_InterruptEnable(&xmmult_dev, 1);
    XHls_accel_InterruptGlobalEnable(&xmmult_dev);
    XHls_accel_Start(&xmmult_dev);
    return diagnostic_checkpoint(DMA_DIAG_HLS_START);
}

void pack_int4(const int8_t src[DIM][DIM], uint32_t dst[PACKED_WORDS])
{
    /* Preserve the wire format across row boundaries, including zero padding.
     * Avoid the original per-element /DIM and %DIM and the separate clear pass. */
    unsigned word_index = 0, lane = 0;
    uint32_t word = 0;
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
            word |= ((uint32_t)(uint8_t)src[i][j] & 15U) << (4U * lane);
            if (++lane == 8U) {
                dst[word_index++] = word;
                word = 0;
                lane = 0;
            }
        }
    if (lane != 0U) dst[word_index] = word;
}

void matrix_multiply_ref(const int8_t a[DIM][DIM], const int8_t b[DIM][DIM],
                         int32_t out[DIM][DIM])
{
    int i, j, k;
    for (i = 0; i < DIM; ++i) {
        for (j = 0; j < DIM; ++j) {
            int32_t sum = 0;
            for (k = 0; k < DIM; ++k)
                sum += (int32_t)a[i][k] * (int32_t)b[k][j];
            out[i][j] = sum;
        }
    }
}

static int diagnostic_submit(uint32_t stage, UINTPTR address,
                             uint32_t length, int direction)
{
    int status;
    if (DmaDiagnosticCheck(stage) != XST_SUCCESS) return XST_FAILURE;
    status = XAxiDma_SimpleTransfer(&AxiDma, address, length, direction);
    /* Snapshot immediately after submission, before printing status. */
    if (diagnostic_checkpoint(stage) != XST_SUCCESS) return XST_FAILURE;
    if (status != XST_SUCCESS) {
        DmaDiagnosticCapture(stage, 3,
            Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x04),
            Xil_In32(XPAR_XAXIDMA_0_BASEADDR + 0x34));

    }
    return status;
}

/* Call once after packing and before reusing these unchanged DMA buffers. */
void Prepare_HW_Buffers(const uint32_t *packed_A, const uint32_t *packed_B,
                        int32_t res_hw[DIM][DIM])
{
    Xil_DCacheFlushRange((UINTPTR)packed_A, DMA_INPUT_BYTES);
    Xil_DCacheFlushRange((UINTPTR)packed_B, DMA_INPUT_BYTES);
    Xil_DCacheFlushRange((UINTPTR)res_hw, DMA_OUTPUT_BYTES);
}

int Run_HW_Accelerator(const uint32_t *packed_A, const uint32_t *packed_B,
                       int32_t res_hw[DIM][DIM])
{
#if INT4_A_DIAGNOSTIC_VERBOSE
    xil_printf("DMA bytes A/B=%u C=%u; driver max TX=%u RX=%u\r\n",
        (unsigned)DMA_INPUT_BYTES, (unsigned)DMA_OUTPUT_BYTES,
        AxiDma.TxBdRing.MaxTransferLen, AxiDma.RxBdRing[0].MaxTransferLen);
#endif

    if (diagnostic_submit(DMA_DIAG_SUBMIT_C, (UINTPTR)res_hw,
            DMA_OUTPUT_BYTES, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) return XST_FAILURE;
    if (diagnostic_submit(DMA_DIAG_SUBMIT_A, (UINTPTR)packed_A,
            DMA_INPUT_BYTES, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS) return XST_FAILURE;
    if (diagnostic_wait(DMA_DIAG_WAIT_A, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS)
        return XST_FAILURE;
    if (diagnostic_submit(DMA_DIAG_SUBMIT_B, (UINTPTR)packed_B,
            DMA_INPUT_BYTES, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS) return XST_FAILURE;
    if (diagnostic_wait(DMA_DIAG_WAIT_B, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS)
        return XST_FAILURE;
    if (diagnostic_wait(DMA_DIAG_WAIT_C, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS)
        return XST_FAILURE;
    Xil_DCacheInvalidateRange((UINTPTR)res_hw, DMA_OUTPUT_BYTES);
    return diagnostic_checkpoint(DMA_DIAG_COMPLETE);
}

void BenchmarkReportFailure(void) {
    const volatile DmaDiagnosticSnapshot *s=&DmaDiagnosticFirstFailure;
    Xil_DCacheFlushRange((UINTPTR)&DmaDiagnosticFirstFailure,sizeof(DmaDiagnosticFirstFailure));
    Xil_DCacheFlushRange((UINTPTR)&DmaDiagnosticFailed,sizeof(DmaDiagnosticFailed));
    xil_printf("ERROR stage=%u reason=%u TX=%08x RX=%08x HLS=%08x TX_LEN=%u RX_LEN=%u GIE=%x IER=%x ISR=%x\r\n",
        s->stage,s->reason,s->mm2s_sr,s->s2mm_sr,s->hls_ctrl,s->mm2s_length,s->s2mm_length,s->hls_gie,s->hls_ier,s->hls_isr);
}
