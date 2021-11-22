; ModuleID = 'knapsack-problem-continuous.c'
source_filename = "knapsack-problem-continuous.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.item = type { double, double, i8* }

@.str = private unnamed_addr constant [5 x i8] c"beef\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"pork\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"ham\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"greaves\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"flitch\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"brawn\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"welt\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"salami\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"sausage\00", align 1
@items = dso_local global [9 x %struct.item] [%struct.item { double 3.800000e+00, double 3.600000e+01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0) }, %struct.item { double 5.400000e+00, double 4.300000e+01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0) }, %struct.item { double 3.600000e+00, double 9.000000e+01, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0) }, %struct.item { double 2.400000e+00, double 4.500000e+01, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0) }, %struct.item { double 4.000000e+00, double 3.000000e+01, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0) }, %struct.item { double 2.500000e+00, double 5.600000e+01, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0) }, %struct.item { double 3.700000e+00, double 6.700000e+01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0) }, %struct.item { double 3.000000e+00, double 9.500000e+01, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0) }, %struct.item { double 5.900000e+00, double 9.800000e+01, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0) }], align 16, !dbg !0
@.str.9 = private unnamed_addr constant [13 x i8] c"take all %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"take %gkg of %g kg of %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @item_cmp(i8* %aa, i8* %bb) #0 !dbg !22 {
entry:
  %aa.addr = alloca i8*, align 8
  %bb.addr = alloca i8*, align 8
  %a = alloca %struct.item*, align 8
  %b = alloca %struct.item*, align 8
  %ua = alloca double, align 8
  %ub = alloca double, align 8
  store i8* %aa, i8** %aa.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aa.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* %bb, i8** %bb.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %bb.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct.item** %a, metadata !32, metadata !DIExpression()), !dbg !35
  %0 = load i8*, i8** %aa.addr, align 8, !dbg !36
  %1 = bitcast i8* %0 to %struct.item*, !dbg !36
  store %struct.item* %1, %struct.item** %a, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata %struct.item** %b, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i8*, i8** %bb.addr, align 8, !dbg !39
  %3 = bitcast i8* %2 to %struct.item*, !dbg !39
  store %struct.item* %3, %struct.item** %b, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata double* %ua, metadata !40, metadata !DIExpression()), !dbg !41
  %4 = load %struct.item*, %struct.item** %a, align 8, !dbg !42
  %v = getelementptr inbounds %struct.item, %struct.item* %4, i32 0, i32 1, !dbg !43
  %5 = load double, double* %v, align 8, !dbg !43
  %6 = load %struct.item*, %struct.item** %a, align 8, !dbg !44
  %w = getelementptr inbounds %struct.item, %struct.item* %6, i32 0, i32 0, !dbg !45
  %7 = load double, double* %w, align 8, !dbg !45
  %div = fdiv double %5, %7, !dbg !46
  store double %div, double* %ua, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata double* %ub, metadata !47, metadata !DIExpression()), !dbg !48
  %8 = load %struct.item*, %struct.item** %b, align 8, !dbg !49
  %v1 = getelementptr inbounds %struct.item, %struct.item* %8, i32 0, i32 1, !dbg !50
  %9 = load double, double* %v1, align 8, !dbg !50
  %10 = load %struct.item*, %struct.item** %b, align 8, !dbg !51
  %w2 = getelementptr inbounds %struct.item, %struct.item* %10, i32 0, i32 0, !dbg !52
  %11 = load double, double* %w2, align 8, !dbg !52
  %div3 = fdiv double %9, %11, !dbg !53
  store double %div3, double* %ub, align 8, !dbg !48
  %12 = load double, double* %ua, align 8, !dbg !54
  %13 = load double, double* %ub, align 8, !dbg !55
  %cmp = fcmp olt double %12, %13, !dbg !56
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !54

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !54

