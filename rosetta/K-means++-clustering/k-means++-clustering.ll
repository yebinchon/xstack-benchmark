; ModuleID = 'k-means++-clustering.c'
source_filename = "k-means++-clustering.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.point_t = type { double, double, i32 }

@.str = private unnamed_addr constant [46 x i8] c"%%!PS-Adobe-3.0\0A%%%%BoundingBox: -5 -5 %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [240 x i8] c"/l {rlineto} def /m {rmoveto} def\0A/c { .25 sub exch .25 sub exch .5 0 360 arc fill } def\0A/s { moveto -2 0 m 2 2 l 2 -2 l -2 -2 l closepath \09gsave 1 setgray fill grestore gsave 3 setlinewidth 1 setgray stroke grestore 0 setgray stroke }def\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"%g %g %g setrgbcolor\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"%.3f %.3f c\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"\0A0 setgray %g %g s\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"\0A%%%%EOF\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @randf(double %m) #0 !dbg !7 {
entry:
  %m.addr = alloca double, align 8
  store double %m, double* %m.addr, align 8
  call void @llvm.dbg.declare(metadata double* %m.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load double, double* %m.addr, align 8, !dbg !13
  %call = call i32 @rand() #5, !dbg !14
  %conv = sitofp i32 %call to double, !dbg !14
  %mul = fmul double %0, %conv, !dbg !15
  %div = fdiv double %mul, 0x41DFFFFFFF800000, !dbg !16
  ret double %div, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.point_t* @gen_xy(i32 %count, double %radius) #0 !dbg !18 {
entry:
  %count.addr = alloca i32, align 4
  %radius.addr = alloca double, align 8
  %ang = alloca double, align 8
  %r = alloca double, align 8
  %p = alloca %struct.point_t*, align 8
  %pt = alloca %struct.point_t*, align 8
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !29, metadata !DIExpression()), !dbg !30
  store double %radius, double* %radius.addr, align 8
  call void @llvm.dbg.declare(metadata double* %radius.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata double* %ang, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata double* %r, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata %struct.point_t** %p, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata %struct.point_t** %pt, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32, i32* %count.addr, align 4, !dbg !41
  %conv = sext i32 %0 to i64, !dbg !41
  %mul = mul i64 24, %conv, !dbg !42
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !43
  %1 = bitcast i8* %call to %struct.point_t*, !dbg !43
  store %struct.point_t* %1, %struct.point_t** %pt, align 8, !dbg !40
  %2 = load %struct.point_t*, %struct.point_t** %pt, align 8, !dbg !44
  %3 = load i32, i32* %count.addr, align 4, !dbg !46
  %idx.ext = sext i32 %3 to i64, !dbg !47
  %add.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %2, i64 %idx.ext, !dbg !47
  store %struct.point_t* %add.ptr, %struct.point_t** %p, align 8, !dbg !48
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.body, %entry
  %4 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !50
  %incdec.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %4, i32 -1, !dbg !50
  store %struct.point_t* %incdec.ptr, %struct.point_t** %p, align 8, !dbg !50
  %5 = load %struct.point_t*, %struct.point_t** %pt, align 8, !dbg !52
  %cmp = icmp ugt %struct.point_t* %4, %5, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %call2 = call double @randf(double 0x401921FB54442D18), !dbg !55
  store double %call2, double* %ang, align 8, !dbg !57
  %6 = load double, double* %radius.addr, align 8, !dbg !58
  %call3 = call double @randf(double %6), !dbg !59
  store double %call3, double* %r, align 8, !dbg !60
  %7 = load double, double* %r, align 8, !dbg !61
  %8 = load double, double* %ang, align 8, !dbg !62
  %call4 = call double @cos(double %8) #5, !dbg !63
  %mul5 = fmul double %7, %call4, !dbg !64
  %9 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !65
  %x = getelementptr inbounds %struct.point_t, %struct.point_t* %9, i32 0, i32 0, !dbg !66
  store double %mul5, double* %x, align 8, !dbg !67
  %10 = load double, double* %r, align 8, !dbg !68
  %11 = load double, double* %ang, align 8, !dbg !69
  %call6 = call double @sin(double %11) #5, !dbg !70
  %mul7 = fmul double %10, %call6, !dbg !71
  %12 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !72
  %y = getelementptr inbounds %struct.point_t, %struct.point_t* %12, i32 0, i32 1, !dbg !73
  store double %mul7, double* %y, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %13 = load %struct.point_t*, %struct.point_t** %pt, align 8, !dbg !78
  ret %struct.point_t* %13, !dbg !79
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @kpp(%struct.point_t* %pts, i32 %len, %struct.point_t* %cent, i32 %n_cent) #0 !dbg !80 {
entry:
  %pts.addr = alloca %struct.point_t*, align 8
  %len.addr = alloca i32, align 4
  %cent.addr = alloca %struct.point_t*, align 8
  %n_cent.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n_cluster = alloca i32, align 4
  %sum = alloca double, align 8
  %d = alloca double*, align 8
  %p = alloca %struct.point_t*, align 8
  %c = alloca %struct.point_t*, align 8
  store %struct.point_t* %pts, %struct.point_t** %pts.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.point_t** %pts.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store %struct.point_t* %cent, %struct.point_t** %cent.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.point_t** %cent.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 %n_cent, i32* %n_cent.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_cent.addr, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32* %i, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32* %j, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %n_cluster, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata double* %sum, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata double** %d, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = load i32, i32* %len.addr, align 4, !dbg !102
  %conv = sext i32 %0 to i64, !dbg !102
  %mul = mul i64 8, %conv, !dbg !103
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !104
  %1 = bitcast i8* %call to double*, !dbg !104
  store double* %1, double** %d, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata %struct.point_t** %p, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata %struct.point_t** %c, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !109
  %arrayidx = getelementptr inbounds %struct.point_t, %struct.point_t* %2, i64 0, !dbg !109
  %3 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !110
  %call1 = call i32 @rand() #5, !dbg !111
  %4 = load i32, i32* %len.addr, align 4, !dbg !112
  %rem = srem i32 %call1, %4, !dbg !113
  %idxprom = sext i32 %rem to i64, !dbg !110
  %arrayidx2 = getelementptr inbounds %struct.point_t, %struct.point_t* %3, i64 %idxprom, !dbg !110
  %5 = bitcast %struct.point_t* %arrayidx to i8*, !dbg !110
  %6 = bitcast %struct.point_t* %arrayidx2 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 24, i1 false), !dbg !110
  store i32 1, i32* %n_cluster, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc28, %entry
  %7 = load i32, i32* %n_cluster, align 4, !dbg !117
  %8 = load i32, i32* %n_cent.addr, align 4, !dbg !119
  %cmp = icmp slt i32 %7, %8, !dbg !120
  br i1 %cmp, label %for.body, label %for.end30, !dbg !121

for.body:                                         ; preds = %for.cond
  store double 0.000000e+00, double* %sum, align 8, !dbg !122
  store i32 0, i32* %j, align 4, !dbg !124
  %9 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !124
  store %struct.point_t* %9, %struct.point_t** %p, align 8, !dbg !124
  br label %for.cond4, !dbg !124

for.cond4:                                        ; preds = %for.inc, %for.body
  %10 = load i32, i32* %j, align 4, !dbg !126
  %11 = load i32, i32* %len.addr, align 4, !dbg !126
  %cmp5 = icmp slt i32 %10, %11, !dbg !126
  br i1 %cmp5, label %for.body7, label %for.end, !dbg !124

for.body7:                                        ; preds = %for.cond4
  %12 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !128
  %13 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !130
  %14 = load i32, i32* %n_cluster, align 4, !dbg !131
  %15 = load double*, double** %d, align 8, !dbg !132
  %16 = load i32, i32* %j, align 4, !dbg !133
  %idx.ext = sext i32 %16 to i64, !dbg !134
  %add.ptr = getelementptr inbounds double, double* %15, i64 %idx.ext, !dbg !134
  %call8 = call i32 @nearest(%struct.point_t* %12, %struct.point_t* %13, i32 %14, double* %add.ptr), !dbg !135
  %17 = load double*, double** %d, align 8, !dbg !136
  %18 = load i32, i32* %j, align 4, !dbg !137
  %idxprom9 = sext i32 %18 to i64, !dbg !136
  %arrayidx10 = getelementptr inbounds double, double* %17, i64 %idxprom9, !dbg !136
  %19 = load double, double* %arrayidx10, align 8, !dbg !136
  %20 = load double, double* %sum, align 8, !dbg !138
  %add = fadd double %20, %19, !dbg !138
  store double %add, double* %sum, align 8, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body7
  %21 = load i32, i32* %j, align 4, !dbg !126
  %inc = add nsw i32 %21, 1, !dbg !126
  store i32 %inc, i32* %j, align 4, !dbg !126
  %22 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !126
  %incdec.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %22, i32 1, !dbg !126
  store %struct.point_t* %incdec.ptr, %struct.point_t** %p, align 8, !dbg !126
  br label %for.cond4, !dbg !126, !llvm.loop !140

for.end:                                          ; preds = %for.cond4
  %23 = load double, double* %sum, align 8, !dbg !142
  %call11 = call double @randf(double %23), !dbg !143
  store double %call11, double* %sum, align 8, !dbg !144
  store i32 0, i32* %j, align 4, !dbg !145
  %24 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !145
  store %struct.point_t* %24, %struct.point_t** %p, align 8, !dbg !145
  br label %for.cond12, !dbg !145

for.cond12:                                       ; preds = %for.inc24, %for.end
  %25 = load i32, i32* %j, align 4, !dbg !147
  %26 = load i32, i32* %len.addr, align 4, !dbg !147
  %cmp13 = icmp slt i32 %25, %26, !dbg !147
  br i1 %cmp13, label %for.body15, label %for.end27, !dbg !145

for.body15:                                       ; preds = %for.cond12
  %27 = load double*, double** %d, align 8, !dbg !149
  %28 = load i32, i32* %j, align 4, !dbg !152
  %idxprom16 = sext i32 %28 to i64, !dbg !149
  %arrayidx17 = getelementptr inbounds double, double* %27, i64 %idxprom16, !dbg !149
  %29 = load double, double* %arrayidx17, align 8, !dbg !149
  %30 = load double, double* %sum, align 8, !dbg !153
  %sub = fsub double %30, %29, !dbg !153
  store double %sub, double* %sum, align 8, !dbg !153
  %cmp18 = fcmp ogt double %sub, 0.000000e+00, !dbg !154
  br i1 %cmp18, label %if.then, label %if.end, !dbg !155, !cf.info !156

if.then:                                          ; preds = %for.body15
  br label %for.inc24, !dbg !157

