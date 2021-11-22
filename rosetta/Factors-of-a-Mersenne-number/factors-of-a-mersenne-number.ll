; ModuleID = 'factors-of-a-mersenne-number.c'
source_filename = "factors-of-a-mersenne-number.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"2^%d - 1 = 0 (mod %d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isPrime(i32 %n) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %n.addr, align 4, !dbg !15
  %rem = srem i32 %0, 2, !dbg !17
  %cmp = icmp eq i32 %rem, 0, !dbg !18
  br i1 %cmp, label %if.then, label %if.end, !dbg !19, !cf.info !20

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !21
  %cmp1 = icmp eq i32 %1, 2, !dbg !22
  %conv = zext i1 %cmp1 to i32, !dbg !22
  store i32 %conv, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !24
  %rem2 = srem i32 %2, 3, !dbg !26
  %cmp3 = icmp eq i32 %rem2, 0, !dbg !27
  br i1 %cmp3, label %if.then5, label %if.end8, !dbg !28, !cf.info !20

if.then5:                                         ; preds = %if.end
  %3 = load i32, i32* %n.addr, align 4, !dbg !29
  %cmp6 = icmp eq i32 %3, 3, !dbg !30
  %conv7 = zext i1 %cmp6 to i32, !dbg !30
  store i32 %conv7, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.end8:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %d, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 5, i32* %d, align 4, !dbg !33
  br label %while.cond, !dbg !34

while.cond:                                       ; preds = %if.end20, %if.end8
  %4 = load i32, i32* %d, align 4, !dbg !35
  %5 = load i32, i32* %d, align 4, !dbg !36
  %mul = mul nsw i32 %4, %5, !dbg !37
  %6 = load i32, i32* %n.addr, align 4, !dbg !38
  %cmp9 = icmp sle i32 %mul, %6, !dbg !39
  br i1 %cmp9, label %while.body, label %while.end, !dbg !34

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %n.addr, align 4, !dbg !40
  %8 = load i32, i32* %d, align 4, !dbg !43
  %rem11 = srem i32 %7, %8, !dbg !44
  %cmp12 = icmp eq i32 %rem11, 0, !dbg !45
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !46, !cf.info !20

if.then14:                                        ; preds = %while.body
  store i32 0, i32* %retval, align 4, !dbg !47
  br label %return, !dbg !47

if.end15:                                         ; preds = %while.body
  %9 = load i32, i32* %d, align 4, !dbg !48
  %add = add nsw i32 %9, 2, !dbg !48
  store i32 %add, i32* %d, align 4, !dbg !48
  %10 = load i32, i32* %n.addr, align 4, !dbg !49
  %11 = load i32, i32* %d, align 4, !dbg !51
  %rem16 = srem i32 %10, %11, !dbg !52
  %cmp17 = icmp eq i32 %rem16, 0, !dbg !53
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !54, !cf.info !20

if.then19:                                        ; preds = %if.end15
  store i32 0, i32* %retval, align 4, !dbg !55
  br label %return, !dbg !55

if.end20:                                         ; preds = %if.end15
  %12 = load i32, i32* %d, align 4, !dbg !56
  %add21 = add nsw i32 %12, 4, !dbg !56
  store i32 %add21, i32* %d, align 4, !dbg !56
  br label %while.cond, !dbg !34, !llvm.loop !57

while.end:                                        ; preds = %while.cond
  store i32 1, i32* %retval, align 4, !dbg !59
  br label %return, !dbg !59

return:                                           ; preds = %while.end, %if.then19, %if.then14, %if.then5, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %13, !dbg !60
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %r = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %d, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %p, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %r, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %q, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 929, i32* %q, align 4, !dbg !73
  %0 = load i32, i32* %q, align 4, !dbg !74
  %call = call i32 @isPrime(i32 %0), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.end, label %if.then, !dbg !77, !cf.info !20

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !78
  br label %return, !dbg !78

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %q, align 4, !dbg !79
  store i32 %1, i32* %r, align 4, !dbg !80
  br label %while.cond, !dbg !81

while.cond:                                       ; preds = %while.body, %if.end
  %2 = load i32, i32* %r, align 4, !dbg !82
  %cmp = icmp sgt i32 %2, 0, !dbg !83
  br i1 %cmp, label %while.body, label %while.end, !dbg !81

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %r, align 4, !dbg !84
  %shl = shl i32 %3, 1, !dbg !84
  store i32 %shl, i32* %r, align 4, !dbg !84
  br label %while.cond, !dbg !81, !llvm.loop !85

while.end:                                        ; preds = %while.cond
  %4 = load i32, i32* %q, align 4, !dbg !87
  %mul = mul nsw i32 2, %4, !dbg !88
  %add = add nsw i32 %mul, 1, !dbg !89
  store i32 %add, i32* %d, align 4, !dbg !90
  br label %do.body, !dbg !91

do.body:                                          ; preds = %do.cond, %while.end
  %5 = load i32, i32* %r, align 4, !dbg !92
  store i32 %5, i32* %p, align 4, !dbg !95
  store i32 1, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %do.body
  %6 = load i32, i32* %p, align 4, !dbg !98
  %tobool1 = icmp ne i32 %6, 0, !dbg !100
  br i1 %tobool1, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !101
  %conv = sext i32 %7 to i64, !dbg !103
  %8 = load i32, i32* %i, align 4, !dbg !104
  %conv2 = sext i32 %8 to i64, !dbg !104
  %mul3 = mul nsw i64 %conv, %conv2, !dbg !105
  %9 = load i32, i32* %d, align 4, !dbg !106
  %conv4 = sext i32 %9 to i64, !dbg !106
  %rem = srem i64 %mul3, %conv4, !dbg !107
  %conv5 = trunc i64 %rem to i32, !dbg !108
  store i32 %conv5, i32* %i, align 4, !dbg !109
  %10 = load i32, i32* %p, align 4, !dbg !110
  %cmp6 = icmp slt i32 %10, 0, !dbg !112
  br i1 %cmp6, label %if.then8, label %if.end10, !dbg !113, !cf.info !20

if.then8:                                         ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !114
  %mul9 = mul nsw i32 %11, 2, !dbg !114
  store i32 %mul9, i32* %i, align 4, !dbg !114
  br label %if.end10, !dbg !115

if.end10:                                         ; preds = %if.then8, %for.body
  %12 = load i32, i32* %i, align 4, !dbg !116
  %13 = load i32, i32* %d, align 4, !dbg !118
  %cmp11 = icmp sgt i32 %12, %13, !dbg !119
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !120, !cf.info !20

if.then13:                                        ; preds = %if.end10
  %14 = load i32, i32* %d, align 4, !dbg !121
  %15 = load i32, i32* %i, align 4, !dbg !122
  %sub = sub nsw i32 %15, %14, !dbg !122
  store i32 %sub, i32* %i, align 4, !dbg !122
  br label %if.end14, !dbg !123

if.end14:                                         ; preds = %if.then13, %if.end10
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %if.end14
  %16 = load i32, i32* %p, align 4, !dbg !125
  %shl15 = shl i32 %16, 1, !dbg !125
  store i32 %shl15, i32* %p, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !129
  %cmp16 = icmp ne i32 %17, 1, !dbg !131
  br i1 %cmp16, label %if.then18, label %if.else, !dbg !132, !cf.info !20

if.then18:                                        ; preds = %for.end
  %18 = load i32, i32* %q, align 4, !dbg !133
  %mul19 = mul nsw i32 2, %18, !dbg !134
  %19 = load i32, i32* %d, align 4, !dbg !135
  %add20 = add nsw i32 %19, %mul19, !dbg !135
  store i32 %add20, i32* %d, align 4, !dbg !135
  br label %if.end21, !dbg !136

if.else:                                          ; preds = %for.end
  br label %do.end, !dbg !137

if.end21:                                         ; preds = %if.then18
  br label %do.cond, !dbg !138

do.cond:                                          ; preds = %if.end21
  br i1 true, label %do.body, label %do.end, !dbg !138, !llvm.loop !139

do.end:                                           ; preds = %do.cond, %if.else
  %20 = load i32, i32* %q, align 4, !dbg !141
  %21 = load i32, i32* %d, align 4, !dbg !142
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %20, i32 %21), !dbg !143
  br label %return, !dbg !144

