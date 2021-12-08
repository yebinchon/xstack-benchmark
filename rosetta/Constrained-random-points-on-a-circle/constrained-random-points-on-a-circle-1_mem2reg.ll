; ModuleID = 'constrained-random-points-on-a-circle-1.ll'
source_filename = "constrained-random-points-on-a-circle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand_n(i32 %m) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !11, metadata !DIExpression()), !dbg !12
  %rem = srem i32 2147483647, %m, !dbg !13
  %sub = sub nsw i32 2147483647, %rem, !dbg !14
  call void @llvm.dbg.value(metadata i32 %sub, metadata !15, metadata !DIExpression()), !dbg !12
  br label %while.cond, !dbg !16

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #5, !dbg !17
  call void @llvm.dbg.value(metadata i32 %call, metadata !18, metadata !DIExpression()), !dbg !12
  %cmp = icmp sgt i32 %call, %sub, !dbg !19
  br i1 %cmp, label %while.body, label %while.end, !dbg !16

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !16, !llvm.loop !20

while.end:                                        ; preds = %while.cond
  %div = sdiv i32 %sub, %m, !dbg !22
  %div1 = sdiv i32 %call, %div, !dbg !23
  ret i32 %div1, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !25 {
entry:
  %buf = alloca [31 x i64], align 16
  call void @llvm.dbg.declare(metadata [31 x i64]* %buf, metadata !28, metadata !DIExpression()), !dbg !33
  %0 = bitcast [31 x i64]* %buf to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 248, i1 false), !dbg !33
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %i.1, %if.end ], !dbg !38
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !34, metadata !DIExpression()), !dbg !35
  %cmp = icmp slt i32 %i.0, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand_n(i32 31), !dbg !42
  %sub = sub nsw i32 %call, 15, !dbg !44
  call void @llvm.dbg.value(metadata i32 %sub, metadata !45, metadata !DIExpression()), !dbg !35
  %call1 = call i32 @rand_n(i32 31), !dbg !46
  %sub2 = sub nsw i32 %call1, 15, !dbg !47
  call void @llvm.dbg.value(metadata i32 %sub2, metadata !48, metadata !DIExpression()), !dbg !35
  %mul = mul nsw i32 %sub, %sub, !dbg !49
  %mul3 = mul nsw i32 %sub2, %sub2, !dbg !50
  %add = add nsw i32 %mul, %mul3, !dbg !51
  call void @llvm.dbg.value(metadata i32 %add, metadata !52, metadata !DIExpression()), !dbg !35
  %cmp4 = icmp sge i32 %add, 100, !dbg !53
  br i1 %cmp4, label %land.lhs.true, label %if.end, !dbg !55

land.lhs.true:                                    ; preds = %for.body
  %cmp5 = icmp sle i32 %add, 225, !dbg !56
  br i1 %cmp5, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %land.lhs.true
  %add6 = add nsw i32 %sub, 15, !dbg !58
  %shl = shl i32 1, %add6, !dbg !60
  %conv = sext i32 %shl to i64, !dbg !61
  %add7 = add nsw i32 15, %sub2, !dbg !62
  %idxprom = sext i32 %add7 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [31 x i64], [31 x i64]* %buf, i64 0, i64 %idxprom, !dbg !63
  %1 = load i64, i64* %arrayidx, align 8, !dbg !64
  %or = or i64 %1, %conv, !dbg !64
  store i64 %or, i64* %arrayidx, align 8, !dbg !64
  %inc = add nsw i32 %i.0, 1, !dbg !65
  call void @llvm.dbg.value(metadata i32 %inc, metadata !34, metadata !DIExpression()), !dbg !35
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  %i.1 = phi i32 [ %inc, %if.then ], [ %i.0, %land.lhs.true ], [ %i.0, %for.body ], !dbg !38
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !34, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !48, metadata !DIExpression()), !dbg !35
  br label %for.cond8, !dbg !70

for.cond8:                                        ; preds = %for.inc24, %for.end
  %y.0 = phi i32 [ 0, %for.end ], [ %inc25, %for.inc24 ], !dbg !72
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !48, metadata !DIExpression()), !dbg !35
  %cmp9 = icmp slt i32 %y.0, 31, !dbg !73
  br i1 %cmp9, label %for.body11, label %for.end26, !dbg !75

for.body11:                                       ; preds = %for.cond8
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !35
  br label %for.cond12, !dbg !76

for.cond12:                                       ; preds = %for.inc, %for.body11
  %x.0 = phi i32 [ 0, %for.body11 ], [ %inc21, %for.inc ], !dbg !79
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !45, metadata !DIExpression()), !dbg !35
  %cmp13 = icmp slt i32 %x.0, 31, !dbg !80
  br i1 %cmp13, label %for.body15, label %for.end22, !dbg !82

for.body15:                                       ; preds = %for.cond12
  %idxprom16 = sext i32 %y.0 to i64, !dbg !83
  %arrayidx17 = getelementptr inbounds [31 x i64], [31 x i64]* %buf, i64 0, i64 %idxprom16, !dbg !83
  %2 = load i64, i64* %arrayidx17, align 8, !dbg !83
  %shl18 = shl i32 1, %x.0, !dbg !84
  %conv19 = sext i32 %shl18 to i64, !dbg !85
  %and = and i64 %2, %conv19, !dbg !86
  %tobool = icmp ne i64 %and, 0, !dbg !87
  %3 = zext i1 %tobool to i64, !dbg !87
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), !dbg !87
  %call20 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !88
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body15
  %inc21 = add nsw i32 %x.0, 1, !dbg !89
  call void @llvm.dbg.value(metadata i32 %inc21, metadata !45, metadata !DIExpression()), !dbg !35
  br label %for.cond12, !dbg !90, !llvm.loop !91

