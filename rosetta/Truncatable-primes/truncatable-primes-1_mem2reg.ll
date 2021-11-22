; ModuleID = 'truncatable-primes-1.ll'
source_filename = "truncatable-primes-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@primes = common dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Left: %d; right: %d\0A\00", align 1
@n_primes = common dso_local global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_primes() #0 !dbg !15 {
entry:
  %call = call noalias i8* @malloc(i64 1000000) #5, !dbg !18
  store i8* %call, i8** @primes, align 8, !dbg !19
  %0 = load i8*, i8** @primes, align 8, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 1, i64 1000000, i1 false), !dbg !21
  %1 = load i8*, i8** @primes, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 1, !dbg !22
  store i8 0, i8* %arrayidx, align 1, !dbg !23
  %2 = load i8*, i8** @primes, align 8, !dbg !24
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 0, !dbg !24
  store i8 0, i8* %arrayidx1, align 1, !dbg !25
  call void @llvm.dbg.value(metadata i32 2, metadata !26, metadata !DIExpression()), !dbg !27
  br label %while.cond, !dbg !28

while.cond:                                       ; preds = %while.end, %entry
  %i.0 = phi i32 [ 2, %entry ], [ %inc, %while.end ], !dbg !27
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !26, metadata !DIExpression()), !dbg !27
  %mul = mul nsw i32 %i.0, %i.0, !dbg !29
  %cmp = icmp slt i32 %mul, 1000000, !dbg !30
  br i1 %cmp, label %while.body, label %while.end10, !dbg !28

while.body:                                       ; preds = %while.cond
  %mul2 = mul nsw i32 %i.0, 2, !dbg !31
  call void @llvm.dbg.value(metadata i32 %mul2, metadata !34, metadata !DIExpression()), !dbg !27
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %while.body
  %j.0 = phi i32 [ %mul2, %while.body ], [ %add, %for.inc ], !dbg !36
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !34, metadata !DIExpression()), !dbg !27
  %cmp3 = icmp slt i32 %j.0, 1000000, !dbg !37
  br i1 %cmp3, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** @primes, align 8, !dbg !40
  %idxprom = sext i32 %j.0 to i64, !dbg !40
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !40
  store i8 0, i8* %arrayidx4, align 1, !dbg !41
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %add = add nsw i32 %j.0, %i.0, !dbg !42
  call void @llvm.dbg.value(metadata i32 %add, metadata !34, metadata !DIExpression()), !dbg !27
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  br label %while.cond5, !dbg !46

while.cond5:                                      ; preds = %while.body9, %for.end
  %i.1 = phi i32 [ %i.0, %for.end ], [ %inc, %while.body9 ], !dbg !27
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !26, metadata !DIExpression()), !dbg !27
  %inc = add nsw i32 %i.1, 1, !dbg !47
  call void @llvm.dbg.value(metadata i32 %inc, metadata !26, metadata !DIExpression()), !dbg !27
  %cmp6 = icmp slt i32 %inc, 1000000, !dbg !48
  br i1 %cmp6, label %land.rhs, label %land.end, !dbg !49

land.rhs:                                         ; preds = %while.cond5
  %4 = load i8*, i8** @primes, align 8, !dbg !50
  %idxprom7 = sext i32 %inc to i64, !dbg !50
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %idxprom7, !dbg !50
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !50
  %tobool = icmp ne i8 %5, 0, !dbg !51
  %lnot = xor i1 %tobool, true, !dbg !51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond5
  %6 = phi i1 [ false, %while.cond5 ], [ %lnot, %land.rhs ], !dbg !52
  br i1 %6, label %while.body9, label %while.end, !dbg !46

while.body9:                                      ; preds = %land.end
  br label %while.cond5, !dbg !46, !llvm.loop !53

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !28, !llvm.loop !55

while.end10:                                      ; preds = %while.cond
  ret void, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @left_trunc(i32 %n) #0 !dbg !58 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i32 1, metadata !63, metadata !DIExpression()), !dbg !62
  br label %while.cond, !dbg !64

while.cond:                                       ; preds = %while.body, %entry
  %tens.0 = phi i32 [ 1, %entry ], [ %mul, %while.body ], !dbg !62
  call void @llvm.dbg.value(metadata i32 %tens.0, metadata !63, metadata !DIExpression()), !dbg !62
  %cmp = icmp slt i32 %tens.0, %n, !dbg !65
  br i1 %cmp, label %while.body, label %while.end, !dbg !64

while.body:                                       ; preds = %while.cond
  %mul = mul nsw i32 %tens.0, 10, !dbg !66
  call void @llvm.dbg.value(metadata i32 %mul, metadata !63, metadata !DIExpression()), !dbg !62
  br label %while.cond, !dbg !64, !llvm.loop !67

