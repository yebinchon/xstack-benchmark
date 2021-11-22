; ModuleID = 'death-star.c'
source_filename = "death-star.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sphere_t = type { double, double, double, double }

@.str = private unnamed_addr constant [11 x i8] c".:!*oe&#%@\00", align 1
@shades = dso_local global i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@light = dso_local global [3 x double] [double -5.000000e+01, double 0.000000e+00, double 5.000000e+01], align 16, !dbg !6
@pos = dso_local global %struct.sphere_t { double 2.000000e+01, double 2.000000e+01, double 0.000000e+00, double 2.000000e+01 }, align 8, !dbg !12
@neg = dso_local global %struct.sphere_t { double 1.000000e+00, double 1.000000e+00, double -6.000000e+00, double 2.000000e+01 }, align 8, !dbg !21
@.str.1 = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @normalize(double* %v) #0 !dbg !30 {
entry:
  %v.addr = alloca double*, align 8
  %len = alloca double, align 8
  store double* %v, double** %v.addr, align 8
  call void @llvm.dbg.declare(metadata double** %v.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata double* %len, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load double*, double** %v.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds double, double* %0, i64 0, !dbg !38
  %1 = load double, double* %arrayidx, align 8, !dbg !38
  %2 = load double*, double** %v.addr, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds double, double* %2, i64 0, !dbg !39
  %3 = load double, double* %arrayidx1, align 8, !dbg !39
  %mul = fmul double %1, %3, !dbg !40
  %4 = load double*, double** %v.addr, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds double, double* %4, i64 1, !dbg !41
  %5 = load double, double* %arrayidx2, align 8, !dbg !41
  %6 = load double*, double** %v.addr, align 8, !dbg !42
  %arrayidx3 = getelementptr inbounds double, double* %6, i64 1, !dbg !42
  %7 = load double, double* %arrayidx3, align 8, !dbg !42
  %mul4 = fmul double %5, %7, !dbg !43
  %add = fadd double %mul, %mul4, !dbg !44
  %8 = load double*, double** %v.addr, align 8, !dbg !45
  %arrayidx5 = getelementptr inbounds double, double* %8, i64 2, !dbg !45
  %9 = load double, double* %arrayidx5, align 8, !dbg !45
  %10 = load double*, double** %v.addr, align 8, !dbg !46
  %arrayidx6 = getelementptr inbounds double, double* %10, i64 2, !dbg !46
  %11 = load double, double* %arrayidx6, align 8, !dbg !46
  %mul7 = fmul double %9, %11, !dbg !47
  %add8 = fadd double %add, %mul7, !dbg !48
  %call = call double @sqrt(double %add8) #4, !dbg !49
  store double %call, double* %len, align 8, !dbg !37
  %12 = load double, double* %len, align 8, !dbg !50
  %13 = load double*, double** %v.addr, align 8, !dbg !51
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 0, !dbg !51
  %14 = load double, double* %arrayidx9, align 8, !dbg !52
  %div = fdiv double %14, %12, !dbg !52
  store double %div, double* %arrayidx9, align 8, !dbg !52
  %15 = load double, double* %len, align 8, !dbg !53
  %16 = load double*, double** %v.addr, align 8, !dbg !54
  %arrayidx10 = getelementptr inbounds double, double* %16, i64 1, !dbg !54
  %17 = load double, double* %arrayidx10, align 8, !dbg !55
  %div11 = fdiv double %17, %15, !dbg !55
  store double %div11, double* %arrayidx10, align 8, !dbg !55
  %18 = load double, double* %len, align 8, !dbg !56
  %19 = load double*, double** %v.addr, align 8, !dbg !57
  %arrayidx12 = getelementptr inbounds double, double* %19, i64 2, !dbg !57
  %20 = load double, double* %arrayidx12, align 8, !dbg !58
  %div13 = fdiv double %20, %18, !dbg !58
  store double %div13, double* %arrayidx12, align 8, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @dot(double* %x, double* %y) #0 !dbg !60 {
entry:
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %d = alloca double, align 8
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata double* %d, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load double*, double** %x.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds double, double* %0, i64 0, !dbg !69
  %1 = load double, double* %arrayidx, align 8, !dbg !69
  %2 = load double*, double** %y.addr, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds double, double* %2, i64 0, !dbg !70
  %3 = load double, double* %arrayidx1, align 8, !dbg !70
  %mul = fmul double %1, %3, !dbg !71
  %4 = load double*, double** %x.addr, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds double, double* %4, i64 1, !dbg !72
  %5 = load double, double* %arrayidx2, align 8, !dbg !72
  %6 = load double*, double** %y.addr, align 8, !dbg !73
  %arrayidx3 = getelementptr inbounds double, double* %6, i64 1, !dbg !73
  %7 = load double, double* %arrayidx3, align 8, !dbg !73
  %mul4 = fmul double %5, %7, !dbg !74
  %add = fadd double %mul, %mul4, !dbg !75
  %8 = load double*, double** %x.addr, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds double, double* %8, i64 2, !dbg !76
  %9 = load double, double* %arrayidx5, align 8, !dbg !76
  %10 = load double*, double** %y.addr, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds double, double* %10, i64 2, !dbg !77
  %11 = load double, double* %arrayidx6, align 8, !dbg !77
  %mul7 = fmul double %9, %11, !dbg !78
  %add8 = fadd double %add, %mul7, !dbg !79
  store double %add8, double* %d, align 8, !dbg !68
  %12 = load double, double* %d, align 8, !dbg !80
  %cmp = fcmp olt double %12, 0.000000e+00, !dbg !81
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !80

cond.true:                                        ; preds = %entry
  %13 = load double, double* %d, align 8, !dbg !82
  %fneg = fneg double %13, !dbg !83
  br label %cond.end, !dbg !80

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !80

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %fneg, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !80
  ret double %cond, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @hit_sphere(%struct.sphere_t* %sph, double %x, double %y, double* %z1, double* %z2) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %sph.addr = alloca %struct.sphere_t*, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %z1.addr = alloca double*, align 8
  %z2.addr = alloca double*, align 8
  %zsq = alloca double, align 8
  store %struct.sphere_t* %sph, %struct.sphere_t** %sph.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sphere_t** %sph.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store double* %z1, double** %z1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z1.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store double* %z2, double** %z2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z2.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata double* %zsq, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !102
  %cx = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %0, i32 0, i32 0, !dbg !103
  %1 = load double, double* %cx, align 8, !dbg !103
  %2 = load double, double* %x.addr, align 8, !dbg !104
  %sub = fsub double %2, %1, !dbg !104
  store double %sub, double* %x.addr, align 8, !dbg !104
  %3 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !105
  %cy = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %3, i32 0, i32 1, !dbg !106
  %4 = load double, double* %cy, align 8, !dbg !106
  %5 = load double, double* %y.addr, align 8, !dbg !107
  %sub1 = fsub double %5, %4, !dbg !107
  store double %sub1, double* %y.addr, align 8, !dbg !107
  %6 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !108
  %r = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %6, i32 0, i32 3, !dbg !109
  %7 = load double, double* %r, align 8, !dbg !109
  %8 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !110
  %r2 = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %8, i32 0, i32 3, !dbg !111
  %9 = load double, double* %r2, align 8, !dbg !111
  %mul = fmul double %7, %9, !dbg !112
  %10 = load double, double* %x.addr, align 8, !dbg !113
  %11 = load double, double* %x.addr, align 8, !dbg !114
  %mul3 = fmul double %10, %11, !dbg !115
  %12 = load double, double* %y.addr, align 8, !dbg !116
  %13 = load double, double* %y.addr, align 8, !dbg !117
  %mul4 = fmul double %12, %13, !dbg !118
  %add = fadd double %mul3, %mul4, !dbg !119
  %sub5 = fsub double %mul, %add, !dbg !120
  store double %sub5, double* %zsq, align 8, !dbg !121
  %14 = load double, double* %zsq, align 8, !dbg !122
  %cmp = fcmp olt double %14, 0.000000e+00, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125, !cf.info !126

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !127
  br label %return, !dbg !127

if.end:                                           ; preds = %entry
  %15 = load double, double* %zsq, align 8, !dbg !128
  %call = call double @sqrt(double %15) #4, !dbg !129
  store double %call, double* %zsq, align 8, !dbg !130
  %16 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !131
  %cz = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %16, i32 0, i32 2, !dbg !132
  %17 = load double, double* %cz, align 8, !dbg !132
  %18 = load double, double* %zsq, align 8, !dbg !133
  %sub6 = fsub double %17, %18, !dbg !134
  %19 = load double*, double** %z1.addr, align 8, !dbg !135
  store double %sub6, double* %19, align 8, !dbg !136
  %20 = load %struct.sphere_t*, %struct.sphere_t** %sph.addr, align 8, !dbg !137
  %cz7 = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %20, i32 0, i32 2, !dbg !138
  %21 = load double, double* %cz7, align 8, !dbg !138
  %22 = load double, double* %zsq, align 8, !dbg !139
  %add8 = fadd double %21, %22, !dbg !140
  %23 = load double*, double** %z2.addr, align 8, !dbg !141
  store double %add8, double* %23, align 8, !dbg !142
  store i32 1, i32* %retval, align 4, !dbg !143
  br label %return, !dbg !143

return:                                           ; preds = %if.end, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !144
  ret i32 %24, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_sphere(double %k, double %ambient) #0 !dbg !145 {
entry:
  %k.addr = alloca double, align 8
  %ambient.addr = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %intensity = alloca i32, align 4
  %hit_result = alloca i32, align 4
  %b = alloca double, align 8
  %vec = alloca [3 x double], align 16
  %x = alloca double, align 8
  %y = alloca double, align 8
  %zb1 = alloca double, align 8
  %zb2 = alloca double, align 8
  %zs1 = alloca double, align 8
  %zs2 = alloca double, align 8
  store double %k, double* %k.addr, align 8
  call void @llvm.dbg.declare(metadata double* %k.addr, metadata !148, metadata !DIExpression()), !dbg !149
  store double %ambient, double* %ambient.addr, align 8
  call void @llvm.dbg.declare(metadata double* %ambient.addr, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %j, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i32* %intensity, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32* %hit_result, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata double* %b, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [3 x double]* %vec, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata double* %x, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata double* %y, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata double* %zb1, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata double* %zb2, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata double* %zs1, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata double* %zs2, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !176
  %1 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !178
  %sub = fsub double %0, %1, !dbg !179
  %2 = call double @llvm.floor.f64(double %sub), !dbg !180
  %conv = fptosi double %2 to i32, !dbg !180
  store i32 %conv, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc71, %entry
  %3 = load i32, i32* %i, align 4, !dbg !183
  %conv1 = sitofp i32 %3 to double, !dbg !183
  %4 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !185
  %5 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !186
  %add = fadd double %4, %5, !dbg !187
  %6 = call double @llvm.ceil.f64(double %add), !dbg !188
  %cmp = fcmp ole double %conv1, %6, !dbg !189
  br i1 %cmp, label %for.body, label %for.end73, !dbg !190

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !191
  %conv3 = sitofp i32 %7 to double, !dbg !191
  %add4 = fadd double %conv3, 5.000000e-01, !dbg !193
  store double %add4, double* %y, align 8, !dbg !194
  %8 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !195
  %9 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !197
  %mul = fmul double 2.000000e+00, %9, !dbg !198
  %sub5 = fsub double %8, %mul, !dbg !199
  %10 = call double @llvm.floor.f64(double %sub5), !dbg !200
  %conv6 = fptosi double %10 to i32, !dbg !200
  store i32 %conv6, i32* %j, align 4, !dbg !201
  br label %for.cond7, !dbg !202

for.cond7:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %j, align 4, !dbg !203
  %conv8 = sitofp i32 %11 to double, !dbg !203
  %12 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !205
  %13 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !206
  %mul9 = fmul double 2.000000e+00, %13, !dbg !207
  %add10 = fadd double %12, %mul9, !dbg !208
  %14 = call double @llvm.ceil.f64(double %add10), !dbg !209
  %cmp11 = fcmp ole double %conv8, %14, !dbg !210
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !211

for.body13:                                       ; preds = %for.cond7
  %15 = load i32, i32* %j, align 4, !dbg !212
  %conv14 = sitofp i32 %15 to double, !dbg !212
  %16 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !214
  %sub15 = fsub double %conv14, %16, !dbg !215
  %div = fdiv double %sub15, 2.000000e+00, !dbg !216
  %add16 = fadd double %div, 5.000000e-01, !dbg !217
  %17 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !218
  %add17 = fadd double %add16, %17, !dbg !219
  store double %add17, double* %x, align 8, !dbg !220
  %18 = load double, double* %x, align 8, !dbg !221
  %19 = load double, double* %y, align 8, !dbg !223
  %call = call i32 @hit_sphere(%struct.sphere_t* @pos, double %18, double %19, double* %zb1, double* %zb2), !dbg !224
  %tobool = icmp ne i32 %call, 0, !dbg !224
  br i1 %tobool, label %if.else, label %if.then, !dbg !225, !cf.info !126

if.then:                                          ; preds = %for.body13
  store i32 0, i32* %hit_result, align 4, !dbg !226
  br label %if.end37, !dbg !227

if.else:                                          ; preds = %for.body13
  %20 = load double, double* %x, align 8, !dbg !228
  %21 = load double, double* %y, align 8, !dbg !230
  %call18 = call i32 @hit_sphere(%struct.sphere_t* @neg, double %20, double %21, double* %zs1, double* %zs2), !dbg !231
  %tobool19 = icmp ne i32 %call18, 0, !dbg !231
  br i1 %tobool19, label %if.else21, label %if.then20, !dbg !232, !cf.info !126

if.then20:                                        ; preds = %if.else
  store i32 1, i32* %hit_result, align 4, !dbg !233
  br label %if.end36, !dbg !234

if.else21:                                        ; preds = %if.else
  %22 = load double, double* %zs1, align 8, !dbg !235
  %23 = load double, double* %zb1, align 8, !dbg !237
  %cmp22 = fcmp ogt double %22, %23, !dbg !238
  br i1 %cmp22, label %if.then24, label %if.else25, !dbg !239, !cf.info !126

if.then24:                                        ; preds = %if.else21
  store i32 1, i32* %hit_result, align 4, !dbg !240
  br label %if.end35, !dbg !241

if.else25:                                        ; preds = %if.else21
  %24 = load double, double* %zs2, align 8, !dbg !242
  %25 = load double, double* %zb2, align 8, !dbg !244
  %cmp26 = fcmp ogt double %24, %25, !dbg !245
  br i1 %cmp26, label %if.then28, label %if.else29, !dbg !246, !cf.info !126

if.then28:                                        ; preds = %if.else25
  store i32 0, i32* %hit_result, align 4, !dbg !247
  br label %if.end34, !dbg !248

if.else29:                                        ; preds = %if.else25
  %26 = load double, double* %zs2, align 8, !dbg !249
  %27 = load double, double* %zb1, align 8, !dbg !251
  %cmp30 = fcmp ogt double %26, %27, !dbg !252
  br i1 %cmp30, label %if.then32, label %if.else33, !dbg !253, !cf.info !126

if.then32:                                        ; preds = %if.else29
  store i32 2, i32* %hit_result, align 4, !dbg !254
  br label %if.end, !dbg !255

if.else33:                                        ; preds = %if.else29
  store i32 1, i32* %hit_result, align 4, !dbg !256
  br label %if.end

if.end:                                           ; preds = %if.else33, %if.then32
  br label %if.end34

if.end34:                                         ; preds = %if.end, %if.then28
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then24
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then20
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then
  %28 = load i32, i32* %hit_result, align 4, !dbg !257
  switch i32 %28, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb39
  ], !dbg !258

sw.bb:                                            ; preds = %if.end37
  %call38 = call i32 @putchar(i32 43), !dbg !259
  br label %for.inc, !dbg !261

sw.bb39:                                          ; preds = %if.end37
  %29 = load double, double* %x, align 8, !dbg !262
  %30 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !263
  %sub40 = fsub double %29, %30, !dbg !264
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !265
  store double %sub40, double* %arrayidx, align 16, !dbg !266
  %31 = load double, double* %y, align 8, !dbg !267
  %32 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !268
  %sub41 = fsub double %31, %32, !dbg !269
  %arrayidx42 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 1, !dbg !270
  store double %sub41, double* %arrayidx42, align 8, !dbg !271
  %33 = load double, double* %zb1, align 8, !dbg !272
  %34 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 2), align 8, !dbg !273
  %sub43 = fsub double %33, %34, !dbg !274
  %arrayidx44 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 2, !dbg !275
  store double %sub43, double* %arrayidx44, align 16, !dbg !276
  br label %sw.epilog, !dbg !277

