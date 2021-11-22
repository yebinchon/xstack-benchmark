; ModuleID = 'dragon-curve.c'
source_filename = "dragon-curve.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rgb = type { double, double, double }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@dx = common dso_local global i64 0, align 8, !dbg !0
@dy = common dso_local global i64 0, align 8, !dbg !15
@scale = common dso_local global i64 0, align 8, !dbg !17
@x = common dso_local global i64 0, align 8, !dbg !10
@y = common dso_local global i64 0, align 8, !dbg !13
@pix = common dso_local global %struct.rgb** null, align 8, !dbg !21
@clen = common dso_local global i64 0, align 8, !dbg !19
@.str = private unnamed_addr constant [6 x i8] c"X+YF+\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"-FX-Y\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"FX\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"P6\0A%ld %ld\0A255\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [20 x i8] c"size: %d depth: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sc_up() #0 !dbg !35 {
entry:
  %tmp = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %tmp, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i64, i64* @dx, align 8, !dbg !40
  %1 = load i64, i64* @dy, align 8, !dbg !41
  %sub = sub nsw i64 %0, %1, !dbg !42
  store i64 %sub, i64* %tmp, align 8, !dbg !39
  %2 = load i64, i64* @dx, align 8, !dbg !43
  %3 = load i64, i64* @dy, align 8, !dbg !44
  %add = add nsw i64 %2, %3, !dbg !45
  store i64 %add, i64* @dy, align 8, !dbg !46
  %4 = load i64, i64* %tmp, align 8, !dbg !47
  store i64 %4, i64* @dx, align 8, !dbg !48
  %5 = load i64, i64* @scale, align 8, !dbg !49
  %mul = mul nsw i64 %5, 2, !dbg !49
  store i64 %mul, i64* @scale, align 8, !dbg !49
  %6 = load i64, i64* @x, align 8, !dbg !50
  %mul1 = mul nsw i64 %6, 2, !dbg !50
  store i64 %mul1, i64* @x, align 8, !dbg !50
  %7 = load i64, i64* @y, align 8, !dbg !51
  %mul2 = mul nsw i64 %7, 2, !dbg !51
  store i64 %mul2, i64* @y, align 8, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @h_rgb(i64 %x, i64 %y) #0 !dbg !53 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %p = alloca %struct.rgb*, align 8
  %h = alloca double, align 8
  %VAL = alloca double, align 8
  %c = alloca double, align 8
  %X = alloca double, align 8
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i64 %y, i64* %y.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %y.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.rgb** %p, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load %struct.rgb**, %struct.rgb*** @pix, align 8, !dbg !62
  %1 = load i64, i64* %y.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds %struct.rgb*, %struct.rgb** %0, i64 %1, !dbg !62
  %2 = load %struct.rgb*, %struct.rgb** %arrayidx, align 8, !dbg !62
  %3 = load i64, i64* %x.addr, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds %struct.rgb, %struct.rgb* %2, i64 %3, !dbg !62
  store %struct.rgb* %arrayidx1, %struct.rgb** %p, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata double* %h, metadata !65, metadata !DIExpression()), !dbg !66
  %4 = load i64, i64* @clen, align 8, !dbg !67
  %conv = sitofp i64 %4 to double, !dbg !67
  %mul = fmul double 6.000000e+00, %conv, !dbg !68
  %5 = load i64, i64* @scale, align 8, !dbg !69
  %conv2 = sitofp i64 %5 to double, !dbg !69
  %div = fdiv double %mul, %conv2, !dbg !70
  store double %div, double* %h, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata double* %VAL, metadata !71, metadata !DIExpression()), !dbg !72
  %6 = load i64, i64* @clen, align 8, !dbg !73
  %conv3 = sitofp i64 %6 to double, !dbg !73
  %mul4 = fmul double 0x406921FB5443CE28, %conv3, !dbg !74
  %7 = load i64, i64* @scale, align 8, !dbg !75
  %conv5 = sitofp i64 %7 to double, !dbg !75
  %div6 = fdiv double %mul4, %conv5, !dbg !76
  %call = call double @cos(double %div6) #6, !dbg !77
  %sub = fsub double %call, 1.000000e+00, !dbg !78
  %div7 = fdiv double %sub, 4.000000e+00, !dbg !79
  %sub8 = fsub double 1.000000e+00, %div7, !dbg !80
  store double %sub8, double* %VAL, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata double* %c, metadata !81, metadata !DIExpression()), !dbg !82
  %8 = load double, double* %VAL, align 8, !dbg !83
  %mul9 = fmul double 1.000000e+00, %8, !dbg !84
  store double %mul9, double* %c, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata double* %X, metadata !85, metadata !DIExpression()), !dbg !86
  %9 = load double, double* %c, align 8, !dbg !87
  %10 = load double, double* %h, align 8, !dbg !88
  %call10 = call double @fmod(double %10, double 2.000000e+00) #6, !dbg !89
  %sub11 = fsub double %call10, 1.000000e+00, !dbg !90
  %11 = call double @llvm.fabs.f64(double %sub11), !dbg !91
  %sub12 = fsub double 1.000000e+00, %11, !dbg !92
  %mul13 = fmul double %9, %sub12, !dbg !93
  store double %mul13, double* %X, align 8, !dbg !86
  %12 = load double, double* %h, align 8, !dbg !94
  %conv14 = fptosi double %12 to i32, !dbg !95
  switch i32 %conv14, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb16
    i32 2, label %sw.bb21
    i32 3, label %sw.bb25
    i32 4, label %sw.bb30
  ], !dbg !96

sw.bb:                                            ; preds = %entry
  %13 = load double, double* %c, align 8, !dbg !97
  %14 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !99
  %r = getelementptr inbounds %struct.rgb, %struct.rgb* %14, i32 0, i32 0, !dbg !100
  %15 = load double, double* %r, align 8, !dbg !101
  %add = fadd double %15, %13, !dbg !101
  store double %add, double* %r, align 8, !dbg !101
  %16 = load double, double* %X, align 8, !dbg !102
  %17 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !103
  %g = getelementptr inbounds %struct.rgb, %struct.rgb* %17, i32 0, i32 1, !dbg !104
  %18 = load double, double* %g, align 8, !dbg !105
  %add15 = fadd double %18, %16, !dbg !105
  store double %add15, double* %g, align 8, !dbg !105
  br label %sw.epilog, !dbg !106

sw.bb16:                                          ; preds = %entry
  %19 = load double, double* %X, align 8, !dbg !107
  %20 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !108
  %r17 = getelementptr inbounds %struct.rgb, %struct.rgb* %20, i32 0, i32 0, !dbg !109
  %21 = load double, double* %r17, align 8, !dbg !110
  %add18 = fadd double %21, %19, !dbg !110
  store double %add18, double* %r17, align 8, !dbg !110
  %22 = load double, double* %c, align 8, !dbg !111
  %23 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !112
  %g19 = getelementptr inbounds %struct.rgb, %struct.rgb* %23, i32 0, i32 1, !dbg !113
  %24 = load double, double* %g19, align 8, !dbg !114
  %add20 = fadd double %24, %22, !dbg !114
  store double %add20, double* %g19, align 8, !dbg !114
  br label %sw.epilog, !dbg !115

