; ModuleID = 'first-class-functions-1.ll'
source_filename = "first-class-functions-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sComposition = type { double (double)*, double (double)* }

@funcListA = dso_local global [4 x double (double)*] [double (double)* @functionA, double (double)* @sin, double (double)* @cos, double (double)* @tan], align 16, !dbg !0
@funcListB = dso_local global [4 x double (double)*] [double (double)* @functionB, double (double)* @asin, double (double)* @acos, double (double)* @atan], align 16, !dbg !6
@.str = private unnamed_addr constant [32 x i8] c"Function1(functionA, 3.0) = %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Compostion %d(0.9) = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @functionA(double %v) #0 !dbg !20 {
entry:
  call void @llvm.dbg.value(metadata double %v, metadata !21, metadata !DIExpression()), !dbg !22
  %mul = fmul double %v, %v, !dbg !23
  %mul1 = fmul double %mul, %v, !dbg !24
  ret double %mul1, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @functionB(double %v) #0 !dbg !26 {
entry:
  call void @llvm.dbg.value(metadata double %v, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call double @log(double %v) #4, !dbg !29
  %div = fdiv double %call, 3.000000e+00, !dbg !30
  %call1 = call double @exp(double %div) #4, !dbg !31
  ret double %call1, !dbg !32
}

; Function Attrs: nounwind
declare dso_local double @exp(double) #2

; Function Attrs: nounwind
declare dso_local double @log(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @Function1(double (double)* %f2, double %val) #0 !dbg !33 {
entry:
  call void @llvm.dbg.value(metadata double (double)* %f2, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata double %val, metadata !38, metadata !DIExpression()), !dbg !37
  %call = call double %f2(double %val), !dbg !39
  ret double %call, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local double (double)* @WhichFunc(i32 %idx) #0 !dbg !41 {
entry:
  call void @llvm.dbg.value(metadata i32 %idx, metadata !45, metadata !DIExpression()), !dbg !46
  %cmp = icmp slt i32 %idx, 4, !dbg !47
  %0 = zext i1 %cmp to i64, !dbg !48
  %cond = select i1 %cmp, double (double)* @functionA, double (double)* @functionB, !dbg !48
  ret double (double)* %cond, !dbg !49
}

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @tan(double) #2

; Function Attrs: nounwind
declare dso_local double @asin(double) #2

; Function Attrs: nounwind
declare dso_local double @acos(double) #2

