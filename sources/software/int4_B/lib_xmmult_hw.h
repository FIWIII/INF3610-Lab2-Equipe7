#ifndef LIB_XMMULT_HW_H
#define LIB_XMMULT_HW_H

#include <stdint.h>

/* Successful-run tracing is optional and excluded from normal benchmarks.
 * Error snapshots, bounded waits and the stop-on-error behavior remain enabled. */
#ifndef INT4_A_DIAGNOSTIC_VERBOSE
#define INT4_A_DIAGNOSTIC_VERBOSE 0
#endif
#define DMA_DIAG_TIMEOUT_TICKS 100000000U /* 1 second at the existing 100 MHz timer */
#define DMA_DIAG_TRACE_CAPACITY 24U

enum DmaDiagnosticStage {
    DMA_DIAG_INITIALIZED = 1, DMA_DIAG_HLS_START = 2,
    DMA_DIAG_SUBMIT_C = 3, DMA_DIAG_SUBMIT_A = 4, DMA_DIAG_WAIT_A = 5,
    DMA_DIAG_SUBMIT_B = 6, DMA_DIAG_WAIT_B = 7, DMA_DIAG_WAIT_C = 8,
    DMA_DIAG_COMPLETE = 9, DMA_DIAG_RESET = 10
};
typedef struct {
    uint32_t stage, reason, ticks;
    uint32_t mm2s_sr, s2mm_sr, mm2s_cr, s2mm_cr;
    uint32_t mm2s_addr, mm2s_length, s2mm_addr, s2mm_length;
    uint32_t hls_ctrl, hls_gie, hls_ier, hls_isr, hls_isr_seen;
} DmaDiagnosticSnapshot;
extern volatile DmaDiagnosticSnapshot DmaDiagnosticTrace[DMA_DIAG_TRACE_CAPACITY];
extern volatile DmaDiagnosticSnapshot DmaDiagnosticFirstFailure;
extern volatile uint32_t DmaDiagnosticTraceCount, DmaDiagnosticFailed;
void DmaDiagnosticCapture(uint32_t stage, uint32_t reason,
                          uint32_t tx_status, uint32_t rx_status);
int DmaDiagnosticCheck(uint32_t stage);
int DmaDiagnosticWaitReset(void);
void DmaDiagnosticEnd(void);

#define DIM 180
#define SIZE (DIM * DIM)
#define PACKED_WORDS ((SIZE + 7) / 8)
#define DMA_INPUT_BYTES (PACKED_WORDS * sizeof(uint32_t))
#define DMA_OUTPUT_BYTES (SIZE * sizeof(int32_t))

void BenchmarkReportFailure(void);
int Setup_HW_Accelerator(void);
int Start_HW_Accelerator(void);
/* Flush CPU-written inputs/output before starting a batch. Run reuses them;
 * call Prepare again whenever the packed inputs or CPU-written C change. */
void Prepare_HW_Buffers(const uint32_t *packed_A, const uint32_t *packed_B,
                        int32_t res_hw[DIM][DIM]);
int Run_HW_Accelerator(const uint32_t *packed_A, const uint32_t *packed_B,
                       int32_t res_hw[DIM][DIM]);
void pack_int4(const int8_t src[DIM][DIM], uint32_t dst[PACKED_WORDS]);
void matrix_multiply_ref(const int8_t a[DIM][DIM], const int8_t b[DIM][DIM],
                         int32_t out[DIM][DIM]);
#endif
