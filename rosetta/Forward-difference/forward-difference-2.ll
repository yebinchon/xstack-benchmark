; ModuleID = 'forward-difference-2.c'
source_filename = "forward-difference-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.array = private unnamed_addr constant [10 x double] [double 9.000000e+01, double 4.700000e+01, double 5.800000e+01, double 2.900000e+01, double 2.200000e+01, double 3.200000e+01, double 5.500000e+01, double 5.000000e+00, double 5.500000e+01, double 7.300000e+01], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @binomCoeff(i32 %n) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %b = alloca i32*, align 8
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.declare(metadata i32** %b, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %n.addr, align 4, !dbg !16
  %add = add nsw i32 %0, 1, !dbg !17
  %conv = sext i32 %add to i64, !dbg !16
  %call = call i8* @calloc(i64 %conv, i64 4), !dbg !18
  %1 = bitcast i8* %call to i32*, !dbg !18
  store i32* %1, i32** %b, align 8, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  %2 = load i32, i32* %n.addr, align 4, !dbg !21
  %rem = srem i32 %2, 2, !dbg !22
  %tobool = icmp ne i32 %rem, 0, !dbg !21
  %3 = zext i1 %tobool to i64, !dbg !21
  %cond = select i1 %tobool, i32 -1, i32 1, !dbg !21
  %4 = load i32*, i32** %b, align 8, !dbg !23
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !23
  store i32 %cond, i32* %arrayidx, align 4, !dbg !24
  store i32 1, i32* %j, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %j, align 4, !dbg !28
  %6 = load i32, i32* %n.addr, align 4, !dbg !30
  %cmp = icmp sle i32 %5, %6, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %b, align 8, !dbg !33
  %8 = load i32, i32* %j, align 4, !dbg !34
  %sub = sub nsw i32 %8, 1, !dbg !35
  %idxprom = sext i32 %sub to i64, !dbg !33
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !33
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !33
  %sub3 = sub nsw i32 0, %9, !dbg !36
  %10 = load i32, i32* %n.addr, align 4, !dbg !37
  %add4 = add nsw i32 %10, 1, !dbg !38
  %11 = load i32, i32* %j, align 4, !dbg !39
  %sub5 = sub nsw i32 %add4, %11, !dbg !40
  %mul = mul nsw i32 %sub3, %sub5, !dbg !41
  %12 = load i32, i32* %j, align 4, !dbg !42
  %div = sdiv i32 %mul, %12, !dbg !43
  %13 = load i32*, i32** %b, align 8, !dbg !44
  %14 = load i32, i32* %j, align 4, !dbg !45
  %idxprom6 = sext i32 %14 to i64, !dbg !44
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !44
  store i32 %div, i32* %arrayidx7, align 4, !dbg !46
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %j, align 4, !dbg !47
  %inc = add nsw i32 %15, 1, !dbg !47
  store i32 %inc, i32* %j, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %b, align 8, !dbg !51
  ret i32* %16, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %array = alloca [10 x double], align 16
  %lenArray = alloca i64, align 8
  %p = alloca i32, align 4
  %b = alloca i32*, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x double]* %array, metadata !56, metadata !DIExpression()), !dbg !61
  %0 = bitcast [10 x double]* %array to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x double]* @__const.main.array to i8*), i64 80, i1 false), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %lenArray, metadata !62, metadata !DIExpression()), !dbg !66
  store i64 10, i64* %lenArray, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32* %p, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 4, i32* %p, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %b, metadata !69, metadata !DIExpression()), !dbg !70
  %1 = load i32, i32* %p, align 4, !dbg !71
  %call = call i32* @binomCoeff(i32 %1), !dbg !72
  store i32* %call, i32** %b, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %k, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 0, i32* %k, align 4, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc17, %entry
  %2 = load i32, i32* %k, align 4, !dbg !80
  %conv = sext i32 %2 to i64, !dbg !80
  %3 = load i64, i64* %lenArray, align 8, !dbg !82
  %cmp = icmp ult i64 %conv, %3, !dbg !83
  br i1 %cmp, label %for.body, label %for.end19, !dbg !84

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %b, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !85
  %5 = load i32, i32* %arrayidx, align 4, !dbg !85
  %conv2 = sitofp i32 %5 to double, !dbg !85
  %6 = load i32, i32* %k, align 4, !dbg !87
  %idxprom = sext i32 %6 to i64, !dbg !88
  %arrayidx3 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom, !dbg !88
  %7 = load double, double* %arrayidx3, align 8, !dbg !89
  %mul = fmul double %7, %conv2, !dbg !89
  store double %mul, double* %arrayidx3, align 8, !dbg !89
  store i32 1, i32* %j, align 4, !dbg !90
  br label %for.cond4, !dbg !88

