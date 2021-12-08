; ModuleID = 'averages-mode.ll'
source_filename = "averages-mode.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vcount = type { double, i32 }

@__const.main.values = private unnamed_addr constant [13 x double] [double 1.000000e+00, double 3.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 7.000000e+00, double 7.000000e+00, double 1.200000e+01, double 1.200000e+01, double 1.200000e+01, double 1.200000e+01, double 1.700000e+01], align 16
@.str = private unnamed_addr constant [15 x i8] c"got %d modes:\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"\09value = %g, count = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @cmp_dbl(i8* %a, i8* %b) #0 !dbg !19 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i8* %b, metadata !26, metadata !DIExpression()), !dbg !25
  %0 = bitcast i8* %a to double*, !dbg !27
  %1 = load double, double* %0, align 8, !dbg !28
  %2 = bitcast i8* %b to double*, !dbg !29
  %3 = load double, double* %2, align 8, !dbg !30
  %sub = fsub double %1, %3, !dbg !31
  call void @llvm.dbg.value(metadata double %sub, metadata !32, metadata !DIExpression()), !dbg !25
  %cmp = fcmp olt double %sub, 0.000000e+00, !dbg !33
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !34

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !34

cond.false:                                       ; preds = %entry
  %cmp1 = fcmp ogt double %sub, 0.000000e+00, !dbg !35
  %conv = zext i1 %cmp1 to i32, !dbg !35
  br label %cond.end, !dbg !34

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv, %cond.false ], !dbg !34
  ret i32 %cond, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @vc_cmp(i8* %a, i8* %b) #0 !dbg !37 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i8* %b, metadata !40, metadata !DIExpression()), !dbg !39
  %0 = bitcast i8* %b to %struct.vcount*, !dbg !41
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %0, i32 0, i32 1, !dbg !42
  %1 = load i32, i32* %c, align 8, !dbg !42
  %2 = bitcast i8* %a to %struct.vcount*, !dbg !43
  %c1 = getelementptr inbounds %struct.vcount, %struct.vcount* %2, i32 0, i32 1, !dbg !44
  %3 = load i32, i32* %c1, align 8, !dbg !44
  %sub = sub nsw i32 %1, %3, !dbg !45
  ret i32 %sub, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_mode(double* %x, i32 %len, %struct.vcount** %list) #0 !dbg !47 {
entry:
  call void @llvm.dbg.value(metadata double* %x, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %len, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata %struct.vcount** %list, metadata !56, metadata !DIExpression()), !dbg !54
  %0 = bitcast double* %x to i8*, !dbg !57
  %conv = sext i32 %len to i64, !dbg !58
  call void @qsort(i8* %0, i64 %conv, i64 8, i32 (i8*, i8*)* @cmp_dbl), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 1, metadata !61, metadata !DIExpression()), !dbg !54
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !64
  %j.0 = phi i32 [ 1, %entry ], [ %add6, %for.inc ], !dbg !64
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !61, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !60, metadata !DIExpression()), !dbg !54
  %sub = sub nsw i32 %len, 1, !dbg !65
  %cmp = icmp slt i32 %i.0, %sub, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %inc, metadata !60, metadata !DIExpression()), !dbg !54
  %idxprom = sext i32 %inc to i64, !dbg !70
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom, !dbg !70
  %1 = load double, double* %arrayidx, align 8, !dbg !70
  %add = add nsw i32 %inc, 1, !dbg !71
  %idxprom2 = sext i32 %add to i64, !dbg !72
  %arrayidx3 = getelementptr inbounds double, double* %x, i64 %idxprom2, !dbg !72
  %2 = load double, double* %arrayidx3, align 8, !dbg !72
  %cmp4 = fcmp une double %1, %2, !dbg !73
  %conv5 = zext i1 %cmp4 to i32, !dbg !73
  %add6 = add nsw i32 %j.0, %conv5, !dbg !74
  call void @llvm.dbg.value(metadata i32 %add6, metadata !61, metadata !DIExpression()), !dbg !54
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %conv7 = sext i32 %j.0 to i64, !dbg !78
  %mul = mul i64 16, %conv7, !dbg !79
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !80
  %3 = bitcast i8* %call to %struct.vcount*, !dbg !80
  call void @llvm.dbg.value(metadata %struct.vcount* %3, metadata !81, metadata !DIExpression()), !dbg !54
  store %struct.vcount* %3, %struct.vcount** %list, align 8, !dbg !82
  %arrayidx8 = getelementptr inbounds double, double* %x, i64 0, !dbg !83
  %4 = load double, double* %arrayidx8, align 8, !dbg !83
  %arrayidx9 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 0, !dbg !84
  %v = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx9, i32 0, i32 0, !dbg !85
  store double %4, double* %v, align 8, !dbg !86
  %arrayidx10 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 0, !dbg !87
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx10, i32 0, i32 1, !dbg !88
  store i32 1, i32* %c, align 8, !dbg !89
  call void @llvm.dbg.value(metadata i32 0, metadata !61, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !54
  br label %for.cond11, !dbg !90

for.cond11:                                       ; preds = %for.inc30, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ], !dbg !92
  %j.1 = phi i32 [ 0, %for.end ], [ %j.2, %for.inc30 ], !dbg !92
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !61, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !60, metadata !DIExpression()), !dbg !54
  %sub12 = sub nsw i32 %len, 1, !dbg !93
  %cmp13 = icmp slt i32 %i.1, %sub12, !dbg !95
  br i1 %cmp13, label %for.body15, label %for.end36, !dbg !96

