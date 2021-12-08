; ModuleID = 'averages-mean-time-of-day.ll'
source_filename = "averages-mean-time-of-day.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.digitime = type { i32, i32, i32 }

@.str = private unnamed_addr constant [26 x i8] c"Enter number of inputs : \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"\0A\0AEnter the data separated by a space between each unit : \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"%d:%d:%d\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"\0A\0AThe mean time is : %d:%d:%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @timeToDegrees(i64 %time.coerce0, i32 %time.coerce1) #0 !dbg !9 {
entry:
  %time = alloca %struct.digitime, align 4
  %coerce = alloca { i64, i32 }, align 4
  %0 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %time.coerce0, i64* %0, align 4
  %1 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %time.coerce1, i32* %1, align 4
  %2 = bitcast %struct.digitime* %time to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 %3, i64 12, i1 false)
  call void @llvm.dbg.declare(metadata %struct.digitime* %time, metadata !19, metadata !DIExpression()), !dbg !20
  %hour = getelementptr inbounds %struct.digitime, %struct.digitime* %time, i32 0, i32 0, !dbg !21
  %4 = load i32, i32* %hour, align 4, !dbg !21
  %mul = mul nsw i32 360, %4, !dbg !22
  %conv = sitofp i32 %mul to double, !dbg !23
  %div = fdiv double %conv, 2.400000e+01, !dbg !24
  %minute = getelementptr inbounds %struct.digitime, %struct.digitime* %time, i32 0, i32 1, !dbg !25
  %5 = load i32, i32* %minute, align 4, !dbg !25
  %mul1 = mul nsw i32 360, %5, !dbg !26
  %conv2 = sitofp i32 %mul1 to double, !dbg !27
  %div3 = fdiv double %conv2, 1.440000e+03, !dbg !28
  %add = fadd double %div, %div3, !dbg !29
  %second = getelementptr inbounds %struct.digitime, %struct.digitime* %time, i32 0, i32 2, !dbg !30
  %6 = load i32, i32* %second, align 4, !dbg !30
  %mul4 = mul nsw i32 360, %6, !dbg !31
  %conv5 = sitofp i32 %mul4 to double, !dbg !32
  %div6 = fdiv double %conv5, 8.640000e+04, !dbg !33
  %add7 = fadd double %add, %div6, !dbg !34
  ret double %add7, !dbg !35
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i32 } @timeFromDegrees(double %angle) #0 !dbg !36 {
entry:
  %retval = alloca %struct.digitime, align 4
  %tmp = alloca { i64, i32 }, align 8
  call void @llvm.dbg.value(metadata double %angle, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct.digitime* %retval, metadata !41, metadata !DIExpression()), !dbg !42
  %mul = fmul double 8.640000e+04, %angle, !dbg !43
  %div = fdiv double %mul, 3.600000e+02, !dbg !44
  call void @llvm.dbg.value(metadata double %div, metadata !45, metadata !DIExpression()), !dbg !40
  %conv = fptosi double %div to i32, !dbg !46
  %rem = srem i32 %conv, 60, !dbg !47
  %second = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 2, !dbg !48
  store i32 %rem, i32* %second, align 4, !dbg !49
  %conv1 = fptosi double %div to i32, !dbg !50
  %rem2 = srem i32 %conv1, 3600, !dbg !51
  %second3 = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 2, !dbg !52
  %0 = load i32, i32* %second3, align 4, !dbg !52
  %sub = sub nsw i32 %rem2, %0, !dbg !53
  %div4 = sdiv i32 %sub, 60, !dbg !54
  %minute = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 1, !dbg !55
  store i32 %div4, i32* %minute, align 4, !dbg !56
  %conv5 = fptosi double %div to i32, !dbg !57
  %div6 = sdiv i32 %conv5, 3600, !dbg !58
  %hour = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 0, !dbg !59
  store i32 %div6, i32* %hour, align 4, !dbg !60
  %1 = bitcast { i64, i32 }* %tmp to i8*, !dbg !61
  %2 = bitcast %struct.digitime* %retval to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 4 %2, i64 12, i1 false), !dbg !61
  %3 = load { i64, i32 }, { i64, i32 }* %tmp, align 8, !dbg !61
  ret { i64, i32 } %3, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @meanAngle(double* %angles, i32 %size) #0 !dbg !62 {
