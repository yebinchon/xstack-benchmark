; ModuleID = 'atomic-updates-2.ll'
source_filename = "atomic-updates-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bucket = common dso_local global [10 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c" Sum: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !16 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %from = alloca i32, align 4
  %to = alloca i32, align 4
  %mode = alloca i32, align 4
  %diff = alloca i32, align 4
  %sum = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %cmp = icmp slt i32 %0, 10, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !28
  %idxprom = sext i32 %1 to i64, !dbg !29
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom, !dbg !29
  store i32 1000, i32* %arrayidx, align 4, !dbg !30
  br label %for.inc, !dbg !29

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !31
  %inc = add nsw i32 %2, 1, !dbg !31
  store i32 %inc, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !32, !llvm.loop !33

for.end:                                          ; preds = %for.cond
  call void @omp_set_num_threads(i32 3), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond1, !dbg !38

for.cond1:                                        ; preds = %for.inc50, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp slt i32 %3, 10000, !dbg !41
  br i1 %cmp2, label %for.body3, label %for.end52, !dbg !42

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %from, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %to, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %mode, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 0, i32* %diff, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i32 @rand() #4, !dbg !54
  %conv = sitofp i32 %call to double, !dbg !54
  %mul = fmul double 1.000000e+01, %conv, !dbg !54
  %div = fdiv double %mul, 0x41E0000000000000, !dbg !54
  %conv4 = fptosi double %div to i32, !dbg !54
  store i32 %conv4, i32* %from, align 4, !dbg !55
  br label %do.body, !dbg !56

do.body:                                          ; preds = %do.cond, %for.body3
  %call5 = call i32 @rand() #4, !dbg !57
  %conv6 = sitofp i32 %call5 to double, !dbg !57
  %mul7 = fmul double 1.000000e+01, %conv6, !dbg !57
  %div8 = fdiv double %mul7, 0x41E0000000000000, !dbg !57
  %conv9 = fptosi double %div8 to i32, !dbg !57
  store i32 %conv9, i32* %to, align 4, !dbg !59
  br label %do.cond, !dbg !60

do.cond:                                          ; preds = %do.body
  %4 = load i32, i32* %from, align 4, !dbg !61
  %5 = load i32, i32* %to, align 4, !dbg !62
  %cmp10 = icmp eq i32 %4, %5, !dbg !63
  br i1 %cmp10, label %do.body, label %do.end, !dbg !60, !llvm.loop !64

do.end:                                           ; preds = %do.cond
  %call12 = call i32 @rand() #4, !dbg !66
  %conv13 = sitofp i32 %call12 to double, !dbg !66
  %mul14 = fmul double 1.000000e+01, %conv13, !dbg !66
  %div15 = fdiv double %mul14, 0x41E0000000000000, !dbg !66
  %conv16 = fptosi double %div15 to i32, !dbg !66
  store i32 %conv16, i32* %mode, align 4, !dbg !67
  %6 = load i32, i32* %mode, align 4, !dbg !68
  switch i32 %6, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb22
  ], !dbg !69

sw.bb:                                            ; preds = %do.end, %do.end, %do.end
  %7 = load i32, i32* %from, align 4, !dbg !70
  %idxprom17 = sext i32 %7 to i64, !dbg !72
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom17, !dbg !72
  %8 = load i32, i32* %arrayidx18, align 4, !dbg !72
  %9 = load i32, i32* %to, align 4, !dbg !73
  %idxprom19 = sext i32 %9 to i64, !dbg !74
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom19, !dbg !74
  %10 = load i32, i32* %arrayidx20, align 4, !dbg !74
  %sub = sub nsw i32 %8, %10, !dbg !75
  %div21 = sdiv i32 %sub, 2, !dbg !76
  store i32 %div21, i32* %diff, align 4, !dbg !77
  br label %sw.epilog, !dbg !78

sw.bb22:                                          ; preds = %do.end
  store i32 0, i32* %sum, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %j, metadata !80, metadata !DIExpression()), !dbg !82
  store i32 0, i32* %j, align 4, !dbg !82
  br label %for.cond23, !dbg !83

for.cond23:                                       ; preds = %for.inc32, %sw.bb22
  %11 = load i32, i32* %j, align 4, !dbg !84
  %cmp24 = icmp slt i32 %11, 10, !dbg !86
  br i1 %cmp24, label %for.body26, label %for.end34, !dbg !87

for.body26:                                       ; preds = %for.cond23
  %12 = load i32, i32* %j, align 4, !dbg !88
  %idxprom27 = sext i32 %12 to i64, !dbg !90
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom27, !dbg !90
  %13 = load i32, i32* %arrayidx28, align 4, !dbg !90
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %13), !dbg !91
  %14 = load i32, i32* %j, align 4, !dbg !92
  %idxprom30 = sext i32 %14 to i64, !dbg !93
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom30, !dbg !93
  %15 = load i32, i32* %arrayidx31, align 4, !dbg !93
  %16 = load i32, i32* %sum, align 4, !dbg !94
  %add = add nsw i32 %16, %15, !dbg !94
  store i32 %add, i32* %sum, align 4, !dbg !94
  br label %for.inc32, !dbg !95

