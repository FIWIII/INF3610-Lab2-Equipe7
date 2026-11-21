#ifndef MMULT_CONFIG_H
#define MMULT_CONFIG_H
#include <stdint.h>
// Same configuration for both HLS components. Start with 4, then try 42.
#ifndef MMULT_DIM
#define MMULT_DIM 180
#endif
static const int DIM = MMULT_DIM;
static const int SIZE = DIM * DIM;
typedef int8_t mat_type;
typedef int16_t mat_type_prod;
typedef int32_t acc_type;
#endif
