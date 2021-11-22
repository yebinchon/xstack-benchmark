; ModuleID = 'fibonacci-n-step-number-sequences.c'
source_filename = "fibonacci-n-step-number-sequences.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.fibo = private unnamed_addr constant [3 x i32] [i32 1, i32 1, i32 0], align 4
@__const.main.tribo = private unnamed_addr constant [4 x i32] [i32 1, i32 1, i32 2, i32 0], align 16
@__const.main.tetra = private unnamed_addr constant [5 x i32] [i32 1, i32 1, i32 2, i32 4, i32 0], align 16
@__const.main.luca = private unnamed_addr constant [3 x i32] [i32 2, i32 1, i32 0], align 4
@.str = private unnamed_addr constant [40 x i8] c"\0AFibonacci\09Tribonacci\09Tetranacci\09Lucas\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"\0A%d\09\09%d\09\09%d\09\09%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @anynacci(i32* %seedArray, i32 %howMany) #0 !dbg !7 {
entry:
  %seedArray.addr = alloca i32*, align 8
  %howMany.addr = alloca i32, align 4
  %result = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %initialCardinality = alloca i32, align 4
  store i32* %seedArray, i32** %seedArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %seedArray.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %howMany, i32* %howMany.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %howMany.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %result, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %howMany.addr, align 4, !dbg !18
  %conv = sext i32 %0 to i64, !dbg !18
  %mul = mul i64 %conv, 4, !dbg !19
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !20
  %1 = bitcast i8* %call to i32*, !dbg !20
  store i32* %1, i32** %result, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %j, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %initialCardinality, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32*, i32** %seedArray.addr, align 8, !dbg !30
  %3 = load i32, i32* %i, align 4, !dbg !32
  %idxprom = sext i32 %3 to i64, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !30
  %4 = load i32, i32* %arrayidx, align 4, !dbg !30
  %cmp = icmp ne i32 %4, 0, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !35
  %inc = add nsw i32 %5, 1, !dbg !35
  store i32 %inc, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !39
  store i32 %6, i32* %initialCardinality, align 4, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond2, !dbg !43

for.cond2:                                        ; preds = %for.inc10, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !44
  %8 = load i32, i32* %initialCardinality, align 4, !dbg !46
  %cmp3 = icmp slt i32 %7, %8, !dbg !47
  br i1 %cmp3, label %for.body5, label %for.end12, !dbg !48

for.body5:                                        ; preds = %for.cond2
  %9 = load i32*, i32** %seedArray.addr, align 8, !dbg !49
  %10 = load i32, i32* %i, align 4, !dbg !50
  %idxprom6 = sext i32 %10 to i64, !dbg !49
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !49
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !49
  %12 = load i32*, i32** %result, align 8, !dbg !51
  %13 = load i32, i32* %i, align 4, !dbg !52
  %idxprom8 = sext i32 %13 to i64, !dbg !51
  %arrayidx9 = getelementptr inbounds i32, i32* %12, i64 %idxprom8, !dbg !51
  store i32 %11, i32* %arrayidx9, align 4, !dbg !53
  br label %for.inc10, !dbg !51

for.inc10:                                        ; preds = %for.body5
  %14 = load i32, i32* %i, align 4, !dbg !54
  %inc11 = add nsw i32 %14, 1, !dbg !54
  store i32 %inc11, i32* %i, align 4, !dbg !54
  br label %for.cond2, !dbg !55, !llvm.loop !56

for.end12:                                        ; preds = %for.cond2
  %15 = load i32, i32* %initialCardinality, align 4, !dbg !58
  store i32 %15, i32* %i, align 4, !dbg !60
  br label %for.cond13, !dbg !61

for.cond13:                                       ; preds = %for.inc30, %for.end12
  %16 = load i32, i32* %i, align 4, !dbg !62
  %17 = load i32, i32* %howMany.addr, align 4, !dbg !64
  %cmp14 = icmp slt i32 %16, %17, !dbg !65
  br i1 %cmp14, label %for.body16, label %for.end32, !dbg !66

