; ModuleID = 'forward-difference-2.ll'
source_filename = "forward-difference-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.array = private unnamed_addr constant [10 x double] [double 9.000000e+01, double 4.700000e+01, double 5.800000e+01, double 2.900000e+01, double 2.200000e+01, double 3.200000e+01, double 5.500000e+01, double 5.000000e+00, double 5.500000e+01, double 7.300000e+01], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @binomCoeff(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !12, metadata !DIExpression()), !dbg !13
  %add = add nsw i32 %n, 1, !dbg !14
  %conv = sext i32 %add to i64, !dbg !15
  %call = call i8* @calloc(i64 %conv, i64 4), !dbg !16
  %0 = bitcast i8* %call to i32*, !dbg !16
  call void @llvm.dbg.value(metadata i32* %0, metadata !17, metadata !DIExpression()), !dbg !13
  %rem = srem i32 %n, 2, !dbg !18
  %tobool = icmp ne i32 %rem, 0, !dbg !19
  %1 = zext i1 %tobool to i64, !dbg !19
  %cond = select i1 %tobool, i32 -1, i32 1, !dbg !19
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !20
  store i32 %cond, i32* %arrayidx, align 4, !dbg !21
  call void @llvm.dbg.value(metadata i32 1, metadata !22, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !25
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !22, metadata !DIExpression()), !dbg !13
  %cmp = icmp sle i32 %j.0, %n, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %j.0, 1, !dbg !29
  %idxprom = sext i32 %sub to i64, !dbg !30
  %arrayidx2 = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !30
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !30
  %sub3 = sub nsw i32 0, %2, !dbg !31
  %add4 = add nsw i32 %n, 1, !dbg !32
  %sub5 = sub nsw i32 %add4, %j.0, !dbg !33
  %mul = mul nsw i32 %sub3, %sub5, !dbg !34
  %div = sdiv i32 %mul, %j.0, !dbg !35
  %idxprom6 = sext i32 %j.0 to i64, !dbg !36
  %arrayidx7 = getelementptr inbounds i32, i32* %0, i64 %idxprom6, !dbg !36
  store i32 %div, i32* %arrayidx7, align 4, !dbg !37
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %j.0, 1, !dbg !38
  call void @llvm.dbg.value(metadata i32 %inc, metadata !22, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  ret i32* %0, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %array = alloca [10 x double], align 16
  call void @llvm.dbg.declare(metadata [10 x double]* %array, metadata !46, metadata !DIExpression()), !dbg !51
  %0 = bitcast [10 x double]* %array to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x double]* @__const.main.array to i8*), i64 80, i1 false), !dbg !51
  call void @llvm.dbg.value(metadata i64 10, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata i32 4, metadata !57, metadata !DIExpression()), !dbg !56
  %call = call i32* @binomCoeff(i32 4), !dbg !58
  call void @llvm.dbg.value(metadata i32* %call, metadata !59, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !56
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc17, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !63
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !60, metadata !DIExpression()), !dbg !56
  %conv = sext i32 %k.0 to i64, !dbg !64
  %cmp = icmp ult i64 %conv, 10, !dbg !66
  br i1 %cmp, label %for.body, label %for.end19, !dbg !67

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32, i32* %call, i64 0, !dbg !68
  %1 = load i32, i32* %arrayidx, align 4, !dbg !68
  %conv2 = sitofp i32 %1 to double, !dbg !68
  %idxprom = sext i32 %k.0 to i64, !dbg !70
  %arrayidx3 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom, !dbg !70
  %2 = load double, double* %arrayidx3, align 8, !dbg !71
  %mul = fmul double %2, %conv2, !dbg !71
  store double %mul, double* %arrayidx3, align 8, !dbg !71
  call void @llvm.dbg.value(metadata i32 1, metadata !72, metadata !DIExpression()), !dbg !56
  br label %for.cond4, !dbg !70

for.cond4:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 1, %for.body ], [ %inc, %for.inc ], !dbg !73
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !72, metadata !DIExpression()), !dbg !56
  %cmp5 = icmp sle i32 %j.0, 4, !dbg !74
  br i1 %cmp5, label %for.body7, label %for.end, !dbg !76

