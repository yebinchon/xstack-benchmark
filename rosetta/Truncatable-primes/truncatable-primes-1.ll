; ModuleID = 'truncatable-primes-1.c'
source_filename = "truncatable-primes-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@primes = common dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Left: %d; right: %d\0A\00", align 1
@n_primes = common dso_local global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_primes() #0 !dbg !15 {
entry:
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias i8* @malloc(i64 1000000) #5, !dbg !20
  store i8* %call, i8** @primes, align 8, !dbg !21
  %0 = load i8*, i8** @primes, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 1, i64 1000000, i1 false), !dbg !23
  %1 = load i8*, i8** @primes, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 1, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %2 = load i8*, i8** @primes, align 8, !dbg !26
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 0, !dbg !26
  store i8 0, i8* %arrayidx1, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 2, i32* %i, align 4, !dbg !29
  br label %while.cond, !dbg !30

while.cond:                                       ; preds = %while.end, %entry
  %3 = load i32, i32* %i, align 4, !dbg !31
  %4 = load i32, i32* %i, align 4, !dbg !32
  %mul = mul nsw i32 %3, %4, !dbg !33
  %cmp = icmp slt i32 %mul, 1000000, !dbg !34
  br i1 %cmp, label %while.body, label %while.end10, !dbg !30

while.body:                                       ; preds = %while.cond
  %5 = load i32, i32* %i, align 4, !dbg !35
  %mul2 = mul nsw i32 %5, 2, !dbg !38
  store i32 %mul2, i32* %j, align 4, !dbg !39
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %while.body
  %6 = load i32, i32* %j, align 4, !dbg !41
  %cmp3 = icmp slt i32 %6, 1000000, !dbg !43
  br i1 %cmp3, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** @primes, align 8, !dbg !45
  %8 = load i32, i32* %j, align 4, !dbg !46
  %idxprom = sext i32 %8 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !48
  %10 = load i32, i32* %j, align 4, !dbg !49
  %add = add nsw i32 %10, %9, !dbg !49
  store i32 %add, i32* %j, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  br label %while.cond5, !dbg !53

while.cond5:                                      ; preds = %while.body9, %for.end
  %11 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %11, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  %cmp6 = icmp slt i32 %inc, 1000000, !dbg !55
  br i1 %cmp6, label %land.rhs, label %land.end, !dbg !56

land.rhs:                                         ; preds = %while.cond5
  %12 = load i8*, i8** @primes, align 8, !dbg !57
  %13 = load i32, i32* %i, align 4, !dbg !58
  %idxprom7 = sext i32 %13 to i64, !dbg !57
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 %idxprom7, !dbg !57
  %14 = load i8, i8* %arrayidx8, align 1, !dbg !57
  %tobool = icmp ne i8 %14, 0, !dbg !59
  %lnot = xor i1 %tobool, true, !dbg !59
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond5
  %15 = phi i1 [ false, %while.cond5 ], [ %lnot, %land.rhs ], !dbg !60
  br i1 %15, label %while.body9, label %while.end, !dbg !53

while.body9:                                      ; preds = %land.end
  br label %while.cond5, !dbg !53, !llvm.loop !61

while.end:                                        ; preds = %land.end
  br label %while.cond, !dbg !30, !llvm.loop !63

while.end10:                                      ; preds = %while.cond
  ret void, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @left_trunc(i32 %n) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %tens = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %tens, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 1, i32* %tens, align 4, !dbg !72
  br label %while.cond, !dbg !73

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %tens, align 4, !dbg !74
  %1 = load i32, i32* %n.addr, align 4, !dbg !75
  %cmp = icmp slt i32 %0, %1, !dbg !76
  br i1 %cmp, label %while.body, label %while.end, !dbg !73

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %tens, align 4, !dbg !77
  %mul = mul nsw i32 %2, 10, !dbg !77
  store i32 %mul, i32* %tens, align 4, !dbg !77
  br label %while.cond, !dbg !73, !llvm.loop !78

