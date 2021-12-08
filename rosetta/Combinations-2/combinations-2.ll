; ModuleID = 'combinations-2.ll'
source_filename = "combinations-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(i32 %m, i32 %n, i8* %c) #0 !dbg !7 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i8* %c, i8** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %c.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %1 = load i32, i32* %n.addr, align 4, !dbg !26
  %cmp = icmp slt i32 %0, %1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %n.addr, align 4, !dbg !29
  %3 = load i32, i32* %i, align 4, !dbg !30
  %sub = sub nsw i32 %2, %3, !dbg !31
  %conv = trunc i32 %sub to i8, !dbg !29
  %4 = load i8*, i8** %c.addr, align 8, !dbg !32
  %5 = load i32, i32* %i, align 4, !dbg !33
  %idxprom = sext i32 %5 to i64, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !32
  store i8 %conv, i8* %arrayidx, align 1, !dbg !34
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !35
  %inc = add nsw i32 %6, 1, !dbg !35
  store i32 %inc, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond
  br label %while.body, !dbg !39

while.body:                                       ; preds = %while.body.backedge, %for.end
  %7 = load i32, i32* %n.addr, align 4, !dbg !40
  store i32 %7, i32* %i, align 4, !dbg !43
  br label %for.cond1, !dbg !44

for.cond1:                                        ; preds = %for.body2, %while.body
  %8 = load i32, i32* %i, align 4, !dbg !45
  %dec = add nsw i32 %8, -1, !dbg !45
  store i32 %dec, i32* %i, align 4, !dbg !45
  %tobool = icmp ne i32 %8, 0, !dbg !47
  br i1 %tobool, label %for.body2, label %for.end7, !dbg !47

for.body2:                                        ; preds = %for.cond1
  %9 = load i8*, i8** %c.addr, align 8, !dbg !48
  %10 = load i32, i32* %i, align 4, !dbg !49
  %idxprom3 = sext i32 %10 to i64, !dbg !48
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %idxprom3, !dbg !48
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !48
  %conv5 = zext i8 %11 to i32, !dbg !48
  %12 = load i32, i32* %i, align 4, !dbg !50
  %tobool6 = icmp ne i32 %12, 0, !dbg !50
  %13 = zext i1 %tobool6 to i64, !dbg !50
  %cond = select i1 %tobool6, i32 32, i32 10, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %conv5, i32 %cond), !dbg !51
  br label %for.cond1, !dbg !52, !llvm.loop !53

for.end7:                                         ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !55
  %14 = load i8*, i8** %c.addr, align 8, !dbg !56
  %15 = load i32, i32* %i, align 4, !dbg !58
  %idxprom8 = sext i32 %15 to i64, !dbg !56
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i64 %idxprom8, !dbg !56
  %16 = load i8, i8* %arrayidx9, align 1, !dbg !59
  %inc10 = add i8 %16, 1, !dbg !59
  store i8 %inc10, i8* %arrayidx9, align 1, !dbg !59
  %conv11 = zext i8 %16 to i32, !dbg !56
  %17 = load i32, i32* %m.addr, align 4, !dbg !60
  %cmp12 = icmp slt i32 %conv11, %17, !dbg !61
  br i1 %cmp12, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %for.end7
  br label %while.body.backedge, !dbg !63

while.body.backedge:                              ; preds = %if.then, %for.end43
  br label %while.body, !dbg !40, !llvm.loop !64

if.end:                                           ; preds = %for.end7
  br label %for.cond14, !dbg !66

for.cond14:                                       ; preds = %if.end26, %if.end
  %18 = load i8*, i8** %c.addr, align 8, !dbg !67
  %19 = load i32, i32* %i, align 4, !dbg !70
  %idxprom15 = sext i32 %19 to i64, !dbg !67
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i64 %idxprom15, !dbg !67
  %20 = load i8, i8* %arrayidx16, align 1, !dbg !67
  %conv17 = zext i8 %20 to i32, !dbg !67
  %21 = load i32, i32* %m.addr, align 4, !dbg !71
  %22 = load i32, i32* %i, align 4, !dbg !72
  %sub18 = sub nsw i32 %21, %22, !dbg !73
  %cmp19 = icmp sge i32 %conv17, %sub18, !dbg !74
  br i1 %cmp19, label %for.body21, label %for.end27, !dbg !75

