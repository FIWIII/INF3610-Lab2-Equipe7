#ifndef INF3610_INT4_MMULT_CORE_H
#define INF3610_INT4_MMULT_CORE_H

#include "mmult_config.h"

static void mmult_core(mat_type a[DIM][DIM],
                       mat_type b[DIM][DIM],
                       acc_type out[DIM][DIM]) {
#pragma HLS INLINE off


    mat_type_prod temp;
#if MMULT_MUL_IMPL == 1
#pragma HLS BIND_OP variable=temp op=mul impl=fabric
#elif MMULT_MUL_IMPL == 2
#pragma HLS BIND_OP variable=temp op=mul impl=dsp
#endif

    L1: for (int ia = 0; ia < DIM; ++ia) {
        L2: for (int ib = 0; ib < DIM; ++ib) {
            acc_type sum = 0;
            L3: for (int id = 0; id < DIM; ++id) {
                temp = a[ia][id] * b[id][ib];
                sum += temp;
            }
            out[ia][ib] = sum;
        }
    }
}

#endif
