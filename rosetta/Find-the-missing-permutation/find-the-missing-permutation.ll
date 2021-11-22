; ModuleID = 'find-the-missing-permutation.c'
source_filename = "find-the-missing-permutation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"ABCD\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"CABD\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"ACDB\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"DACB\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"BCDA\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"ACBD\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"ADCB\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"CDAB\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"DABC\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"BCAD\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"CADB\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"CDBA\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"CBAD\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"ABDC\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"ADBC\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"BDCA\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"DCBA\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"BACD\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"BADC\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"BDAC\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"CBDA\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"DBCA\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"DCAB\00", align 1
@perms = dso_local global [23 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0)], align 16, !dbg !0
@.str.23 = private unnamed_addr constant [15 x i8] c"Missing: %.*s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !16 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %cnt = alloca [4 x i32], align 16
  %miss = alloca [4 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %j, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %n, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [4 x i32]* %cnt, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [4 x i8]* %miss, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 1, i32* %i, align 4, !dbg !34
  store i32 1, i32* %n, align 4, !dbg !36
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %0, 4, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !42
  %2 = load i32, i32* %n, align 4, !dbg !43
  %mul = mul nsw i32 %2, %1, !dbg !43
  store i32 %mul, i32* %n, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %3, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond1, !dbg !51

for.cond1:                                        ; preds = %for.inc39, %for.end
  %4 = load i32, i32* %i, align 4, !dbg !52
  %cmp2 = icmp slt i32 %4, 4, !dbg !54
  br i1 %cmp2, label %for.body3, label %for.end41, !dbg !55

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !dbg !56
  br label %for.cond4, !dbg !59

for.cond4:                                        ; preds = %for.inc7, %for.body3
  %5 = load i32, i32* %j, align 4, !dbg !60
  %cmp5 = icmp slt i32 %5, 4, !dbg !62
  br i1 %cmp5, label %for.body6, label %for.end9, !dbg !63

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, i32* %j, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %cnt, i64 0, i64 %idxprom, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  br label %for.inc7, !dbg !65

for.inc7:                                         ; preds = %for.body6
  %7 = load i32, i32* %j, align 4, !dbg !67
  %inc8 = add nsw i32 %7, 1, !dbg !67
  store i32 %inc8, i32* %j, align 4, !dbg !67
  br label %for.cond4, !dbg !68, !llvm.loop !69

for.end9:                                         ; preds = %for.cond4
  store i32 0, i32* %j, align 4, !dbg !71
  br label %for.cond10, !dbg !73

for.cond10:                                       ; preds = %for.inc22, %for.end9
  %8 = load i32, i32* %j, align 4, !dbg !74
  %conv = sext i32 %8 to i64, !dbg !74
  %cmp11 = icmp ult i64 %conv, 23, !dbg !76
  br i1 %cmp11, label %for.body13, label %for.end24, !dbg !77

for.body13:                                       ; preds = %for.cond10
  %9 = load i32, i32* %j, align 4, !dbg !78
  %idxprom14 = sext i32 %9 to i64, !dbg !79
  %arrayidx15 = getelementptr inbounds [23 x i8*], [23 x i8*]* @perms, i64 0, i64 %idxprom14, !dbg !79
  %10 = load i8*, i8** %arrayidx15, align 8, !dbg !79
  %11 = load i32, i32* %i, align 4, !dbg !80
  %idxprom16 = sext i32 %11 to i64, !dbg !79
  %arrayidx17 = getelementptr inbounds i8, i8* %10, i64 %idxprom16, !dbg !79
  %12 = load i8, i8* %arrayidx17, align 1, !dbg !79
  %conv18 = sext i8 %12 to i32, !dbg !79
  %sub = sub nsw i32 %conv18, 65, !dbg !81
  %idxprom19 = sext i32 %sub to i64, !dbg !82
  %arrayidx20 = getelementptr inbounds [4 x i32], [4 x i32]* %cnt, i64 0, i64 %idxprom19, !dbg !82
  %13 = load i32, i32* %arrayidx20, align 4, !dbg !83
  %inc21 = add nsw i32 %13, 1, !dbg !83
  store i32 %inc21, i32* %arrayidx20, align 4, !dbg !83
  br label %for.inc22, !dbg !82

for.inc22:                                        ; preds = %for.body13
  %14 = load i32, i32* %j, align 4, !dbg !84
  %inc23 = add nsw i32 %14, 1, !dbg !84
  store i32 %inc23, i32* %j, align 4, !dbg !84
  br label %for.cond10, !dbg !85, !llvm.loop !86

for.end24:                                        ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !dbg !88
  br label %for.cond25, !dbg !90

for.cond25:                                       ; preds = %for.inc33, %for.end24
  %15 = load i32, i32* %j, align 4, !dbg !91
  %cmp26 = icmp slt i32 %15, 4, !dbg !93
  br i1 %cmp26, label %land.rhs, label %land.end, !dbg !94

land.rhs:                                         ; preds = %for.cond25
  %16 = load i32, i32* %j, align 4, !dbg !95
  %idxprom28 = sext i32 %16 to i64, !dbg !96
  %arrayidx29 = getelementptr inbounds [4 x i32], [4 x i32]* %cnt, i64 0, i64 %idxprom28, !dbg !96
  %17 = load i32, i32* %arrayidx29, align 4, !dbg !96
  %18 = load i32, i32* %n, align 4, !dbg !97
  %cmp30 = icmp eq i32 %17, %18, !dbg !98
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond25
  %19 = phi i1 [ false, %for.cond25 ], [ %cmp30, %land.rhs ], !dbg !99
  br i1 %19, label %for.body32, label %for.end35, !dbg !100

for.body32:                                       ; preds = %land.end
  br label %for.inc33, !dbg !100

for.inc33:                                        ; preds = %for.body32
  %20 = load i32, i32* %j, align 4, !dbg !101
  %inc34 = add nsw i32 %20, 1, !dbg !101
  store i32 %inc34, i32* %j, align 4, !dbg !101
  br label %for.cond25, !dbg !102, !llvm.loop !103

for.end35:                                        ; preds = %land.end
  %21 = load i32, i32* %j, align 4, !dbg !105
  %add = add nsw i32 %21, 65, !dbg !106
  %conv36 = trunc i32 %add to i8, !dbg !105
  %22 = load i32, i32* %i, align 4, !dbg !107
  %idxprom37 = sext i32 %22 to i64, !dbg !108
  %arrayidx38 = getelementptr inbounds [4 x i8], [4 x i8]* %miss, i64 0, i64 %idxprom37, !dbg !108
  store i8 %conv36, i8* %arrayidx38, align 1, !dbg !109
  br label %for.inc39, !dbg !110

for.inc39:                                        ; preds = %for.end35
  %23 = load i32, i32* %i, align 4, !dbg !111
  %inc40 = add nsw i32 %23, 1, !dbg !111
  store i32 %inc40, i32* %i, align 4, !dbg !111
  br label %for.cond1, !dbg !112, !llvm.loop !113

for.end41:                                        ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %miss, i64 0, i64 0, !dbg !115
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23, i64 0, i64 0), i32 4, i8* %arraydecay), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "perms", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "find-the-missing-permutation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Find-the-missing-permutation")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1472, elements: !10)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 23)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!16 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 10, type: !17, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!19}
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "i", scope: !16, file: !3, line: 12, type: !19)
!21 = !DILocation(line: 12, column: 6, scope: !16)
!22 = !DILocalVariable(name: "j", scope: !16, file: !3, line: 12, type: !19)
!23 = !DILocation(line: 12, column: 9, scope: !16)
!24 = !DILocalVariable(name: "n", scope: !16, file: !3, line: 12, type: !19)
!25 = !DILocation(line: 12, column: 12, scope: !16)
!26 = !DILocalVariable(name: "cnt", scope: !16, file: !3, line: 12, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 128, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 4)
!30 = !DILocation(line: 12, column: 15, scope: !16)
!31 = !DILocalVariable(name: "miss", scope: !16, file: !3, line: 13, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, elements: !28)
!33 = !DILocation(line: 13, column: 7, scope: !16)
!34 = !DILocation(line: 15, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !3, line: 15, column: 2)
!36 = !DILocation(line: 15, column: 9, scope: !35)
!37 = !DILocation(line: 15, column: 7, scope: !35)
!38 = !DILocation(line: 15, column: 18, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !3, line: 15, column: 2)
!40 = !DILocation(line: 15, column: 20, scope: !39)
!41 = !DILocation(line: 15, column: 2, scope: !35)
!42 = !DILocation(line: 15, column: 35, scope: !39)
!43 = !DILocation(line: 15, column: 32, scope: !39)
!44 = !DILocation(line: 15, column: 30, scope: !39)
!45 = !DILocation(line: 15, column: 26, scope: !39)
!46 = !DILocation(line: 15, column: 2, scope: !39)
!47 = distinct !{!47, !41, !48}
!48 = !DILocation(line: 15, column: 35, scope: !35)
!49 = !DILocation(line: 17, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !16, file: !3, line: 17, column: 2)
!51 = !DILocation(line: 17, column: 7, scope: !50)
!52 = !DILocation(line: 17, column: 14, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !3, line: 17, column: 2)
!54 = !DILocation(line: 17, column: 16, scope: !53)
!55 = !DILocation(line: 17, column: 2, scope: !50)
!56 = !DILocation(line: 18, column: 10, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !3, line: 18, column: 3)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 17, column: 26)
!59 = !DILocation(line: 18, column: 8, scope: !57)
!60 = !DILocation(line: 18, column: 15, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 18, column: 3)
!62 = !DILocation(line: 18, column: 17, scope: !61)
!63 = !DILocation(line: 18, column: 3, scope: !57)
!64 = !DILocation(line: 18, column: 31, scope: !61)
!65 = !DILocation(line: 18, column: 27, scope: !61)
!66 = !DILocation(line: 18, column: 34, scope: !61)
!67 = !DILocation(line: 18, column: 23, scope: !61)
!68 = !DILocation(line: 18, column: 3, scope: !61)
!69 = distinct !{!69, !63, !70}
!70 = !DILocation(line: 18, column: 36, scope: !57)
!71 = !DILocation(line: 21, column: 10, scope: !72)
!72 = distinct !DILexicalBlock(scope: !58, file: !3, line: 21, column: 3)
!73 = !DILocation(line: 21, column: 8, scope: !72)
!74 = !DILocation(line: 21, column: 15, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !3, line: 21, column: 3)
!76 = !DILocation(line: 21, column: 17, scope: !75)
!77 = !DILocation(line: 21, column: 3, scope: !72)
!78 = !DILocation(line: 22, column: 14, scope: !75)
!79 = !DILocation(line: 22, column: 8, scope: !75)
!80 = !DILocation(line: 22, column: 17, scope: !75)
!81 = !DILocation(line: 22, column: 20, scope: !75)
!82 = !DILocation(line: 22, column: 4, scope: !75)
!83 = !DILocation(line: 22, column: 26, scope: !75)
!84 = !DILocation(line: 21, column: 55, scope: !75)
!85 = !DILocation(line: 21, column: 3, scope: !75)
!86 = distinct !{!86, !77, !87}
!87 = !DILocation(line: 22, column: 26, scope: !72)
!88 = !DILocation(line: 25, column: 10, scope: !89)
!89 = distinct !DILexicalBlock(scope: !58, file: !3, line: 25, column: 3)
!90 = !DILocation(line: 25, column: 8, scope: !89)
!91 = !DILocation(line: 25, column: 15, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 25, column: 3)
!93 = !DILocation(line: 25, column: 17, scope: !92)
!94 = !DILocation(line: 25, column: 21, scope: !92)
!95 = !DILocation(line: 25, column: 28, scope: !92)
!96 = !DILocation(line: 25, column: 24, scope: !92)
!97 = !DILocation(line: 25, column: 34, scope: !92)
!98 = !DILocation(line: 25, column: 31, scope: !92)
!99 = !DILocation(line: 0, scope: !92)
!100 = !DILocation(line: 25, column: 3, scope: !89)
!101 = !DILocation(line: 25, column: 38, scope: !92)
!102 = !DILocation(line: 25, column: 3, scope: !92)
!103 = distinct !{!103, !100, !104}
!104 = !DILocation(line: 25, column: 41, scope: !89)
!105 = !DILocation(line: 27, column: 13, scope: !58)
!106 = !DILocation(line: 27, column: 15, scope: !58)
!107 = !DILocation(line: 27, column: 8, scope: !58)
!108 = !DILocation(line: 27, column: 3, scope: !58)
!109 = !DILocation(line: 27, column: 11, scope: !58)
!110 = !DILocation(line: 28, column: 2, scope: !58)
!111 = !DILocation(line: 17, column: 22, scope: !53)
!112 = !DILocation(line: 17, column: 2, scope: !53)
!113 = distinct !{!113, !55, !114}
!114 = !DILocation(line: 28, column: 2, scope: !50)
!115 = !DILocation(line: 29, column: 31, scope: !16)
!116 = !DILocation(line: 29, column: 2, scope: !16)
!117 = !DILocation(line: 31, column: 2, scope: !16)
