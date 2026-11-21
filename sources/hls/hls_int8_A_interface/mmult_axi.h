
#ifndef MMULT_AXI_H
#define MMULT_AXI_H

#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<8,4,5,5>  AXI_VAL_in;
typedef ap_axiu<32,4,5,5> AXI_VAL_out;

void HLS_accel(
    hls::stream<AXI_VAL_in>  &INPUT_STREAM,
    hls::stream<AXI_VAL_out> &OUTPUT_STREAM
);

#endif

