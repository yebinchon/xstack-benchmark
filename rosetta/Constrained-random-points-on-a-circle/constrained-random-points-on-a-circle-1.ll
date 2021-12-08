; ModuleID = 'constrained-random-points-on-a-circle-1.bc'
source_filename = "constrained-random-points-on-a-circle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand_n(i32 %m) #0 !dbg !7 {
entry:
  %m.addr = alloca i32, align 4
  %rand_max = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %rand_max, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %m.addr, align 4, !dbg !15
  %rem = srem i32 2147483647, %0, !dbg !16
  %sub = sub nsw i32 2147483647, %rem, !dbg !17
  store i32 %sub, i32* %rand_max, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %r, metadata !18, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #5, !dbg !21
  store i32 %call, i32* %r, align 4, !dbg !22
  %1 = load i32, i32* %rand_max, align 4, !dbg !23
  %cmp = icmp sgt i32 %call, %1, !dbg !24
  br i1 %cmp, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !20, !llvm.loop !25

while.end:                                        ; preds = %while.cond
  %2 = load i32, i32* %r, align 4, !dbg !27
  %3 = load i32, i32* %rand_max, align 4, !dbg !28
  %4 = load i32, i32* %m.addr, align 4, !dbg !29
  %div = sdiv i32 %3, %4, !dbg !30
  %div1 = sdiv i32 %2, %div, !dbg !31
  ret i32 %div1, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %r2 = alloca i32, align 4
  %buf = alloca [31 x i64], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %x, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %y, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %r2, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [31 x i64]* %buf, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [31 x i64]* %buf to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 248, i1 false), !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %if.end, %entry
  %1 = load i32, i32* %i, align 4, !dbg !53
  %cmp = icmp slt i32 %1, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand_n(i32 31), !dbg !57
  %sub = sub nsw i32 %call, 15, !dbg !59
  store i32 %sub, i32* %x, align 4, !dbg !60
  %call1 = call i32 @rand_n(i32 31), !dbg !61
  %sub2 = sub nsw i32 %call1, 15, !dbg !62
  store i32 %sub2, i32* %y, align 4, !dbg !63
  %2 = load i32, i32* %x, align 4, !dbg !64
  %3 = load i32, i32* %x, align 4, !dbg !65
  %mul = mul nsw i32 %2, %3, !dbg !66
  %4 = load i32, i32* %y, align 4, !dbg !67
  %5 = load i32, i32* %y, align 4, !dbg !68
  %mul3 = mul nsw i32 %4, %5, !dbg !69
  %add = add nsw i32 %mul, %mul3, !dbg !70
  store i32 %add, i32* %r2, align 4, !dbg !71
  %6 = load i32, i32* %r2, align 4, !dbg !72
  %cmp4 = icmp sge i32 %6, 100, !dbg !74
  br i1 %cmp4, label %land.lhs.true, label %if.end, !dbg !75

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %r2, align 4, !dbg !76
  %cmp5 = icmp sle i32 %7, 225, !dbg !77
  br i1 %cmp5, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %land.lhs.true
  %8 = load i32, i32* %x, align 4, !dbg !79
  %add6 = add nsw i32 %8, 15, !dbg !81
  %shl = shl i32 1, %add6, !dbg !82
  %conv = sext i32 %shl to i64, !dbg !83
  %9 = load i32, i32* %y, align 4, !dbg !84
  %add7 = add nsw i32 15, %9, !dbg !85
  %idxprom = sext i32 %add7 to i64, !dbg !86
  %arrayidx = getelementptr inbounds [31 x i64], [31 x i64]* %buf, i64 0, i64 %idxprom, !dbg !86
  %10 = load i64, i64* %arrayidx, align 8, !dbg !87
  %or = or i64 %10, %conv, !dbg !87
  store i64 %or, i64* %arrayidx, align 8, !dbg !87
  %11 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %11, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %y, align 4, !dbg !93
  br label %for.cond8, !dbg !95

for.cond8:                                        ; preds = %for.inc24, %for.end
  %12 = load i32, i32* %y, align 4, !dbg !96
  %cmp9 = icmp slt i32 %12, 31, !dbg !98
  br i1 %cmp9, label %for.body11, label %for.end26, !dbg !99

for.body11:                                       ; preds = %for.cond8
  store i32 0, i32* %x, align 4, !dbg !100
  br label %for.cond12, !dbg !103