for.body15:                                       ; preds = %for.cond11
  %idxprom16 = sext i32 %i.1 to i64, !dbg !97
  %arrayidx17 = getelementptr inbounds double, double* %x, i64 %idxprom16, !dbg !97
  %5 = load double, double* %arrayidx17, align 8, !dbg !97
  %add18 = add nsw i32 %i.1, 1, !dbg !99
  %idxprom19 = sext i32 %add18 to i64, !dbg !100
  %arrayidx20 = getelementptr inbounds double, double* %x, i64 %idxprom19, !dbg !100
  %6 = load double, double* %arrayidx20, align 8, !dbg !100
  %cmp21 = fcmp une double %5, %6, !dbg !101
  br i1 %cmp21, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %for.body15
  %add23 = add nsw i32 %i.1, 1, !dbg !103
  %idxprom24 = sext i32 %add23 to i64, !dbg !104
  %arrayidx25 = getelementptr inbounds double, double* %x, i64 %idxprom24, !dbg !104
  %7 = load double, double* %arrayidx25, align 8, !dbg !104
  %inc26 = add nsw i32 %j.1, 1, !dbg !105
  call void @llvm.dbg.value(metadata i32 %inc26, metadata !61, metadata !DIExpression()), !dbg !54
  %idxprom27 = sext i32 %inc26 to i64, !dbg !106
  %arrayidx28 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 %idxprom27, !dbg !106
  %v29 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx28, i32 0, i32 0, !dbg !107
  store double %7, double* %v29, align 8, !dbg !108
  br label %if.end, !dbg !106

if.end:                                           ; preds = %if.then, %for.body15
  %j.2 = phi i32 [ %inc26, %if.then ], [ %j.1, %for.body15 ], !dbg !92
  call void @llvm.dbg.value(metadata i32 %j.2, metadata !61, metadata !DIExpression()), !dbg !54
  br label %for.inc30, !dbg !109

for.inc30:                                        ; preds = %if.end
  %inc31 = add nsw i32 %i.1, 1, !dbg !110
  call void @llvm.dbg.value(metadata i32 %inc31, metadata !60, metadata !DIExpression()), !dbg !54
  %idxprom32 = sext i32 %j.2 to i64, !dbg !111
  %arrayidx33 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 %idxprom32, !dbg !111
  %c34 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx33, i32 0, i32 1, !dbg !112
  %8 = load i32, i32* %c34, align 8, !dbg !113
  %inc35 = add nsw i32 %8, 1, !dbg !113
  store i32 %inc35, i32* %c34, align 8, !dbg !113
  br label %for.cond11, !dbg !114, !llvm.loop !115

for.end36:                                        ; preds = %for.cond11
  %9 = bitcast %struct.vcount* %3 to i8*, !dbg !117
  %add37 = add nsw i32 %j.1, 1, !dbg !118
  %conv38 = sext i32 %add37 to i64, !dbg !119
  call void @qsort(i8* %9, i64 %conv38, i64 16, i32 (i8*, i8*)* @vc_cmp), !dbg !120
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !54
  br label %for.cond39, !dbg !121

