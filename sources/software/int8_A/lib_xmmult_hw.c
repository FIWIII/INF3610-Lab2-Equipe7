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

#define DMA_POLL_LIMIT 100000000U

static int wait_dma(int direction)
{
    unsigned int count = DMA_POLL_LIMIT;
    while (XAxiDma_Busy(&AxiDma, direction)) {
        if (--count == 0U) {
            xil_printf("ERROR: DMA timeout direction=%d\n", direction);
            return XST_FAILURE;
        }
    }
    return XST_SUCCESS;
}

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

    Xil_DCacheFlushRange((UINTPTR)A, dma_size_send);
    Xil_DCacheFlushRange((UINTPTR)B, dma_size_send);
    Xil_DCacheFlushRange((UINTPTR)res_hw, dma_size_receive);
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

int Run_HW_Accelerator(int8_t A[DIM][DIM], int8_t B[DIM][DIM],
                       int32_t res_hw[DIM][DIM],
                       unsigned int dma_size_send, unsigned int dma_size_receive)
{
    int status;

    /* Preparer S2MM avant MM2S pour eviter le blocage de la sortie. */
    status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)res_hw,
                                    dma_size_receive, XAXIDMA_DEVICE_TO_DMA);
    if (status != XST_SUCCESS) return status;

    /* Un element INT8 par transfert AXI-Stream : aucun packing. */
    status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)A,
                                    dma_size_send, XAXIDMA_DMA_TO_DEVICE);
    if (status != XST_SUCCESS) return status;
    status = wait_dma(XAXIDMA_DMA_TO_DEVICE);
    if (status != XST_SUCCESS) return status;

    status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)B,
                                    dma_size_send, XAXIDMA_DMA_TO_DEVICE);
    if (status != XST_SUCCESS) return status;
    status = wait_dma(XAXIDMA_DMA_TO_DEVICE);
    if (status != XST_SUCCESS) return status;

    status = wait_dma(XAXIDMA_DEVICE_TO_DMA);
    if (status != XST_SUCCESS) return status;

    Xil_DCacheInvalidateRange((UINTPTR)res_hw, dma_size_receive);
    return XST_SUCCESS;
}
