; ModuleID = 'doall_loop.bc'
source_filename = "doall_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global [10 x i32] [i32 2, i32 4, i32 10, i32 2, i32 5, i32 0, i32 9, i32 6, i32 7, i32 9], align 16, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %sum, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %0, 10, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !27
  %idxprom = sext i32 %1 to i64, !dbg !30
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @x, i64 0, i64 %idxprom, !dbg !30
  %2 = load i32, i32* %arrayidx, align 4, !dbg !30
  %cmp1 = icmp sgt i32 %2, 3, !dbg !31
  br i1 %cmp1, label %if.then, label %if.end, !dbg !32, !cf.info !33

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !34
  %idxprom2 = sext i32 %3 to i64, !dbg !35
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* @x, i64 0, i64 %idxprom2, !dbg !35
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !35
  %5 = load i32, i32* %sum, align 4, !dbg !36
  %add = add nsw i32 %5, %4, !dbg !36
  store i32 %add, i32* %sum, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4, !dbg !39
  %inc = add nsw i32 %6, 1, !dbg !39
  store i32 %inc, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %sum, align 4, !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %7), !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !3, line: 1, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "doall_loop.c", directory: "/scratch/yc0769/xstack_benchmark/doall_loop")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !8)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9}
!9 = !DISubrange(count: 10)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!14 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 3, type: !15, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7}
!17 = !DILocalVariable(name: "sum", scope: !14, file: !3, line: 4, type: !7)
!18 = !DILocation(line: 4, column: 7, scope: !14)
!19 = !DILocalVariable(name: "i", scope: !20, file: !3, line: 5, type: !7)
!20 = distinct !DILexicalBlock(scope: !14, file: !3, line: 5, column: 3)
!21 = !DILocation(line: 5, column: 11, scope: !20)
!22 = !DILocation(line: 5, column: 7, scope: !20)
!23 = !DILocation(line: 5, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 5, column: 3)
!25 = !DILocation(line: 5, column: 17, scope: !24)
!26 = !DILocation(line: 5, column: 3, scope: !20)
!27 = !DILocation(line: 6, column: 10, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 6, column: 8)
!29 = distinct !DILexicalBlock(scope: !24, file: !3, line: 5, column: 26)
!30 = !DILocation(line: 6, column: 8, scope: !28)
!31 = !DILocation(line: 6, column: 12, scope: !28)
!32 = !DILocation(line: 6, column: 8, scope: !29)
!33 = !{!"if"}
!34 = !DILocation(line: 7, column: 14, scope: !28)
!35 = !DILocation(line: 7, column: 12, scope: !28)
!36 = !DILocation(line: 7, column: 10, scope: !28)
!37 = !DILocation(line: 7, column: 7, scope: !28)
!38 = !DILocation(line: 8, column: 3, scope: !29)
!39 = !DILocation(line: 5, column: 23, scope: !24)
!40 = !DILocation(line: 5, column: 3, scope: !24)
!41 = distinct !{!41, !26, !42}
!42 = !DILocation(line: 8, column: 3, scope: !20)
!43 = !DILocation(line: 10, column: 18, scope: !14)
!44 = !DILocation(line: 10, column: 3, scope: !14)
!45 = !DILocation(line: 11, column: 3, scope: !14)
