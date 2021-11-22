; ModuleID = 'deal-cards-for-freecell.c'
source_filename = "deal-cards-for-freecell.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s_suits = dso_local global [5 x i32] [i32 9827, i32 9830, i32 9829, i32 9824, i32 0], align 16, !dbg !0
@s_nums = dso_local global [14 x i32] [i32 65, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 84, i32 74, i32 81, i32 75, i32 0], align 16, !dbg !6
@seed = internal global i32 1, align 4, !dbg !14
@.str = private unnamed_addr constant [17 x i8] c"  \1B[%dm%lc\1B[m%lc\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Hand %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rnd() #0 !dbg !23 {
entry:
  %0 = load i32, i32* @seed, align 4, !dbg !26
  %mul = mul nsw i32 %0, 214013, !dbg !27
  %add = add nsw i32 %mul, 2531011, !dbg !28
  %and = and i32 %add, 2147483647, !dbg !29
  store i32 %and, i32* @seed, align 4, !dbg !30
  %shr = ashr i32 %and, 16, !dbg !31
  ret i32 %shr, !dbg !32
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srnd(i32 %x) #0 !dbg !33 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %x.addr, align 4, !dbg !38
  store i32 %0, i32* @seed, align 4, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i32* %c) #0 !dbg !41 {
entry:
  %c.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %c, i32** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %c.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !53
  %cmp = icmp slt i32 %0, 52, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %c.addr, align 8, !dbg !57
  %2 = load i32, i32* %1, align 4, !dbg !59
  %add = add nsw i32 1, %2, !dbg !60
  %rem = srem i32 %add, 4, !dbg !61
  %div = sdiv i32 %rem, 2, !dbg !62
  %sub = sub nsw i32 32, %div, !dbg !63
  %3 = load i32*, i32** %c.addr, align 8, !dbg !64
  %4 = load i32, i32* %3, align 4, !dbg !65
  %rem1 = srem i32 %4, 4, !dbg !66
  %idxprom = sext i32 %rem1 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @s_suits, i64 0, i64 %idxprom, !dbg !67
  %5 = load i32, i32* %arrayidx, align 4, !dbg !67
  %6 = load i32*, i32** %c.addr, align 8, !dbg !68
  %7 = load i32, i32* %6, align 4, !dbg !69
  %div2 = sdiv i32 %7, 4, !dbg !70
  %idxprom3 = sext i32 %div2 to i64, !dbg !71
  %arrayidx4 = getelementptr inbounds [14 x i32], [14 x i32]* @s_nums, i64 0, i64 %idxprom3, !dbg !71
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %sub, i32 %5, i32 %8), !dbg !72
  %9 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %9, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  %rem5 = srem i32 %inc, 8, !dbg !75
  %tobool = icmp ne i32 %rem5, 0, !dbg !75
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !76, !cf.info !77

lor.lhs.false:                                    ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !78
  %cmp6 = icmp eq i32 %10, 52, !dbg !79
  br i1 %cmp6, label %if.then, label %if.end, !dbg !80, !cf.info !77

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %call7 = call i32 @putchar(i32 10), !dbg !81
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %if.end
  %11 = load i32*, i32** %c.addr, align 8, !dbg !83
  %incdec.ptr = getelementptr inbounds i32, i32* %11, i32 1, !dbg !83
  store i32* %incdec.ptr, i32** %c.addr, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  ret void, !dbg !87
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deal(i32 %s, i32* %t) #0 !dbg !88 {
entry:
  %s.addr = alloca i32, align 4
  %t.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* %t, i32** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %t.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %j, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i32, i32* %s.addr, align 4, !dbg !100
  call void @srnd(i32 %0), !dbg !101
  store i32 0, i32* %i, align 4, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !105
  %cmp = icmp slt i32 %1, 52, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !109
  %sub = sub nsw i32 51, %2, !dbg !110
  %3 = load i32*, i32** %t.addr, align 8, !dbg !111
  %4 = load i32, i32* %i, align 4, !dbg !112
  %idxprom = sext i32 %4 to i64, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !111
  store i32 %sub, i32* %arrayidx, align 4, !dbg !113
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !114
  %inc = add nsw i32 %5, 1, !dbg !114
  store i32 %inc, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !118
  br label %for.cond1, !dbg !120

