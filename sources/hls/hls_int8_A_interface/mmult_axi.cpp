
#include "mmult_axi.h"
#include "../common/int8/mmult_core.h"
#include <stdint.h>

void HLS_accel(
    hls::stream<AXI_VAL_in>  &INPUT_STREAM,
    hls::stream<AXI_VAL_out> &OUTPUT_STREAM)
{
#pragma HLS INTERFACE axis port=INPUT_STREAM
#pragma HLS INTERFACE axis port=OUTPUT_STREAM
#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS

    mat_type a[DIM][DIM];
    mat_type b[DIM][DIM];
	acc_type c[DIM][DIM];

    // --------------------------------------------------
    // 1. Chargement complet de A (INT8)
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
#pragma HLS PIPELINE II=1
            AXI_VAL_in w = INPUT_STREAM.read();

            a[i][j] = (int8_t)w.data;
        }

    // --------------------------------------------------
    // 2. Chargement complet de B (INT8)
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
#pragma HLS PIPELINE II=1
            AXI_VAL_in w = INPUT_STREAM.read();

            b[i][j] = (int8_t)w.data;
        }

    // --------------------------------------------------
    // 3. Multiplication matricielle
    // --------------------------------------------------
    mmult_core(a, b, c);

    // --------------------------------------------------
    // 4. Transmission de C (INT32)
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
#pragma HLS PIPELINE II=1
            AXI_VAL_out w;

            w.data = (ap_uint<32>)c[i][j];

            w.keep = -1;
            w.strb = -1;
            w.user = 0;
            w.id   = 0;
            w.dest = 0;

            w.last = (i == DIM-1 && j == DIM-1) ? 1 : 0;

            OUTPUT_STREAM.write(w);
        }
}
