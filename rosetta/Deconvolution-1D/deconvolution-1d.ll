; ModuleID = 'deconvolution-1d.c'
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
  %buf.addr = alloca { double, double }*, align 8
  %out.addr = alloca { double, double }*, align 8
  %n.addr = alloca i32, align 4
  %step.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca { double, double }, align 8
  %coerce = alloca { double, double }, align 8
  store { double, double }* %buf, { double, double }** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata { double, double }** %buf.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store { double, double }* %out, { double, double }** %out.addr, align 8
  call void @llvm.dbg.declare(metadata { double, double }** %out.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %step, i32* %step.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %step.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32, i32* %step.addr, align 4, !dbg !26
  %1 = load i32, i32* %n.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %0, %1, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30, !cf.info !31

if.then:                                          ; preds = %entry
  %2 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !32
  %3 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !34
  %4 = load i32, i32* %n.addr, align 4, !dbg !35
  %5 = load i32, i32* %step.addr, align 4, !dbg !36
  %mul = mul nsw i32 %5, 2, !dbg !37
  call void @_fft({ double, double }* %2, { double, double }* %3, i32 %4, i32 %mul), !dbg !38
  %6 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !39
  %7 = load i32, i32* %step.addr, align 4, !dbg !40
  %idx.ext = sext i32 %7 to i64, !dbg !41
  %add.ptr = getelementptr inbounds { double, double }, { double, double }* %6, i64 %idx.ext, !dbg !41
  %8 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !42
  %9 = load i32, i32* %step.addr, align 4, !dbg !43
  %idx.ext1 = sext i32 %9 to i64, !dbg !44
  %add.ptr2 = getelementptr inbounds { double, double }, { double, double }* %8, i64 %idx.ext1, !dbg !44
  %10 = load i32, i32* %n.addr, align 4, !dbg !45
  %11 = load i32, i32* %step.addr, align 4, !dbg !46
  %mul3 = mul nsw i32 %11, 2, !dbg !47
  call void @_fft({ double, double }* %add.ptr, { double, double }* %add.ptr2, i32 %10, i32 %mul3), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !51
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32, i32* %i, align 4, !dbg !53
  %13 = load i32, i32* %n.addr, align 4, !dbg !55
  %cmp4 = icmp slt i32 %12, %13, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata { double, double }* %t, metadata !58, metadata !DIExpression()), !dbg !60
  %14 = load double, double* @PI, align 8, !dbg !61
  %mul.rl = fmul double -0.000000e+00, %14, !dbg !62
  %mul.il = fmul double -1.000000e+00, %14, !dbg !62
  %15 = load i32, i32* %i, align 4, !dbg !63
  %conv = sitofp i32 %15 to double, !dbg !63
  %mul_ac = fmul double %mul.rl, %conv, !dbg !64
  %mul_bd = fmul double %mul.il, 0.000000e+00, !dbg !64
  %mul_ad = fmul double %mul.rl, 0.000000e+00, !dbg !64
  %mul_bc = fmul double %mul.il, %conv, !dbg !64
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !64
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !64
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !64
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !64, !prof !65

complex_mul_imag_nan:                             ; preds = %for.body
  %isnan_cmp5 = fcmp uno double %mul_i, %mul_i, !dbg !64
  br i1 %isnan_cmp5, label %complex_mul_libcall, label %complex_mul_cont, !dbg !64, !prof !65

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call { double, double } @__muldc3(double %mul.rl, double %mul.il, double %conv, double 0.000000e+00) #3, !dbg !64
  %16 = extractvalue { double, double } %call, 0, !dbg !64
  %17 = extractvalue { double, double } %call, 1, !dbg !64
  br label %complex_mul_cont, !dbg !64

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi double [ %mul_r, %for.body ], [ %mul_r, %complex_mul_imag_nan ], [ %16, %complex_mul_libcall ], !dbg !64
  %imag_mul_phi = phi double [ %mul_i, %for.body ], [ %mul_i, %complex_mul_imag_nan ], [ %17, %complex_mul_libcall ], !dbg !64
  %18 = load i32, i32* %n.addr, align 4, !dbg !66
  %conv6 = sitofp i32 %18 to double, !dbg !66
  %call7 = call { double, double } @__divdc3(double %real_mul_phi, double %imag_mul_phi, double %conv6, double 0.000000e+00) #3, !dbg !67
  %19 = extractvalue { double, double } %call7, 0, !dbg !67
  %20 = extractvalue { double, double } %call7, 1, !dbg !67
  %coerce.realp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !68
  %coerce.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !68
  store double %19, double* %coerce.realp, align 8, !dbg !68
  store double %20, double* %coerce.imagp, align 8, !dbg !68
  %21 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !68
  %22 = load double, double* %21, align 8, !dbg !68
  %23 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !68
  %24 = load double, double* %23, align 8, !dbg !68
  %call8 = call { double, double } @cexp(double %22, double %24) #3, !dbg !68
  %25 = extractvalue { double, double } %call8, 0, !dbg !68
  %26 = extractvalue { double, double } %call8, 1, !dbg !68
  %27 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !69
  %28 = load i32, i32* %i, align 4, !dbg !70
  %29 = load i32, i32* %step.addr, align 4, !dbg !71
  %add = add nsw i32 %28, %29, !dbg !72
  %idxprom = sext i32 %add to i64, !dbg !69
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom, !dbg !69
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !69
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !69
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !69
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !69
  %mul_ac9 = fmul double %25, %arrayidx.real, !dbg !73
  %mul_bd10 = fmul double %26, %arrayidx.imag, !dbg !73
  %mul_ad11 = fmul double %25, %arrayidx.imag, !dbg !73
  %mul_bc12 = fmul double %26, %arrayidx.real, !dbg !73
  %mul_r13 = fsub double %mul_ac9, %mul_bd10, !dbg !73
  %mul_i14 = fadd double %mul_ad11, %mul_bc12, !dbg !73
  %isnan_cmp15 = fcmp uno double %mul_r13, %mul_r13, !dbg !73
  br i1 %isnan_cmp15, label %complex_mul_imag_nan16, label %complex_mul_cont20, !dbg !73, !prof !65

complex_mul_imag_nan16:                           ; preds = %complex_mul_cont
  %isnan_cmp17 = fcmp uno double %mul_i14, %mul_i14, !dbg !73
  br i1 %isnan_cmp17, label %complex_mul_libcall18, label %complex_mul_cont20, !dbg !73, !prof !65

complex_mul_libcall18:                            ; preds = %complex_mul_imag_nan16
  %call19 = call { double, double } @__muldc3(double %25, double %26, double %arrayidx.real, double %arrayidx.imag) #3, !dbg !73
  %30 = extractvalue { double, double } %call19, 0, !dbg !73
  %31 = extractvalue { double, double } %call19, 1, !dbg !73
  br label %complex_mul_cont20, !dbg !73

