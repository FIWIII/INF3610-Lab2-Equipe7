set ModuleHierarchy {[{
"Name" : "mmult_hw", "RefName" : "mmult_hw","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_mmult_core_fu_104", "RefName" : "mmult_core","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L1_L2","RefName" : "L1_L2","ID" : "2","Type" : "pipeline"},]},]
}]}