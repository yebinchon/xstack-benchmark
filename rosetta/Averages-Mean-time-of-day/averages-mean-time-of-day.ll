; ModuleID = 'averages-mean-time-of-day.c'
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
  %angle.addr = alloca double, align 8
  %totalSeconds = alloca double, align 8
  %tmp = alloca { i64, i32 }, align 8
  store double %angle, double* %angle.addr, align 8
  call void @llvm.dbg.declare(metadata double* %angle.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct.digitime* %retval, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata double* %totalSeconds, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load double, double* %angle.addr, align 8, !dbg !45
  %mul = fmul double 8.640000e+04, %0, !dbg !46
  %div = fdiv double %mul, 3.600000e+02, !dbg !47
  store double %div, double* %totalSeconds, align 8, !dbg !44
  %1 = load double, double* %totalSeconds, align 8, !dbg !48
  %conv = fptosi double %1 to i32, !dbg !49
  %rem = srem i32 %conv, 60, !dbg !50
  %second = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 2, !dbg !51
  store i32 %rem, i32* %second, align 4, !dbg !52
  %2 = load double, double* %totalSeconds, align 8, !dbg !53
  %conv1 = fptosi double %2 to i32, !dbg !54
  %rem2 = srem i32 %conv1, 3600, !dbg !55
  %second3 = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 2, !dbg !56
  %3 = load i32, i32* %second3, align 4, !dbg !56
  %sub = sub nsw i32 %rem2, %3, !dbg !57
  %div4 = sdiv i32 %sub, 60, !dbg !58
  %minute = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 1, !dbg !59
  store i32 %div4, i32* %minute, align 4, !dbg !60
  %4 = load double, double* %totalSeconds, align 8, !dbg !61
  %conv5 = fptosi double %4 to i32, !dbg !62
  %div6 = sdiv i32 %conv5, 3600, !dbg !63
  %hour = getelementptr inbounds %struct.digitime, %struct.digitime* %retval, i32 0, i32 0, !dbg !64
  store i32 %div6, i32* %hour, align 4, !dbg !65
  %5 = bitcast { i64, i32 }* %tmp to i8*, !dbg !66
  %6 = bitcast %struct.digitime* %retval to i8*, !dbg !66
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 4 %6, i64 12, i1 false), !dbg !66
  %7 = load { i64, i32 }, { i64, i32 }* %tmp, align 8, !dbg !66
  ret { i64, i32 } %7, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @meanAngle(double* %angles, i32 %size) #0 !dbg !67 {
entry:
  %angles.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  %y_part = alloca double, align 8
  %x_part = alloca double, align 8
  %i = alloca i32, align 4
  store double* %angles, double** %angles.addr, align 8
  call void @llvm.dbg.declare(metadata double** %angles.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata double* %y_part, metadata !75, metadata !DIExpression()), !dbg !76
  store double 0.000000e+00, double* %y_part, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata double* %x_part, metadata !77, metadata !DIExpression()), !dbg !78
  store double 0.000000e+00, double* %x_part, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %i, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !84
  %1 = load i32, i32* %size.addr, align 4, !dbg !86
  %cmp = icmp slt i32 %0, %1, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %angles.addr, align 8, !dbg !89
  %3 = load i32, i32* %i, align 4, !dbg !91
  %idxprom = sext i32 %3 to i64, !dbg !89
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !dbg !89
  %4 = load double, double* %arrayidx, align 8, !dbg !89
  %mul = fmul double %4, 0x400921FB54442D18, !dbg !92
  %div = fdiv double %mul, 1.800000e+02, !dbg !93
  %call = call double @cos(double %div) #5, !dbg !94
  %5 = load double, double* %x_part, align 8, !dbg !95
  %add = fadd double %5, %call, !dbg !95
  store double %add, double* %x_part, align 8, !dbg !95
  %6 = load double*, double** %angles.addr, align 8, !dbg !96
  %7 = load i32, i32* %i, align 4, !dbg !97
  %idxprom1 = sext i32 %7 to i64, !dbg !96
  %arrayidx2 = getelementptr inbounds double, double* %6, i64 %idxprom1, !dbg !96
  %8 = load double, double* %arrayidx2, align 8, !dbg !96
  %mul3 = fmul double %8, 0x400921FB54442D18, !dbg !98
  %div4 = fdiv double %mul3, 1.800000e+02, !dbg !99
  %call5 = call double @sin(double %div4) #5, !dbg !100
  %9 = load double, double* %y_part, align 8, !dbg !101
  %add6 = fadd double %9, %call5, !dbg !101
  store double %add6, double* %y_part, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !103
  %inc = add nsw i32 %10, 1, !dbg !103
  store i32 %inc, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %11 = load double, double* %y_part, align 8, !dbg !107
  %12 = load i32, i32* %size.addr, align 4, !dbg !108
  %conv = sitofp i32 %12 to double, !dbg !108
  %div7 = fdiv double %11, %conv, !dbg !109
  %13 = load double, double* %x_part, align 8, !dbg !110
  %14 = load i32, i32* %size.addr, align 4, !dbg !111
  %conv8 = sitofp i32 %14 to double, !dbg !111
  %div9 = fdiv double %13, %conv8, !dbg !112
  %call10 = call double @atan2(double %div7, double %div9) #5, !dbg !113
  %mul11 = fmul double %call10, 1.800000e+02, !dbg !114
  %div12 = fdiv double %mul11, 0x400921FB54442D18, !dbg !115
  ret double %div12, !dbg !116
}

