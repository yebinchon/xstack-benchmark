; ModuleID = 'draw-a-clock.c'
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
  br i1 %cmp, label %if.then, label %if.else, !dbg !52, !cf.info !53

if.then:                                          ; preds = %entry
  %9 = load double, double* %x0.addr, align 8, !dbg !54
  %10 = load double, double* %x.addr, align 8, !dbg !56
  %sub = fsub double %10, %9, !dbg !56
  store double %sub, double* %x.addr, align 8, !dbg !56
  %11 = load double, double* %y0.addr, align 8, !dbg !57
  %12 = load double, double* %y.addr, align 8, !dbg !58
  %sub5 = fsub double %12, %11, !dbg !58
  store double %sub5, double* %y.addr, align 8, !dbg !58
  br label %if.end12, !dbg !59

if.else:                                          ; preds = %entry
  %13 = load double, double* %l, align 8, !dbg !60
  %cmp6 = fcmp oge double %13, 0.000000e+00, !dbg !62
  br i1 %cmp6, label %if.then7, label %if.end, !dbg !63, !cf.info !53

if.then7:                                         ; preds = %if.else
  %14 = load double, double* %l, align 8, !dbg !64
  %15 = load double, double* %x0.addr, align 8, !dbg !66
  %mul8 = fmul double %14, %15, !dbg !67
  %16 = load double, double* %x.addr, align 8, !dbg !68
  %sub9 = fsub double %16, %mul8, !dbg !68
  store double %sub9, double* %x.addr, align 8, !dbg !68
  %17 = load double, double* %l, align 8, !dbg !69
  %18 = load double, double* %y0.addr, align 8, !dbg !70
  %mul10 = fmul double %17, %18, !dbg !71
  %19 = load double, double* %y.addr, align 8, !dbg !72
  %sub11 = fsub double %19, %mul10, !dbg !72
  store double %sub11, double* %y.addr, align 8, !dbg !72
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then7, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  %20 = load double, double* %x.addr, align 8, !dbg !74
  %21 = load double, double* %x.addr, align 8, !dbg !75
  %mul13 = fmul double %20, %21, !dbg !76
  %22 = load double, double* %y.addr, align 8, !dbg !77
  %23 = load double, double* %y.addr, align 8, !dbg !78
  %mul14 = fmul double %22, %23, !dbg !79
  %add15 = fadd double %mul13, %mul14, !dbg !80
  %call = call double @sqrt(double %add15) #6, !dbg !81
  ret double %call, !dbg !82
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw(i32 %size) #0 !dbg !83 {
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
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata double* %angle, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata double* %cx, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = load i32, i32* %size.addr, align 4, !dbg !93
  %conv = sitofp i32 %0 to double, !dbg !93
  %div = fdiv double %conv, 2.000000e+00, !dbg !94
  store double %div, double* %cx, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [3 x double]* %sx, metadata !95, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [3 x double]* %sy, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [3 x double]* %sw, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [3 x double]* %fade, metadata !104, metadata !DIExpression()), !dbg !105
  %1 = bitcast [3 x double]* %fade to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([3 x double]* @__const.draw.fade to i8*), i64 24, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !106, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %struct.tm** %t, metadata !117, metadata !DIExpression()), !dbg !133
  %2 = load i32, i32* %size.addr, align 4, !dbg !134
  %conv1 = sitofp i32 %2 to double, !dbg !134
  %mul = fmul double %conv1, 2.000000e-02, !dbg !135
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 0, !dbg !136
  store double %mul, double* %arrayidx, align 16, !dbg !137
  %3 = load i32, i32* %size.addr, align 4, !dbg !138
  %conv2 = sitofp i32 %3 to double, !dbg !138
  %mul3 = fmul double %conv2, 3.000000e-02, !dbg !139
  %arrayidx4 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 1, !dbg !140
  store double %mul3, double* %arrayidx4, align 8, !dbg !141
  %4 = load i32, i32* %size.addr, align 4, !dbg !142
  %conv5 = sitofp i32 %4 to double, !dbg !142
  %mul6 = fmul double %conv5, 5.000000e-02, !dbg !143
  %arrayidx7 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 2, !dbg !144
  store double %mul6, double* %arrayidx7, align 16, !dbg !145
  br label %every_second, !dbg !144

