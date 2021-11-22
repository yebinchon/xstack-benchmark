; ModuleID = 'catalan-numbers-1.ll'
source_filename = "catalan-numbers-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"\09direct\09summing\09frac\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%d\09%llu\09%llu\09%llu\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @binomial(i64 %m, i64 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i64 %m, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %n, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 1, metadata !15, metadata !DIExpression()), !dbg !13
  %sub = sub i64 %m, %n, !dbg !16
  call void @llvm.dbg.value(metadata i64 %sub, metadata !17, metadata !DIExpression()), !dbg !13
  %cmp = icmp ugt i64 %sub, %n, !dbg !18
  br i1 %cmp, label %if.then, label %if.end, !dbg !20, !cf.info !21

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 %sub, metadata !14, metadata !DIExpression()), !dbg !13
  %sub1 = sub i64 %m, %sub, !dbg !22
  call void @llvm.dbg.value(metadata i64 %sub1, metadata !17, metadata !DIExpression()), !dbg !13
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %d.0 = phi i64 [ %sub1, %if.then ], [ %sub, %entry ], !dbg !13
  %n.addr.0 = phi i64 [ %sub, %if.then ], [ %n, %entry ]
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !17, metadata !DIExpression()), !dbg !13
  br label %while.cond, !dbg !25

while.cond:                                       ; preds = %while.end, %if.end
  %d.1 = phi i64 [ %d.0, %if.end ], [ %d.2, %while.end ], !dbg !26
  %r.0 = phi i64 [ 1, %if.end ], [ %r.1, %while.end ], !dbg !13
  %m.addr.0 = phi i64 [ %m, %if.end ], [ %dec, %while.end ]
  call void @llvm.dbg.value(metadata i64 %m.addr.0, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %r.0, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.1, metadata !17, metadata !DIExpression()), !dbg !13
  %cmp2 = icmp ugt i64 %m.addr.0, %n.addr.0, !dbg !27
  br i1 %cmp2, label %while.body, label %while.end7, !dbg !25

while.body:                                       ; preds = %while.cond
  %dec = add i64 %m.addr.0, -1, !dbg !28
  call void @llvm.dbg.value(metadata i64 %dec, metadata !12, metadata !DIExpression()), !dbg !13
  %mul = mul i64 %r.0, %m.addr.0, !dbg !30
  call void @llvm.dbg.value(metadata i64 %mul, metadata !15, metadata !DIExpression()), !dbg !13
  br label %while.cond3, !dbg !31

while.cond3:                                      ; preds = %while.body5, %while.body
  %d.2 = phi i64 [ %d.1, %while.body ], [ %dec6, %while.body5 ], !dbg !13
  %r.1 = phi i64 [ %mul, %while.body ], [ %div, %while.body5 ], !dbg !32
  call void @llvm.dbg.value(metadata i64 %r.1, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.2, metadata !17, metadata !DIExpression()), !dbg !13
  %cmp4 = icmp ugt i64 %d.2, 1, !dbg !33
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !34

land.rhs:                                         ; preds = %while.cond3
  %rem = urem i64 %r.1, %d.2, !dbg !35
  %tobool = icmp ne i64 %rem, 0, !dbg !36
  %lnot = xor i1 %tobool, true, !dbg !36
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %0 = phi i1 [ false, %while.cond3 ], [ %lnot, %land.rhs ], !dbg !32
  br i1 %0, label %while.body5, label %while.end, !dbg !31

while.body5:                                      ; preds = %land.end
  %dec6 = add i64 %d.2, -1, !dbg !37
  call void @llvm.dbg.value(metadata i64 %dec6, metadata !17, metadata !DIExpression()), !dbg !13
  %div = udiv i64 %r.1, %d.2, !dbg !38
  call void @llvm.dbg.value(metadata i64 %div, metadata !15, metadata !DIExpression()), !dbg !13
  br label %while.cond3, !dbg !31, !llvm.loop !39

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !25, !llvm.loop !40

