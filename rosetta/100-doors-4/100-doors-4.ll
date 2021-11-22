; ModuleID = '100-doors-4.c'
source_filename = "100-doors-4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"door #%d is %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"closed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %door = alloca i32, align 4
  %square = alloca i32, align 4
  %increment = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %door, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %square, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %increment, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 1, i32* %door, align 4, !dbg !17
  store i32 1, i32* %square, align 4, !dbg !19
  store i32 1, i32* %increment, align 4, !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %land.end, %entry
  %0 = load i32, i32* %door, align 4, !dbg !22
  %cmp = icmp sle i32 %0, 100, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !25

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %door, align 4, !dbg !26
  %2 = load i32, i32* %door, align 4, !dbg !27
  %3 = load i32, i32* %square, align 4, !dbg !28
  %cmp1 = icmp eq i32 %2, %3, !dbg !29
  %4 = zext i1 %cmp1 to i64, !dbg !27
  %cond = select i1 %cmp1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), !dbg !27
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %1, i8* %cond), !dbg !30
  br label %for.inc, !dbg !30

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %door, align 4, !dbg !31
  %inc = add nsw i32 %5, 1, !dbg !31
  store i32 %inc, i32* %door, align 4, !dbg !31
  %6 = load i32, i32* %square, align 4, !dbg !32
  %cmp2 = icmp eq i32 %5, %6, !dbg !33
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !34

land.rhs:                                         ; preds = %for.inc
  %7 = load i32, i32* %increment, align 4, !dbg !35
  %add = add nsw i32 %7, 2, !dbg !35
  store i32 %add, i32* %increment, align 4, !dbg !35
  %8 = load i32, i32* %square, align 4, !dbg !36
  %add3 = add nsw i32 %8, %add, !dbg !36
  store i32 %add3, i32* %square, align 4, !dbg !36
  %tobool = icmp ne i32 %add3, 0, !dbg !34
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.inc
  %9 = phi i1 [ false, %for.inc ], [ %tobool, %land.rhs ], !dbg !37
  %land.ext = zext i1 %9 to i32, !dbg !34
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !41
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
!1 = !DIFile(filename: "100-doors-4.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/100-doors-4")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "door", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 7, scope: !7)
!13 = !DILocalVariable(name: "square", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 13, scope: !7)
!15 = !DILocalVariable(name: "increment", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 21, scope: !7)
!17 = !DILocation(line: 6, column: 13, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 3)
!19 = !DILocation(line: 6, column: 25, scope: !18)
!20 = !DILocation(line: 6, column: 40, scope: !18)
!21 = !DILocation(line: 6, column: 8, scope: !18)
!22 = !DILocation(line: 6, column: 45, scope: !23)
!23 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 3)
!24 = !DILocation(line: 6, column: 50, scope: !23)
!25 = !DILocation(line: 6, column: 3, scope: !18)
!26 = !DILocation(line: 7, column: 33, scope: !23)
!27 = !DILocation(line: 7, column: 40, scope: !23)
!28 = !DILocation(line: 7, column: 48, scope: !23)
!29 = !DILocation(line: 7, column: 45, scope: !23)
!30 = !DILocation(line: 7, column: 5, scope: !23)
!31 = !DILocation(line: 6, column: 62, scope: !23)
!32 = !DILocation(line: 6, column: 68, scope: !23)
!33 = !DILocation(line: 6, column: 65, scope: !23)
!34 = !DILocation(line: 6, column: 75, scope: !23)
!35 = !DILocation(line: 6, column: 99, scope: !23)
!36 = !DILocation(line: 6, column: 86, scope: !23)
!37 = !DILocation(line: 0, scope: !23)
!38 = !DILocation(line: 6, column: 3, scope: !23)
!39 = distinct !{!39, !25, !40}
!40 = !DILocation(line: 7, column: 74, scope: !18)
!41 = !DILocation(line: 8, column: 3, scope: !7)
