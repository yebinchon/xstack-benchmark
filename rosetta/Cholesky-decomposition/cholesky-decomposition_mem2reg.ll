; ModuleID = 'cholesky-decomposition.ll'
source_filename = "cholesky-decomposition.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%2.5f \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.m1 = private unnamed_addr constant [9 x double] [double 2.500000e+01, double 1.500000e+01, double -5.000000e+00, double 1.500000e+01, double 1.800000e+01, double 0.000000e+00, double -5.000000e+00, double 0.000000e+00, double 1.100000e+01], align 16
@__const.main.m2 = private unnamed_addr constant [16 x double] [double 1.800000e+01, double 2.200000e+01, double 5.400000e+01, double 4.200000e+01, double 2.200000e+01, double 7.000000e+01, double 8.600000e+01, double 6.200000e+01, double 5.400000e+01, double 8.600000e+01, double 1.740000e+02, double 1.340000e+02, double 4.200000e+01, double 6.200000e+01, double 1.340000e+02, double 1.060000e+02], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local double* @cholesky(double* %A, i32 %n) #0 !dbg !11 {
entry:
  call void @llvm.dbg.value(metadata double* %A, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.value(metadata i32 %n, metadata !17, metadata !DIExpression()), !dbg !16
  %mul = mul nsw i32 %n, %n, !dbg !18
  %conv = sext i32 %mul to i64, !dbg !19
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #6, !dbg !20
  %0 = bitcast i8* %call to double*, !dbg !21
  call void @llvm.dbg.value(metadata double* %0, metadata !22, metadata !DIExpression()), !dbg !16
  %cmp = icmp eq double* %0, null, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #7, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc44, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc45, %for.inc44 ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !27, metadata !DIExpression()), !dbg !29
  %cmp2 = icmp slt i32 %i.0, %n, !dbg !31
  br i1 %cmp2, label %for.body, label %for.end46, !dbg !33

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !36
  br label %for.cond4, !dbg !37

for.cond4:                                        ; preds = %for.inc41, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc42, %for.inc41 ], !dbg !36
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !34, metadata !DIExpression()), !dbg !36
  %add = add nsw i32 %i.0, 1, !dbg !38
  %cmp5 = icmp slt i32 %j.0, %add, !dbg !40
  br i1 %cmp5, label %for.body7, label %for.end43, !dbg !41

for.body7:                                        ; preds = %for.cond4
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !42, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !47
  br label %for.cond8, !dbg !48

for.cond8:                                        ; preds = %for.inc, %for.body7
  %s.0 = phi double [ 0.000000e+00, %for.body7 ], [ %add19, %for.inc ], !dbg !44
  %k.0 = phi i32 [ 0, %for.body7 ], [ %inc, %for.inc ], !dbg !47
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !45, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata double %s.0, metadata !42, metadata !DIExpression()), !dbg !44
  %cmp9 = icmp slt i32 %k.0, %j.0, !dbg !49
  br i1 %cmp9, label %for.body11, label %for.end, !dbg !51

for.body11:                                       ; preds = %for.cond8
  %mul12 = mul nsw i32 %i.0, %n, !dbg !52
  %add13 = add nsw i32 %mul12, %k.0, !dbg !53
  %idxprom = sext i32 %add13 to i64, !dbg !54
  %arrayidx = getelementptr inbounds double, double* %0, i64 %idxprom, !dbg !54
  %1 = load double, double* %arrayidx, align 8, !dbg !54
  %mul14 = mul nsw i32 %j.0, %n, !dbg !55
  %add15 = add nsw i32 %mul14, %k.0, !dbg !56
  %idxprom16 = sext i32 %add15 to i64, !dbg !57
  %arrayidx17 = getelementptr inbounds double, double* %0, i64 %idxprom16, !dbg !57
  %2 = load double, double* %arrayidx17, align 8, !dbg !57
  %mul18 = fmul double %1, %2, !dbg !58
  %add19 = fadd double %s.0, %mul18, !dbg !59
  call void @llvm.dbg.value(metadata double %add19, metadata !42, metadata !DIExpression()), !dbg !44
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body11
  %inc = add nsw i32 %k.0, 1, !dbg !61
  call void @llvm.dbg.value(metadata i32 %inc, metadata !45, metadata !DIExpression()), !dbg !47
  br label %for.cond8, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond8
  %cmp20 = icmp eq i32 %i.0, %j.0, !dbg !65
  br i1 %cmp20, label %cond.true, label %cond.false, !dbg !66

