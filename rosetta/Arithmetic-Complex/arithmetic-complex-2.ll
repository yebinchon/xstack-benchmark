; ModuleID = 'arithmetic-complex-2.c'
source_filename = "arithmetic-complex-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Complex = type { double, double }

@.str = private unnamed_addr constant [9 x i8] c"%lf%+lfI\00", align 1
@__const.complex_ops.a = private unnamed_addr constant %struct.Complex { double 1.000000e+00, double 1.000000e+00 }, align 8
@__const.complex_ops.b = private unnamed_addr constant %struct.Complex { double 3.141590e+00, double 1.200000e+00 }, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"\0Aa=\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"\0Ab=\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"\0Aa+b=\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"\0Aa*b=\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"\0A1/a=\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"\0A-a=\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"\0Aconj a=\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double } @add(double %a.coerce0, double %a.coerce1, double %b.coerce0, double %b.coerce1) #0 !dbg !7 {
entry:
  %retval = alloca %struct.Complex, align 8
  %a = alloca %struct.Complex, align 8
  %b = alloca %struct.Complex, align 8
  %0 = bitcast %struct.Complex* %a to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %a.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %a.coerce1, double* %2, align 8
  %3 = bitcast %struct.Complex* %b to { double, double }*
  %4 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 0
  store double %b.coerce0, double* %4, align 8
  %5 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 1
  store double %b.coerce1, double* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct.Complex* %b, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %struct.Complex* %retval, metadata !20, metadata !DIExpression()), !dbg !21
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !22
  %6 = load double, double* %real, align 8, !dbg !22
  %real1 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 0, !dbg !23
  %7 = load double, double* %real1, align 8, !dbg !23
  %add = fadd double %6, %7, !dbg !24
  %real2 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 0, !dbg !25
  store double %add, double* %real2, align 8, !dbg !26
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !27
  %8 = load double, double* %imag, align 8, !dbg !27
  %imag3 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 1, !dbg !28
  %9 = load double, double* %imag3, align 8, !dbg !28
  %add4 = fadd double %8, %9, !dbg !29
  %imag5 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 1, !dbg !30
  store double %add4, double* %imag5, align 8, !dbg !31
  %10 = bitcast %struct.Complex* %retval to { double, double }*, !dbg !32
  %11 = load { double, double }, { double, double }* %10, align 8, !dbg !32
  ret { double, double } %11, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double } @mult(double %a.coerce0, double %a.coerce1, double %b.coerce0, double %b.coerce1) #0 !dbg !33 {
entry:
  %retval = alloca %struct.Complex, align 8
  %a = alloca %struct.Complex, align 8
  %b = alloca %struct.Complex, align 8
  %0 = bitcast %struct.Complex* %a to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %a.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %a.coerce1, double* %2, align 8
  %3 = bitcast %struct.Complex* %b to { double, double }*
  %4 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 0
  store double %b.coerce0, double* %4, align 8
  %5 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 1
  store double %b.coerce1, double* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata %struct.Complex* %b, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata %struct.Complex* %retval, metadata !38, metadata !DIExpression()), !dbg !39
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !40
  %6 = load double, double* %real, align 8, !dbg !40
  %real1 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 0, !dbg !41
  %7 = load double, double* %real1, align 8, !dbg !41
  %mul = fmul double %6, %7, !dbg !42
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !43
  %8 = load double, double* %imag, align 8, !dbg !43
  %imag2 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 1, !dbg !44
  %9 = load double, double* %imag2, align 8, !dbg !44
  %mul3 = fmul double %8, %9, !dbg !45
  %sub = fsub double %mul, %mul3, !dbg !46
  %real4 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 0, !dbg !47
  store double %sub, double* %real4, align 8, !dbg !48
  %real5 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !49
  %10 = load double, double* %real5, align 8, !dbg !49
  %imag6 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 1, !dbg !50
  %11 = load double, double* %imag6, align 8, !dbg !50
  %mul7 = fmul double %10, %11, !dbg !51
  %imag8 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !52
  %12 = load double, double* %imag8, align 8, !dbg !52
  %real9 = getelementptr inbounds %struct.Complex, %struct.Complex* %b, i32 0, i32 0, !dbg !53
  %13 = load double, double* %real9, align 8, !dbg !53
  %mul10 = fmul double %12, %13, !dbg !54
  %add = fadd double %mul7, %mul10, !dbg !55
  %imag11 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 1, !dbg !56
  store double %add, double* %imag11, align 8, !dbg !57
  %14 = bitcast %struct.Complex* %retval to { double, double }*, !dbg !58
  %15 = load { double, double }, { double, double }* %14, align 8, !dbg !58
  ret { double, double } %15, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double } @inv(double %a.coerce0, double %a.coerce1) #0 !dbg !59 {
