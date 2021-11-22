; ModuleID = 'draw-a-sphere-2.c'
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
  br i1 %cmp38, label %if.then, label %if.end, !dbg !162, !cf.info !163

if.then:                                          ; preds = %for.body29
  %36 = load i32, i32* %i, align 4, !dbg !164
  %idxprom40 = sext i32 %36 to i64, !dbg !165
  %arrayidx41 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom40, !dbg !165
  %37 = load i32, i32* %arrayidx41, align 4, !dbg !165
  store i32 %37, i32* %tmp, align 4, !dbg !166
  %38 = load i32, i32* %j, align 4, !dbg !167
  %idxprom42 = sext i32 %38 to i64, !dbg !168
  %arrayidx43 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom42, !dbg !168
  %39 = load i32, i32* %arrayidx43, align 4, !dbg !168
  %40 = load i32, i32* %i, align 4, !dbg !169
  %idxprom44 = sext i32 %40 to i64, !dbg !170
  %arrayidx45 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom44, !dbg !170
  store i32 %39, i32* %arrayidx45, align 4, !dbg !171
  %41 = load i32, i32* %tmp, align 4, !dbg !172
  %42 = load i32, i32* %j, align 4, !dbg !173
  %idxprom46 = sext i32 %42 to i64, !dbg !174
  %arrayidx47 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom46, !dbg !174
  store i32 %41, i32* %arrayidx47, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %for.body29
  br label %for.inc48, !dbg !177

for.inc48:                                        ; preds = %if.end
  %43 = load i32, i32* %j, align 4, !dbg !178
  %inc49 = add nsw i32 %43, 1, !dbg !178
  store i32 %inc49, i32* %j, align 4, !dbg !178
  br label %for.cond26, !dbg !179, !llvm.loop !180

for.end50:                                        ; preds = %for.cond26
  br label %for.inc51, !dbg !181

for.inc51:                                        ; preds = %for.end50
  %44 = load i32, i32* %i, align 4, !dbg !182
  %inc52 = add nsw i32 %44, 1, !dbg !182
  store i32 %inc52, i32* %i, align 4, !dbg !182
  br label %for.cond21, !dbg !183, !llvm.loop !184

for.end53:                                        ; preds = %for.cond21
  store double 0.000000e+00, double* %w, align 8, !dbg !186
  store double 0.000000e+00, double* %ret, align 8, !dbg !187
  store double 1.000000e+00, double* %r, align 8, !dbg !188
  store double 0.000000e+00, double* %s, align 8, !dbg !189
  store i32 0, i32* %j, align 4, !dbg !191
  br label %for.cond54, !dbg !192

for.cond54:                                       ; preds = %for.inc62, %for.end53
  %45 = load i32, i32* %j, align 4, !dbg !193
  %46 = load i32, i32* %d.addr, align 4, !dbg !195
  %cmp55 = icmp slt i32 %45, %46, !dbg !196
  br i1 %cmp55, label %for.body57, label %for.end64, !dbg !197

for.body57:                                       ; preds = %for.cond54
  %47 = load i32, i32* %j, align 4, !dbg !198
  %idxprom58 = sext i32 %47 to i64, !dbg !199
  %arrayidx59 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom58, !dbg !199
  %48 = load i32, i32* %arrayidx59, align 4, !dbg !199
  %conv60 = sitofp i32 %48 to double, !dbg !199
  %49 = load double, double* %s, align 8, !dbg !200
  %add61 = fadd double %49, %conv60, !dbg !200
  store double %add61, double* %s, align 8, !dbg !200
  br label %for.inc62, !dbg !201

for.inc62:                                        ; preds = %for.body57
  %50 = load i32, i32* %j, align 4, !dbg !202
  %inc63 = add nsw i32 %50, 1, !dbg !202
  store i32 %inc63, i32* %j, align 4, !dbg !202
  br label %for.cond54, !dbg !203, !llvm.loop !204

for.end64:                                        ; preds = %for.cond54
  %51 = load i32, i32* %d.addr, align 4, !dbg !206
  %idxprom65 = sext i32 %51 to i64, !dbg !207
  %arrayidx66 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom65, !dbg !207
  %52 = load double, double* %arrayidx66, align 8, !dbg !207
  %53 = load double, double* %s, align 8, !dbg !208
  %mul67 = fmul double %53, %52, !dbg !208
  store double %mul67, double* %s, align 8, !dbg !208
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond68, !dbg !211

for.cond68:                                       ; preds = %for.inc150, %for.end64
  %54 = load i32, i32* %i, align 4, !dbg !212
  %55 = load i32, i32* %d.addr, align 4, !dbg !214
  %cmp69 = icmp sle i32 %54, %55, !dbg !215
  br i1 %cmp69, label %for.body71, label %for.end152, !dbg !216

for.body71:                                       ; preds = %for.cond68
  store i32 0, i32* %j, align 4, !dbg !217
  br label %for.cond72, !dbg !220

for.cond72:                                       ; preds = %for.inc85, %for.body71
  %56 = load i32, i32* %j, align 4, !dbg !221
  %57 = load i32, i32* %d.addr, align 4, !dbg !223
  %cmp73 = icmp slt i32 %56, %57, !dbg !224
  br i1 %cmp73, label %for.body75, label %for.end87, !dbg !225

for.body75:                                       ; preds = %for.cond72
  %58 = load double*, double** %x.addr, align 8, !dbg !226
  %59 = load i32, i32* %j, align 4, !dbg !227
  %idxprom76 = sext i32 %59 to i64, !dbg !226
  %arrayidx77 = getelementptr inbounds double, double* %58, i64 %idxprom76, !dbg !226
  %60 = load double, double* %arrayidx77, align 8, !dbg !226
  %61 = load double, double* %s, align 8, !dbg !228
  %add78 = fadd double %60, %61, !dbg !229
  %62 = load i32, i32* %j, align 4, !dbg !230
  %idxprom79 = sext i32 %62 to i64, !dbg !231
  %arrayidx80 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom79, !dbg !231
  %63 = load i32, i32* %arrayidx80, align 4, !dbg !231
  %conv81 = sitofp i32 %63 to double, !dbg !231
  %sub82 = fsub double %add78, %conv81, !dbg !232
  %64 = load i32, i32* %j, align 4, !dbg !233
  %idxprom83 = sext i32 %64 to i64, !dbg !234
  %arrayidx84 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom83, !dbg !234
  store double %sub82, double* %arrayidx84, align 8, !dbg !235
  br label %for.inc85, !dbg !234

for.inc85:                                        ; preds = %for.body75
  %65 = load i32, i32* %j, align 4, !dbg !236
  %inc86 = add nsw i32 %65, 1, !dbg !236
  store i32 %inc86, i32* %j, align 4, !dbg !236
  br label %for.cond72, !dbg !237, !llvm.loop !238

for.end87:                                        ; preds = %for.cond72
  %66 = load i32, i32* %d.addr, align 4, !dbg !240
  %conv88 = sitofp i32 %66 to double, !dbg !240
  %add89 = fadd double %conv88, 1.000000e+00, !dbg !242
  %67 = load i32, i32* %d.addr, align 4, !dbg !243
  %mul90 = mul nsw i32 2, %67, !dbg !244
  %conv91 = sitofp i32 %mul90 to double, !dbg !245
  %div = fdiv double %add89, %conv91, !dbg !246
  store double %div, double* %t, align 8, !dbg !247
  store i32 0, i32* %j, align 4, !dbg !248
  br label %for.cond92, !dbg !249

for.cond92:                                       ; preds = %for.inc106, %for.end87
  %68 = load i32, i32* %j, align 4, !dbg !250
  %69 = load i32, i32* %d.addr, align 4, !dbg !252
  %cmp93 = icmp slt i32 %68, %69, !dbg !253
  br i1 %cmp93, label %for.body95, label %for.end108, !dbg !254

