; ModuleID = 'continued-fraction-arithmetic-construct-from-rational-number.ll'
source_filename = "continued-fraction-arithmetic-construct-from-rational-number.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fraction = type { i32, i32 }

@examples = dso_local global [6 x %struct.fraction] [%struct.fraction { i32 1, i32 2 }, %struct.fraction { i32 3, i32 1 }, %struct.fraction { i32 23, i32 8 }, %struct.fraction { i32 13, i32 11 }, %struct.fraction { i32 22, i32 7 }, %struct.fraction { i32 -151, i32 77 }], align 16, !dbg !0
@sqrt2 = dso_local global [4 x %struct.fraction] [%struct.fraction { i32 14142, i32 10000 }, %struct.fraction { i32 141421, i32 100000 }, %struct.fraction { i32 1414214, i32 1000000 }, %struct.fraction { i32 14142136, i32 10000000 }], align 16, !dbg !6
@pi = dso_local global [8 x %struct.fraction] [%struct.fraction { i32 31, i32 10 }, %struct.fraction { i32 314, i32 100 }, %struct.fraction { i32 3142, i32 1000 }, %struct.fraction { i32 31428, i32 10000 }, %struct.fraction { i32 314285, i32 100000 }, %struct.fraction { i32 3142857, i32 1000000 }, %struct.fraction { i32 31428571, i32 10000000 }, %struct.fraction { i32 314285714, i32 100000000 }], align 16, !dbg !17
@.str = private unnamed_addr constant [23 x i8] c"Running the examples :\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"\0AFor N = %d, D = %d :\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c" %d \00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"\0A\0ARunning for %c2 :\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"\0A\0ARunning for %c :\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @r2cf(i32* %numerator, i32* %denominator) #0 !dbg !29 {
entry:
  call void @llvm.dbg.value(metadata i32* %numerator, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32* %denominator, metadata !35, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32 0, metadata !36, metadata !DIExpression()), !dbg !34
  %cmp = icmp ne i32* %denominator, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %0 = load i32, i32* %numerator, align 4, !dbg !40
  %1 = load i32, i32* %denominator, align 4, !dbg !42
  %div = sdiv i32 %0, %1, !dbg !43
  call void @llvm.dbg.value(metadata i32 %div, metadata !36, metadata !DIExpression()), !dbg !34
  %2 = load i32, i32* %numerator, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i32 %2, metadata !45, metadata !DIExpression()), !dbg !34
  %3 = load i32, i32* %denominator, align 4, !dbg !46
  store i32 %3, i32* %numerator, align 4, !dbg !47
  %4 = load i32, i32* %denominator, align 4, !dbg !48
  %rem = srem i32 %2, %4, !dbg !49
  store i32 %rem, i32* %denominator, align 4, !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  %quotient.0 = phi i32 [ %div, %if.then ], [ 0, %entry ], !dbg !34
  call void @llvm.dbg.value(metadata i32 %quotient.0, metadata !36, metadata !DIExpression()), !dbg !34
  ret i32 %quotient.0, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !53 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @llvm.dbg.value(metadata i32 0, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !57, metadata !DIExpression()), !dbg !58
  %conv = sext i32 %i.0 to i64, !dbg !62
  %cmp = icmp ult i64 %conv, 6, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom, !dbg !66
  %num = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx, i32 0, i32 0, !dbg !68
  %0 = load i32, i32* %num, align 8, !dbg !68
  %idxprom2 = sext i32 %i.0 to i64, !dbg !69
  %arrayidx3 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom2, !dbg !69
  %den = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx3, i32 0, i32 1, !dbg !70
  %1 = load i32, i32* %den, align 4, !dbg !70
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %0, i32 %1), !dbg !71
  br label %while.cond, !dbg !72

while.cond:                                       ; preds = %while.body, %for.body
  %idxprom5 = sext i32 %i.0 to i64, !dbg !73
  %arrayidx6 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom5, !dbg !73
  %den7 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx6, i32 0, i32 1, !dbg !74
  %2 = load i32, i32* %den7, align 4, !dbg !74
  %cmp8 = icmp ne i32 %2, 0, !dbg !75
  br i1 %cmp8, label %while.body, label %while.end, !dbg !72

