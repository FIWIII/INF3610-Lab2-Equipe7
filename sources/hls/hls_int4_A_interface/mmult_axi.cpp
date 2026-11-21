
#include "mmult_axi.h"
#include "../common/int4/mmult_core.h"
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
    // 1. Chargement complet de A (INT4 signe sur un octet)
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
#pragma HLS PIPELINE II=1
            AXI_VAL_in w = INPUT_STREAM.read();

            // Decode the entire signed byte before narrowing to ap_int<4>.
            // Contract: one sign-extended value in [-8,7] per byte; no packing.
            ap_int<8> signed_byte = w.data;
            a[i][j] = mat_type(signed_byte);
        }

    // --------------------------------------------------
    // 2. Chargement complet de B (INT4 signe sur un octet)
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
#pragma HLS PIPELINE II=1
            AXI_VAL_in w = INPUT_STREAM.read();

            ap_int<8> signed_byte = w.data;
            b[i][j] = mat_type(signed_byte);
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
