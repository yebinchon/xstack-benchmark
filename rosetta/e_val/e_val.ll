; ModuleID = 'e_val.c'
source_filename = "e_val.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [128 x i8] c"The double precision in C give about 15 significant digits.\0AValues below are presented with 16 digits after the decimal point.\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Euler constant e = %.16lf\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %e = alloca double, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %N = alloca i32, align 4
  %a = alloca [1000 x double], align 16
  %i5 = alloca i32, align 4
  %i18 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata double* %e, metadata !18, metadata !DIExpression()), !dbg !20
  %call = call i32 @puts(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %call1 = call double @exp(double 1.000000e+00) #4, !dbg !22
  store double %call1, double* %e, align 8, !dbg !23
  %0 = load double, double* %e, align 8, !dbg !24
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %0), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %n, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 8192, i32* %n, align 4, !dbg !27
  %1 = load i32, i32* %n, align 4, !dbg !28
  %conv = sitofp i32 %1 to double, !dbg !28
  %div = fdiv double 1.000000e+00, %conv, !dbg !29
  %add = fadd double 1.000000e+00, %div, !dbg !30
  store double %add, double* %e, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %2, 13, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load double, double* %e, align 8, !dbg !40
  %4 = load double, double* %e, align 8, !dbg !41
  %mul = fmul double %4, %3, !dbg !41
  store double %mul, double* %e, align 8, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %5, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  %6 = load double, double* %e, align 8, !dbg !47
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %6), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %N, metadata !49, metadata !DIExpression()), !dbg !51
  store i32 1000, i32* %N, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata [1000 x double]* %a, metadata !52, metadata !DIExpression()), !dbg !56
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %a, i64 0, i64 0, !dbg !57
  store double 1.000000e+00, double* %arrayidx, align 16, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %i5, metadata !59, metadata !DIExpression()), !dbg !61
  store i32 1, i32* %i5, align 4, !dbg !61
  br label %for.cond6, !dbg !62

for.cond6:                                        ; preds = %for.inc15, %for.end
  %7 = load i32, i32* %i5, align 4, !dbg !63
  %cmp7 = icmp slt i32 %7, 1000, !dbg !65
  br i1 %cmp7, label %for.body9, label %for.end17, !dbg !66

for.body9:                                        ; preds = %for.cond6
  %8 = load i32, i32* %i5, align 4, !dbg !67
  %sub = sub nsw i32 %8, 1, !dbg !69
  %idxprom = sext i32 %sub to i64, !dbg !70
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %a, i64 0, i64 %idxprom, !dbg !70
  %9 = load double, double* %arrayidx10, align 8, !dbg !70
  %10 = load i32, i32* %i5, align 4, !dbg !71
  %conv11 = sitofp i32 %10 to double, !dbg !71
  %div12 = fdiv double %9, %conv11, !dbg !72
  %11 = load i32, i32* %i5, align 4, !dbg !73
  %idxprom13 = sext i32 %11 to i64, !dbg !74
  %arrayidx14 = getelementptr inbounds [1000 x double], [1000 x double]* %a, i64 0, i64 %idxprom13, !dbg !74
  store double %div12, double* %arrayidx14, align 8, !dbg !75
  br label %for.inc15, !dbg !76

for.inc15:                                        ; preds = %for.body9
  %12 = load i32, i32* %i5, align 4, !dbg !77
  %inc16 = add nsw i32 %12, 1, !dbg !77
  store i32 %inc16, i32* %i5, align 4, !dbg !77
  br label %for.cond6, !dbg !78, !llvm.loop !79

for.end17:                                        ; preds = %for.cond6
  store double 1.000000e+00, double* %e, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %i18, metadata !82, metadata !DIExpression()), !dbg !84
  store i32 999, i32* %i18, align 4, !dbg !84
  br label %for.cond19, !dbg !85

for.cond19:                                       ; preds = %for.inc26, %for.end17
  %13 = load i32, i32* %i18, align 4, !dbg !86
  %cmp20 = icmp sgt i32 %13, 0, !dbg !88
  br i1 %cmp20, label %for.body22, label %for.end27, !dbg !89

for.body22:                                       ; preds = %for.cond19
  %14 = load i32, i32* %i18, align 4, !dbg !90
  %idxprom23 = sext i32 %14 to i64, !dbg !91
  %arrayidx24 = getelementptr inbounds [1000 x double], [1000 x double]* %a, i64 0, i64 %idxprom23, !dbg !91
  %15 = load double, double* %arrayidx24, align 8, !dbg !91
  %16 = load double, double* %e, align 8, !dbg !92
  %add25 = fadd double %16, %15, !dbg !92
  store double %add25, double* %e, align 8, !dbg !92
  br label %for.inc26, !dbg !93

for.inc26:                                        ; preds = %for.body22
  %17 = load i32, i32* %i18, align 4, !dbg !94
  %dec = add nsw i32 %17, -1, !dbg !94
  store i32 %dec, i32* %i18, align 4, !dbg !94
  br label %for.cond19, !dbg !95, !llvm.loop !96

for.end27:                                        ; preds = %for.cond19
  %18 = load double, double* %e, align 8, !dbg !98
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %18), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @puts(i8*) #2

