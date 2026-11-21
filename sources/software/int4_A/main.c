#include <stdint.h>
#include "xparameters.h"
#include "xtmrctr.h"
#include "xaxidma.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "lib_xmmult_hw.h"

#define NUM_TESTS 10
#define AXI_TIMER_BASEADDR XPAR_AXI_TIMER_1_BASEADDR
#define TIMER_COUNTER 0

static XTmrCtr timer_dev;
XAxiDma AxiDma;

/* Alignement pour les operations de cache et les transferts DMA. */
static int8_t A[DIM][DIM] __attribute__((aligned(64)));
static int8_t B[DIM][DIM] __attribute__((aligned(64)));
static int32_t res_hw[DIM][DIM] __attribute__((aligned(64)));
static int32_t res_sw[DIM][DIM] __attribute__((aligned(64)));

static int init_dma(void)
{
    XAxiDma_Config *cfg = XAxiDma_LookupConfig(XPAR_XAXIDMA_0_BASEADDR);
    int status;
    if (cfg == NULL) return XST_FAILURE;
    status = XAxiDma_CfgInitialize(&AxiDma, cfg);
    if (status != XST_SUCCESS) return status;
    if (XAxiDma_HasSg(&AxiDma)) return XST_FAILURE;
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_Reset(&AxiDma);
    unsigned int count = 100000000U;
    while (!XAxiDma_ResetIsDone(&AxiDma)) {
        if (--count == 0U) return XST_FAILURE;
    }
    return XST_SUCCESS;
}

int main(void)
{
    int status;
    int errors = 0;
    uint32_t sw_cycles, hw_cycles, start;
    const unsigned int dma_size_send = DMA_SIZE_SEND;
    const unsigned int dma_size_receive = DMA_SIZE_RECEIVE;

    xil_printf("\n**************************************************************************\n");
    xil_printf("  INT4-A MATRIX MULT -> AXI DMA -> ARM HP\n");
    xil_printf("  Entrees INT4 signees, resultats INT32\n");
    xil_printf("  Entrees AXI-Stream 8 bits : un INT4 par octet, sans packing\n");
    xil_printf("  Extension de signe INT4 vers 8 bits\n");
    xil_printf("  Matrices %d x %d\n", DIM, DIM);
    xil_printf("  Nombre de tests effectues : %d\n", NUM_TESTS);
    xil_printf("  Inspire de l'application XAPP1170 de Xilinx\n");
    xil_printf("**************************************************************************\n");
    xil_printf("Input DMA=%u bytes/matrix; output DMA=%u bytes\n",
               dma_size_send, dma_size_receive);

    status = init_dma();
    if (status != XST_SUCCESS) {
        xil_printf("ERROR: DMA init failed\n");
        return XST_FAILURE;
    }
    status = XTmrCtr_Initialize(&timer_dev, AXI_TIMER_BASEADDR);
    if (status != XST_SUCCESS) {
        xil_printf("ERROR: timer init failed\n");
        return XST_FAILURE;
    }
    XTmrCtr_SetOptions(&timer_dev, TIMER_COUNTER, XTC_ENABLE_ALL_OPTION);
    XTmrCtr_Start(&timer_dev, TIMER_COUNTER);

    /* Valeurs signees et deterministes, sans depassement INT32. */
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
            A[i][j] = (int8_t)((i + j) % 16 - 8);
            B[i][j] = (int8_t)((3 * i + j) % 16 - 8);
        }

    /* Fixed inputs are reused: initial flushes are outside the timed HW batch,
     * matching INT8-A. Flush again before DMA if A/B or C are modified by CPU. */
    status = Setup_HW_Accelerator(A, B, res_hw,
                                  dma_size_send, dma_size_receive);
    if (status != XST_SUCCESS) {
        xil_printf("ERROR: HLS accelerator setup failed\n");
        return XST_FAILURE;
    }

    XTmrCtr_Reset(&timer_dev, TIMER_COUNTER);
    start = XTmrCtr_GetValue(&timer_dev, TIMER_COUNTER);
    for (int test = 0; test < NUM_TESTS; ++test)
        matrix_multiply_ref(A, B, res_sw);
    sw_cycles = XTmrCtr_GetValue(&timer_dev, TIMER_COUNTER) - start;

    XTmrCtr_Reset(&timer_dev, TIMER_COUNTER);
    start = XTmrCtr_GetValue(&timer_dev, TIMER_COUNTER);
    for (int test = 0; test < NUM_TESTS; ++test) {
        status = Start_HW_Accelerator();
        if (status != XST_SUCCESS) break;
        status = Run_HW_Accelerator(A, B, res_hw,
                                    dma_size_send, dma_size_receive);
        if (status != XST_SUCCESS) break;
    }
    hw_cycles = XTmrCtr_GetValue(&timer_dev, TIMER_COUNTER) - start;
    if (status != XST_SUCCESS) {
        BenchmarkReportFailure();
        xil_printf("ERROR: HW run failed\n");
        return XST_FAILURE;
    }

    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j)
            if (res_sw[i][j] != res_hw[i][j]) {
                if (errors < 10)
                    xil_printf("Mismatch (%d,%d): SW=%d HW=%d\n",
                               i, j, (int)res_sw[i][j], (int)res_hw[i][j]);
                ++errors;
            }

    xil_printf("SW execution (ARM cycles/test):       %u\r\n",
            (unsigned int)(sw_cycles / NUM_TESTS));

    xil_printf("HW execution (FPGA+DMA cycles/test): %u\r\n",
            (unsigned int)(hw_cycles / NUM_TESTS));

    if (hw_cycles != 0U) {
        uint32_t speedup_x1000 =
            (uint32_t)(((uint64_t)sw_cycles * 1000ULL) / hw_cycles);

        uint32_t frac = speedup_x1000 % 1000U;

        xil_printf("Acceleration (SW/HW):               %u.",
                (unsigned int)(speedup_x1000 / 1000U));

        if (frac < 100U) xil_printf("0");
        if (frac < 10U)  xil_printf("0");

        xil_printf("%u x\r\n", (unsigned int)frac);
    }

    xil_printf("Result: %s; errors=%d\n", errors == 0 ? "PASS" : "FAIL", errors);
    if (errors == 0) {
        print("SW and HW results match!\n\n");
        return XST_SUCCESS;
     } else {
        return XST_FAILURE;
        print("ERROR: results mismatch\n\n");
    }
}
