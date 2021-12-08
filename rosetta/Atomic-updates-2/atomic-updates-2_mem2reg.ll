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
  call void @llvm.dbg.value(metadata i32 0, metadata !19, metadata !DIExpression()), !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !23
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !19, metadata !DIExpression()), !dbg !20
  %cmp = icmp slt i32 %i.0, 10, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !27
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom, !dbg !27
  store i32 1000, i32* %arrayidx, align 4, !dbg !28
  br label %for.inc, !dbg !27

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !29
  call void @llvm.dbg.value(metadata i32 %inc, metadata !19, metadata !DIExpression()), !dbg !20
  br label %for.cond, !dbg !30, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  call void @omp_set_num_threads(i32 3), !dbg !33
  call void @llvm.dbg.value(metadata i32 0, metadata !19, metadata !DIExpression()), !dbg !20
  br label %for.cond1, !dbg !34

for.cond1:                                        ; preds = %for.inc50, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc51, %for.inc50 ], !dbg !36
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !19, metadata !DIExpression()), !dbg !20
  %cmp2 = icmp slt i32 %i.1, 10000, !dbg !37
  br i1 %cmp2, label %for.body3, label %for.end52, !dbg !39

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.value(metadata i32 0, metadata !40, metadata !DIExpression()), !dbg !42
  %call = call i32 @rand() #4, !dbg !43
  %conv = sitofp i32 %call to double, !dbg !43
  %mul = fmul double 1.000000e+01, %conv, !dbg !43
  %div = fdiv double %mul, 0x41E0000000000000, !dbg !43
  %conv4 = fptosi double %div to i32, !dbg !43
  call void @llvm.dbg.value(metadata i32 %conv4, metadata !44, metadata !DIExpression()), !dbg !42
  br label %do.body, !dbg !45

do.body:                                          ; preds = %do.cond, %for.body3
  %call5 = call i32 @rand() #4, !dbg !46
  %conv6 = sitofp i32 %call5 to double, !dbg !46
  %mul7 = fmul double 1.000000e+01, %conv6, !dbg !46
  %div8 = fdiv double %mul7, 0x41E0000000000000, !dbg !46
  %conv9 = fptosi double %div8 to i32, !dbg !46
  call void @llvm.dbg.value(metadata i32 %conv9, metadata !48, metadata !DIExpression()), !dbg !42
  br label %do.cond, !dbg !49

do.cond:                                          ; preds = %do.body
  %cmp10 = icmp eq i32 %conv4, %conv9, !dbg !50
  br i1 %cmp10, label %do.body, label %do.end, !dbg !49, !llvm.loop !51

do.end:                                           ; preds = %do.cond
  %call12 = call i32 @rand() #4, !dbg !53
  %conv13 = sitofp i32 %call12 to double, !dbg !53
  %mul14 = fmul double 1.000000e+01, %conv13, !dbg !53
  %div15 = fdiv double %mul14, 0x41E0000000000000, !dbg !53
  %conv16 = fptosi double %div15 to i32, !dbg !53
  call void @llvm.dbg.value(metadata i32 %conv16, metadata !54, metadata !DIExpression()), !dbg !42
  switch i32 %conv16, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb22
  ], !dbg !55

sw.bb:                                            ; preds = %do.end, %do.end, %do.end
  %idxprom17 = sext i32 %conv4 to i64, !dbg !56
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom17, !dbg !56
  %0 = load i32, i32* %arrayidx18, align 4, !dbg !56
  %idxprom19 = sext i32 %conv9 to i64, !dbg !58
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom19, !dbg !58
  %1 = load i32, i32* %arrayidx20, align 4, !dbg !58
  %sub = sub nsw i32 %0, %1, !dbg !59
  %div21 = sdiv i32 %sub, 2, !dbg !60
  call void @llvm.dbg.value(metadata i32 %div21, metadata !40, metadata !DIExpression()), !dbg !42
  br label %sw.epilog, !dbg !61

sw.bb22:                                          ; preds = %do.end
  call void @llvm.dbg.value(metadata i32 0, metadata !62, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 0, metadata !63, metadata !DIExpression()), !dbg !65
  br label %for.cond23, !dbg !66

