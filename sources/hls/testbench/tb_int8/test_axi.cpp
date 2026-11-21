
#include <cstdio>
#include <cstdint>

#include "../../hls_int8_A_interface/mmult_axi.h"
#include "../../common/int8/mmult_config.h"

static mat_type A[DIM][DIM];
static mat_type B[DIM][DIM];
static acc_type C_ref[DIM][DIM];

// --------------------------------------------------
// Multiplication de référence INT8 -> INT32
// --------------------------------------------------
static void compute_reference()
{
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {

            acc_type sum = 0;

            for (int k = 0; k < DIM; ++k) {
                sum += (acc_type)A[i][k] *
                       (acc_type)B[k][j];
            }

            C_ref[i][j] = sum;
        }
    }
}

// --------------------------------------------------
// Test de l'interface AXI-Stream
// --------------------------------------------------
int main()
{
    hls::stream<AXI_VAL_in> input_stream;
    hls::stream<AXI_VAL_out> output_stream;

    // Initialisation déterministe de A et B
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {
            A[i][j] = (mat_type)((i + j) % 17 - 8);
            B[i][j] = (mat_type)((3*i + j) % 19 - 9);
        }
    }

    compute_reference();

    // --------------------------------------------------
    // 1. Transmission de A : INT8
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {

            AXI_VAL_in w;

            w.data = (ap_uint<8>)A[i][j];
            w.keep = -1;
            w.strb = -1;
            w.user = 0;
            w.id   = 0;
            w.dest = 0;
            w.last = 0;

            input_stream.write(w);
        }
    }

    // --------------------------------------------------
    // 2. Transmission de B : INT8
    // --------------------------------------------------
    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {

            AXI_VAL_in w;

            w.data = (ap_uint<8>)B[i][j];
            w.keep = -1;
            w.strb = -1;
            w.user = 0;
            w.id   = 0;
            w.dest = 0;

            w.last = (i == DIM-1 && j == DIM-1) ? 1 : 0;

            input_stream.write(w);
        }
    }

    // --------------------------------------------------
    // 3. Exécution du coprocesseur
    // --------------------------------------------------
    HLS_accel(input_stream, output_stream);

    // --------------------------------------------------
    // 4. Lecture et vérification de C : INT32
    // --------------------------------------------------
    int errors = 0;

    for (int i = 0; i < DIM; ++i) {
        for (int j = 0; j < DIM; ++j) {

            AXI_VAL_out w = output_stream.read();

            int32_t result =
                (int32_t)(uint32_t)w.data;

            int32_t expected = C_ref[i][j];

            if (result != expected) {

                if (errors < 10) {
                    printf(
                        "ERROR C[%d][%d]: HW=%ld REF=%ld\n",
                        i, j,
                        (long)result,
                        (long)expected
                    );
                }

                ++errors;
            }

            // TLAST uniquement sur le dernier élément
            bool expected_last =
                (i == DIM-1 && j == DIM-1);

            if ((bool)w.last != expected_last) {
                printf(
                    "ERROR TLAST at C[%d][%d]\n",
                    i, j
                );
                ++errors;
            }

            if (w.keep != 0xF || w.strb != 0xF) {
                printf(
                    "ERROR TKEEP/TSTRB at C[%d][%d]\n",
                    i, j
                );
                ++errors;
            }
        }
    }

    if (!output_stream.empty()) {
        printf("ERROR: unexpected extra output data\n");
        ++errors;
    }

    // --------------------------------------------------
    // 5. Résultat
    // --------------------------------------------------
    if (errors == 0) {
        printf(
            "PASS: INT8 AXI test DIM=%d, %d results verified\n",
            DIM, SIZE
        );
        return 0;
    }

    printf("FAIL: %d errors\n", errors);
    return 1;
}