for.body7:                                        ; preds = %for.cond4
  %idxprom8 = sext i32 %j.0 to i64, !dbg !77
  %arrayidx9 = getelementptr inbounds i32, i32* %call, i64 %idxprom8, !dbg !77
  %3 = load i32, i32* %arrayidx9, align 4, !dbg !77
  %conv10 = sitofp i32 %3 to double, !dbg !77
  %add = add nsw i32 %k.0, %j.0, !dbg !78
  %idxprom11 = sext i32 %add to i64, !dbg !79
  %arrayidx12 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom11, !dbg !79
  %4 = load double, double* %arrayidx12, align 8, !dbg !79
  %mul13 = fmul double %conv10, %4, !dbg !80
  %idxprom14 = sext i32 %k.0 to i64, !dbg !81
  %arrayidx15 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom14, !dbg !81
  %5 = load double, double* %arrayidx15, align 8, !dbg !82
  %add16 = fadd double %5, %mul13, !dbg !82
  store double %add16, double* %arrayidx15, align 8, !dbg !82
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body7
  %inc = add nsw i32 %j.0, 1, !dbg !83
  call void @llvm.dbg.value(metadata i32 %inc, metadata !72, metadata !DIExpression()), !dbg !56
  br label %for.cond4, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond4
  br label %for.inc17, !dbg !86

for.inc17:                                        ; preds = %for.end
  %inc18 = add nsw i32 %k.0, 1, !dbg !87
  call void @llvm.dbg.value(metadata i32 %inc18, metadata !60, metadata !DIExpression()), !dbg !56
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end19:                                        ; preds = %for.cond
  %call20 = call i32 (i32*, ...) bitcast (i32 (...)* @free to i32 (i32*, ...)*)(i32* %call), !dbg !91
  %conv21 = sext i32 4 to i64, !dbg !92
  %sub = sub i64 10, %conv21, !dbg !93
  call void @llvm.dbg.value(metadata i64 %sub, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !56
  br label %for.cond22, !dbg !94

for.cond22:                                       ; preds = %for.inc30, %for.end19
  %k.1 = phi i32 [ 0, %for.end19 ], [ %inc31, %for.inc30 ], !dbg !96
  call void @llvm.dbg.value(metadata i32 %k.1, metadata !60, metadata !DIExpression()), !dbg !56
  %conv23 = sext i32 %k.1 to i64, !dbg !97
  %cmp24 = icmp ult i64 %conv23, %sub, !dbg !99
  br i1 %cmp24, label %for.body26, label %for.end32, !dbg !100

for.body26:                                       ; preds = %for.cond22
  %idxprom27 = sext i32 %k.1 to i64, !dbg !101
  %arrayidx28 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom27, !dbg !101
  %6 = load double, double* %arrayidx28, align 8, !dbg !101
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %6), !dbg !102
  br label %for.inc30, !dbg !102

for.inc30:                                        ; preds = %for.body26
  %inc31 = add nsw i32 %k.1, 1, !dbg !103
  call void @llvm.dbg.value(metadata i32 %inc31, metadata !60, metadata !DIExpression()), !dbg !56
  br label %for.cond22, !dbg !104, !llvm.loop !105