for.inc32:                                        ; preds = %for.body26
  %17 = load i32, i32* %j, align 4, !dbg !96
  %inc33 = add nsw i32 %17, 1, !dbg !96
  store i32 %inc33, i32* %j, align 4, !dbg !96
  br label %for.cond23, !dbg !97, !llvm.loop !98

for.end34:                                        ; preds = %for.cond23
  %18 = load i32, i32* %sum, align 4, !dbg !100
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %18), !dbg !101
  br label %for.inc50, !dbg !102

sw.default:                                       ; preds = %do.end
  %19 = load i32, i32* %from, align 4, !dbg !103
  %idxprom36 = sext i32 %19 to i64, !dbg !103
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom36, !dbg !103
  %20 = load i32, i32* %arrayidx37, align 4, !dbg !103
  %conv38 = sitofp i32 %20 to double, !dbg !103
  %call39 = call i32 @rand() #4, !dbg !103
  %conv40 = sitofp i32 %call39 to double, !dbg !103
  %mul41 = fmul double %conv38, %conv40, !dbg !103
  %div42 = fdiv double %mul41, 0x41E0000000000000, !dbg !103
  %conv43 = fptosi double %div42 to i32, !dbg !103
  store i32 %conv43, i32* %diff, align 4, !dbg !104
  br label %sw.epilog, !dbg !105

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %21 = load i32, i32* %diff, align 4, !dbg !106
  %22 = load i32, i32* %from, align 4, !dbg !108
  %idxprom44 = sext i32 %22 to i64, !dbg !109
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom44, !dbg !109
  %23 = load i32, i32* %arrayidx45, align 4, !dbg !110
  %sub46 = sub nsw i32 %23, %21, !dbg !110
  store i32 %sub46, i32* %arrayidx45, align 4, !dbg !110
  %24 = load i32, i32* %diff, align 4, !dbg !111
  %25 = load i32, i32* %to, align 4, !dbg !112
  %idxprom47 = sext i32 %25 to i64, !dbg !113
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom47, !dbg !113
  %26 = load i32, i32* %arrayidx48, align 4, !dbg !114
  %add49 = add nsw i32 %26, %24, !dbg !114
  store i32 %add49, i32* %arrayidx48, align 4, !dbg !114
  br label %for.inc50, !dbg !115

for.inc50:                                        ; preds = %sw.epilog, %for.end34
  %27 = load i32, i32* %i, align 4, !dbg !116
  %inc51 = add nsw i32 %27, 1, !dbg !116
  store i32 %inc51, i32* %i, align 4, !dbg !116
  br label %for.cond1, !dbg !117, !llvm.loop !118

