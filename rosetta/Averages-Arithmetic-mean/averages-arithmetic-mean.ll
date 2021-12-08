; ModuleID = 'averages-arithmetic-mean.bc'
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
  %v.addr = alloca double*, align 8
  %len.addr = alloca i32, align 4
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  store double* %v, double** %v.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata double* %sum, metadata !17, metadata !DIExpression()), !dbg !18
  store double 0.000000e+00, double* %sum, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %1 = load i32, i32* %len.addr, align 4, !dbg !26
  %cmp = icmp slt i32 %0, %1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %v.addr, align 8, !dbg !29
  %3 = load i32, i32* %i, align 4, !dbg !30
  %idxprom = sext i32 %3 to i64, !dbg !29
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !dbg !29
  %4 = load double, double* %arrayidx, align 8, !dbg !29
  %5 = load double, double* %sum, align 8, !dbg !31
  %add = fadd double %5, %4, !dbg !31
  store double %add, double* %sum, align 8, !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !33
  %inc = add nsw i32 %6, 1, !dbg !33
  store i32 %inc, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  %7 = load double, double* %sum, align 8, !dbg !37
  %8 = load i32, i32* %len.addr, align 4, !dbg !38
  %conv = sitofp i32 %8 to double, !dbg !38
  %div = fdiv double %7, %conv, !dbg !39
  ret double %div, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %v = alloca [5 x double], align 16
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x double]* %v, metadata !44, metadata !DIExpression()), !dbg !48
  %0 = bitcast [5 x double]* %v to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !48
  %1 = bitcast i8* %0 to [5 x double]*, !dbg !48
  %2 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 0, !dbg !48
  store double 1.000000e+00, double* %2, align 16, !dbg !48
  %3 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 1, !dbg !48
  store double 2.000000e+00, double* %3, align 8, !dbg !48
  %4 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 2, !dbg !48
  store double 2.718000e+00, double* %4, align 16, !dbg !48
  %5 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 3, !dbg !48
  store double 3.000000e+00, double* %5, align 8, !dbg !48
  %6 = getelementptr inbounds [5 x double], [5 x double]* %1, i32 0, i32 4, !dbg !48
  store double 3.142000e+00, double* %6, align 16, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %len, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 5, i32* %len, align 4, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc7, %entry
  %7 = load i32, i32* %len, align 4, !dbg !56
  %cmp = icmp sge i32 %7, 0, !dbg !58
  br i1 %cmp, label %for.body, label %for.end8, !dbg !59

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !60
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond1, !dbg !64

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %i, align 4, !dbg !65
  %9 = load i32, i32* %len, align 4, !dbg !67
  %cmp2 = icmp slt i32 %8, %9, !dbg !68
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !69

for.body3:                                        ; preds = %for.cond1
  %10 = load i32, i32* %i, align 4, !dbg !70
  %tobool = icmp ne i32 %10, 0, !dbg !70
  %11 = zext i1 %tobool to i64, !dbg !70
  %cond = select i1 %tobool, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), !dbg !70
  %12 = load i32, i32* %i, align 4, !dbg !71
  %idxprom = sext i32 %12 to i64, !dbg !72
  %arrayidx = getelementptr inbounds [5 x double], [5 x double]* %v, i64 0, i64 %idxprom, !dbg !72
  %13 = load double, double* %arrayidx, align 8, !dbg !72
  %call4 = call i32 (i8*, ...) @printf(i8* %cond, double %13), !dbg !73
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body3
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %14, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond1, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [5 x double], [5 x double]* %v, i64 0, i64 0, !dbg !78
  %15 = load i32, i32* %len, align 4, !dbg !79
  %call5 = call double @mean(double* %arraydecay, i32 %15), !dbg !80
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double %call5), !dbg !81
  br label %for.inc7, !dbg !82

