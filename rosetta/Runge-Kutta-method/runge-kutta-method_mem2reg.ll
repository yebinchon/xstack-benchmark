; ModuleID = 'runge-kutta-method.ll'
source_filename = "runge-kutta-method.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"x\09y\09rel. err.\0A------------\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%g\09%g\09%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rk4(double (double, double)* %f, double %dx, double %x, double %y) #0 !dbg !10 {
entry:
  call void @llvm.dbg.value(metadata double (double, double)* %f, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double %dx, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double %x, metadata !19, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double %y, metadata !20, metadata !DIExpression()), !dbg !17
  %call = call double %f(double %x, double %y), !dbg !21
  %mul = fmul double %dx, %call, !dbg !22
  call void @llvm.dbg.value(metadata double %mul, metadata !23, metadata !DIExpression()), !dbg !17
  %div = fdiv double %dx, 2.000000e+00, !dbg !24
  %add = fadd double %x, %div, !dbg !25
  %div1 = fdiv double %mul, 2.000000e+00, !dbg !26
  %add2 = fadd double %y, %div1, !dbg !27
  %call3 = call double %f(double %add, double %add2), !dbg !28
  %mul4 = fmul double %dx, %call3, !dbg !29
  call void @llvm.dbg.value(metadata double %mul4, metadata !30, metadata !DIExpression()), !dbg !17
  %div5 = fdiv double %dx, 2.000000e+00, !dbg !31
  %add6 = fadd double %x, %div5, !dbg !32
  %div7 = fdiv double %mul4, 2.000000e+00, !dbg !33
  %add8 = fadd double %y, %div7, !dbg !34
  %call9 = call double %f(double %add6, double %add8), !dbg !35
  %mul10 = fmul double %dx, %call9, !dbg !36
  call void @llvm.dbg.value(metadata double %mul10, metadata !37, metadata !DIExpression()), !dbg !17
  %add11 = fadd double %x, %dx, !dbg !38
  %add12 = fadd double %y, %mul10, !dbg !39
  %call13 = call double %f(double %add11, double %add12), !dbg !40
  %mul14 = fmul double %dx, %call13, !dbg !41
  call void @llvm.dbg.value(metadata double %mul14, metadata !42, metadata !DIExpression()), !dbg !17
  %mul15 = fmul double 2.000000e+00, %mul4, !dbg !43
  %add16 = fadd double %mul, %mul15, !dbg !44
  %mul17 = fmul double 2.000000e+00, %mul10, !dbg !45
  %add18 = fadd double %add16, %mul17, !dbg !46
  %add19 = fadd double %add18, %mul14, !dbg !47
  %div20 = fdiv double %add19, 6.000000e+00, !dbg !48
  %add21 = fadd double %y, %div20, !dbg !49
  ret double %add21, !dbg !50
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rate(double %x, double %y) #0 !dbg !51 {
entry:
  call void @llvm.dbg.value(metadata double %x, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata double %y, metadata !54, metadata !DIExpression()), !dbg !53
  %call = call double @sqrt(double %y) #4, !dbg !55
  %mul = fmul double %x, %call, !dbg !56
  ret double %mul, !dbg !57
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !58 {
entry:
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata double 1.000000e+01, metadata !64, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata double 1.000000e-01, metadata !65, metadata !DIExpression()), !dbg !63
  %sub = fsub double 1.000000e+01, 0.000000e+00, !dbg !66
  %div = fdiv double %sub, 1.000000e-01, !dbg !67
  %add = fadd double 1.000000e+00, %div, !dbg !68
  %conv = fptosi double %add to i32, !dbg !69
  call void @llvm.dbg.value(metadata i32 %conv, metadata !70, metadata !DIExpression()), !dbg !63
  %conv1 = sext i32 %conv to i64, !dbg !71
  %mul = mul i64 8, %conv1, !dbg !72
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !73
  %0 = bitcast i8* %call to double*, !dbg !74
  call void @llvm.dbg.value(metadata double* %0, metadata !75, metadata !DIExpression()), !dbg !63
  %arrayidx = getelementptr inbounds double, double* %0, i64 0, !dbg !76
  store double 1.000000e+00, double* %arrayidx, align 8, !dbg !78
  call void @llvm.dbg.value(metadata i32 1, metadata !79, metadata !DIExpression()), !dbg !63
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !80
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !79, metadata !DIExpression()), !dbg !63
  %cmp = icmp slt i32 %i.0, %conv, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %sub3 = sub nsw i32 %i.0, 1, !dbg !84
  %conv4 = sitofp i32 %sub3 to double, !dbg !85
  %mul5 = fmul double 1.000000e-01, %conv4, !dbg !86
  %add6 = fadd double 0.000000e+00, %mul5, !dbg !87
  %sub7 = sub nsw i32 %i.0, 1, !dbg !88
  %idxprom = sext i32 %sub7 to i64, !dbg !89
  %arrayidx8 = getelementptr inbounds double, double* %0, i64 %idxprom, !dbg !89
  %1 = load double, double* %arrayidx8, align 8, !dbg !89
  %call9 = call double @rk4(double (double, double)* @rate, double 1.000000e-01, double %add6, double %1), !dbg !90
  %idxprom10 = sext i32 %i.0 to i64, !dbg !91
  %arrayidx11 = getelementptr inbounds double, double* %0, i64 %idxprom10, !dbg !91
  store double %call9, double* %arrayidx11, align 8, !dbg !92
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !93
  call void @llvm.dbg.value(metadata i32 %inc, metadata !79, metadata !DIExpression()), !dbg !63
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @llvm.dbg.value(metadata i32 0, metadata !79, metadata !DIExpression()), !dbg !63
  br label %for.cond13, !dbg !98