for.end52:                                        ; preds = %for.cond1
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @omp_set_num_threads(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bucket", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "atomic-updates-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Atomic-updates-2")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{!0}
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 10)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!16 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 8, type: !17, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!9}
!19 = !DILocalVariable(name: "i", scope: !16, file: !3, line: 10, type: !9)
!20 = !DILocation(line: 10, column: 6, scope: !16)
!21 = !DILocation(line: 11, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !3, line: 11, column: 2)
!23 = !DILocation(line: 11, column: 7, scope: !22)
!24 = !DILocation(line: 11, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !3, line: 11, column: 2)
!26 = !DILocation(line: 11, column: 16, scope: !25)
!27 = !DILocation(line: 11, column: 2, scope: !22)
!28 = !DILocation(line: 11, column: 34, scope: !25)
!29 = !DILocation(line: 11, column: 27, scope: !25)
!30 = !DILocation(line: 11, column: 37, scope: !25)
!31 = !DILocation(line: 11, column: 23, scope: !25)
!32 = !DILocation(line: 11, column: 2, scope: !25)
!33 = distinct !{!33, !27, !34}
!34 = !DILocation(line: 11, column: 39, scope: !22)
!35 = !DILocation(line: 12, column: 2, scope: !16)
!36 = !DILocation(line: 15, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !16, file: !3, line: 15, column: 2)
!38 = !DILocation(line: 15, column: 7, scope: !37)
!39 = !DILocation(line: 15, column: 14, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !3, line: 15, column: 2)
!41 = !DILocation(line: 15, column: 16, scope: !40)
!42 = !DILocation(line: 15, column: 2, scope: !37)
!43 = !DILocalVariable(name: "from", scope: !44, file: !3, line: 16, type: !9)
!44 = distinct !DILexicalBlock(scope: !40, file: !3, line: 15, column: 30)
!45 = !DILocation(line: 16, column: 7, scope: !44)
!46 = !DILocalVariable(name: "to", scope: !44, file: !3, line: 16, type: !9)
!47 = !DILocation(line: 16, column: 13, scope: !44)
!48 = !DILocalVariable(name: "mode", scope: !44, file: !3, line: 16, type: !9)
!49 = !DILocation(line: 16, column: 17, scope: !44)
!50 = !DILocalVariable(name: "diff", scope: !44, file: !3, line: 16, type: !9)
!51 = !DILocation(line: 16, column: 23, scope: !44)
!52 = !DILocalVariable(name: "sum", scope: !44, file: !3, line: 16, type: !9)
!53 = !DILocation(line: 16, column: 33, scope: !44)
!54 = !DILocation(line: 18, column: 10, scope: !44)
!55 = !DILocation(line: 18, column: 8, scope: !44)
!56 = !DILocation(line: 19, column: 3, scope: !44)
!57 = !DILocation(line: 19, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !3, line: 19, column: 6)
!59 = !DILocation(line: 19, column: 11, scope: !58)
!60 = !DILocation(line: 19, column: 24, scope: !58)
!61 = !DILocation(line: 19, column: 33, scope: !44)
!62 = !DILocation(line: 19, column: 41, scope: !44)
!63 = !DILocation(line: 19, column: 38, scope: !44)
!64 = distinct !{!64, !56, !65}
!65 = !DILocation(line: 19, column: 43, scope: !44)
!66 = !DILocation(line: 20, column: 10, scope: !44)
!67 = !DILocation(line: 20, column: 8, scope: !44)
!68 = !DILocation(line: 22, column: 11, scope: !44)
!69 = !DILocation(line: 22, column: 3, scope: !44)
!70 = !DILocation(line: 26, column: 19, scope: !71)
!71 = distinct !DILexicalBlock(scope: !44, file: !3, line: 22, column: 17)
!72 = !DILocation(line: 26, column: 12, scope: !71)
!73 = !DILocation(line: 26, column: 34, scope: !71)
!74 = !DILocation(line: 26, column: 27, scope: !71)
!75 = !DILocation(line: 26, column: 25, scope: !71)
!76 = !DILocation(line: 26, column: 39, scope: !71)
!77 = !DILocation(line: 26, column: 9, scope: !71)
!78 = !DILocation(line: 27, column: 4, scope: !71)
!79 = !DILocation(line: 30, column: 8, scope: !71)
!80 = !DILocalVariable(name: "j", scope: !81, file: !3, line: 31, type: !9)
!81 = distinct !DILexicalBlock(scope: !71, file: !3, line: 31, column: 4)
!82 = !DILocation(line: 31, column: 13, scope: !81)
!83 = !DILocation(line: 31, column: 9, scope: !81)
!84 = !DILocation(line: 31, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 31, column: 4)
!86 = !DILocation(line: 31, column: 22, scope: !85)
!87 = !DILocation(line: 31, column: 4, scope: !81)
!88 = !DILocation(line: 32, column: 26, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !3, line: 31, column: 33)
!90 = !DILocation(line: 32, column: 19, scope: !89)
!91 = !DILocation(line: 32, column: 5, scope: !89)
!92 = !DILocation(line: 33, column: 19, scope: !89)
!93 = !DILocation(line: 33, column: 12, scope: !89)
!94 = !DILocation(line: 33, column: 9, scope: !89)
!95 = !DILocation(line: 34, column: 4, scope: !89)
!96 = !DILocation(line: 31, column: 29, scope: !85)
!97 = !DILocation(line: 31, column: 4, scope: !85)
!98 = distinct !{!98, !87, !99}
!99 = !DILocation(line: 34, column: 4, scope: !81)
!100 = !DILocation(line: 35, column: 25, scope: !71)
!101 = !DILocation(line: 35, column: 4, scope: !71)
!102 = !DILocation(line: 36, column: 4, scope: !71)
!103 = !DILocation(line: 39, column: 11, scope: !71)
!104 = !DILocation(line: 39, column: 9, scope: !71)
!105 = !DILocation(line: 40, column: 4, scope: !71)
!106 = !DILocation(line: 45, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !44, file: !3, line: 44, column: 3)
!108 = !DILocation(line: 45, column: 11, scope: !107)
!109 = !DILocation(line: 45, column: 4, scope: !107)
!110 = !DILocation(line: 45, column: 17, scope: !107)
!111 = !DILocation(line: 46, column: 20, scope: !107)
!112 = !DILocation(line: 46, column: 11, scope: !107)
!113 = !DILocation(line: 46, column: 4, scope: !107)
!114 = !DILocation(line: 46, column: 17, scope: !107)
!115 = !DILocation(line: 48, column: 2, scope: !44)
!116 = !DILocation(line: 15, column: 26, scope: !40)
!117 = !DILocation(line: 15, column: 2, scope: !40)
!118 = distinct !{!118, !42, !119}
!119 = !DILocation(line: 48, column: 2, scope: !37)
!120 = !DILocation(line: 50, column: 2, scope: !16)
