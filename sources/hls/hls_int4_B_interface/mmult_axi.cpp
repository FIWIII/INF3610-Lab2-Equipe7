
#include "mmult_axi.h"
#include "../common/int4/mmult_core.h"
#include <stdint.h>

void HLS_accel(
    hls::stream<AXI_VAL> &INPUT_STREAM,
    hls::stream<AXI_VAL> &OUTPUT_STREAM)
{
#pragma HLS INTERFACE axis port=INPUT_STREAM
#pragma HLS INTERFACE axis port=OUTPUT_STREAM
#pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS

    mat_type a[DIM][DIM];
    mat_type b[DIM][DIM];
    acc_type c[DIM][DIM];

    // --------------------------------------------------
    // 1. Chargement complet de A
    //    8 valeurs INT4 signees par mot AXI de 32 bits
    // --------------------------------------------------
    for (int word_index = 0;
         word_index < INT4_MATRIX_WORDS;
         ++word_index) {
#pragma HLS PIPELINE II=1

        AXI_VAL w = INPUT_STREAM.read();

        for (int lane = 0; lane < 8; ++lane) {
#pragma HLS UNROLL
            const int index = word_index * 8 + lane;

            if (index < INT4_MATRIX_ELEMENTS) {
                ap_uint<4> bits =
                    w.data.range(4 * lane + 3, 4 * lane);

                ap_int<4> value = bits;

                a[index / DIM][index % DIM] = value;
            }
        }
    }

    // --------------------------------------------------
    // 2. Chargement complet de B
    //    8 valeurs INT4 signees par mot AXI de 32 bits
    // --------------------------------------------------
    for (int word_index = 0;
         word_index < INT4_MATRIX_WORDS;
         ++word_index) {
#pragma HLS PIPELINE II=1

        AXI_VAL w = INPUT_STREAM.read();

        for (int lane = 0; lane < 8; ++lane) {
#pragma HLS UNROLL
            const int index = word_index * 8 + lane;

            if (index < INT4_MATRIX_ELEMENTS) {
                ap_uint<4> bits =
                    w.data.range(4 * lane + 3, 4 * lane);

                ap_int<4> value = bits;

                b[index / DIM][index % DIM] = value;
            }
        }
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

            AXI_VAL w;

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