for.end22:                                        ; preds = %for.cond12
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  br label %for.inc24, !dbg !94

for.inc24:                                        ; preds = %for.end22
  %inc25 = add nsw i32 %y.0, 1, !dbg !95
  call void @llvm.dbg.value(metadata i32 %inc25, metadata !48, metadata !DIExpression()), !dbg !35
  br label %for.cond8, !dbg !96, !llvm.loop !97

for.end26:                                        ; preds = %for.cond8
  ret i32 0, !dbg !99
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 6, column: 38, scope: !7)
!14 = !DILocation(line: 6, column: 26, scope: !7)
!15 = !DILocalVariable(name: "rand_max", scope: !7, file: !1, line: 6, type: !10)
!16 = !DILocation(line: 8, column: 2, scope: !7)
!17 = !DILocation(line: 8, column: 14, scope: !7)
!18 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 7, type: !10)
!19 = !DILocation(line: 8, column: 22, scope: !7)
!20 = distinct !{!20, !16, !21}
!21 = !DILocation(line: 8, column: 33, scope: !7)
!22 = !DILocation(line: 9, column: 23, scope: !7)
!23 = !DILocation(line: 9, column: 11, scope: !7)
!24 = !DILocation(line: 9, column: 2, scope: !7)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !26, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!10}
!28 = !DILocalVariable(name: "buf", scope: !25, file: !1, line: 15, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 1984, elements: !31)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !{!32}
!32 = !DISubrange(count: 31)
!33 = !DILocation(line: 15, column: 16, scope: !25)
!34 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 14, type: !10)
!35 = !DILocation(line: 0, scope: !25)
!36 = !DILocation(line: 17, column: 7, scope: !37)
!37 = distinct !DILexicalBlock(scope: !25, file: !1, line: 17, column: 2)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 17, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 2)
!41 = !DILocation(line: 17, column: 2, scope: !37)
!42 = !DILocation(line: 18, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 17, column: 25)
!44 = !DILocation(line: 18, column: 18, scope: !43)
!45 = !DILocalVariable(name: "x", scope: !25, file: !1, line: 14, type: !10)
!46 = !DILocation(line: 19, column: 7, scope: !43)
!47 = !DILocation(line: 19, column: 18, scope: !43)
!48 = !DILocalVariable(name: "y", scope: !25, file: !1, line: 14, type: !10)
!49 = !DILocation(line: 20, column: 10, scope: !43)
!50 = !DILocation(line: 20, column: 18, scope: !43)
!51 = !DILocation(line: 20, column: 14, scope: !43)
!52 = !DILocalVariable(name: "r2", scope: !25, file: !1, line: 14, type: !10)
!53 = !DILocation(line: 21, column: 10, scope: !54)
!54 = distinct !DILexicalBlock(scope: !43, file: !1, line: 21, column: 7)
!55 = !DILocation(line: 21, column: 17, scope: !54)
!56 = !DILocation(line: 21, column: 23, scope: !54)
!57 = !DILocation(line: 21, column: 7, scope: !43)
!58 = !DILocation(line: 22, column: 27, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 21, column: 31)
!60 = !DILocation(line: 22, column: 21, scope: !59)
!61 = !DILocation(line: 22, column: 19, scope: !59)
!62 = !DILocation(line: 22, column: 11, scope: !59)
!63 = !DILocation(line: 22, column: 4, scope: !59)
!64 = !DILocation(line: 22, column: 16, scope: !59)
!65 = !DILocation(line: 23, column: 5, scope: !59)
!66 = !DILocation(line: 24, column: 3, scope: !59)
!67 = !DILocation(line: 17, column: 2, scope: !40)
!68 = distinct !{!68, !41, !69}
!69 = !DILocation(line: 25, column: 2, scope: !37)
!70 = !DILocation(line: 27, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !25, file: !1, line: 27, column: 2)
!72 = !DILocation(line: 0, scope: !71)
!73 = !DILocation(line: 27, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !1, line: 27, column: 2)
!75 = !DILocation(line: 27, column: 2, scope: !71)
!76 = !DILocation(line: 28, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 28, column: 3)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 27, column: 27)
!79 = !DILocation(line: 0, scope: !77)
!80 = !DILocation(line: 28, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 28, column: 3)
!82 = !DILocation(line: 28, column: 3, scope: !77)
!83 = !DILocation(line: 29, column: 12, scope: !81)
!84 = !DILocation(line: 29, column: 23, scope: !81)
!85 = !DILocation(line: 29, column: 21, scope: !81)
!86 = !DILocation(line: 29, column: 19, scope: !81)
!87 = !DILocation(line: 29, column: 11, scope: !81)
!88 = !DILocation(line: 29, column: 4, scope: !81)
!89 = !DILocation(line: 28, column: 24, scope: !81)
!90 = !DILocation(line: 28, column: 3, scope: !81)
!91 = distinct !{!91, !82, !92}
!92 = !DILocation(line: 29, column: 42, scope: !77)
!93 = !DILocation(line: 30, column: 3, scope: !78)
!94 = !DILocation(line: 31, column: 2, scope: !78)
!95 = !DILocation(line: 27, column: 23, scope: !74)
!96 = !DILocation(line: 27, column: 2, scope: !74)
!97 = distinct !{!97, !75, !98}
!98 = !DILocation(line: 31, column: 2, scope: !71)
!99 = !DILocation(line: 33, column: 2, scope: !25)
