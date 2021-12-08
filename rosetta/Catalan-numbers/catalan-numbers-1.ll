; ModuleID = 'catalan-numbers-1.ll'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %4 = load i64, i64* %d, align 8, !dbg !28
  store i64 %4, i64* %n.addr, align 8, !dbg !30
  %5 = load i64, i64* %m.addr, align 8, !dbg !31
  %6 = load i64, i64* %n.addr, align 8, !dbg !32
  %sub1 = sub i64 %5, %6, !dbg !33
  store i64 %sub1, i64* %d, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !36

while.cond:                                       ; preds = %while.end, %if.end
  %7 = load i64, i64* %m.addr, align 8, !dbg !37
  %8 = load i64, i64* %n.addr, align 8, !dbg !38
  %cmp2 = icmp ugt i64 %7, %8, !dbg !39
  br i1 %cmp2, label %while.body, label %while.end7, !dbg !36

while.body:                                       ; preds = %while.cond
  %9 = load i64, i64* %m.addr, align 8, !dbg !40
  %dec = add i64 %9, -1, !dbg !40
  store i64 %dec, i64* %m.addr, align 8, !dbg !40
  %10 = load i64, i64* %r, align 8, !dbg !42
  %mul = mul i64 %10, %9, !dbg !42
  store i64 %mul, i64* %r, align 8, !dbg !42
  br label %while.cond3, !dbg !43

while.cond3:                                      ; preds = %while.body5, %while.body
  %11 = load i64, i64* %d, align 8, !dbg !44
  %cmp4 = icmp ugt i64 %11, 1, !dbg !45
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !46

land.rhs:                                         ; preds = %while.cond3
  %12 = load i64, i64* %r, align 8, !dbg !47
  %13 = load i64, i64* %d, align 8, !dbg !48
  %rem = urem i64 %12, %13, !dbg !49
  %tobool = icmp ne i64 %rem, 0, !dbg !50
  %lnot = xor i1 %tobool, true, !dbg !50
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %14 = phi i1 [ false, %while.cond3 ], [ %lnot, %land.rhs ], !dbg !51
  br i1 %14, label %while.body5, label %while.end, !dbg !43

while.body5:                                      ; preds = %land.end
  %15 = load i64, i64* %d, align 8, !dbg !52
  %dec6 = add i64 %15, -1, !dbg !52
  store i64 %dec6, i64* %d, align 8, !dbg !52
  %16 = load i64, i64* %r, align 8, !dbg !53
  %div = udiv i64 %16, %15, !dbg !53
  store i64 %div, i64* %r, align 8, !dbg !53
  br label %while.cond3, !dbg !43, !llvm.loop !54

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !36, !llvm.loop !55

while.end7:                                       ; preds = %while.cond
  %17 = load i64, i64* %r, align 8, !dbg !57
  ret i64 %17, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan1(i32 %n) #0 !dbg !59 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* %n.addr, align 4, !dbg !65
  %mul = mul nsw i32 2, %0, !dbg !66
  %conv = sext i32 %mul to i64, !dbg !67
  %1 = load i32, i32* %n.addr, align 4, !dbg !68
  %conv1 = sext i32 %1 to i64, !dbg !68
  %call = call i64 @binomial(i64 %conv, i64 %conv1), !dbg !69
  %2 = load i32, i32* %n.addr, align 4, !dbg !70
  %add = add nsw i32 1, %2, !dbg !71
  %conv2 = sext i32 %add to i64, !dbg !72
  %div = udiv i64 %call, %conv2, !dbg !73
  ret i64 %div, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan2(i32 %n) #0 !dbg !75 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %r, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32, i32* %n.addr, align 4, !dbg !82
  %tobool = icmp ne i32 %0, 0, !dbg !83
  %lnot = xor i1 %tobool, true, !dbg !83
  %lnot.ext = zext i1 %lnot to i32, !dbg !83
  %conv = sext i32 %lnot.ext to i64, !dbg !83
  store i64 %conv, i64* %r, align 8, !dbg !81
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !87
  %2 = load i32, i32* %n.addr, align 4, !dbg !89
  %cmp = icmp slt i32 %1, %2, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !92
  %call = call i64 @catalan2(i32 %3), !dbg !93
  %4 = load i32, i32* %n.addr, align 4, !dbg !94
  %sub = sub nsw i32 %4, 1, !dbg !95
  %5 = load i32, i32* %i, align 4, !dbg !96
  %sub2 = sub nsw i32 %sub, %5, !dbg !97
  %call3 = call i64 @catalan2(i32 %sub2), !dbg !98
  %mul = mul i64 %call, %call3, !dbg !99
  %6 = load i64, i64* %r, align 8, !dbg !100
  %add = add i64 %6, %mul, !dbg !100
  store i64 %add, i64* %r, align 8, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !102
  %inc = add nsw i32 %7, 1, !dbg !102
  store i32 %inc, i32* %i, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %8 = load i64, i64* %r, align 8, !dbg !106
  ret i64 %8, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan3(i32 %n) #0 !dbg !108 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* %n.addr, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !111

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !112
  %mul = mul nsw i32 2, %1, !dbg !113
  %sub = sub nsw i32 %mul, 1, !dbg !114
  %mul1 = mul nsw i32 2, %sub, !dbg !115
  %conv = sext i32 %mul1 to i64, !dbg !116
  %2 = load i32, i32* %n.addr, align 4, !dbg !117
  %sub2 = sub nsw i32 %2, 1, !dbg !118
  %call = call i64 @catalan3(i32 %sub2), !dbg !119
  %mul3 = mul i64 %conv, %call, !dbg !120
  %3 = load i32, i32* %n.addr, align 4, !dbg !121
  %add = add nsw i32 1, %3, !dbg !122
  %conv4 = sext i32 %add to i64, !dbg !123
  %div = udiv i64 %mul3, %conv4, !dbg !124
  br label %cond.end, !dbg !111

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !111

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %cond.false ], !dbg !111
  ret i64 %cond, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !126 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !135
  %cmp = icmp slt i32 %0, 16, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !139
  %2 = load i32, i32* %i, align 4, !dbg !141
  %call1 = call i64 @catalan1(i32 %2), !dbg !142
  %3 = load i32, i32* %i, align 4, !dbg !143
  %call2 = call i64 @catalan2(i32 %3), !dbg !144
  %4 = load i32, i32* %i, align 4, !dbg !145
  %call3 = call i64 @catalan3(i32 %4), !dbg !146
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %1, i64 %call1, i64 %call2, i64 %call3), !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %5, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !153
}

