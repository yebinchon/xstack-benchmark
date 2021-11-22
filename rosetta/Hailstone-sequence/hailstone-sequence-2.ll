; ModuleID = 'hailstone-sequence-2.c'
source_filename = "hailstone-sequence-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cache = dso_local global [10000000 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [29 x i8] c"max below %d: %d, length %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @hailstone(i64 %n) #0 !dbg !15 {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %x = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !22
  %0 = load i64, i64* %n.addr, align 8, !dbg !23
  %cmp = icmp eq i64 %0, 1, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26, !cf.info !27

if.then:                                          ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !28
  br label %return, !dbg !28

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %n.addr, align 8, !dbg !29
  %cmp1 = icmp ult i64 %1, 10000000, !dbg !31
  br i1 %cmp1, label %land.lhs.true, label %if.end4, !dbg !32, !cf.info !27

land.lhs.true:                                    ; preds = %if.end
  %2 = load i64, i64* %n.addr, align 8, !dbg !33
  %arrayidx = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %2, !dbg !34
  %3 = load i64, i64* %arrayidx, align 8, !dbg !34
  %tobool = icmp ne i64 %3, 0, !dbg !34
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !35, !cf.info !27

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i64, i64* %n.addr, align 8, !dbg !36
  %arrayidx3 = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %4, !dbg !37
  %5 = load i64, i64* %arrayidx3, align 8, !dbg !37
  store i64 %5, i64* %retval, align 8, !dbg !38
  br label %return, !dbg !38

if.end4:                                          ; preds = %land.lhs.true, %if.end
  %6 = load i64, i64* %n.addr, align 8, !dbg !39
  %and = and i64 %6, 1, !dbg !40
  %tobool5 = icmp ne i64 %and, 0, !dbg !40
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !41

cond.true:                                        ; preds = %if.end4
  %7 = load i64, i64* %n.addr, align 8, !dbg !42
  %mul = mul i64 3, %7, !dbg !43
  %add = add i64 %mul, 1, !dbg !44
  br label %cond.end, !dbg !41

cond.false:                                       ; preds = %if.end4
  %8 = load i64, i64* %n.addr, align 8, !dbg !45
  %div = udiv i64 %8, 2, !dbg !46
  br label %cond.end, !dbg !41

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ %div, %cond.false ], !dbg !41
  %call = call i64 @hailstone(i64 %cond), !dbg !47
  %add6 = add i64 1, %call, !dbg !48
  %conv = trunc i64 %add6 to i32, !dbg !49
  store i32 %conv, i32* %x, align 4, !dbg !50
  %9 = load i64, i64* %n.addr, align 8, !dbg !51
  %cmp7 = icmp ult i64 %9, 10000000, !dbg !53
  br i1 %cmp7, label %if.then9, label %if.end12, !dbg !54, !cf.info !27

if.then9:                                         ; preds = %cond.end
  %10 = load i32, i32* %x, align 4, !dbg !55
  %conv10 = sext i32 %10 to i64, !dbg !55
  %11 = load i64, i64* %n.addr, align 8, !dbg !56
  %arrayidx11 = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %11, !dbg !57
  store i64 %conv10, i64* %arrayidx11, align 8, !dbg !58
  br label %if.end12, !dbg !57

if.end12:                                         ; preds = %if.then9, %cond.end
  %12 = load i32, i32* %x, align 4, !dbg !59
  %conv13 = sext i32 %12 to i64, !dbg !59
  store i64 %conv13, i64* %retval, align 8, !dbg !60
  br label %return, !dbg !60