if.end:                                           ; preds = %for.body15
  %31 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !158
  %32 = load i32, i32* %n_cluster, align 4, !dbg !159
  %idxprom20 = sext i32 %32 to i64, !dbg !158
  %arrayidx21 = getelementptr inbounds %struct.point_t, %struct.point_t* %31, i64 %idxprom20, !dbg !158
  %33 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !160
  %34 = load i32, i32* %j, align 4, !dbg !161
  %idxprom22 = sext i32 %34 to i64, !dbg !160
  %arrayidx23 = getelementptr inbounds %struct.point_t, %struct.point_t* %33, i64 %idxprom22, !dbg !160
  %35 = bitcast %struct.point_t* %arrayidx21 to i8*, !dbg !160
  %36 = bitcast %struct.point_t* %arrayidx23 to i8*, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %35, i8* align 8 %36, i64 24, i1 false), !dbg !160
  br label %for.end27, !dbg !162

for.inc24:                                        ; preds = %if.then
  %37 = load i32, i32* %j, align 4, !dbg !147
  %inc25 = add nsw i32 %37, 1, !dbg !147
  store i32 %inc25, i32* %j, align 4, !dbg !147
  %38 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !147
  %incdec.ptr26 = getelementptr inbounds %struct.point_t, %struct.point_t* %38, i32 1, !dbg !147
  store %struct.point_t* %incdec.ptr26, %struct.point_t** %p, align 8, !dbg !147
  br label %for.cond12, !dbg !147, !llvm.loop !163

for.end27:                                        ; preds = %if.end, %for.cond12
  br label %for.inc28, !dbg !165

for.inc28:                                        ; preds = %for.end27
  %39 = load i32, i32* %n_cluster, align 4, !dbg !166
  %inc29 = add nsw i32 %39, 1, !dbg !166
  store i32 %inc29, i32* %n_cluster, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !170
  %40 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !170
  store %struct.point_t* %40, %struct.point_t** %p, align 8, !dbg !170
  br label %for.cond31, !dbg !170

for.cond31:                                       ; preds = %for.inc36, %for.end30
  %41 = load i32, i32* %j, align 4, !dbg !172
  %42 = load i32, i32* %len.addr, align 4, !dbg !172
  %cmp32 = icmp slt i32 %41, %42, !dbg !172
  br i1 %cmp32, label %for.body34, label %for.end39, !dbg !170

for.body34:                                       ; preds = %for.cond31
  %43 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !174
  %44 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !175
  %45 = load i32, i32* %n_cluster, align 4, !dbg !176
  %call35 = call i32 @nearest(%struct.point_t* %43, %struct.point_t* %44, i32 %45, double* null), !dbg !177
  %46 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !178
  %group = getelementptr inbounds %struct.point_t, %struct.point_t* %46, i32 0, i32 2, !dbg !179
  store i32 %call35, i32* %group, align 8, !dbg !180
  br label %for.inc36, !dbg !178

for.inc36:                                        ; preds = %for.body34
  %47 = load i32, i32* %j, align 4, !dbg !172
  %inc37 = add nsw i32 %47, 1, !dbg !172
  store i32 %inc37, i32* %j, align 4, !dbg !172
  %48 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !172
  %incdec.ptr38 = getelementptr inbounds %struct.point_t, %struct.point_t* %48, i32 1, !dbg !172
  store %struct.point_t* %incdec.ptr38, %struct.point_t** %p, align 8, !dbg !172
  br label %for.cond31, !dbg !172, !llvm.loop !181

for.end39:                                        ; preds = %for.cond31
  %49 = load double*, double** %d, align 8, !dbg !183
  %50 = bitcast double* %49 to i8*, !dbg !183
  call void @free(i8* %50) #5, !dbg !184
  ret void, !dbg !185
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @nearest(%struct.point_t*, %struct.point_t*, i32, double*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.point_t* @lloyd(%struct.point_t* %pts, i32 %len, i32 %n_cluster) #0 !dbg !186 {
entry:
  %pts.addr = alloca %struct.point_t*, align 8
  %len.addr = alloca i32, align 4
  %n_cluster.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %min_i = alloca i32, align 4
  %changed = alloca i32, align 4
  %cent = alloca %struct.point_t*, align 8
  %p = alloca %struct.point_t*, align 8
  %c = alloca %struct.point_t*, align 8
  store %struct.point_t* %pts, %struct.point_t** %pts.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.point_t** %pts.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !191, metadata !DIExpression()), !dbg !192
  store i32 %n_cluster, i32* %n_cluster.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_cluster.addr, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i32* %j, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32* %min_i, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %changed, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata %struct.point_t** %cent, metadata !203, metadata !DIExpression()), !dbg !204
  %0 = load i32, i32* %n_cluster.addr, align 4, !dbg !205
  %conv = sext i32 %0 to i64, !dbg !205
  %mul = mul i64 24, %conv, !dbg !206
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !207
  %1 = bitcast i8* %call to %struct.point_t*, !dbg !207
  store %struct.point_t* %1, %struct.point_t** %cent, align 8, !dbg !204
  call void @llvm.dbg.declare(metadata %struct.point_t** %p, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata %struct.point_t** %c, metadata !210, metadata !DIExpression()), !dbg !211
  %2 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !212
  %3 = load i32, i32* %len.addr, align 4, !dbg !213
  %4 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !214
  %5 = load i32, i32* %n_cluster.addr, align 4, !dbg !215
  call void @kpp(%struct.point_t* %2, i32 %3, %struct.point_t* %4, i32 %5), !dbg !216
  br label %do.body, !dbg !217

do.body:                                          ; preds = %do.cond, %entry
  %6 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !218
  store %struct.point_t* %6, %struct.point_t** %c, align 8, !dbg !218
  store i32 0, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !218

for.cond:                                         ; preds = %for.inc, %do.body
  %7 = load i32, i32* %i, align 4, !dbg !221
  %8 = load i32, i32* %n_cluster.addr, align 4, !dbg !221
  %cmp = icmp slt i32 %7, %8, !dbg !221
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %9 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !223
  %group = getelementptr inbounds %struct.point_t, %struct.point_t* %9, i32 0, i32 2, !dbg !225
  store i32 0, i32* %group, align 8, !dbg !226
  %10 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !227
  %y = getelementptr inbounds %struct.point_t, %struct.point_t* %10, i32 0, i32 1, !dbg !228
  store double 0.000000e+00, double* %y, align 8, !dbg !229
  %11 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !230
  %x = getelementptr inbounds %struct.point_t, %struct.point_t* %11, i32 0, i32 0, !dbg !231
  store double 0.000000e+00, double* %x, align 8, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %12, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  %13 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !221
  %incdec.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %13, i32 1, !dbg !221
  store %struct.point_t* %incdec.ptr, %struct.point_t** %c, align 8, !dbg !221
  br label %for.cond, !dbg !221, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !236
  %14 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !236
  store %struct.point_t* %14, %struct.point_t** %p, align 8, !dbg !236
  br label %for.cond2, !dbg !236

for.cond2:                                        ; preds = %for.inc14, %for.end
  %15 = load i32, i32* %j, align 4, !dbg !238
  %16 = load i32, i32* %len.addr, align 4, !dbg !238
  %cmp3 = icmp slt i32 %15, %16, !dbg !238
  br i1 %cmp3, label %for.body5, label %for.end17, !dbg !236

for.body5:                                        ; preds = %for.cond2
  %17 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !240
  %18 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !242
  %group6 = getelementptr inbounds %struct.point_t, %struct.point_t* %18, i32 0, i32 2, !dbg !243
  %19 = load i32, i32* %group6, align 8, !dbg !243
  %idx.ext = sext i32 %19 to i64, !dbg !244
  %add.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %17, i64 %idx.ext, !dbg !244
  store %struct.point_t* %add.ptr, %struct.point_t** %c, align 8, !dbg !245
  %20 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !246
  %group7 = getelementptr inbounds %struct.point_t, %struct.point_t* %20, i32 0, i32 2, !dbg !247
  %21 = load i32, i32* %group7, align 8, !dbg !248
  %inc8 = add nsw i32 %21, 1, !dbg !248
  store i32 %inc8, i32* %group7, align 8, !dbg !248
  %22 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !249
  %x9 = getelementptr inbounds %struct.point_t, %struct.point_t* %22, i32 0, i32 0, !dbg !250
  %23 = load double, double* %x9, align 8, !dbg !250
  %24 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !251
  %x10 = getelementptr inbounds %struct.point_t, %struct.point_t* %24, i32 0, i32 0, !dbg !252
  %25 = load double, double* %x10, align 8, !dbg !253
  %add = fadd double %25, %23, !dbg !253
  store double %add, double* %x10, align 8, !dbg !253
  %26 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !254
  %y11 = getelementptr inbounds %struct.point_t, %struct.point_t* %26, i32 0, i32 1, !dbg !255
  %27 = load double, double* %y11, align 8, !dbg !255
  %28 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !256
  %y12 = getelementptr inbounds %struct.point_t, %struct.point_t* %28, i32 0, i32 1, !dbg !257
  %29 = load double, double* %y12, align 8, !dbg !258
  %add13 = fadd double %29, %27, !dbg !258
  store double %add13, double* %y12, align 8, !dbg !258
  br label %for.inc14, !dbg !259

for.inc14:                                        ; preds = %for.body5
  %30 = load i32, i32* %j, align 4, !dbg !238
  %inc15 = add nsw i32 %30, 1, !dbg !238
  store i32 %inc15, i32* %j, align 4, !dbg !238
  %31 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !238
  %incdec.ptr16 = getelementptr inbounds %struct.point_t, %struct.point_t* %31, i32 1, !dbg !238
  store %struct.point_t* %incdec.ptr16, %struct.point_t** %p, align 8, !dbg !238
  br label %for.cond2, !dbg !238, !llvm.loop !260

for.end17:                                        ; preds = %for.cond2
  %32 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !262
  store %struct.point_t* %32, %struct.point_t** %c, align 8, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !262
  br label %for.cond18, !dbg !262

for.cond18:                                       ; preds = %for.inc29, %for.end17
  %33 = load i32, i32* %i, align 4, !dbg !264
  %34 = load i32, i32* %n_cluster.addr, align 4, !dbg !264
  %cmp19 = icmp slt i32 %33, %34, !dbg !264
  br i1 %cmp19, label %for.body21, label %for.end32, !dbg !262

for.body21:                                       ; preds = %for.cond18
  %35 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !266
  %group22 = getelementptr inbounds %struct.point_t, %struct.point_t* %35, i32 0, i32 2, !dbg !268
  %36 = load i32, i32* %group22, align 8, !dbg !268
  %conv23 = sitofp i32 %36 to double, !dbg !266
  %37 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !269
  %x24 = getelementptr inbounds %struct.point_t, %struct.point_t* %37, i32 0, i32 0, !dbg !270
  %38 = load double, double* %x24, align 8, !dbg !271
  %div = fdiv double %38, %conv23, !dbg !271
  store double %div, double* %x24, align 8, !dbg !271
  %39 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !272
  %group25 = getelementptr inbounds %struct.point_t, %struct.point_t* %39, i32 0, i32 2, !dbg !273
  %40 = load i32, i32* %group25, align 8, !dbg !273
  %conv26 = sitofp i32 %40 to double, !dbg !272
  %41 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !274
  %y27 = getelementptr inbounds %struct.point_t, %struct.point_t* %41, i32 0, i32 1, !dbg !275
  %42 = load double, double* %y27, align 8, !dbg !276
  %div28 = fdiv double %42, %conv26, !dbg !276
  store double %div28, double* %y27, align 8, !dbg !276
  br label %for.inc29, !dbg !277