declare dso_local i32 @puts(i8*) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "catalan-numbers-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Catalan-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!28 = !DILocation(line: 8, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !1, line: 8, column: 13)
!30 = !DILocation(line: 8, column: 17, scope: !29)
!31 = !DILocation(line: 8, column: 26, scope: !29)
!32 = !DILocation(line: 8, column: 30, scope: !29)
!33 = !DILocation(line: 8, column: 28, scope: !29)
!34 = !DILocation(line: 8, column: 24, scope: !29)
!35 = !DILocation(line: 8, column: 33, scope: !29)
!36 = !DILocation(line: 10, column: 2, scope: !7)
!37 = !DILocation(line: 10, column: 9, scope: !7)
!38 = !DILocation(line: 10, column: 13, scope: !7)
!39 = !DILocation(line: 10, column: 11, scope: !7)
!40 = !DILocation(line: 11, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 16)
!42 = !DILocation(line: 11, column: 5, scope: !41)
!43 = !DILocation(line: 12, column: 3, scope: !41)
!44 = !DILocation(line: 12, column: 10, scope: !41)
!45 = !DILocation(line: 12, column: 12, scope: !41)
!46 = !DILocation(line: 12, column: 16, scope: !41)
!47 = !DILocation(line: 12, column: 22, scope: !41)
!48 = !DILocation(line: 12, column: 24, scope: !41)
!49 = !DILocation(line: 12, column: 23, scope: !41)
!50 = !DILocation(line: 12, column: 19, scope: !41)
!51 = !DILocation(line: 0, scope: !41)
!52 = !DILocation(line: 12, column: 35, scope: !41)
!53 = !DILocation(line: 12, column: 31, scope: !41)
!54 = distinct !{!54, !43, !52}
!55 = distinct !{!55, !36, !56}
!56 = !DILocation(line: 13, column: 2, scope: !7)
!57 = !DILocation(line: 15, column: 9, scope: !7)
!58 = !DILocation(line: 15, column: 2, scope: !7)
!59 = distinct !DISubprogram(name: "catalan1", scope: !1, file: !1, line: 18, type: !60, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!10, !62}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DILocalVariable(name: "n", arg: 1, scope: !59, file: !1, line: 18, type: !62)
!64 = !DILocation(line: 18, column: 18, scope: !59)
!65 = !DILocation(line: 19, column: 22, scope: !59)
!66 = !DILocation(line: 19, column: 20, scope: !59)
!67 = !DILocation(line: 19, column: 18, scope: !59)
!68 = !DILocation(line: 19, column: 25, scope: !59)
!69 = !DILocation(line: 19, column: 9, scope: !59)
!70 = !DILocation(line: 19, column: 35, scope: !59)
!71 = !DILocation(line: 19, column: 33, scope: !59)
!72 = !DILocation(line: 19, column: 30, scope: !59)
!73 = !DILocation(line: 19, column: 28, scope: !59)
!74 = !DILocation(line: 19, column: 2, scope: !59)
!75 = distinct !DISubprogram(name: "catalan2", scope: !1, file: !1, line: 22, type: !60, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "n", arg: 1, scope: !75, file: !1, line: 22, type: !62)
!77 = !DILocation(line: 22, column: 18, scope: !75)
!78 = !DILocalVariable(name: "i", scope: !75, file: !1, line: 23, type: !62)
!79 = !DILocation(line: 23, column: 6, scope: !75)
!80 = !DILocalVariable(name: "r", scope: !75, file: !1, line: 24, type: !10)
!81 = !DILocation(line: 24, column: 6, scope: !75)
!82 = !DILocation(line: 24, column: 11, scope: !75)
!83 = !DILocation(line: 24, column: 10, scope: !75)
!84 = !DILocation(line: 26, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !1, line: 26, column: 2)
!86 = !DILocation(line: 26, column: 7, scope: !85)
!87 = !DILocation(line: 26, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 26, column: 2)
!89 = !DILocation(line: 26, column: 18, scope: !88)
!90 = !DILocation(line: 26, column: 16, scope: !88)
!91 = !DILocation(line: 26, column: 2, scope: !85)
!92 = !DILocation(line: 27, column: 17, scope: !88)
!93 = !DILocation(line: 27, column: 8, scope: !88)
!94 = !DILocation(line: 27, column: 31, scope: !88)
!95 = !DILocation(line: 27, column: 33, scope: !88)
!96 = !DILocation(line: 27, column: 39, scope: !88)
!97 = !DILocation(line: 27, column: 37, scope: !88)
!98 = !DILocation(line: 27, column: 22, scope: !88)
!99 = !DILocation(line: 27, column: 20, scope: !88)
!100 = !DILocation(line: 27, column: 5, scope: !88)
!101 = !DILocation(line: 27, column: 3, scope: !88)
!102 = !DILocation(line: 26, column: 22, scope: !88)
!103 = !DILocation(line: 26, column: 2, scope: !88)
!104 = distinct !{!104, !91, !105}
!105 = !DILocation(line: 27, column: 40, scope: !85)
!106 = !DILocation(line: 28, column: 9, scope: !75)
!107 = !DILocation(line: 28, column: 2, scope: !75)
!108 = distinct !DISubprogram(name: "catalan3", scope: !1, file: !1, line: 31, type: !60, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "n", arg: 1, scope: !108, file: !1, line: 31, type: !62)
!110 = !DILocation(line: 31, column: 18, scope: !108)
!111 = !DILocation(line: 33, column: 9, scope: !108)
!112 = !DILocation(line: 33, column: 22, scope: !108)
!113 = !DILocation(line: 33, column: 20, scope: !108)
!114 = !DILocation(line: 33, column: 24, scope: !108)
!115 = !DILocation(line: 33, column: 15, scope: !108)
!116 = !DILocation(line: 33, column: 13, scope: !108)
!117 = !DILocation(line: 33, column: 40, scope: !108)
!118 = !DILocation(line: 33, column: 42, scope: !108)
!119 = !DILocation(line: 33, column: 31, scope: !108)
!120 = !DILocation(line: 33, column: 29, scope: !108)
!121 = !DILocation(line: 33, column: 54, scope: !108)
!122 = !DILocation(line: 33, column: 52, scope: !108)
!123 = !DILocation(line: 33, column: 49, scope: !108)
!124 = !DILocation(line: 33, column: 47, scope: !108)
!125 = !DILocation(line: 33, column: 2, scope: !108)
!126 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !127, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DISubroutineType(types: !128)
!128 = !{!62}
!129 = !DILocalVariable(name: "i", scope: !126, file: !1, line: 38, type: !62)
!130 = !DILocation(line: 38, column: 6, scope: !126)
!131 = !DILocation(line: 39, column: 2, scope: !126)
!132 = !DILocation(line: 40, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !1, line: 40, column: 2)
!134 = !DILocation(line: 40, column: 7, scope: !133)
!135 = !DILocation(line: 40, column: 14, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !1, line: 40, column: 2)
!137 = !DILocation(line: 40, column: 16, scope: !136)
!138 = !DILocation(line: 40, column: 2, scope: !133)
!139 = !DILocation(line: 41, column: 36, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 40, column: 27)
!141 = !DILocation(line: 42, column: 13, scope: !140)
!142 = !DILocation(line: 42, column: 4, scope: !140)
!143 = !DILocation(line: 42, column: 26, scope: !140)
!144 = !DILocation(line: 42, column: 17, scope: !140)
!145 = !DILocation(line: 42, column: 39, scope: !140)
!146 = !DILocation(line: 42, column: 30, scope: !140)
!147 = !DILocation(line: 41, column: 3, scope: !140)
!148 = !DILocation(line: 43, column: 2, scope: !140)
!149 = !DILocation(line: 40, column: 23, scope: !136)
!150 = !DILocation(line: 40, column: 2, scope: !136)
!151 = distinct !{!151, !138, !152}
!152 = !DILocation(line: 43, column: 2, scope: !133)
!153 = !DILocation(line: 45, column: 2, scope: !126)
