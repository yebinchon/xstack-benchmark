; ModuleID = 'draw-a-clock.ll'
source_filename = "draw-a-clock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timeval = type { i64, i64 }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [12 x i8] c" .:-*ca&#%@\00", align 1
@shades = dso_local global i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@__const.draw.fade = private unnamed_addr constant [3 x double] [double 1.000000e+00, double 3.500000e-01, double 3.500000e-01], align 16
@.str.1 = private unnamed_addr constant [4 x i8] c"\1B[s\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"\1B[%d;0H\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"\1B[u\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local double @dist(double %x, double %y, double %x0, double %y0) #0 !dbg !19 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %x0.addr = alloca double, align 8
  %y0.addr = alloca double, align 8
  %l = alloca double, align 8
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store double %x0, double* %x0.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x0.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store double %y0, double* %y0.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y0.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata double* %l, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load double, double* %x.addr, align 8, !dbg !34
  %1 = load double, double* %x0.addr, align 8, !dbg !35
  %mul = fmul double %0, %1, !dbg !36
  %2 = load double, double* %y.addr, align 8, !dbg !37
  %3 = load double, double* %y0.addr, align 8, !dbg !38
  %mul1 = fmul double %2, %3, !dbg !39
  %add = fadd double %mul, %mul1, !dbg !40
  %4 = load double, double* %x0.addr, align 8, !dbg !41
  %5 = load double, double* %x0.addr, align 8, !dbg !42
  %mul2 = fmul double %4, %5, !dbg !43
  %6 = load double, double* %y0.addr, align 8, !dbg !44
  %7 = load double, double* %y0.addr, align 8, !dbg !45
  %mul3 = fmul double %6, %7, !dbg !46
  %add4 = fadd double %mul2, %mul3, !dbg !47
  %div = fdiv double %add, %add4, !dbg !48
  store double %div, double* %l, align 8, !dbg !33
  %8 = load double, double* %l, align 8, !dbg !49
  %cmp = fcmp ogt double %8, 1.000000e+00, !dbg !51
  br i1 %cmp, label %if.then, label %if.else, !dbg !52

if.then:                                          ; preds = %entry
  %9 = load double, double* %x0.addr, align 8, !dbg !53
  %10 = load double, double* %x.addr, align 8, !dbg !55
  %sub = fsub double %10, %9, !dbg !55
  store double %sub, double* %x.addr, align 8, !dbg !55
  %11 = load double, double* %y0.addr, align 8, !dbg !56
  %12 = load double, double* %y.addr, align 8, !dbg !57
  %sub5 = fsub double %12, %11, !dbg !57
  store double %sub5, double* %y.addr, align 8, !dbg !57
  br label %if.end12, !dbg !58

if.else:                                          ; preds = %entry
  %13 = load double, double* %l, align 8, !dbg !59
  %cmp6 = fcmp oge double %13, 0.000000e+00, !dbg !61
  br i1 %cmp6, label %if.then7, label %if.end, !dbg !62

if.then7:                                         ; preds = %if.else
  %14 = load double, double* %l, align 8, !dbg !63
  %15 = load double, double* %x0.addr, align 8, !dbg !65
  %mul8 = fmul double %14, %15, !dbg !66
  %16 = load double, double* %x.addr, align 8, !dbg !67
  %sub9 = fsub double %16, %mul8, !dbg !67
  store double %sub9, double* %x.addr, align 8, !dbg !67
  %17 = load double, double* %l, align 8, !dbg !68
  %18 = load double, double* %y0.addr, align 8, !dbg !69
  %mul10 = fmul double %17, %18, !dbg !70
  %19 = load double, double* %y.addr, align 8, !dbg !71
  %sub11 = fsub double %19, %mul10, !dbg !71
  store double %sub11, double* %y.addr, align 8, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then7, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  %20 = load double, double* %x.addr, align 8, !dbg !73
  %21 = load double, double* %x.addr, align 8, !dbg !74
  %mul13 = fmul double %20, %21, !dbg !75
  %22 = load double, double* %y.addr, align 8, !dbg !76
  %23 = load double, double* %y.addr, align 8, !dbg !77
  %mul14 = fmul double %22, %23, !dbg !78
  %add15 = fadd double %mul13, %mul14, !dbg !79
  %call = call double @sqrt(double %add15) #6, !dbg !80
  ret double %call, !dbg !81
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw(i32 %size) #0 !dbg !82 {
entry:
  %size.addr = alloca i32, align 4
  %angle = alloca double, align 8
  %cx = alloca double, align 8
  %sx = alloca [3 x double], align 16
  %sy = alloca [3 x double], align 16
  %sw = alloca [3 x double], align 16
  %fade = alloca [3 x double], align 16
  %tv = alloca %struct.timeval, align 8
  %t = alloca %struct.tm*, align 8
  %i = alloca i32, align 4
  %y = alloca double, align 8
  %j = alloca i32, align 4
  %x = alloca double, align 8
  %pix = alloca i32, align 4
  %k = alloca i32, align 4
  %d = alloca double, align 8
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata double* %angle, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata double* %cx, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = load i32, i32* %size.addr, align 4, !dbg !92
  %conv = sitofp i32 %0 to double, !dbg !92
  %div = fdiv double %conv, 2.000000e+00, !dbg !93
  store double %div, double* %cx, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [3 x double]* %sx, metadata !94, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [3 x double]* %sy, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [3 x double]* %sw, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [3 x double]* %fade, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = bitcast [3 x double]* %fade to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([3 x double]* @__const.draw.fade to i8*), i64 24, i1 false), !dbg !104
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !105, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %struct.tm** %t, metadata !116, metadata !DIExpression()), !dbg !132
  %2 = load i32, i32* %size.addr, align 4, !dbg !133
  %conv1 = sitofp i32 %2 to double, !dbg !133
  %mul = fmul double %conv1, 2.000000e-02, !dbg !134
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 0, !dbg !135
  store double %mul, double* %arrayidx, align 16, !dbg !136
  %3 = load i32, i32* %size.addr, align 4, !dbg !137
  %conv2 = sitofp i32 %3 to double, !dbg !137
  %mul3 = fmul double %conv2, 3.000000e-02, !dbg !138
  %arrayidx4 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 1, !dbg !139
  store double %mul3, double* %arrayidx4, align 8, !dbg !140
  %4 = load i32, i32* %size.addr, align 4, !dbg !141
  %conv5 = sitofp i32 %4 to double, !dbg !141
  %mul6 = fmul double %conv5, 5.000000e-02, !dbg !142
  %arrayidx7 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 2, !dbg !143
  store double %mul6, double* %arrayidx7, align 16, !dbg !144
  br label %every_second, !dbg !143

