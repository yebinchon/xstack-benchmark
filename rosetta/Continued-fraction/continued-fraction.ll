; ModuleID = 'continued-fraction.bc'
source_filename = "continued-fraction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%12.10g\0A%12.10g\0A%12.10g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @calc(double (i32)* %f_a, double (i32)* %f_b, i32 %expansions) #0 !dbg !7 {
entry:
  %f_a.addr = alloca double (i32)*, align 8
  %f_b.addr = alloca double (i32)*, align 8
  %expansions.addr = alloca i32, align 4
  %a = alloca double, align 8
  %b = alloca double, align 8
  %r = alloca double, align 8
  %i = alloca i32, align 4
  store double (i32)* %f_a, double (i32)** %f_a.addr, align 8
  call void @llvm.dbg.declare(metadata double (i32)** %f_a.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store double (i32)* %f_b, double (i32)** %f_b.addr, align 8
  call void @llvm.dbg.declare(metadata double (i32)** %f_b.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 %expansions, i32* %expansions.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %expansions.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata double* %a, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata double* %b, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata double* %r, metadata !26, metadata !DIExpression()), !dbg !27
  store double 0.000000e+00, double* %r, align 8, !dbg !28
  store double 0.000000e+00, double* %b, align 8, !dbg !29
  store double 0.000000e+00, double* %a, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* %expansions.addr, align 4, !dbg !33
  store i32 %0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp ugt i32 %1, 0, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %2 = load double (i32)*, double (i32)** %f_a.addr, align 8, !dbg !41
  %3 = load i32, i32* %i, align 4, !dbg !43
  %call = call double %2(i32 %3), !dbg !41
  store double %call, double* %a, align 8, !dbg !44
  %4 = load double (i32)*, double (i32)** %f_b.addr, align 8, !dbg !45
  %5 = load i32, i32* %i, align 4, !dbg !46
  %call1 = call double %4(i32 %5), !dbg !45
  store double %call1, double* %b, align 8, !dbg !47
  %6 = load double, double* %b, align 8, !dbg !48
  %7 = load double, double* %a, align 8, !dbg !49
  %8 = load double, double* %r, align 8, !dbg !50
  %add = fadd double %7, %8, !dbg !51
  %div = fdiv double %6, %add, !dbg !52
  store double %div, double* %r, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !55
  %dec = add i32 %9, -1, !dbg !55
  store i32 %dec, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %10 = load double (i32)*, double (i32)** %f_a.addr, align 8, !dbg !59
  %call2 = call double %10(i32 0), !dbg !59
  store double %call2, double* %a, align 8, !dbg !60
  %11 = load double, double* %a, align 8, !dbg !61
  %12 = load double, double* %r, align 8, !dbg !62
  %add3 = fadd double %11, %12, !dbg !63
  ret double %add3, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @sqrt2_a(i32 %n) #0 !dbg !65 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32, i32* %n.addr, align 4, !dbg !68
  %tobool = icmp ne i32 %0, 0, !dbg !68
  %1 = zext i1 %tobool to i64, !dbg !68
  %cond = select i1 %tobool, double 2.000000e+00, double 1.000000e+00, !dbg !68
  ret double %cond, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sqrt2_b(i32 %n) #0 !dbg !70 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !71, metadata !DIExpression()), !dbg !72
  ret double 1.000000e+00, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @napier_a(i32 %n) #0 !dbg !74 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* %n.addr, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !77

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !78
  %conv = uitofp i32 %1 to double, !dbg !78
  br label %cond.end, !dbg !77

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !77

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %conv, %cond.true ], [ 2.000000e+00, %cond.false ], !dbg !77
  ret double %cond, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @napier_b(i32 %n) #0 !dbg !80 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* %n.addr, align 4, !dbg !83
  %conv = uitofp i32 %0 to double, !dbg !83
  %cmp = fcmp ogt double %conv, 1.000000e+00, !dbg !84
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !83

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !85
  %conv2 = uitofp i32 %1 to double, !dbg !85
  %sub = fsub double %conv2, 1.000000e+00, !dbg !86
  br label %cond.end, !dbg !83

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !83

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %sub, %cond.true ], [ 1.000000e+00, %cond.false ], !dbg !83
  ret double %cond, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @pi_a(i32 %n) #0 !dbg !88 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = load i32, i32* %n.addr, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  %1 = zext i1 %tobool to i64, !dbg !91
  %cond = select i1 %tobool, double 6.000000e+00, double 3.000000e+00, !dbg !91
  ret double %cond, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @pi_b(i32 %n) #0 !dbg !93 {
