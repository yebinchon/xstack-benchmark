; ModuleID = 'deal-cards-for-freecell.bc'
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
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !76

lor.lhs.false:                                    ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !77
  %cmp6 = icmp eq i32 %10, 52, !dbg !78
  br i1 %cmp6, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %call7 = call i32 @putchar(i32 10), !dbg !80
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %if.end
  %11 = load i32*, i32** %c.addr, align 8, !dbg !82
  %incdec.ptr = getelementptr inbounds i32, i32* %11, i32 1, !dbg !82
  store i32* %incdec.ptr, i32** %c.addr, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  ret void, !dbg !86
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deal(i32 %s, i32* %t) #0 !dbg !87 {
entry:
  %s.addr = alloca i32, align 4
  %t.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* %t, i32** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %t.addr, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %i, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32* %j, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32, i32* %s.addr, align 4, !dbg !99
  call void @srnd(i32 %0), !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !104
  %cmp = icmp slt i32 %1, 52, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !108
  %sub = sub nsw i32 51, %2, !dbg !109
  %3 = load i32*, i32** %t.addr, align 8, !dbg !110
  %4 = load i32, i32* %i, align 4, !dbg !111
  %idxprom = sext i32 %4 to i64, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !110
  store i32 %sub, i32* %arrayidx, align 4, !dbg !112
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !113
  %inc = add nsw i32 %5, 1, !dbg !113
  store i32 %inc, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond1, !dbg !119

for.cond1:                                        ; preds = %for.inc14, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !120
  %cmp2 = icmp slt i32 %6, 51, !dbg !122
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !123

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rnd(), !dbg !124
  %7 = load i32, i32* %i, align 4, !dbg !126
  %sub4 = sub nsw i32 52, %7, !dbg !127
  %rem = srem i32 %call, %sub4, !dbg !128
  %sub5 = sub nsw i32 51, %rem, !dbg !129
  store i32 %sub5, i32* %j, align 4, !dbg !130
  %8 = load i32*, i32** %t.addr, align 8, !dbg !131
  %9 = load i32, i32* %i, align 4, !dbg !132
  %idxprom6 = sext i32 %9 to i64, !dbg !131
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6, !dbg !131
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !131
  store i32 %10, i32* %s.addr, align 4, !dbg !133
  %11 = load i32*, i32** %t.addr, align 8, !dbg !134
  %12 = load i32, i32* %j, align 4, !dbg !135
  %idxprom8 = sext i32 %12 to i64, !dbg !134
  %arrayidx9 = getelementptr inbounds i32, i32* %11, i64 %idxprom8, !dbg !134
  %13 = load i32, i32* %arrayidx9, align 4, !dbg !134
  %14 = load i32*, i32** %t.addr, align 8, !dbg !136
  %15 = load i32, i32* %i, align 4, !dbg !137
  %idxprom10 = sext i32 %15 to i64, !dbg !136
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i64 %idxprom10, !dbg !136
  store i32 %13, i32* %arrayidx11, align 4, !dbg !138
  %16 = load i32, i32* %s.addr, align 4, !dbg !139
  %17 = load i32*, i32** %t.addr, align 8, !dbg !140
  %18 = load i32, i32* %j, align 4, !dbg !141
  %idxprom12 = sext i32 %18 to i64, !dbg !140
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !dbg !140
  store i32 %16, i32* %arrayidx13, align 4, !dbg !142
  br label %for.inc14, !dbg !143