sw.default:                                       ; preds = %if.end37
  %35 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 0), align 8, !dbg !278
  %36 = load double, double* %x, align 8, !dbg !279
  %sub45 = fsub double %35, %36, !dbg !280
  %arrayidx46 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !281
  store double %sub45, double* %arrayidx46, align 16, !dbg !282
  %37 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 1), align 8, !dbg !283
  %38 = load double, double* %y, align 8, !dbg !284
  %sub47 = fsub double %37, %38, !dbg !285
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 1, !dbg !286
  store double %sub47, double* %arrayidx48, align 8, !dbg !287
  %39 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 2), align 8, !dbg !288
  %40 = load double, double* %zs2, align 8, !dbg !289
  %sub49 = fsub double %39, %40, !dbg !290
  %arrayidx50 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 2, !dbg !291
  store double %sub49, double* %arrayidx50, align 16, !dbg !292
  br label %sw.epilog, !dbg !293

sw.epilog:                                        ; preds = %sw.default, %sw.bb39
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !294
  call void @normalize(double* %arraydecay), !dbg !295
  %arraydecay51 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !296
  %call52 = call double @dot(double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0), double* %arraydecay51), !dbg !297
  %41 = load double, double* %k.addr, align 8, !dbg !298
  %call53 = call double @pow(double %call52, double %41) #4, !dbg !299
  %42 = load double, double* %ambient.addr, align 8, !dbg !300
  %add54 = fadd double %call53, %42, !dbg !301
  store double %add54, double* %b, align 8, !dbg !302
  %43 = load double, double* %b, align 8, !dbg !303
  %sub55 = fsub double 1.000000e+00, %43, !dbg !304
  %mul56 = fmul double %sub55, 7.000000e+00, !dbg !305
  %conv57 = fptosi double %mul56 to i32, !dbg !306
  store i32 %conv57, i32* %intensity, align 4, !dbg !307
  %44 = load i32, i32* %intensity, align 4, !dbg !308
  %cmp58 = icmp slt i32 %44, 0, !dbg !310
  br i1 %cmp58, label %if.then60, label %if.end61, !dbg !311, !cf.info !126

