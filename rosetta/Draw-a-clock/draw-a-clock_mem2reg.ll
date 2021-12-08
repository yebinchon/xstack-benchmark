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
  call void @llvm.dbg.value(metadata double %x, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata double %y, metadata !26, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata double %x0, metadata !27, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata double %y0, metadata !28, metadata !DIExpression()), !dbg !25
  %mul = fmul double %x, %x0, !dbg !29
  %mul1 = fmul double %y, %y0, !dbg !30
  %add = fadd double %mul, %mul1, !dbg !31
  %mul2 = fmul double %x0, %x0, !dbg !32
  %mul3 = fmul double %y0, %y0, !dbg !33
  %add4 = fadd double %mul2, %mul3, !dbg !34
  %div = fdiv double %add, %add4, !dbg !35
  call void @llvm.dbg.value(metadata double %div, metadata !36, metadata !DIExpression()), !dbg !25
  %cmp = fcmp ogt double %div, 1.000000e+00, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %sub = fsub double %x, %x0, !dbg !40
  call void @llvm.dbg.value(metadata double %sub, metadata !24, metadata !DIExpression()), !dbg !25
  %sub5 = fsub double %y, %y0, !dbg !42
  call void @llvm.dbg.value(metadata double %sub5, metadata !26, metadata !DIExpression()), !dbg !25
  br label %if.end12, !dbg !43

if.else:                                          ; preds = %entry
  %cmp6 = fcmp oge double %div, 0.000000e+00, !dbg !44
  br i1 %cmp6, label %if.then7, label %if.end, !dbg !46

if.then7:                                         ; preds = %if.else
  %mul8 = fmul double %div, %x0, !dbg !47
  %sub9 = fsub double %x, %mul8, !dbg !49
  call void @llvm.dbg.value(metadata double %sub9, metadata !24, metadata !DIExpression()), !dbg !25
  %mul10 = fmul double %div, %y0, !dbg !50
  %sub11 = fsub double %y, %mul10, !dbg !51
  call void @llvm.dbg.value(metadata double %sub11, metadata !26, metadata !DIExpression()), !dbg !25
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then7, %if.else
  %y.addr.0 = phi double [ %sub11, %if.then7 ], [ %y, %if.else ]
  %x.addr.0 = phi double [ %sub9, %if.then7 ], [ %x, %if.else ]
  call void @llvm.dbg.value(metadata double %x.addr.0, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata double %y.addr.0, metadata !26, metadata !DIExpression()), !dbg !25
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  %y.addr.1 = phi double [ %sub5, %if.then ], [ %y.addr.0, %if.end ], !dbg !53
  %x.addr.1 = phi double [ %sub, %if.then ], [ %x.addr.0, %if.end ], !dbg !53
  call void @llvm.dbg.value(metadata double %x.addr.1, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata double %y.addr.1, metadata !26, metadata !DIExpression()), !dbg !25
  %mul13 = fmul double %x.addr.1, %x.addr.1, !dbg !54
  %mul14 = fmul double %y.addr.1, %y.addr.1, !dbg !55
  %add15 = fadd double %mul13, %mul14, !dbg !56
  %call = call double @sqrt(double %add15) #6, !dbg !57
  ret double %call, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw(i32 %size) #0 !dbg !59 {
entry:
  %sx = alloca [3 x double], align 16
  %sy = alloca [3 x double], align 16
  %sw = alloca [3 x double], align 16
  %fade = alloca [3 x double], align 16
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %size, metadata !63, metadata !DIExpression()), !dbg !64
  %conv = sitofp i32 %size to double, !dbg !65
  %div = fdiv double %conv, 2.000000e+00, !dbg !66
  call void @llvm.dbg.value(metadata double %div, metadata !67, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [3 x double]* %sx, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [3 x double]* %sy, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [3 x double]* %sw, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [3 x double]* %fade, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = bitcast [3 x double]* %fade to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x double]* @__const.draw.fade to i8*), i64 24, i1 false), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !79, metadata !DIExpression()), !dbg !89
  %conv1 = sitofp i32 %size to double, !dbg !90
  %mul = fmul double %conv1, 2.000000e-02, !dbg !91
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 0, !dbg !92
  store double %mul, double* %arrayidx, align 16, !dbg !93
  %conv2 = sitofp i32 %size to double, !dbg !94
  %mul3 = fmul double %conv2, 3.000000e-02, !dbg !95
  %arrayidx4 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 1, !dbg !96
  store double %mul3, double* %arrayidx4, align 8, !dbg !97
  %conv5 = sitofp i32 %size to double, !dbg !98
  %mul6 = fmul double %conv5, 5.000000e-02, !dbg !99
  %arrayidx7 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 2, !dbg !100
  store double %mul6, double* %arrayidx7, align 16, !dbg !101
  br label %every_second, !dbg !100

