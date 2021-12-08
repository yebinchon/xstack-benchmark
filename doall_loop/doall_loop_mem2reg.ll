; ModuleID = 'doall_loop.ll'
source_filename = "doall_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global [10 x i32] [i32 2, i32 4, i32 10, i32 2, i32 5, i32 0, i32 9, i32 6, i32 7, i32 9], align 16, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !14 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 0, metadata !19, metadata !DIExpression()), !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %sum.1, %for.inc ], !dbg !18
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !21
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !17, metadata !DIExpression()), !dbg !18
  %cmp = icmp slt i32 %i.0, 10, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !25

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !26
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @x, i64 0, i64 %idxprom, !dbg !26
  %0 = load i32, i32* %arrayidx, align 4, !dbg !26
  %cmp1 = icmp sgt i32 %0, 3, !dbg !29
  br i1 %cmp1, label %if.then, label %if.end, !dbg !30, !cf.info !31

if.then:                                          ; preds = %for.body
  %idxprom2 = sext i32 %i.0 to i64, !dbg !32
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* @x, i64 0, i64 %idxprom2, !dbg !32
  %1 = load i32, i32* %arrayidx3, align 4, !dbg !32
  %add = add nsw i32 %sum.0, %1, !dbg !33
  call void @llvm.dbg.value(metadata i32 %add, metadata !17, metadata !DIExpression()), !dbg !18
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %for.body
  %sum.1 = phi i32 [ %add, %if.then ], [ %sum.0, %for.body ], !dbg !18
  call void @llvm.dbg.value(metadata i32 %sum.1, metadata !17, metadata !DIExpression()), !dbg !18
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !36
  call void @llvm.dbg.value(metadata i32 %inc, metadata !19, metadata !DIExpression()), !dbg !21
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %sum.0), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!18 = !DILocation(line: 0, scope: !14)
!19 = !DILocalVariable(name: "i", scope: !20, file: !3, line: 5, type: !7)
!20 = distinct !DILexicalBlock(scope: !14, file: !3, line: 5, column: 3)
!21 = !DILocation(line: 0, scope: !20)
!22 = !DILocation(line: 5, column: 7, scope: !20)
!23 = !DILocation(line: 5, column: 17, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 5, column: 3)
!25 = !DILocation(line: 5, column: 3, scope: !20)
!26 = !DILocation(line: 6, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !3, line: 6, column: 8)
!28 = distinct !DILexicalBlock(scope: !24, file: !3, line: 5, column: 26)
!29 = !DILocation(line: 6, column: 12, scope: !27)
!30 = !DILocation(line: 6, column: 8, scope: !28)
!31 = !{!"if"}
!32 = !DILocation(line: 7, column: 12, scope: !27)
!33 = !DILocation(line: 7, column: 10, scope: !27)
!34 = !DILocation(line: 7, column: 7, scope: !27)
!35 = !DILocation(line: 8, column: 3, scope: !28)
!36 = !DILocation(line: 5, column: 23, scope: !24)
!37 = !DILocation(line: 5, column: 3, scope: !24)
!38 = distinct !{!38, !25, !39}
!39 = !DILocation(line: 8, column: 3, scope: !20)
!40 = !DILocation(line: 10, column: 3, scope: !14)
!41 = !DILocation(line: 11, column: 3, scope: !14)