if.then60:                                        ; preds = %sw.epilog
  store i32 0, i32* %intensity, align 4, !dbg !312
  br label %if.end61, !dbg !313

if.end61:                                         ; preds = %if.then60, %sw.epilog
  %45 = load i32, i32* %intensity, align 4, !dbg !314
  %conv62 = sext i32 %45 to i64, !dbg !314
  %cmp63 = icmp uge i64 %conv62, 7, !dbg !316
  br i1 %cmp63, label %if.then65, label %if.end66, !dbg !317, !cf.info !126

if.then65:                                        ; preds = %if.end61
  store i32 6, i32* %intensity, align 4, !dbg !318
  br label %if.end66, !dbg !319

if.end66:                                         ; preds = %if.then65, %if.end61
  %46 = load i8*, i8** @shades, align 8, !dbg !320
  %47 = load i32, i32* %intensity, align 4, !dbg !321
  %idxprom = sext i32 %47 to i64, !dbg !320
  %arrayidx67 = getelementptr inbounds i8, i8* %46, i64 %idxprom, !dbg !320
  %48 = load i8, i8* %arrayidx67, align 1, !dbg !320
  %conv68 = sext i8 %48 to i32, !dbg !320
  %call69 = call i32 @putchar(i32 %conv68), !dbg !322
  br label %for.inc, !dbg !323