every_second:                                     ; preds = %for.end103, %entry
  call void @llvm.dbg.label(metadata !146), !dbg !147
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null) #6, !dbg !148
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !149
  %call8 = call %struct.tm* @localtime(i64* %tv_sec) #6, !dbg !150
  store %struct.tm* %call8, %struct.tm** %t, align 8, !dbg !151
  %5 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !152
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %5, i32 0, i32 0, !dbg !153
  %6 = load i32, i32* %tm_sec, align 8, !dbg !153
  %conv9 = sitofp i32 %6 to double, !dbg !152
  %mul10 = fmul double %conv9, 0x400921FB53C8D4F1, !dbg !154
  %div11 = fdiv double %mul10, 3.000000e+01, !dbg !155
  store double %div11, double* %angle, align 8, !dbg !156
  %7 = load double, double* %cx, align 8, !dbg !157
  %fneg = fneg double %7, !dbg !158
  %8 = load double, double* %angle, align 8, !dbg !159
  %call12 = call double @cos(double %8) #6, !dbg !160
  %mul13 = fmul double %fneg, %call12, !dbg !161
  %arrayidx14 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 0, !dbg !162
  store double %mul13, double* %arrayidx14, align 16, !dbg !163
  %9 = load double, double* %cx, align 8, !dbg !164
  %10 = load double, double* %angle, align 8, !dbg !165
  %call15 = call double @sin(double %10) #6, !dbg !166
  %mul16 = fmul double %9, %call15, !dbg !167
  %arrayidx17 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 0, !dbg !168
  store double %mul16, double* %arrayidx17, align 16, !dbg !169
  %11 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !170
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %11, i32 0, i32 1, !dbg !171
  %12 = load i32, i32* %tm_min, align 4, !dbg !171
  %conv18 = sitofp i32 %12 to double, !dbg !170
  %13 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !172
  %tm_sec19 = getelementptr inbounds %struct.tm, %struct.tm* %13, i32 0, i32 0, !dbg !173
  %14 = load i32, i32* %tm_sec19, align 8, !dbg !173
  %conv20 = sitofp i32 %14 to double, !dbg !172
  %div21 = fdiv double %conv20, 6.000000e+01, !dbg !174
  %add = fadd double %conv18, %div21, !dbg !175
  %div22 = fdiv double %add, 3.000000e+01, !dbg !176
  %mul23 = fmul double %div22, 0x400921FB53C8D4F1, !dbg !177
  store double %mul23, double* %angle, align 8, !dbg !178
  %15 = load double, double* %cx, align 8, !dbg !179
  %fneg24 = fneg double %15, !dbg !180
  %16 = load double, double* %angle, align 8, !dbg !181
  %call25 = call double @cos(double %16) #6, !dbg !182
  %mul26 = fmul double %fneg24, %call25, !dbg !183
  %mul27 = fmul double %mul26, 8.000000e-01, !dbg !184
  %arrayidx28 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 1, !dbg !185
  store double %mul27, double* %arrayidx28, align 8, !dbg !186
  %17 = load double, double* %cx, align 8, !dbg !187
  %18 = load double, double* %angle, align 8, !dbg !188
  %call29 = call double @sin(double %18) #6, !dbg !189
  %mul30 = fmul double %17, %call29, !dbg !190
  %mul31 = fmul double %mul30, 8.000000e-01, !dbg !191
  %arrayidx32 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 1, !dbg !192
  store double %mul31, double* %arrayidx32, align 8, !dbg !193
  %19 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !194
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %19, i32 0, i32 2, !dbg !195
  %20 = load i32, i32* %tm_hour, align 8, !dbg !195
  %conv33 = sitofp i32 %20 to double, !dbg !194
  %21 = load %struct.tm*, %struct.tm** %t, align 8, !dbg !196
  %tm_min34 = getelementptr inbounds %struct.tm, %struct.tm* %21, i32 0, i32 1, !dbg !197
  %22 = load i32, i32* %tm_min34, align 4, !dbg !197
  %conv35 = sitofp i32 %22 to double, !dbg !196
  %div36 = fdiv double %conv35, 6.000000e+01, !dbg !198
  %add37 = fadd double %conv33, %div36, !dbg !199
  %div38 = fdiv double %add37, 6.000000e+00, !dbg !200
  %mul39 = fmul double %div38, 0x400921FB53C8D4F1, !dbg !201
  store double %mul39, double* %angle, align 8, !dbg !202
  %23 = load double, double* %cx, align 8, !dbg !203
  %fneg40 = fneg double %23, !dbg !204
  %24 = load double, double* %angle, align 8, !dbg !205
  %call41 = call double @cos(double %24) #6, !dbg !206
  %mul42 = fmul double %fneg40, %call41, !dbg !207
  %mul43 = fmul double %mul42, 6.000000e-01, !dbg !208
  %arrayidx44 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 2, !dbg !209
  store double %mul43, double* %arrayidx44, align 16, !dbg !210
  %25 = load double, double* %cx, align 8, !dbg !211
  %26 = load double, double* %angle, align 8, !dbg !212
  %call45 = call double @sin(double %26) #6, !dbg !213
  %mul46 = fmul double %25, %call45, !dbg !214
  %mul47 = fmul double %mul46, 6.000000e-01, !dbg !215
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 2, !dbg !216
  store double %mul47, double* %arrayidx48, align 16, !dbg !217
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !221
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !221

