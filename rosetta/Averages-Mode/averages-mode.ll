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
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %x = alloca double, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata double* %x, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i8*, i8** %a.addr, align 8, !dbg !30
  %1 = bitcast i8* %0 to double*, !dbg !31
  %2 = load double, double* %1, align 8, !dbg !32
  %3 = load i8*, i8** %b.addr, align 8, !dbg !33
  %4 = bitcast i8* %3 to double*, !dbg !34
  %5 = load double, double* %4, align 8, !dbg !35
  %sub = fsub double %2, %5, !dbg !36
  store double %sub, double* %x, align 8, !dbg !29
  %6 = load double, double* %x, align 8, !dbg !37
  %cmp = fcmp olt double %6, 0.000000e+00, !dbg !38
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !37

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !37

cond.false:                                       ; preds = %entry
  %7 = load double, double* %x, align 8, !dbg !39
  %cmp1 = fcmp ogt double %7, 0.000000e+00, !dbg !40
  %conv = zext i1 %cmp1 to i32, !dbg !40
  br label %cond.end, !dbg !37

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv, %cond.false ], !dbg !37
  ret i32 %cond, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @vc_cmp(i8* %a, i8* %b) #0 !dbg !42 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i8*, i8** %b.addr, align 8, !dbg !47
  %1 = bitcast i8* %0 to %struct.vcount*, !dbg !48
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %1, i32 0, i32 1, !dbg !49
  %2 = load i32, i32* %c, align 8, !dbg !49
  %3 = load i8*, i8** %a.addr, align 8, !dbg !50
  %4 = bitcast i8* %3 to %struct.vcount*, !dbg !51
  %c1 = getelementptr inbounds %struct.vcount, %struct.vcount* %4, i32 0, i32 1, !dbg !52
  %5 = load i32, i32* %c1, align 8, !dbg !52
  %sub = sub nsw i32 %2, %5, !dbg !53
  ret i32 %sub, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_mode(double* %x, i32 %len, %struct.vcount** %list) #0 !dbg !55 {
entry:
  %x.addr = alloca double*, align 8
  %len.addr = alloca i32, align 4
  %list.addr = alloca %struct.vcount**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %vc = alloca %struct.vcount*, align 8
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store %struct.vcount** %list, %struct.vcount*** %list.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.vcount*** %list.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %i, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32* %j, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct.vcount** %vc, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load double*, double** %x.addr, align 8, !dbg !73
  %1 = bitcast double* %0 to i8*, !dbg !73
  %2 = load i32, i32* %len.addr, align 4, !dbg !74
  %conv = sext i32 %2 to i64, !dbg !74
  call void @qsort(i8* %1, i64 %conv, i64 8, i32 (i8*, i8*)* @cmp_dbl), !dbg !75
  store i32 0, i32* %i, align 4, !dbg !76
  store i32 1, i32* %j, align 4, !dbg !78
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !80
  %4 = load i32, i32* %len.addr, align 4, !dbg !82
  %sub = sub nsw i32 %4, 1, !dbg !83
  %cmp = icmp slt i32 %3, %sub, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !86
  %inc = add nsw i32 %5, 1, !dbg !86
  store i32 %inc, i32* %i, align 4, !dbg !86
  %6 = load double*, double** %x.addr, align 8, !dbg !87
  %7 = load i32, i32* %i, align 4, !dbg !88
  %idxprom = sext i32 %7 to i64, !dbg !87
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom, !dbg !87
  %8 = load double, double* %arrayidx, align 8, !dbg !87
  %9 = load double*, double** %x.addr, align 8, !dbg !89
  %10 = load i32, i32* %i, align 4, !dbg !90
  %add = add nsw i32 %10, 1, !dbg !91
  %idxprom2 = sext i32 %add to i64, !dbg !89
  %arrayidx3 = getelementptr inbounds double, double* %9, i64 %idxprom2, !dbg !89
  %11 = load double, double* %arrayidx3, align 8, !dbg !89
  %cmp4 = fcmp une double %8, %11, !dbg !92
  %conv5 = zext i1 %cmp4 to i32, !dbg !92
  %12 = load i32, i32* %j, align 4, !dbg !93
  %add6 = add nsw i32 %12, %conv5, !dbg !93
  store i32 %add6, i32* %j, align 4, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %j, align 4, !dbg !97
  %conv7 = sext i32 %13 to i64, !dbg !97
  %mul = mul i64 16, %conv7, !dbg !98
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !99
  %14 = bitcast i8* %call to %struct.vcount*, !dbg !99
  store %struct.vcount* %14, %struct.vcount** %vc, align 8, !dbg !100
  %15 = load %struct.vcount**, %struct.vcount*** %list.addr, align 8, !dbg !101
  store %struct.vcount* %14, %struct.vcount** %15, align 8, !dbg !102
  %16 = load double*, double** %x.addr, align 8, !dbg !103
  %arrayidx8 = getelementptr inbounds double, double* %16, i64 0, !dbg !103
  %17 = load double, double* %arrayidx8, align 8, !dbg !103
  %18 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !104
  %arrayidx9 = getelementptr inbounds %struct.vcount, %struct.vcount* %18, i64 0, !dbg !104
  %v = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx9, i32 0, i32 0, !dbg !105
  store double %17, double* %v, align 8, !dbg !106
  %19 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !107
  %arrayidx10 = getelementptr inbounds %struct.vcount, %struct.vcount* %19, i64 0, !dbg !107
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx10, i32 0, i32 1, !dbg !108
  store i32 1, i32* %c, align 8, !dbg !109
  store i32 0, i32* %j, align 4, !dbg !110
  store i32 0, i32* %i, align 4, !dbg !112
  br label %for.cond11, !dbg !113