for.inc7:                                         ; preds = %for.end
  %16 = load i32, i32* %len, align 4, !dbg !83
  %dec = add nsw i32 %16, -1, !dbg !83
  store i32 %dec, i32* %len, align 4, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end8:                                         ; preds = %for.cond
  ret i32 0, !dbg !87
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

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
!14 = !DILocation(line: 3, column: 21, scope: !7)
!15 = !DILocalVariable(name: "len", arg: 2, scope: !7, file: !1, line: 3, type: !12)
!16 = !DILocation(line: 3, column: 28, scope: !7)
!17 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 9, scope: !7)
!19 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !12)
!20 = !DILocation(line: 6, column: 6, scope: !7)
!21 = !DILocation(line: 7, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 2)
!23 = !DILocation(line: 7, column: 7, scope: !22)
!24 = !DILocation(line: 7, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 7, column: 2)
!26 = !DILocation(line: 7, column: 18, scope: !25)
!27 = !DILocation(line: 7, column: 16, scope: !25)
!28 = !DILocation(line: 7, column: 2, scope: !22)
!29 = !DILocation(line: 8, column: 10, scope: !25)
!30 = !DILocation(line: 8, column: 12, scope: !25)
!31 = !DILocation(line: 8, column: 7, scope: !25)
!32 = !DILocation(line: 8, column: 3, scope: !25)
!33 = !DILocation(line: 7, column: 24, scope: !25)
!34 = !DILocation(line: 7, column: 2, scope: !25)
!35 = distinct !{!35, !28, !36}
!36 = !DILocation(line: 8, column: 13, scope: !22)
!37 = !DILocation(line: 9, column: 9, scope: !7)
!38 = !DILocation(line: 9, column: 15, scope: !7)
!39 = !DILocation(line: 9, column: 13, scope: !7)
!40 = !DILocation(line: 9, column: 2, scope: !7)
!41 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !42, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!12}
!44 = !DILocalVariable(name: "v", scope: !41, file: !1, line: 14, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 5)
!48 = !DILocation(line: 14, column: 9, scope: !41)
!49 = !DILocalVariable(name: "i", scope: !41, file: !1, line: 15, type: !12)
!50 = !DILocation(line: 15, column: 6, scope: !41)
!51 = !DILocalVariable(name: "len", scope: !41, file: !1, line: 15, type: !12)
!52 = !DILocation(line: 15, column: 9, scope: !41)
!53 = !DILocation(line: 16, column: 11, scope: !54)
!54 = distinct !DILexicalBlock(scope: !41, file: !1, line: 16, column: 2)
!55 = !DILocation(line: 16, column: 7, scope: !54)
!56 = !DILocation(line: 16, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 16, column: 2)
!58 = !DILocation(line: 16, column: 20, scope: !57)
!59 = !DILocation(line: 16, column: 2, scope: !54)
!60 = !DILocation(line: 17, column: 3, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 16, column: 33)
!62 = !DILocation(line: 18, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !61, file: !1, line: 18, column: 3)
!64 = !DILocation(line: 18, column: 8, scope: !63)
!65 = !DILocation(line: 18, column: 15, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 18, column: 3)
!67 = !DILocation(line: 18, column: 19, scope: !66)
!68 = !DILocation(line: 18, column: 17, scope: !66)
!69 = !DILocation(line: 18, column: 3, scope: !63)
!70 = !DILocation(line: 19, column: 11, scope: !66)
!71 = !DILocation(line: 19, column: 32, scope: !66)
!72 = !DILocation(line: 19, column: 30, scope: !66)
!73 = !DILocation(line: 19, column: 4, scope: !66)
!74 = !DILocation(line: 18, column: 25, scope: !66)
!75 = !DILocation(line: 18, column: 3, scope: !66)
!76 = distinct !{!76, !69, !77}
!77 = !DILocation(line: 19, column: 34, scope: !63)
!78 = !DILocation(line: 20, column: 27, scope: !61)
!79 = !DILocation(line: 20, column: 30, scope: !61)
!80 = !DILocation(line: 20, column: 22, scope: !61)
!81 = !DILocation(line: 20, column: 3, scope: !61)
!82 = !DILocation(line: 21, column: 2, scope: !61)
!83 = !DILocation(line: 16, column: 29, scope: !57)
!84 = !DILocation(line: 16, column: 2, scope: !57)
!85 = distinct !{!85, !59, !86}
!86 = !DILocation(line: 21, column: 2, scope: !54)
!87 = !DILocation(line: 23, column: 2, scope: !41)
