; ModuleID = 'aks-test-for-primes.c'
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
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %j, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %n.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, 0, !dbg !26
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !27, !cf.info !28

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !29
  %cmp1 = icmp sgt i32 %1, 63, !dbg !30
  br i1 %cmp1, label %if.then, label %if.end, !dbg !31, !cf.info !28

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() #4, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4, !dbg !33
  store i64 1, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc13, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !37
  %3 = load i32, i32* %n.addr, align 4, !dbg !39
  %cmp2 = icmp slt i32 %2, %3, !dbg !40
  br i1 %cmp2, label %for.body, label %for.end15, !dbg !41

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !42
  store i32 %4, i32* %j, align 4, !dbg !44
  %add = add nsw i32 1, %4, !dbg !45
  %idxprom = sext i32 %add to i64, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !46
  store i64 1, i64* %arrayidx, align 8, !dbg !47
  br label %for.cond3, !dbg !46

for.cond3:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !dbg !48
  %cmp4 = icmp sgt i32 %5, 0, !dbg !50
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !51

for.body5:                                        ; preds = %for.cond3
  %6 = load i32, i32* %j, align 4, !dbg !52
  %sub = sub nsw i32 %6, 1, !dbg !53
  %idxprom6 = sext i32 %sub to i64, !dbg !54
  %arrayidx7 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom6, !dbg !54
  %7 = load i64, i64* %arrayidx7, align 8, !dbg !54
  %8 = load i32, i32* %j, align 4, !dbg !55
  %idxprom8 = sext i32 %8 to i64, !dbg !56
  %arrayidx9 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom8, !dbg !56
  %9 = load i64, i64* %arrayidx9, align 8, !dbg !56
  %sub10 = sub nsw i64 %7, %9, !dbg !57
  %10 = load i32, i32* %j, align 4, !dbg !58
  %idxprom11 = sext i32 %10 to i64, !dbg !59
  %arrayidx12 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom11, !dbg !59
  store i64 %sub10, i64* %arrayidx12, align 8, !dbg !60
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body5
  %11 = load i32, i32* %j, align 4, !dbg !61
  %dec = add nsw i32 %11, -1, !dbg !61
  store i32 %dec, i32* %j, align 4, !dbg !61
  br label %for.cond3, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond3
  br label %for.inc13, !dbg !64

for.inc13:                                        ; preds = %for.end
  %12 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !65
  %sub14 = sub nsw i64 0, %12, !dbg !66
  store i64 %sub14, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !67
  %13 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %13, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end15:                                        ; preds = %for.cond
  ret void, !dbg !72
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %n) #0 !dbg !73 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* %n.addr, align 4, !dbg !80
  call void @coef(i32 %0), !dbg !81
  %1 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !82
  %add = add nsw i64 %1, 1, !dbg !82
  store i64 %add, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @c, i64 0, i64 0), align 16, !dbg !82
  %2 = load i32, i32* %n.addr, align 4, !dbg !83
  store i32 %2, i32* %i, align 4, !dbg !84
  %idxprom = sext i32 %2 to i64, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !85
  %3 = load i64, i64* %arrayidx, align 8, !dbg !86
  %sub = sub nsw i64 %3, 1, !dbg !86
  store i64 %sub, i64* %arrayidx, align 8, !dbg !86
  br label %while.cond, !dbg !87

while.cond:                                       ; preds = %while.body, %entry
  %4 = load i32, i32* %i, align 4, !dbg !88
  %dec = add nsw i32 %4, -1, !dbg !88
  store i32 %dec, i32* %i, align 4, !dbg !88
  %tobool = icmp ne i32 %4, 0, !dbg !88
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !89

land.rhs:                                         ; preds = %while.cond
  %5 = load i32, i32* %i, align 4, !dbg !90
  %idxprom1 = sext i32 %5 to i64, !dbg !91
  %arrayidx2 = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom1, !dbg !91
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !91
  %7 = load i32, i32* %n.addr, align 4, !dbg !92
  %conv = sext i32 %7 to i64, !dbg !92
  %rem = srem i64 %6, %conv, !dbg !93
  %tobool3 = icmp ne i64 %rem, 0, !dbg !94
  %lnot = xor i1 %tobool3, true, !dbg !94
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %8 = phi i1 [ false, %while.cond ], [ %lnot, %land.rhs ], !dbg !95
  br i1 %8, label %while.body, label %while.end, !dbg !87