every_second:                                     ; preds = %for.end103, %entry
  call void @llvm.dbg.label(metadata !145), !dbg !146
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null) #6, !dbg !147
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !148
  %call8 = call %struct.tm* @localtime(i64* %tv_sec) #6, !dbg !149
  store %struct.tm* %call8, %struct.tm** %t, align 8, !dbg !150
  %5 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !151
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %5, i32 0, i32 0, !dbg !152
  %6 = load i32, i32* %tm_sec, align 8, !dbg !152
  %conv9 = sitofp i32 %6 to double, !dbg !151
  %mul10 = fmul double %conv9, 0x400921FB53C8D4F1, !dbg !153
  %div11 = fdiv double %mul10, 3.000000e+01, !dbg !154
  store double %div11, double* %angle, align 8, !dbg !155
  %7 = load double, double* %cx, align 8, !dbg !156
  %fneg = fneg double %7, !dbg !157
  %8 = load double, double* %angle, align 8, !dbg !158
  %call12 = call double @cos(double %8) #6, !dbg !159
  %mul13 = fmul double %fneg, %call12, !dbg !160
  %arrayidx14 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 0, !dbg !161
  store double %mul13, double* %arrayidx14, align 16, !dbg !162
  %9 = load double, double* %cx, align 8, !dbg !163
  %10 = load double, double* %angle, align 8, !dbg !164
  %call15 = call double @sin(double %10) #6, !dbg !165
  %mul16 = fmul double %9, %call15, !dbg !166
  %arrayidx17 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 0, !dbg !167
  store double %mul16, double* %arrayidx17, align 16, !dbg !168
  %11 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !169
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %11, i32 0, i32 1, !dbg !170
  %12 = load i32, i32* %tm_min, align 4, !dbg !170
  %conv18 = sitofp i32 %12 to double, !dbg !169
  %13 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !171
  %tm_sec19 = getelementptr inbounds %struct.tm, %struct.tm* %13, i32 0, i32 0, !dbg !172
  %14 = load i32, i32* %tm_sec19, align 8, !dbg !172
  %conv20 = sitofp i32 %14 to double, !dbg !171
  %div21 = fdiv double %conv20, 6.000000e+01, !dbg !173
  %add = fadd double %conv18, %div21, !dbg !174
  %div22 = fdiv double %add, 3.000000e+01, !dbg !175
  %mul23 = fmul double %div22, 0x400921FB53C8D4F1, !dbg !176
  store double %mul23, double* %angle, align 8, !dbg !177
  %15 = load double, double* %cx, align 8, !dbg !178
  %fneg24 = fneg double %15, !dbg !179
  %16 = load double, double* %angle, align 8, !dbg !180
  %call25 = call double @cos(double %16) #6, !dbg !181
  %mul26 = fmul double %fneg24, %call25, !dbg !182
  %mul27 = fmul double %mul26, 8.000000e-01, !dbg !183
  %arrayidx28 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 1, !dbg !184
  store double %mul27, double* %arrayidx28, align 8, !dbg !185
  %17 = load double, double* %cx, align 8, !dbg !186
  %18 = load double, double* %angle, align 8, !dbg !187
  %call29 = call double @sin(double %18) #6, !dbg !188
  %mul30 = fmul double %17, %call29, !dbg !189
  %mul31 = fmul double %mul30, 8.000000e-01, !dbg !190
  %arrayidx32 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 1, !dbg !191
  store double %mul31, double* %arrayidx32, align 8, !dbg !192
  %19 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !193
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %19, i32 0, i32 2, !dbg !194
  %20 = load i32, i32* %tm_hour, align 8, !dbg !194
  %conv33 = sitofp i32 %20 to double, !dbg !193
  %21 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !195
  %tm_min34 = getelementptr inbounds %struct.tm, %struct.tm* %21, i32 0, i32 1, !dbg !196
  %22 = load i32, i32* %tm_min34, align 4, !dbg !196
  %conv35 = sitofp i32 %22 to double, !dbg !195
  %div36 = fdiv double %conv35, 6.000000e+01, !dbg !197
  %add37 = fadd double %conv33, %div36, !dbg !198
  %div38 = fdiv double %add37, 6.000000e+00, !dbg !199
  %mul39 = fmul double %div38, 0x400921FB53C8D4F1, !dbg !200
  store double %mul39, double* %angle, align 8, !dbg !201
  %23 = load double, double* %cx, align 8, !dbg !202
  %fneg40 = fneg double %23, !dbg !203
  %24 = load double, double* %angle, align 8, !dbg !204
  %call41 = call double @cos(double %24) #6, !dbg !205
  %mul42 = fmul double %fneg40, %call41, !dbg !206
  %mul43 = fmul double %mul42, 6.000000e-01, !dbg !207
  %arrayidx44 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 2, !dbg !208
  store double %mul43, double* %arrayidx44, align 16, !dbg !209
  %25 = load double, double* %cx, align 8, !dbg !210
  %26 = load double, double* %angle, align 8, !dbg !211
  %call45 = call double @sin(double %26) #6, !dbg !212
  %mul46 = fmul double %25, %call45, !dbg !213
  %mul47 = fmul double %mul46, 6.000000e-01, !dbg !214
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 2, !dbg !215
  store double %mul47, double* %arrayidx48, align 16, !dbg !216
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %i, metadata !218, metadata !DIExpression()), !dbg !220
  store i32 0, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc101, %every_second
  %27 = load i32, i32* %i, align 4, !dbg !221
  %28 = load i32, i32* %size.addr, align 4, !dbg !221
  %cmp = icmp slt i32 %27, %28, !dbg !221
  br i1 %cmp, label %for.body, label %for.end103, !dbg !220

