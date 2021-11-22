; ModuleID = 'continued-fraction-arithmetic-construct-from-rational-number.c'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !44, !cf.info !45

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %numerator.addr, align 8, !dbg !46
  %2 = load i32, i32* %1, align 4, !dbg !48
  %3 = load i32*, i32** %denominator.addr, align 8, !dbg !49
  %4 = load i32, i32* %3, align 4, !dbg !50
  %div = sdiv i32 %2, %4, !dbg !51
  store i32 %div, i32* %quotient, align 4, !dbg !52
  %5 = load i32*, i32** %numerator.addr, align 8, !dbg !53
  %6 = load i32, i32* %5, align 4, !dbg !54
  store i32 %6, i32* %temp, align 4, !dbg !55
  %7 = load i32*, i32** %denominator.addr, align 8, !dbg !56
  %8 = load i32, i32* %7, align 4, !dbg !57
  %9 = load i32*, i32** %numerator.addr, align 8, !dbg !58
  store i32 %8, i32* %9, align 4, !dbg !59
  %10 = load i32, i32* %temp, align 4, !dbg !60
  %11 = load i32*, i32** %denominator.addr, align 8, !dbg !61
  %12 = load i32, i32* %11, align 4, !dbg !62
  %rem = srem i32 %10, %12, !dbg !63
  %13 = load i32*, i32** %denominator.addr, align 8, !dbg !64
  store i32 %rem, i32* %13, align 4, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32, i32* %quotient, align 4, !dbg !67
  ret i32 %14, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !78
  %conv = sext i32 %0 to i64, !dbg !78
  %cmp = icmp ult i64 %conv, 6, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !82
  %idxprom = sext i32 %1 to i64, !dbg !84
  %arrayidx = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom, !dbg !84
  %num = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx, i32 0, i32 0, !dbg !85
  %2 = load i32, i32* %num, align 8, !dbg !85
  %3 = load i32, i32* %i, align 4, !dbg !86
  %idxprom2 = sext i32 %3 to i64, !dbg !87
  %arrayidx3 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom2, !dbg !87
  %den = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx3, i32 0, i32 1, !dbg !88
  %4 = load i32, i32* %den, align 4, !dbg !88
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %2, i32 %4), !dbg !89
  br label %while.cond, !dbg !90

while.cond:                                       ; preds = %while.body, %for.body
  %5 = load i32, i32* %i, align 4, !dbg !91
  %idxprom5 = sext i32 %5 to i64, !dbg !92
  %arrayidx6 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom5, !dbg !92
  %den7 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx6, i32 0, i32 1, !dbg !93
  %6 = load i32, i32* %den7, align 4, !dbg !93
  %cmp8 = icmp ne i32 %6, 0, !dbg !94
  br i1 %cmp8, label %while.body, label %while.end, !dbg !90

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %i, align 4, !dbg !95
  %idxprom10 = sext i32 %7 to i64, !dbg !97
  %arrayidx11 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom10, !dbg !97
  %num12 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx11, i32 0, i32 0, !dbg !98
  %8 = load i32, i32* %i, align 4, !dbg !99
  %idxprom13 = sext i32 %8 to i64, !dbg !100
  %arrayidx14 = getelementptr inbounds [6 x %struct.fraction], [6 x %struct.fraction]* @examples, i64 0, i64 %idxprom13, !dbg !100
  %den15 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx14, i32 0, i32 1, !dbg !101
  %call16 = call i32 @r2cf(i32* %num12, i32* %den15), !dbg !102
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call16), !dbg !103
  br label %while.cond, !dbg !90, !llvm.loop !104

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %while.end
  %9 = load i32, i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %9, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 251), !dbg !111
  store i32 0, i32* %i, align 4, !dbg !112
  br label %for.cond19, !dbg !114

for.cond19:                                       ; preds = %for.inc47, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !115
  %conv20 = sext i32 %10 to i64, !dbg !115
  %cmp21 = icmp ult i64 %conv20, 4, !dbg !117
  br i1 %cmp21, label %for.body23, label %for.end49, !dbg !118

for.body23:                                       ; preds = %for.cond19
  %11 = load i32, i32* %i, align 4, !dbg !119
  %idxprom24 = sext i32 %11 to i64, !dbg !121
  %arrayidx25 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom24, !dbg !121
  %num26 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx25, i32 0, i32 0, !dbg !122
  %12 = load i32, i32* %num26, align 8, !dbg !122
  %13 = load i32, i32* %i, align 4, !dbg !123
  %idxprom27 = sext i32 %13 to i64, !dbg !124
  %arrayidx28 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom27, !dbg !124
  %den29 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx28, i32 0, i32 1, !dbg !125
  %14 = load i32, i32* %den29, align 4, !dbg !125
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %12, i32 %14), !dbg !126
  br label %while.cond31, !dbg !127

