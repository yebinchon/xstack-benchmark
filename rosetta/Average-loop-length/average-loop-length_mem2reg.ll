; ModuleID = 'average-loop-length.ll'
source_filename = "average-loop-length.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c" n\09avg\09exp.\09diff\0A-------------------------------\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"%2d %8.4f %8.4f %6.3f%%\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @factorial(i32 %n) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double 1.000000e+00, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 1, metadata !16, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !17

for.cond:                                         ; preds = %for.inc, %entry
  %f.0 = phi double [ 1.000000e+00, %entry ], [ %mul, %for.inc ], !dbg !14
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !19
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double %f.0, metadata !15, metadata !DIExpression()), !dbg !14
  %cmp = icmp sle i32 %i.0, %n, !dbg !20
  br i1 %cmp, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %conv = sitofp i32 %i.0 to double, !dbg !23
  %mul = fmul double %f.0, %conv, !dbg !24
  call void @llvm.dbg.value(metadata double %mul, metadata !15, metadata !DIExpression()), !dbg !14
  br label %for.inc, !dbg !25

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !26
  call void @llvm.dbg.value(metadata i32 %inc, metadata !16, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !27, !llvm.loop !28

for.end:                                          ; preds = %for.cond
  ret double %f.0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @expected(i32 %n) #0 !dbg !31 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !34, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i32 1, metadata !35, metadata !DIExpression()), !dbg !33
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !33
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !38
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !35, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata double %sum.0, metadata !34, metadata !DIExpression()), !dbg !33
  %cmp = icmp sle i32 %i.0, %n, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %call = call double @factorial(i32 %n), !dbg !42
  %conv = sitofp i32 %n to double, !dbg !43
  %conv1 = sitofp i32 %i.0 to double, !dbg !44
  %call2 = call double @pow(double %conv, double %conv1) #4, !dbg !45
  %div = fdiv double %call, %call2, !dbg !46
  %sub = sub nsw i32 %n, %i.0, !dbg !47
  %call3 = call double @factorial(i32 %sub), !dbg !48
  %div4 = fdiv double %div, %call3, !dbg !49
  %add = fadd double %sum.0, %div4, !dbg !50
  call void @llvm.dbg.value(metadata double %add, metadata !34, metadata !DIExpression()), !dbg !33
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata i32 %inc, metadata !35, metadata !DIExpression()), !dbg !33
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  ret double %sum.0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @randint(i32 %n) #0 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !60, metadata !DIExpression()), !dbg !61
  %div = sdiv i32 2147483647, %n, !dbg !62
  %mul = mul nsw i32 %div, %n, !dbg !63
  call void @llvm.dbg.value(metadata i32 %mul, metadata !64, metadata !DIExpression()), !dbg !61
  br label %while.cond, !dbg !65

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #4, !dbg !66
  call void @llvm.dbg.value(metadata i32 %call, metadata !67, metadata !DIExpression()), !dbg !61
  %cmp = icmp sge i32 %call, %mul, !dbg !68
  br i1 %cmp, label %while.body, label %while.end, !dbg !65

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !65, !llvm.loop !69

while.end:                                        ; preds = %while.cond
  %div1 = sdiv i32 2147483647, %n, !dbg !71
  %div2 = sdiv i32 %call, %div1, !dbg !72
  ret i32 %div2, !dbg !73
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test(i32 %n, i32 %times) #0 !dbg !74 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata i32 %times, metadata !79, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata i32 0, metadata !81, metadata !DIExpression()), !dbg !78
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %count.0 = phi i32 [ 0, %entry ], [ %count.1, %for.inc ], !dbg !84
  %i.0 = phi i32 [ 0, %entry ], [ %inc1, %for.inc ], !dbg !85
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !81, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.value(metadata i32 %count.0, metadata !80, metadata !DIExpression()), !dbg !78
  %cmp = icmp slt i32 %i.0, %times, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 1, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !91
  br label %while.cond, !dbg !93

while.cond:                                       ; preds = %while.body, %for.body
  %count.1 = phi i32 [ %count.0, %for.body ], [ %inc, %while.body ], !dbg !78
  %x.0 = phi i32 [ 1, %for.body ], [ %shl, %while.body ], !dbg !91
  %bits.0 = phi i32 [ 0, %for.body ], [ %or, %while.body ], !dbg !91
  call void @llvm.dbg.value(metadata i32 %bits.0, metadata !92, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 %count.1, metadata !80, metadata !DIExpression()), !dbg !78
  %and = and i32 %bits.0, %x.0, !dbg !94
  %tobool = icmp ne i32 %and, 0, !dbg !95
  %lnot = xor i1 %tobool, true, !dbg !95
  br i1 %lnot, label %while.body, label %while.end, !dbg !93