complex_mul_cont20:                               ; preds = %complex_mul_libcall18, %complex_mul_imag_nan16, %complex_mul_cont
  %real_mul_phi21 = phi double [ %mul_r13, %complex_mul_cont ], [ %mul_r13, %complex_mul_imag_nan16 ], [ %30, %complex_mul_libcall18 ], !dbg !73
  %imag_mul_phi22 = phi double [ %mul_i14, %complex_mul_cont ], [ %mul_i14, %complex_mul_imag_nan16 ], [ %31, %complex_mul_libcall18 ], !dbg !73
  %t.realp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !60
  %t.imagp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !60
  store double %real_mul_phi21, double* %t.realp, align 8, !dbg !60
  store double %imag_mul_phi22, double* %t.imagp, align 8, !dbg !60
  %32 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !74
  %33 = load i32, i32* %i, align 4, !dbg !75
  %idxprom23 = sext i32 %33 to i64, !dbg !74
  %arrayidx24 = getelementptr inbounds { double, double }, { double, double }* %32, i64 %idxprom23, !dbg !74
  %arrayidx24.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 0, !dbg !74
  %arrayidx24.real = load double, double* %arrayidx24.realp, align 8, !dbg !74
  %arrayidx24.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 1, !dbg !74
  %arrayidx24.imag = load double, double* %arrayidx24.imagp, align 8, !dbg !74
  %t.realp25 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !76
  %t.real = load double, double* %t.realp25, align 8, !dbg !76
  %t.imagp26 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !76
  %t.imag = load double, double* %t.imagp26, align 8, !dbg !76
  %add.r = fadd double %arrayidx24.real, %t.real, !dbg !77
  %add.i = fadd double %arrayidx24.imag, %t.imag, !dbg !77
  %34 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !78
  %35 = load i32, i32* %i, align 4, !dbg !79
  %div = sdiv i32 %35, 2, !dbg !80
  %idxprom27 = sext i32 %div to i64, !dbg !78
  %arrayidx28 = getelementptr inbounds { double, double }, { double, double }* %34, i64 %idxprom27, !dbg !78
  %arrayidx28.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 0, !dbg !81
  %arrayidx28.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 1, !dbg !81
  store double %add.r, double* %arrayidx28.realp, align 8, !dbg !81
  store double %add.i, double* %arrayidx28.imagp, align 8, !dbg !81
  %36 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !82
  %37 = load i32, i32* %i, align 4, !dbg !83
  %idxprom29 = sext i32 %37 to i64, !dbg !82
  %arrayidx30 = getelementptr inbounds { double, double }, { double, double }* %36, i64 %idxprom29, !dbg !82
  %arrayidx30.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 0, !dbg !82
  %arrayidx30.real = load double, double* %arrayidx30.realp, align 8, !dbg !82
  %arrayidx30.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 1, !dbg !82
  %arrayidx30.imag = load double, double* %arrayidx30.imagp, align 8, !dbg !82
  %t.realp31 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !84
  %t.real32 = load double, double* %t.realp31, align 8, !dbg !84
  %t.imagp33 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !84
  %t.imag34 = load double, double* %t.imagp33, align 8, !dbg !84
  %sub.r = fsub double %arrayidx30.real, %t.real32, !dbg !85
  %sub.i = fsub double %arrayidx30.imag, %t.imag34, !dbg !85
  %38 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !86
  %39 = load i32, i32* %i, align 4, !dbg !87
  %40 = load i32, i32* %n.addr, align 4, !dbg !88
  %add35 = add nsw i32 %39, %40, !dbg !89
  %div36 = sdiv i32 %add35, 2, !dbg !90
  %idxprom37 = sext i32 %div36 to i64, !dbg !86
  %arrayidx38 = getelementptr inbounds { double, double }, { double, double }* %38, i64 %idxprom37, !dbg !86
  %arrayidx38.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 0, !dbg !91
  %arrayidx38.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 1, !dbg !91
  store double %sub.r, double* %arrayidx38.realp, align 8, !dbg !91
  store double %sub.i, double* %arrayidx38.imagp, align 8, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %complex_mul_cont20
  %41 = load i32, i32* %step.addr, align 4, !dbg !93
  %mul39 = mul nsw i32 2, %41, !dbg !94
  %42 = load i32, i32* %i, align 4, !dbg !95
  %add40 = add nsw i32 %42, %mul39, !dbg !95
  store i32 %add40, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !99

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local { double, double } @cexp(double, double) #2

declare dso_local { double, double } @__muldc3(double, double, double, double)

declare dso_local { double, double } @__divdc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft({ double, double }* %buf, i32 %n) #0 !dbg !101 {
entry:
  %buf.addr = alloca { double, double }*, align 8
  %n.addr = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %i = alloca i32, align 4
  store { double, double }* %buf, { double, double }** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata { double, double }** %buf.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* %n.addr, align 4, !dbg !108
  %1 = zext i32 %0 to i64, !dbg !109
  %2 = call i8* @llvm.stacksave(), !dbg !109
  store i8* %2, i8** %saved_stack, align 8, !dbg !109
  %vla = alloca { double, double }, i64 %1, align 16, !dbg !109
  store i64 %1, i64* %__vla_expr0, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !113, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i32 0, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !122
  %4 = load i32, i32* %n.addr, align 4, !dbg !124
  %cmp = icmp slt i32 %3, %4, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %5 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !127
  %6 = load i32, i32* %i, align 4, !dbg !128
  %idxprom = sext i32 %6 to i64, !dbg !127
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %5, i64 %idxprom, !dbg !127
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !127
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !127
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !127
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !127
  %7 = load i32, i32* %i, align 4, !dbg !129
  %idxprom1 = sext i32 %7 to i64, !dbg !130
  %arrayidx2 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom1, !dbg !130
  %arrayidx2.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 0, !dbg !131
  %arrayidx2.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 1, !dbg !131
  store double %arrayidx.real, double* %arrayidx2.realp, align 16, !dbg !131
  store double %arrayidx.imag, double* %arrayidx2.imagp, align 8, !dbg !131
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !132
  %inc = add nsw i32 %8, 1, !dbg !132
  store i32 %inc, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !136
  %10 = load i32, i32* %n.addr, align 4, !dbg !137
  call void @_fft({ double, double }* %9, { double, double }* %vla, i32 %10, i32 1), !dbg !138
  %11 = load i8*, i8** %saved_stack, align 8, !dbg !139
  call void @llvm.stackrestore(i8* %11), !dbg !139
  ret void, !dbg !139
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double }* @pad_two(double* %g, i32 %len, i32* %ns) #0 !dbg !140 {
entry:
  %g.addr = alloca double*, align 8
  %len.addr = alloca i32, align 4
  %ns.addr = alloca i32*, align 8
  %n = alloca i32, align 4
  %buf = alloca { double, double }*, align 8
  %i = alloca i32, align 4
  store double* %g, double** %g.addr, align 8
  call void @llvm.dbg.declare(metadata double** %g.addr, metadata !145, metadata !DIExpression()), !dbg !146
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !147, metadata !DIExpression()), !dbg !148
  store i32* %ns, i32** %ns.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %ns.addr, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %n, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 1, i32* %n, align 4, !dbg !152
  %0 = load i32*, i32** %ns.addr, align 8, !dbg !153
  %1 = load i32, i32* %0, align 4, !dbg !155
  %tobool = icmp ne i32 %1, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.else, !dbg !156, !cf.info !31

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %ns.addr, align 8, !dbg !157
  %3 = load i32, i32* %2, align 4, !dbg !158
  store i32 %3, i32* %n, align 4, !dbg !159
  br label %if.end, !dbg !160

if.else:                                          ; preds = %entry
  br label %while.cond, !dbg !161

while.cond:                                       ; preds = %while.body, %if.else
  %4 = load i32, i32* %n, align 4, !dbg !162
  %5 = load i32, i32* %len.addr, align 4, !dbg !163
  %cmp = icmp slt i32 %4, %5, !dbg !164
  br i1 %cmp, label %while.body, label %while.end, !dbg !161