for.body:                                         ; preds = %for.cond
  %29 = load i32, i32* %i, align 4, !dbg !223
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %29), !dbg !225
  call void @llvm.dbg.declare(metadata double* %y, metadata !226, metadata !DIExpression()), !dbg !227
  %30 = load i32, i32* %i, align 4, !dbg !228
  %conv52 = sitofp i32 %30 to double, !dbg !228
  %31 = load double, double* %cx, align 8, !dbg !229
  %sub = fsub double %conv52, %31, !dbg !230
  store double %sub, double* %y, align 8, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %j, metadata !231, metadata !DIExpression()), !dbg !233
  store i32 0, i32* %j, align 4, !dbg !233
  br label %for.cond53, !dbg !233

for.cond53:                                       ; preds = %for.inc99, %for.body
  %32 = load i32, i32* %j, align 4, !dbg !234
  %33 = load i32, i32* %size.addr, align 4, !dbg !234
  %mul54 = mul nsw i32 %33, 2, !dbg !234
  %cmp55 = icmp slt i32 %32, %mul54, !dbg !234
  br i1 %cmp55, label %for.body57, label %for.end100, !dbg !233

for.body57:                                       ; preds = %for.cond53
  call void @llvm.dbg.declare(metadata double* %x, metadata !236, metadata !DIExpression()), !dbg !238
  %34 = load i32, i32* %j, align 4, !dbg !239
  %conv58 = sitofp i32 %34 to double, !dbg !239
  %35 = load double, double* %cx, align 8, !dbg !240
  %mul59 = fmul double 2.000000e+00, %35, !dbg !241
  %sub60 = fsub double %conv58, %mul59, !dbg !242
  %div61 = fdiv double %sub60, 2.000000e+00, !dbg !243
  store double %div61, double* %x, align 8, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %pix, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 0, i32* %pix, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %k, metadata !246, metadata !DIExpression()), !dbg !248
  store i32 2, i32* %k, align 4, !dbg !248
  br label %for.cond62, !dbg !249

for.cond62:                                       ; preds = %for.inc, %for.body57
  %36 = load i32, i32* %k, align 4, !dbg !250
  %cmp63 = icmp sge i32 %36, 0, !dbg !252
  br i1 %cmp63, label %for.body65, label %for.end, !dbg !253

for.body65:                                       ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata double* %d, metadata !254, metadata !DIExpression()), !dbg !256
  %37 = load double, double* %x, align 8, !dbg !257
  %38 = load double, double* %y, align 8, !dbg !258
  %39 = load i32, i32* %k, align 4, !dbg !259
  %idxprom = sext i32 %39 to i64, !dbg !260
  %arrayidx66 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 %idxprom, !dbg !260
  %40 = load double, double* %arrayidx66, align 8, !dbg !260
  %41 = load i32, i32* %k, align 4, !dbg !261
  %idxprom67 = sext i32 %41 to i64, !dbg !262
  %arrayidx68 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 %idxprom67, !dbg !262
  %42 = load double, double* %arrayidx68, align 8, !dbg !262
  %call69 = call double @dist(double %37, double %38, double %40, double %42), !dbg !263
  store double %call69, double* %d, align 8, !dbg !256
  %43 = load double, double* %d, align 8, !dbg !264
  %44 = load i32, i32* %k, align 4, !dbg !266
  %idxprom70 = sext i32 %44 to i64, !dbg !267
  %arrayidx71 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom70, !dbg !267
  %45 = load double, double* %arrayidx71, align 8, !dbg !267
  %sub72 = fsub double %45, 5.000000e-01, !dbg !268
  %cmp73 = fcmp olt double %43, %sub72, !dbg !269
  br i1 %cmp73, label %if.then, label %if.else, !dbg !270

