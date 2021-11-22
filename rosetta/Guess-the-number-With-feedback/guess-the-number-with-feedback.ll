; ModuleID = 'guess-the-number-with-feedback.c'
source_filename = "guess-the-number-with-feedback.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Guess the number between %d and %d: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"You guessed correctly!\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Your guess was too %s.\0ATry again: \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"high\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"low\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %number = alloca i32, align 4
  %guess = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %number, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %guess, metadata !13, metadata !DIExpression()), !dbg !14
  %call = call i64 @time(i64* null) #4, !dbg !15
  %conv = trunc i64 %call to i32, !dbg !15
  call void @srand(i32 %conv) #4, !dbg !16
  %call1 = call i32 @rand() #4, !dbg !17
  %rem = srem i32 %call1, 101, !dbg !18
  %add = add nsw i32 0, %rem, !dbg !19
  store i32 %add, i32* %number, align 4, !dbg !20
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i32 0, i32 100), !dbg !21
  br label %while.cond, !dbg !22

while.cond:                                       ; preds = %if.end, %entry
  %call3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %guess), !dbg !23
  %cmp = icmp eq i32 %call3, 1, !dbg !24
  br i1 %cmp, label %while.body, label %while.end, !dbg !22

while.body:                                       ; preds = %while.cond
  %0 = load i32, i32* %number, align 4, !dbg !25
  %1 = load i32, i32* %guess, align 4, !dbg !28
  %cmp5 = icmp eq i32 %0, %1, !dbg !29
  br i1 %cmp5, label %if.then, label %if.end, !dbg !30, !cf.info !31

if.then:                                          ; preds = %while.body
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0)), !dbg !32
  br label %while.end, !dbg !34

if.end:                                           ; preds = %while.body
  %2 = load i32, i32* %number, align 4, !dbg !35
  %3 = load i32, i32* %guess, align 4, !dbg !36
  %cmp8 = icmp slt i32 %2, %3, !dbg !37
  %4 = zext i1 %cmp8 to i64, !dbg !35
  %cond = select i1 %cmp8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), !dbg !35
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i8* %cond), !dbg !38
  br label %while.cond, !dbg !22, !llvm.loop !39

while.end:                                        ; preds = %if.then, %while.cond
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "guess-the-number-with-feedback.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Guess-the-number-With-feedback")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !8, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "number", scope: !7, file: !1, line: 9, type: !10)
!12 = !DILocation(line: 9, column: 7, scope: !7)
!13 = !DILocalVariable(name: "guess", scope: !7, file: !1, line: 9, type: !10)
!14 = !DILocation(line: 9, column: 15, scope: !7)
!15 = !DILocation(line: 11, column: 10, scope: !7)
!16 = !DILocation(line: 11, column: 3, scope: !7)
!17 = !DILocation(line: 12, column: 26, scope: !7)
!18 = !DILocation(line: 12, column: 33, scope: !7)
!19 = !DILocation(line: 12, column: 24, scope: !7)
!20 = !DILocation(line: 12, column: 10, scope: !7)
!21 = !DILocation(line: 14, column: 3, scope: !7)
!22 = !DILocation(line: 16, column: 3, scope: !7)
!23 = !DILocation(line: 16, column: 10, scope: !7)
!24 = !DILocation(line: 16, column: 32, scope: !7)
!25 = !DILocation(line: 17, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 17, column: 9)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 38)
!28 = !DILocation(line: 17, column: 19, scope: !26)
!29 = !DILocation(line: 17, column: 16, scope: !26)
!30 = !DILocation(line: 17, column: 9, scope: !27)
!31 = !{!"if"}
!32 = !DILocation(line: 18, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !1, line: 17, column: 26)
!34 = !DILocation(line: 19, column: 7, scope: !33)
!35 = !DILocation(line: 21, column: 52, scope: !27)
!36 = !DILocation(line: 21, column: 61, scope: !27)
!37 = !DILocation(line: 21, column: 59, scope: !27)
!38 = !DILocation(line: 21, column: 5, scope: !27)
!39 = distinct !{!39, !22, !40}
!40 = !DILocation(line: 22, column: 3, scope: !7)
!41 = !DILocation(line: 24, column: 3, scope: !7)
