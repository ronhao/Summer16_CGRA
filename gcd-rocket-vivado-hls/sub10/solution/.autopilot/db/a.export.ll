; ModuleID = '/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls/sub10/solution/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sub10_str = internal unnamed_addr constant [6 x i8] c"sub10\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str2 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [6 x i8] c"ap_hs\00", align 1

define void @sub10(i160* %io_cmd_V, i74* %io_resp_V) {
  call void (...)* @_ssdm_op_SpecBitsMap(i74* %io_resp_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i160* %io_cmd_V), !map !29
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sub10_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i74* %io_resp_V, [6 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i160* %io_cmd_V, [6 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %tmp1 = call i160 @_ssdm_op_Read.ap_hs.volatile.i160P(i160* %io_cmd_V)
  %tmp_rd_V = call i5 @_ssdm_op_PartSelect.i5.i160.i32.i32(i160 %tmp1, i32 20, i32 24)
  %a_V = call i64 @_ssdm_op_PartSelect.i64.i160.i32.i32(i160 %tmp1, i32 32, i32 95)
  %b_V = call i64 @_ssdm_op_PartSelect.i64.i160.i32.i32(i160 %tmp1, i32 96, i32 159)
  %tmp = add i64 %a_V, 10
  %a_V_2 = sub i64 %tmp, %b_V
  %tmp_1 = call i74 @_ssdm_op_BitConcatenate.i74.i64.i5.i5(i64 %a_V_2, i5 %tmp_rd_V, i5 0)
  call void @_ssdm_op_Write.ap_hs.volatile.i74P(i74* %io_resp_V, i74 %tmp_1)
  ret void
}

declare i160 @llvm.part.select.i160(i160, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_hs.volatile.i74P(i74*, i74) {
entry:
  store i74 %1, i74* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i160 @_ssdm_op_Read.ap_hs.volatile.i160P(i160*) {
entry:
  %empty = load i160* %0
  ret i160 %empty
}

define weak i64 @_ssdm_op_PartSelect.i64.i160.i32.i32(i160, i32, i32) nounwind readnone {
entry:
  %empty = call i160 @llvm.part.select.i160(i160 %0, i32 %1, i32 %2)
  %empty_4 = trunc i160 %empty to i64
  ret i64 %empty_4
}

define weak i5 @_ssdm_op_PartSelect.i5.i160.i32.i32(i160, i32, i32) nounwind readnone {
entry:
  %empty = call i160 @llvm.part.select.i160(i160 %0, i32 %1, i32 %2)
  %empty_5 = trunc i160 %empty to i5
  ret i5 %empty_5
}

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

define weak i74 @_ssdm_op_BitConcatenate.i74.i64.i5.i5(i64, i5, i5) nounwind readnone {
entry:
  %empty = zext i5 %1 to i10
  %empty_6 = zext i5 %2 to i10
  %empty_7 = shl i10 %empty, 5
  %empty_8 = or i10 %empty_7, %empty_6
  %empty_9 = zext i64 %0 to i74
  %empty_10 = zext i10 %empty_8 to i74
  %empty_11 = shl i74 %empty_9, 10
  %empty_12 = or i74 %empty_11, %empty_10
  ret i74 %empty_12
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8, metadata !11, metadata !14, metadata !17, metadata !20, metadata !23, metadata !26}
!8 = metadata !{i32 0, i32 0, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"io_resp.V.io_busy.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!11 = metadata !{i32 1, i32 1, metadata !12}
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !"io_resp.V.io_interrupt.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!14 = metadata !{i32 2, i32 2, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"io_resp.V.io_autl_acquire_ready.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!17 = metadata !{i32 3, i32 3, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"io_resp.V.io_autl_acquire_valid.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!20 = metadata !{i32 4, i32 4, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"io_resp.V.io_mem_req_valid.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!23 = metadata !{i32 5, i32 9, metadata !24}
!24 = metadata !{metadata !25}
!25 = metadata !{metadata !"io_resp.V.rd.V", metadata !5, metadata !"uint5", i32 0, i32 4}
!26 = metadata !{i32 10, i32 73, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"io_resp.V.data.V", metadata !5, metadata !"uint64", i32 0, i32 63}
!29 = metadata !{metadata !30, metadata !33, metadata !36, metadata !39, metadata !42, metadata !45, metadata !48, metadata !51, metadata !54, metadata !57}
!30 = metadata !{i32 0, i32 6, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"io_cmd.V.inst_funct.V", metadata !5, metadata !"uint7", i32 0, i32 6}
!33 = metadata !{i32 7, i32 11, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"io_cmd.V.inst_rs2.V", metadata !5, metadata !"uint5", i32 0, i32 4}
!36 = metadata !{i32 12, i32 16, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"io_cmd.V.inst_rs1.V", metadata !5, metadata !"uint5", i32 0, i32 4}
!39 = metadata !{i32 17, i32 17, metadata !40}
!40 = metadata !{metadata !41}
!41 = metadata !{metadata !"io_cmd.V.inst_xd.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!42 = metadata !{i32 18, i32 18, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"io_cmd.V.inst_xs1.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!45 = metadata !{i32 19, i32 19, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"io_cmd.V.inst_xs2.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!48 = metadata !{i32 20, i32 24, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"io_cmd.V.inst_rd.V", metadata !5, metadata !"uint5", i32 0, i32 4}
!51 = metadata !{i32 25, i32 31, metadata !52}
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !"io_cmd.V.inst_opcode.V", metadata !5, metadata !"uint7", i32 0, i32 6}
!54 = metadata !{i32 32, i32 95, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"io_cmd.V.rs1.V", metadata !5, metadata !"uint64", i32 0, i32 63}
!57 = metadata !{i32 96, i32 159, metadata !58}
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !"io_cmd.V.rs2.V", metadata !5, metadata !"uint64", i32 0, i32 63}