for.cond39:                                       ; preds = %for.inc50, %for.end36
  %i.2 = phi i32 [ 0, %for.end36 ], [ %inc51, %for.inc50 ], !dbg !123
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !60, metadata !DIExpression()), !dbg !54
  %cmp40 = icmp sle i32 %i.2, %j.1, !dbg !124
  br i1 %cmp40, label %land.rhs, label %land.end, !dbg !126

land.rhs:                                         ; preds = %for.cond39
  %idxprom42 = sext i32 %i.2 to i64, !dbg !127
  %arrayidx43 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 %idxprom42, !dbg !127
  %c44 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx43, i32 0, i32 1, !dbg !128
  %10 = load i32, i32* %c44, align 8, !dbg !128
  %arrayidx45 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 0, !dbg !129
  %c46 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx45, i32 0, i32 1, !dbg !130
  %11 = load i32, i32* %c46, align 8, !dbg !130
  %cmp47 = icmp eq i32 %10, %11, !dbg !131
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond39
  %12 = phi i1 [ false, %for.cond39 ], [ %cmp47, %land.rhs ], !dbg !132
  br i1 %12, label %for.body49, label %for.end52, !dbg !133

for.body49:                                       ; preds = %land.end
  br label %for.inc50, !dbg !133

for.inc50:                                        ; preds = %for.body49
  %inc51 = add nsw i32 %i.2, 1, !dbg !134
  call void @llvm.dbg.value(metadata i32 %inc51, metadata !60, metadata !DIExpression()), !dbg !54
  br label %for.cond39, !dbg !135, !llvm.loop !136

