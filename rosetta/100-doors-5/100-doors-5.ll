; ModuleID = '100-doors-5.c'
source_filename = "100-doors-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"door %d open\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 1, i32* %i, align 4, !dbg !13
  br label %for.cond, !dbg !15

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !16
  %1 = load i32, i32* %i, align 4, !dbg !18
  %mul = mul nsw i32 %0, %1, !dbg !19
  %cmp = icmp sle i32 %mul, 100, !dbg !20
  br i1 %cmp, label %for.body, label %for.end, !dbg !21

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !22
  %3 = load i32, i32* %i, align 4, !dbg !23
  %mul1 = mul nsw i32 %2, %3, !dbg !24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %mul1), !dbg !25
  br label %for.inc, !dbg !25

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !26
  %inc = add nsw i32 %4, 1, !dbg !26
  store i32 %inc, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !27, !llvm.loop !28

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "100-doors-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/100-doors-5")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 6, scope: !7)
!13 = !DILocation(line: 6, column: 9, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!15 = !DILocation(line: 6, column: 7, scope: !14)
!16 = !DILocation(line: 6, column: 14, scope: !17)
!17 = distinct !DILexicalBlock(scope: !14, file: !1, line: 6, column: 2)
!18 = !DILocation(line: 6, column: 18, scope: !17)
!19 = !DILocation(line: 6, column: 16, scope: !17)
!20 = !DILocation(line: 6, column: 20, scope: !17)
!21 = !DILocation(line: 6, column: 2, scope: !14)
!22 = !DILocation(line: 7, column: 28, scope: !17)
!23 = !DILocation(line: 7, column: 32, scope: !17)
!24 = !DILocation(line: 7, column: 30, scope: !17)
!25 = !DILocation(line: 7, column: 3, scope: !17)
!26 = !DILocation(line: 6, column: 29, scope: !17)
!27 = !DILocation(line: 6, column: 2, scope: !17)
!28 = distinct !{!28, !21, !29}
!29 = !DILocation(line: 7, column: 33, scope: !14)
!30 = !DILocation(line: 9, column: 2, scope: !7)