for.inc:                                          ; preds = %if.end66, %sw.bb
  %49 = load i32, i32* %j, align 4, !dbg !324
  %inc = add nsw i32 %49, 1, !dbg !324
  store i32 %inc, i32* %j, align 4, !dbg !324
  br label %for.cond7, !dbg !325, !llvm.loop !326

for.end:                                          ; preds = %for.cond7
  %call70 = call i32 @putchar(i32 10), !dbg !328
  br label %for.inc71, !dbg !329

for.inc71:                                        ; preds = %for.end
  %50 = load i32, i32* %i, align 4, !dbg !330
  %inc72 = add nsw i32 %50, 1, !dbg !330
  store i32 %inc72, i32* %i, align 4, !dbg !330
  br label %for.cond, !dbg !331, !llvm.loop !332

for.end73:                                        ; preds = %for.cond
  ret void, !dbg !334
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

declare dso_local i32 @putchar(i32) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !335 {
entry:
  %retval = alloca i32, align 4
  %ang = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %ang, metadata !338, metadata !DIExpression()), !dbg !339
  store double 0.000000e+00, double* %ang, align 8, !dbg !339
  br label %while.body, !dbg !340

while.body:                                       ; preds = %entry, %while.body
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !341
  %0 = load double, double* %ang, align 8, !dbg !343
  %mul = fmul double %0, 2.000000e+00, !dbg !344
  %call1 = call double @cos(double %mul) #4, !dbg !345
  store double %call1, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 1), align 8, !dbg !346
  %1 = load double, double* %ang, align 8, !dbg !347
  %call2 = call double @cos(double %1) #4, !dbg !348
  store double %call2, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 2), align 16, !dbg !349
  %2 = load double, double* %ang, align 8, !dbg !350
  %call3 = call double @sin(double %2) #4, !dbg !351
  store double %call3, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0), align 16, !dbg !352
  call void @normalize(double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0)), !dbg !353
  %3 = load double, double* %ang, align 8, !dbg !354
  %add = fadd double %3, 5.000000e-02, !dbg !354
  store double %add, double* %ang, align 8, !dbg !354
  call void @draw_sphere(double 2.000000e+00, double 3.000000e-01), !dbg !355
  %call4 = call i32 @usleep(i32 100000), !dbg !356
  br label %while.body, !dbg !340, !llvm.loop !357
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