while.body:                                       ; preds = %while.cond
  %6 = load i32, i32* %n, align 4, !dbg !165
  %mul = mul nsw i32 %6, 2, !dbg !165
  store i32 %mul, i32* %n, align 4, !dbg !165
  br label %while.cond, !dbg !161, !llvm.loop !166

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  call void @llvm.dbg.declare(metadata { double, double }** %buf, metadata !168, metadata !DIExpression()), !dbg !169
  %7 = load i32, i32* %n, align 4, !dbg !170
  %conv = sext i32 %7 to i64, !dbg !170
  %call = call noalias i8* @calloc(i64 16, i64 %conv) #3, !dbg !171
  %8 = bitcast i8* %call to { double, double }*, !dbg !171
  store { double, double }* %8, { double, double }** %buf, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !174
  store i32 0, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32, i32* %i, align 4, !dbg !176
  %10 = load i32, i32* %len.addr, align 4, !dbg !178
  %cmp1 = icmp slt i32 %9, %10, !dbg !179
  br i1 %cmp1, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %11 = load double*, double** %g.addr, align 8, !dbg !181
  %12 = load i32, i32* %i, align 4, !dbg !182
  %idxprom = sext i32 %12 to i64, !dbg !181
  %arrayidx = getelementptr inbounds double, double* %11, i64 %idxprom, !dbg !181
  %13 = load double, double* %arrayidx, align 8, !dbg !181
  %14 = load { double, double }*, { double, double }** %buf, align 8, !dbg !183
  %15 = load i32, i32* %i, align 4, !dbg !184
  %idxprom3 = sext i32 %15 to i64, !dbg !183
  %arrayidx4 = getelementptr inbounds { double, double }, { double, double }* %14, i64 %idxprom3, !dbg !183
  %arrayidx4.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 0, !dbg !185
  %arrayidx4.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 1, !dbg !185
  store double %13, double* %arrayidx4.realp, align 8, !dbg !185
  store double 0.000000e+00, double* %arrayidx4.imagp, align 8, !dbg !185
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %16, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* %n, align 4, !dbg !190
  %18 = load i32*, i32** %ns.addr, align 8, !dbg !191
  store i32 %17, i32* %18, align 4, !dbg !192
  %19 = load { double, double }*, { double, double }** %buf, align 8, !dbg !193
  ret { double, double }* %19, !dbg !194
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deconv(double* %g, i32 %lg, double* %f, i32 %lf, double* %out) #0 !dbg !195 {
entry:
  %g.addr = alloca double*, align 8
  %lg.addr = alloca i32, align 4
  %f.addr = alloca double*, align 8
  %lf.addr = alloca i32, align 4
  %out.addr = alloca double*, align 8
  %ns = alloca i32, align 4
  %g2 = alloca { double, double }*, align 8
  %f2 = alloca { double, double }*, align 8
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  store double* %g, double** %g.addr, align 8
  call void @llvm.dbg.declare(metadata double** %g.addr, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 %lg, i32* %lg.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lg.addr, metadata !200, metadata !DIExpression()), !dbg !201
  store double* %f, double** %f.addr, align 8
  call void @llvm.dbg.declare(metadata double** %f.addr, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 %lf, i32* %lf.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lf.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store double* %out, double** %out.addr, align 8
  call void @llvm.dbg.declare(metadata double** %out.addr, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i32* %ns, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 0, i32* %ns, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata { double, double }** %g2, metadata !210, metadata !DIExpression()), !dbg !211
  %0 = load double*, double** %g.addr, align 8, !dbg !212
  %1 = load i32, i32* %lg.addr, align 4, !dbg !213
  %call = call { double, double }* @pad_two(double* %0, i32 %1, i32* %ns), !dbg !214
  store { double, double }* %call, { double, double }** %g2, align 8, !dbg !211
  call void @llvm.dbg.declare(metadata { double, double }** %f2, metadata !215, metadata !DIExpression()), !dbg !216
  %2 = load double*, double** %f.addr, align 8, !dbg !217
  %3 = load i32, i32* %lf.addr, align 4, !dbg !218
  %call1 = call { double, double }* @pad_two(double* %2, i32 %3, i32* %ns), !dbg !219
  store { double, double }* %call1, { double, double }** %f2, align 8, !dbg !216
  %4 = load { double, double }*, { double, double }** %g2, align 8, !dbg !220
  %5 = load i32, i32* %ns, align 4, !dbg !221
  call void @fft({ double, double }* %4, i32 %5), !dbg !222
  %6 = load { double, double }*, { double, double }** %f2, align 8, !dbg !223
  %7 = load i32, i32* %ns, align 4, !dbg !224
  call void @fft({ double, double }* %6, i32 %7), !dbg !225
  %8 = load i32, i32* %ns, align 4, !dbg !226
  %9 = zext i32 %8 to i64, !dbg !227
  %10 = call i8* @llvm.stacksave(), !dbg !227
  store i8* %10, i8** %saved_stack, align 8, !dbg !227
  %vla = alloca { double, double }, i64 %9, align 16, !dbg !227
  store i64 %9, i64* %__vla_expr0, align 8, !dbg !227
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !230, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %i, metadata !235, metadata !DIExpression()), !dbg !237
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond, !dbg !238

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i32, i32* %i, align 4, !dbg !239
  %12 = load i32, i32* %ns, align 4, !dbg !241
  %cmp = icmp slt i32 %11, %12, !dbg !242
  br i1 %cmp, label %for.body, label %for.end, !dbg !243

for.body:                                         ; preds = %for.cond
  %13 = load { double, double }*, { double, double }** %g2, align 8, !dbg !244
  %14 = load i32, i32* %i, align 4, !dbg !245
  %idxprom = sext i32 %14 to i64, !dbg !244
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %13, i64 %idxprom, !dbg !244
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !244
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !244
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !244
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !244
  %15 = load { double, double }*, { double, double }** %f2, align 8, !dbg !246
  %16 = load i32, i32* %i, align 4, !dbg !247
  %idxprom2 = sext i32 %16 to i64, !dbg !246
  %arrayidx3 = getelementptr inbounds { double, double }, { double, double }* %15, i64 %idxprom2, !dbg !246
  %arrayidx3.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 0, !dbg !246
  %arrayidx3.real = load double, double* %arrayidx3.realp, align 8, !dbg !246
  %arrayidx3.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 1, !dbg !246
  %arrayidx3.imag = load double, double* %arrayidx3.imagp, align 8, !dbg !246
  %call4 = call { double, double } @__divdc3(double %arrayidx.real, double %arrayidx.imag, double %arrayidx3.real, double %arrayidx3.imag) #3, !dbg !248
  %17 = extractvalue { double, double } %call4, 0, !dbg !248
  %18 = extractvalue { double, double } %call4, 1, !dbg !248
  %19 = load i32, i32* %i, align 4, !dbg !249
  %idxprom5 = sext i32 %19 to i64, !dbg !250
  %arrayidx6 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom5, !dbg !250
  %arrayidx6.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 0, !dbg !251
  %arrayidx6.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 1, !dbg !251
  store double %17, double* %arrayidx6.realp, align 16, !dbg !251
  store double %18, double* %arrayidx6.imagp, align 8, !dbg !251
  br label %for.inc, !dbg !250

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !252
  %inc = add nsw i32 %20, 1, !dbg !252
  store i32 %inc, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !253, !llvm.loop !254

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %ns, align 4, !dbg !256
  call void @fft({ double, double }* %vla, i32 %21), !dbg !257
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !258, metadata !DIExpression()), !dbg !260
  store i32 0, i32* %i7, align 4, !dbg !260
  br label %for.cond8, !dbg !261

for.cond8:                                        ; preds = %for.inc17, %for.end
  %22 = load i32, i32* %i7, align 4, !dbg !262
  %23 = load i32, i32* %lf.addr, align 4, !dbg !264
  %24 = load i32, i32* %lg.addr, align 4, !dbg !265
  %sub = sub nsw i32 %23, %24, !dbg !266
  %cmp9 = icmp sge i32 %22, %sub, !dbg !267
  br i1 %cmp9, label %for.body10, label %for.end18, !dbg !268

