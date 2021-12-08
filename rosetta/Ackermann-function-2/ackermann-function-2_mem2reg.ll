; ModuleID = 'ackermann-function-2.ll'
source_filename = "ackermann-function-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n_bits = common dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@cache = common dso_local global i32* null, align 8, !dbg !9
@m_bits = common dso_local global i32 0, align 4, !dbg !6
@.str.1 = private unnamed_addr constant [16 x i8] c"A(%d, %d) = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ackermann(i32 %m, i32 %n) #0 !dbg !16 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.value(metadata i32 %n, metadata !21, metadata !DIExpression()), !dbg !20
  %tobool = icmp ne i32 %m, 0, !dbg !22
  br i1 %tobool, label %if.end, label %if.then, !dbg !24

if.then:                                          ; preds = %entry
  %add = add nsw i32 %n, 1, !dbg !25
  br label %return, !dbg !26

if.end:                                           ; preds = %entry
  %0 = load i32, i32* @n_bits, align 4, !dbg !27
  %shl = shl i32 1, %0, !dbg !29
  %cmp = icmp sge i32 %n, %shl, !dbg !30
  br i1 %cmp, label %if.then1, label %if.else, !dbg !31

if.then1:                                         ; preds = %if.end
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %m, i32 %n), !dbg !32
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !20
  br label %if.end9, !dbg !35

if.else:                                          ; preds = %if.end
  %1 = load i32, i32* @n_bits, align 4, !dbg !36
  %shl2 = shl i32 %m, %1, !dbg !38
  %add3 = add nsw i32 %shl2, %n, !dbg !39
  call void @llvm.dbg.value(metadata i32 %add3, metadata !34, metadata !DIExpression()), !dbg !20
  %2 = load i32*, i32** @cache, align 8, !dbg !40
  %idxprom = sext i32 %add3 to i64, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !40
  %3 = load i32, i32* %arrayidx, align 4, !dbg !40
  %tobool4 = icmp ne i32 %3, 0, !dbg !40
  br i1 %tobool4, label %if.then5, label %if.end8, !dbg !42

if.then5:                                         ; preds = %if.else
  %4 = load i32*, i32** @cache, align 8, !dbg !43
  %idxprom6 = sext i32 %add3 to i64, !dbg !43
  %arrayidx7 = getelementptr inbounds i32, i32* %4, i64 %idxprom6, !dbg !43
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !43
  br label %return, !dbg !44

if.end8:                                          ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then1
  %idx.0 = phi i32 [ 0, %if.then1 ], [ %add3, %if.end8 ], !dbg !45
  call void @llvm.dbg.value(metadata i32 %idx.0, metadata !34, metadata !DIExpression()), !dbg !20
  %tobool10 = icmp ne i32 %n, 0, !dbg !46
  br i1 %tobool10, label %if.else13, label %if.then11, !dbg !48

if.then11:                                        ; preds = %if.end9
  %sub = sub nsw i32 %m, 1, !dbg !49
  %call12 = call i32 @ackermann(i32 %sub, i32 1), !dbg !50
  call void @llvm.dbg.value(metadata i32 %call12, metadata !51, metadata !DIExpression()), !dbg !20
  br label %if.end18, !dbg !52

if.else13:                                        ; preds = %if.end9
  %sub14 = sub nsw i32 %m, 1, !dbg !53
  %sub15 = sub nsw i32 %n, 1, !dbg !54
  %call16 = call i32 @ackermann(i32 %m, i32 %sub15), !dbg !55
  %call17 = call i32 @ackermann(i32 %sub14, i32 %call16), !dbg !56
  call void @llvm.dbg.value(metadata i32 %call17, metadata !51, metadata !DIExpression()), !dbg !20
  br label %if.end18

if.end18:                                         ; preds = %if.else13, %if.then11
  %res.0 = phi i32 [ %call17, %if.else13 ], [ %call12, %if.then11 ], !dbg !57
  call void @llvm.dbg.value(metadata i32 %res.0, metadata !51, metadata !DIExpression()), !dbg !20
  %tobool19 = icmp ne i32 %idx.0, 0, !dbg !58
  br i1 %tobool19, label %if.then20, label %if.end23, !dbg !60

if.then20:                                        ; preds = %if.end18
  %6 = load i32*, i32** @cache, align 8, !dbg !61
  %idxprom21 = sext i32 %idx.0 to i64, !dbg !61
  %arrayidx22 = getelementptr inbounds i32, i32* %6, i64 %idxprom21, !dbg !61
  store i32 %res.0, i32* %arrayidx22, align 4, !dbg !62
  br label %if.end23, !dbg !61

