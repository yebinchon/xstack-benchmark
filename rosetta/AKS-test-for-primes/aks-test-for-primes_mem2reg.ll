; ModuleID = 'aks-test-for-primes.ll'
source_filename = "aks-test-for-primes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = common dso_local global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"%+lldx^%d\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"(x-1)^%d = \00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"\0Aprimes (never mind the 1):\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @coef(i32 %n) #0 !dbg !14 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !18, metadata !DIExpression()), !dbg !19
  %cmp = icmp slt i32 %n, 0, !dbg !20
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !22, !cf.info !23

lor.lhs.false:                                    ; preds = %entry
  %cmp1 = icmp sgt i32 %n, 63, !dbg !24
  br i1 %cmp1, label %if.then, label %if.end, !dbg !25, !cf.info !23

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() #4, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.value(metadata i32 0, metadata !27, metadata !DIExpression()), !dbg !19
  store i64 1, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc13, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc13 ], !dbg !31
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !27, metadata !DIExpression()), !dbg !19
  %cmp2 = icmp slt i32 %i.0, %n, !dbg !32
  br i1 %cmp2, label %for.body, label %for.end15, !dbg !34

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !35, metadata !DIExpression()), !dbg !19
  %add = add nsw i32 1, %i.0, !dbg !36
  %idxprom = sext i32 %add to i64, !dbg !38
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !38
  store i64 1, i64* %arrayidx, align 8, !dbg !39
  br label %for.cond3, !dbg !38

for.cond3:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ %i.0, %for.body ], [ %dec, %for.inc ], !dbg !40
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !35, metadata !DIExpression()), !dbg !19
  %cmp4 = icmp sgt i32 %j.0, 0, !dbg !41
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !43

for.body5:                                        ; preds = %for.cond3
  %sub = sub nsw i32 %j.0, 1, !dbg !44
  %idxprom6 = sext i32 %sub to i64, !dbg !45
  %arrayidx7 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom6, !dbg !45
  %0 = load i64, i64* %arrayidx7, align 8, !dbg !45
  %idxprom8 = sext i32 %j.0 to i64, !dbg !46
  %arrayidx9 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom8, !dbg !46
  %1 = load i64, i64* %arrayidx9, align 8, !dbg !46
  %sub10 = sub nsw i64 %0, %1, !dbg !47
  %idxprom11 = sext i32 %j.0 to i64, !dbg !48
  %arrayidx12 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom11, !dbg !48
  store i64 %sub10, i64* %arrayidx12, align 8, !dbg !49
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body5
  %dec = add nsw i32 %j.0, -1, !dbg !50
  call void @llvm.dbg.value(metadata i32 %dec, metadata !35, metadata !DIExpression()), !dbg !19
  br label %for.cond3, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond3
  br label %for.inc13, !dbg !53

for.inc13:                                        ; preds = %for.end
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !54
  %sub14 = sub nsw i64 0, %2, !dbg !55
  store i64 %sub14, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !56
  %inc = add nsw i32 %i.0, 1, !dbg !57
  call void @llvm.dbg.value(metadata i32 %inc, metadata !27, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end15:                                        ; preds = %for.cond
  ret void, !dbg !61
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %n) #0 !dbg !62 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !65, metadata !DIExpression()), !dbg !66
  call void @coef(i32 %n), !dbg !67
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !68
  %add = add nsw i64 %0, 1, !dbg !68
  store i64 %add, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !68
  call void @llvm.dbg.value(metadata i32 %n, metadata !69, metadata !DIExpression()), !dbg !66
  %idxprom = sext i32 %n to i64, !dbg !70
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !70
  %1 = load i64, i64* %arrayidx, align 8, !dbg !71
  %sub = sub nsw i64 %1, 1, !dbg !71
  store i64 %sub, i64* %arrayidx, align 8, !dbg !71
  br label %while.cond, !dbg !72

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ %n, %entry ], [ %dec, %while.body ], !dbg !66
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !69, metadata !DIExpression()), !dbg !66
  %dec = add nsw i32 %i.0, -1, !dbg !73
  call void @llvm.dbg.value(metadata i32 %dec, metadata !69, metadata !DIExpression()), !dbg !66
  %tobool = icmp ne i32 %i.0, 0, !dbg !73
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !74

land.rhs:                                         ; preds = %while.cond
  %idxprom1 = sext i32 %dec to i64, !dbg !75
  %arrayidx2 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom1, !dbg !75
  %2 = load i64, i64* %arrayidx2, align 8, !dbg !75
  %conv = sext i32 %n to i64, !dbg !76
  %rem = srem i64 %2, %conv, !dbg !77
  %tobool3 = icmp ne i64 %rem, 0, !dbg !78
  %lnot = xor i1 %tobool3, true, !dbg !78
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %lnot, %land.rhs ], !dbg !66
  br i1 %3, label %while.body, label %while.end, !dbg !72