for.cond:                                         ; preds = %for.inc101, %every_second
  %27 = load i32, i32* %i, align 4, !dbg !222
  %28 = load i32, i32* %size.addr, align 4, !dbg !222
  %cmp = icmp slt i32 %27, %28, !dbg !222
  br i1 %cmp, label %for.body, label %for.end103, !dbg !221

for.body:                                         ; preds = %for.cond
  %29 = load i32, i32* %i, align 4, !dbg !224
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %29), !dbg !226
  call void @llvm.dbg.declare(metadata double* %y, metadata !227, metadata !DIExpression()), !dbg !228
  %30 = load i32, i32* %i, align 4, !dbg !229
  %conv52 = sitofp i32 %30 to double, !dbg !229
  %31 = load double, double* %cx, align 8, !dbg !230
  %sub = fsub double %conv52, %31, !dbg !231
  store double %sub, double* %y, align 8, !dbg !228
  call void @llvm.dbg.declare(metadata i32* %j, metadata !232, metadata !DIExpression()), !dbg !234
  store i32 0, i32* %j, align 4, !dbg !234
  br label %for.cond53, !dbg !234

for.cond53:                                       ; preds = %for.inc99, %for.body
  %32 = load i32, i32* %j, align 4, !dbg !235
  %33 = load i32, i32* %size.addr, align 4, !dbg !235
  %mul54 = mul nsw i32 %33, 2, !dbg !235
  %cmp55 = icmp slt i32 %32, %mul54, !dbg !235
  br i1 %cmp55, label %for.body57, label %for.end100, !dbg !234

for.body57:                                       ; preds = %for.cond53
  call void @llvm.dbg.declare(metadata double* %x, metadata !237, metadata !DIExpression()), !dbg !239
  %34 = load i32, i32* %j, align 4, !dbg !240
  %conv58 = sitofp i32 %34 to double, !dbg !240
  %35 = load double, double* %cx, align 8, !dbg !241
  %mul59 = fmul double 2.000000e+00, %35, !dbg !242
  %sub60 = fsub double %conv58, %mul59, !dbg !243
  %div61 = fdiv double %sub60, 2.000000e+00, !dbg !244
  store double %div61, double* %x, align 8, !dbg !239
  call void @llvm.dbg.declare(metadata i32* %pix, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 0, i32* %pix, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata i32* %k, metadata !247, metadata !DIExpression()), !dbg !249
  store i32 2, i32* %k, align 4, !dbg !249
  br label %for.cond62, !dbg !250

for.cond62:                                       ; preds = %for.inc, %for.body57
  %36 = load i32, i32* %k, align 4, !dbg !251
  %cmp63 = icmp sge i32 %36, 0, !dbg !253
  br i1 %cmp63, label %for.body65, label %for.end, !dbg !254

for.body65:                                       ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata double* %d, metadata !255, metadata !DIExpression()), !dbg !257
  %37 = load double, double* %x, align 8, !dbg !258
  %38 = load double, double* %y, align 8, !dbg !259
  %39 = load i32, i32* %k, align 4, !dbg !260
  %idxprom = sext i32 %39 to i64, !dbg !261
  %arrayidx66 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 %idxprom, !dbg !261
  %40 = load double, double* %arrayidx66, align 8, !dbg !261
  %41 = load i32, i32* %k, align 4, !dbg !262
  %idxprom67 = sext i32 %41 to i64, !dbg !263
  %arrayidx68 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 %idxprom67, !dbg !263
  %42 = load double, double* %arrayidx68, align 8, !dbg !263
  %call69 = call double @dist(double %37, double %38, double %40, double %42), !dbg !264
  store double %call69, double* %d, align 8, !dbg !257
  %43 = load double, double* %d, align 8, !dbg !265
  %44 = load i32, i32* %k, align 4, !dbg !267
  %idxprom70 = sext i32 %44 to i64, !dbg !268
  %arrayidx71 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom70, !dbg !268
  %45 = load double, double* %arrayidx71, align 8, !dbg !268
  %sub72 = fsub double %45, 5.000000e-01, !dbg !269
  %cmp73 = fcmp olt double %43, %sub72, !dbg !270
  br i1 %cmp73, label %if.then, label %if.else, !dbg !271, !cf.info !53

if.then:                                          ; preds = %for.body65
  %46 = load i32, i32* %k, align 4, !dbg !272
  %idxprom75 = sext i32 %46 to i64, !dbg !273
  %arrayidx76 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom75, !dbg !273
  %47 = load double, double* %arrayidx76, align 8, !dbg !273
  %mul77 = fmul double 1.000000e+01, %47, !dbg !274
  %conv78 = fptosi double %mul77 to i32, !dbg !275
  store i32 %conv78, i32* %pix, align 4, !dbg !276
  br label %if.end94, !dbg !277

