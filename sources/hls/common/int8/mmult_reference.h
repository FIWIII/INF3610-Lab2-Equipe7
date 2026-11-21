#ifndef MMULT_REFERENCE_H
#define MMULT_REFERENCE_H
#include "mmult_config.h"
static void mmult_reference(
    const mat_type a[DIM][DIM],
    const mat_type b[DIM][DIM],
    int64_t c[DIM][DIM])
{
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {

            int64_t sum = 0;

            for (int k = 0; k < DIM; ++k) {
                sum += (int64_t)a[i][k] *
                       (int64_t)b[k][j];
            }

            c[i][j] = sum;
        }
    }
}
static void init_matrices(mat_type a[DIM][DIM], mat_type b[DIM][DIM]) {
 for(int i=0;i<DIM;++i)
  for(int j=0;j<DIM;++j) {a[i][j]=(mat_type)(i+j);b[i][j]=(mat_type)(i*j);}
}
#endif