while.end:                                        ; preds = %while.cond
  br label %while.cond1, !dbg !69

while.cond1:                                      ; preds = %if.end6, %while.end
  %tens.1 = phi i32 [ %tens.0, %while.end ], [ %div, %if.end6 ], !dbg !62
  %n.addr.0 = phi i32 [ %n, %while.end ], [ %rem, %if.end6 ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.value(metadata i32 %tens.1, metadata !63, metadata !DIExpression()), !dbg !62
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !69
  br i1 %tobool, label %while.body2, label %while.end7, !dbg !69

while.body2:                                      ; preds = %while.cond1
  %0 = load i8*, i8** @primes, align 8, !dbg !70
  %idxprom = sext i32 %n.addr.0 to i64, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !70
  %1 = load i8, i8* %arrayidx, align 1, !dbg !70
  %tobool3 = icmp ne i8 %1, 0, !dbg !70
  br i1 %tobool3, label %if.end, label %if.then, !dbg !73, !cf.info !74

if.then:                                          ; preds = %while.body2
  br label %return, !dbg !75

if.end:                                           ; preds = %while.body2
  %div = sdiv i32 %tens.1, 10, !dbg !76
  call void @llvm.dbg.value(metadata i32 %div, metadata !63, metadata !DIExpression()), !dbg !62
  %cmp4 = icmp slt i32 %n.addr.0, %div, !dbg !77
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !79, !cf.info !74

if.then5:                                         ; preds = %if.end
  br label %return, !dbg !80

if.end6:                                          ; preds = %if.end
  %rem = srem i32 %n.addr.0, %div, !dbg !81
  call void @llvm.dbg.value(metadata i32 %rem, metadata !61, metadata !DIExpression()), !dbg !62
  br label %while.cond1, !dbg !69, !llvm.loop !82

while.end7:                                       ; preds = %while.cond1
  br label %return, !dbg !84

return:                                           ; preds = %while.end7, %if.then5, %if.then
  %retval.0 = phi i32 [ 0, %if.then5 ], [ 0, %if.then ], [ 1, %while.end7 ], !dbg !62
  ret i32 %retval.0, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @right_trunc(i32 %n) #0 !dbg !86 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !87, metadata !DIExpression()), !dbg !88
  br label %while.cond, !dbg !89

while.cond:                                       ; preds = %if.end, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %div, %if.end ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !87, metadata !DIExpression()), !dbg !88
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !89
  br i1 %tobool, label %while.body, label %while.end, !dbg !89

while.body:                                       ; preds = %while.cond
  %0 = load i8*, i8** @primes, align 8, !dbg !90
  %idxprom = sext i32 %n.addr.0 to i64, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !90
  %1 = load i8, i8* %arrayidx, align 1, !dbg !90
  %tobool1 = icmp ne i8 %1, 0, !dbg !90
  br i1 %tobool1, label %if.end, label %if.then, !dbg !93, !cf.info !74

if.then:                                          ; preds = %while.body
  br label %return, !dbg !94

if.end:                                           ; preds = %while.body
  %div = sdiv i32 %n.addr.0, 10, !dbg !95
  call void @llvm.dbg.value(metadata i32 %div, metadata !87, metadata !DIExpression()), !dbg !88
  br label %while.cond, !dbg !89, !llvm.loop !96

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !98

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 1, %while.end ], !dbg !88
  ret i32 %retval.0, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !100 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 0, metadata !105, metadata !DIExpression()), !dbg !104
  call void @init_primes(), !dbg !106
  call void @llvm.dbg.value(metadata i32 999999, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %max_left.0 = phi i32 [ 0, %entry ], [ %max_left.1, %for.inc ], !dbg !104
  %n.0 = phi i32 [ 999999, %entry ], [ %sub, %for.inc ], !dbg !110
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !107, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %max_left.0, metadata !103, metadata !DIExpression()), !dbg !104
  %tobool = icmp ne i32 %max_left.0, 0, !dbg !111
  %lnot = xor i1 %tobool, true, !dbg !111
  br i1 %lnot, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %call = call i32 @left_trunc(i32 %n.0), !dbg !114
  %tobool1 = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool1, label %if.then, label %if.end, !dbg !116, !cf.info !74