for.inc29:                                        ; preds = %for.body21
  %43 = load i32, i32* %i, align 4, !dbg !264
  %inc30 = add nsw i32 %43, 1, !dbg !264
  store i32 %inc30, i32* %i, align 4, !dbg !264
  %44 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !264
  %incdec.ptr31 = getelementptr inbounds %struct.point_t, %struct.point_t* %44, i32 1, !dbg !264
  store %struct.point_t* %incdec.ptr31, %struct.point_t** %c, align 8, !dbg !264
  br label %for.cond18, !dbg !264, !llvm.loop !278

for.end32:                                        ; preds = %for.cond18
  store i32 0, i32* %changed, align 4, !dbg !280
  store i32 0, i32* %j, align 4, !dbg !281
  %45 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !281
  store %struct.point_t* %45, %struct.point_t** %p, align 8, !dbg !281
  br label %for.cond33, !dbg !281

for.cond33:                                       ; preds = %for.inc43, %for.end32
  %46 = load i32, i32* %j, align 4, !dbg !283
  %47 = load i32, i32* %len.addr, align 4, !dbg !283
  %cmp34 = icmp slt i32 %46, %47, !dbg !283
  br i1 %cmp34, label %for.body36, label %for.end46, !dbg !281

for.body36:                                       ; preds = %for.cond33
  %48 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !285
  %49 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !287
  %50 = load i32, i32* %n_cluster.addr, align 4, !dbg !288
  %call37 = call i32 @nearest(%struct.point_t* %48, %struct.point_t* %49, i32 %50, double* null), !dbg !289
  store i32 %call37, i32* %min_i, align 4, !dbg !290
  %51 = load i32, i32* %min_i, align 4, !dbg !291
  %52 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !293
  %group38 = getelementptr inbounds %struct.point_t, %struct.point_t* %52, i32 0, i32 2, !dbg !294
  %53 = load i32, i32* %group38, align 8, !dbg !294
  %cmp39 = icmp ne i32 %51, %53, !dbg !295
  br i1 %cmp39, label %if.then, label %if.end, !dbg !296, !cf.info !156

if.then:                                          ; preds = %for.body36
  %54 = load i32, i32* %changed, align 4, !dbg !297
  %inc41 = add nsw i32 %54, 1, !dbg !297
  store i32 %inc41, i32* %changed, align 4, !dbg !297
  %55 = load i32, i32* %min_i, align 4, !dbg !299
  %56 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !300
  %group42 = getelementptr inbounds %struct.point_t, %struct.point_t* %56, i32 0, i32 2, !dbg !301
  store i32 %55, i32* %group42, align 8, !dbg !302
  br label %if.end, !dbg !303

if.end:                                           ; preds = %if.then, %for.body36
  br label %for.inc43, !dbg !304

for.inc43:                                        ; preds = %if.end
  %57 = load i32, i32* %j, align 4, !dbg !283
  %inc44 = add nsw i32 %57, 1, !dbg !283
  store i32 %inc44, i32* %j, align 4, !dbg !283
  %58 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !283
  %incdec.ptr45 = getelementptr inbounds %struct.point_t, %struct.point_t* %58, i32 1, !dbg !283
  store %struct.point_t* %incdec.ptr45, %struct.point_t** %p, align 8, !dbg !283
  br label %for.cond33, !dbg !283, !llvm.loop !305

for.end46:                                        ; preds = %for.cond33
  br label %do.cond, !dbg !307

do.cond:                                          ; preds = %for.end46
  %59 = load i32, i32* %changed, align 4, !dbg !308
  %60 = load i32, i32* %len.addr, align 4, !dbg !309
  %shr = ashr i32 %60, 10, !dbg !310
  %cmp47 = icmp sgt i32 %59, %shr, !dbg !311
  br i1 %cmp47, label %do.body, label %do.end, !dbg !307, !llvm.loop !312

do.end:                                           ; preds = %do.cond
  %61 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !314
  store %struct.point_t* %61, %struct.point_t** %c, align 8, !dbg !314
  store i32 0, i32* %i, align 4, !dbg !314
  br label %for.cond49, !dbg !314

for.cond49:                                       ; preds = %for.inc54, %do.end
  %62 = load i32, i32* %i, align 4, !dbg !316
  %63 = load i32, i32* %n_cluster.addr, align 4, !dbg !316
  %cmp50 = icmp slt i32 %62, %63, !dbg !316
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !314

for.body52:                                       ; preds = %for.cond49
  %64 = load i32, i32* %i, align 4, !dbg !318
  %65 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !320
  %group53 = getelementptr inbounds %struct.point_t, %struct.point_t* %65, i32 0, i32 2, !dbg !321
  store i32 %64, i32* %group53, align 8, !dbg !322
  br label %for.inc54, !dbg !323

for.inc54:                                        ; preds = %for.body52
  %66 = load i32, i32* %i, align 4, !dbg !316
  %inc55 = add nsw i32 %66, 1, !dbg !316
  store i32 %inc55, i32* %i, align 4, !dbg !316
  %67 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !316
  %incdec.ptr56 = getelementptr inbounds %struct.point_t, %struct.point_t* %67, i32 1, !dbg !316
  store %struct.point_t* %incdec.ptr56, %struct.point_t** %c, align 8, !dbg !316
  br label %for.cond49, !dbg !316, !llvm.loop !324

