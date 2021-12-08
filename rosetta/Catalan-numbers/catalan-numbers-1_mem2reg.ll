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
  br i1 %cmp, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 %sub, metadata !14, metadata !DIExpression()), !dbg !13
  %sub1 = sub i64 %m, %sub, !dbg !21
  call void @llvm.dbg.value(metadata i64 %sub1, metadata !17, metadata !DIExpression()), !dbg !13
  br label %if.end, !dbg !23

if.end:                                           ; preds = %if.then, %entry
  %d.0 = phi i64 [ %sub1, %if.then ], [ %sub, %entry ], !dbg !13
  %n.addr.0 = phi i64 [ %sub, %if.then ], [ %n, %entry ]
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !17, metadata !DIExpression()), !dbg !13
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %while.end, %if.end
  %d.1 = phi i64 [ %d.0, %if.end ], [ %d.2, %while.end ], !dbg !25
  %r.0 = phi i64 [ 1, %if.end ], [ %r.1, %while.end ], !dbg !13
  %m.addr.0 = phi i64 [ %m, %if.end ], [ %dec, %while.end ]
  call void @llvm.dbg.value(metadata i64 %m.addr.0, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %r.0, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.1, metadata !17, metadata !DIExpression()), !dbg !13
  %cmp2 = icmp ugt i64 %m.addr.0, %n.addr.0, !dbg !26
  br i1 %cmp2, label %while.body, label %while.end7, !dbg !24

while.body:                                       ; preds = %while.cond
  %dec = add i64 %m.addr.0, -1, !dbg !27
  call void @llvm.dbg.value(metadata i64 %dec, metadata !12, metadata !DIExpression()), !dbg !13
  %mul = mul i64 %r.0, %m.addr.0, !dbg !29
  call void @llvm.dbg.value(metadata i64 %mul, metadata !15, metadata !DIExpression()), !dbg !13
  br label %while.cond3, !dbg !30

while.cond3:                                      ; preds = %while.body5, %while.body
  %d.2 = phi i64 [ %d.1, %while.body ], [ %dec6, %while.body5 ], !dbg !13
  %r.1 = phi i64 [ %mul, %while.body ], [ %div, %while.body5 ], !dbg !31
  call void @llvm.dbg.value(metadata i64 %r.1, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i64 %d.2, metadata !17, metadata !DIExpression()), !dbg !13
  %cmp4 = icmp ugt i64 %d.2, 1, !dbg !32
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !33

land.rhs:                                         ; preds = %while.cond3
  %rem = urem i64 %r.1, %d.2, !dbg !34
  %tobool = icmp ne i64 %rem, 0, !dbg !35
  %lnot = xor i1 %tobool, true, !dbg !35
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %0 = phi i1 [ false, %while.cond3 ], [ %lnot, %land.rhs ], !dbg !31
  br i1 %0, label %while.body5, label %while.end, !dbg !30

while.body5:                                      ; preds = %land.end
  %dec6 = add i64 %d.2, -1, !dbg !36
  call void @llvm.dbg.value(metadata i64 %dec6, metadata !17, metadata !DIExpression()), !dbg !13
  %div = udiv i64 %r.1, %d.2, !dbg !37
  call void @llvm.dbg.value(metadata i64 %div, metadata !15, metadata !DIExpression()), !dbg !13
  br label %while.cond3, !dbg !30, !llvm.loop !38

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !24, !llvm.loop !39