for.body10:                                       ; preds = %for.cond8
  %25 = load i32, i32* %i7, align 4, !dbg !269
  %26 = load i32, i32* %ns, align 4, !dbg !270
  %add = add nsw i32 %25, %26, !dbg !271
  %27 = load i32, i32* %ns, align 4, !dbg !272
  %rem = srem i32 %add, %27, !dbg !273
  %idxprom11 = sext i32 %rem to i64, !dbg !274
  %arrayidx12 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom11, !dbg !274
  %arrayidx12.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 0, !dbg !274
  %arrayidx12.real = load double, double* %arrayidx12.realp, align 16, !dbg !274
  %arrayidx12.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 1, !dbg !274
  %arrayidx12.imag = load double, double* %arrayidx12.imagp, align 8, !dbg !274
  %call13 = call { double, double } @__divdc3(double %arrayidx12.real, double %arrayidx12.imag, double 3.200000e+01, double 0.000000e+00) #3, !dbg !275
  %28 = extractvalue { double, double } %call13, 0, !dbg !275
  %29 = extractvalue { double, double } %call13, 1, !dbg !275
  %30 = load double*, double** %out.addr, align 8, !dbg !276
  %31 = load i32, i32* %i7, align 4, !dbg !277
  %sub14 = sub nsw i32 0, %31, !dbg !278
  %idxprom15 = sext i32 %sub14 to i64, !dbg !276
  %arrayidx16 = getelementptr inbounds double, double* %30, i64 %idxprom15, !dbg !276
  store double %28, double* %arrayidx16, align 8, !dbg !279
  br label %for.inc17, !dbg !276

for.inc17:                                        ; preds = %for.body10
  %32 = load i32, i32* %i7, align 4, !dbg !280
  %dec = add nsw i32 %32, -1, !dbg !280
  store i32 %dec, i32* %i7, align 4, !dbg !280
  br label %for.cond8, !dbg !281, !llvm.loop !282

for.end18:                                        ; preds = %for.cond8
  %33 = load { double, double }*, { double, double }** %g2, align 8, !dbg !284
  %34 = bitcast { double, double }* %33 to i8*, !dbg !284
  call void @free(i8* %34) #3, !dbg !285
  %35 = load { double, double }*, { double, double }** %f2, align 8, !dbg !286
  %36 = bitcast { double, double }* %35 to i8*, !dbg !286
  call void @free(i8* %36) #3, !dbg !287
  %37 = load i8*, i8** %saved_stack, align 8, !dbg !288
  call void @llvm.stackrestore(i8* %37), !dbg !288
  ret void, !dbg !288
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !289 {
entry:
  %retval = alloca i32, align 4
  %g = alloca [21 x double], align 16
  %f = alloca [16 x double], align 16
  %h = alloca [6 x double], align 16
  %lg = alloca i32, align 4
  %lf = alloca i32, align 4
  %lh = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %__vla_expr1 = alloca i64, align 8
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %i19 = alloca i32, align 4
  %i33 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call double @atan2(double 1.000000e+00, double 1.000000e+00) #3, !dbg !292
  %mul = fmul double %call, 4.000000e+00, !dbg !293
  store double %mul, double* @PI, align 8, !dbg !294
  call void @llvm.dbg.declare(metadata [21 x double]* %g, metadata !295, metadata !DIExpression()), !dbg !299
  %0 = bitcast [21 x double]* %g to i8*, !dbg !299
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([21 x double]* @__const.main.g to i8*), i64 168, i1 false), !dbg !299
  call void @llvm.dbg.declare(metadata [16 x double]* %f, metadata !300, metadata !DIExpression()), !dbg !304
  %1 = bitcast [16 x double]* %f to i8*, !dbg !304
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([16 x double]* @__const.main.f to i8*), i64 128, i1 false), !dbg !304
  call void @llvm.dbg.declare(metadata [6 x double]* %h, metadata !305, metadata !DIExpression()), !dbg !309
  %2 = bitcast [6 x double]* %h to i8*, !dbg !309
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 48, i1 false), !dbg !309
  %3 = bitcast i8* %2 to [6 x double]*, !dbg !309
  %4 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 0, !dbg !309
  store double -8.000000e+00, double* %4, align 16, !dbg !309
  %5 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 1, !dbg !309
  store double -9.000000e+00, double* %5, align 8, !dbg !309
  %6 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 2, !dbg !309
  store double -3.000000e+00, double* %6, align 16, !dbg !309
  %7 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 3, !dbg !309
  store double -1.000000e+00, double* %7, align 8, !dbg !309
  %8 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 4, !dbg !309
  store double -6.000000e+00, double* %8, align 16, !dbg !309
  %9 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 5, !dbg !309
  store double 7.000000e+00, double* %9, align 8, !dbg !309
  call void @llvm.dbg.declare(metadata i32* %lg, metadata !310, metadata !DIExpression()), !dbg !311
  store i32 21, i32* %lg, align 4, !dbg !311
  call void @llvm.dbg.declare(metadata i32* %lf, metadata !312, metadata !DIExpression()), !dbg !313
  store i32 16, i32* %lf, align 4, !dbg !313
  call void @llvm.dbg.declare(metadata i32* %lh, metadata !314, metadata !DIExpression()), !dbg !315
  store i32 6, i32* %lh, align 4, !dbg !315
  %10 = load i32, i32* %lh, align 4, !dbg !316
  %11 = zext i32 %10 to i64, !dbg !317
  %12 = call i8* @llvm.stacksave(), !dbg !317
  store i8* %12, i8** %saved_stack, align 8, !dbg !317
  %vla = alloca double, i64 %11, align 16, !dbg !317
  store i64 %11, i64* %__vla_expr0, align 8, !dbg !317
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !318, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata double* %vla, metadata !320, metadata !DIExpression()), !dbg !324
  %13 = load i32, i32* %lf, align 4, !dbg !325
  %14 = zext i32 %13 to i64, !dbg !326
  %vla1 = alloca double, i64 %14, align 16, !dbg !326
  store i64 %14, i64* %__vla_expr1, align 8, !dbg !326
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !327, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata double* %vla1, metadata !328, metadata !DIExpression()), !dbg !332
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)), !dbg !333
  call void @llvm.dbg.declare(metadata i32* %i, metadata !334, metadata !DIExpression()), !dbg !336
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !337

for.cond:                                         ; preds = %for.inc, %entry
  %15 = load i32, i32* %i, align 4, !dbg !338
  %16 = load i32, i32* %lf, align 4, !dbg !340
  %cmp = icmp slt i32 %15, %16, !dbg !341
  br i1 %cmp, label %for.body, label %for.end, !dbg !342

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !343
  %idxprom = sext i32 %17 to i64, !dbg !344
  %arrayidx = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 %idxprom, !dbg !344
  %18 = load double, double* %arrayidx, align 8, !dbg !344
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %18), !dbg !345
  br label %for.inc, !dbg !345

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !346
  %inc = add nsw i32 %19, 1, !dbg !346
  store i32 %inc, i32* %i, align 4, !dbg !346
  br label %for.cond, !dbg !347, !llvm.loop !348

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !350
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !351
  %arraydecay = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !352
  %20 = load i32, i32* %lg, align 4, !dbg !353
  %arraydecay6 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 0, !dbg !354
  %21 = load i32, i32* %lh, align 4, !dbg !355
  call void @deconv(double* %arraydecay, i32 %20, double* %arraydecay6, i32 %21, double* %vla1), !dbg !356
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !357, metadata !DIExpression()), !dbg !359
  store i32 0, i32* %i7, align 4, !dbg !359
  br label %for.cond8, !dbg !360

for.cond8:                                        ; preds = %for.inc14, %for.end
  %22 = load i32, i32* %i7, align 4, !dbg !361
  %23 = load i32, i32* %lf, align 4, !dbg !363
  %cmp9 = icmp slt i32 %22, %23, !dbg !364
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !365