entry:
  %retval = alloca %struct.Complex, align 8
  %a = alloca %struct.Complex, align 8
  %denom = alloca double, align 8
  %0 = bitcast %struct.Complex* %a to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %a.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %a.coerce1, double* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata %struct.Complex* %retval, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata double* %denom, metadata !66, metadata !DIExpression()), !dbg !67
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !68
  %3 = load double, double* %real, align 8, !dbg !68
  %real1 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !69
  %4 = load double, double* %real1, align 8, !dbg !69
  %mul = fmul double %3, %4, !dbg !70
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !71
  %5 = load double, double* %imag, align 8, !dbg !71
  %imag2 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !72
  %6 = load double, double* %imag2, align 8, !dbg !72
  %mul3 = fmul double %5, %6, !dbg !73
  %add = fadd double %mul, %mul3, !dbg !74
  store double %add, double* %denom, align 8, !dbg !67
  %real4 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !75
  %7 = load double, double* %real4, align 8, !dbg !75
  %8 = load double, double* %denom, align 8, !dbg !76
  %div = fdiv double %7, %8, !dbg !77
  %real5 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 0, !dbg !78
  store double %div, double* %real5, align 8, !dbg !79
  %imag6 = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !80
  %9 = load double, double* %imag6, align 8, !dbg !80
  %fneg = fneg double %9, !dbg !81
  %10 = load double, double* %denom, align 8, !dbg !82
  %div7 = fdiv double %fneg, %10, !dbg !83
  %imag8 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 1, !dbg !84
  store double %div7, double* %imag8, align 8, !dbg !85
  %11 = bitcast %struct.Complex* %retval to { double, double }*, !dbg !86
  %12 = load { double, double }, { double, double }* %11, align 8, !dbg !86
  ret { double, double } %12, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double } @neg(double %a.coerce0, double %a.coerce1) #0 !dbg !87 {
entry:
  %retval = alloca %struct.Complex, align 8
  %a = alloca %struct.Complex, align 8
  %0 = bitcast %struct.Complex* %a to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %a.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %a.coerce1, double* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.Complex* %retval, metadata !90, metadata !DIExpression()), !dbg !91
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !92
  %3 = load double, double* %real, align 8, !dbg !92
  %fneg = fneg double %3, !dbg !93
  %real1 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 0, !dbg !94
  store double %fneg, double* %real1, align 8, !dbg !95
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !96
  %4 = load double, double* %imag, align 8, !dbg !96
  %fneg2 = fneg double %4, !dbg !97
  %imag3 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 1, !dbg !98
  store double %fneg2, double* %imag3, align 8, !dbg !99
  %5 = bitcast %struct.Complex* %retval to { double, double }*, !dbg !100
  %6 = load { double, double }, { double, double }* %5, align 8, !dbg !100
  ret { double, double } %6, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local { double, double } @conj(double %a.coerce0, double %a.coerce1) #0 !dbg !101 {
entry:
  %retval = alloca %struct.Complex, align 8
  %a = alloca %struct.Complex, align 8
  %0 = bitcast %struct.Complex* %a to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %a.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %a.coerce1, double* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata %struct.Complex* %retval, metadata !104, metadata !DIExpression()), !dbg !105
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 0, !dbg !106
  %3 = load double, double* %real, align 8, !dbg !106
  %real1 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 0, !dbg !107
  store double %3, double* %real1, align 8, !dbg !108
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %a, i32 0, i32 1, !dbg !109
  %4 = load double, double* %imag, align 8, !dbg !109
  %fneg = fneg double %4, !dbg !110
  %imag2 = getelementptr inbounds %struct.Complex, %struct.Complex* %retval, i32 0, i32 1, !dbg !111
  store double %fneg, double* %imag2, align 8, !dbg !112
  %5 = bitcast %struct.Complex* %retval to { double, double }*, !dbg !113
  %6 = load { double, double }, { double, double }* %5, align 8, !dbg !113
  ret { double, double } %6, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @put(double %c.coerce0, double %c.coerce1) #0 !dbg !114 {