while.body:                                       ; preds = %while.cond
  %idxprom10 = sext i32 %i.0 to i64, !dbg !76
  %arrayidx11 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom10, !dbg !76
  %num12 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx11, i32 0, i32 0, !dbg !78
  %idxprom13 = sext i32 %i.0 to i64, !dbg !79
  %arrayidx14 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom13, !dbg !79
  %den15 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx14, i32 0, i32 1, !dbg !80
  %call16 = call i32 @r2cf(i32* %num12, i32* %den15), !dbg !81
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call16), !dbg !82
  br label %while.cond, !dbg !72, !llvm.loop !83

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %while.end
  %inc = add nsw i32 %i.0, 1, !dbg !86
  call void @llvm.dbg.value(metadata i32 %inc, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 251), !dbg !90
  call void @llvm.dbg.value(metadata i32 0, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond19, !dbg !91

for.cond19:                                       ; preds = %for.inc47, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc48, %for.inc47 ], !dbg !93
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !57, metadata !DIExpression()), !dbg !58
  %conv20 = sext i32 %i.1 to i64, !dbg !94
  %cmp21 = icmp ult i64 %conv20, 4, !dbg !96
  br i1 %cmp21, label %for.body23, label %for.end49, !dbg !97

for.body23:                                       ; preds = %for.cond19
  %idxprom24 = sext i32 %i.1 to i64, !dbg !98
  %arrayidx25 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom24, !dbg !98
  %num26 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx25, i32 0, i32 0, !dbg !100
  %3 = load i32, i32* %num26, align 8, !dbg !100
  %idxprom27 = sext i32 %i.1 to i64, !dbg !101
  %arrayidx28 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom27, !dbg !101
  %den29 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx28, i32 0, i32 1, !dbg !102
  %4 = load i32, i32* %den29, align 4, !dbg !102
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %3, i32 %4), !dbg !103
  br label %while.cond31, !dbg !104

while.cond31:                                     ; preds = %while.body37, %for.body23
  %idxprom32 = sext i32 %i.1 to i64, !dbg !105
  %arrayidx33 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom32, !dbg !105
  %den34 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx33, i32 0, i32 1, !dbg !106
  %5 = load i32, i32* %den34, align 4, !dbg !106
  %cmp35 = icmp ne i32 %5, 0, !dbg !107
  br i1 %cmp35, label %while.body37, label %while.end46, !dbg !104

while.body37:                                     ; preds = %while.cond31
  %idxprom38 = sext i32 %i.1 to i64, !dbg !108
  %arrayidx39 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom38, !dbg !108
  %num40 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx39, i32 0, i32 0, !dbg !110
  %idxprom41 = sext i32 %i.1 to i64, !dbg !111
  %arrayidx42 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom41, !dbg !111
  %den43 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx42, i32 0, i32 1, !dbg !112
  %call44 = call i32 @r2cf(i32* %num40, i32* %den43), !dbg !113
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call44), !dbg !114
  br label %while.cond31, !dbg !104, !llvm.loop !115

while.end46:                                      ; preds = %while.cond31
  br label %for.inc47, !dbg !117

for.inc47:                                        ; preds = %while.end46
  %inc48 = add nsw i32 %i.1, 1, !dbg !118
  call void @llvm.dbg.value(metadata i32 %inc48, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond19, !dbg !119, !llvm.loop !120

for.end49:                                        ; preds = %for.cond19
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 227), !dbg !122
  call void @llvm.dbg.value(metadata i32 0, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond51, !dbg !123

for.cond51:                                       ; preds = %for.inc79, %for.end49
  %i.2 = phi i32 [ 0, %for.end49 ], [ %inc80, %for.inc79 ], !dbg !125
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !57, metadata !DIExpression()), !dbg !58
  %conv52 = sext i32 %i.2 to i64, !dbg !126
  %cmp53 = icmp ult i64 %conv52, 8, !dbg !128
  br i1 %cmp53, label %for.body55, label %for.end81, !dbg !129

for.body55:                                       ; preds = %for.cond51
  %idxprom56 = sext i32 %i.2 to i64, !dbg !130
  %arrayidx57 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom56, !dbg !130
  %num58 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx57, i32 0, i32 0, !dbg !132
  %6 = load i32, i32* %num58, align 8, !dbg !132
  %idxprom59 = sext i32 %i.2 to i64, !dbg !133
  %arrayidx60 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom59, !dbg !133
  %den61 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx60, i32 0, i32 1, !dbg !134
  %7 = load i32, i32* %den61, align 4, !dbg !134
  %call62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %6, i32 %7), !dbg !135
  br label %while.cond63, !dbg !136

while.cond63:                                     ; preds = %while.body69, %for.body55
  %idxprom64 = sext i32 %i.2 to i64, !dbg !137
  %arrayidx65 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom64, !dbg !137
  %den66 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx65, i32 0, i32 1, !dbg !138
  %8 = load i32, i32* %den66, align 4, !dbg !138
  %cmp67 = icmp ne i32 %8, 0, !dbg !139
  br i1 %cmp67, label %while.body69, label %while.end78, !dbg !136

