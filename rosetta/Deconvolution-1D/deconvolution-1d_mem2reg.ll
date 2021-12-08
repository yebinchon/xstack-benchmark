; ModuleID = 'deconvolution-1d.ll'
source_filename = "deconvolution-1d.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@PI = common dso_local global double 0.000000e+00, align 8, !dbg !0
@__const.main.g = private unnamed_addr constant [21 x double] [double 2.400000e+01, double 7.500000e+01, double 7.100000e+01, double -3.400000e+01, double 3.000000e+00, double 2.200000e+01, double -4.500000e+01, double 2.300000e+01, double 2.450000e+02, double 2.500000e+01, double 5.200000e+01, double 2.500000e+01, double -6.700000e+01, double -9.600000e+01, double 9.600000e+01, double 3.100000e+01, double 5.500000e+01, double 3.600000e+01, double 2.900000e+01, double -4.300000e+01, double -7.000000e+00], align 16
@__const.main.f = private unnamed_addr constant [16 x double] [double -3.000000e+00, double -6.000000e+00, double -1.000000e+00, double 8.000000e+00, double -6.000000e+00, double 3.000000e+00, double -1.000000e+00, double -9.000000e+00, double -9.000000e+00, double 3.000000e+00, double -2.000000e+00, double 5.000000e+00, double 2.000000e+00, double -2.000000e+00, double -7.000000e+00, double -1.000000e+00], align 16
@.str = private unnamed_addr constant [15 x i8] c"f[] data is : \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %g\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"deconv(g, h): \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"h[] data is : \00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"deconv(g, f): \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @_fft({ double, double }* %buf, { double, double }* %out, i32 %n, i32 %step) #0 !dbg !11 {
entry:
  %t = alloca { double, double }, align 8
  %coerce = alloca { double, double }, align 8
  call void @llvm.dbg.value(metadata { double, double }* %buf, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata { double, double }* %out, metadata !20, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 %n, metadata !21, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 %step, metadata !22, metadata !DIExpression()), !dbg !19
  %cmp = icmp slt i32 %step, %n, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %mul = mul nsw i32 %step, 2, !dbg !26
  call void @_fft({ double, double }* %out, { double, double }* %buf, i32 %n, i32 %mul), !dbg !28
  %idx.ext = sext i32 %step to i64, !dbg !29
  %add.ptr = getelementptr inbounds { double, double }, { double, double }* %out, i64 %idx.ext, !dbg !29
  %idx.ext1 = sext i32 %step to i64, !dbg !30
  %add.ptr2 = getelementptr inbounds { double, double }, { double, double }* %buf, i64 %idx.ext1, !dbg !30
  %mul3 = mul nsw i32 %step, 2, !dbg !31
  call void @_fft({ double, double }* %add.ptr, { double, double }* %add.ptr2, i32 %n, i32 %mul3), !dbg !32
  call void @llvm.dbg.value(metadata i32 0, metadata !33, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %add40, %for.inc ], !dbg !35
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !33, metadata !DIExpression()), !dbg !35
  %cmp4 = icmp slt i32 %i.0, %n, !dbg !37
  br i1 %cmp4, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata { double, double }* %t, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = load double, double* @PI, align 8, !dbg !43
  %mul.rl = fmul double -0.000000e+00, %0, !dbg !44
  %mul.il = fmul double -1.000000e+00, %0, !dbg !44
  %conv = sitofp i32 %i.0 to double, !dbg !45
  %mul_ac = fmul double %mul.rl, %conv, !dbg !46
  %mul_bd = fmul double %mul.il, 0.000000e+00, !dbg !46
  %mul_ad = fmul double %mul.rl, 0.000000e+00, !dbg !46
  %mul_bc = fmul double %mul.il, %conv, !dbg !46
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !46
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !46
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !46
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !46, !prof !47

complex_mul_imag_nan:                             ; preds = %for.body
  %isnan_cmp5 = fcmp uno double %mul_i, %mul_i, !dbg !46
  br i1 %isnan_cmp5, label %complex_mul_libcall, label %complex_mul_cont, !dbg !46, !prof !47

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call { double, double } @__muldc3(double %mul.rl, double %mul.il, double %conv, double 0.000000e+00) #3, !dbg !46
  %1 = extractvalue { double, double } %call, 0, !dbg !46
  %2 = extractvalue { double, double } %call, 1, !dbg !46
  br label %complex_mul_cont, !dbg !46

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi double [ %mul_r, %for.body ], [ %mul_r, %complex_mul_imag_nan ], [ %1, %complex_mul_libcall ], !dbg !46
  %imag_mul_phi = phi double [ %mul_i, %for.body ], [ %mul_i, %complex_mul_imag_nan ], [ %2, %complex_mul_libcall ], !dbg !46
  %conv6 = sitofp i32 %n to double, !dbg !48
  %call7 = call { double, double } @__divdc3(double %real_mul_phi, double %imag_mul_phi, double %conv6, double 0.000000e+00) #3, !dbg !49
  %3 = extractvalue { double, double } %call7, 0, !dbg !49
  %4 = extractvalue { double, double } %call7, 1, !dbg !49
  %coerce.realp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !50
  %coerce.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !50
  store double %3, double* %coerce.realp, align 8, !dbg !50
  store double %4, double* %coerce.imagp, align 8, !dbg !50
  %5 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !50
  %6 = load double, double* %5, align 8, !dbg !50
  %7 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !50
  %8 = load double, double* %7, align 8, !dbg !50
  %call8 = call { double, double } @cexp(double %6, double %8) #3, !dbg !50
  %9 = extractvalue { double, double } %call8, 0, !dbg !50
  %10 = extractvalue { double, double } %call8, 1, !dbg !50
  %add = add nsw i32 %i.0, %step, !dbg !51
  %idxprom = sext i32 %add to i64, !dbg !52
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %out, i64 %idxprom, !dbg !52
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !52
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !52
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !52
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !52
  %mul_ac9 = fmul double %9, %arrayidx.real, !dbg !53
  %mul_bd10 = fmul double %10, %arrayidx.imag, !dbg !53
  %mul_ad11 = fmul double %9, %arrayidx.imag, !dbg !53
  %mul_bc12 = fmul double %10, %arrayidx.real, !dbg !53
  %mul_r13 = fsub double %mul_ac9, %mul_bd10, !dbg !53
  %mul_i14 = fadd double %mul_ad11, %mul_bc12, !dbg !53
  %isnan_cmp15 = fcmp uno double %mul_r13, %mul_r13, !dbg !53
  br i1 %isnan_cmp15, label %complex_mul_imag_nan16, label %complex_mul_cont20, !dbg !53, !prof !47

