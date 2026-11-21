#ifndef MMULT_CORE_H
#define MMULT_CORE_H
#include "mmult_config.h"
// Shared mathematical kernel. Put architecture-specific HLS pragmas here later.
static void mmult_core(mat_type a[DIM][DIM], mat_type b[DIM][DIM],
                       acc_type c[DIM][DIM]) {


	mat_type_prod temp;

	L1:for (int ia = 0; ia < DIM; ++ia)
		L2:for (int ib = 0; ib < DIM; ++ib)
		{

			acc_type sum = 0;
			L3:for (int id = 0; id < DIM; ++id){
				temp = a[ia][id] * b[id][ib];
				sum = sum + temp;
			}
			c[ia][ib] = sum;
		};

		return;
}
#endif