for.body10:                                       ; preds = %for.cond8
  %24 = load i32, i32* %i7, align 4, !dbg !366
  %idxprom11 = sext i32 %24 to i64, !dbg !367
  %arrayidx12 = getelementptr inbounds double, double* %vla1, i64 %idxprom11, !dbg !367
  %25 = load double, double* %arrayidx12, align 8, !dbg !367
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %25), !dbg !368
  br label %for.inc14, !dbg !368

for.inc14:                                        ; preds = %for.body10
  %26 = load i32, i32* %i7, align 4, !dbg !369
  %inc15 = add nsw i32 %26, 1, !dbg !369
  store i32 %inc15, i32* %i7, align 4, !dbg !369
  br label %for.cond8, !dbg !370, !llvm.loop !371

for.end16:                                        ; preds = %for.cond8
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !373
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !374
  call void @llvm.dbg.declare(metadata i32* %i19, metadata !375, metadata !DIExpression()), !dbg !377
  store i32 0, i32* %i19, align 4, !dbg !377
  br label %for.cond20, !dbg !378

for.cond20:                                       ; preds = %for.inc26, %for.end16
  %27 = load i32, i32* %i19, align 4, !dbg !379
  %28 = load i32, i32* %lh, align 4, !dbg !381
  %cmp21 = icmp slt i32 %27, %28, !dbg !382
  br i1 %cmp21, label %for.body22, label %for.end28, !dbg !383

for.body22:                                       ; preds = %for.cond20
  %29 = load i32, i32* %i19, align 4, !dbg !384
  %idxprom23 = sext i32 %29 to i64, !dbg !385
  %arrayidx24 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 %idxprom23, !dbg !385
  %30 = load double, double* %arrayidx24, align 8, !dbg !385
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %30), !dbg !386
  br label %for.inc26, !dbg !386

for.inc26:                                        ; preds = %for.body22
  %31 = load i32, i32* %i19, align 4, !dbg !387
  %inc27 = add nsw i32 %31, 1, !dbg !387
  store i32 %inc27, i32* %i19, align 4, !dbg !387
  br label %for.cond20, !dbg !388, !llvm.loop !389

for.end28:                                        ; preds = %for.cond20
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !391
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !392
  %arraydecay31 = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !393
  %32 = load i32, i32* %lg, align 4, !dbg !394
  %arraydecay32 = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 0, !dbg !395
  %33 = load i32, i32* %lf, align 4, !dbg !396
  call void @deconv(double* %arraydecay31, i32 %32, double* %arraydecay32, i32 %33, double* %vla), !dbg !397
  call void @llvm.dbg.declare(metadata i32* %i33, metadata !398, metadata !DIExpression()), !dbg !400
  store i32 0, i32* %i33, align 4, !dbg !400
  br label %for.cond34, !dbg !401

for.cond34:                                       ; preds = %for.inc40, %for.end28
  %34 = load i32, i32* %i33, align 4, !dbg !402
  %35 = load i32, i32* %lh, align 4, !dbg !404
  %cmp35 = icmp slt i32 %34, %35, !dbg !405
  br i1 %cmp35, label %for.body36, label %for.end42, !dbg !406

for.body36:                                       ; preds = %for.cond34
  %36 = load i32, i32* %i33, align 4, !dbg !407
  %idxprom37 = sext i32 %36 to i64, !dbg !408
  %arrayidx38 = getelementptr inbounds double, double* %vla, i64 %idxprom37, !dbg !408
  %37 = load double, double* %arrayidx38, align 8, !dbg !408
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %37), !dbg !409
  br label %for.inc40, !dbg !409

for.inc40:                                        ; preds = %for.body36
  %38 = load i32, i32* %i33, align 4, !dbg !410
  %inc41 = add nsw i32 %38, 1, !dbg !410
  store i32 %inc41, i32* %i33, align 4, !dbg !410
  br label %for.cond34, !dbg !411, !llvm.loop !412