entry:
  %c = alloca %struct.Complex, align 8
  %0 = bitcast %struct.Complex* %c to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %c.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %c.coerce1, double* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %c, metadata !117, metadata !DIExpression()), !dbg !118
  %real = getelementptr inbounds %struct.Complex, %struct.Complex* %c, i32 0, i32 0, !dbg !119
  %3 = load double, double* %real, align 8, !dbg !119
  %imag = getelementptr inbounds %struct.Complex, %struct.Complex* %c, i32 0, i32 1, !dbg !120
  %4 = load double, double* %imag, align 8, !dbg !120
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), double %3, double %4), !dbg !121
  ret void, !dbg !122
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @complex_ops() #0 !dbg !123 {
entry:
  %a = alloca %struct.Complex, align 8
  %b = alloca %struct.Complex, align 8
  %agg.tmp = alloca %struct.Complex, align 8
  %agg.tmp5 = alloca %struct.Complex, align 8
  %agg.tmp8 = alloca %struct.Complex, align 8
  %agg.tmp11 = alloca %struct.Complex, align 8
  %agg.tmp14 = alloca %struct.Complex, align 8
  call void @llvm.dbg.declare(metadata %struct.Complex* %a, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = bitcast %struct.Complex* %a to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 bitcast (%struct.Complex* @__const.complex_ops.a to i8*), i64 16, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata %struct.Complex* %b, metadata !128, metadata !DIExpression()), !dbg !129
  %1 = bitcast %struct.Complex* %b to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 bitcast (%struct.Complex* @__const.complex_ops.b to i8*), i64 16, i1 false), !dbg !129
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  %2 = bitcast %struct.Complex* %a to { double, double }*, !dbg !131
  %3 = getelementptr inbounds { double, double }, { double, double }* %2, i32 0, i32 0, !dbg !131
  %4 = load double, double* %3, align 8, !dbg !131
  %5 = getelementptr inbounds { double, double }, { double, double }* %2, i32 0, i32 1, !dbg !131
  %6 = load double, double* %5, align 8, !dbg !131
  call void @put(double %4, double %6), !dbg !131
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  %7 = bitcast %struct.Complex* %b to { double, double }*, !dbg !133
  %8 = getelementptr inbounds { double, double }, { double, double }* %7, i32 0, i32 0, !dbg !133
  %9 = load double, double* %8, align 8, !dbg !133
  %10 = getelementptr inbounds { double, double }, { double, double }* %7, i32 0, i32 1, !dbg !133
  %11 = load double, double* %10, align 8, !dbg !133
  call void @put(double %9, double %11), !dbg !133
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  %12 = bitcast %struct.Complex* %a to { double, double }*, !dbg !135
  %13 = getelementptr inbounds { double, double }, { double, double }* %12, i32 0, i32 0, !dbg !135
  %14 = load double, double* %13, align 8, !dbg !135
  %15 = getelementptr inbounds { double, double }, { double, double }* %12, i32 0, i32 1, !dbg !135
  %16 = load double, double* %15, align 8, !dbg !135
  %17 = bitcast %struct.Complex* %b to { double, double }*, !dbg !135
  %18 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 0, !dbg !135
  %19 = load double, double* %18, align 8, !dbg !135
  %20 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 1, !dbg !135
  %21 = load double, double* %20, align 8, !dbg !135
  %call3 = call { double, double } @add(double %14, double %16, double %19, double %21), !dbg !135
  %22 = bitcast %struct.Complex* %agg.tmp to { double, double }*, !dbg !135
  %23 = getelementptr inbounds { double, double }, { double, double }* %22, i32 0, i32 0, !dbg !135
  %24 = extractvalue { double, double } %call3, 0, !dbg !135
  store double %24, double* %23, align 8, !dbg !135
  %25 = getelementptr inbounds { double, double }, { double, double }* %22, i32 0, i32 1, !dbg !135
  %26 = extractvalue { double, double } %call3, 1, !dbg !135
  store double %26, double* %25, align 8, !dbg !135
  %27 = bitcast %struct.Complex* %agg.tmp to { double, double }*, !dbg !136
  %28 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 0, !dbg !136
  %29 = load double, double* %28, align 8, !dbg !136
  %30 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 1, !dbg !136
  %31 = load double, double* %30, align 8, !dbg !136
  call void @put(double %29, double %31), !dbg !136
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  %32 = bitcast %struct.Complex* %a to { double, double }*, !dbg !138
  %33 = getelementptr inbounds { double, double }, { double, double }* %32, i32 0, i32 0, !dbg !138
  %34 = load double, double* %33, align 8, !dbg !138
  %35 = getelementptr inbounds { double, double }, { double, double }* %32, i32 0, i32 1, !dbg !138
  %36 = load double, double* %35, align 8, !dbg !138
  %37 = bitcast %struct.Complex* %b to { double, double }*, !dbg !138
  %38 = getelementptr inbounds { double, double }, { double, double }* %37, i32 0, i32 0, !dbg !138
  %39 = load double, double* %38, align 8, !dbg !138
  %40 = getelementptr inbounds { double, double }, { double, double }* %37, i32 0, i32 1, !dbg !138
  %41 = load double, double* %40, align 8, !dbg !138
  %call6 = call { double, double } @mult(double %34, double %36, double %39, double %41), !dbg !138
  %42 = bitcast %struct.Complex* %agg.tmp5 to { double, double }*, !dbg !138
  %43 = getelementptr inbounds { double, double }, { double, double }* %42, i32 0, i32 0, !dbg !138
  %44 = extractvalue { double, double } %call6, 0, !dbg !138
  store double %44, double* %43, align 8, !dbg !138
  %45 = getelementptr inbounds { double, double }, { double, double }* %42, i32 0, i32 1, !dbg !138
  %46 = extractvalue { double, double } %call6, 1, !dbg !138
  store double %46, double* %45, align 8, !dbg !138
  %47 = bitcast %struct.Complex* %agg.tmp5 to { double, double }*, !dbg !139
  %48 = getelementptr inbounds { double, double }, { double, double }* %47, i32 0, i32 0, !dbg !139
  %49 = load double, double* %48, align 8, !dbg !139
  %50 = getelementptr inbounds { double, double }, { double, double }* %47, i32 0, i32 1, !dbg !139
  %51 = load double, double* %50, align 8, !dbg !139
  call void @put(double %49, double %51), !dbg !139
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0)), !dbg !140
  %52 = bitcast %struct.Complex* %a to { double, double }*, !dbg !141
  %53 = getelementptr inbounds { double, double }, { double, double }* %52, i32 0, i32 0, !dbg !141
  %54 = load double, double* %53, align 8, !dbg !141
  %55 = getelementptr inbounds { double, double }, { double, double }* %52, i32 0, i32 1, !dbg !141
  %56 = load double, double* %55, align 8, !dbg !141
  %call9 = call { double, double } @inv(double %54, double %56), !dbg !141
  %57 = bitcast %struct.Complex* %agg.tmp8 to { double, double }*, !dbg !141
  %58 = getelementptr inbounds { double, double }, { double, double }* %57, i32 0, i32 0, !dbg !141
  %59 = extractvalue { double, double } %call9, 0, !dbg !141
  store double %59, double* %58, align 8, !dbg !141
  %60 = getelementptr inbounds { double, double }, { double, double }* %57, i32 0, i32 1, !dbg !141
  %61 = extractvalue { double, double } %call9, 1, !dbg !141
  store double %61, double* %60, align 8, !dbg !141
  %62 = bitcast %struct.Complex* %agg.tmp8 to { double, double }*, !dbg !142
  %63 = getelementptr inbounds { double, double }, { double, double }* %62, i32 0, i32 0, !dbg !142
  %64 = load double, double* %63, align 8, !dbg !142
  %65 = getelementptr inbounds { double, double }, { double, double }* %62, i32 0, i32 1, !dbg !142
  %66 = load double, double* %65, align 8, !dbg !142
  call void @put(double %64, double %66), !dbg !142
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0)), !dbg !143
  %67 = bitcast %struct.Complex* %a to { double, double }*, !dbg !144
  %68 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 0, !dbg !144
  %69 = load double, double* %68, align 8, !dbg !144
  %70 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 1, !dbg !144
  %71 = load double, double* %70, align 8, !dbg !144
  %call12 = call { double, double } @neg(double %69, double %71), !dbg !144
  %72 = bitcast %struct.Complex* %agg.tmp11 to { double, double }*, !dbg !144
  %73 = getelementptr inbounds { double, double }, { double, double }* %72, i32 0, i32 0, !dbg !144
  %74 = extractvalue { double, double } %call12, 0, !dbg !144
  store double %74, double* %73, align 8, !dbg !144
  %75 = getelementptr inbounds { double, double }, { double, double }* %72, i32 0, i32 1, !dbg !144
  %76 = extractvalue { double, double } %call12, 1, !dbg !144
  store double %76, double* %75, align 8, !dbg !144
  %77 = bitcast %struct.Complex* %agg.tmp11 to { double, double }*, !dbg !145
  %78 = getelementptr inbounds { double, double }, { double, double }* %77, i32 0, i32 0, !dbg !145
  %79 = load double, double* %78, align 8, !dbg !145
  %80 = getelementptr inbounds { double, double }, { double, double }* %77, i32 0, i32 1, !dbg !145
  %81 = load double, double* %80, align 8, !dbg !145
  call void @put(double %79, double %81), !dbg !145
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0)), !dbg !146
  %82 = bitcast %struct.Complex* %a to { double, double }*, !dbg !147
  %83 = getelementptr inbounds { double, double }, { double, double }* %82, i32 0, i32 0, !dbg !147
  %84 = load double, double* %83, align 8, !dbg !147
  %85 = getelementptr inbounds { double, double }, { double, double }* %82, i32 0, i32 1, !dbg !147
  %86 = load double, double* %85, align 8, !dbg !147
  %call15 = call { double, double } @conj(double %84, double %86), !dbg !147
  %87 = bitcast %struct.Complex* %agg.tmp14 to { double, double }*, !dbg !147
  %88 = getelementptr inbounds { double, double }, { double, double }* %87, i32 0, i32 0, !dbg !147
  %89 = extractvalue { double, double } %call15, 0, !dbg !147
  store double %89, double* %88, align 8, !dbg !147
  %90 = getelementptr inbounds { double, double }, { double, double }* %87, i32 0, i32 1, !dbg !147
  %91 = extractvalue { double, double } %call15, 1, !dbg !147
  store double %91, double* %90, align 8, !dbg !147
  %92 = bitcast %struct.Complex* %agg.tmp14 to { double, double }*, !dbg !148
  %93 = getelementptr inbounds { double, double }, { double, double }* %92, i32 0, i32 0, !dbg !148
  %94 = load double, double* %93, align 8, !dbg !148
  %95 = getelementptr inbounds { double, double }, { double, double }* %92, i32 0, i32 1, !dbg !148
  %96 = load double, double* %95, align 8, !dbg !148
  call void @put(double %94, double %96), !dbg !148
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-complex-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-Complex")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "add", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "Complex", file: !1, line: 4, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 1, size: 128, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "real", scope: !11, file: !1, line: 2, baseType: !14, size: 64)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "imag", scope: !11, file: !1, line: 3, baseType: !14, size: 64, offset: 64)
!16 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!17 = !DILocation(line: 6, column: 21, scope: !7)
!18 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 32, scope: !7)
!20 = !DILocalVariable(name: "ans", scope: !7, file: !1, line: 7, type: !10)
!21 = !DILocation(line: 7, column: 17, scope: !7)
!22 = !DILocation(line: 8, column: 22, scope: !7)
!23 = !DILocation(line: 8, column: 31, scope: !7)
!24 = !DILocation(line: 8, column: 27, scope: !7)
!25 = !DILocation(line: 8, column: 13, scope: !7)
!26 = !DILocation(line: 8, column: 18, scope: !7)
!27 = !DILocation(line: 9, column: 22, scope: !7)
!28 = !DILocation(line: 9, column: 31, scope: !7)
!29 = !DILocation(line: 9, column: 27, scope: !7)
!30 = !DILocation(line: 9, column: 13, scope: !7)
!31 = !DILocation(line: 9, column: 18, scope: !7)
!32 = !DILocation(line: 10, column: 9, scope: !7)
!33 = distinct !DISubprogram(name: "mult", scope: !1, file: !1, line: 13, type: !8, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "a", arg: 1, scope: !33, file: !1, line: 13, type: !10)
!35 = !DILocation(line: 13, column: 22, scope: !33)
!36 = !DILocalVariable(name: "b", arg: 2, scope: !33, file: !1, line: 13, type: !10)
!37 = !DILocation(line: 13, column: 33, scope: !33)
!38 = !DILocalVariable(name: "ans", scope: !33, file: !1, line: 14, type: !10)
!39 = !DILocation(line: 14, column: 17, scope: !33)
!40 = !DILocation(line: 15, column: 22, scope: !33)
!41 = !DILocation(line: 15, column: 31, scope: !33)
!42 = !DILocation(line: 15, column: 27, scope: !33)
!43 = !DILocation(line: 15, column: 40, scope: !33)
!44 = !DILocation(line: 15, column: 49, scope: !33)
!45 = !DILocation(line: 15, column: 45, scope: !33)
!46 = !DILocation(line: 15, column: 36, scope: !33)
!47 = !DILocation(line: 15, column: 13, scope: !33)
!48 = !DILocation(line: 15, column: 18, scope: !33)
!49 = !DILocation(line: 16, column: 22, scope: !33)
!50 = !DILocation(line: 16, column: 31, scope: !33)
!51 = !DILocation(line: 16, column: 27, scope: !33)
!52 = !DILocation(line: 16, column: 40, scope: !33)
!53 = !DILocation(line: 16, column: 49, scope: !33)
!54 = !DILocation(line: 16, column: 45, scope: !33)
!55 = !DILocation(line: 16, column: 36, scope: !33)
!56 = !DILocation(line: 16, column: 13, scope: !33)
!57 = !DILocation(line: 16, column: 18, scope: !33)
!58 = !DILocation(line: 17, column: 9, scope: !33)
!59 = distinct !DISubprogram(name: "inv", scope: !1, file: !1, line: 22, type: !60, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!10, !10}
!62 = !DILocalVariable(name: "a", arg: 1, scope: !59, file: !1, line: 22, type: !10)
!63 = !DILocation(line: 22, column: 21, scope: !59)
!64 = !DILocalVariable(name: "ans", scope: !59, file: !1, line: 23, type: !10)
!65 = !DILocation(line: 23, column: 17, scope: !59)
!66 = !DILocalVariable(name: "denom", scope: !59, file: !1, line: 24, type: !14)
!67 = !DILocation(line: 24, column: 16, scope: !59)
!68 = !DILocation(line: 24, column: 26, scope: !59)
!69 = !DILocation(line: 24, column: 35, scope: !59)
!70 = !DILocation(line: 24, column: 31, scope: !59)
!71 = !DILocation(line: 24, column: 44, scope: !59)
!72 = !DILocation(line: 24, column: 53, scope: !59)
!73 = !DILocation(line: 24, column: 49, scope: !59)
!74 = !DILocation(line: 24, column: 40, scope: !59)
!75 = !DILocation(line: 25, column: 23, scope: !59)
!76 = !DILocation(line: 25, column: 30, scope: !59)
!77 = !DILocation(line: 25, column: 28, scope: !59)
!78 = !DILocation(line: 25, column: 13, scope: !59)
!79 = !DILocation(line: 25, column: 18, scope: !59)
!80 = !DILocation(line: 26, column: 23, scope: !59)
!81 = !DILocation(line: 26, column: 20, scope: !59)
!82 = !DILocation(line: 26, column: 30, scope: !59)
!83 = !DILocation(line: 26, column: 28, scope: !59)
!84 = !DILocation(line: 26, column: 13, scope: !59)
!85 = !DILocation(line: 26, column: 18, scope: !59)
!86 = !DILocation(line: 27, column: 9, scope: !59)
!87 = distinct !DISubprogram(name: "neg", scope: !1, file: !1, line: 30, type: !60, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "a", arg: 1, scope: !87, file: !1, line: 30, type: !10)
!89 = !DILocation(line: 30, column: 21, scope: !87)
!90 = !DILocalVariable(name: "ans", scope: !87, file: !1, line: 31, type: !10)
!91 = !DILocation(line: 31, column: 17, scope: !87)
!92 = !DILocation(line: 32, column: 23, scope: !87)
!93 = !DILocation(line: 32, column: 20, scope: !87)
!94 = !DILocation(line: 32, column: 13, scope: !87)
!95 = !DILocation(line: 32, column: 18, scope: !87)
!96 = !DILocation(line: 33, column: 23, scope: !87)
!97 = !DILocation(line: 33, column: 20, scope: !87)
!98 = !DILocation(line: 33, column: 13, scope: !87)
!99 = !DILocation(line: 33, column: 18, scope: !87)
!100 = !DILocation(line: 34, column: 9, scope: !87)
!101 = distinct !DISubprogram(name: "conj", scope: !1, file: !1, line: 37, type: !60, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "a", arg: 1, scope: !101, file: !1, line: 37, type: !10)
!103 = !DILocation(line: 37, column: 22, scope: !101)
!104 = !DILocalVariable(name: "ans", scope: !101, file: !1, line: 38, type: !10)
!105 = !DILocation(line: 38, column: 17, scope: !101)
!106 = !DILocation(line: 39, column: 23, scope: !101)
!107 = !DILocation(line: 39, column: 13, scope: !101)
!108 = !DILocation(line: 39, column: 18, scope: !101)
!109 = !DILocation(line: 40, column: 23, scope: !101)
!110 = !DILocation(line: 40, column: 20, scope: !101)
!111 = !DILocation(line: 40, column: 13, scope: !101)
!112 = !DILocation(line: 40, column: 18, scope: !101)
!113 = !DILocation(line: 41, column: 9, scope: !101)
!114 = distinct !DISubprogram(name: "put", scope: !1, file: !1, line: 44, type: !115, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !10}
!117 = !DILocalVariable(name: "c", arg: 1, scope: !114, file: !1, line: 44, type: !10)
!118 = !DILocation(line: 44, column: 18, scope: !114)
!119 = !DILocation(line: 46, column: 30, scope: !114)
!120 = !DILocation(line: 46, column: 38, scope: !114)
!121 = !DILocation(line: 46, column: 9, scope: !114)
!122 = !DILocation(line: 47, column: 1, scope: !114)
!123 = distinct !DISubprogram(name: "complex_ops", scope: !1, file: !1, line: 49, type: !124, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{null}
!126 = !DILocalVariable(name: "a", scope: !123, file: !1, line: 51, type: !10)
!127 = !DILocation(line: 51, column: 11, scope: !123)
!128 = !DILocalVariable(name: "b", scope: !123, file: !1, line: 52, type: !10)
!129 = !DILocation(line: 52, column: 11, scope: !123)
!130 = !DILocation(line: 54, column: 3, scope: !123)
!131 = !DILocation(line: 54, column: 21, scope: !123)
!132 = !DILocation(line: 55, column: 3, scope: !123)
!133 = !DILocation(line: 55, column: 21, scope: !123)
!134 = !DILocation(line: 56, column: 3, scope: !123)
!135 = !DILocation(line: 56, column: 25, scope: !123)
!136 = !DILocation(line: 56, column: 21, scope: !123)
!137 = !DILocation(line: 57, column: 3, scope: !123)
!138 = !DILocation(line: 57, column: 25, scope: !123)
!139 = !DILocation(line: 57, column: 21, scope: !123)
!140 = !DILocation(line: 58, column: 3, scope: !123)
!141 = !DILocation(line: 58, column: 25, scope: !123)
!142 = !DILocation(line: 58, column: 21, scope: !123)
!143 = !DILocation(line: 59, column: 3, scope: !123)
!144 = !DILocation(line: 59, column: 25, scope: !123)
!145 = !DILocation(line: 59, column: 21, scope: !123)
!146 = !DILocation(line: 60, column: 3, scope: !123)
!147 = !DILocation(line: 60, column: 29, scope: !123)
!148 = !DILocation(line: 60, column: 25, scope: !123)
!149 = !DILocation(line: 60, column: 40, scope: !123)
!150 = !DILocation(line: 61, column: 1, scope: !123)
