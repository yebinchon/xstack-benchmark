; ModuleID = 'arithmetic-complex-1.bc'
source_filename = "arithmetic-complex-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%f%+fI\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"\0Aa=\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"\0Ab=\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"\0Aa+b=\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"\0Aa*b=\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"\0A1/c=\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"\0A-a=\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"\0Aconj a=\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @cprint(double %c.coerce0, double %c.coerce1) #0 !dbg !7 {
entry:
  %c = alloca { double, double }, align 8
  %0 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0
  store double %c.coerce0, double* %0, align 8
  %1 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1
  store double %c.coerce1, double* %1, align 8
  call void @llvm.dbg.declare(metadata { double, double }* %c, metadata !11, metadata !DIExpression()), !dbg !12
  %c.realp = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !13
  %c.real = load double, double* %c.realp, align 8, !dbg !13
  %c.imagp = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !13
  %c.imag = load double, double* %c.imagp, align 8, !dbg !13
  %c.realp1 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !14
  %c.real2 = load double, double* %c.realp1, align 8, !dbg !14
  %c.imagp3 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !14
  %c.imag4 = load double, double* %c.imagp3, align 8, !dbg !14
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %c.real, double %c.imag4), !dbg !15
  ret void, !dbg !16
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @complex_operations() #0 !dbg !17 {
entry:
  %a = alloca { double, double }, align 8
  %b = alloca { double, double }, align 8
  %c = alloca { double, double }, align 8
  %coerce = alloca { double, double }, align 8
  %coerce6 = alloca { double, double }, align 8
  %coerce18 = alloca { double, double }, align 8
  %coerce36 = alloca { double, double }, align 8
  %coerce49 = alloca { double, double }, align 8
  %coerce61 = alloca { double, double }, align 8
  %coerce73 = alloca { double, double }, align 8
  call void @llvm.dbg.declare(metadata { double, double }* %a, metadata !20, metadata !DIExpression()), !dbg !21
  %a.realp = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !21
  %a.imagp = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !21
  store double 1.000000e+00, double* %a.realp, align 8, !dbg !21
  store double 1.000000e+00, double* %a.imagp, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata { double, double }* %b, metadata !22, metadata !DIExpression()), !dbg !23
  %b.realp = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 0, !dbg !23
  %b.imagp = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 1, !dbg !23
  store double 3.141590e+00, double* %b.realp, align 8, !dbg !23
  store double 1.200000e+00, double* %b.imagp, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata { double, double }* %c, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !26
  %a.realp1 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !27
  %a.real = load double, double* %a.realp1, align 8, !dbg !27
  %a.imagp2 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !27
  %a.imag = load double, double* %a.imagp2, align 8, !dbg !27
  %coerce.realp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !28
  %coerce.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !28
  store double %a.real, double* %coerce.realp, align 8, !dbg !28
  store double %a.imag, double* %coerce.imagp, align 8, !dbg !28
  %0 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 0, !dbg !28
  %1 = load double, double* %0, align 8, !dbg !28
  %2 = getelementptr inbounds { double, double }, { double, double }* %coerce, i32 0, i32 1, !dbg !28
  %3 = load double, double* %2, align 8, !dbg !28
  call void @cprint(double %1, double %3), !dbg !28
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)), !dbg !29
  %b.realp4 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 0, !dbg !30
  %b.real = load double, double* %b.realp4, align 8, !dbg !30
  %b.imagp5 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 1, !dbg !30
  %b.imag = load double, double* %b.imagp5, align 8, !dbg !30
  %coerce6.realp = getelementptr inbounds { double, double }, { double, double }* %coerce6, i32 0, i32 0, !dbg !31
  %coerce6.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce6, i32 0, i32 1, !dbg !31
  store double %b.real, double* %coerce6.realp, align 8, !dbg !31
  store double %b.imag, double* %coerce6.imagp, align 8, !dbg !31
  %4 = getelementptr inbounds { double, double }, { double, double }* %coerce6, i32 0, i32 0, !dbg !31
  %5 = load double, double* %4, align 8, !dbg !31
  %6 = getelementptr inbounds { double, double }, { double, double }* %coerce6, i32 0, i32 1, !dbg !31
  %7 = load double, double* %6, align 8, !dbg !31
  call void @cprint(double %5, double %7), !dbg !31
  %a.realp7 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !32
  %a.real8 = load double, double* %a.realp7, align 8, !dbg !32
  %a.imagp9 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !32
  %a.imag10 = load double, double* %a.imagp9, align 8, !dbg !32
  %b.realp11 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 0, !dbg !33
  %b.real12 = load double, double* %b.realp11, align 8, !dbg !33
  %b.imagp13 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 1, !dbg !33
  %b.imag14 = load double, double* %b.imagp13, align 8, !dbg !33
  %add.r = fadd double %a.real8, %b.real12, !dbg !34
  %add.i = fadd double %a.imag10, %b.imag14, !dbg !34
  %c.realp = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !35
  %c.imagp = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !35
  store double %add.r, double* %c.realp, align 8, !dbg !35
  store double %add.i, double* %c.imagp, align 8, !dbg !35
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)), !dbg !36
  %c.realp16 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !37
  %c.real = load double, double* %c.realp16, align 8, !dbg !37
  %c.imagp17 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !37
  %c.imag = load double, double* %c.imagp17, align 8, !dbg !37
  %coerce18.realp = getelementptr inbounds { double, double }, { double, double }* %coerce18, i32 0, i32 0, !dbg !38
  %coerce18.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce18, i32 0, i32 1, !dbg !38
  store double %c.real, double* %coerce18.realp, align 8, !dbg !38
  store double %c.imag, double* %coerce18.imagp, align 8, !dbg !38
  %8 = getelementptr inbounds { double, double }, { double, double }* %coerce18, i32 0, i32 0, !dbg !38
  %9 = load double, double* %8, align 8, !dbg !38
  %10 = getelementptr inbounds { double, double }, { double, double }* %coerce18, i32 0, i32 1, !dbg !38
  %11 = load double, double* %10, align 8, !dbg !38
  call void @cprint(double %9, double %11), !dbg !38
  %a.realp19 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !39
  %a.real20 = load double, double* %a.realp19, align 8, !dbg !39
  %a.imagp21 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !39
  %a.imag22 = load double, double* %a.imagp21, align 8, !dbg !39
  %b.realp23 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 0, !dbg !40
  %b.real24 = load double, double* %b.realp23, align 8, !dbg !40
  %b.imagp25 = getelementptr inbounds { double, double }, { double, double }* %b, i32 0, i32 1, !dbg !40
  %b.imag26 = load double, double* %b.imagp25, align 8, !dbg !40
  %mul_ac = fmul double %a.real20, %b.real24, !dbg !41
  %mul_bd = fmul double %a.imag22, %b.imag26, !dbg !41
  %mul_ad = fmul double %a.real20, %b.imag26, !dbg !41
  %mul_bc = fmul double %a.imag22, %b.real24, !dbg !41
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !41
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !41
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !41
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !41, !prof !42

