#ifndef INF3610_INT4_MMULT_CONFIG_H
#define INF3610_INT4_MMULT_CONFIG_H

#include <stdint.h>
#include <ap_int.h>

#ifndef MMULT_DIM
#define MMULT_DIM 180
#endif

static const int DIM = MMULT_DIM;
static const int SIZE = DIM * DIM;

typedef ap_int<4> mat_type;       // Signed INT4 operands
typedef int16_t   mat_type_prod;  // Signed 16-bit intermediate product
typedef int32_t   acc_type;       // Signed 32-bit accumulation

// 0 = automatic HLS binding (no BIND_OP pragma)
// 1 = force multiplication into LUT fabric
// 2 = request multiplication in DSP
#ifndef MMULT_MUL_IMPL
#define MMULT_MUL_IMPL 1
#endif

#if (MMULT_MUL_IMPL < 0) || (MMULT_MUL_IMPL > 2)
#error "MMULT_MUL_IMPL must be 0 (auto), 1 (fabric) or 2 (dsp)"
#endif

#endif
