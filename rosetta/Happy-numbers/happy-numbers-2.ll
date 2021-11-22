; ModuleID = 'happy-numbers-2.c'
source_filename = "happy-numbers-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"The %dth happy number: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dsum(i32 %n) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %sum, align 4, !dbg !17
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !20
  %tobool = icmp ne i32 %0, 0, !dbg !22
  br i1 %tobool, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %n.addr, align 4, !dbg !23
  %rem = srem i32 %1, 10, !dbg !24
  store i32 %rem, i32* %x, align 4, !dbg !25
  %2 = load i32, i32* %x, align 4, !dbg !26
  %3 = load i32, i32* %x, align 4, !dbg !27
  %mul = mul nsw i32 %2, %3, !dbg !28
  %4 = load i32, i32* %sum, align 4, !dbg !29
  %add = add nsw i32 %4, %mul, !dbg !29
  store i32 %add, i32* %sum, align 4, !dbg !29
  br label %for.inc, !dbg !30

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %n.addr, align 4, !dbg !31
  %div = sdiv i32 %5, 10, !dbg !31
  store i32 %div, i32* %n.addr, align 4, !dbg !31
  br label %for.cond, !dbg !32, !llvm.loop !33

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %sum, align 4, !dbg !35
  ret i32 %6, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @happy(i32 %n) #0 !dbg !37 {
entry:
  %n.addr = alloca i32, align 4
  %nn = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %nn, metadata !40, metadata !DIExpression()), !dbg !41
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !43
  %cmp = icmp sgt i32 %0, 999, !dbg !44
  br i1 %cmp, label %while.body, label %while.end, !dbg !42

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %n.addr, align 4, !dbg !45
  %call = call i32 @dsum(i32 %1), !dbg !46
  store i32 %call, i32* %n.addr, align 4, !dbg !47
  br label %while.cond, !dbg !42, !llvm.loop !48

while.end:                                        ; preds = %while.cond
  %2 = load i32, i32* %n.addr, align 4, !dbg !50
  %call1 = call i32 @dsum(i32 %2), !dbg !51
  store i32 %call1, i32* %nn, align 4, !dbg !52
  br label %while.cond2, !dbg !53

while.cond2:                                      ; preds = %while.body5, %while.end
  %3 = load i32, i32* %nn, align 4, !dbg !54
  %4 = load i32, i32* %n.addr, align 4, !dbg !55
  %cmp3 = icmp ne i32 %3, %4, !dbg !56
  br i1 %cmp3, label %land.rhs, label %land.end, !dbg !57

land.rhs:                                         ; preds = %while.cond2
  %5 = load i32, i32* %nn, align 4, !dbg !58
  %cmp4 = icmp ne i32 %5, 1, !dbg !59
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond2
  %6 = phi i1 [ false, %while.cond2 ], [ %cmp4, %land.rhs ], !dbg !60
  br i1 %6, label %while.body5, label %while.end9, !dbg !53

while.body5:                                      ; preds = %land.end
  %7 = load i32, i32* %n.addr, align 4, !dbg !61
  %call6 = call i32 @dsum(i32 %7), !dbg !62
  store i32 %call6, i32* %n.addr, align 4, !dbg !63
  %8 = load i32, i32* %nn, align 4, !dbg !64
  %call7 = call i32 @dsum(i32 %8), !dbg !65
  %call8 = call i32 @dsum(i32 %call7), !dbg !66
  store i32 %call8, i32* %nn, align 4, !dbg !67
  br label %while.cond2, !dbg !53, !llvm.loop !68

while.end9:                                       ; preds = %land.end
  %9 = load i32, i32* %n.addr, align 4, !dbg !70
  %cmp10 = icmp eq i32 %9, 1, !dbg !71
  %conv = zext i1 %cmp10 to i32, !dbg !71
  ret i32 %conv, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 8, i32* %cnt, align 4, !dbg !79
  store i32 1, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %cnt, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !85

lor.rhs:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !86
  %tobool1 = icmp ne i32 %call, 0, !dbg !87
  %lnot = xor i1 %tobool1, true, !dbg !87
  br label %lor.end, !dbg !85

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %1 = phi i1 [ true, %for.cond ], [ %lnot, %lor.rhs ]
  br i1 %1, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %lor.end
  %2 = load i32, i32* %i, align 4, !dbg !89
  %call2 = call i32 @happy(i32 %2), !dbg !91
  %tobool3 = icmp ne i32 %call2, 0, !dbg !91
  br i1 %tobool3, label %if.then, label %if.end, !dbg !92, !cf.info !93

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %cnt, align 4, !dbg !94
  %dec = add nsw i32 %3, -1, !dbg !94
  store i32 %dec, i32* %cnt, align 4, !dbg !94
  %4 = load i32, i32* %i, align 4, !dbg !95
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %4), !dbg !96
  br label %if.end, !dbg !94

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !98
  %inc = add nsw i32 %5, 1, !dbg !98
  store i32 %inc, i32* %i, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %lor.end
  store i32 1000000, i32* %cnt, align 4, !dbg !102
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 1000000), !dbg !103
  store i32 1, i32* %i, align 4, !dbg !104
  br label %for.cond6, !dbg !106