for.body95:                                       ; preds = %for.cond92
  %70 = load i32, i32* %j, align 4, !dbg !255
  %idxprom96 = sext i32 %70 to i64, !dbg !257
  %arrayidx97 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom96, !dbg !257
  %71 = load double, double* %arrayidx97, align 8, !dbg !257
  %72 = load i32, i32* %j, align 4, !dbg !258
  %idxprom98 = sext i32 %72 to i64, !dbg !259
  %arrayidx99 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom98, !dbg !259
  %73 = load double, double* %arrayidx99, align 8, !dbg !259
  %mul100 = fmul double %71, %73, !dbg !260
  %74 = load double, double* %t, align 8, !dbg !261
  %sub101 = fsub double %74, %mul100, !dbg !261
  store double %sub101, double* %t, align 8, !dbg !261
  %75 = load double, double* %t, align 8, !dbg !262
  %cmp102 = fcmp ole double %75, 0.000000e+00, !dbg !264
  br i1 %cmp102, label %if.then104, label %if.end105, !dbg !265, !cf.info !163

if.then104:                                       ; preds = %for.body95
  br label %for.end108, !dbg !266

if.end105:                                        ; preds = %for.body95
  br label %for.inc106, !dbg !267

for.inc106:                                       ; preds = %if.end105
  %76 = load i32, i32* %j, align 4, !dbg !268
  %inc107 = add nsw i32 %76, 1, !dbg !268
  store i32 %inc107, i32* %j, align 4, !dbg !268
  br label %for.cond92, !dbg !269, !llvm.loop !270

for.end108:                                       ; preds = %if.then104, %for.cond92
  %77 = load double, double* %t, align 8, !dbg !272
  %cmp109 = fcmp oge double %77, 0.000000e+00, !dbg !274
  br i1 %cmp109, label %if.then111, label %if.end137, !dbg !275, !cf.info !163

if.then111:                                       ; preds = %for.end108
  store double 0.000000e+00, double* %r, align 8, !dbg !276
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 0, !dbg !278
  %arraydecay112 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 0, !dbg !279
  %78 = load i32, i32* %d.addr, align 4, !dbg !280
  call void @hashed(i32* %arraydecay, i32* %arraydecay112, i32 %78), !dbg !281
  store i32 0, i32* %j, align 4, !dbg !282
  br label %for.cond113, !dbg !284

for.cond113:                                      ; preds = %for.inc130, %if.then111
  %79 = load i32, i32* %j, align 4, !dbg !285
  %80 = load i32, i32* %d.addr, align 4, !dbg !287
  %cmp114 = icmp slt i32 %79, %80, !dbg !288
  br i1 %cmp114, label %for.body116, label %for.end132, !dbg !289

for.body116:                                      ; preds = %for.cond113
  %81 = load i32, i32* %j, align 4, !dbg !290
  %idxprom117 = sext i32 %81 to i64, !dbg !292
  %arrayidx118 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom117, !dbg !292
  %82 = load i32, i32* %arrayidx118, align 4, !dbg !292
  %tobool = icmp ne i32 %82, 0, !dbg !292
  br i1 %tobool, label %if.then119, label %if.end129, !dbg !293, !cf.info !163

if.then119:                                       ; preds = %for.body116
  %83 = load i32, i32* %j, align 4, !dbg !294
  %idxprom120 = sext i32 %83 to i64, !dbg !295
  %arrayidx121 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom120, !dbg !295
  %84 = load i32, i32* %arrayidx121, align 4, !dbg !295
  %cmp122 = icmp eq i32 %84, 1, !dbg !296
  br i1 %cmp122, label %cond.true, label %cond.false, !dbg !295

cond.true:                                        ; preds = %if.then119
  %85 = load i32, i32* %j, align 4, !dbg !297
  %idxprom124 = sext i32 %85 to i64, !dbg !298
  %arrayidx125 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom124, !dbg !298
  %86 = load double, double* %arrayidx125, align 8, !dbg !298
  br label %cond.end, !dbg !295

cond.false:                                       ; preds = %if.then119
  %87 = load i32, i32* %j, align 4, !dbg !299
  %idxprom126 = sext i32 %87 to i64, !dbg !300
  %arrayidx127 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom126, !dbg !300
  %88 = load double, double* %arrayidx127, align 8, !dbg !300
  %fneg = fneg double %88, !dbg !301
  br label %cond.end, !dbg !295

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %86, %cond.true ], [ %fneg, %cond.false ], !dbg !295
  %89 = load double, double* %r, align 8, !dbg !302
  %add128 = fadd double %89, %cond, !dbg !302
  store double %add128, double* %r, align 8, !dbg !302
  br label %if.end129, !dbg !303

if.end129:                                        ; preds = %cond.end, %for.body116
  br label %for.inc130, !dbg !304

for.inc130:                                       ; preds = %if.end129
  %90 = load i32, i32* %j, align 4, !dbg !305
  %inc131 = add nsw i32 %90, 1, !dbg !305
  store i32 %inc131, i32* %j, align 4, !dbg !305
  br label %for.cond113, !dbg !306, !llvm.loop !307

for.end132:                                       ; preds = %for.cond113
  %91 = load double, double* %t, align 8, !dbg !309
  %92 = load double, double* %t, align 8, !dbg !310
  %mul133 = fmul double %92, %91, !dbg !310
  store double %mul133, double* %t, align 8, !dbg !310
  %93 = load double, double* %r, align 8, !dbg !311
  %94 = load double, double* %t, align 8, !dbg !312
  %mul134 = fmul double %93, %94, !dbg !313
  %95 = load double, double* %t, align 8, !dbg !314
  %mul135 = fmul double %mul134, %95, !dbg !315
  %96 = load double, double* %ret, align 8, !dbg !316
  %add136 = fadd double %96, %mul135, !dbg !316
  store double %add136, double* %ret, align 8, !dbg !316
  br label %if.end137, !dbg !317

if.end137:                                        ; preds = %for.end132, %for.end108
  %97 = load i32, i32* %i, align 4, !dbg !318
  %98 = load i32, i32* %d.addr, align 4, !dbg !320
  %cmp138 = icmp slt i32 %97, %98, !dbg !321
  br i1 %cmp138, label %if.then140, label %if.end149, !dbg !322, !cf.info !163

if.then140:                                       ; preds = %if.end137
  %99 = load i32, i32* %i, align 4, !dbg !323
  %idxprom141 = sext i32 %99 to i64, !dbg !325
  %arrayidx142 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom141, !dbg !325
  %100 = load i32, i32* %arrayidx142, align 4, !dbg !325
  %idxprom143 = sext i32 %100 to i64, !dbg !326
  %arrayidx144 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom143, !dbg !326
  %101 = load i32, i32* %arrayidx144, align 4, !dbg !327
  %inc145 = add nsw i32 %101, 1, !dbg !327
  store i32 %inc145, i32* %arrayidx144, align 4, !dbg !327
  %102 = load i32, i32* %d.addr, align 4, !dbg !328
  %idxprom146 = sext i32 %102 to i64, !dbg !329
  %arrayidx147 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom146, !dbg !329
  %103 = load double, double* %arrayidx147, align 8, !dbg !329
  %104 = load double, double* %s, align 8, !dbg !330
  %add148 = fadd double %104, %103, !dbg !330
  store double %add148, double* %s, align 8, !dbg !330
  br label %if.end149, !dbg !331

if.end149:                                        ; preds = %if.then140, %if.end137
  br label %for.inc150, !dbg !332

for.inc150:                                       ; preds = %if.end149
  %105 = load i32, i32* %i, align 4, !dbg !333
  %inc151 = add nsw i32 %105, 1, !dbg !333
  store i32 %inc151, i32* %i, align 4, !dbg !333
  br label %for.cond68, !dbg !334, !llvm.loop !335

for.end152:                                       ; preds = %for.cond68
  %106 = load double, double* %ret, align 8, !dbg !337
  %107 = load i32, i32* %d.addr, align 4, !dbg !338
  %108 = load i32, i32* %d.addr, align 4, !dbg !339
  %mul153 = mul nsw i32 %107, %108, !dbg !340
  %conv154 = sitofp i32 %mul153 to double, !dbg !341
  %mul155 = fmul double %106, %conv154, !dbg !342
  ret double %mul155, !dbg !343
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