complex_mul_imag_nan16:                           ; preds = %complex_mul_cont
  %isnan_cmp17 = fcmp uno double %mul_i14, %mul_i14, !dbg !53
  br i1 %isnan_cmp17, label %complex_mul_libcall18, label %complex_mul_cont20, !dbg !53, !prof !47

complex_mul_libcall18:                            ; preds = %complex_mul_imag_nan16
  %call19 = call { double, double } @__muldc3(double %9, double %10, double %arrayidx.real, double %arrayidx.imag) #3, !dbg !53
  %11 = extractvalue { double, double } %call19, 0, !dbg !53
  %12 = extractvalue { double, double } %call19, 1, !dbg !53
  br label %complex_mul_cont20, !dbg !53

complex_mul_cont20:                               ; preds = %complex_mul_libcall18, %complex_mul_imag_nan16, %complex_mul_cont
  %real_mul_phi21 = phi double [ %mul_r13, %complex_mul_cont ], [ %mul_r13, %complex_mul_imag_nan16 ], [ %11, %complex_mul_libcall18 ], !dbg !53
  %imag_mul_phi22 = phi double [ %mul_i14, %complex_mul_cont ], [ %mul_i14, %complex_mul_imag_nan16 ], [ %12, %complex_mul_libcall18 ], !dbg !53
  %t.realp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !42
  %t.imagp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !42
  store double %real_mul_phi21, double* %t.realp, align 8, !dbg !42
  store double %imag_mul_phi22, double* %t.imagp, align 8, !dbg !42
  %idxprom23 = sext i32 %i.0 to i64, !dbg !54
  %arrayidx24 = getelementptr inbounds { double, double }, { double, double }* %out, i64 %idxprom23, !dbg !54
  %arrayidx24.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 0, !dbg !54
  %arrayidx24.real = load double, double* %arrayidx24.realp, align 8, !dbg !54
  %arrayidx24.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 1, !dbg !54
  %arrayidx24.imag = load double, double* %arrayidx24.imagp, align 8, !dbg !54
  %t.realp25 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !55
  %t.real = load double, double* %t.realp25, align 8, !dbg !55
  %t.imagp26 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !55
  %t.imag = load double, double* %t.imagp26, align 8, !dbg !55
  %add.r = fadd double %arrayidx24.real, %t.real, !dbg !56
  %add.i = fadd double %arrayidx24.imag, %t.imag, !dbg !56
  %div = sdiv i32 %i.0, 2, !dbg !57
  %idxprom27 = sext i32 %div to i64, !dbg !58
  %arrayidx28 = getelementptr inbounds { double, double }, { double, double }* %buf, i64 %idxprom27, !dbg !58
  %arrayidx28.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 0, !dbg !59
  %arrayidx28.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 1, !dbg !59
  store double %add.r, double* %arrayidx28.realp, align 8, !dbg !59
  store double %add.i, double* %arrayidx28.imagp, align 8, !dbg !59
  %idxprom29 = sext i32 %i.0 to i64, !dbg !60
  %arrayidx30 = getelementptr inbounds { double, double }, { double, double }* %out, i64 %idxprom29, !dbg !60
  %arrayidx30.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 0, !dbg !60
  %arrayidx30.real = load double, double* %arrayidx30.realp, align 8, !dbg !60
  %arrayidx30.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 1, !dbg !60
  %arrayidx30.imag = load double, double* %arrayidx30.imagp, align 8, !dbg !60
  %t.realp31 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !61
  %t.real32 = load double, double* %t.realp31, align 8, !dbg !61
  %t.imagp33 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !61
  %t.imag34 = load double, double* %t.imagp33, align 8, !dbg !61
  %sub.r = fsub double %arrayidx30.real, %t.real32, !dbg !62
  %sub.i = fsub double %arrayidx30.imag, %t.imag34, !dbg !62
  %add35 = add nsw i32 %i.0, %n, !dbg !63
  %div36 = sdiv i32 %add35, 2, !dbg !64
  %idxprom37 = sext i32 %div36 to i64, !dbg !65
  %arrayidx38 = getelementptr inbounds { double, double }, { double, double }* %buf, i64 %idxprom37, !dbg !65
  %arrayidx38.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 0, !dbg !66
  %arrayidx38.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 1, !dbg !66
  store double %sub.r, double* %arrayidx38.realp, align 8, !dbg !66
  store double %sub.i, double* %arrayidx38.imagp, align 8, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %complex_mul_cont20
  %mul39 = mul nsw i32 2, %step, !dbg !68
  %add40 = add nsw i32 %i.0, %mul39, !dbg !69
  call void @llvm.dbg.value(metadata i32 %add40, metadata !33, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !73

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local { double, double } @cexp(double, double) #2

declare dso_local { double, double } @__muldc3(double, double, double, double)

declare dso_local { double, double } @__divdc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft({ double, double }* %buf, i32 %n) #0 !dbg !75 {
entry:
  call void @llvm.dbg.value(metadata { double, double }* %buf, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i32 %n, metadata !80, metadata !DIExpression()), !dbg !79
  %0 = zext i32 %n to i64, !dbg !81
  %1 = call i8* @llvm.stacksave(), !dbg !81
  %vla = alloca { double, double }, i64 %0, align 16, !dbg !81
  call void @llvm.dbg.value(metadata i64 %0, metadata !82, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !84, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata i32 0, metadata !89, metadata !DIExpression()), !dbg !91
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !91
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !89, metadata !DIExpression()), !dbg !91
  %cmp = icmp slt i32 %i.0, %n, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !96
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %buf, i64 %idxprom, !dbg !96
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !96
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !96
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !96
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !96
  %idxprom1 = sext i32 %i.0 to i64, !dbg !97
  %arrayidx2 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom1, !dbg !97
  %arrayidx2.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 0, !dbg !98
  %arrayidx2.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 1, !dbg !98
  store double %arrayidx.real, double* %arrayidx2.realp, align 16, !dbg !98
  store double %arrayidx.imag, double* %arrayidx2.imagp, align 8, !dbg !98
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !99
  call void @llvm.dbg.value(metadata i32 %inc, metadata !89, metadata !DIExpression()), !dbg !91
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  call void @_fft({ double, double }* %buf, { double, double }* %vla, i32 %n, i32 1), !dbg !103
  call void @llvm.stackrestore(i8* %1), !dbg !104
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double }* @pad_two(double* %g, i32 %len, i32* %ns) #0 !dbg !105 {
entry:
  call void @llvm.dbg.value(metadata double* %g, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i32 %len, metadata !112, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i32* %ns, metadata !113, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i32 1, metadata !114, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* %ns, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %ns, align 4, !dbg !118
  call void @llvm.dbg.value(metadata i32 %1, metadata !114, metadata !DIExpression()), !dbg !111
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  br label %while.cond, !dbg !120

while.cond:                                       ; preds = %while.body, %if.else
  %n.0 = phi i32 [ 1, %if.else ], [ %mul, %while.body ], !dbg !111
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !114, metadata !DIExpression()), !dbg !111
  %cmp = icmp slt i32 %n.0, %len, !dbg !121
  br i1 %cmp, label %while.body, label %while.end, !dbg !120