while.end:                                        ; preds = %while.cond
  br label %while.cond1, !dbg !80

while.cond1:                                      ; preds = %if.end6, %while.end
  %3 = load i32, i32* %n.addr, align 4, !dbg !81
  %tobool = icmp ne i32 %3, 0, !dbg !80
  br i1 %tobool, label %while.body2, label %while.end7, !dbg !80

while.body2:                                      ; preds = %while.cond1
  %4 = load i8*, i8** @primes, align 8, !dbg !82
  %5 = load i32, i32* %n.addr, align 4, !dbg !85
  %idxprom = sext i32 %5 to i64, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !82
  %6 = load i8, i8* %arrayidx, align 1, !dbg !82
  %tobool3 = icmp ne i8 %6, 0, !dbg !82
  br i1 %tobool3, label %if.end, label %if.then, !dbg !86, !cf.info !87

if.then:                                          ; preds = %while.body2
  store i32 0, i32* %retval, align 4, !dbg !88
  br label %return, !dbg !88

if.end:                                           ; preds = %while.body2
  %7 = load i32, i32* %tens, align 4, !dbg !89
  %div = sdiv i32 %7, 10, !dbg !89
  store i32 %div, i32* %tens, align 4, !dbg !89
  %8 = load i32, i32* %n.addr, align 4, !dbg !90
  %9 = load i32, i32* %tens, align 4, !dbg !92
  %cmp4 = icmp slt i32 %8, %9, !dbg !93
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !94, !cf.info !87

if.then5:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !95
  br label %return, !dbg !95

if.end6:                                          ; preds = %if.end
  %10 = load i32, i32* %tens, align 4, !dbg !96
  %11 = load i32, i32* %n.addr, align 4, !dbg !97
  %rem = srem i32 %11, %10, !dbg !97
  store i32 %rem, i32* %n.addr, align 4, !dbg !97
  br label %while.cond1, !dbg !80, !llvm.loop !98

while.end7:                                       ; preds = %while.cond1
  store i32 1, i32* %retval, align 4, !dbg !100
  br label %return, !dbg !100

return:                                           ; preds = %while.end7, %if.then5, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !101
  ret i32 %12, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @right_trunc(i32 %n) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !103, metadata !DIExpression()), !dbg !104
  br label %while.cond, !dbg !105

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !105
  br i1 %tobool, label %while.body, label %while.end, !dbg !105

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** @primes, align 8, !dbg !107
  %2 = load i32, i32* %n.addr, align 4, !dbg !110
  %idxprom = sext i32 %2 to i64, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !107
  %3 = load i8, i8* %arrayidx, align 1, !dbg !107
  %tobool1 = icmp ne i8 %3, 0, !dbg !107
  br i1 %tobool1, label %if.end, label %if.then, !dbg !111, !cf.info !87

if.then:                                          ; preds = %while.body
  store i32 0, i32* %retval, align 4, !dbg !112
  br label %return, !dbg !112

if.end:                                           ; preds = %while.body
  %4 = load i32, i32* %n.addr, align 4, !dbg !113
  %div = sdiv i32 %4, 10, !dbg !113
  store i32 %div, i32* %n.addr, align 4, !dbg !113
  br label %while.cond, !dbg !105, !llvm.loop !114

while.end:                                        ; preds = %while.cond
  store i32 1, i32* %retval, align 4, !dbg !116
  br label %return, !dbg !116

return:                                           ; preds = %while.end, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !117
  ret i32 %5, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !118 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %max_left = alloca i32, align 4
  %max_right = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %max_left, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 0, i32* %max_left, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %max_right, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 0, i32* %max_right, align 4, !dbg !126
  call void @init_primes(), !dbg !127
  store i32 999999, i32* %n, align 4, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %max_left, align 4, !dbg !131
  %tobool = icmp ne i32 %0, 0, !dbg !133
  %lnot = xor i1 %tobool, true, !dbg !133
  br i1 %lnot, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %n, align 4, !dbg !135
  %call = call i32 @left_trunc(i32 %1), !dbg !137
  %tobool1 = icmp ne i32 %call, 0, !dbg !137
  br i1 %tobool1, label %if.then, label %if.end, !dbg !138, !cf.info !87