every_second:                                     ; preds = %for.end103, %entry
  call void @llvm.dbg.label(metadata !102), !dbg !103
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null) #6, !dbg !104
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !105
  %call8 = call %struct.tm* @localtime(i64* %tv_sec) #6, !dbg !106
  call void @llvm.dbg.value(metadata %struct.tm* %call8, metadata !107, metadata !DIExpression()), !dbg !64
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %call8, i32 0, i32 0, !dbg !123
  %1 = load i32, i32* %tm_sec, align 8, !dbg !123
  %conv9 = sitofp i32 %1 to double, !dbg !124
  %mul10 = fmul double %conv9, 0x400921FB53C8D4F1, !dbg !125
  %div11 = fdiv double %mul10, 3.000000e+01, !dbg !126
  call void @llvm.dbg.value(metadata double %div11, metadata !127, metadata !DIExpression()), !dbg !64
  %fneg = fneg double %div, !dbg !128
  %call12 = call double @cos(double %div11) #6, !dbg !129
  %mul13 = fmul double %fneg, %call12, !dbg !130
  %arrayidx14 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 0, !dbg !131
  store double %mul13, double* %arrayidx14, align 16, !dbg !132
  %call15 = call double @sin(double %div11) #6, !dbg !133
  %mul16 = fmul double %div, %call15, !dbg !134
  %arrayidx17 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 0, !dbg !135
  store double %mul16, double* %arrayidx17, align 16, !dbg !136
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %call8, i32 0, i32 1, !dbg !137
  %2 = load i32, i32* %tm_min, align 4, !dbg !137
  %conv18 = sitofp i32 %2 to double, !dbg !138
  %tm_sec19 = getelementptr inbounds %struct.tm, %struct.tm* %call8, i32 0, i32 0, !dbg !139
  %3 = load i32, i32* %tm_sec19, align 8, !dbg !139
  %conv20 = sitofp i32 %3 to double, !dbg !140
  %div21 = fdiv double %conv20, 6.000000e+01, !dbg !141
  %add = fadd double %conv18, %div21, !dbg !142
  %div22 = fdiv double %add, 3.000000e+01, !dbg !143
  %mul23 = fmul double %div22, 0x400921FB53C8D4F1, !dbg !144
  call void @llvm.dbg.value(metadata double %mul23, metadata !127, metadata !DIExpression()), !dbg !64
  %fneg24 = fneg double %div, !dbg !145
  %call25 = call double @cos(double %mul23) #6, !dbg !146
  %mul26 = fmul double %fneg24, %call25, !dbg !147
  %mul27 = fmul double %mul26, 8.000000e-01, !dbg !148
  %arrayidx28 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 1, !dbg !149
  store double %mul27, double* %arrayidx28, align 8, !dbg !150
  %call29 = call double @sin(double %mul23) #6, !dbg !151
  %mul30 = fmul double %div, %call29, !dbg !152
  %mul31 = fmul double %mul30, 8.000000e-01, !dbg !153
  %arrayidx32 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 1, !dbg !154
  store double %mul31, double* %arrayidx32, align 8, !dbg !155
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %call8, i32 0, i32 2, !dbg !156
  %4 = load i32, i32* %tm_hour, align 8, !dbg !156
  %conv33 = sitofp i32 %4 to double, !dbg !157
  %tm_min34 = getelementptr inbounds %struct.tm, %struct.tm* %call8, i32 0, i32 1, !dbg !158
  %5 = load i32, i32* %tm_min34, align 4, !dbg !158
  %conv35 = sitofp i32 %5 to double, !dbg !159
  %div36 = fdiv double %conv35, 6.000000e+01, !dbg !160
  %add37 = fadd double %conv33, %div36, !dbg !161
  %div38 = fdiv double %add37, 6.000000e+00, !dbg !162
  %mul39 = fmul double %div38, 0x400921FB53C8D4F1, !dbg !163
  call void @llvm.dbg.value(metadata double %mul39, metadata !127, metadata !DIExpression()), !dbg !64
  %fneg40 = fneg double %div, !dbg !164
  %call41 = call double @cos(double %mul39) #6, !dbg !165
  %mul42 = fmul double %fneg40, %call41, !dbg !166
  %mul43 = fmul double %mul42, 6.000000e-01, !dbg !167
  %arrayidx44 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 2, !dbg !168
  store double %mul43, double* %arrayidx44, align 16, !dbg !169
  %call45 = call double @sin(double %mul39) #6, !dbg !170
  %mul46 = fmul double %div, %call45, !dbg !171
  %mul47 = fmul double %mul46, 6.000000e-01, !dbg !172
  %arrayidx48 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 2, !dbg !173
  store double %mul47, double* %arrayidx48, align 16, !dbg !174
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !175
  call void @llvm.dbg.value(metadata i32 0, metadata !176, metadata !DIExpression()), !dbg !178
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc101, %every_second
  %i.0 = phi i32 [ 0, %every_second ], [ %inc102, %for.inc101 ], !dbg !178
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !176, metadata !DIExpression()), !dbg !178
  %cmp = icmp slt i32 %i.0, %size, !dbg !180
  br i1 %cmp, label %for.body, label %for.end103, !dbg !179