sw.bb21:                                          ; preds = %entry
  %25 = load double, double* %c, align 8, !dbg !116
  %26 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !117
  %g22 = getelementptr inbounds %struct.rgb, %struct.rgb* %26, i32 0, i32 1, !dbg !118
  %27 = load double, double* %g22, align 8, !dbg !119
  %add23 = fadd double %27, %25, !dbg !119
  store double %add23, double* %g22, align 8, !dbg !119
  %28 = load double, double* %X, align 8, !dbg !120
  %29 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !121
  %b = getelementptr inbounds %struct.rgb, %struct.rgb* %29, i32 0, i32 2, !dbg !122
  %30 = load double, double* %b, align 8, !dbg !123
  %add24 = fadd double %30, %28, !dbg !123
  store double %add24, double* %b, align 8, !dbg !123
  br label %sw.epilog, !dbg !124

sw.bb25:                                          ; preds = %entry
  %31 = load double, double* %X, align 8, !dbg !125
  %32 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !126
  %g26 = getelementptr inbounds %struct.rgb, %struct.rgb* %32, i32 0, i32 1, !dbg !127
  %33 = load double, double* %g26, align 8, !dbg !128
  %add27 = fadd double %33, %31, !dbg !128
  store double %add27, double* %g26, align 8, !dbg !128
  %34 = load double, double* %c, align 8, !dbg !129
  %35 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !130
  %b28 = getelementptr inbounds %struct.rgb, %struct.rgb* %35, i32 0, i32 2, !dbg !131
  %36 = load double, double* %b28, align 8, !dbg !132
  %add29 = fadd double %36, %34, !dbg !132
  store double %add29, double* %b28, align 8, !dbg !132
  br label %sw.epilog, !dbg !133

sw.bb30:                                          ; preds = %entry
  %37 = load double, double* %X, align 8, !dbg !134
  %38 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !135
  %r31 = getelementptr inbounds %struct.rgb, %struct.rgb* %38, i32 0, i32 0, !dbg !136
  %39 = load double, double* %r31, align 8, !dbg !137
  %add32 = fadd double %39, %37, !dbg !137
  store double %add32, double* %r31, align 8, !dbg !137
  %40 = load double, double* %c, align 8, !dbg !138
  %41 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !139
  %b33 = getelementptr inbounds %struct.rgb, %struct.rgb* %41, i32 0, i32 2, !dbg !140
  %42 = load double, double* %b33, align 8, !dbg !141
  %add34 = fadd double %42, %40, !dbg !141
  store double %add34, double* %b33, align 8, !dbg !141
  br label %sw.epilog, !dbg !142

sw.default:                                       ; preds = %entry
  %43 = load double, double* %c, align 8, !dbg !143
  %44 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !144
  %r35 = getelementptr inbounds %struct.rgb, %struct.rgb* %44, i32 0, i32 0, !dbg !145
  %45 = load double, double* %r35, align 8, !dbg !146
  %add36 = fadd double %45, %43, !dbg !146
  store double %add36, double* %r35, align 8, !dbg !146
  %46 = load double, double* %X, align 8, !dbg !147
  %47 = load %struct.rgb*, %struct.rgb** %p, align 8, !dbg !148
  %b37 = getelementptr inbounds %struct.rgb, %struct.rgb* %47, i32 0, i32 2, !dbg !149
  %48 = load double, double* %b37, align 8, !dbg !150
  %add38 = fadd double %48, %46, !dbg !150
  store double %add38, double* %b37, align 8, !dbg !150
  br label %sw.epilog, !dbg !151

sw.epilog:                                        ; preds = %sw.bb, %sw.bb16, %sw.bb21, %sw.bb25, %sw.bb30, %sw.default
  ret void, !dbg !152
}

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @fmod(double, double) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @iter_string(i8* %str, i32 %d) #0 !dbg !153 {
entry:
  %str.addr = alloca i8*, align 8
  %d.addr = alloca i32, align 4
  %tmp = alloca i64, align 8
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %tmp, metadata !163, metadata !DIExpression()), !dbg !165
  br label %while.cond, !dbg !166

while.cond:                                       ; preds = %sw.epilog, %sw.bb12, %sw.bb10, %sw.bb8, %if.end7, %if.end, %entry
  %0 = load i8*, i8** %str.addr, align 8, !dbg !167
  %1 = load i8, i8* %0, align 1, !dbg !168
  %conv = sext i8 %1 to i32, !dbg !168
  %cmp = icmp ne i32 %conv, 0, !dbg !169
  br i1 %cmp, label %while.body, label %while.end, !dbg !166

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %str.addr, align 8, !dbg !170
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1, !dbg !170
  store i8* %incdec.ptr, i8** %str.addr, align 8, !dbg !170
  %3 = load i8, i8* %2, align 1, !dbg !172
  %conv2 = sext i8 %3 to i32, !dbg !172
  switch i32 %conv2, label %sw.epilog [
    i32 88, label %sw.bb
    i32 89, label %sw.bb3
    i32 43, label %sw.bb8
    i32 45, label %sw.bb10
    i32 70, label %sw.bb12
  ], !dbg !173

sw.bb:                                            ; preds = %while.body
  %4 = load i32, i32* %d.addr, align 4, !dbg !174
  %tobool = icmp ne i32 %4, 0, !dbg !174
  br i1 %tobool, label %if.then, label %if.end, !dbg !177, !cf.info !178

if.then:                                          ; preds = %sw.bb
  %5 = load i32, i32* %d.addr, align 4, !dbg !179
  %sub = sub nsw i32 %5, 1, !dbg !180
  call void @iter_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 %sub), !dbg !181
  br label %if.end, !dbg !181

if.end:                                           ; preds = %if.then, %sw.bb
  br label %while.cond, !dbg !182, !llvm.loop !183

sw.bb3:                                           ; preds = %while.body
  %6 = load i32, i32* %d.addr, align 4, !dbg !185
  %tobool4 = icmp ne i32 %6, 0, !dbg !185
  br i1 %tobool4, label %if.then5, label %if.end7, !dbg !187, !cf.info !178

if.then5:                                         ; preds = %sw.bb3
  %7 = load i32, i32* %d.addr, align 4, !dbg !188
  %sub6 = sub nsw i32 %7, 1, !dbg !189
  call void @iter_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %sub6), !dbg !190
  br label %if.end7, !dbg !190

if.end7:                                          ; preds = %if.then5, %sw.bb3
  br label %while.cond, !dbg !191, !llvm.loop !183