for.cond23:                                       ; preds = %for.inc32, %sw.bb22
  %sum.0 = phi i32 [ 0, %sw.bb22 ], [ %add, %for.inc32 ], !dbg !67
  %j.0 = phi i32 [ 0, %sw.bb22 ], [ %inc33, %for.inc32 ], !dbg !65
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !63, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !62, metadata !DIExpression()), !dbg !42
  %cmp24 = icmp slt i32 %j.0, 10, !dbg !68
  br i1 %cmp24, label %for.body26, label %for.end34, !dbg !70

for.body26:                                       ; preds = %for.cond23
  %idxprom27 = sext i32 %j.0 to i64, !dbg !71
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom27, !dbg !71
  %2 = load i32, i32* %arrayidx28, align 4, !dbg !71
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2), !dbg !73
  %idxprom30 = sext i32 %j.0 to i64, !dbg !74
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom30, !dbg !74
  %3 = load i32, i32* %arrayidx31, align 4, !dbg !74
  %add = add nsw i32 %sum.0, %3, !dbg !75
  call void @llvm.dbg.value(metadata i32 %add, metadata !62, metadata !DIExpression()), !dbg !42
  br label %for.inc32, !dbg !76

for.inc32:                                        ; preds = %for.body26
  %inc33 = add nsw i32 %j.0, 1, !dbg !77
  call void @llvm.dbg.value(metadata i32 %inc33, metadata !63, metadata !DIExpression()), !dbg !65
  br label %for.cond23, !dbg !78, !llvm.loop !79

for.end34:                                        ; preds = %for.cond23
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %sum.0), !dbg !81
  br label %for.inc50, !dbg !82

sw.default:                                       ; preds = %do.end
  %idxprom36 = sext i32 %conv4 to i64, !dbg !83
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom36, !dbg !83
  %4 = load i32, i32* %arrayidx37, align 4, !dbg !83
  %conv38 = sitofp i32 %4 to double, !dbg !83
  %call39 = call i32 @rand() #4, !dbg !83
  %conv40 = sitofp i32 %call39 to double, !dbg !83
  %mul41 = fmul double %conv38, %conv40, !dbg !83
  %div42 = fdiv double %mul41, 0x41E0000000000000, !dbg !83
  %conv43 = fptosi double %div42 to i32, !dbg !83
  call void @llvm.dbg.value(metadata i32 %conv43, metadata !40, metadata !DIExpression()), !dbg !42
  br label %sw.epilog, !dbg !84

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %diff.0 = phi i32 [ %conv43, %sw.default ], [ %div21, %sw.bb ], !dbg !67
  call void @llvm.dbg.value(metadata i32 %diff.0, metadata !40, metadata !DIExpression()), !dbg !42
  %idxprom44 = sext i32 %conv4 to i64, !dbg !85
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom44, !dbg !85
  %5 = load i32, i32* %arrayidx45, align 4, !dbg !87
  %sub46 = sub nsw i32 %5, %diff.0, !dbg !87
  store i32 %sub46, i32* %arrayidx45, align 4, !dbg !87
  %idxprom47 = sext i32 %conv9 to i64, !dbg !88
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* @bucket, i64 0, i64 %idxprom47, !dbg !88
  %6 = load i32, i32* %arrayidx48, align 4, !dbg !89
  %add49 = add nsw i32 %6, %diff.0, !dbg !89
  store i32 %add49, i32* %arrayidx48, align 4, !dbg !89
  br label %for.inc50, !dbg !90

for.inc50:                                        ; preds = %sw.epilog, %for.end34
  %inc51 = add nsw i32 %i.1, 1, !dbg !91
  call void @llvm.dbg.value(metadata i32 %inc51, metadata !19, metadata !DIExpression()), !dbg !20
  br label %for.cond1, !dbg !92, !llvm.loop !93