if.then:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !103, metadata !DIExpression()), !dbg !104
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %for.body
  %max_left.1 = phi i32 [ %n.0, %if.then ], [ %max_left.0, %for.body ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %max_left.1, metadata !103, metadata !DIExpression()), !dbg !104
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %if.end
  %sub = sub nsw i32 %n.0, 2, !dbg !119
  call void @llvm.dbg.value(metadata i32 %sub, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 999999, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond2, !dbg !123

for.cond2:                                        ; preds = %for.inc10, %for.end
  %n.1 = phi i32 [ 999999, %for.end ], [ %sub11, %for.inc10 ], !dbg !125
  %max_right.0 = phi i32 [ 0, %for.end ], [ %max_right.1, %for.inc10 ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %max_right.0, metadata !105, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !107, metadata !DIExpression()), !dbg !104
  %tobool3 = icmp ne i32 %max_right.0, 0, !dbg !126
  %lnot4 = xor i1 %tobool3, true, !dbg !126
  br i1 %lnot4, label %for.body5, label %for.end12, !dbg !128

for.body5:                                        ; preds = %for.cond2
  %call6 = call i32 @right_trunc(i32 %n.1), !dbg !129
  %tobool7 = icmp ne i32 %call6, 0, !dbg !129
  br i1 %tobool7, label %if.then8, label %if.end9, !dbg !131, !cf.info !74

if.then8:                                         ; preds = %for.body5
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !105, metadata !DIExpression()), !dbg !104
  br label %if.end9, !dbg !132

if.end9:                                          ; preds = %if.then8, %for.body5
  %max_right.1 = phi i32 [ %n.1, %if.then8 ], [ %max_right.0, %for.body5 ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %max_right.1, metadata !105, metadata !DIExpression()), !dbg !104
  br label %for.inc10, !dbg !133