for.cond11:                                       ; preds = %for.inc30, %for.end
  %20 = load i32, i32* %i, align 4, !dbg !114
  %21 = load i32, i32* %len.addr, align 4, !dbg !116
  %sub12 = sub nsw i32 %21, 1, !dbg !117
  %cmp13 = icmp slt i32 %20, %sub12, !dbg !118
  br i1 %cmp13, label %for.body15, label %for.end36, !dbg !119

for.body15:                                       ; preds = %for.cond11
  %22 = load double*, double** %x.addr, align 8, !dbg !120
  %23 = load i32, i32* %i, align 4, !dbg !122
  %idxprom16 = sext i32 %23 to i64, !dbg !120
  %arrayidx17 = getelementptr inbounds double, double* %22, i64 %idxprom16, !dbg !120
  %24 = load double, double* %arrayidx17, align 8, !dbg !120
  %25 = load double*, double** %x.addr, align 8, !dbg !123
  %26 = load i32, i32* %i, align 4, !dbg !124
  %add18 = add nsw i32 %26, 1, !dbg !125
  %idxprom19 = sext i32 %add18 to i64, !dbg !123
  %arrayidx20 = getelementptr inbounds double, double* %25, i64 %idxprom19, !dbg !123
  %27 = load double, double* %arrayidx20, align 8, !dbg !123
  %cmp21 = fcmp une double %24, %27, !dbg !126
  br i1 %cmp21, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %for.body15
  %28 = load double*, double** %x.addr, align 8, !dbg !128
  %29 = load i32, i32* %i, align 4, !dbg !129
  %add23 = add nsw i32 %29, 1, !dbg !130
  %idxprom24 = sext i32 %add23 to i64, !dbg !128
  %arrayidx25 = getelementptr inbounds double, double* %28, i64 %idxprom24, !dbg !128
  %30 = load double, double* %arrayidx25, align 8, !dbg !128
  %31 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !131
  %32 = load i32, i32* %j, align 4, !dbg !132
  %inc26 = add nsw i32 %32, 1, !dbg !132
  store i32 %inc26, i32* %j, align 4, !dbg !132
  %idxprom27 = sext i32 %inc26 to i64, !dbg !131
  %arrayidx28 = getelementptr inbounds %struct.vcount, %struct.vcount* %31, i64 %idxprom27, !dbg !131
  %v29 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx28, i32 0, i32 0, !dbg !133
  store double %30, double* %v29, align 8, !dbg !134
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %for.body15
  br label %for.inc30, !dbg !135