if.then:                                          ; preds = %for.body65
  %46 = load i32, i32* %k, align 4, !dbg !271
  %idxprom75 = sext i32 %46 to i64, !dbg !272
  %arrayidx76 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom75, !dbg !272
  %47 = load double, double* %arrayidx76, align 8, !dbg !272
  %mul77 = fmul double 1.000000e+01, %47, !dbg !273
  %conv78 = fptosi double %mul77 to i32, !dbg !274
  store i32 %conv78, i32* %pix, align 4, !dbg !275
  br label %if.end94, !dbg !276

if.else:                                          ; preds = %for.body65
  %48 = load double, double* %d, align 8, !dbg !277
  %49 = load i32, i32* %k, align 4, !dbg !279
  %idxprom79 = sext i32 %49 to i64, !dbg !280
  %arrayidx80 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom79, !dbg !280
  %50 = load double, double* %arrayidx80, align 8, !dbg !280
  %add81 = fadd double %50, 5.000000e-01, !dbg !281
  %cmp82 = fcmp olt double %48, %add81, !dbg !282
  br i1 %cmp82, label %if.then84, label %if.end, !dbg !283

if.then84:                                        ; preds = %if.else
  %51 = load i32, i32* %k, align 4, !dbg !284
  %idxprom85 = sext i32 %51 to i64, !dbg !285
  %arrayidx86 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom85, !dbg !285
  %52 = load double, double* %arrayidx86, align 8, !dbg !285
  %53 = load double, double* %d, align 8, !dbg !286
  %sub87 = fsub double %52, %53, !dbg !287
  %mul88 = fmul double %sub87, 1.000000e+01, !dbg !288
  %add89 = fadd double 5.000000e+00, %mul88, !dbg !289
  %54 = load i32, i32* %k, align 4, !dbg !290
  %idxprom90 = sext i32 %54 to i64, !dbg !291
  %arrayidx91 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom90, !dbg !291
  %55 = load double, double* %arrayidx91, align 8, !dbg !291
  %mul92 = fmul double %add89, %55, !dbg !292
  %conv93 = fptosi double %mul92 to i32, !dbg !293
  store i32 %conv93, i32* %pix, align 4, !dbg !294
  br label %if.end, !dbg !295

if.end:                                           ; preds = %if.then84, %if.else
  br label %if.end94

if.end94:                                         ; preds = %if.end, %if.then
  br label %for.inc, !dbg !296

for.inc:                                          ; preds = %if.end94
  %56 = load i32, i32* %k, align 4, !dbg !297
  %dec = add nsw i32 %56, -1, !dbg !297
  store i32 %dec, i32* %k, align 4, !dbg !297
  br label %for.cond62, !dbg !298, !llvm.loop !299

for.end:                                          ; preds = %for.cond62
  %57 = load i8*, i8** @shades, align 8, !dbg !301
  %58 = load i32, i32* %pix, align 4, !dbg !302
  %idxprom95 = sext i32 %58 to i64, !dbg !301
  %arrayidx96 = getelementptr inbounds i8, i8* %57, i64 %idxprom95, !dbg !301
  %59 = load i8, i8* %arrayidx96, align 1, !dbg !301
  %conv97 = sext i8 %59 to i32, !dbg !301
  %call98 = call i32 @putchar(i32 %conv97), !dbg !303
  br label %for.inc99, !dbg !304

for.inc99:                                        ; preds = %for.end
  %60 = load i32, i32* %j, align 4, !dbg !234
  %inc = add nsw i32 %60, 1, !dbg !234
  store i32 %inc, i32* %j, align 4, !dbg !234
  br label %for.cond53, !dbg !234, !llvm.loop !305

for.end100:                                       ; preds = %for.cond53
  br label %for.inc101, !dbg !307

for.inc101:                                       ; preds = %for.end100
  %61 = load i32, i32* %i, align 4, !dbg !221
  %inc102 = add nsw i32 %61, 1, !dbg !221
  store i32 %inc102, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !221, !llvm.loop !308

for.end103:                                       ; preds = %for.cond
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !310
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !311
  %call105 = call i32 @fflush(%struct._IO_FILE* %62), !dbg !312
  %call106 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !313
  br label %every_second, !dbg !314
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, i8*) #2

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #2

; Function Attrs: nounwind
declare dso_local double @cos(double) #2

; Function Attrs: nounwind
declare dso_local double @sin(double) #2

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @putchar(i32) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

