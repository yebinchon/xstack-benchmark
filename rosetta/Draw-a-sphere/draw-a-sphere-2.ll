; ModuleID = 'draw-a-sphere-2.ll'
source_filename = "draw-a-sphere-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@g = dso_local global [4 x i32] [i32 -1, i32 1, i32 -1, i32 1], align 16, !dbg !0
@scale = common dso_local global [8 x double] zeroinitializer, align 16, !dbg !6
@scale_u = common dso_local global [8 x double] zeroinitializer, align 16, !dbg !12
@.str = private unnamed_addr constant [8 x i8] c"out.pgm\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"P5\0A256 256\0A255\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @noise_init() #0 !dbg !22 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 1, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %0, 8, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !34
  %add = add nsw i32 %1, 1, !dbg !36
  %conv = sitofp i32 %add to double, !dbg !34
  %call = call double @sqrt(double %conv) #4, !dbg !37
  %add1 = fadd double 1.000000e+00, %call, !dbg !38
  %div = fdiv double 1.000000e+00, %add1, !dbg !39
  %2 = load i32, i32* %i, align 4, !dbg !40
  %idxprom = sext i32 %2 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom, !dbg !41
  store double %div, double* %arrayidx, align 8, !dbg !42
  %3 = load i32, i32* %i, align 4, !dbg !43
  %idxprom2 = sext i32 %3 to i64, !dbg !44
  %arrayidx3 = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom2, !dbg !44
  %4 = load double, double* %arrayidx3, align 8, !dbg !44
  %5 = load i32, i32* %i, align 4, !dbg !45
  %add4 = add nsw i32 %5, 1, !dbg !46
  %conv5 = sitofp i32 %add4 to double, !dbg !45
  %call6 = call double @sqrt(double %conv5) #4, !dbg !47
  %div7 = fdiv double %4, %call6, !dbg !48
  %6 = load i32, i32* %i, align 4, !dbg !49
  %idxprom8 = sext i32 %6 to i64, !dbg !50
  %arrayidx9 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom8, !dbg !50
  store double %div7, double* %arrayidx9, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %7, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  ret void, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @noise(double* %x, i32 %d) #0 !dbg !58 {
entry:
  %x.addr = alloca double*, align 8
  %d.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca [8 x i32], align 16
  %o = alloca [8 x i32], align 16
  %g = alloca [8 x i32], align 16
  %tmp = alloca i32, align 4
  %s = alloca double, align 8
  %r = alloca double, align 8
  %t = alloca double, align 8
  %w = alloca double, align 8
  %ret = alloca double, align 8
  %u = alloca [8 x double], align 16
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %i, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %j, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [8 x i32]* %n, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [8 x i32]* %o, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [8 x i32]* %g, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata double* %s, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata double* %r, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata double* %t, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata double* %w, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata double* %ret, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [8 x double]* %u, metadata !89, metadata !DIExpression()), !dbg !90
  store double 0.000000e+00, double* %s, align 8, !dbg !91
  store i32 0, i32* %j, align 4, !dbg !91
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !93
  %1 = load i32, i32* %d.addr, align 4, !dbg !93
  %cmp = icmp slt i32 %0, %1, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %x.addr, align 8, !dbg !93
  %3 = load i32, i32* %j, align 4, !dbg !93
  %idxprom = sext i32 %3 to i64, !dbg !93
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !dbg !93
  %4 = load double, double* %arrayidx, align 8, !dbg !93
  %5 = load double, double* %s, align 8, !dbg !93
  %add = fadd double %5, %4, !dbg !93
  store double %add, double* %s, align 8, !dbg !93
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %j, align 4, !dbg !93
  %inc = add nsw i32 %6, 1, !dbg !93
  store i32 %inc, i32* %j, align 4, !dbg !93
  br label %for.cond, !dbg !93, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %d.addr, align 4, !dbg !96
  %idxprom1 = sext i32 %7 to i64, !dbg !97
  %arrayidx2 = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom1, !dbg !97
  %8 = load double, double* %arrayidx2, align 8, !dbg !97
  %9 = load double, double* %s, align 8, !dbg !98
  %mul = fmul double %9, %8, !dbg !98
  store double %mul, double* %s, align 8, !dbg !98
  store i32 0, i32* %i, align 4, !dbg !99
  br label %for.cond3, !dbg !101

for.cond3:                                        ; preds = %for.inc16, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !102
  %11 = load i32, i32* %d.addr, align 4, !dbg !104
  %cmp4 = icmp slt i32 %10, %11, !dbg !105
  br i1 %cmp4, label %for.body5, label %for.end18, !dbg !106

for.body5:                                        ; preds = %for.cond3
  %12 = load i32, i32* %i, align 4, !dbg !107
  %13 = load i32, i32* %i, align 4, !dbg !109
  %idxprom6 = sext i32 %13 to i64, !dbg !110
  %arrayidx7 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom6, !dbg !110
  store i32 %12, i32* %arrayidx7, align 4, !dbg !111
  %14 = load double*, double** %x.addr, align 8, !dbg !112
  %15 = load i32, i32* %i, align 4, !dbg !113
  %idxprom8 = sext i32 %15 to i64, !dbg !112
  %arrayidx9 = getelementptr inbounds double, double* %14, i64 %idxprom8, !dbg !112
  %16 = load double, double* %arrayidx9, align 8, !dbg !112
  %17 = load double, double* %s, align 8, !dbg !114
  %add10 = fadd double %16, %17, !dbg !115
  store double %add10, double* %t, align 8, !dbg !116
  %18 = load double, double* %t, align 8, !dbg !117
  %19 = load double, double* %t, align 8, !dbg !118
  %20 = call double @llvm.floor.f64(double %19), !dbg !119
  %conv = fptosi double %20 to i32, !dbg !119
  %21 = load i32, i32* %i, align 4, !dbg !120
  %idxprom11 = sext i32 %21 to i64, !dbg !121
  %arrayidx12 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom11, !dbg !121
  store i32 %conv, i32* %arrayidx12, align 4, !dbg !122
  %conv13 = sitofp i32 %conv to double, !dbg !123
  %sub = fsub double %18, %conv13, !dbg !124
  %22 = load i32, i32* %i, align 4, !dbg !125
  %idxprom14 = sext i32 %22 to i64, !dbg !126
  %arrayidx15 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom14, !dbg !126
  store double %sub, double* %arrayidx15, align 8, !dbg !127
  br label %for.inc16, !dbg !128

for.inc16:                                        ; preds = %for.body5
  %23 = load i32, i32* %i, align 4, !dbg !129
  %inc17 = add nsw i32 %23, 1, !dbg !129
  store i32 %inc17, i32* %i, align 4, !dbg !129
  br label %for.cond3, !dbg !130, !llvm.loop !131

for.end18:                                        ; preds = %for.cond3
  %24 = load i32, i32* %d.addr, align 4, !dbg !133
  %idxprom19 = sext i32 %24 to i64, !dbg !134
  %arrayidx20 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom19, !dbg !134
  store i32 0, i32* %arrayidx20, align 4, !dbg !135
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond21, !dbg !138

for.cond21:                                       ; preds = %for.inc51, %for.end18
  %25 = load i32, i32* %i, align 4, !dbg !139
  %26 = load i32, i32* %d.addr, align 4, !dbg !141
  %sub22 = sub nsw i32 %26, 1, !dbg !142
  %cmp23 = icmp slt i32 %25, %sub22, !dbg !143
  br i1 %cmp23, label %for.body25, label %for.end53, !dbg !144

for.body25:                                       ; preds = %for.cond21
  %27 = load i32, i32* %i, align 4, !dbg !145
  store i32 %27, i32* %j, align 4, !dbg !147
  br label %for.cond26, !dbg !148

for.cond26:                                       ; preds = %for.inc48, %for.body25
  %28 = load i32, i32* %j, align 4, !dbg !149
  %29 = load i32, i32* %d.addr, align 4, !dbg !151
  %cmp27 = icmp slt i32 %28, %29, !dbg !152
  br i1 %cmp27, label %for.body29, label %for.end50, !dbg !153

for.body29:                                       ; preds = %for.cond26
  %30 = load i32, i32* %i, align 4, !dbg !154
  %idxprom30 = sext i32 %30 to i64, !dbg !156
  %arrayidx31 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom30, !dbg !156
  %31 = load i32, i32* %arrayidx31, align 4, !dbg !156
  %idxprom32 = sext i32 %31 to i64, !dbg !157
  %arrayidx33 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom32, !dbg !157
  %32 = load double, double* %arrayidx33, align 8, !dbg !157
  %33 = load i32, i32* %j, align 4, !dbg !158
  %idxprom34 = sext i32 %33 to i64, !dbg !159
  %arrayidx35 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom34, !dbg !159
  %34 = load i32, i32* %arrayidx35, align 4, !dbg !159
  %idxprom36 = sext i32 %34 to i64, !dbg !160
  %arrayidx37 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom36, !dbg !160
  %35 = load double, double* %arrayidx37, align 8, !dbg !160
  %cmp38 = fcmp olt double %32, %35, !dbg !161
  br i1 %cmp38, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %for.body29
  %36 = load i32, i32* %i, align 4, !dbg !163
  %idxprom40 = sext i32 %36 to i64, !dbg !164
  %arrayidx41 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom40, !dbg !164
  %37 = load i32, i32* %arrayidx41, align 4, !dbg !164
  store i32 %37, i32* %tmp, align 4, !dbg !165
  %38 = load i32, i32* %j, align 4, !dbg !166
  %idxprom42 = sext i32 %38 to i64, !dbg !167
  %arrayidx43 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom42, !dbg !167
  %39 = load i32, i32* %arrayidx43, align 4, !dbg !167
  %40 = load i32, i32* %i, align 4, !dbg !168
  %idxprom44 = sext i32 %40 to i64, !dbg !169
  %arrayidx45 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom44, !dbg !169
  store i32 %39, i32* %arrayidx45, align 4, !dbg !170
  %41 = load i32, i32* %tmp, align 4, !dbg !171
  %42 = load i32, i32* %j, align 4, !dbg !172
  %idxprom46 = sext i32 %42 to i64, !dbg !173
  %arrayidx47 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom46, !dbg !173
  store i32 %41, i32* %arrayidx47, align 4, !dbg !174
  br label %if.end, !dbg !175