return:                                           ; preds = %do.end, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !144
  ret i32 %22, !dbg !144
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "factors-of-a-mersenne-number.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Factors-of-a-Mersenne-number")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!9 = distinct !DISubprogram(name: "isPrime", scope: !1, file: !1, line: 1, type: !10, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !9, file: !1, line: 1, type: !12)
!14 = !DILocation(line: 1, column: 17, scope: !9)
!15 = !DILocation(line: 2, column: 6, scope: !16)
!16 = distinct !DILexicalBlock(scope: !9, file: !1, line: 2, column: 6)
!17 = !DILocation(line: 2, column: 7, scope: !16)
!18 = !DILocation(line: 2, column: 9, scope: !16)
!19 = !DILocation(line: 2, column: 6, scope: !9)
!20 = !{!"if"}
!21 = !DILocation(line: 2, column: 21, scope: !16)
!22 = !DILocation(line: 2, column: 22, scope: !16)
!23 = !DILocation(line: 2, column: 14, scope: !16)
!24 = !DILocation(line: 3, column: 6, scope: !25)
!25 = distinct !DILexicalBlock(scope: !9, file: !1, line: 3, column: 6)
!26 = !DILocation(line: 3, column: 7, scope: !25)
!27 = !DILocation(line: 3, column: 9, scope: !25)
!28 = !DILocation(line: 3, column: 6, scope: !9)
!29 = !DILocation(line: 3, column: 21, scope: !25)
!30 = !DILocation(line: 3, column: 22, scope: !25)
!31 = !DILocation(line: 3, column: 14, scope: !25)
!32 = !DILocalVariable(name: "d", scope: !9, file: !1, line: 4, type: !12)
!33 = !DILocation(line: 4, column: 6, scope: !9)
!34 = !DILocation(line: 5, column: 2, scope: !9)
!35 = !DILocation(line: 5, column: 8, scope: !9)
!36 = !DILocation(line: 5, column: 10, scope: !9)
!37 = !DILocation(line: 5, column: 9, scope: !9)
!38 = !DILocation(line: 5, column: 13, scope: !9)
!39 = !DILocation(line: 5, column: 11, scope: !9)
!40 = !DILocation(line: 6, column: 6, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 6, column: 6)
!42 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 15)
!43 = !DILocation(line: 6, column: 8, scope: !41)
!44 = !DILocation(line: 6, column: 7, scope: !41)
!45 = !DILocation(line: 6, column: 9, scope: !41)
!46 = !DILocation(line: 6, column: 6, scope: !42)
!47 = !DILocation(line: 6, column: 14, scope: !41)
!48 = !DILocation(line: 7, column: 4, scope: !42)
!49 = !DILocation(line: 8, column: 6, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !1, line: 8, column: 6)
!51 = !DILocation(line: 8, column: 8, scope: !50)
!52 = !DILocation(line: 8, column: 7, scope: !50)
!53 = !DILocation(line: 8, column: 9, scope: !50)
!54 = !DILocation(line: 8, column: 6, scope: !42)
!55 = !DILocation(line: 8, column: 14, scope: !50)
!56 = !DILocation(line: 9, column: 4, scope: !42)
!57 = distinct !{!57, !34, !58}
!58 = !DILocation(line: 9, column: 8, scope: !9)
!59 = !DILocation(line: 10, column: 2, scope: !9)
!60 = !DILocation(line: 10, column: 11, scope: !9)
!61 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !62, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!12}
!64 = !DILocalVariable(name: "i", scope: !61, file: !1, line: 12, type: !12)
!65 = !DILocation(line: 12, column: 13, scope: !61)
!66 = !DILocalVariable(name: "d", scope: !61, file: !1, line: 12, type: !12)
!67 = !DILocation(line: 12, column: 15, scope: !61)
!68 = !DILocalVariable(name: "p", scope: !61, file: !1, line: 12, type: !12)
!69 = !DILocation(line: 12, column: 17, scope: !61)
!70 = !DILocalVariable(name: "r", scope: !61, file: !1, line: 12, type: !12)
!71 = !DILocation(line: 12, column: 19, scope: !61)
!72 = !DILocalVariable(name: "q", scope: !61, file: !1, line: 12, type: !12)
!73 = !DILocation(line: 12, column: 21, scope: !61)
!74 = !DILocation(line: 13, column: 15, scope: !75)
!75 = distinct !DILexicalBlock(scope: !61, file: !1, line: 13, column: 6)
!76 = !DILocation(line: 13, column: 7, scope: !75)
!77 = !DILocation(line: 13, column: 6, scope: !61)
!78 = !DILocation(line: 13, column: 19, scope: !75)
!79 = !DILocation(line: 14, column: 4, scope: !61)
!80 = !DILocation(line: 14, column: 3, scope: !61)
!81 = !DILocation(line: 15, column: 2, scope: !61)
!82 = !DILocation(line: 15, column: 8, scope: !61)
!83 = !DILocation(line: 15, column: 9, scope: !61)
!84 = !DILocation(line: 15, column: 14, scope: !61)
!85 = distinct !{!85, !81, !86}
!86 = !DILocation(line: 15, column: 17, scope: !61)
!87 = !DILocation(line: 16, column: 6, scope: !61)
!88 = !DILocation(line: 16, column: 5, scope: !61)
!89 = !DILocation(line: 16, column: 7, scope: !61)
!90 = !DILocation(line: 16, column: 3, scope: !61)
!91 = !DILocation(line: 17, column: 2, scope: !61)
!92 = !DILocation(line: 17, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 17, column: 8)
!94 = distinct !DILexicalBlock(scope: !61, file: !1, line: 17, column: 5)
!95 = !DILocation(line: 17, column: 13, scope: !93)
!96 = !DILocation(line: 17, column: 18, scope: !93)
!97 = !DILocation(line: 17, column: 12, scope: !93)
!98 = !DILocation(line: 17, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 17, column: 8)
!100 = !DILocation(line: 17, column: 8, scope: !93)
!101 = !DILocation(line: 18, column: 18, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 17, column: 33)
!103 = !DILocation(line: 18, column: 7, scope: !102)
!104 = !DILocation(line: 18, column: 22, scope: !102)
!105 = !DILocation(line: 18, column: 20, scope: !102)
!106 = !DILocation(line: 18, column: 27, scope: !102)
!107 = !DILocation(line: 18, column: 25, scope: !102)
!108 = !DILocation(line: 18, column: 6, scope: !102)
!109 = !DILocation(line: 18, column: 5, scope: !102)
!110 = !DILocation(line: 19, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !102, file: !1, line: 19, column: 8)
!112 = !DILocation(line: 19, column: 10, scope: !111)
!113 = !DILocation(line: 19, column: 8, scope: !102)
!114 = !DILocation(line: 19, column: 17, scope: !111)
!115 = !DILocation(line: 19, column: 15, scope: !111)
!116 = !DILocation(line: 20, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !102, file: !1, line: 20, column: 8)
!118 = !DILocation(line: 20, column: 12, scope: !117)
!119 = !DILocation(line: 20, column: 10, scope: !117)
!120 = !DILocation(line: 20, column: 8, scope: !102)
!121 = !DILocation(line: 20, column: 20, scope: !117)
!122 = !DILocation(line: 20, column: 17, scope: !117)
!123 = !DILocation(line: 20, column: 15, scope: !117)
!124 = !DILocation(line: 20, column: 22, scope: !102)
!125 = !DILocation(line: 17, column: 27, scope: !99)
!126 = !DILocation(line: 17, column: 8, scope: !99)
!127 = distinct !{!127, !100, !128}
!128 = !DILocation(line: 20, column: 22, scope: !93)
!129 = !DILocation(line: 21, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !94, file: !1, line: 21, column: 7)
!131 = !DILocation(line: 21, column: 9, scope: !130)
!132 = !DILocation(line: 21, column: 7, scope: !94)
!133 = !DILocation(line: 21, column: 22, scope: !130)
!134 = !DILocation(line: 21, column: 21, scope: !130)
!135 = !DILocation(line: 21, column: 17, scope: !130)
!136 = !DILocation(line: 21, column: 15, scope: !130)
!137 = !DILocation(line: 22, column: 8, scope: !130)
!138 = !DILocation(line: 23, column: 2, scope: !94)
!139 = distinct !{!139, !91, !140}
!140 = !DILocation(line: 23, column: 11, scope: !61)
!141 = !DILocation(line: 24, column: 36, scope: !61)
!142 = !DILocation(line: 24, column: 39, scope: !61)
!143 = !DILocation(line: 24, column: 2, scope: !61)
!144 = !DILocation(line: 24, column: 42, scope: !61)
