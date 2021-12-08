; ModuleID = '100-doors-3.ll'
source_filename = "100-doors-3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"door #%d\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c" is open.\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c" is closed.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 1, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 3, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 1, metadata !14, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !15

for.cond:                                         ; preds = %for.inc, %entry
  %increment.0 = phi i32 [ 3, %entry ], [ %increment.1, %for.inc ], !dbg !12
  %square.0 = phi i32 [ 1, %entry ], [ %square.1, %for.inc ], !dbg !12
  %door.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !17
  call void @llvm.dbg.value(metadata i32 %door.0, metadata !14, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %square.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %increment.0, metadata !13, metadata !DIExpression()), !dbg !12
  %cmp = icmp sle i32 %door.0, 100, !dbg !18
  br i1 %cmp, label %for.body, label %for.end, !dbg !20

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %door.0), !dbg !21
  %cmp1 = icmp eq i32 %door.0, %square.0, !dbg !23
  br i1 %cmp1, label %if.then, label %if.else, !dbg !25, !cf.info !26

if.then:                                          ; preds = %for.body
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0)), !dbg !27
  %add = add nsw i32 %square.0, %increment.0, !dbg !29
  call void @llvm.dbg.value(metadata i32 %add, metadata !11, metadata !DIExpression()), !dbg !12
  %add3 = add nsw i32 %increment.0, 2, !dbg !30
  call void @llvm.dbg.value(metadata i32 %add3, metadata !13, metadata !DIExpression()), !dbg !12
  br label %if.end, !dbg !31

if.else:                                          ; preds = %for.body
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !32
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %increment.1 = phi i32 [ %add3, %if.then ], [ %increment.0, %if.else ], !dbg !12
  %square.1 = phi i32 [ %add, %if.then ], [ %square.0, %if.else ], !dbg !12
  call void @llvm.dbg.value(metadata i32 %square.1, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %increment.1, metadata !13, metadata !DIExpression()), !dbg !12
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %door.0, 1, !dbg !34
  call void @llvm.dbg.value(metadata i32 %inc, metadata !14, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "100-doors-3.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/100-doors-3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "square", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "increment", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocalVariable(name: "door", scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 6, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 3)
!17 = !DILocation(line: 0, scope: !16)
!18 = !DILocation(line: 6, column: 23, scope: !19)
!19 = distinct !DILexicalBlock(scope: !16, file: !1, line: 6, column: 3)
!20 = !DILocation(line: 6, column: 3, scope: !16)
!21 = !DILocation(line: 8, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 7, column: 3)
!23 = !DILocation(line: 9, column: 14, scope: !24)
!24 = distinct !DILexicalBlock(scope: !22, file: !1, line: 9, column: 9)
!25 = !DILocation(line: 9, column: 9, scope: !22)
!26 = !{!"if"}
!27 = !DILocation(line: 11, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 5)
!29 = !DILocation(line: 12, column: 14, scope: !28)
!30 = !DILocation(line: 13, column: 17, scope: !28)
!31 = !DILocation(line: 14, column: 5, scope: !28)
!32 = !DILocation(line: 16, column: 7, scope: !24)
!33 = !DILocation(line: 17, column: 3, scope: !22)
!34 = !DILocation(line: 6, column: 31, scope: !19)
!35 = !DILocation(line: 6, column: 3, scope: !19)
!36 = distinct !{!36, !20, !37}
!37 = !DILocation(line: 17, column: 3, scope: !16)
!38 = !DILocation(line: 18, column: 3, scope: !7)