for.body16:                                       ; preds = %for.cond13
  %18 = load i32*, i32** %result, align 8, !dbg !67
  %19 = load i32, i32* %i, align 4, !dbg !69
  %idxprom17 = sext i32 %19 to i64, !dbg !67
  %arrayidx18 = getelementptr inbounds i32, i32* %18, i64 %idxprom17, !dbg !67
  store i32 0, i32* %arrayidx18, align 4, !dbg !70
  %20 = load i32, i32* %i, align 4, !dbg !71
  %21 = load i32, i32* %initialCardinality, align 4, !dbg !73
  %sub = sub nsw i32 %20, %21, !dbg !74
  store i32 %sub, i32* %j, align 4, !dbg !75
  br label %for.cond19, !dbg !76

for.cond19:                                       ; preds = %for.inc27, %for.body16
  %22 = load i32, i32* %j, align 4, !dbg !77
  %23 = load i32, i32* %i, align 4, !dbg !79
  %cmp20 = icmp slt i32 %22, %23, !dbg !80
  br i1 %cmp20, label %for.body22, label %for.end29, !dbg !81

for.body22:                                       ; preds = %for.cond19
  %24 = load i32*, i32** %result, align 8, !dbg !82
  %25 = load i32, i32* %j, align 4, !dbg !83
  %idxprom23 = sext i32 %25 to i64, !dbg !82
  %arrayidx24 = getelementptr inbounds i32, i32* %24, i64 %idxprom23, !dbg !82
  %26 = load i32, i32* %arrayidx24, align 4, !dbg !82
  %27 = load i32*, i32** %result, align 8, !dbg !84
  %28 = load i32, i32* %i, align 4, !dbg !85
  %idxprom25 = sext i32 %28 to i64, !dbg !84
  %arrayidx26 = getelementptr inbounds i32, i32* %27, i64 %idxprom25, !dbg !84
  %29 = load i32, i32* %arrayidx26, align 4, !dbg !86
  %add = add nsw i32 %29, %26, !dbg !86
  store i32 %add, i32* %arrayidx26, align 4, !dbg !86
  br label %for.inc27, !dbg !84

for.inc27:                                        ; preds = %for.body22
  %30 = load i32, i32* %j, align 4, !dbg !87
  %inc28 = add nsw i32 %30, 1, !dbg !87
  store i32 %inc28, i32* %j, align 4, !dbg !87
  br label %for.cond19, !dbg !88, !llvm.loop !89

for.end29:                                        ; preds = %for.cond19
  br label %for.inc30, !dbg !91

for.inc30:                                        ; preds = %for.end29
  %31 = load i32, i32* %i, align 4, !dbg !92
  %inc31 = add nsw i32 %31, 1, !dbg !92
  store i32 %inc31, i32* %i, align 4, !dbg !92
  br label %for.cond13, !dbg !93, !llvm.loop !94

