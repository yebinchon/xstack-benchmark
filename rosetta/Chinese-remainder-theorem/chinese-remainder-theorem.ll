; ModuleID = 'chinese-remainder-theorem.c'
source_filename = "chinese-remainder-theorem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.n = private unnamed_addr constant [3 x i32] [i32 3, i32 5, i32 7], align 4
@__const.main.a = private unnamed_addr constant [3 x i32] [i32 2, i32 3, i32 2], align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @mul_inv(i32 %a, i32 %b) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %b0 = alloca i32, align 4
  %t = alloca i32, align 4
  %q = alloca i32, align 4
  %x0 = alloca i32, align 4
  %x1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %b0, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %b.addr, align 4, !dbg !17
  store i32 %0, i32* %b0, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %t, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %q, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %x0, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %x0, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %x1, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %x1, align 4, !dbg !25
  %1 = load i32, i32* %b.addr, align 4, !dbg !26
  %cmp = icmp eq i32 %1, 1, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29, !cf.info !30

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !32

while.cond:                                       ; preds = %while.body, %if.end
  %2 = load i32, i32* %a.addr, align 4, !dbg !33
  %cmp1 = icmp sgt i32 %2, 1, !dbg !34
  br i1 %cmp1, label %while.body, label %while.end, !dbg !32

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %a.addr, align 4, !dbg !35
  %4 = load i32, i32* %b.addr, align 4, !dbg !37
  %div = sdiv i32 %3, %4, !dbg !38
  store i32 %div, i32* %q, align 4, !dbg !39
  %5 = load i32, i32* %b.addr, align 4, !dbg !40
  store i32 %5, i32* %t, align 4, !dbg !41
  %6 = load i32, i32* %a.addr, align 4, !dbg !42
  %7 = load i32, i32* %b.addr, align 4, !dbg !43
  %rem = srem i32 %6, %7, !dbg !44
  store i32 %rem, i32* %b.addr, align 4, !dbg !45
  %8 = load i32, i32* %t, align 4, !dbg !46
  store i32 %8, i32* %a.addr, align 4, !dbg !47
  %9 = load i32, i32* %x0, align 4, !dbg !48
  store i32 %9, i32* %t, align 4, !dbg !49
  %10 = load i32, i32* %x1, align 4, !dbg !50
  %11 = load i32, i32* %q, align 4, !dbg !51
  %12 = load i32, i32* %x0, align 4, !dbg !52
  %mul = mul nsw i32 %11, %12, !dbg !53
  %sub = sub nsw i32 %10, %mul, !dbg !54
  store i32 %sub, i32* %x0, align 4, !dbg !55
  %13 = load i32, i32* %t, align 4, !dbg !56
  store i32 %13, i32* %x1, align 4, !dbg !57
  br label %while.cond, !dbg !32, !llvm.loop !58

while.end:                                        ; preds = %while.cond
  %14 = load i32, i32* %x1, align 4, !dbg !60
  %cmp2 = icmp slt i32 %14, 0, !dbg !62
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !63, !cf.info !30

if.then3:                                         ; preds = %while.end
  %15 = load i32, i32* %b0, align 4, !dbg !64
  %16 = load i32, i32* %x1, align 4, !dbg !65
  %add = add nsw i32 %16, %15, !dbg !65
  store i32 %add, i32* %x1, align 4, !dbg !65
  br label %if.end4, !dbg !66

if.end4:                                          ; preds = %if.then3, %while.end
  %17 = load i32, i32* %x1, align 4, !dbg !67
  store i32 %17, i32* %retval, align 4, !dbg !68
  br label %return, !dbg !68

