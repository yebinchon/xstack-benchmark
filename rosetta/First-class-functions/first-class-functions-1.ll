; ModuleID = 'first-class-functions-1.c'
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
  %v.addr = alloca double, align 8
  store double %v, double* %v.addr, align 8
  call void @llvm.dbg.declare(metadata double* %v.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load double, double* %v.addr, align 8, !dbg !23
  %1 = load double, double* %v.addr, align 8, !dbg !24
  %mul = fmul double %0, %1, !dbg !25
  %2 = load double, double* %v.addr, align 8, !dbg !26
  %mul1 = fmul double %mul, %2, !dbg !27
  ret double %mul1, !dbg !28
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @functionB(double %v) #0 !dbg !29 {
entry:
  %v.addr = alloca double, align 8
  store double %v, double* %v.addr, align 8
  call void @llvm.dbg.declare(metadata double* %v.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load double, double* %v.addr, align 8, !dbg !32
  %call = call double @log(double %0) #4, !dbg !33
  %div = fdiv double %call, 3.000000e+00, !dbg !34
  %call1 = call double @exp(double %div) #4, !dbg !35
  ret double %call1, !dbg !36
}

; Function Attrs: nounwind
declare dso_local double @exp(double) #2

; Function Attrs: nounwind
declare dso_local double @log(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @Function1(double (double)* %f2, double %val) #0 !dbg !37 {
entry:
  %f2.addr = alloca double (double)*, align 8
  %val.addr = alloca double, align 8
  store double (double)* %f2, double (double)** %f2.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %f2.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store double %val, double* %val.addr, align 8
  call void @llvm.dbg.declare(metadata double* %val.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load double (double)*, double (double)** %f2.addr, align 8, !dbg !44
  %1 = load double, double* %val.addr, align 8, !dbg !45
  %call = call double %0(double %1), !dbg !44
  ret double %call, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local double (double)* @WhichFunc(i32 %idx) #0 !dbg !47 {
entry:
  %idx.addr = alloca i32, align 4
  store i32 %idx, i32* %idx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %idx.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %idx.addr, align 4, !dbg !53
  %cmp = icmp slt i32 %0, 4, !dbg !54
  %1 = zext i1 %cmp to i64, !dbg !55
  %cond = select i1 %cmp, double (double)* @functionA, double (double)* @functionB, !dbg !55
  ret double (double)* %cond, !dbg !56
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
define dso_local double @InvokeComposed(double (double)* %f1, double (double)* %f2, double %val) #0 !dbg !57 {
entry:
  %f1.addr = alloca double (double)*, align 8
  %f2.addr = alloca double (double)*, align 8
  %val.addr = alloca double, align 8
  store double (double)* %f1, double (double)** %f1.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %f1.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store double (double)* %f2, double (double)** %f2.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %f2.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store double %val, double* %val.addr, align 8
  call void @llvm.dbg.declare(metadata double* %val.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load double (double)*, double (double)** %f1.addr, align 8, !dbg !66
  %1 = load double (double)*, double (double)** %f2.addr, align 8, !dbg !67
  %2 = load double, double* %val.addr, align 8, !dbg !68
  %call = call double %1(double %2), !dbg !67
  %call1 = call double %0(double %call), !dbg !66
  ret double %call1, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sComposition* @Compose(double (double)* %f1, double (double)* %f2) #0 !dbg !70 {
entry:
  %f1.addr = alloca double (double)*, align 8
  %f2.addr = alloca double (double)*, align 8
  %comp = alloca %struct.sComposition*, align 8
  store double (double)* %f1, double (double)** %f1.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %f1.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store double (double)* %f2, double (double)** %f2.addr, align 8
  call void @llvm.dbg.declare(metadata double (double)** %f2.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %struct.sComposition** %comp, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !85
  %0 = bitcast i8* %call to %struct.sComposition*, !dbg !85
  store %struct.sComposition* %0, %struct.sComposition** %comp, align 8, !dbg !84
  %1 = load double (double)*, double (double)** %f1.addr, align 8, !dbg !86
  %2 = load %struct.sComposition*, %struct.sComposition** %comp, align 8, !dbg !87
  %f11 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %2, i32 0, i32 0, !dbg !88
  store double (double)* %1, double (double)** %f11, align 8, !dbg !89
  %3 = load double (double)*, double (double)** %f2.addr, align 8, !dbg !90
  %4 = load %struct.sComposition*, %struct.sComposition** %comp, align 8, !dbg !91
  %f22 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %4, i32 0, i32 1, !dbg !92
  store double (double)* %3, double (double)** %f22, align 8, !dbg !93
  %5 = load %struct.sComposition*, %struct.sComposition** %comp, align 8, !dbg !94
  ret %struct.sComposition* %5, !dbg !95
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @CallComposed(%struct.sComposition* %comp, double %val) #0 !dbg !96 {
entry:
  %comp.addr = alloca %struct.sComposition*, align 8
  %val.addr = alloca double, align 8
  store %struct.sComposition* %comp, %struct.sComposition** %comp.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sComposition** %comp.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store double %val, double* %val.addr, align 8
  call void @llvm.dbg.declare(metadata double* %val.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load %struct.sComposition*, %struct.sComposition** %comp.addr, align 8, !dbg !103
  %f1 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %0, i32 0, i32 0, !dbg !104
  %1 = load double (double)*, double (double)** %f1, align 8, !dbg !104
  %2 = load %struct.sComposition*, %struct.sComposition** %comp.addr, align 8, !dbg !105
  %f2 = getelementptr inbounds %struct.sComposition, %struct.sComposition* %2, i32 0, i32 1, !dbg !106
  %3 = load double (double)*, double (double)** %f2, align 8, !dbg !106
  %4 = load double, double* %val.addr, align 8, !dbg !107
  %call = call double %3(double %4), !dbg !105
  %call1 = call double %1(double %call), !dbg !103
  ret double %call1, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ix = alloca i32, align 4
  %c = alloca %struct.sComposition*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %ix, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata %struct.sComposition** %c, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call double (double)* @WhichFunc(i32 0), !dbg !123
  %call1 = call double @Function1(double (double)* %call, double 3.000000e+00), !dbg !124
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), double %call1), !dbg !125
  store i32 0, i32* %ix, align 4, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %ix, align 4, !dbg !129
  %cmp = icmp slt i32 %0, 4, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %ix, align 4, !dbg !133
  %idxprom = sext i32 %1 to i64, !dbg !135
  %arrayidx = getelementptr inbounds [4 x double (double)*], [4 x double (double)*]* @funcListA, i64 0, i64 %idxprom, !dbg !135
  %2 = load double (double)*, double (double)** %arrayidx, align 8, !dbg !135
  %3 = load i32, i32* %ix, align 4, !dbg !136
  %idxprom3 = sext i32 %3 to i64, !dbg !137
  %arrayidx4 = getelementptr inbounds [4 x double (double)*], [4 x double (double)*]* @funcListB, i64 0, i64 %idxprom3, !dbg !137
  %4 = load double (double)*, double (double)** %arrayidx4, align 8, !dbg !137
  %call5 = call %struct.sComposition* @Compose(double (double)* %2, double (double)* %4), !dbg !138
  store %struct.sComposition* %call5, %struct.sComposition** %c, align 8, !dbg !139
  %5 = load i32, i32* %ix, align 4, !dbg !140
  %6 = load %struct.sComposition*, %struct.sComposition** %c, align 8, !dbg !141
  %call6 = call double @CallComposed(%struct.sComposition* %6, double 9.000000e-01), !dbg !142
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 %5, double %call6), !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %ix, align 4, !dbg !145
  %inc = add nsw i32 %7, 1, !dbg !145
  store i32 %inc, i32* %ix, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !149
}

declare dso_local i32 @printf(i8*, ...) #3

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
!22 = !DILocation(line: 9, column: 26, scope: !20)
!23 = !DILocation(line: 11, column: 11, scope: !20)
!24 = !DILocation(line: 11, column: 13, scope: !20)
!25 = !DILocation(line: 11, column: 12, scope: !20)
!26 = !DILocation(line: 11, column: 15, scope: !20)
!27 = !DILocation(line: 11, column: 14, scope: !20)
!28 = !DILocation(line: 11, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "functionB", scope: !3, file: !3, line: 13, type: !11, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DILocalVariable(name: "v", arg: 1, scope: !29, file: !3, line: 13, type: !13)
!31 = !DILocation(line: 13, column: 25, scope: !29)
!32 = !DILocation(line: 15, column: 19, scope: !29)
!33 = !DILocation(line: 15, column: 15, scope: !29)
!34 = !DILocation(line: 15, column: 21, scope: !29)
!35 = !DILocation(line: 15, column: 11, scope: !29)
!36 = !DILocation(line: 15, column: 4, scope: !29)
!37 = distinct !DISubprogram(name: "Function1", scope: !3, file: !3, line: 19, type: !38, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!13, !9, !13}
!40 = !DILocalVariable(name: "f2", arg: 1, scope: !37, file: !3, line: 19, type: !9)
!41 = !DILocation(line: 19, column: 30, scope: !37)
!42 = !DILocalVariable(name: "val", arg: 2, scope: !37, file: !3, line: 19, type: !13)
!43 = !DILocation(line: 19, column: 41, scope: !37)
!44 = !DILocation(line: 21, column: 12, scope: !37)
!45 = !DILocation(line: 21, column: 15, scope: !37)
!46 = !DILocation(line: 21, column: 5, scope: !37)
!47 = distinct !DISubprogram(name: "WhichFunc", scope: !3, file: !3, line: 25, type: !48, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!9, !50}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "idx", arg: 1, scope: !47, file: !3, line: 25, type: !50)
!52 = !DILocation(line: 25, column: 27, scope: !47)
!53 = !DILocation(line: 27, column: 12, scope: !47)
!54 = !DILocation(line: 27, column: 16, scope: !47)
!55 = !DILocation(line: 27, column: 11, scope: !47)
!56 = !DILocation(line: 27, column: 4, scope: !47)
!57 = distinct !DISubprogram(name: "InvokeComposed", scope: !3, file: !3, line: 35, type: !58, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!13, !9, !9, !13}
!60 = !DILocalVariable(name: "f1", arg: 1, scope: !57, file: !3, line: 35, type: !9)
!61 = !DILocation(line: 35, column: 35, scope: !57)
!62 = !DILocalVariable(name: "f2", arg: 2, scope: !57, file: !3, line: 35, type: !9)
!63 = !DILocation(line: 35, column: 50, scope: !57)
!64 = !DILocalVariable(name: "val", arg: 3, scope: !57, file: !3, line: 35, type: !13)
!65 = !DILocation(line: 35, column: 61, scope: !57)
!66 = !DILocation(line: 37, column: 11, scope: !57)
!67 = !DILocation(line: 37, column: 14, scope: !57)
!68 = !DILocation(line: 37, column: 17, scope: !57)
!69 = !DILocation(line: 37, column: 4, scope: !57)
!70 = distinct !DISubprogram(name: "Compose", scope: !3, file: !3, line: 45, type: !71, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !9, !9}
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "Composition", file: !3, line: 43, baseType: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sComposition", file: !3, line: 40, size: 128, elements: !76)
!76 = !{!77, !78}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "f1", scope: !75, file: !3, line: 41, baseType: !9, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "f2", scope: !75, file: !3, line: 42, baseType: !9, size: 64, offset: 64)
!79 = !DILocalVariable(name: "f1", arg: 1, scope: !70, file: !3, line: 45, type: !9)
!80 = !DILocation(line: 45, column: 33, scope: !70)
!81 = !DILocalVariable(name: "f2", arg: 2, scope: !70, file: !3, line: 45, type: !9)
!82 = !DILocation(line: 45, column: 48, scope: !70)
!83 = !DILocalVariable(name: "comp", scope: !70, file: !3, line: 47, type: !73)
!84 = !DILocation(line: 47, column: 16, scope: !70)
!85 = !DILocation(line: 47, column: 23, scope: !70)
!86 = !DILocation(line: 48, column: 15, scope: !70)
!87 = !DILocation(line: 48, column: 4, scope: !70)
!88 = !DILocation(line: 48, column: 10, scope: !70)
!89 = !DILocation(line: 48, column: 13, scope: !70)
!90 = !DILocation(line: 49, column: 15, scope: !70)
!91 = !DILocation(line: 49, column: 4, scope: !70)
!92 = !DILocation(line: 49, column: 10, scope: !70)
!93 = !DILocation(line: 49, column: 13, scope: !70)
!94 = !DILocation(line: 50, column: 11, scope: !70)
!95 = !DILocation(line: 50, column: 4, scope: !70)
!96 = distinct !DISubprogram(name: "CallComposed", scope: !3, file: !3, line: 53, type: !97, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{!13, !73, !13}
!99 = !DILocalVariable(name: "comp", arg: 1, scope: !96, file: !3, line: 53, type: !73)
!100 = !DILocation(line: 53, column: 34, scope: !96)
!101 = !DILocalVariable(name: "val", arg: 2, scope: !96, file: !3, line: 53, type: !13)
!102 = !DILocation(line: 53, column: 47, scope: !96)
!103 = !DILocation(line: 55, column: 12, scope: !96)
!104 = !DILocation(line: 55, column: 18, scope: !96)
!105 = !DILocation(line: 55, column: 22, scope: !96)
!106 = !DILocation(line: 55, column: 28, scope: !96)
!107 = !DILocation(line: 55, column: 31, scope: !96)
!108 = !DILocation(line: 55, column: 5, scope: !96)
!109 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 59, type: !110, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DISubroutineType(types: !111)
!111 = !{!50, !50, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !3, line: 59, type: !50)
!116 = !DILocation(line: 59, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !3, line: 59, type: !112)
!118 = !DILocation(line: 59, column: 26, scope: !109)
!119 = !DILocalVariable(name: "ix", scope: !109, file: !3, line: 61, type: !50)
!120 = !DILocation(line: 61, column: 8, scope: !109)
!121 = !DILocalVariable(name: "c", scope: !109, file: !3, line: 62, type: !73)
!122 = !DILocation(line: 62, column: 16, scope: !109)
!123 = !DILocation(line: 64, column: 57, scope: !109)
!124 = !DILocation(line: 64, column: 47, scope: !109)
!125 = !DILocation(line: 64, column: 4, scope: !109)
!126 = !DILocation(line: 66, column: 11, scope: !127)
!127 = distinct !DILexicalBlock(scope: !109, file: !3, line: 66, column: 4)
!128 = !DILocation(line: 66, column: 9, scope: !127)
!129 = !DILocation(line: 66, column: 15, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 66, column: 4)
!131 = !DILocation(line: 66, column: 17, scope: !130)
!132 = !DILocation(line: 66, column: 4, scope: !127)
!133 = !DILocation(line: 67, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !3, line: 66, column: 27)
!135 = !DILocation(line: 67, column: 20, scope: !134)
!136 = !DILocation(line: 67, column: 45, scope: !134)
!137 = !DILocation(line: 67, column: 35, scope: !134)
!138 = !DILocation(line: 67, column: 12, scope: !134)
!139 = !DILocation(line: 67, column: 10, scope: !134)
!140 = !DILocation(line: 68, column: 44, scope: !134)
!141 = !DILocation(line: 68, column: 61, scope: !134)
!142 = !DILocation(line: 68, column: 48, scope: !134)
!143 = !DILocation(line: 68, column: 8, scope: !134)
!144 = !DILocation(line: 69, column: 4, scope: !134)
!145 = !DILocation(line: 66, column: 23, scope: !130)
!146 = !DILocation(line: 66, column: 4, scope: !130)
!147 = distinct !{!147, !132, !148}
!148 = !DILocation(line: 69, column: 4, scope: !127)
!149 = !DILocation(line: 71, column: 4, scope: !109)