if.end:                                           ; preds = %if.then, %for.body29
  br label %for.inc48, !dbg !176

for.inc48:                                        ; preds = %if.end
  %43 = load i32, i32* %j, align 4, !dbg !177
  %inc49 = add nsw i32 %43, 1, !dbg !177
  store i32 %inc49, i32* %j, align 4, !dbg !177
  br label %for.cond26, !dbg !178, !llvm.loop !179

for.end50:                                        ; preds = %for.cond26
  br label %for.inc51, !dbg !180

for.inc51:                                        ; preds = %for.end50
  %44 = load i32, i32* %i, align 4, !dbg !181
  %inc52 = add nsw i32 %44, 1, !dbg !181
  store i32 %inc52, i32* %i, align 4, !dbg !181
  br label %for.cond21, !dbg !182, !llvm.loop !183

for.end53:                                        ; preds = %for.cond21
  store double 0.000000e+00, double* %w, align 8, !dbg !185
  store double 0.000000e+00, double* %ret, align 8, !dbg !186
  store double 1.000000e+00, double* %r, align 8, !dbg !187
  store double 0.000000e+00, double* %s, align 8, !dbg !188
  store i32 0, i32* %j, align 4, !dbg !190
  br label %for.cond54, !dbg !191

for.cond54:                                       ; preds = %for.inc62, %for.end53
  %45 = load i32, i32* %j, align 4, !dbg !192
  %46 = load i32, i32* %d.addr, align 4, !dbg !194
  %cmp55 = icmp slt i32 %45, %46, !dbg !195
  br i1 %cmp55, label %for.body57, label %for.end64, !dbg !196

for.body57:                                       ; preds = %for.cond54
  %47 = load i32, i32* %j, align 4, !dbg !197
  %idxprom58 = sext i32 %47 to i64, !dbg !198
  %arrayidx59 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom58, !dbg !198
  %48 = load i32, i32* %arrayidx59, align 4, !dbg !198
  %conv60 = sitofp i32 %48 to double, !dbg !198
  %49 = load double, double* %s, align 8, !dbg !199
  %add61 = fadd double %49, %conv60, !dbg !199
  store double %add61, double* %s, align 8, !dbg !199
  br label %for.inc62, !dbg !200

for.inc62:                                        ; preds = %for.body57
  %50 = load i32, i32* %j, align 4, !dbg !201
  %inc63 = add nsw i32 %50, 1, !dbg !201
  store i32 %inc63, i32* %j, align 4, !dbg !201
  br label %for.cond54, !dbg !202, !llvm.loop !203

for.end64:                                        ; preds = %for.cond54
  %51 = load i32, i32* %d.addr, align 4, !dbg !205
  %idxprom65 = sext i32 %51 to i64, !dbg !206
  %arrayidx66 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom65, !dbg !206
  %52 = load double, double* %arrayidx66, align 8, !dbg !206
  %53 = load double, double* %s, align 8, !dbg !207
  %mul67 = fmul double %53, %52, !dbg !207
  store double %mul67, double* %s, align 8, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond68, !dbg !210

for.cond68:                                       ; preds = %for.inc150, %for.end64
  %54 = load i32, i32* %i, align 4, !dbg !211
  %55 = load i32, i32* %d.addr, align 4, !dbg !213
  %cmp69 = icmp sle i32 %54, %55, !dbg !214
  br i1 %cmp69, label %for.body71, label %for.end152, !dbg !215

for.body71:                                       ; preds = %for.cond68
  store i32 0, i32* %j, align 4, !dbg !216
  br label %for.cond72, !dbg !219

for.cond72:                                       ; preds = %for.inc85, %for.body71
  %56 = load i32, i32* %j, align 4, !dbg !220
  %57 = load i32, i32* %d.addr, align 4, !dbg !222
  %cmp73 = icmp slt i32 %56, %57, !dbg !223
  br i1 %cmp73, label %for.body75, label %for.end87, !dbg !224

for.body75:                                       ; preds = %for.cond72
  %58 = load double*, double** %x.addr, align 8, !dbg !225
  %59 = load i32, i32* %j, align 4, !dbg !226
  %idxprom76 = sext i32 %59 to i64, !dbg !225
  %arrayidx77 = getelementptr inbounds double, double* %58, i64 %idxprom76, !dbg !225
  %60 = load double, double* %arrayidx77, align 8, !dbg !225
  %61 = load double, double* %s, align 8, !dbg !227
  %add78 = fadd double %60, %61, !dbg !228
  %62 = load i32, i32* %j, align 4, !dbg !229
  %idxprom79 = sext i32 %62 to i64, !dbg !230
  %arrayidx80 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom79, !dbg !230
  %63 = load i32, i32* %arrayidx80, align 4, !dbg !230
  %conv81 = sitofp i32 %63 to double, !dbg !230
  %sub82 = fsub double %add78, %conv81, !dbg !231
  %64 = load i32, i32* %j, align 4, !dbg !232
  %idxprom83 = sext i32 %64 to i64, !dbg !233
  %arrayidx84 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom83, !dbg !233
  store double %sub82, double* %arrayidx84, align 8, !dbg !234
  br label %for.inc85, !dbg !233

for.inc85:                                        ; preds = %for.body75
  %65 = load i32, i32* %j, align 4, !dbg !235
  %inc86 = add nsw i32 %65, 1, !dbg !235
  store i32 %inc86, i32* %j, align 4, !dbg !235
  br label %for.cond72, !dbg !236, !llvm.loop !237

for.end87:                                        ; preds = %for.cond72
  %66 = load i32, i32* %d.addr, align 4, !dbg !239
  %conv88 = sitofp i32 %66 to double, !dbg !239
  %add89 = fadd double %conv88, 1.000000e+00, !dbg !241
  %67 = load i32, i32* %d.addr, align 4, !dbg !242
  %mul90 = mul nsw i32 2, %67, !dbg !243
  %conv91 = sitofp i32 %mul90 to double, !dbg !244
  %div = fdiv double %add89, %conv91, !dbg !245
  store double %div, double* %t, align 8, !dbg !246
  store i32 0, i32* %j, align 4, !dbg !247
  br label %for.cond92, !dbg !248

for.cond92:                                       ; preds = %for.inc106, %for.end87
  %68 = load i32, i32* %j, align 4, !dbg !249
  %69 = load i32, i32* %d.addr, align 4, !dbg !251
  %cmp93 = icmp slt i32 %68, %69, !dbg !252
  br i1 %cmp93, label %for.body95, label %for.end108.loopexit, !dbg !253

for.body95:                                       ; preds = %for.cond92
  %70 = load i32, i32* %j, align 4, !dbg !254
  %idxprom96 = sext i32 %70 to i64, !dbg !256
  %arrayidx97 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom96, !dbg !256
  %71 = load double, double* %arrayidx97, align 8, !dbg !256
  %72 = load i32, i32* %j, align 4, !dbg !257
  %idxprom98 = sext i32 %72 to i64, !dbg !258
  %arrayidx99 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom98, !dbg !258
  %73 = load double, double* %arrayidx99, align 8, !dbg !258
  %mul100 = fmul double %71, %73, !dbg !259
  %74 = load double, double* %t, align 8, !dbg !260
  %sub101 = fsub double %74, %mul100, !dbg !260
  store double %sub101, double* %t, align 8, !dbg !260
  %75 = load double, double* %t, align 8, !dbg !261
  %cmp102 = fcmp ole double %75, 0.000000e+00, !dbg !263
  br i1 %cmp102, label %if.then104, label %if.end105, !dbg !264

if.then104:                                       ; preds = %for.body95
  br label %for.end108, !dbg !265

if.end105:                                        ; preds = %for.body95
  br label %for.inc106, !dbg !266

for.inc106:                                       ; preds = %if.end105
  %76 = load i32, i32* %j, align 4, !dbg !267
  %inc107 = add nsw i32 %76, 1, !dbg !267
  store i32 %inc107, i32* %j, align 4, !dbg !267
  br label %for.cond92, !dbg !268, !llvm.loop !269

for.end108.loopexit:                              ; preds = %for.cond92
  br label %for.end108, !dbg !271

for.end108:                                       ; preds = %for.end108.loopexit, %if.then104
  %77 = load double, double* %t, align 8, !dbg !271
  %cmp109 = fcmp oge double %77, 0.000000e+00, !dbg !273
  br i1 %cmp109, label %if.then111, label %if.end137, !dbg !274

if.then111:                                       ; preds = %for.end108
  store double 0.000000e+00, double* %r, align 8, !dbg !275
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 0, !dbg !277
  %arraydecay112 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 0, !dbg !278
  %78 = load i32, i32* %d.addr, align 4, !dbg !279
  call void @hashed(i32* %arraydecay, i32* %arraydecay112, i32 %78), !dbg !280
  store i32 0, i32* %j, align 4, !dbg !281
  br label %for.cond113, !dbg !283

for.cond113:                                      ; preds = %for.inc130, %if.then111
  %79 = load i32, i32* %j, align 4, !dbg !284
  %80 = load i32, i32* %d.addr, align 4, !dbg !286
  %cmp114 = icmp slt i32 %79, %80, !dbg !287
  br i1 %cmp114, label %for.body116, label %for.end132, !dbg !288

for.body116:                                      ; preds = %for.cond113
  %81 = load i32, i32* %j, align 4, !dbg !289
  %idxprom117 = sext i32 %81 to i64, !dbg !291
  %arrayidx118 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom117, !dbg !291
  %82 = load i32, i32* %arrayidx118, align 4, !dbg !291
  %tobool = icmp ne i32 %82, 0, !dbg !291
  br i1 %tobool, label %if.then119, label %if.end129, !dbg !292

if.then119:                                       ; preds = %for.body116
  %83 = load i32, i32* %j, align 4, !dbg !293
  %idxprom120 = sext i32 %83 to i64, !dbg !294
  %arrayidx121 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom120, !dbg !294
  %84 = load i32, i32* %arrayidx121, align 4, !dbg !294
  %cmp122 = icmp eq i32 %84, 1, !dbg !295
  br i1 %cmp122, label %cond.true, label %cond.false, !dbg !294

cond.true:                                        ; preds = %if.then119
  %85 = load i32, i32* %j, align 4, !dbg !296
  %idxprom124 = sext i32 %85 to i64, !dbg !297
  %arrayidx125 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom124, !dbg !297
  %86 = load double, double* %arrayidx125, align 8, !dbg !297
  br label %cond.end, !dbg !294