entry:
  %n.addr = alloca i32, align 4
  %c = alloca double, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata double* %c, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* %n.addr, align 4, !dbg !98
  %conv = uitofp i32 %0 to double, !dbg !98
  %mul = fmul double 2.000000e+00, %conv, !dbg !99
  %sub = fsub double %mul, 1.000000e+00, !dbg !100
  store double %sub, double* %c, align 8, !dbg !97
  %1 = load double, double* %c, align 8, !dbg !101
  %2 = load double, double* %c, align 8, !dbg !102
  %mul1 = fmul double %1, %2, !dbg !103
  ret double %mul1, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %sqrt2 = alloca double, align 8
  %napier = alloca double, align 8
  %pi = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %sqrt2, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata double* %napier, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata double* %pi, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call double @calc(double (i32)* @sqrt2_a, double (i32)* @sqrt2_b, i32 1000), !dbg !115
  store double %call, double* %sqrt2, align 8, !dbg !116
  %call1 = call double @calc(double (i32)* @napier_a, double (i32)* @napier_b, i32 1000), !dbg !117
  store double %call1, double* %napier, align 8, !dbg !118
  %call2 = call double @calc(double (i32)* @pi_a, double (i32)* @pi_b, i32 1000), !dbg !119
  store double %call2, double* %pi, align 8, !dbg !120
  %0 = load double, double* %sqrt2, align 8, !dbg !121
  %1 = load double, double* %napier, align 8, !dbg !122
  %2 = load double, double* %pi, align 8, !dbg !123
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), double %0, double %1, double %2), !dbg !124
  ret i32 0, !dbg !125
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "continued-fraction.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Continued-fraction")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "calc", scope: !1, file: !1, line: 9, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11, !15}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "coeff_func", file: !1, line: 5, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DISubroutineType(types: !14)
!14 = !{!10, !15}
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DILocalVariable(name: "f_a", arg: 1, scope: !7, file: !1, line: 9, type: !11)
!17 = !DILocation(line: 9, column: 24, scope: !7)
!18 = !DILocalVariable(name: "f_b", arg: 2, scope: !7, file: !1, line: 9, type: !11)
!19 = !DILocation(line: 9, column: 40, scope: !7)
!20 = !DILocalVariable(name: "expansions", arg: 3, scope: !7, file: !1, line: 9, type: !15)
!21 = !DILocation(line: 9, column: 54, scope: !7)
!22 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 11, type: !10)
!23 = !DILocation(line: 11, column: 9, scope: !7)
!24 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 11, type: !10)
!25 = !DILocation(line: 11, column: 12, scope: !7)
!26 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 11, type: !10)
!27 = !DILocation(line: 11, column: 15, scope: !7)
!28 = !DILocation(line: 12, column: 12, scope: !7)
!29 = !DILocation(line: 12, column: 8, scope: !7)
!30 = !DILocation(line: 12, column: 4, scope: !7)
!31 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !15)
!32 = !DILocation(line: 14, column: 11, scope: !7)
!33 = !DILocation(line: 15, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 2)
!35 = !DILocation(line: 15, column: 9, scope: !34)
!36 = !DILocation(line: 15, column: 7, scope: !34)
!37 = !DILocation(line: 15, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 15, column: 2)
!39 = !DILocation(line: 15, column: 25, scope: !38)
!40 = !DILocation(line: 15, column: 2, scope: !34)
!41 = !DILocation(line: 16, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 15, column: 35)
!43 = !DILocation(line: 16, column: 11, scope: !42)
!44 = !DILocation(line: 16, column: 5, scope: !42)
!45 = !DILocation(line: 17, column: 7, scope: !42)
!46 = !DILocation(line: 17, column: 11, scope: !42)
!47 = !DILocation(line: 17, column: 5, scope: !42)
!48 = !DILocation(line: 18, column: 7, scope: !42)
!49 = !DILocation(line: 18, column: 12, scope: !42)
!50 = !DILocation(line: 18, column: 16, scope: !42)
!51 = !DILocation(line: 18, column: 14, scope: !42)
!52 = !DILocation(line: 18, column: 9, scope: !42)
!53 = !DILocation(line: 18, column: 5, scope: !42)
!54 = !DILocation(line: 19, column: 2, scope: !42)
!55 = !DILocation(line: 15, column: 31, scope: !38)
!56 = !DILocation(line: 15, column: 2, scope: !38)
!57 = distinct !{!57, !40, !58}
!58 = !DILocation(line: 19, column: 2, scope: !34)
!59 = !DILocation(line: 20, column: 6, scope: !7)
!60 = !DILocation(line: 20, column: 4, scope: !7)
!61 = !DILocation(line: 22, column: 9, scope: !7)
!62 = !DILocation(line: 22, column: 13, scope: !7)
!63 = !DILocation(line: 22, column: 11, scope: !7)
!64 = !DILocation(line: 22, column: 2, scope: !7)
!65 = distinct !DISubprogram(name: "sqrt2_a", scope: !1, file: !1, line: 26, type: !13, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "n", arg: 1, scope: !65, file: !1, line: 26, type: !15)
!67 = !DILocation(line: 26, column: 25, scope: !65)
!68 = !DILocation(line: 28, column: 9, scope: !65)
!69 = !DILocation(line: 28, column: 2, scope: !65)
!70 = distinct !DISubprogram(name: "sqrt2_b", scope: !1, file: !1, line: 31, type: !13, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "n", arg: 1, scope: !70, file: !1, line: 31, type: !15)
!72 = !DILocation(line: 31, column: 25, scope: !70)
!73 = !DILocation(line: 33, column: 2, scope: !70)
!74 = distinct !DISubprogram(name: "napier_a", scope: !1, file: !1, line: 37, type: !13, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "n", arg: 1, scope: !74, file: !1, line: 37, type: !15)
!76 = !DILocation(line: 37, column: 26, scope: !74)
!77 = !DILocation(line: 39, column: 9, scope: !74)
!78 = !DILocation(line: 39, column: 13, scope: !74)
!79 = !DILocation(line: 39, column: 2, scope: !74)
!80 = distinct !DISubprogram(name: "napier_b", scope: !1, file: !1, line: 42, type: !13, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "n", arg: 1, scope: !80, file: !1, line: 42, type: !15)
!82 = !DILocation(line: 42, column: 26, scope: !80)
!83 = !DILocation(line: 44, column: 9, scope: !80)
!84 = !DILocation(line: 44, column: 11, scope: !80)
!85 = !DILocation(line: 44, column: 19, scope: !80)
!86 = !DILocation(line: 44, column: 21, scope: !80)
!87 = !DILocation(line: 44, column: 2, scope: !80)
!88 = distinct !DISubprogram(name: "pi_a", scope: !1, file: !1, line: 48, type: !13, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "n", arg: 1, scope: !88, file: !1, line: 48, type: !15)
!90 = !DILocation(line: 48, column: 22, scope: !88)
!91 = !DILocation(line: 50, column: 9, scope: !88)
!92 = !DILocation(line: 50, column: 2, scope: !88)
!93 = distinct !DISubprogram(name: "pi_b", scope: !1, file: !1, line: 53, type: !13, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "n", arg: 1, scope: !93, file: !1, line: 53, type: !15)
!95 = !DILocation(line: 53, column: 22, scope: !93)
!96 = !DILocalVariable(name: "c", scope: !93, file: !1, line: 55, type: !10)
!97 = !DILocation(line: 55, column: 9, scope: !93)
!98 = !DILocation(line: 55, column: 19, scope: !93)
!99 = !DILocation(line: 55, column: 17, scope: !93)
!100 = !DILocation(line: 55, column: 21, scope: !93)
!101 = !DILocation(line: 57, column: 9, scope: !93)
!102 = !DILocation(line: 57, column: 13, scope: !93)
!103 = !DILocation(line: 57, column: 11, scope: !93)
!104 = !DILocation(line: 57, column: 2, scope: !93)
!105 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 60, type: !106, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!108}
!108 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!109 = !DILocalVariable(name: "sqrt2", scope: !105, file: !1, line: 62, type: !10)
!110 = !DILocation(line: 62, column: 9, scope: !105)
!111 = !DILocalVariable(name: "napier", scope: !105, file: !1, line: 62, type: !10)
!112 = !DILocation(line: 62, column: 16, scope: !105)
!113 = !DILocalVariable(name: "pi", scope: !105, file: !1, line: 62, type: !10)
!114 = !DILocation(line: 62, column: 24, scope: !105)
!115 = !DILocation(line: 64, column: 11, scope: !105)
!116 = !DILocation(line: 64, column: 9, scope: !105)
!117 = !DILocation(line: 65, column: 11, scope: !105)
!118 = !DILocation(line: 65, column: 9, scope: !105)
!119 = !DILocation(line: 66, column: 11, scope: !105)
!120 = !DILocation(line: 66, column: 9, scope: !105)
!121 = !DILocation(line: 68, column: 40, scope: !105)
!122 = !DILocation(line: 68, column: 47, scope: !105)
!123 = !DILocation(line: 68, column: 55, scope: !105)
!124 = !DILocation(line: 68, column: 2, scope: !105)
!125 = !DILocation(line: 70, column: 2, scope: !105)