for.end32:                                        ; preds = %for.cond13
  %32 = load i32*, i32** %result, align 8, !dbg !96
  ret i32* %32, !dbg !97
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %fibo = alloca [3 x i32], align 4
  %tribo = alloca [4 x i32], align 16
  %tetra = alloca [5 x i32], align 16
  %luca = alloca [3 x i32], align 4
  %fibonacci = alloca i32*, align 8
  %tribonacci = alloca i32*, align 8
  %tetranacci = alloca i32*, align 8
  %lucas = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %fibo, metadata !101, metadata !DIExpression()), !dbg !105
  %0 = bitcast [3 x i32]* %fibo to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.fibo to i8*), i64 12, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata [4 x i32]* %tribo, metadata !106, metadata !DIExpression()), !dbg !110
  %1 = bitcast [4 x i32]* %tribo to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.tribo to i8*), i64 16, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata [5 x i32]* %tetra, metadata !111, metadata !DIExpression()), !dbg !115
  %2 = bitcast [5 x i32]* %tetra to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([5 x i32]* @__const.main.tetra to i8*), i64 20, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata [3 x i32]* %luca, metadata !116, metadata !DIExpression()), !dbg !117
  %3 = bitcast [3 x i32]* %luca to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 bitcast ([3 x i32]* @__const.main.luca to i8*), i64 12, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %fibonacci, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %fibo, i64 0, i64 0, !dbg !120
  %call = call i32* @anynacci(i32* %arraydecay, i32 10), !dbg !121
  store i32* %call, i32** %fibonacci, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %tribonacci, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay1 = getelementptr inbounds [4 x i32], [4 x i32]* %tribo, i64 0, i64 0, !dbg !124
  %call2 = call i32* @anynacci(i32* %arraydecay1, i32 10), !dbg !125
  store i32* %call2, i32** %tribonacci, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %tetranacci, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay3 = getelementptr inbounds [5 x i32], [5 x i32]* %tetra, i64 0, i64 0, !dbg !128
  %call4 = call i32* @anynacci(i32* %arraydecay3, i32 10), !dbg !129
  store i32* %call4, i32** %tetranacci, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %lucas, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %luca, i64 0, i64 0, !dbg !132
  %call6 = call i32* @anynacci(i32* %arraydecay5, i32 10), !dbg !133
  store i32* %call6, i32** %lucas, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !135
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i64 0, i64 0)), !dbg !136
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !140
  %cmp = icmp slt i32 %4, 10, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %fibonacci, align 8, !dbg !144
  %6 = load i32, i32* %i, align 4, !dbg !145
  %idxprom = sext i32 %6 to i64, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !144
  %7 = load i32, i32* %arrayidx, align 4, !dbg !144
  %8 = load i32*, i32** %tribonacci, align 8, !dbg !146
  %9 = load i32, i32* %i, align 4, !dbg !147
  %idxprom8 = sext i32 %9 to i64, !dbg !146
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %idxprom8, !dbg !146
  %10 = load i32, i32* %arrayidx9, align 4, !dbg !146
  %11 = load i32*, i32** %tetranacci, align 8, !dbg !148
  %12 = load i32, i32* %i, align 4, !dbg !149
  %idxprom10 = sext i32 %12 to i64, !dbg !148
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !148
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !148
  %14 = load i32*, i32** %lucas, align 8, !dbg !150
  %15 = load i32, i32* %i, align 4, !dbg !151
  %idxprom12 = sext i32 %15 to i64, !dbg !150
  %arrayidx13 = getelementptr inbounds i32, i32* %14, i64 %idxprom12, !dbg !150
  %16 = load i32, i32* %arrayidx13, align 4, !dbg !150
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %7, i32 %10, i32 %13, i32 %16), !dbg !152
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %17, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !157
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fibonacci-n-step-number-sequences.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fibonacci-n-step-number-sequences")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "anynacci", scope: !1, file: !1, line: 8, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "seedArray", arg: 1, scope: !7, file: !1, line: 8, type: !10)
!13 = !DILocation(line: 8, column: 16, scope: !7)
!14 = !DILocalVariable(name: "howMany", arg: 2, scope: !7, file: !1, line: 8, type: !11)
!15 = !DILocation(line: 8, column: 31, scope: !7)
!16 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 10, type: !10)
!17 = !DILocation(line: 10, column: 8, scope: !7)
!18 = !DILocation(line: 10, column: 25, scope: !7)
!19 = !DILocation(line: 10, column: 33, scope: !7)
!20 = !DILocation(line: 10, column: 17, scope: !7)
!21 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 11, type: !11)
!22 = !DILocation(line: 11, column: 7, scope: !7)
!23 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 11, type: !11)
!24 = !DILocation(line: 11, column: 10, scope: !7)
!25 = !DILocalVariable(name: "initialCardinality", scope: !7, file: !1, line: 11, type: !11)
!26 = !DILocation(line: 11, column: 13, scope: !7)
!27 = !DILocation(line: 13, column: 10, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 3)
!29 = !DILocation(line: 13, column: 8, scope: !28)
!30 = !DILocation(line: 13, column: 15, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !1, line: 13, column: 3)
!32 = !DILocation(line: 13, column: 25, scope: !31)
!33 = !DILocation(line: 13, column: 28, scope: !31)
!34 = !DILocation(line: 13, column: 3, scope: !28)
!35 = !DILocation(line: 13, column: 35, scope: !31)
!36 = !DILocation(line: 13, column: 3, scope: !31)
!37 = distinct !{!37, !34, !38}
!38 = !DILocation(line: 13, column: 38, scope: !28)
!39 = !DILocation(line: 14, column: 24, scope: !7)
!40 = !DILocation(line: 14, column: 22, scope: !7)
!41 = !DILocation(line: 16, column: 10, scope: !42)
!42 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 3)
!43 = !DILocation(line: 16, column: 8, scope: !42)
!44 = !DILocation(line: 16, column: 15, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 16, column: 3)
!46 = !DILocation(line: 16, column: 19, scope: !45)
!47 = !DILocation(line: 16, column: 17, scope: !45)
!48 = !DILocation(line: 16, column: 3, scope: !42)
!49 = !DILocation(line: 17, column: 17, scope: !45)
!50 = !DILocation(line: 17, column: 27, scope: !45)
!51 = !DILocation(line: 17, column: 5, scope: !45)
!52 = !DILocation(line: 17, column: 12, scope: !45)
!53 = !DILocation(line: 17, column: 15, scope: !45)
!54 = !DILocation(line: 16, column: 40, scope: !45)
!55 = !DILocation(line: 16, column: 3, scope: !45)
!56 = distinct !{!56, !48, !57}
!57 = !DILocation(line: 17, column: 28, scope: !42)
!58 = !DILocation(line: 19, column: 12, scope: !59)
!59 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 3)
!60 = !DILocation(line: 19, column: 10, scope: !59)
!61 = !DILocation(line: 19, column: 8, scope: !59)
!62 = !DILocation(line: 19, column: 32, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 19, column: 3)
!64 = !DILocation(line: 19, column: 36, scope: !63)
!65 = !DILocation(line: 19, column: 34, scope: !63)
!66 = !DILocation(line: 19, column: 3, scope: !59)
!67 = !DILocation(line: 21, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !1, line: 20, column: 5)
!69 = !DILocation(line: 21, column: 14, scope: !68)
!70 = !DILocation(line: 21, column: 17, scope: !68)
!71 = !DILocation(line: 22, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 22, column: 7)
!73 = !DILocation(line: 22, column: 20, scope: !72)
!74 = !DILocation(line: 22, column: 18, scope: !72)
!75 = !DILocation(line: 22, column: 14, scope: !72)
!76 = !DILocation(line: 22, column: 12, scope: !72)
!77 = !DILocation(line: 22, column: 40, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 22, column: 7)
!79 = !DILocation(line: 22, column: 44, scope: !78)
!80 = !DILocation(line: 22, column: 42, scope: !78)
!81 = !DILocation(line: 22, column: 7, scope: !72)
!82 = !DILocation(line: 23, column: 22, scope: !78)
!83 = !DILocation(line: 23, column: 29, scope: !78)
!84 = !DILocation(line: 23, column: 9, scope: !78)
!85 = !DILocation(line: 23, column: 16, scope: !78)
!86 = !DILocation(line: 23, column: 19, scope: !78)
!87 = !DILocation(line: 22, column: 48, scope: !78)
!88 = !DILocation(line: 22, column: 7, scope: !78)
!89 = distinct !{!89, !81, !90}
!90 = !DILocation(line: 23, column: 30, scope: !72)
!91 = !DILocation(line: 24, column: 5, scope: !68)
!92 = !DILocation(line: 19, column: 46, scope: !63)
!93 = !DILocation(line: 19, column: 3, scope: !63)
!94 = distinct !{!94, !66, !95}
!95 = !DILocation(line: 24, column: 5, scope: !59)
!96 = !DILocation(line: 25, column: 10, scope: !7)
!97 = !DILocation(line: 25, column: 3, scope: !7)
!98 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !99, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!11}
!101 = !DILocalVariable(name: "fibo", scope: !98, file: !1, line: 31, type: !102)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 3)
!105 = !DILocation(line: 31, column: 7, scope: !98)
!106 = !DILocalVariable(name: "tribo", scope: !98, file: !1, line: 31, type: !107)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 4)
!110 = !DILocation(line: 31, column: 29, scope: !98)
!111 = !DILocalVariable(name: "tetra", scope: !98, file: !1, line: 31, type: !112)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 160, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 5)
!115 = !DILocation(line: 31, column: 55, scope: !98)
!116 = !DILocalVariable(name: "luca", scope: !98, file: !1, line: 31, type: !102)
!117 = !DILocation(line: 31, column: 84, scope: !98)
!118 = !DILocalVariable(name: "fibonacci", scope: !98, file: !1, line: 32, type: !10)
!119 = !DILocation(line: 32, column: 8, scope: !98)
!120 = !DILocation(line: 32, column: 30, scope: !98)
!121 = !DILocation(line: 32, column: 20, scope: !98)
!122 = !DILocalVariable(name: "tribonacci", scope: !98, file: !1, line: 32, type: !10)
!123 = !DILocation(line: 32, column: 42, scope: !98)
!124 = !DILocation(line: 32, column: 65, scope: !98)
!125 = !DILocation(line: 32, column: 55, scope: !98)
!126 = !DILocalVariable(name: "tetranacci", scope: !98, file: !1, line: 32, type: !10)
!127 = !DILocation(line: 32, column: 78, scope: !98)
!128 = !DILocation(line: 32, column: 101, scope: !98)
!129 = !DILocation(line: 32, column: 91, scope: !98)
!130 = !DILocalVariable(name: "lucas", scope: !98, file: !1, line: 33, type: !10)
!131 = !DILocation(line: 33, column: 8, scope: !98)
!132 = !DILocation(line: 33, column: 25, scope: !98)
!133 = !DILocation(line: 33, column: 16, scope: !98)
!134 = !DILocalVariable(name: "i", scope: !98, file: !1, line: 34, type: !11)
!135 = !DILocation(line: 34, column: 7, scope: !98)
!136 = !DILocation(line: 36, column: 3, scope: !98)
!137 = !DILocation(line: 38, column: 10, scope: !138)
!138 = distinct !DILexicalBlock(scope: !98, file: !1, line: 38, column: 3)
!139 = !DILocation(line: 38, column: 8, scope: !138)
!140 = !DILocation(line: 38, column: 15, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 38, column: 3)
!142 = !DILocation(line: 38, column: 17, scope: !141)
!143 = !DILocation(line: 38, column: 3, scope: !138)
!144 = !DILocation(line: 39, column: 39, scope: !141)
!145 = !DILocation(line: 39, column: 49, scope: !141)
!146 = !DILocation(line: 39, column: 53, scope: !141)
!147 = !DILocation(line: 39, column: 64, scope: !141)
!148 = !DILocation(line: 40, column: 13, scope: !141)
!149 = !DILocation(line: 40, column: 24, scope: !141)
!150 = !DILocation(line: 40, column: 28, scope: !141)
!151 = !DILocation(line: 40, column: 34, scope: !141)
!152 = !DILocation(line: 39, column: 5, scope: !141)
!153 = !DILocation(line: 38, column: 24, scope: !141)
!154 = !DILocation(line: 38, column: 3, scope: !141)
!155 = distinct !{!155, !143, !156}
!156 = !DILocation(line: 40, column: 36, scope: !138)
!157 = !DILocation(line: 42, column: 3, scope: !98)