while.end7:                                       ; preds = %while.cond
  ret i64 %r.0, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan1(i32 %n) #0 !dbg !43 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !47, metadata !DIExpression()), !dbg !48
  %mul = mul nsw i32 2, %n, !dbg !49
  %conv = sext i32 %mul to i64, !dbg !50
  %conv1 = sext i32 %n to i64, !dbg !51
  %call = call i64 @binomial(i64 %conv, i64 %conv1), !dbg !52
  %add = add nsw i32 1, %n, !dbg !53
  %conv2 = sext i32 %add to i64, !dbg !54
  %div = udiv i64 %call, %conv2, !dbg !55
  ret i64 %div, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan2(i32 %n) #0 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !58, metadata !DIExpression()), !dbg !59
  %tobool = icmp ne i32 %n, 0, !dbg !60
  %lnot = xor i1 %tobool, true, !dbg !60
  %lnot.ext = zext i1 %lnot to i32, !dbg !60
  %conv = sext i32 %lnot.ext to i64, !dbg !60
  call void @llvm.dbg.value(metadata i64 %conv, metadata !61, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !62, metadata !DIExpression()), !dbg !59
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !65
  %r.0 = phi i64 [ %conv, %entry ], [ %add, %for.inc ], !dbg !59
  call void @llvm.dbg.value(metadata i64 %r.0, metadata !61, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !62, metadata !DIExpression()), !dbg !59
  %cmp = icmp slt i32 %i.0, %n, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %call = call i64 @catalan2(i32 %i.0), !dbg !69
  %sub = sub nsw i32 %n, 1, !dbg !70
  %sub2 = sub nsw i32 %sub, %i.0, !dbg !71
  %call3 = call i64 @catalan2(i32 %sub2), !dbg !72
  %mul = mul i64 %call, %call3, !dbg !73
  %add = add i64 %r.0, %mul, !dbg !74
  call void @llvm.dbg.value(metadata i64 %add, metadata !61, metadata !DIExpression()), !dbg !59
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %inc, metadata !62, metadata !DIExpression()), !dbg !59
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan3(i32 %n) #0 !dbg !81 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !82, metadata !DIExpression()), !dbg !83
  %tobool = icmp ne i32 %n, 0, !dbg !84
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !84

cond.true:                                        ; preds = %entry
  %mul = mul nsw i32 2, %n, !dbg !85
  %sub = sub nsw i32 %mul, 1, !dbg !86
  %mul1 = mul nsw i32 2, %sub, !dbg !87
  %conv = sext i32 %mul1 to i64, !dbg !88
  %sub2 = sub nsw i32 %n, 1, !dbg !89
  %call = call i64 @catalan3(i32 %sub2), !dbg !90
  %mul3 = mul i64 %conv, %call, !dbg !91
  %add = add nsw i32 1, %n, !dbg !92
  %conv4 = sext i32 %add to i64, !dbg !93
  %div = udiv i64 %mul3, %conv4, !dbg !94
  br label %cond.end, !dbg !84

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !84

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %cond.false ], !dbg !84
  ret i64 %cond, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !96 {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @llvm.dbg.value(metadata i32 0, metadata !100, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !100, metadata !DIExpression()), !dbg !101
  %cmp = icmp slt i32 %i.0, 16, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %call1 = call i64 @catalan1(i32 %i.0), !dbg !108
  %call2 = call i64 @catalan2(i32 %i.0), !dbg !110
  %call3 = call i64 @catalan3(i32 %i.0), !dbg !111
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %i.0, i64 %call1, i64 %call2, i64 %call3), !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !114
  call void @llvm.dbg.value(metadata i32 %inc, metadata !100, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !118
}