return:                                           ; preds = %if.end12, %if.then2, %if.then
  %13 = load i64, i64* %retval, align 8, !dbg !61
  ret i64 %13, !dbg !61
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %max = alloca i32, align 4
  %mi = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %l, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32* %max, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 0, i32* %max, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %mi, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 1, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !76
  %cmp = icmp slt i32 %0, 10000000, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !80
  %conv = sext i32 %1 to i64, !dbg !80
  %call = call i64 @hailstone(i64 %conv), !dbg !83
  %conv1 = trunc i64 %call to i32, !dbg !83
  store i32 %conv1, i32* %l, align 4, !dbg !84
  %2 = load i32, i32* %max, align 4, !dbg !85
  %cmp2 = icmp sgt i32 %conv1, %2, !dbg !86
  br i1 %cmp2, label %if.then, label %if.end, !dbg !87, !cf.info !27

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %l, align 4, !dbg !88
  store i32 %3, i32* %max, align 4, !dbg !90
  %4 = load i32, i32* %i, align 4, !dbg !91
  store i32 %4, i32* %mi, align 4, !dbg !92
  br label %if.end, !dbg !93

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !95
  %inc = add nsw i32 %5, 1, !dbg !95
  store i32 %inc, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %mi, align 4, !dbg !99
  %7 = load i32, i32* %max, align 4, !dbg !100
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i32 10000000, i32 %6, i32 %7), !dbg !101
  ret i32 0, !dbg !102
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hailstone-sequence-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hailstone-sequence")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 640000000, elements: !9)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "ulong", file: !3, line: 6, baseType: !8)
!8 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!9 = !{!10}
!10 = !DISubrange(count: 10000000)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "hailstone", scope: !3, file: !3, line: 9, type: !16, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!7, !7}
!18 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !3, line: 9, type: !7)
!19 = !DILocation(line: 9, column: 23, scope: !15)
!20 = !DILocalVariable(name: "x", scope: !15, file: !3, line: 11, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 11, column: 6, scope: !15)
!23 = !DILocation(line: 12, column: 6, scope: !24)
!24 = distinct !DILexicalBlock(scope: !15, file: !3, line: 12, column: 6)
!25 = !DILocation(line: 12, column: 8, scope: !24)
!26 = !DILocation(line: 12, column: 6, scope: !15)
!27 = !{!"if"}
!28 = !DILocation(line: 12, column: 14, scope: !24)
!29 = !DILocation(line: 13, column: 6, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !3, line: 13, column: 6)
!31 = !DILocation(line: 13, column: 8, scope: !30)
!32 = !DILocation(line: 13, column: 13, scope: !30)
!33 = !DILocation(line: 13, column: 22, scope: !30)
!34 = !DILocation(line: 13, column: 16, scope: !30)
!35 = !DILocation(line: 13, column: 6, scope: !15)
!36 = !DILocation(line: 13, column: 39, scope: !30)
!37 = !DILocation(line: 13, column: 33, scope: !30)
!38 = !DILocation(line: 13, column: 26, scope: !30)
!39 = !DILocation(line: 15, column: 21, scope: !15)
!40 = !DILocation(line: 15, column: 23, scope: !15)
!41 = !DILocation(line: 15, column: 20, scope: !15)
!42 = !DILocation(line: 15, column: 34, scope: !15)
!43 = !DILocation(line: 15, column: 32, scope: !15)
!44 = !DILocation(line: 15, column: 36, scope: !15)
!45 = !DILocation(line: 15, column: 42, scope: !15)
!46 = !DILocation(line: 15, column: 44, scope: !15)
!47 = !DILocation(line: 15, column: 10, scope: !15)
!48 = !DILocation(line: 15, column: 8, scope: !15)
!49 = !DILocation(line: 15, column: 6, scope: !15)
!50 = !DILocation(line: 15, column: 4, scope: !15)
!51 = !DILocation(line: 16, column: 6, scope: !52)
!52 = distinct !DILexicalBlock(scope: !15, file: !3, line: 16, column: 6)
!53 = !DILocation(line: 16, column: 8, scope: !52)
!54 = !DILocation(line: 16, column: 6, scope: !15)
!55 = !DILocation(line: 16, column: 25, scope: !52)
!56 = !DILocation(line: 16, column: 20, scope: !52)
!57 = !DILocation(line: 16, column: 14, scope: !52)
!58 = !DILocation(line: 16, column: 23, scope: !52)
!59 = !DILocation(line: 17, column: 9, scope: !15)
!60 = !DILocation(line: 17, column: 2, scope: !15)
!61 = !DILocation(line: 18, column: 1, scope: !15)
!62 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !63, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!21}
!65 = !DILocalVariable(name: "i", scope: !62, file: !3, line: 22, type: !21)
!66 = !DILocation(line: 22, column: 6, scope: !62)
!67 = !DILocalVariable(name: "l", scope: !62, file: !3, line: 22, type: !21)
!68 = !DILocation(line: 22, column: 9, scope: !62)
!69 = !DILocalVariable(name: "max", scope: !62, file: !3, line: 22, type: !21)
!70 = !DILocation(line: 22, column: 12, scope: !62)
!71 = !DILocalVariable(name: "mi", scope: !62, file: !3, line: 22, type: !21)
!72 = !DILocation(line: 22, column: 21, scope: !62)
!73 = !DILocation(line: 23, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !62, file: !3, line: 23, column: 2)
!75 = !DILocation(line: 23, column: 7, scope: !74)
!76 = !DILocation(line: 23, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !3, line: 23, column: 2)
!78 = !DILocation(line: 23, column: 16, scope: !77)
!79 = !DILocation(line: 23, column: 2, scope: !74)
!80 = !DILocation(line: 24, column: 22, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 24, column: 7)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 23, column: 26)
!83 = !DILocation(line: 24, column: 12, scope: !81)
!84 = !DILocation(line: 24, column: 10, scope: !81)
!85 = !DILocation(line: 24, column: 28, scope: !81)
!86 = !DILocation(line: 24, column: 26, scope: !81)
!87 = !DILocation(line: 24, column: 7, scope: !82)
!88 = !DILocation(line: 25, column: 10, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !3, line: 24, column: 33)
!90 = !DILocation(line: 25, column: 8, scope: !89)
!91 = !DILocation(line: 26, column: 9, scope: !89)
!92 = !DILocation(line: 26, column: 7, scope: !89)
!93 = !DILocation(line: 27, column: 3, scope: !89)
!94 = !DILocation(line: 28, column: 2, scope: !82)
!95 = !DILocation(line: 23, column: 22, scope: !77)
!96 = !DILocation(line: 23, column: 2, scope: !77)
!97 = distinct !{!97, !79, !98}
!98 = !DILocation(line: 28, column: 2, scope: !74)
!99 = !DILocation(line: 29, column: 45, scope: !62)
!100 = !DILocation(line: 29, column: 49, scope: !62)
!101 = !DILocation(line: 29, column: 2, scope: !62)
!102 = !DILocation(line: 30, column: 2, scope: !62)