return:                                           ; preds = %if.end4, %if.then
  %18 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %18, !dbg !69
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chinese_remainder(i32* %n, i32* %a, i32 %len) #0 !dbg !70 {
entry:
  %n.addr = alloca i32*, align 8
  %a.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %p = alloca i32, align 4
  %i = alloca i32, align 4
  %prod = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %p, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %i, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %prod, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 1, i32* %prod, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %sum, align 4, !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !91
  %1 = load i32, i32* %len.addr, align 4, !dbg !93
  %cmp = icmp slt i32 %0, %1, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %n.addr, align 8, !dbg !96
  %3 = load i32, i32* %i, align 4, !dbg !97
  %idxprom = sext i32 %3 to i64, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !96
  %4 = load i32, i32* %arrayidx, align 4, !dbg !96
  %5 = load i32, i32* %prod, align 4, !dbg !98
  %mul = mul nsw i32 %5, %4, !dbg !98
  store i32 %mul, i32* %prod, align 4, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !100
  %inc = add nsw i32 %6, 1, !dbg !100
  store i32 %inc, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !104
  br label %for.cond1, !dbg !106

for.cond1:                                        ; preds = %for.inc12, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !107
  %8 = load i32, i32* %len.addr, align 4, !dbg !109
  %cmp2 = icmp slt i32 %7, %8, !dbg !110
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !111

for.body3:                                        ; preds = %for.cond1
  %9 = load i32, i32* %prod, align 4, !dbg !112
  %10 = load i32*, i32** %n.addr, align 8, !dbg !114
  %11 = load i32, i32* %i, align 4, !dbg !115
  %idxprom4 = sext i32 %11 to i64, !dbg !114
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %idxprom4, !dbg !114
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !114
  %div = sdiv i32 %9, %12, !dbg !116
  store i32 %div, i32* %p, align 4, !dbg !117
  %13 = load i32*, i32** %a.addr, align 8, !dbg !118
  %14 = load i32, i32* %i, align 4, !dbg !119
  %idxprom6 = sext i32 %14 to i64, !dbg !118
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !118
  %15 = load i32, i32* %arrayidx7, align 4, !dbg !118
  %16 = load i32, i32* %p, align 4, !dbg !120
  %17 = load i32*, i32** %n.addr, align 8, !dbg !121
  %18 = load i32, i32* %i, align 4, !dbg !122
  %idxprom8 = sext i32 %18 to i64, !dbg !121
  %arrayidx9 = getelementptr inbounds i32, i32* %17, i64 %idxprom8, !dbg !121
  %19 = load i32, i32* %arrayidx9, align 4, !dbg !121
  %call = call i32 @mul_inv(i32 %16, i32 %19), !dbg !123
  %mul10 = mul nsw i32 %15, %call, !dbg !124
  %20 = load i32, i32* %p, align 4, !dbg !125
  %mul11 = mul nsw i32 %mul10, %20, !dbg !126
  %21 = load i32, i32* %sum, align 4, !dbg !127
  %add = add nsw i32 %21, %mul11, !dbg !127
  store i32 %add, i32* %sum, align 4, !dbg !127
  br label %for.inc12, !dbg !128

for.inc12:                                        ; preds = %for.body3
  %22 = load i32, i32* %i, align 4, !dbg !129
  %inc13 = add nsw i32 %22, 1, !dbg !129
  store i32 %inc13, i32* %i, align 4, !dbg !129
  br label %for.cond1, !dbg !130, !llvm.loop !131

