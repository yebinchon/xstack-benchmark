; ModuleID = 'deal-cards-for-freecell.ll'
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
  call void @llvm.dbg.value(metadata i32 %x, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 %x, i32* @seed, align 4, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i32* %c) #0 !dbg !40 {
entry:
  call void @llvm.dbg.value(metadata i32* %c, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata i32 0, metadata !47, metadata !DIExpression()), !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !50
  %c.addr.0 = phi i32* [ %c, %entry ], [ %incdec.ptr, %for.inc ]
  call void @llvm.dbg.value(metadata i32* %c.addr.0, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !47, metadata !DIExpression()), !dbg !46
  %cmp = icmp slt i32 %i.0, 52, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %c.addr.0, align 4, !dbg !54
  %add = add nsw i32 1, %0, !dbg !56
  %rem = srem i32 %add, 4, !dbg !57
  %div = sdiv i32 %rem, 2, !dbg !58
  %sub = sub nsw i32 32, %div, !dbg !59
  %1 = load i32, i32* %c.addr.0, align 4, !dbg !60
  %rem1 = srem i32 %1, 4, !dbg !61
  %idxprom = sext i32 %rem1 to i64, !dbg !62
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @s_suits, i64 0, i64 %idxprom, !dbg !62
  %2 = load i32, i32* %arrayidx, align 4, !dbg !62
  %3 = load i32, i32* %c.addr.0, align 4, !dbg !63
  %div2 = sdiv i32 %3, 4, !dbg !64
  %idxprom3 = sext i32 %div2 to i64, !dbg !65
  %arrayidx4 = getelementptr inbounds [14 x i32], [14 x i32]* @s_nums, i64 0, i64 %idxprom3, !dbg !65
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !65
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %sub, i32 %2, i32 %4), !dbg !66
  %inc = add nsw i32 %i.0, 1, !dbg !67
  call void @llvm.dbg.value(metadata i32 %inc, metadata !47, metadata !DIExpression()), !dbg !46
  %rem5 = srem i32 %inc, 8, !dbg !69
  %tobool = icmp ne i32 %rem5, 0, !dbg !69
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !70

lor.lhs.false:                                    ; preds = %for.body
  %cmp6 = icmp eq i32 %inc, 52, !dbg !71
  br i1 %cmp6, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %call7 = call i32 @putchar(i32 10), !dbg !73
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %if.end
  %incdec.ptr = getelementptr inbounds i32, i32* %c.addr.0, i32 1, !dbg !75
  call void @llvm.dbg.value(metadata i32* %incdec.ptr, metadata !45, metadata !DIExpression()), !dbg !46
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  ret void, !dbg !79
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deal(i32 %s, i32* %t) #0 !dbg !80 {
entry:
  call void @llvm.dbg.value(metadata i32 %s, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32* %t, metadata !86, metadata !DIExpression()), !dbg !85
  call void @srnd(i32 %s), !dbg !87
  call void @llvm.dbg.value(metadata i32 0, metadata !88, metadata !DIExpression()), !dbg !85
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !91
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !88, metadata !DIExpression()), !dbg !85
  %cmp = icmp slt i32 %i.0, 52, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 51, %i.0, !dbg !95
  %idxprom = sext i32 %i.0 to i64, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %t, i64 %idxprom, !dbg !96
  store i32 %sub, i32* %arrayidx, align 4, !dbg !97
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !98
  call void @llvm.dbg.value(metadata i32 %inc, metadata !88, metadata !DIExpression()), !dbg !85
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !88, metadata !DIExpression()), !dbg !85
  br label %for.cond1, !dbg !102

for.cond1:                                        ; preds = %for.inc14, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !88, metadata !DIExpression()), !dbg !85
  %cmp2 = icmp slt i32 %i.1, 51, !dbg !105
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !107

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rnd(), !dbg !108
  %sub4 = sub nsw i32 52, %i.1, !dbg !110
  %rem = srem i32 %call, %sub4, !dbg !111
  %sub5 = sub nsw i32 51, %rem, !dbg !112
  call void @llvm.dbg.value(metadata i32 %sub5, metadata !113, metadata !DIExpression()), !dbg !85
  %idxprom6 = sext i32 %i.1 to i64, !dbg !114
  %arrayidx7 = getelementptr inbounds i32, i32* %t, i64 %idxprom6, !dbg !114
  %0 = load i32, i32* %arrayidx7, align 4, !dbg !114
  call void @llvm.dbg.value(metadata i32 %0, metadata !84, metadata !DIExpression()), !dbg !85
  %idxprom8 = sext i32 %sub5 to i64, !dbg !115
  %arrayidx9 = getelementptr inbounds i32, i32* %t, i64 %idxprom8, !dbg !115
  %1 = load i32, i32* %arrayidx9, align 4, !dbg !115
  %idxprom10 = sext i32 %i.1 to i64, !dbg !116
  %arrayidx11 = getelementptr inbounds i32, i32* %t, i64 %idxprom10, !dbg !116
  store i32 %1, i32* %arrayidx11, align 4, !dbg !117
  %idxprom12 = sext i32 %sub5 to i64, !dbg !118
  %arrayidx13 = getelementptr inbounds i32, i32* %t, i64 %idxprom12, !dbg !118
  store i32 %0, i32* %arrayidx13, align 4, !dbg !119
  br label %for.inc14, !dbg !120