for.inc14:                                        ; preds = %for.body3
  %19 = load i32, i32* %i, align 4, !dbg !144
  %inc15 = add nsw i32 %19, 1, !dbg !144
  store i32 %inc15, i32* %i, align 4, !dbg !144
  br label %for.cond1, !dbg !145, !llvm.loop !146

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !149 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %s = alloca i32, align 4
  %card = alloca [52 x i32], align 16
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !155, metadata !DIExpression()), !dbg !156
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %s, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [52 x i32]* %card, metadata !161, metadata !DIExpression()), !dbg !165
  %0 = load i32, i32* %c.addr, align 4, !dbg !166
  %cmp = icmp slt i32 %0, 2, !dbg !168
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !169

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !170
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !170
  %call = call i32 @atoi(i8* %2) #5, !dbg !171
  store i32 %call, i32* %s, align 4, !dbg !172
  %cmp1 = icmp sle i32 %call, 0, !dbg !173
  br i1 %cmp1, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 11982, i32* %s, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %call2 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !177
  %3 = load i32, i32* %s, align 4, !dbg !178
  %arraydecay = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !179
  call void @deal(i32 %3, i32* %arraydecay), !dbg !180
  %4 = load i32, i32* %s, align 4, !dbg !181
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %4), !dbg !182
  %arraydecay4 = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !183
  call void @show(i32* %arraydecay4), !dbg !184
  ret i32 0, !dbg !185
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "deal-cards-for-freecell.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deal-cards-for-FreeCell")
!4 = !{}
!5 = !{!0, !6, !14}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "s_nums", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 448, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
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
!22 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!77 = !DILocation(line: 18, column: 21, scope: !74)
!78 = !DILocation(line: 18, column: 23, scope: !74)
!79 = !DILocation(line: 18, column: 7, scope: !58)
!80 = !DILocation(line: 18, column: 30, scope: !74)
!81 = !DILocation(line: 19, column: 2, scope: !58)
!82 = !DILocation(line: 15, column: 23, scope: !54)
!83 = !DILocation(line: 15, column: 2, scope: !54)
!84 = distinct !{!84, !56, !85}
!85 = !DILocation(line: 19, column: 2, scope: !51)
!86 = !DILocation(line: 20, column: 1, scope: !41)
!87 = distinct !DISubprogram(name: "deal", scope: !3, file: !3, line: 22, type: !88, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{null, !11, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!91 = !DILocalVariable(name: "s", arg: 1, scope: !87, file: !3, line: 22, type: !11)
!92 = !DILocation(line: 22, column: 15, scope: !87)
!93 = !DILocalVariable(name: "t", arg: 2, scope: !87, file: !3, line: 22, type: !90)
!94 = !DILocation(line: 22, column: 23, scope: !87)
!95 = !DILocalVariable(name: "i", scope: !87, file: !3, line: 24, type: !11)
!96 = !DILocation(line: 24, column: 6, scope: !87)
!97 = !DILocalVariable(name: "j", scope: !87, file: !3, line: 24, type: !11)
!98 = !DILocation(line: 24, column: 9, scope: !87)
!99 = !DILocation(line: 25, column: 7, scope: !87)
!100 = !DILocation(line: 25, column: 2, scope: !87)
!101 = !DILocation(line: 27, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !87, file: !3, line: 27, column: 2)
!103 = !DILocation(line: 27, column: 7, scope: !102)
!104 = !DILocation(line: 27, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 27, column: 2)
!106 = !DILocation(line: 27, column: 16, scope: !105)
!107 = !DILocation(line: 27, column: 2, scope: !102)
!108 = !DILocation(line: 27, column: 39, scope: !105)
!109 = !DILocation(line: 27, column: 37, scope: !105)
!110 = !DILocation(line: 27, column: 27, scope: !105)
!111 = !DILocation(line: 27, column: 29, scope: !105)
!112 = !DILocation(line: 27, column: 32, scope: !105)
!113 = !DILocation(line: 27, column: 23, scope: !105)
!114 = !DILocation(line: 27, column: 2, scope: !105)
!115 = distinct !{!115, !107, !116}
!116 = !DILocation(line: 27, column: 39, scope: !102)
!117 = !DILocation(line: 28, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !87, file: !3, line: 28, column: 2)
!119 = !DILocation(line: 28, column: 7, scope: !118)
!120 = !DILocation(line: 28, column: 14, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 28, column: 2)
!122 = !DILocation(line: 28, column: 16, scope: !121)
!123 = !DILocation(line: 28, column: 2, scope: !118)
!124 = !DILocation(line: 29, column: 12, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !3, line: 28, column: 27)
!126 = !DILocation(line: 29, column: 26, scope: !125)
!127 = !DILocation(line: 29, column: 24, scope: !125)
!128 = !DILocation(line: 29, column: 18, scope: !125)
!129 = !DILocation(line: 29, column: 10, scope: !125)
!130 = !DILocation(line: 29, column: 5, scope: !125)
!131 = !DILocation(line: 30, column: 7, scope: !125)
!132 = !DILocation(line: 30, column: 9, scope: !125)
!133 = !DILocation(line: 30, column: 5, scope: !125)
!134 = !DILocation(line: 30, column: 20, scope: !125)
!135 = !DILocation(line: 30, column: 22, scope: !125)
!136 = !DILocation(line: 30, column: 13, scope: !125)
!137 = !DILocation(line: 30, column: 15, scope: !125)
!138 = !DILocation(line: 30, column: 18, scope: !125)
!139 = !DILocation(line: 30, column: 33, scope: !125)
!140 = !DILocation(line: 30, column: 26, scope: !125)
!141 = !DILocation(line: 30, column: 28, scope: !125)
!142 = !DILocation(line: 30, column: 31, scope: !125)
!143 = !DILocation(line: 31, column: 2, scope: !125)
!144 = !DILocation(line: 28, column: 23, scope: !121)
!145 = !DILocation(line: 28, column: 2, scope: !121)
!146 = distinct !{!146, !123, !147}
!147 = !DILocation(line: 31, column: 2, scope: !118)
!148 = !DILocation(line: 32, column: 1, scope: !87)
!149 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 34, type: !150, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DISubroutineType(types: !151)
!151 = !{!11, !11, !152}
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!155 = !DILocalVariable(name: "c", arg: 1, scope: !149, file: !3, line: 34, type: !11)
!156 = !DILocation(line: 34, column: 14, scope: !149)
!157 = !DILocalVariable(name: "v", arg: 2, scope: !149, file: !3, line: 34, type: !152)
!158 = !DILocation(line: 34, column: 24, scope: !149)
!159 = !DILocalVariable(name: "s", scope: !149, file: !3, line: 36, type: !11)
!160 = !DILocation(line: 36, column: 6, scope: !149)
!161 = !DILocalVariable(name: "card", scope: !149, file: !3, line: 36, type: !162)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1664, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 52)
!165 = !DILocation(line: 36, column: 9, scope: !149)
!166 = !DILocation(line: 37, column: 6, scope: !167)
!167 = distinct !DILexicalBlock(scope: !149, file: !3, line: 37, column: 6)
!168 = !DILocation(line: 37, column: 8, scope: !167)
!169 = !DILocation(line: 37, column: 12, scope: !167)
!170 = !DILocation(line: 37, column: 25, scope: !167)
!171 = !DILocation(line: 37, column: 20, scope: !167)
!172 = !DILocation(line: 37, column: 18, scope: !167)
!173 = !DILocation(line: 37, column: 32, scope: !167)
!174 = !DILocation(line: 37, column: 6, scope: !149)
!175 = !DILocation(line: 37, column: 40, scope: !167)
!176 = !DILocation(line: 37, column: 38, scope: !167)
!177 = !DILocation(line: 39, column: 2, scope: !149)
!178 = !DILocation(line: 41, column: 7, scope: !149)
!179 = !DILocation(line: 41, column: 10, scope: !149)
!180 = !DILocation(line: 41, column: 2, scope: !149)
!181 = !DILocation(line: 42, column: 22, scope: !149)
!182 = !DILocation(line: 42, column: 2, scope: !149)
!183 = !DILocation(line: 43, column: 7, scope: !149)
!184 = !DILocation(line: 43, column: 2, scope: !149)
!185 = !DILocation(line: 45, column: 2, scope: !149)