cond.false:                                       ; preds = %if.then119
  %87 = load i32, i32* %j, align 4, !dbg !298
  %idxprom126 = sext i32 %87 to i64, !dbg !299
  %arrayidx127 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom126, !dbg !299
  %88 = load double, double* %arrayidx127, align 8, !dbg !299
  %fneg = fneg double %88, !dbg !300
  br label %cond.end, !dbg !294

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %86, %cond.true ], [ %fneg, %cond.false ], !dbg !294
  %89 = load double, double* %r, align 8, !dbg !301
  %add128 = fadd double %89, %cond, !dbg !301
  store double %add128, double* %r, align 8, !dbg !301
  br label %if.end129, !dbg !302

if.end129:                                        ; preds = %cond.end, %for.body116
  br label %for.inc130, !dbg !303

for.inc130:                                       ; preds = %if.end129
  %90 = load i32, i32* %j, align 4, !dbg !304
  %inc131 = add nsw i32 %90, 1, !dbg !304
  store i32 %inc131, i32* %j, align 4, !dbg !304
  br label %for.cond113, !dbg !305, !llvm.loop !306

for.end132:                                       ; preds = %for.cond113
  %91 = load double, double* %t, align 8, !dbg !308
  %92 = load double, double* %t, align 8, !dbg !309
  %mul133 = fmul double %92, %91, !dbg !309
  store double %mul133, double* %t, align 8, !dbg !309
  %93 = load double, double* %r, align 8, !dbg !310
  %94 = load double, double* %t, align 8, !dbg !311
  %mul134 = fmul double %93, %94, !dbg !312
  %95 = load double, double* %t, align 8, !dbg !313
  %mul135 = fmul double %mul134, %95, !dbg !314
  %96 = load double, double* %ret, align 8, !dbg !315
  %add136 = fadd double %96, %mul135, !dbg !315
  store double %add136, double* %ret, align 8, !dbg !315
  br label %if.end137, !dbg !316

if.end137:                                        ; preds = %for.end132, %for.end108
  %97 = load i32, i32* %i, align 4, !dbg !317
  %98 = load i32, i32* %d.addr, align 4, !dbg !319
  %cmp138 = icmp slt i32 %97, %98, !dbg !320
  br i1 %cmp138, label %if.then140, label %if.end149, !dbg !321

if.then140:                                       ; preds = %if.end137
  %99 = load i32, i32* %i, align 4, !dbg !322
  %idxprom141 = sext i32 %99 to i64, !dbg !324
  %arrayidx142 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom141, !dbg !324
  %100 = load i32, i32* %arrayidx142, align 4, !dbg !324
  %idxprom143 = sext i32 %100 to i64, !dbg !325
  %arrayidx144 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom143, !dbg !325
  %101 = load i32, i32* %arrayidx144, align 4, !dbg !326
  %inc145 = add nsw i32 %101, 1, !dbg !326
  store i32 %inc145, i32* %arrayidx144, align 4, !dbg !326
  %102 = load i32, i32* %d.addr, align 4, !dbg !327
  %idxprom146 = sext i32 %102 to i64, !dbg !328
  %arrayidx147 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom146, !dbg !328
  %103 = load double, double* %arrayidx147, align 8, !dbg !328
  %104 = load double, double* %s, align 8, !dbg !329
  %add148 = fadd double %104, %103, !dbg !329
  store double %add148, double* %s, align 8, !dbg !329
  br label %if.end149, !dbg !330

if.end149:                                        ; preds = %if.then140, %if.end137
  br label %for.inc150, !dbg !331

for.inc150:                                       ; preds = %if.end149
  %105 = load i32, i32* %i, align 4, !dbg !332
  %inc151 = add nsw i32 %105, 1, !dbg !332
  store i32 %inc151, i32* %i, align 4, !dbg !332
  br label %for.cond68, !dbg !333, !llvm.loop !334

for.end152:                                       ; preds = %for.cond68
  %106 = load double, double* %ret, align 8, !dbg !336
  %107 = load i32, i32* %d.addr, align 4, !dbg !337
  %108 = load i32, i32* %d.addr, align 4, !dbg !338
  %mul153 = mul nsw i32 %107, %108, !dbg !339
  %conv154 = sitofp i32 %mul153 to double, !dbg !340
  %mul155 = fmul double %106, %conv154, !dbg !341
  ret double %mul155, !dbg !342
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

declare dso_local void @hashed(i32*, i32*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise2(double %x, double %y) #0 !dbg !343 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %i = alloca i32, align 4
  %ws = alloca i32, align 4
  %r = alloca double, align 8
  %v = alloca [2 x double], align 16
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !346, metadata !DIExpression()), !dbg !347
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.declare(metadata i32* %i, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata i32* %ws, metadata !352, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata double* %r, metadata !354, metadata !DIExpression()), !dbg !355
  store double 0.000000e+00, double* %r, align 8, !dbg !355
  call void @llvm.dbg.declare(metadata [2 x double]* %v, metadata !356, metadata !DIExpression()), !dbg !360
  store i32 1, i32* %i, align 4, !dbg !361
  store i32 0, i32* %ws, align 4, !dbg !363
  br label %for.cond, !dbg !364

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !365
  %cmp = icmp sle i32 %0, 128, !dbg !367
  br i1 %cmp, label %for.body, label %for.end, !dbg !368

for.body:                                         ; preds = %for.cond
  %1 = load double, double* %x.addr, align 8, !dbg !369
  %2 = load i32, i32* %i, align 4, !dbg !371
  %conv = sitofp i32 %2 to double, !dbg !371
  %mul = fmul double %1, %conv, !dbg !372
  %arrayidx = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !373
  store double %mul, double* %arrayidx, align 16, !dbg !374
  %3 = load double, double* %y.addr, align 8, !dbg !375
  %4 = load i32, i32* %i, align 4, !dbg !376
  %conv1 = sitofp i32 %4 to double, !dbg !376
  %mul2 = fmul double %3, %conv1, !dbg !377
  %arrayidx3 = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 1, !dbg !378
  store double %mul2, double* %arrayidx3, align 8, !dbg !379
  %arraydecay = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !380
  %call = call double @noise(double* %arraydecay, i32 2), !dbg !381
  %5 = load double, double* %r, align 8, !dbg !382
  %add = fadd double %5, %call, !dbg !382
  store double %add, double* %r, align 8, !dbg !382
  %6 = load i32, i32* %ws, align 4, !dbg !383
  %inc = add nsw i32 %6, 1, !dbg !383
  store i32 %inc, i32* %ws, align 4, !dbg !383
  br label %for.inc, !dbg !384

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !385
  %shl = shl i32 %7, 1, !dbg !385
  store i32 %shl, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !386, !llvm.loop !387

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %ws, align 4, !dbg !389
  %conv4 = sitofp i32 %8 to double, !dbg !389
  %9 = load double, double* %r, align 8, !dbg !390
  %div = fdiv double %9, %conv4, !dbg !390
  store double %div, double* %r, align 8, !dbg !390
  %10 = load double, double* %r, align 8, !dbg !391
  ret double %10, !dbg !392
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise3(double %x, double %y, double %z) #0 !dbg !393 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %z.addr = alloca double, align 8
  %i = alloca i32, align 4
  %ws = alloca i32, align 4
  %r = alloca double, align 8
  %v = alloca [3 x double], align 16
  %w = alloca double, align 8
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !396, metadata !DIExpression()), !dbg !397
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !398, metadata !DIExpression()), !dbg !399
  store double %z, double* %z.addr, align 8
  call void @llvm.dbg.declare(metadata double* %z.addr, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %i, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32* %ws, metadata !404, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata double* %r, metadata !406, metadata !DIExpression()), !dbg !407
  store double 0.000000e+00, double* %r, align 8, !dbg !407
  call void @llvm.dbg.declare(metadata [3 x double]* %v, metadata !408, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata double* %w, metadata !413, metadata !DIExpression()), !dbg !414
  store i32 1, i32* %i, align 4, !dbg !415
  store i32 0, i32* %ws, align 4, !dbg !417
  br label %for.cond, !dbg !418

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !419
  %cmp = icmp sle i32 %0, 32, !dbg !421
  br i1 %cmp, label %for.body, label %for.end, !dbg !422

for.body:                                         ; preds = %for.cond
  %1 = load double, double* %x.addr, align 8, !dbg !423
  %2 = load i32, i32* %i, align 4, !dbg !425
  %conv = sitofp i32 %2 to double, !dbg !425
  %mul = fmul double %1, %conv, !dbg !426
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !427
  store double %mul, double* %arrayidx, align 16, !dbg !428
  %3 = load double, double* %y.addr, align 8, !dbg !429
  %4 = load i32, i32* %i, align 4, !dbg !430
  %conv1 = sitofp i32 %4 to double, !dbg !430
  %mul2 = fmul double %3, %conv1, !dbg !431
  %arrayidx3 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 1, !dbg !432
  store double %mul2, double* %arrayidx3, align 8, !dbg !433
  %5 = load double, double* %z.addr, align 8, !dbg !434
  %6 = load i32, i32* %i, align 4, !dbg !435
  %conv4 = sitofp i32 %6 to double, !dbg !435
  %mul5 = fmul double %5, %conv4, !dbg !436
  %arrayidx6 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 2, !dbg !437
  store double %mul5, double* %arrayidx6, align 16, !dbg !438
  %7 = load i32, i32* %i, align 4, !dbg !439
  %conv7 = sitofp i32 %7 to double, !dbg !439
  %call = call double @sqrt(double %conv7) #4, !dbg !440
  %div = fdiv double 1.000000e+00, %call, !dbg !441
  store double %div, double* %w, align 8, !dbg !442
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !443
  %call8 = call double @noise(double* %arraydecay, i32 3), !dbg !444
  %8 = load double, double* %w, align 8, !dbg !445
  %mul9 = fmul double %call8, %8, !dbg !446
  %9 = load double, double* %r, align 8, !dbg !447
  %add = fadd double %9, %mul9, !dbg !447
  store double %add, double* %r, align 8, !dbg !447
  %10 = load double, double* %w, align 8, !dbg !448
  %11 = load i32, i32* %ws, align 4, !dbg !449
  %conv10 = sitofp i32 %11 to double, !dbg !449
  %add11 = fadd double %conv10, %10, !dbg !449
  %conv12 = fptosi double %add11 to i32, !dbg !449
  store i32 %conv12, i32* %ws, align 4, !dbg !449
  br label %for.inc, !dbg !450

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !451
  %shl = shl i32 %12, 1, !dbg !451
  store i32 %shl, i32* %i, align 4, !dbg !451
  br label %for.cond, !dbg !452, !llvm.loop !453