while.body:                                       ; preds = %land.end
  br label %while.cond, !dbg !72, !llvm.loop !79

while.end:                                        ; preds = %land.end
  %cmp = icmp slt i32 %dec, 0, !dbg !81
  %conv4 = zext i1 %cmp to i32, !dbg !81
  ret i32 %conv4, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i32 %n) #0 !dbg !83 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !84, metadata !DIExpression()), !dbg !85
  br label %do.body, !dbg !86

do.body:                                          ; preds = %do.cond, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %dec, %do.cond ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !84, metadata !DIExpression()), !dbg !85
  %idxprom = sext i32 %n.addr.0 to i64, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !87
  %0 = load i64, i64* %arrayidx, align 8, !dbg !87
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i64 %0, i32 %n.addr.0), !dbg !88
  br label %do.cond, !dbg !88

do.cond:                                          ; preds = %do.body
  %dec = add nsw i32 %n.addr.0, -1, !dbg !89
  call void @llvm.dbg.value(metadata i32 %dec, metadata !84, metadata !DIExpression()), !dbg !85
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !88
  br i1 %tobool, label %do.body, label %do.end, !dbg !88, !llvm.loop !90

do.end:                                           ; preds = %do.cond
  ret void, !dbg !92
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !93 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %n.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !100
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !96, metadata !DIExpression()), !dbg !97
  %cmp = icmp slt i32 %n.0, 10, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  call void @coef(i32 %n.0), !dbg !104
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %n.0), !dbg !106
  call void @show(i32 %n.0), !dbg !107
  %call1 = call i32 @putchar(i32 10), !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %n.0, 1, !dbg !110
  call void @llvm.dbg.value(metadata i32 %inc, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @llvm.dbg.value(metadata i32 1, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond3, !dbg !115

for.cond3:                                        ; preds = %for.inc8, %for.end
  %n.1 = phi i32 [ 1, %for.end ], [ %inc9, %for.inc8 ], !dbg !117
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !96, metadata !DIExpression()), !dbg !97
  %cmp4 = icmp sle i32 %n.1, 63, !dbg !118
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !120

for.body5:                                        ; preds = %for.cond3
  %call6 = call i32 @is_prime(i32 %n.1), !dbg !121
  %tobool = icmp ne i32 %call6, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123, !cf.info !23

if.then:                                          ; preds = %for.body5
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %n.1), !dbg !124
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc8, !dbg !125

for.inc8:                                         ; preds = %if.end
  %inc9 = add nsw i32 %n.1, 1, !dbg !126
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond3, !dbg !127, !llvm.loop !128

for.end10:                                        ; preds = %for.cond3
  %call11 = call i32 @putchar(i32 10), !dbg !130
  ret i32 0, !dbg !131
}