for.end57:                                        ; preds = %for.cond49
  %68 = load %struct.point_t*, %struct.point_t** %cent, align 8, !dbg !326
  ret %struct.point_t* %68, !dbg !327
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_eps(%struct.point_t* %pts, i32 %len, %struct.point_t* %cent, i32 %n_cluster) #0 !dbg !328 {
entry:
  %pts.addr = alloca %struct.point_t*, align 8
  %len.addr = alloca i32, align 4
  %cent.addr = alloca %struct.point_t*, align 8
  %n_cluster.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca %struct.point_t*, align 8
  %c = alloca %struct.point_t*, align 8
  %min_x = alloca double, align 8
  %max_x = alloca double, align 8
  %min_y = alloca double, align 8
  %max_y = alloca double, align 8
  %scale = alloca double, align 8
  %cx = alloca double, align 8
  %cy = alloca double, align 8
  %colors = alloca double*, align 8
  store %struct.point_t* %pts, %struct.point_t** %pts.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.point_t** %pts.addr, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !331, metadata !DIExpression()), !dbg !332
  store %struct.point_t* %cent, %struct.point_t** %cent.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.point_t** %cent.addr, metadata !333, metadata !DIExpression()), !dbg !334
  store i32 %n_cluster, i32* %n_cluster.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_cluster.addr, metadata !335, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.declare(metadata i32* %i, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32* %j, metadata !339, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata %struct.point_t** %p, metadata !341, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata %struct.point_t** %c, metadata !343, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata double* %min_x, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata double* %max_x, metadata !347, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.declare(metadata double* %min_y, metadata !349, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata double* %max_y, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata double* %scale, metadata !353, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata double* %cx, metadata !355, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata double* %cy, metadata !357, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.declare(metadata double** %colors, metadata !359, metadata !DIExpression()), !dbg !360
  %0 = load i32, i32* %n_cluster.addr, align 4, !dbg !361
  %conv = sext i32 %0 to i64, !dbg !361
  %mul = mul i64 8, %conv, !dbg !362
  %mul1 = mul i64 %mul, 3, !dbg !363
  %call = call noalias i8* @malloc(i64 %mul1) #5, !dbg !364
  %1 = bitcast i8* %call to double*, !dbg !364
  store double* %1, double** %colors, align 8, !dbg !360
  %2 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !365
  store %struct.point_t* %2, %struct.point_t** %c, align 8, !dbg !365
  store i32 0, i32* %i, align 4, !dbg !365
  br label %for.cond, !dbg !365

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !367
  %4 = load i32, i32* %n_cluster.addr, align 4, !dbg !367
  %cmp = icmp slt i32 %3, %4, !dbg !367
  br i1 %cmp, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !369
  %add = add nsw i32 %5, 1, !dbg !371
  %mul3 = mul nsw i32 3, %add, !dbg !372
  %rem = srem i32 %mul3, 11, !dbg !373
  %conv4 = sitofp i32 %rem to double, !dbg !374
  %div = fdiv double %conv4, 1.100000e+01, !dbg !375
  %6 = load double*, double** %colors, align 8, !dbg !376
  %7 = load i32, i32* %i, align 4, !dbg !377
  %mul5 = mul nsw i32 3, %7, !dbg !378
  %add6 = add nsw i32 %mul5, 0, !dbg !379
  %idxprom = sext i32 %add6 to i64, !dbg !376
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom, !dbg !376
  store double %div, double* %arrayidx, align 8, !dbg !380
  %8 = load i32, i32* %i, align 4, !dbg !381
  %mul7 = mul nsw i32 7, %8, !dbg !382
  %rem8 = srem i32 %mul7, 11, !dbg !383
  %conv9 = sitofp i32 %rem8 to double, !dbg !384
  %div10 = fdiv double %conv9, 1.100000e+01, !dbg !385
  %9 = load double*, double** %colors, align 8, !dbg !386
  %10 = load i32, i32* %i, align 4, !dbg !387
  %mul11 = mul nsw i32 3, %10, !dbg !388
  %add12 = add nsw i32 %mul11, 1, !dbg !389
  %idxprom13 = sext i32 %add12 to i64, !dbg !386
  %arrayidx14 = getelementptr inbounds double, double* %9, i64 %idxprom13, !dbg !386
  store double %div10, double* %arrayidx14, align 8, !dbg !390
  %11 = load i32, i32* %i, align 4, !dbg !391
  %mul15 = mul nsw i32 9, %11, !dbg !392
  %rem16 = srem i32 %mul15, 11, !dbg !393
  %conv17 = sitofp i32 %rem16 to double, !dbg !394
  %div18 = fdiv double %conv17, 1.100000e+01, !dbg !395
  %12 = load double*, double** %colors, align 8, !dbg !396
  %13 = load i32, i32* %i, align 4, !dbg !397
  %mul19 = mul nsw i32 3, %13, !dbg !398
  %add20 = add nsw i32 %mul19, 2, !dbg !399
  %idxprom21 = sext i32 %add20 to i64, !dbg !396
  %arrayidx22 = getelementptr inbounds double, double* %12, i64 %idxprom21, !dbg !396
  store double %div18, double* %arrayidx22, align 8, !dbg !400
  br label %for.inc, !dbg !401

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !367
  %inc = add nsw i32 %14, 1, !dbg !367
  store i32 %inc, i32* %i, align 4, !dbg !367
  %15 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !367
  %incdec.ptr = getelementptr inbounds %struct.point_t, %struct.point_t* %15, i32 1, !dbg !367
  store %struct.point_t* %incdec.ptr, %struct.point_t** %c, align 8, !dbg !367
  br label %for.cond, !dbg !367, !llvm.loop !402

for.end:                                          ; preds = %for.cond
  store double 0x7FF0000000000000, double* %min_y, align 8, !dbg !404
  store double 0x7FF0000000000000, double* %min_x, align 8, !dbg !405
  store double 0xFFF0000000000000, double* %max_y, align 8, !dbg !406
  store double 0xFFF0000000000000, double* %max_x, align 8, !dbg !407
  store i32 0, i32* %j, align 4, !dbg !408
  %16 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !408
  store %struct.point_t* %16, %struct.point_t** %p, align 8, !dbg !408
  br label %for.cond23, !dbg !408

for.cond23:                                       ; preds = %for.inc47, %for.end
  %17 = load i32, i32* %j, align 4, !dbg !410
  %18 = load i32, i32* %len.addr, align 4, !dbg !410
  %cmp24 = icmp slt i32 %17, %18, !dbg !410
  br i1 %cmp24, label %for.body26, label %for.end50, !dbg !408

for.body26:                                       ; preds = %for.cond23
  %19 = load double, double* %max_x, align 8, !dbg !412
  %20 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !415
  %x = getelementptr inbounds %struct.point_t, %struct.point_t* %20, i32 0, i32 0, !dbg !416
  %21 = load double, double* %x, align 8, !dbg !416
  %cmp27 = fcmp olt double %19, %21, !dbg !417
  br i1 %cmp27, label %if.then, label %if.end, !dbg !418, !cf.info !156

if.then:                                          ; preds = %for.body26
  %22 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !419
  %x29 = getelementptr inbounds %struct.point_t, %struct.point_t* %22, i32 0, i32 0, !dbg !420
  %23 = load double, double* %x29, align 8, !dbg !420
  store double %23, double* %max_x, align 8, !dbg !421
  br label %if.end, !dbg !422

if.end:                                           ; preds = %if.then, %for.body26
  %24 = load double, double* %min_x, align 8, !dbg !423
  %25 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !425
  %x30 = getelementptr inbounds %struct.point_t, %struct.point_t* %25, i32 0, i32 0, !dbg !426
  %26 = load double, double* %x30, align 8, !dbg !426
  %cmp31 = fcmp ogt double %24, %26, !dbg !427
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !428, !cf.info !156

if.then33:                                        ; preds = %if.end
  %27 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !429
  %x34 = getelementptr inbounds %struct.point_t, %struct.point_t* %27, i32 0, i32 0, !dbg !430
  %28 = load double, double* %x34, align 8, !dbg !430
  store double %28, double* %min_x, align 8, !dbg !431
  br label %if.end35, !dbg !432

if.end35:                                         ; preds = %if.then33, %if.end
  %29 = load double, double* %max_y, align 8, !dbg !433
  %30 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !435
  %y = getelementptr inbounds %struct.point_t, %struct.point_t* %30, i32 0, i32 1, !dbg !436
  %31 = load double, double* %y, align 8, !dbg !436
  %cmp36 = fcmp olt double %29, %31, !dbg !437
  br i1 %cmp36, label %if.then38, label %if.end40, !dbg !438, !cf.info !156

if.then38:                                        ; preds = %if.end35
  %32 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !439
  %y39 = getelementptr inbounds %struct.point_t, %struct.point_t* %32, i32 0, i32 1, !dbg !440
  %33 = load double, double* %y39, align 8, !dbg !440
  store double %33, double* %max_y, align 8, !dbg !441
  br label %if.end40, !dbg !442

if.end40:                                         ; preds = %if.then38, %if.end35
  %34 = load double, double* %min_y, align 8, !dbg !443
  %35 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !445
  %y41 = getelementptr inbounds %struct.point_t, %struct.point_t* %35, i32 0, i32 1, !dbg !446
  %36 = load double, double* %y41, align 8, !dbg !446
  %cmp42 = fcmp ogt double %34, %36, !dbg !447
  br i1 %cmp42, label %if.then44, label %if.end46, !dbg !448, !cf.info !156

if.then44:                                        ; preds = %if.end40
  %37 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !449
  %y45 = getelementptr inbounds %struct.point_t, %struct.point_t* %37, i32 0, i32 1, !dbg !450
  %38 = load double, double* %y45, align 8, !dbg !450
  store double %38, double* %min_y, align 8, !dbg !451
  br label %if.end46, !dbg !452

if.end46:                                         ; preds = %if.then44, %if.end40
  br label %for.inc47, !dbg !453

for.inc47:                                        ; preds = %if.end46
  %39 = load i32, i32* %j, align 4, !dbg !410
  %inc48 = add nsw i32 %39, 1, !dbg !410
  store i32 %inc48, i32* %j, align 4, !dbg !410
  %40 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !410
  %incdec.ptr49 = getelementptr inbounds %struct.point_t, %struct.point_t* %40, i32 1, !dbg !410
  store %struct.point_t* %incdec.ptr49, %struct.point_t** %p, align 8, !dbg !410
  br label %for.cond23, !dbg !410, !llvm.loop !454

for.end50:                                        ; preds = %for.cond23
  %41 = load double, double* %max_x, align 8, !dbg !456
  %42 = load double, double* %min_x, align 8, !dbg !457
  %sub = fsub double %41, %42, !dbg !458
  %div51 = fdiv double 4.000000e+02, %sub, !dbg !459
  store double %div51, double* %scale, align 8, !dbg !460
  %43 = load double, double* %scale, align 8, !dbg !461
  %44 = load double, double* %max_y, align 8, !dbg !463
  %45 = load double, double* %min_y, align 8, !dbg !464
  %sub52 = fsub double %44, %45, !dbg !465
  %div53 = fdiv double 4.000000e+02, %sub52, !dbg !466
  %cmp54 = fcmp ogt double %43, %div53, !dbg !467
  br i1 %cmp54, label %if.then56, label %if.end59, !dbg !468, !cf.info !156

if.then56:                                        ; preds = %for.end50
  %46 = load double, double* %max_y, align 8, !dbg !469
  %47 = load double, double* %min_y, align 8, !dbg !470
  %sub57 = fsub double %46, %47, !dbg !471
  %div58 = fdiv double 4.000000e+02, %sub57, !dbg !472
  store double %div58, double* %scale, align 8, !dbg !473
  br label %if.end59, !dbg !474

if.end59:                                         ; preds = %if.then56, %for.end50
  %48 = load double, double* %max_x, align 8, !dbg !475
  %49 = load double, double* %min_x, align 8, !dbg !476
  %add60 = fadd double %48, %49, !dbg !477
  %div61 = fdiv double %add60, 2.000000e+00, !dbg !478
  store double %div61, double* %cx, align 8, !dbg !479
  %50 = load double, double* %max_y, align 8, !dbg !480
  %51 = load double, double* %min_y, align 8, !dbg !481
  %add62 = fadd double %50, %51, !dbg !482
  %div63 = fdiv double %add62, 2.000000e+00, !dbg !483
  store double %div63, double* %cy, align 8, !dbg !484
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 410, i32 410), !dbg !485
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([240 x i8], [240 x i8]* @.str.1, i64 0, i64 0)), !dbg !486
  %52 = load %struct.point_t*, %struct.point_t** %cent.addr, align 8, !dbg !487
  store %struct.point_t* %52, %struct.point_t** %c, align 8, !dbg !487
  store i32 0, i32* %i, align 4, !dbg !487
  br label %for.cond66, !dbg !487

for.cond66:                                       ; preds = %for.inc112, %if.end59
  %53 = load i32, i32* %i, align 4, !dbg !489
  %54 = load i32, i32* %n_cluster.addr, align 4, !dbg !489
  %cmp67 = icmp slt i32 %53, %54, !dbg !489
  br i1 %cmp67, label %for.body69, label %for.end115, !dbg !487

for.body69:                                       ; preds = %for.cond66
  %55 = load double*, double** %colors, align 8, !dbg !491
  %56 = load i32, i32* %i, align 4, !dbg !493
  %mul70 = mul nsw i32 3, %56, !dbg !494
  %idxprom71 = sext i32 %mul70 to i64, !dbg !491
  %arrayidx72 = getelementptr inbounds double, double* %55, i64 %idxprom71, !dbg !491
  %57 = load double, double* %arrayidx72, align 8, !dbg !491
  %58 = load double*, double** %colors, align 8, !dbg !495
  %59 = load i32, i32* %i, align 4, !dbg !496
  %mul73 = mul nsw i32 3, %59, !dbg !497
  %add74 = add nsw i32 %mul73, 1, !dbg !498
  %idxprom75 = sext i32 %add74 to i64, !dbg !495
  %arrayidx76 = getelementptr inbounds double, double* %58, i64 %idxprom75, !dbg !495
  %60 = load double, double* %arrayidx76, align 8, !dbg !495
  %61 = load double*, double** %colors, align 8, !dbg !499
  %62 = load i32, i32* %i, align 4, !dbg !500
  %mul77 = mul nsw i32 3, %62, !dbg !501
  %add78 = add nsw i32 %mul77, 2, !dbg !502
  %idxprom79 = sext i32 %add78 to i64, !dbg !499
  %arrayidx80 = getelementptr inbounds double, double* %61, i64 %idxprom79, !dbg !499
  %63 = load double, double* %arrayidx80, align 8, !dbg !499
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i64 0, i64 0), double %57, double %60, double %63), !dbg !503
  store i32 0, i32* %j, align 4, !dbg !504
  %64 = load %struct.point_t*, %struct.point_t** %pts.addr, align 8, !dbg !504
  store %struct.point_t* %64, %struct.point_t** %p, align 8, !dbg !504
  br label %for.cond82, !dbg !504

for.cond82:                                       ; preds = %for.inc99, %for.body69
  %65 = load i32, i32* %j, align 4, !dbg !506
  %66 = load i32, i32* %len.addr, align 4, !dbg !506
  %cmp83 = icmp slt i32 %65, %66, !dbg !506
  br i1 %cmp83, label %for.body85, label %for.end102, !dbg !504

for.body85:                                       ; preds = %for.cond82
  %67 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !508
  %group = getelementptr inbounds %struct.point_t, %struct.point_t* %67, i32 0, i32 2, !dbg !511
  %68 = load i32, i32* %group, align 8, !dbg !511
  %69 = load i32, i32* %i, align 4, !dbg !512
  %cmp86 = icmp ne i32 %68, %69, !dbg !513
  br i1 %cmp86, label %if.then88, label %if.end89, !dbg !514, !cf.info !156

if.then88:                                        ; preds = %for.body85
  br label %for.inc99, !dbg !515