while.body:                                       ; preds = %while.cond
  %mul = mul nsw i32 %n.0, 2, !dbg !122
  call void @llvm.dbg.value(metadata i32 %mul, metadata !114, metadata !DIExpression()), !dbg !111
  br label %while.cond, !dbg !120, !llvm.loop !123

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %n.1 = phi i32 [ %1, %if.then ], [ %n.0, %while.end ], !dbg !111
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !114, metadata !DIExpression()), !dbg !111
  %conv = sext i32 %n.1 to i64, !dbg !125
  %call = call noalias i8* @calloc(i64 16, i64 %conv) #3, !dbg !126
  %2 = bitcast i8* %call to { double, double }*, !dbg !126
  call void @llvm.dbg.value(metadata { double, double }* %2, metadata !127, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i32 0, metadata !128, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !130
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !128, metadata !DIExpression()), !dbg !130
  %cmp1 = icmp slt i32 %i.0, %len, !dbg !132
  br i1 %cmp1, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !135
  %arrayidx = getelementptr inbounds double, double* %g, i64 %idxprom, !dbg !135
  %3 = load double, double* %arrayidx, align 8, !dbg !135
  %idxprom3 = sext i32 %i.0 to i64, !dbg !136
  %arrayidx4 = getelementptr inbounds { double, double }, { double, double }* %2, i64 %idxprom3, !dbg !136
  %arrayidx4.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 0, !dbg !137
  %arrayidx4.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 1, !dbg !137
  store double %3, double* %arrayidx4.realp, align 8, !dbg !137
  store double 0.000000e+00, double* %arrayidx4.imagp, align 8, !dbg !137
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !138
  call void @llvm.dbg.value(metadata i32 %inc, metadata !128, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  store i32 %n.1, i32* %ns, align 4, !dbg !142
  ret { double, double }* %2, !dbg !143
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deconv(double* %g, i32 %lg, double* %f, i32 %lf, double* %out) #0 !dbg !144 {
entry:
  %ns = alloca i32, align 4
  call void @llvm.dbg.value(metadata double* %g, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %lg, metadata !149, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata double* %f, metadata !150, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %lf, metadata !151, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata double* %out, metadata !152, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %ns, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 0, i32* %ns, align 4, !dbg !154
  %call = call { double, double }* @pad_two(double* %g, i32 %lg, i32* %ns), !dbg !155
  call void @llvm.dbg.value(metadata { double, double }* %call, metadata !156, metadata !DIExpression()), !dbg !148
  %call1 = call { double, double }* @pad_two(double* %f, i32 %lf, i32* %ns), !dbg !157
  call void @llvm.dbg.value(metadata { double, double }* %call1, metadata !158, metadata !DIExpression()), !dbg !148
  %0 = load i32, i32* %ns, align 4, !dbg !159
  call void @fft({ double, double }* %call, i32 %0), !dbg !160
  %1 = load i32, i32* %ns, align 4, !dbg !161
  call void @fft({ double, double }* %call1, i32 %1), !dbg !162
  %2 = load i32, i32* %ns, align 4, !dbg !163
  %3 = zext i32 %2 to i64, !dbg !164
  %4 = call i8* @llvm.stacksave(), !dbg !164
  %vla = alloca { double, double }, i64 %3, align 16, !dbg !164
  call void @llvm.dbg.value(metadata i64 %3, metadata !165, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !166, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 0, metadata !171, metadata !DIExpression()), !dbg !173
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !173
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !171, metadata !DIExpression()), !dbg !173
  %5 = load i32, i32* %ns, align 4, !dbg !175
  %cmp = icmp slt i32 %i.0, %5, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !179
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %call, i64 %idxprom, !dbg !179
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !179
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !179
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !179
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !179
  %idxprom2 = sext i32 %i.0 to i64, !dbg !180
  %arrayidx3 = getelementptr inbounds { double, double }, { double, double }* %call1, i64 %idxprom2, !dbg !180
  %arrayidx3.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 0, !dbg !180
  %arrayidx3.real = load double, double* %arrayidx3.realp, align 8, !dbg !180
  %arrayidx3.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 1, !dbg !180
  %arrayidx3.imag = load double, double* %arrayidx3.imagp, align 8, !dbg !180
  %call4 = call { double, double } @__divdc3(double %arrayidx.real, double %arrayidx.imag, double %arrayidx3.real, double %arrayidx3.imag) #3, !dbg !181
  %6 = extractvalue { double, double } %call4, 0, !dbg !181
  %7 = extractvalue { double, double } %call4, 1, !dbg !181
  %idxprom5 = sext i32 %i.0 to i64, !dbg !182
  %arrayidx6 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom5, !dbg !182
  %arrayidx6.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 0, !dbg !183
  %arrayidx6.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 1, !dbg !183
  store double %6, double* %arrayidx6.realp, align 16, !dbg !183
  store double %7, double* %arrayidx6.imagp, align 8, !dbg !183
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !184
  call void @llvm.dbg.value(metadata i32 %inc, metadata !171, metadata !DIExpression()), !dbg !173
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %ns, align 4, !dbg !188
  call void @fft({ double, double }* %vla, i32 %8), !dbg !189
  call void @llvm.dbg.value(metadata i32 0, metadata !190, metadata !DIExpression()), !dbg !192
  br label %for.cond8, !dbg !193

for.cond8:                                        ; preds = %for.inc17, %for.end
  %i7.0 = phi i32 [ 0, %for.end ], [ %dec, %for.inc17 ], !dbg !192
  call void @llvm.dbg.value(metadata i32 %i7.0, metadata !190, metadata !DIExpression()), !dbg !192
  %sub = sub nsw i32 %lf, %lg, !dbg !194
  %cmp9 = icmp sge i32 %i7.0, %sub, !dbg !196
  br i1 %cmp9, label %for.body10, label %for.end18, !dbg !197

for.body10:                                       ; preds = %for.cond8
  %9 = load i32, i32* %ns, align 4, !dbg !198
  %add = add nsw i32 %i7.0, %9, !dbg !199
  %10 = load i32, i32* %ns, align 4, !dbg !200
  %rem = srem i32 %add, %10, !dbg !201
  %idxprom11 = sext i32 %rem to i64, !dbg !202
  %arrayidx12 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom11, !dbg !202
  %arrayidx12.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 0, !dbg !202
  %arrayidx12.real = load double, double* %arrayidx12.realp, align 16, !dbg !202
  %arrayidx12.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 1, !dbg !202
  %arrayidx12.imag = load double, double* %arrayidx12.imagp, align 8, !dbg !202
  %call13 = call { double, double } @__divdc3(double %arrayidx12.real, double %arrayidx12.imag, double 3.200000e+01, double 0.000000e+00) #3, !dbg !203
  %11 = extractvalue { double, double } %call13, 0, !dbg !203
  %12 = extractvalue { double, double } %call13, 1, !dbg !203
  %sub14 = sub nsw i32 0, %i7.0, !dbg !204
  %idxprom15 = sext i32 %sub14 to i64, !dbg !205
  %arrayidx16 = getelementptr inbounds double, double* %out, i64 %idxprom15, !dbg !205
  store double %11, double* %arrayidx16, align 8, !dbg !206
  br label %for.inc17, !dbg !205

for.inc17:                                        ; preds = %for.body10
  %dec = add nsw i32 %i7.0, -1, !dbg !207
  call void @llvm.dbg.value(metadata i32 %dec, metadata !190, metadata !DIExpression()), !dbg !192
  br label %for.cond8, !dbg !208, !llvm.loop !209

for.end18:                                        ; preds = %for.cond8
  %13 = bitcast { double, double }* %call to i8*, !dbg !211
  call void @free(i8* %13) #3, !dbg !212
  %14 = bitcast { double, double }* %call1 to i8*, !dbg !213
  call void @free(i8* %14) #3, !dbg !214
  call void @llvm.stackrestore(i8* %4), !dbg !215
  ret void, !dbg !215
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !216 {
entry:
  %g = alloca [21 x double], align 16
  %f = alloca [16 x double], align 16
  %h = alloca [6 x double], align 16
  %call = call double @atan2(double 1.000000e+00, double 1.000000e+00) #3, !dbg !219
  %mul = fmul double %call, 4.000000e+00, !dbg !220
  store double %mul, double* @PI, align 8, !dbg !221
  call void @llvm.dbg.declare(metadata [21 x double]* %g, metadata !222, metadata !DIExpression()), !dbg !226
  %0 = bitcast [21 x double]* %g to i8*, !dbg !226
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([21 x double]* @__const.main.g to i8*), i64 168, i1 false), !dbg !226
  call void @llvm.dbg.declare(metadata [16 x double]* %f, metadata !227, metadata !DIExpression()), !dbg !231
  %1 = bitcast [16 x double]* %f to i8*, !dbg !231
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([16 x double]* @__const.main.f to i8*), i64 128, i1 false), !dbg !231
  call void @llvm.dbg.declare(metadata [6 x double]* %h, metadata !232, metadata !DIExpression()), !dbg !236
  %2 = bitcast [6 x double]* %h to i8*, !dbg !236
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 48, i1 false), !dbg !236
  %3 = bitcast i8* %2 to [6 x double]*, !dbg !236
  %4 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 0, !dbg !236
  store double -8.000000e+00, double* %4, align 16, !dbg !236
  %5 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 1, !dbg !236
  store double -9.000000e+00, double* %5, align 8, !dbg !236
  %6 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 2, !dbg !236
  store double -3.000000e+00, double* %6, align 16, !dbg !236
  %7 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 3, !dbg !236
  store double -1.000000e+00, double* %7, align 8, !dbg !236
  %8 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 4, !dbg !236
  store double -6.000000e+00, double* %8, align 16, !dbg !236
  %9 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 5, !dbg !236
  store double 7.000000e+00, double* %9, align 8, !dbg !236
  call void @llvm.dbg.value(metadata i32 21, metadata !237, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.value(metadata i32 16, metadata !239, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.value(metadata i32 6, metadata !240, metadata !DIExpression()), !dbg !238
  %10 = zext i32 6 to i64, !dbg !241
  %11 = call i8* @llvm.stacksave(), !dbg !241
  %vla = alloca double, i64 %10, align 16, !dbg !241
  call void @llvm.dbg.value(metadata i64 %10, metadata !242, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata double* %vla, metadata !243, metadata !DIExpression()), !dbg !247
  %12 = zext i32 16 to i64, !dbg !248
  %vla1 = alloca double, i64 %12, align 16, !dbg !248
  call void @llvm.dbg.value(metadata i64 %12, metadata !249, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata double* %vla1, metadata !250, metadata !DIExpression()), !dbg !254
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)), !dbg !255
  call void @llvm.dbg.value(metadata i32 0, metadata !256, metadata !DIExpression()), !dbg !258
  br label %for.cond, !dbg !259

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !258
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !256, metadata !DIExpression()), !dbg !258
  %cmp = icmp slt i32 %i.0, 16, !dbg !260
  br i1 %cmp, label %for.body, label %for.end, !dbg !262

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !263
  %arrayidx = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 %idxprom, !dbg !263
  %13 = load double, double* %arrayidx, align 8, !dbg !263
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %13), !dbg !264
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !265
  call void @llvm.dbg.value(metadata i32 %inc, metadata !256, metadata !DIExpression()), !dbg !258
  br label %for.cond, !dbg !266, !llvm.loop !267

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !269
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !270
  %arraydecay = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !271
  %arraydecay6 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 0, !dbg !272
  call void @deconv(double* %arraydecay, i32 21, double* %arraydecay6, i32 6, double* %vla1), !dbg !273
  call void @llvm.dbg.value(metadata i32 0, metadata !274, metadata !DIExpression()), !dbg !276
  br label %for.cond8, !dbg !277