if.then:                                          ; preds = %for.body
  %2 = load i32, i32* %n, align 4, !dbg !139
  store i32 %2, i32* %max_left, align 4, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %n, align 4, !dbg !143
  %sub = sub nsw i32 %3, 2, !dbg !143
  store i32 %sub, i32* %n, align 4, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  store i32 999999, i32* %n, align 4, !dbg !147
  br label %for.cond2, !dbg !149

for.cond2:                                        ; preds = %for.inc10, %for.end
  %4 = load i32, i32* %max_right, align 4, !dbg !150
  %tobool3 = icmp ne i32 %4, 0, !dbg !152
  %lnot4 = xor i1 %tobool3, true, !dbg !152
  br i1 %lnot4, label %for.body5, label %for.end12, !dbg !153

for.body5:                                        ; preds = %for.cond2
  %5 = load i32, i32* %n, align 4, !dbg !154
  %call6 = call i32 @right_trunc(i32 %5), !dbg !156
  %tobool7 = icmp ne i32 %call6, 0, !dbg !156
  br i1 %tobool7, label %if.then8, label %if.end9, !dbg !157, !cf.info !87

if.then8:                                         ; preds = %for.body5
  %6 = load i32, i32* %n, align 4, !dbg !158
  store i32 %6, i32* %max_right, align 4, !dbg !159
  br label %if.end9, !dbg !160

if.end9:                                          ; preds = %if.then8, %for.body5
  br label %for.inc10, !dbg !161

for.inc10:                                        ; preds = %if.end9
  %7 = load i32, i32* %n, align 4, !dbg !162
  %sub11 = sub nsw i32 %7, 2, !dbg !162
  store i32 %sub11, i32* %n, align 4, !dbg !162
  br label %for.cond2, !dbg !163, !llvm.loop !164

for.end12:                                        ; preds = %for.cond2
  %8 = load i32, i32* %max_left, align 4, !dbg !166
  %9 = load i32, i32* %max_right, align 4, !dbg !167
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i32 %8, i32 %9), !dbg !168
  ret i32 0, !dbg !169
}