declare dso_local i32 @sleep(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !315 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %s = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !320, metadata !DIExpression()), !dbg !321
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !322, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.declare(metadata i32* %s, metadata !324, metadata !DIExpression()), !dbg !325
  %0 = load i32, i32* %argc.addr, align 4, !dbg !326
  %cmp = icmp sle i32 %0, 1, !dbg !328
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !329

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !330
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !330
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !330
  %call = call i32 @atoi(i8* %2) #7, !dbg !331
  store i32 %call, i32* %s, align 4, !dbg !332
  %cmp1 = icmp sle i32 %call, 0, !dbg !333
  br i1 %cmp1, label %if.then, label %if.end, !dbg !334

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 20, i32* %s, align 4, !dbg !335
  br label %if.end, !dbg !336

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* %s, align 4, !dbg !337
  call void @draw(i32 %3), !dbg !338
  ret i32 0, !dbg !339
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "shades", scope: !2, file: !3, line: 8, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "draw-a-clock.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Draw-a-clock")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 24, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10}
!8 = !DIEnumerator(name: "sec", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "min", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "hur", value: 2, isUnsigned: true)
!11 = !{!0}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!19 = distinct !DISubprogram(name: "dist", scope: !3, file: !3, line: 11, type: !20, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !22, !22, !22, !22}
!22 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!23 = !{}
!24 = !DILocalVariable(name: "x", arg: 1, scope: !19, file: !3, line: 11, type: !22)
!25 = !DILocation(line: 11, column: 20, scope: !19)
!26 = !DILocalVariable(name: "y", arg: 2, scope: !19, file: !3, line: 11, type: !22)
!27 = !DILocation(line: 11, column: 30, scope: !19)
!28 = !DILocalVariable(name: "x0", arg: 3, scope: !19, file: !3, line: 11, type: !22)
!29 = !DILocation(line: 11, column: 40, scope: !19)
!30 = !DILocalVariable(name: "y0", arg: 4, scope: !19, file: !3, line: 11, type: !22)
!31 = !DILocation(line: 11, column: 51, scope: !19)
!32 = !DILocalVariable(name: "l", scope: !19, file: !3, line: 12, type: !22)
!33 = !DILocation(line: 12, column: 9, scope: !19)
!34 = !DILocation(line: 12, column: 14, scope: !19)
!35 = !DILocation(line: 12, column: 18, scope: !19)
!36 = !DILocation(line: 12, column: 16, scope: !19)
!37 = !DILocation(line: 12, column: 23, scope: !19)
!38 = !DILocation(line: 12, column: 27, scope: !19)
!39 = !DILocation(line: 12, column: 25, scope: !19)
!40 = !DILocation(line: 12, column: 21, scope: !19)
!41 = !DILocation(line: 12, column: 34, scope: !19)
!42 = !DILocation(line: 12, column: 39, scope: !19)
!43 = !DILocation(line: 12, column: 37, scope: !19)
!44 = !DILocation(line: 12, column: 44, scope: !19)
!45 = !DILocation(line: 12, column: 49, scope: !19)
!46 = !DILocation(line: 12, column: 47, scope: !19)
!47 = !DILocation(line: 12, column: 42, scope: !19)
!48 = !DILocation(line: 12, column: 31, scope: !19)
!49 = !DILocation(line: 14, column: 6, scope: !50)
!50 = distinct !DILexicalBlock(scope: !19, file: !3, line: 14, column: 6)
!51 = !DILocation(line: 14, column: 8, scope: !50)
!52 = !DILocation(line: 14, column: 6, scope: !19)
!53 = !DILocation(line: 15, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 14, column: 13)
!55 = !DILocation(line: 15, column: 5, scope: !54)
!56 = !DILocation(line: 16, column: 8, scope: !54)
!57 = !DILocation(line: 16, column: 5, scope: !54)
!58 = !DILocation(line: 17, column: 2, scope: !54)
!59 = !DILocation(line: 17, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !50, file: !3, line: 17, column: 13)
!61 = !DILocation(line: 17, column: 15, scope: !60)
!62 = !DILocation(line: 17, column: 13, scope: !50)
!63 = !DILocation(line: 18, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !3, line: 17, column: 21)
!65 = !DILocation(line: 18, column: 12, scope: !64)
!66 = !DILocation(line: 18, column: 10, scope: !64)
!67 = !DILocation(line: 18, column: 5, scope: !64)
!68 = !DILocation(line: 19, column: 8, scope: !64)
!69 = !DILocation(line: 19, column: 12, scope: !64)
!70 = !DILocation(line: 19, column: 10, scope: !64)
!71 = !DILocation(line: 19, column: 5, scope: !64)
!72 = !DILocation(line: 20, column: 2, scope: !64)
!73 = !DILocation(line: 21, column: 14, scope: !19)
!74 = !DILocation(line: 21, column: 18, scope: !19)
!75 = !DILocation(line: 21, column: 16, scope: !19)
!76 = !DILocation(line: 21, column: 22, scope: !19)
!77 = !DILocation(line: 21, column: 26, scope: !19)
!78 = !DILocation(line: 21, column: 24, scope: !19)
!79 = !DILocation(line: 21, column: 20, scope: !19)
!80 = !DILocation(line: 21, column: 9, scope: !19)
!81 = !DILocation(line: 21, column: 2, scope: !19)
!82 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 26, type: !83, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!83 = !DISubroutineType(types: !84)
!84 = !{null, !85}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DILocalVariable(name: "size", arg: 1, scope: !82, file: !3, line: 26, type: !85)
!87 = !DILocation(line: 26, column: 15, scope: !82)
!88 = !DILocalVariable(name: "angle", scope: !82, file: !3, line: 31, type: !22)
!89 = !DILocation(line: 31, column: 9, scope: !82)
!90 = !DILocalVariable(name: "cx", scope: !82, file: !3, line: 31, type: !22)
!91 = !DILocation(line: 31, column: 16, scope: !82)
!92 = !DILocation(line: 31, column: 21, scope: !82)
!93 = !DILocation(line: 31, column: 26, scope: !82)
!94 = !DILocalVariable(name: "sx", scope: !82, file: !3, line: 32, type: !95)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 192, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 3)
!98 = !DILocation(line: 32, column: 9, scope: !82)
!99 = !DILocalVariable(name: "sy", scope: !82, file: !3, line: 32, type: !95)
!100 = !DILocation(line: 32, column: 16, scope: !82)
!101 = !DILocalVariable(name: "sw", scope: !82, file: !3, line: 32, type: !95)
!102 = !DILocation(line: 32, column: 23, scope: !82)
!103 = !DILocalVariable(name: "fade", scope: !82, file: !3, line: 33, type: !95)
!104 = !DILocation(line: 33, column: 9, scope: !82)
!105 = !DILocalVariable(name: "tv", scope: !82, file: !3, line: 34, type: !106)
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !107, line: 8, size: 128, elements: !108)
!107 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!108 = !{!109, !113}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !106, file: !107, line: 10, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !111, line: 160, baseType: !112)
!111 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!112 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !106, file: !107, line: 11, baseType: !114, size: 64, offset: 64)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !111, line: 162, baseType: !112)
!115 = !DILocation(line: 34, column: 17, scope: !82)
!116 = !DILocalVariable(name: "t", scope: !82, file: !3, line: 35, type: !117)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !119, line: 7, size: 448, elements: !120)
!119 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!120 = !{!121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !118, file: !119, line: 9, baseType: !85, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !118, file: !119, line: 10, baseType: !85, size: 32, offset: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !118, file: !119, line: 11, baseType: !85, size: 32, offset: 64)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !118, file: !119, line: 12, baseType: !85, size: 32, offset: 96)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !118, file: !119, line: 13, baseType: !85, size: 32, offset: 128)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !118, file: !119, line: 14, baseType: !85, size: 32, offset: 160)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !118, file: !119, line: 15, baseType: !85, size: 32, offset: 192)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !118, file: !119, line: 16, baseType: !85, size: 32, offset: 224)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !118, file: !119, line: 17, baseType: !85, size: 32, offset: 256)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !118, file: !119, line: 20, baseType: !112, size: 64, offset: 320)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !118, file: !119, line: 21, baseType: !12, size: 64, offset: 384)
!132 = !DILocation(line: 35, column: 13, scope: !82)
!133 = !DILocation(line: 38, column: 12, scope: !82)
!134 = !DILocation(line: 38, column: 17, scope: !82)
!135 = !DILocation(line: 38, column: 2, scope: !82)
!136 = !DILocation(line: 38, column: 10, scope: !82)
!137 = !DILocation(line: 39, column: 12, scope: !82)
!138 = !DILocation(line: 39, column: 17, scope: !82)
!139 = !DILocation(line: 39, column: 2, scope: !82)
!140 = !DILocation(line: 39, column: 10, scope: !82)
!141 = !DILocation(line: 40, column: 12, scope: !82)
!142 = !DILocation(line: 40, column: 17, scope: !82)
!143 = !DILocation(line: 40, column: 2, scope: !82)
!144 = !DILocation(line: 40, column: 10, scope: !82)
!145 = !DILabel(scope: !82, name: "every_second", file: !3, line: 42)
!146 = !DILocation(line: 42, column: 1, scope: !82)
!147 = !DILocation(line: 43, column: 2, scope: !82)
!148 = !DILocation(line: 44, column: 20, scope: !82)
!149 = !DILocation(line: 44, column: 6, scope: !82)
!150 = !DILocation(line: 44, column: 4, scope: !82)
!151 = !DILocation(line: 46, column: 10, scope: !82)
!152 = !DILocation(line: 46, column: 13, scope: !82)
!153 = !DILocation(line: 46, column: 20, scope: !82)
!154 = !DILocation(line: 46, column: 25, scope: !82)
!155 = !DILocation(line: 46, column: 8, scope: !82)
!156 = !DILocation(line: 47, column: 13, scope: !82)
!157 = !DILocation(line: 47, column: 12, scope: !82)
!158 = !DILocation(line: 47, column: 22, scope: !82)
!159 = !DILocation(line: 47, column: 18, scope: !82)
!160 = !DILocation(line: 47, column: 16, scope: !82)
!161 = !DILocation(line: 47, column: 2, scope: !82)
!162 = !DILocation(line: 47, column: 10, scope: !82)
!163 = !DILocation(line: 48, column: 13, scope: !82)
!164 = !DILocation(line: 48, column: 22, scope: !82)
!165 = !DILocation(line: 48, column: 18, scope: !82)
!166 = !DILocation(line: 48, column: 16, scope: !82)
!167 = !DILocation(line: 48, column: 2, scope: !82)
!168 = !DILocation(line: 48, column: 10, scope: !82)
!169 = !DILocation(line: 50, column: 11, scope: !82)
!170 = !DILocation(line: 50, column: 14, scope: !82)
!171 = !DILocation(line: 50, column: 23, scope: !82)
!172 = !DILocation(line: 50, column: 26, scope: !82)
!173 = !DILocation(line: 50, column: 33, scope: !82)
!174 = !DILocation(line: 50, column: 21, scope: !82)
!175 = !DILocation(line: 50, column: 40, scope: !82)
!176 = !DILocation(line: 50, column: 45, scope: !82)
!177 = !DILocation(line: 50, column: 8, scope: !82)
!178 = !DILocation(line: 51, column: 13, scope: !82)
!179 = !DILocation(line: 51, column: 12, scope: !82)
!180 = !DILocation(line: 51, column: 22, scope: !82)
!181 = !DILocation(line: 51, column: 18, scope: !82)
!182 = !DILocation(line: 51, column: 16, scope: !82)
!183 = !DILocation(line: 51, column: 29, scope: !82)
!184 = !DILocation(line: 51, column: 2, scope: !82)
!185 = !DILocation(line: 51, column: 10, scope: !82)
!186 = !DILocation(line: 52, column: 13, scope: !82)
!187 = !DILocation(line: 52, column: 22, scope: !82)
!188 = !DILocation(line: 52, column: 18, scope: !82)
!189 = !DILocation(line: 52, column: 16, scope: !82)
!190 = !DILocation(line: 52, column: 29, scope: !82)
!191 = !DILocation(line: 52, column: 2, scope: !82)
!192 = !DILocation(line: 52, column: 10, scope: !82)
!193 = !DILocation(line: 54, column: 11, scope: !82)
!194 = !DILocation(line: 54, column: 14, scope: !82)
!195 = !DILocation(line: 54, column: 24, scope: !82)
!196 = !DILocation(line: 54, column: 27, scope: !82)
!197 = !DILocation(line: 54, column: 34, scope: !82)
!198 = !DILocation(line: 54, column: 22, scope: !82)
!199 = !DILocation(line: 54, column: 41, scope: !82)
!200 = !DILocation(line: 54, column: 45, scope: !82)
!201 = !DILocation(line: 54, column: 8, scope: !82)
!202 = !DILocation(line: 55, column: 13, scope: !82)
!203 = !DILocation(line: 55, column: 12, scope: !82)
!204 = !DILocation(line: 55, column: 22, scope: !82)
!205 = !DILocation(line: 55, column: 18, scope: !82)
!206 = !DILocation(line: 55, column: 16, scope: !82)
!207 = !DILocation(line: 55, column: 29, scope: !82)
!208 = !DILocation(line: 55, column: 2, scope: !82)
!209 = !DILocation(line: 55, column: 10, scope: !82)
!210 = !DILocation(line: 56, column: 13, scope: !82)
!211 = !DILocation(line: 56, column: 22, scope: !82)
!212 = !DILocation(line: 56, column: 18, scope: !82)
!213 = !DILocation(line: 56, column: 16, scope: !82)
!214 = !DILocation(line: 56, column: 29, scope: !82)
!215 = !DILocation(line: 56, column: 2, scope: !82)
!216 = !DILocation(line: 56, column: 10, scope: !82)
!217 = !DILocation(line: 58, column: 2, scope: !82)
!218 = !DILocalVariable(name: "i", scope: !219, file: !3, line: 59, type: !85)
!219 = distinct !DILexicalBlock(scope: !82, file: !3, line: 59, column: 2)
!220 = !DILocation(line: 59, column: 2, scope: !219)
!221 = !DILocation(line: 59, column: 2, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !3, line: 59, column: 2)
!223 = !DILocation(line: 60, column: 24, scope: !224)
!224 = distinct !DILexicalBlock(scope: !222, file: !3, line: 59, column: 8)
!225 = !DILocation(line: 60, column: 3, scope: !224)
!226 = !DILocalVariable(name: "y", scope: !224, file: !3, line: 61, type: !22)
!227 = !DILocation(line: 61, column: 10, scope: !224)
!228 = !DILocation(line: 61, column: 14, scope: !224)
!229 = !DILocation(line: 61, column: 18, scope: !224)
!230 = !DILocation(line: 61, column: 16, scope: !224)
!231 = !DILocalVariable(name: "j", scope: !232, file: !3, line: 62, type: !85)
!232 = distinct !DILexicalBlock(scope: !224, file: !3, line: 62, column: 3)
!233 = !DILocation(line: 62, column: 3, scope: !232)
!234 = !DILocation(line: 62, column: 3, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !3, line: 62, column: 3)
!236 = !DILocalVariable(name: "x", scope: !237, file: !3, line: 63, type: !22)
!237 = distinct !DILexicalBlock(scope: !235, file: !3, line: 62, column: 9)
!238 = !DILocation(line: 63, column: 11, scope: !237)
!239 = !DILocation(line: 63, column: 16, scope: !237)
!240 = !DILocation(line: 63, column: 24, scope: !237)
!241 = !DILocation(line: 63, column: 22, scope: !237)
!242 = !DILocation(line: 63, column: 18, scope: !237)
!243 = !DILocation(line: 63, column: 28, scope: !237)
!244 = !DILocalVariable(name: "pix", scope: !237, file: !3, line: 65, type: !85)
!245 = !DILocation(line: 65, column: 8, scope: !237)
!246 = !DILocalVariable(name: "k", scope: !247, file: !3, line: 70, type: !85)
!247 = distinct !DILexicalBlock(scope: !237, file: !3, line: 70, column: 4)
!248 = !DILocation(line: 70, column: 13, scope: !247)
!249 = !DILocation(line: 70, column: 9, scope: !247)
!250 = !DILocation(line: 70, column: 22, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 70, column: 4)
!252 = !DILocation(line: 70, column: 24, scope: !251)
!253 = !DILocation(line: 70, column: 4, scope: !247)
!254 = !DILocalVariable(name: "d", scope: !255, file: !3, line: 71, type: !22)
!255 = distinct !DILexicalBlock(scope: !251, file: !3, line: 70, column: 37)
!256 = !DILocation(line: 71, column: 12, scope: !255)
!257 = !DILocation(line: 71, column: 21, scope: !255)
!258 = !DILocation(line: 71, column: 24, scope: !255)
!259 = !DILocation(line: 71, column: 30, scope: !255)
!260 = !DILocation(line: 71, column: 27, scope: !255)
!261 = !DILocation(line: 71, column: 37, scope: !255)
!262 = !DILocation(line: 71, column: 34, scope: !255)
!263 = !DILocation(line: 71, column: 16, scope: !255)
!264 = !DILocation(line: 72, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !255, file: !3, line: 72, column: 9)
!266 = !DILocation(line: 72, column: 16, scope: !265)
!267 = !DILocation(line: 72, column: 13, scope: !265)
!268 = !DILocation(line: 72, column: 19, scope: !265)
!269 = !DILocation(line: 72, column: 11, scope: !265)
!270 = !DILocation(line: 72, column: 9, scope: !255)
!271 = !DILocation(line: 73, column: 22, scope: !265)
!272 = !DILocation(line: 73, column: 17, scope: !265)
!273 = !DILocation(line: 73, column: 15, scope: !265)
!274 = !DILocation(line: 73, column: 12, scope: !265)
!275 = !DILocation(line: 73, column: 10, scope: !265)
!276 = !DILocation(line: 73, column: 6, scope: !265)
!277 = !DILocation(line: 74, column: 14, scope: !278)
!278 = distinct !DILexicalBlock(scope: !265, file: !3, line: 74, column: 14)
!279 = !DILocation(line: 74, column: 21, scope: !278)
!280 = !DILocation(line: 74, column: 18, scope: !278)
!281 = !DILocation(line: 74, column: 24, scope: !278)
!282 = !DILocation(line: 74, column: 16, scope: !278)
!283 = !DILocation(line: 74, column: 14, scope: !265)
!284 = !DILocation(line: 75, column: 21, scope: !278)
!285 = !DILocation(line: 75, column: 18, scope: !278)
!286 = !DILocation(line: 75, column: 26, scope: !278)
!287 = !DILocation(line: 75, column: 24, scope: !278)
!288 = !DILocation(line: 75, column: 29, scope: !278)
!289 = !DILocation(line: 75, column: 15, scope: !278)
!290 = !DILocation(line: 75, column: 42, scope: !278)
!291 = !DILocation(line: 75, column: 37, scope: !278)
!292 = !DILocation(line: 75, column: 35, scope: !278)
!293 = !DILocation(line: 75, column: 12, scope: !278)
!294 = !DILocation(line: 75, column: 10, scope: !278)
!295 = !DILocation(line: 75, column: 6, scope: !278)
!296 = !DILocation(line: 76, column: 4, scope: !255)
!297 = !DILocation(line: 70, column: 33, scope: !251)
!298 = !DILocation(line: 70, column: 4, scope: !251)
!299 = distinct !{!299, !253, !300}
!300 = !DILocation(line: 76, column: 4, scope: !247)
!301 = !DILocation(line: 77, column: 12, scope: !237)
!302 = !DILocation(line: 77, column: 19, scope: !237)
!303 = !DILocation(line: 77, column: 4, scope: !237)
!304 = !DILocation(line: 78, column: 3, scope: !237)
!305 = distinct !{!305, !233, !306}
!306 = !DILocation(line: 78, column: 3, scope: !232)
!307 = !DILocation(line: 79, column: 2, scope: !224)
!308 = distinct !{!308, !220, !309}
!309 = !DILocation(line: 79, column: 2, scope: !219)
!310 = !DILocation(line: 80, column: 2, scope: !82)
!311 = !DILocation(line: 82, column: 9, scope: !82)
!312 = !DILocation(line: 82, column: 2, scope: !82)
!313 = !DILocation(line: 83, column: 2, scope: !82)
!314 = !DILocation(line: 84, column: 2, scope: !82)
!315 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 87, type: !316, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!316 = !DISubroutineType(types: !317)
!317 = !{!85, !85, !318}
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!320 = !DILocalVariable(name: "argc", arg: 1, scope: !315, file: !3, line: 87, type: !85)
!321 = !DILocation(line: 87, column: 14, scope: !315)
!322 = !DILocalVariable(name: "argv", arg: 2, scope: !315, file: !3, line: 87, type: !318)
!323 = !DILocation(line: 87, column: 26, scope: !315)
!324 = !DILocalVariable(name: "s", scope: !315, file: !3, line: 89, type: !85)
!325 = !DILocation(line: 89, column: 6, scope: !315)
!326 = !DILocation(line: 90, column: 6, scope: !327)
!327 = distinct !DILexicalBlock(scope: !315, file: !3, line: 90, column: 6)
!328 = !DILocation(line: 90, column: 11, scope: !327)
!329 = !DILocation(line: 90, column: 16, scope: !327)
!330 = !DILocation(line: 90, column: 29, scope: !327)
!331 = !DILocation(line: 90, column: 24, scope: !327)
!332 = !DILocation(line: 90, column: 22, scope: !327)
!333 = !DILocation(line: 90, column: 39, scope: !327)
!334 = !DILocation(line: 90, column: 6, scope: !315)
!335 = !DILocation(line: 90, column: 47, scope: !327)
!336 = !DILocation(line: 90, column: 45, scope: !327)
!337 = !DILocation(line: 91, column: 7, scope: !315)
!338 = !DILocation(line: 91, column: 2, scope: !315)
!339 = !DILocation(line: 92, column: 2, scope: !315)