entry:
  call void @llvm.dbg.value(metadata double* %angles, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata i32 %size, metadata !68, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !69, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !70, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !67
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %y_part.0 = phi double [ 0.000000e+00, %entry ], [ %add6, %for.inc ], !dbg !67
  %x_part.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !67
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !74
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !71, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double %x_part.0, metadata !70, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.value(metadata double %y_part.0, metadata !69, metadata !DIExpression()), !dbg !67
  %cmp = icmp slt i32 %i.0, %size, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !78
  %arrayidx = getelementptr inbounds double, double* %angles, i64 %idxprom, !dbg !78
  %0 = load double, double* %arrayidx, align 8, !dbg !78
  %mul = fmul double %0, 0x400921FB54442D18, !dbg !80
  %div = fdiv double %mul, 1.800000e+02, !dbg !81
  %call = call double @cos(double %div) #5, !dbg !82
  %add = fadd double %x_part.0, %call, !dbg !83
  call void @llvm.dbg.value(metadata double %add, metadata !70, metadata !DIExpression()), !dbg !67
  %idxprom1 = sext i32 %i.0 to i64, !dbg !84
  %arrayidx2 = getelementptr inbounds double, double* %angles, i64 %idxprom1, !dbg !84
  %1 = load double, double* %arrayidx2, align 8, !dbg !84
  %mul3 = fmul double %1, 0x400921FB54442D18, !dbg !85
  %div4 = fdiv double %mul3, 1.800000e+02, !dbg !86
  %call5 = call double @sin(double %div4) #5, !dbg !87
  %add6 = fadd double %y_part.0, %call5, !dbg !88
  call void @llvm.dbg.value(metadata double %add6, metadata !69, metadata !DIExpression()), !dbg !67
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !90
  call void @llvm.dbg.value(metadata i32 %inc, metadata !71, metadata !DIExpression()), !dbg !67
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %conv = sitofp i32 %size to double, !dbg !94
  %div7 = fdiv double %y_part.0, %conv, !dbg !95
  %conv8 = sitofp i32 %size to double, !dbg !96
  %div9 = fdiv double %x_part.0, %conv8, !dbg !97
  %call10 = call double @atan2(double %div7, double %div9) #5, !dbg !98
  %mul11 = fmul double %call10, 1.800000e+02, !dbg !99
  %div12 = fdiv double %mul11, 0x400921FB54442D18, !dbg !100
  ret double %div12, !dbg !101
}

; Function Attrs: nounwind
declare dso_local double @cos(double) #3

