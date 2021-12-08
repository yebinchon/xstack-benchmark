; ModuleID = 'deconvolution-1d.bc'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %2 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !31
  %3 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !33
  %4 = load i32, i32* %n.addr, align 4, !dbg !34
  %5 = load i32, i32* %step.addr, align 4, !dbg !35
  %mul = mul nsw i32 %5, 2, !dbg !36
  call void @_fft({ double, double }* %2, { double, double }* %3, i32 %4, i32 %mul), !dbg !37
  %6 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !38
  %7 = load i32, i32* %step.addr, align 4, !dbg !39
  %idx.ext = sext i32 %7 to i64, !dbg !40
  %add.ptr = getelementptr inbounds { double, double }, { double, double }* %6, i64 %idx.ext, !dbg !40
  %8 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !41
  %9 = load i32, i32* %step.addr, align 4, !dbg !42
  %idx.ext1 = sext i32 %9 to i64, !dbg !43
  %add.ptr2 = getelementptr inbounds { double, double }, { double, double }* %8, i64 %idx.ext1, !dbg !43
  %10 = load i32, i32* %n.addr, align 4, !dbg !44
  %11 = load i32, i32* %step.addr, align 4, !dbg !45
  %mul3 = mul nsw i32 %11, 2, !dbg !46
  call void @_fft({ double, double }* %add.ptr, { double, double }* %add.ptr2, i32 %10, i32 %mul3), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !50
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32, i32* %i, align 4, !dbg !52
  %13 = load i32, i32* %n.addr, align 4, !dbg !54
  %cmp4 = icmp slt i32 %12, %13, !dbg !55
  br i1 %cmp4, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata { double, double }* %t, metadata !57, metadata !DIExpression()), !dbg !59
  %14 = load double, double* @PI, align 8, !dbg !60
  %mul.rl = fmul double -0.000000e+00, %14, !dbg !61
  %mul.il = fmul double -1.000000e+00, %14, !dbg !61
  %15 = load i32, i32* %i, align 4, !dbg !62
  %conv = sitofp i32 %15 to double, !dbg !62
  %mul_ac = fmul double %mul.rl, %conv, !dbg !63
  %mul_bd = fmul double %mul.il, 0.000000e+00, !dbg !63
  %mul_ad = fmul double %mul.rl, 0.000000e+00, !dbg !63
  %mul_bc = fmul double %mul.il, %conv, !dbg !63
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !63
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !63
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !63
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !63, !prof !64

complex_mul_imag_nan:                             ; preds = %for.body
  %isnan_cmp5 = fcmp uno double %mul_i, %mul_i, !dbg !63
  br i1 %isnan_cmp5, label %complex_mul_libcall, label %complex_mul_cont, !dbg !63, !prof !64

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call { double, double } @__muldc3(double %mul.rl, double %mul.il, double %conv, double 0.000000e+00) #3, !dbg !63
  %16 = extractvalue { double, double } %call, 0, !dbg !63
  %17 = extractvalue { double, double } %call, 1, !dbg !63
  br label %complex_mul_cont, !dbg !63

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi double [ %mul_r, %for.body ], [ %mul_r, %complex_mul_imag_nan ], [ %16, %complex_mul_libcall ], !dbg !63
  %imag_mul_phi = phi double [ %mul_i, %for.body ], [ %mul_i, %complex_mul_imag_nan ], [ %17, %complex_mul_libcall ], !dbg !63
  %18 = load i32, i32* %n.addr, align 4, !dbg !65
  %conv6 = sitofp i32 %18 to double, !dbg !65
  %call7 = call { double, double } @__divdc3(double %real_mul_phi, double %imag_mul_phi, double %conv6, double 0.000000e+00) #3, !dbg !66
  %19 = extractvalue { double, double } %call7, 0, !dbg !66
  %20 = extractvalue { double, double } %call7, 1, !dbg !66
  %coerce.realp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !67
  %coerce.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !67
  store double %19, double* %coerce.realp, align 8, !dbg !67
  store double %20, double* %coerce.imagp, align 8, !dbg !67
  %21 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !67
  %22 = load double, double* %21, align 8, !dbg !67
  %23 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !67
  %24 = load double, double* %23, align 8, !dbg !67
  %call8 = call { double, double } @cexp(double %22, double %24) #3, !dbg !67
  %25 = extractvalue { double, double } %call8, 0, !dbg !67
  %26 = extractvalue { double, double } %call8, 1, !dbg !67
  %27 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !68
  %28 = load i32, i32* %i, align 4, !dbg !69
  %29 = load i32, i32* %step.addr, align 4, !dbg !70
  %add = add nsw i32 %28, %29, !dbg !71
  %idxprom = sext i32 %add to i64, !dbg !68
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom, !dbg !68
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !68
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !68
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !68
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !68
  %mul_ac9 = fmul double %25, %arrayidx.real, !dbg !72
  %mul_bd10 = fmul double %26, %arrayidx.imag, !dbg !72
  %mul_ad11 = fmul double %25, %arrayidx.imag, !dbg !72
  %mul_bc12 = fmul double %26, %arrayidx.real, !dbg !72
  %mul_r13 = fsub double %mul_ac9, %mul_bd10, !dbg !72
  %mul_i14 = fadd double %mul_ad11, %mul_bc12, !dbg !72
  %isnan_cmp15 = fcmp uno double %mul_r13, %mul_r13, !dbg !72
  br i1 %isnan_cmp15, label %complex_mul_imag_nan16, label %complex_mul_cont20, !dbg !72, !prof !64

complex_mul_imag_nan16:                           ; preds = %complex_mul_cont
  %isnan_cmp17 = fcmp uno double %mul_i14, %mul_i14, !dbg !72
  br i1 %isnan_cmp17, label %complex_mul_libcall18, label %complex_mul_cont20, !dbg !72, !prof !64

complex_mul_libcall18:                            ; preds = %complex_mul_imag_nan16
  %call19 = call { double, double } @__muldc3(double %25, double %26, double %arrayidx.real, double %arrayidx.imag) #3, !dbg !72
  %30 = extractvalue { double, double } %call19, 0, !dbg !72
  %31 = extractvalue { double, double } %call19, 1, !dbg !72
  br label %complex_mul_cont20, !dbg !72