for.cond4:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %j, align 4, !dbg !91
  %9 = load i32, i32* %p, align 4, !dbg !93
  %cmp5 = icmp sle i32 %8, %9, !dbg !94
  br i1 %cmp5, label %for.body7, label %for.end, !dbg !95

for.body7:                                        ; preds = %for.cond4
  %10 = load i32*, i32** %b, align 8, !dbg !96
  %11 = load i32, i32* %j, align 4, !dbg !97
  %idxprom8 = sext i32 %11 to i64, !dbg !96
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %idxprom8, !dbg !96
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !96
  %conv10 = sitofp i32 %12 to double, !dbg !96
  %13 = load i32, i32* %k, align 4, !dbg !98
  %14 = load i32, i32* %j, align 4, !dbg !99
  %add = add nsw i32 %13, %14, !dbg !100
  %idxprom11 = sext i32 %add to i64, !dbg !101
  %arrayidx12 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom11, !dbg !101
  %15 = load double, double* %arrayidx12, align 8, !dbg !101
  %mul13 = fmul double %conv10, %15, !dbg !102
  %16 = load i32, i32* %k, align 4, !dbg !103
  %idxprom14 = sext i32 %16 to i64, !dbg !104
  %arrayidx15 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom14, !dbg !104
  %17 = load double, double* %arrayidx15, align 8, !dbg !105
  %add16 = fadd double %17, %mul13, !dbg !105
  store double %add16, double* %arrayidx15, align 8, !dbg !105
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body7
  %18 = load i32, i32* %j, align 4, !dbg !106
  %inc = add nsw i32 %18, 1, !dbg !106
  store i32 %inc, i32* %j, align 4, !dbg !106
  br label %for.cond4, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond4
  br label %for.inc17, !dbg !109

for.inc17:                                        ; preds = %for.end
  %19 = load i32, i32* %k, align 4, !dbg !110
  %inc18 = add nsw i32 %19, 1, !dbg !110
  store i32 %inc18, i32* %k, align 4, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end19:                                        ; preds = %for.cond
  %20 = load i32*, i32** %b, align 8, !dbg !114
  %call20 = call i32 (i32*, ...) bitcast (i32 (...)* @free to i32 (i32*, ...)*)(i32* %20), !dbg !115
  %21 = load i32, i32* %p, align 4, !dbg !116
  %conv21 = sext i32 %21 to i64, !dbg !116
  %22 = load i64, i64* %lenArray, align 8, !dbg !117
  %sub = sub i64 %22, %conv21, !dbg !117
  store i64 %sub, i64* %lenArray, align 8, !dbg !117
  store i32 0, i32* %k, align 4, !dbg !118
  br label %for.cond22, !dbg !120

for.cond22:                                       ; preds = %for.inc30, %for.end19
  %23 = load i32, i32* %k, align 4, !dbg !121
  %conv23 = sext i32 %23 to i64, !dbg !121
  %24 = load i64, i64* %lenArray, align 8, !dbg !123
  %cmp24 = icmp ult i64 %conv23, %24, !dbg !124
  br i1 %cmp24, label %for.body26, label %for.end32, !dbg !125

for.body26:                                       ; preds = %for.cond22
  %25 = load i32, i32* %k, align 4, !dbg !126
  %idxprom27 = sext i32 %25 to i64, !dbg !127
  %arrayidx28 = getelementptr inbounds [10 x double], [10 x double]* %array, i64 0, i64 %idxprom27, !dbg !127
  %26 = load double, double* %arrayidx28, align 8, !dbg !127
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %26), !dbg !128
  br label %for.inc30, !dbg !128