for.end32:                                        ; preds = %for.cond22
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @free(...) #2

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "forward-difference-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Forward-difference")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "binomCoeff", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 4, column: 23, scope: !7)
!15 = !DILocation(line: 4, column: 22, scope: !7)
!16 = !DILocation(line: 4, column: 15, scope: !7)
!17 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 4, type: !10)
!18 = !DILocation(line: 6, column: 14, scope: !7)
!19 = !DILocation(line: 6, column: 13, scope: !7)
!20 = !DILocation(line: 6, column: 6, scope: !7)
!21 = !DILocation(line: 6, column: 11, scope: !7)
!22 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !11)
!23 = !DILocation(line: 7, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 6)
!25 = !DILocation(line: 0, scope: !24)
!26 = !DILocation(line: 7, column: 18, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 7, column: 6)
!28 = !DILocation(line: 7, column: 6, scope: !24)
!29 = !DILocation(line: 8, column: 23, scope: !27)
!30 = !DILocation(line: 8, column: 20, scope: !27)
!31 = !DILocation(line: 8, column: 19, scope: !27)
!32 = !DILocation(line: 8, column: 29, scope: !27)
!33 = !DILocation(line: 8, column: 31, scope: !27)
!34 = !DILocation(line: 8, column: 26, scope: !27)
!35 = !DILocation(line: 8, column: 34, scope: !27)
!36 = !DILocation(line: 8, column: 12, scope: !27)
!37 = !DILocation(line: 8, column: 17, scope: !27)
!38 = !DILocation(line: 7, column: 24, scope: !27)
!39 = !DILocation(line: 7, column: 6, scope: !27)
!40 = distinct !{!40, !28, !41}
!41 = !DILocation(line: 8, column: 35, scope: !24)
!42 = !DILocation(line: 10, column: 6, scope: !7)
!43 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !44, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11}
!46 = !DILocalVariable(name: "array", scope: !43, file: !1, line: 14, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 640, elements: !49)
!48 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!49 = !{!50}
!50 = !DISubrange(count: 10)
!51 = !DILocation(line: 14, column: 12, scope: !43)
!52 = !DILocalVariable(name: "lenArray", scope: !43, file: !1, line: 15, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 0, scope: !43)
!57 = !DILocalVariable(name: "p", scope: !43, file: !1, line: 17, type: !11)
!58 = !DILocation(line: 18, column: 14, scope: !43)
!59 = !DILocalVariable(name: "b", scope: !43, file: !1, line: 18, type: !10)
!60 = !DILocalVariable(name: "k", scope: !43, file: !1, line: 20, type: !11)
!61 = !DILocation(line: 23, column: 10, scope: !62)
!62 = distinct !DILexicalBlock(scope: !43, file: !1, line: 23, column: 5)
!63 = !DILocation(line: 0, scope: !62)
!64 = !DILocation(line: 23, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 23, column: 5)
!66 = !DILocation(line: 23, column: 18, scope: !65)
!67 = !DILocation(line: 23, column: 5, scope: !62)
!68 = !DILocation(line: 24, column: 26, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 9)
!70 = !DILocation(line: 24, column: 14, scope: !69)
!71 = !DILocation(line: 24, column: 23, scope: !69)
!72 = !DILocalVariable(name: "j", scope: !43, file: !1, line: 20, type: !11)
!73 = !DILocation(line: 0, scope: !69)
!74 = !DILocation(line: 24, column: 39, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 24, column: 9)
!76 = !DILocation(line: 24, column: 9, scope: !69)
!77 = !DILocation(line: 25, column: 25, scope: !75)
!78 = !DILocation(line: 25, column: 39, scope: !75)
!79 = !DILocation(line: 25, column: 32, scope: !75)
!80 = !DILocation(line: 25, column: 30, scope: !75)
!81 = !DILocation(line: 25, column: 13, scope: !75)
!82 = !DILocation(line: 25, column: 22, scope: !75)
!83 = !DILocation(line: 24, column: 45, scope: !75)
!84 = !DILocation(line: 24, column: 9, scope: !75)
!85 = distinct !{!85, !76, !86}
!86 = !DILocation(line: 25, column: 41, scope: !69)
!87 = !DILocation(line: 23, column: 31, scope: !65)
!88 = !DILocation(line: 23, column: 5, scope: !65)
!89 = distinct !{!89, !67, !90}
!90 = !DILocation(line: 25, column: 41, scope: !62)
!91 = !DILocation(line: 27, column: 5, scope: !43)
!92 = !DILocation(line: 30, column: 17, scope: !43)
!93 = !DILocation(line: 30, column: 14, scope: !43)
!94 = !DILocation(line: 31, column: 10, scope: !95)
!95 = distinct !DILexicalBlock(scope: !43, file: !1, line: 31, column: 5)
!96 = !DILocation(line: 0, scope: !95)
!97 = !DILocation(line: 31, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 31, column: 5)
!99 = !DILocation(line: 31, column: 18, scope: !98)
!100 = !DILocation(line: 31, column: 5, scope: !95)
!101 = !DILocation(line: 31, column: 49, scope: !98)
!102 = !DILocation(line: 31, column: 36, scope: !98)
!103 = !DILocation(line: 31, column: 31, scope: !98)
!104 = !DILocation(line: 31, column: 5, scope: !98)
!105 = distinct !{!105, !100, !106}
!106 = !DILocation(line: 31, column: 57, scope: !95)
!107 = !DILocation(line: 32, column: 5, scope: !43)
!108 = !DILocation(line: 33, column: 1, scope: !43)
