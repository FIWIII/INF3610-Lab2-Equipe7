set ModuleHierarchy {[{
"Name" : "HLS_accel", "RefName" : "HLS_accel","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2_fu_408", "RefName" : "HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_24_1_VITIS_LOOP_25_2","RefName" : "VITIS_LOOP_24_1_VITIS_LOOP_25_2","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4_fu_468", "RefName" : "HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_30_3_VITIS_LOOP_31_4","RefName" : "VITIS_LOOP_30_3_VITIS_LOOP_31_4","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_mmult_core_fu_528", "RefName" : "mmult_core","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L1_L2","RefName" : "L1_L2","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6_fu_617", "RefName" : "HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_37_5_VITIS_LOOP_38_6","RefName" : "VITIS_LOOP_37_5_VITIS_LOOP_38_6","ID" : "8","Type" : "pipeline"},]},]
}]}