complex_mul_cont20:                               ; preds = %complex_mul_libcall18, %complex_mul_imag_nan16, %complex_mul_cont
  %real_mul_phi21 = phi double [ %mul_r13, %complex_mul_cont ], [ %mul_r13, %complex_mul_imag_nan16 ], [ %30, %complex_mul_libcall18 ], !dbg !72
  %imag_mul_phi22 = phi double [ %mul_i14, %complex_mul_cont ], [ %mul_i14, %complex_mul_imag_nan16 ], [ %31, %complex_mul_libcall18 ], !dbg !72
  %t.realp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !59
  %t.imagp = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !59
  store double %real_mul_phi21, double* %t.realp, align 8, !dbg !59
  store double %imag_mul_phi22, double* %t.imagp, align 8, !dbg !59
  %32 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !73
  %33 = load i32, i32* %i, align 4, !dbg !74
  %idxprom23 = sext i32 %33 to i64, !dbg !73
  %arrayidx24 = getelementptr inbounds { double, double }, { double, double }* %32, i64 %idxprom23, !dbg !73
  %arrayidx24.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 0, !dbg !73
  %arrayidx24.real = load double, double* %arrayidx24.realp, align 8, !dbg !73
  %arrayidx24.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx24, i32 0, i32 1, !dbg !73
  %arrayidx24.imag = load double, double* %arrayidx24.imagp, align 8, !dbg !73
  %t.realp25 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !75
  %t.real = load double, double* %t.realp25, align 8, !dbg !75
  %t.imagp26 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !75
  %t.imag = load double, double* %t.imagp26, align 8, !dbg !75
  %add.r = fadd double %arrayidx24.real, %t.real, !dbg !76
  %add.i = fadd double %arrayidx24.imag, %t.imag, !dbg !76
  %34 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !77
  %35 = load i32, i32* %i, align 4, !dbg !78
  %div = sdiv i32 %35, 2, !dbg !79
  %idxprom27 = sext i32 %div to i64, !dbg !77
  %arrayidx28 = getelementptr inbounds { double, double }, { double, double }* %34, i64 %idxprom27, !dbg !77
  %arrayidx28.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 0, !dbg !80
  %arrayidx28.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx28, i32 0, i32 1, !dbg !80
  store double %add.r, double* %arrayidx28.realp, align 8, !dbg !80
  store double %add.i, double* %arrayidx28.imagp, align 8, !dbg !80
  %36 = load { double, double }*, { double, double }** %out.addr, align 8, !dbg !81
  %37 = load i32, i32* %i, align 4, !dbg !82
  %idxprom29 = sext i32 %37 to i64, !dbg !81
  %arrayidx30 = getelementptr inbounds { double, double }, { double, double }* %36, i64 %idxprom29, !dbg !81
  %arrayidx30.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 0, !dbg !81
  %arrayidx30.real = load double, double* %arrayidx30.realp, align 8, !dbg !81
  %arrayidx30.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx30, i32 0, i32 1, !dbg !81
  %arrayidx30.imag = load double, double* %arrayidx30.imagp, align 8, !dbg !81
  %t.realp31 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 0, !dbg !83
  %t.real32 = load double, double* %t.realp31, align 8, !dbg !83
  %t.imagp33 = getelementptr inbounds { double, double }, { double, double }* %t, i32 0, i32 1, !dbg !83
  %t.imag34 = load double, double* %t.imagp33, align 8, !dbg !83
  %sub.r = fsub double %arrayidx30.real, %t.real32, !dbg !84
  %sub.i = fsub double %arrayidx30.imag, %t.imag34, !dbg !84
  %38 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !85
  %39 = load i32, i32* %i, align 4, !dbg !86
  %40 = load i32, i32* %n.addr, align 4, !dbg !87
  %add35 = add nsw i32 %39, %40, !dbg !88
  %div36 = sdiv i32 %add35, 2, !dbg !89
  %idxprom37 = sext i32 %div36 to i64, !dbg !85
  %arrayidx38 = getelementptr inbounds { double, double }, { double, double }* %38, i64 %idxprom37, !dbg !85
  %arrayidx38.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 0, !dbg !90
  %arrayidx38.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx38, i32 0, i32 1, !dbg !90
  store double %sub.r, double* %arrayidx38.realp, align 8, !dbg !90
  store double %sub.i, double* %arrayidx38.imagp, align 8, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %complex_mul_cont20
  %41 = load i32, i32* %step.addr, align 4, !dbg !92
  %mul39 = mul nsw i32 2, %41, !dbg !93
  %42 = load i32, i32* %i, align 4, !dbg !94
  %add40 = add nsw i32 %42, %mul39, !dbg !94
  store i32 %add40, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !98

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !99
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local { double, double } @cexp(double, double) #2

declare dso_local { double, double } @__muldc3(double, double, double, double)

declare dso_local { double, double } @__divdc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft({ double, double }* %buf, i32 %n) #0 !dbg !100 {
entry:
  %buf.addr = alloca { double, double }*, align 8
  %n.addr = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %i = alloca i32, align 4
  store { double, double }* %buf, { double, double }** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata { double, double }** %buf.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* %n.addr, align 4, !dbg !107
  %1 = zext i32 %0 to i64, !dbg !108
  %2 = call i8* @llvm.stacksave(), !dbg !108
  store i8* %2, i8** %saved_stack, align 8, !dbg !108
  %vla = alloca { double, double }, i64 %1, align 16, !dbg !108
  store i64 %1, i64* %__vla_expr0, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !112, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %i, metadata !117, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !121
  %4 = load i32, i32* %n.addr, align 4, !dbg !123
  %cmp = icmp slt i32 %3, %4, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %5 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !126
  %6 = load i32, i32* %i, align 4, !dbg !127
  %idxprom = sext i32 %6 to i64, !dbg !126
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %5, i64 %idxprom, !dbg !126
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !126
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !126
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !126
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !126
  %7 = load i32, i32* %i, align 4, !dbg !128
  %idxprom1 = sext i32 %7 to i64, !dbg !129
  %arrayidx2 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom1, !dbg !129
  %arrayidx2.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 0, !dbg !130
  %arrayidx2.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx2, i32 0, i32 1, !dbg !130
  store double %arrayidx.real, double* %arrayidx2.realp, align 16, !dbg !130
  store double %arrayidx.imag, double* %arrayidx2.imagp, align 8, !dbg !130
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !131
  %inc = add nsw i32 %8, 1, !dbg !131
  store i32 %inc, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %9 = load { double, double }*, { double, double }** %buf.addr, align 8, !dbg !135
  %10 = load i32, i32* %n.addr, align 4, !dbg !136
  call void @_fft({ double, double }* %9, { double, double }* %vla, i32 %10, i32 1), !dbg !137
  %11 = load i8*, i8** %saved_stack, align 8, !dbg !138
  call void @llvm.stackrestore(i8* %11), !dbg !138
  ret void, !dbg !138
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double }* @pad_two(double* %g, i32 %len, i32* %ns) #0 !dbg !139 {
entry:
  %g.addr = alloca double*, align 8
  %len.addr = alloca i32, align 4
  %ns.addr = alloca i32*, align 8
  %n = alloca i32, align 4
  %buf = alloca { double, double }*, align 8
  %i = alloca i32, align 4
  store double* %g, double** %g.addr, align 8
  call void @llvm.dbg.declare(metadata double** %g.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !146, metadata !DIExpression()), !dbg !147
  store i32* %ns, i32** %ns.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %ns.addr, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32* %n, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 1, i32* %n, align 4, !dbg !151
  %0 = load i32*, i32** %ns.addr, align 8, !dbg !152
  %1 = load i32, i32* %0, align 4, !dbg !154
  %tobool = icmp ne i32 %1, 0, !dbg !154
  br i1 %tobool, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %ns.addr, align 8, !dbg !156
  %3 = load i32, i32* %2, align 4, !dbg !157
  store i32 %3, i32* %n, align 4, !dbg !158
  br label %if.end, !dbg !159

if.else:                                          ; preds = %entry
  br label %while.cond, !dbg !160

while.cond:                                       ; preds = %while.body, %if.else
  %4 = load i32, i32* %n, align 4, !dbg !161
  %5 = load i32, i32* %len.addr, align 4, !dbg !162
  %cmp = icmp slt i32 %4, %5, !dbg !163
  br i1 %cmp, label %while.body, label %while.end, !dbg !160

