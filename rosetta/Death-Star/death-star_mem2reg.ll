; ModuleID = 'death-star.ll'
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
  call void @llvm.dbg.value(metadata double* %v, metadata !34, metadata !DIExpression()), !dbg !35
  %arrayidx = getelementptr inbounds double, double* %v, i64 0, !dbg !36
  %0 = load double, double* %arrayidx, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds double, double* %v, i64 0, !dbg !37
  %1 = load double, double* %arrayidx1, align 8, !dbg !37
  %mul = fmul double %0, %1, !dbg !38
  %arrayidx2 = getelementptr inbounds double, double* %v, i64 1, !dbg !39
  %2 = load double, double* %arrayidx2, align 8, !dbg !39
  %arrayidx3 = getelementptr inbounds double, double* %v, i64 1, !dbg !40
  %3 = load double, double* %arrayidx3, align 8, !dbg !40
  %mul4 = fmul double %2, %3, !dbg !41
  %add = fadd double %mul, %mul4, !dbg !42
  %arrayidx5 = getelementptr inbounds double, double* %v, i64 2, !dbg !43
  %4 = load double, double* %arrayidx5, align 8, !dbg !43
  %arrayidx6 = getelementptr inbounds double, double* %v, i64 2, !dbg !44
  %5 = load double, double* %arrayidx6, align 8, !dbg !44
  %mul7 = fmul double %4, %5, !dbg !45
  %add8 = fadd double %add, %mul7, !dbg !46
  %call = call double @sqrt(double %add8) #4, !dbg !47
  call void @llvm.dbg.value(metadata double %call, metadata !48, metadata !DIExpression()), !dbg !35
  %arrayidx9 = getelementptr inbounds double, double* %v, i64 0, !dbg !49
  %6 = load double, double* %arrayidx9, align 8, !dbg !50
  %div = fdiv double %6, %call, !dbg !50
  store double %div, double* %arrayidx9, align 8, !dbg !50
  %arrayidx10 = getelementptr inbounds double, double* %v, i64 1, !dbg !51
  %7 = load double, double* %arrayidx10, align 8, !dbg !52
  %div11 = fdiv double %7, %call, !dbg !52
  store double %div11, double* %arrayidx10, align 8, !dbg !52
  %arrayidx12 = getelementptr inbounds double, double* %v, i64 2, !dbg !53
  %8 = load double, double* %arrayidx12, align 8, !dbg !54
  %div13 = fdiv double %8, %call, !dbg !54
  store double %div13, double* %arrayidx12, align 8, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @dot(double* %x, double* %y) #0 !dbg !56 {
entry:
  call void @llvm.dbg.value(metadata double* %x, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata double* %y, metadata !61, metadata !DIExpression()), !dbg !60
  %arrayidx = getelementptr inbounds double, double* %x, i64 0, !dbg !62
  %0 = load double, double* %arrayidx, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds double, double* %y, i64 0, !dbg !63
  %1 = load double, double* %arrayidx1, align 8, !dbg !63
  %mul = fmul double %0, %1, !dbg !64
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 1, !dbg !65
  %2 = load double, double* %arrayidx2, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 1, !dbg !66
  %3 = load double, double* %arrayidx3, align 8, !dbg !66
  %mul4 = fmul double %2, %3, !dbg !67
  %add = fadd double %mul, %mul4, !dbg !68
  %arrayidx5 = getelementptr inbounds double, double* %x, i64 2, !dbg !69
  %4 = load double, double* %arrayidx5, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds double, double* %y, i64 2, !dbg !70
  %5 = load double, double* %arrayidx6, align 8, !dbg !70
  %mul7 = fmul double %4, %5, !dbg !71
  %add8 = fadd double %add, %mul7, !dbg !72
  call void @llvm.dbg.value(metadata double %add8, metadata !73, metadata !DIExpression()), !dbg !60
  %cmp = fcmp olt double %add8, 0.000000e+00, !dbg !74
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !75

cond.true:                                        ; preds = %entry
  %fneg = fneg double %add8, !dbg !76
  br label %cond.end, !dbg !75

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !75

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %fneg, %cond.true ], [ 0.000000e+00, %cond.false ], !dbg !75
  ret double %cond, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @hit_sphere(%struct.sphere_t* %sph, double %x, double %y, double* %z1, double* %z2) #0 !dbg !78 {