for.end52:                                        ; preds = %land.end
  ret i32 %i.2, !dbg !138
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !139 {
entry:
  %values = alloca [13 x double], align 16
  %vc = alloca %struct.vcount*, align 8
  call void @llvm.dbg.declare(metadata [13 x double]* %values, metadata !142, metadata !DIExpression()), !dbg !146
  %0 = bitcast [13 x double]* %values to i8*, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([13 x double]* @__const.main.values to i8*), i64 104, i1 false), !dbg !146
  call void @llvm.dbg.declare(metadata %struct.vcount** %vc, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [13 x double], [13 x double]* %values, i64 0, i64 0, !dbg !149
  %call = call i32 @get_mode(double* %arraydecay, i32 13, %struct.vcount** %vc), !dbg !150
  call void @llvm.dbg.value(metadata i32 %call, metadata !151, metadata !DIExpression()), !dbg !152
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !153
  call void @llvm.dbg.value(metadata i32 0, metadata !154, metadata !DIExpression()), !dbg !152
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !157
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !154, metadata !DIExpression()), !dbg !152
  %cmp = icmp slt i32 %i.0, %call, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %1 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !161
  %idxprom = sext i32 %i.0 to i64, !dbg !161
  %arrayidx = getelementptr inbounds %struct.vcount, %struct.vcount* %1, i64 %idxprom, !dbg !161
  %v = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx, i32 0, i32 0, !dbg !162
  %2 = load double, double* %v, align 8, !dbg !162
  %3 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !163
  %idxprom2 = sext i32 %i.0 to i64, !dbg !163
  %arrayidx3 = getelementptr inbounds %struct.vcount, %struct.vcount* %3, i64 %idxprom2, !dbg !163
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx3, i32 0, i32 1, !dbg !164
  %4 = load i32, i32* %c, align 8, !dbg !164
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), double %2, i32 %4), !dbg !165
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !166
  call void @llvm.dbg.value(metadata i32 %inc, metadata !154, metadata !DIExpression()), !dbg !152
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %5 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !170
  %6 = bitcast %struct.vcount* %5 to i8*, !dbg !170
  call void @free(i8* %6) #5, !dbg !171
  ret i32 0, !dbg !172
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-mode.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Mode")
!2 = !{}
!3 = !{!4, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "vcount", file: !1, line: 4, baseType: !10)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !11)
!11 = !{!12, !13}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !10, file: !1, line: 4, baseType: !6, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !10, file: !1, line: 4, baseType: !14, size: 32, offset: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!19 = distinct !DISubprogram(name: "cmp_dbl", scope: !1, file: !1, line: 6, type: !20, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!14, !22, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!24 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 6, type: !22)
!25 = !DILocation(line: 0, scope: !19)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 6, type: !22)
!27 = !DILocation(line: 8, column: 14, scope: !19)
!28 = !DILocation(line: 8, column: 13, scope: !19)
!29 = !DILocation(line: 8, column: 34, scope: !19)
!30 = !DILocation(line: 8, column: 33, scope: !19)
!31 = !DILocation(line: 8, column: 31, scope: !19)
!32 = !DILocalVariable(name: "x", scope: !19, file: !1, line: 8, type: !6)
!33 = !DILocation(line: 9, column: 11, scope: !19)
!34 = !DILocation(line: 9, column: 9, scope: !19)
!35 = !DILocation(line: 9, column: 24, scope: !19)
!36 = !DILocation(line: 9, column: 2, scope: !19)
!37 = distinct !DISubprogram(name: "vc_cmp", scope: !1, file: !1, line: 12, type: !20, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 12, type: !22)
!39 = !DILocation(line: 0, scope: !37)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !37, file: !1, line: 12, type: !22)
!41 = !DILocation(line: 14, column: 10, scope: !37)
!42 = !DILocation(line: 14, column: 29, scope: !37)
!43 = !DILocation(line: 14, column: 34, scope: !37)
!44 = !DILocation(line: 14, column: 53, scope: !37)
!45 = !DILocation(line: 14, column: 31, scope: !37)
!46 = !DILocation(line: 14, column: 2, scope: !37)
!47 = distinct !DISubprogram(name: "get_mode", scope: !1, file: !1, line: 17, type: !48, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !50, !14, !51}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!53 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !1, line: 17, type: !50)
!54 = !DILocation(line: 0, scope: !47)
!55 = !DILocalVariable(name: "len", arg: 2, scope: !47, file: !1, line: 17, type: !14)
!56 = !DILocalVariable(name: "list", arg: 3, scope: !47, file: !1, line: 17, type: !51)
!57 = !DILocation(line: 23, column: 8, scope: !47)
!58 = !DILocation(line: 23, column: 11, scope: !47)
!59 = !DILocation(line: 23, column: 2, scope: !47)
!60 = !DILocalVariable(name: "i", scope: !47, file: !1, line: 19, type: !14)
!61 = !DILocalVariable(name: "j", scope: !47, file: !1, line: 19, type: !14)
!62 = !DILocation(line: 26, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !1, line: 26, column: 2)
!64 = !DILocation(line: 0, scope: !63)
!65 = !DILocation(line: 26, column: 29, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 26, column: 2)
!67 = !DILocation(line: 26, column: 23, scope: !66)
!68 = !DILocation(line: 26, column: 2, scope: !63)
!69 = !DILocation(line: 26, column: 35, scope: !66)
!70 = !DILocation(line: 26, column: 45, scope: !66)
!71 = !DILocation(line: 26, column: 57, scope: !66)
!72 = !DILocation(line: 26, column: 53, scope: !66)
!73 = !DILocation(line: 26, column: 50, scope: !66)
!74 = !DILocation(line: 26, column: 41, scope: !66)
!75 = !DILocation(line: 26, column: 2, scope: !66)
!76 = distinct !{!76, !68, !77}
!77 = !DILocation(line: 26, column: 63, scope: !63)
!78 = !DILocation(line: 28, column: 39, scope: !47)
!79 = !DILocation(line: 28, column: 37, scope: !47)
!80 = !DILocation(line: 28, column: 15, scope: !47)
!81 = !DILocalVariable(name: "vc", scope: !47, file: !1, line: 20, type: !52)
!82 = !DILocation(line: 28, column: 8, scope: !47)
!83 = !DILocation(line: 29, column: 12, scope: !47)
!84 = !DILocation(line: 29, column: 2, scope: !47)
!85 = !DILocation(line: 29, column: 8, scope: !47)
!86 = !DILocation(line: 29, column: 10, scope: !47)
!87 = !DILocation(line: 30, column: 2, scope: !47)
!88 = !DILocation(line: 30, column: 8, scope: !47)
!89 = !DILocation(line: 30, column: 10, scope: !47)
!90 = !DILocation(line: 33, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !47, file: !1, line: 33, column: 2)
!92 = !DILocation(line: 0, scope: !91)
!93 = !DILocation(line: 33, column: 26, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 33, column: 2)
!95 = !DILocation(line: 33, column: 20, scope: !94)
!96 = !DILocation(line: 33, column: 2, scope: !91)
!97 = !DILocation(line: 34, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 34, column: 7)
!99 = !DILocation(line: 34, column: 19, scope: !98)
!100 = !DILocation(line: 34, column: 15, scope: !98)
!101 = !DILocation(line: 34, column: 12, scope: !98)
!102 = !DILocation(line: 34, column: 7, scope: !94)
!103 = !DILocation(line: 34, column: 41, scope: !98)
!104 = !DILocation(line: 34, column: 37, scope: !98)
!105 = !DILocation(line: 34, column: 28, scope: !98)
!106 = !DILocation(line: 34, column: 25, scope: !98)
!107 = !DILocation(line: 34, column: 33, scope: !98)
!108 = !DILocation(line: 34, column: 35, scope: !98)
!109 = !DILocation(line: 34, column: 22, scope: !98)
!110 = !DILocation(line: 33, column: 32, scope: !94)
!111 = !DILocation(line: 33, column: 36, scope: !94)
!112 = !DILocation(line: 33, column: 42, scope: !94)
!113 = !DILocation(line: 33, column: 43, scope: !94)
!114 = !DILocation(line: 33, column: 2, scope: !94)
!115 = distinct !{!115, !96, !116}
!116 = !DILocation(line: 34, column: 44, scope: !91)
!117 = !DILocation(line: 37, column: 8, scope: !47)
!118 = !DILocation(line: 37, column: 14, scope: !47)
!119 = !DILocation(line: 37, column: 12, scope: !47)
!120 = !DILocation(line: 37, column: 2, scope: !47)
!121 = !DILocation(line: 40, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !47, file: !1, line: 40, column: 2)
!123 = !DILocation(line: 0, scope: !122)
!124 = !DILocation(line: 40, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 40, column: 2)
!126 = !DILocation(line: 40, column: 21, scope: !125)
!127 = !DILocation(line: 40, column: 24, scope: !125)
!128 = !DILocation(line: 40, column: 30, scope: !125)
!129 = !DILocation(line: 40, column: 35, scope: !125)
!130 = !DILocation(line: 40, column: 41, scope: !125)
!131 = !DILocation(line: 40, column: 32, scope: !125)
!132 = !DILocation(line: 0, scope: !125)
!133 = !DILocation(line: 40, column: 2, scope: !122)
!134 = !DILocation(line: 40, column: 45, scope: !125)
!135 = !DILocation(line: 40, column: 2, scope: !125)
!136 = distinct !{!136, !133, !137}
!137 = !DILocation(line: 40, column: 48, scope: !122)
!138 = !DILocation(line: 42, column: 2, scope: !47)
!139 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !140, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DISubroutineType(types: !141)
!141 = !{!14}
!142 = !DILocalVariable(name: "values", scope: !139, file: !1, line: 47, type: !143)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 832, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 13)
!146 = !DILocation(line: 47, column: 9, scope: !139)
!147 = !DILocalVariable(name: "vc", scope: !139, file: !1, line: 49, type: !52)
!148 = !DILocation(line: 49, column: 10, scope: !139)
!149 = !DILocation(line: 51, column: 28, scope: !139)
!150 = !DILocation(line: 51, column: 19, scope: !139)
!151 = !DILocalVariable(name: "n_modes", scope: !139, file: !1, line: 51, type: !14)
!152 = !DILocation(line: 0, scope: !139)
!153 = !DILocation(line: 53, column: 2, scope: !139)
!154 = !DILocalVariable(name: "i", scope: !139, file: !1, line: 51, type: !14)
!155 = !DILocation(line: 54, column: 7, scope: !156)
!156 = distinct !DILexicalBlock(scope: !139, file: !1, line: 54, column: 2)
!157 = !DILocation(line: 0, scope: !156)
!158 = !DILocation(line: 54, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !1, line: 54, column: 2)
!160 = !DILocation(line: 54, column: 2, scope: !156)
!161 = !DILocation(line: 55, column: 40, scope: !159)
!162 = !DILocation(line: 55, column: 46, scope: !159)
!163 = !DILocation(line: 55, column: 49, scope: !159)
!164 = !DILocation(line: 55, column: 55, scope: !159)
!165 = !DILocation(line: 55, column: 3, scope: !159)
!166 = !DILocation(line: 54, column: 28, scope: !159)
!167 = !DILocation(line: 54, column: 2, scope: !159)
!168 = distinct !{!168, !160, !169}
!169 = !DILocation(line: 55, column: 56, scope: !156)
!170 = !DILocation(line: 57, column: 7, scope: !139)
!171 = !DILocation(line: 57, column: 2, scope: !139)
!172 = !DILocation(line: 58, column: 2, scope: !139)
