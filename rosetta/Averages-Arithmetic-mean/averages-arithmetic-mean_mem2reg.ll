; ModuleID = 'averages-arithmetic-mean.ll'
source_filename = "averages-arithmetic-mean.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"mean[\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c", %g\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%g\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"] = %g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @mean(double* %v, i32 %len) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata double* %v, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %len, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !14
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !20
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !17, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata double %sum.0, metadata !16, metadata !DIExpression()), !dbg !14
  %cmp = icmp slt i32 %i.0, %len, !dbg !21
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !24
  %arrayidx = getelementptr inbounds double, double* %v, i64 %idxprom, !dbg !24
  %0 = load double, double* %arrayidx, align 8, !dbg !24
  %add = fadd double %sum.0, %0, !dbg !25
  call void @llvm.dbg.value(metadata double %add, metadata !16, metadata !DIExpression()), !dbg !14
  br label %for.inc, !dbg !26

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !27
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !28, !llvm.loop !29

for.end:                                          ; preds = %for.cond
  %conv = sitofp i32 %len to double, !dbg !31
  %div = fdiv double %sum.0, %conv, !dbg !32
  ret double %div, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %v = alloca [5 x double], align 16
  call void @llvm.dbg.declare(metadata [5 x double]* %v, metadata !37, metadata !DIExpression()), !dbg !41
  %0 = bitcast [5 x double]* %v to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !41
  %1 = bitcast i8* %0 to [5 x double]*, !dbg !41
  %2 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 0, !dbg !41
  store double 1.000000e+00, double* %2, align 16, !dbg !41
  %3 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 1, !dbg !41
  store double 2.000000e+00, double* %3, align 8, !dbg !41
  %4 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 2, !dbg !41
  store double 2.718000e+00, double* %4, align 16, !dbg !41
  %5 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 3, !dbg !41
  store double 3.000000e+00, double* %5, align 8, !dbg !41
  %6 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 4, !dbg !41
  store double 3.142000e+00, double* %6, align 16, !dbg !41
  call void @llvm.dbg.value(metadata i32 5, metadata !42, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc7, %entry
  %len.0 = phi i32 [ 5, %entry ], [ %dec, %for.inc7 ], !dbg !46
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !42, metadata !DIExpression()), !dbg !43
  %cmp = icmp sge i32 %len.0, 0, !dbg !47
  br i1 %cmp, label %for.body, label %for.end8, !dbg !49

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @llvm.dbg.value(metadata i32 0, metadata !52, metadata !DIExpression()), !dbg !43
  br label %for.cond1, !dbg !53

for.cond1:                                        ; preds = %for.inc, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !55
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !52, metadata !DIExpression()), !dbg !43
  %cmp2 = icmp slt i32 %i.0, %len.0, !dbg !56
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !58

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %i.0, 0, !dbg !59
  %7 = zext i1 %tobool to i64, !dbg !59
  %cond = select i1 %tobool, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), !dbg !59
  %idxprom = sext i32 %i.0 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [5 x double], [5 x double]* %v, i64 0, i64 %idxprom, !dbg !60
  %8 = load double, double* %arrayidx, align 8, !dbg !60
  %call4 = call i32 (i8*, ...) @printf(i8* %cond, double %8), !dbg !61
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %i.0, 1, !dbg !62
  call void @llvm.dbg.value(metadata i32 %inc, metadata !52, metadata !DIExpression()), !dbg !43
  br label %for.cond1, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [5 x double], [5 x double]* %v, i64 0, i64 0, !dbg !66
  %call5 = call double @mean(double* %arraydecay, i32 %len.0), !dbg !67
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double %call5), !dbg !68
  br label %for.inc7, !dbg !69

for.inc7:                                         ; preds = %for.end
  %dec = add nsw i32 %len.0, -1, !dbg !70
  call void @llvm.dbg.value(metadata i32 %dec, metadata !42, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end8:                                         ; preds = %for.cond
  ret i32 0, !dbg !74
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-arithmetic-mean.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Arithmetic-mean")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "mean", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "v", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "len", arg: 2, scope: !7, file: !1, line: 3, type: !12)
!16 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 5, type: !10)
!17 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !12)
!18 = !DILocation(line: 7, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 2)
!20 = !DILocation(line: 0, scope: !19)
!21 = !DILocation(line: 7, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 7, column: 2)
!23 = !DILocation(line: 7, column: 2, scope: !19)
!24 = !DILocation(line: 8, column: 10, scope: !22)
!25 = !DILocation(line: 8, column: 7, scope: !22)
!26 = !DILocation(line: 8, column: 3, scope: !22)
!27 = !DILocation(line: 7, column: 24, scope: !22)
!28 = !DILocation(line: 7, column: 2, scope: !22)
!29 = distinct !{!29, !23, !30}
!30 = !DILocation(line: 8, column: 13, scope: !19)
!31 = !DILocation(line: 9, column: 15, scope: !7)
!32 = !DILocation(line: 9, column: 13, scope: !7)
!33 = !DILocation(line: 9, column: 2, scope: !7)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !35, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!12}
!37 = !DILocalVariable(name: "v", scope: !34, file: !1, line: 14, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 5)
!41 = !DILocation(line: 14, column: 9, scope: !34)
!42 = !DILocalVariable(name: "len", scope: !34, file: !1, line: 15, type: !12)
!43 = !DILocation(line: 0, scope: !34)
!44 = !DILocation(line: 16, column: 7, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !1, line: 16, column: 2)
!46 = !DILocation(line: 0, scope: !45)
!47 = !DILocation(line: 16, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 16, column: 2)
!49 = !DILocation(line: 16, column: 2, scope: !45)
!50 = !DILocation(line: 17, column: 3, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 16, column: 33)
!52 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 15, type: !12)
!53 = !DILocation(line: 18, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 18, column: 3)
!55 = !DILocation(line: 0, scope: !54)
!56 = !DILocation(line: 18, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 18, column: 3)
!58 = !DILocation(line: 18, column: 3, scope: !54)
!59 = !DILocation(line: 19, column: 11, scope: !57)
!60 = !DILocation(line: 19, column: 30, scope: !57)
!61 = !DILocation(line: 19, column: 4, scope: !57)
!62 = !DILocation(line: 18, column: 25, scope: !57)
!63 = !DILocation(line: 18, column: 3, scope: !57)
!64 = distinct !{!64, !58, !65}
!65 = !DILocation(line: 19, column: 34, scope: !54)
!66 = !DILocation(line: 20, column: 27, scope: !51)
!67 = !DILocation(line: 20, column: 22, scope: !51)
!68 = !DILocation(line: 20, column: 3, scope: !51)
!69 = !DILocation(line: 21, column: 2, scope: !51)
!70 = !DILocation(line: 16, column: 29, scope: !48)
!71 = !DILocation(line: 16, column: 2, scope: !48)
!72 = distinct !{!72, !49, !73}
!73 = !DILocation(line: 21, column: 2, scope: !45)
!74 = !DILocation(line: 23, column: 2, scope: !34)