if.end89:                                         ; preds = %for.body85
  %70 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !516
  %x90 = getelementptr inbounds %struct.point_t, %struct.point_t* %70, i32 0, i32 0, !dbg !517
  %71 = load double, double* %x90, align 8, !dbg !517
  %72 = load double, double* %cx, align 8, !dbg !518
  %sub91 = fsub double %71, %72, !dbg !519
  %73 = load double, double* %scale, align 8, !dbg !520
  %mul92 = fmul double %sub91, %73, !dbg !521
  %add93 = fadd double %mul92, 2.000000e+02, !dbg !522
  %74 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !523
  %y94 = getelementptr inbounds %struct.point_t, %struct.point_t* %74, i32 0, i32 1, !dbg !524
  %75 = load double, double* %y94, align 8, !dbg !524
  %76 = load double, double* %cy, align 8, !dbg !525
  %sub95 = fsub double %75, %76, !dbg !526
  %77 = load double, double* %scale, align 8, !dbg !527
  %mul96 = fmul double %sub95, %77, !dbg !528
  %add97 = fadd double %mul96, 2.000000e+02, !dbg !529
  %call98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), double %add93, double %add97), !dbg !530
  br label %for.inc99, !dbg !531

for.inc99:                                        ; preds = %if.end89, %if.then88
  %78 = load i32, i32* %j, align 4, !dbg !506
  %inc100 = add nsw i32 %78, 1, !dbg !506
  store i32 %inc100, i32* %j, align 4, !dbg !506
  %79 = load %struct.point_t*, %struct.point_t** %p, align 8, !dbg !506
  %incdec.ptr101 = getelementptr inbounds %struct.point_t, %struct.point_t* %79, i32 1, !dbg !506
  store %struct.point_t* %incdec.ptr101, %struct.point_t** %p, align 8, !dbg !506
  br label %for.cond82, !dbg !506, !llvm.loop !532

for.end102:                                       ; preds = %for.cond82
  %80 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !534
  %x103 = getelementptr inbounds %struct.point_t, %struct.point_t* %80, i32 0, i32 0, !dbg !535
  %81 = load double, double* %x103, align 8, !dbg !535
  %82 = load double, double* %cx, align 8, !dbg !536
  %sub104 = fsub double %81, %82, !dbg !537
  %83 = load double, double* %scale, align 8, !dbg !538
  %mul105 = fmul double %sub104, %83, !dbg !539
  %add106 = fadd double %mul105, 2.000000e+02, !dbg !540
  %84 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !541
  %y107 = getelementptr inbounds %struct.point_t, %struct.point_t* %84, i32 0, i32 1, !dbg !542
  %85 = load double, double* %y107, align 8, !dbg !542
  %86 = load double, double* %cy, align 8, !dbg !543
  %sub108 = fsub double %85, %86, !dbg !544
  %87 = load double, double* %scale, align 8, !dbg !545
  %mul109 = fmul double %sub108, %87, !dbg !546
  %add110 = fadd double %mul109, 2.000000e+02, !dbg !547
  %call111 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), double %add106, double %add110), !dbg !548
  br label %for.inc112, !dbg !549

for.inc112:                                       ; preds = %for.end102
  %88 = load i32, i32* %i, align 4, !dbg !489
  %inc113 = add nsw i32 %88, 1, !dbg !489
  store i32 %inc113, i32* %i, align 4, !dbg !489
  %89 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !489
  %incdec.ptr114 = getelementptr inbounds %struct.point_t, %struct.point_t* %89, i32 1, !dbg !489
  store %struct.point_t* %incdec.ptr114, %struct.point_t** %c, align 8, !dbg !489
  br label %for.cond66, !dbg !489, !llvm.loop !550

