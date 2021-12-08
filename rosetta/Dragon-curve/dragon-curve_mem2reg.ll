; ModuleID = 'dragon-curve.ll'
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
  %0 = load i64, i64* @dx, align 8, !dbg !38
  %1 = load i64, i64* @dy, align 8, !dbg !39
  %sub = sub nsw i64 %0, %1, !dbg !40
  call void @llvm.dbg.value(metadata i64 %sub, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load i64, i64* @dx, align 8, !dbg !43
  %3 = load i64, i64* @dy, align 8, !dbg !44
  %add = add nsw i64 %2, %3, !dbg !45
  store i64 %add, i64* @dy, align 8, !dbg !46
  store i64 %sub, i64* @dx, align 8, !dbg !47
  %4 = load i64, i64* @scale, align 8, !dbg !48
  %mul = mul nsw i64 %4, 2, !dbg !48
  store i64 %mul, i64* @scale, align 8, !dbg !48
  %5 = load i64, i64* @x, align 8, !dbg !49
  %mul1 = mul nsw i64 %5, 2, !dbg !49
  store i64 %mul1, i64* @x, align 8, !dbg !49
  %6 = load i64, i64* @y, align 8, !dbg !50
  %mul2 = mul nsw i64 %6, 2, !dbg !50
  store i64 %mul2, i64* @y, align 8, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @h_rgb(i64 %x, i64 %y) #0 !dbg !52 {
entry:
  call void @llvm.dbg.value(metadata i64 %x, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata i64 %y, metadata !57, metadata !DIExpression()), !dbg !56
  %0 = load %struct.rgb**, %struct.rgb*** @pix, align 8, !dbg !58
  %arrayidx = getelementptr inbounds %struct.rgb*, %struct.rgb** %0, i64 %y, !dbg !58
  %1 = load %struct.rgb*, %struct.rgb** %arrayidx, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds %struct.rgb, %struct.rgb* %1, i64 %x, !dbg !58
  call void @llvm.dbg.value(metadata %struct.rgb* %arrayidx1, metadata !59, metadata !DIExpression()), !dbg !56
  %2 = load i64, i64* @clen, align 8, !dbg !60
  %conv = sitofp i64 %2 to double, !dbg !60
  %mul = fmul double 6.000000e+00, %conv, !dbg !61
  %3 = load i64, i64* @scale, align 8, !dbg !62
  %conv2 = sitofp i64 %3 to double, !dbg !62
  %div = fdiv double %mul, %conv2, !dbg !63
  call void @llvm.dbg.value(metadata double %div, metadata !64, metadata !DIExpression()), !dbg !56
  %4 = load i64, i64* @clen, align 8, !dbg !65
  %conv3 = sitofp i64 %4 to double, !dbg !65
  %mul4 = fmul double 0x406921FB5443CE28, %conv3, !dbg !66
  %5 = load i64, i64* @scale, align 8, !dbg !67
  %conv5 = sitofp i64 %5 to double, !dbg !67
  %div6 = fdiv double %mul4, %conv5, !dbg !68
  %call = call double @cos(double %div6) #6, !dbg !69
  %sub = fsub double %call, 1.000000e+00, !dbg !70
  %div7 = fdiv double %sub, 4.000000e+00, !dbg !71
  %sub8 = fsub double 1.000000e+00, %div7, !dbg !72
  call void @llvm.dbg.value(metadata double %sub8, metadata !73, metadata !DIExpression()), !dbg !56
  %mul9 = fmul double 1.000000e+00, %sub8, !dbg !74
  call void @llvm.dbg.value(metadata double %mul9, metadata !75, metadata !DIExpression()), !dbg !56
  %call10 = call double @fmod(double %div, double 2.000000e+00) #6, !dbg !76
  %sub11 = fsub double %call10, 1.000000e+00, !dbg !77
  %6 = call double @llvm.fabs.f64(double %sub11), !dbg !78
  %sub12 = fsub double 1.000000e+00, %6, !dbg !79
  %mul13 = fmul double %mul9, %sub12, !dbg !80
  call void @llvm.dbg.value(metadata double %mul13, metadata !81, metadata !DIExpression()), !dbg !56
  %conv14 = fptosi double %div to i32, !dbg !82
  switch i32 %conv14, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb16
    i32 2, label %sw.bb21
    i32 3, label %sw.bb25
    i32 4, label %sw.bb30
  ], !dbg !83

sw.bb:                                            ; preds = %entry
  %r = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 0, !dbg !84
  %7 = load double, double* %r, align 8, !dbg !86
  %add = fadd double %7, %mul9, !dbg !86
  store double %add, double* %r, align 8, !dbg !86
  %g = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 1, !dbg !87
  %8 = load double, double* %g, align 8, !dbg !88
  %add15 = fadd double %8, %mul13, !dbg !88
  store double %add15, double* %g, align 8, !dbg !88
  br label %sw.epilog, !dbg !89

