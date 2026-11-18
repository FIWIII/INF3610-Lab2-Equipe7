set SynModuleInfo {
  {SRCNAME mmult_core MODELNAME mmult_core RTLNAME mmult_hw_mmult_core
    SUBMODULES {
      {MODELNAME mmult_hw_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME mmult_hw_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME mmult_hw_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME mmult_hw_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME mmult_hw_mac_muladd_6ns_6ns_6ns_11_4_1 RTLNAME mmult_hw_mac_muladd_6ns_6ns_6ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME mmult_hw_flow_control_loop_pipe_sequential_init RTLNAME mmult_hw_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mmult_hw_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mmult_hw MODELNAME mmult_hw RTLNAME mmult_hw IS_TOP 1}
}
