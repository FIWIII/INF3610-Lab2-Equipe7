
#ifndef MMULT_CORE_H
#define MMULT_CORE_H

#include "mmult_config.h"

static void mmult_core(mat_type a[DIM][DIM],
                       mat_type b[DIM][DIM],
                       mat_type c[DIM][DIM]) {

    #pragma HLS ARRAY_PARTITION variable=a type=block factor=21 dim=2
    #pragma HLS ARRAY_PARTITION variable=b type=block factor=21 dim=1

    L1: for (int i = 0; i < DIM; ++i)

        L2: for (int j = 0; j < DIM; ++j) {
            #pragma HLS PIPELINE

            mat_type sum = 0;

            L3: for (int k = 0; k < DIM; ++k)
                sum += a[i][k] * b[k][j];

            c[i][j] = sum;
        }
}

#endif
