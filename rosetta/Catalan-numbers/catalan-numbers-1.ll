; ModuleID = 'catalan-numbers-1.c'
source_filename = "catalan-numbers-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"\09direct\09summing\09frac\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%d\09%llu\09%llu\09%llu\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @binomial(i64 %m, i64 %n) #0 !dbg !7 {
entry:
  %m.addr = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %r = alloca i64, align 8
  %d = alloca i64, align 8
  store i64 %m, i64* %m.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %m.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i64* %r, metadata !16, metadata !DIExpression()), !dbg !17
  store i64 1, i64* %r, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata i64* %d, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i64, i64* %m.addr, align 8, !dbg !20
  %1 = load i64, i64* %n.addr, align 8, !dbg !21
  %sub = sub i64 %0, %1, !dbg !22
  store i64 %sub, i64* %d, align 8, !dbg !19
  %2 = load i64, i64* %d, align 8, !dbg !23
  %3 = load i64, i64* %n.addr, align 8, !dbg !25
  %cmp = icmp ugt i64 %2, %3, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27, !cf.info !28

if.then:                                          ; preds = %entry
  %4 = load i64, i64* %d, align 8, !dbg !29
  store i64 %4, i64* %n.addr, align 8, !dbg !31
  %5 = load i64, i64* %m.addr, align 8, !dbg !32
  %6 = load i64, i64* %n.addr, align 8, !dbg !33
  %sub1 = sub i64 %5, %6, !dbg !34
  store i64 %sub1, i64* %d, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !37

while.cond:                                       ; preds = %while.end, %if.end
  %7 = load i64, i64* %m.addr, align 8, !dbg !38
  %8 = load i64, i64* %n.addr, align 8, !dbg !39
  %cmp2 = icmp ugt i64 %7, %8, !dbg !40
  br i1 %cmp2, label %while.body, label %while.end7, !dbg !37

while.body:                                       ; preds = %while.cond
  %9 = load i64, i64* %m.addr, align 8, !dbg !41
  %dec = add i64 %9, -1, !dbg !41
  store i64 %dec, i64* %m.addr, align 8, !dbg !41
  %10 = load i64, i64* %r, align 8, !dbg !43
  %mul = mul i64 %10, %9, !dbg !43
  store i64 %mul, i64* %r, align 8, !dbg !43
  br label %while.cond3, !dbg !44

while.cond3:                                      ; preds = %while.body5, %while.body
  %11 = load i64, i64* %d, align 8, !dbg !45
  %cmp4 = icmp ugt i64 %11, 1, !dbg !46
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !47

land.rhs:                                         ; preds = %while.cond3
  %12 = load i64, i64* %r, align 8, !dbg !48
  %13 = load i64, i64* %d, align 8, !dbg !49
  %rem = urem i64 %12, %13, !dbg !50
  %tobool = icmp ne i64 %rem, 0, !dbg !51
  %lnot = xor i1 %tobool, true, !dbg !51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %14 = phi i1 [ false, %while.cond3 ], [ %lnot, %land.rhs ], !dbg !52
  br i1 %14, label %while.body5, label %while.end, !dbg !44

while.body5:                                      ; preds = %land.end
  %15 = load i64, i64* %d, align 8, !dbg !53
  %dec6 = add i64 %15, -1, !dbg !53
  store i64 %dec6, i64* %d, align 8, !dbg !53
  %16 = load i64, i64* %r, align 8, !dbg !54
  %div = udiv i64 %16, %15, !dbg !54
  store i64 %div, i64* %r, align 8, !dbg !54
  br label %while.cond3, !dbg !44, !llvm.loop !55

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !37, !llvm.loop !56