for.inc30:                                        ; preds = %if.end
  %33 = load i32, i32* %i, align 4, !dbg !136
  %inc31 = add nsw i32 %33, 1, !dbg !136
  store i32 %inc31, i32* %i, align 4, !dbg !136
  %34 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !137
  %35 = load i32, i32* %j, align 4, !dbg !138
  %idxprom32 = sext i32 %35 to i64, !dbg !137
  %arrayidx33 = getelementptr inbounds %struct.vcount, %struct.vcount* %34, i64 %idxprom32, !dbg !137
  %c34 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx33, i32 0, i32 1, !dbg !139
  %36 = load i32, i32* %c34, align 8, !dbg !140
  %inc35 = add nsw i32 %36, 1, !dbg !140
  store i32 %inc35, i32* %c34, align 8, !dbg !140
  br label %for.cond11, !dbg !141, !llvm.loop !142

for.end36:                                        ; preds = %for.cond11
  %37 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !144
  %38 = bitcast %struct.vcount* %37 to i8*, !dbg !144
  %39 = load i32, i32* %j, align 4, !dbg !145
  %add37 = add nsw i32 %39, 1, !dbg !146
  %conv38 = sext i32 %add37 to i64, !dbg !145
  call void @qsort(i8* %38, i64 %conv38, i64 16, i32 (i8*, i8*)* @vc_cmp), !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond39, !dbg !150

for.cond39:                                       ; preds = %for.inc50, %for.end36
  %40 = load i32, i32* %i, align 4, !dbg !151
  %41 = load i32, i32* %j, align 4, !dbg !153
  %cmp40 = icmp sle i32 %40, %41, !dbg !154
  br i1 %cmp40, label %land.rhs, label %land.end, !dbg !155

land.rhs:                                         ; preds = %for.cond39
  %42 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !156
  %43 = load i32, i32* %i, align 4, !dbg !157
  %idxprom42 = sext i32 %43 to i64, !dbg !156
  %arrayidx43 = getelementptr inbounds %struct.vcount, %struct.vcount* %42, i64 %idxprom42, !dbg !156
  %c44 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx43, i32 0, i32 1, !dbg !158
  %44 = load i32, i32* %c44, align 8, !dbg !158
  %45 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !159
  %arrayidx45 = getelementptr inbounds %struct.vcount, %struct.vcount* %45, i64 0, !dbg !159
  %c46 = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx45, i32 0, i32 1, !dbg !160
  %46 = load i32, i32* %c46, align 8, !dbg !160
  %cmp47 = icmp eq i32 %44, %46, !dbg !161
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond39
  %47 = phi i1 [ false, %for.cond39 ], [ %cmp47, %land.rhs ], !dbg !162
  br i1 %47, label %for.body49, label %for.end52, !dbg !163

for.body49:                                       ; preds = %land.end
  br label %for.inc50, !dbg !163

for.inc50:                                        ; preds = %for.body49
  %48 = load i32, i32* %i, align 4, !dbg !164
  %inc51 = add nsw i32 %48, 1, !dbg !164
  store i32 %inc51, i32* %i, align 4, !dbg !164
  br label %for.cond39, !dbg !165, !llvm.loop !166