for.cond6:                                        ; preds = %for.inc19, %for.end
  %6 = load i32, i32* %cnt, align 4, !dbg !107
  %tobool7 = icmp ne i32 %6, 0, !dbg !109
  br i1 %tobool7, label %for.body8, label %for.end21, !dbg !109

for.body8:                                        ; preds = %for.cond6
  %7 = load i32, i32* %i, align 4, !dbg !110
  %call9 = call i32 @happy(i32 %7), !dbg !112
  %tobool10 = icmp ne i32 %call9, 0, !dbg !112
  br i1 %tobool10, label %if.then11, label %if.end18, !dbg !113, !cf.info !93

if.then11:                                        ; preds = %for.body8
  %8 = load i32, i32* %cnt, align 4, !dbg !114
  %dec12 = add nsw i32 %8, -1, !dbg !114
  store i32 %dec12, i32* %cnt, align 4, !dbg !114
  %tobool13 = icmp ne i32 %dec12, 0, !dbg !114
  br i1 %tobool13, label %lor.end17, label %lor.rhs14, !dbg !115

lor.rhs14:                                        ; preds = %if.then11
  %9 = load i32, i32* %i, align 4, !dbg !116
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %9), !dbg !117
  %tobool16 = icmp ne i32 %call15, 0, !dbg !115
  br label %lor.end17, !dbg !115

lor.end17:                                        ; preds = %lor.rhs14, %if.then11
  %10 = phi i1 [ true, %if.then11 ], [ %tobool16, %lor.rhs14 ]
  %lor.ext = zext i1 %10 to i32, !dbg !115
  br label %if.end18, !dbg !114

if.end18:                                         ; preds = %lor.end17, %for.body8
  br label %for.inc19, !dbg !118

for.inc19:                                        ; preds = %if.end18
  %11 = load i32, i32* %i, align 4, !dbg !119
  %inc20 = add nsw i32 %11, 1, !dbg !119
  store i32 %inc20, i32* %i, align 4, !dbg !119
  br label %for.cond6, !dbg !120, !llvm.loop !121

