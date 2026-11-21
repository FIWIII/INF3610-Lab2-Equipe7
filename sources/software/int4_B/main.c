#include <stdint.h>
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xaxidma.h"
#include "xtmrctr.h"
#include "lib_xmmult_hw.h"

#ifndef BENCH_TRIALS
#define BENCH_TRIALS 10
#endif
#define AXI_TIMER_BASEADDR XPAR_AXI_TIMER_1_BASEADDR
#define TIMER_COUNTER 0
#if XPAR_AXI_TIMER_1_CLOCK_FREQUENCY != 100000000
#error "Benchmark requires existing 100 MHz AXI timer"
#endif
static XTmrCtr timer_dev;
XAxiDma AxiDma;
static int8_t A[DIM][DIM] __attribute__((aligned(64)));
static int8_t B[DIM][DIM] __attribute__((aligned(64)));
static uint32_t packed_A[PACKED_WORDS] __attribute__((aligned(64)));
static uint32_t packed_B[PACKED_WORDS] __attribute__((aligned(64)));
static int32_t res_hw[DIM][DIM] __attribute__((aligned(64)));
static int32_t res_sw[DIM][DIM] __attribute__((aligned(64)));

static uint32_t ticks(void) {
    return XTmrCtr_GetValue(&timer_dev, TIMER_COUNTER);
}
static int compare_results(void) {
    int errors = 0;
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j)
            if (res_sw[i][j] != res_hw[i][j]) ++errors;
    return errors;
}
static int init_dma(void) {
    XAxiDma_Config *cfg = XAxiDma_LookupConfig(XPAR_XAXIDMA_0_BASEADDR);
    if (!cfg || XAxiDma_CfgInitialize(&AxiDma, cfg) != XST_SUCCESS ||
        XAxiDma_HasSg(&AxiDma)) return XST_FAILURE;
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_Reset(&AxiDma); /* Startup only; no reset or retry after an error. */
    return DmaDiagnosticWaitReset();
}
int main(void) {
    uint64_t sw_total = 0, hw_total = 0, pack_total = 0;
    uint32_t start;
    int status = XST_SUCCESS;

    int errors = 0;
    xil_printf("\r\n**************************************************************************\r\n");
    xil_printf("  INT4-B MATRIX MULT -> AXI DMA -> ARM HP\r\n");
    xil_printf("  Entrees INT4 signees, resultats INT32\r\n");
    xil_printf("  Entrees AXI-Stream 32 bits : huit INT4 par mot, avec packing\r\n");
    xil_printf("  Matrices %d x %d\r\n", DIM, DIM);
    xil_printf("  Nombre de tests effectues : %d\r\n", BENCH_TRIALS);
    xil_printf("  Inspire de l'application XAPP1170 de Xilinx\r\n");
    xil_printf("**************************************************************************\r\n");
    if (XTmrCtr_Initialize(&timer_dev, AXI_TIMER_BASEADDR) != XST_SUCCESS) {
        BenchmarkReportFailure(); DmaDiagnosticEnd(); return 1;
    }
    XTmrCtr_SetOptions(&timer_dev, TIMER_COUNTER, XTC_ENABLE_ALL_OPTION);
    XTmrCtr_Start(&timer_dev, TIMER_COUNTER);
    if (init_dma() != XST_SUCCESS || Setup_HW_Accelerator() != XST_SUCCESS) {
        BenchmarkReportFailure(); DmaDiagnosticEnd(); return 1;
    }
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
            A[i][j] = (int8_t)((i + j) % 16 - 8);
            B[i][j] = (int8_t)((i * j) % 16 - 8);
        }
    XTmrCtr_Reset(&timer_dev, TIMER_COUNTER);


    for (int test = 0; test < BENCH_TRIALS; ++test) {
        start = ticks();

        matrix_multiply_ref(A, B, res_sw);

        sw_total += (uint32_t)(ticks() - start);
    }

    /* Repack each transaction. Cache preparation belongs to FPGA+DMA timing. */
    for (int test = 0; test < BENCH_TRIALS; ++test) {
        start = ticks();
        pack_int4(A, packed_A); pack_int4(B, packed_B);
        pack_total += (uint32_t)(ticks() - start);
        start = ticks();
        Prepare_HW_Buffers(packed_A, packed_B, res_hw);
        status = Start_HW_Accelerator();
        if (status == XST_SUCCESS)
            status = Run_HW_Accelerator(packed_A, packed_B, res_hw);
        hw_total += (uint32_t)(ticks() - start);
        if (status != XST_SUCCESS) break;
    }
    if (status != XST_SUCCESS) {
        BenchmarkReportFailure();
        xil_printf("Transfer failed; stopping without retry\r\n");
        DmaDiagnosticEnd(); return 1;
    }
    /* Check the final full matrix outside timing, as in INT8-A/INT4-B. */
    errors = compare_results();
    if (errors) {
        xil_printf("GEMM mismatch; errors=%d\r\n", errors);
        DmaDiagnosticEnd(); return 1;
    }

    
    uint32_t hw_x1000 = hw_total
        ? (uint32_t)(sw_total * 1000ULL / hw_total) : 0;

    uint32_t total_x1000 = (hw_total + pack_total)
        ? (uint32_t)(sw_total * 1000ULL / (hw_total + pack_total)) : 0;

    xil_printf("SW execution (ARM cycles/test):       %u\r\n",
            (unsigned int)(sw_total / BENCH_TRIALS));

    xil_printf("HW execution (FPGA+DMA cycles/test): %u\r\n",
            (unsigned int)(hw_total / BENCH_TRIALS));

    xil_printf("Packing A+B (ARM cycles/test):       %u\r\n",
            (unsigned int)(pack_total / BENCH_TRIALS));

    uint32_t frac = hw_x1000 % 1000U;

    xil_printf("Acceleration (SW/HW):               %u.",
            (unsigned int)(hw_x1000 / 1000U));

    if (frac < 100U) xil_printf("0");
    if (frac < 10U)  xil_printf("0");

    xil_printf("%u x\r\n", (unsigned int)frac);

    frac = total_x1000 % 1000U;

    xil_printf("Acceleration (including packing):   %u.",
            (unsigned int)(total_x1000 / 1000U));

    if (frac < 100U) xil_printf("0");
    if (frac < 10U)  xil_printf("0");

    xil_printf("%u x\r\n", (unsigned int)frac);

    xil_printf("Result: PASS; errors=%d\r\n", errors);
    xil_printf("SW and HW results match!\r\n");

        
    DmaDiagnosticEnd();
    return 0;
}