sw.bb16:                                          ; preds = %entry
  %r17 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 0, !dbg !90
  %9 = load double, double* %r17, align 8, !dbg !91
  %add18 = fadd double %9, %mul13, !dbg !91
  store double %add18, double* %r17, align 8, !dbg !91
  %g19 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 1, !dbg !92
  %10 = load double, double* %g19, align 8, !dbg !93
  %add20 = fadd double %10, %mul9, !dbg !93
  store double %add20, double* %g19, align 8, !dbg !93
  br label %sw.epilog, !dbg !94

sw.bb21:                                          ; preds = %entry
  %g22 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 1, !dbg !95
  %11 = load double, double* %g22, align 8, !dbg !96
  %add23 = fadd double %11, %mul9, !dbg !96
  store double %add23, double* %g22, align 8, !dbg !96
  %b = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 2, !dbg !97
  %12 = load double, double* %b, align 8, !dbg !98
  %add24 = fadd double %12, %mul13, !dbg !98
  store double %add24, double* %b, align 8, !dbg !98
  br label %sw.epilog, !dbg !99

sw.bb25:                                          ; preds = %entry
  %g26 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 1, !dbg !100
  %13 = load double, double* %g26, align 8, !dbg !101
  %add27 = fadd double %13, %mul13, !dbg !101
  store double %add27, double* %g26, align 8, !dbg !101
  %b28 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 2, !dbg !102
  %14 = load double, double* %b28, align 8, !dbg !103
  %add29 = fadd double %14, %mul9, !dbg !103
  store double %add29, double* %b28, align 8, !dbg !103
  br label %sw.epilog, !dbg !104

sw.bb30:                                          ; preds = %entry
  %r31 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 0, !dbg !105
  %15 = load double, double* %r31, align 8, !dbg !106
  %add32 = fadd double %15, %mul13, !dbg !106
  store double %add32, double* %r31, align 8, !dbg !106
  %b33 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 2, !dbg !107
  %16 = load double, double* %b33, align 8, !dbg !108
  %add34 = fadd double %16, %mul9, !dbg !108
  store double %add34, double* %b33, align 8, !dbg !108
  br label %sw.epilog, !dbg !109

sw.default:                                       ; preds = %entry
  %r35 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 0, !dbg !110
  %17 = load double, double* %r35, align 8, !dbg !111
  %add36 = fadd double %17, %mul9, !dbg !111
  store double %add36, double* %r35, align 8, !dbg !111
  %b37 = getelementptr inbounds %struct.rgb, %struct.rgb* %arrayidx1, i32 0, i32 2, !dbg !112
  %18 = load double, double* %b37, align 8, !dbg !113
  %add38 = fadd double %18, %mul13, !dbg !113
  store double %add38, double* %b37, align 8, !dbg !113
  br label %sw.epilog, !dbg !114

sw.epilog:                                        ; preds = %sw.default, %sw.bb30, %sw.bb25, %sw.bb21, %sw.bb16, %sw.bb
  ret void, !dbg !115
}

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @fmod(double, double) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @iter_string(i8* %str, i32 %d) #0 !dbg !116 {
entry:
  call void @llvm.dbg.value(metadata i8* %str, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.value(metadata i32 %d, metadata !124, metadata !DIExpression()), !dbg !123
  br label %while.cond, !dbg !125

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %str.addr.0 = phi i8* [ %str, %entry ], [ %incdec.ptr, %while.cond.backedge ]
  call void @llvm.dbg.value(metadata i8* %str.addr.0, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8, i8* %str.addr.0, align 1, !dbg !126
  %conv = sext i8 %0 to i32, !dbg !126
  %cmp = icmp ne i32 %conv, 0, !dbg !127
  br i1 %cmp, label %while.body, label %while.end, !dbg !125

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %str.addr.0, i32 1, !dbg !128
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !122, metadata !DIExpression()), !dbg !123
  %1 = load i8, i8* %str.addr.0, align 1, !dbg !130
  %conv2 = sext i8 %1 to i32, !dbg !130
  switch i32 %conv2, label %sw.epilog [
    i32 88, label %sw.bb
    i32 89, label %sw.bb3
    i32 43, label %sw.bb8
    i32 45, label %sw.bb10
    i32 70, label %sw.bb12
  ], !dbg !131

sw.bb:                                            ; preds = %while.body
  %tobool = icmp ne i32 %d, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %sw.bb
  %sub = sub nsw i32 %d, 1, !dbg !136
  call void @iter_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 %sub), !dbg !137
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %sw.bb
  br label %while.cond.backedge, !dbg !138

while.cond.backedge:                              ; preds = %sw.epilog, %sw.bb12, %sw.bb10, %sw.bb8, %if.end7, %if.end
  br label %while.cond, !dbg !139, !llvm.loop !140

sw.bb3:                                           ; preds = %while.body
  %tobool4 = icmp ne i32 %d, 0, !dbg !142
  br i1 %tobool4, label %if.then5, label %if.end7, !dbg !144

if.then5:                                         ; preds = %sw.bb3
  %sub6 = sub nsw i32 %d, 1, !dbg !145
  call void @iter_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %sub6), !dbg !146
  br label %if.end7, !dbg !146

if.end7:                                          ; preds = %if.then5, %sw.bb3
  br label %while.cond.backedge, !dbg !147