declare dso_local i32 @putchar(i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "aks-test-for-primes.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/AKS-test-for-primes")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !8)
!7 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!8 = !{!9}
!9 = !DISubrange(count: 100)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!14 = distinct !DISubprogram(name: "coef", scope: !3, file: !3, line: 6, type: !15, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "n", arg: 1, scope: !14, file: !3, line: 6, type: !17)
!19 = !DILocation(line: 0, scope: !14)
!20 = !DILocation(line: 10, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !3, line: 10, column: 6)
!22 = !DILocation(line: 10, column: 12, scope: !21)
!23 = !{!"if"}
!24 = !DILocation(line: 10, column: 17, scope: !21)
!25 = !DILocation(line: 10, column: 6, scope: !14)
!26 = !DILocation(line: 10, column: 23, scope: !21)
!27 = !DILocalVariable(name: "i", scope: !14, file: !3, line: 8, type: !17)
!28 = !DILocation(line: 12, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !3, line: 12, column: 2)
!30 = !DILocation(line: 12, column: 7, scope: !29)
!31 = !DILocation(line: 0, scope: !29)
!32 = !DILocation(line: 12, column: 21, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !3, line: 12, column: 2)
!34 = !DILocation(line: 12, column: 2, scope: !29)
!35 = !DILocalVariable(name: "j", scope: !14, file: !3, line: 8, type: !17)
!36 = !DILocation(line: 13, column: 12, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 13, column: 3)
!38 = !DILocation(line: 13, column: 8, scope: !37)
!39 = !DILocation(line: 13, column: 21, scope: !37)
!40 = !DILocation(line: 0, scope: !37)
!41 = !DILocation(line: 13, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !3, line: 13, column: 3)
!43 = !DILocation(line: 13, column: 3, scope: !37)
!44 = !DILocation(line: 14, column: 14, scope: !42)
!45 = !DILocation(line: 14, column: 11, scope: !42)
!46 = !DILocation(line: 14, column: 20, scope: !42)
!47 = !DILocation(line: 14, column: 18, scope: !42)
!48 = !DILocation(line: 14, column: 4, scope: !42)
!49 = !DILocation(line: 14, column: 9, scope: !42)
!50 = !DILocation(line: 13, column: 34, scope: !42)
!51 = !DILocation(line: 13, column: 3, scope: !42)
!52 = distinct !{!52, !43, !53}
!53 = !DILocation(line: 14, column: 23, scope: !37)
!54 = !DILocation(line: 12, column: 34, scope: !33)
!55 = !DILocation(line: 12, column: 33, scope: !33)
!56 = !DILocation(line: 12, column: 31, scope: !33)
!57 = !DILocation(line: 12, column: 41, scope: !33)
!58 = !DILocation(line: 12, column: 2, scope: !33)
!59 = distinct !{!59, !34, !60}
!60 = !DILocation(line: 14, column: 23, scope: !29)
!61 = !DILocation(line: 15, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "is_prime", scope: !3, file: !3, line: 17, type: !63, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!17, !17}
!65 = !DILocalVariable(name: "n", arg: 1, scope: !62, file: !3, line: 17, type: !17)
!66 = !DILocation(line: 0, scope: !62)
!67 = !DILocation(line: 21, column: 2, scope: !62)
!68 = !DILocation(line: 22, column: 7, scope: !62)
!69 = !DILocalVariable(name: "i", scope: !62, file: !3, line: 19, type: !17)
!70 = !DILocation(line: 22, column: 13, scope: !62)
!71 = !DILocation(line: 22, column: 20, scope: !62)
!72 = !DILocation(line: 23, column: 2, scope: !62)
!73 = !DILocation(line: 23, column: 10, scope: !62)
!74 = !DILocation(line: 23, column: 13, scope: !62)
!75 = !DILocation(line: 23, column: 18, scope: !62)
!76 = !DILocation(line: 23, column: 25, scope: !62)
!77 = !DILocation(line: 23, column: 23, scope: !62)
!78 = !DILocation(line: 23, column: 16, scope: !62)
!79 = distinct !{!79, !72, !80}
!80 = !DILocation(line: 23, column: 28, scope: !62)
!81 = !DILocation(line: 25, column: 11, scope: !62)
!82 = !DILocation(line: 25, column: 2, scope: !62)
!83 = distinct !DISubprogram(name: "show", scope: !3, file: !3, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "n", arg: 1, scope: !83, file: !3, line: 28, type: !17)
!85 = !DILocation(line: 0, scope: !83)
!86 = !DILocation(line: 30, column: 2, scope: !83)
!87 = !DILocation(line: 30, column: 25, scope: !83)
!88 = !DILocation(line: 30, column: 5, scope: !83)
!89 = !DILocation(line: 30, column: 43, scope: !83)
!90 = distinct !{!90, !86, !91}
!91 = !DILocation(line: 30, column: 45, scope: !83)
!92 = !DILocation(line: 31, column: 1, scope: !83)
!93 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 33, type: !94, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!17}
!96 = !DILocalVariable(name: "n", scope: !93, file: !3, line: 35, type: !17)
!97 = !DILocation(line: 0, scope: !93)
!98 = !DILocation(line: 37, column: 7, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !3, line: 37, column: 2)
!100 = !DILocation(line: 0, scope: !99)
!101 = !DILocation(line: 37, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 37, column: 2)
!103 = !DILocation(line: 37, column: 2, scope: !99)
!104 = !DILocation(line: 38, column: 3, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 37, column: 27)
!106 = !DILocation(line: 39, column: 3, scope: !105)
!107 = !DILocation(line: 40, column: 3, scope: !105)
!108 = !DILocation(line: 41, column: 3, scope: !105)
!109 = !DILocation(line: 42, column: 2, scope: !105)
!110 = !DILocation(line: 37, column: 23, scope: !102)
!111 = !DILocation(line: 37, column: 2, scope: !102)
!112 = distinct !{!112, !103, !113}
!113 = !DILocation(line: 42, column: 2, scope: !99)
!114 = !DILocation(line: 44, column: 2, scope: !93)
!115 = !DILocation(line: 45, column: 7, scope: !116)
!116 = distinct !DILexicalBlock(scope: !93, file: !3, line: 45, column: 2)
!117 = !DILocation(line: 0, scope: !116)
!118 = !DILocation(line: 45, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !3, line: 45, column: 2)
!120 = !DILocation(line: 45, column: 2, scope: !116)
!121 = !DILocation(line: 46, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !3, line: 46, column: 7)
!123 = !DILocation(line: 46, column: 7, scope: !119)
!124 = !DILocation(line: 47, column: 4, scope: !122)
!125 = !DILocation(line: 46, column: 17, scope: !122)
!126 = !DILocation(line: 45, column: 24, scope: !119)
!127 = !DILocation(line: 45, column: 2, scope: !119)
!128 = distinct !{!128, !120, !129}
!129 = !DILocation(line: 47, column: 19, scope: !116)
!130 = !DILocation(line: 49, column: 2, scope: !93)
!131 = !DILocation(line: 50, column: 2, scope: !93)