entry:
  call void @llvm.dbg.value(metadata %struct.sphere_t* %sph, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata double %x, metadata !85, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata double %y, metadata !86, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata double* %z1, metadata !87, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata double* %z2, metadata !88, metadata !DIExpression()), !dbg !84
  %cx = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 0, !dbg !89
  %0 = load double, double* %cx, align 8, !dbg !89
  %sub = fsub double %x, %0, !dbg !90
  call void @llvm.dbg.value(metadata double %sub, metadata !85, metadata !DIExpression()), !dbg !84
  %cy = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 1, !dbg !91
  %1 = load double, double* %cy, align 8, !dbg !91
  %sub1 = fsub double %y, %1, !dbg !92
  call void @llvm.dbg.value(metadata double %sub1, metadata !86, metadata !DIExpression()), !dbg !84
  %r = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 3, !dbg !93
  %2 = load double, double* %r, align 8, !dbg !93
  %r2 = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 3, !dbg !94
  %3 = load double, double* %r2, align 8, !dbg !94
  %mul = fmul double %2, %3, !dbg !95
  %mul3 = fmul double %sub, %sub, !dbg !96
  %mul4 = fmul double %sub1, %sub1, !dbg !97
  %add = fadd double %mul3, %mul4, !dbg !98
  %sub5 = fsub double %mul, %add, !dbg !99
  call void @llvm.dbg.value(metadata double %sub5, metadata !100, metadata !DIExpression()), !dbg !84
  %cmp = fcmp olt double %sub5, 0.000000e+00, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  br label %return, !dbg !104

if.end:                                           ; preds = %entry
  %call = call double @sqrt(double %sub5) #4, !dbg !105
  call void @llvm.dbg.value(metadata double %call, metadata !100, metadata !DIExpression()), !dbg !84
  %cz = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 2, !dbg !106
  %4 = load double, double* %cz, align 8, !dbg !106
  %sub6 = fsub double %4, %call, !dbg !107
  store double %sub6, double* %z1, align 8, !dbg !108
  %cz7 = getelementptr inbounds %struct.sphere_t, %struct.sphere_t* %sph, i32 0, i32 2, !dbg !109
  %5 = load double, double* %cz7, align 8, !dbg !109
  %add8 = fadd double %5, %call, !dbg !110
  store double %add8, double* %z2, align 8, !dbg !111
  br label %return, !dbg !112

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 1, %if.end ], !dbg !84
  ret i32 %retval.0, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_sphere(double %k, double %ambient) #0 !dbg !114 {
entry:
  %vec = alloca [3 x double], align 16
  %zb1 = alloca double, align 8
  %zb2 = alloca double, align 8
  %zs1 = alloca double, align 8
  %zs2 = alloca double, align 8
  call void @llvm.dbg.value(metadata double %k, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata double %ambient, metadata !119, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [3 x double]* %vec, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata double* %zb1, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata double* %zb2, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata double* %zs1, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata double* %zs2, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !130
  %1 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !132
  %sub = fsub double %0, %1, !dbg !133
  %2 = call double @llvm.floor.f64(double %sub), !dbg !134
  %conv = fptosi double %2 to i32, !dbg !134
  call void @llvm.dbg.value(metadata i32 %conv, metadata !135, metadata !DIExpression()), !dbg !118
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc71, %entry
  %i.0 = phi i32 [ %conv, %entry ], [ %inc72, %for.inc71 ], !dbg !137
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !135, metadata !DIExpression()), !dbg !118
  %conv1 = sitofp i32 %i.0 to double, !dbg !138
  %3 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !140
  %4 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !141
  %add = fadd double %3, %4, !dbg !142
  %5 = call double @llvm.ceil.f64(double %add), !dbg !143
  %cmp = fcmp ole double %conv1, %5, !dbg !144
  br i1 %cmp, label %for.body, label %for.end73, !dbg !145

for.body:                                         ; preds = %for.cond
  %conv3 = sitofp i32 %i.0 to double, !dbg !146
  %add4 = fadd double %conv3, 5.000000e-01, !dbg !148
  call void @llvm.dbg.value(metadata double %add4, metadata !149, metadata !DIExpression()), !dbg !118
  %6 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !150
  %7 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !152
  %mul = fmul double 2.000000e+00, %7, !dbg !153
  %sub5 = fsub double %6, %mul, !dbg !154
  %8 = call double @llvm.floor.f64(double %sub5), !dbg !155
  %conv6 = fptosi double %8 to i32, !dbg !155
  call void @llvm.dbg.value(metadata i32 %conv6, metadata !156, metadata !DIExpression()), !dbg !118
  br label %for.cond7, !dbg !157

for.cond7:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ %conv6, %for.body ], [ %inc, %for.inc ], !dbg !158
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !156, metadata !DIExpression()), !dbg !118
  %conv8 = sitofp i32 %j.0 to double, !dbg !159
  %9 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !161
  %10 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 3), align 8, !dbg !162
  %mul9 = fmul double 2.000000e+00, %10, !dbg !163
  %add10 = fadd double %9, %mul9, !dbg !164
  %11 = call double @llvm.ceil.f64(double %add10), !dbg !165
  %cmp11 = fcmp ole double %conv8, %11, !dbg !166
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !167