for.end52:                                        ; preds = %land.end
  %49 = load i32, i32* %i, align 4, !dbg !168
  ret i32 %49, !dbg !169
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !170 {
entry:
  %retval = alloca i32, align 4
  %values = alloca [13 x double], align 16
  %vc = alloca %struct.vcount*, align 8
  %i = alloca i32, align 4
  %n_modes = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [13 x double]* %values, metadata !173, metadata !DIExpression()), !dbg !177
  %0 = bitcast [13 x double]* %values to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([13 x double]* @__const.main.values to i8*), i64 104, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata %struct.vcount** %vc, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i32* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %n_modes, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [13 x double], [13 x double]* %values, i64 0, i64 0, !dbg !184
  %call = call i32 @get_mode(double* %arraydecay, i32 13, %struct.vcount** %vc), !dbg !185
  store i32 %call, i32* %n_modes, align 4, !dbg !183
  %1 = load i32, i32* %n_modes, align 4, !dbg !186
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !187
  store i32 0, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !191
  %3 = load i32, i32* %n_modes, align 4, !dbg !193
  %cmp = icmp slt i32 %2, %3, !dbg !194
  br i1 %cmp, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %4 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !196
  %5 = load i32, i32* %i, align 4, !dbg !197
  %idxprom = sext i32 %5 to i64, !dbg !196
  %arrayidx = getelementptr inbounds %struct.vcount, %struct.vcount* %4, i64 %idxprom, !dbg !196
  %v = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx, i32 0, i32 0, !dbg !198
  %6 = load double, double* %v, align 8, !dbg !198
  %7 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !199
  %8 = load i32, i32* %i, align 4, !dbg !200
  %idxprom2 = sext i32 %8 to i64, !dbg !199
  %arrayidx3 = getelementptr inbounds %struct.vcount, %struct.vcount* %7, i64 %idxprom2, !dbg !199
  %c = getelementptr inbounds %struct.vcount, %struct.vcount* %arrayidx3, i32 0, i32 1, !dbg !201
  %9 = load i32, i32* %c, align 8, !dbg !201
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), double %6, i32 %9), !dbg !202
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !203
  %inc = add nsw i32 %10, 1, !dbg !203
  store i32 %inc, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %11 = load %struct.vcount*, %struct.vcount** %vc, align 8, !dbg !207
  %12 = bitcast %struct.vcount* %11 to i8*, !dbg !207
  call void @free(i8* %12) #5, !dbg !208
  ret i32 0, !dbg !209
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

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
!25 = !DILocation(line: 6, column: 25, scope: !19)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 6, type: !22)
!27 = !DILocation(line: 6, column: 40, scope: !19)
!28 = !DILocalVariable(name: "x", scope: !19, file: !1, line: 8, type: !6)
!29 = !DILocation(line: 8, column: 9, scope: !19)
!30 = !DILocation(line: 8, column: 29, scope: !19)
!31 = !DILocation(line: 8, column: 14, scope: !19)
!32 = !DILocation(line: 8, column: 13, scope: !19)
!33 = !DILocation(line: 8, column: 49, scope: !19)
!34 = !DILocation(line: 8, column: 34, scope: !19)
!35 = !DILocation(line: 8, column: 33, scope: !19)
!36 = !DILocation(line: 8, column: 31, scope: !19)
!37 = !DILocation(line: 9, column: 9, scope: !19)
!38 = !DILocation(line: 9, column: 11, scope: !19)
!39 = !DILocation(line: 9, column: 22, scope: !19)
!40 = !DILocation(line: 9, column: 24, scope: !19)
!41 = !DILocation(line: 9, column: 2, scope: !19)
!42 = distinct !DISubprogram(name: "vc_cmp", scope: !1, file: !1, line: 12, type: !20, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "a", arg: 1, scope: !42, file: !1, line: 12, type: !22)
!44 = !DILocation(line: 12, column: 24, scope: !42)
!45 = !DILocalVariable(name: "b", arg: 2, scope: !42, file: !1, line: 12, type: !22)
!46 = !DILocation(line: 12, column: 39, scope: !42)
!47 = !DILocation(line: 14, column: 25, scope: !42)
!48 = !DILocation(line: 14, column: 10, scope: !42)
!49 = !DILocation(line: 14, column: 29, scope: !42)
!50 = !DILocation(line: 14, column: 49, scope: !42)
!51 = !DILocation(line: 14, column: 34, scope: !42)
!52 = !DILocation(line: 14, column: 53, scope: !42)
!53 = !DILocation(line: 14, column: 31, scope: !42)
!54 = !DILocation(line: 14, column: 2, scope: !42)
!55 = distinct !DISubprogram(name: "get_mode", scope: !1, file: !1, line: 17, type: !56, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!14, !58, !14, !59}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!61 = !DILocalVariable(name: "x", arg: 1, scope: !55, file: !1, line: 17, type: !58)
!62 = !DILocation(line: 17, column: 22, scope: !55)
!63 = !DILocalVariable(name: "len", arg: 2, scope: !55, file: !1, line: 17, type: !14)
!64 = !DILocation(line: 17, column: 29, scope: !55)
!65 = !DILocalVariable(name: "list", arg: 3, scope: !55, file: !1, line: 17, type: !59)
!66 = !DILocation(line: 17, column: 43, scope: !55)
!67 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 19, type: !14)
!68 = !DILocation(line: 19, column: 6, scope: !55)
!69 = !DILocalVariable(name: "j", scope: !55, file: !1, line: 19, type: !14)
!70 = !DILocation(line: 19, column: 9, scope: !55)
!71 = !DILocalVariable(name: "vc", scope: !55, file: !1, line: 20, type: !60)
!72 = !DILocation(line: 20, column: 10, scope: !55)
!73 = !DILocation(line: 23, column: 8, scope: !55)
!74 = !DILocation(line: 23, column: 11, scope: !55)
!75 = !DILocation(line: 23, column: 2, scope: !55)
!76 = !DILocation(line: 26, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !55, file: !1, line: 26, column: 2)
!78 = !DILocation(line: 26, column: 16, scope: !77)
!79 = !DILocation(line: 26, column: 7, scope: !77)
!80 = !DILocation(line: 26, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 26, column: 2)
!82 = !DILocation(line: 26, column: 25, scope: !81)
!83 = !DILocation(line: 26, column: 29, scope: !81)
!84 = !DILocation(line: 26, column: 23, scope: !81)
!85 = !DILocation(line: 26, column: 2, scope: !77)
!86 = !DILocation(line: 26, column: 35, scope: !81)
!87 = !DILocation(line: 26, column: 45, scope: !81)
!88 = !DILocation(line: 26, column: 47, scope: !81)
!89 = !DILocation(line: 26, column: 53, scope: !81)
!90 = !DILocation(line: 26, column: 55, scope: !81)
!91 = !DILocation(line: 26, column: 57, scope: !81)
!92 = !DILocation(line: 26, column: 50, scope: !81)
!93 = !DILocation(line: 26, column: 41, scope: !81)
!94 = !DILocation(line: 26, column: 2, scope: !81)
!95 = distinct !{!95, !85, !96}
!96 = !DILocation(line: 26, column: 63, scope: !77)
!97 = !DILocation(line: 28, column: 39, scope: !55)
!98 = !DILocation(line: 28, column: 37, scope: !55)
!99 = !DILocation(line: 28, column: 15, scope: !55)
!100 = !DILocation(line: 28, column: 13, scope: !55)
!101 = !DILocation(line: 28, column: 3, scope: !55)
!102 = !DILocation(line: 28, column: 8, scope: !55)
!103 = !DILocation(line: 29, column: 12, scope: !55)
!104 = !DILocation(line: 29, column: 2, scope: !55)
!105 = !DILocation(line: 29, column: 8, scope: !55)
!106 = !DILocation(line: 29, column: 10, scope: !55)
!107 = !DILocation(line: 30, column: 2, scope: !55)
!108 = !DILocation(line: 30, column: 8, scope: !55)
!109 = !DILocation(line: 30, column: 10, scope: !55)
!110 = !DILocation(line: 33, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !55, file: !1, line: 33, column: 2)
!112 = !DILocation(line: 33, column: 9, scope: !111)
!113 = !DILocation(line: 33, column: 7, scope: !111)
!114 = !DILocation(line: 33, column: 18, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !1, line: 33, column: 2)
!116 = !DILocation(line: 33, column: 22, scope: !115)
!117 = !DILocation(line: 33, column: 26, scope: !115)
!118 = !DILocation(line: 33, column: 20, scope: !115)
!119 = !DILocation(line: 33, column: 2, scope: !111)
!120 = !DILocation(line: 34, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !1, line: 34, column: 7)
!122 = !DILocation(line: 34, column: 9, scope: !121)
!123 = !DILocation(line: 34, column: 15, scope: !121)
!124 = !DILocation(line: 34, column: 17, scope: !121)
!125 = !DILocation(line: 34, column: 19, scope: !121)
!126 = !DILocation(line: 34, column: 12, scope: !121)
!127 = !DILocation(line: 34, column: 7, scope: !115)
!128 = !DILocation(line: 34, column: 37, scope: !121)
!129 = !DILocation(line: 34, column: 39, scope: !121)
!130 = !DILocation(line: 34, column: 41, scope: !121)
!131 = !DILocation(line: 34, column: 25, scope: !121)
!132 = !DILocation(line: 34, column: 28, scope: !121)
!133 = !DILocation(line: 34, column: 33, scope: !121)
!134 = !DILocation(line: 34, column: 35, scope: !121)
!135 = !DILocation(line: 34, column: 22, scope: !121)
!136 = !DILocation(line: 33, column: 32, scope: !115)
!137 = !DILocation(line: 33, column: 36, scope: !115)
!138 = !DILocation(line: 33, column: 39, scope: !115)
!139 = !DILocation(line: 33, column: 42, scope: !115)
!140 = !DILocation(line: 33, column: 43, scope: !115)
!141 = !DILocation(line: 33, column: 2, scope: !115)
!142 = distinct !{!142, !119, !143}
!143 = !DILocation(line: 34, column: 44, scope: !111)
!144 = !DILocation(line: 37, column: 8, scope: !55)
!145 = !DILocation(line: 37, column: 12, scope: !55)
!146 = !DILocation(line: 37, column: 14, scope: !55)
!147 = !DILocation(line: 37, column: 2, scope: !55)
!148 = !DILocation(line: 40, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !55, file: !1, line: 40, column: 2)
!150 = !DILocation(line: 40, column: 7, scope: !149)
!151 = !DILocation(line: 40, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !1, line: 40, column: 2)
!153 = !DILocation(line: 40, column: 19, scope: !152)
!154 = !DILocation(line: 40, column: 16, scope: !152)
!155 = !DILocation(line: 40, column: 21, scope: !152)
!156 = !DILocation(line: 40, column: 24, scope: !152)
!157 = !DILocation(line: 40, column: 27, scope: !152)
!158 = !DILocation(line: 40, column: 30, scope: !152)
!159 = !DILocation(line: 40, column: 35, scope: !152)
!160 = !DILocation(line: 40, column: 41, scope: !152)
!161 = !DILocation(line: 40, column: 32, scope: !152)
!162 = !DILocation(line: 0, scope: !152)
!163 = !DILocation(line: 40, column: 2, scope: !149)
!164 = !DILocation(line: 40, column: 45, scope: !152)
!165 = !DILocation(line: 40, column: 2, scope: !152)
!166 = distinct !{!166, !163, !167}
!167 = !DILocation(line: 40, column: 48, scope: !149)
!168 = !DILocation(line: 42, column: 9, scope: !55)
!169 = !DILocation(line: 42, column: 2, scope: !55)
!170 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !171, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DISubroutineType(types: !172)
!172 = !{!14}
!173 = !DILocalVariable(name: "values", scope: !170, file: !1, line: 47, type: !174)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 832, elements: !175)
!175 = !{!176}
!176 = !DISubrange(count: 13)
!177 = !DILocation(line: 47, column: 9, scope: !170)
!178 = !DILocalVariable(name: "vc", scope: !170, file: !1, line: 49, type: !60)
!179 = !DILocation(line: 49, column: 10, scope: !170)
!180 = !DILocalVariable(name: "i", scope: !170, file: !1, line: 51, type: !14)
!181 = !DILocation(line: 51, column: 6, scope: !170)
!182 = !DILocalVariable(name: "n_modes", scope: !170, file: !1, line: 51, type: !14)
!183 = !DILocation(line: 51, column: 9, scope: !170)
!184 = !DILocation(line: 51, column: 28, scope: !170)
!185 = !DILocation(line: 51, column: 19, scope: !170)
!186 = !DILocation(line: 53, column: 28, scope: !170)
!187 = !DILocation(line: 53, column: 2, scope: !170)
!188 = !DILocation(line: 54, column: 9, scope: !189)
!189 = distinct !DILexicalBlock(scope: !170, file: !1, line: 54, column: 2)
!190 = !DILocation(line: 54, column: 7, scope: !189)
!191 = !DILocation(line: 54, column: 14, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !1, line: 54, column: 2)
!193 = !DILocation(line: 54, column: 18, scope: !192)
!194 = !DILocation(line: 54, column: 16, scope: !192)
!195 = !DILocation(line: 54, column: 2, scope: !189)
!196 = !DILocation(line: 55, column: 40, scope: !192)
!197 = !DILocation(line: 55, column: 43, scope: !192)
!198 = !DILocation(line: 55, column: 46, scope: !192)
!199 = !DILocation(line: 55, column: 49, scope: !192)
!200 = !DILocation(line: 55, column: 52, scope: !192)
!201 = !DILocation(line: 55, column: 55, scope: !192)
!202 = !DILocation(line: 55, column: 3, scope: !192)
!203 = !DILocation(line: 54, column: 28, scope: !192)
!204 = !DILocation(line: 54, column: 2, scope: !192)
!205 = distinct !{!205, !195, !206}
!206 = !DILocation(line: 55, column: 56, scope: !189)
!207 = !DILocation(line: 57, column: 7, scope: !170)
!208 = !DILocation(line: 57, column: 2, scope: !170)
!209 = !DILocation(line: 58, column: 2, scope: !170)