while.body:                                       ; preds = %while.cond
  %inc = add nsw i32 %count.1, 1, !dbg !96
  call void @llvm.dbg.value(metadata i32 %inc, metadata !80, metadata !DIExpression()), !dbg !78
  %or = or i32 %bits.0, %x.0, !dbg !98
  call void @llvm.dbg.value(metadata i32 %or, metadata !92, metadata !DIExpression()), !dbg !91
  %call = call i32 @randint(i32 %n), !dbg !99
  %shl = shl i32 1, %call, !dbg !100
  call void @llvm.dbg.value(metadata i32 %shl, metadata !89, metadata !DIExpression()), !dbg !91
  br label %while.cond, !dbg !93, !llvm.loop !101

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %while.end
  %inc1 = add nsw i32 %i.0, 1, !dbg !104
  call void @llvm.dbg.value(metadata i32 %inc1, metadata !81, metadata !DIExpression()), !dbg !78
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  ret i32 %count.0, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !109 {
entry:
  %call = call i64 @time(i64* null) #4, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #4, !dbg !113
  %call1 = call i32 @puts(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @llvm.dbg.value(metadata i32 1, metadata !115, metadata !DIExpression()), !dbg !116
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %n.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !119
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !115, metadata !DIExpression()), !dbg !116
  %cmp = icmp sle i32 %n.0, 20, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %call3 = call i32 @test(i32 %n.0, i32 1000000), !dbg !123
  call void @llvm.dbg.value(metadata i32 %call3, metadata !125, metadata !DIExpression()), !dbg !126
  %conv4 = sitofp i32 %call3 to double, !dbg !127
  %div = fdiv double %conv4, 1.000000e+06, !dbg !128
  call void @llvm.dbg.value(metadata double %div, metadata !129, metadata !DIExpression()), !dbg !126
  %call5 = call double @expected(i32 %n.0), !dbg !130
  call void @llvm.dbg.value(metadata double %call5, metadata !131, metadata !DIExpression()), !dbg !126
  %div6 = fdiv double %div, %call5, !dbg !132
  %sub = fsub double %div6, 1.000000e+00, !dbg !133
  %mul = fmul double %sub, 1.000000e+02, !dbg !134
  call void @llvm.dbg.value(metadata double %mul, metadata !135, metadata !DIExpression()), !dbg !126
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 %n.0, double %div, double %call5, double %mul), !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %n.0, 1, !dbg !138
  call void @llvm.dbg.value(metadata i32 %inc, metadata !115, metadata !DIExpression()), !dbg !116
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !142
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local i32 @puts(i8*) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "f", scope: !9, file: !1, line: 10, type: !4)
!16 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 11, type: !12)
!17 = !DILocation(line: 12, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 2)
!19 = !DILocation(line: 0, scope: !18)
!20 = !DILocation(line: 12, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !1, line: 12, column: 2)
!22 = !DILocation(line: 12, column: 2, scope: !18)
!23 = !DILocation(line: 12, column: 32, scope: !21)
!24 = !DILocation(line: 12, column: 29, scope: !21)
!25 = !DILocation(line: 12, column: 27, scope: !21)
!26 = !DILocation(line: 12, column: 23, scope: !21)
!27 = !DILocation(line: 12, column: 2, scope: !21)
!28 = distinct !{!28, !22, !29}
!29 = !DILocation(line: 12, column: 32, scope: !18)
!30 = !DILocation(line: 13, column: 2, scope: !9)
!31 = distinct !DISubprogram(name: "expected", scope: !1, file: !1, line: 16, type: !10, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocalVariable(name: "n", arg: 1, scope: !31, file: !1, line: 16, type: !12)
!33 = !DILocation(line: 0, scope: !31)
!34 = !DILocalVariable(name: "sum", scope: !31, file: !1, line: 17, type: !4)
!35 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 18, type: !12)
!36 = !DILocation(line: 19, column: 7, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 19, column: 2)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 19, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 19, column: 2)
!41 = !DILocation(line: 19, column: 2, scope: !37)
!42 = !DILocation(line: 20, column: 10, scope: !40)
!43 = !DILocation(line: 20, column: 29, scope: !40)
!44 = !DILocation(line: 20, column: 32, scope: !40)
!45 = !DILocation(line: 20, column: 25, scope: !40)
!46 = !DILocation(line: 20, column: 23, scope: !40)
!47 = !DILocation(line: 20, column: 49, scope: !40)
!48 = !DILocation(line: 20, column: 37, scope: !40)
!49 = !DILocation(line: 20, column: 35, scope: !40)
!50 = !DILocation(line: 20, column: 7, scope: !40)
!51 = !DILocation(line: 20, column: 3, scope: !40)
!52 = !DILocation(line: 19, column: 23, scope: !40)
!53 = !DILocation(line: 19, column: 2, scope: !40)
!54 = distinct !{!54, !41, !55}
!55 = !DILocation(line: 20, column: 52, scope: !37)
!56 = !DILocation(line: 21, column: 2, scope: !31)
!57 = distinct !DISubprogram(name: "randint", scope: !1, file: !1, line: 24, type: !58, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!12, !12}
!60 = !DILocalVariable(name: "n", arg: 1, scope: !57, file: !1, line: 24, type: !12)
!61 = !DILocation(line: 0, scope: !57)
!62 = !DILocation(line: 25, column: 25, scope: !57)
!63 = !DILocation(line: 25, column: 29, scope: !57)
!64 = !DILocalVariable(name: "rmax", scope: !57, file: !1, line: 25, type: !12)
!65 = !DILocation(line: 26, column: 2, scope: !57)
!66 = !DILocation(line: 26, column: 14, scope: !57)
!67 = !DILocalVariable(name: "r", scope: !57, file: !1, line: 25, type: !12)
!68 = !DILocation(line: 26, column: 22, scope: !57)
!69 = distinct !{!69, !65, !70}
!70 = !DILocation(line: 26, column: 30, scope: !57)
!71 = !DILocation(line: 27, column: 23, scope: !57)
!72 = !DILocation(line: 27, column: 11, scope: !57)
!73 = !DILocation(line: 27, column: 2, scope: !57)
!74 = distinct !DISubprogram(name: "test", scope: !1, file: !1, line: 30, type: !75, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!12, !12, !12}
!77 = !DILocalVariable(name: "n", arg: 1, scope: !74, file: !1, line: 30, type: !12)
!78 = !DILocation(line: 0, scope: !74)
!79 = !DILocalVariable(name: "times", arg: 2, scope: !74, file: !1, line: 30, type: !12)
!80 = !DILocalVariable(name: "count", scope: !74, file: !1, line: 31, type: !12)
!81 = !DILocalVariable(name: "i", scope: !74, file: !1, line: 31, type: !12)
!82 = !DILocation(line: 32, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !1, line: 32, column: 2)
!84 = !DILocation(line: 31, column: 9, scope: !74)
!85 = !DILocation(line: 0, scope: !83)
!86 = !DILocation(line: 32, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 32, column: 2)
!88 = !DILocation(line: 32, column: 2, scope: !83)
!89 = !DILocalVariable(name: "x", scope: !90, file: !1, line: 33, type: !12)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 32, column: 30)
!91 = !DILocation(line: 0, scope: !90)
!92 = !DILocalVariable(name: "bits", scope: !90, file: !1, line: 33, type: !12)
!93 = !DILocation(line: 34, column: 3, scope: !90)
!94 = !DILocation(line: 34, column: 17, scope: !90)
!95 = !DILocation(line: 34, column: 10, scope: !90)
!96 = !DILocation(line: 35, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !1, line: 34, column: 23)
!98 = !DILocation(line: 36, column: 9, scope: !97)
!99 = !DILocation(line: 37, column: 13, scope: !97)
!100 = !DILocation(line: 37, column: 10, scope: !97)
!101 = distinct !{!101, !93, !102}
!102 = !DILocation(line: 38, column: 3, scope: !90)
!103 = !DILocation(line: 39, column: 2, scope: !90)
!104 = !DILocation(line: 32, column: 26, scope: !87)
!105 = !DILocation(line: 32, column: 2, scope: !87)
!106 = distinct !{!106, !88, !107}
!107 = !DILocation(line: 39, column: 2, scope: !83)
!108 = !DILocation(line: 40, column: 2, scope: !74)
!109 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 43, type: !110, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!12}
!112 = !DILocation(line: 44, column: 8, scope: !109)
!113 = !DILocation(line: 44, column: 2, scope: !109)
!114 = !DILocation(line: 45, column: 2, scope: !109)
!115 = !DILocalVariable(name: "n", scope: !109, file: !1, line: 47, type: !12)
!116 = !DILocation(line: 0, scope: !109)
!117 = !DILocation(line: 48, column: 7, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !1, line: 48, column: 2)
!119 = !DILocation(line: 0, scope: !118)
!120 = !DILocation(line: 48, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !1, line: 48, column: 2)
!122 = !DILocation(line: 48, column: 2, scope: !118)
!123 = !DILocation(line: 49, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 48, column: 31)
!125 = !DILocalVariable(name: "cnt", scope: !124, file: !1, line: 49, type: !12)
!126 = !DILocation(line: 0, scope: !124)
!127 = !DILocation(line: 50, column: 16, scope: !124)
!128 = !DILocation(line: 50, column: 28, scope: !124)
!129 = !DILocalVariable(name: "avg", scope: !124, file: !1, line: 50, type: !4)
!130 = !DILocation(line: 51, column: 19, scope: !124)
!131 = !DILocalVariable(name: "theory", scope: !124, file: !1, line: 51, type: !4)
!132 = !DILocation(line: 52, column: 22, scope: !124)
!133 = !DILocation(line: 52, column: 31, scope: !124)
!134 = !DILocation(line: 52, column: 36, scope: !124)
!135 = !DILocalVariable(name: "diff", scope: !124, file: !1, line: 52, type: !4)
!136 = !DILocation(line: 53, column: 3, scope: !124)
!137 = !DILocation(line: 54, column: 2, scope: !124)
!138 = !DILocation(line: 48, column: 27, scope: !121)
!139 = !DILocation(line: 48, column: 2, scope: !121)
!140 = distinct !{!140, !122, !141}
!141 = !DILocation(line: 54, column: 2, scope: !118)
!142 = !DILocation(line: 55, column: 2, scope: !109)
