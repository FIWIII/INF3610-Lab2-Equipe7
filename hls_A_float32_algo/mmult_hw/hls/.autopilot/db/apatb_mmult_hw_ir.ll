; ModuleID = 'C:/INF3610_Lab2/hls_A_float32_algo/mmult_hw/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_mmult_hw_ir([42 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="42" %a, [42 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="42" %b, [42 x float]* noalias nocapture nonnull "fpga.decayed.dim.hint"="42" %c) local_unnamed_addr #1 {
entry:
  %0 = bitcast [42 x float]* %a to [42 x [42 x float]]*
  %_0 = call i8* @malloc(i64 336)
  %_1 = call i8* @malloc(i64 336)
  %_2 = call i8* @malloc(i64 336)
  %_3 = call i8* @malloc(i64 336)
  %_4 = call i8* @malloc(i64 336)
  %_5 = call i8* @malloc(i64 336)
  %_6 = call i8* @malloc(i64 336)
  %_7 = call i8* @malloc(i64 336)
  %_8 = call i8* @malloc(i64 336)
  %_9 = call i8* @malloc(i64 336)
  %_10 = call i8* @malloc(i64 336)
  %_11 = call i8* @malloc(i64 336)
  %_12 = call i8* @malloc(i64 336)
  %_13 = call i8* @malloc(i64 336)
  %_14 = call i8* @malloc(i64 336)
  %_15 = call i8* @malloc(i64 336)
  %_16 = call i8* @malloc(i64 336)
  %_17 = call i8* @malloc(i64 336)
  %_18 = call i8* @malloc(i64 336)
  %_19 = call i8* @malloc(i64 336)
  %_20 = call i8* @malloc(i64 336)
  %a_copy_0 = bitcast i8* %_0 to [42 x [2 x float]]*
  %a_copy_1 = bitcast i8* %_1 to [42 x [2 x float]]*
  %a_copy_2 = bitcast i8* %_2 to [42 x [2 x float]]*
  %a_copy_3 = bitcast i8* %_3 to [42 x [2 x float]]*
  %a_copy_4 = bitcast i8* %_4 to [42 x [2 x float]]*
  %a_copy_5 = bitcast i8* %_5 to [42 x [2 x float]]*
  %a_copy_6 = bitcast i8* %_6 to [42 x [2 x float]]*
  %a_copy_7 = bitcast i8* %_7 to [42 x [2 x float]]*
  %a_copy_8 = bitcast i8* %_8 to [42 x [2 x float]]*
  %a_copy_9 = bitcast i8* %_9 to [42 x [2 x float]]*
  %a_copy_10 = bitcast i8* %_10 to [42 x [2 x float]]*
  %a_copy_11 = bitcast i8* %_11 to [42 x [2 x float]]*
  %a_copy_12 = bitcast i8* %_12 to [42 x [2 x float]]*
  %a_copy_13 = bitcast i8* %_13 to [42 x [2 x float]]*
  %a_copy_14 = bitcast i8* %_14 to [42 x [2 x float]]*
  %a_copy_15 = bitcast i8* %_15 to [42 x [2 x float]]*
  %a_copy_16 = bitcast i8* %_16 to [42 x [2 x float]]*
  %a_copy_17 = bitcast i8* %_17 to [42 x [2 x float]]*
  %a_copy_18 = bitcast i8* %_18 to [42 x [2 x float]]*
  %a_copy_19 = bitcast i8* %_19 to [42 x [2 x float]]*
  %a_copy_20 = bitcast i8* %_20 to [42 x [2 x float]]*
  %_01 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_0, i64 0, i64 0
  %_110 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_1, i64 0, i64 0
  %_211 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_2, i64 0, i64 0
  %_312 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_3, i64 0, i64 0
  %_413 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_4, i64 0, i64 0
  %_514 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_5, i64 0, i64 0
  %_615 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_6, i64 0, i64 0
  %_716 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_7, i64 0, i64 0
  %_817 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_8, i64 0, i64 0
  %_918 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_9, i64 0, i64 0
  %_1019 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_10, i64 0, i64 0
  %_1120 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_11, i64 0, i64 0
  %_1221 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_12, i64 0, i64 0
  %_1322 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_13, i64 0, i64 0
  %_1423 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_14, i64 0, i64 0
  %_1524 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_15, i64 0, i64 0
  %_1625 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_16, i64 0, i64 0
  %_1726 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_17, i64 0, i64 0
  %_1827 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_18, i64 0, i64 0
  %_1928 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_19, i64 0, i64 0
  %_2029 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %a_copy_20, i64 0, i64 0
  %1 = bitcast [42 x float]* %b to [42 x [42 x float]]*
  %_030 = call i8* @malloc(i64 336)
  %_131 = call i8* @malloc(i64 336)
  %_232 = call i8* @malloc(i64 336)
  %_333 = call i8* @malloc(i64 336)
  %_434 = call i8* @malloc(i64 336)
  %_535 = call i8* @malloc(i64 336)
  %_636 = call i8* @malloc(i64 336)
  %_737 = call i8* @malloc(i64 336)
  %_838 = call i8* @malloc(i64 336)
  %_939 = call i8* @malloc(i64 336)
  %_1040 = call i8* @malloc(i64 336)
  %_1141 = call i8* @malloc(i64 336)
  %_1242 = call i8* @malloc(i64 336)
  %_1343 = call i8* @malloc(i64 336)
  %_1444 = call i8* @malloc(i64 336)
  %_1545 = call i8* @malloc(i64 336)
  %_1646 = call i8* @malloc(i64 336)
  %_1747 = call i8* @malloc(i64 336)
  %_1848 = call i8* @malloc(i64 336)
  %_1949 = call i8* @malloc(i64 336)
  %_2050 = call i8* @malloc(i64 336)
  %b_copy_0 = bitcast i8* %_030 to [2 x [42 x float]]*
  %b_copy_1 = bitcast i8* %_131 to [2 x [42 x float]]*
  %b_copy_2 = bitcast i8* %_232 to [2 x [42 x float]]*
  %b_copy_3 = bitcast i8* %_333 to [2 x [42 x float]]*
  %b_copy_4 = bitcast i8* %_434 to [2 x [42 x float]]*
  %b_copy_5 = bitcast i8* %_535 to [2 x [42 x float]]*
  %b_copy_6 = bitcast i8* %_636 to [2 x [42 x float]]*
  %b_copy_7 = bitcast i8* %_737 to [2 x [42 x float]]*
  %b_copy_8 = bitcast i8* %_838 to [2 x [42 x float]]*
  %b_copy_9 = bitcast i8* %_939 to [2 x [42 x float]]*
  %b_copy_10 = bitcast i8* %_1040 to [2 x [42 x float]]*
  %b_copy_11 = bitcast i8* %_1141 to [2 x [42 x float]]*
  %b_copy_12 = bitcast i8* %_1242 to [2 x [42 x float]]*
  %b_copy_13 = bitcast i8* %_1343 to [2 x [42 x float]]*
  %b_copy_14 = bitcast i8* %_1444 to [2 x [42 x float]]*
  %b_copy_15 = bitcast i8* %_1545 to [2 x [42 x float]]*
  %b_copy_16 = bitcast i8* %_1646 to [2 x [42 x float]]*
  %b_copy_17 = bitcast i8* %_1747 to [2 x [42 x float]]*
  %b_copy_18 = bitcast i8* %_1848 to [2 x [42 x float]]*
  %b_copy_19 = bitcast i8* %_1949 to [2 x [42 x float]]*
  %b_copy_20 = bitcast i8* %_2050 to [2 x [42 x float]]*
  %_051 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_0, i64 0, i64 0
  %_152 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_1, i64 0, i64 0
  %_253 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_2, i64 0, i64 0
  %_354 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_3, i64 0, i64 0
  %_455 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_4, i64 0, i64 0
  %_556 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_5, i64 0, i64 0
  %_657 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_6, i64 0, i64 0
  %_758 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_7, i64 0, i64 0
  %_859 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_8, i64 0, i64 0
  %_960 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_9, i64 0, i64 0
  %_1061 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_10, i64 0, i64 0
  %_1162 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_11, i64 0, i64 0
  %_1263 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_12, i64 0, i64 0
  %_1364 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_13, i64 0, i64 0
  %_1465 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_14, i64 0, i64 0
  %_1566 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_15, i64 0, i64 0
  %_1667 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_16, i64 0, i64 0
  %_1768 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_17, i64 0, i64 0
  %_1869 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_18, i64 0, i64 0
  %_1970 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_19, i64 0, i64 0
  %_2071 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %b_copy_20, i64 0, i64 0
  %2 = bitcast [42 x float]* %c to [42 x [42 x float]]*
  %3 = call i8* @malloc(i64 7056)
  %c_copy = bitcast i8* %3 to [42 x [42 x float]]*
  call void @copy_in([42 x [42 x float]]* nonnull %0, [42 x [2 x float]]* %a_copy_0, [42 x [2 x float]]* %a_copy_1, [42 x [2 x float]]* %a_copy_2, [42 x [2 x float]]* %a_copy_3, [42 x [2 x float]]* %a_copy_4, [42 x [2 x float]]* %a_copy_5, [42 x [2 x float]]* %a_copy_6, [42 x [2 x float]]* %a_copy_7, [42 x [2 x float]]* %a_copy_8, [42 x [2 x float]]* %a_copy_9, [42 x [2 x float]]* %a_copy_10, [42 x [2 x float]]* %a_copy_11, [42 x [2 x float]]* %a_copy_12, [42 x [2 x float]]* %a_copy_13, [42 x [2 x float]]* %a_copy_14, [42 x [2 x float]]* %a_copy_15, [42 x [2 x float]]* %a_copy_16, [42 x [2 x float]]* %a_copy_17, [42 x [2 x float]]* %a_copy_18, [42 x [2 x float]]* %a_copy_19, [42 x [2 x float]]* %a_copy_20, [42 x [42 x float]]* nonnull %1, [2 x [42 x float]]* %b_copy_0, [2 x [42 x float]]* %b_copy_1, [2 x [42 x float]]* %b_copy_2, [2 x [42 x float]]* %b_copy_3, [2 x [42 x float]]* %b_copy_4, [2 x [42 x float]]* %b_copy_5, [2 x [42 x float]]* %b_copy_6, [2 x [42 x float]]* %b_copy_7, [2 x [42 x float]]* %b_copy_8, [2 x [42 x float]]* %b_copy_9, [2 x [42 x float]]* %b_copy_10, [2 x [42 x float]]* %b_copy_11, [2 x [42 x float]]* %b_copy_12, [2 x [42 x float]]* %b_copy_13, [2 x [42 x float]]* %b_copy_14, [2 x [42 x float]]* %b_copy_15, [2 x [42 x float]]* %b_copy_16, [2 x [42 x float]]* %b_copy_17, [2 x [42 x float]]* %b_copy_18, [2 x [42 x float]]* %b_copy_19, [2 x [42 x float]]* %b_copy_20, [42 x [42 x float]]* nonnull %2, [42 x [42 x float]]* %c_copy)
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_01, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_110, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_211, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_312, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_413, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_514, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_615, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_716, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_817, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_918, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1019, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1120, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1221, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1322, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1423, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1524, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1625, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1726, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1827, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1928, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_2029, i32 999, i32 1, i32 2, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_01, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_110, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_211, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_312, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_413, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_514, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_615, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_716, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_817, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_918, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1019, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1120, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1221, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1322, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1423, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1524, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1625, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1726, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1827, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_1928, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([2 x float]* %_2029, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_051, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_152, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_253, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_354, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_455, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_556, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_657, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_758, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_859, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_960, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1061, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1162, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1263, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1364, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1465, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1566, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1667, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1768, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1869, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1970, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_2071, i32 999, i32 1, i32 1, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_051, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_152, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_253, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_354, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_455, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_556, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_657, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_758, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_859, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_960, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1061, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1162, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1263, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1364, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1465, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1566, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1667, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1768, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1869, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_1970, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([42 x float]* %_2071, i32 998, i32 1, i32 0, i1 false) ], !dbg !60
  call void @apatb_mmult_hw_hw([42 x [2 x float]]* %a_copy_0, [42 x [2 x float]]* %a_copy_1, [42 x [2 x float]]* %a_copy_2, [42 x [2 x float]]* %a_copy_3, [42 x [2 x float]]* %a_copy_4, [42 x [2 x float]]* %a_copy_5, [42 x [2 x float]]* %a_copy_6, [42 x [2 x float]]* %a_copy_7, [42 x [2 x float]]* %a_copy_8, [42 x [2 x float]]* %a_copy_9, [42 x [2 x float]]* %a_copy_10, [42 x [2 x float]]* %a_copy_11, [42 x [2 x float]]* %a_copy_12, [42 x [2 x float]]* %a_copy_13, [42 x [2 x float]]* %a_copy_14, [42 x [2 x float]]* %a_copy_15, [42 x [2 x float]]* %a_copy_16, [42 x [2 x float]]* %a_copy_17, [42 x [2 x float]]* %a_copy_18, [42 x [2 x float]]* %a_copy_19, [42 x [2 x float]]* %a_copy_20, [2 x [42 x float]]* %b_copy_0, [2 x [42 x float]]* %b_copy_1, [2 x [42 x float]]* %b_copy_2, [2 x [42 x float]]* %b_copy_3, [2 x [42 x float]]* %b_copy_4, [2 x [42 x float]]* %b_copy_5, [2 x [42 x float]]* %b_copy_6, [2 x [42 x float]]* %b_copy_7, [2 x [42 x float]]* %b_copy_8, [2 x [42 x float]]* %b_copy_9, [2 x [42 x float]]* %b_copy_10, [2 x [42 x float]]* %b_copy_11, [2 x [42 x float]]* %b_copy_12, [2 x [42 x float]]* %b_copy_13, [2 x [42 x float]]* %b_copy_14, [2 x [42 x float]]* %b_copy_15, [2 x [42 x float]]* %b_copy_16, [2 x [42 x float]]* %b_copy_17, [2 x [42 x float]]* %b_copy_18, [2 x [42 x float]]* %b_copy_19, [2 x [42 x float]]* %b_copy_20, [42 x [42 x float]]* %c_copy)
  call void @copy_back([42 x [42 x float]]* %0, [42 x [2 x float]]* %a_copy_0, [42 x [2 x float]]* %a_copy_1, [42 x [2 x float]]* %a_copy_2, [42 x [2 x float]]* %a_copy_3, [42 x [2 x float]]* %a_copy_4, [42 x [2 x float]]* %a_copy_5, [42 x [2 x float]]* %a_copy_6, [42 x [2 x float]]* %a_copy_7, [42 x [2 x float]]* %a_copy_8, [42 x [2 x float]]* %a_copy_9, [42 x [2 x float]]* %a_copy_10, [42 x [2 x float]]* %a_copy_11, [42 x [2 x float]]* %a_copy_12, [42 x [2 x float]]* %a_copy_13, [42 x [2 x float]]* %a_copy_14, [42 x [2 x float]]* %a_copy_15, [42 x [2 x float]]* %a_copy_16, [42 x [2 x float]]* %a_copy_17, [42 x [2 x float]]* %a_copy_18, [42 x [2 x float]]* %a_copy_19, [42 x [2 x float]]* %a_copy_20, [42 x [42 x float]]* %1, [2 x [42 x float]]* %b_copy_0, [2 x [42 x float]]* %b_copy_1, [2 x [42 x float]]* %b_copy_2, [2 x [42 x float]]* %b_copy_3, [2 x [42 x float]]* %b_copy_4, [2 x [42 x float]]* %b_copy_5, [2 x [42 x float]]* %b_copy_6, [2 x [42 x float]]* %b_copy_7, [2 x [42 x float]]* %b_copy_8, [2 x [42 x float]]* %b_copy_9, [2 x [42 x float]]* %b_copy_10, [2 x [42 x float]]* %b_copy_11, [2 x [42 x float]]* %b_copy_12, [2 x [42 x float]]* %b_copy_13, [2 x [42 x float]]* %b_copy_14, [2 x [42 x float]]* %b_copy_15, [2 x [42 x float]]* %b_copy_16, [2 x [42 x float]]* %b_copy_17, [2 x [42 x float]]* %b_copy_18, [2 x [42 x float]]* %b_copy_19, [2 x [42 x float]]* %b_copy_20, [42 x [42 x float]]* %2, [42 x [42 x float]]* %c_copy)
  call void @free(i8* %_0)
  call void @free(i8* %_1)
  call void @free(i8* %_2)
  call void @free(i8* %_3)
  call void @free(i8* %_4)
  call void @free(i8* %_5)
  call void @free(i8* %_6)
  call void @free(i8* %_7)
  call void @free(i8* %_8)
  call void @free(i8* %_9)
  call void @free(i8* %_10)
  call void @free(i8* %_11)
  call void @free(i8* %_12)
  call void @free(i8* %_13)
  call void @free(i8* %_14)
  call void @free(i8* %_15)
  call void @free(i8* %_16)
  call void @free(i8* %_17)
  call void @free(i8* %_18)
  call void @free(i8* %_19)
  call void @free(i8* %_20)
  call void @free(i8* %_030)
  call void @free(i8* %_131)
  call void @free(i8* %_232)
  call void @free(i8* %_333)
  call void @free(i8* %_434)
  call void @free(i8* %_535)
  call void @free(i8* %_636)
  call void @free(i8* %_737)
  call void @free(i8* %_838)
  call void @free(i8* %_939)
  call void @free(i8* %_1040)
  call void @free(i8* %_1141)
  call void @free(i8* %_1242)
  call void @free(i8* %_1343)
  call void @free(i8* %_1444)
  call void @free(i8* %_1545)
  call void @free(i8* %_1646)
  call void @free(i8* %_1747)
  call void @free(i8* %_1848)
  call void @free(i8* %_1949)
  call void @free(i8* %_2050)
  tail call void @free(i8* %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a42a42f32([42 x [42 x float]]* "orig.arg.no"="0" %dst, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %dst, null
  %1 = icmp eq [42 x [42 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a42a42f32([42 x [42 x float]]* nonnull %dst, [42 x [42 x float]]* nonnull %src, i64 42)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42a42f32([42 x [42 x float]]* "orig.arg.no"="0" %dst, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %src, null
  %1 = icmp eq [42 x [42 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr, i64 42)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42f32([42 x float]* "orig.arg.no"="0" %dst, [42 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [42 x float]* %src, null
  %1 = icmp eq [42 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [42 x float], [42 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [42 x float], [42 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #4

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42f32.6.7([2 x float]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x float]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x float]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [2 x float]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [2 x float]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [2 x float]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [2 x float]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [2 x float]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [2 x float]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [2 x float]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [2 x float]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [2 x float]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [2 x float]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [2 x float]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [2 x float]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [2 x float]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [2 x float]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [2 x float]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [2 x float]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [2 x float]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [2 x float]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [42 x float]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [42 x float]* %src, null
  %1 = icmp eq [2 x float]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = urem i64 %for.loop.idx2, 2
  %4 = udiv i64 %for.loop.idx2, 2
  %dst.addr_0 = getelementptr [2 x float], [2 x float]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [2 x float], [2 x float]* %dst_1, i64 0, i64 %3
  %dst.addr_2 = getelementptr [2 x float], [2 x float]* %dst_2, i64 0, i64 %3
  %dst.addr_3 = getelementptr [2 x float], [2 x float]* %dst_3, i64 0, i64 %3
  %dst.addr_4 = getelementptr [2 x float], [2 x float]* %dst_4, i64 0, i64 %3
  %dst.addr_5 = getelementptr [2 x float], [2 x float]* %dst_5, i64 0, i64 %3
  %dst.addr_6 = getelementptr [2 x float], [2 x float]* %dst_6, i64 0, i64 %3
  %dst.addr_7 = getelementptr [2 x float], [2 x float]* %dst_7, i64 0, i64 %3
  %dst.addr_8 = getelementptr [2 x float], [2 x float]* %dst_8, i64 0, i64 %3
  %dst.addr_9 = getelementptr [2 x float], [2 x float]* %dst_9, i64 0, i64 %3
  %dst.addr_10 = getelementptr [2 x float], [2 x float]* %dst_10, i64 0, i64 %3
  %dst.addr_11 = getelementptr [2 x float], [2 x float]* %dst_11, i64 0, i64 %3
  %dst.addr_12 = getelementptr [2 x float], [2 x float]* %dst_12, i64 0, i64 %3
  %dst.addr_13 = getelementptr [2 x float], [2 x float]* %dst_13, i64 0, i64 %3
  %dst.addr_14 = getelementptr [2 x float], [2 x float]* %dst_14, i64 0, i64 %3
  %dst.addr_15 = getelementptr [2 x float], [2 x float]* %dst_15, i64 0, i64 %3
  %dst.addr_16 = getelementptr [2 x float], [2 x float]* %dst_16, i64 0, i64 %3
  %dst.addr_17 = getelementptr [2 x float], [2 x float]* %dst_17, i64 0, i64 %3
  %dst.addr_18 = getelementptr [2 x float], [2 x float]* %dst_18, i64 0, i64 %3
  %dst.addr_19 = getelementptr [2 x float], [2 x float]* %dst_19, i64 0, i64 %3
  %dst.addr_20 = getelementptr [2 x float], [2 x float]* %dst_20, i64 0, i64 %3
  %src.addr = getelementptr [42 x float], [42 x float]* %src, i64 0, i64 %for.loop.idx2
  %5 = load float, float* %src.addr, align 4
  switch i64 %4, label %dst.addr.case.20 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
    i64 7, label %dst.addr.case.7
    i64 8, label %dst.addr.case.8
    i64 9, label %dst.addr.case.9
    i64 10, label %dst.addr.case.10
    i64 11, label %dst.addr.case.11
    i64 12, label %dst.addr.case.12
    i64 13, label %dst.addr.case.13
    i64 14, label %dst.addr.case.14
    i64 15, label %dst.addr.case.15
    i64 16, label %dst.addr.case.16
    i64 17, label %dst.addr.case.17
    i64 18, label %dst.addr.case.18
    i64 19, label %dst.addr.case.19
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_1, align 4
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_2, align 4
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_3, align 4
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_4, align 4
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_5, align 4
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_6, align 4
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_7, align 4
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_8, align 4
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  store float %5, float* %dst.addr_9, align 4
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_10, align 4
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_11, align 4
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_12, align 4
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_13, align 4
  br label %dst.addr.exit

dst.addr.case.14:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_14, align 4
  br label %dst.addr.exit

dst.addr.case.15:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_15, align 4
  br label %dst.addr.exit

dst.addr.case.16:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_16, align 4
  br label %dst.addr.exit

dst.addr.case.17:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_17, align 4
  br label %dst.addr.exit

dst.addr.case.18:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_18, align 4
  br label %dst.addr.exit

dst.addr.case.19:                                 ; preds = %for.loop
  store float %5, float* %dst.addr_19, align 4
  br label %dst.addr.exit

dst.addr.case.20:                                 ; preds = %for.loop
  %6 = and i64 %for.loop.idx2, 9223372036854775806
  %7 = icmp eq i64 %6, 40
  call void @llvm.assume(i1 %7)
  store float %5, float* %dst.addr_20, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.20, %dst.addr.case.19, %dst.addr.case.18, %dst.addr.case.17, %dst.addr.case.16, %dst.addr.case.15, %dst.addr.case.14, %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42a42f32.5.8([42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %src, null
  %1 = icmp eq [42 x [2 x float]]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr_0 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_0, i64 0, i64 %for.loop.idx2
  %dst.addr_1 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_1, i64 0, i64 %for.loop.idx2
  %dst.addr_2 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_2, i64 0, i64 %for.loop.idx2
  %dst.addr_3 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_3, i64 0, i64 %for.loop.idx2
  %dst.addr_4 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_4, i64 0, i64 %for.loop.idx2
  %dst.addr_5 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_5, i64 0, i64 %for.loop.idx2
  %dst.addr_6 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_6, i64 0, i64 %for.loop.idx2
  %dst.addr_7 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_7, i64 0, i64 %for.loop.idx2
  %dst.addr_8 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_8, i64 0, i64 %for.loop.idx2
  %dst.addr_9 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_9, i64 0, i64 %for.loop.idx2
  %dst.addr_10 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_10, i64 0, i64 %for.loop.idx2
  %dst.addr_11 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_11, i64 0, i64 %for.loop.idx2
  %dst.addr_12 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_12, i64 0, i64 %for.loop.idx2
  %dst.addr_13 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_13, i64 0, i64 %for.loop.idx2
  %dst.addr_14 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_14, i64 0, i64 %for.loop.idx2
  %dst.addr_15 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_15, i64 0, i64 %for.loop.idx2
  %dst.addr_16 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_16, i64 0, i64 %for.loop.idx2
  %dst.addr_17 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_17, i64 0, i64 %for.loop.idx2
  %dst.addr_18 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_18, i64 0, i64 %for.loop.idx2
  %dst.addr_19 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_19, i64 0, i64 %for.loop.idx2
  %dst.addr_20 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %dst_20, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a42f32.6.7([2 x float]* %dst.addr_0, [2 x float]* %dst.addr_1, [2 x float]* %dst.addr_2, [2 x float]* %dst.addr_3, [2 x float]* %dst.addr_4, [2 x float]* %dst.addr_5, [2 x float]* %dst.addr_6, [2 x float]* %dst.addr_7, [2 x float]* %dst.addr_8, [2 x float]* %dst.addr_9, [2 x float]* %dst.addr_10, [2 x float]* %dst.addr_11, [2 x float]* %dst.addr_12, [2 x float]* %dst.addr_13, [2 x float]* %dst.addr_14, [2 x float]* %dst.addr_15, [2 x float]* %dst.addr_16, [2 x float]* %dst.addr_17, [2 x float]* %dst.addr_18, [2 x float]* %dst.addr_19, [2 x float]* %dst.addr_20, [42 x float]* %src.addr, i64 42)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a42a42f32.4.9([42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [42 x [2 x float]]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src) #2 {
entry:
  %0 = icmp eq [42 x [2 x float]]* %dst_0, null
  %1 = icmp eq [42 x [42 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a42a42f32.5.8([42 x [2 x float]]* nonnull %dst_0, [42 x [2 x float]]* %dst_1, [42 x [2 x float]]* %dst_2, [42 x [2 x float]]* %dst_3, [42 x [2 x float]]* %dst_4, [42 x [2 x float]]* %dst_5, [42 x [2 x float]]* %dst_6, [42 x [2 x float]]* %dst_7, [42 x [2 x float]]* %dst_8, [42 x [2 x float]]* %dst_9, [42 x [2 x float]]* %dst_10, [42 x [2 x float]]* %dst_11, [42 x [2 x float]]* %dst_12, [42 x [2 x float]]* %dst_13, [42 x [2 x float]]* %dst_14, [42 x [2 x float]]* %dst_15, [42 x [2 x float]]* %dst_16, [42 x [2 x float]]* %dst_17, [42 x [2 x float]]* %dst_18, [42 x [2 x float]]* %dst_19, [42 x [2 x float]]* %dst_20, [42 x [42 x float]]* nonnull %src, i64 42)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42a42f32.11.12([2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %src, null
  %1 = icmp eq [2 x [42 x float]]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = urem i64 %for.loop.idx2, 2
  %4 = udiv i64 %for.loop.idx2, 2
  %dst.addr_0 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_1, i64 0, i64 %3
  %dst.addr_2 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_2, i64 0, i64 %3
  %dst.addr_3 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_3, i64 0, i64 %3
  %dst.addr_4 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_4, i64 0, i64 %3
  %dst.addr_5 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_5, i64 0, i64 %3
  %dst.addr_6 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_6, i64 0, i64 %3
  %dst.addr_7 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_7, i64 0, i64 %3
  %dst.addr_8 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_8, i64 0, i64 %3
  %dst.addr_9 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_9, i64 0, i64 %3
  %dst.addr_10 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_10, i64 0, i64 %3
  %dst.addr_11 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_11, i64 0, i64 %3
  %dst.addr_12 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_12, i64 0, i64 %3
  %dst.addr_13 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_13, i64 0, i64 %3
  %dst.addr_14 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_14, i64 0, i64 %3
  %dst.addr_15 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_15, i64 0, i64 %3
  %dst.addr_16 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_16, i64 0, i64 %3
  %dst.addr_17 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_17, i64 0, i64 %3
  %dst.addr_18 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_18, i64 0, i64 %3
  %dst.addr_19 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_19, i64 0, i64 %3
  %dst.addr_20 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %dst_20, i64 0, i64 %3
  %src.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %src, i64 0, i64 %for.loop.idx2
  switch i64 %4, label %dst.addr.case.20 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
    i64 7, label %dst.addr.case.7
    i64 8, label %dst.addr.case.8
    i64 9, label %dst.addr.case.9
    i64 10, label %dst.addr.case.10
    i64 11, label %dst.addr.case.11
    i64 12, label %dst.addr.case.12
    i64 13, label %dst.addr.case.13
    i64 14, label %dst.addr.case.14
    i64 15, label %dst.addr.case.15
    i64 16, label %dst.addr.case.16
    i64 17, label %dst.addr.case.17
    i64 18, label %dst.addr.case.18
    i64 19, label %dst.addr.case.19
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_0, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_1, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_2, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_3, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_4, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_5, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_6, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_7, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_8, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_9, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_10, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_11, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_12, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_13, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.14:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_14, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.15:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_15, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.16:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_16, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.17:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_17, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.18:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_18, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.19:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_19, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.case.20:                                 ; preds = %for.loop
  %5 = and i64 %for.loop.idx2, 9223372036854775806
  %6 = icmp eq i64 %5, 40
  call void @llvm.assume(i1 %6)
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr_20, [42 x float]* %src.addr, i64 42)
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.20, %dst.addr.case.19, %dst.addr.case.18, %dst.addr.case.17, %dst.addr.case.16, %dst.addr.case.15, %dst.addr.case.14, %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a42a42f32.10.13([2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.4" %dst_4, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.5" %dst_5, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.6" %dst_6, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.7" %dst_7, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.8" %dst_8, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.9" %dst_9, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.10" %dst_10, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.11" %dst_11, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.12" %dst_12, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.13" %dst_13, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.14" %dst_14, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.15" %dst_15, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.16" %dst_16, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.17" %dst_17, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.18" %dst_18, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.19" %dst_19, [2 x [42 x float]]* "orig.arg.no"="0" "unpacked"="0.20" %dst_20, [42 x [42 x float]]* readonly "orig.arg.no"="1" %src) #2 {
entry:
  %0 = icmp eq [2 x [42 x float]]* %dst_0, null
  %1 = icmp eq [42 x [42 x float]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a42a42f32.11.12([2 x [42 x float]]* nonnull %dst_0, [2 x [42 x float]]* %dst_1, [2 x [42 x float]]* %dst_2, [2 x [42 x float]]* %dst_3, [2 x [42 x float]]* %dst_4, [2 x [42 x float]]* %dst_5, [2 x [42 x float]]* %dst_6, [2 x [42 x float]]* %dst_7, [2 x [42 x float]]* %dst_8, [2 x [42 x float]]* %dst_9, [2 x [42 x float]]* %dst_10, [2 x [42 x float]]* %dst_11, [2 x [42 x float]]* %dst_12, [2 x [42 x float]]* %dst_13, [2 x [42 x float]]* %dst_14, [2 x [42 x float]]* %dst_15, [2 x [42 x float]]* %dst_16, [2 x [42 x float]]* %dst_17, [2 x [42 x float]]* %dst_18, [2 x [42 x float]]* %dst_19, [2 x [42 x float]]* %dst_20, [42 x [42 x float]]* nonnull %src, i64 42)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([42 x [42 x float]]* readonly "orig.arg.no"="0", [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.0" %_0, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.1" %_1, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.2" %_2, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.3" %_3, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.4" %_4, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.5" %_5, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.6" %_6, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.7" %_7, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.8" %_8, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.9" %_9, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.10" %_10, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.11" %_11, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.12" %_12, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.13" %_13, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.14" %_14, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.15" %_15, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.16" %_16, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.17" %_17, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.18" %_18, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.19" %_19, [42 x [2 x float]]* "orig.arg.no"="1" "unpacked"="1.20" %_20, [42 x [42 x float]]* readonly "orig.arg.no"="2", [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.0" %_01, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.1" %_110, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.2" %_211, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.3" %_312, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.4" %_413, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.5" %_514, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.6" %_615, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.7" %_716, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.8" %_817, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.9" %_918, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.10" %_1019, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.11" %_1120, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.12" %_1221, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.13" %_1322, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.14" %_1423, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.15" %_1524, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.16" %_1625, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.17" %_1726, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.18" %_1827, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.19" %_1928, [2 x [42 x float]]* "orig.arg.no"="3" "unpacked"="3.20" %_2029, [42 x [42 x float]]* readonly "orig.arg.no"="4", [42 x [42 x float]]* "orig.arg.no"="5") #5 {
entry:
  call void @onebyonecpy_hls.p0a42a42f32.4.9([42 x [2 x float]]* %_0, [42 x [2 x float]]* %_1, [42 x [2 x float]]* %_2, [42 x [2 x float]]* %_3, [42 x [2 x float]]* %_4, [42 x [2 x float]]* %_5, [42 x [2 x float]]* %_6, [42 x [2 x float]]* %_7, [42 x [2 x float]]* %_8, [42 x [2 x float]]* %_9, [42 x [2 x float]]* %_10, [42 x [2 x float]]* %_11, [42 x [2 x float]]* %_12, [42 x [2 x float]]* %_13, [42 x [2 x float]]* %_14, [42 x [2 x float]]* %_15, [42 x [2 x float]]* %_16, [42 x [2 x float]]* %_17, [42 x [2 x float]]* %_18, [42 x [2 x float]]* %_19, [42 x [2 x float]]* %_20, [42 x [42 x float]]* %0)
  call void @onebyonecpy_hls.p0a42a42f32.10.13([2 x [42 x float]]* %_01, [2 x [42 x float]]* %_110, [2 x [42 x float]]* %_211, [2 x [42 x float]]* %_312, [2 x [42 x float]]* %_413, [2 x [42 x float]]* %_514, [2 x [42 x float]]* %_615, [2 x [42 x float]]* %_716, [2 x [42 x float]]* %_817, [2 x [42 x float]]* %_918, [2 x [42 x float]]* %_1019, [2 x [42 x float]]* %_1120, [2 x [42 x float]]* %_1221, [2 x [42 x float]]* %_1322, [2 x [42 x float]]* %_1423, [2 x [42 x float]]* %_1524, [2 x [42 x float]]* %_1625, [2 x [42 x float]]* %_1726, [2 x [42 x float]]* %_1827, [2 x [42 x float]]* %_1928, [2 x [42 x float]]* %_2029, [42 x [42 x float]]* %1)
  call fastcc void @onebyonecpy_hls.p0a42a42f32([42 x [42 x float]]* %3, [42 x [42 x float]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42f32.22.23([42 x float]* "orig.arg.no"="0" %dst, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [2 x float]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [2 x float]* %src_0, null
  %1 = icmp eq [42 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = urem i64 %for.loop.idx2, 2
  %4 = udiv i64 %for.loop.idx2, 2
  %dst.addr = getelementptr [42 x float], [42 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [2 x float], [2 x float]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [2 x float], [2 x float]* %src_1, i64 0, i64 %3
  %src.addr_2 = getelementptr [2 x float], [2 x float]* %src_2, i64 0, i64 %3
  %src.addr_3 = getelementptr [2 x float], [2 x float]* %src_3, i64 0, i64 %3
  %src.addr_4 = getelementptr [2 x float], [2 x float]* %src_4, i64 0, i64 %3
  %src.addr_5 = getelementptr [2 x float], [2 x float]* %src_5, i64 0, i64 %3
  %src.addr_6 = getelementptr [2 x float], [2 x float]* %src_6, i64 0, i64 %3
  %src.addr_7 = getelementptr [2 x float], [2 x float]* %src_7, i64 0, i64 %3
  %src.addr_8 = getelementptr [2 x float], [2 x float]* %src_8, i64 0, i64 %3
  %src.addr_9 = getelementptr [2 x float], [2 x float]* %src_9, i64 0, i64 %3
  %src.addr_10 = getelementptr [2 x float], [2 x float]* %src_10, i64 0, i64 %3
  %src.addr_11 = getelementptr [2 x float], [2 x float]* %src_11, i64 0, i64 %3
  %src.addr_12 = getelementptr [2 x float], [2 x float]* %src_12, i64 0, i64 %3
  %src.addr_13 = getelementptr [2 x float], [2 x float]* %src_13, i64 0, i64 %3
  %src.addr_14 = getelementptr [2 x float], [2 x float]* %src_14, i64 0, i64 %3
  %src.addr_15 = getelementptr [2 x float], [2 x float]* %src_15, i64 0, i64 %3
  %src.addr_16 = getelementptr [2 x float], [2 x float]* %src_16, i64 0, i64 %3
  %src.addr_17 = getelementptr [2 x float], [2 x float]* %src_17, i64 0, i64 %3
  %src.addr_18 = getelementptr [2 x float], [2 x float]* %src_18, i64 0, i64 %3
  %src.addr_19 = getelementptr [2 x float], [2 x float]* %src_19, i64 0, i64 %3
  %src.addr_20 = getelementptr [2 x float], [2 x float]* %src_20, i64 0, i64 %3
  switch i64 %4, label %src.addr.case.20 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
    i64 7, label %src.addr.case.7
    i64 8, label %src.addr.case.8
    i64 9, label %src.addr.case.9
    i64 10, label %src.addr.case.10
    i64 11, label %src.addr.case.11
    i64 12, label %src.addr.case.12
    i64 13, label %src.addr.case.13
    i64 14, label %src.addr.case.14
    i64 15, label %src.addr.case.15
    i64 16, label %src.addr.case.16
    i64 17, label %src.addr.case.17
    i64 18, label %src.addr.case.18
    i64 19, label %src.addr.case.19
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load float, float* %src.addr_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load float, float* %src.addr_1, align 4
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_2 = load float, float* %src.addr_2, align 4
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_3 = load float, float* %src.addr_3, align 4
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  %_4 = load float, float* %src.addr_4, align 4
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  %_5 = load float, float* %src.addr_5, align 4
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  %_6 = load float, float* %src.addr_6, align 4
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %_7 = load float, float* %src.addr_7, align 4
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  %_8 = load float, float* %src.addr_8, align 4
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  %_9 = load float, float* %src.addr_9, align 4
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  %_10 = load float, float* %src.addr_10, align 4
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  %_11 = load float, float* %src.addr_11, align 4
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  %_12 = load float, float* %src.addr_12, align 4
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %_13 = load float, float* %src.addr_13, align 4
  br label %src.addr.exit

src.addr.case.14:                                 ; preds = %for.loop
  %_14 = load float, float* %src.addr_14, align 4
  br label %src.addr.exit

src.addr.case.15:                                 ; preds = %for.loop
  %_15 = load float, float* %src.addr_15, align 4
  br label %src.addr.exit

src.addr.case.16:                                 ; preds = %for.loop
  %_16 = load float, float* %src.addr_16, align 4
  br label %src.addr.exit

src.addr.case.17:                                 ; preds = %for.loop
  %_17 = load float, float* %src.addr_17, align 4
  br label %src.addr.exit

src.addr.case.18:                                 ; preds = %for.loop
  %_18 = load float, float* %src.addr_18, align 4
  br label %src.addr.exit

src.addr.case.19:                                 ; preds = %for.loop
  %_19 = load float, float* %src.addr_19, align 4
  br label %src.addr.exit

src.addr.case.20:                                 ; preds = %for.loop
  %5 = and i64 %for.loop.idx2, 9223372036854775806
  %6 = icmp eq i64 %5, 40
  call void @llvm.assume(i1 %6)
  %_20 = load float, float* %src.addr_20, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.20, %src.addr.case.19, %src.addr.case.18, %src.addr.case.17, %src.addr.case.16, %src.addr.case.15, %src.addr.case.14, %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %7 = phi float [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ %_2, %src.addr.case.2 ], [ %_3, %src.addr.case.3 ], [ %_4, %src.addr.case.4 ], [ %_5, %src.addr.case.5 ], [ %_6, %src.addr.case.6 ], [ %_7, %src.addr.case.7 ], [ %_8, %src.addr.case.8 ], [ %_9, %src.addr.case.9 ], [ %_10, %src.addr.case.10 ], [ %_11, %src.addr.case.11 ], [ %_12, %src.addr.case.12 ], [ %_13, %src.addr.case.13 ], [ %_14, %src.addr.case.14 ], [ %_15, %src.addr.case.15 ], [ %_16, %src.addr.case.16 ], [ %_17, %src.addr.case.17 ], [ %_18, %src.addr.case.18 ], [ %_19, %src.addr.case.19 ], [ %_20, %src.addr.case.20 ]
  store float %7, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42a42f32.21.24([42 x [42 x float]]* "orig.arg.no"="0" %dst, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [42 x [2 x float]]* %src_0, null
  %1 = icmp eq [42 x [42 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_0, i64 0, i64 %for.loop.idx2
  %src.addr_1 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_1, i64 0, i64 %for.loop.idx2
  %src.addr_2 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_2, i64 0, i64 %for.loop.idx2
  %src.addr_3 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_3, i64 0, i64 %for.loop.idx2
  %src.addr_4 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_4, i64 0, i64 %for.loop.idx2
  %src.addr_5 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_5, i64 0, i64 %for.loop.idx2
  %src.addr_6 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_6, i64 0, i64 %for.loop.idx2
  %src.addr_7 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_7, i64 0, i64 %for.loop.idx2
  %src.addr_8 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_8, i64 0, i64 %for.loop.idx2
  %src.addr_9 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_9, i64 0, i64 %for.loop.idx2
  %src.addr_10 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_10, i64 0, i64 %for.loop.idx2
  %src.addr_11 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_11, i64 0, i64 %for.loop.idx2
  %src.addr_12 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_12, i64 0, i64 %for.loop.idx2
  %src.addr_13 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_13, i64 0, i64 %for.loop.idx2
  %src.addr_14 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_14, i64 0, i64 %for.loop.idx2
  %src.addr_15 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_15, i64 0, i64 %for.loop.idx2
  %src.addr_16 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_16, i64 0, i64 %for.loop.idx2
  %src.addr_17 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_17, i64 0, i64 %for.loop.idx2
  %src.addr_18 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_18, i64 0, i64 %for.loop.idx2
  %src.addr_19 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_19, i64 0, i64 %for.loop.idx2
  %src.addr_20 = getelementptr [42 x [2 x float]], [42 x [2 x float]]* %src_20, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a42f32.22.23([42 x float]* %dst.addr, [2 x float]* %src.addr_0, [2 x float]* %src.addr_1, [2 x float]* %src.addr_2, [2 x float]* %src.addr_3, [2 x float]* %src.addr_4, [2 x float]* %src.addr_5, [2 x float]* %src.addr_6, [2 x float]* %src.addr_7, [2 x float]* %src.addr_8, [2 x float]* %src.addr_9, [2 x float]* %src.addr_10, [2 x float]* %src.addr_11, [2 x float]* %src.addr_12, [2 x float]* %src.addr_13, [2 x float]* %src.addr_14, [2 x float]* %src.addr_15, [2 x float]* %src.addr_16, [2 x float]* %src.addr_17, [2 x float]* %src.addr_18, [2 x float]* %src.addr_19, [2 x float]* %src.addr_20, i64 42)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a42a42f32.20.25([42 x [42 x float]]* "orig.arg.no"="0" %dst, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20) #2 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %dst, null
  %1 = icmp eq [42 x [2 x float]]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a42a42f32.21.24([42 x [42 x float]]* nonnull %dst, [42 x [2 x float]]* nonnull %src_0, [42 x [2 x float]]* %src_1, [42 x [2 x float]]* %src_2, [42 x [2 x float]]* %src_3, [42 x [2 x float]]* %src_4, [42 x [2 x float]]* %src_5, [42 x [2 x float]]* %src_6, [42 x [2 x float]]* %src_7, [42 x [2 x float]]* %src_8, [42 x [2 x float]]* %src_9, [42 x [2 x float]]* %src_10, [42 x [2 x float]]* %src_11, [42 x [2 x float]]* %src_12, [42 x [2 x float]]* %src_13, [42 x [2 x float]]* %src_14, [42 x [2 x float]]* %src_15, [42 x [2 x float]]* %src_16, [42 x [2 x float]]* %src_17, [42 x [2 x float]]* %src_18, [42 x [2 x float]]* %src_19, [42 x [2 x float]]* %src_20, i64 42)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a42a42f32.27.28([42 x [42 x float]]* "orig.arg.no"="0" %dst, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20, i64 "orig.arg.no"="2" %num) #3 {
entry:
  %0 = icmp eq [2 x [42 x float]]* %src_0, null
  %1 = icmp eq [42 x [42 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = urem i64 %for.loop.idx2, 2
  %4 = udiv i64 %for.loop.idx2, 2
  %dst.addr = getelementptr [42 x [42 x float]], [42 x [42 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_1, i64 0, i64 %3
  %src.addr_2 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_2, i64 0, i64 %3
  %src.addr_3 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_3, i64 0, i64 %3
  %src.addr_4 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_4, i64 0, i64 %3
  %src.addr_5 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_5, i64 0, i64 %3
  %src.addr_6 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_6, i64 0, i64 %3
  %src.addr_7 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_7, i64 0, i64 %3
  %src.addr_8 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_8, i64 0, i64 %3
  %src.addr_9 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_9, i64 0, i64 %3
  %src.addr_10 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_10, i64 0, i64 %3
  %src.addr_11 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_11, i64 0, i64 %3
  %src.addr_12 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_12, i64 0, i64 %3
  %src.addr_13 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_13, i64 0, i64 %3
  %src.addr_14 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_14, i64 0, i64 %3
  %src.addr_15 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_15, i64 0, i64 %3
  %src.addr_16 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_16, i64 0, i64 %3
  %src.addr_17 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_17, i64 0, i64 %3
  %src.addr_18 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_18, i64 0, i64 %3
  %src.addr_19 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_19, i64 0, i64 %3
  %src.addr_20 = getelementptr [2 x [42 x float]], [2 x [42 x float]]* %src_20, i64 0, i64 %3
  switch i64 %4, label %src.addr.case.20 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
    i64 7, label %src.addr.case.7
    i64 8, label %src.addr.case.8
    i64 9, label %src.addr.case.9
    i64 10, label %src.addr.case.10
    i64 11, label %src.addr.case.11
    i64 12, label %src.addr.case.12
    i64 13, label %src.addr.case.13
    i64 14, label %src.addr.case.14
    i64 15, label %src.addr.case.15
    i64 16, label %src.addr.case.16
    i64 17, label %src.addr.case.17
    i64 18, label %src.addr.case.18
    i64 19, label %src.addr.case.19
  ]

src.addr.case.0:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_0, i64 42)
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_1, i64 42)
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_2, i64 42)
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_3, i64 42)
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_4, i64 42)
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_5, i64 42)
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_6, i64 42)
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_7, i64 42)
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_8, i64 42)
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_9, i64 42)
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_10, i64 42)
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_11, i64 42)
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_12, i64 42)
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_13, i64 42)
  br label %src.addr.exit

src.addr.case.14:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_14, i64 42)
  br label %src.addr.exit

src.addr.case.15:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_15, i64 42)
  br label %src.addr.exit

src.addr.case.16:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_16, i64 42)
  br label %src.addr.exit

src.addr.case.17:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_17, i64 42)
  br label %src.addr.exit

src.addr.case.18:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_18, i64 42)
  br label %src.addr.exit

src.addr.case.19:                                 ; preds = %for.loop
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_19, i64 42)
  br label %src.addr.exit

src.addr.case.20:                                 ; preds = %for.loop
  %5 = and i64 %for.loop.idx2, 9223372036854775806
  %6 = icmp eq i64 %5, 40
  call void @llvm.assume(i1 %6)
  call void @arraycpy_hls.p0a42f32([42 x float]* %dst.addr, [42 x float]* %src.addr_20, i64 42)
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.20, %src.addr.case.19, %src.addr.case.18, %src.addr.case.17, %src.addr.case.16, %src.addr.case.15, %src.addr.case.14, %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a42a42f32.26.29([42 x [42 x float]]* "orig.arg.no"="0" %dst, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %src_4, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %src_5, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %src_6, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %src_7, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %src_8, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %src_9, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %src_10, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %src_11, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %src_12, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %src_13, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %src_14, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %src_15, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %src_16, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %src_17, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %src_18, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %src_19, [2 x [42 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %src_20) #2 {
entry:
  %0 = icmp eq [42 x [42 x float]]* %dst, null
  %1 = icmp eq [2 x [42 x float]]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a42a42f32.27.28([42 x [42 x float]]* nonnull %dst, [2 x [42 x float]]* nonnull %src_0, [2 x [42 x float]]* %src_1, [2 x [42 x float]]* %src_2, [2 x [42 x float]]* %src_3, [2 x [42 x float]]* %src_4, [2 x [42 x float]]* %src_5, [2 x [42 x float]]* %src_6, [2 x [42 x float]]* %src_7, [2 x [42 x float]]* %src_8, [2 x [42 x float]]* %src_9, [2 x [42 x float]]* %src_10, [2 x [42 x float]]* %src_11, [2 x [42 x float]]* %src_12, [2 x [42 x float]]* %src_13, [2 x [42 x float]]* %src_14, [2 x [42 x float]]* %src_15, [2 x [42 x float]]* %src_16, [2 x [42 x float]]* %src_17, [2 x [42 x float]]* %src_18, [2 x [42 x float]]* %src_19, [2 x [42 x float]]* %src_20, i64 42)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([42 x [42 x float]]* "orig.arg.no"="0", [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %_4, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %_5, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %_6, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %_7, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %_8, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %_9, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %_10, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %_11, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %_12, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %_13, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %_14, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %_15, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %_16, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %_17, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %_18, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %_19, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %_20, [42 x [42 x float]]* "orig.arg.no"="2", [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.0" %_01, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.1" %_110, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.2" %_211, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.3" %_312, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.4" %_413, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.5" %_514, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.6" %_615, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.7" %_716, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.8" %_817, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.9" %_918, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.10" %_1019, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.11" %_1120, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.12" %_1221, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.13" %_1322, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.14" %_1423, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.15" %_1524, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.16" %_1625, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.17" %_1726, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.18" %_1827, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.19" %_1928, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.20" %_2029, [42 x [42 x float]]* "orig.arg.no"="4", [42 x [42 x float]]* readonly "orig.arg.no"="5") #6 {
entry:
  call void @onebyonecpy_hls.p0a42a42f32.20.25([42 x [42 x float]]* %0, [42 x [2 x float]]* %_0, [42 x [2 x float]]* %_1, [42 x [2 x float]]* %_2, [42 x [2 x float]]* %_3, [42 x [2 x float]]* %_4, [42 x [2 x float]]* %_5, [42 x [2 x float]]* %_6, [42 x [2 x float]]* %_7, [42 x [2 x float]]* %_8, [42 x [2 x float]]* %_9, [42 x [2 x float]]* %_10, [42 x [2 x float]]* %_11, [42 x [2 x float]]* %_12, [42 x [2 x float]]* %_13, [42 x [2 x float]]* %_14, [42 x [2 x float]]* %_15, [42 x [2 x float]]* %_16, [42 x [2 x float]]* %_17, [42 x [2 x float]]* %_18, [42 x [2 x float]]* %_19, [42 x [2 x float]]* %_20)
  call void @onebyonecpy_hls.p0a42a42f32.26.29([42 x [42 x float]]* %1, [2 x [42 x float]]* %_01, [2 x [42 x float]]* %_110, [2 x [42 x float]]* %_211, [2 x [42 x float]]* %_312, [2 x [42 x float]]* %_413, [2 x [42 x float]]* %_514, [2 x [42 x float]]* %_615, [2 x [42 x float]]* %_716, [2 x [42 x float]]* %_817, [2 x [42 x float]]* %_918, [2 x [42 x float]]* %_1019, [2 x [42 x float]]* %_1120, [2 x [42 x float]]* %_1221, [2 x [42 x float]]* %_1322, [2 x [42 x float]]* %_1423, [2 x [42 x float]]* %_1524, [2 x [42 x float]]* %_1625, [2 x [42 x float]]* %_1726, [2 x [42 x float]]* %_1827, [2 x [42 x float]]* %_1928, [2 x [42 x float]]* %_2029)
  call fastcc void @onebyonecpy_hls.p0a42a42f32([42 x [42 x float]]* %2, [42 x [42 x float]]* %3)
  ret void
}

declare void @apatb_mmult_hw_hw([42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [42 x [42 x float]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([42 x [42 x float]]* "orig.arg.no"="0", [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.4" %_4, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.5" %_5, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.6" %_6, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.7" %_7, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.8" %_8, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.9" %_9, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.10" %_10, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.11" %_11, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.12" %_12, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.13" %_13, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.14" %_14, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.15" %_15, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.16" %_16, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.17" %_17, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.18" %_18, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.19" %_19, [42 x [2 x float]]* readonly "orig.arg.no"="1" "unpacked"="1.20" %_20, [42 x [42 x float]]* "orig.arg.no"="2", [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.0" %_01, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.1" %_110, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.2" %_211, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.3" %_312, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.4" %_413, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.5" %_514, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.6" %_615, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.7" %_716, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.8" %_817, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.9" %_918, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.10" %_1019, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.11" %_1120, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.12" %_1221, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.13" %_1322, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.14" %_1423, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.15" %_1524, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.16" %_1625, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.17" %_1726, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.18" %_1827, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.19" %_1928, [2 x [42 x float]]* readonly "orig.arg.no"="3" "unpacked"="3.20" %_2029, [42 x [42 x float]]* "orig.arg.no"="4", [42 x [42 x float]]* readonly "orig.arg.no"="5") #6 {
entry:
  call fastcc void @onebyonecpy_hls.p0a42a42f32([42 x [42 x float]]* %2, [42 x [42 x float]]* %3)
  ret void
}

declare void @mmult_hw_hw_stub([42 x float]* noalias nocapture nonnull readonly, [42 x float]* noalias nocapture nonnull readonly, [42 x float]* noalias nocapture nonnull)

define void @mmult_hw_hw_stub_wrapper([42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [42 x [2 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [2 x [42 x float]]*, [42 x [42 x float]]*) #7 {
entry:
  %43 = call i8* @malloc(i64 7056)
  %44 = bitcast i8* %43 to [42 x [42 x float]]*
  %45 = call i8* @malloc(i64 7056)
  %46 = bitcast i8* %45 to [42 x [42 x float]]*
  call void @copy_out([42 x [42 x float]]* %44, [42 x [2 x float]]* %0, [42 x [2 x float]]* %1, [42 x [2 x float]]* %2, [42 x [2 x float]]* %3, [42 x [2 x float]]* %4, [42 x [2 x float]]* %5, [42 x [2 x float]]* %6, [42 x [2 x float]]* %7, [42 x [2 x float]]* %8, [42 x [2 x float]]* %9, [42 x [2 x float]]* %10, [42 x [2 x float]]* %11, [42 x [2 x float]]* %12, [42 x [2 x float]]* %13, [42 x [2 x float]]* %14, [42 x [2 x float]]* %15, [42 x [2 x float]]* %16, [42 x [2 x float]]* %17, [42 x [2 x float]]* %18, [42 x [2 x float]]* %19, [42 x [2 x float]]* %20, [42 x [42 x float]]* %46, [2 x [42 x float]]* %21, [2 x [42 x float]]* %22, [2 x [42 x float]]* %23, [2 x [42 x float]]* %24, [2 x [42 x float]]* %25, [2 x [42 x float]]* %26, [2 x [42 x float]]* %27, [2 x [42 x float]]* %28, [2 x [42 x float]]* %29, [2 x [42 x float]]* %30, [2 x [42 x float]]* %31, [2 x [42 x float]]* %32, [2 x [42 x float]]* %33, [2 x [42 x float]]* %34, [2 x [42 x float]]* %35, [2 x [42 x float]]* %36, [2 x [42 x float]]* %37, [2 x [42 x float]]* %38, [2 x [42 x float]]* %39, [2 x [42 x float]]* %40, [2 x [42 x float]]* %41, [42 x [42 x float]]* null, [42 x [42 x float]]* %42)
  %47 = bitcast [42 x [42 x float]]* %44 to [42 x float]*
  %48 = bitcast [42 x [42 x float]]* %46 to [42 x float]*
  %49 = bitcast [42 x [42 x float]]* %42 to [42 x float]*
  call void @mmult_hw_hw_stub([42 x float]* %47, [42 x float]* %48, [42 x float]* %49)
  call void @copy_in([42 x [42 x float]]* %44, [42 x [2 x float]]* %0, [42 x [2 x float]]* %1, [42 x [2 x float]]* %2, [42 x [2 x float]]* %3, [42 x [2 x float]]* %4, [42 x [2 x float]]* %5, [42 x [2 x float]]* %6, [42 x [2 x float]]* %7, [42 x [2 x float]]* %8, [42 x [2 x float]]* %9, [42 x [2 x float]]* %10, [42 x [2 x float]]* %11, [42 x [2 x float]]* %12, [42 x [2 x float]]* %13, [42 x [2 x float]]* %14, [42 x [2 x float]]* %15, [42 x [2 x float]]* %16, [42 x [2 x float]]* %17, [42 x [2 x float]]* %18, [42 x [2 x float]]* %19, [42 x [2 x float]]* %20, [42 x [42 x float]]* %46, [2 x [42 x float]]* %21, [2 x [42 x float]]* %22, [2 x [42 x float]]* %23, [2 x [42 x float]]* %24, [2 x [42 x float]]* %25, [2 x [42 x float]]* %26, [2 x [42 x float]]* %27, [2 x [42 x float]]* %28, [2 x [42 x float]]* %29, [2 x [42 x float]]* %30, [2 x [42 x float]]* %31, [2 x [42 x float]]* %32, [2 x [42 x float]]* %33, [2 x [42 x float]]* %34, [2 x [42 x float]]* %35, [2 x [42 x float]]* %36, [2 x [42 x float]]* %37, [2 x [42 x float]]* %38, [2 x [42 x float]]* %39, [2 x [42 x float]]* %40, [2 x [42 x float]]* %41, [42 x [42 x float]]* null, [42 x [42 x float]]* %42)
  call void @free(i8* %43)
  call void @free(i8* %45)
  ret void
}

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { nounwind willreturn }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}
!datalayout.transforms.on.top = !{!6, !33}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = !{!7, !9, !11}
!7 = !{!8}
!8 = !{!"0", [42 x [42 x float]]* null}
!9 = !{!10}
!10 = !{!"array_partition", !"type=Block", !"dim=2", !"factor=21"}
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32}
!12 = !{!"0.0", [42 x [2 x float]]* null}
!13 = !{!"0.1", [42 x [2 x float]]* null}
!14 = !{!"0.2", [42 x [2 x float]]* null}
!15 = !{!"0.3", [42 x [2 x float]]* null}
!16 = !{!"0.4", [42 x [2 x float]]* null}
!17 = !{!"0.5", [42 x [2 x float]]* null}
!18 = !{!"0.6", [42 x [2 x float]]* null}
!19 = !{!"0.7", [42 x [2 x float]]* null}
!20 = !{!"0.8", [42 x [2 x float]]* null}
!21 = !{!"0.9", [42 x [2 x float]]* null}
!22 = !{!"0.10", [42 x [2 x float]]* null}
!23 = !{!"0.11", [42 x [2 x float]]* null}
!24 = !{!"0.12", [42 x [2 x float]]* null}
!25 = !{!"0.13", [42 x [2 x float]]* null}
!26 = !{!"0.14", [42 x [2 x float]]* null}
!27 = !{!"0.15", [42 x [2 x float]]* null}
!28 = !{!"0.16", [42 x [2 x float]]* null}
!29 = !{!"0.17", [42 x [2 x float]]* null}
!30 = !{!"0.18", [42 x [2 x float]]* null}
!31 = !{!"0.19", [42 x [2 x float]]* null}
!32 = !{!"0.20", [42 x [2 x float]]* null}
!33 = !{!34, !36, !38}
!34 = !{!35}
!35 = !{!"1", [42 x [42 x float]]* null}
!36 = !{!37}
!37 = !{!"array_partition", !"type=Block", !"dim=1", !"factor=21"}
!38 = !{!39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}
!39 = !{!"1.0", [2 x [42 x float]]* null}
!40 = !{!"1.1", [2 x [42 x float]]* null}
!41 = !{!"1.2", [2 x [42 x float]]* null}
!42 = !{!"1.3", [2 x [42 x float]]* null}
!43 = !{!"1.4", [2 x [42 x float]]* null}
!44 = !{!"1.5", [2 x [42 x float]]* null}
!45 = !{!"1.6", [2 x [42 x float]]* null}
!46 = !{!"1.7", [2 x [42 x float]]* null}
!47 = !{!"1.8", [2 x [42 x float]]* null}
!48 = !{!"1.9", [2 x [42 x float]]* null}
!49 = !{!"1.10", [2 x [42 x float]]* null}
!50 = !{!"1.11", [2 x [42 x float]]* null}
!51 = !{!"1.12", [2 x [42 x float]]* null}
!52 = !{!"1.13", [2 x [42 x float]]* null}
!53 = !{!"1.14", [2 x [42 x float]]* null}
!54 = !{!"1.15", [2 x [42 x float]]* null}
!55 = !{!"1.16", [2 x [42 x float]]* null}
!56 = !{!"1.17", [2 x [42 x float]]* null}
!57 = !{!"1.18", [2 x [42 x float]]* null}
!58 = !{!"1.19", [2 x [42 x float]]* null}
!59 = !{!"1.20", [2 x [42 x float]]* null}
!60 = !DILocation(line: 4, column: 2, scope: !61)
!61 = distinct !DISubprogram(name: "mmult_hw", linkageName: "_Z8mmult_hwPA42_fS0_S0_", scope: !62, file: !62, line: 3, type: !63, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !72, variables: !5)
!62 = !DIFile(filename: "../sources/hls/hls_float32_A_algo/mmult_algo.cpp", directory: "C:\5CINF3610_Lab2\5Chls_A_float32_algo")
!63 = !DISubroutineType(types: !64)
!64 = !{null, !65, !65, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 1344, elements: !70)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "mat_type", file: !68, line: 9, baseType: !69)
!68 = !DIFile(filename: "../sources/hls/hls_float32_A_algo/../common/float32/mmult_config.h", directory: "C:\5CINF3610_Lab2\5Chls_A_float32_algo")
!69 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!70 = !{!71}
!71 = !DISubrange(count: 42)
!72 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !73, producer: "AMD/Xilinx clang version 16.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !74, splitDebugInlining: false, gnuPubnames: true)
!73 = !DIFile(filename: "C:/INF3610_Lab2/hls_A_float32_algo/mmult_hw/hls/.autopilot/db\5Cmmult_algo.pp.0.cpp", directory: "C:\5CINF3610_Lab2\5Chls_A_float32_algo", checksumkind: CSK_MD5, checksum: "7f87db01e9e7a640032938e3b1403144")
!74 = !{!75}
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression(DW_OP_constu, 42, DW_OP_stack_value))
!76 = distinct !DIGlobalVariable(name: "DIM", scope: !72, file: !68, line: 7, type: !77, isLocal: true, isDefinition: true)
!77 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !78)
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