sw.bb8:                                           ; preds = %while.body
  %8 = load i64, i64* @dy, align 8, !dbg !192
  store i64 %8, i64* %tmp, align 8, !dbg !192
  %9 = load i64, i64* @dx, align 8, !dbg !192
  %sub9 = sub nsw i64 0, %9, !dbg !192
  store i64 %sub9, i64* @dy, align 8, !dbg !192
  %10 = load i64, i64* %tmp, align 8, !dbg !192
  store i64 %10, i64* @dx, align 8, !dbg !192
  br label %while.cond, !dbg !193, !llvm.loop !183

sw.bb10:                                          ; preds = %while.body
  %11 = load i64, i64* @dy, align 8, !dbg !194
  %sub11 = sub nsw i64 0, %11, !dbg !194
  store i64 %sub11, i64* %tmp, align 8, !dbg !194
  %12 = load i64, i64* @dx, align 8, !dbg !194
  store i64 %12, i64* @dy, align 8, !dbg !194
  %13 = load i64, i64* %tmp, align 8, !dbg !194
  store i64 %13, i64* @dx, align 8, !dbg !194
  br label %while.cond, !dbg !195, !llvm.loop !183

sw.bb12:                                          ; preds = %while.body
  %14 = load i64, i64* @clen, align 8, !dbg !196
  %inc = add nsw i64 %14, 1, !dbg !196
  store i64 %inc, i64* @clen, align 8, !dbg !196
  %15 = load i64, i64* @x, align 8, !dbg !197
  %16 = load i64, i64* @scale, align 8, !dbg !198
  %div = sdiv i64 %15, %16, !dbg !199
  %17 = load i64, i64* @y, align 8, !dbg !200
  %18 = load i64, i64* @scale, align 8, !dbg !201
  %div13 = sdiv i64 %17, %18, !dbg !202
  call void @h_rgb(i64 %div, i64 %div13), !dbg !203
  %19 = load i64, i64* @dx, align 8, !dbg !204
  %20 = load i64, i64* @x, align 8, !dbg !205
  %add = add nsw i64 %20, %19, !dbg !205
  store i64 %add, i64* @x, align 8, !dbg !205
  %21 = load i64, i64* @dy, align 8, !dbg !206
  %22 = load i64, i64* @y, align 8, !dbg !207
  %add14 = add nsw i64 %22, %21, !dbg !207
  store i64 %add14, i64* @y, align 8, !dbg !207
  br label %while.cond, !dbg !208, !llvm.loop !183

sw.epilog:                                        ; preds = %while.body
  br label %while.cond, !dbg !166, !llvm.loop !183

while.end:                                        ; preds = %while.cond
  ret void, !dbg !209
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dragon(i64 %leng, i32 %depth) #0 !dbg !210 {
entry:
  %leng.addr = alloca i64, align 8
  %depth.addr = alloca i32, align 4
  %i = alloca i64, align 8
  %d = alloca i64, align 8
  %h = alloca i64, align 8
  %w = alloca i64, align 8
  %buf = alloca %struct.rgb*, align 8
  %fpix = alloca i8*, align 8
  %maxv = alloca double, align 8
  %dbuf = alloca double*, align 8
  store i64 %leng, i64* %leng.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %leng.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store i32 %depth, i32* %depth.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %depth.addr, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i64* %i, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i64* %d, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = load i64, i64* %leng.addr, align 8, !dbg !221
  %div = sdiv i64 %0, 3, !dbg !222
  %add = add nsw i64 %div, 1, !dbg !223
  store i64 %add, i64* %d, align 8, !dbg !220
  call void @llvm.dbg.declare(metadata i64* %h, metadata !224, metadata !DIExpression()), !dbg !225
  %1 = load i64, i64* %leng.addr, align 8, !dbg !226
  %add1 = add nsw i64 %1, 3, !dbg !227
  store i64 %add1, i64* %h, align 8, !dbg !225
  call void @llvm.dbg.declare(metadata i64* %w, metadata !228, metadata !DIExpression()), !dbg !229
  %2 = load i64, i64* %leng.addr, align 8, !dbg !230
  %3 = load i64, i64* %d, align 8, !dbg !231
  %mul = mul nsw i64 %3, 3, !dbg !232
  %div2 = sdiv i64 %mul, 2, !dbg !233
  %add3 = add nsw i64 %2, %div2, !dbg !234
  %add4 = add nsw i64 %add3, 2, !dbg !235
  store i64 %add4, i64* %w, align 8, !dbg !229
  call void @llvm.dbg.declare(metadata %struct.rgb** %buf, metadata !236, metadata !DIExpression()), !dbg !237
  %4 = load i64, i64* %w, align 8, !dbg !238
  %mul5 = mul i64 24, %4, !dbg !239
  %5 = load i64, i64* %h, align 8, !dbg !240
  %mul6 = mul i64 %mul5, %5, !dbg !241
  %call = call noalias i8* @malloc(i64 %mul6) #6, !dbg !242
  %6 = bitcast i8* %call to %struct.rgb*, !dbg !242
  store %struct.rgb* %6, %struct.rgb** %buf, align 8, !dbg !237
  %7 = load i64, i64* %h, align 8, !dbg !243
  %mul7 = mul i64 8, %7, !dbg !244
  %call8 = call noalias i8* @malloc(i64 %mul7) #6, !dbg !245
  %8 = bitcast i8* %call8 to %struct.rgb**, !dbg !245
  store %struct.rgb** %8, %struct.rgb*** @pix, align 8, !dbg !246
  store i64 0, i64* %i, align 8, !dbg !247
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !250
  %10 = load i64, i64* %h, align 8, !dbg !252
  %cmp = icmp slt i64 %9, %10, !dbg !253
  br i1 %cmp, label %for.body, label %for.end, !dbg !254

for.body:                                         ; preds = %for.cond
  %11 = load %struct.rgb*, %struct.rgb** %buf, align 8, !dbg !255
  %12 = load i64, i64* %w, align 8, !dbg !256
  %13 = load i64, i64* %i, align 8, !dbg !257
  %mul9 = mul nsw i64 %12, %13, !dbg !258
  %add.ptr = getelementptr inbounds %struct.rgb, %struct.rgb* %11, i64 %mul9, !dbg !259
  %14 = load %struct.rgb**, %struct.rgb*** @pix, align 8, !dbg !260
  %15 = load i64, i64* %i, align 8, !dbg !261
  %arrayidx = getelementptr inbounds %struct.rgb*, %struct.rgb** %14, i64 %15, !dbg !260
  store %struct.rgb* %add.ptr, %struct.rgb** %arrayidx, align 8, !dbg !262
  br label %for.inc, !dbg !260

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !263
  %inc = add nsw i64 %16, 1, !dbg !263
  store i64 %inc, i64* %i, align 8, !dbg !263
  br label %for.cond, !dbg !264, !llvm.loop !265