while.body:                                       ; preds = %while.cond
  %6 = load i32, i32* %n, align 4, !dbg !164
  %mul = mul nsw i32 %6, 2, !dbg !164
  store i32 %mul, i32* %n, align 4, !dbg !164
  br label %while.cond, !dbg !160, !llvm.loop !165

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  call void @llvm.dbg.declare(metadata { double, double }** %buf, metadata !167, metadata !DIExpression()), !dbg !168
  %7 = load i32, i32* %n, align 4, !dbg !169
  %conv = sext i32 %7 to i64, !dbg !169
  %call = call noalias i8* @calloc(i64 16, i64 %conv) #3, !dbg !170
  %8 = bitcast i8* %call to { double, double }*, !dbg !170
  store { double, double }* %8, { double, double }** %buf, align 8, !dbg !168
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32, i32* %i, align 4, !dbg !175
  %10 = load i32, i32* %len.addr, align 4, !dbg !177
  %cmp1 = icmp slt i32 %9, %10, !dbg !178
  br i1 %cmp1, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %11 = load double*, double** %g.addr, align 8, !dbg !180
  %12 = load i32, i32* %i, align 4, !dbg !181
  %idxprom = sext i32 %12 to i64, !dbg !180
  %arrayidx = getelementptr inbounds double, double* %11, i64 %idxprom, !dbg !180
  %13 = load double, double* %arrayidx, align 8, !dbg !180
  %14 = load { double, double }*, { double, double }** %buf, align 8, !dbg !182
  %15 = load i32, i32* %i, align 4, !dbg !183
  %idxprom3 = sext i32 %15 to i64, !dbg !182
  %arrayidx4 = getelementptr inbounds { double, double }, { double, double }* %14, i64 %idxprom3, !dbg !182
  %arrayidx4.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 0, !dbg !184
  %arrayidx4.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx4, i32 0, i32 1, !dbg !184
  store double %13, double* %arrayidx4.realp, align 8, !dbg !184
  store double 0.000000e+00, double* %arrayidx4.imagp, align 8, !dbg !184
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !185
  %inc = add nsw i32 %16, 1, !dbg !185
  store i32 %inc, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* %n, align 4, !dbg !189
  %18 = load i32*, i32** %ns.addr, align 8, !dbg !190
  store i32 %17, i32* %18, align 4, !dbg !191
  %19 = load { double, double }*, { double, double }** %buf, align 8, !dbg !192
  ret { double, double }* %19, !dbg !193
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deconv(double* %g, i32 %lg, double* %f, i32 %lf, double* %out) #0 !dbg !194 {
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
  call void @llvm.dbg.declare(metadata double** %g.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 %lg, i32* %lg.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lg.addr, metadata !199, metadata !DIExpression()), !dbg !200
  store double* %f, double** %f.addr, align 8
  call void @llvm.dbg.declare(metadata double** %f.addr, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 %lf, i32* %lf.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lf.addr, metadata !203, metadata !DIExpression()), !dbg !204
  store double* %out, double** %out.addr, align 8
  call void @llvm.dbg.declare(metadata double** %out.addr, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32* %ns, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 0, i32* %ns, align 4, !dbg !208
  call void @llvm.dbg.declare(metadata { double, double }** %g2, metadata !209, metadata !DIExpression()), !dbg !210
  %0 = load double*, double** %g.addr, align 8, !dbg !211
  %1 = load i32, i32* %lg.addr, align 4, !dbg !212
  %call = call { double, double }* @pad_two(double* %0, i32 %1, i32* %ns), !dbg !213
  store { double, double }* %call, { double, double }** %g2, align 8, !dbg !210
  call void @llvm.dbg.declare(metadata { double, double }** %f2, metadata !214, metadata !DIExpression()), !dbg !215
  %2 = load double*, double** %f.addr, align 8, !dbg !216
  %3 = load i32, i32* %lf.addr, align 4, !dbg !217
  %call1 = call { double, double }* @pad_two(double* %2, i32 %3, i32* %ns), !dbg !218
  store { double, double }* %call1, { double, double }** %f2, align 8, !dbg !215
  %4 = load { double, double }*, { double, double }** %g2, align 8, !dbg !219
  %5 = load i32, i32* %ns, align 4, !dbg !220
  call void @fft({ double, double }* %4, i32 %5), !dbg !221
  %6 = load { double, double }*, { double, double }** %f2, align 8, !dbg !222
  %7 = load i32, i32* %ns, align 4, !dbg !223
  call void @fft({ double, double }* %6, i32 %7), !dbg !224
  %8 = load i32, i32* %ns, align 4, !dbg !225
  %9 = zext i32 %8 to i64, !dbg !226
  %10 = call i8* @llvm.stacksave(), !dbg !226
  store i8* %10, i8** %saved_stack, align 8, !dbg !226
  %vla = alloca { double, double }, i64 %9, align 16, !dbg !226
  store i64 %9, i64* %__vla_expr0, align 8, !dbg !226
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata { double, double }* %vla, metadata !229, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32* %i, metadata !234, metadata !DIExpression()), !dbg !236
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i32, i32* %i, align 4, !dbg !238
  %12 = load i32, i32* %ns, align 4, !dbg !240
  %cmp = icmp slt i32 %11, %12, !dbg !241
  br i1 %cmp, label %for.body, label %for.end, !dbg !242

for.body:                                         ; preds = %for.cond
  %13 = load { double, double }*, { double, double }** %g2, align 8, !dbg !243
  %14 = load i32, i32* %i, align 4, !dbg !244
  %idxprom = sext i32 %14 to i64, !dbg !243
  %arrayidx = getelementptr inbounds { double, double }, { double, double }* %13, i64 %idxprom, !dbg !243
  %arrayidx.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 0, !dbg !243
  %arrayidx.real = load double, double* %arrayidx.realp, align 8, !dbg !243
  %arrayidx.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx, i32 0, i32 1, !dbg !243
  %arrayidx.imag = load double, double* %arrayidx.imagp, align 8, !dbg !243
  %15 = load { double, double }*, { double, double }** %f2, align 8, !dbg !245
  %16 = load i32, i32* %i, align 4, !dbg !246
  %idxprom2 = sext i32 %16 to i64, !dbg !245
  %arrayidx3 = getelementptr inbounds { double, double }, { double, double }* %15, i64 %idxprom2, !dbg !245
  %arrayidx3.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 0, !dbg !245
  %arrayidx3.real = load double, double* %arrayidx3.realp, align 8, !dbg !245
  %arrayidx3.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx3, i32 0, i32 1, !dbg !245
  %arrayidx3.imag = load double, double* %arrayidx3.imagp, align 8, !dbg !245
  %call4 = call { double, double } @__divdc3(double %arrayidx.real, double %arrayidx.imag, double %arrayidx3.real, double %arrayidx3.imag) #3, !dbg !247
  %17 = extractvalue { double, double } %call4, 0, !dbg !247
  %18 = extractvalue { double, double } %call4, 1, !dbg !247
  %19 = load i32, i32* %i, align 4, !dbg !248
  %idxprom5 = sext i32 %19 to i64, !dbg !249
  %arrayidx6 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom5, !dbg !249
  %arrayidx6.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 0, !dbg !250
  %arrayidx6.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx6, i32 0, i32 1, !dbg !250
  store double %17, double* %arrayidx6.realp, align 16, !dbg !250
  store double %18, double* %arrayidx6.imagp, align 8, !dbg !250
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !251
  %inc = add nsw i32 %20, 1, !dbg !251
  store i32 %inc, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !252, !llvm.loop !253

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %ns, align 4, !dbg !255
  call void @fft({ double, double }* %vla, i32 %21), !dbg !256
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !257, metadata !DIExpression()), !dbg !259
  store i32 0, i32* %i7, align 4, !dbg !259
  br label %for.cond8, !dbg !260

