#include <cstdio>
#include <cstdint>
#include "../../hls_int4_A_interface/mmult_axi.h"
#include "../../common/int4/mmult_reference.h"

static mat_type a[DIM][DIM], b[DIM][DIM];
static int64_t reference[DIM][DIM];

static AXI_VAL_in make_word(int value, bool last) {
    AXI_VAL_in word;
    // Host representation: the complete signed byte, e.g. -8 -> 0xF8.
    word.data = static_cast<uint8_t>(static_cast<int8_t>(value));
    word.keep = 1;
    word.strb = 1;
    word.user = 0;
    word.id = 0;
    word.dest = 0;
    word.last = last;
    return word;
}

static int send_matrix(hls::stream<AXI_VAL_in> &input,
                       const mat_type matrix[DIM][DIM]) {
    int errors = 0;
    for (int i = 0; i < DIM; ++i)
        for (int j = 0; j < DIM; ++j) {
            const int value = matrix[i][j].to_int();
            const AXI_VAL_in word = make_word(value, i == DIM - 1 && j == DIM - 1);
            const uint32_t expected_byte = value < 0 ? uint32_t(256 + value) : uint32_t(value);
            if (word.data.to_uint() != expected_byte) ++errors;
            input.write(word);
        }
    return errors;
}

int main() {
    static_assert(DIM == 180, "Baseline comparison requires DIM=180");
    static_assert(SIZE == 32400, "Expected 32400 bytes per input matrix");
    // Verify every legal value is sign-extended on the wire and remains signed
    // when narrowed to the hardware type. Identity GEMM below checks the real loader.
    for (int value = -8; value <= 7; ++value) {
        const AXI_VAL_in word = make_word(value, false);
        ap_int<8> signed_byte = word.data;
        mat_type element = signed_byte;
        if (signed_byte.to_int() != value || element.to_int() != value) {
            std::printf("FAIL: signed byte conversion for %d\n", value);
            return 1;
        }
    }

    const char *names[] = {"zero", "identity_signed_range", "min_times_min",
                           "min_times_max", "max_times_max", "mixed_signed_random"};
    uint32_t rng = 0x3610180U;
    long checks = 0;
    hls::stream<AXI_VAL_in> input("input");
    hls::stream<AXI_VAL_out> output("output");
    for (int test = 0; test < 6; ++test) {
        for (int i = 0; i < DIM; ++i)
            for (int j = 0; j < DIM; ++j) {
                int av = 0, bv = 0;
                if (test == 1) { av = (i == j); bv = (i * DIM + j) % 16 - 8; }
                if (test == 2) { av = -8; bv = -8; }
                if (test == 3) { av = -8; bv = 7; }
                if (test == 4) { av = 7; bv = 7; }
                if (test == 5) {
                    rng = 1664525U * rng + 1013904223U;
                    av = int((rng >> 16) & 15) - 8;
                    rng = 1664525U * rng + 1013904223U;
                    bv = int((rng >> 16) & 15) - 8;
                }
                a[i][j] = av;
                b[i][j] = bv;
            }
        mmult_reference(a, b, reference);
        int errors = send_matrix(input, a) + send_matrix(input, b);
        if (input.size() != 2 * SIZE) ++errors;
        HLS_accel(input, output);
        if (!input.empty() || output.size() != SIZE) ++errors;
        for (int i = 0; i < DIM; ++i)
            for (int j = 0; j < DIM; ++j) {
                if (output.empty()) { std::printf("FAIL: missing C\n"); return 1; }
                const AXI_VAL_out word = output.read();
                const uint32_t bits = word.data.to_uint();
                const int64_t actual = (bits & 0x80000000U)
                    ? int64_t(bits) - 0x100000000LL : int64_t(bits);
                if (actual != reference[i][j]) ++errors;
                if (bool(word.last) != (i == DIM - 1 && j == DIM - 1)) ++errors;
                if (word.keep != 15 || word.strb != 15 || word.user != 0 ||
                    word.id != 0 || word.dest != 0) ++errors;
                ++checks;
            }
        if (!output.empty()) ++errors;
        std::printf("INT4-B AXIS DIM=%d %s: %s (%d errors)\n",
                    DIM, names[test], errors ? "FAIL" : "PASS", errors);
        if (errors) return 1;
    }
    std::printf("PASS: %ld exact INT32 comparisons; one signed INT4 per byte, no packing\n", checks);
    return 0;
}