while.end7:                                       ; preds = %while.cond
  ret i64 %r.0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan1(i32 %n) #0 !dbg !42 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !46, metadata !DIExpression()), !dbg !47
  %mul = mul nsw i32 2, %n, !dbg !48
  %conv = sext i32 %mul to i64, !dbg !49
  %conv1 = sext i32 %n to i64, !dbg !50
  %call = call i64 @binomial(i64 %conv, i64 %conv1), !dbg !51
  %add = add nsw i32 1, %n, !dbg !52
  %conv2 = sext i32 %add to i64, !dbg !53
  %div = udiv i64 %call, %conv2, !dbg !54
  ret i64 %div, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan2(i32 %n) #0 !dbg !56 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !57, metadata !DIExpression()), !dbg !58
  %tobool = icmp ne i32 %n, 0, !dbg !59
  %lnot = xor i1 %tobool, true, !dbg !59
  %lnot.ext = zext i1 %lnot to i32, !dbg !59
  %conv = sext i32 %lnot.ext to i64, !dbg !59
  call void @llvm.dbg.value(metadata i64 %conv, metadata !60, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i32 0, metadata !61, metadata !DIExpression()), !dbg !58
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !64
  %r.0 = phi i64 [ %conv, %entry ], [ %add, %for.inc ], !dbg !58
  call void @llvm.dbg.value(metadata i64 %r.0, metadata !60, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !61, metadata !DIExpression()), !dbg !58
  %cmp = icmp slt i32 %i.0, %n, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %call = call i64 @catalan2(i32 %i.0), !dbg !68
  %sub = sub nsw i32 %n, 1, !dbg !69
  %sub2 = sub nsw i32 %sub, %i.0, !dbg !70
  %call3 = call i64 @catalan2(i32 %sub2), !dbg !71
  %mul = mul i64 %call, %call3, !dbg !72
  %add = add i64 %r.0, %mul, !dbg !73
  call void @llvm.dbg.value(metadata i64 %add, metadata !60, metadata !DIExpression()), !dbg !58
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !75
  call void @llvm.dbg.value(metadata i32 %inc, metadata !61, metadata !DIExpression()), !dbg !58
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @catalan3(i32 %n) #0 !dbg !80 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !81, metadata !DIExpression()), !dbg !82
  %tobool = icmp ne i32 %n, 0, !dbg !83
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !83