for.cond8:                                        ; preds = %for.inc17, %for.end
  %22 = load i32, i32* %i7, align 4, !dbg !261
  %23 = load i32, i32* %lf.addr, align 4, !dbg !263
  %24 = load i32, i32* %lg.addr, align 4, !dbg !264
  %sub = sub nsw i32 %23, %24, !dbg !265
  %cmp9 = icmp sge i32 %22, %sub, !dbg !266
  br i1 %cmp9, label %for.body10, label %for.end18, !dbg !267

for.body10:                                       ; preds = %for.cond8
  %25 = load i32, i32* %i7, align 4, !dbg !268
  %26 = load i32, i32* %ns, align 4, !dbg !269
  %add = add nsw i32 %25, %26, !dbg !270
  %27 = load i32, i32* %ns, align 4, !dbg !271
  %rem = srem i32 %add, %27, !dbg !272
  %idxprom11 = sext i32 %rem to i64, !dbg !273
  %arrayidx12 = getelementptr inbounds { double, double }, { double, double }* %vla, i64 %idxprom11, !dbg !273
  %arrayidx12.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 0, !dbg !273
  %arrayidx12.real = load double, double* %arrayidx12.realp, align 16, !dbg !273
  %arrayidx12.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx12, i32 0, i32 1, !dbg !273
  %arrayidx12.imag = load double, double* %arrayidx12.imagp, align 8, !dbg !273
  %call13 = call { double, double } @__divdc3(double %arrayidx12.real, double %arrayidx12.imag, double 3.200000e+01, double 0.000000e+00) #3, !dbg !274
  %28 = extractvalue { double, double } %call13, 0, !dbg !274
  %29 = extractvalue { double, double } %call13, 1, !dbg !274
  %30 = load double*, double** %out.addr, align 8, !dbg !275
  %31 = load i32, i32* %i7, align 4, !dbg !276
  %sub14 = sub nsw i32 0, %31, !dbg !277
  %idxprom15 = sext i32 %sub14 to i64, !dbg !275
  %arrayidx16 = getelementptr inbounds double, double* %30, i64 %idxprom15, !dbg !275
  store double %28, double* %arrayidx16, align 8, !dbg !278
  br label %for.inc17, !dbg !275

for.inc17:                                        ; preds = %for.body10
  %32 = load i32, i32* %i7, align 4, !dbg !279
  %dec = add nsw i32 %32, -1, !dbg !279
  store i32 %dec, i32* %i7, align 4, !dbg !279
  br label %for.cond8, !dbg !280, !llvm.loop !281

for.end18:                                        ; preds = %for.cond8
  %33 = load { double, double }*, { double, double }** %g2, align 8, !dbg !283
  %34 = bitcast { double, double }* %33 to i8*, !dbg !283
  call void @free(i8* %34) #3, !dbg !284
  %35 = load { double, double }*, { double, double }** %f2, align 8, !dbg !285
  %36 = bitcast { double, double }* %35 to i8*, !dbg !285
  call void @free(i8* %36) #3, !dbg !286
  %37 = load i8*, i8** %saved_stack, align 8, !dbg !287
  call void @llvm.stackrestore(i8* %37), !dbg !287
  ret void, !dbg !287
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !288 {
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
  %call = call double @atan2(double 1.000000e+00, double 1.000000e+00) #3, !dbg !291
  %mul = fmul double %call, 4.000000e+00, !dbg !292
  store double %mul, double* @PI, align 8, !dbg !293
  call void @llvm.dbg.declare(metadata [21 x double]* %g, metadata !294, metadata !DIExpression()), !dbg !298
  %0 = bitcast [21 x double]* %g to i8*, !dbg !298
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([21 x double]* @__const.main.g to i8*), i64 168, i1 false), !dbg !298
  call void @llvm.dbg.declare(metadata [16 x double]* %f, metadata !299, metadata !DIExpression()), !dbg !303
  %1 = bitcast [16 x double]* %f to i8*, !dbg !303
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([16 x double]* @__const.main.f to i8*), i64 128, i1 false), !dbg !303
  call void @llvm.dbg.declare(metadata [6 x double]* %h, metadata !304, metadata !DIExpression()), !dbg !308
  %2 = bitcast [6 x double]* %h to i8*, !dbg !308
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 48, i1 false), !dbg !308
  %3 = bitcast i8* %2 to [6 x double]*, !dbg !308
  %4 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 0, !dbg !308
  store double -8.000000e+00, double* %4, align 16, !dbg !308
  %5 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 1, !dbg !308
  store double -9.000000e+00, double* %5, align 8, !dbg !308
  %6 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 2, !dbg !308
  store double -3.000000e+00, double* %6, align 16, !dbg !308
  %7 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 3, !dbg !308
  store double -1.000000e+00, double* %7, align 8, !dbg !308
  %8 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 4, !dbg !308
  store double -6.000000e+00, double* %8, align 16, !dbg !308
  %9 = getelementptr inbounds [6 x double], [6 x double]* %3, i32 0, i32 5, !dbg !308
  store double 7.000000e+00, double* %9, align 8, !dbg !308
  call void @llvm.dbg.declare(metadata i32* %lg, metadata !309, metadata !DIExpression()), !dbg !310
  store i32 21, i32* %lg, align 4, !dbg !310
  call void @llvm.dbg.declare(metadata i32* %lf, metadata !311, metadata !DIExpression()), !dbg !312
  store i32 16, i32* %lf, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata i32* %lh, metadata !313, metadata !DIExpression()), !dbg !314
  store i32 6, i32* %lh, align 4, !dbg !314
  %10 = load i32, i32* %lh, align 4, !dbg !315
  %11 = zext i32 %10 to i64, !dbg !316
  %12 = call i8* @llvm.stacksave(), !dbg !316
  store i8* %12, i8** %saved_stack, align 8, !dbg !316
  %vla = alloca double, i64 %11, align 16, !dbg !316
  store i64 %11, i64* %__vla_expr0, align 8, !dbg !316
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata double* %vla, metadata !319, metadata !DIExpression()), !dbg !323
  %13 = load i32, i32* %lf, align 4, !dbg !324
  %14 = zext i32 %13 to i64, !dbg !325
  %vla1 = alloca double, i64 %14, align 16, !dbg !325
  store i64 %14, i64* %__vla_expr1, align 8, !dbg !325
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !326, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata double* %vla1, metadata !327, metadata !DIExpression()), !dbg !331
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %i, metadata !333, metadata !DIExpression()), !dbg !335
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond, !dbg !336

for.cond:                                         ; preds = %for.inc, %entry
  %15 = load i32, i32* %i, align 4, !dbg !337
  %16 = load i32, i32* %lf, align 4, !dbg !339
  %cmp = icmp slt i32 %15, %16, !dbg !340
  br i1 %cmp, label %for.body, label %for.end, !dbg !341

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !342
  %idxprom = sext i32 %17 to i64, !dbg !343
  %arrayidx = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 %idxprom, !dbg !343
  %18 = load double, double* %arrayidx, align 8, !dbg !343
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %18), !dbg !344
  br label %for.inc, !dbg !344

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !345
  %inc = add nsw i32 %19, 1, !dbg !345
  store i32 %inc, i32* %i, align 4, !dbg !345
  br label %for.cond, !dbg !346, !llvm.loop !347

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !349
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !350
  %arraydecay = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !351
  %20 = load i32, i32* %lg, align 4, !dbg !352
  %arraydecay6 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 0, !dbg !353
  %21 = load i32, i32* %lh, align 4, !dbg !354
  call void @deconv(double* %arraydecay, i32 %20, double* %arraydecay6, i32 %21, double* %vla1), !dbg !355
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !356, metadata !DIExpression()), !dbg !358
  store i32 0, i32* %i7, align 4, !dbg !358
  br label %for.cond8, !dbg !359

