#ifndef INF3610_INT4_MMULT_REFERENCE_H
#define INF3610_INT4_MMULT_REFERENCE_H

#include <stdint.h>
#include "mmult_config.h"

// Independent software reference using 64-bit arithmetic.
static void mmult_reference(const mat_type a[DIM][DIM],
                            const mat_type b[DIM][DIM],
                            int64_t out[DIM][DIM]) {
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {
            int64_t sum = 0;
            for (int k = 0; k < DIM; ++k) {
                sum += (int64_t)a[i][k].to_int() *
                       (int64_t)b[k][j].to_int();
            }
            out[i][j] = sum;
        }
    }
}

static void init_matrices(mat_type a[DIM][DIM],
                          mat_type b[DIM][DIM]) {
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {
            a[i][j] = (mat_type)((i + j) % 16 - 8);
            b[i][j] = (mat_type)((i * j) % 16 - 8);
        }
    }
}

#endif