for.cond1:                                        ; preds = %for.inc14, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !121
  %cmp2 = icmp slt i32 %6, 51, !dbg !123
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !124

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rnd(), !dbg !125
  %7 = load i32, i32* %i, align 4, !dbg !127
  %sub4 = sub nsw i32 52, %7, !dbg !128
  %rem = srem i32 %call, %sub4, !dbg !129
  %sub5 = sub nsw i32 51, %rem, !dbg !130
  store i32 %sub5, i32* %j, align 4, !dbg !131
  %8 = load i32*, i32** %t.addr, align 8, !dbg !132
  %9 = load i32, i32* %i, align 4, !dbg !133
  %idxprom6 = sext i32 %9 to i64, !dbg !132
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6, !dbg !132
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !132
  store i32 %10, i32* %s.addr, align 4, !dbg !134
  %11 = load i32*, i32** %t.addr, align 8, !dbg !135
  %12 = load i32, i32* %j, align 4, !dbg !136
  %idxprom8 = sext i32 %12 to i64, !dbg !135
  %arrayidx9 = getelementptr inbounds i32, i32* %11, i64 %idxprom8, !dbg !135
  %13 = load i32, i32* %arrayidx9, align 4, !dbg !135
  %14 = load i32*, i32** %t.addr, align 8, !dbg !137
  %15 = load i32, i32* %i, align 4, !dbg !138
  %idxprom10 = sext i32 %15 to i64, !dbg !137
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i64 %idxprom10, !dbg !137
  store i32 %13, i32* %arrayidx11, align 4, !dbg !139
  %16 = load i32, i32* %s.addr, align 4, !dbg !140
  %17 = load i32*, i32** %t.addr, align 8, !dbg !141
  %18 = load i32, i32* %j, align 4, !dbg !142
  %idxprom12 = sext i32 %18 to i64, !dbg !141
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !dbg !141
  store i32 %16, i32* %arrayidx13, align 4, !dbg !143
  br label %for.inc14, !dbg !144