for.end42:                                        ; preds = %for.cond34
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !414
  %39 = load i8*, i8** %saved_stack, align 8, !dbg !415
  call void @llvm.stackrestore(i8* %39), !dbg !415
  %40 = load i32, i32* %retval, align 4, !dbg !415
  ret i32 %40, !dbg !415
}

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @printf(i8*, ...) #5

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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "deconvolution-1d.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Deconvolution-1D")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!11 = distinct !DISubprogram(name: "_fft", scope: !3, file: !3, line: 9, type: !12, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{null, !14, !14, !17, !17}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "cplx", file: !3, line: 7, baseType: !16)
!16 = !DIBasicType(name: "complex", size: 128, encoding: DW_ATE_complex_float)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "buf", arg: 1, scope: !11, file: !3, line: 9, type: !14)
!19 = !DILocation(line: 9, column: 16, scope: !11)
!20 = !DILocalVariable(name: "out", arg: 2, scope: !11, file: !3, line: 9, type: !14)
!21 = !DILocation(line: 9, column: 28, scope: !11)
!22 = !DILocalVariable(name: "n", arg: 3, scope: !11, file: !3, line: 9, type: !17)
!23 = !DILocation(line: 9, column: 39, scope: !11)
!24 = !DILocalVariable(name: "step", arg: 4, scope: !11, file: !3, line: 9, type: !17)
!25 = !DILocation(line: 9, column: 46, scope: !11)
!26 = !DILocation(line: 11, column: 6, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !3, line: 11, column: 6)
!28 = !DILocation(line: 11, column: 13, scope: !27)
!29 = !DILocation(line: 11, column: 11, scope: !27)
!30 = !DILocation(line: 11, column: 6, scope: !11)
!31 = !{!"if"}
!32 = !DILocation(line: 12, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !3, line: 11, column: 16)
!34 = !DILocation(line: 12, column: 13, scope: !33)
!35 = !DILocation(line: 12, column: 18, scope: !33)
!36 = !DILocation(line: 12, column: 21, scope: !33)
!37 = !DILocation(line: 12, column: 26, scope: !33)
!38 = !DILocation(line: 12, column: 3, scope: !33)
!39 = !DILocation(line: 13, column: 8, scope: !33)
!40 = !DILocation(line: 13, column: 14, scope: !33)
!41 = !DILocation(line: 13, column: 12, scope: !33)
!42 = !DILocation(line: 13, column: 20, scope: !33)
!43 = !DILocation(line: 13, column: 26, scope: !33)
!44 = !DILocation(line: 13, column: 24, scope: !33)
!45 = !DILocation(line: 13, column: 32, scope: !33)
!46 = !DILocation(line: 13, column: 35, scope: !33)
!47 = !DILocation(line: 13, column: 40, scope: !33)
!48 = !DILocation(line: 13, column: 3, scope: !33)
!49 = !DILocalVariable(name: "i", scope: !50, file: !3, line: 15, type: !17)
!50 = distinct !DILexicalBlock(scope: !33, file: !3, line: 15, column: 3)
!51 = !DILocation(line: 15, column: 12, scope: !50)
!52 = !DILocation(line: 15, column: 8, scope: !50)
!53 = !DILocation(line: 15, column: 19, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 15, column: 3)
!55 = !DILocation(line: 15, column: 23, scope: !54)
!56 = !DILocation(line: 15, column: 21, scope: !54)
!57 = !DILocation(line: 15, column: 3, scope: !50)
!58 = !DILocalVariable(name: "t", scope: !59, file: !3, line: 16, type: !15)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 15, column: 41)
!60 = !DILocation(line: 16, column: 9, scope: !59)
!61 = !DILocation(line: 16, column: 23, scope: !59)
!62 = !DILocation(line: 16, column: 21, scope: !59)
!63 = !DILocation(line: 16, column: 28, scope: !59)
!64 = !DILocation(line: 16, column: 26, scope: !59)
!65 = !{!"branch_weights", i32 1, i32 1048575}
!66 = !DILocation(line: 16, column: 32, scope: !59)
!67 = !DILocation(line: 16, column: 30, scope: !59)
!68 = !DILocation(line: 16, column: 13, scope: !59)
!69 = !DILocation(line: 16, column: 37, scope: !59)
!70 = !DILocation(line: 16, column: 41, scope: !59)
!71 = !DILocation(line: 16, column: 45, scope: !59)
!72 = !DILocation(line: 16, column: 43, scope: !59)
!73 = !DILocation(line: 16, column: 35, scope: !59)
!74 = !DILocation(line: 17, column: 21, scope: !59)
!75 = !DILocation(line: 17, column: 25, scope: !59)
!76 = !DILocation(line: 17, column: 30, scope: !59)
!77 = !DILocation(line: 17, column: 28, scope: !59)
!78 = !DILocation(line: 17, column: 4, scope: !59)
!79 = !DILocation(line: 17, column: 8, scope: !59)
!80 = !DILocation(line: 17, column: 10, scope: !59)
!81 = !DILocation(line: 17, column: 19, scope: !59)
!82 = !DILocation(line: 18, column: 21, scope: !59)
!83 = !DILocation(line: 18, column: 25, scope: !59)
!84 = !DILocation(line: 18, column: 30, scope: !59)
!85 = !DILocation(line: 18, column: 28, scope: !59)
!86 = !DILocation(line: 18, column: 4, scope: !59)
!87 = !DILocation(line: 18, column: 9, scope: !59)
!88 = !DILocation(line: 18, column: 13, scope: !59)
!89 = !DILocation(line: 18, column: 11, scope: !59)
!90 = !DILocation(line: 18, column: 15, scope: !59)
!91 = !DILocation(line: 18, column: 19, scope: !59)
!92 = !DILocation(line: 19, column: 3, scope: !59)
!93 = !DILocation(line: 15, column: 35, scope: !54)
!94 = !DILocation(line: 15, column: 33, scope: !54)
!95 = !DILocation(line: 15, column: 28, scope: !54)
!96 = !DILocation(line: 15, column: 3, scope: !54)
!97 = distinct !{!97, !57, !98}
!98 = !DILocation(line: 19, column: 3, scope: !50)
!99 = !DILocation(line: 20, column: 2, scope: !33)
!100 = !DILocation(line: 21, column: 1, scope: !11)
!101 = distinct !DISubprogram(name: "fft", scope: !3, file: !3, line: 23, type: !102, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !14, !17}
!104 = !DILocalVariable(name: "buf", arg: 1, scope: !101, file: !3, line: 23, type: !14)
!105 = !DILocation(line: 23, column: 15, scope: !101)
!106 = !DILocalVariable(name: "n", arg: 2, scope: !101, file: !3, line: 23, type: !17)
!107 = !DILocation(line: 23, column: 26, scope: !101)
!108 = !DILocation(line: 25, column: 11, scope: !101)
!109 = !DILocation(line: 25, column: 2, scope: !101)
!110 = !DILocalVariable(name: "__vla_expr0", scope: !101, type: !111, flags: DIFlagArtificial)
!111 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!112 = !DILocation(line: 0, scope: !101)
!113 = !DILocalVariable(name: "out", scope: !101, file: !3, line: 25, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: !110)
!117 = !DILocation(line: 25, column: 7, scope: !101)
!118 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 26, type: !17)
!119 = distinct !DILexicalBlock(scope: !101, file: !3, line: 26, column: 2)
!120 = !DILocation(line: 26, column: 11, scope: !119)
!121 = !DILocation(line: 26, column: 7, scope: !119)
!122 = !DILocation(line: 26, column: 18, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !3, line: 26, column: 2)
!124 = !DILocation(line: 26, column: 22, scope: !123)
!125 = !DILocation(line: 26, column: 20, scope: !123)
!126 = !DILocation(line: 26, column: 2, scope: !119)
!127 = !DILocation(line: 26, column: 39, scope: !123)
!128 = !DILocation(line: 26, column: 43, scope: !123)
!129 = !DILocation(line: 26, column: 34, scope: !123)
!130 = !DILocation(line: 26, column: 30, scope: !123)
!131 = !DILocation(line: 26, column: 37, scope: !123)
!132 = !DILocation(line: 26, column: 26, scope: !123)
!133 = !DILocation(line: 26, column: 2, scope: !123)
!134 = distinct !{!134, !126, !135}
!135 = !DILocation(line: 26, column: 44, scope: !119)
!136 = !DILocation(line: 27, column: 7, scope: !101)
!137 = !DILocation(line: 27, column: 17, scope: !101)
!138 = !DILocation(line: 27, column: 2, scope: !101)
!139 = !DILocation(line: 28, column: 1, scope: !101)
!140 = distinct !DISubprogram(name: "pad_two", scope: !3, file: !3, line: 31, type: !141, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DISubroutineType(types: !142)
!142 = !{!14, !143, !17, !144}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!145 = !DILocalVariable(name: "g", arg: 1, scope: !140, file: !3, line: 31, type: !143)
!146 = !DILocation(line: 31, column: 22, scope: !140)
!147 = !DILocalVariable(name: "len", arg: 2, scope: !140, file: !3, line: 31, type: !17)
!148 = !DILocation(line: 31, column: 31, scope: !140)
!149 = !DILocalVariable(name: "ns", arg: 3, scope: !140, file: !3, line: 31, type: !144)
!150 = !DILocation(line: 31, column: 41, scope: !140)
!151 = !DILocalVariable(name: "n", scope: !140, file: !3, line: 33, type: !17)
!152 = !DILocation(line: 33, column: 6, scope: !140)
!153 = !DILocation(line: 34, column: 7, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !3, line: 34, column: 6)
!155 = !DILocation(line: 34, column: 6, scope: !154)
!156 = !DILocation(line: 34, column: 6, scope: !140)
!157 = !DILocation(line: 34, column: 16, scope: !154)
!158 = !DILocation(line: 34, column: 15, scope: !154)
!159 = !DILocation(line: 34, column: 13, scope: !154)
!160 = !DILocation(line: 34, column: 11, scope: !154)
!161 = !DILocation(line: 35, column: 7, scope: !154)
!162 = !DILocation(line: 35, column: 14, scope: !154)
!163 = !DILocation(line: 35, column: 18, scope: !154)
!164 = !DILocation(line: 35, column: 16, scope: !154)
!165 = !DILocation(line: 35, column: 25, scope: !154)
!166 = distinct !{!166, !161, !167}
!167 = !DILocation(line: 35, column: 28, scope: !154)
!168 = !DILocalVariable(name: "buf", scope: !140, file: !3, line: 37, type: !14)
!169 = !DILocation(line: 37, column: 8, scope: !140)
!170 = !DILocation(line: 37, column: 35, scope: !140)
!171 = !DILocation(line: 37, column: 14, scope: !140)
!172 = !DILocalVariable(name: "i", scope: !173, file: !3, line: 38, type: !17)
!173 = distinct !DILexicalBlock(scope: !140, file: !3, line: 38, column: 2)
!174 = !DILocation(line: 38, column: 11, scope: !173)
!175 = !DILocation(line: 38, column: 7, scope: !173)
!176 = !DILocation(line: 38, column: 18, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !3, line: 38, column: 2)
!178 = !DILocation(line: 38, column: 22, scope: !177)
!179 = !DILocation(line: 38, column: 20, scope: !177)
!180 = !DILocation(line: 38, column: 2, scope: !173)
!181 = !DILocation(line: 38, column: 41, scope: !177)
!182 = !DILocation(line: 38, column: 43, scope: !177)
!183 = !DILocation(line: 38, column: 32, scope: !177)
!184 = !DILocation(line: 38, column: 36, scope: !177)
!185 = !DILocation(line: 38, column: 39, scope: !177)
!186 = !DILocation(line: 38, column: 28, scope: !177)
!187 = !DILocation(line: 38, column: 2, scope: !177)
!188 = distinct !{!188, !180, !189}
!189 = !DILocation(line: 38, column: 44, scope: !173)
!190 = !DILocation(line: 39, column: 8, scope: !140)
!191 = !DILocation(line: 39, column: 3, scope: !140)
!192 = !DILocation(line: 39, column: 6, scope: !140)
!193 = !DILocation(line: 40, column: 9, scope: !140)
!194 = !DILocation(line: 40, column: 2, scope: !140)
!195 = distinct !DISubprogram(name: "deconv", scope: !3, file: !3, line: 43, type: !196, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !143, !17, !143, !17, !143}
!198 = !DILocalVariable(name: "g", arg: 1, scope: !195, file: !3, line: 43, type: !143)
!199 = !DILocation(line: 43, column: 20, scope: !195)
!200 = !DILocalVariable(name: "lg", arg: 2, scope: !195, file: !3, line: 43, type: !17)
!201 = !DILocation(line: 43, column: 29, scope: !195)
!202 = !DILocalVariable(name: "f", arg: 3, scope: !195, file: !3, line: 43, type: !143)
!203 = !DILocation(line: 43, column: 40, scope: !195)
!204 = !DILocalVariable(name: "lf", arg: 4, scope: !195, file: !3, line: 43, type: !17)
!205 = !DILocation(line: 43, column: 49, scope: !195)
!206 = !DILocalVariable(name: "out", arg: 5, scope: !195, file: !3, line: 43, type: !143)
!207 = !DILocation(line: 43, column: 60, scope: !195)
!208 = !DILocalVariable(name: "ns", scope: !195, file: !3, line: 44, type: !17)
!209 = !DILocation(line: 44, column: 6, scope: !195)
!210 = !DILocalVariable(name: "g2", scope: !195, file: !3, line: 45, type: !14)
!211 = !DILocation(line: 45, column: 8, scope: !195)
!212 = !DILocation(line: 45, column: 21, scope: !195)
!213 = !DILocation(line: 45, column: 24, scope: !195)
!214 = !DILocation(line: 45, column: 13, scope: !195)
!215 = !DILocalVariable(name: "f2", scope: !195, file: !3, line: 46, type: !14)
!216 = !DILocation(line: 46, column: 8, scope: !195)
!217 = !DILocation(line: 46, column: 21, scope: !195)
!218 = !DILocation(line: 46, column: 24, scope: !195)
!219 = !DILocation(line: 46, column: 13, scope: !195)
!220 = !DILocation(line: 48, column: 6, scope: !195)
!221 = !DILocation(line: 48, column: 10, scope: !195)
!222 = !DILocation(line: 48, column: 2, scope: !195)
!223 = !DILocation(line: 49, column: 6, scope: !195)
!224 = !DILocation(line: 49, column: 10, scope: !195)
!225 = !DILocation(line: 49, column: 2, scope: !195)
!226 = !DILocation(line: 51, column: 9, scope: !195)
!227 = !DILocation(line: 51, column: 2, scope: !195)
!228 = !DILocalVariable(name: "__vla_expr0", scope: !195, type: !111, flags: DIFlagArtificial)
!229 = !DILocation(line: 0, scope: !195)
!230 = !DILocalVariable(name: "h", scope: !195, file: !3, line: 51, type: !231)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: !228)
!234 = !DILocation(line: 51, column: 7, scope: !195)
!235 = !DILocalVariable(name: "i", scope: !236, file: !3, line: 52, type: !17)
!236 = distinct !DILexicalBlock(scope: !195, file: !3, line: 52, column: 2)
!237 = !DILocation(line: 52, column: 11, scope: !236)
!238 = !DILocation(line: 52, column: 7, scope: !236)
!239 = !DILocation(line: 52, column: 18, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !3, line: 52, column: 2)
!241 = !DILocation(line: 52, column: 22, scope: !240)
!242 = !DILocation(line: 52, column: 20, scope: !240)
!243 = !DILocation(line: 52, column: 2, scope: !236)
!244 = !DILocation(line: 52, column: 38, scope: !240)
!245 = !DILocation(line: 52, column: 41, scope: !240)
!246 = !DILocation(line: 52, column: 46, scope: !240)
!247 = !DILocation(line: 52, column: 49, scope: !240)
!248 = !DILocation(line: 52, column: 44, scope: !240)
!249 = !DILocation(line: 52, column: 33, scope: !240)
!250 = !DILocation(line: 52, column: 31, scope: !240)
!251 = !DILocation(line: 52, column: 36, scope: !240)
!252 = !DILocation(line: 52, column: 27, scope: !240)
!253 = !DILocation(line: 52, column: 2, scope: !240)
!254 = distinct !{!254, !243, !255}
!255 = !DILocation(line: 52, column: 50, scope: !236)
!256 = !DILocation(line: 53, column: 9, scope: !195)
!257 = !DILocation(line: 53, column: 2, scope: !195)
!258 = !DILocalVariable(name: "i", scope: !259, file: !3, line: 55, type: !17)
!259 = distinct !DILexicalBlock(scope: !195, file: !3, line: 55, column: 2)
!260 = !DILocation(line: 55, column: 11, scope: !259)
!261 = !DILocation(line: 55, column: 7, scope: !259)
!262 = !DILocation(line: 55, column: 18, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !3, line: 55, column: 2)
!264 = !DILocation(line: 55, column: 23, scope: !263)
!265 = !DILocation(line: 55, column: 28, scope: !263)
!266 = !DILocation(line: 55, column: 26, scope: !263)
!267 = !DILocation(line: 55, column: 20, scope: !263)
!268 = !DILocation(line: 55, column: 2, scope: !259)
!269 = !DILocation(line: 56, column: 16, scope: !263)
!270 = !DILocation(line: 56, column: 20, scope: !263)
!271 = !DILocation(line: 56, column: 18, scope: !263)
!272 = !DILocation(line: 56, column: 26, scope: !263)
!273 = !DILocation(line: 56, column: 24, scope: !263)
!274 = !DILocation(line: 56, column: 13, scope: !263)
!275 = !DILocation(line: 56, column: 29, scope: !263)
!276 = !DILocation(line: 56, column: 3, scope: !263)
!277 = !DILocation(line: 56, column: 8, scope: !263)
!278 = !DILocation(line: 56, column: 7, scope: !263)
!279 = !DILocation(line: 56, column: 11, scope: !263)
!280 = !DILocation(line: 55, column: 33, scope: !263)
!281 = !DILocation(line: 55, column: 2, scope: !263)
!282 = distinct !{!282, !268, !283}
!283 = !DILocation(line: 56, column: 30, scope: !259)
!284 = !DILocation(line: 57, column: 7, scope: !195)
!285 = !DILocation(line: 57, column: 2, scope: !195)
!286 = !DILocation(line: 58, column: 7, scope: !195)
!287 = !DILocation(line: 58, column: 2, scope: !195)
!288 = !DILocation(line: 59, column: 1, scope: !195)
!289 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 61, type: !290, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!290 = !DISubroutineType(types: !291)
!291 = !{!17}
!292 = !DILocation(line: 63, column: 7, scope: !289)
!293 = !DILocation(line: 63, column: 18, scope: !289)
!294 = !DILocation(line: 63, column: 5, scope: !289)
!295 = !DILocalVariable(name: "g", scope: !289, file: !3, line: 64, type: !296)
!296 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1344, elements: !297)
!297 = !{!298}
!298 = !DISubrange(count: 21)
!299 = !DILocation(line: 64, column: 9, scope: !289)
!300 = !DILocalVariable(name: "f", scope: !289, file: !3, line: 65, type: !301)
!301 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1024, elements: !302)
!302 = !{!303}
!303 = !DISubrange(count: 16)
!304 = !DILocation(line: 65, column: 9, scope: !289)
!305 = !DILocalVariable(name: "h", scope: !289, file: !3, line: 66, type: !306)
!306 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 384, elements: !307)
!307 = !{!308}
!308 = !DISubrange(count: 6)
!309 = !DILocation(line: 66, column: 9, scope: !289)
!310 = !DILocalVariable(name: "lg", scope: !289, file: !3, line: 68, type: !17)
!311 = !DILocation(line: 68, column: 6, scope: !289)
!312 = !DILocalVariable(name: "lf", scope: !289, file: !3, line: 69, type: !17)
!313 = !DILocation(line: 69, column: 6, scope: !289)
!314 = !DILocalVariable(name: "lh", scope: !289, file: !3, line: 70, type: !17)
!315 = !DILocation(line: 70, column: 6, scope: !289)
!316 = !DILocation(line: 72, column: 12, scope: !289)
!317 = !DILocation(line: 72, column: 2, scope: !289)
!318 = !DILocalVariable(name: "__vla_expr0", scope: !289, type: !111, flags: DIFlagArtificial)
!319 = !DILocation(line: 0, scope: !289)
!320 = !DILocalVariable(name: "h2", scope: !289, file: !3, line: 72, type: !321)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !322)
!322 = !{!323}
!323 = !DISubrange(count: !318)
!324 = !DILocation(line: 72, column: 9, scope: !289)
!325 = !DILocation(line: 73, column: 12, scope: !289)
!326 = !DILocation(line: 73, column: 2, scope: !289)
!327 = !DILocalVariable(name: "__vla_expr1", scope: !289, type: !111, flags: DIFlagArtificial)
!328 = !DILocalVariable(name: "f2", scope: !289, file: !3, line: 73, type: !329)
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !330)
!330 = !{!331}
!331 = !DISubrange(count: !327)
!332 = !DILocation(line: 73, column: 9, scope: !289)
!333 = !DILocation(line: 75, column: 2, scope: !289)
!334 = !DILocalVariable(name: "i", scope: !335, file: !3, line: 76, type: !17)
!335 = distinct !DILexicalBlock(scope: !289, file: !3, line: 76, column: 2)
!336 = !DILocation(line: 76, column: 11, scope: !335)
!337 = !DILocation(line: 76, column: 7, scope: !335)
!338 = !DILocation(line: 76, column: 18, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !3, line: 76, column: 2)
!340 = !DILocation(line: 76, column: 22, scope: !339)
!341 = !DILocation(line: 76, column: 20, scope: !339)
!342 = !DILocation(line: 76, column: 2, scope: !335)
!343 = !DILocation(line: 76, column: 47, scope: !339)
!344 = !DILocation(line: 76, column: 45, scope: !339)
!345 = !DILocation(line: 76, column: 31, scope: !339)
!346 = !DILocation(line: 76, column: 27, scope: !339)
!347 = !DILocation(line: 76, column: 2, scope: !339)
!348 = distinct !{!348, !342, !349}
!349 = !DILocation(line: 76, column: 49, scope: !335)
!350 = !DILocation(line: 77, column: 2, scope: !289)
!351 = !DILocation(line: 79, column: 2, scope: !289)
!352 = !DILocation(line: 80, column: 9, scope: !289)
!353 = !DILocation(line: 80, column: 12, scope: !289)
!354 = !DILocation(line: 80, column: 16, scope: !289)
!355 = !DILocation(line: 80, column: 19, scope: !289)
!356 = !DILocation(line: 80, column: 2, scope: !289)
!357 = !DILocalVariable(name: "i", scope: !358, file: !3, line: 81, type: !17)
!358 = distinct !DILexicalBlock(scope: !289, file: !3, line: 81, column: 2)
!359 = !DILocation(line: 81, column: 11, scope: !358)
!360 = !DILocation(line: 81, column: 7, scope: !358)
!361 = !DILocation(line: 81, column: 18, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !3, line: 81, column: 2)
!363 = !DILocation(line: 81, column: 22, scope: !362)
!364 = !DILocation(line: 81, column: 20, scope: !362)
!365 = !DILocation(line: 81, column: 2, scope: !358)
!366 = !DILocation(line: 81, column: 48, scope: !362)
!367 = !DILocation(line: 81, column: 45, scope: !362)
!368 = !DILocation(line: 81, column: 31, scope: !362)
!369 = !DILocation(line: 81, column: 27, scope: !362)
!370 = !DILocation(line: 81, column: 2, scope: !362)
!371 = distinct !{!371, !365, !372}
!372 = !DILocation(line: 81, column: 50, scope: !358)
!373 = !DILocation(line: 82, column: 2, scope: !289)
!374 = !DILocation(line: 84, column: 2, scope: !289)
!375 = !DILocalVariable(name: "i", scope: !376, file: !3, line: 85, type: !17)
!376 = distinct !DILexicalBlock(scope: !289, file: !3, line: 85, column: 2)
!377 = !DILocation(line: 85, column: 11, scope: !376)
!378 = !DILocation(line: 85, column: 7, scope: !376)
!379 = !DILocation(line: 85, column: 18, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !3, line: 85, column: 2)
!381 = !DILocation(line: 85, column: 22, scope: !380)
!382 = !DILocation(line: 85, column: 20, scope: !380)
!383 = !DILocation(line: 85, column: 2, scope: !376)
!384 = !DILocation(line: 85, column: 47, scope: !380)
!385 = !DILocation(line: 85, column: 45, scope: !380)
!386 = !DILocation(line: 85, column: 31, scope: !380)
!387 = !DILocation(line: 85, column: 27, scope: !380)
!388 = !DILocation(line: 85, column: 2, scope: !380)
!389 = distinct !{!389, !383, !390}
!390 = !DILocation(line: 85, column: 49, scope: !376)
!391 = !DILocation(line: 86, column: 2, scope: !289)
!392 = !DILocation(line: 88, column: 2, scope: !289)
!393 = !DILocation(line: 89, column: 9, scope: !289)
!394 = !DILocation(line: 89, column: 12, scope: !289)
!395 = !DILocation(line: 89, column: 16, scope: !289)
!396 = !DILocation(line: 89, column: 19, scope: !289)
!397 = !DILocation(line: 89, column: 2, scope: !289)
!398 = !DILocalVariable(name: "i", scope: !399, file: !3, line: 90, type: !17)
!399 = distinct !DILexicalBlock(scope: !289, file: !3, line: 90, column: 2)
!400 = !DILocation(line: 90, column: 11, scope: !399)
!401 = !DILocation(line: 90, column: 7, scope: !399)
!402 = !DILocation(line: 90, column: 18, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !3, line: 90, column: 2)
!404 = !DILocation(line: 90, column: 22, scope: !403)
!405 = !DILocation(line: 90, column: 20, scope: !403)
!406 = !DILocation(line: 90, column: 2, scope: !399)
!407 = !DILocation(line: 90, column: 48, scope: !403)
!408 = !DILocation(line: 90, column: 45, scope: !403)
!409 = !DILocation(line: 90, column: 31, scope: !403)
!410 = !DILocation(line: 90, column: 27, scope: !403)
!411 = !DILocation(line: 90, column: 2, scope: !403)
!412 = distinct !{!412, !406, !413}
!413 = !DILocation(line: 90, column: 50, scope: !399)
!414 = !DILocation(line: 91, column: 2, scope: !289)
!415 = !DILocation(line: 92, column: 1, scope: !289)