cond.false:                                       ; preds = %entry
  %14 = load double, double* %ua, align 8, !dbg !57
  %15 = load double, double* %ub, align 8, !dbg !58
  %cmp4 = fcmp ogt double %14, %15, !dbg !59
  %conv = zext i1 %cmp4 to i32, !dbg !59
  br label %cond.end, !dbg !54

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv, %cond.false ], !dbg !54
  ret i32 %cond, !dbg !60
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %it = alloca %struct.item*, align 8
  %space = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.item** %it, metadata !64, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata double* %space, metadata !67, metadata !DIExpression()), !dbg !68
  store double 1.500000e+01, double* %space, align 8, !dbg !68
  call void @qsort(i8* bitcast ([9 x %struct.item]* @items to i8*), i64 9, i64 24, i32 (i8*, i8*)* @item_cmp), !dbg !69
  store %struct.item* getelementptr inbounds (%struct.item, %struct.item* getelementptr inbounds ([9 x %struct.item], [9 x %struct.item]* @items, i64 0, i64 0), i64 9), %struct.item** %it, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.item*, %struct.item** %it, align 8, !dbg !73
  %incdec.ptr = getelementptr inbounds %struct.item, %struct.item* %0, i32 -1, !dbg !73
  store %struct.item* %incdec.ptr, %struct.item** %it, align 8, !dbg !73
  %sub.ptr.lhs.cast = ptrtoint %struct.item* %0 to i64, !dbg !75
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([9 x %struct.item]* @items to i64), !dbg !75
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 24, !dbg !75
  %tobool = icmp ne i64 %sub.ptr.div, 0, !dbg !75
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !76

land.rhs:                                         ; preds = %for.cond
  %1 = load double, double* %space, align 8, !dbg !77
  %cmp = fcmp ogt double %1, 0.000000e+00, !dbg !78
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %2 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !79
  br i1 %2, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %land.end
  %3 = load double, double* %space, align 8, !dbg !81
  %4 = load %struct.item*, %struct.item** %it, align 8, !dbg !83
  %w = getelementptr inbounds %struct.item, %struct.item* %4, i32 0, i32 0, !dbg !84
  %5 = load double, double* %w, align 8, !dbg !84
  %cmp1 = fcmp oge double %3, %5, !dbg !85
  br i1 %cmp1, label %if.then, label %if.else, !dbg !86, !cf.info !87

if.then:                                          ; preds = %for.body
  %6 = load %struct.item*, %struct.item** %it, align 8, !dbg !88
  %name = getelementptr inbounds %struct.item, %struct.item* %6, i32 0, i32 2, !dbg !89
  %7 = load i8*, i8** %name, align 8, !dbg !89
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i64 0, i64 0), i8* %7), !dbg !90
  br label %if.end, !dbg !90

