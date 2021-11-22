; ModuleID = 'harshad-or-niven-series.c'
source_filename = "harshad-or-niven-series.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"\0A%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %done = alloca i32, align 4
  %found = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %done, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %found, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 1, i32* %n, align 4, !dbg !17
  store i32 0, i32* %found, align 4, !dbg !19
  store i32 0, i32* %done, align 4, !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %done, align 4, !dbg !22
  %tobool = icmp ne i32 %0, 0, !dbg !24
  %lnot = xor i1 %tobool, true, !dbg !24
  br i1 %lnot, label %for.body, label %for.end, !dbg !25

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %n, align 4, !dbg !26
  %2 = load i32, i32* %n, align 4, !dbg !29
  %call = call i32 @digsum(i32 %2), !dbg !30
  %rem = srem i32 %1, %call, !dbg !31
  %cmp = icmp eq i32 %rem, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.end8, !dbg !33, !cf.info !34

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %found, align 4, !dbg !35
  %inc = add nsw i32 %3, 1, !dbg !35
  store i32 %inc, i32* %found, align 4, !dbg !35
  %cmp1 = icmp slt i32 %3, 20, !dbg !38
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !39, !cf.info !34

if.then2:                                         ; preds = %if.then
  %4 = load i32, i32* %n, align 4, !dbg !40
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4), !dbg !41
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load i32, i32* %n, align 4, !dbg !42
  %cmp4 = icmp sgt i32 %5, 1000, !dbg !44
  br i1 %cmp4, label %if.then5, label %if.end7, !dbg !45, !cf.info !34

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %n, align 4, !dbg !46
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %6), !dbg !47
  store i32 %call6, i32* %done, align 4, !dbg !48
  br label %if.end7, !dbg !49

if.end7:                                          ; preds = %if.then5, %if.end
  br label %if.end8, !dbg !50

if.end8:                                          ; preds = %if.end7, %for.body
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end8
  %7 = load i32, i32* %n, align 4, !dbg !52
  %inc9 = add nsw i32 %7, 1, !dbg !52
  store i32 %inc9, i32* %n, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @digsum(i32 %n) #0 !dbg !57 {
entry:
  %n.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 0, i32* %sum, align 4, !dbg !63
  br label %do.body, !dbg !64

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !65
  %rem = srem i32 %0, 10, !dbg !67
  %1 = load i32, i32* %sum, align 4, !dbg !68
  %add = add nsw i32 %1, %rem, !dbg !68
  store i32 %add, i32* %sum, align 4, !dbg !68
  br label %do.cond, !dbg !69

do.cond:                                          ; preds = %do.body
  %2 = load i32, i32* %n.addr, align 4, !dbg !70
  %div = sdiv i32 %2, 10, !dbg !70
  store i32 %div, i32* %n.addr, align 4, !dbg !70
  %tobool = icmp ne i32 %div, 0, !dbg !69
  br i1 %tobool, label %do.body, label %do.end, !dbg !69, !llvm.loop !71

do.end:                                           ; preds = %do.cond
  %3 = load i32, i32* %sum, align 4, !dbg !73
  ret i32 %3, !dbg !74
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "harshad-or-niven-series.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Harshad-or-Niven-series")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 12, type: !10)
!12 = !DILocation(line: 12, column: 9, scope: !7)
!13 = !DILocalVariable(name: "done", scope: !7, file: !1, line: 12, type: !10)
!14 = !DILocation(line: 12, column: 12, scope: !7)
!15 = !DILocalVariable(name: "found", scope: !7, file: !1, line: 12, type: !10)
!16 = !DILocation(line: 12, column: 18, scope: !7)
!17 = !DILocation(line: 14, column: 12, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 5)
!19 = !DILocation(line: 14, column: 30, scope: !18)
!20 = !DILocation(line: 14, column: 22, scope: !18)
!21 = !DILocation(line: 14, column: 10, scope: !18)
!22 = !DILocation(line: 14, column: 36, scope: !23)
!23 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 5)
!24 = !DILocation(line: 14, column: 35, scope: !23)
!25 = !DILocation(line: 14, column: 5, scope: !18)
!26 = !DILocation(line: 15, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 15, column: 13)
!28 = distinct !DILexicalBlock(scope: !23, file: !1, line: 14, column: 47)
!29 = !DILocation(line: 15, column: 24, scope: !27)
!30 = !DILocation(line: 15, column: 17, scope: !27)
!31 = !DILocation(line: 15, column: 15, scope: !27)
!32 = !DILocation(line: 15, column: 27, scope: !27)
!33 = !DILocation(line: 15, column: 13, scope: !28)
!34 = !{!"if"}
!35 = !DILocation(line: 16, column: 22, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 16, column: 17)
!37 = distinct !DILexicalBlock(scope: !27, file: !1, line: 15, column: 33)
!38 = !DILocation(line: 16, column: 25, scope: !36)
!39 = !DILocation(line: 16, column: 17, scope: !37)
!40 = !DILocation(line: 16, column: 45, scope: !36)
!41 = !DILocation(line: 16, column: 31, scope: !36)
!42 = !DILocation(line: 17, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 17)
!44 = !DILocation(line: 17, column: 19, scope: !43)
!45 = !DILocation(line: 17, column: 17, scope: !37)
!46 = !DILocation(line: 17, column: 51, scope: !43)
!47 = !DILocation(line: 17, column: 34, scope: !43)
!48 = !DILocation(line: 17, column: 32, scope: !43)
!49 = !DILocation(line: 17, column: 27, scope: !43)
!50 = !DILocation(line: 18, column: 9, scope: !37)
!51 = !DILocation(line: 19, column: 5, scope: !28)
!52 = !DILocation(line: 14, column: 42, scope: !23)
!53 = !DILocation(line: 14, column: 5, scope: !23)
!54 = distinct !{!54, !25, !55}
!55 = !DILocation(line: 19, column: 5, scope: !18)
!56 = !DILocation(line: 21, column: 5, scope: !7)
!57 = distinct !DISubprogram(name: "digsum", scope: !1, file: !1, line: 3, type: !58, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!10, !10}
!60 = !DILocalVariable(name: "n", arg: 1, scope: !57, file: !1, line: 3, type: !10)
!61 = !DILocation(line: 3, column: 23, scope: !57)
!62 = !DILocalVariable(name: "sum", scope: !57, file: !1, line: 5, type: !10)
!63 = !DILocation(line: 5, column: 9, scope: !57)
!64 = !DILocation(line: 6, column: 5, scope: !57)
!65 = !DILocation(line: 6, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !57, file: !1, line: 6, column: 8)
!67 = !DILocation(line: 6, column: 19, scope: !66)
!68 = !DILocation(line: 6, column: 14, scope: !66)
!69 = !DILocation(line: 6, column: 25, scope: !66)
!70 = !DILocation(line: 6, column: 36, scope: !57)
!71 = distinct !{!71, !64, !72}
!72 = !DILocation(line: 6, column: 41, scope: !57)
!73 = !DILocation(line: 7, column: 12, scope: !57)
!74 = !DILocation(line: 7, column: 5, scope: !57)
