; ModuleID = 'continued-fraction-arithmetic-construct-from-rational-number.bc'
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
  %numerator.addr = alloca i32*, align 8
  %denominator.addr = alloca i32*, align 8
  %quotient = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32* %numerator, i32** %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %numerator.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32* %denominator, i32** %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %denominator.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %quotient, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %quotient, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32*, i32** %denominator.addr, align 8, !dbg !41
  %cmp = icmp ne i32* %0, null, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %numerator.addr, align 8, !dbg !45
  %2 = load i32, i32* %1, align 4, !dbg !47
  %3 = load i32*, i32** %denominator.addr, align 8, !dbg !48
  %4 = load i32, i32* %3, align 4, !dbg !49
  %div = sdiv i32 %2, %4, !dbg !50
  store i32 %div, i32* %quotient, align 4, !dbg !51
  %5 = load i32*, i32** %numerator.addr, align 8, !dbg !52
  %6 = load i32, i32* %5, align 4, !dbg !53
  store i32 %6, i32* %temp, align 4, !dbg !54
  %7 = load i32*, i32** %denominator.addr, align 8, !dbg !55
  %8 = load i32, i32* %7, align 4, !dbg !56
  %9 = load i32*, i32** %numerator.addr, align 8, !dbg !57
  store i32 %8, i32* %9, align 4, !dbg !58
  %10 = load i32, i32* %temp, align 4, !dbg !59
  %11 = load i32*, i32** %denominator.addr, align 8, !dbg !60
  %12 = load i32, i32* %11, align 4, !dbg !61
  %rem = srem i32 %10, %12, !dbg !62
  %13 = load i32*, i32** %denominator.addr, align 8, !dbg !63
  store i32 %rem, i32* %13, align 4, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32, i32* %quotient, align 4, !dbg !66
  ret i32 %14, !dbg !67
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !73
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !77
  %conv = sext i32 %0 to i64, !dbg !77
  %cmp = icmp ult i64 %conv, 6, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !81
  %idxprom = sext i32 %1 to i64, !dbg !83
  %arrayidx = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom, !dbg !83
  %num = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx, i32 0, i32 0, !dbg !84
  %2 = load i32, i32* %num, align 8, !dbg !84
  %3 = load i32, i32* %i, align 4, !dbg !85
  %idxprom2 = sext i32 %3 to i64, !dbg !86
  %arrayidx3 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom2, !dbg !86
  %den = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx3, i32 0, i32 1, !dbg !87
  %4 = load i32, i32* %den, align 4, !dbg !87
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %2, i32 %4), !dbg !88
  br label %while.cond, !dbg !89

while.cond:                                       ; preds = %while.body, %for.body
  %5 = load i32, i32* %i, align 4, !dbg !90
  %idxprom5 = sext i32 %5 to i64, !dbg !91
  %arrayidx6 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom5, !dbg !91
  %den7 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx6, i32 0, i32 1, !dbg !92
  %6 = load i32, i32* %den7, align 4, !dbg !92
  %cmp8 = icmp ne i32 %6, 0, !dbg !93
  br i1 %cmp8, label %while.body, label %while.end, !dbg !89

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %i, align 4, !dbg !94
  %idxprom10 = sext i32 %7 to i64, !dbg !96
  %arrayidx11 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom10, !dbg !96
  %num12 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx11, i32 0, i32 0, !dbg !97
  %8 = load i32, i32* %i, align 4, !dbg !98
  %idxprom13 = sext i32 %8 to i64, !dbg !99
  %arrayidx14 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom13, !dbg !99
  %den15 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx14, i32 0, i32 1, !dbg !100
  %call16 = call i32 @r2cf(i32* %num12, i32* %den15), !dbg !101
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call16), !dbg !102
  br label %while.cond, !dbg !89, !llvm.loop !103

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %while.end
  %9 = load i32, i32* %i, align 4, !dbg !106
  %inc = add nsw i32 %9, 1, !dbg !106
  store i32 %inc, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 251), !dbg !110
  store i32 0, i32* %i, align 4, !dbg !111
  br label %for.cond19, !dbg !113