for.body:                                         ; preds = %for.cond
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %i.0), !dbg !182
  %conv52 = sitofp i32 %i.0 to double, !dbg !184
  %sub = fsub double %conv52, %div, !dbg !185
  call void @llvm.dbg.value(metadata double %sub, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.value(metadata i32 0, metadata !188, metadata !DIExpression()), !dbg !190
  br label %for.cond53, !dbg !191

for.cond53:                                       ; preds = %for.inc99, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc99 ], !dbg !190
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !188, metadata !DIExpression()), !dbg !190
  %mul54 = mul nsw i32 %size, 2, !dbg !192
  %cmp55 = icmp slt i32 %j.0, %mul54, !dbg !192
  br i1 %cmp55, label %for.body57, label %for.end100, !dbg !191

for.body57:                                       ; preds = %for.cond53
  %conv58 = sitofp i32 %j.0 to double, !dbg !194
  %mul59 = fmul double 2.000000e+00, %div, !dbg !196
  %sub60 = fsub double %conv58, %mul59, !dbg !197
  %div61 = fdiv double %sub60, 2.000000e+00, !dbg !198
  call void @llvm.dbg.value(metadata double %div61, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 0, metadata !201, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.value(metadata i32 2, metadata !202, metadata !DIExpression()), !dbg !204
  br label %for.cond62, !dbg !205

for.cond62:                                       ; preds = %for.inc, %for.body57
  %pix.0 = phi i32 [ 0, %for.body57 ], [ %pix.2, %for.inc ], !dbg !200
  %k.0 = phi i32 [ 2, %for.body57 ], [ %dec, %for.inc ], !dbg !204
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !202, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i32 %pix.0, metadata !201, metadata !DIExpression()), !dbg !200
  %cmp63 = icmp sge i32 %k.0, 0, !dbg !206
  br i1 %cmp63, label %for.body65, label %for.end, !dbg !208

for.body65:                                       ; preds = %for.cond62
  %idxprom = sext i32 %k.0 to i64, !dbg !209
  %arrayidx66 = getelementptr inbounds [3 x double], [3 x double]* %sx, i64 0, i64 %idxprom, !dbg !209
  %6 = load double, double* %arrayidx66, align 8, !dbg !209
  %idxprom67 = sext i32 %k.0 to i64, !dbg !211
  %arrayidx68 = getelementptr inbounds [3 x double], [3 x double]* %sy, i64 0, i64 %idxprom67, !dbg !211
  %7 = load double, double* %arrayidx68, align 8, !dbg !211
  %call69 = call double @dist(double %div61, double %sub, double %6, double %7), !dbg !212
  call void @llvm.dbg.value(metadata double %call69, metadata !213, metadata !DIExpression()), !dbg !214
  %idxprom70 = sext i32 %k.0 to i64, !dbg !215
  %arrayidx71 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom70, !dbg !215
  %8 = load double, double* %arrayidx71, align 8, !dbg !215
  %sub72 = fsub double %8, 5.000000e-01, !dbg !217
  %cmp73 = fcmp olt double %call69, %sub72, !dbg !218
  br i1 %cmp73, label %if.then, label %if.else, !dbg !219

