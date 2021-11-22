; ModuleID = 'guess-the-number.c'
source_filename = "guess-the-number.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"I'm thinking of a number between 1 and 10.\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Try to guess it:\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Correct!\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"That's not my number. Try another guess:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %g = alloca i32, align 4
  %c = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %g, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i8* %c, metadata !15, metadata !DIExpression()), !dbg !17
  %call = call i64 @time(i64* null) #4, !dbg !18
  %conv = trunc i64 %call to i32, !dbg !18
  call void @srand(i32 %conv) #4, !dbg !19
  %call1 = call i32 @rand() #4, !dbg !20
  %rem = srem i32 %call1, 10, !dbg !21
  %add = add nsw i32 1, %rem, !dbg !22
  store i32 %add, i32* %n, align 4, !dbg !23
  %call2 = call i32 @puts(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0)), !dbg !24
  %call3 = call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !25
  br label %while.body, !dbg !26

while.body:                                       ; preds = %entry, %if.then, %if.end11
  %call4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* %g), !dbg !27
  %cmp = icmp ne i32 %call4, 1, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31, !cf.info !32

if.then:                                          ; preds = %while.body
  %call6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i8* %c), !dbg !33
  br label %while.body, !dbg !35, !llvm.loop !36

if.end:                                           ; preds = %while.body
  %0 = load i32, i32* %g, align 4, !dbg !38
  %1 = load i32, i32* %n, align 4, !dbg !40
  %cmp7 = icmp eq i32 %0, %1, !dbg !41
  br i1 %cmp7, label %if.then9, label %if.end11, !dbg !42, !cf.info !32

if.then9:                                         ; preds = %if.end
  %call10 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)), !dbg !43
  ret i32 0, !dbg !45

if.end11:                                         ; preds = %if.end
  %call12 = call i32 @puts(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.5, i64 0, i64 0)), !dbg !46
  br label %while.body, !dbg !26, !llvm.loop !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @puts(i8*) #3

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
!1 = !DIFile(filename: "guess-the-number.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Guess-the-number")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 9, scope: !7)
!13 = !DILocalVariable(name: "g", scope: !7, file: !1, line: 8, type: !10)
!14 = !DILocation(line: 8, column: 9, scope: !7)
!15 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 9, type: !16)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocation(line: 9, column: 10, scope: !7)
!18 = !DILocation(line: 11, column: 11, scope: !7)
!19 = !DILocation(line: 11, column: 5, scope: !7)
!20 = !DILocation(line: 12, column: 14, scope: !7)
!21 = !DILocation(line: 12, column: 21, scope: !7)
!22 = !DILocation(line: 12, column: 11, scope: !7)
!23 = !DILocation(line: 12, column: 7, scope: !7)
!24 = !DILocation(line: 14, column: 5, scope: !7)
!25 = !DILocation(line: 15, column: 5, scope: !7)
!26 = !DILocation(line: 17, column: 5, scope: !7)
!27 = !DILocation(line: 18, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 18, column: 13)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 15)
!30 = !DILocation(line: 18, column: 29, scope: !28)
!31 = !DILocation(line: 18, column: 13, scope: !29)
!32 = !{!"if"}
!33 = !DILocation(line: 20, column: 3, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 18, column: 35)
!35 = !DILocation(line: 21, column: 3, scope: !34)
!36 = distinct !{!36, !26, !37}
!37 = !DILocation(line: 29, column: 5, scope: !7)
!38 = !DILocation(line: 24, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !1, line: 24, column: 13)
!40 = !DILocation(line: 24, column: 18, scope: !39)
!41 = !DILocation(line: 24, column: 15, scope: !39)
!42 = !DILocation(line: 24, column: 13, scope: !29)
!43 = !DILocation(line: 25, column: 6, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !1, line: 24, column: 21)
!45 = !DILocation(line: 26, column: 6, scope: !44)
!46 = !DILocation(line: 28, column: 9, scope: !29)