for.inc30:                                        ; preds = %for.body26
  %27 = load i32, i32* %k, align 4, !dbg !129
  %inc31 = add nsw i32 %27, 1, !dbg !129
  store i32 %inc31, i32* %k, align 4, !dbg !129
  br label %for.cond22, !dbg !130, !llvm.loop !131

for.end32:                                        ; preds = %for.cond22
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !133
  %28 = load i32, i32* %retval, align 4, !dbg !134
  ret i32 %28, !dbg !134
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @free(...) #2

declare dso_local i32 @printf(i8*, ...) #2

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
!13 = !DILocation(line: 3, column: 21, scope: !7)
!14 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 11, scope: !7)
!16 = !DILocation(line: 4, column: 22, scope: !7)
!17 = !DILocation(line: 4, column: 23, scope: !7)
!18 = !DILocation(line: 4, column: 15, scope: !7)
!19 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !11)
!20 = !DILocation(line: 5, column: 10, scope: !7)
!21 = !DILocation(line: 6, column: 13, scope: !7)
!22 = !DILocation(line: 6, column: 14, scope: !7)
!23 = !DILocation(line: 6, column: 6, scope: !7)
!24 = !DILocation(line: 6, column: 11, scope: !7)
!25 = !DILocation(line: 7, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 6)
!27 = !DILocation(line: 7, column: 11, scope: !26)
!28 = !DILocation(line: 7, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !1, line: 7, column: 6)
!30 = !DILocation(line: 7, column: 20, scope: !29)
!31 = !DILocation(line: 7, column: 18, scope: !29)
!32 = !DILocation(line: 7, column: 6, scope: !26)
!33 = !DILocation(line: 8, column: 20, scope: !29)
!34 = !DILocation(line: 8, column: 22, scope: !29)
!35 = !DILocation(line: 8, column: 23, scope: !29)
!36 = !DILocation(line: 8, column: 19, scope: !29)
!37 = !DILocation(line: 8, column: 28, scope: !29)
!38 = !DILocation(line: 8, column: 29, scope: !29)
!39 = !DILocation(line: 8, column: 32, scope: !29)
!40 = !DILocation(line: 8, column: 31, scope: !29)
!41 = !DILocation(line: 8, column: 26, scope: !29)
!42 = !DILocation(line: 8, column: 35, scope: !29)
!43 = !DILocation(line: 8, column: 34, scope: !29)
!44 = !DILocation(line: 8, column: 12, scope: !29)
!45 = !DILocation(line: 8, column: 14, scope: !29)
!46 = !DILocation(line: 8, column: 17, scope: !29)
!47 = !DILocation(line: 7, column: 24, scope: !29)
!48 = !DILocation(line: 7, column: 6, scope: !29)
!49 = distinct !{!49, !32, !50}
!50 = !DILocation(line: 8, column: 35, scope: !26)
!51 = !DILocation(line: 10, column: 13, scope: !7)
!52 = !DILocation(line: 10, column: 6, scope: !7)
!53 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !54, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!11}
!56 = !DILocalVariable(name: "array", scope: !53, file: !1, line: 14, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 640, elements: !59)
!58 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!59 = !{!60}
!60 = !DISubrange(count: 10)
!61 = !DILocation(line: 14, column: 12, scope: !53)
!62 = !DILocalVariable(name: "lenArray", scope: !53, file: !1, line: 15, type: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !64, line: 46, baseType: !65)
!64 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!65 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 15, column: 12, scope: !53)
!67 = !DILocalVariable(name: "p", scope: !53, file: !1, line: 17, type: !11)
!68 = !DILocation(line: 17, column: 9, scope: !53)
!69 = !DILocalVariable(name: "b", scope: !53, file: !1, line: 18, type: !10)
!70 = !DILocation(line: 18, column: 10, scope: !53)
!71 = !DILocation(line: 18, column: 25, scope: !53)
!72 = !DILocation(line: 18, column: 14, scope: !53)
!73 = !DILocalVariable(name: "j", scope: !53, file: !1, line: 20, type: !11)
!74 = !DILocation(line: 20, column: 9, scope: !53)
!75 = !DILocalVariable(name: "k", scope: !53, file: !1, line: 20, type: !11)
!76 = !DILocation(line: 20, column: 12, scope: !53)
!77 = !DILocation(line: 23, column: 11, scope: !78)
!78 = distinct !DILexicalBlock(scope: !53, file: !1, line: 23, column: 5)
!79 = !DILocation(line: 23, column: 10, scope: !78)
!80 = !DILocation(line: 23, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 23, column: 5)
!82 = !DILocation(line: 23, column: 20, scope: !81)
!83 = !DILocation(line: 23, column: 18, scope: !81)
!84 = !DILocation(line: 23, column: 5, scope: !78)
!85 = !DILocation(line: 24, column: 26, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 24, column: 9)
!87 = !DILocation(line: 24, column: 20, scope: !86)
!88 = !DILocation(line: 24, column: 14, scope: !86)
!89 = !DILocation(line: 24, column: 23, scope: !86)
!90 = !DILocation(line: 24, column: 33, scope: !86)
!91 = !DILocation(line: 24, column: 38, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !1, line: 24, column: 9)
!93 = !DILocation(line: 24, column: 41, scope: !92)
!94 = !DILocation(line: 24, column: 39, scope: !92)
!95 = !DILocation(line: 24, column: 9, scope: !86)
!96 = !DILocation(line: 25, column: 25, scope: !92)
!97 = !DILocation(line: 25, column: 27, scope: !92)
!98 = !DILocation(line: 25, column: 38, scope: !92)
!99 = !DILocation(line: 25, column: 40, scope: !92)
!100 = !DILocation(line: 25, column: 39, scope: !92)
!101 = !DILocation(line: 25, column: 32, scope: !92)
!102 = !DILocation(line: 25, column: 30, scope: !92)
!103 = !DILocation(line: 25, column: 19, scope: !92)
!104 = !DILocation(line: 25, column: 13, scope: !92)
!105 = !DILocation(line: 25, column: 22, scope: !92)
!106 = !DILocation(line: 24, column: 45, scope: !92)
!107 = !DILocation(line: 24, column: 9, scope: !92)
!108 = distinct !{!108, !95, !109}
!109 = !DILocation(line: 25, column: 41, scope: !86)
!110 = !DILocation(line: 23, column: 31, scope: !81)
!111 = !DILocation(line: 23, column: 5, scope: !81)
!112 = distinct !{!112, !84, !113}
!113 = !DILocation(line: 25, column: 41, scope: !78)
!114 = !DILocation(line: 27, column: 10, scope: !53)
!115 = !DILocation(line: 27, column: 5, scope: !53)
!116 = !DILocation(line: 30, column: 17, scope: !53)
!117 = !DILocation(line: 30, column: 14, scope: !53)
!118 = !DILocation(line: 31, column: 11, scope: !119)
!119 = distinct !DILexicalBlock(scope: !53, file: !1, line: 31, column: 5)
!120 = !DILocation(line: 31, column: 10, scope: !119)
!121 = !DILocation(line: 31, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !1, line: 31, column: 5)
!123 = !DILocation(line: 31, column: 20, scope: !122)
!124 = !DILocation(line: 31, column: 18, scope: !122)
!125 = !DILocation(line: 31, column: 5, scope: !119)
!126 = !DILocation(line: 31, column: 55, scope: !122)
!127 = !DILocation(line: 31, column: 49, scope: !122)
!128 = !DILocation(line: 31, column: 36, scope: !122)
!129 = !DILocation(line: 31, column: 31, scope: !122)
!130 = !DILocation(line: 31, column: 5, scope: !122)
!131 = distinct !{!131, !125, !132}
!132 = !DILocation(line: 31, column: 57, scope: !119)
!133 = !DILocation(line: 32, column: 5, scope: !53)
!134 = !DILocation(line: 33, column: 1, scope: !53)
