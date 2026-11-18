#ifndef MMULT_CORE_H
#define MMULT_CORE_H
#include "mmult_config.h"
// Shared mathematical kernel. Put architecture-specific HLS pragmas here later.
static void mmult_core(mat_type a[DIM][DIM], mat_type b[DIM][DIM],
                       mat_type c[DIM][DIM]) {

 L1: for (int i=0; i<DIM; ++i)
          
  L2: for (int j=0; j<DIM; ++j) {
   #pragma HLS PIPELINE
   mat_type sum = 0;
   L3: for (int k=0; k<DIM; ++k)
        sum += a[i][k]*b[k][j];
   c[i][j] = sum;
  }
}
#endif