for.body21:                                       ; preds = %for.cond14
  %23 = load i32, i32* %i, align 4, !dbg !76
  %inc22 = add nsw i32 %23, 1, !dbg !76
  store i32 %inc22, i32* %i, align 4, !dbg !76
  %24 = load i32, i32* %n.addr, align 4, !dbg !78
  %cmp23 = icmp sge i32 %inc22, %24, !dbg !79
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !80

if.then25:                                        ; preds = %for.body21
  ret void, !dbg !81

if.end26:                                         ; preds = %for.body21
  br label %for.cond14, !dbg !82, !llvm.loop !83

for.end27:                                        ; preds = %for.cond14
  %25 = load i8*, i8** %c.addr, align 8, !dbg !85
  %26 = load i32, i32* %i, align 4, !dbg !87
  %idxprom28 = sext i32 %26 to i64, !dbg !85
  %arrayidx29 = getelementptr inbounds i8, i8* %25, i64 %idxprom28, !dbg !85
  %27 = load i8, i8* %arrayidx29, align 1, !dbg !88
  %inc30 = add i8 %27, 1, !dbg !88
  store i8 %inc30, i8* %arrayidx29, align 1, !dbg !88
  br label %for.cond31, !dbg !85

for.cond31:                                       ; preds = %for.inc41, %for.end27
  %28 = load i32, i32* %i, align 4, !dbg !89
  %tobool32 = icmp ne i32 %28, 0, !dbg !91
  br i1 %tobool32, label %for.body33, label %for.end43, !dbg !91

for.body33:                                       ; preds = %for.cond31
  %29 = load i8*, i8** %c.addr, align 8, !dbg !92
  %30 = load i32, i32* %i, align 4, !dbg !93
  %idxprom34 = sext i32 %30 to i64, !dbg !92
  %arrayidx35 = getelementptr inbounds i8, i8* %29, i64 %idxprom34, !dbg !92
  %31 = load i8, i8* %arrayidx35, align 1, !dbg !92
  %conv36 = zext i8 %31 to i32, !dbg !92
  %add = add nsw i32 %conv36, 1, !dbg !94
  %conv37 = trunc i32 %add to i8, !dbg !92
  %32 = load i8*, i8** %c.addr, align 8, !dbg !95
  %33 = load i32, i32* %i, align 4, !dbg !96
  %sub38 = sub nsw i32 %33, 1, !dbg !97
  %idxprom39 = sext i32 %sub38 to i64, !dbg !95
  %arrayidx40 = getelementptr inbounds i8, i8* %32, i64 %idxprom39, !dbg !95
  store i8 %conv37, i8* %arrayidx40, align 1, !dbg !98
  br label %for.inc41, !dbg !95

for.inc41:                                        ; preds = %for.body33
  %34 = load i32, i32* %i, align 4, !dbg !99
  %dec42 = add nsw i32 %34, -1, !dbg !99
  store i32 %dec42, i32* %i, align 4, !dbg !99
  br label %for.cond31, !dbg !100, !llvm.loop !101

for.end43:                                        ; preds = %for.cond31
  br label %while.body.backedge, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [100 x i8]* %buf, metadata !106, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 0, !dbg !111
  call void @comb(i32 5, i32 3, i8* %arraydecay), !dbg !112
  ret i32 0, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "combinations-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "comb", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 15, scope: !7)