while.end7:                                       ; preds = %while.cond
  %17 = load i64, i64* %r, align 8, !dbg !58
  ret i64 %17, !dbg !59
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan1(i32 %n) #0 !dbg !60 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32, i32* %n.addr, align 4, !dbg !66
  %mul = mul nsw i32 2, %0, !dbg !67
  %conv = sext i32 %mul to i64, !dbg !68
  %1 = load i32, i32* %n.addr, align 4, !dbg !69
  %conv1 = sext i32 %1 to i64, !dbg !69
  %call = call i64 @binomial(i64 %conv, i64 %conv1), !dbg !70
  %2 = load i32, i32* %n.addr, align 4, !dbg !71
  %add = add nsw i32 1, %2, !dbg !72
  %conv2 = sext i32 %add to i64, !dbg !73
  %div = udiv i64 %call, %conv2, !dbg !74
  ret i64 %div, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan2(i32 %n) #0 !dbg !76 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %i, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %r, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* %n.addr, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !84
  %lnot = xor i1 %tobool, true, !dbg !84
  %lnot.ext = zext i1 %lnot to i32, !dbg !84
  %conv = sext i32 %lnot.ext to i64, !dbg !84
  store i64 %conv, i64* %r, align 8, !dbg !82
  store i32 0, i32* %i, align 4, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !88
  %2 = load i32, i32* %n.addr, align 4, !dbg !90
  %cmp = icmp slt i32 %1, %2, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !93
  %call = call i64 @catalan2(i32 %3), !dbg !94
  %4 = load i32, i32* %n.addr, align 4, !dbg !95
  %sub = sub nsw i32 %4, 1, !dbg !96
  %5 = load i32, i32* %i, align 4, !dbg !97
  %sub2 = sub nsw i32 %sub, %5, !dbg !98
  %call3 = call i64 @catalan2(i32 %sub2), !dbg !99
  %mul = mul i64 %call, %call3, !dbg !100
  %6 = load i64, i64* %r, align 8, !dbg !101
  %add = add i64 %6, %mul, !dbg !101
  store i64 %add, i64* %r, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !103
  %inc = add nsw i32 %7, 1, !dbg !103
  store i32 %inc, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %8 = load i64, i64* %r, align 8, !dbg !107
  ret i64 %8, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan3(i32 %n) #0 !dbg !109 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* %n.addr, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !112

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !113
  %mul = mul nsw i32 2, %1, !dbg !114
  %sub = sub nsw i32 %mul, 1, !dbg !115
  %mul1 = mul nsw i32 2, %sub, !dbg !116
  %conv = sext i32 %mul1 to i64, !dbg !117
  %2 = load i32, i32* %n.addr, align 4, !dbg !118
  %sub2 = sub nsw i32 %2, 1, !dbg !119
  %call = call i64 @catalan3(i32 %sub2), !dbg !120
  %mul3 = mul i64 %conv, %call, !dbg !121
  %3 = load i32, i32* %n.addr, align 4, !dbg !122
  %add = add nsw i32 1, %3, !dbg !123
  %conv4 = sext i32 %add to i64, !dbg !124
  %div = udiv i64 %mul3, %conv4, !dbg !125
  br label %cond.end, !dbg !112

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !112

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %cond.false ], !dbg !112
  ret i64 %cond, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !136
  %cmp = icmp slt i32 %0, 16, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !140
  %2 = load i32, i32* %i, align 4, !dbg !142
  %call1 = call i64 @catalan1(i32 %2), !dbg !143
  %3 = load i32, i32* %i, align 4, !dbg !144
  %call2 = call i64 @catalan2(i32 %3), !dbg !145
  %4 = load i32, i32* %i, align 4, !dbg !146
  %call3 = call i64 @catalan3(i32 %4), !dbg !147
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %1, i64 %call1, i64 %call2, i64 %call3), !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %5, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !154
}

