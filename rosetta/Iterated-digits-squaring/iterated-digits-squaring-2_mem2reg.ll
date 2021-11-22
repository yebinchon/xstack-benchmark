; ModuleID = 'iterated-digits-squaring-2.ll'
source_filename = "iterated-digits-squaring-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@digits = dso_local constant [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %n) #0 !dbg !15 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !18, metadata !DIExpression()), !dbg !19
  %cmp = icmp eq i32 %n, 0, !dbg !20
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !21

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !21

cond.false:                                       ; preds = %entry
  %sub = sub nsw i32 %n, 1, !dbg !22
  %call = call i32 @factorial(i32 %sub), !dbg !23
  %mul = mul nsw i32 %n, %call, !dbg !24
  br label %cond.end, !dbg !21

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %mul, %cond.false ], !dbg !21
  ret i32 %cond, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sum_square_digits(i32 %n) #0 !dbg !26 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata !4, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i32 %n, metadata !34, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 0, metadata !35, metadata !DIExpression()), !dbg !31
  br label %while.cond, !dbg !36

while.cond:                                       ; preds = %while.body, %entry
  %num.0 = phi i32 [ %n, %entry ], [ %div, %while.body ], !dbg !31
  %sum.0 = phi i32 [ 0, %entry ], [ %add, %while.body ], !dbg !31
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !35, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %num.0, metadata !34, metadata !DIExpression()), !dbg !31
  %cmp = icmp sgt i32 %num.0, 0, !dbg !37
  br i1 %cmp, label %while.body, label %while.end, !dbg !36

while.body:                                       ; preds = %while.cond
  %rem = srem i32 %num.0, 10, !dbg !38
  call void @llvm.dbg.value(metadata i32 %rem, metadata !40, metadata !DIExpression()), !dbg !41
  %sub = sub nsw i32 %num.0, %rem, !dbg !42
  %div = sdiv i32 %sub, 10, !dbg !43
  call void @llvm.dbg.value(metadata i32 %div, metadata !34, metadata !DIExpression()), !dbg !31
  %mul = mul nsw i32 %rem, %rem, !dbg !44
  %add = add nsw i32 %sum.0, %mul, !dbg !45
  call void @llvm.dbg.value(metadata i32 %add, metadata !35, metadata !DIExpression()), !dbg !31
  br label %while.cond, !dbg !36, !llvm.loop !46

while.end:                                        ; preds = %while.cond
  ret i32 %sum.0, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @choose_sum_and_count_89(i32* %got, i32 %n_chosen, i32 %len, i32 %at, i32 %max_types, i32* %count89) #0 !dbg !49 {
entry:
  %digitcounts = alloca [10 x i32], align 16
  call void @llvm.dbg.value(metadata i32* %got, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %n_chosen, metadata !56, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %len, metadata !57, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %at, metadata !58, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %max_types, metadata !59, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32* %count89, metadata !60, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i64 0, metadata !61, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [10 x i32]* %digitcounts, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !68
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !65, metadata !DIExpression()), !dbg !55
  %cmp = icmp slt i32 %i.0, 10, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !72
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %inc, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %cmp1 = icmp eq i32 %n_chosen, %len, !dbg !80
  br i1 %cmp1, label %if.then, label %if.end39, !dbg !82, !cf.info !83

if.then:                                          ; preds = %for.end
  %tobool = icmp ne i32* %got, null, !dbg !84
  br i1 %tobool, label %if.end, label %if.then2, !dbg !87, !cf.info !83

if.then2:                                         ; preds = %if.then
  br label %return, !dbg !88

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 0, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond3, !dbg !91

for.cond3:                                        ; preds = %for.inc13, %if.end
  %i.1 = phi i32 [ 0, %if.end ], [ %inc14, %for.inc13 ], !dbg !93
  %sum.0 = phi i32 [ 0, %if.end ], [ %add, %for.inc13 ], !dbg !90
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !65, metadata !DIExpression()), !dbg !55
  %cmp4 = icmp slt i32 %i.1, %len, !dbg !94
  br i1 %cmp4, label %for.body5, label %for.end15, !dbg !96