for.cond13:                                       ; preds = %for.inc31, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %add32, %for.inc31 ], !dbg !100
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !79, metadata !DIExpression()), !dbg !63
  %cmp14 = icmp slt i32 %i.1, %conv, !dbg !101
  br i1 %cmp14, label %for.body16, label %for.end33, !dbg !103

for.body16:                                       ; preds = %for.cond13
  %conv17 = sitofp i32 %i.1 to double, !dbg !104
  %mul18 = fmul double 1.000000e-01, %conv17, !dbg !106
  %add19 = fadd double 0.000000e+00, %mul18, !dbg !107
  call void @llvm.dbg.value(metadata double %add19, metadata !108, metadata !DIExpression()), !dbg !63
  %mul20 = fmul double %add19, %add19, !dbg !109
  %div21 = fdiv double %mul20, 4.000000e+00, !dbg !110
  %add22 = fadd double %div21, 1.000000e+00, !dbg !111
  %call23 = call double @pow(double %add22, double 2.000000e+00) #4, !dbg !112
  call void @llvm.dbg.value(metadata double %call23, metadata !113, metadata !DIExpression()), !dbg !63
  %idxprom24 = sext i32 %i.1 to i64, !dbg !114
  %arrayidx25 = getelementptr inbounds double, double* %0, i64 %idxprom24, !dbg !114
  %2 = load double, double* %arrayidx25, align 8, !dbg !114
  %idxprom26 = sext i32 %i.1 to i64, !dbg !115
  %arrayidx27 = getelementptr inbounds double, double* %0, i64 %idxprom26, !dbg !115
  %3 = load double, double* %arrayidx27, align 8, !dbg !115
  %div28 = fdiv double %3, %call23, !dbg !116
  %sub29 = fsub double %div28, 1.000000e+00, !dbg !117
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), double %add19, double %2, double %sub29), !dbg !118
  br label %for.inc31, !dbg !119

for.inc31:                                        ; preds = %for.body16
  %add32 = add nsw i32 %i.1, 10, !dbg !120
  call void @llvm.dbg.value(metadata i32 %add32, metadata !79, metadata !DIExpression()), !dbg !63
  br label %for.cond13, !dbg !121, !llvm.loop !122