complex_mul_imag_nan:                             ; preds = %entry
  %isnan_cmp27 = fcmp uno double %mul_i, %mul_i, !dbg !41
  br i1 %isnan_cmp27, label %complex_mul_libcall, label %complex_mul_cont, !dbg !41, !prof !42

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call28 = call { double, double } @__muldc3(double %a.real20, double %a.imag22, double %b.real24, double %b.imag26) #3, !dbg !41
  %12 = extractvalue { double, double } %call28, 0, !dbg !41
  %13 = extractvalue { double, double } %call28, 1, !dbg !41
  br label %complex_mul_cont, !dbg !41

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %entry
  %real_mul_phi = phi double [ %mul_r, %entry ], [ %mul_r, %complex_mul_imag_nan ], [ %12, %complex_mul_libcall ], !dbg !41
  %imag_mul_phi = phi double [ %mul_i, %entry ], [ %mul_i, %complex_mul_imag_nan ], [ %13, %complex_mul_libcall ], !dbg !41
  %c.realp29 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !43
  %c.imagp30 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !43
  store double %real_mul_phi, double* %c.realp29, align 8, !dbg !43
  store double %imag_mul_phi, double* %c.imagp30, align 8, !dbg !43
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0)), !dbg !44
  %c.realp32 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !45
  %c.real33 = load double, double* %c.realp32, align 8, !dbg !45
  %c.imagp34 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !45
  %c.imag35 = load double, double* %c.imagp34, align 8, !dbg !45
  %coerce36.realp = getelementptr inbounds { double, double }, { double, double }* %coerce36, i32 0, i32 0, !dbg !46
  %coerce36.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce36, i32 0, i32 1, !dbg !46
  store double %c.real33, double* %coerce36.realp, align 8, !dbg !46
  store double %c.imag35, double* %coerce36.imagp, align 8, !dbg !46
  %14 = getelementptr inbounds { double, double }, { double, double }* %coerce36, i32 0, i32 0, !dbg !46
  %15 = load double, double* %14, align 8, !dbg !46
  %16 = getelementptr inbounds { double, double }, { double, double }* %coerce36, i32 0, i32 1, !dbg !46
  %17 = load double, double* %16, align 8, !dbg !46
  call void @cprint(double %15, double %17), !dbg !46
  %a.realp37 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !47
  %a.real38 = load double, double* %a.realp37, align 8, !dbg !47
  %a.imagp39 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !47
  %a.imag40 = load double, double* %a.imagp39, align 8, !dbg !47
  %call41 = call { double, double } @__divdc3(double 1.000000e+00, double 0.000000e+00, double %a.real38, double %a.imag40) #3, !dbg !48
  %18 = extractvalue { double, double } %call41, 0, !dbg !48
  %19 = extractvalue { double, double } %call41, 1, !dbg !48
  %c.realp42 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !49
  %c.imagp43 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !49
  store double %18, double* %c.realp42, align 8, !dbg !49
  store double %19, double* %c.imagp43, align 8, !dbg !49
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0)), !dbg !50
  %c.realp45 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !51
  %c.real46 = load double, double* %c.realp45, align 8, !dbg !51
  %c.imagp47 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !51
  %c.imag48 = load double, double* %c.imagp47, align 8, !dbg !51
  %coerce49.realp = getelementptr inbounds { double, double }, { double, double }* %coerce49, i32 0, i32 0, !dbg !52
  %coerce49.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce49, i32 0, i32 1, !dbg !52
  store double %c.real46, double* %coerce49.realp, align 8, !dbg !52
  store double %c.imag48, double* %coerce49.imagp, align 8, !dbg !52
  %20 = getelementptr inbounds { double, double }, { double, double }* %coerce49, i32 0, i32 0, !dbg !52
  %21 = load double, double* %20, align 8, !dbg !52
  %22 = getelementptr inbounds { double, double }, { double, double }* %coerce49, i32 0, i32 1, !dbg !52
  %23 = load double, double* %22, align 8, !dbg !52
  call void @cprint(double %21, double %23), !dbg !52
  %a.realp50 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !53
  %a.real51 = load double, double* %a.realp50, align 8, !dbg !53
  %a.imagp52 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !53
  %a.imag53 = load double, double* %a.imagp52, align 8, !dbg !53
  %neg.r = fneg double %a.real51, !dbg !54
  %neg.i = fneg double %a.imag53, !dbg !54
  %c.realp54 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !55
  %c.imagp55 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !55
  store double %neg.r, double* %c.realp54, align 8, !dbg !55
  store double %neg.i, double* %c.imagp55, align 8, !dbg !55
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0)), !dbg !56
  %c.realp57 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !57
  %c.real58 = load double, double* %c.realp57, align 8, !dbg !57
  %c.imagp59 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !57
  %c.imag60 = load double, double* %c.imagp59, align 8, !dbg !57
  %coerce61.realp = getelementptr inbounds { double, double }, { double, double }* %coerce61, i32 0, i32 0, !dbg !58
  %coerce61.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce61, i32 0, i32 1, !dbg !58
  store double %c.real58, double* %coerce61.realp, align 8, !dbg !58
  store double %c.imag60, double* %coerce61.imagp, align 8, !dbg !58
  %24 = getelementptr inbounds { double, double }, { double, double }* %coerce61, i32 0, i32 0, !dbg !58
  %25 = load double, double* %24, align 8, !dbg !58
  %26 = getelementptr inbounds { double, double }, { double, double }* %coerce61, i32 0, i32 1, !dbg !58
  %27 = load double, double* %26, align 8, !dbg !58
  call void @cprint(double %25, double %27), !dbg !58
  %a.realp62 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 0, !dbg !59
  %a.real63 = load double, double* %a.realp62, align 8, !dbg !59
  %a.imagp64 = getelementptr inbounds { double, double }, { double, double }* %a, i32 0, i32 1, !dbg !59
  %a.imag65 = load double, double* %a.imagp64, align 8, !dbg !59
  %neg = fneg double %a.imag65, !dbg !60
  %c.realp66 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !61
  %c.imagp67 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !61
  store double %a.real63, double* %c.realp66, align 8, !dbg !61
  store double %neg, double* %c.imagp67, align 8, !dbg !61
  %call68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0)), !dbg !62
  %c.realp69 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 0, !dbg !63
  %c.real70 = load double, double* %c.realp69, align 8, !dbg !63
  %c.imagp71 = getelementptr inbounds { double, double }, { double, double }* %c, i32 0, i32 1, !dbg !63
  %c.imag72 = load double, double* %c.imagp71, align 8, !dbg !63
  %coerce73.realp = getelementptr inbounds { double, double }, { double, double }* %coerce73, i32 0, i32 0, !dbg !64
  %coerce73.imagp = getelementptr inbounds { double, double }, { double, double }* %coerce73, i32 0, i32 1, !dbg !64
  store double %c.real70, double* %coerce73.realp, align 8, !dbg !64
  store double %c.imag72, double* %coerce73.imagp, align 8, !dbg !64
  %28 = getelementptr inbounds { double, double }, { double, double }* %coerce73, i32 0, i32 0, !dbg !64
  %29 = load double, double* %28, align 8, !dbg !64
  %30 = getelementptr inbounds { double, double }, { double, double }* %coerce73, i32 0, i32 1, !dbg !64
  %31 = load double, double* %30, align 8, !dbg !64
  call void @cprint(double %29, double %31), !dbg !64
  %call74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)), !dbg !65
  ret void, !dbg !66
}