for.end21:                                        ; preds = %for.cond6
  ret i32 0, !dbg !123
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "happy-numbers-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Happy-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "dsum", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 14, scope: !7)
!13 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 6, scope: !7)
!15 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 11, scope: !7)
!17 = !DILocation(line: 6, column: 11, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!19 = !DILocation(line: 6, column: 7, scope: !18)
!20 = !DILocation(line: 6, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 2)
!22 = !DILocation(line: 6, column: 2, scope: !18)
!23 = !DILocation(line: 6, column: 32, scope: !21)
!24 = !DILocation(line: 6, column: 34, scope: !21)
!25 = !DILocation(line: 6, column: 30, scope: !21)
!26 = !DILocation(line: 6, column: 47, scope: !21)
!27 = !DILocation(line: 6, column: 51, scope: !21)
!28 = !DILocation(line: 6, column: 49, scope: !21)
!29 = !DILocation(line: 6, column: 44, scope: !21)
!30 = !DILocation(line: 6, column: 28, scope: !21)
!31 = !DILocation(line: 6, column: 21, scope: !21)
!32 = !DILocation(line: 6, column: 2, scope: !21)
!33 = distinct !{!33, !22, !34}
!34 = !DILocation(line: 6, column: 51, scope: !18)
!35 = !DILocation(line: 7, column: 9, scope: !7)
!36 = !DILocation(line: 7, column: 2, scope: !7)
!37 = distinct !DISubprogram(name: "happy", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "n", arg: 1, scope: !37, file: !1, line: 10, type: !10)
!39 = !DILocation(line: 10, column: 15, scope: !37)
!40 = !DILocalVariable(name: "nn", scope: !37, file: !1, line: 12, type: !10)
!41 = !DILocation(line: 12, column: 6, scope: !37)
!42 = !DILocation(line: 13, column: 2, scope: !37)
!43 = !DILocation(line: 13, column: 9, scope: !37)
!44 = !DILocation(line: 13, column: 11, scope: !37)
!45 = !DILocation(line: 13, column: 27, scope: !37)
!46 = !DILocation(line: 13, column: 22, scope: !37)
!47 = !DILocation(line: 13, column: 20, scope: !37)
!48 = distinct !{!48, !42, !49}
!49 = !DILocation(line: 13, column: 28, scope: !37)
!50 = !DILocation(line: 14, column: 12, scope: !37)
!51 = !DILocation(line: 14, column: 7, scope: !37)
!52 = !DILocation(line: 14, column: 5, scope: !37)
!53 = !DILocation(line: 15, column: 2, scope: !37)
!54 = !DILocation(line: 15, column: 9, scope: !37)
!55 = !DILocation(line: 15, column: 15, scope: !37)
!56 = !DILocation(line: 15, column: 12, scope: !37)
!57 = !DILocation(line: 15, column: 17, scope: !37)
!58 = !DILocation(line: 15, column: 20, scope: !37)
!59 = !DILocation(line: 15, column: 23, scope: !37)
!60 = !DILocation(line: 0, scope: !37)
!61 = !DILocation(line: 16, column: 12, scope: !37)
!62 = !DILocation(line: 16, column: 7, scope: !37)
!63 = !DILocation(line: 16, column: 5, scope: !37)
!64 = !DILocation(line: 16, column: 31, scope: !37)
!65 = !DILocation(line: 16, column: 26, scope: !37)
!66 = !DILocation(line: 16, column: 21, scope: !37)
!67 = !DILocation(line: 16, column: 19, scope: !37)
!68 = distinct !{!68, !53, !69}
!69 = !DILocation(line: 16, column: 34, scope: !37)
!70 = !DILocation(line: 17, column: 9, scope: !37)
!71 = !DILocation(line: 17, column: 11, scope: !37)
!72 = !DILocation(line: 17, column: 2, scope: !37)
!73 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !74, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!10}
!76 = !DILocalVariable(name: "i", scope: !73, file: !1, line: 22, type: !10)
!77 = !DILocation(line: 22, column: 6, scope: !73)
!78 = !DILocalVariable(name: "cnt", scope: !73, file: !1, line: 22, type: !10)
!79 = !DILocation(line: 22, column: 9, scope: !73)
!80 = !DILocation(line: 23, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !1, line: 23, column: 2)
!82 = !DILocation(line: 23, column: 7, scope: !81)
!83 = !DILocation(line: 23, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 23, column: 2)
!85 = !DILocation(line: 23, column: 18, scope: !84)
!86 = !DILocation(line: 23, column: 22, scope: !84)
!87 = !DILocation(line: 23, column: 21, scope: !84)
!88 = !DILocation(line: 23, column: 2, scope: !81)
!89 = !DILocation(line: 24, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !1, line: 24, column: 7)
!91 = !DILocation(line: 24, column: 7, scope: !90)
!92 = !DILocation(line: 24, column: 7, scope: !84)
!93 = !{!"if"}
!94 = !DILocation(line: 24, column: 17, scope: !90)
!95 = !DILocation(line: 24, column: 38, scope: !90)
!96 = !DILocation(line: 24, column: 24, scope: !90)
!97 = !DILocation(line: 24, column: 14, scope: !90)
!98 = !DILocation(line: 23, column: 37, scope: !84)
!99 = !DILocation(line: 23, column: 2, scope: !84)
!100 = distinct !{!100, !88, !101}
!101 = !DILocation(line: 24, column: 39, scope: !81)
!102 = !DILocation(line: 26, column: 40, scope: !73)
!103 = !DILocation(line: 26, column: 2, scope: !73)
!104 = !DILocation(line: 27, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !73, file: !1, line: 27, column: 2)
!106 = !DILocation(line: 27, column: 7, scope: !105)
!107 = !DILocation(line: 27, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 27, column: 2)
!109 = !DILocation(line: 27, column: 2, scope: !105)
!110 = !DILocation(line: 28, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !1, line: 28, column: 7)
!112 = !DILocation(line: 28, column: 7, scope: !111)
!113 = !DILocation(line: 28, column: 7, scope: !108)
!114 = !DILocation(line: 28, column: 17, scope: !111)
!115 = !DILocation(line: 28, column: 23, scope: !111)
!116 = !DILocation(line: 28, column: 41, scope: !111)
!117 = !DILocation(line: 28, column: 26, scope: !111)
!118 = !DILocation(line: 28, column: 14, scope: !111)
!119 = !DILocation(line: 27, column: 20, scope: !108)
!120 = !DILocation(line: 27, column: 2, scope: !108)
!121 = distinct !{!121, !109, !122}
!122 = !DILocation(line: 28, column: 42, scope: !105)
!123 = !DILocation(line: 30, column: 2, scope: !73)