sw.bb8:                                           ; preds = %while.body
  %2 = load i64, i64* @dy, align 8, !dbg !148
  call void @llvm.dbg.value(metadata i64 %2, metadata !149, metadata !DIExpression()), !dbg !123
  %3 = load i64, i64* @dx, align 8, !dbg !148
  %sub9 = sub nsw i64 0, %3, !dbg !148
  store i64 %sub9, i64* @dy, align 8, !dbg !148
  store i64 %2, i64* @dx, align 8, !dbg !148
  br label %while.cond.backedge, !dbg !151

sw.bb10:                                          ; preds = %while.body
  %4 = load i64, i64* @dy, align 8, !dbg !152
  %sub11 = sub nsw i64 0, %4, !dbg !152
  call void @llvm.dbg.value(metadata i64 %sub11, metadata !149, metadata !DIExpression()), !dbg !123
  %5 = load i64, i64* @dx, align 8, !dbg !152
  store i64 %5, i64* @dy, align 8, !dbg !152
  store i64 %sub11, i64* @dx, align 8, !dbg !152
  br label %while.cond.backedge, !dbg !153

sw.bb12:                                          ; preds = %while.body
  %6 = load i64, i64* @clen, align 8, !dbg !154
  %inc = add nsw i64 %6, 1, !dbg !154
  store i64 %inc, i64* @clen, align 8, !dbg !154
  %7 = load i64, i64* @x, align 8, !dbg !155
  %8 = load i64, i64* @scale, align 8, !dbg !156
  %div = sdiv i64 %7, %8, !dbg !157
  %9 = load i64, i64* @y, align 8, !dbg !158
  %10 = load i64, i64* @scale, align 8, !dbg !159
  %div13 = sdiv i64 %9, %10, !dbg !160
  call void @h_rgb(i64 %div, i64 %div13), !dbg !161
  %11 = load i64, i64* @dx, align 8, !dbg !162
  %12 = load i64, i64* @x, align 8, !dbg !163
  %add = add nsw i64 %12, %11, !dbg !163
  store i64 %add, i64* @x, align 8, !dbg !163
  %13 = load i64, i64* @dy, align 8, !dbg !164
  %14 = load i64, i64* @y, align 8, !dbg !165
  %add14 = add nsw i64 %14, %13, !dbg !165
  store i64 %add14, i64* @y, align 8, !dbg !165
  br label %while.cond.backedge, !dbg !166

sw.epilog:                                        ; preds = %while.body
  br label %while.cond.backedge, !dbg !125