declare dso_local void @hashed(i32*, i32*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise2(double %x, double %y) #0 !dbg !344 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %i = alloca i32, align 4
  %ws = alloca i32, align 4
  %r = alloca double, align 8
  %v = alloca [2 x double], align 16
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !347, metadata !DIExpression()), !dbg !348
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !349, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata i32* %i, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata i32* %ws, metadata !353, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata double* %r, metadata !355, metadata !DIExpression()), !dbg !356
  store double 0.000000e+00, double* %r, align 8, !dbg !356
  call void @llvm.dbg.declare(metadata [2 x double]* %v, metadata !357, metadata !DIExpression()), !dbg !361
  store i32 1, i32* %i, align 4, !dbg !362
  store i32 0, i32* %ws, align 4, !dbg !364
  br label %for.cond, !dbg !365

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !366
  %cmp = icmp sle i32 %0, 128, !dbg !368
  br i1 %cmp, label %for.body, label %for.end, !dbg !369

for.body:                                         ; preds = %for.cond
  %1 = load double, double* %x.addr, align 8, !dbg !370
  %2 = load i32, i32* %i, align 4, !dbg !372
  %conv = sitofp i32 %2 to double, !dbg !372
  %mul = fmul double %1, %conv, !dbg !373
  %arrayidx = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !374
  store double %mul, double* %arrayidx, align 16, !dbg !375
  %3 = load double, double* %y.addr, align 8, !dbg !376
  %4 = load i32, i32* %i, align 4, !dbg !377
  %conv1 = sitofp i32 %4 to double, !dbg !377
  %mul2 = fmul double %3, %conv1, !dbg !378
  %arrayidx3 = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 1, !dbg !379
  store double %mul2, double* %arrayidx3, align 8, !dbg !380
  %arraydecay = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !381
  %call = call double @noise(double* %arraydecay, i32 2), !dbg !382
  %5 = load double, double* %r, align 8, !dbg !383
  %add = fadd double %5, %call, !dbg !383
  store double %add, double* %r, align 8, !dbg !383
  %6 = load i32, i32* %ws, align 4, !dbg !384
  %inc = add nsw i32 %6, 1, !dbg !384
  store i32 %inc, i32* %ws, align 4, !dbg !384
  br label %for.inc, !dbg !385

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !386
  %shl = shl i32 %7, 1, !dbg !386
  store i32 %shl, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !387, !llvm.loop !388

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %ws, align 4, !dbg !390
  %conv4 = sitofp i32 %8 to double, !dbg !390
  %9 = load double, double* %r, align 8, !dbg !391
  %div = fdiv double %9, %conv4, !dbg !391
  store double %div, double* %r, align 8, !dbg !391
  %10 = load double, double* %r, align 8, !dbg !392
  ret double %10, !dbg !393
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise3(double %x, double %y, double %z) #0 !dbg !394 {
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
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !397, metadata !DIExpression()), !dbg !398
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !399, metadata !DIExpression()), !dbg !400
  store double %z, double* %z.addr, align 8
  call void @llvm.dbg.declare(metadata double* %z.addr, metadata !401, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata i32* %i, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i32* %ws, metadata !405, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata double* %r, metadata !407, metadata !DIExpression()), !dbg !408
  store double 0.000000e+00, double* %r, align 8, !dbg !408
  call void @llvm.dbg.declare(metadata [3 x double]* %v, metadata !409, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata double* %w, metadata !414, metadata !DIExpression()), !dbg !415
  store i32 1, i32* %i, align 4, !dbg !416
  store i32 0, i32* %ws, align 4, !dbg !418
  br label %for.cond, !dbg !419

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !420
  %cmp = icmp sle i32 %0, 32, !dbg !422
  br i1 %cmp, label %for.body, label %for.end, !dbg !423

for.body:                                         ; preds = %for.cond
  %1 = load double, double* %x.addr, align 8, !dbg !424
  %2 = load i32, i32* %i, align 4, !dbg !426
  %conv = sitofp i32 %2 to double, !dbg !426
  %mul = fmul double %1, %conv, !dbg !427
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !428
  store double %mul, double* %arrayidx, align 16, !dbg !429
  %3 = load double, double* %y.addr, align 8, !dbg !430
  %4 = load i32, i32* %i, align 4, !dbg !431
  %conv1 = sitofp i32 %4 to double, !dbg !431
  %mul2 = fmul double %3, %conv1, !dbg !432
  %arrayidx3 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 1, !dbg !433
  store double %mul2, double* %arrayidx3, align 8, !dbg !434
  %5 = load double, double* %z.addr, align 8, !dbg !435
  %6 = load i32, i32* %i, align 4, !dbg !436
  %conv4 = sitofp i32 %6 to double, !dbg !436
  %mul5 = fmul double %5, %conv4, !dbg !437
  %arrayidx6 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 2, !dbg !438
  store double %mul5, double* %arrayidx6, align 16, !dbg !439
  %7 = load i32, i32* %i, align 4, !dbg !440
  %conv7 = sitofp i32 %7 to double, !dbg !440
  %call = call double @sqrt(double %conv7) #4, !dbg !441
  %div = fdiv double 1.000000e+00, %call, !dbg !442
  store double %div, double* %w, align 8, !dbg !443
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !444
  %call8 = call double @noise(double* %arraydecay, i32 3), !dbg !445
  %8 = load double, double* %w, align 8, !dbg !446
  %mul9 = fmul double %call8, %8, !dbg !447
  %9 = load double, double* %r, align 8, !dbg !448
  %add = fadd double %9, %mul9, !dbg !448
  store double %add, double* %r, align 8, !dbg !448
  %10 = load double, double* %w, align 8, !dbg !449
  %11 = load i32, i32* %ws, align 4, !dbg !450
  %conv10 = sitofp i32 %11 to double, !dbg !450
  %add11 = fadd double %conv10, %10, !dbg !450
  %conv12 = fptosi double %add11 to i32, !dbg !450
  store i32 %conv12, i32* %ws, align 4, !dbg !450
  br label %for.inc, !dbg !451

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !452
  %shl = shl i32 %12, 1, !dbg !452
  store i32 %shl, i32* %i, align 4, !dbg !452
  br label %for.cond, !dbg !453, !llvm.loop !454