for.end115:                                       ; preds = %for.cond66
  %call116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0)), !dbg !552
  %90 = load double*, double** %colors, align 8, !dbg !553
  %91 = bitcast double* %90 to i8*, !dbg !553
  call void @free(i8* %91) #5, !dbg !554
  ret void, !dbg !555
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !556 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %v = alloca %struct.point_t*, align 8
  %c = alloca %struct.point_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !559, metadata !DIExpression()), !dbg !560
  call void @llvm.dbg.declare(metadata %struct.point_t** %v, metadata !561, metadata !DIExpression()), !dbg !562
  %call = call %struct.point_t* @gen_xy(i32 100000, double 1.000000e+01), !dbg !563
  store %struct.point_t* %call, %struct.point_t** %v, align 8, !dbg !562
  call void @llvm.dbg.declare(metadata %struct.point_t** %c, metadata !564, metadata !DIExpression()), !dbg !565
  %0 = load %struct.point_t*, %struct.point_t** %v, align 8, !dbg !566
  %call1 = call %struct.point_t* @lloyd(%struct.point_t* %0, i32 100000, i32 11), !dbg !567
  store %struct.point_t* %call1, %struct.point_t** %c, align 8, !dbg !565
  %1 = load %struct.point_t*, %struct.point_t** %v, align 8, !dbg !568
  %2 = load %struct.point_t*, %struct.point_t** %c, align 8, !dbg !569
  call void @print_eps(%struct.point_t* %1, i32 100000, %struct.point_t* %2, i32 11), !dbg !570
  ret i32 0, !dbg !571
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "k-means++-clustering.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/K-means++-clustering")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "randf", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 21, scope: !7)
!13 = !DILocation(line: 9, column: 9, scope: !7)
!14 = !DILocation(line: 9, column: 13, scope: !7)
!15 = !DILocation(line: 9, column: 11, scope: !7)
!16 = !DILocation(line: 9, column: 20, scope: !7)
!17 = !DILocation(line: 9, column: 2, scope: !7)
!18 = distinct !DISubprogram(name: "gen_xy", scope: !1, file: !1, line: 12, type: !19, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !28, !10}
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "point", file: !1, line: 5, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 192, elements: !24)
!24 = !{!25, !26, !27}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !23, file: !1, line: 5, baseType: !10, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !23, file: !1, line: 5, baseType: !10, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "group", scope: !23, file: !1, line: 5, baseType: !28, size: 32, offset: 128)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocalVariable(name: "count", arg: 1, scope: !18, file: !1, line: 12, type: !28)
!30 = !DILocation(line: 12, column: 18, scope: !18)
!31 = !DILocalVariable(name: "radius", arg: 2, scope: !18, file: !1, line: 12, type: !10)
!32 = !DILocation(line: 12, column: 32, scope: !18)
!33 = !DILocalVariable(name: "ang", scope: !18, file: !1, line: 14, type: !10)
!34 = !DILocation(line: 14, column: 9, scope: !18)
!35 = !DILocalVariable(name: "r", scope: !18, file: !1, line: 14, type: !10)
!36 = !DILocation(line: 14, column: 14, scope: !18)
!37 = !DILocalVariable(name: "p", scope: !18, file: !1, line: 15, type: !21)
!38 = !DILocation(line: 15, column: 8, scope: !18)
!39 = !DILocalVariable(name: "pt", scope: !18, file: !1, line: 15, type: !21)
!40 = !DILocation(line: 15, column: 11, scope: !18)
!41 = !DILocation(line: 15, column: 41, scope: !18)
!42 = !DILocation(line: 15, column: 39, scope: !18)
!43 = !DILocation(line: 15, column: 16, scope: !18)
!44 = !DILocation(line: 18, column: 11, scope: !45)
!45 = distinct !DILexicalBlock(scope: !18, file: !1, line: 18, column: 2)
!46 = !DILocation(line: 18, column: 16, scope: !45)
!47 = !DILocation(line: 18, column: 14, scope: !45)
!48 = !DILocation(line: 18, column: 9, scope: !45)
!49 = !DILocation(line: 18, column: 7, scope: !45)
!50 = !DILocation(line: 18, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !1, line: 18, column: 2)
!52 = !DILocation(line: 18, column: 29, scope: !51)
!53 = !DILocation(line: 18, column: 27, scope: !51)
!54 = !DILocation(line: 18, column: 2, scope: !45)
!55 = !DILocation(line: 19, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !1, line: 18, column: 34)
!57 = !DILocation(line: 19, column: 7, scope: !56)
!58 = !DILocation(line: 20, column: 13, scope: !56)
!59 = !DILocation(line: 20, column: 7, scope: !56)
!60 = !DILocation(line: 20, column: 5, scope: !56)
!61 = !DILocation(line: 21, column: 10, scope: !56)
!62 = !DILocation(line: 21, column: 18, scope: !56)
!63 = !DILocation(line: 21, column: 14, scope: !56)
!64 = !DILocation(line: 21, column: 12, scope: !56)
!65 = !DILocation(line: 21, column: 3, scope: !56)
!66 = !DILocation(line: 21, column: 6, scope: !56)
!67 = !DILocation(line: 21, column: 8, scope: !56)
!68 = !DILocation(line: 22, column: 10, scope: !56)
!69 = !DILocation(line: 22, column: 18, scope: !56)
!70 = !DILocation(line: 22, column: 14, scope: !56)
!71 = !DILocation(line: 22, column: 12, scope: !56)
!72 = !DILocation(line: 22, column: 3, scope: !56)
!73 = !DILocation(line: 22, column: 6, scope: !56)
!74 = !DILocation(line: 22, column: 8, scope: !56)
!75 = !DILocation(line: 18, column: 2, scope: !51)
!76 = distinct !{!76, !54, !77}
!77 = !DILocation(line: 23, column: 2, scope: !45)
!78 = !DILocation(line: 25, column: 9, scope: !18)
!79 = !DILocation(line: 25, column: 2, scope: !18)
!80 = distinct !DISubprogram(name: "kpp", scope: !1, file: !1, line: 55, type: !81, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !21, !28, !21, !28}
!83 = !DILocalVariable(name: "pts", arg: 1, scope: !80, file: !1, line: 55, type: !21)
!84 = !DILocation(line: 55, column: 16, scope: !80)
!85 = !DILocalVariable(name: "len", arg: 2, scope: !80, file: !1, line: 55, type: !28)
!86 = !DILocation(line: 55, column: 25, scope: !80)
!87 = !DILocalVariable(name: "cent", arg: 3, scope: !80, file: !1, line: 55, type: !21)
!88 = !DILocation(line: 55, column: 36, scope: !80)
!89 = !DILocalVariable(name: "n_cent", arg: 4, scope: !80, file: !1, line: 55, type: !28)
!90 = !DILocation(line: 55, column: 46, scope: !80)
!91 = !DILocalVariable(name: "i", scope: !80, file: !1, line: 58, type: !28)
!92 = !DILocation(line: 58, column: 6, scope: !80)
!93 = !DILocalVariable(name: "j", scope: !80, file: !1, line: 58, type: !28)
!94 = !DILocation(line: 58, column: 9, scope: !80)
!95 = !DILocalVariable(name: "n_cluster", scope: !80, file: !1, line: 59, type: !28)
!96 = !DILocation(line: 59, column: 6, scope: !80)
!97 = !DILocalVariable(name: "sum", scope: !80, file: !1, line: 60, type: !10)
!98 = !DILocation(line: 60, column: 9, scope: !80)
!99 = !DILocalVariable(name: "d", scope: !80, file: !1, line: 60, type: !100)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!101 = !DILocation(line: 60, column: 15, scope: !80)
!102 = !DILocation(line: 60, column: 43, scope: !80)
!103 = !DILocation(line: 60, column: 41, scope: !80)
!104 = !DILocation(line: 60, column: 19, scope: !80)
!105 = !DILocalVariable(name: "p", scope: !80, file: !1, line: 62, type: !21)
!106 = !DILocation(line: 62, column: 8, scope: !80)
!107 = !DILocalVariable(name: "c", scope: !80, file: !1, line: 62, type: !21)
!108 = !DILocation(line: 62, column: 11, scope: !80)
!109 = !DILocation(line: 63, column: 2, scope: !80)
!110 = !DILocation(line: 63, column: 12, scope: !80)
!111 = !DILocation(line: 63, column: 17, scope: !80)
!112 = !DILocation(line: 63, column: 26, scope: !80)
!113 = !DILocation(line: 63, column: 24, scope: !80)
!114 = !DILocation(line: 64, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !80, file: !1, line: 64, column: 2)
!116 = !DILocation(line: 64, column: 7, scope: !115)
!117 = !DILocation(line: 64, column: 22, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 64, column: 2)
!119 = !DILocation(line: 64, column: 34, scope: !118)
!120 = !DILocation(line: 64, column: 32, scope: !118)
!121 = !DILocation(line: 64, column: 2, scope: !115)
!122 = !DILocation(line: 65, column: 7, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !1, line: 64, column: 55)
!124 = !DILocation(line: 66, column: 3, scope: !125)
!125 = distinct !DILexicalBlock(scope: !123, file: !1, line: 66, column: 3)
!126 = !DILocation(line: 66, column: 3, scope: !127)
!127 = distinct !DILexicalBlock(scope: !125, file: !1, line: 66, column: 3)
!128 = !DILocation(line: 67, column: 12, scope: !129)
!129 = distinct !DILexicalBlock(scope: !127, file: !1, line: 66, column: 11)
!130 = !DILocation(line: 67, column: 15, scope: !129)
!131 = !DILocation(line: 67, column: 21, scope: !129)
!132 = !DILocation(line: 67, column: 32, scope: !129)
!133 = !DILocation(line: 67, column: 36, scope: !129)
!134 = !DILocation(line: 67, column: 34, scope: !129)
!135 = !DILocation(line: 67, column: 4, scope: !129)
!136 = !DILocation(line: 68, column: 11, scope: !129)
!137 = !DILocation(line: 68, column: 13, scope: !129)
!138 = !DILocation(line: 68, column: 8, scope: !129)
!139 = !DILocation(line: 69, column: 3, scope: !129)
!140 = distinct !{!140, !124, !141}
!141 = !DILocation(line: 69, column: 3, scope: !125)
!142 = !DILocation(line: 70, column: 15, scope: !123)
!143 = !DILocation(line: 70, column: 9, scope: !123)
!144 = !DILocation(line: 70, column: 7, scope: !123)
!145 = !DILocation(line: 71, column: 3, scope: !146)
!146 = distinct !DILexicalBlock(scope: !123, file: !1, line: 71, column: 3)
!147 = !DILocation(line: 71, column: 3, scope: !148)
!148 = distinct !DILexicalBlock(scope: !146, file: !1, line: 71, column: 3)
!149 = !DILocation(line: 72, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !1, line: 72, column: 8)
!151 = distinct !DILexicalBlock(scope: !148, file: !1, line: 71, column: 11)
!152 = !DILocation(line: 72, column: 18, scope: !150)
!153 = !DILocation(line: 72, column: 13, scope: !150)
!154 = !DILocation(line: 72, column: 22, scope: !150)
!155 = !DILocation(line: 72, column: 8, scope: !151)
!156 = !{!"if"}
!157 = !DILocation(line: 72, column: 27, scope: !150)
!158 = !DILocation(line: 73, column: 4, scope: !151)
!159 = !DILocation(line: 73, column: 9, scope: !151)
!160 = !DILocation(line: 73, column: 22, scope: !151)
!161 = !DILocation(line: 73, column: 26, scope: !151)
!162 = !DILocation(line: 74, column: 4, scope: !151)
!163 = distinct !{!163, !145, !164}
!164 = !DILocation(line: 75, column: 3, scope: !146)
!165 = !DILocation(line: 76, column: 2, scope: !123)
!166 = !DILocation(line: 64, column: 51, scope: !118)
!167 = !DILocation(line: 64, column: 2, scope: !118)
!168 = distinct !{!168, !121, !169}
!169 = !DILocation(line: 76, column: 2, scope: !115)
!170 = !DILocation(line: 77, column: 2, scope: !171)
!171 = distinct !DILexicalBlock(scope: !80, file: !1, line: 77, column: 2)
!172 = !DILocation(line: 77, column: 2, scope: !173)
!173 = distinct !DILexicalBlock(scope: !171, file: !1, line: 77, column: 2)
!174 = !DILocation(line: 77, column: 29, scope: !173)
!175 = !DILocation(line: 77, column: 32, scope: !173)
!176 = !DILocation(line: 77, column: 38, scope: !173)
!177 = !DILocation(line: 77, column: 21, scope: !173)
!178 = !DILocation(line: 77, column: 10, scope: !173)
!179 = !DILocation(line: 77, column: 13, scope: !173)
!180 = !DILocation(line: 77, column: 19, scope: !173)
!181 = distinct !{!181, !170, !182}
!182 = !DILocation(line: 77, column: 50, scope: !171)
!183 = !DILocation(line: 78, column: 7, scope: !80)
!184 = !DILocation(line: 78, column: 2, scope: !80)
!185 = !DILocation(line: 79, column: 1, scope: !80)
!186 = distinct !DISubprogram(name: "lloyd", scope: !1, file: !1, line: 81, type: !187, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!187 = !DISubroutineType(types: !188)
!188 = !{!21, !21, !28, !28}
!189 = !DILocalVariable(name: "pts", arg: 1, scope: !186, file: !1, line: 81, type: !21)
!190 = !DILocation(line: 81, column: 19, scope: !186)
!191 = !DILocalVariable(name: "len", arg: 2, scope: !186, file: !1, line: 81, type: !28)
!192 = !DILocation(line: 81, column: 28, scope: !186)
!193 = !DILocalVariable(name: "n_cluster", arg: 3, scope: !186, file: !1, line: 81, type: !28)
!194 = !DILocation(line: 81, column: 37, scope: !186)
!195 = !DILocalVariable(name: "i", scope: !186, file: !1, line: 83, type: !28)
!196 = !DILocation(line: 83, column: 6, scope: !186)
!197 = !DILocalVariable(name: "j", scope: !186, file: !1, line: 83, type: !28)
!198 = !DILocation(line: 83, column: 9, scope: !186)
!199 = !DILocalVariable(name: "min_i", scope: !186, file: !1, line: 83, type: !28)
!200 = !DILocation(line: 83, column: 12, scope: !186)
!201 = !DILocalVariable(name: "changed", scope: !186, file: !1, line: 84, type: !28)
!202 = !DILocation(line: 84, column: 6, scope: !186)
!203 = !DILocalVariable(name: "cent", scope: !186, file: !1, line: 86, type: !21)
!204 = !DILocation(line: 86, column: 8, scope: !186)
!205 = !DILocation(line: 86, column: 40, scope: !186)
!206 = !DILocation(line: 86, column: 38, scope: !186)
!207 = !DILocation(line: 86, column: 15, scope: !186)
!208 = !DILocalVariable(name: "p", scope: !186, file: !1, line: 86, type: !21)
!209 = !DILocation(line: 86, column: 52, scope: !186)
!210 = !DILocalVariable(name: "c", scope: !186, file: !1, line: 86, type: !21)
!211 = !DILocation(line: 86, column: 55, scope: !186)
!212 = !DILocation(line: 92, column: 6, scope: !186)
!213 = !DILocation(line: 92, column: 11, scope: !186)
!214 = !DILocation(line: 92, column: 16, scope: !186)
!215 = !DILocation(line: 92, column: 22, scope: !186)
!216 = !DILocation(line: 92, column: 2, scope: !186)
!217 = !DILocation(line: 94, column: 2, scope: !186)
!218 = !DILocation(line: 96, column: 3, scope: !219)
!219 = distinct !DILexicalBlock(scope: !220, file: !1, line: 96, column: 3)
!220 = distinct !DILexicalBlock(scope: !186, file: !1, line: 94, column: 5)
!221 = !DILocation(line: 96, column: 3, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !1, line: 96, column: 3)
!223 = !DILocation(line: 96, column: 11, scope: !224)
!224 = distinct !DILexicalBlock(scope: !222, file: !1, line: 96, column: 9)
!225 = !DILocation(line: 96, column: 14, scope: !224)
!226 = !DILocation(line: 96, column: 20, scope: !224)
!227 = !DILocation(line: 96, column: 32, scope: !224)
!228 = !DILocation(line: 96, column: 35, scope: !224)
!229 = !DILocation(line: 96, column: 37, scope: !224)
!230 = !DILocation(line: 96, column: 25, scope: !224)
!231 = !DILocation(line: 96, column: 28, scope: !224)
!232 = !DILocation(line: 96, column: 30, scope: !224)
!233 = !DILocation(line: 96, column: 42, scope: !224)
!234 = distinct !{!234, !218, !235}
!235 = !DILocation(line: 96, column: 42, scope: !219)
!236 = !DILocation(line: 97, column: 3, scope: !237)
!237 = distinct !DILexicalBlock(scope: !220, file: !1, line: 97, column: 3)
!238 = !DILocation(line: 97, column: 3, scope: !239)
!239 = distinct !DILexicalBlock(scope: !237, file: !1, line: 97, column: 3)
!240 = !DILocation(line: 98, column: 8, scope: !241)
!241 = distinct !DILexicalBlock(scope: !239, file: !1, line: 97, column: 11)
!242 = !DILocation(line: 98, column: 15, scope: !241)
!243 = !DILocation(line: 98, column: 18, scope: !241)
!244 = !DILocation(line: 98, column: 13, scope: !241)
!245 = !DILocation(line: 98, column: 6, scope: !241)
!246 = !DILocation(line: 99, column: 4, scope: !241)
!247 = !DILocation(line: 99, column: 7, scope: !241)
!248 = !DILocation(line: 99, column: 12, scope: !241)
!249 = !DILocation(line: 100, column: 12, scope: !241)
!250 = !DILocation(line: 100, column: 15, scope: !241)
!251 = !DILocation(line: 100, column: 4, scope: !241)
!252 = !DILocation(line: 100, column: 7, scope: !241)
!253 = !DILocation(line: 100, column: 9, scope: !241)
!254 = !DILocation(line: 100, column: 26, scope: !241)
!255 = !DILocation(line: 100, column: 29, scope: !241)
!256 = !DILocation(line: 100, column: 18, scope: !241)
!257 = !DILocation(line: 100, column: 21, scope: !241)
!258 = !DILocation(line: 100, column: 23, scope: !241)
!259 = !DILocation(line: 101, column: 3, scope: !241)
!260 = distinct !{!260, !236, !261}
!261 = !DILocation(line: 101, column: 3, scope: !237)
!262 = !DILocation(line: 102, column: 3, scope: !263)
!263 = distinct !DILexicalBlock(scope: !220, file: !1, line: 102, column: 3)
!264 = !DILocation(line: 102, column: 3, scope: !265)
!265 = distinct !DILexicalBlock(scope: !263, file: !1, line: 102, column: 3)
!266 = !DILocation(line: 102, column: 19, scope: !267)
!267 = distinct !DILexicalBlock(scope: !265, file: !1, line: 102, column: 9)
!268 = !DILocation(line: 102, column: 22, scope: !267)
!269 = !DILocation(line: 102, column: 11, scope: !267)
!270 = !DILocation(line: 102, column: 14, scope: !267)
!271 = !DILocation(line: 102, column: 16, scope: !267)
!272 = !DILocation(line: 102, column: 37, scope: !267)
!273 = !DILocation(line: 102, column: 40, scope: !267)
!274 = !DILocation(line: 102, column: 29, scope: !267)
!275 = !DILocation(line: 102, column: 32, scope: !267)
!276 = !DILocation(line: 102, column: 34, scope: !267)
!277 = !DILocation(line: 102, column: 47, scope: !267)
!278 = distinct !{!278, !262, !279}
!279 = !DILocation(line: 102, column: 47, scope: !263)
!280 = !DILocation(line: 104, column: 11, scope: !220)
!281 = !DILocation(line: 106, column: 3, scope: !282)
!282 = distinct !DILexicalBlock(scope: !220, file: !1, line: 106, column: 3)
!283 = !DILocation(line: 106, column: 3, scope: !284)
!284 = distinct !DILexicalBlock(scope: !282, file: !1, line: 106, column: 3)
!285 = !DILocation(line: 107, column: 20, scope: !286)
!286 = distinct !DILexicalBlock(scope: !284, file: !1, line: 106, column: 11)
!287 = !DILocation(line: 107, column: 23, scope: !286)
!288 = !DILocation(line: 107, column: 29, scope: !286)
!289 = !DILocation(line: 107, column: 12, scope: !286)
!290 = !DILocation(line: 107, column: 10, scope: !286)
!291 = !DILocation(line: 108, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !286, file: !1, line: 108, column: 8)
!293 = !DILocation(line: 108, column: 17, scope: !292)
!294 = !DILocation(line: 108, column: 20, scope: !292)
!295 = !DILocation(line: 108, column: 14, scope: !292)
!296 = !DILocation(line: 108, column: 8, scope: !286)
!297 = !DILocation(line: 109, column: 12, scope: !298)
!298 = distinct !DILexicalBlock(scope: !292, file: !1, line: 108, column: 27)
!299 = !DILocation(line: 110, column: 16, scope: !298)
!300 = !DILocation(line: 110, column: 5, scope: !298)
!301 = !DILocation(line: 110, column: 8, scope: !298)
!302 = !DILocation(line: 110, column: 14, scope: !298)
!303 = !DILocation(line: 111, column: 4, scope: !298)
!304 = !DILocation(line: 112, column: 3, scope: !286)
!305 = distinct !{!305, !281, !306}
!306 = !DILocation(line: 112, column: 3, scope: !282)
!307 = !DILocation(line: 113, column: 2, scope: !220)
!308 = !DILocation(line: 113, column: 11, scope: !186)
!309 = !DILocation(line: 113, column: 22, scope: !186)
!310 = !DILocation(line: 113, column: 26, scope: !186)
!311 = !DILocation(line: 113, column: 19, scope: !186)
!312 = distinct !{!312, !217, !313}
!313 = !DILocation(line: 113, column: 32, scope: !186)
!314 = !DILocation(line: 115, column: 2, scope: !315)
!315 = distinct !DILexicalBlock(scope: !186, file: !1, line: 115, column: 2)
!316 = !DILocation(line: 115, column: 2, scope: !317)
!317 = distinct !DILexicalBlock(scope: !315, file: !1, line: 115, column: 2)
!318 = !DILocation(line: 115, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !317, file: !1, line: 115, column: 8)
!320 = !DILocation(line: 115, column: 10, scope: !319)
!321 = !DILocation(line: 115, column: 13, scope: !319)
!322 = !DILocation(line: 115, column: 19, scope: !319)
!323 = !DILocation(line: 115, column: 24, scope: !319)
!324 = distinct !{!324, !314, !325}
!325 = !DILocation(line: 115, column: 24, scope: !315)
!326 = !DILocation(line: 117, column: 9, scope: !186)
!327 = !DILocation(line: 117, column: 2, scope: !186)
!328 = distinct !DISubprogram(name: "print_eps", scope: !1, file: !1, line: 120, type: !81, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!329 = !DILocalVariable(name: "pts", arg: 1, scope: !328, file: !1, line: 120, type: !21)
!330 = !DILocation(line: 120, column: 22, scope: !328)
!331 = !DILocalVariable(name: "len", arg: 2, scope: !328, file: !1, line: 120, type: !28)
!332 = !DILocation(line: 120, column: 31, scope: !328)
!333 = !DILocalVariable(name: "cent", arg: 3, scope: !328, file: !1, line: 120, type: !21)
!334 = !DILocation(line: 120, column: 42, scope: !328)
!335 = !DILocalVariable(name: "n_cluster", arg: 4, scope: !328, file: !1, line: 120, type: !28)
!336 = !DILocation(line: 120, column: 52, scope: !328)
!337 = !DILocalVariable(name: "i", scope: !328, file: !1, line: 124, type: !28)
!338 = !DILocation(line: 124, column: 6, scope: !328)
!339 = !DILocalVariable(name: "j", scope: !328, file: !1, line: 124, type: !28)
!340 = !DILocation(line: 124, column: 9, scope: !328)
!341 = !DILocalVariable(name: "p", scope: !328, file: !1, line: 125, type: !21)
!342 = !DILocation(line: 125, column: 8, scope: !328)
!343 = !DILocalVariable(name: "c", scope: !328, file: !1, line: 125, type: !21)
!344 = !DILocation(line: 125, column: 11, scope: !328)
!345 = !DILocalVariable(name: "min_x", scope: !328, file: !1, line: 126, type: !10)
!346 = !DILocation(line: 126, column: 9, scope: !328)
!347 = !DILocalVariable(name: "max_x", scope: !328, file: !1, line: 126, type: !10)
!348 = !DILocation(line: 126, column: 16, scope: !328)
!349 = !DILocalVariable(name: "min_y", scope: !328, file: !1, line: 126, type: !10)
!350 = !DILocation(line: 126, column: 23, scope: !328)
!351 = !DILocalVariable(name: "max_y", scope: !328, file: !1, line: 126, type: !10)
!352 = !DILocation(line: 126, column: 30, scope: !328)
!353 = !DILocalVariable(name: "scale", scope: !328, file: !1, line: 126, type: !10)
!354 = !DILocation(line: 126, column: 37, scope: !328)
!355 = !DILocalVariable(name: "cx", scope: !328, file: !1, line: 126, type: !10)
!356 = !DILocation(line: 126, column: 44, scope: !328)
!357 = !DILocalVariable(name: "cy", scope: !328, file: !1, line: 126, type: !10)
!358 = !DILocation(line: 126, column: 48, scope: !328)
!359 = !DILocalVariable(name: "colors", scope: !328, file: !1, line: 127, type: !100)
!360 = !DILocation(line: 127, column: 10, scope: !328)
!361 = !DILocation(line: 127, column: 43, scope: !328)
!362 = !DILocation(line: 127, column: 41, scope: !328)
!363 = !DILocation(line: 127, column: 53, scope: !328)
!364 = !DILocation(line: 127, column: 19, scope: !328)
!365 = !DILocation(line: 129, column: 2, scope: !366)
!366 = distinct !DILexicalBlock(scope: !328, file: !1, line: 129, column: 2)
!367 = !DILocation(line: 129, column: 2, scope: !368)
!368 = distinct !DILexicalBlock(scope: !366, file: !1, line: 129, column: 2)
!369 = !DILocation(line: 130, column: 27, scope: !370)
!370 = distinct !DILexicalBlock(scope: !368, file: !1, line: 129, column: 8)
!371 = !DILocation(line: 130, column: 29, scope: !370)
!372 = !DILocation(line: 130, column: 24, scope: !370)
!373 = !DILocation(line: 130, column: 34, scope: !370)
!374 = !DILocation(line: 130, column: 21, scope: !370)
!375 = !DILocation(line: 130, column: 39, scope: !370)
!376 = !DILocation(line: 130, column: 3, scope: !370)
!377 = !DILocation(line: 130, column: 12, scope: !370)
!378 = !DILocation(line: 130, column: 11, scope: !370)
!379 = !DILocation(line: 130, column: 14, scope: !370)
!380 = !DILocation(line: 130, column: 19, scope: !370)
!381 = !DILocation(line: 131, column: 26, scope: !370)
!382 = !DILocation(line: 131, column: 24, scope: !370)
!383 = !DILocation(line: 131, column: 28, scope: !370)
!384 = !DILocation(line: 131, column: 21, scope: !370)
!385 = !DILocation(line: 131, column: 33, scope: !370)
!386 = !DILocation(line: 131, column: 3, scope: !370)
!387 = !DILocation(line: 131, column: 12, scope: !370)
!388 = !DILocation(line: 131, column: 11, scope: !370)
!389 = !DILocation(line: 131, column: 14, scope: !370)
!390 = !DILocation(line: 131, column: 19, scope: !370)
!391 = !DILocation(line: 132, column: 26, scope: !370)
!392 = !DILocation(line: 132, column: 24, scope: !370)
!393 = !DILocation(line: 132, column: 28, scope: !370)
!394 = !DILocation(line: 132, column: 21, scope: !370)
!395 = !DILocation(line: 132, column: 33, scope: !370)
!396 = !DILocation(line: 132, column: 3, scope: !370)
!397 = !DILocation(line: 132, column: 12, scope: !370)
!398 = !DILocation(line: 132, column: 11, scope: !370)
!399 = !DILocation(line: 132, column: 14, scope: !370)
!400 = !DILocation(line: 132, column: 19, scope: !370)
!401 = !DILocation(line: 133, column: 2, scope: !370)
!402 = distinct !{!402, !365, !403}
!403 = !DILocation(line: 133, column: 2, scope: !366)
!404 = !DILocation(line: 135, column: 34, scope: !328)
!405 = !DILocation(line: 135, column: 26, scope: !328)
!406 = !DILocation(line: 135, column: 16, scope: !328)
!407 = !DILocation(line: 135, column: 8, scope: !328)
!408 = !DILocation(line: 136, column: 2, scope: !409)
!409 = distinct !DILexicalBlock(scope: !328, file: !1, line: 136, column: 2)
!410 = !DILocation(line: 136, column: 2, scope: !411)
!411 = distinct !DILexicalBlock(scope: !409, file: !1, line: 136, column: 2)
!412 = !DILocation(line: 137, column: 7, scope: !413)
!413 = distinct !DILexicalBlock(scope: !414, file: !1, line: 137, column: 7)
!414 = distinct !DILexicalBlock(scope: !411, file: !1, line: 136, column: 10)
!415 = !DILocation(line: 137, column: 15, scope: !413)
!416 = !DILocation(line: 137, column: 18, scope: !413)
!417 = !DILocation(line: 137, column: 13, scope: !413)
!418 = !DILocation(line: 137, column: 7, scope: !414)
!419 = !DILocation(line: 137, column: 29, scope: !413)
!420 = !DILocation(line: 137, column: 32, scope: !413)
!421 = !DILocation(line: 137, column: 27, scope: !413)
!422 = !DILocation(line: 137, column: 21, scope: !413)
!423 = !DILocation(line: 138, column: 7, scope: !424)
!424 = distinct !DILexicalBlock(scope: !414, file: !1, line: 138, column: 7)
!425 = !DILocation(line: 138, column: 15, scope: !424)
!426 = !DILocation(line: 138, column: 18, scope: !424)
!427 = !DILocation(line: 138, column: 13, scope: !424)
!428 = !DILocation(line: 138, column: 7, scope: !414)
!429 = !DILocation(line: 138, column: 29, scope: !424)
!430 = !DILocation(line: 138, column: 32, scope: !424)
!431 = !DILocation(line: 138, column: 27, scope: !424)
!432 = !DILocation(line: 138, column: 21, scope: !424)
!433 = !DILocation(line: 139, column: 7, scope: !434)
!434 = distinct !DILexicalBlock(scope: !414, file: !1, line: 139, column: 7)
!435 = !DILocation(line: 139, column: 15, scope: !434)
!436 = !DILocation(line: 139, column: 18, scope: !434)
!437 = !DILocation(line: 139, column: 13, scope: !434)
!438 = !DILocation(line: 139, column: 7, scope: !414)
!439 = !DILocation(line: 139, column: 29, scope: !434)
!440 = !DILocation(line: 139, column: 32, scope: !434)
!441 = !DILocation(line: 139, column: 27, scope: !434)
!442 = !DILocation(line: 139, column: 21, scope: !434)
!443 = !DILocation(line: 140, column: 7, scope: !444)
!444 = distinct !DILexicalBlock(scope: !414, file: !1, line: 140, column: 7)
!445 = !DILocation(line: 140, column: 15, scope: !444)
!446 = !DILocation(line: 140, column: 18, scope: !444)
!447 = !DILocation(line: 140, column: 13, scope: !444)
!448 = !DILocation(line: 140, column: 7, scope: !414)
!449 = !DILocation(line: 140, column: 29, scope: !444)
!450 = !DILocation(line: 140, column: 32, scope: !444)
!451 = !DILocation(line: 140, column: 27, scope: !444)
!452 = !DILocation(line: 140, column: 21, scope: !444)
!453 = !DILocation(line: 141, column: 2, scope: !414)
!454 = distinct !{!454, !408, !455}
!455 = !DILocation(line: 141, column: 2, scope: !409)
!456 = !DILocation(line: 142, column: 15, scope: !328)
!457 = !DILocation(line: 142, column: 23, scope: !328)
!458 = !DILocation(line: 142, column: 21, scope: !328)
!459 = !DILocation(line: 142, column: 12, scope: !328)
!460 = !DILocation(line: 142, column: 8, scope: !328)
!461 = !DILocation(line: 143, column: 6, scope: !462)
!462 = distinct !DILexicalBlock(scope: !328, file: !1, line: 143, column: 6)
!463 = !DILocation(line: 143, column: 19, scope: !462)
!464 = !DILocation(line: 143, column: 27, scope: !462)
!465 = !DILocation(line: 143, column: 25, scope: !462)
!466 = !DILocation(line: 143, column: 16, scope: !462)
!467 = !DILocation(line: 143, column: 12, scope: !462)
!468 = !DILocation(line: 143, column: 6, scope: !328)
!469 = !DILocation(line: 143, column: 48, scope: !462)
!470 = !DILocation(line: 143, column: 56, scope: !462)
!471 = !DILocation(line: 143, column: 54, scope: !462)
!472 = !DILocation(line: 143, column: 45, scope: !462)
!473 = !DILocation(line: 143, column: 41, scope: !462)
!474 = !DILocation(line: 143, column: 35, scope: !462)
!475 = !DILocation(line: 144, column: 8, scope: !328)
!476 = !DILocation(line: 144, column: 16, scope: !328)
!477 = !DILocation(line: 144, column: 14, scope: !328)
!478 = !DILocation(line: 144, column: 23, scope: !328)
!479 = !DILocation(line: 144, column: 5, scope: !328)
!480 = !DILocation(line: 145, column: 8, scope: !328)
!481 = !DILocation(line: 145, column: 16, scope: !328)
!482 = !DILocation(line: 145, column: 14, scope: !328)
!483 = !DILocation(line: 145, column: 23, scope: !328)
!484 = !DILocation(line: 145, column: 5, scope: !328)
!485 = !DILocation(line: 147, column: 2, scope: !328)
!486 = !DILocation(line: 148, column: 2, scope: !328)
!487 = !DILocation(line: 154, column: 2, scope: !488)
!488 = distinct !DILexicalBlock(scope: !328, file: !1, line: 154, column: 2)
!489 = !DILocation(line: 154, column: 2, scope: !490)
!490 = distinct !DILexicalBlock(scope: !488, file: !1, line: 154, column: 2)
!491 = !DILocation(line: 156, column: 4, scope: !492)
!492 = distinct !DILexicalBlock(scope: !490, file: !1, line: 154, column: 8)
!493 = !DILocation(line: 156, column: 13, scope: !492)
!494 = !DILocation(line: 156, column: 12, scope: !492)
!495 = !DILocation(line: 156, column: 17, scope: !492)
!496 = !DILocation(line: 156, column: 26, scope: !492)
!497 = !DILocation(line: 156, column: 25, scope: !492)
!498 = !DILocation(line: 156, column: 28, scope: !492)
!499 = !DILocation(line: 156, column: 34, scope: !492)
!500 = !DILocation(line: 156, column: 43, scope: !492)
!501 = !DILocation(line: 156, column: 42, scope: !492)
!502 = !DILocation(line: 156, column: 45, scope: !492)
!503 = !DILocation(line: 155, column: 3, scope: !492)
!504 = !DILocation(line: 157, column: 3, scope: !505)
!505 = distinct !DILexicalBlock(scope: !492, file: !1, line: 157, column: 3)
!506 = !DILocation(line: 157, column: 3, scope: !507)
!507 = distinct !DILexicalBlock(scope: !505, file: !1, line: 157, column: 3)
!508 = !DILocation(line: 158, column: 8, scope: !509)
!509 = distinct !DILexicalBlock(scope: !510, file: !1, line: 158, column: 8)
!510 = distinct !DILexicalBlock(scope: !507, file: !1, line: 157, column: 11)
!511 = !DILocation(line: 158, column: 11, scope: !509)
!512 = !DILocation(line: 158, column: 20, scope: !509)
!513 = !DILocation(line: 158, column: 17, scope: !509)
!514 = !DILocation(line: 158, column: 8, scope: !510)
!515 = !DILocation(line: 158, column: 23, scope: !509)
!516 = !DILocation(line: 160, column: 6, scope: !510)
!517 = !DILocation(line: 160, column: 9, scope: !510)
!518 = !DILocation(line: 160, column: 13, scope: !510)
!519 = !DILocation(line: 160, column: 11, scope: !510)
!520 = !DILocation(line: 160, column: 19, scope: !510)
!521 = !DILocation(line: 160, column: 17, scope: !510)
!522 = !DILocation(line: 160, column: 25, scope: !510)
!523 = !DILocation(line: 161, column: 6, scope: !510)
!524 = !DILocation(line: 161, column: 9, scope: !510)
!525 = !DILocation(line: 161, column: 13, scope: !510)
!526 = !DILocation(line: 161, column: 11, scope: !510)
!527 = !DILocation(line: 161, column: 19, scope: !510)
!528 = !DILocation(line: 161, column: 17, scope: !510)
!529 = !DILocation(line: 161, column: 25, scope: !510)
!530 = !DILocation(line: 159, column: 4, scope: !510)
!531 = !DILocation(line: 162, column: 3, scope: !510)
!532 = distinct !{!532, !504, !533}
!533 = !DILocation(line: 162, column: 3, scope: !505)
!534 = !DILocation(line: 164, column: 5, scope: !492)
!535 = !DILocation(line: 164, column: 8, scope: !492)
!536 = !DILocation(line: 164, column: 12, scope: !492)
!537 = !DILocation(line: 164, column: 10, scope: !492)
!538 = !DILocation(line: 164, column: 18, scope: !492)
!539 = !DILocation(line: 164, column: 16, scope: !492)
!540 = !DILocation(line: 164, column: 24, scope: !492)
!541 = !DILocation(line: 165, column: 5, scope: !492)
!542 = !DILocation(line: 165, column: 8, scope: !492)
!543 = !DILocation(line: 165, column: 12, scope: !492)
!544 = !DILocation(line: 165, column: 10, scope: !492)
!545 = !DILocation(line: 165, column: 18, scope: !492)
!546 = !DILocation(line: 165, column: 16, scope: !492)
!547 = !DILocation(line: 165, column: 24, scope: !492)
!548 = !DILocation(line: 163, column: 3, scope: !492)
!549 = !DILocation(line: 166, column: 2, scope: !492)
!550 = distinct !{!550, !487, !551}
!551 = !DILocation(line: 166, column: 2, scope: !488)
!552 = !DILocation(line: 167, column: 2, scope: !328)
!553 = !DILocation(line: 168, column: 7, scope: !328)
!554 = !DILocation(line: 168, column: 2, scope: !328)
!555 = !DILocation(line: 171, column: 1, scope: !328)
!556 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 175, type: !557, scopeLine: 176, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!557 = !DISubroutineType(types: !558)
!558 = !{!28}
!559 = !DILocalVariable(name: "i", scope: !556, file: !1, line: 177, type: !28)
!560 = !DILocation(line: 177, column: 6, scope: !556)
!561 = !DILocalVariable(name: "v", scope: !556, file: !1, line: 178, type: !21)
!562 = !DILocation(line: 178, column: 8, scope: !556)
!563 = !DILocation(line: 178, column: 12, scope: !556)
!564 = !DILocalVariable(name: "c", scope: !556, file: !1, line: 179, type: !21)
!565 = !DILocation(line: 179, column: 8, scope: !556)
!566 = !DILocation(line: 179, column: 18, scope: !556)
!567 = !DILocation(line: 179, column: 12, scope: !556)
!568 = !DILocation(line: 180, column: 12, scope: !556)
!569 = !DILocation(line: 180, column: 20, scope: !556)
!570 = !DILocation(line: 180, column: 2, scope: !556)
!571 = !DILocation(line: 182, column: 2, scope: !556)