if.else:                                          ; preds = %for.body
  %8 = load double, double* %space, align 8, !dbg !91
  %9 = load %struct.item*, %struct.item** %it, align 8, !dbg !92
  %w2 = getelementptr inbounds %struct.item, %struct.item* %9, i32 0, i32 0, !dbg !93
  %10 = load double, double* %w2, align 8, !dbg !93
  %11 = load %struct.item*, %struct.item** %it, align 8, !dbg !94
  %name3 = getelementptr inbounds %struct.item, %struct.item* %11, i32 0, i32 2, !dbg !95
  %12 = load i8*, i8** %name3, align 8, !dbg !95
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.10, i64 0, i64 0), double %8, double %10, i8* %12), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %if.end
  %13 = load %struct.item*, %struct.item** %it, align 8, !dbg !97
  %w5 = getelementptr inbounds %struct.item, %struct.item* %13, i32 0, i32 0, !dbg !98
  %14 = load double, double* %w5, align 8, !dbg !98
  %15 = load double, double* %space, align 8, !dbg !99
  %sub = fsub double %15, %14, !dbg !99
  store double %sub, double* %space, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %land.end
  ret i32 0, !dbg !103
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "items", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "knapsack-problem-continuous.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knapsack-problem-Continuous")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1728, elements: !16)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "item", file: !3, line: 4, size: 192, elements: !8)
!8 = !{!9, !11, !12}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !7, file: !3, line: 4, baseType: !10, size: 64)
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !7, file: !3, line: 4, baseType: !10, size: 64, offset: 64)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !7, file: !3, line: 4, baseType: !13, size: 64, offset: 128)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 9)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!22 = distinct !DISubprogram(name: "item_cmp", scope: !3, file: !3, line: 16, type: !23, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !26, !26}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!28 = !DILocalVariable(name: "aa", arg: 1, scope: !22, file: !3, line: 16, type: !26)
!29 = !DILocation(line: 16, column: 26, scope: !22)
!30 = !DILocalVariable(name: "bb", arg: 2, scope: !22, file: !3, line: 16, type: !26)
!31 = !DILocation(line: 16, column: 42, scope: !22)
!32 = !DILocalVariable(name: "a", scope: !22, file: !3, line: 18, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!35 = !DILocation(line: 18, column: 21, scope: !22)
!36 = !DILocation(line: 18, column: 25, scope: !22)
!37 = !DILocalVariable(name: "b", scope: !22, file: !3, line: 18, type: !33)
!38 = !DILocation(line: 18, column: 30, scope: !22)
!39 = !DILocation(line: 18, column: 34, scope: !22)
!40 = !DILocalVariable(name: "ua", scope: !22, file: !3, line: 19, type: !10)
!41 = !DILocation(line: 19, column: 9, scope: !22)
!42 = !DILocation(line: 19, column: 14, scope: !22)
!43 = !DILocation(line: 19, column: 17, scope: !22)
!44 = !DILocation(line: 19, column: 21, scope: !22)
!45 = !DILocation(line: 19, column: 24, scope: !22)
!46 = !DILocation(line: 19, column: 19, scope: !22)
!47 = !DILocalVariable(name: "ub", scope: !22, file: !3, line: 19, type: !10)
!48 = !DILocation(line: 19, column: 27, scope: !22)
!49 = !DILocation(line: 19, column: 32, scope: !22)
!50 = !DILocation(line: 19, column: 35, scope: !22)
!51 = !DILocation(line: 19, column: 39, scope: !22)
!52 = !DILocation(line: 19, column: 42, scope: !22)
!53 = !DILocation(line: 19, column: 37, scope: !22)
!54 = !DILocation(line: 20, column: 9, scope: !22)
!55 = !DILocation(line: 20, column: 14, scope: !22)
!56 = !DILocation(line: 20, column: 12, scope: !22)
!57 = !DILocation(line: 20, column: 24, scope: !22)
!58 = !DILocation(line: 20, column: 29, scope: !22)
!59 = !DILocation(line: 20, column: 27, scope: !22)
!60 = !DILocation(line: 20, column: 2, scope: !22)
!61 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 23, type: !62, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!25}
!64 = !DILocalVariable(name: "it", scope: !61, file: !3, line: 25, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!66 = !DILocation(line: 25, column: 15, scope: !61)
!67 = !DILocalVariable(name: "space", scope: !61, file: !3, line: 26, type: !10)
!68 = !DILocation(line: 26, column: 9, scope: !61)
!69 = !DILocation(line: 28, column: 2, scope: !61)
!70 = !DILocation(line: 29, column: 10, scope: !71)
!71 = distinct !DILexicalBlock(scope: !61, file: !3, line: 29, column: 2)
!72 = !DILocation(line: 29, column: 7, scope: !71)
!73 = !DILocation(line: 29, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !3, line: 29, column: 2)
!75 = !DILocation(line: 29, column: 27, scope: !74)
!76 = !DILocation(line: 29, column: 34, scope: !74)
!77 = !DILocation(line: 29, column: 37, scope: !74)
!78 = !DILocation(line: 29, column: 43, scope: !74)
!79 = !DILocation(line: 0, scope: !74)
!80 = !DILocation(line: 29, column: 2, scope: !71)
!81 = !DILocation(line: 30, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !3, line: 30, column: 7)
!83 = !DILocation(line: 30, column: 16, scope: !82)
!84 = !DILocation(line: 30, column: 20, scope: !82)
!85 = !DILocation(line: 30, column: 13, scope: !82)
!86 = !DILocation(line: 30, column: 7, scope: !74)
!87 = !{!"if"}
!88 = !DILocation(line: 31, column: 28, scope: !82)
!89 = !DILocation(line: 31, column: 32, scope: !82)
!90 = !DILocation(line: 31, column: 4, scope: !82)
!91 = !DILocation(line: 34, column: 5, scope: !82)
!92 = !DILocation(line: 34, column: 12, scope: !82)
!93 = !DILocation(line: 34, column: 16, scope: !82)
!94 = !DILocation(line: 34, column: 19, scope: !82)
!95 = !DILocation(line: 34, column: 23, scope: !82)
!96 = !DILocation(line: 33, column: 4, scope: !82)
!97 = !DILocation(line: 29, column: 57, scope: !74)
!98 = !DILocation(line: 29, column: 61, scope: !74)
!99 = !DILocation(line: 29, column: 54, scope: !74)
!100 = !DILocation(line: 29, column: 2, scope: !74)
!101 = distinct !{!101, !80, !102}
!102 = !DILocation(line: 34, column: 27, scope: !71)
!103 = !DILocation(line: 36, column: 2, scope: !61)