if.else:                                          ; preds = %for.body65
  %48 = load double, double* %d, align 8, !dbg !278
  %49 = load i32, i32* %k, align 4, !dbg !280
  %idxprom79 = sext i32 %49 to i64, !dbg !281
  %arrayidx80 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom79, !dbg !281
  %50 = load double, double* %arrayidx80, align 8, !dbg !281
  %add81 = fadd double %50, 5.000000e-01, !dbg !282
  %cmp82 = fcmp olt double %48, %add81, !dbg !283
  br i1 %cmp82, label %if.then84, label %if.end, !dbg !284, !cf.info !53

if.then84:                                        ; preds = %if.else
  %51 = load i32, i32* %k, align 4, !dbg !285
  %idxprom85 = sext i32 %51 to i64, !dbg !286
  %arrayidx86 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom85, !dbg !286
  %52 = load double, double* %arrayidx86, align 8, !dbg !286
  %53 = load double, double* %d, align 8, !dbg !287
  %sub87 = fsub double %52, %53, !dbg !288
  %mul88 = fmul double %sub87, 1.000000e+01, !dbg !289
  %add89 = fadd double 5.000000e+00, %mul88, !dbg !290
  %54 = load i32, i32* %k, align 4, !dbg !291
  %idxprom90 = sext i32 %54 to i64, !dbg !292
  %arrayidx91 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom90, !dbg !292
  %55 = load double, double* %arrayidx91, align 8, !dbg !292
  %mul92 = fmul double %add89, %55, !dbg !293
  %conv93 = fptosi double %mul92 to i32, !dbg !294
  store i32 %conv93, i32* %pix, align 4, !dbg !295
  br label %if.end, !dbg !296

if.end:                                           ; preds = %if.then84, %if.else
  br label %if.end94

if.end94:                                         ; preds = %if.end, %if.then
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %if.end94
  %56 = load i32, i32* %k, align 4, !dbg !298
  %dec = add nsw i32 %56, -1, !dbg !298
  store i32 %dec, i32* %k, align 4, !dbg !298
  br label %for.cond62, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond62
  %57 = load i8*, i8** @shades, align 8, !dbg !302
  %58 = load i32, i32* %pix, align 4, !dbg !303
  %idxprom95 = sext i32 %58 to i64, !dbg !302
  %arrayidx96 = getelementptr inbounds i8, i8* %57, i64 %idxprom95, !dbg !302
  %59 = load i8, i8* %arrayidx96, align 1, !dbg !302
  %conv97 = sext i8 %59 to i32, !dbg !302
  %call98 = call i32 @putchar(i32 %conv97), !dbg !304
  br label %for.inc99, !dbg !305

for.inc99:                                        ; preds = %for.end
  %60 = load i32, i32* %j, align 4, !dbg !235
  %inc = add nsw i32 %60, 1, !dbg !235
  store i32 %inc, i32* %j, align 4, !dbg !235
  br label %for.cond53, !dbg !235, !llvm.loop !306

for.end100:                                       ; preds = %for.cond53
  br label %for.inc101, !dbg !308

for.inc101:                                       ; preds = %for.end100
  %61 = load i32, i32* %i, align 4, !dbg !222
  %inc102 = add nsw i32 %61, 1, !dbg !222
  store i32 %inc102, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !222, !llvm.loop !309