for.cond8:                                        ; preds = %for.inc14, %for.end
  %i7.0 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !276
  call void @llvm.dbg.value(metadata i32 %i7.0, metadata !274, metadata !DIExpression()), !dbg !276
  %cmp9 = icmp slt i32 %i7.0, 16, !dbg !278
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !280

for.body10:                                       ; preds = %for.cond8
  %idxprom11 = sext i32 %i7.0 to i64, !dbg !281
  %arrayidx12 = getelementptr inbounds double, double* %vla1, i64 %idxprom11, !dbg !281
  %14 = load double, double* %arrayidx12, align 8, !dbg !281
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %14), !dbg !282
  br label %for.inc14, !dbg !282

for.inc14:                                        ; preds = %for.body10
  %inc15 = add nsw i32 %i7.0, 1, !dbg !283
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !274, metadata !DIExpression()), !dbg !276
  br label %for.cond8, !dbg !284, !llvm.loop !285

for.end16:                                        ; preds = %for.cond8
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !287
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !288
  call void @llvm.dbg.value(metadata i32 0, metadata !289, metadata !DIExpression()), !dbg !291
  br label %for.cond20, !dbg !292

for.cond20:                                       ; preds = %for.inc26, %for.end16
  %i19.0 = phi i32 [ 0, %for.end16 ], [ %inc27, %for.inc26 ], !dbg !291
  call void @llvm.dbg.value(metadata i32 %i19.0, metadata !289, metadata !DIExpression()), !dbg !291
  %cmp21 = icmp slt i32 %i19.0, 6, !dbg !293
  br i1 %cmp21, label %for.body22, label %for.end28, !dbg !295

