create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "C:/INF3610_Lab2/hls_A_float32_interface/HLS_accel/hls/syn/verilog/HLS_accel_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "C:/INF3610_Lab2/hls_A_float32_interface/HLS_accel/hls/syn/verilog/HLS_accel_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
