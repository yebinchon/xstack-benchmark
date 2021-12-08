; ModuleID = 'continued-fraction.ll'
source_filename = "continued-fraction.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%12.10g\0A%12.10g\0A%12.10g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @calc(double (i32)* %f_a, double (i32)* %f_b, i32 %expansions) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata double (i32)* %f_a, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double (i32)* %f_b, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %expansions, metadata !19, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !20, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !21, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !22, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %expansions, metadata !23, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %r.0 = phi double [ 0.000000e+00, %entry ], [ %div, %for.inc ], !dbg !17
  %i.0 = phi i32 [ %expansions, %entry ], [ %dec, %for.inc ], !dbg !26
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !23, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata double %r.0, metadata !20, metadata !DIExpression()), !dbg !17
  %cmp = icmp ugt i32 %i.0, 0, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %call = call double %f_a(i32 %i.0), !dbg !30
  call void @llvm.dbg.value(metadata double %call, metadata !22, metadata !DIExpression()), !dbg !17
  %call1 = call double %f_b(i32 %i.0), !dbg !32
  call void @llvm.dbg.value(metadata double %call1, metadata !21, metadata !DIExpression()), !dbg !17
  %add = fadd double %call, %r.0, !dbg !33
  %div = fdiv double %call1, %add, !dbg !34
  call void @llvm.dbg.value(metadata double %div, metadata !20, metadata !DIExpression()), !dbg !17
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %dec = add i32 %i.0, -1, !dbg !36
  call void @llvm.dbg.value(metadata i32 %dec, metadata !23, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %call2 = call double %f_a(i32 0), !dbg !40
  call void @llvm.dbg.value(metadata double %call2, metadata !22, metadata !DIExpression()), !dbg !17
  %add3 = fadd double %call2, %r.0, !dbg !41
  ret double %add3, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @sqrt2_a(i32 %n) #0 !dbg !43 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !44, metadata !DIExpression()), !dbg !45
  %tobool = icmp ne i32 %n, 0, !dbg !46
  %0 = zext i1 %tobool to i64, !dbg !46
  %cond = select i1 %tobool, double 2.000000e+00, double 1.000000e+00, !dbg !46
  ret double %cond, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sqrt2_b(i32 %n) #0 !dbg !48 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !49, metadata !DIExpression()), !dbg !50
  ret double 1.000000e+00, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @napier_a(i32 %n) #0 !dbg !52 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !53, metadata !DIExpression()), !dbg !54
  %tobool = icmp ne i32 %n, 0, !dbg !55
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !55

cond.true:                                        ; preds = %entry
  %conv = uitofp i32 %n to double, !dbg !56
  br label %cond.end, !dbg !55

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !55

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %conv, %cond.true ], [ 2.000000e+00, %cond.false ], !dbg !55
  ret double %cond, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @napier_b(i32 %n) #0 !dbg !58 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !59, metadata !DIExpression()), !dbg !60
  %conv = uitofp i32 %n to double, !dbg !61
  %cmp = fcmp ogt double %conv, 1.000000e+00, !dbg !62
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !61