if.then:                                          ; preds = %for.body65
  %idxprom75 = sext i32 %k.0 to i64, !dbg !220
  %arrayidx76 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom75, !dbg !220
  %9 = load double, double* %arrayidx76, align 8, !dbg !220
  %mul77 = fmul double 1.000000e+01, %9, !dbg !221
  %conv78 = fptosi double %mul77 to i32, !dbg !222
  call void @llvm.dbg.value(metadata i32 %conv78, metadata !201, metadata !DIExpression()), !dbg !200
  br label %if.end94, !dbg !223

if.else:                                          ; preds = %for.body65
  %idxprom79 = sext i32 %k.0 to i64, !dbg !224
  %arrayidx80 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom79, !dbg !224
  %10 = load double, double* %arrayidx80, align 8, !dbg !224
  %add81 = fadd double %10, 5.000000e-01, !dbg !226
  %cmp82 = fcmp olt double %call69, %add81, !dbg !227
  br i1 %cmp82, label %if.then84, label %if.end, !dbg !228

if.then84:                                        ; preds = %if.else
  %idxprom85 = sext i32 %k.0 to i64, !dbg !229
  %arrayidx86 = getelementptr inbounds [3 x double], [3 x double]* %sw, i64 0, i64 %idxprom85, !dbg !229
  %11 = load double, double* %arrayidx86, align 8, !dbg !229
  %sub87 = fsub double %11, %call69, !dbg !230
  %mul88 = fmul double %sub87, 1.000000e+01, !dbg !231
  %add89 = fadd double 5.000000e+00, %mul88, !dbg !232
  %idxprom90 = sext i32 %k.0 to i64, !dbg !233
  %arrayidx91 = getelementptr inbounds [3 x double], [3 x double]* %fade, i64 0, i64 %idxprom90, !dbg !233
  %12 = load double, double* %arrayidx91, align 8, !dbg !233
  %mul92 = fmul double %add89, %12, !dbg !234
  %conv93 = fptosi double %mul92 to i32, !dbg !235
  call void @llvm.dbg.value(metadata i32 %conv93, metadata !201, metadata !DIExpression()), !dbg !200
  br label %if.end, !dbg !236

if.end:                                           ; preds = %if.then84, %if.else
  %pix.1 = phi i32 [ %conv93, %if.then84 ], [ %pix.0, %if.else ], !dbg !200
  call void @llvm.dbg.value(metadata i32 %pix.1, metadata !201, metadata !DIExpression()), !dbg !200
  br label %if.end94

if.end94:                                         ; preds = %if.end, %if.then
  %pix.2 = phi i32 [ %conv78, %if.then ], [ %pix.1, %if.end ], !dbg !237
  call void @llvm.dbg.value(metadata i32 %pix.2, metadata !201, metadata !DIExpression()), !dbg !200
  br label %for.inc, !dbg !238

for.inc:                                          ; preds = %if.end94
  %dec = add nsw i32 %k.0, -1, !dbg !239
  call void @llvm.dbg.value(metadata i32 %dec, metadata !202, metadata !DIExpression()), !dbg !204
  br label %for.cond62, !dbg !240, !llvm.loop !241

for.end:                                          ; preds = %for.cond62
  %13 = load i8*, i8** @shades, align 8, !dbg !243
  %idxprom95 = sext i32 %pix.0 to i64, !dbg !243
  %arrayidx96 = getelementptr inbounds i8, i8* %13, i64 %idxprom95, !dbg !243
  %14 = load i8, i8* %arrayidx96, align 1, !dbg !243
  %conv97 = sext i8 %14 to i32, !dbg !243
  %call98 = call i32 @putchar(i32 %conv97), !dbg !244
  br label %for.inc99, !dbg !245

for.inc99:                                        ; preds = %for.end
  %inc = add nsw i32 %j.0, 1, !dbg !192
  call void @llvm.dbg.value(metadata i32 %inc, metadata !188, metadata !DIExpression()), !dbg !190
  br label %for.cond53, !dbg !192, !llvm.loop !246

for.end100:                                       ; preds = %for.cond53
  br label %for.inc101, !dbg !248

for.inc101:                                       ; preds = %for.end100
  %inc102 = add nsw i32 %i.0, 1, !dbg !180
  call void @llvm.dbg.value(metadata i32 %inc102, metadata !176, metadata !DIExpression()), !dbg !178
  br label %for.cond, !dbg !180, !llvm.loop !249