while.body:                                       ; preds = %land.end
  br label %while.cond, !dbg !87, !llvm.loop !96

while.end:                                        ; preds = %land.end
  %9 = load i32, i32* %i, align 4, !dbg !98
  %cmp = icmp slt i32 %9, 0, !dbg !99
  %conv4 = zext i1 %cmp to i32, !dbg !99
  ret i32 %conv4, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i32 %n) #0 !dbg !101 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !105
  %idxprom = sext i32 %0 to i64, !dbg !106
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @c, i64 0, i64 %idxprom, !dbg !106
  %1 = load i64, i64* %arrayidx, align 8, !dbg !106
  %2 = load i32, i32* %n.addr, align 4, !dbg !107
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i64 %1, i32 %2), !dbg !108
  br label %do.cond, !dbg !108

do.cond:                                          ; preds = %do.body
  %3 = load i32, i32* %n.addr, align 4, !dbg !109
  %dec = add nsw i32 %3, -1, !dbg !109
  store i32 %dec, i32* %n.addr, align 4, !dbg !109
  %tobool = icmp ne i32 %3, 0, !dbg !108
  br i1 %tobool, label %do.body, label %do.end, !dbg !108, !llvm.loop !110

do.end:                                           ; preds = %do.cond
  ret void, !dbg !112
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %n, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %n, align 4, !dbg !121
  %cmp = icmp slt i32 %0, 10, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %n, align 4, !dbg !125
  call void @coef(i32 %1), !dbg !127
  %2 = load i32, i32* %n, align 4, !dbg !128
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !129
  %3 = load i32, i32* %n, align 4, !dbg !130
  call void @show(i32 %3), !dbg !131
  %call1 = call i32 @putchar(i32 10), !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %n, align 4, !dbg !134
  %inc = add nsw i32 %4, 1, !dbg !134
  store i32 %inc, i32* %n, align 4, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0)), !dbg !138
  store i32 1, i32* %n, align 4, !dbg !139
  br label %for.cond3, !dbg !141

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i32, i32* %n, align 4, !dbg !142
  %cmp4 = icmp sle i32 %5, 63, !dbg !144
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !145

for.body5:                                        ; preds = %for.cond3
  %6 = load i32, i32* %n, align 4, !dbg !146
  %call6 = call i32 @is_prime(i32 %6), !dbg !148
  %tobool = icmp ne i32 %call6, 0, !dbg !148
  br i1 %tobool, label %if.then, label %if.end, !dbg !149, !cf.info !28

if.then:                                          ; preds = %for.body5
  %7 = load i32, i32* %n, align 4, !dbg !150
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %7), !dbg !151
  br label %if.end, !dbg !151

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc8, !dbg !152

for.inc8:                                         ; preds = %if.end
  %8 = load i32, i32* %n, align 4, !dbg !153
  %inc9 = add nsw i32 %8, 1, !dbg !153
  store i32 %inc9, i32* %n, align 4, !dbg !153
  br label %for.cond3, !dbg !154, !llvm.loop !155

for.end10:                                        ; preds = %for.cond3
  %call11 = call i32 @putchar(i32 10), !dbg !157
  ret i32 0, !dbg !158
}

