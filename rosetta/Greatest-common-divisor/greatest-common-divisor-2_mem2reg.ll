; ModuleID = 'greatest-common-divisor-2.ll'
source_filename = "greatest-common-divisor-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %u, i32 %v) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %u, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %v, metadata !13, metadata !DIExpression()), !dbg !12
  %cmp = icmp ne i32 %v, 0, !dbg !14
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !15

cond.true:                                        ; preds = %entry
  %rem = srem i32 %u, %v, !dbg !16
  %call = call i32 @gcd(i32 %v, i32 %rem), !dbg !17
  br label %cond.end, !dbg !15

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !15

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %u, %cond.false ], !dbg !15
  ret i32 %cond, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "greatest-common-divisor-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Greatest-common-divisor")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "u", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "v", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 2, column: 11, scope: !7)
!15 = !DILocation(line: 2, column: 8, scope: !7)
!16 = !DILocation(line: 2, column: 25, scope: !7)
!17 = !DILocation(line: 2, column: 17, scope: !7)
!18 = !DILocation(line: 2, column: 1, scope: !7)