for.cond12:                                       ; preds = %for.inc, %for.body11
  %13 = load i32, i32* %x, align 4, !dbg !104
  %cmp13 = icmp slt i32 %13, 31, !dbg !106
  br i1 %cmp13, label %for.body15, label %for.end22, !dbg !107

for.body15:                                       ; preds = %for.cond12
  %14 = load i32, i32* %y, align 4, !dbg !108
  %idxprom16 = sext i32 %14 to i64, !dbg !109
  %arrayidx17 = getelementptr inbounds [31 x i64], [31 x i64]* %buf, i64 0, i64 %idxprom16, !dbg !109
  %15 = load i64, i64* %arrayidx17, align 8, !dbg !109
  %16 = load i32, i32* %x, align 4, !dbg !110
  %shl18 = shl i32 1, %16, !dbg !111
  %conv19 = sext i32 %shl18 to i64, !dbg !112
  %and = and i64 %15, %conv19, !dbg !113
  %tobool = icmp ne i64 %and, 0, !dbg !114
  %17 = zext i1 %tobool to i64, !dbg !114
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), !dbg !114
  %call20 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !115
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body15
  %18 = load i32, i32* %x, align 4, !dbg !116
  %inc21 = add nsw i32 %18, 1, !dbg !116
  store i32 %inc21, i32* %x, align 4, !dbg !116
  br label %for.cond12, !dbg !117, !llvm.loop !118

for.end22:                                        ; preds = %for.cond12
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  br label %for.inc24, !dbg !121

for.inc24:                                        ; preds = %for.end22
  %19 = load i32, i32* %y, align 4, !dbg !122
  %inc25 = add nsw i32 %19, 1, !dbg !122
  store i32 %inc25, i32* %y, align 4, !dbg !122
  br label %for.cond8, !dbg !123, !llvm.loop !124