for.cond19:                                       ; preds = %for.inc47, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !114
  %conv20 = sext i32 %10 to i64, !dbg !114
  %cmp21 = icmp ult i64 %conv20, 4, !dbg !116
  br i1 %cmp21, label %for.body23, label %for.end49, !dbg !117

for.body23:                                       ; preds = %for.cond19
  %11 = load i32, i32* %i, align 4, !dbg !118
  %idxprom24 = sext i32 %11 to i64, !dbg !120
  %arrayidx25 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom24, !dbg !120
  %num26 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx25, i32 0, i32 0, !dbg !121
  %12 = load i32, i32* %num26, align 8, !dbg !121
  %13 = load i32, i32* %i, align 4, !dbg !122
  %idxprom27 = sext i32 %13 to i64, !dbg !123
  %arrayidx28 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom27, !dbg !123
  %den29 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx28, i32 0, i32 1, !dbg !124
  %14 = load i32, i32* %den29, align 4, !dbg !124
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %12, i32 %14), !dbg !125
  br label %while.cond31, !dbg !126

while.cond31:                                     ; preds = %while.body37, %for.body23
  %15 = load i32, i32* %i, align 4, !dbg !127
  %idxprom32 = sext i32 %15 to i64, !dbg !128
  %arrayidx33 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom32, !dbg !128
  %den34 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx33, i32 0, i32 1, !dbg !129
  %16 = load i32, i32* %den34, align 4, !dbg !129
  %cmp35 = icmp ne i32 %16, 0, !dbg !130
  br i1 %cmp35, label %while.body37, label %while.end46, !dbg !126

while.body37:                                     ; preds = %while.cond31
  %17 = load i32, i32* %i, align 4, !dbg !131
  %idxprom38 = sext i32 %17 to i64, !dbg !133
  %arrayidx39 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom38, !dbg !133
  %num40 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx39, i32 0, i32 0, !dbg !134
  %18 = load i32, i32* %i, align 4, !dbg !135
  %idxprom41 = sext i32 %18 to i64, !dbg !136
  %arrayidx42 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom41, !dbg !136
  %den43 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx42, i32 0, i32 1, !dbg !137
  %call44 = call i32 @r2cf(i32* %num40, i32* %den43), !dbg !138
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call44), !dbg !139
  br label %while.cond31, !dbg !126, !llvm.loop !140

while.end46:                                      ; preds = %while.cond31
  br label %for.inc47, !dbg !142

for.inc47:                                        ; preds = %while.end46
  %19 = load i32, i32* %i, align 4, !dbg !143
  %inc48 = add nsw i32 %19, 1, !dbg !143
  store i32 %inc48, i32* %i, align 4, !dbg !143
  br label %for.cond19, !dbg !144, !llvm.loop !145

for.end49:                                        ; preds = %for.cond19
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 227), !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond51, !dbg !150

for.cond51:                                       ; preds = %for.inc79, %for.end49
  %20 = load i32, i32* %i, align 4, !dbg !151
  %conv52 = sext i32 %20 to i64, !dbg !151
  %cmp53 = icmp ult i64 %conv52, 8, !dbg !153
  br i1 %cmp53, label %for.body55, label %for.end81, !dbg !154

for.body55:                                       ; preds = %for.cond51
  %21 = load i32, i32* %i, align 4, !dbg !155
  %idxprom56 = sext i32 %21 to i64, !dbg !157
  %arrayidx57 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom56, !dbg !157
  %num58 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx57, i32 0, i32 0, !dbg !158
  %22 = load i32, i32* %num58, align 8, !dbg !158
  %23 = load i32, i32* %i, align 4, !dbg !159
  %idxprom59 = sext i32 %23 to i64, !dbg !160
  %arrayidx60 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom59, !dbg !160
  %den61 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx60, i32 0, i32 1, !dbg !161
  %24 = load i32, i32* %den61, align 4, !dbg !161
  %call62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %22, i32 %24), !dbg !162
  br label %while.cond63, !dbg !163

