
#ifndef INT4_B_MMULT_AXI_H
#define INT4_B_MMULT_AXI_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>

#include "../common/int4/mmult_config.h"

// 8 valeurs INT4 compactées dans un mot de 32 bits
typedef ap_axiu<32,4,5,5> AXI_VAL;

// Nombre d'éléments par matrice
static const int INT4_MATRIX_ELEMENTS = DIM * DIM;

// Nombre de mots AXI de 32 bits par matrice
static const int INT4_MATRIX_WORDS =
    (INT4_MATRIX_ELEMENTS + 7) / 8;

// Interface AXI-Stream du coprocesseur
void HLS_accel(
    hls::stream<AXI_VAL> &INPUT_STREAM,
    hls::stream<AXI_VAL> &OUTPUT_STREAM
);

#endif