; Function Attrs: nounwind
declare dso_local double @exp(double) #3

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "e_val.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/e_val")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 26, scope: !7)
!18 = !DILocalVariable(name: "e", scope: !7, file: !1, line: 6, type: !19)
!19 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!20 = !DILocation(line: 6, column: 10, scope: !7)
!21 = !DILocation(line: 8, column: 3, scope: !7)
!22 = !DILocation(line: 13, column: 7, scope: !7)
!23 = !DILocation(line: 13, column: 5, scope: !7)
!24 = !DILocation(line: 14, column: 41, scope: !7)
!25 = !DILocation(line: 14, column: 3, scope: !7)
!26 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 18, type: !10)
!27 = !DILocation(line: 18, column: 7, scope: !7)
!28 = !DILocation(line: 19, column: 19, scope: !7)
!29 = !DILocation(line: 19, column: 17, scope: !7)
!30 = !DILocation(line: 19, column: 11, scope: !7)
!31 = !DILocation(line: 19, column: 5, scope: !7)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 20, type: !10)
!33 = distinct !DILexicalBlock(scope: !7, file: !1, line: 20, column: 3)
!34 = !DILocation(line: 20, column: 12, scope: !33)
!35 = !DILocation(line: 20, column: 8, scope: !33)
!36 = !DILocation(line: 20, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 20, column: 3)
!38 = !DILocation(line: 20, column: 21, scope: !37)
!39 = !DILocation(line: 20, column: 3, scope: !33)
!40 = !DILocation(line: 21, column: 10, scope: !37)
!41 = !DILocation(line: 21, column: 7, scope: !37)
!42 = !DILocation(line: 21, column: 5, scope: !37)
!43 = !DILocation(line: 20, column: 28, scope: !37)
!44 = !DILocation(line: 20, column: 3, scope: !37)
!45 = distinct !{!45, !39, !46}
!46 = !DILocation(line: 21, column: 10, scope: !33)
!47 = !DILocation(line: 22, column: 41, scope: !7)
!48 = !DILocation(line: 22, column: 3, scope: !7)
!49 = !DILocalVariable(name: "N", scope: !7, file: !1, line: 27, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!51 = !DILocation(line: 27, column: 13, scope: !7)
!52 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 28, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 64000, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 1000)
!56 = !DILocation(line: 28, column: 10, scope: !7)
!57 = !DILocation(line: 29, column: 3, scope: !7)
!58 = !DILocation(line: 29, column: 8, scope: !7)
!59 = !DILocalVariable(name: "i", scope: !60, file: !1, line: 30, type: !10)
!60 = distinct !DILexicalBlock(scope: !7, file: !1, line: 30, column: 3)
!61 = !DILocation(line: 30, column: 12, scope: !60)
!62 = !DILocation(line: 30, column: 8, scope: !60)
!63 = !DILocation(line: 30, column: 19, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 30, column: 3)
!65 = !DILocation(line: 30, column: 21, scope: !64)
!66 = !DILocation(line: 30, column: 3, scope: !60)
!67 = !DILocation(line: 32, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !1, line: 31, column: 3)
!69 = !DILocation(line: 32, column: 15, scope: !68)
!70 = !DILocation(line: 32, column: 12, scope: !68)
!71 = !DILocation(line: 32, column: 21, scope: !68)
!72 = !DILocation(line: 32, column: 19, scope: !68)
!73 = !DILocation(line: 32, column: 7, scope: !68)
!74 = !DILocation(line: 32, column: 5, scope: !68)
!75 = !DILocation(line: 32, column: 10, scope: !68)
!76 = !DILocation(line: 33, column: 3, scope: !68)
!77 = !DILocation(line: 30, column: 27, scope: !64)
!78 = !DILocation(line: 30, column: 3, scope: !64)
!79 = distinct !{!79, !66, !80}
!80 = !DILocation(line: 33, column: 3, scope: !60)
!81 = !DILocation(line: 34, column: 5, scope: !7)
!82 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 35, type: !10)
!83 = distinct !DILexicalBlock(scope: !7, file: !1, line: 35, column: 3)
!84 = !DILocation(line: 35, column: 12, scope: !83)
!85 = !DILocation(line: 35, column: 8, scope: !83)
!86 = !DILocation(line: 35, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 3)
!88 = !DILocation(line: 35, column: 25, scope: !87)
!89 = !DILocation(line: 35, column: 3, scope: !83)
!90 = !DILocation(line: 36, column: 12, scope: !87)
!91 = !DILocation(line: 36, column: 10, scope: !87)
!92 = !DILocation(line: 36, column: 7, scope: !87)
!93 = !DILocation(line: 36, column: 5, scope: !87)
!94 = !DILocation(line: 35, column: 31, scope: !87)
!95 = !DILocation(line: 35, column: 3, scope: !87)
!96 = distinct !{!96, !89, !97}
!97 = !DILocation(line: 36, column: 13, scope: !83)
!98 = !DILocation(line: 37, column: 41, scope: !7)
!99 = !DILocation(line: 37, column: 3, scope: !7)
!100 = !DILocation(line: 39, column: 3, scope: !7)
