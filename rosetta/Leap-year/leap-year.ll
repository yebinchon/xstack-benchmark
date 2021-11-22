; ModuleID = 'leap-year.c'
source_filename = "leap-year.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.test_case = private unnamed_addr constant [5 x i32] [i32 1900, i32 1994, i32 1996, i32 1997, i32 2000], align 16
@.str = private unnamed_addr constant [22 x i8] c"%d is %sa leap year.\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"not \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_leap_year(i32 %year) #0 !dbg !7 {
entry:
  %year.addr = alloca i32, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %year.addr, align 4, !dbg !13
  %rem = srem i32 %0, 4, !dbg !14
  %tobool = icmp ne i32 %rem, 0, !dbg !14
  br i1 %tobool, label %lor.rhs, label %land.lhs.true, !dbg !15

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %year.addr, align 4, !dbg !16
  %rem1 = srem i32 %1, 100, !dbg !17
  %tobool2 = icmp ne i32 %rem1, 0, !dbg !17
  br i1 %tobool2, label %lor.end, label %lor.rhs, !dbg !18

lor.rhs:                                          ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %year.addr, align 4, !dbg !19
  %rem3 = srem i32 %2, 400, !dbg !20
  %tobool4 = icmp ne i32 %rem3, 0, !dbg !21
  %lnot = xor i1 %tobool4, true, !dbg !21
  br label %lor.end, !dbg !18

lor.end:                                          ; preds = %lor.rhs, %land.lhs.true
  %3 = phi i1 [ true, %land.lhs.true ], [ %lnot, %lor.rhs ]
  %4 = zext i1 %3 to i64, !dbg !22
  %cond = select i1 %3, i32 1, i32 0, !dbg !22
  ret i32 %cond, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !24 {
entry:
  %retval = alloca i32, align 4
  %test_case = alloca [5 x i32], align 16
  %key = alloca i32, align 4
  %end = alloca i32, align 4
  %year = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %test_case, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = bitcast [5 x i32]* %test_case to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.test_case to i8*), i64 20, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %key, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %end, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %year, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %key, align 4, !dbg !38
  store i32 5, i32* %end, align 4, !dbg !40
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %key, align 4, !dbg !42
  %2 = load i32, i32* %end, align 4, !dbg !44
  %cmp = icmp slt i32 %1, %2, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %key, align 4, !dbg !47
  %idxprom = sext i32 %3 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %test_case, i64 0, i64 %idxprom, !dbg !49
  %4 = load i32, i32* %arrayidx, align 4, !dbg !49
  store i32 %4, i32* %year, align 4, !dbg !50
  %5 = load i32, i32* %year, align 4, !dbg !51
  %6 = load i32, i32* %year, align 4, !dbg !52
  %call = call i32 @is_leap_year(i32 %6), !dbg !53
  %cmp1 = icmp eq i32 %call, 1, !dbg !54
  %7 = zext i1 %cmp1 to i64, !dbg !53
  %cond = select i1 %cmp1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), !dbg !53
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 %5, i8* %cond), !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %key, align 4, !dbg !57
  %inc = add nsw i32 %8, 1, !dbg !57
  store i32 %inc, i32* %key, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %retval, align 4, !dbg !61
  ret i32 %9, !dbg !61
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
!1 = !DIFile(filename: "leap-year.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Leap-year")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "is_leap_year", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "year", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 22, scope: !7)
!13 = !DILocation(line: 5, column: 15, scope: !7)
!14 = !DILocation(line: 5, column: 20, scope: !7)
!15 = !DILocation(line: 5, column: 25, scope: !7)
!16 = !DILocation(line: 5, column: 28, scope: !7)
!17 = !DILocation(line: 5, column: 33, scope: !7)
!18 = !DILocation(line: 5, column: 39, scope: !7)
!19 = !DILocation(line: 5, column: 44, scope: !7)
!20 = !DILocation(line: 5, column: 49, scope: !7)
!21 = !DILocation(line: 5, column: 42, scope: !7)
!22 = !DILocation(line: 5, column: 12, scope: !7)
!23 = !DILocation(line: 5, column: 5, scope: !7)
!24 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !25, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!10}
!27 = !DILocalVariable(name: "test_case", scope: !24, file: !1, line: 10, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 5)
!31 = !DILocation(line: 10, column: 9, scope: !24)
!32 = !DILocalVariable(name: "key", scope: !24, file: !1, line: 10, type: !10)
!33 = !DILocation(line: 10, column: 55, scope: !24)
!34 = !DILocalVariable(name: "end", scope: !24, file: !1, line: 10, type: !10)
!35 = !DILocation(line: 10, column: 60, scope: !24)
!36 = !DILocalVariable(name: "year", scope: !24, file: !1, line: 10, type: !10)
!37 = !DILocation(line: 10, column: 65, scope: !24)
!38 = !DILocation(line: 11, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !24, file: !1, line: 11, column: 5)
!40 = !DILocation(line: 11, column: 23, scope: !39)
!41 = !DILocation(line: 11, column: 10, scope: !39)
!42 = !DILocation(line: 11, column: 65, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 11, column: 5)
!44 = !DILocation(line: 11, column: 71, scope: !43)
!45 = !DILocation(line: 11, column: 69, scope: !43)
!46 = !DILocation(line: 11, column: 5, scope: !39)
!47 = !DILocation(line: 12, column: 26, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !1, line: 11, column: 83)
!49 = !DILocation(line: 12, column: 16, scope: !48)
!50 = !DILocation(line: 12, column: 14, scope: !48)
!51 = !DILocation(line: 13, column: 42, scope: !48)
!52 = !DILocation(line: 13, column: 62, scope: !48)
!53 = !DILocation(line: 13, column: 49, scope: !48)
!54 = !DILocation(line: 13, column: 68, scope: !48)
!55 = !DILocation(line: 13, column: 9, scope: !48)
!56 = !DILocation(line: 14, column: 5, scope: !48)
!57 = !DILocation(line: 11, column: 76, scope: !43)
!58 = !DILocation(line: 11, column: 5, scope: !43)
!59 = distinct !{!59, !46, !60}
!60 = !DILocation(line: 14, column: 5, scope: !39)
!61 = !DILocation(line: 15, column: 1, scope: !24)
