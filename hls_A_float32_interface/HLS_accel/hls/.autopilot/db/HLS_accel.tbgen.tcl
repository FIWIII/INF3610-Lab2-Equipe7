set moduleName HLS_accel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 7
set C_modelName {HLS_accel}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ INPUT_STREAM_V_data_V int 32 regular {axi_s 0 volatile  { INPUT_STREAM Data } }  }
	{ INPUT_STREAM_V_keep_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM Keep } }  }
	{ INPUT_STREAM_V_strb_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM Strb } }  }
	{ INPUT_STREAM_V_user_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM User } }  }
	{ INPUT_STREAM_V_last_V int 1 regular {axi_s 0 volatile  { INPUT_STREAM Last } }  }
	{ INPUT_STREAM_V_id_V int 5 regular {axi_s 0 volatile  { INPUT_STREAM ID } }  }
	{ INPUT_STREAM_V_dest_V int 5 regular {axi_s 0 volatile  { INPUT_STREAM Dest } }  }
	{ OUTPUT_STREAM_V_data_V int 32 regular {axi_s 1 volatile  { OUTPUT_STREAM Data } }  }
	{ OUTPUT_STREAM_V_keep_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM Keep } }  }
	{ OUTPUT_STREAM_V_strb_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM Strb } }  }
	{ OUTPUT_STREAM_V_user_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM User } }  }
	{ OUTPUT_STREAM_V_last_V int 1 regular {axi_s 1 volatile  { OUTPUT_STREAM Last } }  }
	{ OUTPUT_STREAM_V_id_V int 5 regular {axi_s 1 volatile  { OUTPUT_STREAM ID } }  }
	{ OUTPUT_STREAM_V_dest_V int 5 regular {axi_s 1 volatile  { OUTPUT_STREAM Dest } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "INPUT_STREAM_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_user_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_id_V", "interface" : "axis", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "INPUT_STREAM_V_dest_V", "interface" : "axis", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_user_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_id_V", "interface" : "axis", "bitwidth" : 5, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUTPUT_STREAM_V_dest_V", "interface" : "axis", "bitwidth" : 5, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ INPUT_STREAM_TDATA sc_in sc_lv 32 signal 0 } 
	{ INPUT_STREAM_TVALID sc_in sc_logic 1 invld 6 } 
	{ INPUT_STREAM_TREADY sc_out sc_logic 1 inacc 6 } 
	{ INPUT_STREAM_TKEEP sc_in sc_lv 4 signal 1 } 
	{ INPUT_STREAM_TSTRB sc_in sc_lv 4 signal 2 } 
	{ INPUT_STREAM_TUSER sc_in sc_lv 4 signal 3 } 
	{ INPUT_STREAM_TLAST sc_in sc_lv 1 signal 4 } 
	{ INPUT_STREAM_TID sc_in sc_lv 5 signal 5 } 
	{ INPUT_STREAM_TDEST sc_in sc_lv 5 signal 6 } 
	{ OUTPUT_STREAM_TDATA sc_out sc_lv 32 signal 7 } 
	{ OUTPUT_STREAM_TVALID sc_out sc_logic 1 outvld 13 } 
	{ OUTPUT_STREAM_TREADY sc_in sc_logic 1 outacc 13 } 
	{ OUTPUT_STREAM_TKEEP sc_out sc_lv 4 signal 8 } 
	{ OUTPUT_STREAM_TSTRB sc_out sc_lv 4 signal 9 } 
	{ OUTPUT_STREAM_TUSER sc_out sc_lv 4 signal 10 } 
	{ OUTPUT_STREAM_TLAST sc_out sc_lv 1 signal 11 } 
	{ OUTPUT_STREAM_TID sc_out sc_lv 5 signal 12 } 
	{ OUTPUT_STREAM_TDEST sc_out sc_lv 5 signal 13 } 
	{ s_axi_CONTROL_BUS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CONTROL_BUS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CONTROL_BUS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CONTROL_BUS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CONTROL_BUS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CONTROL_BUS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CONTROL_BUS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CONTROL_BUS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CONTROL_BUS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "AWADDR" },"address":[{"name":"HLS_accel","role":"start","value":"0","valid_bit":"0"},{"name":"HLS_accel","role":"continue","value":"0","valid_bit":"4"},{"name":"HLS_accel","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CONTROL_BUS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "AWVALID" } },
	{ "name": "s_axi_CONTROL_BUS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "AWREADY" } },
	{ "name": "s_axi_CONTROL_BUS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "WVALID" } },
	{ "name": "s_axi_CONTROL_BUS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "WREADY" } },
	{ "name": "s_axi_CONTROL_BUS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "WDATA" } },
	{ "name": "s_axi_CONTROL_BUS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "WSTRB" } },
	{ "name": "s_axi_CONTROL_BUS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "ARADDR" },"address":[{"name":"HLS_accel","role":"start","value":"0","valid_bit":"0"},{"name":"HLS_accel","role":"done","value":"0","valid_bit":"1"},{"name":"HLS_accel","role":"idle","value":"0","valid_bit":"2"},{"name":"HLS_accel","role":"ready","value":"0","valid_bit":"3"},{"name":"HLS_accel","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CONTROL_BUS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "ARVALID" } },
	{ "name": "s_axi_CONTROL_BUS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "ARREADY" } },
	{ "name": "s_axi_CONTROL_BUS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "RVALID" } },
	{ "name": "s_axi_CONTROL_BUS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "RREADY" } },
	{ "name": "s_axi_CONTROL_BUS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "RDATA" } },
	{ "name": "s_axi_CONTROL_BUS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "RRESP" } },
	{ "name": "s_axi_CONTROL_BUS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "BVALID" } },
	{ "name": "s_axi_CONTROL_BUS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "BREADY" } },
	{ "name": "s_axi_CONTROL_BUS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CONTROL_BUS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_data_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "INPUT_STREAM_V_dest_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "INPUT_STREAM_V_dest_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_keep_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_strb_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_user_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_last_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_id_V", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "INPUT_STREAM_V_dest_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_data_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUTPUT_STREAM_V_dest_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUTPUT_STREAM_V_dest_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_keep_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_strb_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_user_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_last_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_id_V", "role": "default" }} , 
 	{ "name": "OUTPUT_STREAM_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "OUTPUT_STREAM_V_dest_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	HLS_accel {
		INPUT_STREAM_V_data_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_keep_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_strb_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_user_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_last_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_id_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_dest_V {Type I LastRead 2 FirstWrite -1}
		OUTPUT_STREAM_V_data_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_keep_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_strb_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_user_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_last_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_id_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_dest_V {Type O LastRead -1 FirstWrite 5}}
	HLS_accel_Pipeline_VITIS_LOOP_24_1_VITIS_LOOP_25_2 {
		a {Type O LastRead -1 FirstWrite 2}
		a_1 {Type O LastRead -1 FirstWrite 2}
		a_2 {Type O LastRead -1 FirstWrite 2}
		a_3 {Type O LastRead -1 FirstWrite 2}
		a_4 {Type O LastRead -1 FirstWrite 2}
		a_5 {Type O LastRead -1 FirstWrite 2}
		a_6 {Type O LastRead -1 FirstWrite 2}
		a_7 {Type O LastRead -1 FirstWrite 2}
		a_8 {Type O LastRead -1 FirstWrite 2}
		a_9 {Type O LastRead -1 FirstWrite 2}
		a_10 {Type O LastRead -1 FirstWrite 2}
		a_11 {Type O LastRead -1 FirstWrite 2}
		a_12 {Type O LastRead -1 FirstWrite 2}
		a_13 {Type O LastRead -1 FirstWrite 2}
		a_14 {Type O LastRead -1 FirstWrite 2}
		a_15 {Type O LastRead -1 FirstWrite 2}
		a_16 {Type O LastRead -1 FirstWrite 2}
		a_17 {Type O LastRead -1 FirstWrite 2}
		a_18 {Type O LastRead -1 FirstWrite 2}
		a_19 {Type O LastRead -1 FirstWrite 2}
		a_20 {Type O LastRead -1 FirstWrite 2}
		a_21 {Type O LastRead -1 FirstWrite 2}
		a_22 {Type O LastRead -1 FirstWrite 2}
		a_23 {Type O LastRead -1 FirstWrite 2}
		a_24 {Type O LastRead -1 FirstWrite 2}
		a_25 {Type O LastRead -1 FirstWrite 2}
		a_26 {Type O LastRead -1 FirstWrite 2}
		a_27 {Type O LastRead -1 FirstWrite 2}
		a_28 {Type O LastRead -1 FirstWrite 2}
		a_29 {Type O LastRead -1 FirstWrite 2}
		a_30 {Type O LastRead -1 FirstWrite 2}
		a_31 {Type O LastRead -1 FirstWrite 2}
		a_32 {Type O LastRead -1 FirstWrite 2}
		a_33 {Type O LastRead -1 FirstWrite 2}
		a_34 {Type O LastRead -1 FirstWrite 2}
		a_35 {Type O LastRead -1 FirstWrite 2}
		a_36 {Type O LastRead -1 FirstWrite 2}
		a_37 {Type O LastRead -1 FirstWrite 2}
		a_38 {Type O LastRead -1 FirstWrite 2}
		a_39 {Type O LastRead -1 FirstWrite 2}
		a_40 {Type O LastRead -1 FirstWrite 2}
		a_41 {Type O LastRead -1 FirstWrite 2}
		INPUT_STREAM_V_data_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_keep_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_strb_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_user_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_last_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_id_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_dest_V {Type I LastRead 2 FirstWrite -1}}
	HLS_accel_Pipeline_VITIS_LOOP_30_3_VITIS_LOOP_31_4 {
		b_41 {Type O LastRead -1 FirstWrite 2}
		b_40 {Type O LastRead -1 FirstWrite 2}
		b_39 {Type O LastRead -1 FirstWrite 2}
		b_38 {Type O LastRead -1 FirstWrite 2}
		b_37 {Type O LastRead -1 FirstWrite 2}
		b_36 {Type O LastRead -1 FirstWrite 2}
		b_35 {Type O LastRead -1 FirstWrite 2}
		b_34 {Type O LastRead -1 FirstWrite 2}
		b_33 {Type O LastRead -1 FirstWrite 2}
		b_32 {Type O LastRead -1 FirstWrite 2}
		b_31 {Type O LastRead -1 FirstWrite 2}
		b_30 {Type O LastRead -1 FirstWrite 2}
		b_29 {Type O LastRead -1 FirstWrite 2}
		b_28 {Type O LastRead -1 FirstWrite 2}
		b_27 {Type O LastRead -1 FirstWrite 2}
		b_26 {Type O LastRead -1 FirstWrite 2}
		b_25 {Type O LastRead -1 FirstWrite 2}
		b_24 {Type O LastRead -1 FirstWrite 2}
		b_23 {Type O LastRead -1 FirstWrite 2}
		b_22 {Type O LastRead -1 FirstWrite 2}
		b_21 {Type O LastRead -1 FirstWrite 2}
		b_20 {Type O LastRead -1 FirstWrite 2}
		b_19 {Type O LastRead -1 FirstWrite 2}
		b_18 {Type O LastRead -1 FirstWrite 2}
		b_17 {Type O LastRead -1 FirstWrite 2}
		b_16 {Type O LastRead -1 FirstWrite 2}
		b_15 {Type O LastRead -1 FirstWrite 2}
		b_14 {Type O LastRead -1 FirstWrite 2}
		b_13 {Type O LastRead -1 FirstWrite 2}
		b_12 {Type O LastRead -1 FirstWrite 2}
		b_11 {Type O LastRead -1 FirstWrite 2}
		b_10 {Type O LastRead -1 FirstWrite 2}
		b_9 {Type O LastRead -1 FirstWrite 2}
		b_8 {Type O LastRead -1 FirstWrite 2}
		b_7 {Type O LastRead -1 FirstWrite 2}
		b_6 {Type O LastRead -1 FirstWrite 2}
		b_5 {Type O LastRead -1 FirstWrite 2}
		b_4 {Type O LastRead -1 FirstWrite 2}
		b_3 {Type O LastRead -1 FirstWrite 2}
		b_2 {Type O LastRead -1 FirstWrite 2}
		b_1 {Type O LastRead -1 FirstWrite 2}
		b {Type O LastRead -1 FirstWrite 2}
		INPUT_STREAM_V_data_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_keep_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_strb_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_user_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_last_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_id_V {Type I LastRead 2 FirstWrite -1}
		INPUT_STREAM_V_dest_V {Type I LastRead 2 FirstWrite -1}}
	mmult_core {
		a_0 {Type I LastRead 1 FirstWrite -1}
		a_1 {Type I LastRead 6 FirstWrite -1}
		a_2 {Type I LastRead 11 FirstWrite -1}
		a_3 {Type I LastRead 16 FirstWrite -1}
		a_4 {Type I LastRead 21 FirstWrite -1}
		a_5 {Type I LastRead 26 FirstWrite -1}
		a_6 {Type I LastRead 31 FirstWrite -1}
		a_7 {Type I LastRead 36 FirstWrite -1}
		a_8 {Type I LastRead 41 FirstWrite -1}
		a_9 {Type I LastRead 46 FirstWrite -1}
		a_10 {Type I LastRead 51 FirstWrite -1}
		a_11 {Type I LastRead 56 FirstWrite -1}
		a_12 {Type I LastRead 61 FirstWrite -1}
		a_13 {Type I LastRead 66 FirstWrite -1}
		a_14 {Type I LastRead 71 FirstWrite -1}
		a_15 {Type I LastRead 76 FirstWrite -1}
		a_16 {Type I LastRead 81 FirstWrite -1}
		a_17 {Type I LastRead 86 FirstWrite -1}
		a_18 {Type I LastRead 91 FirstWrite -1}
		a_19 {Type I LastRead 96 FirstWrite -1}
		a_20 {Type I LastRead 101 FirstWrite -1}
		a_21 {Type I LastRead 106 FirstWrite -1}
		a_22 {Type I LastRead 111 FirstWrite -1}
		a_23 {Type I LastRead 116 FirstWrite -1}
		a_24 {Type I LastRead 121 FirstWrite -1}
		a_25 {Type I LastRead 126 FirstWrite -1}
		a_26 {Type I LastRead 131 FirstWrite -1}
		a_27 {Type I LastRead 136 FirstWrite -1}
		a_28 {Type I LastRead 141 FirstWrite -1}
		a_29 {Type I LastRead 146 FirstWrite -1}
		a_30 {Type I LastRead 151 FirstWrite -1}
		a_31 {Type I LastRead 156 FirstWrite -1}
		a_32 {Type I LastRead 161 FirstWrite -1}
		a_33 {Type I LastRead 166 FirstWrite -1}
		a_34 {Type I LastRead 171 FirstWrite -1}
		a_35 {Type I LastRead 176 FirstWrite -1}
		a_36 {Type I LastRead 181 FirstWrite -1}
		a_37 {Type I LastRead 186 FirstWrite -1}
		a_38 {Type I LastRead 191 FirstWrite -1}
		a_39 {Type I LastRead 196 FirstWrite -1}
		a_40 {Type I LastRead 201 FirstWrite -1}
		a_41 {Type I LastRead 206 FirstWrite -1}
		b_0 {Type I LastRead 1 FirstWrite -1}
		b_1 {Type I LastRead 6 FirstWrite -1}
		b_2 {Type I LastRead 11 FirstWrite -1}
		b_3 {Type I LastRead 16 FirstWrite -1}
		b_4 {Type I LastRead 21 FirstWrite -1}
		b_5 {Type I LastRead 26 FirstWrite -1}
		b_6 {Type I LastRead 31 FirstWrite -1}
		b_7 {Type I LastRead 36 FirstWrite -1}
		b_8 {Type I LastRead 41 FirstWrite -1}
		b_9 {Type I LastRead 46 FirstWrite -1}
		b_10 {Type I LastRead 51 FirstWrite -1}
		b_11 {Type I LastRead 56 FirstWrite -1}
		b_12 {Type I LastRead 61 FirstWrite -1}
		b_13 {Type I LastRead 66 FirstWrite -1}
		b_14 {Type I LastRead 71 FirstWrite -1}
		b_15 {Type I LastRead 76 FirstWrite -1}
		b_16 {Type I LastRead 81 FirstWrite -1}
		b_17 {Type I LastRead 86 FirstWrite -1}
		b_18 {Type I LastRead 91 FirstWrite -1}
		b_19 {Type I LastRead 96 FirstWrite -1}
		b_20 {Type I LastRead 101 FirstWrite -1}
		b_21 {Type I LastRead 106 FirstWrite -1}
		b_22 {Type I LastRead 111 FirstWrite -1}
		b_23 {Type I LastRead 116 FirstWrite -1}
		b_24 {Type I LastRead 121 FirstWrite -1}
		b_25 {Type I LastRead 126 FirstWrite -1}
		b_26 {Type I LastRead 131 FirstWrite -1}
		b_27 {Type I LastRead 136 FirstWrite -1}
		b_28 {Type I LastRead 141 FirstWrite -1}
		b_29 {Type I LastRead 146 FirstWrite -1}
		b_30 {Type I LastRead 151 FirstWrite -1}
		b_31 {Type I LastRead 156 FirstWrite -1}
		b_32 {Type I LastRead 161 FirstWrite -1}
		b_33 {Type I LastRead 166 FirstWrite -1}
		b_34 {Type I LastRead 171 FirstWrite -1}
		b_35 {Type I LastRead 176 FirstWrite -1}
		b_36 {Type I LastRead 181 FirstWrite -1}
		b_37 {Type I LastRead 186 FirstWrite -1}
		b_38 {Type I LastRead 191 FirstWrite -1}
		b_39 {Type I LastRead 196 FirstWrite -1}
		b_40 {Type I LastRead 201 FirstWrite -1}
		b_41 {Type I LastRead 206 FirstWrite -1}
		c {Type O LastRead -1 FirstWrite 217}}
	HLS_accel_Pipeline_VITIS_LOOP_37_5_VITIS_LOOP_38_6 {
		c {Type I LastRead 4 FirstWrite -1}
		OUTPUT_STREAM_V_data_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_keep_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_strb_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_user_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_last_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_id_V {Type O LastRead -1 FirstWrite 5}
		OUTPUT_STREAM_V_dest_V {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7295", "Max" : "7295"}
	, {"Name" : "Interval", "Min" : "7296", "Max" : "7296"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	INPUT_STREAM_V_data_V { axis {  { INPUT_STREAM_TDATA in_data 0 32 } } }
	INPUT_STREAM_V_keep_V { axis {  { INPUT_STREAM_TKEEP in_data 0 4 } } }
	INPUT_STREAM_V_strb_V { axis {  { INPUT_STREAM_TSTRB in_data 0 4 } } }
	INPUT_STREAM_V_user_V { axis {  { INPUT_STREAM_TUSER in_data 0 4 } } }
	INPUT_STREAM_V_last_V { axis {  { INPUT_STREAM_TLAST in_data 0 1 } } }
	INPUT_STREAM_V_id_V { axis {  { INPUT_STREAM_TID in_data 0 5 } } }
	INPUT_STREAM_V_dest_V { axis {  { INPUT_STREAM_TVALID in_vld 0 1 }  { INPUT_STREAM_TREADY in_acc 1 1 }  { INPUT_STREAM_TDEST in_data 0 5 } } }
	OUTPUT_STREAM_V_data_V { axis {  { OUTPUT_STREAM_TDATA out_data 1 32 } } }
	OUTPUT_STREAM_V_keep_V { axis {  { OUTPUT_STREAM_TKEEP out_data 1 4 } } }
	OUTPUT_STREAM_V_strb_V { axis {  { OUTPUT_STREAM_TSTRB out_data 1 4 } } }
	OUTPUT_STREAM_V_user_V { axis {  { OUTPUT_STREAM_TUSER out_data 1 4 } } }
	OUTPUT_STREAM_V_last_V { axis {  { OUTPUT_STREAM_TLAST out_data 1 1 } } }
	OUTPUT_STREAM_V_id_V { axis {  { OUTPUT_STREAM_TID out_data 1 5 } } }
	OUTPUT_STREAM_V_dest_V { axis {  { OUTPUT_STREAM_TVALID out_vld 1 1 }  { OUTPUT_STREAM_TREADY out_acc 0 1 }  { OUTPUT_STREAM_TDEST out_data 1 5 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
