#ifndef INT4_B_MMULT_ALGO_H
#define INT4_B_MMULT_ALGO_H
#include "../common/int4/mmult_config.h"
void mmult_hw(mat_type a[DIM][DIM], mat_type b[DIM][DIM], acc_type c[DIM][DIM]);
#endif
