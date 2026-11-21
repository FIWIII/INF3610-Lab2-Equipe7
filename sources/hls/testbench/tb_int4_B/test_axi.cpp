#include <cstdio>
#include <cstdint>
#include "../../hls_int4_B_interface/mmult_axi.h"
#include "../../common/int4/mmult_reference.h"

static mat_type a[DIM][DIM], b[DIM][DIM];
static int64_t reference[DIM][DIM];

static uint32_t pack_lanes(const int values[8]) {
    uint32_t bits = 0;
    for (int lane = 0; lane < 8; ++lane)
        bits |= (uint32_t(values[lane]) & 15U) << (4 * lane);
    return bits;
}

static void send_matrix(hls::stream<AXI_VAL> &input,
                        const mat_type matrix[DIM][DIM], int padding) {
    for (int word_index = 0; word_index < INT4_MATRIX_WORDS; ++word_index) {
        int values[8];
        for (int lane = 0; lane < 8; ++lane) {
            const int index = word_index * 8 + lane;
            values[lane] = index < INT4_MATRIX_ELEMENTS
                ? matrix[index / DIM][index % DIM].to_int() : padding;
        }
        AXI_VAL word;
        word.data = pack_lanes(values);
        word.keep = 15;
        word.strb = 15;
        word.user = 0;
        word.id = 0;
        word.dest = 0;
        word.last = (word_index == INT4_MATRIX_WORDS - 1);
        input.write(word);
    }
}

int main() {
    static_assert(DIM == 180, "This interface test targets DIM=180");
    static_assert(INT4_MATRIX_WORDS == 4050, "Unexpected matrix packet length");
    const int positive[8] = {0,1,2,3,4,5,6,7};
    const int negative[8] = {-8,-7,-6,-5,-4,-3,-2,-1};
    if (pack_lanes(positive) != 0x76543210U ||
        pack_lanes(negative) != 0xFEDCBA98U) {
        std::printf("FAIL: input nibble ordering\n");
        return 1;
    }
    const char *names[] = {"zero", "identity_signed_range", "min_times_min",
                           "min_times_max", "max_times_max", "mixed_signed_random"};
    uint32_t rng = 0x3610250U;
    long checks = 0;
    // Reuse the streams across transactions to detect stale data and framing errors.
    hls::stream<AXI_VAL> input("input"), output("output");
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
        // Nonzero, distinct padding verifies it is discarded at each matrix boundary.
        send_matrix(input, a, -1);
        send_matrix(input, b, -8);
        if (input.size() != 2 * INT4_MATRIX_WORDS) return 1;
        HLS_accel(input, output);
        int errors = !input.empty();
        if (output.size() != INT4_MATRIX_ELEMENTS) ++errors;
        for (int index = 0; index < INT4_MATRIX_ELEMENTS; ++index) {
            if (output.empty()) {
                std::printf("FAIL: missing output at %d\n", index);
                return 1;
            }
            const AXI_VAL word = output.read();
            const uint32_t bits = word.data.to_uint();
            const int64_t signed_value = (bits & 0x80000000U)
                ? int64_t(bits) - 0x100000000LL : int64_t(bits);
            const int64_t expected = reference[index / DIM][index % DIM];
            if (signed_value != expected || bits != uint32_t(expected)) ++errors;
            if (bool(word.last) != (index == INT4_MATRIX_ELEMENTS - 1)) ++errors;
            if (word.keep != 15 || word.strb != 15 || word.user != 0 ||
                word.id != 0 || word.dest != 0) ++errors;
            ++checks;
        }
        if (!output.empty()) ++errors;
        std::printf("AXIS DIM=%d %s: %s (%d errors)\n",
                    DIM, names[test], errors ? "FAIL" : "PASS", errors);
        if (errors) return 1;
    }
    std::printf("PASS: %ld exact outputs; six independently padded A/B packet pairs\n", checks);
    return 0;
}