for.end:                                          ; preds = %for.cond
  %13 = load double, double* %r, align 8, !dbg !455
  %14 = load i32, i32* %ws, align 4, !dbg !456
  %conv13 = sitofp i32 %14 to double, !dbg !456
  %div14 = fdiv double %13, %conv13, !dbg !457
  ret double %div14, !dbg !458
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !459 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %pix = alloca [65536 x i8], align 16
  %p = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %w = alloca double, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !465, metadata !DIExpression()), !dbg !466
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata [65536 x i8]* %pix, metadata !469, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata i8** %p, metadata !475, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %i, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata i32* %j, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata double* %x, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata double* %y, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata double* %z, metadata !486, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.declare(metadata double* %w, metadata !488, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !490, metadata !DIExpression()), !dbg !551
  call void @noise_init(), !dbg !552
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !553
  store i8* %arraydecay, i8** %p, align 8, !dbg !555
  store i32 0, i32* %i, align 4, !dbg !556
  br label %for.cond, !dbg !557

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !558
  %cmp = icmp slt i32 %0, 65536, !dbg !560
  br i1 %cmp, label %for.body, label %for.end, !dbg !561

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %p, align 8, !dbg !562
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1, !dbg !562
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !562
  store i8 0, i8* %1, align 1, !dbg !563
  br label %for.inc, !dbg !564

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !565
  %inc = add nsw i32 %2, 1, !dbg !565
  store i32 %inc, i32* %i, align 4, !dbg !565
  br label %for.cond, !dbg !566, !llvm.loop !567

for.end:                                          ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !569
  store i8* %arraydecay1, i8** %p, align 8, !dbg !571
  store i32 0, i32* %i, align 4, !dbg !572
  br label %for.cond2, !dbg !573

for.cond2:                                        ; preds = %for.inc44, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !574
  %cmp3 = icmp slt i32 %3, 256, !dbg !576
  br i1 %cmp3, label %for.body4, label %for.end46, !dbg !577

for.body4:                                        ; preds = %for.cond2
  %4 = load i32, i32* %i, align 4, !dbg !578
  %sub = sub nsw i32 %4, 128, !dbg !580
  %conv = sitofp i32 %sub to double, !dbg !581
  %div = fdiv double %conv, 1.250000e+02, !dbg !582
  store double %div, double* %y, align 8, !dbg !583
  store i32 0, i32* %j, align 4, !dbg !584
  br label %for.cond5, !dbg !586

for.cond5:                                        ; preds = %for.inc40, %for.body4
  %5 = load i32, i32* %j, align 4, !dbg !587
  %cmp6 = icmp slt i32 %5, 256, !dbg !589
  br i1 %cmp6, label %for.body8, label %for.end43, !dbg !590

for.body8:                                        ; preds = %for.cond5
  %6 = load i32, i32* %j, align 4, !dbg !591
  %sub9 = sub nsw i32 %6, 128, !dbg !593
  %conv10 = sitofp i32 %sub9 to double, !dbg !594
  %div11 = fdiv double %conv10, 1.250000e+02, !dbg !595
  store double %div11, double* %x, align 8, !dbg !596
  %7 = load i32, i32* %i, align 4, !dbg !597
  %conv12 = sitofp i32 %7 to double, !dbg !597
  %div13 = fdiv double %conv12, 2.560000e+02, !dbg !598
  %8 = load i32, i32* %j, align 4, !dbg !599
  %conv14 = sitofp i32 %8 to double, !dbg !599
  %div15 = fdiv double %conv14, 2.560000e+02, !dbg !600
  %call = call double @get_noise2(double %div13, double %div15), !dbg !601
  %add = fadd double %call, 1.000000e+00, !dbg !602
  %div16 = fdiv double %add, 6.000000e+00, !dbg !603
  %9 = load i32, i32* %i, align 4, !dbg !604
  %conv17 = sitofp i32 %9 to double, !dbg !604
  %mul = fmul double %div16, %conv17, !dbg !605
  %conv18 = fptoui double %mul to i8, !dbg !606
  %10 = load i8*, i8** %p, align 8, !dbg !607
  store i8 %conv18, i8* %10, align 1, !dbg !608
  %11 = load double, double* %x, align 8, !dbg !609
  %12 = load double, double* %x, align 8, !dbg !610
  %mul19 = fmul double %11, %12, !dbg !611
  %sub20 = fsub double 1.000000e+00, %mul19, !dbg !612
  %13 = load double, double* %y, align 8, !dbg !613
  %14 = load double, double* %y, align 8, !dbg !614
  %mul21 = fmul double %13, %14, !dbg !615
  %sub22 = fsub double %sub20, %mul21, !dbg !616
  store double %sub22, double* %z, align 8, !dbg !617
  %15 = load double, double* %z, align 8, !dbg !618
  %cmp23 = fcmp olt double %15, 0.000000e+00, !dbg !620
  br i1 %cmp23, label %if.then, label %if.end, !dbg !621

if.then:                                          ; preds = %for.body8
  br label %for.inc40, !dbg !622

if.end:                                           ; preds = %for.body8
  %16 = load double, double* %z, align 8, !dbg !623
  %call25 = call double @sqrt(double %16) #4, !dbg !624
  store double %call25, double* %z, align 8, !dbg !625
  %17 = load double, double* %x, align 8, !dbg !626
  %18 = load double, double* %y, align 8, !dbg !627
  %19 = load double, double* %z, align 8, !dbg !628
  %call26 = call double @get_noise3(double %17, double %18, double %19), !dbg !629
  store double %call26, double* %w, align 8, !dbg !630
  %20 = load double, double* %w, align 8, !dbg !631
  %add27 = fadd double %20, 1.000000e+00, !dbg !632
  %div28 = fdiv double %add27, 2.000000e+00, !dbg !633
  store double %div28, double* %w, align 8, !dbg !634
  %21 = load double, double* %x, align 8, !dbg !635
  %add29 = fadd double 1.000000e+00, %21, !dbg !636
  %22 = load double, double* %y, align 8, !dbg !637
  %sub30 = fsub double %add29, %22, !dbg !638
  %23 = load double, double* %z, align 8, !dbg !639
  %add31 = fadd double %sub30, %23, !dbg !640
  %div32 = fdiv double %add31, 3.500000e+00, !dbg !641
  %24 = load double, double* %w, align 8, !dbg !642
  %mul33 = fmul double %24, %div32, !dbg !642
  store double %mul33, double* %w, align 8, !dbg !642
  %25 = load double, double* %w, align 8, !dbg !643
  %cmp34 = fcmp olt double %25, 0.000000e+00, !dbg !645
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !646

if.then36:                                        ; preds = %if.end
  store double 0.000000e+00, double* %w, align 8, !dbg !647
  br label %if.end37, !dbg !648

if.end37:                                         ; preds = %if.then36, %if.end
  %26 = load double, double* %w, align 8, !dbg !649
  %mul38 = fmul double %26, 2.550000e+02, !dbg !650
  %conv39 = fptoui double %mul38 to i8, !dbg !649
  %27 = load i8*, i8** %p, align 8, !dbg !651
  store i8 %conv39, i8* %27, align 1, !dbg !652
  br label %for.inc40, !dbg !653

for.inc40:                                        ; preds = %if.end37, %if.then
  %28 = load i32, i32* %j, align 4, !dbg !654
  %inc41 = add nsw i32 %28, 1, !dbg !654
  store i32 %inc41, i32* %j, align 4, !dbg !654
  %29 = load i8*, i8** %p, align 8, !dbg !655
  %incdec.ptr42 = getelementptr inbounds i8, i8* %29, i32 1, !dbg !655
  store i8* %incdec.ptr42, i8** %p, align 8, !dbg !655
  br label %for.cond5, !dbg !656, !llvm.loop !657

for.end43:                                        ; preds = %for.cond5
  br label %for.inc44, !dbg !659

for.inc44:                                        ; preds = %for.end43
  %30 = load i32, i32* %i, align 4, !dbg !660
  %inc45 = add nsw i32 %30, 1, !dbg !660
  store i32 %inc45, i32* %i, align 4, !dbg !660
  br label %for.cond2, !dbg !661, !llvm.loop !662