for.end33:                                        ; preds = %for.cond13
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "runge-kutta-method.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Runge-Kutta-method")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = distinct !DISubprogram(name: "rk4", scope: !1, file: !1, line: 5, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!5, !13, !5, !5, !5}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DISubroutineType(types: !15)
!15 = !{!5, !5, !5}
!16 = !DILocalVariable(name: "f", arg: 1, scope: !10, file: !1, line: 5, type: !13)
!17 = !DILocation(line: 0, scope: !10)
!18 = !DILocalVariable(name: "dx", arg: 2, scope: !10, file: !1, line: 5, type: !5)
!19 = !DILocalVariable(name: "x", arg: 3, scope: !10, file: !1, line: 5, type: !5)
!20 = !DILocalVariable(name: "y", arg: 4, scope: !10, file: !1, line: 5, type: !5)
!21 = !DILocation(line: 7, column: 19, scope: !10)
!22 = !DILocation(line: 7, column: 17, scope: !10)
!23 = !DILocalVariable(name: "k1", scope: !10, file: !1, line: 7, type: !5)
!24 = !DILocation(line: 8, column: 22, scope: !10)
!25 = !DILocation(line: 8, column: 17, scope: !10)
!26 = !DILocation(line: 8, column: 34, scope: !10)
!27 = !DILocation(line: 8, column: 29, scope: !10)
!28 = !DILocation(line: 8, column: 13, scope: !10)
!29 = !DILocation(line: 8, column: 11, scope: !10)
!30 = !DILocalVariable(name: "k2", scope: !10, file: !1, line: 8, type: !5)
!31 = !DILocation(line: 9, column: 22, scope: !10)
!32 = !DILocation(line: 9, column: 17, scope: !10)
!33 = !DILocation(line: 9, column: 34, scope: !10)
!34 = !DILocation(line: 9, column: 29, scope: !10)
!35 = !DILocation(line: 9, column: 13, scope: !10)
!36 = !DILocation(line: 9, column: 11, scope: !10)
!37 = !DILocalVariable(name: "k3", scope: !10, file: !1, line: 9, type: !5)
!38 = !DILocation(line: 10, column: 17, scope: !10)
!39 = !DILocation(line: 10, column: 25, scope: !10)
!40 = !DILocation(line: 10, column: 13, scope: !10)
!41 = !DILocation(line: 10, column: 11, scope: !10)
!42 = !DILocalVariable(name: "k4", scope: !10, file: !1, line: 10, type: !5)
!43 = !DILocation(line: 11, column: 21, scope: !10)
!44 = !DILocation(line: 11, column: 17, scope: !10)
!45 = !DILocation(line: 11, column: 30, scope: !10)
!46 = !DILocation(line: 11, column: 26, scope: !10)
!47 = !DILocation(line: 11, column: 35, scope: !10)
!48 = !DILocation(line: 11, column: 41, scope: !10)
!49 = !DILocation(line: 11, column: 11, scope: !10)
!50 = !DILocation(line: 11, column: 2, scope: !10)
!51 = distinct !DISubprogram(name: "rate", scope: !1, file: !1, line: 14, type: !14, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "x", arg: 1, scope: !51, file: !1, line: 14, type: !5)
!53 = !DILocation(line: 0, scope: !51)
!54 = !DILocalVariable(name: "y", arg: 2, scope: !51, file: !1, line: 14, type: !5)
!55 = !DILocation(line: 16, column: 13, scope: !51)
!56 = !DILocation(line: 16, column: 11, scope: !51)
!57 = !DILocation(line: 16, column: 2, scope: !51)
!58 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 19, type: !59, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DILocalVariable(name: "x0", scope: !58, file: !1, line: 22, type: !5)
!63 = !DILocation(line: 0, scope: !58)
!64 = !DILocalVariable(name: "x1", scope: !58, file: !1, line: 22, type: !5)
!65 = !DILocalVariable(name: "dx", scope: !58, file: !1, line: 22, type: !5)
!66 = !DILocation(line: 23, column: 21, scope: !58)
!67 = !DILocation(line: 23, column: 26, scope: !58)
!68 = !DILocation(line: 23, column: 15, scope: !58)
!69 = !DILocation(line: 23, column: 13, scope: !58)
!70 = !DILocalVariable(name: "n", scope: !58, file: !1, line: 23, type: !61)
!71 = !DILocation(line: 24, column: 40, scope: !58)
!72 = !DILocation(line: 24, column: 38, scope: !58)
!73 = !DILocation(line: 24, column: 16, scope: !58)
!74 = !DILocation(line: 24, column: 6, scope: !58)
!75 = !DILocalVariable(name: "y", scope: !58, file: !1, line: 21, type: !4)
!76 = !DILocation(line: 26, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !58, file: !1, line: 26, column: 2)
!78 = !DILocation(line: 26, column: 12, scope: !77)
!79 = !DILocalVariable(name: "i", scope: !58, file: !1, line: 23, type: !61)
!80 = !DILocation(line: 0, scope: !77)
!81 = !DILocation(line: 26, column: 26, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 26, column: 2)
!83 = !DILocation(line: 26, column: 2, scope: !77)
!84 = !DILocation(line: 27, column: 37, scope: !82)
!85 = !DILocation(line: 27, column: 34, scope: !82)
!86 = !DILocation(line: 27, column: 32, scope: !82)
!87 = !DILocation(line: 27, column: 27, scope: !82)
!88 = !DILocation(line: 27, column: 46, scope: !82)
!89 = !DILocation(line: 27, column: 43, scope: !82)
!90 = !DILocation(line: 27, column: 10, scope: !82)
!91 = !DILocation(line: 27, column: 3, scope: !82)
!92 = !DILocation(line: 27, column: 8, scope: !82)
!93 = !DILocation(line: 26, column: 32, scope: !82)
!94 = !DILocation(line: 26, column: 2, scope: !82)
!95 = distinct !{!95, !83, !96}
!96 = !DILocation(line: 27, column: 49, scope: !77)
!97 = !DILocation(line: 29, column: 2, scope: !58)
!98 = !DILocation(line: 30, column: 7, scope: !99)
!99 = distinct !DILexicalBlock(scope: !58, file: !1, line: 30, column: 2)
!100 = !DILocation(line: 0, scope: !99)
!101 = !DILocation(line: 30, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 30, column: 2)
!103 = !DILocation(line: 30, column: 2, scope: !99)
!104 = !DILocation(line: 31, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 30, column: 30)
!106 = !DILocation(line: 31, column: 15, scope: !105)
!107 = !DILocation(line: 31, column: 10, scope: !105)
!108 = !DILocalVariable(name: "x", scope: !58, file: !1, line: 21, type: !5)
!109 = !DILocation(line: 32, column: 14, scope: !105)
!110 = !DILocation(line: 32, column: 18, scope: !105)
!111 = !DILocation(line: 32, column: 22, scope: !105)
!112 = !DILocation(line: 32, column: 8, scope: !105)
!113 = !DILocalVariable(name: "y2", scope: !58, file: !1, line: 21, type: !5)
!114 = !DILocation(line: 33, column: 29, scope: !105)
!115 = !DILocation(line: 33, column: 35, scope: !105)
!116 = !DILocation(line: 33, column: 39, scope: !105)
!117 = !DILocation(line: 33, column: 43, scope: !105)
!118 = !DILocation(line: 33, column: 3, scope: !105)
!119 = !DILocation(line: 34, column: 2, scope: !105)
!120 = !DILocation(line: 30, column: 23, scope: !102)
!121 = !DILocation(line: 30, column: 2, scope: !102)
!122 = distinct !{!122, !103, !123}
!123 = !DILocation(line: 34, column: 2, scope: !99)
!124 = !DILocation(line: 36, column: 2, scope: !58)