for.body5:                                        ; preds = %for.cond3
  %idxprom6 = sext i32 %i.1 to i64, !dbg !97
  %arrayidx7 = getelementptr inbounds i32, i32* %got, i64 %idxprom6, !dbg !97
  %0 = load i32, i32* %arrayidx7, align 4, !dbg !97
  %idxprom8 = sext i32 %0 to i64, !dbg !99
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* @digits, i64 0, i64 %idxprom8, !dbg !99
  %1 = load i32, i32* %arrayidx9, align 4, !dbg !99
  call void @llvm.dbg.value(metadata i32 %1, metadata !100, metadata !DIExpression()), !dbg !101
  %idxprom10 = sext i32 %1 to i64, !dbg !102
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom10, !dbg !102
  %2 = load i32, i32* %arrayidx11, align 4, !dbg !103
  %inc12 = add nsw i32 %2, 1, !dbg !103
  store i32 %inc12, i32* %arrayidx11, align 4, !dbg !103
  %mul = mul nsw i32 %1, %1, !dbg !104
  %add = add nsw i32 %sum.0, %mul, !dbg !105
  call void @llvm.dbg.value(metadata i32 %add, metadata !89, metadata !DIExpression()), !dbg !90
  br label %for.inc13, !dbg !106

for.inc13:                                        ; preds = %for.body5
  %inc14 = add nsw i32 %i.1, 1, !dbg !107
  call void @llvm.dbg.value(metadata i32 %inc14, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond3, !dbg !108, !llvm.loop !109

for.end15:                                        ; preds = %for.cond3
  %cmp16 = icmp eq i32 %sum.0, 0, !dbg !111
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !113, !cf.info !83

if.then17:                                        ; preds = %for.end15
  br label %return, !dbg !114

if.end18:                                         ; preds = %for.end15
  %cmp19 = icmp ne i32 %sum.0, 1, !dbg !116
  br i1 %cmp19, label %land.lhs.true, label %if.end24, !dbg !118, !cf.info !83

land.lhs.true:                                    ; preds = %if.end18
  %cmp20 = icmp ne i32 %sum.0, 89, !dbg !119
  br i1 %cmp20, label %if.then21, label %if.end24, !dbg !120, !cf.info !83

if.then21:                                        ; preds = %land.lhs.true
  br label %while.cond, !dbg !121

while.cond:                                       ; preds = %while.body, %if.then21
  %sum.1 = phi i32 [ %sum.0, %if.then21 ], [ %call, %while.body ], !dbg !90
  call void @llvm.dbg.value(metadata i32 %sum.1, metadata !89, metadata !DIExpression()), !dbg !90
  %cmp22 = icmp ne i32 %sum.1, 1, !dbg !123
  br i1 %cmp22, label %land.rhs, label %land.end, !dbg !124

land.rhs:                                         ; preds = %while.cond
  %cmp23 = icmp ne i32 %sum.1, 89, !dbg !125
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp23, %land.rhs ], !dbg !126
  br i1 %3, label %while.body, label %while.end, !dbg !121

while.body:                                       ; preds = %land.end
  %call = call i32 @sum_square_digits(i32 %sum.1), !dbg !127
  call void @llvm.dbg.value(metadata i32 %call, metadata !89, metadata !DIExpression()), !dbg !90
  br label %while.cond, !dbg !121, !llvm.loop !129

while.end:                                        ; preds = %land.end
  br label %if.end24, !dbg !131

if.end24:                                         ; preds = %while.end, %land.lhs.true, %if.end18
  %sum.2 = phi i32 [ %sum.1, %while.end ], [ %sum.0, %land.lhs.true ], [ %sum.0, %if.end18 ], !dbg !132
  call void @llvm.dbg.value(metadata i32 %sum.2, metadata !89, metadata !DIExpression()), !dbg !90
  %cmp25 = icmp eq i32 %sum.2, 89, !dbg !133
  br i1 %cmp25, label %if.then26, label %if.end38, !dbg !135, !cf.info !83