for.body22:                                       ; preds = %for.cond20
  %idxprom23 = sext i32 %i19.0 to i64, !dbg !296
  %arrayidx24 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 %idxprom23, !dbg !296
  %15 = load double, double* %arrayidx24, align 8, !dbg !296
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %15), !dbg !297
  br label %for.inc26, !dbg !297

for.inc26:                                        ; preds = %for.body22
  %inc27 = add nsw i32 %i19.0, 1, !dbg !298
  call void @llvm.dbg.value(metadata i32 %inc27, metadata !289, metadata !DIExpression()), !dbg !291
  br label %for.cond20, !dbg !299, !llvm.loop !300

for.end28:                                        ; preds = %for.cond20
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !302
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !303
  %arraydecay31 = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !304
  %arraydecay32 = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 0, !dbg !305
  call void @deconv(double* %arraydecay31, i32 21, double* %arraydecay32, i32 16, double* %vla), !dbg !306
  call void @llvm.dbg.value(metadata i32 0, metadata !307, metadata !DIExpression()), !dbg !309
  br label %for.cond34, !dbg !310

for.cond34:                                       ; preds = %for.inc40, %for.end28
  %i33.0 = phi i32 [ 0, %for.end28 ], [ %inc41, %for.inc40 ], !dbg !309
  call void @llvm.dbg.value(metadata i32 %i33.0, metadata !307, metadata !DIExpression()), !dbg !309
  %cmp35 = icmp slt i32 %i33.0, 6, !dbg !311
  br i1 %cmp35, label %for.body36, label %for.end42, !dbg !313

for.body36:                                       ; preds = %for.cond34
  %idxprom37 = sext i32 %i33.0 to i64, !dbg !314
  %arrayidx38 = getelementptr inbounds double, double* %vla, i64 %idxprom37, !dbg !314
  %16 = load double, double* %arrayidx38, align 8, !dbg !314
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %16), !dbg !315
  br label %for.inc40, !dbg !315

for.inc40:                                        ; preds = %for.body36
  %inc41 = add nsw i32 %i33.0, 1, !dbg !316
  call void @llvm.dbg.value(metadata i32 %inc41, metadata !307, metadata !DIExpression()), !dbg !309
  br label %for.cond34, !dbg !317, !llvm.loop !318

