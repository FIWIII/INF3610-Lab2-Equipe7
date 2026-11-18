set SynModuleInfo {
  {SRCNAME HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2 MODELNAME HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2 RTLNAME HLS_accel_HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2
    SUBMODULES {
      {MODELNAME HLS_accel_flow_control_loop_pipe_sequential_init RTLNAME HLS_accel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME HLS_accel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4 MODELNAME HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4 RTLNAME HLS_accel_HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4}
  {SRCNAME mmult_core MODELNAME mmult_core RTLNAME HLS_accel_mmult_core
    SUBMODULES {
      {MODELNAME HLS_accel_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME HLS_accel_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME HLS_accel_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME HLS_accel_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME HLS_accel_mac_muladd_6ns_6ns_6ns_11_4_1 RTLNAME HLS_accel_mac_muladd_6ns_6ns_6ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6 MODELNAME HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6 RTLNAME HLS_accel_HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6}
  {SRCNAME HLS_accel MODELNAME HLS_accel RTLNAME HLS_accel IS_TOP 1
    SUBMODULES {
      {MODELNAME HLS_accel_a_RAM_AUTO_1R1W RTLNAME HLS_accel_a_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME HLS_accel_c_RAM_AUTO_1R1W RTLNAME HLS_accel_c_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME HLS_accel_CONTROL_BUS_s_axi RTLNAME HLS_accel_CONTROL_BUS_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME HLS_accel_regslice_both RTLNAME HLS_accel_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