cond.true:                                        ; preds = %for.end
  %mul22 = mul nsw i32 %i.0, %n, !dbg !67
  %add23 = add nsw i32 %mul22, %i.0, !dbg !68
  %idxprom24 = sext i32 %add23 to i64, !dbg !69
  %arrayidx25 = getelementptr inbounds double, double* %A, i64 %idxprom24, !dbg !69
  %3 = load double, double* %arrayidx25, align 8, !dbg !69
  %sub = fsub double %3, %s.0, !dbg !70
  %call26 = call double @sqrt(double %sub) #6, !dbg !71
  br label %cond.end, !dbg !66

cond.false:                                       ; preds = %for.end
  %mul27 = mul nsw i32 %j.0, %n, !dbg !72
  %add28 = add nsw i32 %mul27, %j.0, !dbg !73
  %idxprom29 = sext i32 %add28 to i64, !dbg !74
  %arrayidx30 = getelementptr inbounds double, double* %0, i64 %idxprom29, !dbg !74
  %4 = load double, double* %arrayidx30, align 8, !dbg !74
  %div = fdiv double 1.000000e+00, %4, !dbg !75
  %mul31 = mul nsw i32 %i.0, %n, !dbg !76
  %add32 = add nsw i32 %mul31, %j.0, !dbg !77
  %idxprom33 = sext i32 %add32 to i64, !dbg !78
  %arrayidx34 = getelementptr inbounds double, double* %A, i64 %idxprom33, !dbg !78
  %5 = load double, double* %arrayidx34, align 8, !dbg !78
  %sub35 = fsub double %5, %s.0, !dbg !79
  %mul36 = fmul double %div, %sub35, !dbg !80
  br label %cond.end, !dbg !66

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call26, %cond.true ], [ %mul36, %cond.false ], !dbg !66
  %mul37 = mul nsw i32 %i.0, %n, !dbg !81
  %add38 = add nsw i32 %mul37, %j.0, !dbg !82
  %idxprom39 = sext i32 %add38 to i64, !dbg !83
  %arrayidx40 = getelementptr inbounds double, double* %0, i64 %idxprom39, !dbg !83
  store double %cond, double* %arrayidx40, align 8, !dbg !84
  br label %for.inc41, !dbg !85

for.inc41:                                        ; preds = %cond.end
  %inc42 = add nsw i32 %j.0, 1, !dbg !86
  call void @llvm.dbg.value(metadata i32 %inc42, metadata !34, metadata !DIExpression()), !dbg !36
  br label %for.cond4, !dbg !87, !llvm.loop !88

for.end43:                                        ; preds = %for.cond4
  br label %for.inc44, !dbg !89