!15 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!16 = !DILocation(line: 3, column: 22, scope: !7)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 3, type: !11)
!18 = !DILocation(line: 3, column: 40, scope: !7)
!19 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 6, scope: !7)
!21 = !DILocation(line: 6, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!23 = !DILocation(line: 6, column: 7, scope: !22)
!24 = !DILocation(line: 6, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 6, column: 2)
!26 = !DILocation(line: 6, column: 18, scope: !25)
!27 = !DILocation(line: 6, column: 16, scope: !25)
!28 = !DILocation(line: 6, column: 2, scope: !22)
!29 = !DILocation(line: 6, column: 33, scope: !25)
!30 = !DILocation(line: 6, column: 37, scope: !25)
!31 = !DILocation(line: 6, column: 35, scope: !25)
!32 = !DILocation(line: 6, column: 26, scope: !25)
!33 = !DILocation(line: 6, column: 28, scope: !25)
!34 = !DILocation(line: 6, column: 31, scope: !25)
!35 = !DILocation(line: 6, column: 22, scope: !25)
!36 = !DILocation(line: 6, column: 2, scope: !25)
!37 = distinct !{!37, !28, !38}
!38 = !DILocation(line: 6, column: 37, scope: !22)
!39 = !DILocation(line: 8, column: 2, scope: !7)
!40 = !DILocation(line: 9, column: 12, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 9, column: 3)
!42 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 12)
!43 = !DILocation(line: 9, column: 10, scope: !41)
!44 = !DILocation(line: 9, column: 8, scope: !41)
!45 = !DILocation(line: 9, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !1, line: 9, column: 3)
!47 = !DILocation(line: 9, column: 3, scope: !41)
!48 = !DILocation(line: 10, column: 19, scope: !46)
!49 = !DILocation(line: 10, column: 21, scope: !46)
!50 = !DILocation(line: 10, column: 25, scope: !46)
!51 = !DILocation(line: 10, column: 4, scope: !46)
!52 = !DILocation(line: 9, column: 3, scope: !46)
!53 = distinct !{!53, !47, !54}
!54 = !DILocation(line: 10, column: 38, scope: !41)
!55 = !DILocation(line: 14, column: 5, scope: !42)
!56 = !DILocation(line: 15, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !1, line: 15, column: 7)
!58 = !DILocation(line: 15, column: 9, scope: !57)
!59 = !DILocation(line: 15, column: 11, scope: !57)
!60 = !DILocation(line: 15, column: 16, scope: !57)
!61 = !DILocation(line: 15, column: 14, scope: !57)
!62 = !DILocation(line: 15, column: 7, scope: !42)
!63 = !DILocation(line: 15, column: 19, scope: !57)
!64 = distinct !{!64, !39, !65}
!65 = !DILocation(line: 19, column: 2, scope: !7)
!66 = !DILocation(line: 17, column: 3, scope: !42)
!67 = !DILocation(line: 17, column: 10, scope: !68)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 17, column: 3)
!69 = distinct !DILexicalBlock(scope: !42, file: !1, line: 17, column: 3)
!70 = !DILocation(line: 17, column: 12, scope: !68)
!71 = !DILocation(line: 17, column: 18, scope: !68)
!72 = !DILocation(line: 17, column: 22, scope: !68)
!73 = !DILocation(line: 17, column: 20, scope: !68)
!74 = !DILocation(line: 17, column: 15, scope: !68)
!75 = !DILocation(line: 17, column: 3, scope: !69)
!76 = !DILocation(line: 17, column: 30, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !1, line: 17, column: 30)
!78 = !DILocation(line: 17, column: 37, scope: !77)
!79 = !DILocation(line: 17, column: 34, scope: !77)
!80 = !DILocation(line: 17, column: 30, scope: !68)
!81 = !DILocation(line: 17, column: 40, scope: !77)
!82 = !DILocation(line: 17, column: 3, scope: !68)
!83 = distinct !{!83, !75, !84}
!84 = !DILocation(line: 17, column: 40, scope: !69)
!85 = !DILocation(line: 18, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !42, file: !1, line: 18, column: 3)
!87 = !DILocation(line: 18, column: 10, scope: !86)
!88 = !DILocation(line: 18, column: 12, scope: !86)
!89 = !DILocation(line: 18, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 18, column: 3)
!91 = !DILocation(line: 18, column: 3, scope: !86)
!92 = !DILocation(line: 18, column: 33, scope: !90)
!93 = !DILocation(line: 18, column: 35, scope: !90)
!94 = !DILocation(line: 18, column: 38, scope: !90)
!95 = !DILocation(line: 18, column: 24, scope: !90)
!96 = !DILocation(line: 18, column: 26, scope: !90)
!97 = !DILocation(line: 18, column: 27, scope: !90)
!98 = !DILocation(line: 18, column: 31, scope: !90)
!99 = !DILocation(line: 18, column: 20, scope: !90)
!100 = !DILocation(line: 18, column: 3, scope: !90)
!101 = distinct !{!101, !91, !102}
!102 = !DILocation(line: 18, column: 40, scope: !86)
!103 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !104, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!10}
!106 = !DILocalVariable(name: "buf", scope: !103, file: !1, line: 24, type: !107)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 100)
!110 = !DILocation(line: 24, column: 16, scope: !103)
!111 = !DILocation(line: 25, column: 13, scope: !103)
!112 = !DILocation(line: 25, column: 2, scope: !103)
!113 = !DILocation(line: 26, column: 2, scope: !103)