for.inc10:                                        ; preds = %if.end9
  %sub11 = sub nsw i32 %n.1, 2, !dbg !134
  call void @llvm.dbg.value(metadata i32 %sub11, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond2, !dbg !135, !llvm.loop !136

for.end12:                                        ; preds = %for.cond2
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i32 %max_left.0, i32 %max_right.0), !dbg !138
  ret i32 0, !dbg !139
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "primes", scope: !2, file: !3, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "truncatable-primes-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Truncatable-primes")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "n_primes", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "init_primes", scope: !3, file: !3, line: 12, type: !16, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 15, column: 11, scope: !15)
!19 = !DILocation(line: 15, column: 9, scope: !15)
!20 = !DILocation(line: 16, column: 9, scope: !15)
!21 = !DILocation(line: 16, column: 2, scope: !15)
!22 = !DILocation(line: 17, column: 14, scope: !15)
!23 = !DILocation(line: 17, column: 24, scope: !15)
!24 = !DILocation(line: 17, column: 2, scope: !15)
!25 = !DILocation(line: 17, column: 12, scope: !15)
!26 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 18, type: !8)
!27 = !DILocation(line: 0, scope: !15)
!28 = !DILocation(line: 19, column: 2, scope: !15)
!29 = !DILocation(line: 19, column: 11, scope: !15)
!30 = !DILocation(line: 19, column: 15, scope: !15)
!31 = !DILocation(line: 20, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 20, column: 3)
!33 = distinct !DILexicalBlock(scope: !15, file: !3, line: 19, column: 28)
!34 = !DILocalVariable(name: "j", scope: !15, file: !3, line: 14, type: !8)
!35 = !DILocation(line: 20, column: 8, scope: !32)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocation(line: 20, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !3, line: 20, column: 3)
!39 = !DILocation(line: 20, column: 3, scope: !32)
!40 = !DILocation(line: 21, column: 4, scope: !38)
!41 = !DILocation(line: 21, column: 14, scope: !38)
!42 = !DILocation(line: 20, column: 36, scope: !38)
!43 = !DILocation(line: 20, column: 3, scope: !38)
!44 = distinct !{!44, !39, !45}
!45 = !DILocation(line: 21, column: 16, scope: !32)
!46 = !DILocation(line: 22, column: 3, scope: !33)
!47 = !DILocation(line: 22, column: 10, scope: !33)
!48 = !DILocation(line: 22, column: 14, scope: !33)
!49 = !DILocation(line: 22, column: 26, scope: !33)
!50 = !DILocation(line: 22, column: 30, scope: !33)
!51 = !DILocation(line: 22, column: 29, scope: !33)
!52 = !DILocation(line: 0, scope: !33)
!53 = distinct !{!53, !46, !54}
!54 = !DILocation(line: 22, column: 40, scope: !33)
!55 = distinct !{!55, !28, !56}
!56 = !DILocation(line: 23, column: 2, scope: !15)
!57 = !DILocation(line: 24, column: 1, scope: !15)
!58 = distinct !DISubprogram(name: "left_trunc", scope: !3, file: !3, line: 26, type: !59, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8}
!61 = !DILocalVariable(name: "n", arg: 1, scope: !58, file: !3, line: 26, type: !8)
!62 = !DILocation(line: 0, scope: !58)
!63 = !DILocalVariable(name: "tens", scope: !58, file: !3, line: 28, type: !8)
!64 = !DILocation(line: 29, column: 2, scope: !58)
!65 = !DILocation(line: 29, column: 14, scope: !58)
!66 = !DILocation(line: 29, column: 24, scope: !58)
!67 = distinct !{!67, !64, !68}
!68 = !DILocation(line: 29, column: 27, scope: !58)
!69 = !DILocation(line: 31, column: 2, scope: !58)
!70 = !DILocation(line: 32, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !3, line: 32, column: 7)
!72 = distinct !DILexicalBlock(scope: !58, file: !3, line: 31, column: 12)
!73 = !DILocation(line: 32, column: 7, scope: !72)
!74 = !{!"if"}
!75 = !DILocation(line: 32, column: 19, scope: !71)
!76 = !DILocation(line: 33, column: 8, scope: !72)
!77 = !DILocation(line: 34, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !3, line: 34, column: 7)
!79 = !DILocation(line: 34, column: 7, scope: !72)
!80 = !DILocation(line: 34, column: 17, scope: !78)
!81 = !DILocation(line: 35, column: 5, scope: !72)
!82 = distinct !{!82, !69, !83}
!83 = !DILocation(line: 36, column: 2, scope: !58)
!84 = !DILocation(line: 37, column: 2, scope: !58)
!85 = !DILocation(line: 38, column: 1, scope: !58)
!86 = distinct !DISubprogram(name: "right_trunc", scope: !3, file: !3, line: 40, type: !59, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "n", arg: 1, scope: !86, file: !3, line: 40, type: !8)
!88 = !DILocation(line: 0, scope: !86)
!89 = !DILocation(line: 42, column: 2, scope: !86)
!90 = !DILocation(line: 43, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !3, line: 43, column: 7)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 42, column: 12)
!93 = !DILocation(line: 43, column: 7, scope: !92)
!94 = !DILocation(line: 43, column: 19, scope: !91)
!95 = !DILocation(line: 44, column: 5, scope: !92)
!96 = distinct !{!96, !89, !97}
!97 = !DILocation(line: 45, column: 2, scope: !86)
!98 = !DILocation(line: 46, column: 2, scope: !86)
!99 = !DILocation(line: 47, column: 1, scope: !86)
!100 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 49, type: !101, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!8}
!103 = !DILocalVariable(name: "max_left", scope: !100, file: !3, line: 52, type: !8)
!104 = !DILocation(line: 0, scope: !100)
!105 = !DILocalVariable(name: "max_right", scope: !100, file: !3, line: 52, type: !8)
!106 = !DILocation(line: 53, column: 2, scope: !100)
!107 = !DILocalVariable(name: "n", scope: !100, file: !3, line: 51, type: !8)
!108 = !DILocation(line: 55, column: 7, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !3, line: 55, column: 2)
!110 = !DILocation(line: 0, scope: !109)
!111 = !DILocation(line: 55, column: 26, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !3, line: 55, column: 2)
!113 = !DILocation(line: 55, column: 2, scope: !109)
!114 = !DILocation(line: 56, column: 7, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 56, column: 7)
!116 = !DILocation(line: 56, column: 7, scope: !112)
!117 = !DILocation(line: 56, column: 22, scope: !115)
!118 = !DILocation(line: 56, column: 19, scope: !115)
!119 = !DILocation(line: 55, column: 40, scope: !112)
!120 = !DILocation(line: 55, column: 2, scope: !112)
!121 = distinct !{!121, !113, !122}
!122 = !DILocation(line: 56, column: 33, scope: !109)
!123 = !DILocation(line: 58, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !100, file: !3, line: 58, column: 2)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocation(line: 58, column: 26, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 58, column: 2)
!128 = !DILocation(line: 58, column: 2, scope: !124)
!129 = !DILocation(line: 59, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 59, column: 7)
!131 = !DILocation(line: 59, column: 7, scope: !127)
!132 = !DILocation(line: 59, column: 23, scope: !130)
!133 = !DILocation(line: 59, column: 20, scope: !130)
!134 = !DILocation(line: 58, column: 40, scope: !127)
!135 = !DILocation(line: 58, column: 2, scope: !127)
!136 = distinct !{!136, !128, !137}
!137 = !DILocation(line: 59, column: 35, scope: !124)
!138 = !DILocation(line: 61, column: 2, scope: !100)
!139 = !DILocation(line: 62, column: 2, scope: !100)