for.inc44:                                        ; preds = %for.end43
  %inc45 = add nsw i32 %i.0, 1, !dbg !90
  call void @llvm.dbg.value(metadata i32 %inc45, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end46:                                        ; preds = %for.cond
  ret double* %0, !dbg !94
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_matrix(double* %A, i32 %n) #0 !dbg !95 {
entry:
  call void @llvm.dbg.value(metadata double* %A, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 %n, metadata !100, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.value(metadata i32 0, metadata !101, metadata !DIExpression()), !dbg !103
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc5, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc6, %for.inc5 ], !dbg !103
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !101, metadata !DIExpression()), !dbg !103
  %cmp = icmp slt i32 %i.0, %n, !dbg !105
  br i1 %cmp, label %for.body, label %for.end7, !dbg !107

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !108, metadata !DIExpression()), !dbg !111
  br label %for.cond1, !dbg !112

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !111
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !108, metadata !DIExpression()), !dbg !111
  %cmp2 = icmp slt i32 %j.0, %n, !dbg !113
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !115

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %i.0, %n, !dbg !116
  %add = add nsw i32 %mul, %j.0, !dbg !117
  %idxprom = sext i32 %add to i64, !dbg !118
  %arrayidx = getelementptr inbounds double, double* %A, i64 %idxprom, !dbg !118
  %0 = load double, double* %arrayidx, align 8, !dbg !118
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %0), !dbg !119
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1, !dbg !120
  call void @llvm.dbg.value(metadata i32 %inc, metadata !108, metadata !DIExpression()), !dbg !111
  br label %for.cond1, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond1
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  br label %for.inc5, !dbg !125

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %i.0, 1, !dbg !126
  call void @llvm.dbg.value(metadata i32 %inc6, metadata !101, metadata !DIExpression()), !dbg !103
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !130
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !131 {
entry:
  %m1 = alloca [9 x double], align 16
  %m2 = alloca [16 x double], align 16
  call void @llvm.dbg.value(metadata i32 3, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [9 x double]* %m1, metadata !136, metadata !DIExpression()), !dbg !140
  %0 = bitcast [9 x double]* %m1 to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([9 x double]* @__const.main.m1 to i8*), i64 72, i1 false), !dbg !140
  %arraydecay = getelementptr inbounds [9 x double], [9 x double]* %m1, i64 0, i64 0, !dbg !141
  %call = call double* @cholesky(double* %arraydecay, i32 3), !dbg !142
  call void @llvm.dbg.value(metadata double* %call, metadata !143, metadata !DIExpression()), !dbg !135
  call void @show_matrix(double* %call, i32 3), !dbg !144
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !145
  %1 = bitcast double* %call to i8*, !dbg !146
  call void @free(i8* %1) #6, !dbg !147
  call void @llvm.dbg.value(metadata i32 4, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [16 x double]* %m2, metadata !148, metadata !DIExpression()), !dbg !152
  %2 = bitcast [16 x double]* %m2 to i8*, !dbg !152
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([16 x double]* @__const.main.m2 to i8*), i64 128, i1 false), !dbg !152
  %arraydecay2 = getelementptr inbounds [16 x double], [16 x double]* %m2, i64 0, i64 0, !dbg !153
  %call3 = call double* @cholesky(double* %arraydecay2, i32 4), !dbg !154
  call void @llvm.dbg.value(metadata double* %call3, metadata !155, metadata !DIExpression()), !dbg !135
  call void @show_matrix(double* %call3, i32 4), !dbg !156
  %3 = bitcast double* %call3 to i8*, !dbg !157
  call void @free(i8* %3) #6, !dbg !158
  ret i32 0, !dbg !159
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "cholesky-decomposition.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Cholesky-decomposition")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!11 = distinct !DISubprogram(name: "cholesky", scope: !1, file: !1, line: 5, type: !12, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!4, !4, !14}
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "A", arg: 1, scope: !11, file: !1, line: 5, type: !4)
!16 = !DILocation(line: 0, scope: !11)
!17 = !DILocalVariable(name: "n", arg: 2, scope: !11, file: !1, line: 5, type: !14)
!18 = !DILocation(line: 6, column: 35, scope: !11)
!19 = !DILocation(line: 6, column: 33, scope: !11)
!20 = !DILocation(line: 6, column: 26, scope: !11)
!21 = !DILocation(line: 6, column: 17, scope: !11)
!22 = !DILocalVariable(name: "L", scope: !11, file: !1, line: 6, type: !4)
!23 = !DILocation(line: 7, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !1, line: 7, column: 9)
!25 = !DILocation(line: 7, column: 9, scope: !11)
!26 = !DILocation(line: 8, column: 9, scope: !24)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 10, type: !14)
!28 = distinct !DILexicalBlock(scope: !11, file: !1, line: 10, column: 5)
!29 = !DILocation(line: 0, scope: !28)
!30 = !DILocation(line: 10, column: 10, scope: !28)
!31 = !DILocation(line: 10, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 10, column: 5)
!33 = !DILocation(line: 10, column: 5, scope: !28)
!34 = !DILocalVariable(name: "j", scope: !35, file: !1, line: 11, type: !14)
!35 = distinct !DILexicalBlock(scope: !32, file: !1, line: 11, column: 9)
!36 = !DILocation(line: 0, scope: !35)
!37 = !DILocation(line: 11, column: 14, scope: !35)
!38 = !DILocation(line: 11, column: 31, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 11, column: 9)
!40 = !DILocation(line: 11, column: 27, scope: !39)
!41 = !DILocation(line: 11, column: 9, scope: !35)
!42 = !DILocalVariable(name: "s", scope: !43, file: !1, line: 12, type: !5)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 11, column: 41)
!44 = !DILocation(line: 0, scope: !43)
!45 = !DILocalVariable(name: "k", scope: !46, file: !1, line: 13, type: !14)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 13, column: 13)
!47 = !DILocation(line: 0, scope: !46)
!48 = !DILocation(line: 13, column: 18, scope: !46)
!49 = !DILocation(line: 13, column: 31, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 13, column: 13)
!51 = !DILocation(line: 13, column: 13, scope: !46)
!52 = !DILocation(line: 14, column: 26, scope: !50)
!53 = !DILocation(line: 14, column: 30, scope: !50)
!54 = !DILocation(line: 14, column: 22, scope: !50)
!55 = !DILocation(line: 14, column: 41, scope: !50)
!56 = !DILocation(line: 14, column: 45, scope: !50)
!57 = !DILocation(line: 14, column: 37, scope: !50)
!58 = !DILocation(line: 14, column: 35, scope: !50)
!59 = !DILocation(line: 14, column: 19, scope: !50)
!60 = !DILocation(line: 14, column: 17, scope: !50)
!61 = !DILocation(line: 13, column: 37, scope: !50)
!62 = !DILocation(line: 13, column: 13, scope: !50)
!63 = distinct !{!63, !51, !64}
!64 = !DILocation(line: 14, column: 48, scope: !46)
!65 = !DILocation(line: 15, column: 31, scope: !43)
!66 = !DILocation(line: 15, column: 28, scope: !43)
!67 = !DILocation(line: 16, column: 37, scope: !43)
!68 = !DILocation(line: 16, column: 41, scope: !43)
!69 = !DILocation(line: 16, column: 33, scope: !43)
!70 = !DILocation(line: 16, column: 46, scope: !43)
!71 = !DILocation(line: 16, column: 28, scope: !43)
!72 = !DILocation(line: 17, column: 39, scope: !43)
!73 = !DILocation(line: 17, column: 43, scope: !43)
!74 = !DILocation(line: 17, column: 35, scope: !43)
!75 = !DILocation(line: 17, column: 33, scope: !43)
!76 = !DILocation(line: 17, column: 55, scope: !43)
!77 = !DILocation(line: 17, column: 59, scope: !43)
!78 = !DILocation(line: 17, column: 51, scope: !43)
!79 = !DILocation(line: 17, column: 64, scope: !43)
!80 = !DILocation(line: 17, column: 48, scope: !43)
!81 = !DILocation(line: 15, column: 17, scope: !43)
!82 = !DILocation(line: 15, column: 21, scope: !43)
!83 = !DILocation(line: 15, column: 13, scope: !43)
!84 = !DILocation(line: 15, column: 26, scope: !43)
!85 = !DILocation(line: 18, column: 9, scope: !43)
!86 = !DILocation(line: 11, column: 37, scope: !39)
!87 = !DILocation(line: 11, column: 9, scope: !39)
!88 = distinct !{!88, !41, !89}
!89 = !DILocation(line: 18, column: 9, scope: !35)
!90 = !DILocation(line: 10, column: 29, scope: !32)
!91 = !DILocation(line: 10, column: 5, scope: !32)
!92 = distinct !{!92, !33, !93}
!93 = !DILocation(line: 18, column: 9, scope: !28)
!94 = !DILocation(line: 20, column: 5, scope: !11)
!95 = distinct !DISubprogram(name: "show_matrix", scope: !1, file: !1, line: 23, type: !96, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{null, !4, !14}
!98 = !DILocalVariable(name: "A", arg: 1, scope: !95, file: !1, line: 23, type: !4)
!99 = !DILocation(line: 0, scope: !95)
!100 = !DILocalVariable(name: "n", arg: 2, scope: !95, file: !1, line: 23, type: !14)
!101 = !DILocalVariable(name: "i", scope: !102, file: !1, line: 24, type: !14)
!102 = distinct !DILexicalBlock(scope: !95, file: !1, line: 24, column: 5)
!103 = !DILocation(line: 0, scope: !102)
!104 = !DILocation(line: 24, column: 10, scope: !102)
!105 = !DILocation(line: 24, column: 23, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 24, column: 5)
!107 = !DILocation(line: 24, column: 5, scope: !102)
!108 = !DILocalVariable(name: "j", scope: !109, file: !1, line: 25, type: !14)
!109 = distinct !DILexicalBlock(scope: !110, file: !1, line: 25, column: 9)
!110 = distinct !DILexicalBlock(scope: !106, file: !1, line: 24, column: 33)
!111 = !DILocation(line: 0, scope: !109)
!112 = !DILocation(line: 25, column: 14, scope: !109)
!113 = !DILocation(line: 25, column: 27, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !1, line: 25, column: 9)
!115 = !DILocation(line: 25, column: 9, scope: !109)
!116 = !DILocation(line: 26, column: 34, scope: !114)
!117 = !DILocation(line: 26, column: 38, scope: !114)
!118 = !DILocation(line: 26, column: 30, scope: !114)
!119 = !DILocation(line: 26, column: 13, scope: !114)
!120 = !DILocation(line: 25, column: 33, scope: !114)
!121 = !DILocation(line: 25, column: 9, scope: !114)
!122 = distinct !{!122, !115, !123}
!123 = !DILocation(line: 26, column: 42, scope: !109)
!124 = !DILocation(line: 27, column: 9, scope: !110)
!125 = !DILocation(line: 28, column: 5, scope: !110)
!126 = !DILocation(line: 24, column: 29, scope: !106)
!127 = !DILocation(line: 24, column: 5, scope: !106)
!128 = distinct !{!128, !107, !129}
!129 = !DILocation(line: 28, column: 5, scope: !102)
!130 = !DILocation(line: 29, column: 1, scope: !95)
!131 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !132, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DISubroutineType(types: !133)
!133 = !{!14}
!134 = !DILocalVariable(name: "n", scope: !131, file: !1, line: 32, type: !14)
!135 = !DILocation(line: 0, scope: !131)
!136 = !DILocalVariable(name: "m1", scope: !131, file: !1, line: 33, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 576, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 9)
!140 = !DILocation(line: 33, column: 12, scope: !131)
!141 = !DILocation(line: 36, column: 27, scope: !131)
!142 = !DILocation(line: 36, column: 18, scope: !131)
!143 = !DILocalVariable(name: "c1", scope: !131, file: !1, line: 36, type: !4)
!144 = !DILocation(line: 37, column: 5, scope: !131)
!145 = !DILocation(line: 38, column: 5, scope: !131)
!146 = !DILocation(line: 39, column: 10, scope: !131)
!147 = !DILocation(line: 39, column: 5, scope: !131)
!148 = !DILocalVariable(name: "m2", scope: !131, file: !1, line: 42, type: !149)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 16)
!152 = !DILocation(line: 42, column: 12, scope: !131)
!153 = !DILocation(line: 46, column: 27, scope: !131)
!154 = !DILocation(line: 46, column: 18, scope: !131)
!155 = !DILocalVariable(name: "c2", scope: !131, file: !1, line: 46, type: !4)
!156 = !DILocation(line: 47, column: 5, scope: !131)
!157 = !DILocation(line: 48, column: 10, scope: !131)
!158 = !DILocation(line: 48, column: 5, scope: !131)
!159 = !DILocation(line: 50, column: 5, scope: !131)