while.end:                                        ; preds = %while.cond
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dragon(i64 %leng, i32 %depth) #0 !dbg !168 {
entry:
  call void @llvm.dbg.value(metadata i64 %leng, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %depth, metadata !173, metadata !DIExpression()), !dbg !172
  %div = sdiv i64 %leng, 3, !dbg !174
  %add = add nsw i64 %div, 1, !dbg !175
  call void @llvm.dbg.value(metadata i64 %add, metadata !176, metadata !DIExpression()), !dbg !172
  %add1 = add nsw i64 %leng, 3, !dbg !177
  call void @llvm.dbg.value(metadata i64 %add1, metadata !178, metadata !DIExpression()), !dbg !172
  %mul = mul nsw i64 %add, 3, !dbg !179
  %div2 = sdiv i64 %mul, 2, !dbg !180
  %add3 = add nsw i64 %leng, %div2, !dbg !181
  %add4 = add nsw i64 %add3, 2, !dbg !182
  call void @llvm.dbg.value(metadata i64 %add4, metadata !183, metadata !DIExpression()), !dbg !172
  %mul5 = mul i64 24, %add4, !dbg !184
  %mul6 = mul i64 %mul5, %add1, !dbg !185
  %call = call noalias i8* @malloc(i64 %mul6) #6, !dbg !186
  %0 = bitcast i8* %call to %struct.rgb*, !dbg !186
  call void @llvm.dbg.value(metadata %struct.rgb* %0, metadata !187, metadata !DIExpression()), !dbg !172
  %mul7 = mul i64 8, %add1, !dbg !188
  %call8 = call noalias i8* @malloc(i64 %mul7) #6, !dbg !189
  %1 = bitcast i8* %call8 to %struct.rgb**, !dbg !189
  store %struct.rgb** %1, %struct.rgb*** @pix, align 8, !dbg !190
  call void @llvm.dbg.value(metadata i64 0, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !194
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !191, metadata !DIExpression()), !dbg !172
  %cmp = icmp slt i64 %i.0, %add1, !dbg !195
  br i1 %cmp, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %mul9 = mul nsw i64 %add4, %i.0, !dbg !198
  %add.ptr = getelementptr inbounds %struct.rgb, %struct.rgb* %0, i64 %mul9, !dbg !199
  %2 = load %struct.rgb**, %struct.rgb*** @pix, align 8, !dbg !200
  %arrayidx = getelementptr inbounds %struct.rgb*, %struct.rgb** %2, i64 %i.0, !dbg !200
  store %struct.rgb* %add.ptr, %struct.rgb** %arrayidx, align 8, !dbg !201
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %inc = add nsw i64 %i.0, 1, !dbg !202
  call void @llvm.dbg.value(metadata i64 %inc, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %3 = bitcast %struct.rgb* %0 to i8*, !dbg !206
  %mul10 = mul i64 24, %add4, !dbg !207
  %mul11 = mul i64 %mul10, %add1, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 8 %3, i8 0, i64 %mul11, i1 false), !dbg !206
  store i64 %add, i64* @y, align 8, !dbg !209
  store i64 %add, i64* @x, align 8, !dbg !210
  store i64 %leng, i64* @dx, align 8, !dbg !211
  store i64 0, i64* @dy, align 8, !dbg !212
  store i64 1, i64* @scale, align 8, !dbg !213
  store i64 0, i64* @clen, align 8, !dbg !214
  call void @llvm.dbg.value(metadata i64 0, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond12, !dbg !215

for.cond12:                                       ; preds = %for.inc16, %for.end
  %i.1 = phi i64 [ 0, %for.end ], [ %inc17, %for.inc16 ], !dbg !217
  call void @llvm.dbg.value(metadata i64 %i.1, metadata !191, metadata !DIExpression()), !dbg !172
  %conv = sext i32 %depth to i64, !dbg !218
  %cmp13 = icmp slt i64 %i.1, %conv, !dbg !220
  br i1 %cmp13, label %for.body15, label %for.end18, !dbg !221

for.body15:                                       ; preds = %for.cond12
  call void @sc_up(), !dbg !222
  br label %for.inc16, !dbg !222

for.inc16:                                        ; preds = %for.body15
  %inc17 = add nsw i64 %i.1, 1, !dbg !223
  call void @llvm.dbg.value(metadata i64 %inc17, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond12, !dbg !224, !llvm.loop !225

for.end18:                                        ; preds = %for.cond12
  call void @iter_string(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 %depth), !dbg !227
  %mul19 = mul nsw i64 %add4, %add1, !dbg !228
  %mul20 = mul nsw i64 %mul19, 3, !dbg !229
  %call21 = call noalias i8* @malloc(i64 %mul20) #6, !dbg !230
  call void @llvm.dbg.value(metadata i8* %call21, metadata !231, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !234, metadata !DIExpression()), !dbg !172
  %4 = bitcast %struct.rgb* %0 to double*, !dbg !235
  call void @llvm.dbg.value(metadata double* %4, metadata !236, metadata !DIExpression()), !dbg !172
  %mul22 = mul nsw i64 3, %add4, !dbg !237
  %mul23 = mul nsw i64 %mul22, %add1, !dbg !239
  %sub = sub nsw i64 %mul23, 1, !dbg !240
  call void @llvm.dbg.value(metadata i64 %sub, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond24, !dbg !241

for.cond24:                                       ; preds = %for.inc32, %for.end18
  %i.2 = phi i64 [ %sub, %for.end18 ], [ %dec, %for.inc32 ], !dbg !242
  %maxv.0 = phi double [ 0.000000e+00, %for.end18 ], [ %maxv.1, %for.inc32 ], !dbg !172
  call void @llvm.dbg.value(metadata double %maxv.0, metadata !234, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i64 %i.2, metadata !191, metadata !DIExpression()), !dbg !172
  %cmp25 = icmp sge i64 %i.2, 0, !dbg !243
  br i1 %cmp25, label %for.body27, label %for.end33, !dbg !245

for.body27:                                       ; preds = %for.cond24
  %arrayidx28 = getelementptr inbounds double, double* %4, i64 %i.2, !dbg !246
  %5 = load double, double* %arrayidx28, align 8, !dbg !246
  %cmp29 = fcmp ogt double %5, %maxv.0, !dbg !248
  br i1 %cmp29, label %if.then, label %if.end, !dbg !249

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds double, double* %4, i64 %i.2, !dbg !250
  %6 = load double, double* %arrayidx31, align 8, !dbg !250
  call void @llvm.dbg.value(metadata double %6, metadata !234, metadata !DIExpression()), !dbg !172
  br label %if.end, !dbg !251

if.end:                                           ; preds = %if.then, %for.body27
  %maxv.1 = phi double [ %6, %if.then ], [ %maxv.0, %for.body27 ], !dbg !172
  call void @llvm.dbg.value(metadata double %maxv.1, metadata !234, metadata !DIExpression()), !dbg !172
  br label %for.inc32, !dbg !252

for.inc32:                                        ; preds = %if.end
  %dec = add nsw i64 %i.2, -1, !dbg !253
  call void @llvm.dbg.value(metadata i64 %dec, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond24, !dbg !254, !llvm.loop !255

for.end33:                                        ; preds = %for.cond24
  %mul34 = mul nsw i64 3, %add1, !dbg !257
  %mul35 = mul nsw i64 %mul34, %add4, !dbg !259
  %sub36 = sub nsw i64 %mul35, 1, !dbg !260
  call void @llvm.dbg.value(metadata i64 %sub36, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond37, !dbg !261

for.cond37:                                       ; preds = %for.inc46, %for.end33
  %i.3 = phi i64 [ %sub36, %for.end33 ], [ %dec47, %for.inc46 ], !dbg !262
  call void @llvm.dbg.value(metadata i64 %i.3, metadata !191, metadata !DIExpression()), !dbg !172
  %cmp38 = icmp sge i64 %i.3, 0, !dbg !263
  br i1 %cmp38, label %for.body40, label %for.end48, !dbg !265

for.body40:                                       ; preds = %for.cond37
  %arrayidx41 = getelementptr inbounds double, double* %4, i64 %i.3, !dbg !266
  %7 = load double, double* %arrayidx41, align 8, !dbg !266
  %mul42 = fmul double 2.550000e+02, %7, !dbg !267
  %div43 = fdiv double %mul42, %maxv.0, !dbg !268
  %conv44 = fptoui double %div43 to i8, !dbg !269
  %arrayidx45 = getelementptr inbounds i8, i8* %call21, i64 %i.3, !dbg !270
  store i8 %conv44, i8* %arrayidx45, align 1, !dbg !271
  br label %for.inc46, !dbg !270

for.inc46:                                        ; preds = %for.body40
  %dec47 = add nsw i64 %i.3, -1, !dbg !272
  call void @llvm.dbg.value(metadata i64 %dec47, metadata !191, metadata !DIExpression()), !dbg !172
  br label %for.cond37, !dbg !273, !llvm.loop !274

for.end48:                                        ; preds = %for.cond37
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i64 %add4, i64 %add1), !dbg !276
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !277
  %call50 = call i32 @fflush(%struct._IO_FILE* %8), !dbg !278
  %mul51 = mul nsw i64 %add1, %add4, !dbg !279
  %mul52 = mul nsw i64 %mul51, 3, !dbg !280
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !281
  %call53 = call i64 @fwrite(i8* %call21, i64 %mul52, i64 1, %struct._IO_FILE* %9), !dbg !282
  ret void, !dbg !283
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !284 {
entry:
  call void @llvm.dbg.value(metadata i32 %c, metadata !289, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i8** %v, metadata !291, metadata !DIExpression()), !dbg !290
  %cmp = icmp sgt i32 %c, 1, !dbg !292
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !293

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 1, !dbg !294
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !294
  %call = call i32 @atoi(i8* %0) #7, !dbg !295
  br label %cond.end, !dbg !293

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !293

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 10, %cond.false ], !dbg !293
  call void @llvm.dbg.value(metadata i32 %cond, metadata !296, metadata !DIExpression()), !dbg !290
  %shl = shl i32 1, %cond, !dbg !297
  call void @llvm.dbg.value(metadata i32 %shl, metadata !298, metadata !DIExpression()), !dbg !290
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !299
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i32 %shl, i32 %cond), !dbg !300
  %conv = sext i32 %shl to i64, !dbg !301
  %mul = mul nsw i32 %cond, 2, !dbg !302
  call void @dragon(i64 %conv, i32 %mul), !dbg !303
  ret i32 0, !dbg !304
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
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
!34 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!35 = distinct !DISubprogram(name: "sc_up", scope: !3, file: !3, line: 19, type: !36, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocation(line: 21, column: 18, scope: !35)
!39 = !DILocation(line: 21, column: 23, scope: !35)
!40 = !DILocation(line: 21, column: 21, scope: !35)
!41 = !DILocalVariable(name: "tmp", scope: !35, file: !3, line: 21, type: !12)
!42 = !DILocation(line: 0, scope: !35)
!43 = !DILocation(line: 21, column: 32, scope: !35)
!44 = !DILocation(line: 21, column: 37, scope: !35)
!45 = !DILocation(line: 21, column: 35, scope: !35)
!46 = !DILocation(line: 21, column: 30, scope: !35)
!47 = !DILocation(line: 21, column: 44, scope: !35)
!48 = !DILocation(line: 22, column: 8, scope: !35)
!49 = !DILocation(line: 22, column: 16, scope: !35)
!50 = !DILocation(line: 22, column: 24, scope: !35)
!51 = !DILocation(line: 23, column: 1, scope: !35)
!52 = distinct !DISubprogram(name: "h_rgb", scope: !3, file: !3, line: 30, type: !53, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !12, !12}
!55 = !DILocalVariable(name: "x", arg: 1, scope: !52, file: !3, line: 30, type: !12)
!56 = !DILocation(line: 0, scope: !52)
!57 = !DILocalVariable(name: "y", arg: 2, scope: !52, file: !3, line: 30, type: !12)
!58 = !DILocation(line: 32, column: 12, scope: !52)
!59 = !DILocalVariable(name: "p", scope: !52, file: !3, line: 32, type: !24)
!60 = !DILocation(line: 35, column: 19, scope: !52)
!61 = !DILocation(line: 35, column: 17, scope: !52)
!62 = !DILocation(line: 35, column: 26, scope: !52)
!63 = !DILocation(line: 35, column: 24, scope: !52)
!64 = !DILocalVariable(name: "h", scope: !52, file: !3, line: 35, type: !8)
!65 = !DILocation(line: 36, column: 46, scope: !52)
!66 = !DILocation(line: 36, column: 44, scope: !52)
!67 = !DILocation(line: 36, column: 53, scope: !52)
!68 = !DILocation(line: 36, column: 51, scope: !52)
!69 = !DILocation(line: 36, column: 20, scope: !52)
!70 = !DILocation(line: 36, column: 60, scope: !52)
!71 = !DILocation(line: 36, column: 65, scope: !52)
!72 = !DILocation(line: 36, column: 17, scope: !52)
!73 = !DILocalVariable(name: "VAL", scope: !52, file: !3, line: 36, type: !8)
!74 = !DILocation(line: 37, column: 17, scope: !52)
!75 = !DILocalVariable(name: "c", scope: !52, file: !3, line: 37, type: !8)
!76 = !DILocation(line: 38, column: 27, scope: !52)
!77 = !DILocation(line: 38, column: 38, scope: !52)
!78 = !DILocation(line: 38, column: 22, scope: !52)
!79 = !DILocation(line: 38, column: 20, scope: !52)
!80 = !DILocation(line: 38, column: 15, scope: !52)
!81 = !DILocalVariable(name: "X", scope: !52, file: !3, line: 38, type: !8)
!82 = !DILocation(line: 40, column: 9, scope: !52)
!83 = !DILocation(line: 40, column: 2, scope: !52)
!84 = !DILocation(line: 41, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !52, file: !3, line: 40, column: 17)
!86 = !DILocation(line: 41, column: 15, scope: !85)
!87 = !DILocation(line: 41, column: 24, scope: !85)
!88 = !DILocation(line: 41, column: 26, scope: !85)
!89 = !DILocation(line: 41, column: 32, scope: !85)
!90 = !DILocation(line: 42, column: 13, scope: !85)
!91 = !DILocation(line: 42, column: 15, scope: !85)
!92 = !DILocation(line: 42, column: 24, scope: !85)
!93 = !DILocation(line: 42, column: 26, scope: !85)
!94 = !DILocation(line: 42, column: 32, scope: !85)
!95 = !DILocation(line: 43, column: 13, scope: !85)
!96 = !DILocation(line: 43, column: 15, scope: !85)
!97 = !DILocation(line: 43, column: 24, scope: !85)
!98 = !DILocation(line: 43, column: 26, scope: !85)
!99 = !DILocation(line: 43, column: 32, scope: !85)
!100 = !DILocation(line: 44, column: 13, scope: !85)
!101 = !DILocation(line: 44, column: 15, scope: !85)
!102 = !DILocation(line: 44, column: 24, scope: !85)
!103 = !DILocation(line: 44, column: 26, scope: !85)
!104 = !DILocation(line: 44, column: 32, scope: !85)
!105 = !DILocation(line: 45, column: 13, scope: !85)
!106 = !DILocation(line: 45, column: 15, scope: !85)
!107 = !DILocation(line: 45, column: 24, scope: !85)
!108 = !DILocation(line: 45, column: 26, scope: !85)
!109 = !DILocation(line: 45, column: 32, scope: !85)
!110 = !DILocation(line: 47, column: 6, scope: !85)
!111 = !DILocation(line: 47, column: 8, scope: !85)
!112 = !DILocation(line: 47, column: 17, scope: !85)
!113 = !DILocation(line: 47, column: 19, scope: !85)
!114 = !DILocation(line: 48, column: 2, scope: !85)
!115 = !DILocation(line: 49, column: 1, scope: !52)
!116 = distinct !DISubprogram(name: "iter_string", scope: !3, file: !3, line: 54, type: !117, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DISubroutineType(types: !118)
!118 = !{null, !119, !6}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !121)
!121 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!122 = !DILocalVariable(name: "str", arg: 1, scope: !116, file: !3, line: 54, type: !119)
!123 = !DILocation(line: 0, scope: !116)
!124 = !DILocalVariable(name: "d", arg: 2, scope: !116, file: !3, line: 54, type: !6)
!125 = !DILocation(line: 59, column: 2, scope: !116)
!126 = !DILocation(line: 59, column: 9, scope: !116)
!127 = !DILocation(line: 59, column: 14, scope: !116)
!128 = !DILocation(line: 60, column: 15, scope: !129)
!129 = distinct !DILexicalBlock(scope: !116, file: !3, line: 59, column: 23)
!130 = !DILocation(line: 60, column: 10, scope: !129)
!131 = !DILocation(line: 60, column: 3, scope: !129)
!132 = !DILocation(line: 61, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !3, line: 61, column: 17)
!134 = distinct !DILexicalBlock(scope: !129, file: !3, line: 60, column: 20)
!135 = !DILocation(line: 61, column: 17, scope: !134)
!136 = !DILocation(line: 61, column: 43, scope: !133)
!137 = !DILocation(line: 61, column: 20, scope: !133)
!138 = !DILocation(line: 61, column: 49, scope: !134)
!139 = !DILocation(line: 59, column: 10, scope: !116)
!140 = distinct !{!140, !125, !141}
!141 = !DILocation(line: 79, column: 2, scope: !116)
!142 = !DILocation(line: 62, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !134, file: !3, line: 62, column: 17)
!144 = !DILocation(line: 62, column: 17, scope: !134)
!145 = !DILocation(line: 62, column: 43, scope: !143)
!146 = !DILocation(line: 62, column: 20, scope: !143)
!147 = !DILocation(line: 62, column: 49, scope: !134)
!148 = !DILocation(line: 63, column: 13, scope: !134)
!149 = !DILocalVariable(name: "tmp", scope: !116, file: !3, line: 56, type: !150)
!150 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!151 = !DILocation(line: 63, column: 20, scope: !134)
!152 = !DILocation(line: 64, column: 13, scope: !134)
!153 = !DILocation(line: 64, column: 20, scope: !134)
!154 = !DILocation(line: 74, column: 10, scope: !134)
!155 = !DILocation(line: 75, column: 11, scope: !134)
!156 = !DILocation(line: 75, column: 13, scope: !134)
!157 = !DILocation(line: 75, column: 12, scope: !134)
!158 = !DILocation(line: 75, column: 20, scope: !134)
!159 = !DILocation(line: 75, column: 22, scope: !134)
!160 = !DILocation(line: 75, column: 21, scope: !134)
!161 = !DILocation(line: 75, column: 5, scope: !134)
!162 = !DILocation(line: 76, column: 10, scope: !134)
!163 = !DILocation(line: 76, column: 7, scope: !134)
!164 = !DILocation(line: 76, column: 19, scope: !134)
!165 = !DILocation(line: 76, column: 16, scope: !134)
!166 = !DILocation(line: 77, column: 5, scope: !134)
!167 = !DILocation(line: 80, column: 1, scope: !116)
!168 = distinct !DISubprogram(name: "dragon", scope: !3, file: !3, line: 82, type: !169, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!169 = !DISubroutineType(types: !170)
!170 = !{null, !150, !6}
!171 = !DILocalVariable(name: "leng", arg: 1, scope: !168, file: !3, line: 82, type: !150)
!172 = !DILocation(line: 0, scope: !168)
!173 = !DILocalVariable(name: "depth", arg: 2, scope: !168, file: !3, line: 82, type: !6)
!174 = !DILocation(line: 84, column: 19, scope: !168)
!175 = !DILocation(line: 84, column: 23, scope: !168)
!176 = !DILocalVariable(name: "d", scope: !168, file: !3, line: 84, type: !150)
!177 = !DILocation(line: 85, column: 16, scope: !168)
!178 = !DILocalVariable(name: "h", scope: !168, file: !3, line: 85, type: !150)
!179 = !DILocation(line: 85, column: 34, scope: !168)
!180 = !DILocation(line: 85, column: 38, scope: !168)
!181 = !DILocation(line: 85, column: 30, scope: !168)
!182 = !DILocation(line: 85, column: 42, scope: !168)
!183 = !DILocalVariable(name: "w", scope: !168, file: !3, line: 85, type: !150)
!184 = !DILocation(line: 88, column: 32, scope: !168)
!185 = !DILocation(line: 88, column: 36, scope: !168)
!186 = !DILocation(line: 88, column: 13, scope: !168)
!187 = !DILocalVariable(name: "buf", scope: !168, file: !3, line: 88, type: !24)
!188 = !DILocation(line: 89, column: 29, scope: !168)
!189 = !DILocation(line: 89, column: 8, scope: !168)
!190 = !DILocation(line: 89, column: 6, scope: !168)
!191 = !DILocalVariable(name: "i", scope: !168, file: !3, line: 84, type: !150)
!192 = !DILocation(line: 90, column: 7, scope: !193)
!193 = distinct !DILexicalBlock(scope: !168, file: !3, line: 90, column: 2)
!194 = !DILocation(line: 0, scope: !193)
!195 = !DILocation(line: 90, column: 16, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !3, line: 90, column: 2)
!197 = !DILocation(line: 90, column: 2, scope: !193)
!198 = !DILocation(line: 91, column: 20, scope: !196)
!199 = !DILocation(line: 91, column: 16, scope: !196)
!200 = !DILocation(line: 91, column: 3, scope: !196)
!201 = !DILocation(line: 91, column: 10, scope: !196)
!202 = !DILocation(line: 90, column: 22, scope: !196)
!203 = !DILocation(line: 90, column: 2, scope: !196)
!204 = distinct !{!204, !197, !205}
!205 = !DILocation(line: 91, column: 22, scope: !193)
!206 = !DILocation(line: 92, column: 2, scope: !168)
!207 = !DILocation(line: 92, column: 29, scope: !168)
!208 = !DILocation(line: 92, column: 33, scope: !168)
!209 = !DILocation(line: 95, column: 8, scope: !168)
!210 = !DILocation(line: 95, column: 4, scope: !168)
!211 = !DILocation(line: 95, column: 16, scope: !168)
!212 = !DILocation(line: 95, column: 27, scope: !168)
!213 = !DILocation(line: 95, column: 38, scope: !168)
!214 = !DILocation(line: 95, column: 48, scope: !168)
!215 = !DILocation(line: 96, column: 7, scope: !216)
!216 = distinct !DILexicalBlock(scope: !168, file: !3, line: 96, column: 2)
!217 = !DILocation(line: 0, scope: !216)
!218 = !DILocation(line: 96, column: 18, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !3, line: 96, column: 2)
!220 = !DILocation(line: 96, column: 16, scope: !219)
!221 = !DILocation(line: 96, column: 2, scope: !216)
!222 = !DILocation(line: 96, column: 30, scope: !219)
!223 = !DILocation(line: 96, column: 26, scope: !219)
!224 = !DILocation(line: 96, column: 2, scope: !219)
!225 = distinct !{!225, !221, !226}
!226 = !DILocation(line: 96, column: 36, scope: !216)
!227 = !DILocation(line: 97, column: 2, scope: !168)
!228 = !DILocation(line: 100, column: 33, scope: !168)
!229 = !DILocation(line: 100, column: 37, scope: !168)
!230 = !DILocation(line: 100, column: 24, scope: !168)
!231 = !DILocalVariable(name: "fpix", scope: !168, file: !3, line: 100, type: !232)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!234 = !DILocalVariable(name: "maxv", scope: !168, file: !3, line: 101, type: !8)
!235 = !DILocation(line: 101, column: 27, scope: !168)
!236 = !DILocalVariable(name: "dbuf", scope: !168, file: !3, line: 101, type: !7)
!237 = !DILocation(line: 108, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !168, file: !3, line: 108, column: 2)
!239 = !DILocation(line: 108, column: 17, scope: !238)
!240 = !DILocation(line: 108, column: 21, scope: !238)
!241 = !DILocation(line: 108, column: 7, scope: !238)
!242 = !DILocation(line: 0, scope: !238)
!243 = !DILocation(line: 108, column: 28, scope: !244)
!244 = distinct !DILexicalBlock(scope: !238, file: !3, line: 108, column: 2)
!245 = !DILocation(line: 108, column: 2, scope: !238)
!246 = !DILocation(line: 109, column: 7, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !3, line: 109, column: 7)
!248 = !DILocation(line: 109, column: 15, scope: !247)
!249 = !DILocation(line: 109, column: 7, scope: !244)
!250 = !DILocation(line: 109, column: 30, scope: !247)
!251 = !DILocation(line: 109, column: 23, scope: !247)
!252 = !DILocation(line: 109, column: 17, scope: !247)
!253 = !DILocation(line: 108, column: 35, scope: !244)
!254 = !DILocation(line: 108, column: 2, scope: !244)
!255 = distinct !{!255, !245, !256}
!256 = !DILocation(line: 109, column: 36, scope: !238)
!257 = !DILocation(line: 110, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !168, file: !3, line: 110, column: 2)
!259 = !DILocation(line: 110, column: 17, scope: !258)
!260 = !DILocation(line: 110, column: 21, scope: !258)
!261 = !DILocation(line: 110, column: 7, scope: !258)
!262 = !DILocation(line: 0, scope: !258)
!263 = !DILocation(line: 110, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !258, file: !3, line: 110, column: 2)
!265 = !DILocation(line: 110, column: 2, scope: !258)
!266 = !DILocation(line: 111, column: 19, scope: !264)
!267 = !DILocation(line: 111, column: 17, scope: !264)
!268 = !DILocation(line: 111, column: 27, scope: !264)
!269 = !DILocation(line: 111, column: 13, scope: !264)
!270 = !DILocation(line: 111, column: 3, scope: !264)
!271 = !DILocation(line: 111, column: 11, scope: !264)
!272 = !DILocation(line: 110, column: 35, scope: !264)
!273 = !DILocation(line: 110, column: 2, scope: !264)
!274 = distinct !{!274, !265, !275}
!275 = !DILocation(line: 111, column: 29, scope: !258)
!276 = !DILocation(line: 113, column: 2, scope: !168)
!277 = !DILocation(line: 114, column: 9, scope: !168)
!278 = !DILocation(line: 114, column: 2, scope: !168)
!279 = !DILocation(line: 115, column: 17, scope: !168)
!280 = !DILocation(line: 115, column: 21, scope: !168)
!281 = !DILocation(line: 115, column: 29, scope: !168)
!282 = !DILocation(line: 115, column: 2, scope: !168)
!283 = !DILocation(line: 116, column: 1, scope: !168)
!284 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 118, type: !285, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!285 = !DISubroutineType(types: !286)
!286 = !{!6, !6, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!289 = !DILocalVariable(name: "c", arg: 1, scope: !284, file: !3, line: 118, type: !6)
!290 = !DILocation(line: 0, scope: !284)
!291 = !DILocalVariable(name: "v", arg: 2, scope: !284, file: !3, line: 118, type: !287)
!292 = !DILocation(line: 122, column: 14, scope: !284)
!293 = !DILocation(line: 122, column: 11, scope: !284)
!294 = !DILocation(line: 122, column: 26, scope: !284)
!295 = !DILocation(line: 122, column: 21, scope: !284)
!296 = !DILocalVariable(name: "depth", scope: !284, file: !3, line: 120, type: !6)
!297 = !DILocation(line: 123, column: 11, scope: !284)
!298 = !DILocalVariable(name: "size", scope: !284, file: !3, line: 120, type: !6)
!299 = !DILocation(line: 125, column: 10, scope: !284)
!300 = !DILocation(line: 125, column: 2, scope: !284)
!301 = !DILocation(line: 126, column: 9, scope: !284)
!302 = !DILocation(line: 126, column: 21, scope: !284)
!303 = !DILocation(line: 126, column: 2, scope: !284)
!304 = !DILocation(line: 128, column: 2, scope: !284)