while.cond63:                                     ; preds = %while.body69, %for.body55
  %25 = load i32, i32* %i, align 4, !dbg !164
  %idxprom64 = sext i32 %25 to i64, !dbg !165
  %arrayidx65 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom64, !dbg !165
  %den66 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx65, i32 0, i32 1, !dbg !166
  %26 = load i32, i32* %den66, align 4, !dbg !166
  %cmp67 = icmp ne i32 %26, 0, !dbg !167
  br i1 %cmp67, label %while.body69, label %while.end78, !dbg !163

while.body69:                                     ; preds = %while.cond63
  %27 = load i32, i32* %i, align 4, !dbg !168
  %idxprom70 = sext i32 %27 to i64, !dbg !170
  %arrayidx71 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom70, !dbg !170
  %num72 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx71, i32 0, i32 0, !dbg !171
  %28 = load i32, i32* %i, align 4, !dbg !172
  %idxprom73 = sext i32 %28 to i64, !dbg !173
  %arrayidx74 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom73, !dbg !173
  %den75 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx74, i32 0, i32 1, !dbg !174
  %call76 = call i32 @r2cf(i32* %num72, i32* %den75), !dbg !175
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call76), !dbg !176
  br label %while.cond63, !dbg !163, !llvm.loop !177

while.end78:                                      ; preds = %while.cond63
  br label %for.inc79, !dbg !179

for.inc79:                                        ; preds = %while.end78
  %29 = load i32, i32* %i, align 4, !dbg !180
  %inc80 = add nsw i32 %29, 1, !dbg !180
  store i32 %inc80, i32* %i, align 4, !dbg !180
  br label %for.cond51, !dbg !181, !llvm.loop !182

for.end81:                                        ; preds = %for.cond51
  ret i32 0, !dbg !184
}