for.end46:                                        ; preds = %for.cond2
  %call47 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !664
  store %struct._IO_FILE* %call47, %struct._IO_FILE** %fp, align 8, !dbg !665
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !666
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !667
  %arraydecay49 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !668
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !669
  %call50 = call i64 @fwrite(i8* %arraydecay49, i64 1, i64 65536, %struct._IO_FILE* %32), !dbg !670
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !671
  %call51 = call i32 @fclose(%struct._IO_FILE* %33), !dbg !672
  ret i32 0, !dbg !673
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 6, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "draw-a-sphere-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Draw-a-sphere")
!4 = !{}
!5 = !{!0, !6, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "scale", scope: !2, file: !3, line: 33, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !10)
!9 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!10 = !{!11}
!11 = !DISubrange(count: 8)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "scale_u", scope: !2, file: !3, line: 33, type: !8, isLocal: false, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !16)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 4)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!22 = distinct !DISubprogram(name: "noise_init", scope: !3, file: !3, line: 34, type: !23, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 36, type: !15)
!26 = !DILocation(line: 36, column: 6, scope: !22)
!27 = !DILocation(line: 37, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !3, line: 37, column: 2)
!29 = !DILocation(line: 37, column: 7, scope: !28)
!30 = !DILocation(line: 37, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 37, column: 2)
!32 = !DILocation(line: 37, column: 16, scope: !31)
!33 = !DILocation(line: 37, column: 2, scope: !28)
!34 = !DILocation(line: 38, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !3, line: 37, column: 29)
!36 = !DILocation(line: 38, column: 30, scope: !35)
!37 = !DILocation(line: 38, column: 23, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 38, column: 16, scope: !35)
!40 = !DILocation(line: 38, column: 9, scope: !35)
!41 = !DILocation(line: 38, column: 3, scope: !35)
!42 = !DILocation(line: 38, column: 12, scope: !35)
!43 = !DILocation(line: 39, column: 22, scope: !35)
!44 = !DILocation(line: 39, column: 16, scope: !35)
!45 = !DILocation(line: 39, column: 32, scope: !35)
!46 = !DILocation(line: 39, column: 34, scope: !35)
!47 = !DILocation(line: 39, column: 27, scope: !35)
!48 = !DILocation(line: 39, column: 25, scope: !35)
!49 = !DILocation(line: 39, column: 11, scope: !35)
!50 = !DILocation(line: 39, column: 3, scope: !35)
!51 = !DILocation(line: 39, column: 14, scope: !35)
!52 = !DILocation(line: 40, column: 2, scope: !35)
!53 = !DILocation(line: 37, column: 25, scope: !31)
!54 = !DILocation(line: 37, column: 2, scope: !31)
!55 = distinct !{!55, !33, !56}
!56 = !DILocation(line: 40, column: 2, scope: !28)
!57 = !DILocation(line: 41, column: 1, scope: !22)
!58 = distinct !DISubprogram(name: "noise", scope: !3, file: !3, line: 43, type: !59, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!9, !61, !15}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!62 = !DILocalVariable(name: "x", arg: 1, scope: !58, file: !3, line: 43, type: !61)
!63 = !DILocation(line: 43, column: 22, scope: !58)
!64 = !DILocalVariable(name: "d", arg: 2, scope: !58, file: !3, line: 43, type: !15)
!65 = !DILocation(line: 43, column: 29, scope: !58)
!66 = !DILocalVariable(name: "i", scope: !58, file: !3, line: 46, type: !15)
!67 = !DILocation(line: 46, column: 15, scope: !58)
!68 = !DILocalVariable(name: "j", scope: !58, file: !3, line: 46, type: !15)
!69 = !DILocation(line: 46, column: 18, scope: !58)
!70 = !DILocalVariable(name: "n", scope: !58, file: !3, line: 47, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !10)
!72 = !DILocation(line: 47, column: 6, scope: !58)
!73 = !DILocalVariable(name: "o", scope: !58, file: !3, line: 47, type: !71)
!74 = !DILocation(line: 47, column: 15, scope: !58)
!75 = !DILocalVariable(name: "g", scope: !58, file: !3, line: 47, type: !71)
!76 = !DILocation(line: 47, column: 24, scope: !58)
!77 = !DILocalVariable(name: "tmp", scope: !58, file: !3, line: 47, type: !15)
!78 = !DILocation(line: 47, column: 33, scope: !58)
!79 = !DILocalVariable(name: "s", scope: !58, file: !3, line: 48, type: !9)
!80 = !DILocation(line: 48, column: 9, scope: !58)
!81 = !DILocalVariable(name: "r", scope: !58, file: !3, line: 48, type: !9)
!82 = !DILocation(line: 48, column: 12, scope: !58)
!83 = !DILocalVariable(name: "t", scope: !58, file: !3, line: 48, type: !9)
!84 = !DILocation(line: 48, column: 15, scope: !58)
!85 = !DILocalVariable(name: "w", scope: !58, file: !3, line: 48, type: !9)
!86 = !DILocation(line: 48, column: 18, scope: !58)
!87 = !DILocalVariable(name: "ret", scope: !58, file: !3, line: 48, type: !9)
!88 = !DILocation(line: 48, column: 21, scope: !58)
!89 = !DILocalVariable(name: "u", scope: !58, file: !3, line: 48, type: !8)
!90 = !DILocation(line: 48, column: 26, scope: !58)
!91 = !DILocation(line: 50, column: 2, scope: !92)
!92 = distinct !DILexicalBlock(scope: !58, file: !3, line: 50, column: 2)
!93 = !DILocation(line: 50, column: 2, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !3, line: 50, column: 2)
!95 = distinct !{!95, !91, !91}
!96 = !DILocation(line: 51, column: 13, scope: !58)
!97 = !DILocation(line: 51, column: 7, scope: !58)
!98 = !DILocation(line: 51, column: 4, scope: !58)
!99 = !DILocation(line: 53, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !58, file: !3, line: 53, column: 2)
!101 = !DILocation(line: 53, column: 7, scope: !100)
!102 = !DILocation(line: 53, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 53, column: 2)
!104 = !DILocation(line: 53, column: 18, scope: !103)
!105 = !DILocation(line: 53, column: 16, scope: !103)
!106 = !DILocation(line: 53, column: 2, scope: !100)
!107 = !DILocation(line: 54, column: 10, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !3, line: 53, column: 26)
!109 = !DILocation(line: 54, column: 5, scope: !108)
!110 = !DILocation(line: 54, column: 3, scope: !108)
!111 = !DILocation(line: 54, column: 8, scope: !108)
!112 = !DILocation(line: 55, column: 7, scope: !108)
!113 = !DILocation(line: 55, column: 9, scope: !108)
!114 = !DILocation(line: 55, column: 14, scope: !108)
!115 = !DILocation(line: 55, column: 12, scope: !108)
!116 = !DILocation(line: 55, column: 5, scope: !108)
!117 = !DILocation(line: 56, column: 10, scope: !108)
!118 = !DILocation(line: 56, column: 28, scope: !108)
!119 = !DILocation(line: 56, column: 22, scope: !108)
!120 = !DILocation(line: 56, column: 17, scope: !108)
!121 = !DILocation(line: 56, column: 15, scope: !108)
!122 = !DILocation(line: 56, column: 20, scope: !108)
!123 = !DILocation(line: 56, column: 14, scope: !108)
!124 = !DILocation(line: 56, column: 12, scope: !108)
!125 = !DILocation(line: 56, column: 5, scope: !108)
!126 = !DILocation(line: 56, column: 3, scope: !108)
!127 = !DILocation(line: 56, column: 8, scope: !108)
!128 = !DILocation(line: 57, column: 2, scope: !108)
!129 = !DILocation(line: 53, column: 22, scope: !103)
!130 = !DILocation(line: 53, column: 2, scope: !103)
!131 = distinct !{!131, !106, !132}
!132 = !DILocation(line: 57, column: 2, scope: !100)
!133 = !DILocation(line: 58, column: 4, scope: !58)
!134 = !DILocation(line: 58, column: 2, scope: !58)
!135 = !DILocation(line: 58, column: 7, scope: !58)
!136 = !DILocation(line: 60, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !58, file: !3, line: 60, column: 2)
!138 = !DILocation(line: 60, column: 7, scope: !137)
!139 = !DILocation(line: 60, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !3, line: 60, column: 2)
!141 = !DILocation(line: 60, column: 18, scope: !140)
!142 = !DILocation(line: 60, column: 20, scope: !140)
!143 = !DILocation(line: 60, column: 16, scope: !140)
!144 = !DILocation(line: 60, column: 2, scope: !137)
!145 = !DILocation(line: 61, column: 12, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !3, line: 61, column: 3)
!147 = !DILocation(line: 61, column: 10, scope: !146)
!148 = !DILocation(line: 61, column: 8, scope: !146)
!149 = !DILocation(line: 61, column: 15, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 61, column: 3)
!151 = !DILocation(line: 61, column: 19, scope: !150)
!152 = !DILocation(line: 61, column: 17, scope: !150)
!153 = !DILocation(line: 61, column: 3, scope: !146)
!154 = !DILocation(line: 62, column: 12, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !3, line: 62, column: 8)
!156 = !DILocation(line: 62, column: 10, scope: !155)
!157 = !DILocation(line: 62, column: 8, scope: !155)
!158 = !DILocation(line: 62, column: 22, scope: !155)
!159 = !DILocation(line: 62, column: 20, scope: !155)
!160 = !DILocation(line: 62, column: 18, scope: !155)
!161 = !DILocation(line: 62, column: 16, scope: !155)
!162 = !DILocation(line: 62, column: 8, scope: !150)
!163 = !DILocation(line: 63, column: 13, scope: !155)
!164 = !DILocation(line: 63, column: 11, scope: !155)
!165 = !DILocation(line: 63, column: 9, scope: !155)
!166 = !DILocation(line: 63, column: 26, scope: !155)
!167 = !DILocation(line: 63, column: 24, scope: !155)
!168 = !DILocation(line: 63, column: 19, scope: !155)
!169 = !DILocation(line: 63, column: 17, scope: !155)
!170 = !DILocation(line: 63, column: 22, scope: !155)
!171 = !DILocation(line: 63, column: 37, scope: !155)
!172 = !DILocation(line: 63, column: 32, scope: !155)
!173 = !DILocation(line: 63, column: 30, scope: !155)
!174 = !DILocation(line: 63, column: 35, scope: !155)
!175 = !DILocation(line: 63, column: 5, scope: !155)
!176 = !DILocation(line: 62, column: 24, scope: !155)
!177 = !DILocation(line: 61, column: 23, scope: !150)
!178 = !DILocation(line: 61, column: 3, scope: !150)
!179 = distinct !{!179, !153, !180}
!180 = !DILocation(line: 63, column: 37, scope: !146)
!181 = !DILocation(line: 60, column: 26, scope: !140)
!182 = !DILocation(line: 60, column: 2, scope: !140)
!183 = distinct !{!183, !144, !184}
!184 = !DILocation(line: 63, column: 37, scope: !137)
!185 = !DILocation(line: 65, column: 10, scope: !58)
!186 = !DILocation(line: 65, column: 6, scope: !58)
!187 = !DILocation(line: 65, column: 17, scope: !58)
!188 = !DILocation(line: 66, column: 9, scope: !189)
!189 = distinct !DILexicalBlock(scope: !58, file: !3, line: 66, column: 2)
!190 = !DILocation(line: 66, column: 16, scope: !189)
!191 = !DILocation(line: 66, column: 7, scope: !189)
!192 = !DILocation(line: 66, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !3, line: 66, column: 2)
!194 = !DILocation(line: 66, column: 25, scope: !193)
!195 = !DILocation(line: 66, column: 23, scope: !193)
!196 = !DILocation(line: 66, column: 2, scope: !189)
!197 = !DILocation(line: 66, column: 40, scope: !193)
!198 = !DILocation(line: 66, column: 38, scope: !193)
!199 = !DILocation(line: 66, column: 35, scope: !193)
!200 = !DILocation(line: 66, column: 33, scope: !193)
!201 = !DILocation(line: 66, column: 29, scope: !193)
!202 = !DILocation(line: 66, column: 2, scope: !193)
!203 = distinct !{!203, !196, !204}
!204 = !DILocation(line: 66, column: 41, scope: !189)
!205 = !DILocation(line: 67, column: 15, scope: !58)
!206 = !DILocation(line: 67, column: 7, scope: !58)
!207 = !DILocation(line: 67, column: 4, scope: !58)
!208 = !DILocation(line: 69, column: 9, scope: !209)
!209 = distinct !DILexicalBlock(scope: !58, file: !3, line: 69, column: 2)
!210 = !DILocation(line: 69, column: 7, scope: !209)
!211 = !DILocation(line: 69, column: 14, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !3, line: 69, column: 2)
!213 = !DILocation(line: 69, column: 19, scope: !212)
!214 = !DILocation(line: 69, column: 16, scope: !212)
!215 = !DILocation(line: 69, column: 2, scope: !209)
!216 = !DILocation(line: 70, column: 10, scope: !217)
!217 = distinct !DILexicalBlock(scope: !218, file: !3, line: 70, column: 3)
!218 = distinct !DILexicalBlock(scope: !212, file: !3, line: 69, column: 27)
!219 = !DILocation(line: 70, column: 8, scope: !217)
!220 = !DILocation(line: 70, column: 15, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !3, line: 70, column: 3)
!222 = !DILocation(line: 70, column: 19, scope: !221)
!223 = !DILocation(line: 70, column: 17, scope: !221)
!224 = !DILocation(line: 70, column: 3, scope: !217)
!225 = !DILocation(line: 71, column: 11, scope: !221)
!226 = !DILocation(line: 71, column: 13, scope: !221)
!227 = !DILocation(line: 71, column: 18, scope: !221)
!228 = !DILocation(line: 71, column: 16, scope: !221)
!229 = !DILocation(line: 71, column: 24, scope: !221)
!230 = !DILocation(line: 71, column: 22, scope: !221)
!231 = !DILocation(line: 71, column: 20, scope: !221)
!232 = !DILocation(line: 71, column: 6, scope: !221)
!233 = !DILocation(line: 71, column: 4, scope: !221)
!234 = !DILocation(line: 71, column: 9, scope: !221)
!235 = !DILocation(line: 70, column: 23, scope: !221)
!236 = !DILocation(line: 70, column: 3, scope: !221)
!237 = distinct !{!237, !224, !238}
!238 = !DILocation(line: 71, column: 25, scope: !217)
!239 = !DILocation(line: 73, column: 13, scope: !240)
!240 = distinct !DILexicalBlock(scope: !218, file: !3, line: 73, column: 3)
!241 = !DILocation(line: 73, column: 15, scope: !240)
!242 = !DILocation(line: 73, column: 28, scope: !240)
!243 = !DILocation(line: 73, column: 26, scope: !240)
!244 = !DILocation(line: 73, column: 23, scope: !240)
!245 = !DILocation(line: 73, column: 21, scope: !240)
!246 = !DILocation(line: 73, column: 10, scope: !240)
!247 = !DILocation(line: 73, column: 34, scope: !240)
!248 = !DILocation(line: 73, column: 8, scope: !240)
!249 = !DILocation(line: 73, column: 39, scope: !250)
!250 = distinct !DILexicalBlock(scope: !240, file: !3, line: 73, column: 3)
!251 = !DILocation(line: 73, column: 43, scope: !250)
!252 = !DILocation(line: 73, column: 41, scope: !250)
!253 = !DILocation(line: 73, column: 3, scope: !240)
!254 = !DILocation(line: 74, column: 11, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !3, line: 73, column: 51)
!256 = !DILocation(line: 74, column: 9, scope: !255)
!257 = !DILocation(line: 74, column: 18, scope: !255)
!258 = !DILocation(line: 74, column: 16, scope: !255)
!259 = !DILocation(line: 74, column: 14, scope: !255)
!260 = !DILocation(line: 74, column: 6, scope: !255)
!261 = !DILocation(line: 75, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !3, line: 75, column: 8)
!263 = !DILocation(line: 75, column: 10, scope: !262)
!264 = !DILocation(line: 75, column: 8, scope: !255)
!265 = !DILocation(line: 75, column: 16, scope: !262)
!266 = !DILocation(line: 76, column: 3, scope: !255)
!267 = !DILocation(line: 73, column: 47, scope: !250)
!268 = !DILocation(line: 73, column: 3, scope: !250)
!269 = distinct !{!269, !253, !270}
!270 = !DILocation(line: 76, column: 3, scope: !240)
!271 = !DILocation(line: 78, column: 7, scope: !272)
!272 = distinct !DILexicalBlock(scope: !218, file: !3, line: 78, column: 7)
!273 = !DILocation(line: 78, column: 9, scope: !272)
!274 = !DILocation(line: 78, column: 7, scope: !218)
!275 = !DILocation(line: 79, column: 6, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !3, line: 78, column: 15)
!277 = !DILocation(line: 80, column: 11, scope: !276)
!278 = !DILocation(line: 80, column: 14, scope: !276)
!279 = !DILocation(line: 80, column: 17, scope: !276)
!280 = !DILocation(line: 80, column: 4, scope: !276)
!281 = !DILocation(line: 81, column: 11, scope: !282)
!282 = distinct !DILexicalBlock(scope: !276, file: !3, line: 81, column: 4)
!283 = !DILocation(line: 81, column: 9, scope: !282)
!284 = !DILocation(line: 81, column: 16, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !3, line: 81, column: 4)
!286 = !DILocation(line: 81, column: 20, scope: !285)
!287 = !DILocation(line: 81, column: 18, scope: !285)
!288 = !DILocation(line: 81, column: 4, scope: !282)
!289 = !DILocation(line: 82, column: 11, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !3, line: 82, column: 9)
!291 = !DILocation(line: 82, column: 9, scope: !290)
!292 = !DILocation(line: 82, column: 9, scope: !285)
!293 = !DILocation(line: 82, column: 23, scope: !290)
!294 = !DILocation(line: 82, column: 21, scope: !290)
!295 = !DILocation(line: 82, column: 26, scope: !290)
!296 = !DILocation(line: 82, column: 35, scope: !290)
!297 = !DILocation(line: 82, column: 33, scope: !290)
!298 = !DILocation(line: 82, column: 43, scope: !290)
!299 = !DILocation(line: 82, column: 41, scope: !290)
!300 = !DILocation(line: 82, column: 40, scope: !290)
!301 = !DILocation(line: 82, column: 17, scope: !290)
!302 = !DILocation(line: 82, column: 15, scope: !290)
!303 = !DILocation(line: 82, column: 12, scope: !290)
!304 = !DILocation(line: 81, column: 24, scope: !285)
!305 = !DILocation(line: 81, column: 4, scope: !285)
!306 = distinct !{!306, !288, !307}
!307 = !DILocation(line: 82, column: 45, scope: !282)
!308 = !DILocation(line: 83, column: 9, scope: !276)
!309 = !DILocation(line: 83, column: 6, scope: !276)
!310 = !DILocation(line: 84, column: 11, scope: !276)
!311 = !DILocation(line: 84, column: 15, scope: !276)
!312 = !DILocation(line: 84, column: 13, scope: !276)
!313 = !DILocation(line: 84, column: 19, scope: !276)
!314 = !DILocation(line: 84, column: 17, scope: !276)
!315 = !DILocation(line: 84, column: 8, scope: !276)
!316 = !DILocation(line: 85, column: 3, scope: !276)
!317 = !DILocation(line: 87, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !218, file: !3, line: 87, column: 7)
!319 = !DILocation(line: 87, column: 11, scope: !318)
!320 = !DILocation(line: 87, column: 9, scope: !318)
!321 = !DILocation(line: 87, column: 7, scope: !218)
!322 = !DILocation(line: 88, column: 8, scope: !323)
!323 = distinct !DILexicalBlock(scope: !318, file: !3, line: 87, column: 14)
!324 = !DILocation(line: 88, column: 6, scope: !323)
!325 = !DILocation(line: 88, column: 4, scope: !323)
!326 = !DILocation(line: 88, column: 11, scope: !323)
!327 = !DILocation(line: 89, column: 17, scope: !323)
!328 = !DILocation(line: 89, column: 9, scope: !323)
!329 = !DILocation(line: 89, column: 6, scope: !323)
!330 = !DILocation(line: 90, column: 3, scope: !323)
!331 = !DILocation(line: 91, column: 2, scope: !218)
!332 = !DILocation(line: 69, column: 23, scope: !212)
!333 = !DILocation(line: 69, column: 2, scope: !212)
!334 = distinct !{!334, !215, !335}
!335 = !DILocation(line: 91, column: 2, scope: !209)
!336 = !DILocation(line: 92, column: 9, scope: !58)
!337 = !DILocation(line: 92, column: 16, scope: !58)
!338 = !DILocation(line: 92, column: 20, scope: !58)
!339 = !DILocation(line: 92, column: 18, scope: !58)
!340 = !DILocation(line: 92, column: 15, scope: !58)
!341 = !DILocation(line: 92, column: 13, scope: !58)
!342 = !DILocation(line: 92, column: 2, scope: !58)
!343 = distinct !DISubprogram(name: "get_noise2", scope: !3, file: !3, line: 95, type: !344, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!344 = !DISubroutineType(types: !345)
!345 = !{!9, !9, !9}
!346 = !DILocalVariable(name: "x", arg: 1, scope: !343, file: !3, line: 95, type: !9)
!347 = !DILocation(line: 95, column: 26, scope: !343)
!348 = !DILocalVariable(name: "y", arg: 2, scope: !343, file: !3, line: 95, type: !9)
!349 = !DILocation(line: 95, column: 36, scope: !343)
!350 = !DILocalVariable(name: "i", scope: !343, file: !3, line: 97, type: !15)
!351 = !DILocation(line: 97, column: 6, scope: !343)
!352 = !DILocalVariable(name: "ws", scope: !343, file: !3, line: 97, type: !15)
!353 = !DILocation(line: 97, column: 9, scope: !343)
!354 = !DILocalVariable(name: "r", scope: !343, file: !3, line: 98, type: !9)
!355 = !DILocation(line: 98, column: 9, scope: !343)
!356 = !DILocalVariable(name: "v", scope: !343, file: !3, line: 98, type: !357)
!357 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 128, elements: !358)
!358 = !{!359}
!359 = !DISubrange(count: 2)
!360 = !DILocation(line: 98, column: 16, scope: !343)
!361 = !DILocation(line: 100, column: 9, scope: !362)
!362 = distinct !DILexicalBlock(scope: !343, file: !3, line: 100, column: 2)
!363 = !DILocation(line: 100, column: 17, scope: !362)
!364 = !DILocation(line: 100, column: 7, scope: !362)
!365 = !DILocation(line: 100, column: 22, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !3, line: 100, column: 2)
!367 = !DILocation(line: 100, column: 24, scope: !366)
!368 = !DILocation(line: 100, column: 2, scope: !362)
!369 = !DILocation(line: 101, column: 10, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !3, line: 100, column: 41)
!371 = !DILocation(line: 101, column: 14, scope: !370)
!372 = !DILocation(line: 101, column: 12, scope: !370)
!373 = !DILocation(line: 101, column: 3, scope: !370)
!374 = !DILocation(line: 101, column: 8, scope: !370)
!375 = !DILocation(line: 101, column: 24, scope: !370)
!376 = !DILocation(line: 101, column: 28, scope: !370)
!377 = !DILocation(line: 101, column: 26, scope: !370)
!378 = !DILocation(line: 101, column: 17, scope: !370)
!379 = !DILocation(line: 101, column: 22, scope: !370)
!380 = !DILocation(line: 102, column: 14, scope: !370)
!381 = !DILocation(line: 102, column: 8, scope: !370)
!382 = !DILocation(line: 102, column: 5, scope: !370)
!383 = !DILocation(line: 103, column: 6, scope: !370)
!384 = !DILocation(line: 104, column: 2, scope: !370)
!385 = !DILocation(line: 100, column: 34, scope: !366)
!386 = !DILocation(line: 100, column: 2, scope: !366)
!387 = distinct !{!387, !368, !388}
!388 = !DILocation(line: 104, column: 2, scope: !362)
!389 = !DILocation(line: 105, column: 7, scope: !343)
!390 = !DILocation(line: 105, column: 4, scope: !343)
!391 = !DILocation(line: 106, column: 9, scope: !343)
!392 = !DILocation(line: 106, column: 2, scope: !343)
!393 = distinct !DISubprogram(name: "get_noise3", scope: !3, file: !3, line: 109, type: !394, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!394 = !DISubroutineType(types: !395)
!395 = !{!9, !9, !9, !9}
!396 = !DILocalVariable(name: "x", arg: 1, scope: !393, file: !3, line: 109, type: !9)
!397 = !DILocation(line: 109, column: 26, scope: !393)
!398 = !DILocalVariable(name: "y", arg: 2, scope: !393, file: !3, line: 109, type: !9)
!399 = !DILocation(line: 109, column: 36, scope: !393)
!400 = !DILocalVariable(name: "z", arg: 3, scope: !393, file: !3, line: 109, type: !9)
!401 = !DILocation(line: 109, column: 46, scope: !393)
!402 = !DILocalVariable(name: "i", scope: !393, file: !3, line: 111, type: !15)
!403 = !DILocation(line: 111, column: 6, scope: !393)
!404 = !DILocalVariable(name: "ws", scope: !393, file: !3, line: 111, type: !15)
!405 = !DILocation(line: 111, column: 9, scope: !393)
!406 = !DILocalVariable(name: "r", scope: !393, file: !3, line: 112, type: !9)
!407 = !DILocation(line: 112, column: 9, scope: !393)
!408 = !DILocalVariable(name: "v", scope: !393, file: !3, line: 112, type: !409)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 3)
!412 = !DILocation(line: 112, column: 16, scope: !393)
!413 = !DILocalVariable(name: "w", scope: !393, file: !3, line: 112, type: !9)
!414 = !DILocation(line: 112, column: 22, scope: !393)
!415 = !DILocation(line: 114, column: 9, scope: !416)
!416 = distinct !DILexicalBlock(scope: !393, file: !3, line: 114, column: 2)
!417 = !DILocation(line: 114, column: 17, scope: !416)
!418 = !DILocation(line: 114, column: 7, scope: !416)
!419 = !DILocation(line: 114, column: 22, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !3, line: 114, column: 2)
!421 = !DILocation(line: 114, column: 24, scope: !420)
!422 = !DILocation(line: 114, column: 2, scope: !416)
!423 = !DILocation(line: 115, column: 10, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !3, line: 114, column: 40)
!425 = !DILocation(line: 115, column: 14, scope: !424)
!426 = !DILocation(line: 115, column: 12, scope: !424)
!427 = !DILocation(line: 115, column: 3, scope: !424)
!428 = !DILocation(line: 115, column: 8, scope: !424)
!429 = !DILocation(line: 115, column: 24, scope: !424)
!430 = !DILocation(line: 115, column: 28, scope: !424)
!431 = !DILocation(line: 115, column: 26, scope: !424)
!432 = !DILocation(line: 115, column: 17, scope: !424)
!433 = !DILocation(line: 115, column: 22, scope: !424)
!434 = !DILocation(line: 115, column: 38, scope: !424)
!435 = !DILocation(line: 115, column: 42, scope: !424)
!436 = !DILocation(line: 115, column: 40, scope: !424)
!437 = !DILocation(line: 115, column: 31, scope: !424)
!438 = !DILocation(line: 115, column: 36, scope: !424)
!439 = !DILocation(line: 116, column: 15, scope: !424)
!440 = !DILocation(line: 116, column: 10, scope: !424)
!441 = !DILocation(line: 116, column: 9, scope: !424)
!442 = !DILocation(line: 116, column: 5, scope: !424)
!443 = !DILocation(line: 117, column: 14, scope: !424)
!444 = !DILocation(line: 117, column: 8, scope: !424)
!445 = !DILocation(line: 117, column: 22, scope: !424)
!446 = !DILocation(line: 117, column: 20, scope: !424)
!447 = !DILocation(line: 117, column: 5, scope: !424)
!448 = !DILocation(line: 118, column: 9, scope: !424)
!449 = !DILocation(line: 118, column: 6, scope: !424)
!450 = !DILocation(line: 119, column: 2, scope: !424)
!451 = !DILocation(line: 114, column: 33, scope: !420)
!452 = !DILocation(line: 114, column: 2, scope: !420)
!453 = distinct !{!453, !422, !454}
!454 = !DILocation(line: 119, column: 2, scope: !416)
!455 = !DILocation(line: 120, column: 9, scope: !393)
!456 = !DILocation(line: 120, column: 13, scope: !393)
!457 = !DILocation(line: 120, column: 11, scope: !393)
!458 = !DILocation(line: 120, column: 2, scope: !393)
!459 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 124, type: !460, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!460 = !DISubroutineType(types: !461)
!461 = !{!15, !15, !462}
!462 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !463, size: 64)
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!464 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!465 = !DILocalVariable(name: "c", arg: 1, scope: !459, file: !3, line: 124, type: !15)
!466 = !DILocation(line: 124, column: 14, scope: !459)
!467 = !DILocalVariable(name: "v", arg: 2, scope: !459, file: !3, line: 124, type: !462)
!468 = !DILocation(line: 124, column: 24, scope: !459)
!469 = !DILocalVariable(name: "pix", scope: !459, file: !3, line: 126, type: !470)
!470 = !DICompositeType(tag: DW_TAG_array_type, baseType: !471, size: 524288, elements: !472)
!471 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!472 = !{!473}
!473 = !DISubrange(count: 65536)
!474 = !DILocation(line: 126, column: 16, scope: !459)
!475 = !DILocalVariable(name: "p", scope: !459, file: !3, line: 126, type: !476)
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !471, size: 64)
!477 = !DILocation(line: 126, column: 33, scope: !459)
!478 = !DILocalVariable(name: "i", scope: !459, file: !3, line: 127, type: !15)
!479 = !DILocation(line: 127, column: 6, scope: !459)
!480 = !DILocalVariable(name: "j", scope: !459, file: !3, line: 127, type: !15)
!481 = !DILocation(line: 127, column: 9, scope: !459)
!482 = !DILocalVariable(name: "x", scope: !459, file: !3, line: 128, type: !9)
!483 = !DILocation(line: 128, column: 9, scope: !459)
!484 = !DILocalVariable(name: "y", scope: !459, file: !3, line: 128, type: !9)
!485 = !DILocation(line: 128, column: 12, scope: !459)
!486 = !DILocalVariable(name: "z", scope: !459, file: !3, line: 128, type: !9)
!487 = !DILocation(line: 128, column: 15, scope: !459)
!488 = !DILocalVariable(name: "w", scope: !459, file: !3, line: 128, type: !9)
!489 = !DILocation(line: 128, column: 18, scope: !459)
!490 = !DILocalVariable(name: "fp", scope: !459, file: !3, line: 129, type: !491)
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !492, size: 64)
!492 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !493, line: 7, baseType: !494)
!493 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!494 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !495, line: 49, size: 1728, elements: !496)
!495 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!496 = !{!497, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !509, !512, !514, !515, !516, !520, !522, !524, !528, !531, !533, !536, !539, !540, !542, !546, !547}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !494, file: !495, line: 51, baseType: !15, size: 32)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !494, file: !495, line: 54, baseType: !463, size: 64, offset: 64)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !494, file: !495, line: 55, baseType: !463, size: 64, offset: 128)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !494, file: !495, line: 56, baseType: !463, size: 64, offset: 192)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !494, file: !495, line: 57, baseType: !463, size: 64, offset: 256)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !494, file: !495, line: 58, baseType: !463, size: 64, offset: 320)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !494, file: !495, line: 59, baseType: !463, size: 64, offset: 384)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !494, file: !495, line: 60, baseType: !463, size: 64, offset: 448)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !494, file: !495, line: 61, baseType: !463, size: 64, offset: 512)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !494, file: !495, line: 64, baseType: !463, size: 64, offset: 576)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !494, file: !495, line: 65, baseType: !463, size: 64, offset: 640)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !494, file: !495, line: 66, baseType: !463, size: 64, offset: 704)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !494, file: !495, line: 68, baseType: !510, size: 64, offset: 768)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !511, size: 64)
!511 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !495, line: 36, flags: DIFlagFwdDecl)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !494, file: !495, line: 70, baseType: !513, size: 64, offset: 832)
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !494, size: 64)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !494, file: !495, line: 72, baseType: !15, size: 32, offset: 896)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !494, file: !495, line: 73, baseType: !15, size: 32, offset: 928)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !494, file: !495, line: 74, baseType: !517, size: 64, offset: 960)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !518, line: 152, baseType: !519)
!518 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!519 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !494, file: !495, line: 77, baseType: !521, size: 16, offset: 1024)
!521 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!522 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !494, file: !495, line: 78, baseType: !523, size: 8, offset: 1040)
!523 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !494, file: !495, line: 79, baseType: !525, size: 8, offset: 1048)
!525 = !DICompositeType(tag: DW_TAG_array_type, baseType: !464, size: 8, elements: !526)
!526 = !{!527}
!527 = !DISubrange(count: 1)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !494, file: !495, line: 81, baseType: !529, size: 64, offset: 1088)
!529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !530, size: 64)
!530 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !495, line: 43, baseType: null)
!531 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !494, file: !495, line: 89, baseType: !532, size: 64, offset: 1152)
!532 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !518, line: 153, baseType: !519)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !494, file: !495, line: 91, baseType: !534, size: 64, offset: 1216)
!534 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !535, size: 64)
!535 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !495, line: 37, flags: DIFlagFwdDecl)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !494, file: !495, line: 92, baseType: !537, size: 64, offset: 1280)
!537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !538, size: 64)
!538 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !495, line: 38, flags: DIFlagFwdDecl)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !494, file: !495, line: 93, baseType: !513, size: 64, offset: 1344)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !494, file: !495, line: 94, baseType: !541, size: 64, offset: 1408)
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !494, file: !495, line: 95, baseType: !543, size: 64, offset: 1472)
!543 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !544, line: 46, baseType: !545)
!544 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs-old/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!545 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !494, file: !495, line: 96, baseType: !15, size: 32, offset: 1536)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !494, file: !495, line: 98, baseType: !548, size: 160, offset: 1568)
!548 = !DICompositeType(tag: DW_TAG_array_type, baseType: !464, size: 160, elements: !549)
!549 = !{!550}
!550 = !DISubrange(count: 20)
!551 = !DILocation(line: 129, column: 8, scope: !459)
!552 = !DILocation(line: 131, column: 2, scope: !459)
!553 = !DILocation(line: 133, column: 11, scope: !554)
!554 = distinct !DILexicalBlock(scope: !459, file: !3, line: 133, column: 2)
!555 = !DILocation(line: 133, column: 9, scope: !554)
!556 = !DILocation(line: 133, column: 18, scope: !554)
!557 = !DILocation(line: 133, column: 7, scope: !554)
!558 = !DILocation(line: 133, column: 23, scope: !559)
!559 = distinct !DILexicalBlock(scope: !554, file: !3, line: 133, column: 2)
!560 = !DILocation(line: 133, column: 25, scope: !559)
!561 = !DILocation(line: 133, column: 2, scope: !554)
!562 = !DILocation(line: 133, column: 45, scope: !559)
!563 = !DILocation(line: 133, column: 48, scope: !559)
!564 = !DILocation(line: 133, column: 43, scope: !559)
!565 = !DILocation(line: 133, column: 39, scope: !559)
!566 = !DILocation(line: 133, column: 2, scope: !559)
!567 = distinct !{!567, !561, !568}
!568 = !DILocation(line: 133, column: 50, scope: !554)
!569 = !DILocation(line: 135, column: 11, scope: !570)
!570 = distinct !DILexicalBlock(scope: !459, file: !3, line: 135, column: 2)
!571 = !DILocation(line: 135, column: 9, scope: !570)
!572 = !DILocation(line: 135, column: 18, scope: !570)
!573 = !DILocation(line: 135, column: 7, scope: !570)
!574 = !DILocation(line: 135, column: 23, scope: !575)
!575 = distinct !DILexicalBlock(scope: !570, file: !3, line: 135, column: 2)
!576 = !DILocation(line: 135, column: 25, scope: !575)
!577 = !DILocation(line: 135, column: 2, scope: !570)
!578 = !DILocation(line: 136, column: 8, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !3, line: 135, column: 37)
!580 = !DILocation(line: 136, column: 10, scope: !579)
!581 = !DILocation(line: 136, column: 7, scope: !579)
!582 = !DILocation(line: 136, column: 17, scope: !579)
!583 = !DILocation(line: 136, column: 5, scope: !579)
!584 = !DILocation(line: 137, column: 10, scope: !585)
!585 = distinct !DILexicalBlock(scope: !579, file: !3, line: 137, column: 3)
!586 = !DILocation(line: 137, column: 8, scope: !585)
!587 = !DILocation(line: 137, column: 15, scope: !588)
!588 = distinct !DILexicalBlock(scope: !585, file: !3, line: 137, column: 3)
!589 = !DILocation(line: 137, column: 17, scope: !588)
!590 = !DILocation(line: 137, column: 3, scope: !585)
!591 = !DILocation(line: 138, column: 9, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !3, line: 137, column: 34)
!593 = !DILocation(line: 138, column: 11, scope: !592)
!594 = !DILocation(line: 138, column: 8, scope: !592)
!595 = !DILocation(line: 138, column: 18, scope: !592)
!596 = !DILocation(line: 138, column: 6, scope: !592)
!597 = !DILocation(line: 139, column: 21, scope: !592)
!598 = !DILocation(line: 139, column: 22, scope: !592)
!599 = !DILocation(line: 139, column: 29, scope: !592)
!600 = !DILocation(line: 139, column: 30, scope: !592)
!601 = !DILocation(line: 139, column: 10, scope: !592)
!602 = !DILocation(line: 139, column: 37, scope: !592)
!603 = !DILocation(line: 139, column: 42, scope: !592)
!604 = !DILocation(line: 139, column: 48, scope: !592)
!605 = !DILocation(line: 139, column: 46, scope: !592)
!606 = !DILocation(line: 139, column: 9, scope: !592)
!607 = !DILocation(line: 139, column: 5, scope: !592)
!608 = !DILocation(line: 139, column: 7, scope: !592)
!609 = !DILocation(line: 141, column: 11, scope: !592)
!610 = !DILocation(line: 141, column: 13, scope: !592)
!611 = !DILocation(line: 141, column: 12, scope: !592)
!612 = !DILocation(line: 141, column: 9, scope: !592)
!613 = !DILocation(line: 141, column: 17, scope: !592)
!614 = !DILocation(line: 141, column: 19, scope: !592)
!615 = !DILocation(line: 141, column: 18, scope: !592)
!616 = !DILocation(line: 141, column: 15, scope: !592)
!617 = !DILocation(line: 141, column: 6, scope: !592)
!618 = !DILocation(line: 142, column: 8, scope: !619)
!619 = distinct !DILexicalBlock(scope: !592, file: !3, line: 142, column: 8)
!620 = !DILocation(line: 142, column: 10, scope: !619)
!621 = !DILocation(line: 142, column: 8, scope: !592)
!622 = !DILocation(line: 142, column: 15, scope: !619)
!623 = !DILocation(line: 144, column: 13, scope: !592)
!624 = !DILocation(line: 144, column: 8, scope: !592)
!625 = !DILocation(line: 144, column: 6, scope: !592)
!626 = !DILocation(line: 146, column: 19, scope: !592)
!627 = !DILocation(line: 146, column: 22, scope: !592)
!628 = !DILocation(line: 146, column: 25, scope: !592)
!629 = !DILocation(line: 146, column: 8, scope: !592)
!630 = !DILocation(line: 146, column: 6, scope: !592)
!631 = !DILocation(line: 148, column: 9, scope: !592)
!632 = !DILocation(line: 148, column: 11, scope: !592)
!633 = !DILocation(line: 148, column: 16, scope: !592)
!634 = !DILocation(line: 148, column: 6, scope: !592)
!635 = !DILocation(line: 149, column: 14, scope: !592)
!636 = !DILocation(line: 149, column: 12, scope: !592)
!637 = !DILocation(line: 149, column: 18, scope: !592)
!638 = !DILocation(line: 149, column: 16, scope: !592)
!639 = !DILocation(line: 149, column: 22, scope: !592)
!640 = !DILocation(line: 149, column: 20, scope: !592)
!641 = !DILocation(line: 149, column: 25, scope: !592)
!642 = !DILocation(line: 149, column: 6, scope: !592)
!643 = !DILocation(line: 150, column: 8, scope: !644)
!644 = distinct !DILexicalBlock(scope: !592, file: !3, line: 150, column: 8)
!645 = !DILocation(line: 150, column: 10, scope: !644)
!646 = !DILocation(line: 150, column: 8, scope: !592)
!647 = !DILocation(line: 150, column: 17, scope: !644)
!648 = !DILocation(line: 150, column: 15, scope: !644)
!649 = !DILocation(line: 152, column: 9, scope: !592)
!650 = !DILocation(line: 152, column: 11, scope: !592)
!651 = !DILocation(line: 152, column: 5, scope: !592)
!652 = !DILocation(line: 152, column: 7, scope: !592)
!653 = !DILocation(line: 153, column: 3, scope: !592)
!654 = !DILocation(line: 137, column: 25, scope: !588)
!655 = !DILocation(line: 137, column: 30, scope: !588)
!656 = !DILocation(line: 137, column: 3, scope: !588)
!657 = distinct !{!657, !590, !658}
!658 = !DILocation(line: 153, column: 3, scope: !585)
!659 = !DILocation(line: 154, column: 2, scope: !579)
!660 = !DILocation(line: 135, column: 33, scope: !575)
!661 = !DILocation(line: 135, column: 2, scope: !575)
!662 = distinct !{!662, !577, !663}
!663 = !DILocation(line: 154, column: 2, scope: !570)
!664 = !DILocation(line: 156, column: 7, scope: !459)
!665 = !DILocation(line: 156, column: 5, scope: !459)
!666 = !DILocation(line: 157, column: 10, scope: !459)
!667 = !DILocation(line: 157, column: 2, scope: !459)
!668 = !DILocation(line: 158, column: 9, scope: !459)
!669 = !DILocation(line: 158, column: 28, scope: !459)
!670 = !DILocation(line: 158, column: 2, scope: !459)
!671 = !DILocation(line: 159, column: 9, scope: !459)
!672 = !DILocation(line: 159, column: 2, scope: !459)
!673 = !DILocation(line: 161, column: 2, scope: !459)
