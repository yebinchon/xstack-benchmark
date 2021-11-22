; ModuleID = 'gray-code-1.ll'
source_filename = "gray-code-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gray_encode(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  %shr = ashr i32 %n, 1, !dbg !13
  %xor = xor i32 %n, %shr, !dbg !14
  ret i32 %xor, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gray_decode(i32 %n) #0 !dbg !16 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %n, metadata !19, metadata !DIExpression()), !dbg !18
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %while.body, %entry
  %p.0 = phi i32 [ %n, %entry ], [ %xor, %while.body ], !dbg !18
  %n.addr.0 = phi i32 [ %n, %entry ], [ %shr, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !19, metadata !DIExpression()), !dbg !18
  %shr = ashr i32 %n.addr.0, 1, !dbg !21
  call void @llvm.dbg.value(metadata i32 %shr, metadata !17, metadata !DIExpression()), !dbg !18
  %tobool = icmp ne i32 %shr, 0, !dbg !20
  br i1 %tobool, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  %xor = xor i32 %p.0, %shr, !dbg !22
  call void @llvm.dbg.value(metadata i32 %xor, metadata !19, metadata !DIExpression()), !dbg !18
  br label %while.cond, !dbg !20, !llvm.loop !23

while.end:                                        ; preds = %while.cond
  ret i32 %p.0, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "gray-code-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Gray-code")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "gray_encode", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 2, column: 19, scope: !7)
!14 = !DILocation(line: 2, column: 14, scope: !7)
!15 = !DILocation(line: 2, column: 5, scope: !7)
!16 = distinct !DISubprogram(name: "gray_decode", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "n", arg: 1, scope: !16, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "p", scope: !16, file: !1, line: 6, type: !10)
!20 = !DILocation(line: 7, column: 5, scope: !16)
!21 = !DILocation(line: 7, column: 14, scope: !16)
!22 = !DILocation(line: 7, column: 23, scope: !16)
!23 = distinct !{!23, !20, !24}
!24 = !DILocation(line: 7, column: 26, scope: !16)
!25 = !DILocation(line: 8, column: 5, scope: !16)