for.body13:                                       ; preds = %for.cond7
  %conv14 = sitofp i32 %j.0 to double, !dbg !168
  %12 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !170
  %sub15 = fsub double %conv14, %12, !dbg !171
  %div = fdiv double %sub15, 2.000000e+00, !dbg !172
  %add16 = fadd double %div, 5.000000e-01, !dbg !173
  %13 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !174
  %add17 = fadd double %add16, %13, !dbg !175
  call void @llvm.dbg.value(metadata double %add17, metadata !176, metadata !DIExpression()), !dbg !118
  %call = call i32 @hit_sphere(%struct.sphere_t* @pos, double %add17, double %add4, double* %zb1, double* %zb2), !dbg !177
  %tobool = icmp ne i32 %call, 0, !dbg !177
  br i1 %tobool, label %if.else, label %if.then, !dbg !179

if.then:                                          ; preds = %for.body13
  call void @llvm.dbg.value(metadata i32 0, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end37, !dbg !181

if.else:                                          ; preds = %for.body13
  %call18 = call i32 @hit_sphere(%struct.sphere_t* @neg, double %add17, double %add4, double* %zs1, double* %zs2), !dbg !182
  %tobool19 = icmp ne i32 %call18, 0, !dbg !182
  br i1 %tobool19, label %if.else21, label %if.then20, !dbg !184

if.then20:                                        ; preds = %if.else
  call void @llvm.dbg.value(metadata i32 1, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end36, !dbg !185

if.else21:                                        ; preds = %if.else
  %14 = load double, double* %zs1, align 8, !dbg !186
  %15 = load double, double* %zb1, align 8, !dbg !188
  %cmp22 = fcmp ogt double %14, %15, !dbg !189
  br i1 %cmp22, label %if.then24, label %if.else25, !dbg !190

if.then24:                                        ; preds = %if.else21
  call void @llvm.dbg.value(metadata i32 1, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end35, !dbg !191

if.else25:                                        ; preds = %if.else21
  %16 = load double, double* %zs2, align 8, !dbg !192
  %17 = load double, double* %zb2, align 8, !dbg !194
  %cmp26 = fcmp ogt double %16, %17, !dbg !195
  br i1 %cmp26, label %if.then28, label %if.else29, !dbg !196

if.then28:                                        ; preds = %if.else25
  call void @llvm.dbg.value(metadata i32 0, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end34, !dbg !197

if.else29:                                        ; preds = %if.else25
  %18 = load double, double* %zs2, align 8, !dbg !198
  %19 = load double, double* %zb1, align 8, !dbg !200
  %cmp30 = fcmp ogt double %18, %19, !dbg !201
  br i1 %cmp30, label %if.then32, label %if.else33, !dbg !202

if.then32:                                        ; preds = %if.else29
  call void @llvm.dbg.value(metadata i32 2, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end, !dbg !203

if.else33:                                        ; preds = %if.else29
  call void @llvm.dbg.value(metadata i32 1, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else33, %if.then32
  %hit_result.0 = phi i32 [ 2, %if.then32 ], [ 1, %if.else33 ], !dbg !204
  call void @llvm.dbg.value(metadata i32 %hit_result.0, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end34

if.end34:                                         ; preds = %if.end, %if.then28
  %hit_result.1 = phi i32 [ 0, %if.then28 ], [ %hit_result.0, %if.end ], !dbg !205
  call void @llvm.dbg.value(metadata i32 %hit_result.1, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then24
  %hit_result.2 = phi i32 [ 1, %if.then24 ], [ %hit_result.1, %if.end34 ], !dbg !206
  call void @llvm.dbg.value(metadata i32 %hit_result.2, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then20
  %hit_result.3 = phi i32 [ %hit_result.2, %if.end35 ], [ 1, %if.then20 ], !dbg !207
  call void @llvm.dbg.value(metadata i32 %hit_result.3, metadata !180, metadata !DIExpression()), !dbg !118
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then
  %hit_result.4 = phi i32 [ %hit_result.3, %if.end36 ], [ 0, %if.then ], !dbg !208
  call void @llvm.dbg.value(metadata i32 %hit_result.4, metadata !180, metadata !DIExpression()), !dbg !118
  switch i32 %hit_result.4, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb39
  ], !dbg !209

sw.bb:                                            ; preds = %if.end37
  %call38 = call i32 @putchar(i32 43), !dbg !210
  br label %for.inc, !dbg !212

sw.bb39:                                          ; preds = %if.end37
  %20 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 0), align 8, !dbg !213
  %sub40 = fsub double %add17, %20, !dbg !214
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !215
  store double %sub40, double* %arrayidx, align 16, !dbg !216
  %21 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 1), align 8, !dbg !217
  %sub41 = fsub double %add4, %21, !dbg !218
  %arrayidx42 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 1, !dbg !219
  store double %sub41, double* %arrayidx42, align 8, !dbg !220
  %22 = load double, double* %zb1, align 8, !dbg !221
  %23 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @pos, i32 0, i32 2), align 8, !dbg !222
  %sub43 = fsub double %22, %23, !dbg !223
  %arrayidx44 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 2, !dbg !224
  store double %sub43, double* %arrayidx44, align 16, !dbg !225
  br label %sw.epilog, !dbg !226

sw.default:                                       ; preds = %if.end37
  %24 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 0), align 8, !dbg !227
  %sub45 = fsub double %24, %add17, !dbg !228
  %arrayidx46 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !229
  store double %sub45, double* %arrayidx46, align 16, !dbg !230
  %25 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 1), align 8, !dbg !231
  %sub47 = fsub double %25, %add4, !dbg !232
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 1, !dbg !233
  store double %sub47, double* %arrayidx48, align 8, !dbg !234
  %26 = load double, double* getelementptr inbounds (%struct.sphere_t, %struct.sphere_t* @neg, i32 0, i32 2), align 8, !dbg !235
  %27 = load double, double* %zs2, align 8, !dbg !236
  %sub49 = fsub double %26, %27, !dbg !237
  %arrayidx50 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 2, !dbg !238
  store double %sub49, double* %arrayidx50, align 16, !dbg !239
  br label %sw.epilog, !dbg !240

sw.epilog:                                        ; preds = %sw.default, %sw.bb39
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !241
  call void @normalize(double* %arraydecay), !dbg !242
  %arraydecay51 = getelementptr inbounds [3 x double], [3 x double]* %vec, i64 0, i64 0, !dbg !243
  %call52 = call double @dot(double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0), double* %arraydecay51), !dbg !244
  %call53 = call double @pow(double %call52, double %k) #4, !dbg !245
  %add54 = fadd double %call53, %ambient, !dbg !246
  call void @llvm.dbg.value(metadata double %add54, metadata !247, metadata !DIExpression()), !dbg !118
  %sub55 = fsub double 1.000000e+00, %add54, !dbg !248
  %mul56 = fmul double %sub55, 7.000000e+00, !dbg !249
  %conv57 = fptosi double %mul56 to i32, !dbg !250
  call void @llvm.dbg.value(metadata i32 %conv57, metadata !251, metadata !DIExpression()), !dbg !118
  %cmp58 = icmp slt i32 %conv57, 0, !dbg !252
  br i1 %cmp58, label %if.then60, label %if.end61, !dbg !254

if.then60:                                        ; preds = %sw.epilog
  call void @llvm.dbg.value(metadata i32 0, metadata !251, metadata !DIExpression()), !dbg !118
  br label %if.end61, !dbg !255

if.end61:                                         ; preds = %if.then60, %sw.epilog
  %intensity.0 = phi i32 [ 0, %if.then60 ], [ %conv57, %sw.epilog ], !dbg !256
  call void @llvm.dbg.value(metadata i32 %intensity.0, metadata !251, metadata !DIExpression()), !dbg !118
  %conv62 = sext i32 %intensity.0 to i64, !dbg !257
  %cmp63 = icmp uge i64 %conv62, 7, !dbg !259
  br i1 %cmp63, label %if.then65, label %if.end66, !dbg !260

if.then65:                                        ; preds = %if.end61
  call void @llvm.dbg.value(metadata i32 6, metadata !251, metadata !DIExpression()), !dbg !118
  br label %if.end66, !dbg !261

if.end66:                                         ; preds = %if.then65, %if.end61
  %intensity.1 = phi i32 [ 6, %if.then65 ], [ %intensity.0, %if.end61 ], !dbg !256
  call void @llvm.dbg.value(metadata i32 %intensity.1, metadata !251, metadata !DIExpression()), !dbg !118
  %28 = load i8*, i8** @shades, align 8, !dbg !262
  %idxprom = sext i32 %intensity.1 to i64, !dbg !262
  %arrayidx67 = getelementptr inbounds i8, i8* %28, i64 %idxprom, !dbg !262
  %29 = load i8, i8* %arrayidx67, align 1, !dbg !262
  %conv68 = sext i8 %29 to i32, !dbg !262
  %call69 = call i32 @putchar(i32 %conv68), !dbg !263
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %if.end66, %sw.bb
  %inc = add nsw i32 %j.0, 1, !dbg !265
  call void @llvm.dbg.value(metadata i32 %inc, metadata !156, metadata !DIExpression()), !dbg !118
  br label %for.cond7, !dbg !266, !llvm.loop !267

for.end:                                          ; preds = %for.cond7
  %call70 = call i32 @putchar(i32 10), !dbg !269
  br label %for.inc71, !dbg !270

for.inc71:                                        ; preds = %for.end
  %inc72 = add nsw i32 %i.0, 1, !dbg !271
  call void @llvm.dbg.value(metadata i32 %inc72, metadata !135, metadata !DIExpression()), !dbg !118
  br label %for.cond, !dbg !272, !llvm.loop !273

for.end73:                                        ; preds = %for.cond
  ret void, !dbg !275
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

declare dso_local i32 @putchar(i32) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !276 {
entry:
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !279, metadata !DIExpression()), !dbg !280
  br label %while.body, !dbg !281

while.body:                                       ; preds = %while.body, %entry
  %ang.0 = phi double [ 0.000000e+00, %entry ], [ %add, %while.body ], !dbg !280
  call void @llvm.dbg.value(metadata double %ang.0, metadata !279, metadata !DIExpression()), !dbg !280
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !282
  %mul = fmul double %ang.0, 2.000000e+00, !dbg !284
  %call1 = call double @cos(double %mul) #4, !dbg !285
  store double %call1, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 1), align 8, !dbg !286
  %call2 = call double @cos(double %ang.0) #4, !dbg !287
  store double %call2, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 2), align 16, !dbg !288
  %call3 = call double @sin(double %ang.0) #4, !dbg !289
  store double %call3, double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0), align 16, !dbg !290
  call void @normalize(double* getelementptr inbounds ([3 x double], [3 x double]* @light, i64 0, i64 0)), !dbg !291
  %add = fadd double %ang.0, 5.000000e-02, !dbg !292
  call void @llvm.dbg.value(metadata double %add, metadata !279, metadata !DIExpression()), !dbg !280
  call void @draw_sphere(double 2.000000e+00, double 3.000000e-01), !dbg !293
  %call4 = call i32 @usleep(i32 100000), !dbg !294
  br label %while.body, !dbg !281, !llvm.loop !295
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