declare dso_local i32 @printf(i8*, ...) #4

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
!18 = !DILocalVariable(name: "j", scope: !15, file: !3, line: 14, type: !8)
!19 = !DILocation(line: 14, column: 6, scope: !15)
!20 = !DILocation(line: 15, column: 11, scope: !15)
!21 = !DILocation(line: 15, column: 9, scope: !15)
!22 = !DILocation(line: 16, column: 9, scope: !15)
!23 = !DILocation(line: 16, column: 2, scope: !15)
!24 = !DILocation(line: 17, column: 14, scope: !15)
!25 = !DILocation(line: 17, column: 24, scope: !15)
!26 = !DILocation(line: 17, column: 2, scope: !15)
!27 = !DILocation(line: 17, column: 12, scope: !15)
!28 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 18, type: !8)
!29 = !DILocation(line: 18, column: 6, scope: !15)
!30 = !DILocation(line: 19, column: 2, scope: !15)
!31 = !DILocation(line: 19, column: 9, scope: !15)
!32 = !DILocation(line: 19, column: 13, scope: !15)
!33 = !DILocation(line: 19, column: 11, scope: !15)
!34 = !DILocation(line: 19, column: 15, scope: !15)
!35 = !DILocation(line: 20, column: 12, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 20, column: 3)
!37 = distinct !DILexicalBlock(scope: !15, file: !3, line: 19, column: 28)
!38 = !DILocation(line: 20, column: 14, scope: !36)
!39 = !DILocation(line: 20, column: 10, scope: !36)
!40 = !DILocation(line: 20, column: 8, scope: !36)
!41 = !DILocation(line: 20, column: 19, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 20, column: 3)
!43 = !DILocation(line: 20, column: 21, scope: !42)
!44 = !DILocation(line: 20, column: 3, scope: !36)
!45 = !DILocation(line: 21, column: 4, scope: !42)
!46 = !DILocation(line: 21, column: 11, scope: !42)
!47 = !DILocation(line: 21, column: 14, scope: !42)
!48 = !DILocation(line: 20, column: 39, scope: !42)
!49 = !DILocation(line: 20, column: 36, scope: !42)
!50 = !DILocation(line: 20, column: 3, scope: !42)
!51 = distinct !{!51, !44, !52}
!52 = !DILocation(line: 21, column: 16, scope: !36)
!53 = !DILocation(line: 22, column: 3, scope: !37)
!54 = !DILocation(line: 22, column: 10, scope: !37)
!55 = !DILocation(line: 22, column: 14, scope: !37)
!56 = !DILocation(line: 22, column: 26, scope: !37)
!57 = !DILocation(line: 22, column: 30, scope: !37)
!58 = !DILocation(line: 22, column: 37, scope: !37)
!59 = !DILocation(line: 22, column: 29, scope: !37)
!60 = !DILocation(line: 0, scope: !37)
!61 = distinct !{!61, !53, !62}
!62 = !DILocation(line: 22, column: 40, scope: !37)
!63 = distinct !{!63, !30, !64}
!64 = !DILocation(line: 23, column: 2, scope: !15)
!65 = !DILocation(line: 24, column: 1, scope: !15)
!66 = distinct !DISubprogram(name: "left_trunc", scope: !3, file: !3, line: 26, type: !67, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!8, !8}
!69 = !DILocalVariable(name: "n", arg: 1, scope: !66, file: !3, line: 26, type: !8)
!70 = !DILocation(line: 26, column: 20, scope: !66)
!71 = !DILocalVariable(name: "tens", scope: !66, file: !3, line: 28, type: !8)
!72 = !DILocation(line: 28, column: 6, scope: !66)
!73 = !DILocation(line: 29, column: 2, scope: !66)
!74 = !DILocation(line: 29, column: 9, scope: !66)
!75 = !DILocation(line: 29, column: 16, scope: !66)
!76 = !DILocation(line: 29, column: 14, scope: !66)
!77 = !DILocation(line: 29, column: 24, scope: !66)
!78 = distinct !{!78, !73, !79}
!79 = !DILocation(line: 29, column: 27, scope: !66)
!80 = !DILocation(line: 31, column: 2, scope: !66)
!81 = !DILocation(line: 31, column: 9, scope: !66)
!82 = !DILocation(line: 32, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !3, line: 32, column: 7)
!84 = distinct !DILexicalBlock(scope: !66, file: !3, line: 31, column: 12)
!85 = !DILocation(line: 32, column: 15, scope: !83)
!86 = !DILocation(line: 32, column: 7, scope: !84)
!87 = !{!"if"}
!88 = !DILocation(line: 32, column: 19, scope: !83)
!89 = !DILocation(line: 33, column: 8, scope: !84)
!90 = !DILocation(line: 34, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !3, line: 34, column: 7)
!92 = !DILocation(line: 34, column: 11, scope: !91)
!93 = !DILocation(line: 34, column: 9, scope: !91)
!94 = !DILocation(line: 34, column: 7, scope: !84)
!95 = !DILocation(line: 34, column: 17, scope: !91)
!96 = !DILocation(line: 35, column: 8, scope: !84)
!97 = !DILocation(line: 35, column: 5, scope: !84)
!98 = distinct !{!98, !80, !99}
!99 = !DILocation(line: 36, column: 2, scope: !66)
!100 = !DILocation(line: 37, column: 2, scope: !66)
!101 = !DILocation(line: 38, column: 1, scope: !66)
!102 = distinct !DISubprogram(name: "right_trunc", scope: !3, file: !3, line: 40, type: !67, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "n", arg: 1, scope: !102, file: !3, line: 40, type: !8)
!104 = !DILocation(line: 40, column: 21, scope: !102)
!105 = !DILocation(line: 42, column: 2, scope: !102)
!106 = !DILocation(line: 42, column: 9, scope: !102)
!107 = !DILocation(line: 43, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !3, line: 43, column: 7)
!109 = distinct !DILexicalBlock(scope: !102, file: !3, line: 42, column: 12)
!110 = !DILocation(line: 43, column: 15, scope: !108)
!111 = !DILocation(line: 43, column: 7, scope: !109)
!112 = !DILocation(line: 43, column: 19, scope: !108)
!113 = !DILocation(line: 44, column: 5, scope: !109)
!114 = distinct !{!114, !105, !115}
!115 = !DILocation(line: 45, column: 2, scope: !102)
!116 = !DILocation(line: 46, column: 2, scope: !102)
!117 = !DILocation(line: 47, column: 1, scope: !102)
!118 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 49, type: !119, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DISubroutineType(types: !120)
!120 = !{!8}
!121 = !DILocalVariable(name: "n", scope: !118, file: !3, line: 51, type: !8)
!122 = !DILocation(line: 51, column: 6, scope: !118)
!123 = !DILocalVariable(name: "max_left", scope: !118, file: !3, line: 52, type: !8)
!124 = !DILocation(line: 52, column: 6, scope: !118)
!125 = !DILocalVariable(name: "max_right", scope: !118, file: !3, line: 52, type: !8)
!126 = !DILocation(line: 52, column: 20, scope: !118)
!127 = !DILocation(line: 53, column: 2, scope: !118)
!128 = !DILocation(line: 55, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !3, line: 55, column: 2)
!130 = !DILocation(line: 55, column: 7, scope: !129)
!131 = !DILocation(line: 55, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !3, line: 55, column: 2)
!133 = !DILocation(line: 55, column: 26, scope: !132)
!134 = !DILocation(line: 55, column: 2, scope: !129)
!135 = !DILocation(line: 56, column: 18, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !3, line: 56, column: 7)
!137 = !DILocation(line: 56, column: 7, scope: !136)
!138 = !DILocation(line: 56, column: 7, scope: !132)
!139 = !DILocation(line: 56, column: 33, scope: !136)
!140 = !DILocation(line: 56, column: 31, scope: !136)
!141 = !DILocation(line: 56, column: 22, scope: !136)
!142 = !DILocation(line: 56, column: 19, scope: !136)
!143 = !DILocation(line: 55, column: 40, scope: !132)
!144 = !DILocation(line: 55, column: 2, scope: !132)
!145 = distinct !{!145, !134, !146}
!146 = !DILocation(line: 56, column: 33, scope: !129)
!147 = !DILocation(line: 58, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !118, file: !3, line: 58, column: 2)
!149 = !DILocation(line: 58, column: 7, scope: !148)
!150 = !DILocation(line: 58, column: 27, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 58, column: 2)
!152 = !DILocation(line: 58, column: 26, scope: !151)
!153 = !DILocation(line: 58, column: 2, scope: !148)
!154 = !DILocation(line: 59, column: 19, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 59, column: 7)
!156 = !DILocation(line: 59, column: 7, scope: !155)
!157 = !DILocation(line: 59, column: 7, scope: !151)
!158 = !DILocation(line: 59, column: 35, scope: !155)
!159 = !DILocation(line: 59, column: 33, scope: !155)
!160 = !DILocation(line: 59, column: 23, scope: !155)
!161 = !DILocation(line: 59, column: 20, scope: !155)
!162 = !DILocation(line: 58, column: 40, scope: !151)
!163 = !DILocation(line: 58, column: 2, scope: !151)
!164 = distinct !{!164, !153, !165}
!165 = !DILocation(line: 59, column: 35, scope: !148)
!166 = !DILocation(line: 61, column: 34, scope: !118)
!167 = !DILocation(line: 61, column: 44, scope: !118)
!168 = !DILocation(line: 61, column: 2, scope: !118)
!169 = !DILocation(line: 62, column: 2, scope: !118)