for.end52:                                        ; preds = %for.cond1
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @omp_set_num_threads(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!20 = !DILocation(line: 0, scope: !16)
!21 = !DILocation(line: 11, column: 7, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !3, line: 11, column: 2)
!23 = !DILocation(line: 0, scope: !22)
!24 = !DILocation(line: 11, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !3, line: 11, column: 2)
!26 = !DILocation(line: 11, column: 2, scope: !22)
!27 = !DILocation(line: 11, column: 27, scope: !25)
!28 = !DILocation(line: 11, column: 37, scope: !25)
!29 = !DILocation(line: 11, column: 23, scope: !25)
!30 = !DILocation(line: 11, column: 2, scope: !25)
!31 = distinct !{!31, !26, !32}
!32 = !DILocation(line: 11, column: 39, scope: !22)
!33 = !DILocation(line: 12, column: 2, scope: !16)
!34 = !DILocation(line: 15, column: 7, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !3, line: 15, column: 2)
!36 = !DILocation(line: 0, scope: !35)
!37 = !DILocation(line: 15, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 15, column: 2)
!39 = !DILocation(line: 15, column: 2, scope: !35)
!40 = !DILocalVariable(name: "diff", scope: !41, file: !3, line: 16, type: !9)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 15, column: 30)
!42 = !DILocation(line: 0, scope: !41)
!43 = !DILocation(line: 18, column: 10, scope: !41)
!44 = !DILocalVariable(name: "from", scope: !41, file: !3, line: 16, type: !9)
!45 = !DILocation(line: 19, column: 3, scope: !41)
!46 = !DILocation(line: 19, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !3, line: 19, column: 6)
!48 = !DILocalVariable(name: "to", scope: !41, file: !3, line: 16, type: !9)
!49 = !DILocation(line: 19, column: 24, scope: !47)
!50 = !DILocation(line: 19, column: 38, scope: !41)
!51 = distinct !{!51, !45, !52}
!52 = !DILocation(line: 19, column: 43, scope: !41)
!53 = !DILocation(line: 20, column: 10, scope: !41)
!54 = !DILocalVariable(name: "mode", scope: !41, file: !3, line: 16, type: !9)
!55 = !DILocation(line: 22, column: 3, scope: !41)
!56 = !DILocation(line: 26, column: 12, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !3, line: 22, column: 17)
!58 = !DILocation(line: 26, column: 27, scope: !57)
!59 = !DILocation(line: 26, column: 25, scope: !57)
!60 = !DILocation(line: 26, column: 39, scope: !57)
!61 = !DILocation(line: 27, column: 4, scope: !57)
!62 = !DILocalVariable(name: "sum", scope: !41, file: !3, line: 16, type: !9)
!63 = !DILocalVariable(name: "j", scope: !64, file: !3, line: 31, type: !9)
!64 = distinct !DILexicalBlock(scope: !57, file: !3, line: 31, column: 4)
!65 = !DILocation(line: 0, scope: !64)
!66 = !DILocation(line: 31, column: 9, scope: !64)
!67 = !DILocation(line: 0, scope: !57)
!68 = !DILocation(line: 31, column: 22, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !3, line: 31, column: 4)
!70 = !DILocation(line: 31, column: 4, scope: !64)
!71 = !DILocation(line: 32, column: 19, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !3, line: 31, column: 33)
!73 = !DILocation(line: 32, column: 5, scope: !72)
!74 = !DILocation(line: 33, column: 12, scope: !72)
!75 = !DILocation(line: 33, column: 9, scope: !72)
!76 = !DILocation(line: 34, column: 4, scope: !72)
!77 = !DILocation(line: 31, column: 29, scope: !69)
!78 = !DILocation(line: 31, column: 4, scope: !69)
!79 = distinct !{!79, !70, !80}
!80 = !DILocation(line: 34, column: 4, scope: !64)
!81 = !DILocation(line: 35, column: 4, scope: !57)
!82 = !DILocation(line: 36, column: 4, scope: !57)
!83 = !DILocation(line: 39, column: 11, scope: !57)
!84 = !DILocation(line: 40, column: 4, scope: !57)
!85 = !DILocation(line: 45, column: 4, scope: !86)
!86 = distinct !DILexicalBlock(scope: !41, file: !3, line: 44, column: 3)
!87 = !DILocation(line: 45, column: 17, scope: !86)
!88 = !DILocation(line: 46, column: 4, scope: !86)
!89 = !DILocation(line: 46, column: 17, scope: !86)
!90 = !DILocation(line: 48, column: 2, scope: !41)
!91 = !DILocation(line: 15, column: 26, scope: !38)
!92 = !DILocation(line: 15, column: 2, scope: !38)
!93 = distinct !{!93, !39, !94}
!94 = !DILocation(line: 48, column: 2, scope: !35)
!95 = !DILocation(line: 50, column: 2, scope: !16)
