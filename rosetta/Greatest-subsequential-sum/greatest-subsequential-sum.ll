; ModuleID = 'greatest-subsequential-sum.c'
source_filename = "greatest-subsequential-sum.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Range = type { i32, i32, i32 }

@__const.main.a = private unnamed_addr constant [11 x i32] [i32 -1, i32 -2, i32 3, i32 5, i32 6, i32 -2, i32 -1, i32 4, i32 -4, i32 2, i32 -1], align 16
@.str = private unnamed_addr constant [14 x i8] c"Max sum = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i32 } @maxSubseq(i32* %sequence, i32 %len) #0 !dbg !7 {
entry:
  %retval = alloca %struct.Range, align 4
  %sequence.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %maxSum = alloca i32, align 4
  %thisSum = alloca i32, align 4
  %i = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = alloca { i64, i32 }, align 8
  store i32* %sequence, i32** %sequence.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %sequence.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %maxSum, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %maxSum, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %thisSum, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %thisSum, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %i, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %start, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %start, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %end, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 -1, i32* %end, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %j, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %j, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !38
  %1 = load i32, i32* %len.addr, align 4, !dbg !40
  %cmp = icmp slt i32 %0, %1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %sequence.addr, align 8, !dbg !43
  %3 = load i32, i32* %j, align 4, !dbg !45
  %idxprom = sext i32 %3 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !43
  %4 = load i32, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32, i32* %thisSum, align 4, !dbg !46
  %add = add nsw i32 %5, %4, !dbg !46
  store i32 %add, i32* %thisSum, align 4, !dbg !46
  %6 = load i32, i32* %thisSum, align 4, !dbg !47
  %cmp1 = icmp slt i32 %6, 0, !dbg !49
  br i1 %cmp1, label %if.then, label %if.else, !dbg !50, !cf.info !51

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %j, align 4, !dbg !52
  %add2 = add nsw i32 %7, 1, !dbg !54
  store i32 %add2, i32* %i, align 4, !dbg !55
  store i32 0, i32* %thisSum, align 4, !dbg !56
  br label %if.end5, !dbg !57

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %thisSum, align 4, !dbg !58
  %9 = load i32, i32* %maxSum, align 4, !dbg !60
  %cmp3 = icmp sgt i32 %8, %9, !dbg !61
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !62, !cf.info !51

if.then4:                                         ; preds = %if.else
  %10 = load i32, i32* %thisSum, align 4, !dbg !63
  store i32 %10, i32* %maxSum, align 4, !dbg !65
  %11 = load i32, i32* %i, align 4, !dbg !66
  store i32 %11, i32* %start, align 4, !dbg !67
  %12 = load i32, i32* %j, align 4, !dbg !68
  store i32 %12, i32* %end, align 4, !dbg !69
  br label %if.end, !dbg !70

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %if.end5
  %13 = load i32, i32* %j, align 4, !dbg !72
  %inc = add nsw i32 %13, 1, !dbg !72
  store i32 %inc, i32* %j, align 4, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Range* %retval, metadata !76, metadata !DIExpression()), !dbg !77
  %14 = load i32, i32* %start, align 4, !dbg !78
  %15 = load i32, i32* %end, align 4, !dbg !80
  %cmp6 = icmp sle i32 %14, %15, !dbg !81
  br i1 %cmp6, label %land.lhs.true, label %if.else14, !dbg !82, !cf.info !51

land.lhs.true:                                    ; preds = %for.end
  %16 = load i32, i32* %start, align 4, !dbg !83
  %cmp7 = icmp sge i32 %16, 0, !dbg !84
  br i1 %cmp7, label %land.lhs.true8, label %if.else14, !dbg !85, !cf.info !51

land.lhs.true8:                                   ; preds = %land.lhs.true
  %17 = load i32, i32* %end, align 4, !dbg !86
  %cmp9 = icmp sge i32 %17, 0, !dbg !87
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !88, !cf.info !51