while.cond31:                                     ; preds = %while.body37, %for.body23
  %15 = load i32, i32* %i, align 4, !dbg !128
  %idxprom32 = sext i32 %15 to i64, !dbg !129
  %arrayidx33 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom32, !dbg !129
  %den34 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx33, i32 0, i32 1, !dbg !130
  %16 = load i32, i32* %den34, align 4, !dbg !130
  %cmp35 = icmp ne i32 %16, 0, !dbg !131
  br i1 %cmp35, label %while.body37, label %while.end46, !dbg !127

while.body37:                                     ; preds = %while.cond31
  %17 = load i32, i32* %i, align 4, !dbg !132
  %idxprom38 = sext i32 %17 to i64, !dbg !134
  %arrayidx39 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom38, !dbg !134
  %num40 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx39, i32 0, i32 0, !dbg !135
  %18 = load i32, i32* %i, align 4, !dbg !136
  %idxprom41 = sext i32 %18 to i64, !dbg !137
  %arrayidx42 = getelementptr inbounds [4 x %struct.fraction], [4 x %struct.fraction]* @sqrt2, i64 0, i64 %idxprom41, !dbg !137
  %den43 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx42, i32 0, i32 1, !dbg !138
  %call44 = call i32 @r2cf(i32* %num40, i32* %den43), !dbg !139
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call44), !dbg !140
  br label %while.cond31, !dbg !127, !llvm.loop !141

while.end46:                                      ; preds = %while.cond31
  br label %for.inc47, !dbg !143

for.inc47:                                        ; preds = %while.end46
  %19 = load i32, i32* %i, align 4, !dbg !144
  %inc48 = add nsw i32 %19, 1, !dbg !144
  store i32 %inc48, i32* %i, align 4, !dbg !144
  br label %for.cond19, !dbg !145, !llvm.loop !146

for.end49:                                        ; preds = %for.cond19
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 227), !dbg !148
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond51, !dbg !151

for.cond51:                                       ; preds = %for.inc79, %for.end49
  %20 = load i32, i32* %i, align 4, !dbg !152
  %conv52 = sext i32 %20 to i64, !dbg !152
  %cmp53 = icmp ult i64 %conv52, 8, !dbg !154
  br i1 %cmp53, label %for.body55, label %for.end81, !dbg !155

for.body55:                                       ; preds = %for.cond51
  %21 = load i32, i32* %i, align 4, !dbg !156
  %idxprom56 = sext i32 %21 to i64, !dbg !158
  %arrayidx57 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom56, !dbg !158
  %num58 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx57, i32 0, i32 0, !dbg !159
  %22 = load i32, i32* %num58, align 8, !dbg !159
  %23 = load i32, i32* %i, align 4, !dbg !160
  %idxprom59 = sext i32 %23 to i64, !dbg !161
  %arrayidx60 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom59, !dbg !161
  %den61 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx60, i32 0, i32 1, !dbg !162
  %24 = load i32, i32* %den61, align 4, !dbg !162
  %call62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i32 %22, i32 %24), !dbg !163
  br label %while.cond63, !dbg !164

while.cond63:                                     ; preds = %while.body69, %for.body55
  %25 = load i32, i32* %i, align 4, !dbg !165
  %idxprom64 = sext i32 %25 to i64, !dbg !166
  %arrayidx65 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom64, !dbg !166
  %den66 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx65, i32 0, i32 1, !dbg !167
  %26 = load i32, i32* %den66, align 4, !dbg !167
  %cmp67 = icmp ne i32 %26, 0, !dbg !168
  br i1 %cmp67, label %while.body69, label %while.end78, !dbg !164

while.body69:                                     ; preds = %while.cond63
  %27 = load i32, i32* %i, align 4, !dbg !169
  %idxprom70 = sext i32 %27 to i64, !dbg !171
  %arrayidx71 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom70, !dbg !171
  %num72 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx71, i32 0, i32 0, !dbg !172
  %28 = load i32, i32* %i, align 4, !dbg !173
  %idxprom73 = sext i32 %28 to i64, !dbg !174
  %arrayidx74 = getelementptr inbounds [8 x %struct.fraction], [8 x %struct.fraction]* @pi, i64 0, i64 %idxprom73, !dbg !174
  %den75 = getelementptr inbounds %struct.fraction, %struct.fraction* %arrayidx74, i32 0, i32 1, !dbg !175
  %call76 = call i32 @r2cf(i32* %num72, i32* %den75), !dbg !176
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %call76), !dbg !177
  br label %while.cond63, !dbg !164, !llvm.loop !178

