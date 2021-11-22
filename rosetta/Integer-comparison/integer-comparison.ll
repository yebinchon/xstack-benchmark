; ModuleID = 'integer-comparison.c'
source_filename = "integer-comparison.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"%d is less than %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"%d is equal to %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"%d is greater than %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %b, metadata !13, metadata !DIExpression()), !dbg !14
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32* %a, i32* %b), !dbg !15
  %0 = load i32, i32* %a, align 4, !dbg !16
  %1 = load i32, i32* %b, align 4, !dbg !18
  %cmp = icmp slt i32 %0, %1, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !20, !cf.info !21

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !22
  %3 = load i32, i32* %b, align 4, !dbg !23
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), i32 %2, i32 %3), !dbg !24
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %a, align 4, !dbg !25
  %5 = load i32, i32* %b, align 4, !dbg !27
  %cmp2 = icmp eq i32 %4, %5, !dbg !28
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !29, !cf.info !21

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !30
  %7 = load i32, i32* %b, align 4, !dbg !31
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i32 %6, i32 %7), !dbg !32
  br label %if.end5, !dbg !32

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load i32, i32* %a, align 4, !dbg !33
  %9 = load i32, i32* %b, align 4, !dbg !35
  %cmp6 = icmp sgt i32 %8, %9, !dbg !36
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !37, !cf.info !21

if.then7:                                         ; preds = %if.end5
  %10 = load i32, i32* %a, align 4, !dbg !38
  %11 = load i32, i32* %b, align 4, !dbg !39
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i32 %10, i32 %11), !dbg !40
  br label %if.end9, !dbg !40

if.end9:                                          ; preds = %if.then7, %if.end5
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "integer-comparison.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Integer-comparison")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 7, scope: !7)
!13 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 10, scope: !7)
!15 = !DILocation(line: 6, column: 3, scope: !7)
!16 = !DILocation(line: 8, column: 7, scope: !17)
!17 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 7)
!18 = !DILocation(line: 8, column: 11, scope: !17)
!19 = !DILocation(line: 8, column: 9, scope: !17)
!20 = !DILocation(line: 8, column: 7, scope: !7)
!21 = !{!"if"}
!22 = !DILocation(line: 9, column: 36, scope: !17)
!23 = !DILocation(line: 9, column: 39, scope: !17)
!24 = !DILocation(line: 9, column: 5, scope: !17)
!25 = !DILocation(line: 11, column: 7, scope: !26)
!26 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 7)
!27 = !DILocation(line: 11, column: 12, scope: !26)
!28 = !DILocation(line: 11, column: 9, scope: !26)
!29 = !DILocation(line: 11, column: 7, scope: !7)
!30 = !DILocation(line: 12, column: 35, scope: !26)
!31 = !DILocation(line: 12, column: 38, scope: !26)
!32 = !DILocation(line: 12, column: 5, scope: !26)
!33 = !DILocation(line: 14, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 7)
!35 = !DILocation(line: 14, column: 11, scope: !34)
!36 = !DILocation(line: 14, column: 9, scope: !34)
!37 = !DILocation(line: 14, column: 7, scope: !7)
!38 = !DILocation(line: 15, column: 39, scope: !34)
!39 = !DILocation(line: 15, column: 42, scope: !34)
!40 = !DILocation(line: 15, column: 5, scope: !34)
!41 = !DILocation(line: 17, column: 3, scope: !7)
