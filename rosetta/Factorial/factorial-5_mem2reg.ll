; ModuleID = 'factorial-5.ll'
source_filename = "factorial-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fac_aux(i32 %n, i32 %acc) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %acc, metadata !13, metadata !DIExpression()), !dbg !12
  %cmp = icmp slt i32 %n, 1, !dbg !14
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !15

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !15

cond.false:                                       ; preds = %entry
  %sub = sub nsw i32 %n, 1, !dbg !16
  %mul = mul nsw i32 %acc, %n, !dbg !17
  %call = call i32 @fac_aux(i32 %sub, i32 %mul), !dbg !18
  br label %cond.end, !dbg !15

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %acc, %cond.true ], [ %call, %cond.false ], !dbg !15
  ret i32 %cond, !dbg !19
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fac_auxSafe(i32 %n, i32 %acc) #0 !dbg !20 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 %acc, metadata !23, metadata !DIExpression()), !dbg !22
  %cmp = icmp slt i32 %n, 0, !dbg !24
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !25

cond.true:                                        ; preds = %entry
  br label %cond.end4, !dbg !25

cond.false:                                       ; preds = %entry
  %cmp1 = icmp slt i32 %n, 1, !dbg !26
  br i1 %cmp1, label %cond.true2, label %cond.false3, !dbg !27

cond.true2:                                       ; preds = %cond.false
  br label %cond.end, !dbg !27

cond.false3:                                      ; preds = %cond.false
  %sub = sub nsw i32 %n, 1, !dbg !28
  %mul = mul nsw i32 %acc, %n, !dbg !29
  %call = call i32 @fac_aux(i32 %sub, i32 %mul), !dbg !30
  br label %cond.end, !dbg !27

cond.end:                                         ; preds = %cond.false3, %cond.true2
  %cond = phi i32 [ %acc, %cond.true2 ], [ %call, %cond.false3 ], !dbg !27
  br label %cond.end4, !dbg !25

cond.end4:                                        ; preds = %cond.end, %cond.true
  %cond5 = phi i32 [ -1, %cond.true ], [ %cond, %cond.end ], !dbg !25
  ret i32 %cond5, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %n) #0 !dbg !32 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call i32 @fac_aux(i32 %n, i32 1), !dbg !37
  ret i32 %call, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "factorial-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Factorial")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "fac_aux", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "acc", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 2, column: 14, scope: !7)
!15 = !DILocation(line: 2, column: 12, scope: !7)
!16 = !DILocation(line: 2, column: 36, scope: !7)
!17 = !DILocation(line: 2, column: 45, scope: !7)
!18 = !DILocation(line: 2, column: 26, scope: !7)
!19 = !DILocation(line: 2, column: 5, scope: !7)
!20 = distinct !DISubprogram(name: "fac_auxSafe", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "n", arg: 1, scope: !20, file: !1, line: 5, type: !10)
!22 = !DILocation(line: 0, scope: !20)
!23 = !DILocalVariable(name: "acc", arg: 2, scope: !20, file: !1, line: 5, type: !10)
!24 = !DILocation(line: 6, column: 13, scope: !20)
!25 = !DILocation(line: 6, column: 12, scope: !20)
!26 = !DILocation(line: 6, column: 25, scope: !20)
!27 = !DILocation(line: 6, column: 23, scope: !20)
!28 = !DILocation(line: 6, column: 47, scope: !20)
!29 = !DILocation(line: 6, column: 56, scope: !20)
!30 = !DILocation(line: 6, column: 37, scope: !20)
!31 = !DILocation(line: 6, column: 5, scope: !20)
!32 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 9, type: !33, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!10, !10}
!35 = !DILocalVariable(name: "n", arg: 1, scope: !32, file: !1, line: 9, type: !10)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocation(line: 10, column: 12, scope: !32)
!38 = !DILocation(line: 10, column: 5, scope: !32)