while.end78:                                      ; preds = %while.cond63
  br label %for.inc79, !dbg !180

for.inc79:                                        ; preds = %while.end78
  %29 = load i32, i32* %i, align 4, !dbg !181
  %inc80 = add nsw i32 %29, 1, !dbg !181
  store i32 %inc80, i32* %i, align 4, !dbg !181
  br label %for.cond51, !dbg !182, !llvm.loop !183

for.end81:                                        ; preds = %for.cond51
  ret i32 0, !dbg !185
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!28 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!45 = !{!"if"}
!46 = !DILocation(line: 17, column: 15, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !3, line: 16, column: 2)
!48 = !DILocation(line: 17, column: 14, scope: !47)
!49 = !DILocation(line: 17, column: 28, scope: !47)
!50 = !DILocation(line: 17, column: 27, scope: !47)
!51 = !DILocation(line: 17, column: 25, scope: !47)
!52 = !DILocation(line: 17, column: 12, scope: !47)
!53 = !DILocation(line: 19, column: 11, scope: !47)
!54 = !DILocation(line: 19, column: 10, scope: !47)
!55 = !DILocation(line: 19, column: 8, scope: !47)
!56 = !DILocation(line: 21, column: 17, scope: !47)
!57 = !DILocation(line: 21, column: 16, scope: !47)
!58 = !DILocation(line: 21, column: 4, scope: !47)
!59 = !DILocation(line: 21, column: 14, scope: !47)
!60 = !DILocation(line: 23, column: 18, scope: !47)
!61 = !DILocation(line: 23, column: 26, scope: !47)
!62 = !DILocation(line: 23, column: 25, scope: !47)
!63 = !DILocation(line: 23, column: 23, scope: !47)
!64 = !DILocation(line: 23, column: 4, scope: !47)
!65 = !DILocation(line: 23, column: 16, scope: !47)
!66 = !DILocation(line: 24, column: 2, scope: !47)
!67 = !DILocation(line: 26, column: 9, scope: !29)
!68 = !DILocation(line: 26, column: 2, scope: !29)
!69 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 29, type: !70, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!13}
!72 = !DILocalVariable(name: "i", scope: !69, file: !3, line: 31, type: !13)
!73 = !DILocation(line: 31, column: 6, scope: !69)
!74 = !DILocation(line: 33, column: 2, scope: !69)
!75 = !DILocation(line: 35, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !3, line: 35, column: 2)
!77 = !DILocation(line: 35, column: 6, scope: !76)
!78 = !DILocation(line: 35, column: 10, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !3, line: 35, column: 2)
!80 = !DILocation(line: 35, column: 11, scope: !79)
!81 = !DILocation(line: 35, column: 2, scope: !76)
!82 = !DILocation(line: 37, column: 44, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 36, column: 2)
!84 = !DILocation(line: 37, column: 35, scope: !83)
!85 = !DILocation(line: 37, column: 47, scope: !83)
!86 = !DILocation(line: 37, column: 60, scope: !83)
!87 = !DILocation(line: 37, column: 51, scope: !83)
!88 = !DILocation(line: 37, column: 63, scope: !83)
!89 = !DILocation(line: 37, column: 3, scope: !83)
!90 = !DILocation(line: 39, column: 3, scope: !83)
!91 = !DILocation(line: 39, column: 18, scope: !83)
!92 = !DILocation(line: 39, column: 9, scope: !83)
!93 = !DILocation(line: 39, column: 21, scope: !83)
!94 = !DILocation(line: 39, column: 25, scope: !83)
!95 = !DILocation(line: 40, column: 33, scope: !96)
!96 = distinct !DILexicalBlock(scope: !83, file: !3, line: 39, column: 30)
!97 = !DILocation(line: 40, column: 24, scope: !96)
!98 = !DILocation(line: 40, column: 36, scope: !96)
!99 = !DILocation(line: 40, column: 50, scope: !96)
!100 = !DILocation(line: 40, column: 41, scope: !96)
!101 = !DILocation(line: 40, column: 53, scope: !96)
!102 = !DILocation(line: 40, column: 18, scope: !96)
!103 = !DILocation(line: 40, column: 4, scope: !96)
!104 = distinct !{!104, !90, !105}
!105 = !DILocation(line: 41, column: 4, scope: !83)
!106 = !DILocation(line: 42, column: 2, scope: !83)
!107 = !DILocation(line: 35, column: 47, scope: !79)
!108 = !DILocation(line: 35, column: 2, scope: !79)
!109 = distinct !{!109, !81, !110}
!110 = !DILocation(line: 42, column: 2, scope: !76)
!111 = !DILocation(line: 44, column: 2, scope: !69)
!112 = !DILocation(line: 46, column: 7, scope: !113)
!113 = distinct !DILexicalBlock(scope: !69, file: !3, line: 46, column: 2)
!114 = !DILocation(line: 46, column: 6, scope: !113)
!115 = !DILocation(line: 46, column: 10, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !3, line: 46, column: 2)
!117 = !DILocation(line: 46, column: 11, scope: !116)
!118 = !DILocation(line: 46, column: 2, scope: !113)
!119 = !DILocation(line: 48, column: 41, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !3, line: 47, column: 2)
!121 = !DILocation(line: 48, column: 35, scope: !120)
!122 = !DILocation(line: 48, column: 44, scope: !120)
!123 = !DILocation(line: 48, column: 54, scope: !120)
!124 = !DILocation(line: 48, column: 48, scope: !120)
!125 = !DILocation(line: 48, column: 57, scope: !120)
!126 = !DILocation(line: 48, column: 3, scope: !120)
!127 = !DILocation(line: 50, column: 3, scope: !120)
!128 = !DILocation(line: 50, column: 15, scope: !120)
!129 = !DILocation(line: 50, column: 9, scope: !120)
!130 = !DILocation(line: 50, column: 18, scope: !120)
!131 = !DILocation(line: 50, column: 22, scope: !120)
!132 = !DILocation(line: 51, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !3, line: 50, column: 27)
!134 = !DILocation(line: 51, column: 24, scope: !133)
!135 = !DILocation(line: 51, column: 33, scope: !133)
!136 = !DILocation(line: 51, column: 44, scope: !133)
!137 = !DILocation(line: 51, column: 38, scope: !133)
!138 = !DILocation(line: 51, column: 47, scope: !133)
!139 = !DILocation(line: 51, column: 18, scope: !133)
!140 = !DILocation(line: 51, column: 4, scope: !133)
!141 = distinct !{!141, !127, !142}
!142 = !DILocation(line: 52, column: 4, scope: !120)
!143 = !DILocation(line: 53, column: 2, scope: !120)
!144 = !DILocation(line: 46, column: 44, scope: !116)
!145 = !DILocation(line: 46, column: 2, scope: !116)
!146 = distinct !{!146, !118, !147}
!147 = !DILocation(line: 53, column: 2, scope: !113)
!148 = !DILocation(line: 55, column: 2, scope: !69)
!149 = !DILocation(line: 57, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !69, file: !3, line: 57, column: 2)
!151 = !DILocation(line: 57, column: 6, scope: !150)
!152 = !DILocation(line: 57, column: 10, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !3, line: 57, column: 2)
!154 = !DILocation(line: 57, column: 11, scope: !153)
!155 = !DILocation(line: 57, column: 2, scope: !150)
!156 = !DILocation(line: 59, column: 38, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !3, line: 58, column: 2)
!158 = !DILocation(line: 59, column: 35, scope: !157)
!159 = !DILocation(line: 59, column: 41, scope: !157)
!160 = !DILocation(line: 59, column: 48, scope: !157)
!161 = !DILocation(line: 59, column: 45, scope: !157)
!162 = !DILocation(line: 59, column: 51, scope: !157)
!163 = !DILocation(line: 59, column: 3, scope: !157)
!164 = !DILocation(line: 61, column: 3, scope: !157)
!165 = !DILocation(line: 61, column: 12, scope: !157)
!166 = !DILocation(line: 61, column: 9, scope: !157)
!167 = !DILocation(line: 61, column: 15, scope: !157)
!168 = !DILocation(line: 61, column: 19, scope: !157)
!169 = !DILocation(line: 62, column: 27, scope: !170)
!170 = distinct !DILexicalBlock(scope: !157, file: !3, line: 61, column: 24)
!171 = !DILocation(line: 62, column: 24, scope: !170)
!172 = !DILocation(line: 62, column: 30, scope: !170)
!173 = !DILocation(line: 62, column: 38, scope: !170)
!174 = !DILocation(line: 62, column: 35, scope: !170)
!175 = !DILocation(line: 62, column: 41, scope: !170)
!176 = !DILocation(line: 62, column: 18, scope: !170)
!177 = !DILocation(line: 62, column: 4, scope: !170)
!178 = distinct !{!178, !164, !179}
!179 = !DILocation(line: 63, column: 4, scope: !157)
!180 = !DILocation(line: 64, column: 2, scope: !157)
!181 = !DILocation(line: 57, column: 41, scope: !153)
!182 = !DILocation(line: 57, column: 2, scope: !153)
!183 = distinct !{!183, !155, !184}
!184 = !DILocation(line: 64, column: 2, scope: !150)
!185 = !DILocation(line: 68, column: 2, scope: !69)