if.then26:                                        ; preds = %if.end24
  %call27 = call i32 @factorial(i32 %len), !dbg !136
  call void @llvm.dbg.value(metadata i32 %call27, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond28, !dbg !140

for.cond28:                                       ; preds = %for.inc34, %if.then26
  %i.2 = phi i32 [ 0, %if.then26 ], [ %inc35, %for.inc34 ], !dbg !142
  %count_this_comb.0 = phi i32 [ %call27, %if.then26 ], [ %div, %for.inc34 ], !dbg !139
  call void @llvm.dbg.value(metadata i32 %count_this_comb.0, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !65, metadata !DIExpression()), !dbg !55
  %cmp29 = icmp slt i32 %i.2, 10, !dbg !143
  br i1 %cmp29, label %for.body30, label %for.end36, !dbg !145

for.body30:                                       ; preds = %for.cond28
  %idxprom31 = sext i32 %i.2 to i64, !dbg !146
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %digitcounts, i64 0, i64 %idxprom31, !dbg !146
  %4 = load i32, i32* %arrayidx32, align 4, !dbg !146
  %call33 = call i32 @factorial(i32 %4), !dbg !148
  %div = sdiv i32 %count_this_comb.0, %call33, !dbg !149
  call void @llvm.dbg.value(metadata i32 %div, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.inc34, !dbg !150

for.inc34:                                        ; preds = %for.body30
  %inc35 = add nsw i32 %i.2, 1, !dbg !151
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond28, !dbg !152, !llvm.loop !153

for.end36:                                        ; preds = %for.cond28
  %5 = load i32, i32* %count89, align 4, !dbg !155
  %add37 = add nsw i32 %5, %count_this_comb.0, !dbg !155
  store i32 %add37, i32* %count89, align 4, !dbg !155
  br label %if.end38, !dbg !156

if.end38:                                         ; preds = %for.end36, %if.end24
  br label %return, !dbg !157

if.end39:                                         ; preds = %for.end
  call void @llvm.dbg.value(metadata i32 %at, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond40, !dbg !158

for.cond40:                                       ; preds = %for.inc51, %if.end39
  %i.3 = phi i32 [ %at, %if.end39 ], [ %inc52, %for.inc51 ], !dbg !160
  %count.0 = phi i64 [ 0, %if.end39 ], [ %add50, %for.inc51 ], !dbg !55
  call void @llvm.dbg.value(metadata i64 %count.0, metadata !61, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !65, metadata !DIExpression()), !dbg !55
  %cmp41 = icmp slt i32 %i.3, %max_types, !dbg !161
  br i1 %cmp41, label %for.body42, label %for.end53, !dbg !163

for.body42:                                       ; preds = %for.cond40
  %tobool43 = icmp ne i32* %got, null, !dbg !164
  br i1 %tobool43, label %if.then44, label %if.end47, !dbg !167, !cf.info !83

if.then44:                                        ; preds = %for.body42
  %idxprom45 = sext i32 %n_chosen to i64, !dbg !168
  %arrayidx46 = getelementptr inbounds i32, i32* %got, i64 %idxprom45, !dbg !168
  store i32 %i.3, i32* %arrayidx46, align 4, !dbg !169
  br label %if.end47, !dbg !168

if.end47:                                         ; preds = %if.then44, %for.body42
  %add48 = add nsw i32 %n_chosen, 1, !dbg !170
  %call49 = call i64 @choose_sum_and_count_89(i32* %got, i32 %add48, i32 %len, i32 %i.3, i32 %max_types, i32* %count89), !dbg !171
  %add50 = add nsw i64 %count.0, %call49, !dbg !172
  call void @llvm.dbg.value(metadata i64 %add50, metadata !61, metadata !DIExpression()), !dbg !55
  br label %for.inc51, !dbg !173

for.inc51:                                        ; preds = %if.end47
  %inc52 = add nsw i32 %i.3, 1, !dbg !174
  call void @llvm.dbg.value(metadata i32 %inc52, metadata !65, metadata !DIExpression()), !dbg !55
  br label %for.cond40, !dbg !175, !llvm.loop !176

for.end53:                                        ; preds = %for.cond40
  br label %return, !dbg !178

return:                                           ; preds = %for.end53, %if.end38, %if.then17, %if.then2
  %retval.0 = phi i64 [ 1, %if.then17 ], [ 1, %if.end38 ], [ 1, %if.then2 ], [ %count.0, %for.end53 ], !dbg !55
  ret i64 %retval.0, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !180 {
entry:
  %chosen = alloca [10 x i32], align 16
  %count = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %chosen, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %count, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 0, i32* %count, align 4, !dbg !186
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %chosen, i64 0, i64 0, !dbg !187
  %call = call i64 @choose_sum_and_count_89(i32* %arraydecay, i32 0, i32 8, i32 0, i32 10, i32* %count), !dbg !188
  %0 = load i32, i32* %count, align 4, !dbg !189
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !190
  ret i32 0, !dbg !191
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "digits", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "iterated-digits-squaring-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Iterated-digits-squaring")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !9)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{!10}
!10 = !DISubrange(count: 10)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "factorial", scope: !3, file: !3, line: 6, type: !16, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!8, !8}
!18 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !3, line: 6, type: !8)
!19 = !DILocation(line: 0, scope: !15)
!20 = !DILocation(line: 7, column: 14, scope: !15)
!21 = !DILocation(line: 7, column: 12, scope: !15)
!22 = !DILocation(line: 7, column: 41, scope: !15)
!23 = !DILocation(line: 7, column: 29, scope: !15)
!24 = !DILocation(line: 7, column: 27, scope: !15)
!25 = !DILocation(line: 7, column: 5, scope: !15)
!26 = distinct !DISubprogram(name: "sum_square_digits", scope: !3, file: !3, line: 11, type: !27, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !29}
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DILocalVariable(name: "n", arg: 1, scope: !26, file: !3, line: 11, type: !29)
!31 = !DILocation(line: 0, scope: !26)
!32 = !DILocalVariable(name: "i", scope: !26, file: !3, line: 12, type: !8)
!33 = !DILocation(line: 12, column: 13, scope: !26)
!34 = !DILocalVariable(name: "num", scope: !26, file: !3, line: 12, type: !8)
!35 = !DILocalVariable(name: "sum", scope: !26, file: !3, line: 12, type: !8)
!36 = !DILocation(line: 14, column: 9, scope: !26)
!37 = !DILocation(line: 14, column: 20, scope: !26)
!38 = !DILocation(line: 16, column: 31, scope: !39)
!39 = distinct !DILexicalBlock(scope: !26, file: !3, line: 14, column: 25)
!40 = !DILocalVariable(name: "digit", scope: !39, file: !3, line: 16, type: !8)
!41 = !DILocation(line: 0, scope: !39)
!42 = !DILocation(line: 17, column: 26, scope: !39)
!43 = !DILocation(line: 17, column: 34, scope: !39)
!44 = !DILocation(line: 19, column: 30, scope: !39)
!45 = !DILocation(line: 19, column: 24, scope: !39)
!46 = distinct !{!46, !36, !47}
!47 = !DILocation(line: 20, column: 9, scope: !26)
!48 = !DILocation(line: 21, column: 9, scope: !26)
!49 = distinct !DISubprogram(name: "choose_sum_and_count_89", scope: !3, file: !3, line: 28, type: !50, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !53, !8, !8, !8, !8, !53}
!52 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!54 = !DILocalVariable(name: "got", arg: 1, scope: !49, file: !3, line: 28, type: !53)
!55 = !DILocation(line: 0, scope: !49)
!56 = !DILocalVariable(name: "n_chosen", arg: 2, scope: !49, file: !3, line: 28, type: !8)
!57 = !DILocalVariable(name: "len", arg: 3, scope: !49, file: !3, line: 28, type: !8)
!58 = !DILocalVariable(name: "at", arg: 4, scope: !49, file: !3, line: 28, type: !8)
!59 = !DILocalVariable(name: "max_types", arg: 5, scope: !49, file: !3, line: 28, type: !8)
!60 = !DILocalVariable(name: "count89", arg: 6, scope: !49, file: !3, line: 28, type: !53)
!61 = !DILocalVariable(name: "count", scope: !49, file: !3, line: 31, type: !52)
!62 = !DILocalVariable(name: "digitcounts", scope: !49, file: !3, line: 32, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !9)
!64 = !DILocation(line: 32, column: 13, scope: !49)
!65 = !DILocalVariable(name: "i", scope: !49, file: !3, line: 30, type: !8)
!66 = !DILocation(line: 33, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !49, file: !3, line: 33, column: 9)
!68 = !DILocation(line: 0, scope: !67)
!69 = !DILocation(line: 33, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !3, line: 33, column: 9)
!71 = !DILocation(line: 33, column: 9, scope: !67)
!72 = !DILocation(line: 34, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !3, line: 33, column: 32)
!74 = !DILocation(line: 34, column: 31, scope: !73)
!75 = !DILocation(line: 35, column: 9, scope: !73)
!76 = !DILocation(line: 33, column: 28, scope: !70)
!77 = !DILocation(line: 33, column: 9, scope: !70)
!78 = distinct !{!78, !71, !79}
!79 = !DILocation(line: 35, column: 9, scope: !67)
!80 = !DILocation(line: 36, column: 22, scope: !81)
!81 = distinct !DILexicalBlock(scope: !49, file: !3, line: 36, column: 13)
!82 = !DILocation(line: 36, column: 13, scope: !49)
!83 = !{!"if"}
!84 = !DILocation(line: 37, column: 22, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !3, line: 37, column: 21)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 36, column: 30)
!87 = !DILocation(line: 37, column: 21, scope: !86)
!88 = !DILocation(line: 37, column: 27, scope: !85)
!89 = !DILocalVariable(name: "sum", scope: !86, file: !3, line: 39, type: !8)
!90 = !DILocation(line: 0, scope: !86)
!91 = !DILocation(line: 40, column: 22, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 40, column: 17)
!93 = !DILocation(line: 0, scope: !92)
!94 = !DILocation(line: 40, column: 31, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 40, column: 17)
!96 = !DILocation(line: 40, column: 17, scope: !92)
!97 = !DILocation(line: 41, column: 42, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !3, line: 40, column: 43)
!99 = !DILocation(line: 41, column: 35, scope: !98)
!100 = !DILocalVariable(name: "digit", scope: !98, file: !3, line: 41, type: !8)
!101 = !DILocation(line: 0, scope: !98)
!102 = !DILocation(line: 42, column: 25, scope: !98)
!103 = !DILocation(line: 42, column: 43, scope: !98)
!104 = !DILocation(line: 43, column: 41, scope: !98)
!105 = !DILocation(line: 43, column: 33, scope: !98)
!106 = !DILocation(line: 44, column: 17, scope: !98)
!107 = !DILocation(line: 40, column: 39, scope: !95)
!108 = !DILocation(line: 40, column: 17, scope: !95)
!109 = distinct !{!109, !96, !110}
!110 = !DILocation(line: 44, column: 17, scope: !92)
!111 = !DILocation(line: 45, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !86, file: !3, line: 45, column: 21)
!113 = !DILocation(line: 45, column: 21, scope: !86)
!114 = !DILocation(line: 46, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 45, column: 31)
!116 = !DILocation(line: 48, column: 26, scope: !117)
!117 = distinct !DILexicalBlock(scope: !86, file: !3, line: 48, column: 21)
!118 = !DILocation(line: 48, column: 32, scope: !117)
!119 = !DILocation(line: 48, column: 40, scope: !117)
!120 = !DILocation(line: 48, column: 21, scope: !86)
!121 = !DILocation(line: 49, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !3, line: 48, column: 48)
!123 = !DILocation(line: 49, column: 37, scope: !122)
!124 = !DILocation(line: 49, column: 43, scope: !122)
!125 = !DILocation(line: 49, column: 51, scope: !122)
!126 = !DILocation(line: 0, scope: !122)
!127 = !DILocation(line: 50, column: 37, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !3, line: 49, column: 59)
!129 = distinct !{!129, !121, !130}
!130 = !DILocation(line: 51, column: 25, scope: !122)
!131 = !DILocation(line: 52, column: 17, scope: !122)
!132 = !DILocation(line: 39, column: 21, scope: !86)
!133 = !DILocation(line: 53, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !86, file: !3, line: 53, column: 21)
!135 = !DILocation(line: 53, column: 21, scope: !86)
!136 = !DILocation(line: 54, column: 45, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !3, line: 53, column: 32)
!138 = !DILocalVariable(name: "count_this_comb", scope: !137, file: !3, line: 54, type: !8)
!139 = !DILocation(line: 0, scope: !137)
!140 = !DILocation(line: 55, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !3, line: 55, column: 25)
!142 = !DILocation(line: 0, scope: !141)
!143 = !DILocation(line: 55, column: 36, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 55, column: 25)
!145 = !DILocation(line: 55, column: 25, scope: !141)
!146 = !DILocation(line: 56, column: 60, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !3, line: 55, column: 46)
!148 = !DILocation(line: 56, column: 50, scope: !147)
!149 = !DILocation(line: 56, column: 48, scope: !147)
!150 = !DILocation(line: 57, column: 25, scope: !147)
!151 = !DILocation(line: 55, column: 42, scope: !144)
!152 = !DILocation(line: 55, column: 25, scope: !144)
!153 = distinct !{!153, !145, !154}
!154 = !DILocation(line: 57, column: 25, scope: !141)
!155 = !DILocation(line: 58, column: 35, scope: !137)
!156 = !DILocation(line: 59, column: 17, scope: !137)
!157 = !DILocation(line: 61, column: 17, scope: !86)
!158 = !DILocation(line: 64, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !49, file: !3, line: 64, column: 9)
!160 = !DILocation(line: 0, scope: !159)
!161 = !DILocation(line: 64, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 64, column: 9)
!163 = !DILocation(line: 64, column: 9, scope: !159)
!164 = !DILocation(line: 65, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !3, line: 65, column: 21)
!166 = distinct !DILexicalBlock(scope: !162, file: !3, line: 64, column: 42)
!167 = !DILocation(line: 65, column: 21, scope: !166)
!168 = !DILocation(line: 65, column: 26, scope: !165)
!169 = !DILocation(line: 65, column: 40, scope: !165)
!170 = !DILocation(line: 66, column: 64, scope: !166)
!171 = !DILocation(line: 66, column: 26, scope: !166)
!172 = !DILocation(line: 66, column: 23, scope: !166)
!173 = !DILocation(line: 67, column: 9, scope: !166)
!174 = !DILocation(line: 64, column: 38, scope: !162)
!175 = !DILocation(line: 64, column: 9, scope: !162)
!176 = distinct !{!176, !163, !177}
!177 = !DILocation(line: 67, column: 9, scope: !159)
!178 = !DILocation(line: 68, column: 9, scope: !49)
!179 = !DILocation(line: 69, column: 1, scope: !49)
!180 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !181, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DISubroutineType(types: !182)
!182 = !{!8}
!183 = !DILocalVariable(name: "chosen", scope: !180, file: !3, line: 73, type: !63)
!184 = !DILocation(line: 73, column: 13, scope: !180)
!185 = !DILocalVariable(name: "count", scope: !180, file: !3, line: 74, type: !8)
!186 = !DILocation(line: 74, column: 13, scope: !180)
!187 = !DILocation(line: 79, column: 33, scope: !180)
!188 = !DILocation(line: 79, column: 9, scope: !180)
!189 = !DILocation(line: 80, column: 23, scope: !180)
!190 = !DILocation(line: 80, column: 9, scope: !180)
!191 = !DILocation(line: 81, column: 9, scope: !180)