; Function Attrs: nounwind
declare dso_local double @cos(double) #3

; Function Attrs: nounwind
declare dso_local double @sin(double) #3

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %set = alloca %struct.digitime*, align 8
  %meanTime = alloca %struct.digitime, align 4
  %inputs = alloca i32, align 4
  %i = alloca i32, align 4
  %angleSet = alloca double*, align 8
  %angleMean = alloca double, align 8
  %arrayidx14.coerce = alloca { i64, i32 }, align 4
  %tmp = alloca %struct.digitime, align 4
  %tmp20 = alloca { i64, i32 }, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.digitime** %set, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata %struct.digitime* %meanTime, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %inputs, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata double** %angleSet, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata double* %angleMean, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0)), !dbg !132
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %inputs), !dbg !133
  %0 = load i32, i32* %inputs, align 4, !dbg !134
  %conv = sext i32 %0 to i64, !dbg !134
  %mul = mul i64 %conv, 12, !dbg !135
  %call2 = call noalias i8* @malloc(i64 %mul) #5, !dbg !136
  %1 = bitcast i8* %call2 to %struct.digitime*, !dbg !136
  store %struct.digitime* %1, %struct.digitime** %set, align 8, !dbg !137
  %2 = load i32, i32* %inputs, align 4, !dbg !138
  %conv3 = sext i32 %2 to i64, !dbg !138
  %mul4 = mul i64 %conv3, 8, !dbg !139
  %call5 = call noalias i8* @malloc(i64 %mul4) #5, !dbg !140
  %3 = bitcast i8* %call5 to double*, !dbg !140
  store double* %3, double** %angleSet, align 8, !dbg !141
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i64 0, i64 0)), !dbg !142
  store i32 0, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !146
  %5 = load i32, i32* %inputs, align 4, !dbg !148
  %cmp = icmp slt i32 %4, %5, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %6 = load %struct.digitime*, %struct.digitime** %set, align 8, !dbg !151
  %7 = load i32, i32* %i, align 4, !dbg !153
  %idxprom = sext i32 %7 to i64, !dbg !151
  %arrayidx = getelementptr inbounds %struct.digitime, %struct.digitime* %6, i64 %idxprom, !dbg !151
  %hour = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx, i32 0, i32 0, !dbg !154
  %8 = load %struct.digitime*, %struct.digitime** %set, align 8, !dbg !155
  %9 = load i32, i32* %i, align 4, !dbg !156
  %idxprom8 = sext i32 %9 to i64, !dbg !155
  %arrayidx9 = getelementptr inbounds %struct.digitime, %struct.digitime* %8, i64 %idxprom8, !dbg !155
  %minute = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx9, i32 0, i32 1, !dbg !157
  %10 = load %struct.digitime*, %struct.digitime** %set, align 8, !dbg !158
  %11 = load i32, i32* %i, align 4, !dbg !159
  %idxprom10 = sext i32 %11 to i64, !dbg !158
  %arrayidx11 = getelementptr inbounds %struct.digitime, %struct.digitime* %10, i64 %idxprom10, !dbg !158
  %second = getelementptr inbounds %struct.digitime, %struct.digitime* %arrayidx11, i32 0, i32 2, !dbg !160
  %call12 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32* %hour, i32* %minute, i32* %second), !dbg !161
  %12 = load %struct.digitime*, %struct.digitime** %set, align 8, !dbg !162
  %13 = load i32, i32* %i, align 4, !dbg !163
  %idxprom13 = sext i32 %13 to i64, !dbg !162
  %arrayidx14 = getelementptr inbounds %struct.digitime, %struct.digitime* %12, i64 %idxprom13, !dbg !162
  %14 = bitcast { i64, i32 }* %arrayidx14.coerce to i8*, !dbg !164
  %15 = bitcast %struct.digitime* %arrayidx14 to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 4 %15, i64 12, i1 false), !dbg !164
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %arrayidx14.coerce, i32 0, i32 0, !dbg !164
  %17 = load i64, i64* %16, align 4, !dbg !164
  %18 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %arrayidx14.coerce, i32 0, i32 1, !dbg !164
  %19 = load i32, i32* %18, align 4, !dbg !164
  %call15 = call double @timeToDegrees(i64 %17, i32 %19), !dbg !164
  %20 = load double*, double** %angleSet, align 8, !dbg !165
  %21 = load i32, i32* %i, align 4, !dbg !166
  %idxprom16 = sext i32 %21 to i64, !dbg !165
  %arrayidx17 = getelementptr inbounds double, double* %20, i64 %idxprom16, !dbg !165
  store double %call15, double* %arrayidx17, align 8, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %22, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %23 = load double*, double** %angleSet, align 8, !dbg !173
  %24 = load i32, i32* %inputs, align 4, !dbg !174
  %call18 = call double @meanAngle(double* %23, i32 %24), !dbg !175
  %add = fadd double 3.600000e+02, %call18, !dbg !176
  %call19 = call { i64, i32 } @timeFromDegrees(double %add), !dbg !177
  store { i64, i32 } %call19, { i64, i32 }* %tmp20, align 8, !dbg !177
  %25 = bitcast { i64, i32 }* %tmp20 to i8*, !dbg !177
  %26 = bitcast %struct.digitime* %tmp to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %26, i8* align 8 %25, i64 12, i1 false), !dbg !177
  %27 = bitcast %struct.digitime* %meanTime to i8*, !dbg !177
  %28 = bitcast %struct.digitime* %tmp to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %27, i8* align 4 %28, i64 12, i1 false), !dbg !177
  %hour21 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 0, !dbg !178
  %29 = load i32, i32* %hour21, align 4, !dbg !178
  %minute22 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 1, !dbg !179
  %30 = load i32, i32* %minute22, align 4, !dbg !179
  %second23 = getelementptr inbounds %struct.digitime, %struct.digitime* %meanTime, i32 0, i32 2, !dbg !180
  %31 = load i32, i32* %second23, align 4, !dbg !180
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i32 %29, i32 %30, i32 %31), !dbg !181
  ret i32 0, !dbg !182
}

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @__isoc99_scanf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "averages-mean-time-of-day.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Averages-Mean-time-of-day")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!40 = !DILocation(line: 18, column: 25, scope: !36)
!41 = !DILocalVariable(name: "d", scope: !36, file: !1, line: 20, type: !13)
!42 = !DILocation(line: 20, column: 12, scope: !36)
!43 = !DILocalVariable(name: "totalSeconds", scope: !36, file: !1, line: 21, type: !12)
!44 = !DILocation(line: 21, column: 10, scope: !36)
!45 = !DILocation(line: 21, column: 40, scope: !36)
!46 = !DILocation(line: 21, column: 38, scope: !36)
!47 = !DILocation(line: 21, column: 46, scope: !36)
!48 = !DILocation(line: 23, column: 20, scope: !36)
!49 = !DILocation(line: 23, column: 14, scope: !36)
!50 = !DILocation(line: 23, column: 33, scope: !36)
!51 = !DILocation(line: 23, column: 5, scope: !36)
!52 = !DILocation(line: 23, column: 12, scope: !36)
!53 = !DILocation(line: 24, column: 21, scope: !36)
!54 = !DILocation(line: 24, column: 15, scope: !36)
!55 = !DILocation(line: 24, column: 34, scope: !36)
!56 = !DILocation(line: 24, column: 45, scope: !36)
!57 = !DILocation(line: 24, column: 41, scope: !36)
!58 = !DILocation(line: 24, column: 53, scope: !36)
!59 = !DILocation(line: 24, column: 5, scope: !36)
!60 = !DILocation(line: 24, column: 12, scope: !36)
!61 = !DILocation(line: 25, column: 18, scope: !36)
!62 = !DILocation(line: 25, column: 12, scope: !36)
!63 = !DILocation(line: 25, column: 31, scope: !36)
!64 = !DILocation(line: 25, column: 5, scope: !36)
!65 = !DILocation(line: 25, column: 10, scope: !36)
!66 = !DILocation(line: 27, column: 3, scope: !36)
!67 = distinct !DISubprogram(name: "meanAngle", scope: !1, file: !1, line: 31, type: !68, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!12, !70, !4}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!71 = !DILocalVariable(name: "angles", arg: 1, scope: !67, file: !1, line: 31, type: !70)
!72 = !DILocation(line: 31, column: 20, scope: !67)
!73 = !DILocalVariable(name: "size", arg: 2, scope: !67, file: !1, line: 31, type: !4)
!74 = !DILocation(line: 31, column: 32, scope: !67)
!75 = !DILocalVariable(name: "y_part", scope: !67, file: !1, line: 33, type: !12)
!76 = !DILocation(line: 33, column: 10, scope: !67)
!77 = !DILocalVariable(name: "x_part", scope: !67, file: !1, line: 33, type: !12)
!78 = !DILocation(line: 33, column: 22, scope: !67)
!79 = !DILocalVariable(name: "i", scope: !67, file: !1, line: 34, type: !4)
!80 = !DILocation(line: 34, column: 7, scope: !67)
!81 = !DILocation(line: 36, column: 10, scope: !82)
!82 = distinct !DILexicalBlock(scope: !67, file: !1, line: 36, column: 3)
!83 = !DILocation(line: 36, column: 8, scope: !82)
!84 = !DILocation(line: 36, column: 15, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 3)
!86 = !DILocation(line: 36, column: 19, scope: !85)
!87 = !DILocation(line: 36, column: 17, scope: !85)
!88 = !DILocation(line: 36, column: 3, scope: !82)
!89 = !DILocation(line: 38, column: 22, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 37, column: 5)
!91 = !DILocation(line: 38, column: 29, scope: !90)
!92 = !DILocation(line: 38, column: 32, scope: !90)
!93 = !DILocation(line: 38, column: 39, scope: !90)
!94 = !DILocation(line: 38, column: 17, scope: !90)
!95 = !DILocation(line: 38, column: 14, scope: !90)
!96 = !DILocation(line: 39, column: 22, scope: !90)
!97 = !DILocation(line: 39, column: 29, scope: !90)
!98 = !DILocation(line: 39, column: 32, scope: !90)
!99 = !DILocation(line: 39, column: 39, scope: !90)
!100 = !DILocation(line: 39, column: 17, scope: !90)
!101 = !DILocation(line: 39, column: 14, scope: !90)
!102 = !DILocation(line: 40, column: 5, scope: !90)
!103 = !DILocation(line: 36, column: 26, scope: !85)
!104 = !DILocation(line: 36, column: 3, scope: !85)
!105 = distinct !{!105, !88, !106}
!106 = !DILocation(line: 40, column: 5, scope: !82)
!107 = !DILocation(line: 42, column: 17, scope: !67)
!108 = !DILocation(line: 42, column: 26, scope: !67)
!109 = !DILocation(line: 42, column: 24, scope: !67)
!110 = !DILocation(line: 42, column: 32, scope: !67)
!111 = !DILocation(line: 42, column: 41, scope: !67)
!112 = !DILocation(line: 42, column: 39, scope: !67)
!113 = !DILocation(line: 42, column: 10, scope: !67)
!114 = !DILocation(line: 42, column: 47, scope: !67)
!115 = !DILocation(line: 42, column: 53, scope: !67)
!116 = !DILocation(line: 42, column: 3, scope: !67)
!117 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 46, type: !118, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !3)
!119 = !DILocalVariable(name: "set", scope: !117, file: !1, line: 48, type: !120)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!121 = !DILocation(line: 48, column: 13, scope: !117)
!122 = !DILocalVariable(name: "meanTime", scope: !117, file: !1, line: 48, type: !13)
!123 = !DILocation(line: 48, column: 18, scope: !117)
!124 = !DILocalVariable(name: "inputs", scope: !117, file: !1, line: 49, type: !4)
!125 = !DILocation(line: 49, column: 7, scope: !117)
!126 = !DILocalVariable(name: "i", scope: !117, file: !1, line: 49, type: !4)
!127 = !DILocation(line: 49, column: 15, scope: !117)
!128 = !DILocalVariable(name: "angleSet", scope: !117, file: !1, line: 50, type: !70)
!129 = !DILocation(line: 50, column: 11, scope: !117)
!130 = !DILocalVariable(name: "angleMean", scope: !117, file: !1, line: 50, type: !12)
!131 = !DILocation(line: 50, column: 21, scope: !117)
!132 = !DILocation(line: 52, column: 3, scope: !117)
!133 = !DILocation(line: 53, column: 3, scope: !117)
!134 = !DILocation(line: 54, column: 17, scope: !117)
!135 = !DILocation(line: 54, column: 24, scope: !117)
!136 = !DILocation(line: 54, column: 9, scope: !117)
!137 = !DILocation(line: 54, column: 7, scope: !117)
!138 = !DILocation(line: 55, column: 22, scope: !117)
!139 = !DILocation(line: 55, column: 29, scope: !117)
!140 = !DILocation(line: 55, column: 14, scope: !117)
!141 = !DILocation(line: 55, column: 12, scope: !117)
!142 = !DILocation(line: 56, column: 3, scope: !117)
!143 = !DILocation(line: 58, column: 10, scope: !144)
!144 = distinct !DILexicalBlock(scope: !117, file: !1, line: 58, column: 3)
!145 = !DILocation(line: 58, column: 8, scope: !144)
!146 = !DILocation(line: 58, column: 15, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !1, line: 58, column: 3)
!148 = !DILocation(line: 58, column: 19, scope: !147)
!149 = !DILocation(line: 58, column: 17, scope: !147)
!150 = !DILocation(line: 58, column: 3, scope: !144)
!151 = !DILocation(line: 60, column: 27, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !1, line: 59, column: 5)
!153 = !DILocation(line: 60, column: 31, scope: !152)
!154 = !DILocation(line: 60, column: 34, scope: !152)
!155 = !DILocation(line: 60, column: 41, scope: !152)
!156 = !DILocation(line: 60, column: 45, scope: !152)
!157 = !DILocation(line: 60, column: 48, scope: !152)
!158 = !DILocation(line: 60, column: 57, scope: !152)
!159 = !DILocation(line: 60, column: 61, scope: !152)
!160 = !DILocation(line: 60, column: 64, scope: !152)
!161 = !DILocation(line: 60, column: 7, scope: !152)
!162 = !DILocation(line: 61, column: 36, scope: !152)
!163 = !DILocation(line: 61, column: 40, scope: !152)
!164 = !DILocation(line: 61, column: 21, scope: !152)
!165 = !DILocation(line: 61, column: 7, scope: !152)
!166 = !DILocation(line: 61, column: 16, scope: !152)
!167 = !DILocation(line: 61, column: 19, scope: !152)
!168 = !DILocation(line: 62, column: 5, scope: !152)
!169 = !DILocation(line: 58, column: 28, scope: !147)
!170 = !DILocation(line: 58, column: 3, scope: !147)
!171 = distinct !{!171, !150, !172}
!172 = !DILocation(line: 62, column: 5, scope: !144)
!173 = !DILocation(line: 64, column: 48, scope: !117)
!174 = !DILocation(line: 64, column: 58, scope: !117)
!175 = !DILocation(line: 64, column: 37, scope: !117)
!176 = !DILocation(line: 64, column: 35, scope: !117)
!177 = !DILocation(line: 64, column: 14, scope: !117)
!178 = !DILocation(line: 66, column: 55, scope: !117)
!179 = !DILocation(line: 66, column: 70, scope: !117)
!180 = !DILocation(line: 67, column: 20, scope: !117)
!181 = !DILocation(line: 66, column: 3, scope: !117)
!182 = !DILocation(line: 68, column: 3, scope: !117)