declare dso_local { double, double } @__muldc3(double, double, double, double)

declare dso_local { double, double } @__divdc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @complex_operations(), !dbg !71
  ret i32 0, !dbg !72
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-complex-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-Complex")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "cprint", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "complex", size: 128, encoding: DW_ATE_complex_float)
!11 = !DILocalVariable(name: "c", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 28, scope: !7)
!13 = !DILocation(line: 6, column: 26, scope: !7)
!14 = !DILocation(line: 6, column: 36, scope: !7)
!15 = !DILocation(line: 6, column: 3, scope: !7)
!16 = !DILocation(line: 7, column: 1, scope: !7)
!17 = distinct !DISubprogram(name: "complex_operations", scope: !1, file: !1, line: 8, type: !18, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "a", scope: !17, file: !1, line: 9, type: !10)
!21 = !DILocation(line: 9, column: 18, scope: !17)
!22 = !DILocalVariable(name: "b", scope: !17, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 18, scope: !17)
!24 = !DILocalVariable(name: "c", scope: !17, file: !1, line: 12, type: !10)
!25 = !DILocation(line: 12, column: 18, scope: !17)
!26 = !DILocation(line: 14, column: 3, scope: !17)
!27 = !DILocation(line: 14, column: 26, scope: !17)
!28 = !DILocation(line: 14, column: 19, scope: !17)
!29 = !DILocation(line: 15, column: 3, scope: !17)
!30 = !DILocation(line: 15, column: 26, scope: !17)
!31 = !DILocation(line: 15, column: 19, scope: !17)
!32 = !DILocation(line: 18, column: 7, scope: !17)
!33 = !DILocation(line: 18, column: 11, scope: !17)
!34 = !DILocation(line: 18, column: 9, scope: !17)
!35 = !DILocation(line: 18, column: 5, scope: !17)
!36 = !DILocation(line: 19, column: 3, scope: !17)
!37 = !DILocation(line: 19, column: 28, scope: !17)
!38 = !DILocation(line: 19, column: 21, scope: !17)
!39 = !DILocation(line: 21, column: 7, scope: !17)
!40 = !DILocation(line: 21, column: 11, scope: !17)
!41 = !DILocation(line: 21, column: 9, scope: !17)
!42 = !{!"branch_weights", i32 1, i32 1048575}
!43 = !DILocation(line: 21, column: 5, scope: !17)
!44 = !DILocation(line: 22, column: 3, scope: !17)
!45 = !DILocation(line: 22, column: 28, scope: !17)
!46 = !DILocation(line: 22, column: 21, scope: !17)
!47 = !DILocation(line: 24, column: 13, scope: !17)
!48 = !DILocation(line: 24, column: 11, scope: !17)
!49 = !DILocation(line: 24, column: 5, scope: !17)
!50 = !DILocation(line: 25, column: 3, scope: !17)
!51 = !DILocation(line: 25, column: 28, scope: !17)
!52 = !DILocation(line: 25, column: 21, scope: !17)
!53 = !DILocation(line: 27, column: 8, scope: !17)
!54 = !DILocation(line: 27, column: 7, scope: !17)
!55 = !DILocation(line: 27, column: 5, scope: !17)
!56 = !DILocation(line: 28, column: 3, scope: !17)
!57 = !DILocation(line: 28, column: 27, scope: !17)
!58 = !DILocation(line: 28, column: 20, scope: !17)
!59 = !DILocation(line: 30, column: 12, scope: !17)
!60 = !DILocation(line: 30, column: 7, scope: !17)
!61 = !DILocation(line: 30, column: 5, scope: !17)
!62 = !DILocation(line: 31, column: 3, scope: !17)
!63 = !DILocation(line: 31, column: 31, scope: !17)
!64 = !DILocation(line: 31, column: 24, scope: !17)
!65 = !DILocation(line: 31, column: 35, scope: !17)
!66 = !DILocation(line: 32, column: 1, scope: !17)
!67 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 34, type: !68, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocation(line: 35, column: 3, scope: !67)
!72 = !DILocation(line: 36, column: 3, scope: !67)