cond.true:                                        ; preds = %entry
  %conv2 = uitofp i32 %n to double, !dbg !63
  %sub = fsub double %conv2, 1.000000e+00, !dbg !64
  br label %cond.end, !dbg !61

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !61

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %sub, %cond.true ], [ 1.000000e+00, %cond.false ], !dbg !61
  ret double %cond, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @pi_a(i32 %n) #0 !dbg !66 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !67, metadata !DIExpression()), !dbg !68
  %tobool = icmp ne i32 %n, 0, !dbg !69
  %0 = zext i1 %tobool to i64, !dbg !69
  %cond = select i1 %tobool, double 6.000000e+00, double 3.000000e+00, !dbg !69
  ret double %cond, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @pi_b(i32 %n) #0 !dbg !71 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !72, metadata !DIExpression()), !dbg !73
  %conv = uitofp i32 %n to double, !dbg !74
  %mul = fmul double 2.000000e+00, %conv, !dbg !75
  %sub = fsub double %mul, 1.000000e+00, !dbg !76
  call void @llvm.dbg.value(metadata double %sub, metadata !77, metadata !DIExpression()), !dbg !73
  %mul1 = fmul double %sub, %sub, !dbg !78
  ret double %mul1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !80 {
entry:
  %call = call double @calc(double (i32)* @sqrt2_a, double (i32)* @sqrt2_b, i32 1000), !dbg !84
  call void @llvm.dbg.value(metadata double %call, metadata !85, metadata !DIExpression()), !dbg !86
  %call1 = call double @calc(double (i32)* @napier_a, double (i32)* @napier_b, i32 1000), !dbg !87
  call void @llvm.dbg.value(metadata double %call1, metadata !88, metadata !DIExpression()), !dbg !86
  %call2 = call double @calc(double (i32)* @pi_a, double (i32)* @pi_b, i32 1000), !dbg !89
  call void @llvm.dbg.value(metadata double %call2, metadata !90, metadata !DIExpression()), !dbg !86
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), double %call, double %call1, double %call2), !dbg !91
  ret i32 0, !dbg !92
}

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
!17 = !DILocation(line: 0, scope: !7)
!18 = !DILocalVariable(name: "f_b", arg: 2, scope: !7, file: !1, line: 9, type: !11)
!19 = !DILocalVariable(name: "expansions", arg: 3, scope: !7, file: !1, line: 9, type: !15)
!20 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 11, type: !10)
!21 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 11, type: !10)
!22 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 11, type: !10)
!23 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !15)
!24 = !DILocation(line: 15, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 2)
!26 = !DILocation(line: 0, scope: !25)
!27 = !DILocation(line: 15, column: 25, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 15, column: 2)
!29 = !DILocation(line: 15, column: 2, scope: !25)
!30 = !DILocation(line: 16, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !1, line: 15, column: 35)
!32 = !DILocation(line: 17, column: 7, scope: !31)
!33 = !DILocation(line: 18, column: 14, scope: !31)
!34 = !DILocation(line: 18, column: 9, scope: !31)
!35 = !DILocation(line: 19, column: 2, scope: !31)
!36 = !DILocation(line: 15, column: 31, scope: !28)
!37 = !DILocation(line: 15, column: 2, scope: !28)
!38 = distinct !{!38, !29, !39}
!39 = !DILocation(line: 19, column: 2, scope: !25)
!40 = !DILocation(line: 20, column: 6, scope: !7)
!41 = !DILocation(line: 22, column: 11, scope: !7)
!42 = !DILocation(line: 22, column: 2, scope: !7)
!43 = distinct !DISubprogram(name: "sqrt2_a", scope: !1, file: !1, line: 26, type: !13, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "n", arg: 1, scope: !43, file: !1, line: 26, type: !15)
!45 = !DILocation(line: 0, scope: !43)
!46 = !DILocation(line: 28, column: 9, scope: !43)
!47 = !DILocation(line: 28, column: 2, scope: !43)
!48 = distinct !DISubprogram(name: "sqrt2_b", scope: !1, file: !1, line: 31, type: !13, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "n", arg: 1, scope: !48, file: !1, line: 31, type: !15)
!50 = !DILocation(line: 0, scope: !48)
!51 = !DILocation(line: 33, column: 2, scope: !48)
!52 = distinct !DISubprogram(name: "napier_a", scope: !1, file: !1, line: 37, type: !13, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "n", arg: 1, scope: !52, file: !1, line: 37, type: !15)
!54 = !DILocation(line: 0, scope: !52)
!55 = !DILocation(line: 39, column: 9, scope: !52)
!56 = !DILocation(line: 39, column: 13, scope: !52)
!57 = !DILocation(line: 39, column: 2, scope: !52)
!58 = distinct !DISubprogram(name: "napier_b", scope: !1, file: !1, line: 42, type: !13, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "n", arg: 1, scope: !58, file: !1, line: 42, type: !15)
!60 = !DILocation(line: 0, scope: !58)
!61 = !DILocation(line: 44, column: 9, scope: !58)
!62 = !DILocation(line: 44, column: 11, scope: !58)
!63 = !DILocation(line: 44, column: 19, scope: !58)
!64 = !DILocation(line: 44, column: 21, scope: !58)
!65 = !DILocation(line: 44, column: 2, scope: !58)
!66 = distinct !DISubprogram(name: "pi_a", scope: !1, file: !1, line: 48, type: !13, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "n", arg: 1, scope: !66, file: !1, line: 48, type: !15)
!68 = !DILocation(line: 0, scope: !66)
!69 = !DILocation(line: 50, column: 9, scope: !66)
!70 = !DILocation(line: 50, column: 2, scope: !66)
!71 = distinct !DISubprogram(name: "pi_b", scope: !1, file: !1, line: 53, type: !13, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "n", arg: 1, scope: !71, file: !1, line: 53, type: !15)
!73 = !DILocation(line: 0, scope: !71)
!74 = !DILocation(line: 55, column: 19, scope: !71)
!75 = !DILocation(line: 55, column: 17, scope: !71)
!76 = !DILocation(line: 55, column: 21, scope: !71)
!77 = !DILocalVariable(name: "c", scope: !71, file: !1, line: 55, type: !10)
!78 = !DILocation(line: 57, column: 11, scope: !71)
!79 = !DILocation(line: 57, column: 2, scope: !71)
!80 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 60, type: !81, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DILocation(line: 64, column: 11, scope: !80)
!85 = !DILocalVariable(name: "sqrt2", scope: !80, file: !1, line: 62, type: !10)
!86 = !DILocation(line: 0, scope: !80)
!87 = !DILocation(line: 65, column: 11, scope: !80)
!88 = !DILocalVariable(name: "napier", scope: !80, file: !1, line: 62, type: !10)
!89 = !DILocation(line: 66, column: 11, scope: !80)
!90 = !DILocalVariable(name: "pi", scope: !80, file: !1, line: 62, type: !10)
!91 = !DILocation(line: 68, column: 2, scope: !80)
!92 = !DILocation(line: 70, column: 2, scope: !80)