for.end:                                          ; preds = %for.cond
  %17 = load %struct.rgb*, %struct.rgb** %buf, align 8, !dbg !267
  %18 = bitcast %struct.rgb* %17 to i8*, !dbg !268
  %19 = load i64, i64* %w, align 8, !dbg !269
  %mul10 = mul i64 24, %19, !dbg !270
  %20 = load i64, i64* %h, align 8, !dbg !271
  %mul11 = mul i64 %mul10, %20, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 8 %18, i8 0, i64 %mul11, i1 false), !dbg !268
  %21 = load i64, i64* %d, align 8, !dbg !273
  store i64 %21, i64* @y, align 8, !dbg !274
  store i64 %21, i64* @x, align 8, !dbg !275
  %22 = load i64, i64* %leng.addr, align 8, !dbg !276
  store i64 %22, i64* @dx, align 8, !dbg !277
  store i64 0, i64* @dy, align 8, !dbg !278
  store i64 1, i64* @scale, align 8, !dbg !279
  store i64 0, i64* @clen, align 8, !dbg !280
  store i64 0, i64* %i, align 8, !dbg !281
  br label %for.cond12, !dbg !283

for.cond12:                                       ; preds = %for.inc16, %for.end
  %23 = load i64, i64* %i, align 8, !dbg !284
  %24 = load i32, i32* %depth.addr, align 4, !dbg !286
  %conv = sext i32 %24 to i64, !dbg !286
  %cmp13 = icmp slt i64 %23, %conv, !dbg !287
  br i1 %cmp13, label %for.body15, label %for.end18, !dbg !288

for.body15:                                       ; preds = %for.cond12
  call void @sc_up(), !dbg !289
  br label %for.inc16, !dbg !289

for.inc16:                                        ; preds = %for.body15
  %25 = load i64, i64* %i, align 8, !dbg !290
  %inc17 = add nsw i64 %25, 1, !dbg !290
  store i64 %inc17, i64* %i, align 8, !dbg !290
  br label %for.cond12, !dbg !291, !llvm.loop !292

for.end18:                                        ; preds = %for.cond12
  %26 = load i32, i32* %depth.addr, align 4, !dbg !294
  call void @iter_string(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 %26), !dbg !295
  call void @llvm.dbg.declare(metadata i8** %fpix, metadata !296, metadata !DIExpression()), !dbg !299
  %27 = load i64, i64* %w, align 8, !dbg !300
  %28 = load i64, i64* %h, align 8, !dbg !301
  %mul19 = mul nsw i64 %27, %28, !dbg !302
  %mul20 = mul nsw i64 %mul19, 3, !dbg !303
  %call21 = call noalias i8* @malloc(i64 %mul20) #6, !dbg !304
  store i8* %call21, i8** %fpix, align 8, !dbg !299
  call void @llvm.dbg.declare(metadata double* %maxv, metadata !305, metadata !DIExpression()), !dbg !306
  store double 0.000000e+00, double* %maxv, align 8, !dbg !306
  call void @llvm.dbg.declare(metadata double** %dbuf, metadata !307, metadata !DIExpression()), !dbg !308
  %29 = load %struct.rgb*, %struct.rgb** %buf, align 8, !dbg !309
  %30 = bitcast %struct.rgb* %29 to double*, !dbg !310
  store double* %30, double** %dbuf, align 8, !dbg !308
  %31 = load i64, i64* %w, align 8, !dbg !311
  %mul22 = mul nsw i64 3, %31, !dbg !313
  %32 = load i64, i64* %h, align 8, !dbg !314
  %mul23 = mul nsw i64 %mul22, %32, !dbg !315
  %sub = sub nsw i64 %mul23, 1, !dbg !316
  store i64 %sub, i64* %i, align 8, !dbg !317
  br label %for.cond24, !dbg !318

for.cond24:                                       ; preds = %for.inc32, %for.end18
  %33 = load i64, i64* %i, align 8, !dbg !319
  %cmp25 = icmp sge i64 %33, 0, !dbg !321
  br i1 %cmp25, label %for.body27, label %for.end33, !dbg !322

for.body27:                                       ; preds = %for.cond24
  %34 = load double*, double** %dbuf, align 8, !dbg !323
  %35 = load i64, i64* %i, align 8, !dbg !325
  %arrayidx28 = getelementptr inbounds double, double* %34, i64 %35, !dbg !323
  %36 = load double, double* %arrayidx28, align 8, !dbg !323
  %37 = load double, double* %maxv, align 8, !dbg !326
  %cmp29 = fcmp ogt double %36, %37, !dbg !327
  br i1 %cmp29, label %if.then, label %if.end, !dbg !328, !cf.info !178

if.then:                                          ; preds = %for.body27
  %38 = load double*, double** %dbuf, align 8, !dbg !329
  %39 = load i64, i64* %i, align 8, !dbg !330
  %arrayidx31 = getelementptr inbounds double, double* %38, i64 %39, !dbg !329
  %40 = load double, double* %arrayidx31, align 8, !dbg !329
  store double %40, double* %maxv, align 8, !dbg !331
  br label %if.end, !dbg !332

if.end:                                           ; preds = %if.then, %for.body27
  br label %for.inc32, !dbg !326

for.inc32:                                        ; preds = %if.end
  %41 = load i64, i64* %i, align 8, !dbg !333
  %dec = add nsw i64 %41, -1, !dbg !333
  store i64 %dec, i64* %i, align 8, !dbg !333
  br label %for.cond24, !dbg !334, !llvm.loop !335

for.end33:                                        ; preds = %for.cond24
  %42 = load i64, i64* %h, align 8, !dbg !337
  %mul34 = mul nsw i64 3, %42, !dbg !339
  %43 = load i64, i64* %w, align 8, !dbg !340
  %mul35 = mul nsw i64 %mul34, %43, !dbg !341
  %sub36 = sub nsw i64 %mul35, 1, !dbg !342
  store i64 %sub36, i64* %i, align 8, !dbg !343
  br label %for.cond37, !dbg !344

for.cond37:                                       ; preds = %for.inc46, %for.end33
  %44 = load i64, i64* %i, align 8, !dbg !345
  %cmp38 = icmp sge i64 %44, 0, !dbg !347
  br i1 %cmp38, label %for.body40, label %for.end48, !dbg !348

for.body40:                                       ; preds = %for.cond37
  %45 = load double*, double** %dbuf, align 8, !dbg !349
  %46 = load i64, i64* %i, align 8, !dbg !350
  %arrayidx41 = getelementptr inbounds double, double* %45, i64 %46, !dbg !349
  %47 = load double, double* %arrayidx41, align 8, !dbg !349
  %mul42 = fmul double 2.550000e+02, %47, !dbg !351
  %48 = load double, double* %maxv, align 8, !dbg !352
  %div43 = fdiv double %mul42, %48, !dbg !353
  %conv44 = fptoui double %div43 to i8, !dbg !354
  %49 = load i8*, i8** %fpix, align 8, !dbg !355
  %50 = load i64, i64* %i, align 8, !dbg !356
  %arrayidx45 = getelementptr inbounds i8, i8* %49, i64 %50, !dbg !355
  store i8 %conv44, i8* %arrayidx45, align 1, !dbg !357
  br label %for.inc46, !dbg !355