for.inc14:                                        ; preds = %for.body3
  %inc15 = add nsw i32 %i.1, 1, !dbg !121
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !88, metadata !DIExpression()), !dbg !85
  br label %for.cond1, !dbg !122, !llvm.loop !123

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !126 {
entry:
  %card = alloca [52 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %c, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i8** %v, metadata !134, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [52 x i32]* %card, metadata !135, metadata !DIExpression()), !dbg !139
  %cmp = icmp slt i32 %c, 2, !dbg !140
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !142

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 1, !dbg !143
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !143
  %call = call i32 @atoi(i8* %0) #5, !dbg !144
  call void @llvm.dbg.value(metadata i32 %call, metadata !145, metadata !DIExpression()), !dbg !133
  %cmp1 = icmp sle i32 %call, 0, !dbg !146
  br i1 %cmp1, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @llvm.dbg.value(metadata i32 11982, metadata !145, metadata !DIExpression()), !dbg !133
  br label %if.end, !dbg !148

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %s.0 = phi i32 [ 11982, %if.then ], [ %call, %lor.lhs.false ], !dbg !149
  call void @llvm.dbg.value(metadata i32 %s.0, metadata !145, metadata !DIExpression()), !dbg !133
  %call2 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !150
  %arraydecay = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !151
  call void @deal(i32 %s.0, i32* %arraydecay), !dbg !152
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %s.0), !dbg !153
  %arraydecay4 = getelementptr inbounds [52 x i32], [52 x i32]* %card, i64 0, i64 0, !dbg !154
  call void @show(i32* %arraydecay4), !dbg !155
  ret i32 0, !dbg !156
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local i8* @setlocale(i32, i8*) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!37 = !DILocation(line: 0, scope: !33)
!38 = !DILocation(line: 10, column: 25, scope: !33)
!39 = !DILocation(line: 10, column: 30, scope: !33)
!40 = distinct !DISubprogram(name: "show", scope: !3, file: !3, line: 12, type: !41, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!45 = !DILocalVariable(name: "c", arg: 1, scope: !40, file: !3, line: 12, type: !43)
!46 = !DILocation(line: 0, scope: !40)
!47 = !DILocalVariable(name: "i", scope: !40, file: !3, line: 14, type: !11)
!48 = !DILocation(line: 15, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !3, line: 15, column: 2)
!50 = !DILocation(line: 0, scope: !49)
!51 = !DILocation(line: 15, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !3, line: 15, column: 2)
!53 = !DILocation(line: 15, column: 2, scope: !49)
!54 = !DILocation(line: 16, column: 46, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !3, line: 15, column: 27)
!56 = !DILocation(line: 16, column: 44, scope: !55)
!57 = !DILocation(line: 16, column: 50, scope: !55)
!58 = !DILocation(line: 16, column: 54, scope: !55)
!59 = !DILocation(line: 16, column: 39, scope: !55)
!60 = !DILocation(line: 17, column: 12, scope: !55)
!61 = !DILocation(line: 17, column: 15, scope: !55)
!62 = !DILocation(line: 17, column: 4, scope: !55)
!63 = !DILocation(line: 17, column: 28, scope: !55)
!64 = !DILocation(line: 17, column: 31, scope: !55)
!65 = !DILocation(line: 17, column: 21, scope: !55)
!66 = !DILocation(line: 16, column: 3, scope: !55)
!67 = !DILocation(line: 18, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !55, file: !3, line: 18, column: 7)
!69 = !DILocation(line: 18, column: 13, scope: !68)
!70 = !DILocation(line: 18, column: 18, scope: !68)
!71 = !DILocation(line: 18, column: 23, scope: !68)
!72 = !DILocation(line: 18, column: 7, scope: !55)
!73 = !DILocation(line: 18, column: 30, scope: !68)
!74 = !DILocation(line: 19, column: 2, scope: !55)
!75 = !DILocation(line: 15, column: 23, scope: !52)
!76 = !DILocation(line: 15, column: 2, scope: !52)
!77 = distinct !{!77, !53, !78}
!78 = !DILocation(line: 19, column: 2, scope: !49)
!79 = !DILocation(line: 20, column: 1, scope: !40)
!80 = distinct !DISubprogram(name: "deal", scope: !3, file: !3, line: 22, type: !81, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !11, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!84 = !DILocalVariable(name: "s", arg: 1, scope: !80, file: !3, line: 22, type: !11)
!85 = !DILocation(line: 0, scope: !80)
!86 = !DILocalVariable(name: "t", arg: 2, scope: !80, file: !3, line: 22, type: !83)
!87 = !DILocation(line: 25, column: 2, scope: !80)
!88 = !DILocalVariable(name: "i", scope: !80, file: !3, line: 24, type: !11)
!89 = !DILocation(line: 27, column: 7, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !3, line: 27, column: 2)
!91 = !DILocation(line: 0, scope: !90)
!92 = !DILocation(line: 27, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !3, line: 27, column: 2)
!94 = !DILocation(line: 27, column: 2, scope: !90)
!95 = !DILocation(line: 27, column: 37, scope: !93)
!96 = !DILocation(line: 27, column: 27, scope: !93)
!97 = !DILocation(line: 27, column: 32, scope: !93)
!98 = !DILocation(line: 27, column: 23, scope: !93)
!99 = !DILocation(line: 27, column: 2, scope: !93)
!100 = distinct !{!100, !94, !101}
!101 = !DILocation(line: 27, column: 39, scope: !90)
!102 = !DILocation(line: 28, column: 7, scope: !103)
!103 = distinct !DILexicalBlock(scope: !80, file: !3, line: 28, column: 2)
!104 = !DILocation(line: 0, scope: !103)
!105 = !DILocation(line: 28, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 28, column: 2)
!107 = !DILocation(line: 28, column: 2, scope: !103)
!108 = !DILocation(line: 29, column: 12, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 28, column: 27)
!110 = !DILocation(line: 29, column: 24, scope: !109)
!111 = !DILocation(line: 29, column: 18, scope: !109)
!112 = !DILocation(line: 29, column: 10, scope: !109)
!113 = !DILocalVariable(name: "j", scope: !80, file: !3, line: 24, type: !11)
!114 = !DILocation(line: 30, column: 7, scope: !109)
!115 = !DILocation(line: 30, column: 20, scope: !109)
!116 = !DILocation(line: 30, column: 13, scope: !109)
!117 = !DILocation(line: 30, column: 18, scope: !109)
!118 = !DILocation(line: 30, column: 26, scope: !109)
!119 = !DILocation(line: 30, column: 31, scope: !109)
!120 = !DILocation(line: 31, column: 2, scope: !109)
!121 = !DILocation(line: 28, column: 23, scope: !106)
!122 = !DILocation(line: 28, column: 2, scope: !106)
!123 = distinct !{!123, !107, !124}
!124 = !DILocation(line: 31, column: 2, scope: !103)
!125 = !DILocation(line: 32, column: 1, scope: !80)
!126 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 34, type: !127, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DISubroutineType(types: !128)
!128 = !{!11, !11, !129}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!132 = !DILocalVariable(name: "c", arg: 1, scope: !126, file: !3, line: 34, type: !11)
!133 = !DILocation(line: 0, scope: !126)
!134 = !DILocalVariable(name: "v", arg: 2, scope: !126, file: !3, line: 34, type: !129)
!135 = !DILocalVariable(name: "card", scope: !126, file: !3, line: 36, type: !136)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1664, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 52)
!139 = !DILocation(line: 36, column: 9, scope: !126)
!140 = !DILocation(line: 37, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !126, file: !3, line: 37, column: 6)
!142 = !DILocation(line: 37, column: 12, scope: !141)
!143 = !DILocation(line: 37, column: 25, scope: !141)
!144 = !DILocation(line: 37, column: 20, scope: !141)
!145 = !DILocalVariable(name: "s", scope: !126, file: !3, line: 36, type: !11)
!146 = !DILocation(line: 37, column: 32, scope: !141)
!147 = !DILocation(line: 37, column: 6, scope: !126)
!148 = !DILocation(line: 37, column: 38, scope: !141)
!149 = !DILocation(line: 0, scope: !141)
!150 = !DILocation(line: 39, column: 2, scope: !126)
!151 = !DILocation(line: 41, column: 10, scope: !126)
!152 = !DILocation(line: 41, column: 2, scope: !126)
!153 = !DILocation(line: 42, column: 2, scope: !126)
!154 = !DILocation(line: 43, column: 7, scope: !126)
!155 = !DILocation(line: 43, column: 2, scope: !126)
!156 = !DILocation(line: 45, column: 2, scope: !126)