while.body69:                                     ; preds = %while.cond63
  %idxprom70 = sext i32 %i.2 to i64, !dbg !140
  %arrayidx71 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom70, !dbg !140
  %num72 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx71, i32 0, i32 0, !dbg !142
  %idxprom73 = sext i32 %i.2 to i64, !dbg !143
  %arrayidx74 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom73, !dbg !143
  %den75 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx74, i32 0, i32 1, !dbg !144
  %call76 = call i32 @r2cf(i32* %num72, i32* %den75), !dbg !145
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call76), !dbg !146
  br label %while.cond63, !dbg !136, !llvm.loop !147

while.end78:                                      ; preds = %while.cond63
  br label %for.inc79, !dbg !149

for.inc79:                                        ; preds = %while.end78
  %inc80 = add nsw i32 %i.2, 1, !dbg !150
  call void @llvm.dbg.value(metadata i32 %inc80, metadata !57, metadata !DIExpression()), !dbg !58
  br label %for.cond51, !dbg !151, !llvm.loop !152

for.end81:                                        ; preds = %for.cond51
  ret i32 0, !dbg !154
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "examples", scope: !2, file: !3, line: 7, type: !22, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "continued-fraction-arithmetic-construct-from-rational-number.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Continued-fraction-Arithmetic-Construct-from-rational-number")
!4 = !{}
!5 = !{!0, !6, !17}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "sqrt2", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 256, elements: !15)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "fraction", file: !3, line: 5, baseType: !10)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 3, size: 64, elements: !11)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !10, file: !3, line: 4, baseType: !13, size: 32)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !10, file: !3, line: 4, baseType: !13, size: 32, offset: 32)
!15 = !{!16}
!16 = !DISubrange(count: 4)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "pi", scope: !2, file: !3, line: 9, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 8)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 384, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 6)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!29 = distinct !DISubprogram(name: "r2cf", scope: !3, file: !3, line: 11, type: !30, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{!13, !32, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!33 = !DILocalVariable(name: "numerator", arg: 1, scope: !29, file: !3, line: 11, type: !32)
!34 = !DILocation(line: 0, scope: !29)
!35 = !DILocalVariable(name: "denominator", arg: 2, scope: !29, file: !3, line: 11, type: !32)
!36 = !DILocalVariable(name: "quotient", scope: !29, file: !3, line: 13, type: !13)
!37 = !DILocation(line: 15, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !3, line: 15, column: 5)
!39 = !DILocation(line: 15, column: 5, scope: !29)
!40 = !DILocation(line: 17, column: 14, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 16, column: 2)
!42 = !DILocation(line: 17, column: 27, scope: !41)
!43 = !DILocation(line: 17, column: 25, scope: !41)
!44 = !DILocation(line: 19, column: 10, scope: !41)
!45 = !DILocalVariable(name: "temp", scope: !29, file: !3, line: 13, type: !13)
!46 = !DILocation(line: 21, column: 16, scope: !41)
!47 = !DILocation(line: 21, column: 14, scope: !41)
!48 = !DILocation(line: 23, column: 25, scope: !41)
!49 = !DILocation(line: 23, column: 23, scope: !41)
!50 = !DILocation(line: 23, column: 16, scope: !41)
!51 = !DILocation(line: 24, column: 2, scope: !41)
!52 = !DILocation(line: 26, column: 2, scope: !29)
!53 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 29, type: !54, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!13}
!56 = !DILocation(line: 33, column: 2, scope: !53)
!57 = !DILocalVariable(name: "i", scope: !53, file: !3, line: 31, type: !13)
!58 = !DILocation(line: 0, scope: !53)
!59 = !DILocation(line: 35, column: 6, scope: !60)
!60 = distinct !DILexicalBlock(scope: !53, file: !3, line: 35, column: 2)
!61 = !DILocation(line: 0, scope: !60)
!62 = !DILocation(line: 35, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !3, line: 35, column: 2)
!64 = !DILocation(line: 35, column: 11, scope: !63)
!65 = !DILocation(line: 35, column: 2, scope: !60)
!66 = !DILocation(line: 37, column: 35, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 36, column: 2)
!68 = !DILocation(line: 37, column: 47, scope: !67)
!69 = !DILocation(line: 37, column: 51, scope: !67)
!70 = !DILocation(line: 37, column: 63, scope: !67)
!71 = !DILocation(line: 37, column: 3, scope: !67)
!72 = !DILocation(line: 39, column: 3, scope: !67)
!73 = !DILocation(line: 39, column: 9, scope: !67)
!74 = !DILocation(line: 39, column: 21, scope: !67)
!75 = !DILocation(line: 39, column: 25, scope: !67)
!76 = !DILocation(line: 40, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !67, file: !3, line: 39, column: 30)
!78 = !DILocation(line: 40, column: 36, scope: !77)
!79 = !DILocation(line: 40, column: 41, scope: !77)
!80 = !DILocation(line: 40, column: 53, scope: !77)
!81 = !DILocation(line: 40, column: 18, scope: !77)
!82 = !DILocation(line: 40, column: 4, scope: !77)
!83 = distinct !{!83, !72, !84}
!84 = !DILocation(line: 41, column: 4, scope: !67)
!85 = !DILocation(line: 42, column: 2, scope: !67)
!86 = !DILocation(line: 35, column: 47, scope: !63)
!87 = !DILocation(line: 35, column: 2, scope: !63)
!88 = distinct !{!88, !65, !89}
!89 = !DILocation(line: 42, column: 2, scope: !60)
!90 = !DILocation(line: 44, column: 2, scope: !53)
!91 = !DILocation(line: 46, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !53, file: !3, line: 46, column: 2)
!93 = !DILocation(line: 0, scope: !92)
!94 = !DILocation(line: 46, column: 10, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 46, column: 2)
!96 = !DILocation(line: 46, column: 11, scope: !95)
!97 = !DILocation(line: 46, column: 2, scope: !92)
!98 = !DILocation(line: 48, column: 35, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 47, column: 2)
!100 = !DILocation(line: 48, column: 44, scope: !99)
!101 = !DILocation(line: 48, column: 48, scope: !99)
!102 = !DILocation(line: 48, column: 57, scope: !99)
!103 = !DILocation(line: 48, column: 3, scope: !99)
!104 = !DILocation(line: 50, column: 3, scope: !99)
!105 = !DILocation(line: 50, column: 9, scope: !99)
!106 = !DILocation(line: 50, column: 18, scope: !99)
!107 = !DILocation(line: 50, column: 22, scope: !99)
!108 = !DILocation(line: 51, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !99, file: !3, line: 50, column: 27)
!110 = !DILocation(line: 51, column: 33, scope: !109)
!111 = !DILocation(line: 51, column: 38, scope: !109)
!112 = !DILocation(line: 51, column: 47, scope: !109)
!113 = !DILocation(line: 51, column: 18, scope: !109)
!114 = !DILocation(line: 51, column: 4, scope: !109)
!115 = distinct !{!115, !104, !116}
!116 = !DILocation(line: 52, column: 4, scope: !99)
!117 = !DILocation(line: 53, column: 2, scope: !99)
!118 = !DILocation(line: 46, column: 44, scope: !95)
!119 = !DILocation(line: 46, column: 2, scope: !95)
!120 = distinct !{!120, !97, !121}
!121 = !DILocation(line: 53, column: 2, scope: !92)
!122 = !DILocation(line: 55, column: 2, scope: !53)
!123 = !DILocation(line: 57, column: 6, scope: !124)
!124 = distinct !DILexicalBlock(scope: !53, file: !3, line: 57, column: 2)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocation(line: 57, column: 10, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 57, column: 2)
!128 = !DILocation(line: 57, column: 11, scope: !127)
!129 = !DILocation(line: 57, column: 2, scope: !124)
!130 = !DILocation(line: 59, column: 35, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 58, column: 2)
!132 = !DILocation(line: 59, column: 41, scope: !131)
!133 = !DILocation(line: 59, column: 45, scope: !131)
!134 = !DILocation(line: 59, column: 51, scope: !131)
!135 = !DILocation(line: 59, column: 3, scope: !131)
!136 = !DILocation(line: 61, column: 3, scope: !131)
!137 = !DILocation(line: 61, column: 9, scope: !131)
!138 = !DILocation(line: 61, column: 15, scope: !131)
!139 = !DILocation(line: 61, column: 19, scope: !131)
!140 = !DILocation(line: 62, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !3, line: 61, column: 24)
!142 = !DILocation(line: 62, column: 30, scope: !141)
!143 = !DILocation(line: 62, column: 35, scope: !141)
!144 = !DILocation(line: 62, column: 41, scope: !141)
!145 = !DILocation(line: 62, column: 18, scope: !141)
!146 = !DILocation(line: 62, column: 4, scope: !141)
!147 = distinct !{!147, !136, !148}
!148 = !DILocation(line: 63, column: 4, scope: !131)
!149 = !DILocation(line: 64, column: 2, scope: !131)
!150 = !DILocation(line: 57, column: 41, scope: !127)
!151 = !DILocation(line: 57, column: 2, scope: !127)
!152 = distinct !{!152, !129, !153}
!153 = !DILocation(line: 64, column: 2, scope: !124)
!154 = !DILocation(line: 68, column: 2, scope: !53)