declare dso_local i32 @usleep(i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!29 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!30 = distinct !DISubprogram(name: "normalize", scope: !3, file: !3, line: 8, type: !31, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!34 = !DILocalVariable(name: "v", arg: 1, scope: !30, file: !3, line: 8, type: !33)
!35 = !DILocation(line: 0, scope: !30)
!36 = !DILocation(line: 10, column: 20, scope: !30)
!37 = !DILocation(line: 10, column: 25, scope: !30)
!38 = !DILocation(line: 10, column: 24, scope: !30)
!39 = !DILocation(line: 10, column: 32, scope: !30)
!40 = !DILocation(line: 10, column: 37, scope: !30)
!41 = !DILocation(line: 10, column: 36, scope: !30)
!42 = !DILocation(line: 10, column: 30, scope: !30)
!43 = !DILocation(line: 10, column: 44, scope: !30)
!44 = !DILocation(line: 10, column: 49, scope: !30)
!45 = !DILocation(line: 10, column: 48, scope: !30)
!46 = !DILocation(line: 10, column: 42, scope: !30)
!47 = !DILocation(line: 10, column: 15, scope: !30)
!48 = !DILocalVariable(name: "len", scope: !30, file: !3, line: 10, type: !9)
!49 = !DILocation(line: 11, column: 2, scope: !30)
!50 = !DILocation(line: 11, column: 7, scope: !30)
!51 = !DILocation(line: 11, column: 15, scope: !30)
!52 = !DILocation(line: 11, column: 20, scope: !30)
!53 = !DILocation(line: 11, column: 28, scope: !30)
!54 = !DILocation(line: 11, column: 33, scope: !30)
!55 = !DILocation(line: 12, column: 1, scope: !30)
!56 = distinct !DISubprogram(name: "dot", scope: !3, file: !3, line: 14, type: !57, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !33, !33}
!59 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !3, line: 14, type: !33)
!60 = !DILocation(line: 0, scope: !56)
!61 = !DILocalVariable(name: "y", arg: 2, scope: !56, file: !3, line: 14, type: !33)
!62 = !DILocation(line: 16, column: 13, scope: !56)
!63 = !DILocation(line: 16, column: 18, scope: !56)
!64 = !DILocation(line: 16, column: 17, scope: !56)
!65 = !DILocation(line: 16, column: 25, scope: !56)
!66 = !DILocation(line: 16, column: 30, scope: !56)
!67 = !DILocation(line: 16, column: 29, scope: !56)
!68 = !DILocation(line: 16, column: 23, scope: !56)
!69 = !DILocation(line: 16, column: 37, scope: !56)
!70 = !DILocation(line: 16, column: 42, scope: !56)
!71 = !DILocation(line: 16, column: 41, scope: !56)
!72 = !DILocation(line: 16, column: 35, scope: !56)
!73 = !DILocalVariable(name: "d", scope: !56, file: !3, line: 16, type: !9)
!74 = !DILocation(line: 17, column: 11, scope: !56)
!75 = !DILocation(line: 17, column: 9, scope: !56)
!76 = !DILocation(line: 17, column: 17, scope: !56)
!77 = !DILocation(line: 17, column: 2, scope: !56)
!78 = distinct !DISubprogram(name: "hit_sphere", scope: !3, file: !3, line: 27, type: !79, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !82, !9, !9, !33, !33}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!83 = !DILocalVariable(name: "sph", arg: 1, scope: !78, file: !3, line: 27, type: !82)
!84 = !DILocation(line: 0, scope: !78)
!85 = !DILocalVariable(name: "x", arg: 2, scope: !78, file: !3, line: 27, type: !9)
!86 = !DILocalVariable(name: "y", arg: 3, scope: !78, file: !3, line: 27, type: !9)
!87 = !DILocalVariable(name: "z1", arg: 4, scope: !78, file: !3, line: 27, type: !33)
!88 = !DILocalVariable(name: "z2", arg: 5, scope: !78, file: !3, line: 27, type: !33)
!89 = !DILocation(line: 30, column: 12, scope: !78)
!90 = !DILocation(line: 30, column: 4, scope: !78)
!91 = !DILocation(line: 31, column: 12, scope: !78)
!92 = !DILocation(line: 31, column: 4, scope: !78)
!93 = !DILocation(line: 32, column: 13, scope: !78)
!94 = !DILocation(line: 32, column: 22, scope: !78)
!95 = !DILocation(line: 32, column: 15, scope: !78)
!96 = !DILocation(line: 32, column: 29, scope: !78)
!97 = !DILocation(line: 32, column: 37, scope: !78)
!98 = !DILocation(line: 32, column: 33, scope: !78)
!99 = !DILocation(line: 32, column: 24, scope: !78)
!100 = !DILocalVariable(name: "zsq", scope: !78, file: !3, line: 29, type: !9)
!101 = !DILocation(line: 33, column: 10, scope: !102)
!102 = distinct !DILexicalBlock(scope: !78, file: !3, line: 33, column: 6)
!103 = !DILocation(line: 33, column: 6, scope: !78)
!104 = !DILocation(line: 33, column: 15, scope: !102)
!105 = !DILocation(line: 34, column: 8, scope: !78)
!106 = !DILocation(line: 35, column: 13, scope: !78)
!107 = !DILocation(line: 35, column: 16, scope: !78)
!108 = !DILocation(line: 35, column: 6, scope: !78)
!109 = !DILocation(line: 36, column: 13, scope: !78)
!110 = !DILocation(line: 36, column: 16, scope: !78)
!111 = !DILocation(line: 36, column: 6, scope: !78)
!112 = !DILocation(line: 37, column: 2, scope: !78)
!113 = !DILocation(line: 38, column: 1, scope: !78)
!114 = distinct !DISubprogram(name: "draw_sphere", scope: !3, file: !3, line: 40, type: !115, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !9, !9}
!117 = !DILocalVariable(name: "k", arg: 1, scope: !114, file: !3, line: 40, type: !9)
!118 = !DILocation(line: 0, scope: !114)
!119 = !DILocalVariable(name: "ambient", arg: 2, scope: !114, file: !3, line: 40, type: !9)
!120 = !DILocalVariable(name: "vec", scope: !114, file: !3, line: 44, type: !8)
!121 = !DILocation(line: 44, column: 9, scope: !114)
!122 = !DILocalVariable(name: "zb1", scope: !114, file: !3, line: 44, type: !9)
!123 = !DILocation(line: 44, column: 23, scope: !114)
!124 = !DILocalVariable(name: "zb2", scope: !114, file: !3, line: 44, type: !9)
!125 = !DILocation(line: 44, column: 28, scope: !114)
!126 = !DILocalVariable(name: "zs1", scope: !114, file: !3, line: 44, type: !9)
!127 = !DILocation(line: 44, column: 33, scope: !114)
!128 = !DILocalVariable(name: "zs2", scope: !114, file: !3, line: 44, type: !9)
!129 = !DILocation(line: 44, column: 38, scope: !114)
!130 = !DILocation(line: 45, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !114, file: !3, line: 45, column: 2)
!132 = !DILocation(line: 45, column: 30, scope: !131)
!133 = !DILocation(line: 45, column: 24, scope: !131)
!134 = !DILocation(line: 45, column: 11, scope: !131)
!135 = !DILocalVariable(name: "i", scope: !114, file: !3, line: 42, type: !81)
!136 = !DILocation(line: 45, column: 7, scope: !131)
!137 = !DILocation(line: 0, scope: !131)
!138 = !DILocation(line: 45, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !131, file: !3, line: 45, column: 2)
!140 = !DILocation(line: 45, column: 48, scope: !139)
!141 = !DILocation(line: 45, column: 57, scope: !139)
!142 = !DILocation(line: 45, column: 51, scope: !139)
!143 = !DILocation(line: 45, column: 39, scope: !139)
!144 = !DILocation(line: 45, column: 36, scope: !139)
!145 = !DILocation(line: 45, column: 2, scope: !131)
!146 = !DILocation(line: 46, column: 7, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !3, line: 45, column: 66)
!148 = !DILocation(line: 46, column: 9, scope: !147)
!149 = !DILocalVariable(name: "y", scope: !114, file: !3, line: 44, type: !9)
!150 = !DILocation(line: 47, column: 22, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !3, line: 47, column: 3)
!152 = !DILocation(line: 47, column: 35, scope: !151)
!153 = !DILocation(line: 47, column: 29, scope: !151)
!154 = !DILocation(line: 47, column: 25, scope: !151)
!155 = !DILocation(line: 47, column: 12, scope: !151)
!156 = !DILocalVariable(name: "j", scope: !114, file: !3, line: 42, type: !81)
!157 = !DILocation(line: 47, column: 8, scope: !151)
!158 = !DILocation(line: 0, scope: !151)
!159 = !DILocation(line: 47, column: 39, scope: !160)
!160 = distinct !DILexicalBlock(scope: !151, file: !3, line: 47, column: 3)
!161 = !DILocation(line: 47, column: 53, scope: !160)
!162 = !DILocation(line: 47, column: 66, scope: !160)
!163 = !DILocation(line: 47, column: 60, scope: !160)
!164 = !DILocation(line: 47, column: 56, scope: !160)
!165 = !DILocation(line: 47, column: 44, scope: !160)
!166 = !DILocation(line: 47, column: 41, scope: !160)
!167 = !DILocation(line: 47, column: 3, scope: !151)
!168 = !DILocation(line: 48, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !160, file: !3, line: 47, column: 75)
!170 = !DILocation(line: 48, column: 17, scope: !169)
!171 = !DILocation(line: 48, column: 11, scope: !169)
!172 = !DILocation(line: 48, column: 21, scope: !169)
!173 = !DILocation(line: 48, column: 26, scope: !169)
!174 = !DILocation(line: 48, column: 37, scope: !169)
!175 = !DILocation(line: 48, column: 31, scope: !169)
!176 = !DILocalVariable(name: "x", scope: !114, file: !3, line: 44, type: !9)
!177 = !DILocation(line: 51, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !3, line: 51, column: 8)
!179 = !DILocation(line: 51, column: 8, scope: !169)
!180 = !DILocalVariable(name: "hit_result", scope: !114, file: !3, line: 42, type: !81)
!181 = !DILocation(line: 52, column: 5, scope: !178)
!182 = !DILocation(line: 55, column: 14, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !3, line: 55, column: 13)
!184 = !DILocation(line: 55, column: 13, scope: !178)
!185 = !DILocation(line: 56, column: 5, scope: !183)
!186 = !DILocation(line: 59, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !3, line: 59, column: 13)
!188 = !DILocation(line: 59, column: 19, scope: !187)
!189 = !DILocation(line: 59, column: 17, scope: !187)
!190 = !DILocation(line: 59, column: 13, scope: !183)
!191 = !DILocation(line: 59, column: 24, scope: !187)
!192 = !DILocation(line: 62, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !3, line: 62, column: 13)
!194 = !DILocation(line: 62, column: 19, scope: !193)
!195 = !DILocation(line: 62, column: 17, scope: !193)
!196 = !DILocation(line: 62, column: 13, scope: !187)
!197 = !DILocation(line: 62, column: 24, scope: !193)
!198 = !DILocation(line: 66, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !193, file: !3, line: 66, column: 13)
!200 = !DILocation(line: 66, column: 19, scope: !199)
!201 = !DILocation(line: 66, column: 17, scope: !199)
!202 = !DILocation(line: 66, column: 13, scope: !193)
!203 = !DILocation(line: 66, column: 24, scope: !199)
!204 = !DILocation(line: 0, scope: !199)
!205 = !DILocation(line: 0, scope: !193)
!206 = !DILocation(line: 0, scope: !187)
!207 = !DILocation(line: 0, scope: !183)
!208 = !DILocation(line: 0, scope: !178)
!209 = !DILocation(line: 69, column: 4, scope: !169)
!210 = !DILocation(line: 71, column: 5, scope: !211)
!211 = distinct !DILexicalBlock(scope: !169, file: !3, line: 69, column: 23)
!212 = !DILocation(line: 72, column: 5, scope: !211)
!213 = !DILocation(line: 74, column: 22, scope: !211)
!214 = !DILocation(line: 74, column: 16, scope: !211)
!215 = !DILocation(line: 74, column: 5, scope: !211)
!216 = !DILocation(line: 74, column: 12, scope: !211)
!217 = !DILocation(line: 75, column: 22, scope: !211)
!218 = !DILocation(line: 75, column: 16, scope: !211)
!219 = !DILocation(line: 75, column: 5, scope: !211)
!220 = !DILocation(line: 75, column: 12, scope: !211)
!221 = !DILocation(line: 76, column: 14, scope: !211)
!222 = !DILocation(line: 76, column: 24, scope: !211)
!223 = !DILocation(line: 76, column: 18, scope: !211)
!224 = !DILocation(line: 76, column: 5, scope: !211)
!225 = !DILocation(line: 76, column: 12, scope: !211)
!226 = !DILocation(line: 77, column: 5, scope: !211)
!227 = !DILocation(line: 79, column: 18, scope: !211)
!228 = !DILocation(line: 79, column: 21, scope: !211)
!229 = !DILocation(line: 79, column: 5, scope: !211)
!230 = !DILocation(line: 79, column: 12, scope: !211)
!231 = !DILocation(line: 80, column: 18, scope: !211)
!232 = !DILocation(line: 80, column: 21, scope: !211)
!233 = !DILocation(line: 80, column: 5, scope: !211)
!234 = !DILocation(line: 80, column: 12, scope: !211)
!235 = !DILocation(line: 81, column: 18, scope: !211)
!236 = !DILocation(line: 81, column: 23, scope: !211)
!237 = !DILocation(line: 81, column: 21, scope: !211)
!238 = !DILocation(line: 81, column: 5, scope: !211)
!239 = !DILocation(line: 81, column: 12, scope: !211)
!240 = !DILocation(line: 82, column: 4, scope: !211)
!241 = !DILocation(line: 84, column: 14, scope: !169)
!242 = !DILocation(line: 84, column: 4, scope: !169)
!243 = !DILocation(line: 85, column: 23, scope: !169)
!244 = !DILocation(line: 85, column: 12, scope: !169)
!245 = !DILocation(line: 85, column: 8, scope: !169)
!246 = !DILocation(line: 85, column: 32, scope: !169)
!247 = !DILocalVariable(name: "b", scope: !114, file: !3, line: 43, type: !9)
!248 = !DILocation(line: 86, column: 19, scope: !169)
!249 = !DILocation(line: 86, column: 24, scope: !169)
!250 = !DILocation(line: 86, column: 16, scope: !169)
!251 = !DILocalVariable(name: "intensity", scope: !114, file: !3, line: 42, type: !81)
!252 = !DILocation(line: 87, column: 18, scope: !253)
!253 = distinct !DILexicalBlock(scope: !169, file: !3, line: 87, column: 8)
!254 = !DILocation(line: 87, column: 8, scope: !169)
!255 = !DILocation(line: 87, column: 23, scope: !253)
!256 = !DILocation(line: 0, scope: !169)
!257 = !DILocation(line: 88, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !169, file: !3, line: 88, column: 8)
!259 = !DILocation(line: 88, column: 18, scope: !258)
!260 = !DILocation(line: 88, column: 8, scope: !169)
!261 = !DILocation(line: 89, column: 5, scope: !258)
!262 = !DILocation(line: 90, column: 12, scope: !169)
!263 = !DILocation(line: 90, column: 4, scope: !169)
!264 = !DILocation(line: 91, column: 3, scope: !169)
!265 = !DILocation(line: 47, column: 71, scope: !160)
!266 = !DILocation(line: 47, column: 3, scope: !160)
!267 = distinct !{!267, !167, !268}
!268 = !DILocation(line: 91, column: 3, scope: !151)
!269 = !DILocation(line: 92, column: 3, scope: !147)
!270 = !DILocation(line: 93, column: 2, scope: !147)
!271 = !DILocation(line: 45, column: 62, scope: !139)
!272 = !DILocation(line: 45, column: 2, scope: !139)
!273 = distinct !{!273, !145, !274}
!274 = !DILocation(line: 93, column: 2, scope: !131)
!275 = !DILocation(line: 94, column: 1, scope: !114)
!276 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 96, type: !277, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!277 = !DISubroutineType(types: !278)
!278 = !{!81}
!279 = !DILocalVariable(name: "ang", scope: !276, file: !3, line: 98, type: !9)
!280 = !DILocation(line: 0, scope: !276)
!281 = !DILocation(line: 100, column: 2, scope: !276)
!282 = !DILocation(line: 101, column: 3, scope: !283)
!283 = distinct !DILexicalBlock(scope: !276, file: !3, line: 100, column: 12)
!284 = !DILocation(line: 102, column: 22, scope: !283)
!285 = !DILocation(line: 102, column: 14, scope: !283)
!286 = !DILocation(line: 102, column: 12, scope: !283)
!287 = !DILocation(line: 103, column: 14, scope: !283)
!288 = !DILocation(line: 103, column: 12, scope: !283)
!289 = !DILocation(line: 104, column: 14, scope: !283)
!290 = !DILocation(line: 104, column: 12, scope: !283)
!291 = !DILocation(line: 105, column: 3, scope: !283)
!292 = !DILocation(line: 106, column: 7, scope: !283)
!293 = !DILocation(line: 108, column: 3, scope: !283)
!294 = !DILocation(line: 109, column: 3, scope: !283)
!295 = distinct !{!295, !281, !296}
!296 = !DILocation(line: 110, column: 2, scope: !276)