declare dso_local i32 @puts(i8*) #2

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 19, scope: !7)
!17 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocation(line: 8, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!20 = !DILocation(line: 8, column: 6, scope: !7)
!21 = !{!"if"}
!22 = !DILocation(line: 8, column: 28, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 13)
!24 = !DILocation(line: 8, column: 33, scope: !23)
!25 = !DILocation(line: 10, column: 2, scope: !7)
!26 = !DILocation(line: 8, column: 24, scope: !23)
!27 = !DILocation(line: 10, column: 11, scope: !7)
!28 = !DILocation(line: 11, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 16)
!30 = !DILocation(line: 11, column: 5, scope: !29)
!31 = !DILocation(line: 12, column: 3, scope: !29)
!32 = !DILocation(line: 0, scope: !29)
!33 = !DILocation(line: 12, column: 12, scope: !29)
!34 = !DILocation(line: 12, column: 16, scope: !29)
!35 = !DILocation(line: 12, column: 23, scope: !29)
!36 = !DILocation(line: 12, column: 19, scope: !29)
!37 = !DILocation(line: 12, column: 35, scope: !29)
!38 = !DILocation(line: 12, column: 31, scope: !29)
!39 = distinct !{!39, !31, !37}
!40 = distinct !{!40, !25, !41}
!41 = !DILocation(line: 13, column: 2, scope: !7)
!42 = !DILocation(line: 15, column: 2, scope: !7)
!43 = distinct !DISubprogram(name: "catalan1", scope: !1, file: !1, line: 18, type: !44, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10, !46}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DILocalVariable(name: "n", arg: 1, scope: !43, file: !1, line: 18, type: !46)
!48 = !DILocation(line: 0, scope: !43)
!49 = !DILocation(line: 19, column: 20, scope: !43)
!50 = !DILocation(line: 19, column: 18, scope: !43)
!51 = !DILocation(line: 19, column: 25, scope: !43)
!52 = !DILocation(line: 19, column: 9, scope: !43)
!53 = !DILocation(line: 19, column: 33, scope: !43)
!54 = !DILocation(line: 19, column: 30, scope: !43)
!55 = !DILocation(line: 19, column: 28, scope: !43)
!56 = !DILocation(line: 19, column: 2, scope: !43)
!57 = distinct !DISubprogram(name: "catalan2", scope: !1, file: !1, line: 22, type: !44, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "n", arg: 1, scope: !57, file: !1, line: 22, type: !46)
!59 = !DILocation(line: 0, scope: !57)
!60 = !DILocation(line: 24, column: 10, scope: !57)
!61 = !DILocalVariable(name: "r", scope: !57, file: !1, line: 24, type: !10)
!62 = !DILocalVariable(name: "i", scope: !57, file: !1, line: 23, type: !46)
!63 = !DILocation(line: 26, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 26, column: 2)
!65 = !DILocation(line: 0, scope: !64)
!66 = !DILocation(line: 26, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 26, column: 2)
!68 = !DILocation(line: 26, column: 2, scope: !64)
!69 = !DILocation(line: 27, column: 8, scope: !67)
!70 = !DILocation(line: 27, column: 33, scope: !67)
!71 = !DILocation(line: 27, column: 37, scope: !67)
!72 = !DILocation(line: 27, column: 22, scope: !67)
!73 = !DILocation(line: 27, column: 20, scope: !67)
!74 = !DILocation(line: 27, column: 5, scope: !67)
!75 = !DILocation(line: 27, column: 3, scope: !67)
!76 = !DILocation(line: 26, column: 22, scope: !67)
!77 = !DILocation(line: 26, column: 2, scope: !67)
!78 = distinct !{!78, !68, !79}
!79 = !DILocation(line: 27, column: 40, scope: !64)
!80 = !DILocation(line: 28, column: 2, scope: !57)
!81 = distinct !DISubprogram(name: "catalan3", scope: !1, file: !1, line: 31, type: !44, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "n", arg: 1, scope: !81, file: !1, line: 31, type: !46)
!83 = !DILocation(line: 0, scope: !81)
!84 = !DILocation(line: 33, column: 9, scope: !81)
!85 = !DILocation(line: 33, column: 20, scope: !81)
!86 = !DILocation(line: 33, column: 24, scope: !81)
!87 = !DILocation(line: 33, column: 15, scope: !81)
!88 = !DILocation(line: 33, column: 13, scope: !81)
!89 = !DILocation(line: 33, column: 42, scope: !81)
!90 = !DILocation(line: 33, column: 31, scope: !81)
!91 = !DILocation(line: 33, column: 29, scope: !81)
!92 = !DILocation(line: 33, column: 52, scope: !81)
!93 = !DILocation(line: 33, column: 49, scope: !81)
!94 = !DILocation(line: 33, column: 47, scope: !81)
!95 = !DILocation(line: 33, column: 2, scope: !81)
!96 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !97, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!46}
!99 = !DILocation(line: 39, column: 2, scope: !96)
!100 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 38, type: !46)
!101 = !DILocation(line: 0, scope: !96)
!102 = !DILocation(line: 40, column: 7, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !1, line: 40, column: 2)
!104 = !DILocation(line: 0, scope: !103)
!105 = !DILocation(line: 40, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 40, column: 2)
!107 = !DILocation(line: 40, column: 2, scope: !103)
!108 = !DILocation(line: 42, column: 4, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 40, column: 27)
!110 = !DILocation(line: 42, column: 17, scope: !109)
!111 = !DILocation(line: 42, column: 30, scope: !109)
!112 = !DILocation(line: 41, column: 3, scope: !109)
!113 = !DILocation(line: 43, column: 2, scope: !109)
!114 = !DILocation(line: 40, column: 23, scope: !106)
!115 = !DILocation(line: 40, column: 2, scope: !106)
!116 = distinct !{!116, !107, !117}
!117 = !DILocation(line: 43, column: 2, scope: !103)
!118 = !DILocation(line: 45, column: 2, scope: !96)