; Function Attrs: nounwind
declare dso_local double @sin(double) #3

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !102 {
entry:
  %meanTime = alloca %struct.digitime, align 4
  %inputs = alloca i32, align 4
  %arrayidx14.coerce = alloca { i64, i32 }, align 4
  %tmp = alloca %struct.digitime, align 4
  %tmp20 = alloca { i64, i32 }, align 8
  call void @llvm.dbg.declare(metadata %struct.digitime* %meanTime, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %inputs, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata !2, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0)), !dbg !110
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %inputs), !dbg !111
  %0 = load i32, i32* %inputs, align 4, !dbg !112
  %conv = sext i32 %0 to i64, !dbg !112
  %mul = mul i64 %conv, 12, !dbg !113
  %call2 = call noalias i8* @malloc(i64 %mul) #5, !dbg !114
  %1 = bitcast i8* %call2 to %struct.digitime*, !dbg !114
  call void @llvm.dbg.value(metadata %struct.digitime* %1, metadata !115, metadata !DIExpression()), !dbg !117
  %2 = load i32, i32* %inputs, align 4, !dbg !118
  %conv3 = sext i32 %2 to i64, !dbg !118
  %mul4 = mul i64 %conv3, 8, !dbg !119
  %call5 = call noalias i8* @malloc(i64 %mul4) #5, !dbg !120
  %3 = bitcast i8* %call5 to double*, !dbg !120
  call void @llvm.dbg.value(metadata double* %3, metadata !121, metadata !DIExpression()), !dbg !117
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  call void @llvm.dbg.value(metadata i32 0, metadata !123, metadata !DIExpression()), !dbg !117
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !126
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !123, metadata !DIExpression()), !dbg !117
  %4 = load i32, i32* %inputs, align 4, !dbg !127
  %cmp = icmp slt i32 %i.0, %4, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !131
  %arrayidx = getelementptr inbounds %struct.digitime, %struct.digitime* %1, i64 %idxprom, !dbg !131
  %hour = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx, i32 0, i32 0, !dbg !133
  %idxprom8 = sext i32 %i.0 to i64, !dbg !134
  %arrayidx9 = getelementptr inbounds %struct.digitime, %struct.digitime* %1, i64 %idxprom8, !dbg !134
  %minute = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx9, i32 0, i32 1, !dbg !135
  %idxprom10 = sext i32 %i.0 to i64, !dbg !136
  %arrayidx11 = getelementptr inbounds %struct.digitime, %struct.digitime* %1, i64 %idxprom10, !dbg !136
  %second = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx11, i32 0, i32 2, !dbg !137
  %call12 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32* %hour, i32* %minute, i32* %second), !dbg !138
  %idxprom13 = sext i32 %i.0 to i64, !dbg !139
  %arrayidx14 = getelementptr inbounds %struct.digitime, %struct.digitime* %1, i64 %idxprom13, !dbg !139
  %5 = bitcast { i64, i32 }* %arrayidx14.coerce to i8*, !dbg !140
  %6 = bitcast %struct.digitime* %arrayidx14 to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 12, i1 false), !dbg !140
  %7 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %arrayidx14.coerce, i32 0, i32 0, !dbg !140
  %8 = load i64, i64* %7, align 4, !dbg !140
  %9 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %arrayidx14.coerce, i32 0, i32 1, !dbg !140
  %10 = load i32, i32* %9, align 4, !dbg !140
  %call15 = call double @timeToDegrees(i64 %8, i32 %10), !dbg !140
  %idxprom16 = sext i32 %i.0 to i64, !dbg !141
  %arrayidx17 = getelementptr inbounds double, double* %3, i64 %idxprom16, !dbg !141
  store double %call15, double* %arrayidx17, align 8, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !144
  call void @llvm.dbg.value(metadata i32 %inc, metadata !123, metadata !DIExpression()), !dbg !117
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %inputs, align 4, !dbg !148
  %call18 = call double @meanAngle(double* %3, i32 %11), !dbg !149
  %add = fadd double 3.600000e+02, %call18, !dbg !150
  %call19 = call { i64, i32 } @timeFromDegrees(double %add), !dbg !151
  store { i64, i32 } %call19, { i64, i32 }* %tmp20, align 8, !dbg !151
  %12 = bitcast { i64, i32 }* %tmp20 to i8*, !dbg !151
  %13 = bitcast %struct.digitime* %tmp to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %12, i64 12, i1 false), !dbg !151
  %14 = bitcast %struct.digitime* %meanTime to i8*, !dbg !151
  %15 = bitcast %struct.digitime* %tmp to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 4 %15, i64 12, i1 false), !dbg !151
  %hour21 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 0, !dbg !152
  %16 = load i32, i32* %hour21, align 4, !dbg !152
  %minute22 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 1, !dbg !153
  %17 = load i32, i32* %minute22, align 4, !dbg !153
  %second23 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 2, !dbg !154
  %18 = load i32, i32* %second23, align 4, !dbg !154
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i32 %16, i32 %17, i32 %18), !dbg !155
  ret i32 0, !dbg !156
}

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @__isoc99_scanf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-mean-time-of-day.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Mean-time-of-day")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "timeToDegrees", scope: !1, file: !1, line: 11, type: !10, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13}
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "digitime", file: !1, line: 8, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 96, elements: !15)
!15 = !{!16, !17, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "hour", scope: !14, file: !1, line: 7, baseType: !4, size: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "minute", scope: !14, file: !1, line: 7, baseType: !4, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "second", scope: !14, file: !1, line: 7, baseType: !4, size: 32, offset: 64)
!19 = !DILocalVariable(name: "time", arg: 1, scope: !9, file: !1, line: 11, type: !13)
!20 = !DILocation(line: 11, column: 25, scope: !9)
!21 = !DILocation(line: 13, column: 22, scope: !9)
!22 = !DILocation(line: 13, column: 15, scope: !9)
!23 = !DILocation(line: 13, column: 11, scope: !9)
!24 = !DILocation(line: 13, column: 27, scope: !9)
!25 = !DILocation(line: 13, column: 47, scope: !9)
!26 = !DILocation(line: 13, column: 40, scope: !9)
!27 = !DILocation(line: 13, column: 36, scope: !9)
!28 = !DILocation(line: 13, column: 54, scope: !9)
!29 = !DILocation(line: 13, column: 34, scope: !9)
!30 = !DILocation(line: 14, column: 22, scope: !9)
!31 = !DILocation(line: 14, column: 15, scope: !9)
!32 = !DILocation(line: 14, column: 11, scope: !9)
!33 = !DILocation(line: 14, column: 29, scope: !9)
!34 = !DILocation(line: 13, column: 68, scope: !9)
!35 = !DILocation(line: 13, column: 3, scope: !9)
!36 = distinct !DISubprogram(name: "timeFromDegrees", scope: !1, file: !1, line: 18, type: !37, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!13, !12}
!39 = !DILocalVariable(name: "angle", arg: 1, scope: !36, file: !1, line: 18, type: !12)
!40 = !DILocation(line: 0, scope: !36)
!41 = !DILocalVariable(name: "d", scope: !36, file: !1, line: 20, type: !13)
!42 = !DILocation(line: 20, column: 12, scope: !36)
!43 = !DILocation(line: 21, column: 38, scope: !36)
!44 = !DILocation(line: 21, column: 46, scope: !36)
!45 = !DILocalVariable(name: "totalSeconds", scope: !36, file: !1, line: 21, type: !12)
!46 = !DILocation(line: 23, column: 14, scope: !36)
!47 = !DILocation(line: 23, column: 33, scope: !36)
!48 = !DILocation(line: 23, column: 5, scope: !36)
!49 = !DILocation(line: 23, column: 12, scope: !36)
!50 = !DILocation(line: 24, column: 15, scope: !36)
!51 = !DILocation(line: 24, column: 34, scope: !36)
!52 = !DILocation(line: 24, column: 45, scope: !36)
!53 = !DILocation(line: 24, column: 41, scope: !36)
!54 = !DILocation(line: 24, column: 53, scope: !36)
!55 = !DILocation(line: 24, column: 5, scope: !36)
!56 = !DILocation(line: 24, column: 12, scope: !36)
!57 = !DILocation(line: 25, column: 12, scope: !36)
!58 = !DILocation(line: 25, column: 31, scope: !36)
!59 = !DILocation(line: 25, column: 5, scope: !36)
!60 = !DILocation(line: 25, column: 10, scope: !36)
!61 = !DILocation(line: 27, column: 3, scope: !36)
!62 = distinct !DISubprogram(name: "meanAngle", scope: !1, file: !1, line: 31, type: !63, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!12, !65, !4}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!66 = !DILocalVariable(name: "angles", arg: 1, scope: !62, file: !1, line: 31, type: !65)
!67 = !DILocation(line: 0, scope: !62)
!68 = !DILocalVariable(name: "size", arg: 2, scope: !62, file: !1, line: 31, type: !4)
!69 = !DILocalVariable(name: "y_part", scope: !62, file: !1, line: 33, type: !12)
!70 = !DILocalVariable(name: "x_part", scope: !62, file: !1, line: 33, type: !12)
!71 = !DILocalVariable(name: "i", scope: !62, file: !1, line: 34, type: !4)
!72 = !DILocation(line: 36, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !62, file: !1, line: 36, column: 3)
!74 = !DILocation(line: 0, scope: !73)
!75 = !DILocation(line: 36, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 3)
!77 = !DILocation(line: 36, column: 3, scope: !73)
!78 = !DILocation(line: 38, column: 22, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 37, column: 5)
!80 = !DILocation(line: 38, column: 32, scope: !79)
!81 = !DILocation(line: 38, column: 39, scope: !79)
!82 = !DILocation(line: 38, column: 17, scope: !79)
!83 = !DILocation(line: 38, column: 14, scope: !79)
!84 = !DILocation(line: 39, column: 22, scope: !79)
!85 = !DILocation(line: 39, column: 32, scope: !79)
!86 = !DILocation(line: 39, column: 39, scope: !79)
!87 = !DILocation(line: 39, column: 17, scope: !79)
!88 = !DILocation(line: 39, column: 14, scope: !79)
!89 = !DILocation(line: 40, column: 5, scope: !79)
!90 = !DILocation(line: 36, column: 26, scope: !76)
!91 = !DILocation(line: 36, column: 3, scope: !76)
!92 = distinct !{!92, !77, !93}
!93 = !DILocation(line: 40, column: 5, scope: !73)
!94 = !DILocation(line: 42, column: 26, scope: !62)
!95 = !DILocation(line: 42, column: 24, scope: !62)
!96 = !DILocation(line: 42, column: 41, scope: !62)
!97 = !DILocation(line: 42, column: 39, scope: !62)
!98 = !DILocation(line: 42, column: 10, scope: !62)
!99 = !DILocation(line: 42, column: 47, scope: !62)
!100 = !DILocation(line: 42, column: 53, scope: !62)
!101 = !DILocation(line: 42, column: 3, scope: !62)
!102 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 46, type: !103, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !3)
!104 = !DILocalVariable(name: "meanTime", scope: !102, file: !1, line: 48, type: !13)
!105 = !DILocation(line: 48, column: 18, scope: !102)
!106 = !DILocalVariable(name: "inputs", scope: !102, file: !1, line: 49, type: !4)
!107 = !DILocation(line: 49, column: 7, scope: !102)
!108 = !DILocalVariable(name: "angleMean", scope: !102, file: !1, line: 50, type: !12)
!109 = !DILocation(line: 50, column: 21, scope: !102)
!110 = !DILocation(line: 52, column: 3, scope: !102)
!111 = !DILocation(line: 53, column: 3, scope: !102)
!112 = !DILocation(line: 54, column: 17, scope: !102)
!113 = !DILocation(line: 54, column: 24, scope: !102)
!114 = !DILocation(line: 54, column: 9, scope: !102)
!115 = !DILocalVariable(name: "set", scope: !102, file: !1, line: 48, type: !116)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!117 = !DILocation(line: 0, scope: !102)
!118 = !DILocation(line: 55, column: 22, scope: !102)
!119 = !DILocation(line: 55, column: 29, scope: !102)
!120 = !DILocation(line: 55, column: 14, scope: !102)
!121 = !DILocalVariable(name: "angleSet", scope: !102, file: !1, line: 50, type: !65)
!122 = !DILocation(line: 56, column: 3, scope: !102)
!123 = !DILocalVariable(name: "i", scope: !102, file: !1, line: 49, type: !4)
!124 = !DILocation(line: 58, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !102, file: !1, line: 58, column: 3)
!126 = !DILocation(line: 0, scope: !125)
!127 = !DILocation(line: 58, column: 19, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !1, line: 58, column: 3)
!129 = !DILocation(line: 58, column: 17, scope: !128)
!130 = !DILocation(line: 58, column: 3, scope: !125)
!131 = !DILocation(line: 60, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !1, line: 59, column: 5)
!133 = !DILocation(line: 60, column: 34, scope: !132)
!134 = !DILocation(line: 60, column: 41, scope: !132)
!135 = !DILocation(line: 60, column: 48, scope: !132)
!136 = !DILocation(line: 60, column: 57, scope: !132)
!137 = !DILocation(line: 60, column: 64, scope: !132)
!138 = !DILocation(line: 60, column: 7, scope: !132)
!139 = !DILocation(line: 61, column: 36, scope: !132)
!140 = !DILocation(line: 61, column: 21, scope: !132)
!141 = !DILocation(line: 61, column: 7, scope: !132)
!142 = !DILocation(line: 61, column: 19, scope: !132)
!143 = !DILocation(line: 62, column: 5, scope: !132)
!144 = !DILocation(line: 58, column: 28, scope: !128)
!145 = !DILocation(line: 58, column: 3, scope: !128)
!146 = distinct !{!146, !130, !147}
!147 = !DILocation(line: 62, column: 5, scope: !125)
!148 = !DILocation(line: 64, column: 58, scope: !102)
!149 = !DILocation(line: 64, column: 37, scope: !102)
!150 = !DILocation(line: 64, column: 35, scope: !102)
!151 = !DILocation(line: 64, column: 14, scope: !102)
!152 = !DILocation(line: 66, column: 55, scope: !102)
!153 = !DILocation(line: 66, column: 70, scope: !102)
!154 = !DILocation(line: 67, column: 20, scope: !102)
!155 = !DILocation(line: 66, column: 3, scope: !102)
!156 = !DILocation(line: 68, column: 3, scope: !102)