declare dso_local i32 @putchar(i32) #3

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
!19 = !DILocation(line: 6, column: 15, scope: !14)
!20 = !DILocalVariable(name: "i", scope: !14, file: !3, line: 8, type: !17)
!21 = !DILocation(line: 8, column: 6, scope: !14)
!22 = !DILocalVariable(name: "j", scope: !14, file: !3, line: 8, type: !17)
!23 = !DILocation(line: 8, column: 9, scope: !14)
!24 = !DILocation(line: 10, column: 6, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !3, line: 10, column: 6)
!26 = !DILocation(line: 10, column: 8, scope: !25)
!27 = !DILocation(line: 10, column: 12, scope: !25)
!28 = !{!"if"}
!29 = !DILocation(line: 10, column: 15, scope: !25)
!30 = !DILocation(line: 10, column: 17, scope: !25)
!31 = !DILocation(line: 10, column: 6, scope: !14)
!32 = !DILocation(line: 10, column: 23, scope: !25)
!33 = !DILocation(line: 12, column: 10, scope: !34)
!34 = distinct !DILexicalBlock(scope: !14, file: !3, line: 12, column: 2)
!35 = !DILocation(line: 12, column: 14, scope: !34)
!36 = !DILocation(line: 12, column: 7, scope: !34)
!37 = !DILocation(line: 12, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 12, column: 2)
!39 = !DILocation(line: 12, column: 23, scope: !38)
!40 = !DILocation(line: 12, column: 21, scope: !38)
!41 = !DILocation(line: 12, column: 2, scope: !34)
!42 = !DILocation(line: 13, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !3, line: 13, column: 3)
!44 = !DILocation(line: 13, column: 16, scope: !43)
!45 = !DILocation(line: 13, column: 12, scope: !43)
!46 = !DILocation(line: 13, column: 8, scope: !43)
!47 = !DILocation(line: 13, column: 21, scope: !43)
!48 = !DILocation(line: 13, column: 26, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !3, line: 13, column: 3)
!50 = !DILocation(line: 13, column: 28, scope: !49)
!51 = !DILocation(line: 13, column: 3, scope: !43)
!52 = !DILocation(line: 14, column: 13, scope: !49)
!53 = !DILocation(line: 14, column: 14, scope: !49)
!54 = !DILocation(line: 14, column: 11, scope: !49)
!55 = !DILocation(line: 14, column: 22, scope: !49)
!56 = !DILocation(line: 14, column: 20, scope: !49)
!57 = !DILocation(line: 14, column: 18, scope: !49)
!58 = !DILocation(line: 14, column: 6, scope: !49)
!59 = !DILocation(line: 14, column: 4, scope: !49)
!60 = !DILocation(line: 14, column: 9, scope: !49)
!61 = !DILocation(line: 13, column: 34, scope: !49)
!62 = !DILocation(line: 13, column: 3, scope: !49)
!63 = distinct !{!63, !51, !64}
!64 = !DILocation(line: 14, column: 23, scope: !43)
!65 = !DILocation(line: 12, column: 34, scope: !38)
!66 = !DILocation(line: 12, column: 33, scope: !38)
!67 = !DILocation(line: 12, column: 31, scope: !38)
!68 = !DILocation(line: 12, column: 41, scope: !38)
!69 = !DILocation(line: 12, column: 2, scope: !38)
!70 = distinct !{!70, !41, !71}
!71 = !DILocation(line: 14, column: 23, scope: !34)
!72 = !DILocation(line: 15, column: 1, scope: !14)
!73 = distinct !DISubprogram(name: "is_prime", scope: !3, file: !3, line: 17, type: !74, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!17, !17}
!76 = !DILocalVariable(name: "n", arg: 1, scope: !73, file: !3, line: 17, type: !17)
!77 = !DILocation(line: 17, column: 18, scope: !73)
!78 = !DILocalVariable(name: "i", scope: !73, file: !3, line: 19, type: !17)
!79 = !DILocation(line: 19, column: 6, scope: !73)
!80 = !DILocation(line: 21, column: 7, scope: !73)
!81 = !DILocation(line: 21, column: 2, scope: !73)
!82 = !DILocation(line: 22, column: 7, scope: !73)
!83 = !DILocation(line: 22, column: 17, scope: !73)
!84 = !DILocation(line: 22, column: 16, scope: !73)
!85 = !DILocation(line: 22, column: 13, scope: !73)
!86 = !DILocation(line: 22, column: 20, scope: !73)
!87 = !DILocation(line: 23, column: 2, scope: !73)
!88 = !DILocation(line: 23, column: 10, scope: !73)
!89 = !DILocation(line: 23, column: 13, scope: !73)
!90 = !DILocation(line: 23, column: 20, scope: !73)
!91 = !DILocation(line: 23, column: 18, scope: !73)
!92 = !DILocation(line: 23, column: 25, scope: !73)
!93 = !DILocation(line: 23, column: 23, scope: !73)
!94 = !DILocation(line: 23, column: 16, scope: !73)
!95 = !DILocation(line: 0, scope: !73)
!96 = distinct !{!96, !87, !97}
!97 = !DILocation(line: 23, column: 28, scope: !73)
!98 = !DILocation(line: 25, column: 9, scope: !73)
!99 = !DILocation(line: 25, column: 11, scope: !73)
!100 = !DILocation(line: 25, column: 2, scope: !73)
!101 = distinct !DISubprogram(name: "show", scope: !3, file: !3, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "n", arg: 1, scope: !101, file: !3, line: 28, type: !17)
!103 = !DILocation(line: 28, column: 15, scope: !101)
!104 = !DILocation(line: 30, column: 2, scope: !101)
!105 = !DILocation(line: 30, column: 27, scope: !101)
!106 = !DILocation(line: 30, column: 25, scope: !101)
!107 = !DILocation(line: 30, column: 31, scope: !101)
!108 = !DILocation(line: 30, column: 5, scope: !101)
!109 = !DILocation(line: 30, column: 43, scope: !101)
!110 = distinct !{!110, !104, !111}
!111 = !DILocation(line: 30, column: 45, scope: !101)
!112 = !DILocation(line: 31, column: 1, scope: !101)
!113 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 33, type: !114, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DISubroutineType(types: !115)
!115 = !{!17}
!116 = !DILocalVariable(name: "n", scope: !113, file: !3, line: 35, type: !17)
!117 = !DILocation(line: 35, column: 6, scope: !113)
!118 = !DILocation(line: 37, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !3, line: 37, column: 2)
!120 = !DILocation(line: 37, column: 7, scope: !119)
!121 = !DILocation(line: 37, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !3, line: 37, column: 2)
!123 = !DILocation(line: 37, column: 16, scope: !122)
!124 = !DILocation(line: 37, column: 2, scope: !119)
!125 = !DILocation(line: 38, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !3, line: 37, column: 27)
!127 = !DILocation(line: 38, column: 3, scope: !126)
!128 = !DILocation(line: 39, column: 25, scope: !126)
!129 = !DILocation(line: 39, column: 3, scope: !126)
!130 = !DILocation(line: 40, column: 8, scope: !126)
!131 = !DILocation(line: 40, column: 3, scope: !126)
!132 = !DILocation(line: 41, column: 3, scope: !126)
!133 = !DILocation(line: 42, column: 2, scope: !126)
!134 = !DILocation(line: 37, column: 23, scope: !122)
!135 = !DILocation(line: 37, column: 2, scope: !122)
!136 = distinct !{!136, !124, !137}
!137 = !DILocation(line: 42, column: 2, scope: !119)
!138 = !DILocation(line: 44, column: 2, scope: !113)
!139 = !DILocation(line: 45, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !113, file: !3, line: 45, column: 2)
!141 = !DILocation(line: 45, column: 7, scope: !140)
!142 = !DILocation(line: 45, column: 14, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !3, line: 45, column: 2)
!144 = !DILocation(line: 45, column: 16, scope: !143)
!145 = !DILocation(line: 45, column: 2, scope: !140)
!146 = !DILocation(line: 46, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !3, line: 46, column: 7)
!148 = !DILocation(line: 46, column: 7, scope: !147)
!149 = !DILocation(line: 46, column: 7, scope: !143)
!150 = !DILocation(line: 47, column: 18, scope: !147)
!151 = !DILocation(line: 47, column: 4, scope: !147)
!152 = !DILocation(line: 46, column: 17, scope: !147)
!153 = !DILocation(line: 45, column: 24, scope: !143)
!154 = !DILocation(line: 45, column: 2, scope: !143)
!155 = distinct !{!155, !145, !156}
!156 = !DILocation(line: 47, column: 19, scope: !140)
!157 = !DILocation(line: 49, column: 2, scope: !113)
!158 = !DILocation(line: 50, column: 2, scope: !113)