for.inc14:                                        ; preds = %for.body3
  %19 = load i32, i32* %i, align 4, !dbg !145
  %inc15 = add nsw i32 %19, 1, !dbg !145
  store i32 %inc15, i32* %i, align 4, !dbg !145
  br label %for.cond1, !dbg !146, !llvm.loop !147

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !150 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %s = alloca i32, align 4
  %card = alloca [52 x i32], align 16
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !156, metadata !DIExpression()), !dbg !157
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %s, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [52 x i32]* %card, metadata !162, metadata !DIExpression()), !dbg !166
  %0 = load i32, i32* %c.addr, align 4, !dbg !167
  %cmp = icmp slt i32 %0, 2, !dbg !169
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !170, !cf.info !77

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !171
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !171
  %call = call i32 @atoi(i8* %2) #5, !dbg !172
  store i32 %call, i32* %s, align 4, !dbg !173
  %cmp1 = icmp sle i32 %call, 0, !dbg !174
  br i1 %cmp1, label %if.then, label %if.end, !dbg !175, !cf.info !77

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 11982, i32* %s, align 4, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %call2 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !178
  %3 = load i32, i32* %s, align 4, !dbg !179
  %arraydecay = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !180
  call void @deal(i32 %3, i32* %arraydecay), !dbg !181
  %4 = load i32, i32* %s, align 4, !dbg !182
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %4), !dbg !183
  %arraydecay4 = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !184
  call void @show(i32* %arraydecay4), !dbg !185
  ret i32 0, !dbg !186
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local i8* @setlocale(i32, i8*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "s_suits", scope: !2, file: !3, line: 5, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "deal-cards-for-freecell.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deal-cards-for-FreeCell")
!4 = !{}
!5 = !{!0, !6, !14}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "s_nums", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 448, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 14)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "seed", scope: !2, file: !3, line: 8, type: !11, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!23 = distinct !DISubprogram(name: "rnd", scope: !3, file: !3, line: 9, type: !24, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{!11}
!26 = !DILocation(line: 9, column: 34, scope: !23)
!27 = !DILocation(line: 9, column: 39, scope: !23)
!28 = !DILocation(line: 9, column: 48, scope: !23)
!29 = !DILocation(line: 9, column: 59, scope: !23)
!30 = !DILocation(line: 9, column: 31, scope: !23)
!31 = !DILocation(line: 9, column: 69, scope: !23)
!32 = !DILocation(line: 9, column: 18, scope: !23)
!33 = distinct !DISubprogram(name: "srnd", scope: !3, file: !3, line: 10, type: !34, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !11}
!36 = !DILocalVariable(name: "x", arg: 1, scope: !33, file: !3, line: 10, type: !11)
!37 = !DILocation(line: 10, column: 15, scope: !33)
!38 = !DILocation(line: 10, column: 27, scope: !33)
!39 = !DILocation(line: 10, column: 25, scope: !33)
!40 = !DILocation(line: 10, column: 30, scope: !33)
!41 = distinct !DISubprogram(name: "show", scope: !3, file: !3, line: 12, type: !42, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!46 = !DILocalVariable(name: "c", arg: 1, scope: !41, file: !3, line: 12, type: !44)
!47 = !DILocation(line: 12, column: 22, scope: !41)
!48 = !DILocalVariable(name: "i", scope: !41, file: !3, line: 14, type: !11)
!49 = !DILocation(line: 14, column: 6, scope: !41)
!50 = !DILocation(line: 15, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !41, file: !3, line: 15, column: 2)
!52 = !DILocation(line: 15, column: 7, scope: !51)
!53 = !DILocation(line: 15, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 15, column: 2)
!55 = !DILocation(line: 15, column: 16, scope: !54)
!56 = !DILocation(line: 15, column: 2, scope: !51)
!57 = !DILocation(line: 16, column: 47, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 15, column: 27)
!59 = !DILocation(line: 16, column: 46, scope: !58)
!60 = !DILocation(line: 16, column: 44, scope: !58)
!61 = !DILocation(line: 16, column: 50, scope: !58)
!62 = !DILocation(line: 16, column: 54, scope: !58)
!63 = !DILocation(line: 16, column: 39, scope: !58)
!64 = !DILocation(line: 17, column: 13, scope: !58)
!65 = !DILocation(line: 17, column: 12, scope: !58)
!66 = !DILocation(line: 17, column: 15, scope: !58)
!67 = !DILocation(line: 17, column: 4, scope: !58)
!68 = !DILocation(line: 17, column: 29, scope: !58)
!69 = !DILocation(line: 17, column: 28, scope: !58)
!70 = !DILocation(line: 17, column: 31, scope: !58)
!71 = !DILocation(line: 17, column: 21, scope: !58)
!72 = !DILocation(line: 16, column: 3, scope: !58)
!73 = !DILocation(line: 18, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !58, file: !3, line: 18, column: 7)
!75 = !DILocation(line: 18, column: 13, scope: !74)
!76 = !DILocation(line: 18, column: 18, scope: !74)
!77 = !{!"if"}
!78 = !DILocation(line: 18, column: 21, scope: !74)
!79 = !DILocation(line: 18, column: 23, scope: !74)
!80 = !DILocation(line: 18, column: 7, scope: !58)
!81 = !DILocation(line: 18, column: 30, scope: !74)
!82 = !DILocation(line: 19, column: 2, scope: !58)
!83 = !DILocation(line: 15, column: 23, scope: !54)
!84 = !DILocation(line: 15, column: 2, scope: !54)
!85 = distinct !{!85, !56, !86}
!86 = !DILocation(line: 19, column: 2, scope: !51)
!87 = !DILocation(line: 20, column: 1, scope: !41)
!88 = distinct !DISubprogram(name: "deal", scope: !3, file: !3, line: 22, type: !89, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{null, !11, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!92 = !DILocalVariable(name: "s", arg: 1, scope: !88, file: !3, line: 22, type: !11)
!93 = !DILocation(line: 22, column: 15, scope: !88)
!94 = !DILocalVariable(name: "t", arg: 2, scope: !88, file: !3, line: 22, type: !91)
!95 = !DILocation(line: 22, column: 23, scope: !88)
!96 = !DILocalVariable(name: "i", scope: !88, file: !3, line: 24, type: !11)
!97 = !DILocation(line: 24, column: 6, scope: !88)
!98 = !DILocalVariable(name: "j", scope: !88, file: !3, line: 24, type: !11)
!99 = !DILocation(line: 24, column: 9, scope: !88)
!100 = !DILocation(line: 25, column: 7, scope: !88)
!101 = !DILocation(line: 25, column: 2, scope: !88)
!102 = !DILocation(line: 27, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !88, file: !3, line: 27, column: 2)
!104 = !DILocation(line: 27, column: 7, scope: !103)
!105 = !DILocation(line: 27, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 27, column: 2)
!107 = !DILocation(line: 27, column: 16, scope: !106)
!108 = !DILocation(line: 27, column: 2, scope: !103)
!109 = !DILocation(line: 27, column: 39, scope: !106)
!110 = !DILocation(line: 27, column: 37, scope: !106)
!111 = !DILocation(line: 27, column: 27, scope: !106)
!112 = !DILocation(line: 27, column: 29, scope: !106)
!113 = !DILocation(line: 27, column: 32, scope: !106)
!114 = !DILocation(line: 27, column: 23, scope: !106)
!115 = !DILocation(line: 27, column: 2, scope: !106)
!116 = distinct !{!116, !108, !117}
!117 = !DILocation(line: 27, column: 39, scope: !103)
!118 = !DILocation(line: 28, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !88, file: !3, line: 28, column: 2)
!120 = !DILocation(line: 28, column: 7, scope: !119)
!121 = !DILocation(line: 28, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !3, line: 28, column: 2)
!123 = !DILocation(line: 28, column: 16, scope: !122)
!124 = !DILocation(line: 28, column: 2, scope: !119)
!125 = !DILocation(line: 29, column: 12, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !3, line: 28, column: 27)
!127 = !DILocation(line: 29, column: 26, scope: !126)
!128 = !DILocation(line: 29, column: 24, scope: !126)
!129 = !DILocation(line: 29, column: 18, scope: !126)
!130 = !DILocation(line: 29, column: 10, scope: !126)
!131 = !DILocation(line: 29, column: 5, scope: !126)
!132 = !DILocation(line: 30, column: 7, scope: !126)
!133 = !DILocation(line: 30, column: 9, scope: !126)
!134 = !DILocation(line: 30, column: 5, scope: !126)
!135 = !DILocation(line: 30, column: 20, scope: !126)
!136 = !DILocation(line: 30, column: 22, scope: !126)
!137 = !DILocation(line: 30, column: 13, scope: !126)
!138 = !DILocation(line: 30, column: 15, scope: !126)
!139 = !DILocation(line: 30, column: 18, scope: !126)
!140 = !DILocation(line: 30, column: 33, scope: !126)
!141 = !DILocation(line: 30, column: 26, scope: !126)
!142 = !DILocation(line: 30, column: 28, scope: !126)
!143 = !DILocation(line: 30, column: 31, scope: !126)
!144 = !DILocation(line: 31, column: 2, scope: !126)
!145 = !DILocation(line: 28, column: 23, scope: !122)
!146 = !DILocation(line: 28, column: 2, scope: !122)
!147 = distinct !{!147, !124, !148}
!148 = !DILocation(line: 31, column: 2, scope: !119)
!149 = !DILocation(line: 32, column: 1, scope: !88)
!150 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 34, type: !151, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DISubroutineType(types: !152)
!152 = !{!11, !11, !153}
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!156 = !DILocalVariable(name: "c", arg: 1, scope: !150, file: !3, line: 34, type: !11)
!157 = !DILocation(line: 34, column: 14, scope: !150)
!158 = !DILocalVariable(name: "v", arg: 2, scope: !150, file: !3, line: 34, type: !153)
!159 = !DILocation(line: 34, column: 24, scope: !150)
!160 = !DILocalVariable(name: "s", scope: !150, file: !3, line: 36, type: !11)
!161 = !DILocation(line: 36, column: 6, scope: !150)
!162 = !DILocalVariable(name: "card", scope: !150, file: !3, line: 36, type: !163)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1664, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 52)
!166 = !DILocation(line: 36, column: 9, scope: !150)
!167 = !DILocation(line: 37, column: 6, scope: !168)
!168 = distinct !DILexicalBlock(scope: !150, file: !3, line: 37, column: 6)
!169 = !DILocation(line: 37, column: 8, scope: !168)
!170 = !DILocation(line: 37, column: 12, scope: !168)
!171 = !DILocation(line: 37, column: 25, scope: !168)
!172 = !DILocation(line: 37, column: 20, scope: !168)
!173 = !DILocation(line: 37, column: 18, scope: !168)
!174 = !DILocation(line: 37, column: 32, scope: !168)
!175 = !DILocation(line: 37, column: 6, scope: !150)
!176 = !DILocation(line: 37, column: 40, scope: !168)
!177 = !DILocation(line: 37, column: 38, scope: !168)
!178 = !DILocation(line: 39, column: 2, scope: !150)
!179 = !DILocation(line: 41, column: 7, scope: !150)
!180 = !DILocation(line: 41, column: 10, scope: !150)
!181 = !DILocation(line: 41, column: 2, scope: !150)
!182 = !DILocation(line: 42, column: 22, scope: !150)
!183 = !DILocation(line: 42, column: 2, scope: !150)
!184 = !DILocation(line: 43, column: 7, scope: !150)
!185 = !DILocation(line: 43, column: 2, scope: !150)
!186 = !DILocation(line: 45, column: 2, scope: !150)