for.end26:                                        ; preds = %for.cond8
  ret i32 0, !dbg !126
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "constrained-random-points-on-a-circle-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Constrained-random-points-on-a-circle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "rand_n", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 16, scope: !7)
!13 = !DILocalVariable(name: "rand_max", scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 6, column: 6, scope: !7)
!15 = !DILocation(line: 6, column: 40, scope: !7)
!16 = !DILocation(line: 6, column: 38, scope: !7)
!17 = !DILocation(line: 6, column: 26, scope: !7)
!18 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 7, column: 6, scope: !7)
!20 = !DILocation(line: 8, column: 2, scope: !7)
!21 = !DILocation(line: 8, column: 14, scope: !7)
!22 = !DILocation(line: 8, column: 12, scope: !7)
!23 = !DILocation(line: 8, column: 24, scope: !7)
!24 = !DILocation(line: 8, column: 22, scope: !7)
!25 = distinct !{!25, !20, !26}
!26 = !DILocation(line: 8, column: 33, scope: !7)
!27 = !DILocation(line: 9, column: 9, scope: !7)
!28 = !DILocation(line: 9, column: 14, scope: !7)
!29 = !DILocation(line: 9, column: 25, scope: !7)
!30 = !DILocation(line: 9, column: 23, scope: !7)
!31 = !DILocation(line: 9, column: 11, scope: !7)
!32 = !DILocation(line: 9, column: 2, scope: !7)
!33 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !34, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!10}
!36 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 14, type: !10)
!37 = !DILocation(line: 14, column: 6, scope: !33)
!38 = !DILocalVariable(name: "x", scope: !33, file: !1, line: 14, type: !10)
!39 = !DILocation(line: 14, column: 9, scope: !33)
!40 = !DILocalVariable(name: "y", scope: !33, file: !1, line: 14, type: !10)
!41 = !DILocation(line: 14, column: 12, scope: !33)
!42 = !DILocalVariable(name: "r2", scope: !33, file: !1, line: 14, type: !10)
!43 = !DILocation(line: 14, column: 15, scope: !33)
!44 = !DILocalVariable(name: "buf", scope: !33, file: !1, line: 15, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 1984, elements: !47)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !{!48}
!48 = !DISubrange(count: 31)
!49 = !DILocation(line: 15, column: 16, scope: !33)
!50 = !DILocation(line: 17, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !33, file: !1, line: 17, column: 2)
!52 = !DILocation(line: 17, column: 7, scope: !51)
!53 = !DILocation(line: 17, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 17, column: 2)
!55 = !DILocation(line: 17, column: 16, scope: !54)
!56 = !DILocation(line: 17, column: 2, scope: !51)
!57 = !DILocation(line: 18, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 17, column: 25)
!59 = !DILocation(line: 18, column: 18, scope: !58)
!60 = !DILocation(line: 18, column: 5, scope: !58)
!61 = !DILocation(line: 19, column: 7, scope: !58)
!62 = !DILocation(line: 19, column: 18, scope: !58)
!63 = !DILocation(line: 19, column: 5, scope: !58)
!64 = !DILocation(line: 20, column: 8, scope: !58)
!65 = !DILocation(line: 20, column: 12, scope: !58)
!66 = !DILocation(line: 20, column: 10, scope: !58)
!67 = !DILocation(line: 20, column: 16, scope: !58)
!68 = !DILocation(line: 20, column: 20, scope: !58)
!69 = !DILocation(line: 20, column: 18, scope: !58)
!70 = !DILocation(line: 20, column: 14, scope: !58)
!71 = !DILocation(line: 20, column: 6, scope: !58)
!72 = !DILocation(line: 21, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !58, file: !1, line: 21, column: 7)
!74 = !DILocation(line: 21, column: 10, scope: !73)
!75 = !DILocation(line: 21, column: 17, scope: !73)
!76 = !DILocation(line: 21, column: 20, scope: !73)
!77 = !DILocation(line: 21, column: 23, scope: !73)
!78 = !DILocation(line: 21, column: 7, scope: !58)
!79 = !DILocation(line: 22, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 21, column: 31)
!81 = !DILocation(line: 22, column: 27, scope: !80)
!82 = !DILocation(line: 22, column: 21, scope: !80)
!83 = !DILocation(line: 22, column: 19, scope: !80)
!84 = !DILocation(line: 22, column: 13, scope: !80)
!85 = !DILocation(line: 22, column: 11, scope: !80)
!86 = !DILocation(line: 22, column: 4, scope: !80)
!87 = !DILocation(line: 22, column: 16, scope: !80)
!88 = !DILocation(line: 23, column: 5, scope: !80)
!89 = !DILocation(line: 24, column: 3, scope: !80)
!90 = !DILocation(line: 17, column: 2, scope: !54)
!91 = distinct !{!91, !56, !92}
!92 = !DILocation(line: 25, column: 2, scope: !51)
!93 = !DILocation(line: 27, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !33, file: !1, line: 27, column: 2)
!95 = !DILocation(line: 27, column: 7, scope: !94)
!96 = !DILocation(line: 27, column: 14, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 27, column: 2)
!98 = !DILocation(line: 27, column: 16, scope: !97)
!99 = !DILocation(line: 27, column: 2, scope: !94)
!100 = !DILocation(line: 28, column: 10, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 28, column: 3)
!102 = distinct !DILexicalBlock(scope: !97, file: !1, line: 27, column: 27)
!103 = !DILocation(line: 28, column: 8, scope: !101)
!104 = !DILocation(line: 28, column: 15, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 28, column: 3)
!106 = !DILocation(line: 28, column: 17, scope: !105)
!107 = !DILocation(line: 28, column: 3, scope: !101)
!108 = !DILocation(line: 29, column: 16, scope: !105)
!109 = !DILocation(line: 29, column: 12, scope: !105)
!110 = !DILocation(line: 29, column: 26, scope: !105)
!111 = !DILocation(line: 29, column: 23, scope: !105)
!112 = !DILocation(line: 29, column: 21, scope: !105)
!113 = !DILocation(line: 29, column: 19, scope: !105)
!114 = !DILocation(line: 29, column: 11, scope: !105)
!115 = !DILocation(line: 29, column: 4, scope: !105)
!116 = !DILocation(line: 28, column: 24, scope: !105)
!117 = !DILocation(line: 28, column: 3, scope: !105)
!118 = distinct !{!118, !107, !119}
!119 = !DILocation(line: 29, column: 42, scope: !101)
!120 = !DILocation(line: 30, column: 3, scope: !102)
!121 = !DILocation(line: 31, column: 2, scope: !102)
!122 = !DILocation(line: 27, column: 23, scope: !97)
!123 = !DILocation(line: 27, column: 2, scope: !97)
!124 = distinct !{!124, !99, !125}
!125 = !DILocation(line: 31, column: 2, scope: !94)
!126 = !DILocation(line: 33, column: 2, scope: !33)
