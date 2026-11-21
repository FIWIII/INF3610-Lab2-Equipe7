#include <stdint.h>
#include "xparameters.h"
#include "xscugic.h"
#include "xaxidma.h"
#include "xhls_accel.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "lib_xmmult_hw.h"

/* Identifiants repris de l'application Float32-A fonctionnelle. */
static XHls_accel xmmult_dev;
static XHls_accel_Config xmmult_config = { 0, XPAR_XHLS_ACCEL_0_BASEADDR };
static XScuGic ScuGic;
extern XAxiDma AxiDma;


#include "xtmrctr_l.h"
#include "xil_io.h"
static uint32_t failure_stage, failure_reason, failure_tx, failure_rx;
static uint32_t failure_regs[12];
static uint32_t diag_ticks(void) {
    return XTmrCtr_ReadReg(XPAR_AXI_TIMER_1_BASEADDR, 0, XTC_TCR_OFFSET);
}
static int capture_failure(uint32_t stage, uint32_t reason) {
    if (!failure_reason) {
        failure_stage=stage; failure_reason=reason;
        failure_tx=Xil_In32(XPAR_XAXIDMA_0_BASEADDR+4);
        failure_rx=Xil_In32(XPAR_XAXIDMA_0_BASEADDR+0x34);
        const unsigned off[8]={0,0x30,0x18,0x28,0x48,0x58,4,0x34};
        for (int i=0;i<8;++i) failure_regs[i]=Xil_In32(XPAR_XAXIDMA_0_BASEADDR+off[i]);
        for (int i=0;i<4;++i) failure_regs[8+i]=Xil_In32(XPAR_XHLS_ACCEL_0_BASEADDR+4*i);
    }
    return XST_FAILURE;
}
void BenchmarkReportFailure(void) {
    xil_printf("ERROR stage=%u reason=%u MM2S=%08x S2MM=%08x HLS=%08x\r\n",
        failure_stage,failure_reason,failure_tx,failure_rx,failure_regs[8]);
    xil_printf("TX_CR=%08x RX_CR=%08x TX_ADDR=%08x TX_LEN=%u RX_ADDR=%08x RX_LEN=%u GIE=%x IER=%x ISR=%x\r\n",
        failure_regs[0],failure_regs[1],failure_regs[2],failure_regs[3],
        failure_regs[4],failure_regs[5],failure_regs[9],failure_regs[10],failure_regs[11]);
}
int DmaDiagnosticWaitReset(void) {
    uint32_t start=diag_ticks();
    while (!XAxiDma_ResetIsDone(&AxiDma))
        if ((uint32_t)(diag_ticks()-start)>=XPAR_AXI_TIMER_1_CLOCK_FREQUENCY)
            return capture_failure(1,2);
    return XST_SUCCESS;
}
static int wait_stage(int direction,uint32_t stage) {
    uint32_t start=diag_ticks();
    for (;;) {
        uint32_t tx=Xil_In32(XPAR_XAXIDMA_0_BASEADDR+4);
        uint32_t rx=Xil_In32(XPAR_XAXIDMA_0_BASEADDR+0x34);
        if ((tx|rx)&XAXIDMA_ERR_ALL_MASK) return capture_failure(stage,1);
        if ((direction==XAXIDMA_DMA_TO_DEVICE?tx:rx)&XAXIDMA_IDLE_MASK) return XST_SUCCESS;
        if ((uint32_t)(diag_ticks()-start)>=XPAR_AXI_TIMER_1_CLOCK_FREQUENCY)
            return capture_failure(stage,2);
    }
}
static int submit(UINTPTR address,unsigned length,int direction,unsigned stage) {
    if (XAxiDma_SimpleTransfer(&AxiDma,address,length,direction)!=XST_SUCCESS)
        return capture_failure(stage,3);
    return XST_SUCCESS;
}
void __attribute__((noinline)) DmaDiagnosticEnd(void) { __asm__ volatile("nop"); }

static void XMmultIsr(void *InstancePtr)
{
    XHls_accel *dev = (XHls_accel *)InstancePtr;
    XHls_accel_InterruptGlobalDisable(dev);
    XHls_accel_InterruptDisable(dev, 0xffffffffU);
    XHls_accel_InterruptClear(dev, 1U);
}

static int XMmultSetupInterrupt(void)
{
    int status;
    XScuGic_Config *cfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (cfg == NULL) return XST_FAILURE;
    status = XScuGic_CfgInitialize(&ScuGic, cfg, cfg->CpuBaseAddress);
    if (status != XST_SUCCESS) return status;
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
                                 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
                                 &ScuGic);
    status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_XHLS_ACCEL_0_INTR,
                             (Xil_InterruptHandler)XMmultIsr, &xmmult_dev);
    if (status != XST_SUCCESS) return status;
    XScuGic_Enable(&ScuGic, XPAR_FABRIC_XHLS_ACCEL_0_INTR);
    Xil_ExceptionEnable();
    return XST_SUCCESS;
}

int Setup_HW_Accelerator(int8_t A[DIM][DIM], int8_t B[DIM][DIM],
                         int32_t res_hw[DIM][DIM],
                         unsigned int dma_size_send, unsigned int dma_size_receive)
{
    int status = XHls_accel_CfgInitialize(&xmmult_dev, &xmmult_config);
    if (status != XST_SUCCESS) return status;
    status = XMmultSetupInterrupt();
    if (status != XST_SUCCESS) return status;

    /* One-time preparation for unchanged buffers, as in INT8-A. */
    Xil_DCacheFlushRange((UINTPTR)A,dma_size_send);
    Xil_DCacheFlushRange((UINTPTR)B,dma_size_send);
    Xil_DCacheFlushRange((UINTPTR)res_hw,dma_size_receive);
    return XST_SUCCESS;
}

int Start_HW_Accelerator(void)
{
    /* Pas de reconfiguration du GIC ni de CfgInitialize a chaque essai. */
    XHls_accel_Start(&xmmult_dev);
    return XST_SUCCESS;
}

void matrix_multiply_ref(const int8_t a[DIM][DIM], const int8_t b[DIM][DIM],
                         int32_t out[DIM][DIM])
{
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
            int32_t sum = 0;
            for (int k = 0; k < DIM; ++k)
                sum += (int32_t)a[i][k] * (int32_t)b[k][j];
            out[i][j] = sum;
        }
}


int Run_HW_Accelerator(int8_t A[DIM][DIM], int8_t B[DIM][DIM], int32_t res_hw[DIM][DIM], unsigned int dma_size_send, unsigned int dma_size_receive) {
    if (submit((UINTPTR)res_hw,dma_size_receive,XAXIDMA_DEVICE_TO_DMA,2)!=XST_SUCCESS) return XST_FAILURE;
    if (submit((UINTPTR)A,dma_size_send,XAXIDMA_DMA_TO_DEVICE,3)!=XST_SUCCESS || wait_stage(XAXIDMA_DMA_TO_DEVICE,4)!=XST_SUCCESS) return XST_FAILURE;
    if (submit((UINTPTR)B,dma_size_send,XAXIDMA_DMA_TO_DEVICE,5)!=XST_SUCCESS || wait_stage(XAXIDMA_DMA_TO_DEVICE,6)!=XST_SUCCESS) return XST_FAILURE;
    if (wait_stage(XAXIDMA_DEVICE_TO_DMA,7)!=XST_SUCCESS) return XST_FAILURE;
    Xil_DCacheInvalidateRange((UINTPTR)res_hw,dma_size_receive);
    return XST_SUCCESS;
}