for.end103:                                       ; preds = %for.cond
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !252
  %call105 = call i32 @fflush(%struct._IO_FILE* %15), !dbg !253
  %call106 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !254
  br label %every_second, !dbg !255
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
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !256 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !261, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.value(metadata i8** %argv, metadata !263, metadata !DIExpression()), !dbg !262
  %cmp = icmp sle i32 %argc, 1, !dbg !264
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !266

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !267
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !267
  %call = call i32 @atoi(i8* %0) #7, !dbg !268
  call void @llvm.dbg.value(metadata i32 %call, metadata !269, metadata !DIExpression()), !dbg !262
  %cmp1 = icmp sle i32 %call, 0, !dbg !270
  br i1 %cmp1, label %if.then, label %if.end, !dbg !271

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @llvm.dbg.value(metadata i32 20, metadata !269, metadata !DIExpression()), !dbg !262
  br label %if.end, !dbg !272

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %s.0 = phi i32 [ 20, %if.then ], [ %call, %lor.lhs.false ], !dbg !273
  call void @llvm.dbg.value(metadata i32 %s.0, metadata !269, metadata !DIExpression()), !dbg !262
  call void @draw(i32 %s.0), !dbg !274
  ret i32 0, !dbg !275
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

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
!25 = !DILocation(line: 0, scope: !19)
!26 = !DILocalVariable(name: "y", arg: 2, scope: !19, file: !3, line: 11, type: !22)
!27 = !DILocalVariable(name: "x0", arg: 3, scope: !19, file: !3, line: 11, type: !22)
!28 = !DILocalVariable(name: "y0", arg: 4, scope: !19, file: !3, line: 11, type: !22)
!29 = !DILocation(line: 12, column: 16, scope: !19)
!30 = !DILocation(line: 12, column: 25, scope: !19)
!31 = !DILocation(line: 12, column: 21, scope: !19)
!32 = !DILocation(line: 12, column: 37, scope: !19)
!33 = !DILocation(line: 12, column: 47, scope: !19)
!34 = !DILocation(line: 12, column: 42, scope: !19)
!35 = !DILocation(line: 12, column: 31, scope: !19)
!36 = !DILocalVariable(name: "l", scope: !19, file: !3, line: 12, type: !22)
!37 = !DILocation(line: 14, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !3, line: 14, column: 6)
!39 = !DILocation(line: 14, column: 6, scope: !19)
!40 = !DILocation(line: 15, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 14, column: 13)
!42 = !DILocation(line: 16, column: 5, scope: !41)
!43 = !DILocation(line: 17, column: 2, scope: !41)
!44 = !DILocation(line: 17, column: 15, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !3, line: 17, column: 13)
!46 = !DILocation(line: 17, column: 13, scope: !38)
!47 = !DILocation(line: 18, column: 10, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 17, column: 21)
!49 = !DILocation(line: 18, column: 5, scope: !48)
!50 = !DILocation(line: 19, column: 10, scope: !48)
!51 = !DILocation(line: 19, column: 5, scope: !48)
!52 = !DILocation(line: 20, column: 2, scope: !48)
!53 = !DILocation(line: 0, scope: !38)
!54 = !DILocation(line: 21, column: 16, scope: !19)
!55 = !DILocation(line: 21, column: 24, scope: !19)
!56 = !DILocation(line: 21, column: 20, scope: !19)
!57 = !DILocation(line: 21, column: 9, scope: !19)
!58 = !DILocation(line: 21, column: 2, scope: !19)
!59 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 26, type: !60, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !62}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DILocalVariable(name: "size", arg: 1, scope: !59, file: !3, line: 26, type: !62)
!64 = !DILocation(line: 0, scope: !59)
!65 = !DILocation(line: 31, column: 21, scope: !59)
!66 = !DILocation(line: 31, column: 26, scope: !59)
!67 = !DILocalVariable(name: "cx", scope: !59, file: !3, line: 31, type: !22)
!68 = !DILocalVariable(name: "sx", scope: !59, file: !3, line: 32, type: !69)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 192, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 3)
!72 = !DILocation(line: 32, column: 9, scope: !59)
!73 = !DILocalVariable(name: "sy", scope: !59, file: !3, line: 32, type: !69)
!74 = !DILocation(line: 32, column: 16, scope: !59)
!75 = !DILocalVariable(name: "sw", scope: !59, file: !3, line: 32, type: !69)
!76 = !DILocation(line: 32, column: 23, scope: !59)
!77 = !DILocalVariable(name: "fade", scope: !59, file: !3, line: 33, type: !69)
!78 = !DILocation(line: 33, column: 9, scope: !59)
!79 = !DILocalVariable(name: "tv", scope: !59, file: !3, line: 34, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !81, line: 8, size: 128, elements: !82)
!81 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!82 = !{!83, !87}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !80, file: !81, line: 10, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !85, line: 160, baseType: !86)
!85 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!86 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !80, file: !81, line: 11, baseType: !88, size: 64, offset: 64)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !85, line: 162, baseType: !86)
!89 = !DILocation(line: 34, column: 17, scope: !59)
!90 = !DILocation(line: 38, column: 12, scope: !59)
!91 = !DILocation(line: 38, column: 17, scope: !59)
!92 = !DILocation(line: 38, column: 2, scope: !59)
!93 = !DILocation(line: 38, column: 10, scope: !59)
!94 = !DILocation(line: 39, column: 12, scope: !59)
!95 = !DILocation(line: 39, column: 17, scope: !59)
!96 = !DILocation(line: 39, column: 2, scope: !59)
!97 = !DILocation(line: 39, column: 10, scope: !59)
!98 = !DILocation(line: 40, column: 12, scope: !59)
!99 = !DILocation(line: 40, column: 17, scope: !59)
!100 = !DILocation(line: 40, column: 2, scope: !59)
!101 = !DILocation(line: 40, column: 10, scope: !59)
!102 = !DILabel(scope: !59, name: "every_second", file: !3, line: 42)
!103 = !DILocation(line: 42, column: 1, scope: !59)
!104 = !DILocation(line: 43, column: 2, scope: !59)
!105 = !DILocation(line: 44, column: 20, scope: !59)
!106 = !DILocation(line: 44, column: 6, scope: !59)
!107 = !DILocalVariable(name: "t", scope: !59, file: !3, line: 35, type: !108)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !110, line: 7, size: 448, elements: !111)
!110 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!111 = !{!112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !109, file: !110, line: 9, baseType: !62, size: 32)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !109, file: !110, line: 10, baseType: !62, size: 32, offset: 32)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !109, file: !110, line: 11, baseType: !62, size: 32, offset: 64)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !109, file: !110, line: 12, baseType: !62, size: 32, offset: 96)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !109, file: !110, line: 13, baseType: !62, size: 32, offset: 128)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !109, file: !110, line: 14, baseType: !62, size: 32, offset: 160)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !109, file: !110, line: 15, baseType: !62, size: 32, offset: 192)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !109, file: !110, line: 16, baseType: !62, size: 32, offset: 224)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !109, file: !110, line: 17, baseType: !62, size: 32, offset: 256)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !109, file: !110, line: 20, baseType: !86, size: 64, offset: 320)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !109, file: !110, line: 21, baseType: !12, size: 64, offset: 384)
!123 = !DILocation(line: 46, column: 13, scope: !59)
!124 = !DILocation(line: 46, column: 10, scope: !59)
!125 = !DILocation(line: 46, column: 20, scope: !59)
!126 = !DILocation(line: 46, column: 25, scope: !59)
!127 = !DILocalVariable(name: "angle", scope: !59, file: !3, line: 31, type: !22)
!128 = !DILocation(line: 47, column: 12, scope: !59)
!129 = !DILocation(line: 47, column: 18, scope: !59)
!130 = !DILocation(line: 47, column: 16, scope: !59)
!131 = !DILocation(line: 47, column: 2, scope: !59)
!132 = !DILocation(line: 47, column: 10, scope: !59)
!133 = !DILocation(line: 48, column: 18, scope: !59)
!134 = !DILocation(line: 48, column: 16, scope: !59)
!135 = !DILocation(line: 48, column: 2, scope: !59)
!136 = !DILocation(line: 48, column: 10, scope: !59)
!137 = !DILocation(line: 50, column: 14, scope: !59)
!138 = !DILocation(line: 50, column: 11, scope: !59)
!139 = !DILocation(line: 50, column: 26, scope: !59)
!140 = !DILocation(line: 50, column: 23, scope: !59)
!141 = !DILocation(line: 50, column: 33, scope: !59)
!142 = !DILocation(line: 50, column: 21, scope: !59)
!143 = !DILocation(line: 50, column: 40, scope: !59)
!144 = !DILocation(line: 50, column: 45, scope: !59)
!145 = !DILocation(line: 51, column: 12, scope: !59)
!146 = !DILocation(line: 51, column: 18, scope: !59)
!147 = !DILocation(line: 51, column: 16, scope: !59)
!148 = !DILocation(line: 51, column: 29, scope: !59)
!149 = !DILocation(line: 51, column: 2, scope: !59)
!150 = !DILocation(line: 51, column: 10, scope: !59)
!151 = !DILocation(line: 52, column: 18, scope: !59)
!152 = !DILocation(line: 52, column: 16, scope: !59)
!153 = !DILocation(line: 52, column: 29, scope: !59)
!154 = !DILocation(line: 52, column: 2, scope: !59)
!155 = !DILocation(line: 52, column: 10, scope: !59)
!156 = !DILocation(line: 54, column: 14, scope: !59)
!157 = !DILocation(line: 54, column: 11, scope: !59)
!158 = !DILocation(line: 54, column: 27, scope: !59)
!159 = !DILocation(line: 54, column: 24, scope: !59)
!160 = !DILocation(line: 54, column: 34, scope: !59)
!161 = !DILocation(line: 54, column: 22, scope: !59)
!162 = !DILocation(line: 54, column: 41, scope: !59)
!163 = !DILocation(line: 54, column: 45, scope: !59)
!164 = !DILocation(line: 55, column: 12, scope: !59)
!165 = !DILocation(line: 55, column: 18, scope: !59)
!166 = !DILocation(line: 55, column: 16, scope: !59)
!167 = !DILocation(line: 55, column: 29, scope: !59)
!168 = !DILocation(line: 55, column: 2, scope: !59)
!169 = !DILocation(line: 55, column: 10, scope: !59)
!170 = !DILocation(line: 56, column: 18, scope: !59)
!171 = !DILocation(line: 56, column: 16, scope: !59)
!172 = !DILocation(line: 56, column: 29, scope: !59)
!173 = !DILocation(line: 56, column: 2, scope: !59)
!174 = !DILocation(line: 56, column: 10, scope: !59)
!175 = !DILocation(line: 58, column: 2, scope: !59)
!176 = !DILocalVariable(name: "i", scope: !177, file: !3, line: 59, type: !62)
!177 = distinct !DILexicalBlock(scope: !59, file: !3, line: 59, column: 2)
!178 = !DILocation(line: 0, scope: !177)
!179 = !DILocation(line: 59, column: 2, scope: !177)
!180 = !DILocation(line: 59, column: 2, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !3, line: 59, column: 2)
!182 = !DILocation(line: 60, column: 3, scope: !183)
!183 = distinct !DILexicalBlock(scope: !181, file: !3, line: 59, column: 8)
!184 = !DILocation(line: 61, column: 14, scope: !183)
!185 = !DILocation(line: 61, column: 16, scope: !183)
!186 = !DILocalVariable(name: "y", scope: !183, file: !3, line: 61, type: !22)
!187 = !DILocation(line: 0, scope: !183)
!188 = !DILocalVariable(name: "j", scope: !189, file: !3, line: 62, type: !62)
!189 = distinct !DILexicalBlock(scope: !183, file: !3, line: 62, column: 3)
!190 = !DILocation(line: 0, scope: !189)
!191 = !DILocation(line: 62, column: 3, scope: !189)
!192 = !DILocation(line: 62, column: 3, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !3, line: 62, column: 3)
!194 = !DILocation(line: 63, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !193, file: !3, line: 62, column: 9)
!196 = !DILocation(line: 63, column: 22, scope: !195)
!197 = !DILocation(line: 63, column: 18, scope: !195)
!198 = !DILocation(line: 63, column: 28, scope: !195)
!199 = !DILocalVariable(name: "x", scope: !195, file: !3, line: 63, type: !22)
!200 = !DILocation(line: 0, scope: !195)
!201 = !DILocalVariable(name: "pix", scope: !195, file: !3, line: 65, type: !62)
!202 = !DILocalVariable(name: "k", scope: !203, file: !3, line: 70, type: !62)
!203 = distinct !DILexicalBlock(scope: !195, file: !3, line: 70, column: 4)
!204 = !DILocation(line: 0, scope: !203)
!205 = !DILocation(line: 70, column: 9, scope: !203)
!206 = !DILocation(line: 70, column: 24, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !3, line: 70, column: 4)
!208 = !DILocation(line: 70, column: 4, scope: !203)
!209 = !DILocation(line: 71, column: 27, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !3, line: 70, column: 37)
!211 = !DILocation(line: 71, column: 34, scope: !210)
!212 = !DILocation(line: 71, column: 16, scope: !210)
!213 = !DILocalVariable(name: "d", scope: !210, file: !3, line: 71, type: !22)
!214 = !DILocation(line: 0, scope: !210)
!215 = !DILocation(line: 72, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !210, file: !3, line: 72, column: 9)
!217 = !DILocation(line: 72, column: 19, scope: !216)
!218 = !DILocation(line: 72, column: 11, scope: !216)
!219 = !DILocation(line: 72, column: 9, scope: !210)
!220 = !DILocation(line: 73, column: 17, scope: !216)
!221 = !DILocation(line: 73, column: 15, scope: !216)
!222 = !DILocation(line: 73, column: 12, scope: !216)
!223 = !DILocation(line: 73, column: 6, scope: !216)
!224 = !DILocation(line: 74, column: 18, scope: !225)
!225 = distinct !DILexicalBlock(scope: !216, file: !3, line: 74, column: 14)
!226 = !DILocation(line: 74, column: 24, scope: !225)
!227 = !DILocation(line: 74, column: 16, scope: !225)
!228 = !DILocation(line: 74, column: 14, scope: !216)
!229 = !DILocation(line: 75, column: 18, scope: !225)
!230 = !DILocation(line: 75, column: 24, scope: !225)
!231 = !DILocation(line: 75, column: 29, scope: !225)
!232 = !DILocation(line: 75, column: 15, scope: !225)
!233 = !DILocation(line: 75, column: 37, scope: !225)
!234 = !DILocation(line: 75, column: 35, scope: !225)
!235 = !DILocation(line: 75, column: 12, scope: !225)
!236 = !DILocation(line: 75, column: 6, scope: !225)
!237 = !DILocation(line: 0, scope: !216)
!238 = !DILocation(line: 76, column: 4, scope: !210)
!239 = !DILocation(line: 70, column: 33, scope: !207)
!240 = !DILocation(line: 70, column: 4, scope: !207)
!241 = distinct !{!241, !208, !242}
!242 = !DILocation(line: 76, column: 4, scope: !203)
!243 = !DILocation(line: 77, column: 12, scope: !195)
!244 = !DILocation(line: 77, column: 4, scope: !195)
!245 = !DILocation(line: 78, column: 3, scope: !195)
!246 = distinct !{!246, !191, !247}
!247 = !DILocation(line: 78, column: 3, scope: !189)
!248 = !DILocation(line: 79, column: 2, scope: !183)
!249 = distinct !{!249, !179, !250}
!250 = !DILocation(line: 79, column: 2, scope: !177)
!251 = !DILocation(line: 80, column: 2, scope: !59)
!252 = !DILocation(line: 82, column: 9, scope: !59)
!253 = !DILocation(line: 82, column: 2, scope: !59)
!254 = !DILocation(line: 83, column: 2, scope: !59)
!255 = !DILocation(line: 84, column: 2, scope: !59)
!256 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 87, type: !257, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!257 = !DISubroutineType(types: !258)
!258 = !{!62, !62, !259}
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64)
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!261 = !DILocalVariable(name: "argc", arg: 1, scope: !256, file: !3, line: 87, type: !62)
!262 = !DILocation(line: 0, scope: !256)
!263 = !DILocalVariable(name: "argv", arg: 2, scope: !256, file: !3, line: 87, type: !259)
!264 = !DILocation(line: 90, column: 11, scope: !265)
!265 = distinct !DILexicalBlock(scope: !256, file: !3, line: 90, column: 6)
!266 = !DILocation(line: 90, column: 16, scope: !265)
!267 = !DILocation(line: 90, column: 29, scope: !265)
!268 = !DILocation(line: 90, column: 24, scope: !265)
!269 = !DILocalVariable(name: "s", scope: !256, file: !3, line: 89, type: !62)
!270 = !DILocation(line: 90, column: 39, scope: !265)
!271 = !DILocation(line: 90, column: 6, scope: !256)
!272 = !DILocation(line: 90, column: 45, scope: !265)
!273 = !DILocation(line: 0, scope: !265)
!274 = !DILocation(line: 91, column: 2, scope: !256)
!275 = !DILocation(line: 92, column: 2, scope: !256)
