; ModuleID = 'babbage_problem.ll'
source_filename = "babbage_problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [48 x i8] c"Condition not satisfied before INT_MAX reached.\00", align 1
@.str.1 = private unnamed_addr constant [55 x i8] c"The smallest number whose square ends in 269696 is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %current = alloca i32, align 4
  %square = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %current, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %current, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %square, metadata !13, metadata !DIExpression()), !dbg !14
  br label %while.cond, !dbg !15

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %current, align 4, !dbg !16
  %1 = load i32, i32* %current, align 4, !dbg !17
  %mul = mul nsw i32 %0, %1, !dbg !18
  store i32 %mul, i32* %square, align 4, !dbg !19
  %rem = srem i32 %mul, 1000000, !dbg !20
  %cmp = icmp ne i32 %rem, 269696, !dbg !21
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !22

land.rhs:                                         ; preds = %while.cond
  %2 = load i32, i32* %square, align 4, !dbg !23
  %cmp1 = icmp slt i32 %2, 2147483647, !dbg !24
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !dbg !25
  br i1 %3, label %while.body, label %while.end, !dbg !15

while.body:                                       ; preds = %land.end
  %4 = load i32, i32* %current, align 4, !dbg !26
  %inc = add nsw i32 %4, 1, !dbg !26
  store i32 %inc, i32* %current, align 4, !dbg !26
  br label %while.cond, !dbg !15, !llvm.loop !28

while.end:                                        ; preds = %land.end
  %5 = load i32, i32* %square, align 4, !dbg !30
  %cmp2 = icmp sgt i32 %5, 2147483647, !dbg !32
  br i1 %cmp2, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %while.end
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0)), !dbg !34
  br label %if.end, !dbg !34

if.else:                                          ; preds = %while.end
  %6 = load i32, i32* %current, align 4, !dbg !35
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i64 0, i64 0), i32 %6), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0, !dbg !37
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "babbage_problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/babbage_problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "current", scope: !7, file: !1, line: 6, type: !10)
!12 = !DILocation(line: 6, column: 7, scope: !7)
!13 = !DILocalVariable(name: "square", scope: !7, file: !1, line: 7, type: !10)
!14 = !DILocation(line: 7, column: 7, scope: !7)
!15 = !DILocation(line: 11, column: 3, scope: !7)
!16 = !DILocation(line: 11, column: 19, scope: !7)
!17 = !DILocation(line: 11, column: 27, scope: !7)
!18 = !DILocation(line: 11, column: 26, scope: !7)
!19 = !DILocation(line: 11, column: 18, scope: !7)
!20 = !DILocation(line: 11, column: 36, scope: !7)
!21 = !DILocation(line: 11, column: 46, scope: !7)
!22 = !DILocation(line: 11, column: 57, scope: !7)
!23 = !DILocation(line: 11, column: 61, scope: !7)
!24 = !DILocation(line: 11, column: 67, scope: !7)
!25 = !DILocation(line: 0, scope: !7)
!26 = !DILocation(line: 12, column: 12, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 78)
!28 = distinct !{!28, !15, !29}
!29 = !DILocation(line: 13, column: 3, scope: !7)
!30 = !DILocation(line: 16, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 7)
!32 = !DILocation(line: 16, column: 13, scope: !31)
!33 = !DILocation(line: 16, column: 7, scope: !7)
!34 = !DILocation(line: 17, column: 5, scope: !31)
!35 = !DILocation(line: 19, column: 72, scope: !31)
!36 = !DILocation(line: 19, column: 5, scope: !31)
!37 = !DILocation(line: 22, column: 3, scope: !7)