for.end42:                                        ; preds = %for.cond34
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !320
  call void @llvm.stackrestore(i8* %11), !dbg !321
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "PI", scope: !2, file: !3, line: 6, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "deconvolution-1d.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deconvolution-1D")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!11 = distinct !DISubprogram(name: "_fft", scope: !3, file: !3, line: 9, type: !12, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{null, !14, !14, !17, !17}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "cplx", file: !3, line: 7, baseType: !16)
!16 = !DIBasicType(name: "complex", size: 128, encoding: DW_ATE_complex_float)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "buf", arg: 1, scope: !11, file: !3, line: 9, type: !14)
!19 = !DILocation(line: 0, scope: !11)
!20 = !DILocalVariable(name: "out", arg: 2, scope: !11, file: !3, line: 9, type: !14)
!21 = !DILocalVariable(name: "n", arg: 3, scope: !11, file: !3, line: 9, type: !17)
!22 = !DILocalVariable(name: "step", arg: 4, scope: !11, file: !3, line: 9, type: !17)
!23 = !DILocation(line: 11, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !3, line: 11, column: 6)
!25 = !DILocation(line: 11, column: 6, scope: !11)
!26 = !DILocation(line: 12, column: 26, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !3, line: 11, column: 16)
!28 = !DILocation(line: 12, column: 3, scope: !27)
!29 = !DILocation(line: 13, column: 12, scope: !27)
!30 = !DILocation(line: 13, column: 24, scope: !27)
!31 = !DILocation(line: 13, column: 40, scope: !27)
!32 = !DILocation(line: 13, column: 3, scope: !27)
!33 = !DILocalVariable(name: "i", scope: !34, file: !3, line: 15, type: !17)
!34 = distinct !DILexicalBlock(scope: !27, file: !3, line: 15, column: 3)
!35 = !DILocation(line: 0, scope: !34)
!36 = !DILocation(line: 15, column: 8, scope: !34)
!37 = !DILocation(line: 15, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 15, column: 3)
!39 = !DILocation(line: 15, column: 3, scope: !34)
!40 = !DILocalVariable(name: "t", scope: !41, file: !3, line: 16, type: !15)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 15, column: 41)
!42 = !DILocation(line: 16, column: 9, scope: !41)
!43 = !DILocation(line: 16, column: 23, scope: !41)
!44 = !DILocation(line: 16, column: 21, scope: !41)
!45 = !DILocation(line: 16, column: 28, scope: !41)
!46 = !DILocation(line: 16, column: 26, scope: !41)
!47 = !{!"branch_weights", i32 1, i32 1048575}
!48 = !DILocation(line: 16, column: 32, scope: !41)
!49 = !DILocation(line: 16, column: 30, scope: !41)
!50 = !DILocation(line: 16, column: 13, scope: !41)
!51 = !DILocation(line: 16, column: 43, scope: !41)
!52 = !DILocation(line: 16, column: 37, scope: !41)
!53 = !DILocation(line: 16, column: 35, scope: !41)
!54 = !DILocation(line: 17, column: 21, scope: !41)
!55 = !DILocation(line: 17, column: 30, scope: !41)
!56 = !DILocation(line: 17, column: 28, scope: !41)
!57 = !DILocation(line: 17, column: 10, scope: !41)
!58 = !DILocation(line: 17, column: 4, scope: !41)
!59 = !DILocation(line: 17, column: 19, scope: !41)
!60 = !DILocation(line: 18, column: 21, scope: !41)
!61 = !DILocation(line: 18, column: 30, scope: !41)
!62 = !DILocation(line: 18, column: 28, scope: !41)
!63 = !DILocation(line: 18, column: 11, scope: !41)
!64 = !DILocation(line: 18, column: 15, scope: !41)
!65 = !DILocation(line: 18, column: 4, scope: !41)
!66 = !DILocation(line: 18, column: 19, scope: !41)
!67 = !DILocation(line: 19, column: 3, scope: !41)
!68 = !DILocation(line: 15, column: 33, scope: !38)
!69 = !DILocation(line: 15, column: 28, scope: !38)
!70 = !DILocation(line: 15, column: 3, scope: !38)
!71 = distinct !{!71, !39, !72}
!72 = !DILocation(line: 19, column: 3, scope: !34)
!73 = !DILocation(line: 20, column: 2, scope: !27)
!74 = !DILocation(line: 21, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "fft", scope: !3, file: !3, line: 23, type: !76, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !14, !17}
!78 = !DILocalVariable(name: "buf", arg: 1, scope: !75, file: !3, line: 23, type: !14)
!79 = !DILocation(line: 0, scope: !75)
!80 = !DILocalVariable(name: "n", arg: 2, scope: !75, file: !3, line: 23, type: !17)
!81 = !DILocation(line: 25, column: 2, scope: !75)
!82 = !DILocalVariable(name: "__vla_expr0", scope: !75, type: !83, flags: DIFlagArtificial)
!83 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!84 = !DILocalVariable(name: "out", scope: !75, file: !3, line: 25, type: !85)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: !82)
!88 = !DILocation(line: 25, column: 7, scope: !75)
!89 = !DILocalVariable(name: "i", scope: !90, file: !3, line: 26, type: !17)
!90 = distinct !DILexicalBlock(scope: !75, file: !3, line: 26, column: 2)
!91 = !DILocation(line: 0, scope: !90)
!92 = !DILocation(line: 26, column: 7, scope: !90)
!93 = !DILocation(line: 26, column: 20, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 26, column: 2)
!95 = !DILocation(line: 26, column: 2, scope: !90)
!96 = !DILocation(line: 26, column: 39, scope: !94)
!97 = !DILocation(line: 26, column: 30, scope: !94)
!98 = !DILocation(line: 26, column: 37, scope: !94)
!99 = !DILocation(line: 26, column: 26, scope: !94)
!100 = !DILocation(line: 26, column: 2, scope: !94)
!101 = distinct !{!101, !95, !102}
!102 = !DILocation(line: 26, column: 44, scope: !90)
!103 = !DILocation(line: 27, column: 2, scope: !75)
!104 = !DILocation(line: 28, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "pad_two", scope: !3, file: !3, line: 31, type: !106, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!14, !108, !17, !109}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!110 = !DILocalVariable(name: "g", arg: 1, scope: !105, file: !3, line: 31, type: !108)
!111 = !DILocation(line: 0, scope: !105)
!112 = !DILocalVariable(name: "len", arg: 2, scope: !105, file: !3, line: 31, type: !17)
!113 = !DILocalVariable(name: "ns", arg: 3, scope: !105, file: !3, line: 31, type: !109)
!114 = !DILocalVariable(name: "n", scope: !105, file: !3, line: 33, type: !17)
!115 = !DILocation(line: 34, column: 6, scope: !116)
!116 = distinct !DILexicalBlock(scope: !105, file: !3, line: 34, column: 6)
!117 = !DILocation(line: 34, column: 6, scope: !105)
!118 = !DILocation(line: 34, column: 15, scope: !116)
!119 = !DILocation(line: 34, column: 11, scope: !116)
!120 = !DILocation(line: 35, column: 7, scope: !116)
!121 = !DILocation(line: 35, column: 16, scope: !116)
!122 = !DILocation(line: 35, column: 25, scope: !116)
!123 = distinct !{!123, !120, !124}
!124 = !DILocation(line: 35, column: 28, scope: !116)
!125 = !DILocation(line: 37, column: 35, scope: !105)
!126 = !DILocation(line: 37, column: 14, scope: !105)
!127 = !DILocalVariable(name: "buf", scope: !105, file: !3, line: 37, type: !14)
!128 = !DILocalVariable(name: "i", scope: !129, file: !3, line: 38, type: !17)
!129 = distinct !DILexicalBlock(scope: !105, file: !3, line: 38, column: 2)
!130 = !DILocation(line: 0, scope: !129)
!131 = !DILocation(line: 38, column: 7, scope: !129)
!132 = !DILocation(line: 38, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !3, line: 38, column: 2)
!134 = !DILocation(line: 38, column: 2, scope: !129)
!135 = !DILocation(line: 38, column: 41, scope: !133)
!136 = !DILocation(line: 38, column: 32, scope: !133)
!137 = !DILocation(line: 38, column: 39, scope: !133)
!138 = !DILocation(line: 38, column: 28, scope: !133)
!139 = !DILocation(line: 38, column: 2, scope: !133)
!140 = distinct !{!140, !134, !141}
!141 = !DILocation(line: 38, column: 44, scope: !129)
!142 = !DILocation(line: 39, column: 6, scope: !105)
!143 = !DILocation(line: 40, column: 2, scope: !105)
!144 = distinct !DISubprogram(name: "deconv", scope: !3, file: !3, line: 43, type: !145, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DISubroutineType(types: !146)
!146 = !{null, !108, !17, !108, !17, !108}
!147 = !DILocalVariable(name: "g", arg: 1, scope: !144, file: !3, line: 43, type: !108)
!148 = !DILocation(line: 0, scope: !144)
!149 = !DILocalVariable(name: "lg", arg: 2, scope: !144, file: !3, line: 43, type: !17)
!150 = !DILocalVariable(name: "f", arg: 3, scope: !144, file: !3, line: 43, type: !108)
!151 = !DILocalVariable(name: "lf", arg: 4, scope: !144, file: !3, line: 43, type: !17)
!152 = !DILocalVariable(name: "out", arg: 5, scope: !144, file: !3, line: 43, type: !108)
!153 = !DILocalVariable(name: "ns", scope: !144, file: !3, line: 44, type: !17)
!154 = !DILocation(line: 44, column: 6, scope: !144)
!155 = !DILocation(line: 45, column: 13, scope: !144)
!156 = !DILocalVariable(name: "g2", scope: !144, file: !3, line: 45, type: !14)
!157 = !DILocation(line: 46, column: 13, scope: !144)
!158 = !DILocalVariable(name: "f2", scope: !144, file: !3, line: 46, type: !14)
!159 = !DILocation(line: 48, column: 10, scope: !144)
!160 = !DILocation(line: 48, column: 2, scope: !144)
!161 = !DILocation(line: 49, column: 10, scope: !144)
!162 = !DILocation(line: 49, column: 2, scope: !144)
!163 = !DILocation(line: 51, column: 9, scope: !144)
!164 = !DILocation(line: 51, column: 2, scope: !144)
!165 = !DILocalVariable(name: "__vla_expr0", scope: !144, type: !83, flags: DIFlagArtificial)
!166 = !DILocalVariable(name: "h", scope: !144, file: !3, line: 51, type: !167)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: !165)
!170 = !DILocation(line: 51, column: 7, scope: !144)
!171 = !DILocalVariable(name: "i", scope: !172, file: !3, line: 52, type: !17)
!172 = distinct !DILexicalBlock(scope: !144, file: !3, line: 52, column: 2)
!173 = !DILocation(line: 0, scope: !172)
!174 = !DILocation(line: 52, column: 7, scope: !172)
!175 = !DILocation(line: 52, column: 22, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !3, line: 52, column: 2)
!177 = !DILocation(line: 52, column: 20, scope: !176)
!178 = !DILocation(line: 52, column: 2, scope: !172)
!179 = !DILocation(line: 52, column: 38, scope: !176)
!180 = !DILocation(line: 52, column: 46, scope: !176)
!181 = !DILocation(line: 52, column: 44, scope: !176)
!182 = !DILocation(line: 52, column: 31, scope: !176)
!183 = !DILocation(line: 52, column: 36, scope: !176)
!184 = !DILocation(line: 52, column: 27, scope: !176)
!185 = !DILocation(line: 52, column: 2, scope: !176)
!186 = distinct !{!186, !178, !187}
!187 = !DILocation(line: 52, column: 50, scope: !172)
!188 = !DILocation(line: 53, column: 9, scope: !144)
!189 = !DILocation(line: 53, column: 2, scope: !144)
!190 = !DILocalVariable(name: "i", scope: !191, file: !3, line: 55, type: !17)
!191 = distinct !DILexicalBlock(scope: !144, file: !3, line: 55, column: 2)
!192 = !DILocation(line: 0, scope: !191)
!193 = !DILocation(line: 55, column: 7, scope: !191)
!194 = !DILocation(line: 55, column: 26, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !3, line: 55, column: 2)
!196 = !DILocation(line: 55, column: 20, scope: !195)
!197 = !DILocation(line: 55, column: 2, scope: !191)
!198 = !DILocation(line: 56, column: 20, scope: !195)
!199 = !DILocation(line: 56, column: 18, scope: !195)
!200 = !DILocation(line: 56, column: 26, scope: !195)
!201 = !DILocation(line: 56, column: 24, scope: !195)
!202 = !DILocation(line: 56, column: 13, scope: !195)
!203 = !DILocation(line: 56, column: 29, scope: !195)
!204 = !DILocation(line: 56, column: 7, scope: !195)
!205 = !DILocation(line: 56, column: 3, scope: !195)
!206 = !DILocation(line: 56, column: 11, scope: !195)
!207 = !DILocation(line: 55, column: 33, scope: !195)
!208 = !DILocation(line: 55, column: 2, scope: !195)
!209 = distinct !{!209, !197, !210}
!210 = !DILocation(line: 56, column: 30, scope: !191)
!211 = !DILocation(line: 57, column: 7, scope: !144)
!212 = !DILocation(line: 57, column: 2, scope: !144)
!213 = !DILocation(line: 58, column: 7, scope: !144)
!214 = !DILocation(line: 58, column: 2, scope: !144)
!215 = !DILocation(line: 59, column: 1, scope: !144)
!216 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 61, type: !217, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!217 = !DISubroutineType(types: !218)
!218 = !{!17}
!219 = !DILocation(line: 63, column: 7, scope: !216)
!220 = !DILocation(line: 63, column: 18, scope: !216)
!221 = !DILocation(line: 63, column: 5, scope: !216)
!222 = !DILocalVariable(name: "g", scope: !216, file: !3, line: 64, type: !223)
!223 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1344, elements: !224)
!224 = !{!225}
!225 = !DISubrange(count: 21)
!226 = !DILocation(line: 64, column: 9, scope: !216)
!227 = !DILocalVariable(name: "f", scope: !216, file: !3, line: 65, type: !228)
!228 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1024, elements: !229)
!229 = !{!230}
!230 = !DISubrange(count: 16)
!231 = !DILocation(line: 65, column: 9, scope: !216)
!232 = !DILocalVariable(name: "h", scope: !216, file: !3, line: 66, type: !233)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 384, elements: !234)
!234 = !{!235}
!235 = !DISubrange(count: 6)
!236 = !DILocation(line: 66, column: 9, scope: !216)
!237 = !DILocalVariable(name: "lg", scope: !216, file: !3, line: 68, type: !17)
!238 = !DILocation(line: 0, scope: !216)
!239 = !DILocalVariable(name: "lf", scope: !216, file: !3, line: 69, type: !17)
!240 = !DILocalVariable(name: "lh", scope: !216, file: !3, line: 70, type: !17)
!241 = !DILocation(line: 72, column: 2, scope: !216)
!242 = !DILocalVariable(name: "__vla_expr0", scope: !216, type: !83, flags: DIFlagArtificial)
!243 = !DILocalVariable(name: "h2", scope: !216, file: !3, line: 72, type: !244)
!244 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !245)
!245 = !{!246}
!246 = !DISubrange(count: !242)
!247 = !DILocation(line: 72, column: 9, scope: !216)
!248 = !DILocation(line: 73, column: 2, scope: !216)
!249 = !DILocalVariable(name: "__vla_expr1", scope: !216, type: !83, flags: DIFlagArtificial)
!250 = !DILocalVariable(name: "f2", scope: !216, file: !3, line: 73, type: !251)
!251 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !252)
!252 = !{!253}
!253 = !DISubrange(count: !249)
!254 = !DILocation(line: 73, column: 9, scope: !216)
!255 = !DILocation(line: 75, column: 2, scope: !216)
!256 = !DILocalVariable(name: "i", scope: !257, file: !3, line: 76, type: !17)
!257 = distinct !DILexicalBlock(scope: !216, file: !3, line: 76, column: 2)
!258 = !DILocation(line: 0, scope: !257)
!259 = !DILocation(line: 76, column: 7, scope: !257)
!260 = !DILocation(line: 76, column: 20, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !3, line: 76, column: 2)
!262 = !DILocation(line: 76, column: 2, scope: !257)
!263 = !DILocation(line: 76, column: 45, scope: !261)
!264 = !DILocation(line: 76, column: 31, scope: !261)
!265 = !DILocation(line: 76, column: 27, scope: !261)
!266 = !DILocation(line: 76, column: 2, scope: !261)
!267 = distinct !{!267, !262, !268}
!268 = !DILocation(line: 76, column: 49, scope: !257)
!269 = !DILocation(line: 77, column: 2, scope: !216)
!270 = !DILocation(line: 79, column: 2, scope: !216)
!271 = !DILocation(line: 80, column: 9, scope: !216)
!272 = !DILocation(line: 80, column: 16, scope: !216)
!273 = !DILocation(line: 80, column: 2, scope: !216)
!274 = !DILocalVariable(name: "i", scope: !275, file: !3, line: 81, type: !17)
!275 = distinct !DILexicalBlock(scope: !216, file: !3, line: 81, column: 2)
!276 = !DILocation(line: 0, scope: !275)
!277 = !DILocation(line: 81, column: 7, scope: !275)
!278 = !DILocation(line: 81, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !3, line: 81, column: 2)
!280 = !DILocation(line: 81, column: 2, scope: !275)
!281 = !DILocation(line: 81, column: 45, scope: !279)
!282 = !DILocation(line: 81, column: 31, scope: !279)
!283 = !DILocation(line: 81, column: 27, scope: !279)
!284 = !DILocation(line: 81, column: 2, scope: !279)
!285 = distinct !{!285, !280, !286}
!286 = !DILocation(line: 81, column: 50, scope: !275)
!287 = !DILocation(line: 82, column: 2, scope: !216)
!288 = !DILocation(line: 84, column: 2, scope: !216)
!289 = !DILocalVariable(name: "i", scope: !290, file: !3, line: 85, type: !17)
!290 = distinct !DILexicalBlock(scope: !216, file: !3, line: 85, column: 2)
!291 = !DILocation(line: 0, scope: !290)
!292 = !DILocation(line: 85, column: 7, scope: !290)
!293 = !DILocation(line: 85, column: 20, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !3, line: 85, column: 2)
!295 = !DILocation(line: 85, column: 2, scope: !290)
!296 = !DILocation(line: 85, column: 45, scope: !294)
!297 = !DILocation(line: 85, column: 31, scope: !294)
!298 = !DILocation(line: 85, column: 27, scope: !294)
!299 = !DILocation(line: 85, column: 2, scope: !294)
!300 = distinct !{!300, !295, !301}
!301 = !DILocation(line: 85, column: 49, scope: !290)
!302 = !DILocation(line: 86, column: 2, scope: !216)
!303 = !DILocation(line: 88, column: 2, scope: !216)
!304 = !DILocation(line: 89, column: 9, scope: !216)
!305 = !DILocation(line: 89, column: 16, scope: !216)
!306 = !DILocation(line: 89, column: 2, scope: !216)
!307 = !DILocalVariable(name: "i", scope: !308, file: !3, line: 90, type: !17)
!308 = distinct !DILexicalBlock(scope: !216, file: !3, line: 90, column: 2)
!309 = !DILocation(line: 0, scope: !308)
!310 = !DILocation(line: 90, column: 7, scope: !308)
!311 = !DILocation(line: 90, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 90, column: 2)
!313 = !DILocation(line: 90, column: 2, scope: !308)
!314 = !DILocation(line: 90, column: 45, scope: !312)
!315 = !DILocation(line: 90, column: 31, scope: !312)
!316 = !DILocation(line: 90, column: 27, scope: !312)
!317 = !DILocation(line: 90, column: 2, scope: !312)
!318 = distinct !{!318, !313, !319}
!319 = !DILocation(line: 90, column: 50, scope: !308)
!320 = !DILocation(line: 91, column: 2, scope: !216)
!321 = !DILocation(line: 92, column: 1, scope: !216)