cond.true:                                        ; preds = %entry
  %mul = mul nsw i32 2, %n, !dbg !84
  %sub = sub nsw i32 %mul, 1, !dbg !85
  %mul1 = mul nsw i32 2, %sub, !dbg !86
  %conv = sext i32 %mul1 to i64, !dbg !87
  %sub2 = sub nsw i32 %n, 1, !dbg !88
  %call = call i64 @catalan3(i32 %sub2), !dbg !89
  %mul3 = mul i64 %conv, %call, !dbg !90
  %add = add nsw i32 1, %n, !dbg !91
  %conv4 = sext i32 %add to i64, !dbg !92
  %div = udiv i64 %mul3, %conv4, !dbg !93
  br label %cond.end, !dbg !83

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !83

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %cond.false ], !dbg !83
  ret i64 %cond, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !95 {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @llvm.dbg.value(metadata i32 0, metadata !99, metadata !DIExpression()), !dbg !100
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !103
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !99, metadata !DIExpression()), !dbg !100
  %cmp = icmp slt i32 %i.0, 16, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %call1 = call i64 @catalan1(i32 %i.0), !dbg !107
  %call2 = call i64 @catalan2(i32 %i.0), !dbg !109
  %call3 = call i64 @catalan3(i32 %i.0), !dbg !110
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %i.0, i64 %call1, i64 %call2, i64 %call3), !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !113
  call void @llvm.dbg.value(metadata i32 %inc, metadata !99, metadata !DIExpression()), !dbg !100
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !117
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
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocation(line: 7, column: 19, scope: !7)
!17 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 7, type: !10)
!18 = !DILocation(line: 8, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!20 = !DILocation(line: 8, column: 6, scope: !7)
!21 = !DILocation(line: 8, column: 28, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 13)
!23 = !DILocation(line: 8, column: 33, scope: !22)
!24 = !DILocation(line: 10, column: 2, scope: !7)
!25 = !DILocation(line: 8, column: 24, scope: !22)
!26 = !DILocation(line: 10, column: 11, scope: !7)
!27 = !DILocation(line: 11, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 16)
!29 = !DILocation(line: 11, column: 5, scope: !28)
!30 = !DILocation(line: 12, column: 3, scope: !28)
!31 = !DILocation(line: 0, scope: !28)
!32 = !DILocation(line: 12, column: 12, scope: !28)
!33 = !DILocation(line: 12, column: 16, scope: !28)
!34 = !DILocation(line: 12, column: 23, scope: !28)
!35 = !DILocation(line: 12, column: 19, scope: !28)
!36 = !DILocation(line: 12, column: 35, scope: !28)
!37 = !DILocation(line: 12, column: 31, scope: !28)
!38 = distinct !{!38, !30, !36}
!39 = distinct !{!39, !24, !40}
!40 = !DILocation(line: 13, column: 2, scope: !7)
!41 = !DILocation(line: 15, column: 2, scope: !7)
!42 = distinct !DISubprogram(name: "catalan1", scope: !1, file: !1, line: 18, type: !43, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!10, !45}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DILocalVariable(name: "n", arg: 1, scope: !42, file: !1, line: 18, type: !45)
!47 = !DILocation(line: 0, scope: !42)
!48 = !DILocation(line: 19, column: 20, scope: !42)
!49 = !DILocation(line: 19, column: 18, scope: !42)
!50 = !DILocation(line: 19, column: 25, scope: !42)
!51 = !DILocation(line: 19, column: 9, scope: !42)
!52 = !DILocation(line: 19, column: 33, scope: !42)
!53 = !DILocation(line: 19, column: 30, scope: !42)
!54 = !DILocation(line: 19, column: 28, scope: !42)
!55 = !DILocation(line: 19, column: 2, scope: !42)
!56 = distinct !DISubprogram(name: "catalan2", scope: !1, file: !1, line: 22, type: !43, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "n", arg: 1, scope: !56, file: !1, line: 22, type: !45)
!58 = !DILocation(line: 0, scope: !56)
!59 = !DILocation(line: 24, column: 10, scope: !56)
!60 = !DILocalVariable(name: "r", scope: !56, file: !1, line: 24, type: !10)
!61 = !DILocalVariable(name: "i", scope: !56, file: !1, line: 23, type: !45)
!62 = !DILocation(line: 26, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 26, column: 2)
!64 = !DILocation(line: 0, scope: !63)
!65 = !DILocation(line: 26, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 26, column: 2)
!67 = !DILocation(line: 26, column: 2, scope: !63)
!68 = !DILocation(line: 27, column: 8, scope: !66)
!69 = !DILocation(line: 27, column: 33, scope: !66)
!70 = !DILocation(line: 27, column: 37, scope: !66)
!71 = !DILocation(line: 27, column: 22, scope: !66)
!72 = !DILocation(line: 27, column: 20, scope: !66)
!73 = !DILocation(line: 27, column: 5, scope: !66)
!74 = !DILocation(line: 27, column: 3, scope: !66)
!75 = !DILocation(line: 26, column: 22, scope: !66)
!76 = !DILocation(line: 26, column: 2, scope: !66)
!77 = distinct !{!77, !67, !78}
!78 = !DILocation(line: 27, column: 40, scope: !63)
!79 = !DILocation(line: 28, column: 2, scope: !56)
!80 = distinct !DISubprogram(name: "catalan3", scope: !1, file: !1, line: 31, type: !43, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "n", arg: 1, scope: !80, file: !1, line: 31, type: !45)
!82 = !DILocation(line: 0, scope: !80)
!83 = !DILocation(line: 33, column: 9, scope: !80)
!84 = !DILocation(line: 33, column: 20, scope: !80)
!85 = !DILocation(line: 33, column: 24, scope: !80)
!86 = !DILocation(line: 33, column: 15, scope: !80)
!87 = !DILocation(line: 33, column: 13, scope: !80)
!88 = !DILocation(line: 33, column: 42, scope: !80)
!89 = !DILocation(line: 33, column: 31, scope: !80)
!90 = !DILocation(line: 33, column: 29, scope: !80)
!91 = !DILocation(line: 33, column: 52, scope: !80)
!92 = !DILocation(line: 33, column: 49, scope: !80)
!93 = !DILocation(line: 33, column: 47, scope: !80)
!94 = !DILocation(line: 33, column: 2, scope: !80)
!95 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !96, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!45}
!98 = !DILocation(line: 39, column: 2, scope: !95)
!99 = !DILocalVariable(name: "i", scope: !95, file: !1, line: 38, type: !45)
!100 = !DILocation(line: 0, scope: !95)
!101 = !DILocation(line: 40, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !1, line: 40, column: 2)
!103 = !DILocation(line: 0, scope: !102)
!104 = !DILocation(line: 40, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 40, column: 2)
!106 = !DILocation(line: 40, column: 2, scope: !102)
!107 = !DILocation(line: 42, column: 4, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 40, column: 27)
!109 = !DILocation(line: 42, column: 17, scope: !108)
!110 = !DILocation(line: 42, column: 30, scope: !108)
!111 = !DILocation(line: 41, column: 3, scope: !108)
!112 = !DILocation(line: 43, column: 2, scope: !108)
!113 = !DILocation(line: 40, column: 23, scope: !105)
!114 = !DILocation(line: 40, column: 2, scope: !105)
!115 = distinct !{!115, !106, !116}
!116 = !DILocation(line: 43, column: 2, scope: !102)
!117 = !DILocation(line: 45, column: 2, scope: !95)