for.end14:                                        ; preds = %for.cond1
  %23 = load i32, i32* %sum, align 4, !dbg !133
  %24 = load i32, i32* %prod, align 4, !dbg !134
  %rem = srem i32 %23, %24, !dbg !135
  ret i32 %rem, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !137 {
entry:
  %retval = alloca i32, align 4
  %n = alloca [3 x i32], align 4
  %a = alloca [3 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %n, metadata !140, metadata !DIExpression()), !dbg !144
  %0 = bitcast [3 x i32]* %n to i8*, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.n to i8*), i64 12, i1 false), !dbg !144
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !145, metadata !DIExpression()), !dbg !146
  %1 = bitcast [3 x i32]* %a to i8*, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !146
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %n, i64 0, i64 0, !dbg !147
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !148
  %call = call i32 @chinese_remainder(i32* %arraydecay, i32* %arraydecay1, i32 3), !dbg !149
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !150
  ret i32 0, !dbg !151
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "chinese-remainder-theorem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Chinese-remainder-theorem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "mul_inv", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 17, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 24, scope: !7)
!15 = !DILocalVariable(name: "b0", scope: !7, file: !1, line: 6, type: !10)
!16 = !DILocation(line: 6, column: 6, scope: !7)
!17 = !DILocation(line: 6, column: 11, scope: !7)
!18 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 14, scope: !7)
!20 = !DILocalVariable(name: "q", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 17, scope: !7)
!22 = !DILocalVariable(name: "x0", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 6, scope: !7)
!24 = !DILocalVariable(name: "x1", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 14, scope: !7)
!26 = !DILocation(line: 8, column: 6, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!28 = !DILocation(line: 8, column: 8, scope: !27)
!29 = !DILocation(line: 8, column: 6, scope: !7)
!30 = !{!"if"}
!31 = !DILocation(line: 8, column: 14, scope: !27)
!32 = !DILocation(line: 9, column: 2, scope: !7)
!33 = !DILocation(line: 9, column: 9, scope: !7)
!34 = !DILocation(line: 9, column: 11, scope: !7)
!35 = !DILocation(line: 10, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 16)
!37 = !DILocation(line: 10, column: 11, scope: !36)
!38 = !DILocation(line: 10, column: 9, scope: !36)
!39 = !DILocation(line: 10, column: 5, scope: !36)
!40 = !DILocation(line: 11, column: 7, scope: !36)
!41 = !DILocation(line: 11, column: 5, scope: !36)
!42 = !DILocation(line: 11, column: 14, scope: !36)
!43 = !DILocation(line: 11, column: 18, scope: !36)
!44 = !DILocation(line: 11, column: 16, scope: !36)
!45 = !DILocation(line: 11, column: 12, scope: !36)
!46 = !DILocation(line: 11, column: 25, scope: !36)
!47 = !DILocation(line: 11, column: 23, scope: !36)
!48 = !DILocation(line: 12, column: 7, scope: !36)
!49 = !DILocation(line: 12, column: 5, scope: !36)
!50 = !DILocation(line: 12, column: 16, scope: !36)
!51 = !DILocation(line: 12, column: 21, scope: !36)
!52 = !DILocation(line: 12, column: 25, scope: !36)
!53 = !DILocation(line: 12, column: 23, scope: !36)
!54 = !DILocation(line: 12, column: 19, scope: !36)
!55 = !DILocation(line: 12, column: 14, scope: !36)
!56 = !DILocation(line: 12, column: 34, scope: !36)
!57 = !DILocation(line: 12, column: 32, scope: !36)
!58 = distinct !{!58, !32, !59}
!59 = !DILocation(line: 13, column: 2, scope: !7)
!60 = !DILocation(line: 14, column: 6, scope: !61)
!61 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 6)
!62 = !DILocation(line: 14, column: 9, scope: !61)
!63 = !DILocation(line: 14, column: 6, scope: !7)
!64 = !DILocation(line: 14, column: 20, scope: !61)
!65 = !DILocation(line: 14, column: 17, scope: !61)
!66 = !DILocation(line: 14, column: 14, scope: !61)
!67 = !DILocation(line: 15, column: 9, scope: !7)
!68 = !DILocation(line: 15, column: 2, scope: !7)
!69 = !DILocation(line: 16, column: 1, scope: !7)
!70 = distinct !DISubprogram(name: "chinese_remainder", scope: !1, file: !1, line: 18, type: !71, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!10, !73, !73, !10}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!74 = !DILocalVariable(name: "n", arg: 1, scope: !70, file: !1, line: 18, type: !73)
!75 = !DILocation(line: 18, column: 28, scope: !70)
!76 = !DILocalVariable(name: "a", arg: 2, scope: !70, file: !1, line: 18, type: !73)
!77 = !DILocation(line: 18, column: 36, scope: !70)
!78 = !DILocalVariable(name: "len", arg: 3, scope: !70, file: !1, line: 18, type: !10)
!79 = !DILocation(line: 18, column: 43, scope: !70)
!80 = !DILocalVariable(name: "p", scope: !70, file: !1, line: 20, type: !10)
!81 = !DILocation(line: 20, column: 6, scope: !70)
!82 = !DILocalVariable(name: "i", scope: !70, file: !1, line: 20, type: !10)
!83 = !DILocation(line: 20, column: 9, scope: !70)
!84 = !DILocalVariable(name: "prod", scope: !70, file: !1, line: 20, type: !10)
!85 = !DILocation(line: 20, column: 12, scope: !70)
!86 = !DILocalVariable(name: "sum", scope: !70, file: !1, line: 20, type: !10)
!87 = !DILocation(line: 20, column: 22, scope: !70)
!88 = !DILocation(line: 22, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !70, file: !1, line: 22, column: 2)
!90 = !DILocation(line: 22, column: 7, scope: !89)
!91 = !DILocation(line: 22, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 22, column: 2)
!93 = !DILocation(line: 22, column: 18, scope: !92)
!94 = !DILocation(line: 22, column: 16, scope: !92)
!95 = !DILocation(line: 22, column: 2, scope: !89)
!96 = !DILocation(line: 22, column: 36, scope: !92)
!97 = !DILocation(line: 22, column: 38, scope: !92)
!98 = !DILocation(line: 22, column: 33, scope: !92)
!99 = !DILocation(line: 22, column: 28, scope: !92)
!100 = !DILocation(line: 22, column: 24, scope: !92)
!101 = !DILocation(line: 22, column: 2, scope: !92)
!102 = distinct !{!102, !95, !103}
!103 = !DILocation(line: 22, column: 39, scope: !89)
!104 = !DILocation(line: 24, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !70, file: !1, line: 24, column: 2)
!106 = !DILocation(line: 24, column: 7, scope: !105)
!107 = !DILocation(line: 24, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 24, column: 2)
!109 = !DILocation(line: 24, column: 18, scope: !108)
!110 = !DILocation(line: 24, column: 16, scope: !108)
!111 = !DILocation(line: 24, column: 2, scope: !105)
!112 = !DILocation(line: 25, column: 7, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 24, column: 28)
!114 = !DILocation(line: 25, column: 14, scope: !113)
!115 = !DILocation(line: 25, column: 16, scope: !113)
!116 = !DILocation(line: 25, column: 12, scope: !113)
!117 = !DILocation(line: 25, column: 5, scope: !113)
!118 = !DILocation(line: 26, column: 10, scope: !113)
!119 = !DILocation(line: 26, column: 12, scope: !113)
!120 = !DILocation(line: 26, column: 25, scope: !113)
!121 = !DILocation(line: 26, column: 28, scope: !113)
!122 = !DILocation(line: 26, column: 30, scope: !113)
!123 = !DILocation(line: 26, column: 17, scope: !113)
!124 = !DILocation(line: 26, column: 15, scope: !113)
!125 = !DILocation(line: 26, column: 36, scope: !113)
!126 = !DILocation(line: 26, column: 34, scope: !113)
!127 = !DILocation(line: 26, column: 7, scope: !113)
!128 = !DILocation(line: 27, column: 2, scope: !113)
!129 = !DILocation(line: 24, column: 24, scope: !108)
!130 = !DILocation(line: 24, column: 2, scope: !108)
!131 = distinct !{!131, !111, !132}
!132 = !DILocation(line: 27, column: 2, scope: !105)
!133 = !DILocation(line: 29, column: 9, scope: !70)
!134 = !DILocation(line: 29, column: 15, scope: !70)
!135 = !DILocation(line: 29, column: 13, scope: !70)
!136 = !DILocation(line: 29, column: 2, scope: !70)
!137 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !138, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DISubroutineType(types: !139)
!139 = !{!10}
!140 = !DILocalVariable(name: "n", scope: !137, file: !1, line: 34, type: !141)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 3)
!144 = !DILocation(line: 34, column: 6, scope: !137)
!145 = !DILocalVariable(name: "a", scope: !137, file: !1, line: 35, type: !141)
!146 = !DILocation(line: 35, column: 6, scope: !137)
!147 = !DILocation(line: 37, column: 35, scope: !137)
!148 = !DILocation(line: 37, column: 38, scope: !137)
!149 = !DILocation(line: 37, column: 17, scope: !137)
!150 = !DILocation(line: 37, column: 2, scope: !137)
!151 = !DILocation(line: 38, column: 2, scope: !137)