if.end23:                                         ; preds = %if.then20, %if.end18
  br label %return, !dbg !63

return:                                           ; preds = %if.end23, %if.then5, %if.then
  %retval.0 = phi i32 [ %res.0, %if.end23 ], [ %5, %if.then5 ], [ %add, %if.then ], !dbg !20
  ret i32 %retval.0, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !65 {
entry:
  store i32 3, i32* @m_bits, align 4, !dbg !68
  store i32 20, i32* @n_bits, align 4, !dbg !69
  %0 = load i32, i32* @m_bits, align 4, !dbg !70
  %1 = load i32, i32* @n_bits, align 4, !dbg !71
  %add = add nsw i32 %0, %1, !dbg !72
  %shl = shl i32 1, %add, !dbg !73
  %conv = sext i32 %shl to i64, !dbg !74
  %mul = mul i64 4, %conv, !dbg !75
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !76
  %2 = bitcast i8* %call to i32*, !dbg !76
  store i32* %2, i32** @cache, align 8, !dbg !77
  %3 = load i32*, i32** @cache, align 8, !dbg !78
  %4 = bitcast i32* %3 to i8*, !dbg !79
  %5 = load i32, i32* @m_bits, align 4, !dbg !80
  %6 = load i32, i32* @n_bits, align 4, !dbg !81
  %add1 = add nsw i32 %5, %6, !dbg !82
  %shl2 = shl i32 1, %add1, !dbg !83
  %conv3 = sext i32 %shl2 to i64, !dbg !84
  %mul4 = mul i64 4, %conv3, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 4 %4, i8 0, i64 %mul4, i1 false), !dbg !79
  call void @llvm.dbg.value(metadata i32 0, metadata !86, metadata !DIExpression()), !dbg !87
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc12, %entry
  %m.0 = phi i32 [ 0, %entry ], [ %inc13, %for.inc12 ], !dbg !90
  call void @llvm.dbg.value(metadata i32 %m.0, metadata !86, metadata !DIExpression()), !dbg !87
  %cmp = icmp sle i32 %m.0, 4, !dbg !91
  br i1 %cmp, label %for.body, label %for.end14, !dbg !93

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !94, metadata !DIExpression()), !dbg !87
  br label %for.cond6, !dbg !95

for.cond6:                                        ; preds = %for.inc, %for.body
  %n.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !97
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !94, metadata !DIExpression()), !dbg !87
  %sub = sub nsw i32 6, %m.0, !dbg !98
  %cmp7 = icmp slt i32 %n.0, %sub, !dbg !100
  br i1 %cmp7, label %for.body9, label %for.end, !dbg !101

for.body9:                                        ; preds = %for.cond6
  %call10 = call i32 @ackermann(i32 %m.0, i32 %n.0), !dbg !102
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %m.0, i32 %n.0, i32 %call10), !dbg !103
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body9
  %inc = add nsw i32 %n.0, 1, !dbg !104
  call void @llvm.dbg.value(metadata i32 %inc, metadata !94, metadata !DIExpression()), !dbg !87
  br label %for.cond6, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond6
  br label %for.inc12, !dbg !107

