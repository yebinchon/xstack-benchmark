; ModuleID = 'average-loop-length.ll'
source_filename = "average-loop-length.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c" n\09avg\09exp.\09diff\0A-------------------------------\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"%2d %8.4f %8.4f %6.3f%%\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @factorial(i32 %n) #0 !dbg !9 {
entry:
  %n.addr = alloca i32, align 4
  %f = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata double* %f, metadata !15, metadata !DIExpression()), !dbg !16
  store double 1.000000e+00, double* %f, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %1 = load i32, i32* %n.addr, align 4, !dbg !24
  %cmp = icmp sle i32 %0, %1, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !27
  %conv = sitofp i32 %2 to double, !dbg !27
  %3 = load double, double* %f, align 8, !dbg !28
  %mul = fmul double %3, %conv, !dbg !28
  store double %mul, double* %f, align 8, !dbg !28
  br label %for.inc, !dbg !29

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !30
  %inc = add nsw i32 %4, 1, !dbg !30
  store i32 %inc, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !31, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  %5 = load double, double* %f, align 8, !dbg !34
  ret double %5, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @expected(i32 %n) #0 !dbg !36 {
entry:
  %n.addr = alloca i32, align 4
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata double* %sum, metadata !39, metadata !DIExpression()), !dbg !40
  store double 0.000000e+00, double* %sum, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 1, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !46
  %1 = load i32, i32* %n.addr, align 4, !dbg !48
  %cmp = icmp sle i32 %0, %1, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %n.addr, align 4, !dbg !51
  %call = call double @factorial(i32 %2), !dbg !52
  %3 = load i32, i32* %n.addr, align 4, !dbg !53
  %conv = sitofp i32 %3 to double, !dbg !53
  %4 = load i32, i32* %i, align 4, !dbg !54
  %conv1 = sitofp i32 %4 to double, !dbg !54
  %call2 = call double @pow(double %conv, double %conv1) #4, !dbg !55
  %div = fdiv double %call, %call2, !dbg !56
  %5 = load i32, i32* %n.addr, align 4, !dbg !57
  %6 = load i32, i32* %i, align 4, !dbg !58
  %sub = sub nsw i32 %5, %6, !dbg !59
  %call3 = call double @factorial(i32 %sub), !dbg !60
  %div4 = fdiv double %div, %call3, !dbg !61
  %7 = load double, double* %sum, align 8, !dbg !62
  %add = fadd double %7, %div4, !dbg !62
  store double %add, double* %sum, align 8, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !64
  %inc = add nsw i32 %8, 1, !dbg !64
  store i32 %inc, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load double, double* %sum, align 8, !dbg !68
  ret double %9, !dbg !69
}

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @randint(i32 %n) #0 !dbg !70 {
entry:
  %n.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %rmax = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %r, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %rmax, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32, i32* %n.addr, align 4, !dbg !79
  %div = sdiv i32 2147483647, %0, !dbg !80
  %1 = load i32, i32* %n.addr, align 4, !dbg !81
  %mul = mul nsw i32 %div, %1, !dbg !82
  store i32 %mul, i32* %rmax, align 4, !dbg !78
  br label %while.cond, !dbg !83

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #4, !dbg !84
  store i32 %call, i32* %r, align 4, !dbg !85
  %2 = load i32, i32* %rmax, align 4, !dbg !86
  %cmp = icmp sge i32 %call, %2, !dbg !87
  br i1 %cmp, label %while.body, label %while.end, !dbg !83

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !83, !llvm.loop !88