; Function Attrs: nounwind
declare dso_local double @atan(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @InvokeComposed(double (double)* %f1, double (double)* %f2, double %val) #0 !dbg !50 {
entry:
  call void @llvm.dbg.value(metadata double (double)* %f1, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata double (double)* %f2, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata double %val, metadata !56, metadata !DIExpression()), !dbg !54
  %call = call double %f2(double %val), !dbg !57
  %call1 = call double %f1(double %call), !dbg !58
  ret double %call1, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sComposition* @Compose(double (double)* %f1, double (double)* %f2) #0 !dbg !60 {
entry:
  call void @llvm.dbg.value(metadata double (double)* %f1, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata double (double)* %f2, metadata !71, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !72
  %0 = bitcast i8* %call to %struct.sComposition*, !dbg !72
  call void @llvm.dbg.value(metadata %struct.sComposition* %0, metadata !73, metadata !DIExpression()), !dbg !70
  %f11 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %0, i32 0, i32 0, !dbg !74
  store double (double)* %f1, double (double)** %f11, align 8, !dbg !75
  %f22 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %0, i32 0, i32 1, !dbg !76
  store double (double)* %f2, double (double)** %f22, align 8, !dbg !77
  ret %struct.sComposition* %0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @CallComposed(%struct.sComposition* %comp, double %val) #0 !dbg !79 {
entry:
  call void @llvm.dbg.value(metadata %struct.sComposition* %comp, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.value(metadata double %val, metadata !84, metadata !DIExpression()), !dbg !83
  %f1 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %comp, i32 0, i32 0, !dbg !85
  %0 = load double (double)*, double (double)** %f1, align 8, !dbg !85
  %f2 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %comp, i32 0, i32 1, !dbg !86
  %1 = load double (double)*, double (double)** %f2, align 8, !dbg !86
  %call = call double %1(double %val), !dbg !87
  %call1 = call double %0(double %call), !dbg !88
  ret double %call1, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.value(metadata i8** %argv, metadata !98, metadata !DIExpression()), !dbg !97
  %call = call double (double)* @WhichFunc(i32 0), !dbg !99
  %call1 = call double @Function1(double (double)* %call, double 3.000000e+00), !dbg !100
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), double %call1), !dbg !101
  call void @llvm.dbg.value(metadata i32 0, metadata !102, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %ix.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !105
  call void @llvm.dbg.value(metadata i32 %ix.0, metadata !102, metadata !DIExpression()), !dbg !97
  %cmp = icmp slt i32 %ix.0, 4, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %ix.0 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [4 x double (double)*], [4 x double (double)*]* @funcListA, i64 0, i64 %idxprom, !dbg !109
  %0 = load double (double)*, double (double)** %arrayidx, align 8, !dbg !109
  %idxprom3 = sext i32 %ix.0 to i64, !dbg !111
  %arrayidx4 = getelementptr inbounds [4 x double (double)*], [4 x double (double)*]* @funcListB, i64 0, i64 %idxprom3, !dbg !111
  %1 = load double (double)*, double (double)** %arrayidx4, align 8, !dbg !111
  %call5 = call %struct.sComposition* @Compose(double (double)* %0, double (double)* %1), !dbg !112
  call void @llvm.dbg.value(metadata %struct.sComposition* %call5, metadata !113, metadata !DIExpression()), !dbg !97
  %call6 = call double @CallComposed(%struct.sComposition* %call5, double 9.000000e-01), !dbg !114
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 %ix.0, double %call6), !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %ix.0, 1, !dbg !117
  call void @llvm.dbg.value(metadata i32 %inc, metadata !102, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !121
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "funcListA", scope: !2, file: !3, line: 31, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "first-class-functions-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/First-class-functions")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "funcListB", scope: !2, file: !3, line: 32, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 256, elements: !14)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "Class2Func", file: !3, line: 6, baseType: !10)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !{!15}
!15 = !DISubrange(count: 4)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!20 = distinct !DISubprogram(name: "functionA", scope: !3, file: !3, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DILocalVariable(name: "v", arg: 1, scope: !20, file: !3, line: 9, type: !13)
!22 = !DILocation(line: 0, scope: !20)
!23 = !DILocation(line: 11, column: 12, scope: !20)
!24 = !DILocation(line: 11, column: 14, scope: !20)
!25 = !DILocation(line: 11, column: 4, scope: !20)
!26 = distinct !DISubprogram(name: "functionB", scope: !3, file: !3, line: 13, type: !11, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DILocalVariable(name: "v", arg: 1, scope: !26, file: !3, line: 13, type: !13)
!28 = !DILocation(line: 0, scope: !26)
!29 = !DILocation(line: 15, column: 15, scope: !26)
!30 = !DILocation(line: 15, column: 21, scope: !26)
!31 = !DILocation(line: 15, column: 11, scope: !26)
!32 = !DILocation(line: 15, column: 4, scope: !26)
!33 = distinct !DISubprogram(name: "Function1", scope: !3, file: !3, line: 19, type: !34, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{!13, !9, !13}
!36 = !DILocalVariable(name: "f2", arg: 1, scope: !33, file: !3, line: 19, type: !9)
!37 = !DILocation(line: 0, scope: !33)
!38 = !DILocalVariable(name: "val", arg: 2, scope: !33, file: !3, line: 19, type: !13)
!39 = !DILocation(line: 21, column: 12, scope: !33)
!40 = !DILocation(line: 21, column: 5, scope: !33)
!41 = distinct !DISubprogram(name: "WhichFunc", scope: !3, file: !3, line: 25, type: !42, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!9, !44}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DILocalVariable(name: "idx", arg: 1, scope: !41, file: !3, line: 25, type: !44)
!46 = !DILocation(line: 0, scope: !41)
!47 = !DILocation(line: 27, column: 16, scope: !41)
!48 = !DILocation(line: 27, column: 11, scope: !41)
!49 = !DILocation(line: 27, column: 4, scope: !41)
!50 = distinct !DISubprogram(name: "InvokeComposed", scope: !3, file: !3, line: 35, type: !51, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!13, !9, !9, !13}
!53 = !DILocalVariable(name: "f1", arg: 1, scope: !50, file: !3, line: 35, type: !9)
!54 = !DILocation(line: 0, scope: !50)
!55 = !DILocalVariable(name: "f2", arg: 2, scope: !50, file: !3, line: 35, type: !9)
!56 = !DILocalVariable(name: "val", arg: 3, scope: !50, file: !3, line: 35, type: !13)
!57 = !DILocation(line: 37, column: 14, scope: !50)
!58 = !DILocation(line: 37, column: 11, scope: !50)
!59 = !DILocation(line: 37, column: 4, scope: !50)
!60 = distinct !DISubprogram(name: "Compose", scope: !3, file: !3, line: 45, type: !61, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !9, !9}
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "Composition", file: !3, line: 43, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sComposition", file: !3, line: 40, size: 128, elements: !66)
!66 = !{!67, !68}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "f1", scope: !65, file: !3, line: 41, baseType: !9, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "f2", scope: !65, file: !3, line: 42, baseType: !9, size: 64, offset: 64)
!69 = !DILocalVariable(name: "f1", arg: 1, scope: !60, file: !3, line: 45, type: !9)
!70 = !DILocation(line: 0, scope: !60)
!71 = !DILocalVariable(name: "f2", arg: 2, scope: !60, file: !3, line: 45, type: !9)
!72 = !DILocation(line: 47, column: 23, scope: !60)
!73 = !DILocalVariable(name: "comp", scope: !60, file: !3, line: 47, type: !63)
!74 = !DILocation(line: 48, column: 10, scope: !60)
!75 = !DILocation(line: 48, column: 13, scope: !60)
!76 = !DILocation(line: 49, column: 10, scope: !60)
!77 = !DILocation(line: 49, column: 13, scope: !60)
!78 = !DILocation(line: 50, column: 4, scope: !60)
!79 = distinct !DISubprogram(name: "CallComposed", scope: !3, file: !3, line: 53, type: !80, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!13, !63, !13}
!82 = !DILocalVariable(name: "comp", arg: 1, scope: !79, file: !3, line: 53, type: !63)
!83 = !DILocation(line: 0, scope: !79)
!84 = !DILocalVariable(name: "val", arg: 2, scope: !79, file: !3, line: 53, type: !13)
!85 = !DILocation(line: 55, column: 18, scope: !79)
!86 = !DILocation(line: 55, column: 28, scope: !79)
!87 = !DILocation(line: 55, column: 22, scope: !79)
!88 = !DILocation(line: 55, column: 12, scope: !79)
!89 = !DILocation(line: 55, column: 5, scope: !79)
!90 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 59, type: !91, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!44, !44, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !3, line: 59, type: !44)
!97 = !DILocation(line: 0, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !3, line: 59, type: !93)
!99 = !DILocation(line: 64, column: 57, scope: !90)
!100 = !DILocation(line: 64, column: 47, scope: !90)
!101 = !DILocation(line: 64, column: 4, scope: !90)
!102 = !DILocalVariable(name: "ix", scope: !90, file: !3, line: 61, type: !44)
!103 = !DILocation(line: 66, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !90, file: !3, line: 66, column: 4)
!105 = !DILocation(line: 0, scope: !104)
!106 = !DILocation(line: 66, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 66, column: 4)
!108 = !DILocation(line: 66, column: 4, scope: !104)
!109 = !DILocation(line: 67, column: 20, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 66, column: 27)
!111 = !DILocation(line: 67, column: 35, scope: !110)
!112 = !DILocation(line: 67, column: 12, scope: !110)
!113 = !DILocalVariable(name: "c", scope: !90, file: !3, line: 62, type: !63)
!114 = !DILocation(line: 68, column: 48, scope: !110)
!115 = !DILocation(line: 68, column: 8, scope: !110)
!116 = !DILocation(line: 69, column: 4, scope: !110)
!117 = !DILocation(line: 66, column: 23, scope: !107)
!118 = !DILocation(line: 66, column: 4, scope: !107)
!119 = distinct !{!119, !108, !120}
!120 = !DILocation(line: 69, column: 4, scope: !104)
!121 = !DILocation(line: 71, column: 4, scope: !90)
