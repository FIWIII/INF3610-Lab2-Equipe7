
#include <cstdio>
#include <cstdint>

#include "../../hls_int8_A_algo/mmult_algo.h"
#include "../../common/int8/mmult_reference.h"

static mat_type a[DIM][DIM], b[DIM][DIM];
static acc_type out[DIM][DIM];
static int64_t reference[DIM][DIM];

int main() {
    const char *names[] = {
        "zero",
        "identity_signed_range",
        "min_times_min",
        "min_times_max",
        "max_times_max",
        "mixed_signed_random"
    };

    uint32_t rng = 0x3610250u;
    long checks = 0;

    for (int test = 0; test < 6; ++test) {

        for (int i = 0; i < DIM; ++i)
            for (int j = 0; j < DIM; ++j) {

                int av = 0, bv = 0;

                if (test == 1) {
                    av = (i == j);
                    bv = (i * 7 + j * 3) % 256 - 128;
                }

                if (test == 2) {
                    av = -128;
                    bv = -128;
                }

                if (test == 3) {
                    av = -128;
                    bv = 127;
                }

                if (test == 4) {
                    av = 127;
                    bv = 127;
                }

                if (test == 5) {
                    rng = 1664525u * rng + 1013904223u;
                    av = int((rng >> 16) & 255) - 128;

                    rng = 1664525u * rng + 1013904223u;
                    bv = int((rng >> 16) & 255) - 128;
                }

                a[i][j] = av;
                b[i][j] = bv;
            }

        mmult_hw(a, b, out);
        mmult_reference(a, b, reference);

        int errors = 0;

        for (int i = 0; i < DIM; ++i)
            for (int j = 0; j < DIM; ++j) {

                const int64_t expected = reference[i][j];
                const int64_t actual = (int64_t)out[i][j];

                if (actual != expected) {
                    if (errors < 3)
                        std::printf(
                            "Mismatch (%d,%d): expected %lld got %lld\n",
                            i, j,
                            (long long)expected,
                            (long long)actual
                        );
                    ++errors;
                }

                ++checks;
            }

        std::printf(
            "DIM=%d %s: %s (%d errors)\n",
            DIM,
            names[test],
            errors ? "FAIL" : "PASS",
            errors
        );

        if (errors)
            return 1;
    }

    std::printf(
        "PASS: %ld exact output comparisons across 6 DIM=%d cases\n",
        checks, DIM
    );

    return 0;
}