declare dso_local i32 @printf(i8*, ...) #2

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
!34 = !DILocation(line: 11, column: 15, scope: !29)
!35 = !DILocalVariable(name: "denominator", arg: 2, scope: !29, file: !3, line: 11, type: !32)
!36 = !DILocation(line: 11, column: 30, scope: !29)
!37 = !DILocalVariable(name: "quotient", scope: !29, file: !3, line: 13, type: !13)
!38 = !DILocation(line: 13, column: 6, scope: !29)
!39 = !DILocalVariable(name: "temp", scope: !29, file: !3, line: 13, type: !13)
!40 = !DILocation(line: 13, column: 17, scope: !29)
!41 = !DILocation(line: 15, column: 5, scope: !42)
!42 = distinct !DILexicalBlock(scope: !29, file: !3, line: 15, column: 5)
!43 = !DILocation(line: 15, column: 17, scope: !42)
!44 = !DILocation(line: 15, column: 5, scope: !29)
!45 = !DILocation(line: 17, column: 15, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 16, column: 2)
!47 = !DILocation(line: 17, column: 14, scope: !46)
!48 = !DILocation(line: 17, column: 28, scope: !46)
!49 = !DILocation(line: 17, column: 27, scope: !46)
!50 = !DILocation(line: 17, column: 25, scope: !46)
!51 = !DILocation(line: 17, column: 12, scope: !46)
!52 = !DILocation(line: 19, column: 11, scope: !46)
!53 = !DILocation(line: 19, column: 10, scope: !46)
!54 = !DILocation(line: 19, column: 8, scope: !46)
!55 = !DILocation(line: 21, column: 17, scope: !46)
!56 = !DILocation(line: 21, column: 16, scope: !46)
!57 = !DILocation(line: 21, column: 4, scope: !46)
!58 = !DILocation(line: 21, column: 14, scope: !46)
!59 = !DILocation(line: 23, column: 18, scope: !46)
!60 = !DILocation(line: 23, column: 26, scope: !46)
!61 = !DILocation(line: 23, column: 25, scope: !46)
!62 = !DILocation(line: 23, column: 23, scope: !46)
!63 = !DILocation(line: 23, column: 4, scope: !46)
!64 = !DILocation(line: 23, column: 16, scope: !46)
!65 = !DILocation(line: 24, column: 2, scope: !46)
!66 = !DILocation(line: 26, column: 9, scope: !29)
!67 = !DILocation(line: 26, column: 2, scope: !29)
!68 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 29, type: !69, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!13}
!71 = !DILocalVariable(name: "i", scope: !68, file: !3, line: 31, type: !13)
!72 = !DILocation(line: 31, column: 6, scope: !68)
!73 = !DILocation(line: 33, column: 2, scope: !68)
!74 = !DILocation(line: 35, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !68, file: !3, line: 35, column: 2)
!76 = !DILocation(line: 35, column: 6, scope: !75)
!77 = !DILocation(line: 35, column: 10, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 35, column: 2)
!79 = !DILocation(line: 35, column: 11, scope: !78)
!80 = !DILocation(line: 35, column: 2, scope: !75)
!81 = !DILocation(line: 37, column: 44, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 36, column: 2)
!83 = !DILocation(line: 37, column: 35, scope: !82)
!84 = !DILocation(line: 37, column: 47, scope: !82)
!85 = !DILocation(line: 37, column: 60, scope: !82)
!86 = !DILocation(line: 37, column: 51, scope: !82)
!87 = !DILocation(line: 37, column: 63, scope: !82)
!88 = !DILocation(line: 37, column: 3, scope: !82)
!89 = !DILocation(line: 39, column: 3, scope: !82)
!90 = !DILocation(line: 39, column: 18, scope: !82)
!91 = !DILocation(line: 39, column: 9, scope: !82)
!92 = !DILocation(line: 39, column: 21, scope: !82)
!93 = !DILocation(line: 39, column: 25, scope: !82)
!94 = !DILocation(line: 40, column: 33, scope: !95)
!95 = distinct !DILexicalBlock(scope: !82, file: !3, line: 39, column: 30)
!96 = !DILocation(line: 40, column: 24, scope: !95)
!97 = !DILocation(line: 40, column: 36, scope: !95)
!98 = !DILocation(line: 40, column: 50, scope: !95)
!99 = !DILocation(line: 40, column: 41, scope: !95)
!100 = !DILocation(line: 40, column: 53, scope: !95)
!101 = !DILocation(line: 40, column: 18, scope: !95)
!102 = !DILocation(line: 40, column: 4, scope: !95)
!103 = distinct !{!103, !89, !104}
!104 = !DILocation(line: 41, column: 4, scope: !82)
!105 = !DILocation(line: 42, column: 2, scope: !82)
!106 = !DILocation(line: 35, column: 47, scope: !78)
!107 = !DILocation(line: 35, column: 2, scope: !78)
!108 = distinct !{!108, !80, !109}
!109 = !DILocation(line: 42, column: 2, scope: !75)
!110 = !DILocation(line: 44, column: 2, scope: !68)
!111 = !DILocation(line: 46, column: 7, scope: !112)
!112 = distinct !DILexicalBlock(scope: !68, file: !3, line: 46, column: 2)
!113 = !DILocation(line: 46, column: 6, scope: !112)
!114 = !DILocation(line: 46, column: 10, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 46, column: 2)
!116 = !DILocation(line: 46, column: 11, scope: !115)
!117 = !DILocation(line: 46, column: 2, scope: !112)
!118 = !DILocation(line: 48, column: 41, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !3, line: 47, column: 2)
!120 = !DILocation(line: 48, column: 35, scope: !119)
!121 = !DILocation(line: 48, column: 44, scope: !119)
!122 = !DILocation(line: 48, column: 54, scope: !119)
!123 = !DILocation(line: 48, column: 48, scope: !119)
!124 = !DILocation(line: 48, column: 57, scope: !119)
!125 = !DILocation(line: 48, column: 3, scope: !119)
!126 = !DILocation(line: 50, column: 3, scope: !119)
!127 = !DILocation(line: 50, column: 15, scope: !119)
!128 = !DILocation(line: 50, column: 9, scope: !119)
!129 = !DILocation(line: 50, column: 18, scope: !119)
!130 = !DILocation(line: 50, column: 22, scope: !119)
!131 = !DILocation(line: 51, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !119, file: !3, line: 50, column: 27)
!133 = !DILocation(line: 51, column: 24, scope: !132)
!134 = !DILocation(line: 51, column: 33, scope: !132)
!135 = !DILocation(line: 51, column: 44, scope: !132)
!136 = !DILocation(line: 51, column: 38, scope: !132)
!137 = !DILocation(line: 51, column: 47, scope: !132)
!138 = !DILocation(line: 51, column: 18, scope: !132)
!139 = !DILocation(line: 51, column: 4, scope: !132)
!140 = distinct !{!140, !126, !141}
!141 = !DILocation(line: 52, column: 4, scope: !119)
!142 = !DILocation(line: 53, column: 2, scope: !119)
!143 = !DILocation(line: 46, column: 44, scope: !115)
!144 = !DILocation(line: 46, column: 2, scope: !115)
!145 = distinct !{!145, !117, !146}
!146 = !DILocation(line: 53, column: 2, scope: !112)
!147 = !DILocation(line: 55, column: 2, scope: !68)
!148 = !DILocation(line: 57, column: 7, scope: !149)
!149 = distinct !DILexicalBlock(scope: !68, file: !3, line: 57, column: 2)
!150 = !DILocation(line: 57, column: 6, scope: !149)
!151 = !DILocation(line: 57, column: 10, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 57, column: 2)
!153 = !DILocation(line: 57, column: 11, scope: !152)
!154 = !DILocation(line: 57, column: 2, scope: !149)
!155 = !DILocation(line: 59, column: 38, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 58, column: 2)
!157 = !DILocation(line: 59, column: 35, scope: !156)
!158 = !DILocation(line: 59, column: 41, scope: !156)
!159 = !DILocation(line: 59, column: 48, scope: !156)
!160 = !DILocation(line: 59, column: 45, scope: !156)
!161 = !DILocation(line: 59, column: 51, scope: !156)
!162 = !DILocation(line: 59, column: 3, scope: !156)
!163 = !DILocation(line: 61, column: 3, scope: !156)
!164 = !DILocation(line: 61, column: 12, scope: !156)
!165 = !DILocation(line: 61, column: 9, scope: !156)
!166 = !DILocation(line: 61, column: 15, scope: !156)
!167 = !DILocation(line: 61, column: 19, scope: !156)
!168 = !DILocation(line: 62, column: 27, scope: !169)
!169 = distinct !DILexicalBlock(scope: !156, file: !3, line: 61, column: 24)
!170 = !DILocation(line: 62, column: 24, scope: !169)
!171 = !DILocation(line: 62, column: 30, scope: !169)
!172 = !DILocation(line: 62, column: 38, scope: !169)
!173 = !DILocation(line: 62, column: 35, scope: !169)
!174 = !DILocation(line: 62, column: 41, scope: !169)
!175 = !DILocation(line: 62, column: 18, scope: !169)
!176 = !DILocation(line: 62, column: 4, scope: !169)
!177 = distinct !{!177, !163, !178}
!178 = !DILocation(line: 63, column: 4, scope: !156)
!179 = !DILocation(line: 64, column: 2, scope: !156)
!180 = !DILocation(line: 57, column: 41, scope: !152)
!181 = !DILocation(line: 57, column: 2, scope: !152)
!182 = distinct !{!182, !154, !183}
!183 = !DILocation(line: 64, column: 2, scope: !149)
!184 = !DILocation(line: 68, column: 2, scope: !68)
