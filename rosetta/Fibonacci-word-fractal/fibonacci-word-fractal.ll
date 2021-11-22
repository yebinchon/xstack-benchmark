; ModuleID = 'fibonacci-word-fractal.c'
source_filename = "fibonacci-word-fractal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [132 x i8] c"%!PS-Adobe-3.0 EPSF\0A%%BoundingBox: -10 -10 400 565\0A/a{0 0 moveto 0 .4 translate 0 0 lineto stroke -1 1 scale}def\0A/b{a 90 rotate}def\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"/%c{%c %c}def\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"0 setlinewidth z showpage\0A%%EOF\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([132 x i8], [132 x i8]* @.str, i64 0, i64 0)), !dbg !11
  call void @llvm.dbg.declare(metadata i8* %i, metadata !12, metadata !DIExpression()), !dbg !14
  store i8 99, i8* %i, align 1, !dbg !15
  br label %for.cond, !dbg !17

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %i, align 1, !dbg !18
  %conv = sext i8 %0 to i32, !dbg !18
  %cmp = icmp sle i32 %conv, 122, !dbg !20
  br i1 %cmp, label %for.body, label %for.end, !dbg !21

for.body:                                         ; preds = %for.cond
  %1 = load i8, i8* %i, align 1, !dbg !22
  %conv2 = sext i8 %1 to i32, !dbg !22
  %2 = load i8, i8* %i, align 1, !dbg !23
  %conv3 = sext i8 %2 to i32, !dbg !23
  %sub = sub nsw i32 %conv3, 1, !dbg !24
  %3 = load i8, i8* %i, align 1, !dbg !25
  %conv4 = sext i8 %3 to i32, !dbg !25
  %sub5 = sub nsw i32 %conv4, 2, !dbg !26
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 %conv2, i32 %sub, i32 %sub5), !dbg !27
  br label %for.inc, !dbg !27

for.inc:                                          ; preds = %for.body
  %4 = load i8, i8* %i, align 1, !dbg !28
  %inc = add i8 %4, 1, !dbg !28
  store i8 %inc, i8* %i, align 1, !dbg !28
  br label %for.cond, !dbg !29, !llvm.loop !30

for.end:                                          ; preds = %for.cond
  %call7 = call i32 @puts(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0)), !dbg !32
  ret i32 0, !dbg !33
}

declare dso_local i32 @puts(i8*) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fibonacci-word-fractal.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fibonacci-word-fractal")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 5, column: 2, scope: !7)
!12 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 10, type: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocation(line: 10, column: 7, scope: !7)
!15 = !DILocation(line: 11, column: 9, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 2)
!17 = !DILocation(line: 11, column: 7, scope: !16)
!18 = !DILocation(line: 11, column: 16, scope: !19)
!19 = distinct !DILexicalBlock(scope: !16, file: !1, line: 11, column: 2)
!20 = !DILocation(line: 11, column: 18, scope: !19)
!21 = !DILocation(line: 11, column: 2, scope: !16)
!22 = !DILocation(line: 12, column: 29, scope: !19)
!23 = !DILocation(line: 12, column: 32, scope: !19)
!24 = !DILocation(line: 12, column: 33, scope: !19)
!25 = !DILocation(line: 12, column: 37, scope: !19)
!26 = !DILocation(line: 12, column: 38, scope: !19)
!27 = !DILocation(line: 12, column: 3, scope: !19)
!28 = !DILocation(line: 11, column: 27, scope: !19)
!29 = !DILocation(line: 11, column: 2, scope: !19)
!30 = distinct !{!30, !21, !31}
!31 = !DILocation(line: 12, column: 40, scope: !16)
!32 = !DILocation(line: 14, column: 2, scope: !7)
!33 = !DILocation(line: 16, column: 2, scope: !7)