declare dso_local i32 @puts(i8*) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "catalan-numbers-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Catalan-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "binomial", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "ull", file: !1, line: 3, baseType: !11)
!11 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!12 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!13 = !DILocation(line: 5, column: 18, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 25, scope: !7)
!16 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocation(line: 7, column: 6, scope: !7)
!18 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 7, column: 13, scope: !7)
!20 = !DILocation(line: 7, column: 17, scope: !7)
!21 = !DILocation(line: 7, column: 21, scope: !7)
!22 = !DILocation(line: 7, column: 19, scope: !7)
!23 = !DILocation(line: 8, column: 6, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!25 = !DILocation(line: 8, column: 10, scope: !24)
!26 = !DILocation(line: 8, column: 8, scope: !24)
!27 = !DILocation(line: 8, column: 6, scope: !7)
!28 = !{!"if"}
!29 = !DILocation(line: 8, column: 19, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !1, line: 8, column: 13)
!31 = !DILocation(line: 8, column: 17, scope: !30)
!32 = !DILocation(line: 8, column: 26, scope: !30)
!33 = !DILocation(line: 8, column: 30, scope: !30)
!34 = !DILocation(line: 8, column: 28, scope: !30)
!35 = !DILocation(line: 8, column: 24, scope: !30)
!36 = !DILocation(line: 8, column: 33, scope: !30)
!37 = !DILocation(line: 10, column: 2, scope: !7)
!38 = !DILocation(line: 10, column: 9, scope: !7)
!39 = !DILocation(line: 10, column: 13, scope: !7)
!40 = !DILocation(line: 10, column: 11, scope: !7)
!41 = !DILocation(line: 11, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 16)
!43 = !DILocation(line: 11, column: 5, scope: !42)
!44 = !DILocation(line: 12, column: 3, scope: !42)
!45 = !DILocation(line: 12, column: 10, scope: !42)
!46 = !DILocation(line: 12, column: 12, scope: !42)
!47 = !DILocation(line: 12, column: 16, scope: !42)
!48 = !DILocation(line: 12, column: 22, scope: !42)
!49 = !DILocation(line: 12, column: 24, scope: !42)
!50 = !DILocation(line: 12, column: 23, scope: !42)
!51 = !DILocation(line: 12, column: 19, scope: !42)
!52 = !DILocation(line: 0, scope: !42)
!53 = !DILocation(line: 12, column: 35, scope: !42)
!54 = !DILocation(line: 12, column: 31, scope: !42)
!55 = distinct !{!55, !44, !53}
!56 = distinct !{!56, !37, !57}
!57 = !DILocation(line: 13, column: 2, scope: !7)
!58 = !DILocation(line: 15, column: 9, scope: !7)
!59 = !DILocation(line: 15, column: 2, scope: !7)
!60 = distinct !DISubprogram(name: "catalan1", scope: !1, file: !1, line: 18, type: !61, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!10, !63}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DILocalVariable(name: "n", arg: 1, scope: !60, file: !1, line: 18, type: !63)
!65 = !DILocation(line: 18, column: 18, scope: !60)
!66 = !DILocation(line: 19, column: 22, scope: !60)
!67 = !DILocation(line: 19, column: 20, scope: !60)
!68 = !DILocation(line: 19, column: 18, scope: !60)
!69 = !DILocation(line: 19, column: 25, scope: !60)
!70 = !DILocation(line: 19, column: 9, scope: !60)
!71 = !DILocation(line: 19, column: 35, scope: !60)
!72 = !DILocation(line: 19, column: 33, scope: !60)
!73 = !DILocation(line: 19, column: 30, scope: !60)
!74 = !DILocation(line: 19, column: 28, scope: !60)
!75 = !DILocation(line: 19, column: 2, scope: !60)
!76 = distinct !DISubprogram(name: "catalan2", scope: !1, file: !1, line: 22, type: !61, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "n", arg: 1, scope: !76, file: !1, line: 22, type: !63)
!78 = !DILocation(line: 22, column: 18, scope: !76)
!79 = !DILocalVariable(name: "i", scope: !76, file: !1, line: 23, type: !63)
!80 = !DILocation(line: 23, column: 6, scope: !76)
!81 = !DILocalVariable(name: "r", scope: !76, file: !1, line: 24, type: !10)
!82 = !DILocation(line: 24, column: 6, scope: !76)
!83 = !DILocation(line: 24, column: 11, scope: !76)
!84 = !DILocation(line: 24, column: 10, scope: !76)
!85 = !DILocation(line: 26, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !1, line: 26, column: 2)
!87 = !DILocation(line: 26, column: 7, scope: !86)
!88 = !DILocation(line: 26, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 26, column: 2)
!90 = !DILocation(line: 26, column: 18, scope: !89)
!91 = !DILocation(line: 26, column: 16, scope: !89)
!92 = !DILocation(line: 26, column: 2, scope: !86)
!93 = !DILocation(line: 27, column: 17, scope: !89)
!94 = !DILocation(line: 27, column: 8, scope: !89)
!95 = !DILocation(line: 27, column: 31, scope: !89)
!96 = !DILocation(line: 27, column: 33, scope: !89)
!97 = !DILocation(line: 27, column: 39, scope: !89)
!98 = !DILocation(line: 27, column: 37, scope: !89)
!99 = !DILocation(line: 27, column: 22, scope: !89)
!100 = !DILocation(line: 27, column: 20, scope: !89)
!101 = !DILocation(line: 27, column: 5, scope: !89)
!102 = !DILocation(line: 27, column: 3, scope: !89)
!103 = !DILocation(line: 26, column: 22, scope: !89)
!104 = !DILocation(line: 26, column: 2, scope: !89)
!105 = distinct !{!105, !92, !106}
!106 = !DILocation(line: 27, column: 40, scope: !86)
!107 = !DILocation(line: 28, column: 9, scope: !76)
!108 = !DILocation(line: 28, column: 2, scope: !76)
!109 = distinct !DISubprogram(name: "catalan3", scope: !1, file: !1, line: 31, type: !61, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "n", arg: 1, scope: !109, file: !1, line: 31, type: !63)
!111 = !DILocation(line: 31, column: 18, scope: !109)
!112 = !DILocation(line: 33, column: 9, scope: !109)
!113 = !DILocation(line: 33, column: 22, scope: !109)
!114 = !DILocation(line: 33, column: 20, scope: !109)
!115 = !DILocation(line: 33, column: 24, scope: !109)
!116 = !DILocation(line: 33, column: 15, scope: !109)
!117 = !DILocation(line: 33, column: 13, scope: !109)
!118 = !DILocation(line: 33, column: 40, scope: !109)
!119 = !DILocation(line: 33, column: 42, scope: !109)
!120 = !DILocation(line: 33, column: 31, scope: !109)
!121 = !DILocation(line: 33, column: 29, scope: !109)
!122 = !DILocation(line: 33, column: 54, scope: !109)
!123 = !DILocation(line: 33, column: 52, scope: !109)
!124 = !DILocation(line: 33, column: 49, scope: !109)
!125 = !DILocation(line: 33, column: 47, scope: !109)
!126 = !DILocation(line: 33, column: 2, scope: !109)
!127 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !128, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DISubroutineType(types: !129)
!129 = !{!63}
!130 = !DILocalVariable(name: "i", scope: !127, file: !1, line: 38, type: !63)
!131 = !DILocation(line: 38, column: 6, scope: !127)
!132 = !DILocation(line: 39, column: 2, scope: !127)
!133 = !DILocation(line: 40, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !1, line: 40, column: 2)
!135 = !DILocation(line: 40, column: 7, scope: !134)
!136 = !DILocation(line: 40, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !1, line: 40, column: 2)
!138 = !DILocation(line: 40, column: 16, scope: !137)
!139 = !DILocation(line: 40, column: 2, scope: !134)
!140 = !DILocation(line: 41, column: 36, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !1, line: 40, column: 27)
!142 = !DILocation(line: 42, column: 13, scope: !141)
!143 = !DILocation(line: 42, column: 4, scope: !141)
!144 = !DILocation(line: 42, column: 26, scope: !141)
!145 = !DILocation(line: 42, column: 17, scope: !141)
!146 = !DILocation(line: 42, column: 39, scope: !141)
!147 = !DILocation(line: 42, column: 30, scope: !141)
!148 = !DILocation(line: 41, column: 3, scope: !141)
!149 = !DILocation(line: 43, column: 2, scope: !141)
!150 = !DILocation(line: 40, column: 23, scope: !137)
!151 = !DILocation(line: 40, column: 2, scope: !137)
!152 = distinct !{!152, !139, !153}
!153 = !DILocation(line: 43, column: 2, scope: !134)
!154 = !DILocation(line: 45, column: 2, scope: !127)