for.inc46:                                        ; preds = %for.body40
  %51 = load i64, i64* %i, align 8, !dbg !358
  %dec47 = add nsw i64 %51, -1, !dbg !358
  store i64 %dec47, i64* %i, align 8, !dbg !358
  br label %for.cond37, !dbg !359, !llvm.loop !360

for.end48:                                        ; preds = %for.cond37
  %52 = load i64, i64* %w, align 8, !dbg !362
  %53 = load i64, i64* %h, align 8, !dbg !363
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i64 %52, i64 %53), !dbg !364
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !365
  %call50 = call i32 @fflush(%struct._IO_FILE* %54), !dbg !366
  %55 = load i8*, i8** %fpix, align 8, !dbg !367
  %56 = load i64, i64* %h, align 8, !dbg !368
  %57 = load i64, i64* %w, align 8, !dbg !369
  %mul51 = mul nsw i64 %56, %57, !dbg !370
  %mul52 = mul nsw i64 %mul51, 3, !dbg !371
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !372
  %call53 = call i64 @fwrite(i8* %55, i64 %mul52, i64 1, %struct._IO_FILE* %58), !dbg !373
  ret void, !dbg !374
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !375 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %size = alloca i32, align 4
  %depth = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !380, metadata !DIExpression()), !dbg !381
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !382, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata i32* %size, metadata !384, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.declare(metadata i32* %depth, metadata !386, metadata !DIExpression()), !dbg !387
  %0 = load i32, i32* %c.addr, align 4, !dbg !388
  %cmp = icmp sgt i32 %0, 1, !dbg !389
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !390

