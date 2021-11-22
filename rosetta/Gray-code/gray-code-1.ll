; ModuleID = 'gray-code-1.c'
source_filename = "gray-code-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gray_encode(i32 %n) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %n.addr, align 4, !dbg !13
  %1 = load i32, i32* %n.addr, align 4, !dbg !14
  %shr = ashr i32 %1, 1, !dbg !15
  %xor = xor i32 %0, %shr, !dbg !16
  ret i32 %xor, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gray_decode(i32 %n) #0 !dbg !18 {
entry:
  %n.addr = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %p, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %n.addr, align 4, !dbg !23
  store i32 %0, i32* %p, align 4, !dbg !22
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !25
  %shr = ashr i32 %1, 1, !dbg !25
  store i32 %shr, i32* %n.addr, align 4, !dbg !25
  %tobool = icmp ne i32 %shr, 0, !dbg !24
  br i1 %tobool, label %while.body, label %while.end, !dbg !24

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %n.addr, align 4, !dbg !26
  %3 = load i32, i32* %p, align 4, !dbg !27
  %xor = xor i32 %3, %2, !dbg !27
  store i32 %xor, i32* %p, align 4, !dbg !27
  br label %while.cond, !dbg !24, !llvm.loop !28

while.end:                                        ; preds = %while.cond
  %4 = load i32, i32* %p, align 4, !dbg !29
  ret i32 %4, !dbg !30
}

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
!12 = !DILocation(line: 1, column: 21, scope: !7)
!13 = !DILocation(line: 2, column: 12, scope: !7)
!14 = !DILocation(line: 2, column: 17, scope: !7)
!15 = !DILocation(line: 2, column: 19, scope: !7)
!16 = !DILocation(line: 2, column: 14, scope: !7)
!17 = !DILocation(line: 2, column: 5, scope: !7)
!18 = distinct !DISubprogram(name: "gray_decode", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 21, scope: !18)
!21 = !DILocalVariable(name: "p", scope: !18, file: !1, line: 6, type: !10)
!22 = !DILocation(line: 6, column: 9, scope: !18)
!23 = !DILocation(line: 6, column: 13, scope: !18)
!24 = !DILocation(line: 7, column: 5, scope: !18)
!25 = !DILocation(line: 7, column: 14, scope: !18)
!26 = !DILocation(line: 7, column: 26, scope: !18)
!27 = !DILocation(line: 7, column: 23, scope: !18)
!28 = distinct !{!28, !24, !26}
!29 = !DILocation(line: 8, column: 12, scope: !18)
!30 = !DILocation(line: 8, column: 5, scope: !18)
