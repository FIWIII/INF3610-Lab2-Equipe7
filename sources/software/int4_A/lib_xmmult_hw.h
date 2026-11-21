#ifndef LIB_XMMULT_HW_H
#define LIB_XMMULT_HW_H

#include <stdint.h>

#define DIM 180
#define SIZE (DIM * DIM)
#define DMA_SIZE_SEND    (SIZE * sizeof(int8_t))
#define DMA_SIZE_RECEIVE (SIZE * sizeof(int32_t))

int Setup_HW_Accelerator(int8_t A[DIM][DIM], int8_t B[DIM][DIM],
                         int32_t res_hw[DIM][DIM],
                         unsigned int dma_size_send, unsigned int dma_size_receive);
int Start_HW_Accelerator(void);
int Run_HW_Accelerator(int8_t A[DIM][DIM], int8_t B[DIM][DIM],
                       int32_t res_hw[DIM][DIM],
                       unsigned int dma_size_send, unsigned int dma_size_receive);
void matrix_multiply_ref(const int8_t a[DIM][DIM], const int8_t b[DIM][DIM],
                         int32_t out[DIM][DIM]);
void BenchmarkReportFailure(void);
int DmaDiagnosticWaitReset(void);
void DmaDiagnosticEnd(void);
#endif