while.end:                                        ; preds = %while.cond
  %3 = load i32, i32* %r, align 4, !dbg !90
  %4 = load i32, i32* %n.addr, align 4, !dbg !91
  %div1 = sdiv i32 2147483647, %4, !dbg !92
  %div2 = sdiv i32 %3, %div1, !dbg !93
  ret i32 %div2, !dbg !94
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test(i32 %n, i32 %times) #0 !dbg !95 {
entry:
  %n.addr = alloca i32, align 4
  %times.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %x = alloca i32, align 4
  %bits = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 %times, i32* %times.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %times.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %i, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %count, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 0, i32* %count, align 4, !dbg !105
  store i32 0, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !109
  %1 = load i32, i32* %times.addr, align 4, !dbg !111
  %cmp = icmp slt i32 %0, %1, !dbg !112
  br i1 %cmp, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %x, metadata !114, metadata !DIExpression()), !dbg !116
  store i32 1, i32* %x, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %bits, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %bits, align 4, !dbg !118
  br label %while.cond, !dbg !119

while.cond:                                       ; preds = %while.body, %for.body
  %2 = load i32, i32* %bits, align 4, !dbg !120
  %3 = load i32, i32* %x, align 4, !dbg !121
  %and = and i32 %2, %3, !dbg !122
  %tobool = icmp ne i32 %and, 0, !dbg !123
  %lnot = xor i1 %tobool, true, !dbg !123
  br i1 %lnot, label %while.body, label %while.end, !dbg !119

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %count, align 4, !dbg !124
  %inc = add nsw i32 %4, 1, !dbg !124
  store i32 %inc, i32* %count, align 4, !dbg !124
  %5 = load i32, i32* %x, align 4, !dbg !126
  %6 = load i32, i32* %bits, align 4, !dbg !127
  %or = or i32 %6, %5, !dbg !127
  store i32 %or, i32* %bits, align 4, !dbg !127
  %7 = load i32, i32* %n.addr, align 4, !dbg !128
  %call = call i32 @randint(i32 %7), !dbg !129
  %shl = shl i32 1, %call, !dbg !130
  store i32 %shl, i32* %x, align 4, !dbg !131
  br label %while.cond, !dbg !119, !llvm.loop !132

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %while.end
  %8 = load i32, i32* %i, align 4, !dbg !135
  %inc1 = add nsw i32 %8, 1, !dbg !135
  store i32 %inc1, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %count, align 4, !dbg !139
  ret i32 %9, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !141 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %cnt = alloca i32, align 4
  %avg = alloca double, align 8
  %theory = alloca double, align 8
  %diff = alloca double, align 8
  store i32 0, i32* %retval, align 4
  %call = call i64 @time(i64* null) #4, !dbg !144
  %conv = trunc i64 %call to i32, !dbg !144
  call void @srand(i32 %conv) #4, !dbg !145
  %call1 = call i32 @puts(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0)), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %n, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 1, i32* %n, align 4, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %n, align 4, !dbg !152
  %cmp = icmp sle i32 %0, 20, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !156, metadata !DIExpression()), !dbg !158
  %1 = load i32, i32* %n, align 4, !dbg !159
  %call3 = call i32 @test(i32 %1, i32 1000000), !dbg !160
  store i32 %call3, i32* %cnt, align 4, !dbg !158
  call void @llvm.dbg.declare(metadata double* %avg, metadata !161, metadata !DIExpression()), !dbg !162
  %2 = load i32, i32* %cnt, align 4, !dbg !163
  %conv4 = sitofp i32 %2 to double, !dbg !164
  %div = fdiv double %conv4, 1.000000e+06, !dbg !165
  store double %div, double* %avg, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata double* %theory, metadata !166, metadata !DIExpression()), !dbg !167
  %3 = load i32, i32* %n, align 4, !dbg !168
  %call5 = call double @expected(i32 %3), !dbg !169
  store double %call5, double* %theory, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata double* %diff, metadata !170, metadata !DIExpression()), !dbg !171
  %4 = load double, double* %avg, align 8, !dbg !172
  %5 = load double, double* %theory, align 8, !dbg !173
  %div6 = fdiv double %4, %5, !dbg !174
  %sub = fsub double %div6, 1.000000e+00, !dbg !175
  %mul = fmul double %sub, 1.000000e+02, !dbg !176
  store double %mul, double* %diff, align 8, !dbg !171
  %6 = load i32, i32* %n, align 4, !dbg !177
  %7 = load double, double* %avg, align 8, !dbg !178
  %8 = load double, double* %theory, align 8, !dbg !179
  %9 = load double, double* %diff, align 8, !dbg !180
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 %6, double %7, double %8, double %9), !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %n, align 4, !dbg !183
  %inc = add nsw i32 %10, 1, !dbg !183
  store i32 %inc, i32* %n, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !187
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local i32 @puts(i8*) #3

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "average-loop-length.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Average-loop-length")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 9, type: !10, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!4, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !9, file: !1, line: 9, type: !12)
!14 = !DILocation(line: 9, column: 22, scope: !9)
!15 = !DILocalVariable(name: "f", scope: !9, file: !1, line: 10, type: !4)
!16 = !DILocation(line: 10, column: 9, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 11, type: !12)
!18 = !DILocation(line: 11, column: 6, scope: !9)
!19 = !DILocation(line: 12, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 2)
!21 = !DILocation(line: 12, column: 7, scope: !20)
!22 = !DILocation(line: 12, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !1, line: 12, column: 2)
!24 = !DILocation(line: 12, column: 19, scope: !23)
!25 = !DILocation(line: 12, column: 16, scope: !23)
!26 = !DILocation(line: 12, column: 2, scope: !20)
!27 = !DILocation(line: 12, column: 32, scope: !23)
!28 = !DILocation(line: 12, column: 29, scope: !23)
!29 = !DILocation(line: 12, column: 27, scope: !23)
!30 = !DILocation(line: 12, column: 23, scope: !23)
!31 = !DILocation(line: 12, column: 2, scope: !23)
!32 = distinct !{!32, !26, !33}
!33 = !DILocation(line: 12, column: 32, scope: !20)
!34 = !DILocation(line: 13, column: 9, scope: !9)
!35 = !DILocation(line: 13, column: 2, scope: !9)
!36 = distinct !DISubprogram(name: "expected", scope: !1, file: !1, line: 16, type: !10, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "n", arg: 1, scope: !36, file: !1, line: 16, type: !12)
!38 = !DILocation(line: 16, column: 21, scope: !36)
!39 = !DILocalVariable(name: "sum", scope: !36, file: !1, line: 17, type: !4)
!40 = !DILocation(line: 17, column: 9, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 18, type: !12)
!42 = !DILocation(line: 18, column: 6, scope: !36)
!43 = !DILocation(line: 19, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !1, line: 19, column: 2)
!45 = !DILocation(line: 19, column: 7, scope: !44)
!46 = !DILocation(line: 19, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 19, column: 2)
!48 = !DILocation(line: 19, column: 19, scope: !47)
!49 = !DILocation(line: 19, column: 16, scope: !47)
!50 = !DILocation(line: 19, column: 2, scope: !44)
!51 = !DILocation(line: 20, column: 20, scope: !47)
!52 = !DILocation(line: 20, column: 10, scope: !47)
!53 = !DILocation(line: 20, column: 29, scope: !47)
!54 = !DILocation(line: 20, column: 32, scope: !47)
!55 = !DILocation(line: 20, column: 25, scope: !47)
!56 = !DILocation(line: 20, column: 23, scope: !47)
!57 = !DILocation(line: 20, column: 47, scope: !47)
!58 = !DILocation(line: 20, column: 51, scope: !47)
!59 = !DILocation(line: 20, column: 49, scope: !47)
!60 = !DILocation(line: 20, column: 37, scope: !47)
!61 = !DILocation(line: 20, column: 35, scope: !47)
!62 = !DILocation(line: 20, column: 7, scope: !47)
!63 = !DILocation(line: 20, column: 3, scope: !47)
!64 = !DILocation(line: 19, column: 23, scope: !47)
!65 = !DILocation(line: 19, column: 2, scope: !47)
!66 = distinct !{!66, !50, !67}
!67 = !DILocation(line: 20, column: 52, scope: !44)
!68 = !DILocation(line: 21, column: 9, scope: !36)
!69 = !DILocation(line: 21, column: 2, scope: !36)
!70 = distinct !DISubprogram(name: "randint", scope: !1, file: !1, line: 24, type: !71, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!12, !12}
!73 = !DILocalVariable(name: "n", arg: 1, scope: !70, file: !1, line: 24, type: !12)
!74 = !DILocation(line: 24, column: 17, scope: !70)
!75 = !DILocalVariable(name: "r", scope: !70, file: !1, line: 25, type: !12)
!76 = !DILocation(line: 25, column: 6, scope: !70)
!77 = !DILocalVariable(name: "rmax", scope: !70, file: !1, line: 25, type: !12)
!78 = !DILocation(line: 25, column: 9, scope: !70)
!79 = !DILocation(line: 25, column: 27, scope: !70)
!80 = !DILocation(line: 25, column: 25, scope: !70)
!81 = !DILocation(line: 25, column: 31, scope: !70)
!82 = !DILocation(line: 25, column: 29, scope: !70)
!83 = !DILocation(line: 26, column: 2, scope: !70)
!84 = !DILocation(line: 26, column: 14, scope: !70)
!85 = !DILocation(line: 26, column: 12, scope: !70)
!86 = !DILocation(line: 26, column: 25, scope: !70)
!87 = !DILocation(line: 26, column: 22, scope: !70)
!88 = distinct !{!88, !83, !89}
!89 = !DILocation(line: 26, column: 30, scope: !70)
!90 = !DILocation(line: 27, column: 9, scope: !70)
!91 = !DILocation(line: 27, column: 25, scope: !70)
!92 = !DILocation(line: 27, column: 23, scope: !70)
!93 = !DILocation(line: 27, column: 11, scope: !70)
!94 = !DILocation(line: 27, column: 2, scope: !70)
!95 = distinct !DISubprogram(name: "test", scope: !1, file: !1, line: 30, type: !96, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!12, !12, !12}
!98 = !DILocalVariable(name: "n", arg: 1, scope: !95, file: !1, line: 30, type: !12)
!99 = !DILocation(line: 30, column: 14, scope: !95)
!100 = !DILocalVariable(name: "times", arg: 2, scope: !95, file: !1, line: 30, type: !12)
!101 = !DILocation(line: 30, column: 21, scope: !95)
!102 = !DILocalVariable(name: "i", scope: !95, file: !1, line: 31, type: !12)
!103 = !DILocation(line: 31, column: 6, scope: !95)
!104 = !DILocalVariable(name: "count", scope: !95, file: !1, line: 31, type: !12)
!105 = !DILocation(line: 31, column: 9, scope: !95)
!106 = !DILocation(line: 32, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !95, file: !1, line: 32, column: 2)
!108 = !DILocation(line: 32, column: 7, scope: !107)
!109 = !DILocation(line: 32, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 32, column: 2)
!111 = !DILocation(line: 32, column: 18, scope: !110)
!112 = !DILocation(line: 32, column: 16, scope: !110)
!113 = !DILocation(line: 32, column: 2, scope: !107)
!114 = !DILocalVariable(name: "x", scope: !115, file: !1, line: 33, type: !12)
!115 = distinct !DILexicalBlock(scope: !110, file: !1, line: 32, column: 30)
!116 = !DILocation(line: 33, column: 7, scope: !115)
!117 = !DILocalVariable(name: "bits", scope: !115, file: !1, line: 33, type: !12)
!118 = !DILocation(line: 33, column: 14, scope: !115)
!119 = !DILocation(line: 34, column: 3, scope: !115)
!120 = !DILocation(line: 34, column: 12, scope: !115)
!121 = !DILocation(line: 34, column: 19, scope: !115)
!122 = !DILocation(line: 34, column: 17, scope: !115)
!123 = !DILocation(line: 34, column: 10, scope: !115)
!124 = !DILocation(line: 35, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !1, line: 34, column: 23)
!126 = !DILocation(line: 36, column: 12, scope: !125)
!127 = !DILocation(line: 36, column: 9, scope: !125)
!128 = !DILocation(line: 37, column: 21, scope: !125)
!129 = !DILocation(line: 37, column: 13, scope: !125)
!130 = !DILocation(line: 37, column: 10, scope: !125)
!131 = !DILocation(line: 37, column: 6, scope: !125)
!132 = distinct !{!132, !119, !133}
!133 = !DILocation(line: 38, column: 3, scope: !115)
!134 = !DILocation(line: 39, column: 2, scope: !115)
!135 = !DILocation(line: 32, column: 26, scope: !110)
!136 = !DILocation(line: 32, column: 2, scope: !110)
!137 = distinct !{!137, !113, !138}
!138 = !DILocation(line: 39, column: 2, scope: !107)
!139 = !DILocation(line: 40, column: 9, scope: !95)
!140 = !DILocation(line: 40, column: 2, scope: !95)
!141 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 43, type: !142, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DISubroutineType(types: !143)
!143 = !{!12}
!144 = !DILocation(line: 44, column: 8, scope: !141)
!145 = !DILocation(line: 44, column: 2, scope: !141)
!146 = !DILocation(line: 45, column: 2, scope: !141)
!147 = !DILocalVariable(name: "n", scope: !141, file: !1, line: 47, type: !12)
!148 = !DILocation(line: 47, column: 6, scope: !141)
!149 = !DILocation(line: 48, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !141, file: !1, line: 48, column: 2)
!151 = !DILocation(line: 48, column: 7, scope: !150)
!152 = !DILocation(line: 48, column: 14, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !1, line: 48, column: 2)
!154 = !DILocation(line: 48, column: 16, scope: !153)
!155 = !DILocation(line: 48, column: 2, scope: !150)
!156 = !DILocalVariable(name: "cnt", scope: !157, file: !1, line: 49, type: !12)
!157 = distinct !DILexicalBlock(scope: !153, file: !1, line: 48, column: 31)
!158 = !DILocation(line: 49, column: 7, scope: !157)
!159 = !DILocation(line: 49, column: 18, scope: !157)
!160 = !DILocation(line: 49, column: 13, scope: !157)
!161 = !DILocalVariable(name: "avg", scope: !157, file: !1, line: 50, type: !4)
!162 = !DILocation(line: 50, column: 10, scope: !157)
!163 = !DILocation(line: 50, column: 24, scope: !157)
!164 = !DILocation(line: 50, column: 16, scope: !157)
!165 = !DILocation(line: 50, column: 28, scope: !157)
!166 = !DILocalVariable(name: "theory", scope: !157, file: !1, line: 51, type: !4)
!167 = !DILocation(line: 51, column: 10, scope: !157)
!168 = !DILocation(line: 51, column: 28, scope: !157)
!169 = !DILocation(line: 51, column: 19, scope: !157)
!170 = !DILocalVariable(name: "diff", scope: !157, file: !1, line: 52, type: !4)
!171 = !DILocation(line: 52, column: 10, scope: !157)
!172 = !DILocation(line: 52, column: 18, scope: !157)
!173 = !DILocation(line: 52, column: 24, scope: !157)
!174 = !DILocation(line: 52, column: 22, scope: !157)
!175 = !DILocation(line: 52, column: 31, scope: !157)
!176 = !DILocation(line: 52, column: 36, scope: !157)
!177 = !DILocation(line: 53, column: 39, scope: !157)
!178 = !DILocation(line: 53, column: 42, scope: !157)
!179 = !DILocation(line: 53, column: 47, scope: !157)
!180 = !DILocation(line: 53, column: 55, scope: !157)
!181 = !DILocation(line: 53, column: 3, scope: !157)
!182 = !DILocation(line: 54, column: 2, scope: !157)
!183 = !DILocation(line: 48, column: 27, scope: !153)
!184 = !DILocation(line: 48, column: 2, scope: !153)
!185 = distinct !{!185, !155, !186}
!186 = !DILocation(line: 54, column: 2, scope: !150)
!187 = !DILocation(line: 55, column: 2, scope: !141)