declare dso_local i32 @usleep(i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "shades", scope: !2, file: !3, line: 5, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "death-star.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Death-Star")
!4 = !{}
!5 = !{!0, !6, !12, !21}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "light", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, elements: !10)
!9 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "pos", scope: !2, file: !3, line: 23, type: !14, isLocal: false, isDefinition: true)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "sphere_t", file: !3, line: 20, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 20, size: 256, elements: !16)
!16 = !{!17, !18, !19, !20}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "cx", scope: !15, file: !3, line: 20, baseType: !9, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "cy", scope: !15, file: !3, line: 20, baseType: !9, size: 64, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "cz", scope: !15, file: !3, line: 20, baseType: !9, size: 64, offset: 128)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !15, file: !3, line: 20, baseType: !9, size: 64, offset: 192)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "neg", scope: !2, file: !3, line: 23, type: !14, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!30 = distinct !DISubprogram(name: "normalize", scope: !3, file: !3, line: 8, type: !31, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!34 = !DILocalVariable(name: "v", arg: 1, scope: !30, file: !3, line: 8, type: !33)
!35 = !DILocation(line: 8, column: 25, scope: !30)
!36 = !DILocalVariable(name: "len", scope: !30, file: !3, line: 10, type: !9)
!37 = !DILocation(line: 10, column: 9, scope: !30)
!38 = !DILocation(line: 10, column: 20, scope: !30)
!39 = !DILocation(line: 10, column: 25, scope: !30)
!40 = !DILocation(line: 10, column: 24, scope: !30)
!41 = !DILocation(line: 10, column: 32, scope: !30)
!42 = !DILocation(line: 10, column: 37, scope: !30)
!43 = !DILocation(line: 10, column: 36, scope: !30)
!44 = !DILocation(line: 10, column: 30, scope: !30)
!45 = !DILocation(line: 10, column: 44, scope: !30)
!46 = !DILocation(line: 10, column: 49, scope: !30)
!47 = !DILocation(line: 10, column: 48, scope: !30)
!48 = !DILocation(line: 10, column: 42, scope: !30)
!49 = !DILocation(line: 10, column: 15, scope: !30)
!50 = !DILocation(line: 11, column: 10, scope: !30)
!51 = !DILocation(line: 11, column: 2, scope: !30)
!52 = !DILocation(line: 11, column: 7, scope: !30)
!53 = !DILocation(line: 11, column: 23, scope: !30)
!54 = !DILocation(line: 11, column: 15, scope: !30)
!55 = !DILocation(line: 11, column: 20, scope: !30)
!56 = !DILocation(line: 11, column: 36, scope: !30)
!57 = !DILocation(line: 11, column: 28, scope: !30)
!58 = !DILocation(line: 11, column: 33, scope: !30)
!59 = !DILocation(line: 12, column: 1, scope: !30)
!60 = distinct !DISubprogram(name: "dot", scope: !3, file: !3, line: 14, type: !61, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !33, !33}
!63 = !DILocalVariable(name: "x", arg: 1, scope: !60, file: !3, line: 14, type: !33)
!64 = !DILocation(line: 14, column: 20, scope: !60)
!65 = !DILocalVariable(name: "y", arg: 2, scope: !60, file: !3, line: 14, type: !33)
!66 = !DILocation(line: 14, column: 31, scope: !60)
!67 = !DILocalVariable(name: "d", scope: !60, file: !3, line: 16, type: !9)
!68 = !DILocation(line: 16, column: 9, scope: !60)
!69 = !DILocation(line: 16, column: 13, scope: !60)
!70 = !DILocation(line: 16, column: 18, scope: !60)
!71 = !DILocation(line: 16, column: 17, scope: !60)
!72 = !DILocation(line: 16, column: 25, scope: !60)
!73 = !DILocation(line: 16, column: 30, scope: !60)
!74 = !DILocation(line: 16, column: 29, scope: !60)
!75 = !DILocation(line: 16, column: 23, scope: !60)
!76 = !DILocation(line: 16, column: 37, scope: !60)
!77 = !DILocation(line: 16, column: 42, scope: !60)
!78 = !DILocation(line: 16, column: 41, scope: !60)
!79 = !DILocation(line: 16, column: 35, scope: !60)
!80 = !DILocation(line: 17, column: 9, scope: !60)
!81 = !DILocation(line: 17, column: 11, scope: !60)
!82 = !DILocation(line: 17, column: 18, scope: !60)
!83 = !DILocation(line: 17, column: 17, scope: !60)
!84 = !DILocation(line: 17, column: 2, scope: !60)
!85 = distinct !DISubprogram(name: "hit_sphere", scope: !3, file: !3, line: 27, type: !86, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !89, !9, !9, !33, !33}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!90 = !DILocalVariable(name: "sph", arg: 1, scope: !85, file: !3, line: 27, type: !89)
!91 = !DILocation(line: 27, column: 26, scope: !85)
!92 = !DILocalVariable(name: "x", arg: 2, scope: !85, file: !3, line: 27, type: !9)
!93 = !DILocation(line: 27, column: 38, scope: !85)
!94 = !DILocalVariable(name: "y", arg: 3, scope: !85, file: !3, line: 27, type: !9)
!95 = !DILocation(line: 27, column: 48, scope: !85)
!96 = !DILocalVariable(name: "z1", arg: 4, scope: !85, file: !3, line: 27, type: !33)
!97 = !DILocation(line: 27, column: 59, scope: !85)
!98 = !DILocalVariable(name: "z2", arg: 5, scope: !85, file: !3, line: 27, type: !33)
!99 = !DILocation(line: 27, column: 71, scope: !85)
!100 = !DILocalVariable(name: "zsq", scope: !85, file: !3, line: 29, type: !9)
!101 = !DILocation(line: 29, column: 9, scope: !85)
!102 = !DILocation(line: 30, column: 7, scope: !85)
!103 = !DILocation(line: 30, column: 12, scope: !85)
!104 = !DILocation(line: 30, column: 4, scope: !85)
!105 = !DILocation(line: 31, column: 7, scope: !85)
!106 = !DILocation(line: 31, column: 12, scope: !85)
!107 = !DILocation(line: 31, column: 4, scope: !85)
!108 = !DILocation(line: 32, column: 8, scope: !85)
!109 = !DILocation(line: 32, column: 13, scope: !85)
!110 = !DILocation(line: 32, column: 17, scope: !85)
!111 = !DILocation(line: 32, column: 22, scope: !85)
!112 = !DILocation(line: 32, column: 15, scope: !85)
!113 = !DILocation(line: 32, column: 27, scope: !85)
!114 = !DILocation(line: 32, column: 31, scope: !85)
!115 = !DILocation(line: 32, column: 29, scope: !85)
!116 = !DILocation(line: 32, column: 35, scope: !85)
!117 = !DILocation(line: 32, column: 39, scope: !85)
!118 = !DILocation(line: 32, column: 37, scope: !85)
!119 = !DILocation(line: 32, column: 33, scope: !85)
!120 = !DILocation(line: 32, column: 24, scope: !85)
!121 = !DILocation(line: 32, column: 6, scope: !85)
!122 = !DILocation(line: 33, column: 6, scope: !123)
!123 = distinct !DILexicalBlock(scope: !85, file: !3, line: 33, column: 6)
!124 = !DILocation(line: 33, column: 10, scope: !123)
!125 = !DILocation(line: 33, column: 6, scope: !85)
!126 = !{!"if"}
!127 = !DILocation(line: 33, column: 15, scope: !123)
!128 = !DILocation(line: 34, column: 13, scope: !85)
!129 = !DILocation(line: 34, column: 8, scope: !85)
!130 = !DILocation(line: 34, column: 6, scope: !85)
!131 = !DILocation(line: 35, column: 8, scope: !85)
!132 = !DILocation(line: 35, column: 13, scope: !85)
!133 = !DILocation(line: 35, column: 18, scope: !85)
!134 = !DILocation(line: 35, column: 16, scope: !85)
!135 = !DILocation(line: 35, column: 3, scope: !85)
!136 = !DILocation(line: 35, column: 6, scope: !85)
!137 = !DILocation(line: 36, column: 8, scope: !85)
!138 = !DILocation(line: 36, column: 13, scope: !85)
!139 = !DILocation(line: 36, column: 18, scope: !85)
!140 = !DILocation(line: 36, column: 16, scope: !85)
!141 = !DILocation(line: 36, column: 3, scope: !85)
!142 = !DILocation(line: 36, column: 6, scope: !85)
!143 = !DILocation(line: 37, column: 2, scope: !85)
!144 = !DILocation(line: 38, column: 1, scope: !85)
!145 = distinct !DISubprogram(name: "draw_sphere", scope: !3, file: !3, line: 40, type: !146, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !9, !9}
!148 = !DILocalVariable(name: "k", arg: 1, scope: !145, file: !3, line: 40, type: !9)
!149 = !DILocation(line: 40, column: 25, scope: !145)
!150 = !DILocalVariable(name: "ambient", arg: 2, scope: !145, file: !3, line: 40, type: !9)
!151 = !DILocation(line: 40, column: 35, scope: !145)
!152 = !DILocalVariable(name: "i", scope: !145, file: !3, line: 42, type: !88)
!153 = !DILocation(line: 42, column: 6, scope: !145)
!154 = !DILocalVariable(name: "j", scope: !145, file: !3, line: 42, type: !88)
!155 = !DILocation(line: 42, column: 9, scope: !145)
!156 = !DILocalVariable(name: "intensity", scope: !145, file: !3, line: 42, type: !88)
!157 = !DILocation(line: 42, column: 12, scope: !145)
!158 = !DILocalVariable(name: "hit_result", scope: !145, file: !3, line: 42, type: !88)
!159 = !DILocation(line: 42, column: 23, scope: !145)
!160 = !DILocalVariable(name: "b", scope: !145, file: !3, line: 43, type: !9)
!161 = !DILocation(line: 43, column: 9, scope: !145)
!162 = !DILocalVariable(name: "vec", scope: !145, file: !3, line: 44, type: !8)
!163 = !DILocation(line: 44, column: 9, scope: !145)
!164 = !DILocalVariable(name: "x", scope: !145, file: !3, line: 44, type: !9)
!165 = !DILocation(line: 44, column: 17, scope: !145)
!166 = !DILocalVariable(name: "y", scope: !145, file: !3, line: 44, type: !9)
!167 = !DILocation(line: 44, column: 20, scope: !145)
!168 = !DILocalVariable(name: "zb1", scope: !145, file: !3, line: 44, type: !9)
!169 = !DILocation(line: 44, column: 23, scope: !145)
!170 = !DILocalVariable(name: "zb2", scope: !145, file: !3, line: 44, type: !9)
!171 = !DILocation(line: 44, column: 28, scope: !145)
!172 = !DILocalVariable(name: "zs1", scope: !145, file: !3, line: 44, type: !9)
!173 = !DILocation(line: 44, column: 33, scope: !145)
!174 = !DILocalVariable(name: "zs2", scope: !145, file: !3, line: 44, type: !9)
!175 = !DILocation(line: 44, column: 38, scope: !145)
!176 = !DILocation(line: 45, column: 21, scope: !177)
!177 = distinct !DILexicalBlock(scope: !145, file: !3, line: 45, column: 2)
!178 = !DILocation(line: 45, column: 30, scope: !177)
!179 = !DILocation(line: 45, column: 24, scope: !177)
!180 = !DILocation(line: 45, column: 11, scope: !177)
!181 = !DILocation(line: 45, column: 9, scope: !177)
!182 = !DILocation(line: 45, column: 7, scope: !177)
!183 = !DILocation(line: 45, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !3, line: 45, column: 2)
!185 = !DILocation(line: 45, column: 48, scope: !184)
!186 = !DILocation(line: 45, column: 57, scope: !184)
!187 = !DILocation(line: 45, column: 51, scope: !184)
!188 = !DILocation(line: 45, column: 39, scope: !184)
!189 = !DILocation(line: 45, column: 36, scope: !184)
!190 = !DILocation(line: 45, column: 2, scope: !177)
!191 = !DILocation(line: 46, column: 7, scope: !192)
!192 = distinct !DILexicalBlock(scope: !184, file: !3, line: 45, column: 66)
!193 = !DILocation(line: 46, column: 9, scope: !192)
!194 = !DILocation(line: 46, column: 5, scope: !192)
!195 = !DILocation(line: 47, column: 22, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 47, column: 3)
!197 = !DILocation(line: 47, column: 35, scope: !196)
!198 = !DILocation(line: 47, column: 29, scope: !196)
!199 = !DILocation(line: 47, column: 25, scope: !196)
!200 = !DILocation(line: 47, column: 12, scope: !196)
!201 = !DILocation(line: 47, column: 10, scope: !196)
!202 = !DILocation(line: 47, column: 8, scope: !196)
!203 = !DILocation(line: 47, column: 39, scope: !204)
!204 = distinct !DILexicalBlock(scope: !196, file: !3, line: 47, column: 3)
!205 = !DILocation(line: 47, column: 53, scope: !204)
!206 = !DILocation(line: 47, column: 66, scope: !204)
!207 = !DILocation(line: 47, column: 60, scope: !204)
!208 = !DILocation(line: 47, column: 56, scope: !204)
!209 = !DILocation(line: 47, column: 44, scope: !204)
!210 = !DILocation(line: 47, column: 41, scope: !204)
!211 = !DILocation(line: 47, column: 3, scope: !196)
!212 = !DILocation(line: 48, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !204, file: !3, line: 47, column: 75)
!214 = !DILocation(line: 48, column: 17, scope: !213)
!215 = !DILocation(line: 48, column: 11, scope: !213)
!216 = !DILocation(line: 48, column: 21, scope: !213)
!217 = !DILocation(line: 48, column: 26, scope: !213)
!218 = !DILocation(line: 48, column: 37, scope: !213)
!219 = !DILocation(line: 48, column: 31, scope: !213)
!220 = !DILocation(line: 48, column: 6, scope: !213)
!221 = !DILocation(line: 51, column: 26, scope: !222)
!222 = distinct !DILexicalBlock(scope: !213, file: !3, line: 51, column: 8)
!223 = !DILocation(line: 51, column: 29, scope: !222)
!224 = !DILocation(line: 51, column: 9, scope: !222)
!225 = !DILocation(line: 51, column: 8, scope: !213)
!226 = !DILocation(line: 52, column: 16, scope: !222)
!227 = !DILocation(line: 52, column: 5, scope: !222)
!228 = !DILocation(line: 55, column: 31, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !3, line: 55, column: 13)
!230 = !DILocation(line: 55, column: 34, scope: !229)
!231 = !DILocation(line: 55, column: 14, scope: !229)
!232 = !DILocation(line: 55, column: 13, scope: !222)
!233 = !DILocation(line: 56, column: 16, scope: !229)
!234 = !DILocation(line: 56, column: 5, scope: !229)
!235 = !DILocation(line: 59, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !3, line: 59, column: 13)
!237 = !DILocation(line: 59, column: 19, scope: !236)
!238 = !DILocation(line: 59, column: 17, scope: !236)
!239 = !DILocation(line: 59, column: 13, scope: !229)
!240 = !DILocation(line: 59, column: 35, scope: !236)
!241 = !DILocation(line: 59, column: 24, scope: !236)
!242 = !DILocation(line: 62, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !236, file: !3, line: 62, column: 13)
!244 = !DILocation(line: 62, column: 19, scope: !243)
!245 = !DILocation(line: 62, column: 17, scope: !243)
!246 = !DILocation(line: 62, column: 13, scope: !236)
!247 = !DILocation(line: 62, column: 35, scope: !243)
!248 = !DILocation(line: 62, column: 24, scope: !243)
!249 = !DILocation(line: 66, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !243, file: !3, line: 66, column: 13)
!251 = !DILocation(line: 66, column: 19, scope: !250)
!252 = !DILocation(line: 66, column: 17, scope: !250)
!253 = !DILocation(line: 66, column: 13, scope: !243)
!254 = !DILocation(line: 66, column: 35, scope: !250)
!255 = !DILocation(line: 66, column: 24, scope: !250)
!256 = !DILocation(line: 67, column: 25, scope: !250)
!257 = !DILocation(line: 69, column: 11, scope: !213)
!258 = !DILocation(line: 69, column: 4, scope: !213)
!259 = !DILocation(line: 71, column: 5, scope: !260)
!260 = distinct !DILexicalBlock(scope: !213, file: !3, line: 69, column: 23)
!261 = !DILocation(line: 72, column: 5, scope: !260)
!262 = !DILocation(line: 74, column: 14, scope: !260)
!263 = !DILocation(line: 74, column: 22, scope: !260)
!264 = !DILocation(line: 74, column: 16, scope: !260)
!265 = !DILocation(line: 74, column: 5, scope: !260)
!266 = !DILocation(line: 74, column: 12, scope: !260)
!267 = !DILocation(line: 75, column: 14, scope: !260)
!268 = !DILocation(line: 75, column: 22, scope: !260)
!269 = !DILocation(line: 75, column: 16, scope: !260)
!270 = !DILocation(line: 75, column: 5, scope: !260)
!271 = !DILocation(line: 75, column: 12, scope: !260)
!272 = !DILocation(line: 76, column: 14, scope: !260)
!273 = !DILocation(line: 76, column: 24, scope: !260)
!274 = !DILocation(line: 76, column: 18, scope: !260)
!275 = !DILocation(line: 76, column: 5, scope: !260)
!276 = !DILocation(line: 76, column: 12, scope: !260)
!277 = !DILocation(line: 77, column: 5, scope: !260)
!278 = !DILocation(line: 79, column: 18, scope: !260)
!279 = !DILocation(line: 79, column: 23, scope: !260)
!280 = !DILocation(line: 79, column: 21, scope: !260)
!281 = !DILocation(line: 79, column: 5, scope: !260)
!282 = !DILocation(line: 79, column: 12, scope: !260)
!283 = !DILocation(line: 80, column: 18, scope: !260)
!284 = !DILocation(line: 80, column: 23, scope: !260)
!285 = !DILocation(line: 80, column: 21, scope: !260)
!286 = !DILocation(line: 80, column: 5, scope: !260)
!287 = !DILocation(line: 80, column: 12, scope: !260)
!288 = !DILocation(line: 81, column: 18, scope: !260)
!289 = !DILocation(line: 81, column: 23, scope: !260)
!290 = !DILocation(line: 81, column: 21, scope: !260)
!291 = !DILocation(line: 81, column: 5, scope: !260)
!292 = !DILocation(line: 81, column: 12, scope: !260)
!293 = !DILocation(line: 82, column: 4, scope: !260)
!294 = !DILocation(line: 84, column: 14, scope: !213)
!295 = !DILocation(line: 84, column: 4, scope: !213)
!296 = !DILocation(line: 85, column: 23, scope: !213)
!297 = !DILocation(line: 85, column: 12, scope: !213)
!298 = !DILocation(line: 85, column: 29, scope: !213)
!299 = !DILocation(line: 85, column: 8, scope: !213)
!300 = !DILocation(line: 85, column: 34, scope: !213)
!301 = !DILocation(line: 85, column: 32, scope: !213)
!302 = !DILocation(line: 85, column: 6, scope: !213)
!303 = !DILocation(line: 86, column: 21, scope: !213)
!304 = !DILocation(line: 86, column: 19, scope: !213)
!305 = !DILocation(line: 86, column: 24, scope: !213)
!306 = !DILocation(line: 86, column: 16, scope: !213)
!307 = !DILocation(line: 86, column: 14, scope: !213)
!308 = !DILocation(line: 87, column: 8, scope: !309)
!309 = distinct !DILexicalBlock(scope: !213, file: !3, line: 87, column: 8)
!310 = !DILocation(line: 87, column: 18, scope: !309)
!311 = !DILocation(line: 87, column: 8, scope: !213)
!312 = !DILocation(line: 87, column: 33, scope: !309)
!313 = !DILocation(line: 87, column: 23, scope: !309)
!314 = !DILocation(line: 88, column: 8, scope: !315)
!315 = distinct !DILexicalBlock(scope: !213, file: !3, line: 88, column: 8)
!316 = !DILocation(line: 88, column: 18, scope: !315)
!317 = !DILocation(line: 88, column: 8, scope: !213)
!318 = !DILocation(line: 89, column: 15, scope: !315)
!319 = !DILocation(line: 89, column: 5, scope: !315)
!320 = !DILocation(line: 90, column: 12, scope: !213)
!321 = !DILocation(line: 90, column: 19, scope: !213)
!322 = !DILocation(line: 90, column: 4, scope: !213)
!323 = !DILocation(line: 91, column: 3, scope: !213)
!324 = !DILocation(line: 47, column: 71, scope: !204)
!325 = !DILocation(line: 47, column: 3, scope: !204)
!326 = distinct !{!326, !211, !327}
!327 = !DILocation(line: 91, column: 3, scope: !196)
!328 = !DILocation(line: 92, column: 3, scope: !192)
!329 = !DILocation(line: 93, column: 2, scope: !192)
!330 = !DILocation(line: 45, column: 62, scope: !184)
!331 = !DILocation(line: 45, column: 2, scope: !184)
!332 = distinct !{!332, !190, !333}
!333 = !DILocation(line: 93, column: 2, scope: !177)
!334 = !DILocation(line: 94, column: 1, scope: !145)
!335 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 96, type: !336, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!336 = !DISubroutineType(types: !337)
!337 = !{!88}
!338 = !DILocalVariable(name: "ang", scope: !335, file: !3, line: 98, type: !9)
!339 = !DILocation(line: 98, column: 9, scope: !335)
!340 = !DILocation(line: 100, column: 2, scope: !335)
!341 = !DILocation(line: 101, column: 3, scope: !342)
!342 = distinct !DILexicalBlock(scope: !335, file: !3, line: 100, column: 12)
!343 = !DILocation(line: 102, column: 18, scope: !342)
!344 = !DILocation(line: 102, column: 22, scope: !342)
!345 = !DILocation(line: 102, column: 14, scope: !342)
!346 = !DILocation(line: 102, column: 12, scope: !342)
!347 = !DILocation(line: 103, column: 18, scope: !342)
!348 = !DILocation(line: 103, column: 14, scope: !342)
!349 = !DILocation(line: 103, column: 12, scope: !342)
!350 = !DILocation(line: 104, column: 18, scope: !342)
!351 = !DILocation(line: 104, column: 14, scope: !342)
!352 = !DILocation(line: 104, column: 12, scope: !342)
!353 = !DILocation(line: 105, column: 3, scope: !342)
!354 = !DILocation(line: 106, column: 7, scope: !342)
!355 = !DILocation(line: 108, column: 3, scope: !342)
!356 = !DILocation(line: 109, column: 3, scope: !342)
!357 = distinct !{!357, !340, !358}
!358 = !DILocation(line: 110, column: 2, scope: !335)