for.cond8:                                        ; preds = %for.inc14, %for.end
  %22 = load i32, i32* %i7, align 4, !dbg !360
  %23 = load i32, i32* %lf, align 4, !dbg !362
  %cmp9 = icmp slt i32 %22, %23, !dbg !363
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !364

for.body10:                                       ; preds = %for.cond8
  %24 = load i32, i32* %i7, align 4, !dbg !365
  %idxprom11 = sext i32 %24 to i64, !dbg !366
  %arrayidx12 = getelementptr inbounds double, double* %vla1, i64 %idxprom11, !dbg !366
  %25 = load double, double* %arrayidx12, align 8, !dbg !366
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %25), !dbg !367
  br label %for.inc14, !dbg !367

for.inc14:                                        ; preds = %for.body10
  %26 = load i32, i32* %i7, align 4, !dbg !368
  %inc15 = add nsw i32 %26, 1, !dbg !368
  store i32 %inc15, i32* %i7, align 4, !dbg !368
  br label %for.cond8, !dbg !369, !llvm.loop !370

for.end16:                                        ; preds = %for.cond8
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !372
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !373
  call void @llvm.dbg.declare(metadata i32* %i19, metadata !374, metadata !DIExpression()), !dbg !376
  store i32 0, i32* %i19, align 4, !dbg !376
  br label %for.cond20, !dbg !377

for.cond20:                                       ; preds = %for.inc26, %for.end16
  %27 = load i32, i32* %i19, align 4, !dbg !378
  %28 = load i32, i32* %lh, align 4, !dbg !380
  %cmp21 = icmp slt i32 %27, %28, !dbg !381
  br i1 %cmp21, label %for.body22, label %for.end28, !dbg !382

for.body22:                                       ; preds = %for.cond20
  %29 = load i32, i32* %i19, align 4, !dbg !383
  %idxprom23 = sext i32 %29 to i64, !dbg !384
  %arrayidx24 = getelementptr inbounds [6 x double], [6 x double]* %h, i64 0, i64 %idxprom23, !dbg !384
  %30 = load double, double* %arrayidx24, align 8, !dbg !384
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %30), !dbg !385
  br label %for.inc26, !dbg !385

for.inc26:                                        ; preds = %for.body22
  %31 = load i32, i32* %i19, align 4, !dbg !386
  %inc27 = add nsw i32 %31, 1, !dbg !386
  store i32 %inc27, i32* %i19, align 4, !dbg !386
  br label %for.cond20, !dbg !387, !llvm.loop !388

for.end28:                                        ; preds = %for.cond20
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !390
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !391
  %arraydecay31 = getelementptr inbounds [21 x double], [21 x double]* %g, i64 0, i64 0, !dbg !392
  %32 = load i32, i32* %lg, align 4, !dbg !393
  %arraydecay32 = getelementptr inbounds [16 x double], [16 x double]* %f, i64 0, i64 0, !dbg !394
  %33 = load i32, i32* %lf, align 4, !dbg !395
  call void @deconv(double* %arraydecay31, i32 %32, double* %arraydecay32, i32 %33, double* %vla), !dbg !396
  call void @llvm.dbg.declare(metadata i32* %i33, metadata !397, metadata !DIExpression()), !dbg !399
  store i32 0, i32* %i33, align 4, !dbg !399
  br label %for.cond34, !dbg !400

for.cond34:                                       ; preds = %for.inc40, %for.end28
  %34 = load i32, i32* %i33, align 4, !dbg !401
  %35 = load i32, i32* %lh, align 4, !dbg !403
  %cmp35 = icmp slt i32 %34, %35, !dbg !404
  br i1 %cmp35, label %for.body36, label %for.end42, !dbg !405

for.body36:                                       ; preds = %for.cond34
  %36 = load i32, i32* %i33, align 4, !dbg !406
  %idxprom37 = sext i32 %36 to i64, !dbg !407
  %arrayidx38 = getelementptr inbounds double, double* %vla, i64 %idxprom37, !dbg !407
  %37 = load double, double* %arrayidx38, align 8, !dbg !407
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %37), !dbg !408
  br label %for.inc40, !dbg !408

for.inc40:                                        ; preds = %for.body36
  %38 = load i32, i32* %i33, align 4, !dbg !409
  %inc41 = add nsw i32 %38, 1, !dbg !409
  store i32 %inc41, i32* %i33, align 4, !dbg !409
  br label %for.cond34, !dbg !410, !llvm.loop !411