cond.true:                                        ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !391
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !391
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !391
  %call = call i32 @atoi(i8* %2) #7, !dbg !392
  br label %cond.end, !dbg !390

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !390

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 10, %cond.false ], !dbg !390
  store i32 %cond, i32* %depth, align 4, !dbg !393
  %3 = load i32, i32* %depth, align 4, !dbg !394
  %shl = shl i32 1, %3, !dbg !395
  store i32 %shl, i32* %size, align 4, !dbg !396
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !397
  %5 = load i32, i32* %size, align 4, !dbg !398
  %6 = load i32, i32* %depth, align 4, !dbg !399
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i32 %5, i32 %6), !dbg !400
  %7 = load i32, i32* %size, align 4, !dbg !401
  %conv = sext i32 %7 to i64, !dbg !401
  %8 = load i32, i32* %depth, align 4, !dbg !402
  %mul = mul nsw i32 %8, 2, !dbg !403
  call void @dragon(i64 %conv, i32 %mul), !dbg !404
  ret i32 0, !dbg !405
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dx", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dragon-curve.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dragon-curve")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!9 = !{!10, !13, !0, !15, !17, !19, !21}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!12 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "y", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "dy", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "scale", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "clen", scope: !2, file: !3, line: 12, type: !12, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "pix", scope: !2, file: !3, line: 14, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "rgb", file: !3, line: 13, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 13, size: 192, elements: !27)
!27 = !{!28, !29, !30}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !26, file: !3, line: 13, baseType: !8, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "g", scope: !26, file: !3, line: 13, baseType: !8, size: 64, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !26, file: !3, line: 13, baseType: !8, size: 64, offset: 128)
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!35 = distinct !DISubprogram(name: "sc_up", scope: !3, file: !3, line: 19, type: !36, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "tmp", scope: !35, file: !3, line: 21, type: !12)
!39 = !DILocation(line: 21, column: 12, scope: !35)
!40 = !DILocation(line: 21, column: 18, scope: !35)
!41 = !DILocation(line: 21, column: 23, scope: !35)
!42 = !DILocation(line: 21, column: 21, scope: !35)
!43 = !DILocation(line: 21, column: 32, scope: !35)
!44 = !DILocation(line: 21, column: 37, scope: !35)
!45 = !DILocation(line: 21, column: 35, scope: !35)
!46 = !DILocation(line: 21, column: 30, scope: !35)
!47 = !DILocation(line: 21, column: 46, scope: !35)
!48 = !DILocation(line: 21, column: 44, scope: !35)
!49 = !DILocation(line: 22, column: 8, scope: !35)
!50 = !DILocation(line: 22, column: 16, scope: !35)
!51 = !DILocation(line: 22, column: 24, scope: !35)
!52 = !DILocation(line: 23, column: 1, scope: !35)
!53 = distinct !DISubprogram(name: "h_rgb", scope: !3, file: !3, line: 30, type: !54, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !12, !12}
!56 = !DILocalVariable(name: "x", arg: 1, scope: !53, file: !3, line: 30, type: !12)
!57 = !DILocation(line: 30, column: 22, scope: !53)
!58 = !DILocalVariable(name: "y", arg: 2, scope: !53, file: !3, line: 30, type: !12)
!59 = !DILocation(line: 30, column: 35, scope: !53)
!60 = !DILocalVariable(name: "p", scope: !53, file: !3, line: 32, type: !24)
!61 = !DILocation(line: 32, column: 7, scope: !53)
!62 = !DILocation(line: 32, column: 12, scope: !53)
!63 = !DILocation(line: 32, column: 16, scope: !53)
!64 = !DILocation(line: 32, column: 19, scope: !53)
!65 = !DILocalVariable(name: "h", scope: !53, file: !3, line: 35, type: !8)
!66 = !DILocation(line: 35, column: 9, scope: !53)
!67 = !DILocation(line: 35, column: 19, scope: !53)
!68 = !DILocation(line: 35, column: 17, scope: !53)
!69 = !DILocation(line: 35, column: 26, scope: !53)
!70 = !DILocation(line: 35, column: 24, scope: !53)
!71 = !DILocalVariable(name: "VAL", scope: !53, file: !3, line: 36, type: !8)
!72 = !DILocation(line: 36, column: 9, scope: !53)
!73 = !DILocation(line: 36, column: 46, scope: !53)
!74 = !DILocation(line: 36, column: 44, scope: !53)
!75 = !DILocation(line: 36, column: 53, scope: !53)
!76 = !DILocation(line: 36, column: 51, scope: !53)
!77 = !DILocation(line: 36, column: 20, scope: !53)
!78 = !DILocation(line: 36, column: 60, scope: !53)
!79 = !DILocation(line: 36, column: 65, scope: !53)
!80 = !DILocation(line: 36, column: 17, scope: !53)
!81 = !DILocalVariable(name: "c", scope: !53, file: !3, line: 37, type: !8)
!82 = !DILocation(line: 37, column: 9, scope: !53)
!83 = !DILocation(line: 37, column: 19, scope: !53)
!84 = !DILocation(line: 37, column: 17, scope: !53)
!85 = !DILocalVariable(name: "X", scope: !53, file: !3, line: 38, type: !8)
!86 = !DILocation(line: 38, column: 9, scope: !53)
!87 = !DILocation(line: 38, column: 13, scope: !53)
!88 = !DILocation(line: 38, column: 32, scope: !53)
!89 = !DILocation(line: 38, column: 27, scope: !53)
!90 = !DILocation(line: 38, column: 38, scope: !53)
!91 = !DILocation(line: 38, column: 22, scope: !53)
!92 = !DILocation(line: 38, column: 20, scope: !53)
!93 = !DILocation(line: 38, column: 15, scope: !53)
!94 = !DILocation(line: 40, column: 14, scope: !53)
!95 = !DILocation(line: 40, column: 9, scope: !53)
!96 = !DILocation(line: 40, column: 2, scope: !53)
!97 = !DILocation(line: 41, column: 18, scope: !98)
!98 = distinct !DILexicalBlock(scope: !53, file: !3, line: 40, column: 17)
!99 = !DILocation(line: 41, column: 10, scope: !98)
!100 = !DILocation(line: 41, column: 13, scope: !98)
!101 = !DILocation(line: 41, column: 15, scope: !98)
!102 = !DILocation(line: 41, column: 29, scope: !98)
!103 = !DILocation(line: 41, column: 21, scope: !98)
!104 = !DILocation(line: 41, column: 24, scope: !98)
!105 = !DILocation(line: 41, column: 26, scope: !98)
!106 = !DILocation(line: 41, column: 32, scope: !98)
!107 = !DILocation(line: 42, column: 18, scope: !98)
!108 = !DILocation(line: 42, column: 10, scope: !98)
!109 = !DILocation(line: 42, column: 13, scope: !98)
!110 = !DILocation(line: 42, column: 15, scope: !98)
!111 = !DILocation(line: 42, column: 29, scope: !98)
!112 = !DILocation(line: 42, column: 21, scope: !98)
!113 = !DILocation(line: 42, column: 24, scope: !98)
!114 = !DILocation(line: 42, column: 26, scope: !98)
!115 = !DILocation(line: 42, column: 32, scope: !98)
!116 = !DILocation(line: 43, column: 18, scope: !98)
!117 = !DILocation(line: 43, column: 10, scope: !98)
!118 = !DILocation(line: 43, column: 13, scope: !98)
!119 = !DILocation(line: 43, column: 15, scope: !98)
!120 = !DILocation(line: 43, column: 29, scope: !98)
!121 = !DILocation(line: 43, column: 21, scope: !98)
!122 = !DILocation(line: 43, column: 24, scope: !98)
!123 = !DILocation(line: 43, column: 26, scope: !98)
!124 = !DILocation(line: 43, column: 32, scope: !98)
!125 = !DILocation(line: 44, column: 18, scope: !98)
!126 = !DILocation(line: 44, column: 10, scope: !98)
!127 = !DILocation(line: 44, column: 13, scope: !98)
!128 = !DILocation(line: 44, column: 15, scope: !98)
!129 = !DILocation(line: 44, column: 29, scope: !98)
!130 = !DILocation(line: 44, column: 21, scope: !98)
!131 = !DILocation(line: 44, column: 24, scope: !98)
!132 = !DILocation(line: 44, column: 26, scope: !98)
!133 = !DILocation(line: 44, column: 32, scope: !98)
!134 = !DILocation(line: 45, column: 18, scope: !98)
!135 = !DILocation(line: 45, column: 10, scope: !98)
!136 = !DILocation(line: 45, column: 13, scope: !98)
!137 = !DILocation(line: 45, column: 15, scope: !98)
!138 = !DILocation(line: 45, column: 29, scope: !98)
!139 = !DILocation(line: 45, column: 21, scope: !98)
!140 = !DILocation(line: 45, column: 24, scope: !98)
!141 = !DILocation(line: 45, column: 26, scope: !98)
!142 = !DILocation(line: 45, column: 32, scope: !98)
!143 = !DILocation(line: 47, column: 11, scope: !98)
!144 = !DILocation(line: 47, column: 3, scope: !98)
!145 = !DILocation(line: 47, column: 6, scope: !98)
!146 = !DILocation(line: 47, column: 8, scope: !98)
!147 = !DILocation(line: 47, column: 22, scope: !98)
!148 = !DILocation(line: 47, column: 14, scope: !98)
!149 = !DILocation(line: 47, column: 17, scope: !98)
!150 = !DILocation(line: 47, column: 19, scope: !98)
!151 = !DILocation(line: 48, column: 2, scope: !98)
!152 = !DILocation(line: 49, column: 1, scope: !53)
!153 = distinct !DISubprogram(name: "iter_string", scope: !3, file: !3, line: 54, type: !154, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!154 = !DISubroutineType(types: !155)
!155 = !{null, !156, !6}
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !158)
!158 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!159 = !DILocalVariable(name: "str", arg: 1, scope: !153, file: !3, line: 54, type: !156)
!160 = !DILocation(line: 54, column: 31, scope: !153)
!161 = !DILocalVariable(name: "d", arg: 2, scope: !153, file: !3, line: 54, type: !6)
!162 = !DILocation(line: 54, column: 40, scope: !153)
!163 = !DILocalVariable(name: "tmp", scope: !153, file: !3, line: 56, type: !164)
!164 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!165 = !DILocation(line: 56, column: 7, scope: !153)
!166 = !DILocation(line: 59, column: 2, scope: !153)
!167 = !DILocation(line: 59, column: 10, scope: !153)
!168 = !DILocation(line: 59, column: 9, scope: !153)
!169 = !DILocation(line: 59, column: 14, scope: !153)
!170 = !DILocation(line: 60, column: 15, scope: !171)
!171 = distinct !DILexicalBlock(scope: !153, file: !3, line: 59, column: 23)
!172 = !DILocation(line: 60, column: 10, scope: !171)
!173 = !DILocation(line: 60, column: 3, scope: !171)
!174 = !DILocation(line: 61, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 61, column: 17)
!176 = distinct !DILexicalBlock(scope: !171, file: !3, line: 60, column: 20)
!177 = !DILocation(line: 61, column: 17, scope: !176)
!178 = !{!"if"}
!179 = !DILocation(line: 61, column: 41, scope: !175)
!180 = !DILocation(line: 61, column: 43, scope: !175)
!181 = !DILocation(line: 61, column: 20, scope: !175)
!182 = !DILocation(line: 61, column: 49, scope: !176)
!183 = distinct !{!183, !166, !184}
!184 = !DILocation(line: 79, column: 2, scope: !153)
!185 = !DILocation(line: 62, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !3, line: 62, column: 17)
!187 = !DILocation(line: 62, column: 17, scope: !176)
!188 = !DILocation(line: 62, column: 41, scope: !186)
!189 = !DILocation(line: 62, column: 43, scope: !186)
!190 = !DILocation(line: 62, column: 20, scope: !186)
!191 = !DILocation(line: 62, column: 49, scope: !176)
!192 = !DILocation(line: 63, column: 13, scope: !176)
!193 = !DILocation(line: 63, column: 20, scope: !176)
!194 = !DILocation(line: 64, column: 13, scope: !176)
!195 = !DILocation(line: 64, column: 20, scope: !176)
!196 = !DILocation(line: 74, column: 10, scope: !176)
!197 = !DILocation(line: 75, column: 11, scope: !176)
!198 = !DILocation(line: 75, column: 13, scope: !176)
!199 = !DILocation(line: 75, column: 12, scope: !176)
!200 = !DILocation(line: 75, column: 20, scope: !176)
!201 = !DILocation(line: 75, column: 22, scope: !176)
!202 = !DILocation(line: 75, column: 21, scope: !176)
!203 = !DILocation(line: 75, column: 5, scope: !176)
!204 = !DILocation(line: 76, column: 10, scope: !176)
!205 = !DILocation(line: 76, column: 7, scope: !176)
!206 = !DILocation(line: 76, column: 19, scope: !176)
!207 = !DILocation(line: 76, column: 16, scope: !176)
!208 = !DILocation(line: 77, column: 5, scope: !176)
!209 = !DILocation(line: 80, column: 1, scope: !153)
!210 = distinct !DISubprogram(name: "dragon", scope: !3, file: !3, line: 82, type: !211, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!211 = !DISubroutineType(types: !212)
!212 = !{null, !164, !6}
!213 = !DILocalVariable(name: "leng", arg: 1, scope: !210, file: !3, line: 82, type: !164)
!214 = !DILocation(line: 82, column: 18, scope: !210)
!215 = !DILocalVariable(name: "depth", arg: 2, scope: !210, file: !3, line: 82, type: !6)
!216 = !DILocation(line: 82, column: 28, scope: !210)
!217 = !DILocalVariable(name: "i", scope: !210, file: !3, line: 84, type: !164)
!218 = !DILocation(line: 84, column: 7, scope: !210)
!219 = !DILocalVariable(name: "d", scope: !210, file: !3, line: 84, type: !164)
!220 = !DILocation(line: 84, column: 10, scope: !210)
!221 = !DILocation(line: 84, column: 14, scope: !210)
!222 = !DILocation(line: 84, column: 19, scope: !210)
!223 = !DILocation(line: 84, column: 23, scope: !210)
!224 = !DILocalVariable(name: "h", scope: !210, file: !3, line: 85, type: !164)
!225 = !DILocation(line: 85, column: 7, scope: !210)
!226 = !DILocation(line: 85, column: 11, scope: !210)
!227 = !DILocation(line: 85, column: 16, scope: !210)
!228 = !DILocalVariable(name: "w", scope: !210, file: !3, line: 85, type: !164)
!229 = !DILocation(line: 85, column: 21, scope: !210)
!230 = !DILocation(line: 85, column: 25, scope: !210)
!231 = !DILocation(line: 85, column: 32, scope: !210)
!232 = !DILocation(line: 85, column: 34, scope: !210)
!233 = !DILocation(line: 85, column: 38, scope: !210)
!234 = !DILocation(line: 85, column: 30, scope: !210)
!235 = !DILocation(line: 85, column: 42, scope: !210)
!236 = !DILocalVariable(name: "buf", scope: !210, file: !3, line: 88, type: !24)
!237 = !DILocation(line: 88, column: 7, scope: !210)
!238 = !DILocation(line: 88, column: 34, scope: !210)
!239 = !DILocation(line: 88, column: 32, scope: !210)
!240 = !DILocation(line: 88, column: 38, scope: !210)
!241 = !DILocation(line: 88, column: 36, scope: !210)
!242 = !DILocation(line: 88, column: 13, scope: !210)
!243 = !DILocation(line: 89, column: 31, scope: !210)
!244 = !DILocation(line: 89, column: 29, scope: !210)
!245 = !DILocation(line: 89, column: 8, scope: !210)
!246 = !DILocation(line: 89, column: 6, scope: !210)
!247 = !DILocation(line: 90, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !210, file: !3, line: 90, column: 2)
!249 = !DILocation(line: 90, column: 7, scope: !248)
!250 = !DILocation(line: 90, column: 14, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !3, line: 90, column: 2)
!252 = !DILocation(line: 90, column: 18, scope: !251)
!253 = !DILocation(line: 90, column: 16, scope: !251)
!254 = !DILocation(line: 90, column: 2, scope: !248)
!255 = !DILocation(line: 91, column: 12, scope: !251)
!256 = !DILocation(line: 91, column: 18, scope: !251)
!257 = !DILocation(line: 91, column: 22, scope: !251)
!258 = !DILocation(line: 91, column: 20, scope: !251)
!259 = !DILocation(line: 91, column: 16, scope: !251)
!260 = !DILocation(line: 91, column: 3, scope: !251)
!261 = !DILocation(line: 91, column: 7, scope: !251)
!262 = !DILocation(line: 91, column: 10, scope: !251)
!263 = !DILocation(line: 90, column: 22, scope: !251)
!264 = !DILocation(line: 90, column: 2, scope: !251)
!265 = distinct !{!265, !254, !266}
!266 = !DILocation(line: 91, column: 22, scope: !248)
!267 = !DILocation(line: 92, column: 9, scope: !210)
!268 = !DILocation(line: 92, column: 2, scope: !210)
!269 = !DILocation(line: 92, column: 31, scope: !210)
!270 = !DILocation(line: 92, column: 29, scope: !210)
!271 = !DILocation(line: 92, column: 35, scope: !210)
!272 = !DILocation(line: 92, column: 33, scope: !210)
!273 = !DILocation(line: 95, column: 10, scope: !210)
!274 = !DILocation(line: 95, column: 8, scope: !210)
!275 = !DILocation(line: 95, column: 4, scope: !210)
!276 = !DILocation(line: 95, column: 18, scope: !210)
!277 = !DILocation(line: 95, column: 16, scope: !210)
!278 = !DILocation(line: 95, column: 27, scope: !210)
!279 = !DILocation(line: 95, column: 38, scope: !210)
!280 = !DILocation(line: 95, column: 48, scope: !210)
!281 = !DILocation(line: 96, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !210, file: !3, line: 96, column: 2)
!283 = !DILocation(line: 96, column: 7, scope: !282)
!284 = !DILocation(line: 96, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !3, line: 96, column: 2)
!286 = !DILocation(line: 96, column: 18, scope: !285)
!287 = !DILocation(line: 96, column: 16, scope: !285)
!288 = !DILocation(line: 96, column: 2, scope: !282)
!289 = !DILocation(line: 96, column: 30, scope: !285)
!290 = !DILocation(line: 96, column: 26, scope: !285)
!291 = !DILocation(line: 96, column: 2, scope: !285)
!292 = distinct !{!292, !288, !293}
!293 = !DILocation(line: 96, column: 36, scope: !282)
!294 = !DILocation(line: 97, column: 20, scope: !210)
!295 = !DILocation(line: 97, column: 2, scope: !210)
!296 = !DILocalVariable(name: "fpix", scope: !210, file: !3, line: 100, type: !297)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!298 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!299 = !DILocation(line: 100, column: 17, scope: !210)
!300 = !DILocation(line: 100, column: 31, scope: !210)
!301 = !DILocation(line: 100, column: 35, scope: !210)
!302 = !DILocation(line: 100, column: 33, scope: !210)
!303 = !DILocation(line: 100, column: 37, scope: !210)
!304 = !DILocation(line: 100, column: 24, scope: !210)
!305 = !DILocalVariable(name: "maxv", scope: !210, file: !3, line: 101, type: !8)
!306 = !DILocation(line: 101, column: 9, scope: !210)
!307 = !DILocalVariable(name: "dbuf", scope: !210, file: !3, line: 101, type: !7)
!308 = !DILocation(line: 101, column: 20, scope: !210)
!309 = !DILocation(line: 101, column: 36, scope: !210)
!310 = !DILocation(line: 101, column: 27, scope: !210)
!311 = !DILocation(line: 108, column: 15, scope: !312)
!312 = distinct !DILexicalBlock(scope: !210, file: !3, line: 108, column: 2)
!313 = !DILocation(line: 108, column: 13, scope: !312)
!314 = !DILocation(line: 108, column: 19, scope: !312)
!315 = !DILocation(line: 108, column: 17, scope: !312)
!316 = !DILocation(line: 108, column: 21, scope: !312)
!317 = !DILocation(line: 108, column: 9, scope: !312)
!318 = !DILocation(line: 108, column: 7, scope: !312)
!319 = !DILocation(line: 108, column: 26, scope: !320)
!320 = distinct !DILexicalBlock(scope: !312, file: !3, line: 108, column: 2)
!321 = !DILocation(line: 108, column: 28, scope: !320)
!322 = !DILocation(line: 108, column: 2, scope: !312)
!323 = !DILocation(line: 109, column: 7, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !3, line: 109, column: 7)
!325 = !DILocation(line: 109, column: 12, scope: !324)
!326 = !DILocation(line: 109, column: 17, scope: !324)
!327 = !DILocation(line: 109, column: 15, scope: !324)
!328 = !DILocation(line: 109, column: 7, scope: !320)
!329 = !DILocation(line: 109, column: 30, scope: !324)
!330 = !DILocation(line: 109, column: 35, scope: !324)
!331 = !DILocation(line: 109, column: 28, scope: !324)
!332 = !DILocation(line: 109, column: 23, scope: !324)
!333 = !DILocation(line: 108, column: 35, scope: !320)
!334 = !DILocation(line: 108, column: 2, scope: !320)
!335 = distinct !{!335, !322, !336}
!336 = !DILocation(line: 109, column: 36, scope: !312)
!337 = !DILocation(line: 110, column: 15, scope: !338)
!338 = distinct !DILexicalBlock(scope: !210, file: !3, line: 110, column: 2)
!339 = !DILocation(line: 110, column: 13, scope: !338)
!340 = !DILocation(line: 110, column: 19, scope: !338)
!341 = !DILocation(line: 110, column: 17, scope: !338)
!342 = !DILocation(line: 110, column: 21, scope: !338)
!343 = !DILocation(line: 110, column: 9, scope: !338)
!344 = !DILocation(line: 110, column: 7, scope: !338)
!345 = !DILocation(line: 110, column: 26, scope: !346)
!346 = distinct !DILexicalBlock(scope: !338, file: !3, line: 110, column: 2)
!347 = !DILocation(line: 110, column: 28, scope: !346)
!348 = !DILocation(line: 110, column: 2, scope: !338)
!349 = !DILocation(line: 111, column: 19, scope: !346)
!350 = !DILocation(line: 111, column: 24, scope: !346)
!351 = !DILocation(line: 111, column: 17, scope: !346)
!352 = !DILocation(line: 111, column: 29, scope: !346)
!353 = !DILocation(line: 111, column: 27, scope: !346)
!354 = !DILocation(line: 111, column: 13, scope: !346)
!355 = !DILocation(line: 111, column: 3, scope: !346)
!356 = !DILocation(line: 111, column: 8, scope: !346)
!357 = !DILocation(line: 111, column: 11, scope: !346)
!358 = !DILocation(line: 110, column: 35, scope: !346)
!359 = !DILocation(line: 110, column: 2, scope: !346)
!360 = distinct !{!360, !348, !361}
!361 = !DILocation(line: 111, column: 29, scope: !338)
!362 = !DILocation(line: 113, column: 31, scope: !210)
!363 = !DILocation(line: 113, column: 34, scope: !210)
!364 = !DILocation(line: 113, column: 2, scope: !210)
!365 = !DILocation(line: 114, column: 9, scope: !210)
!366 = !DILocation(line: 114, column: 2, scope: !210)
!367 = !DILocation(line: 115, column: 9, scope: !210)
!368 = !DILocation(line: 115, column: 15, scope: !210)
!369 = !DILocation(line: 115, column: 19, scope: !210)
!370 = !DILocation(line: 115, column: 17, scope: !210)
!371 = !DILocation(line: 115, column: 21, scope: !210)
!372 = !DILocation(line: 115, column: 29, scope: !210)
!373 = !DILocation(line: 115, column: 2, scope: !210)
!374 = !DILocation(line: 116, column: 1, scope: !210)
!375 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 118, type: !376, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!376 = !DISubroutineType(types: !377)
!377 = !{!6, !6, !378}
!378 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !379, size: 64)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!380 = !DILocalVariable(name: "c", arg: 1, scope: !375, file: !3, line: 118, type: !6)
!381 = !DILocation(line: 118, column: 14, scope: !375)
!382 = !DILocalVariable(name: "v", arg: 2, scope: !375, file: !3, line: 118, type: !378)
!383 = !DILocation(line: 118, column: 25, scope: !375)
!384 = !DILocalVariable(name: "size", scope: !375, file: !3, line: 120, type: !6)
!385 = !DILocation(line: 120, column: 6, scope: !375)
!386 = !DILocalVariable(name: "depth", scope: !375, file: !3, line: 120, type: !6)
!387 = !DILocation(line: 120, column: 12, scope: !375)
!388 = !DILocation(line: 122, column: 12, scope: !375)
!389 = !DILocation(line: 122, column: 14, scope: !375)
!390 = !DILocation(line: 122, column: 11, scope: !375)
!391 = !DILocation(line: 122, column: 26, scope: !375)
!392 = !DILocation(line: 122, column: 21, scope: !375)
!393 = !DILocation(line: 122, column: 9, scope: !375)
!394 = !DILocation(line: 123, column: 14, scope: !375)
!395 = !DILocation(line: 123, column: 11, scope: !375)
!396 = !DILocation(line: 123, column: 7, scope: !375)
!397 = !DILocation(line: 125, column: 10, scope: !375)
!398 = !DILocation(line: 125, column: 42, scope: !375)
!399 = !DILocation(line: 125, column: 48, scope: !375)
!400 = !DILocation(line: 125, column: 2, scope: !375)
!401 = !DILocation(line: 126, column: 9, scope: !375)
!402 = !DILocation(line: 126, column: 15, scope: !375)
!403 = !DILocation(line: 126, column: 21, scope: !375)
!404 = !DILocation(line: 126, column: 2, scope: !375)
!405 = !DILocation(line: 128, column: 2, scope: !375)