if.then10:                                        ; preds = %land.lhs.true8
  %18 = load i32, i32* %start, align 4, !dbg !89
  %start11 = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 0, !dbg !91
  store i32 %18, i32* %start11, align 4, !dbg !92
  %19 = load i32, i32* %end, align 4, !dbg !93
  %add12 = add nsw i32 %19, 1, !dbg !94
  %end13 = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 1, !dbg !95
  store i32 %add12, i32* %end13, align 4, !dbg !96
  %20 = load i32, i32* %maxSum, align 4, !dbg !97
  %sum = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 2, !dbg !98
  store i32 %20, i32* %sum, align 4, !dbg !99
  br label %if.end18, !dbg !100

if.else14:                                        ; preds = %land.lhs.true8, %land.lhs.true, %for.end
  %start15 = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 0, !dbg !101
  store i32 0, i32* %start15, align 4, !dbg !103
  %end16 = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 1, !dbg !104
  store i32 0, i32* %end16, align 4, !dbg !105
  %sum17 = getelementptr inbounds %struct.Range, %struct.Range* %retval, i32 0, i32 2, !dbg !106
  store i32 0, i32* %sum17, align 4, !dbg !107
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then10
  %21 = bitcast { i64, i32 }* %tmp to i8*, !dbg !108
  %22 = bitcast %struct.Range* %retval to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %21, i8* align 4 %22, i64 12, i1 false), !dbg !108
  %23 = load { i64, i32 }, { i64, i32 }* %tmp, align 8, !dbg !108
  ret { i64, i32 } %23, !dbg !108
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca [11 x i32], align 16
  %alength = alloca i32, align 4
  %r = alloca %struct.Range, align 4
  %tmp = alloca { i64, i32 }, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [11 x i32]* %a, metadata !119, metadata !DIExpression()), !dbg !123
  %0 = bitcast [11 x i32]* %a to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.main.a to i8*), i64 44, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %alength, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 11, i32* %alength, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata %struct.Range* %r, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %a, i64 0, i64 0, !dbg !128
  %1 = load i32, i32* %alength, align 4, !dbg !129
  %call = call { i64, i32 } @maxSubseq(i32* %arraydecay, i32 %1), !dbg !130
  store { i64, i32 } %call, { i64, i32 }* %tmp, align 8, !dbg !130
  %2 = bitcast { i64, i32 }* %tmp to i8*, !dbg !130
  %3 = bitcast %struct.Range* %r to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 8 %2, i64 12, i1 false), !dbg !130
  %sum = getelementptr inbounds %struct.Range, %struct.Range* %r, i32 0, i32 2, !dbg !131
  %4 = load i32, i32* %sum, align 4, !dbg !131
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %4), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !133, metadata !DIExpression()), !dbg !134
  %start = getelementptr inbounds %struct.Range, %struct.Range* %r, i32 0, i32 0, !dbg !135
  %5 = load i32, i32* %start, align 4, !dbg !135
  store i32 %5, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !139
  %end = getelementptr inbounds %struct.Range, %struct.Range* %r, i32 0, i32 1, !dbg !141
  %7 = load i32, i32* %end, align 4, !dbg !141
  %cmp = icmp slt i32 %6, %7, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !144
  %idxprom = sext i32 %8 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %a, i64 0, i64 %idxprom, !dbg !145
  %9 = load i32, i32* %arrayidx, align 4, !dbg !145
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %9), !dbg !146
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %10, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !151
  ret i32 0, !dbg !152
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "greatest-subsequential-sum.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Greatest-subsequential-sum")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "maxSubseq", scope: !1, file: !1, line: 7, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !17, !18}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "Range", file: !1, line: 5, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Range", file: !1, line: 3, size: 96, elements: !12)
!12 = !{!13, !15, !16}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "start", scope: !11, file: !1, line: 4, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !11, file: !1, line: 4, baseType: !14, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "sum", scope: !11, file: !1, line: 4, baseType: !14, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!19 = !DILocalVariable(name: "sequence", arg: 1, scope: !7, file: !1, line: 7, type: !17)
!20 = !DILocation(line: 7, column: 27, scope: !7)
!21 = !DILocalVariable(name: "len", arg: 2, scope: !7, file: !1, line: 7, type: !18)
!22 = !DILocation(line: 7, column: 49, scope: !7)
!23 = !DILocalVariable(name: "maxSum", scope: !7, file: !1, line: 8, type: !14)
!24 = !DILocation(line: 8, column: 9, scope: !7)
!25 = !DILocalVariable(name: "thisSum", scope: !7, file: !1, line: 8, type: !14)
!26 = !DILocation(line: 8, column: 21, scope: !7)
!27 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !14)
!28 = !DILocation(line: 8, column: 34, scope: !7)
!29 = !DILocalVariable(name: "start", scope: !7, file: !1, line: 9, type: !14)
!30 = !DILocation(line: 9, column: 9, scope: !7)
!31 = !DILocalVariable(name: "end", scope: !7, file: !1, line: 9, type: !14)
!32 = !DILocation(line: 9, column: 20, scope: !7)
!33 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 9, type: !14)
!34 = !DILocation(line: 9, column: 30, scope: !7)
!35 = !DILocation(line: 11, column: 12, scope: !36)
!36 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 5)
!37 = !DILocation(line: 11, column: 10, scope: !36)
!38 = !DILocation(line: 11, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 11, column: 5)
!40 = !DILocation(line: 11, column: 21, scope: !39)
!41 = !DILocation(line: 11, column: 19, scope: !39)
!42 = !DILocation(line: 11, column: 5, scope: !36)
!43 = !DILocation(line: 12, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !1, line: 11, column: 31)
!45 = !DILocation(line: 12, column: 29, scope: !44)
!46 = !DILocation(line: 12, column: 17, scope: !44)
!47 = !DILocation(line: 13, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 13, column: 13)
!49 = !DILocation(line: 13, column: 21, scope: !48)
!50 = !DILocation(line: 13, column: 13, scope: !44)
!51 = !{!"if"}
!52 = !DILocation(line: 14, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 13, column: 26)
!54 = !DILocation(line: 14, column: 19, scope: !53)
!55 = !DILocation(line: 14, column: 15, scope: !53)
!56 = !DILocation(line: 15, column: 21, scope: !53)
!57 = !DILocation(line: 16, column: 9, scope: !53)
!58 = !DILocation(line: 16, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !1, line: 16, column: 20)
!60 = !DILocation(line: 16, column: 30, scope: !59)
!61 = !DILocation(line: 16, column: 28, scope: !59)
!62 = !DILocation(line: 16, column: 20, scope: !48)
!63 = !DILocation(line: 17, column: 22, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 16, column: 38)
!65 = !DILocation(line: 17, column: 20, scope: !64)
!66 = !DILocation(line: 18, column: 21, scope: !64)
!67 = !DILocation(line: 18, column: 19, scope: !64)
!68 = !DILocation(line: 19, column: 21, scope: !64)
!69 = !DILocation(line: 19, column: 19, scope: !64)
!70 = !DILocation(line: 20, column: 9, scope: !64)
!71 = !DILocation(line: 21, column: 5, scope: !44)
!72 = !DILocation(line: 11, column: 27, scope: !39)
!73 = !DILocation(line: 11, column: 5, scope: !39)
!74 = distinct !{!74, !42, !75}
!75 = !DILocation(line: 21, column: 5, scope: !36)
!76 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 23, type: !10)
!77 = !DILocation(line: 23, column: 11, scope: !7)
!78 = !DILocation(line: 24, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 9)
!80 = !DILocation(line: 24, column: 18, scope: !79)
!81 = !DILocation(line: 24, column: 15, scope: !79)
!82 = !DILocation(line: 24, column: 22, scope: !79)
!83 = !DILocation(line: 24, column: 25, scope: !79)
!84 = !DILocation(line: 24, column: 31, scope: !79)
!85 = !DILocation(line: 24, column: 36, scope: !79)
!86 = !DILocation(line: 24, column: 39, scope: !79)
!87 = !DILocation(line: 24, column: 43, scope: !79)
!88 = !DILocation(line: 24, column: 9, scope: !7)
!89 = !DILocation(line: 25, column: 19, scope: !90)
!90 = distinct !DILexicalBlock(scope: !79, file: !1, line: 24, column: 49)
!91 = !DILocation(line: 25, column: 11, scope: !90)
!92 = !DILocation(line: 25, column: 17, scope: !90)
!93 = !DILocation(line: 26, column: 17, scope: !90)
!94 = !DILocation(line: 26, column: 21, scope: !90)
!95 = !DILocation(line: 26, column: 11, scope: !90)
!96 = !DILocation(line: 26, column: 15, scope: !90)
!97 = !DILocation(line: 27, column: 17, scope: !90)
!98 = !DILocation(line: 27, column: 11, scope: !90)
!99 = !DILocation(line: 27, column: 15, scope: !90)
!100 = !DILocation(line: 28, column: 5, scope: !90)
!101 = !DILocation(line: 29, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !79, file: !1, line: 28, column: 12)
!103 = !DILocation(line: 29, column: 17, scope: !102)
!104 = !DILocation(line: 30, column: 11, scope: !102)
!105 = !DILocation(line: 30, column: 15, scope: !102)
!106 = !DILocation(line: 31, column: 11, scope: !102)
!107 = !DILocation(line: 31, column: 15, scope: !102)
!108 = !DILocation(line: 33, column: 5, scope: !7)
!109 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !110, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!14, !14, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !1, line: 36, type: !14)
!116 = !DILocation(line: 36, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !1, line: 36, type: !112)
!118 = !DILocation(line: 36, column: 27, scope: !109)
!119 = !DILocalVariable(name: "a", scope: !109, file: !1, line: 37, type: !120)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 352, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 11)
!123 = !DILocation(line: 37, column: 9, scope: !109)
!124 = !DILocalVariable(name: "alength", scope: !109, file: !1, line: 38, type: !14)
!125 = !DILocation(line: 38, column: 9, scope: !109)
!126 = !DILocalVariable(name: "r", scope: !109, file: !1, line: 40, type: !10)
!127 = !DILocation(line: 40, column: 11, scope: !109)
!128 = !DILocation(line: 40, column: 25, scope: !109)
!129 = !DILocation(line: 40, column: 28, scope: !109)
!130 = !DILocation(line: 40, column: 15, scope: !109)
!131 = !DILocation(line: 41, column: 32, scope: !109)
!132 = !DILocation(line: 41, column: 5, scope: !109)
!133 = !DILocalVariable(name: "i", scope: !109, file: !1, line: 42, type: !14)
!134 = !DILocation(line: 42, column: 9, scope: !109)
!135 = !DILocation(line: 43, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !109, file: !1, line: 43, column: 5)
!137 = !DILocation(line: 43, column: 12, scope: !136)
!138 = !DILocation(line: 43, column: 10, scope: !136)
!139 = !DILocation(line: 43, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 43, column: 5)
!141 = !DILocation(line: 43, column: 29, scope: !140)
!142 = !DILocation(line: 43, column: 25, scope: !140)
!143 = !DILocation(line: 43, column: 5, scope: !136)
!144 = !DILocation(line: 44, column: 25, scope: !140)
!145 = !DILocation(line: 44, column: 23, scope: !140)
!146 = !DILocation(line: 44, column: 9, scope: !140)
!147 = !DILocation(line: 43, column: 35, scope: !140)
!148 = !DILocation(line: 43, column: 5, scope: !140)
!149 = distinct !{!149, !143, !150}
!150 = !DILocation(line: 44, column: 27, scope: !136)
!151 = !DILocation(line: 45, column: 5, scope: !109)
!152 = !DILocation(line: 47, column: 5, scope: !109)