for.end103:                                       ; preds = %for.cond
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !311
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !312
  %call105 = call i32 @fflush(%struct._IO_FILE* %62), !dbg !313
  %call106 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !314
  br label %every_second, !dbg !315
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
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !316 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %s = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !321, metadata !DIExpression()), !dbg !322
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata i32* %s, metadata !325, metadata !DIExpression()), !dbg !326
  %0 = load i32, i32* %argc.addr, align 4, !dbg !327
  %cmp = icmp sle i32 %0, 1, !dbg !329
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !330, !cf.info !53

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !331
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !331
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !331
  %call = call i32 @atoi(i8* %2) #7, !dbg !332
  store i32 %call, i32* %s, align 4, !dbg !333
  %cmp1 = icmp sle i32 %call, 0, !dbg !334
  br i1 %cmp1, label %if.then, label %if.end, !dbg !335, !cf.info !53

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 20, i32* %s, align 4, !dbg !336
  br label %if.end, !dbg !337

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* %s, align 4, !dbg !338
  call void @draw(i32 %3), !dbg !339
  ret i32 0, !dbg !340
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !11, splitDebugInlining: false, nameTableKind: None)
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
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!53 = !{!"if"}
!54 = !DILocation(line: 15, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !3, line: 14, column: 13)
!56 = !DILocation(line: 15, column: 5, scope: !55)
!57 = !DILocation(line: 16, column: 8, scope: !55)
!58 = !DILocation(line: 16, column: 5, scope: !55)
!59 = !DILocation(line: 17, column: 2, scope: !55)
!60 = !DILocation(line: 17, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !50, file: !3, line: 17, column: 13)
!62 = !DILocation(line: 17, column: 15, scope: !61)
!63 = !DILocation(line: 17, column: 13, scope: !50)
!64 = !DILocation(line: 18, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !3, line: 17, column: 21)
!66 = !DILocation(line: 18, column: 12, scope: !65)
!67 = !DILocation(line: 18, column: 10, scope: !65)
!68 = !DILocation(line: 18, column: 5, scope: !65)
!69 = !DILocation(line: 19, column: 8, scope: !65)
!70 = !DILocation(line: 19, column: 12, scope: !65)
!71 = !DILocation(line: 19, column: 10, scope: !65)
!72 = !DILocation(line: 19, column: 5, scope: !65)
!73 = !DILocation(line: 20, column: 2, scope: !65)
!74 = !DILocation(line: 21, column: 14, scope: !19)
!75 = !DILocation(line: 21, column: 18, scope: !19)
!76 = !DILocation(line: 21, column: 16, scope: !19)
!77 = !DILocation(line: 21, column: 22, scope: !19)
!78 = !DILocation(line: 21, column: 26, scope: !19)
!79 = !DILocation(line: 21, column: 24, scope: !19)
!80 = !DILocation(line: 21, column: 20, scope: !19)
!81 = !DILocation(line: 21, column: 9, scope: !19)
!82 = !DILocation(line: 21, column: 2, scope: !19)
!83 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 26, type: !84, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!84 = !DISubroutineType(types: !85)
!85 = !{null, !86}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DILocalVariable(name: "size", arg: 1, scope: !83, file: !3, line: 26, type: !86)
!88 = !DILocation(line: 26, column: 15, scope: !83)
!89 = !DILocalVariable(name: "angle", scope: !83, file: !3, line: 31, type: !22)
!90 = !DILocation(line: 31, column: 9, scope: !83)
!91 = !DILocalVariable(name: "cx", scope: !83, file: !3, line: 31, type: !22)
!92 = !DILocation(line: 31, column: 16, scope: !83)
!93 = !DILocation(line: 31, column: 21, scope: !83)
!94 = !DILocation(line: 31, column: 26, scope: !83)
!95 = !DILocalVariable(name: "sx", scope: !83, file: !3, line: 32, type: !96)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 192, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 3)
!99 = !DILocation(line: 32, column: 9, scope: !83)
!100 = !DILocalVariable(name: "sy", scope: !83, file: !3, line: 32, type: !96)
!101 = !DILocation(line: 32, column: 16, scope: !83)
!102 = !DILocalVariable(name: "sw", scope: !83, file: !3, line: 32, type: !96)
!103 = !DILocation(line: 32, column: 23, scope: !83)
!104 = !DILocalVariable(name: "fade", scope: !83, file: !3, line: 33, type: !96)
!105 = !DILocation(line: 33, column: 9, scope: !83)
!106 = !DILocalVariable(name: "tv", scope: !83, file: !3, line: 34, type: !107)
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !108, line: 8, size: 128, elements: !109)
!108 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!109 = !{!110, !114}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !107, file: !108, line: 10, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !112, line: 160, baseType: !113)
!112 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!113 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !107, file: !108, line: 11, baseType: !115, size: 64, offset: 64)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !112, line: 162, baseType: !113)
!116 = !DILocation(line: 34, column: 17, scope: !83)
!117 = !DILocalVariable(name: "t", scope: !83, file: !3, line: 35, type: !118)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !120, line: 7, size: 448, elements: !121)
!120 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!121 = !{!122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !119, file: !120, line: 9, baseType: !86, size: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !119, file: !120, line: 10, baseType: !86, size: 32, offset: 32)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !119, file: !120, line: 11, baseType: !86, size: 32, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !119, file: !120, line: 12, baseType: !86, size: 32, offset: 96)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !119, file: !120, line: 13, baseType: !86, size: 32, offset: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !119, file: !120, line: 14, baseType: !86, size: 32, offset: 160)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !119, file: !120, line: 15, baseType: !86, size: 32, offset: 192)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !119, file: !120, line: 16, baseType: !86, size: 32, offset: 224)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !119, file: !120, line: 17, baseType: !86, size: 32, offset: 256)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !119, file: !120, line: 20, baseType: !113, size: 64, offset: 320)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !119, file: !120, line: 21, baseType: !12, size: 64, offset: 384)
!133 = !DILocation(line: 35, column: 13, scope: !83)
!134 = !DILocation(line: 38, column: 12, scope: !83)
!135 = !DILocation(line: 38, column: 17, scope: !83)
!136 = !DILocation(line: 38, column: 2, scope: !83)
!137 = !DILocation(line: 38, column: 10, scope: !83)
!138 = !DILocation(line: 39, column: 12, scope: !83)
!139 = !DILocation(line: 39, column: 17, scope: !83)
!140 = !DILocation(line: 39, column: 2, scope: !83)
!141 = !DILocation(line: 39, column: 10, scope: !83)
!142 = !DILocation(line: 40, column: 12, scope: !83)
!143 = !DILocation(line: 40, column: 17, scope: !83)
!144 = !DILocation(line: 40, column: 2, scope: !83)
!145 = !DILocation(line: 40, column: 10, scope: !83)
!146 = !DILabel(scope: !83, name: "every_second", file: !3, line: 42)
!147 = !DILocation(line: 42, column: 1, scope: !83)
!148 = !DILocation(line: 43, column: 2, scope: !83)
!149 = !DILocation(line: 44, column: 20, scope: !83)
!150 = !DILocation(line: 44, column: 6, scope: !83)
!151 = !DILocation(line: 44, column: 4, scope: !83)
!152 = !DILocation(line: 46, column: 10, scope: !83)
!153 = !DILocation(line: 46, column: 13, scope: !83)
!154 = !DILocation(line: 46, column: 20, scope: !83)
!155 = !DILocation(line: 46, column: 25, scope: !83)
!156 = !DILocation(line: 46, column: 8, scope: !83)
!157 = !DILocation(line: 47, column: 13, scope: !83)
!158 = !DILocation(line: 47, column: 12, scope: !83)
!159 = !DILocation(line: 47, column: 22, scope: !83)
!160 = !DILocation(line: 47, column: 18, scope: !83)
!161 = !DILocation(line: 47, column: 16, scope: !83)
!162 = !DILocation(line: 47, column: 2, scope: !83)
!163 = !DILocation(line: 47, column: 10, scope: !83)
!164 = !DILocation(line: 48, column: 13, scope: !83)
!165 = !DILocation(line: 48, column: 22, scope: !83)
!166 = !DILocation(line: 48, column: 18, scope: !83)
!167 = !DILocation(line: 48, column: 16, scope: !83)
!168 = !DILocation(line: 48, column: 2, scope: !83)
!169 = !DILocation(line: 48, column: 10, scope: !83)
!170 = !DILocation(line: 50, column: 11, scope: !83)
!171 = !DILocation(line: 50, column: 14, scope: !83)
!172 = !DILocation(line: 50, column: 23, scope: !83)
!173 = !DILocation(line: 50, column: 26, scope: !83)
!174 = !DILocation(line: 50, column: 33, scope: !83)
!175 = !DILocation(line: 50, column: 21, scope: !83)
!176 = !DILocation(line: 50, column: 40, scope: !83)
!177 = !DILocation(line: 50, column: 45, scope: !83)
!178 = !DILocation(line: 50, column: 8, scope: !83)
!179 = !DILocation(line: 51, column: 13, scope: !83)
!180 = !DILocation(line: 51, column: 12, scope: !83)
!181 = !DILocation(line: 51, column: 22, scope: !83)
!182 = !DILocation(line: 51, column: 18, scope: !83)
!183 = !DILocation(line: 51, column: 16, scope: !83)
!184 = !DILocation(line: 51, column: 29, scope: !83)
!185 = !DILocation(line: 51, column: 2, scope: !83)
!186 = !DILocation(line: 51, column: 10, scope: !83)
!187 = !DILocation(line: 52, column: 13, scope: !83)
!188 = !DILocation(line: 52, column: 22, scope: !83)
!189 = !DILocation(line: 52, column: 18, scope: !83)
!190 = !DILocation(line: 52, column: 16, scope: !83)
!191 = !DILocation(line: 52, column: 29, scope: !83)
!192 = !DILocation(line: 52, column: 2, scope: !83)
!193 = !DILocation(line: 52, column: 10, scope: !83)
!194 = !DILocation(line: 54, column: 11, scope: !83)
!195 = !DILocation(line: 54, column: 14, scope: !83)
!196 = !DILocation(line: 54, column: 24, scope: !83)
!197 = !DILocation(line: 54, column: 27, scope: !83)
!198 = !DILocation(line: 54, column: 34, scope: !83)
!199 = !DILocation(line: 54, column: 22, scope: !83)
!200 = !DILocation(line: 54, column: 41, scope: !83)
!201 = !DILocation(line: 54, column: 45, scope: !83)
!202 = !DILocation(line: 54, column: 8, scope: !83)
!203 = !DILocation(line: 55, column: 13, scope: !83)
!204 = !DILocation(line: 55, column: 12, scope: !83)
!205 = !DILocation(line: 55, column: 22, scope: !83)
!206 = !DILocation(line: 55, column: 18, scope: !83)
!207 = !DILocation(line: 55, column: 16, scope: !83)
!208 = !DILocation(line: 55, column: 29, scope: !83)
!209 = !DILocation(line: 55, column: 2, scope: !83)
!210 = !DILocation(line: 55, column: 10, scope: !83)
!211 = !DILocation(line: 56, column: 13, scope: !83)
!212 = !DILocation(line: 56, column: 22, scope: !83)
!213 = !DILocation(line: 56, column: 18, scope: !83)
!214 = !DILocation(line: 56, column: 16, scope: !83)
!215 = !DILocation(line: 56, column: 29, scope: !83)
!216 = !DILocation(line: 56, column: 2, scope: !83)
!217 = !DILocation(line: 56, column: 10, scope: !83)
!218 = !DILocation(line: 58, column: 2, scope: !83)
!219 = !DILocalVariable(name: "i", scope: !220, file: !3, line: 59, type: !86)
!220 = distinct !DILexicalBlock(scope: !83, file: !3, line: 59, column: 2)
!221 = !DILocation(line: 59, column: 2, scope: !220)
!222 = !DILocation(line: 59, column: 2, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !3, line: 59, column: 2)
!224 = !DILocation(line: 60, column: 24, scope: !225)
!225 = distinct !DILexicalBlock(scope: !223, file: !3, line: 59, column: 8)
!226 = !DILocation(line: 60, column: 3, scope: !225)
!227 = !DILocalVariable(name: "y", scope: !225, file: !3, line: 61, type: !22)
!228 = !DILocation(line: 61, column: 10, scope: !225)
!229 = !DILocation(line: 61, column: 14, scope: !225)
!230 = !DILocation(line: 61, column: 18, scope: !225)
!231 = !DILocation(line: 61, column: 16, scope: !225)
!232 = !DILocalVariable(name: "j", scope: !233, file: !3, line: 62, type: !86)
!233 = distinct !DILexicalBlock(scope: !225, file: !3, line: 62, column: 3)
!234 = !DILocation(line: 62, column: 3, scope: !233)
!235 = !DILocation(line: 62, column: 3, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !3, line: 62, column: 3)
!237 = !DILocalVariable(name: "x", scope: !238, file: !3, line: 63, type: !22)
!238 = distinct !DILexicalBlock(scope: !236, file: !3, line: 62, column: 9)
!239 = !DILocation(line: 63, column: 11, scope: !238)
!240 = !DILocation(line: 63, column: 16, scope: !238)
!241 = !DILocation(line: 63, column: 24, scope: !238)
!242 = !DILocation(line: 63, column: 22, scope: !238)
!243 = !DILocation(line: 63, column: 18, scope: !238)
!244 = !DILocation(line: 63, column: 28, scope: !238)
!245 = !DILocalVariable(name: "pix", scope: !238, file: !3, line: 65, type: !86)
!246 = !DILocation(line: 65, column: 8, scope: !238)
!247 = !DILocalVariable(name: "k", scope: !248, file: !3, line: 70, type: !86)
!248 = distinct !DILexicalBlock(scope: !238, file: !3, line: 70, column: 4)
!249 = !DILocation(line: 70, column: 13, scope: !248)
!250 = !DILocation(line: 70, column: 9, scope: !248)
!251 = !DILocation(line: 70, column: 22, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !3, line: 70, column: 4)
!253 = !DILocation(line: 70, column: 24, scope: !252)
!254 = !DILocation(line: 70, column: 4, scope: !248)
!255 = !DILocalVariable(name: "d", scope: !256, file: !3, line: 71, type: !22)
!256 = distinct !DILexicalBlock(scope: !252, file: !3, line: 70, column: 37)
!257 = !DILocation(line: 71, column: 12, scope: !256)
!258 = !DILocation(line: 71, column: 21, scope: !256)
!259 = !DILocation(line: 71, column: 24, scope: !256)
!260 = !DILocation(line: 71, column: 30, scope: !256)
!261 = !DILocation(line: 71, column: 27, scope: !256)
!262 = !DILocation(line: 71, column: 37, scope: !256)
!263 = !DILocation(line: 71, column: 34, scope: !256)
!264 = !DILocation(line: 71, column: 16, scope: !256)
!265 = !DILocation(line: 72, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !256, file: !3, line: 72, column: 9)
!267 = !DILocation(line: 72, column: 16, scope: !266)
!268 = !DILocation(line: 72, column: 13, scope: !266)
!269 = !DILocation(line: 72, column: 19, scope: !266)
!270 = !DILocation(line: 72, column: 11, scope: !266)
!271 = !DILocation(line: 72, column: 9, scope: !256)
!272 = !DILocation(line: 73, column: 22, scope: !266)
!273 = !DILocation(line: 73, column: 17, scope: !266)
!274 = !DILocation(line: 73, column: 15, scope: !266)
!275 = !DILocation(line: 73, column: 12, scope: !266)
!276 = !DILocation(line: 73, column: 10, scope: !266)
!277 = !DILocation(line: 73, column: 6, scope: !266)
!278 = !DILocation(line: 74, column: 14, scope: !279)
!279 = distinct !DILexicalBlock(scope: !266, file: !3, line: 74, column: 14)
!280 = !DILocation(line: 74, column: 21, scope: !279)
!281 = !DILocation(line: 74, column: 18, scope: !279)
!282 = !DILocation(line: 74, column: 24, scope: !279)
!283 = !DILocation(line: 74, column: 16, scope: !279)
!284 = !DILocation(line: 74, column: 14, scope: !266)
!285 = !DILocation(line: 75, column: 21, scope: !279)
!286 = !DILocation(line: 75, column: 18, scope: !279)
!287 = !DILocation(line: 75, column: 26, scope: !279)
!288 = !DILocation(line: 75, column: 24, scope: !279)
!289 = !DILocation(line: 75, column: 29, scope: !279)
!290 = !DILocation(line: 75, column: 15, scope: !279)
!291 = !DILocation(line: 75, column: 42, scope: !279)
!292 = !DILocation(line: 75, column: 37, scope: !279)
!293 = !DILocation(line: 75, column: 35, scope: !279)
!294 = !DILocation(line: 75, column: 12, scope: !279)
!295 = !DILocation(line: 75, column: 10, scope: !279)
!296 = !DILocation(line: 75, column: 6, scope: !279)
!297 = !DILocation(line: 76, column: 4, scope: !256)
!298 = !DILocation(line: 70, column: 33, scope: !252)
!299 = !DILocation(line: 70, column: 4, scope: !252)
!300 = distinct !{!300, !254, !301}
!301 = !DILocation(line: 76, column: 4, scope: !248)
!302 = !DILocation(line: 77, column: 12, scope: !238)
!303 = !DILocation(line: 77, column: 19, scope: !238)
!304 = !DILocation(line: 77, column: 4, scope: !238)
!305 = !DILocation(line: 78, column: 3, scope: !238)
!306 = distinct !{!306, !234, !307}
!307 = !DILocation(line: 78, column: 3, scope: !233)
!308 = !DILocation(line: 79, column: 2, scope: !225)
!309 = distinct !{!309, !221, !310}
!310 = !DILocation(line: 79, column: 2, scope: !220)
!311 = !DILocation(line: 80, column: 2, scope: !83)
!312 = !DILocation(line: 82, column: 9, scope: !83)
!313 = !DILocation(line: 82, column: 2, scope: !83)
!314 = !DILocation(line: 83, column: 2, scope: !83)
!315 = !DILocation(line: 84, column: 2, scope: !83)
!316 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 87, type: !317, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!317 = !DISubroutineType(types: !318)
!318 = !{!86, !86, !319}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!321 = !DILocalVariable(name: "argc", arg: 1, scope: !316, file: !3, line: 87, type: !86)
!322 = !DILocation(line: 87, column: 14, scope: !316)
!323 = !DILocalVariable(name: "argv", arg: 2, scope: !316, file: !3, line: 87, type: !319)
!324 = !DILocation(line: 87, column: 26, scope: !316)
!325 = !DILocalVariable(name: "s", scope: !316, file: !3, line: 89, type: !86)
!326 = !DILocation(line: 89, column: 6, scope: !316)
!327 = !DILocation(line: 90, column: 6, scope: !328)
!328 = distinct !DILexicalBlock(scope: !316, file: !3, line: 90, column: 6)
!329 = !DILocation(line: 90, column: 11, scope: !328)
!330 = !DILocation(line: 90, column: 16, scope: !328)
!331 = !DILocation(line: 90, column: 29, scope: !328)
!332 = !DILocation(line: 90, column: 24, scope: !328)
!333 = !DILocation(line: 90, column: 22, scope: !328)
!334 = !DILocation(line: 90, column: 39, scope: !328)
!335 = !DILocation(line: 90, column: 6, scope: !316)
!336 = !DILocation(line: 90, column: 47, scope: !328)
!337 = !DILocation(line: 90, column: 45, scope: !328)
!338 = !DILocation(line: 91, column: 7, scope: !316)
!339 = !DILocation(line: 91, column: 2, scope: !316)
!340 = !DILocation(line: 92, column: 2, scope: !316)