for.end42:                                        ; preds = %for.cond34
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !413
  %39 = load i8*, i8** %saved_stack, align 8, !dbg !414
  call void @llvm.stackrestore(i8* %39), !dbg !414
  %40 = load i32, i32* %retval, align 4, !dbg !414
  ret i32 %40, !dbg !414
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
!31 = !DILocation(line: 12, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 11, column: 16)
!33 = !DILocation(line: 12, column: 13, scope: !32)
!34 = !DILocation(line: 12, column: 18, scope: !32)
!35 = !DILocation(line: 12, column: 21, scope: !32)
!36 = !DILocation(line: 12, column: 26, scope: !32)
!37 = !DILocation(line: 12, column: 3, scope: !32)
!38 = !DILocation(line: 13, column: 8, scope: !32)
!39 = !DILocation(line: 13, column: 14, scope: !32)
!40 = !DILocation(line: 13, column: 12, scope: !32)
!41 = !DILocation(line: 13, column: 20, scope: !32)
!42 = !DILocation(line: 13, column: 26, scope: !32)
!43 = !DILocation(line: 13, column: 24, scope: !32)
!44 = !DILocation(line: 13, column: 32, scope: !32)
!45 = !DILocation(line: 13, column: 35, scope: !32)
!46 = !DILocation(line: 13, column: 40, scope: !32)
!47 = !DILocation(line: 13, column: 3, scope: !32)
!48 = !DILocalVariable(name: "i", scope: !49, file: !3, line: 15, type: !17)
!49 = distinct !DILexicalBlock(scope: !32, file: !3, line: 15, column: 3)
!50 = !DILocation(line: 15, column: 12, scope: !49)
!51 = !DILocation(line: 15, column: 8, scope: !49)
!52 = !DILocation(line: 15, column: 19, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 15, column: 3)
!54 = !DILocation(line: 15, column: 23, scope: !53)
!55 = !DILocation(line: 15, column: 21, scope: !53)
!56 = !DILocation(line: 15, column: 3, scope: !49)
!57 = !DILocalVariable(name: "t", scope: !58, file: !3, line: 16, type: !15)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 15, column: 41)
!59 = !DILocation(line: 16, column: 9, scope: !58)
!60 = !DILocation(line: 16, column: 23, scope: !58)
!61 = !DILocation(line: 16, column: 21, scope: !58)
!62 = !DILocation(line: 16, column: 28, scope: !58)
!63 = !DILocation(line: 16, column: 26, scope: !58)
!64 = !{!"branch_weights", i32 1, i32 1048575}
!65 = !DILocation(line: 16, column: 32, scope: !58)
!66 = !DILocation(line: 16, column: 30, scope: !58)
!67 = !DILocation(line: 16, column: 13, scope: !58)
!68 = !DILocation(line: 16, column: 37, scope: !58)
!69 = !DILocation(line: 16, column: 41, scope: !58)
!70 = !DILocation(line: 16, column: 45, scope: !58)
!71 = !DILocation(line: 16, column: 43, scope: !58)
!72 = !DILocation(line: 16, column: 35, scope: !58)
!73 = !DILocation(line: 17, column: 21, scope: !58)
!74 = !DILocation(line: 17, column: 25, scope: !58)
!75 = !DILocation(line: 17, column: 30, scope: !58)
!76 = !DILocation(line: 17, column: 28, scope: !58)
!77 = !DILocation(line: 17, column: 4, scope: !58)
!78 = !DILocation(line: 17, column: 8, scope: !58)
!79 = !DILocation(line: 17, column: 10, scope: !58)
!80 = !DILocation(line: 17, column: 19, scope: !58)
!81 = !DILocation(line: 18, column: 21, scope: !58)
!82 = !DILocation(line: 18, column: 25, scope: !58)
!83 = !DILocation(line: 18, column: 30, scope: !58)
!84 = !DILocation(line: 18, column: 28, scope: !58)
!85 = !DILocation(line: 18, column: 4, scope: !58)
!86 = !DILocation(line: 18, column: 9, scope: !58)
!87 = !DILocation(line: 18, column: 13, scope: !58)
!88 = !DILocation(line: 18, column: 11, scope: !58)
!89 = !DILocation(line: 18, column: 15, scope: !58)
!90 = !DILocation(line: 18, column: 19, scope: !58)
!91 = !DILocation(line: 19, column: 3, scope: !58)
!92 = !DILocation(line: 15, column: 35, scope: !53)
!93 = !DILocation(line: 15, column: 33, scope: !53)
!94 = !DILocation(line: 15, column: 28, scope: !53)
!95 = !DILocation(line: 15, column: 3, scope: !53)
!96 = distinct !{!96, !56, !97}
!97 = !DILocation(line: 19, column: 3, scope: !49)
!98 = !DILocation(line: 20, column: 2, scope: !32)
!99 = !DILocation(line: 21, column: 1, scope: !11)
!100 = distinct !DISubprogram(name: "fft", scope: !3, file: !3, line: 23, type: !101, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{null, !14, !17}
!103 = !DILocalVariable(name: "buf", arg: 1, scope: !100, file: !3, line: 23, type: !14)
!104 = !DILocation(line: 23, column: 15, scope: !100)
!105 = !DILocalVariable(name: "n", arg: 2, scope: !100, file: !3, line: 23, type: !17)
!106 = !DILocation(line: 23, column: 26, scope: !100)
!107 = !DILocation(line: 25, column: 11, scope: !100)
!108 = !DILocation(line: 25, column: 2, scope: !100)
!109 = !DILocalVariable(name: "__vla_expr0", scope: !100, type: !110, flags: DIFlagArtificial)
!110 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!111 = !DILocation(line: 0, scope: !100)
!112 = !DILocalVariable(name: "out", scope: !100, file: !3, line: 25, type: !113)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: !109)
!116 = !DILocation(line: 25, column: 7, scope: !100)
!117 = !DILocalVariable(name: "i", scope: !118, file: !3, line: 26, type: !17)
!118 = distinct !DILexicalBlock(scope: !100, file: !3, line: 26, column: 2)
!119 = !DILocation(line: 26, column: 11, scope: !118)
!120 = !DILocation(line: 26, column: 7, scope: !118)
!121 = !DILocation(line: 26, column: 18, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !3, line: 26, column: 2)
!123 = !DILocation(line: 26, column: 22, scope: !122)
!124 = !DILocation(line: 26, column: 20, scope: !122)
!125 = !DILocation(line: 26, column: 2, scope: !118)
!126 = !DILocation(line: 26, column: 39, scope: !122)
!127 = !DILocation(line: 26, column: 43, scope: !122)
!128 = !DILocation(line: 26, column: 34, scope: !122)
!129 = !DILocation(line: 26, column: 30, scope: !122)
!130 = !DILocation(line: 26, column: 37, scope: !122)
!131 = !DILocation(line: 26, column: 26, scope: !122)
!132 = !DILocation(line: 26, column: 2, scope: !122)
!133 = distinct !{!133, !125, !134}
!134 = !DILocation(line: 26, column: 44, scope: !118)
!135 = !DILocation(line: 27, column: 7, scope: !100)
!136 = !DILocation(line: 27, column: 17, scope: !100)
!137 = !DILocation(line: 27, column: 2, scope: !100)
!138 = !DILocation(line: 28, column: 1, scope: !100)
!139 = distinct !DISubprogram(name: "pad_two", scope: !3, file: !3, line: 31, type: !140, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DISubroutineType(types: !141)
!141 = !{!14, !142, !17, !143}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!144 = !DILocalVariable(name: "g", arg: 1, scope: !139, file: !3, line: 31, type: !142)
!145 = !DILocation(line: 31, column: 22, scope: !139)
!146 = !DILocalVariable(name: "len", arg: 2, scope: !139, file: !3, line: 31, type: !17)
!147 = !DILocation(line: 31, column: 31, scope: !139)
!148 = !DILocalVariable(name: "ns", arg: 3, scope: !139, file: !3, line: 31, type: !143)
!149 = !DILocation(line: 31, column: 41, scope: !139)
!150 = !DILocalVariable(name: "n", scope: !139, file: !3, line: 33, type: !17)
!151 = !DILocation(line: 33, column: 6, scope: !139)
!152 = !DILocation(line: 34, column: 7, scope: !153)
!153 = distinct !DILexicalBlock(scope: !139, file: !3, line: 34, column: 6)
!154 = !DILocation(line: 34, column: 6, scope: !153)
!155 = !DILocation(line: 34, column: 6, scope: !139)
!156 = !DILocation(line: 34, column: 16, scope: !153)
!157 = !DILocation(line: 34, column: 15, scope: !153)
!158 = !DILocation(line: 34, column: 13, scope: !153)
!159 = !DILocation(line: 34, column: 11, scope: !153)
!160 = !DILocation(line: 35, column: 7, scope: !153)
!161 = !DILocation(line: 35, column: 14, scope: !153)
!162 = !DILocation(line: 35, column: 18, scope: !153)
!163 = !DILocation(line: 35, column: 16, scope: !153)
!164 = !DILocation(line: 35, column: 25, scope: !153)
!165 = distinct !{!165, !160, !166}
!166 = !DILocation(line: 35, column: 28, scope: !153)
!167 = !DILocalVariable(name: "buf", scope: !139, file: !3, line: 37, type: !14)
!168 = !DILocation(line: 37, column: 8, scope: !139)
!169 = !DILocation(line: 37, column: 35, scope: !139)
!170 = !DILocation(line: 37, column: 14, scope: !139)
!171 = !DILocalVariable(name: "i", scope: !172, file: !3, line: 38, type: !17)
!172 = distinct !DILexicalBlock(scope: !139, file: !3, line: 38, column: 2)
!173 = !DILocation(line: 38, column: 11, scope: !172)
!174 = !DILocation(line: 38, column: 7, scope: !172)
!175 = !DILocation(line: 38, column: 18, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !3, line: 38, column: 2)
!177 = !DILocation(line: 38, column: 22, scope: !176)
!178 = !DILocation(line: 38, column: 20, scope: !176)
!179 = !DILocation(line: 38, column: 2, scope: !172)
!180 = !DILocation(line: 38, column: 41, scope: !176)
!181 = !DILocation(line: 38, column: 43, scope: !176)
!182 = !DILocation(line: 38, column: 32, scope: !176)
!183 = !DILocation(line: 38, column: 36, scope: !176)
!184 = !DILocation(line: 38, column: 39, scope: !176)
!185 = !DILocation(line: 38, column: 28, scope: !176)
!186 = !DILocation(line: 38, column: 2, scope: !176)
!187 = distinct !{!187, !179, !188}
!188 = !DILocation(line: 38, column: 44, scope: !172)
!189 = !DILocation(line: 39, column: 8, scope: !139)
!190 = !DILocation(line: 39, column: 3, scope: !139)
!191 = !DILocation(line: 39, column: 6, scope: !139)
!192 = !DILocation(line: 40, column: 9, scope: !139)
!193 = !DILocation(line: 40, column: 2, scope: !139)
!194 = distinct !DISubprogram(name: "deconv", scope: !3, file: !3, line: 43, type: !195, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DISubroutineType(types: !196)
!196 = !{null, !142, !17, !142, !17, !142}
!197 = !DILocalVariable(name: "g", arg: 1, scope: !194, file: !3, line: 43, type: !142)
!198 = !DILocation(line: 43, column: 20, scope: !194)
!199 = !DILocalVariable(name: "lg", arg: 2, scope: !194, file: !3, line: 43, type: !17)
!200 = !DILocation(line: 43, column: 29, scope: !194)
!201 = !DILocalVariable(name: "f", arg: 3, scope: !194, file: !3, line: 43, type: !142)
!202 = !DILocation(line: 43, column: 40, scope: !194)
!203 = !DILocalVariable(name: "lf", arg: 4, scope: !194, file: !3, line: 43, type: !17)
!204 = !DILocation(line: 43, column: 49, scope: !194)
!205 = !DILocalVariable(name: "out", arg: 5, scope: !194, file: !3, line: 43, type: !142)
!206 = !DILocation(line: 43, column: 60, scope: !194)
!207 = !DILocalVariable(name: "ns", scope: !194, file: !3, line: 44, type: !17)
!208 = !DILocation(line: 44, column: 6, scope: !194)
!209 = !DILocalVariable(name: "g2", scope: !194, file: !3, line: 45, type: !14)
!210 = !DILocation(line: 45, column: 8, scope: !194)
!211 = !DILocation(line: 45, column: 21, scope: !194)
!212 = !DILocation(line: 45, column: 24, scope: !194)
!213 = !DILocation(line: 45, column: 13, scope: !194)
!214 = !DILocalVariable(name: "f2", scope: !194, file: !3, line: 46, type: !14)
!215 = !DILocation(line: 46, column: 8, scope: !194)
!216 = !DILocation(line: 46, column: 21, scope: !194)
!217 = !DILocation(line: 46, column: 24, scope: !194)
!218 = !DILocation(line: 46, column: 13, scope: !194)
!219 = !DILocation(line: 48, column: 6, scope: !194)
!220 = !DILocation(line: 48, column: 10, scope: !194)
!221 = !DILocation(line: 48, column: 2, scope: !194)
!222 = !DILocation(line: 49, column: 6, scope: !194)
!223 = !DILocation(line: 49, column: 10, scope: !194)
!224 = !DILocation(line: 49, column: 2, scope: !194)
!225 = !DILocation(line: 51, column: 9, scope: !194)
!226 = !DILocation(line: 51, column: 2, scope: !194)
!227 = !DILocalVariable(name: "__vla_expr0", scope: !194, type: !110, flags: DIFlagArtificial)
!228 = !DILocation(line: 0, scope: !194)
!229 = !DILocalVariable(name: "h", scope: !194, file: !3, line: 51, type: !230)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !231)
!231 = !{!232}
!232 = !DISubrange(count: !227)
!233 = !DILocation(line: 51, column: 7, scope: !194)
!234 = !DILocalVariable(name: "i", scope: !235, file: !3, line: 52, type: !17)
!235 = distinct !DILexicalBlock(scope: !194, file: !3, line: 52, column: 2)
!236 = !DILocation(line: 52, column: 11, scope: !235)
!237 = !DILocation(line: 52, column: 7, scope: !235)
!238 = !DILocation(line: 52, column: 18, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !3, line: 52, column: 2)
!240 = !DILocation(line: 52, column: 22, scope: !239)
!241 = !DILocation(line: 52, column: 20, scope: !239)
!242 = !DILocation(line: 52, column: 2, scope: !235)
!243 = !DILocation(line: 52, column: 38, scope: !239)
!244 = !DILocation(line: 52, column: 41, scope: !239)
!245 = !DILocation(line: 52, column: 46, scope: !239)
!246 = !DILocation(line: 52, column: 49, scope: !239)
!247 = !DILocation(line: 52, column: 44, scope: !239)
!248 = !DILocation(line: 52, column: 33, scope: !239)
!249 = !DILocation(line: 52, column: 31, scope: !239)
!250 = !DILocation(line: 52, column: 36, scope: !239)
!251 = !DILocation(line: 52, column: 27, scope: !239)
!252 = !DILocation(line: 52, column: 2, scope: !239)
!253 = distinct !{!253, !242, !254}
!254 = !DILocation(line: 52, column: 50, scope: !235)
!255 = !DILocation(line: 53, column: 9, scope: !194)
!256 = !DILocation(line: 53, column: 2, scope: !194)
!257 = !DILocalVariable(name: "i", scope: !258, file: !3, line: 55, type: !17)
!258 = distinct !DILexicalBlock(scope: !194, file: !3, line: 55, column: 2)
!259 = !DILocation(line: 55, column: 11, scope: !258)
!260 = !DILocation(line: 55, column: 7, scope: !258)
!261 = !DILocation(line: 55, column: 18, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !3, line: 55, column: 2)
!263 = !DILocation(line: 55, column: 23, scope: !262)
!264 = !DILocation(line: 55, column: 28, scope: !262)
!265 = !DILocation(line: 55, column: 26, scope: !262)
!266 = !DILocation(line: 55, column: 20, scope: !262)
!267 = !DILocation(line: 55, column: 2, scope: !258)
!268 = !DILocation(line: 56, column: 16, scope: !262)
!269 = !DILocation(line: 56, column: 20, scope: !262)
!270 = !DILocation(line: 56, column: 18, scope: !262)
!271 = !DILocation(line: 56, column: 26, scope: !262)
!272 = !DILocation(line: 56, column: 24, scope: !262)
!273 = !DILocation(line: 56, column: 13, scope: !262)
!274 = !DILocation(line: 56, column: 29, scope: !262)
!275 = !DILocation(line: 56, column: 3, scope: !262)
!276 = !DILocation(line: 56, column: 8, scope: !262)
!277 = !DILocation(line: 56, column: 7, scope: !262)
!278 = !DILocation(line: 56, column: 11, scope: !262)
!279 = !DILocation(line: 55, column: 33, scope: !262)
!280 = !DILocation(line: 55, column: 2, scope: !262)
!281 = distinct !{!281, !267, !282}
!282 = !DILocation(line: 56, column: 30, scope: !258)
!283 = !DILocation(line: 57, column: 7, scope: !194)
!284 = !DILocation(line: 57, column: 2, scope: !194)
!285 = !DILocation(line: 58, column: 7, scope: !194)
!286 = !DILocation(line: 58, column: 2, scope: !194)
!287 = !DILocation(line: 59, column: 1, scope: !194)
!288 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 61, type: !289, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!289 = !DISubroutineType(types: !290)
!290 = !{!17}
!291 = !DILocation(line: 63, column: 7, scope: !288)
!292 = !DILocation(line: 63, column: 18, scope: !288)
!293 = !DILocation(line: 63, column: 5, scope: !288)
!294 = !DILocalVariable(name: "g", scope: !288, file: !3, line: 64, type: !295)
!295 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1344, elements: !296)
!296 = !{!297}
!297 = !DISubrange(count: 21)
!298 = !DILocation(line: 64, column: 9, scope: !288)
!299 = !DILocalVariable(name: "f", scope: !288, file: !3, line: 65, type: !300)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1024, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: 16)
!303 = !DILocation(line: 65, column: 9, scope: !288)
!304 = !DILocalVariable(name: "h", scope: !288, file: !3, line: 66, type: !305)
!305 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 384, elements: !306)
!306 = !{!307}
!307 = !DISubrange(count: 6)
!308 = !DILocation(line: 66, column: 9, scope: !288)
!309 = !DILocalVariable(name: "lg", scope: !288, file: !3, line: 68, type: !17)
!310 = !DILocation(line: 68, column: 6, scope: !288)
!311 = !DILocalVariable(name: "lf", scope: !288, file: !3, line: 69, type: !17)
!312 = !DILocation(line: 69, column: 6, scope: !288)
!313 = !DILocalVariable(name: "lh", scope: !288, file: !3, line: 70, type: !17)
!314 = !DILocation(line: 70, column: 6, scope: !288)
!315 = !DILocation(line: 72, column: 12, scope: !288)
!316 = !DILocation(line: 72, column: 2, scope: !288)
!317 = !DILocalVariable(name: "__vla_expr0", scope: !288, type: !110, flags: DIFlagArtificial)
!318 = !DILocation(line: 0, scope: !288)
!319 = !DILocalVariable(name: "h2", scope: !288, file: !3, line: 72, type: !320)
!320 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !321)
!321 = !{!322}
!322 = !DISubrange(count: !317)
!323 = !DILocation(line: 72, column: 9, scope: !288)
!324 = !DILocation(line: 73, column: 12, scope: !288)
!325 = !DILocation(line: 73, column: 2, scope: !288)
!326 = !DILocalVariable(name: "__vla_expr1", scope: !288, type: !110, flags: DIFlagArtificial)
!327 = !DILocalVariable(name: "f2", scope: !288, file: !3, line: 73, type: !328)
!328 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !329)
!329 = !{!330}
!330 = !DISubrange(count: !326)
!331 = !DILocation(line: 73, column: 9, scope: !288)
!332 = !DILocation(line: 75, column: 2, scope: !288)
!333 = !DILocalVariable(name: "i", scope: !334, file: !3, line: 76, type: !17)
!334 = distinct !DILexicalBlock(scope: !288, file: !3, line: 76, column: 2)
!335 = !DILocation(line: 76, column: 11, scope: !334)
!336 = !DILocation(line: 76, column: 7, scope: !334)
!337 = !DILocation(line: 76, column: 18, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !3, line: 76, column: 2)
!339 = !DILocation(line: 76, column: 22, scope: !338)
!340 = !DILocation(line: 76, column: 20, scope: !338)
!341 = !DILocation(line: 76, column: 2, scope: !334)
!342 = !DILocation(line: 76, column: 47, scope: !338)
!343 = !DILocation(line: 76, column: 45, scope: !338)
!344 = !DILocation(line: 76, column: 31, scope: !338)
!345 = !DILocation(line: 76, column: 27, scope: !338)
!346 = !DILocation(line: 76, column: 2, scope: !338)
!347 = distinct !{!347, !341, !348}
!348 = !DILocation(line: 76, column: 49, scope: !334)
!349 = !DILocation(line: 77, column: 2, scope: !288)
!350 = !DILocation(line: 79, column: 2, scope: !288)
!351 = !DILocation(line: 80, column: 9, scope: !288)
!352 = !DILocation(line: 80, column: 12, scope: !288)
!353 = !DILocation(line: 80, column: 16, scope: !288)
!354 = !DILocation(line: 80, column: 19, scope: !288)
!355 = !DILocation(line: 80, column: 2, scope: !288)
!356 = !DILocalVariable(name: "i", scope: !357, file: !3, line: 81, type: !17)
!357 = distinct !DILexicalBlock(scope: !288, file: !3, line: 81, column: 2)
!358 = !DILocation(line: 81, column: 11, scope: !357)
!359 = !DILocation(line: 81, column: 7, scope: !357)
!360 = !DILocation(line: 81, column: 18, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !3, line: 81, column: 2)
!362 = !DILocation(line: 81, column: 22, scope: !361)
!363 = !DILocation(line: 81, column: 20, scope: !361)
!364 = !DILocation(line: 81, column: 2, scope: !357)
!365 = !DILocation(line: 81, column: 48, scope: !361)
!366 = !DILocation(line: 81, column: 45, scope: !361)
!367 = !DILocation(line: 81, column: 31, scope: !361)
!368 = !DILocation(line: 81, column: 27, scope: !361)
!369 = !DILocation(line: 81, column: 2, scope: !361)
!370 = distinct !{!370, !364, !371}
!371 = !DILocation(line: 81, column: 50, scope: !357)
!372 = !DILocation(line: 82, column: 2, scope: !288)
!373 = !DILocation(line: 84, column: 2, scope: !288)
!374 = !DILocalVariable(name: "i", scope: !375, file: !3, line: 85, type: !17)
!375 = distinct !DILexicalBlock(scope: !288, file: !3, line: 85, column: 2)
!376 = !DILocation(line: 85, column: 11, scope: !375)
!377 = !DILocation(line: 85, column: 7, scope: !375)
!378 = !DILocation(line: 85, column: 18, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !3, line: 85, column: 2)
!380 = !DILocation(line: 85, column: 22, scope: !379)
!381 = !DILocation(line: 85, column: 20, scope: !379)
!382 = !DILocation(line: 85, column: 2, scope: !375)
!383 = !DILocation(line: 85, column: 47, scope: !379)
!384 = !DILocation(line: 85, column: 45, scope: !379)
!385 = !DILocation(line: 85, column: 31, scope: !379)
!386 = !DILocation(line: 85, column: 27, scope: !379)
!387 = !DILocation(line: 85, column: 2, scope: !379)
!388 = distinct !{!388, !382, !389}
!389 = !DILocation(line: 85, column: 49, scope: !375)
!390 = !DILocation(line: 86, column: 2, scope: !288)
!391 = !DILocation(line: 88, column: 2, scope: !288)
!392 = !DILocation(line: 89, column: 9, scope: !288)
!393 = !DILocation(line: 89, column: 12, scope: !288)
!394 = !DILocation(line: 89, column: 16, scope: !288)
!395 = !DILocation(line: 89, column: 19, scope: !288)
!396 = !DILocation(line: 89, column: 2, scope: !288)
!397 = !DILocalVariable(name: "i", scope: !398, file: !3, line: 90, type: !17)
!398 = distinct !DILexicalBlock(scope: !288, file: !3, line: 90, column: 2)
!399 = !DILocation(line: 90, column: 11, scope: !398)
!400 = !DILocation(line: 90, column: 7, scope: !398)
!401 = !DILocation(line: 90, column: 18, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !3, line: 90, column: 2)
!403 = !DILocation(line: 90, column: 22, scope: !402)
!404 = !DILocation(line: 90, column: 20, scope: !402)
!405 = !DILocation(line: 90, column: 2, scope: !398)
!406 = !DILocation(line: 90, column: 48, scope: !402)
!407 = !DILocation(line: 90, column: 45, scope: !402)
!408 = !DILocation(line: 90, column: 31, scope: !402)
!409 = !DILocation(line: 90, column: 27, scope: !402)
!410 = !DILocation(line: 90, column: 2, scope: !402)
!411 = distinct !{!411, !405, !412}
!412 = !DILocation(line: 90, column: 50, scope: !398)
!413 = !DILocation(line: 91, column: 2, scope: !288)
!414 = !DILocation(line: 92, column: 1, scope: !288)