for.end:                                          ; preds = %for.cond
  %13 = load double, double* %r, align 8, !dbg !456
  %14 = load i32, i32* %ws, align 4, !dbg !457
  %conv13 = sitofp i32 %14 to double, !dbg !457
  %div14 = fdiv double %13, %conv13, !dbg !458
  ret double %div14, !dbg !459
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !460 {
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
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !466, metadata !DIExpression()), !dbg !467
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata [65536 x i8]* %pix, metadata !470, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata i8** %p, metadata !476, metadata !DIExpression()), !dbg !478
  call void @llvm.dbg.declare(metadata i32* %i, metadata !479, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.declare(metadata i32* %j, metadata !481, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.declare(metadata double* %x, metadata !483, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.declare(metadata double* %y, metadata !485, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata double* %z, metadata !487, metadata !DIExpression()), !dbg !488
  call void @llvm.dbg.declare(metadata double* %w, metadata !489, metadata !DIExpression()), !dbg !490
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !491, metadata !DIExpression()), !dbg !552
  call void @noise_init(), !dbg !553
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !554
  store i8* %arraydecay, i8** %p, align 8, !dbg !556
  store i32 0, i32* %i, align 4, !dbg !557
  br label %for.cond, !dbg !558

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !559
  %cmp = icmp slt i32 %0, 65536, !dbg !561
  br i1 %cmp, label %for.body, label %for.end, !dbg !562

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %p, align 8, !dbg !563
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1, !dbg !563
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !563
  store i8 0, i8* %1, align 1, !dbg !564
  br label %for.inc, !dbg !565

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !566
  %inc = add nsw i32 %2, 1, !dbg !566
  store i32 %inc, i32* %i, align 4, !dbg !566
  br label %for.cond, !dbg !567, !llvm.loop !568

for.end:                                          ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !570
  store i8* %arraydecay1, i8** %p, align 8, !dbg !572
  store i32 0, i32* %i, align 4, !dbg !573
  br label %for.cond2, !dbg !574

for.cond2:                                        ; preds = %for.inc44, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !575
  %cmp3 = icmp slt i32 %3, 256, !dbg !577
  br i1 %cmp3, label %for.body4, label %for.end46, !dbg !578

for.body4:                                        ; preds = %for.cond2
  %4 = load i32, i32* %i, align 4, !dbg !579
  %sub = sub nsw i32 %4, 128, !dbg !581
  %conv = sitofp i32 %sub to double, !dbg !582
  %div = fdiv double %conv, 1.250000e+02, !dbg !583
  store double %div, double* %y, align 8, !dbg !584
  store i32 0, i32* %j, align 4, !dbg !585
  br label %for.cond5, !dbg !587

for.cond5:                                        ; preds = %for.inc40, %for.body4
  %5 = load i32, i32* %j, align 4, !dbg !588
  %cmp6 = icmp slt i32 %5, 256, !dbg !590
  br i1 %cmp6, label %for.body8, label %for.end43, !dbg !591

for.body8:                                        ; preds = %for.cond5
  %6 = load i32, i32* %j, align 4, !dbg !592
  %sub9 = sub nsw i32 %6, 128, !dbg !594
  %conv10 = sitofp i32 %sub9 to double, !dbg !595
  %div11 = fdiv double %conv10, 1.250000e+02, !dbg !596
  store double %div11, double* %x, align 8, !dbg !597
  %7 = load i32, i32* %i, align 4, !dbg !598
  %conv12 = sitofp i32 %7 to double, !dbg !598
  %div13 = fdiv double %conv12, 2.560000e+02, !dbg !599
  %8 = load i32, i32* %j, align 4, !dbg !600
  %conv14 = sitofp i32 %8 to double, !dbg !600
  %div15 = fdiv double %conv14, 2.560000e+02, !dbg !601
  %call = call double @get_noise2(double %div13, double %div15), !dbg !602
  %add = fadd double %call, 1.000000e+00, !dbg !603
  %div16 = fdiv double %add, 6.000000e+00, !dbg !604
  %9 = load i32, i32* %i, align 4, !dbg !605
  %conv17 = sitofp i32 %9 to double, !dbg !605
  %mul = fmul double %div16, %conv17, !dbg !606
  %conv18 = fptoui double %mul to i8, !dbg !607
  %10 = load i8*, i8** %p, align 8, !dbg !608
  store i8 %conv18, i8* %10, align 1, !dbg !609
  %11 = load double, double* %x, align 8, !dbg !610
  %12 = load double, double* %x, align 8, !dbg !611
  %mul19 = fmul double %11, %12, !dbg !612
  %sub20 = fsub double 1.000000e+00, %mul19, !dbg !613
  %13 = load double, double* %y, align 8, !dbg !614
  %14 = load double, double* %y, align 8, !dbg !615
  %mul21 = fmul double %13, %14, !dbg !616
  %sub22 = fsub double %sub20, %mul21, !dbg !617
  store double %sub22, double* %z, align 8, !dbg !618
  %15 = load double, double* %z, align 8, !dbg !619
  %cmp23 = fcmp olt double %15, 0.000000e+00, !dbg !621
  br i1 %cmp23, label %if.then, label %if.end, !dbg !622, !cf.info !163

if.then:                                          ; preds = %for.body8
  br label %for.inc40, !dbg !623

if.end:                                           ; preds = %for.body8
  %16 = load double, double* %z, align 8, !dbg !624
  %call25 = call double @sqrt(double %16) #4, !dbg !625
  store double %call25, double* %z, align 8, !dbg !626
  %17 = load double, double* %x, align 8, !dbg !627
  %18 = load double, double* %y, align 8, !dbg !628
  %19 = load double, double* %z, align 8, !dbg !629
  %call26 = call double @get_noise3(double %17, double %18, double %19), !dbg !630
  store double %call26, double* %w, align 8, !dbg !631
  %20 = load double, double* %w, align 8, !dbg !632
  %add27 = fadd double %20, 1.000000e+00, !dbg !633
  %div28 = fdiv double %add27, 2.000000e+00, !dbg !634
  store double %div28, double* %w, align 8, !dbg !635
  %21 = load double, double* %x, align 8, !dbg !636
  %add29 = fadd double 1.000000e+00, %21, !dbg !637
  %22 = load double, double* %y, align 8, !dbg !638
  %sub30 = fsub double %add29, %22, !dbg !639
  %23 = load double, double* %z, align 8, !dbg !640
  %add31 = fadd double %sub30, %23, !dbg !641
  %div32 = fdiv double %add31, 3.500000e+00, !dbg !642
  %24 = load double, double* %w, align 8, !dbg !643
  %mul33 = fmul double %24, %div32, !dbg !643
  store double %mul33, double* %w, align 8, !dbg !643
  %25 = load double, double* %w, align 8, !dbg !644
  %cmp34 = fcmp olt double %25, 0.000000e+00, !dbg !646
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !647, !cf.info !163

if.then36:                                        ; preds = %if.end
  store double 0.000000e+00, double* %w, align 8, !dbg !648
  br label %if.end37, !dbg !649

if.end37:                                         ; preds = %if.then36, %if.end
  %26 = load double, double* %w, align 8, !dbg !650
  %mul38 = fmul double %26, 2.550000e+02, !dbg !651
  %conv39 = fptoui double %mul38 to i8, !dbg !650
  %27 = load i8*, i8** %p, align 8, !dbg !652
  store i8 %conv39, i8* %27, align 1, !dbg !653
  br label %for.inc40, !dbg !654

for.inc40:                                        ; preds = %if.end37, %if.then
  %28 = load i32, i32* %j, align 4, !dbg !655
  %inc41 = add nsw i32 %28, 1, !dbg !655
  store i32 %inc41, i32* %j, align 4, !dbg !655
  %29 = load i8*, i8** %p, align 8, !dbg !656
  %incdec.ptr42 = getelementptr inbounds i8, i8* %29, i32 1, !dbg !656
  store i8* %incdec.ptr42, i8** %p, align 8, !dbg !656
  br label %for.cond5, !dbg !657, !llvm.loop !658

for.end43:                                        ; preds = %for.cond5
  br label %for.inc44, !dbg !660

for.inc44:                                        ; preds = %for.end43
  %30 = load i32, i32* %i, align 4, !dbg !661
  %inc45 = add nsw i32 %30, 1, !dbg !661
  store i32 %inc45, i32* %i, align 4, !dbg !661
  br label %for.cond2, !dbg !662, !llvm.loop !663

for.end46:                                        ; preds = %for.cond2
  %call47 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !665
  store %struct._IO_FILE* %call47, %struct._IO_FILE** %fp, align 8, !dbg !666
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !667
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !668
  %arraydecay49 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !669
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !670
  %call50 = call i64 @fwrite(i8* %arraydecay49, i64 1, i64 65536, %struct._IO_FILE* %32), !dbg !671
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !672
  %call51 = call i32 @fclose(%struct._IO_FILE* %33), !dbg !673
  ret i32 0, !dbg !674
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!163 = !{!"if"}
!164 = !DILocation(line: 63, column: 13, scope: !155)
!165 = !DILocation(line: 63, column: 11, scope: !155)
!166 = !DILocation(line: 63, column: 9, scope: !155)
!167 = !DILocation(line: 63, column: 26, scope: !155)
!168 = !DILocation(line: 63, column: 24, scope: !155)
!169 = !DILocation(line: 63, column: 19, scope: !155)
!170 = !DILocation(line: 63, column: 17, scope: !155)
!171 = !DILocation(line: 63, column: 22, scope: !155)
!172 = !DILocation(line: 63, column: 37, scope: !155)
!173 = !DILocation(line: 63, column: 32, scope: !155)
!174 = !DILocation(line: 63, column: 30, scope: !155)
!175 = !DILocation(line: 63, column: 35, scope: !155)
!176 = !DILocation(line: 63, column: 5, scope: !155)
!177 = !DILocation(line: 62, column: 24, scope: !155)
!178 = !DILocation(line: 61, column: 23, scope: !150)
!179 = !DILocation(line: 61, column: 3, scope: !150)
!180 = distinct !{!180, !153, !181}
!181 = !DILocation(line: 63, column: 37, scope: !146)
!182 = !DILocation(line: 60, column: 26, scope: !140)
!183 = !DILocation(line: 60, column: 2, scope: !140)
!184 = distinct !{!184, !144, !185}
!185 = !DILocation(line: 63, column: 37, scope: !137)
!186 = !DILocation(line: 65, column: 10, scope: !58)
!187 = !DILocation(line: 65, column: 6, scope: !58)
!188 = !DILocation(line: 65, column: 17, scope: !58)
!189 = !DILocation(line: 66, column: 9, scope: !190)
!190 = distinct !DILexicalBlock(scope: !58, file: !3, line: 66, column: 2)
!191 = !DILocation(line: 66, column: 16, scope: !190)
!192 = !DILocation(line: 66, column: 7, scope: !190)
!193 = !DILocation(line: 66, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !3, line: 66, column: 2)
!195 = !DILocation(line: 66, column: 25, scope: !194)
!196 = !DILocation(line: 66, column: 23, scope: !194)
!197 = !DILocation(line: 66, column: 2, scope: !190)
!198 = !DILocation(line: 66, column: 40, scope: !194)
!199 = !DILocation(line: 66, column: 38, scope: !194)
!200 = !DILocation(line: 66, column: 35, scope: !194)
!201 = !DILocation(line: 66, column: 33, scope: !194)
!202 = !DILocation(line: 66, column: 29, scope: !194)
!203 = !DILocation(line: 66, column: 2, scope: !194)
!204 = distinct !{!204, !197, !205}
!205 = !DILocation(line: 66, column: 41, scope: !190)
!206 = !DILocation(line: 67, column: 15, scope: !58)
!207 = !DILocation(line: 67, column: 7, scope: !58)
!208 = !DILocation(line: 67, column: 4, scope: !58)
!209 = !DILocation(line: 69, column: 9, scope: !210)
!210 = distinct !DILexicalBlock(scope: !58, file: !3, line: 69, column: 2)
!211 = !DILocation(line: 69, column: 7, scope: !210)
!212 = !DILocation(line: 69, column: 14, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !3, line: 69, column: 2)
!214 = !DILocation(line: 69, column: 19, scope: !213)
!215 = !DILocation(line: 69, column: 16, scope: !213)
!216 = !DILocation(line: 69, column: 2, scope: !210)
!217 = !DILocation(line: 70, column: 10, scope: !218)
!218 = distinct !DILexicalBlock(scope: !219, file: !3, line: 70, column: 3)
!219 = distinct !DILexicalBlock(scope: !213, file: !3, line: 69, column: 27)
!220 = !DILocation(line: 70, column: 8, scope: !218)
!221 = !DILocation(line: 70, column: 15, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !3, line: 70, column: 3)
!223 = !DILocation(line: 70, column: 19, scope: !222)
!224 = !DILocation(line: 70, column: 17, scope: !222)
!225 = !DILocation(line: 70, column: 3, scope: !218)
!226 = !DILocation(line: 71, column: 11, scope: !222)
!227 = !DILocation(line: 71, column: 13, scope: !222)
!228 = !DILocation(line: 71, column: 18, scope: !222)
!229 = !DILocation(line: 71, column: 16, scope: !222)
!230 = !DILocation(line: 71, column: 24, scope: !222)
!231 = !DILocation(line: 71, column: 22, scope: !222)
!232 = !DILocation(line: 71, column: 20, scope: !222)
!233 = !DILocation(line: 71, column: 6, scope: !222)
!234 = !DILocation(line: 71, column: 4, scope: !222)
!235 = !DILocation(line: 71, column: 9, scope: !222)
!236 = !DILocation(line: 70, column: 23, scope: !222)
!237 = !DILocation(line: 70, column: 3, scope: !222)
!238 = distinct !{!238, !225, !239}
!239 = !DILocation(line: 71, column: 25, scope: !218)
!240 = !DILocation(line: 73, column: 13, scope: !241)
!241 = distinct !DILexicalBlock(scope: !219, file: !3, line: 73, column: 3)
!242 = !DILocation(line: 73, column: 15, scope: !241)
!243 = !DILocation(line: 73, column: 28, scope: !241)
!244 = !DILocation(line: 73, column: 26, scope: !241)
!245 = !DILocation(line: 73, column: 23, scope: !241)
!246 = !DILocation(line: 73, column: 21, scope: !241)
!247 = !DILocation(line: 73, column: 10, scope: !241)
!248 = !DILocation(line: 73, column: 34, scope: !241)
!249 = !DILocation(line: 73, column: 8, scope: !241)
!250 = !DILocation(line: 73, column: 39, scope: !251)
!251 = distinct !DILexicalBlock(scope: !241, file: !3, line: 73, column: 3)
!252 = !DILocation(line: 73, column: 43, scope: !251)
!253 = !DILocation(line: 73, column: 41, scope: !251)
!254 = !DILocation(line: 73, column: 3, scope: !241)
!255 = !DILocation(line: 74, column: 11, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !3, line: 73, column: 51)
!257 = !DILocation(line: 74, column: 9, scope: !256)
!258 = !DILocation(line: 74, column: 18, scope: !256)
!259 = !DILocation(line: 74, column: 16, scope: !256)
!260 = !DILocation(line: 74, column: 14, scope: !256)
!261 = !DILocation(line: 74, column: 6, scope: !256)
!262 = !DILocation(line: 75, column: 8, scope: !263)
!263 = distinct !DILexicalBlock(scope: !256, file: !3, line: 75, column: 8)
!264 = !DILocation(line: 75, column: 10, scope: !263)
!265 = !DILocation(line: 75, column: 8, scope: !256)
!266 = !DILocation(line: 75, column: 16, scope: !263)
!267 = !DILocation(line: 76, column: 3, scope: !256)
!268 = !DILocation(line: 73, column: 47, scope: !251)
!269 = !DILocation(line: 73, column: 3, scope: !251)
!270 = distinct !{!270, !254, !271}
!271 = !DILocation(line: 76, column: 3, scope: !241)
!272 = !DILocation(line: 78, column: 7, scope: !273)
!273 = distinct !DILexicalBlock(scope: !219, file: !3, line: 78, column: 7)
!274 = !DILocation(line: 78, column: 9, scope: !273)
!275 = !DILocation(line: 78, column: 7, scope: !219)
!276 = !DILocation(line: 79, column: 6, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !3, line: 78, column: 15)
!278 = !DILocation(line: 80, column: 11, scope: !277)
!279 = !DILocation(line: 80, column: 14, scope: !277)
!280 = !DILocation(line: 80, column: 17, scope: !277)
!281 = !DILocation(line: 80, column: 4, scope: !277)
!282 = !DILocation(line: 81, column: 11, scope: !283)
!283 = distinct !DILexicalBlock(scope: !277, file: !3, line: 81, column: 4)
!284 = !DILocation(line: 81, column: 9, scope: !283)
!285 = !DILocation(line: 81, column: 16, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !3, line: 81, column: 4)
!287 = !DILocation(line: 81, column: 20, scope: !286)
!288 = !DILocation(line: 81, column: 18, scope: !286)
!289 = !DILocation(line: 81, column: 4, scope: !283)
!290 = !DILocation(line: 82, column: 11, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !3, line: 82, column: 9)
!292 = !DILocation(line: 82, column: 9, scope: !291)
!293 = !DILocation(line: 82, column: 9, scope: !286)
!294 = !DILocation(line: 82, column: 23, scope: !291)
!295 = !DILocation(line: 82, column: 21, scope: !291)
!296 = !DILocation(line: 82, column: 26, scope: !291)
!297 = !DILocation(line: 82, column: 35, scope: !291)
!298 = !DILocation(line: 82, column: 33, scope: !291)
!299 = !DILocation(line: 82, column: 43, scope: !291)
!300 = !DILocation(line: 82, column: 41, scope: !291)
!301 = !DILocation(line: 82, column: 40, scope: !291)
!302 = !DILocation(line: 82, column: 17, scope: !291)
!303 = !DILocation(line: 82, column: 15, scope: !291)
!304 = !DILocation(line: 82, column: 12, scope: !291)
!305 = !DILocation(line: 81, column: 24, scope: !286)
!306 = !DILocation(line: 81, column: 4, scope: !286)
!307 = distinct !{!307, !289, !308}
!308 = !DILocation(line: 82, column: 45, scope: !283)
!309 = !DILocation(line: 83, column: 9, scope: !277)
!310 = !DILocation(line: 83, column: 6, scope: !277)
!311 = !DILocation(line: 84, column: 11, scope: !277)
!312 = !DILocation(line: 84, column: 15, scope: !277)
!313 = !DILocation(line: 84, column: 13, scope: !277)
!314 = !DILocation(line: 84, column: 19, scope: !277)
!315 = !DILocation(line: 84, column: 17, scope: !277)
!316 = !DILocation(line: 84, column: 8, scope: !277)
!317 = !DILocation(line: 85, column: 3, scope: !277)
!318 = !DILocation(line: 87, column: 7, scope: !319)
!319 = distinct !DILexicalBlock(scope: !219, file: !3, line: 87, column: 7)
!320 = !DILocation(line: 87, column: 11, scope: !319)
!321 = !DILocation(line: 87, column: 9, scope: !319)
!322 = !DILocation(line: 87, column: 7, scope: !219)
!323 = !DILocation(line: 88, column: 8, scope: !324)
!324 = distinct !DILexicalBlock(scope: !319, file: !3, line: 87, column: 14)
!325 = !DILocation(line: 88, column: 6, scope: !324)
!326 = !DILocation(line: 88, column: 4, scope: !324)
!327 = !DILocation(line: 88, column: 11, scope: !324)
!328 = !DILocation(line: 89, column: 17, scope: !324)
!329 = !DILocation(line: 89, column: 9, scope: !324)
!330 = !DILocation(line: 89, column: 6, scope: !324)
!331 = !DILocation(line: 90, column: 3, scope: !324)
!332 = !DILocation(line: 91, column: 2, scope: !219)
!333 = !DILocation(line: 69, column: 23, scope: !213)
!334 = !DILocation(line: 69, column: 2, scope: !213)
!335 = distinct !{!335, !216, !336}
!336 = !DILocation(line: 91, column: 2, scope: !210)
!337 = !DILocation(line: 92, column: 9, scope: !58)
!338 = !DILocation(line: 92, column: 16, scope: !58)
!339 = !DILocation(line: 92, column: 20, scope: !58)
!340 = !DILocation(line: 92, column: 18, scope: !58)
!341 = !DILocation(line: 92, column: 15, scope: !58)
!342 = !DILocation(line: 92, column: 13, scope: !58)
!343 = !DILocation(line: 92, column: 2, scope: !58)
!344 = distinct !DISubprogram(name: "get_noise2", scope: !3, file: !3, line: 95, type: !345, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!345 = !DISubroutineType(types: !346)
!346 = !{!9, !9, !9}
!347 = !DILocalVariable(name: "x", arg: 1, scope: !344, file: !3, line: 95, type: !9)
!348 = !DILocation(line: 95, column: 26, scope: !344)
!349 = !DILocalVariable(name: "y", arg: 2, scope: !344, file: !3, line: 95, type: !9)
!350 = !DILocation(line: 95, column: 36, scope: !344)
!351 = !DILocalVariable(name: "i", scope: !344, file: !3, line: 97, type: !15)
!352 = !DILocation(line: 97, column: 6, scope: !344)
!353 = !DILocalVariable(name: "ws", scope: !344, file: !3, line: 97, type: !15)
!354 = !DILocation(line: 97, column: 9, scope: !344)
!355 = !DILocalVariable(name: "r", scope: !344, file: !3, line: 98, type: !9)
!356 = !DILocation(line: 98, column: 9, scope: !344)
!357 = !DILocalVariable(name: "v", scope: !344, file: !3, line: 98, type: !358)
!358 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 128, elements: !359)
!359 = !{!360}
!360 = !DISubrange(count: 2)
!361 = !DILocation(line: 98, column: 16, scope: !344)
!362 = !DILocation(line: 100, column: 9, scope: !363)
!363 = distinct !DILexicalBlock(scope: !344, file: !3, line: 100, column: 2)
!364 = !DILocation(line: 100, column: 17, scope: !363)
!365 = !DILocation(line: 100, column: 7, scope: !363)
!366 = !DILocation(line: 100, column: 22, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !3, line: 100, column: 2)
!368 = !DILocation(line: 100, column: 24, scope: !367)
!369 = !DILocation(line: 100, column: 2, scope: !363)
!370 = !DILocation(line: 101, column: 10, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !3, line: 100, column: 41)
!372 = !DILocation(line: 101, column: 14, scope: !371)
!373 = !DILocation(line: 101, column: 12, scope: !371)
!374 = !DILocation(line: 101, column: 3, scope: !371)
!375 = !DILocation(line: 101, column: 8, scope: !371)
!376 = !DILocation(line: 101, column: 24, scope: !371)
!377 = !DILocation(line: 101, column: 28, scope: !371)
!378 = !DILocation(line: 101, column: 26, scope: !371)
!379 = !DILocation(line: 101, column: 17, scope: !371)
!380 = !DILocation(line: 101, column: 22, scope: !371)
!381 = !DILocation(line: 102, column: 14, scope: !371)
!382 = !DILocation(line: 102, column: 8, scope: !371)
!383 = !DILocation(line: 102, column: 5, scope: !371)
!384 = !DILocation(line: 103, column: 6, scope: !371)
!385 = !DILocation(line: 104, column: 2, scope: !371)
!386 = !DILocation(line: 100, column: 34, scope: !367)
!387 = !DILocation(line: 100, column: 2, scope: !367)
!388 = distinct !{!388, !369, !389}
!389 = !DILocation(line: 104, column: 2, scope: !363)
!390 = !DILocation(line: 105, column: 7, scope: !344)
!391 = !DILocation(line: 105, column: 4, scope: !344)
!392 = !DILocation(line: 106, column: 9, scope: !344)
!393 = !DILocation(line: 106, column: 2, scope: !344)
!394 = distinct !DISubprogram(name: "get_noise3", scope: !3, file: !3, line: 109, type: !395, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!395 = !DISubroutineType(types: !396)
!396 = !{!9, !9, !9, !9}
!397 = !DILocalVariable(name: "x", arg: 1, scope: !394, file: !3, line: 109, type: !9)
!398 = !DILocation(line: 109, column: 26, scope: !394)
!399 = !DILocalVariable(name: "y", arg: 2, scope: !394, file: !3, line: 109, type: !9)
!400 = !DILocation(line: 109, column: 36, scope: !394)
!401 = !DILocalVariable(name: "z", arg: 3, scope: !394, file: !3, line: 109, type: !9)
!402 = !DILocation(line: 109, column: 46, scope: !394)
!403 = !DILocalVariable(name: "i", scope: !394, file: !3, line: 111, type: !15)
!404 = !DILocation(line: 111, column: 6, scope: !394)
!405 = !DILocalVariable(name: "ws", scope: !394, file: !3, line: 111, type: !15)
!406 = !DILocation(line: 111, column: 9, scope: !394)
!407 = !DILocalVariable(name: "r", scope: !394, file: !3, line: 112, type: !9)
!408 = !DILocation(line: 112, column: 9, scope: !394)
!409 = !DILocalVariable(name: "v", scope: !394, file: !3, line: 112, type: !410)
!410 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, elements: !411)
!411 = !{!412}
!412 = !DISubrange(count: 3)
!413 = !DILocation(line: 112, column: 16, scope: !394)
!414 = !DILocalVariable(name: "w", scope: !394, file: !3, line: 112, type: !9)
!415 = !DILocation(line: 112, column: 22, scope: !394)
!416 = !DILocation(line: 114, column: 9, scope: !417)
!417 = distinct !DILexicalBlock(scope: !394, file: !3, line: 114, column: 2)
!418 = !DILocation(line: 114, column: 17, scope: !417)
!419 = !DILocation(line: 114, column: 7, scope: !417)
!420 = !DILocation(line: 114, column: 22, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !3, line: 114, column: 2)
!422 = !DILocation(line: 114, column: 24, scope: !421)
!423 = !DILocation(line: 114, column: 2, scope: !417)
!424 = !DILocation(line: 115, column: 10, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !3, line: 114, column: 40)
!426 = !DILocation(line: 115, column: 14, scope: !425)
!427 = !DILocation(line: 115, column: 12, scope: !425)
!428 = !DILocation(line: 115, column: 3, scope: !425)
!429 = !DILocation(line: 115, column: 8, scope: !425)
!430 = !DILocation(line: 115, column: 24, scope: !425)
!431 = !DILocation(line: 115, column: 28, scope: !425)
!432 = !DILocation(line: 115, column: 26, scope: !425)
!433 = !DILocation(line: 115, column: 17, scope: !425)
!434 = !DILocation(line: 115, column: 22, scope: !425)
!435 = !DILocation(line: 115, column: 38, scope: !425)
!436 = !DILocation(line: 115, column: 42, scope: !425)
!437 = !DILocation(line: 115, column: 40, scope: !425)
!438 = !DILocation(line: 115, column: 31, scope: !425)
!439 = !DILocation(line: 115, column: 36, scope: !425)
!440 = !DILocation(line: 116, column: 15, scope: !425)
!441 = !DILocation(line: 116, column: 10, scope: !425)
!442 = !DILocation(line: 116, column: 9, scope: !425)
!443 = !DILocation(line: 116, column: 5, scope: !425)
!444 = !DILocation(line: 117, column: 14, scope: !425)
!445 = !DILocation(line: 117, column: 8, scope: !425)
!446 = !DILocation(line: 117, column: 22, scope: !425)
!447 = !DILocation(line: 117, column: 20, scope: !425)
!448 = !DILocation(line: 117, column: 5, scope: !425)
!449 = !DILocation(line: 118, column: 9, scope: !425)
!450 = !DILocation(line: 118, column: 6, scope: !425)
!451 = !DILocation(line: 119, column: 2, scope: !425)
!452 = !DILocation(line: 114, column: 33, scope: !421)
!453 = !DILocation(line: 114, column: 2, scope: !421)
!454 = distinct !{!454, !423, !455}
!455 = !DILocation(line: 119, column: 2, scope: !417)
!456 = !DILocation(line: 120, column: 9, scope: !394)
!457 = !DILocation(line: 120, column: 13, scope: !394)
!458 = !DILocation(line: 120, column: 11, scope: !394)
!459 = !DILocation(line: 120, column: 2, scope: !394)
!460 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 124, type: !461, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!461 = !DISubroutineType(types: !462)
!462 = !{!15, !15, !463}
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!465 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!466 = !DILocalVariable(name: "c", arg: 1, scope: !460, file: !3, line: 124, type: !15)
!467 = !DILocation(line: 124, column: 14, scope: !460)
!468 = !DILocalVariable(name: "v", arg: 2, scope: !460, file: !3, line: 124, type: !463)
!469 = !DILocation(line: 124, column: 24, scope: !460)
!470 = !DILocalVariable(name: "pix", scope: !460, file: !3, line: 126, type: !471)
!471 = !DICompositeType(tag: DW_TAG_array_type, baseType: !472, size: 524288, elements: !473)
!472 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!473 = !{!474}
!474 = !DISubrange(count: 65536)
!475 = !DILocation(line: 126, column: 16, scope: !460)
!476 = !DILocalVariable(name: "p", scope: !460, file: !3, line: 126, type: !477)
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !472, size: 64)
!478 = !DILocation(line: 126, column: 33, scope: !460)
!479 = !DILocalVariable(name: "i", scope: !460, file: !3, line: 127, type: !15)
!480 = !DILocation(line: 127, column: 6, scope: !460)
!481 = !DILocalVariable(name: "j", scope: !460, file: !3, line: 127, type: !15)
!482 = !DILocation(line: 127, column: 9, scope: !460)
!483 = !DILocalVariable(name: "x", scope: !460, file: !3, line: 128, type: !9)
!484 = !DILocation(line: 128, column: 9, scope: !460)
!485 = !DILocalVariable(name: "y", scope: !460, file: !3, line: 128, type: !9)
!486 = !DILocation(line: 128, column: 12, scope: !460)
!487 = !DILocalVariable(name: "z", scope: !460, file: !3, line: 128, type: !9)
!488 = !DILocation(line: 128, column: 15, scope: !460)
!489 = !DILocalVariable(name: "w", scope: !460, file: !3, line: 128, type: !9)
!490 = !DILocation(line: 128, column: 18, scope: !460)
!491 = !DILocalVariable(name: "fp", scope: !460, file: !3, line: 129, type: !492)
!492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !493, size: 64)
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !494, line: 7, baseType: !495)
!494 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!495 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !496, line: 49, size: 1728, elements: !497)
!496 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!497 = !{!498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !509, !510, !513, !515, !516, !517, !521, !523, !525, !529, !532, !534, !537, !540, !541, !543, !547, !548}
!498 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !495, file: !496, line: 51, baseType: !15, size: 32)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !495, file: !496, line: 54, baseType: !464, size: 64, offset: 64)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !495, file: !496, line: 55, baseType: !464, size: 64, offset: 128)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !495, file: !496, line: 56, baseType: !464, size: 64, offset: 192)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !495, file: !496, line: 57, baseType: !464, size: 64, offset: 256)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !495, file: !496, line: 58, baseType: !464, size: 64, offset: 320)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !495, file: !496, line: 59, baseType: !464, size: 64, offset: 384)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !495, file: !496, line: 60, baseType: !464, size: 64, offset: 448)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !495, file: !496, line: 61, baseType: !464, size: 64, offset: 512)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !495, file: !496, line: 64, baseType: !464, size: 64, offset: 576)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !495, file: !496, line: 65, baseType: !464, size: 64, offset: 640)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !495, file: !496, line: 66, baseType: !464, size: 64, offset: 704)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !495, file: !496, line: 68, baseType: !511, size: 64, offset: 768)
!511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64)
!512 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !496, line: 36, flags: DIFlagFwdDecl)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !495, file: !496, line: 70, baseType: !514, size: 64, offset: 832)
!514 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !495, file: !496, line: 72, baseType: !15, size: 32, offset: 896)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !495, file: !496, line: 73, baseType: !15, size: 32, offset: 928)
!517 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !495, file: !496, line: 74, baseType: !518, size: 64, offset: 960)
!518 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !519, line: 152, baseType: !520)
!519 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!520 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!521 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !495, file: !496, line: 77, baseType: !522, size: 16, offset: 1024)
!522 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !495, file: !496, line: 78, baseType: !524, size: 8, offset: 1040)
!524 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !495, file: !496, line: 79, baseType: !526, size: 8, offset: 1048)
!526 = !DICompositeType(tag: DW_TAG_array_type, baseType: !465, size: 8, elements: !527)
!527 = !{!528}
!528 = !DISubrange(count: 1)
!529 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !495, file: !496, line: 81, baseType: !530, size: 64, offset: 1088)
!530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64)
!531 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !496, line: 43, baseType: null)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !495, file: !496, line: 89, baseType: !533, size: 64, offset: 1152)
!533 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !519, line: 153, baseType: !520)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !495, file: !496, line: 91, baseType: !535, size: 64, offset: 1216)
!535 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !536, size: 64)
!536 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !496, line: 37, flags: DIFlagFwdDecl)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !495, file: !496, line: 92, baseType: !538, size: 64, offset: 1280)
!538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !539, size: 64)
!539 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !496, line: 38, flags: DIFlagFwdDecl)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !495, file: !496, line: 93, baseType: !514, size: 64, offset: 1344)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !495, file: !496, line: 94, baseType: !542, size: 64, offset: 1408)
!542 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !495, file: !496, line: 95, baseType: !544, size: 64, offset: 1472)
!544 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !545, line: 46, baseType: !546)
!545 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!546 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !495, file: !496, line: 96, baseType: !15, size: 32, offset: 1536)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !495, file: !496, line: 98, baseType: !549, size: 160, offset: 1568)
!549 = !DICompositeType(tag: DW_TAG_array_type, baseType: !465, size: 160, elements: !550)
!550 = !{!551}
!551 = !DISubrange(count: 20)
!552 = !DILocation(line: 129, column: 8, scope: !460)
!553 = !DILocation(line: 131, column: 2, scope: !460)
!554 = !DILocation(line: 133, column: 11, scope: !555)
!555 = distinct !DILexicalBlock(scope: !460, file: !3, line: 133, column: 2)
!556 = !DILocation(line: 133, column: 9, scope: !555)
!557 = !DILocation(line: 133, column: 18, scope: !555)
!558 = !DILocation(line: 133, column: 7, scope: !555)
!559 = !DILocation(line: 133, column: 23, scope: !560)
!560 = distinct !DILexicalBlock(scope: !555, file: !3, line: 133, column: 2)
!561 = !DILocation(line: 133, column: 25, scope: !560)
!562 = !DILocation(line: 133, column: 2, scope: !555)
!563 = !DILocation(line: 133, column: 45, scope: !560)
!564 = !DILocation(line: 133, column: 48, scope: !560)
!565 = !DILocation(line: 133, column: 43, scope: !560)
!566 = !DILocation(line: 133, column: 39, scope: !560)
!567 = !DILocation(line: 133, column: 2, scope: !560)
!568 = distinct !{!568, !562, !569}
!569 = !DILocation(line: 133, column: 50, scope: !555)
!570 = !DILocation(line: 135, column: 11, scope: !571)
!571 = distinct !DILexicalBlock(scope: !460, file: !3, line: 135, column: 2)
!572 = !DILocation(line: 135, column: 9, scope: !571)
!573 = !DILocation(line: 135, column: 18, scope: !571)
!574 = !DILocation(line: 135, column: 7, scope: !571)
!575 = !DILocation(line: 135, column: 23, scope: !576)
!576 = distinct !DILexicalBlock(scope: !571, file: !3, line: 135, column: 2)
!577 = !DILocation(line: 135, column: 25, scope: !576)
!578 = !DILocation(line: 135, column: 2, scope: !571)
!579 = !DILocation(line: 136, column: 8, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !3, line: 135, column: 37)
!581 = !DILocation(line: 136, column: 10, scope: !580)
!582 = !DILocation(line: 136, column: 7, scope: !580)
!583 = !DILocation(line: 136, column: 17, scope: !580)
!584 = !DILocation(line: 136, column: 5, scope: !580)
!585 = !DILocation(line: 137, column: 10, scope: !586)
!586 = distinct !DILexicalBlock(scope: !580, file: !3, line: 137, column: 3)
!587 = !DILocation(line: 137, column: 8, scope: !586)
!588 = !DILocation(line: 137, column: 15, scope: !589)
!589 = distinct !DILexicalBlock(scope: !586, file: !3, line: 137, column: 3)
!590 = !DILocation(line: 137, column: 17, scope: !589)
!591 = !DILocation(line: 137, column: 3, scope: !586)
!592 = !DILocation(line: 138, column: 9, scope: !593)
!593 = distinct !DILexicalBlock(scope: !589, file: !3, line: 137, column: 34)
!594 = !DILocation(line: 138, column: 11, scope: !593)
!595 = !DILocation(line: 138, column: 8, scope: !593)
!596 = !DILocation(line: 138, column: 18, scope: !593)
!597 = !DILocation(line: 138, column: 6, scope: !593)
!598 = !DILocation(line: 139, column: 21, scope: !593)
!599 = !DILocation(line: 139, column: 22, scope: !593)
!600 = !DILocation(line: 139, column: 29, scope: !593)
!601 = !DILocation(line: 139, column: 30, scope: !593)
!602 = !DILocation(line: 139, column: 10, scope: !593)
!603 = !DILocation(line: 139, column: 37, scope: !593)
!604 = !DILocation(line: 139, column: 42, scope: !593)
!605 = !DILocation(line: 139, column: 48, scope: !593)
!606 = !DILocation(line: 139, column: 46, scope: !593)
!607 = !DILocation(line: 139, column: 9, scope: !593)
!608 = !DILocation(line: 139, column: 5, scope: !593)
!609 = !DILocation(line: 139, column: 7, scope: !593)
!610 = !DILocation(line: 141, column: 11, scope: !593)
!611 = !DILocation(line: 141, column: 13, scope: !593)
!612 = !DILocation(line: 141, column: 12, scope: !593)
!613 = !DILocation(line: 141, column: 9, scope: !593)
!614 = !DILocation(line: 141, column: 17, scope: !593)
!615 = !DILocation(line: 141, column: 19, scope: !593)
!616 = !DILocation(line: 141, column: 18, scope: !593)
!617 = !DILocation(line: 141, column: 15, scope: !593)
!618 = !DILocation(line: 141, column: 6, scope: !593)
!619 = !DILocation(line: 142, column: 8, scope: !620)
!620 = distinct !DILexicalBlock(scope: !593, file: !3, line: 142, column: 8)
!621 = !DILocation(line: 142, column: 10, scope: !620)
!622 = !DILocation(line: 142, column: 8, scope: !593)
!623 = !DILocation(line: 142, column: 15, scope: !620)
!624 = !DILocation(line: 144, column: 13, scope: !593)
!625 = !DILocation(line: 144, column: 8, scope: !593)
!626 = !DILocation(line: 144, column: 6, scope: !593)
!627 = !DILocation(line: 146, column: 19, scope: !593)
!628 = !DILocation(line: 146, column: 22, scope: !593)
!629 = !DILocation(line: 146, column: 25, scope: !593)
!630 = !DILocation(line: 146, column: 8, scope: !593)
!631 = !DILocation(line: 146, column: 6, scope: !593)
!632 = !DILocation(line: 148, column: 9, scope: !593)
!633 = !DILocation(line: 148, column: 11, scope: !593)
!634 = !DILocation(line: 148, column: 16, scope: !593)
!635 = !DILocation(line: 148, column: 6, scope: !593)
!636 = !DILocation(line: 149, column: 14, scope: !593)
!637 = !DILocation(line: 149, column: 12, scope: !593)
!638 = !DILocation(line: 149, column: 18, scope: !593)
!639 = !DILocation(line: 149, column: 16, scope: !593)
!640 = !DILocation(line: 149, column: 22, scope: !593)
!641 = !DILocation(line: 149, column: 20, scope: !593)
!642 = !DILocation(line: 149, column: 25, scope: !593)
!643 = !DILocation(line: 149, column: 6, scope: !593)
!644 = !DILocation(line: 150, column: 8, scope: !645)
!645 = distinct !DILexicalBlock(scope: !593, file: !3, line: 150, column: 8)
!646 = !DILocation(line: 150, column: 10, scope: !645)
!647 = !DILocation(line: 150, column: 8, scope: !593)
!648 = !DILocation(line: 150, column: 17, scope: !645)
!649 = !DILocation(line: 150, column: 15, scope: !645)
!650 = !DILocation(line: 152, column: 9, scope: !593)
!651 = !DILocation(line: 152, column: 11, scope: !593)
!652 = !DILocation(line: 152, column: 5, scope: !593)
!653 = !DILocation(line: 152, column: 7, scope: !593)
!654 = !DILocation(line: 153, column: 3, scope: !593)
!655 = !DILocation(line: 137, column: 25, scope: !589)
!656 = !DILocation(line: 137, column: 30, scope: !589)
!657 = !DILocation(line: 137, column: 3, scope: !589)
!658 = distinct !{!658, !591, !659}
!659 = !DILocation(line: 153, column: 3, scope: !586)
!660 = !DILocation(line: 154, column: 2, scope: !580)
!661 = !DILocation(line: 135, column: 33, scope: !576)
!662 = !DILocation(line: 135, column: 2, scope: !576)
!663 = distinct !{!663, !578, !664}
!664 = !DILocation(line: 154, column: 2, scope: !571)
!665 = !DILocation(line: 156, column: 7, scope: !460)
!666 = !DILocation(line: 156, column: 5, scope: !460)
!667 = !DILocation(line: 157, column: 10, scope: !460)
!668 = !DILocation(line: 157, column: 2, scope: !460)
!669 = !DILocation(line: 158, column: 9, scope: !460)
!670 = !DILocation(line: 158, column: 28, scope: !460)
!671 = !DILocation(line: 158, column: 2, scope: !460)
!672 = !DILocation(line: 159, column: 9, scope: !460)
!673 = !DILocation(line: 159, column: 2, scope: !460)
!674 = !DILocation(line: 161, column: 2, scope: !460)