for.inc12:                                        ; preds = %for.end
  %inc13 = add nsw i32 %m.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !86, metadata !DIExpression()), !dbg !87
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end14:                                        ; preds = %for.cond
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "n_bits", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ackermann-function-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Ackermann-function-2")
!4 = !{}
!5 = !{!6, !0, !9}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "m_bits", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 6, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!16 = distinct !DISubprogram(name: "ackermann", scope: !3, file: !3, line: 8, type: !17, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!8, !8, !8}
!19 = !DILocalVariable(name: "m", arg: 1, scope: !16, file: !3, line: 8, type: !8)
!20 = !DILocation(line: 0, scope: !16)
!21 = !DILocalVariable(name: "n", arg: 2, scope: !16, file: !3, line: 8, type: !8)
!22 = !DILocation(line: 11, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !3, line: 11, column: 13)
!24 = !DILocation(line: 11, column: 13, scope: !16)
!25 = !DILocation(line: 11, column: 26, scope: !23)
!26 = !DILocation(line: 11, column: 17, scope: !23)
!27 = !DILocation(line: 13, column: 21, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !3, line: 13, column: 13)
!29 = !DILocation(line: 13, column: 19, scope: !28)
!30 = !DILocation(line: 13, column: 15, scope: !28)
!31 = !DILocation(line: 13, column: 13, scope: !16)
!32 = !DILocation(line: 14, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !3, line: 13, column: 29)
!34 = !DILocalVariable(name: "idx", scope: !16, file: !3, line: 10, type: !8)
!35 = !DILocation(line: 16, column: 9, scope: !33)
!36 = !DILocation(line: 17, column: 29, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !3, line: 16, column: 16)
!38 = !DILocation(line: 17, column: 26, scope: !37)
!39 = !DILocation(line: 17, column: 37, scope: !37)
!40 = !DILocation(line: 18, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 18, column: 21)
!42 = !DILocation(line: 18, column: 21, scope: !37)
!43 = !DILocation(line: 18, column: 40, scope: !41)
!44 = !DILocation(line: 18, column: 33, scope: !41)
!45 = !DILocation(line: 0, scope: !28)
!46 = !DILocation(line: 21, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !16, file: !3, line: 21, column: 13)
!48 = !DILocation(line: 21, column: 13, scope: !16)
!49 = !DILocation(line: 21, column: 35, scope: !47)
!50 = !DILocation(line: 21, column: 23, scope: !47)
!51 = !DILocalVariable(name: "res", scope: !16, file: !3, line: 10, type: !8)
!52 = !DILocation(line: 21, column: 17, scope: !47)
!53 = !DILocation(line: 22, column: 35, scope: !47)
!54 = !DILocation(line: 22, column: 55, scope: !47)
!55 = !DILocation(line: 22, column: 40, scope: !47)
!56 = !DILocation(line: 22, column: 23, scope: !47)
!57 = !DILocation(line: 0, scope: !47)
!58 = !DILocation(line: 24, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !16, file: !3, line: 24, column: 13)
!60 = !DILocation(line: 24, column: 13, scope: !16)
!61 = !DILocation(line: 24, column: 18, scope: !59)
!62 = !DILocation(line: 24, column: 29, scope: !59)
!63 = !DILocation(line: 25, column: 9, scope: !16)
!64 = !DILocation(line: 26, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 27, type: !66, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!8}
!68 = !DILocation(line: 31, column: 16, scope: !65)
!69 = !DILocation(line: 32, column: 16, scope: !65)
!70 = !DILocation(line: 33, column: 45, scope: !65)
!71 = !DILocation(line: 33, column: 54, scope: !65)
!72 = !DILocation(line: 33, column: 52, scope: !65)
!73 = !DILocation(line: 33, column: 41, scope: !65)
!74 = !DILocation(line: 33, column: 38, scope: !65)
!75 = !DILocation(line: 33, column: 36, scope: !65)
!76 = !DILocation(line: 33, column: 17, scope: !65)
!77 = !DILocation(line: 33, column: 15, scope: !65)
!78 = !DILocation(line: 34, column: 16, scope: !65)
!79 = !DILocation(line: 34, column: 9, scope: !65)
!80 = !DILocation(line: 34, column: 47, scope: !65)
!81 = !DILocation(line: 34, column: 56, scope: !65)
!82 = !DILocation(line: 34, column: 54, scope: !65)
!83 = !DILocation(line: 34, column: 43, scope: !65)
!84 = !DILocation(line: 34, column: 40, scope: !65)
!85 = !DILocation(line: 34, column: 38, scope: !65)
!86 = !DILocalVariable(name: "m", scope: !65, file: !3, line: 29, type: !8)
!87 = !DILocation(line: 0, scope: !65)
!88 = !DILocation(line: 36, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !65, file: !3, line: 36, column: 9)
!90 = !DILocation(line: 0, scope: !89)
!91 = !DILocation(line: 36, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 36, column: 9)
!93 = !DILocation(line: 36, column: 9, scope: !89)
!94 = !DILocalVariable(name: "n", scope: !65, file: !3, line: 29, type: !8)
!95 = !DILocation(line: 37, column: 22, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 37, column: 17)
!97 = !DILocation(line: 0, scope: !96)
!98 = !DILocation(line: 37, column: 35, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 37, column: 17)
!100 = !DILocation(line: 37, column: 31, scope: !99)
!101 = !DILocation(line: 37, column: 17, scope: !96)
!102 = !DILocation(line: 38, column: 58, scope: !99)
!103 = !DILocation(line: 38, column: 25, scope: !99)
!104 = !DILocation(line: 37, column: 41, scope: !99)
!105 = !DILocation(line: 37, column: 17, scope: !99)
!106 = distinct !{!106, !101, !107}
!107 = !DILocation(line: 38, column: 73, scope: !96)
!108 = !DILocation(line: 36, column: 30, scope: !92)
!109 = !DILocation(line: 36, column: 9, scope: !92)
!110 = distinct !{!110, !93, !111}
!111 = !DILocation(line: 38, column: 73, scope: !89)
!112 = !DILocation(line: 40, column: 9, scope: !65)
