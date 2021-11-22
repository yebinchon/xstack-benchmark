; ModuleID = 'loop-over-multiple-arrays-simultaneously.c'
source_filename = "loop-over-multiple-arrays-simultaneously.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a1 = dso_local global [3 x i8] c"abc", align 1, !dbg !0
@a2 = dso_local global [3 x i8] c"ABC", align 1, !dbg !6
@a3 = dso_local global [3 x i32] [i32 1, i32 2, i32 3], align 4, !dbg !12
@.str = private unnamed_addr constant [8 x i8] c"%c%c%i\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 3, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !31
  %idxprom = sext i32 %1 to i64, !dbg !33
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* @a1, i64 0, i64 %idxprom, !dbg !33
  %2 = load i8, i8* %arrayidx, align 1, !dbg !33
  %conv = sext i8 %2 to i32, !dbg !33
  %3 = load i32, i32* %i, align 4, !dbg !34
  %idxprom1 = sext i32 %3 to i64, !dbg !35
  %arrayidx2 = getelementptr inbounds [3 x i8], [3 x i8]* @a2, i64 0, i64 %idxprom1, !dbg !35
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !35
  %conv3 = sext i8 %4 to i32, !dbg !35
  %5 = load i32, i32* %i, align 4, !dbg !36
  %idxprom4 = sext i32 %5 to i64, !dbg !37
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* @a3, i64 0, i64 %idxprom4, !dbg !37
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv3, i32 %6), !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %7, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %retval, align 4, !dbg !44
  ret i32 %8, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a1", scope: !2, file: !3, line: 3, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "loop-over-multiple-arrays-simultaneously.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Loop-over-multiple-arrays-simultaneously")
!4 = !{}
!5 = !{!0, !6, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "a2", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 24, elements: !10)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "a3", scope: !2, file: !3, line: 5, type: !14, isLocal: false, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 96, elements: !10)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!20 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !21, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{!15}
!23 = !DILocalVariable(name: "i", scope: !24, file: !3, line: 8, type: !15)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 8, column: 5)
!25 = !DILocation(line: 8, column: 14, scope: !24)
!26 = !DILocation(line: 8, column: 10, scope: !24)
!27 = !DILocation(line: 8, column: 21, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !3, line: 8, column: 5)
!29 = !DILocation(line: 8, column: 23, scope: !28)
!30 = !DILocation(line: 8, column: 5, scope: !24)
!31 = !DILocation(line: 9, column: 31, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 8, column: 33)
!33 = !DILocation(line: 9, column: 28, scope: !32)
!34 = !DILocation(line: 9, column: 38, scope: !32)
!35 = !DILocation(line: 9, column: 35, scope: !32)
!36 = !DILocation(line: 9, column: 45, scope: !32)
!37 = !DILocation(line: 9, column: 42, scope: !32)
!38 = !DILocation(line: 9, column: 9, scope: !32)
!39 = !DILocation(line: 10, column: 5, scope: !32)
!40 = !DILocation(line: 8, column: 29, scope: !28)
!41 = !DILocation(line: 8, column: 5, scope: !28)
!42 = distinct !{!42, !30, !43}
!43 = !DILocation(line: 10, column: 5, scope: !24)
!44 = !DILocation(line: 11, column: 1, scope: !20)
