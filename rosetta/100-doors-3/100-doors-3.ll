; ModuleID = '100-doors-3.bc'
source_filename = "100-doors-3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"door #%d\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c" is open.\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c" is closed.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %square = alloca i32, align 4
  %increment = alloca i32, align 4
  %door = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %square, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 1, i32* %square, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %increment, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 3, i32* %increment, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %door, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 1, i32* %door, align 4, !dbg !17
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %door, align 4, !dbg !20
  %cmp = icmp sle i32 %0, 100, !dbg !22
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %door, align 4, !dbg !24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !26
  %2 = load i32, i32* %door, align 4, !dbg !27
  %3 = load i32, i32* %square, align 4, !dbg !29
  %cmp1 = icmp eq i32 %2, %3, !dbg !30
  br i1 %cmp1, label %if.then, label %if.else, !dbg !31, !cf.info !32

if.then:                                          ; preds = %for.body
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0)), !dbg !33
  %4 = load i32, i32* %increment, align 4, !dbg !35
  %5 = load i32, i32* %square, align 4, !dbg !36
  %add = add nsw i32 %5, %4, !dbg !36
  store i32 %add, i32* %square, align 4, !dbg !36
  %6 = load i32, i32* %increment, align 4, !dbg !37
  %add3 = add nsw i32 %6, 2, !dbg !37
  store i32 %add3, i32* %increment, align 4, !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %for.body
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %door, align 4, !dbg !41
  %inc = add nsw i32 %7, 1, !dbg !41
  store i32 %inc, i32* %door, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !45
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
!12 = !DILocation(line: 5, column: 7, scope: !7)
!13 = !DILocalVariable(name: "increment", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 19, scope: !7)
!15 = !DILocalVariable(name: "door", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 34, scope: !7)
!17 = !DILocation(line: 6, column: 13, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 3)
!19 = !DILocation(line: 6, column: 8, scope: !18)
!20 = !DILocation(line: 6, column: 18, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 3)
!22 = !DILocation(line: 6, column: 23, scope: !21)
!23 = !DILocation(line: 6, column: 3, scope: !18)
!24 = !DILocation(line: 8, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 7, column: 3)
!26 = !DILocation(line: 8, column: 5, scope: !25)
!27 = !DILocation(line: 9, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 9, column: 9)
!29 = !DILocation(line: 9, column: 17, scope: !28)
!30 = !DILocation(line: 9, column: 14, scope: !28)
!31 = !DILocation(line: 9, column: 9, scope: !25)
!32 = !{!"if"}
!33 = !DILocation(line: 11, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 10, column: 5)
!35 = !DILocation(line: 12, column: 17, scope: !34)
!36 = !DILocation(line: 12, column: 14, scope: !34)
!37 = !DILocation(line: 13, column: 17, scope: !34)
!38 = !DILocation(line: 14, column: 5, scope: !34)
!39 = !DILocation(line: 16, column: 7, scope: !28)
!40 = !DILocation(line: 17, column: 3, scope: !25)
!41 = !DILocation(line: 6, column: 31, scope: !21)
!42 = !DILocation(line: 6, column: 3, scope: !21)
!43 = distinct !{!43, !23, !44}
!44 = !DILocation(line: 17, column: 3, scope: !18)
!45 = !DILocation(line: 18, column: 3, scope: !7)
