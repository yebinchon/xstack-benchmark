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
  call void @llvm.dbg.value(metadata i32 1, metadata !25, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !25, metadata !DIExpression()), !dbg !26
  %cmp = icmp slt i32 %i.0, 8, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 1, !dbg !33
  %conv = sitofp i32 %add to double, !dbg !35
  %call = call double @sqrt(double %conv) #4, !dbg !36
  %add1 = fadd double 1.000000e+00, %call, !dbg !37
  %div = fdiv double 1.000000e+00, %add1, !dbg !38
  %idxprom = sext i32 %i.0 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom, !dbg !39
  store double %div, double* %arrayidx, align 8, !dbg !40
  %idxprom2 = sext i32 %i.0 to i64, !dbg !41
  %arrayidx3 = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom2, !dbg !41
  %0 = load double, double* %arrayidx3, align 8, !dbg !41
  %add4 = add nsw i32 %i.0, 1, !dbg !42
  %conv5 = sitofp i32 %add4 to double, !dbg !43
  %call6 = call double @sqrt(double %conv5) #4, !dbg !44
  %div7 = fdiv double %0, %call6, !dbg !45
  %idxprom8 = sext i32 %i.0 to i64, !dbg !46
  %arrayidx9 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom8, !dbg !46
  store double %div7, double* %arrayidx9, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !49
  call void @llvm.dbg.value(metadata i32 %inc, metadata !25, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  ret void, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @noise(double* %x, i32 %d) #0 !dbg !54 {
entry:
  %n = alloca [8 x i32], align 16
  %o = alloca [8 x i32], align 16
  %g = alloca [8 x i32], align 16
  %u = alloca [8 x double], align 16
  call void @llvm.dbg.value(metadata double* %x, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %d, metadata !60, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [8 x i32]* %n, metadata !61, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [8 x i32]* %o, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [8 x i32]* %g, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [8 x double]* %u, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !70, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %s.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !74
  %j.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !74
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !71, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double %s.0, metadata !70, metadata !DIExpression()), !dbg !59
  %cmp = icmp slt i32 %j.0, %d, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %j.0 to i64, !dbg !75
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom, !dbg !75
  %0 = load double, double* %arrayidx, align 8, !dbg !75
  %add = fadd double %s.0, %0, !dbg !75
  call void @llvm.dbg.value(metadata double %add, metadata !70, metadata !DIExpression()), !dbg !59
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %j.0, 1, !dbg !75
  call void @llvm.dbg.value(metadata i32 %inc, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond, !dbg !75, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %idxprom1 = sext i32 %d to i64, !dbg !78
  %arrayidx2 = getelementptr inbounds [8 x double], [8 x double]* @scale, i64 0, i64 %idxprom1, !dbg !78
  %1 = load double, double* %arrayidx2, align 8, !dbg !78
  %mul = fmul double %s.0, %1, !dbg !79
  call void @llvm.dbg.value(metadata double %mul, metadata !70, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond3, !dbg !81

for.cond3:                                        ; preds = %for.inc16, %for.end
  %i.0 = phi i32 [ 0, %for.end ], [ %inc17, %for.inc16 ], !dbg !83
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !80, metadata !DIExpression()), !dbg !59
  %cmp4 = icmp slt i32 %i.0, %d, !dbg !84
  br i1 %cmp4, label %for.body5, label %for.end18, !dbg !86

for.body5:                                        ; preds = %for.cond3
  %idxprom6 = sext i32 %i.0 to i64, !dbg !87
  %arrayidx7 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom6, !dbg !87
  store i32 %i.0, i32* %arrayidx7, align 4, !dbg !89
  %idxprom8 = sext i32 %i.0 to i64, !dbg !90
  %arrayidx9 = getelementptr inbounds double, double* %x, i64 %idxprom8, !dbg !90
  %2 = load double, double* %arrayidx9, align 8, !dbg !90
  %add10 = fadd double %2, %mul, !dbg !91
  call void @llvm.dbg.value(metadata double %add10, metadata !92, metadata !DIExpression()), !dbg !59
  %3 = call double @llvm.floor.f64(double %add10), !dbg !93
  %conv = fptosi double %3 to i32, !dbg !93
  %idxprom11 = sext i32 %i.0 to i64, !dbg !94
  %arrayidx12 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom11, !dbg !94
  store i32 %conv, i32* %arrayidx12, align 4, !dbg !95
  %conv13 = sitofp i32 %conv to double, !dbg !96
  %sub = fsub double %add10, %conv13, !dbg !97
  %idxprom14 = sext i32 %i.0 to i64, !dbg !98
  %arrayidx15 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom14, !dbg !98
  store double %sub, double* %arrayidx15, align 8, !dbg !99
  br label %for.inc16, !dbg !100

for.inc16:                                        ; preds = %for.body5
  %inc17 = add nsw i32 %i.0, 1, !dbg !101
  call void @llvm.dbg.value(metadata i32 %inc17, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond3, !dbg !102, !llvm.loop !103

for.end18:                                        ; preds = %for.cond3
  %idxprom19 = sext i32 %d to i64, !dbg !105
  %arrayidx20 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom19, !dbg !105
  store i32 0, i32* %arrayidx20, align 4, !dbg !106
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond21, !dbg !107

for.cond21:                                       ; preds = %for.inc51, %for.end18
  %i.1 = phi i32 [ 0, %for.end18 ], [ %inc52, %for.inc51 ], !dbg !109
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !80, metadata !DIExpression()), !dbg !59
  %sub22 = sub nsw i32 %d, 1, !dbg !110
  %cmp23 = icmp slt i32 %i.1, %sub22, !dbg !112
  br i1 %cmp23, label %for.body25, label %for.end53, !dbg !113

for.body25:                                       ; preds = %for.cond21
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond26, !dbg !114

for.cond26:                                       ; preds = %for.inc48, %for.body25
  %j.1 = phi i32 [ %i.1, %for.body25 ], [ %inc49, %for.inc48 ], !dbg !116
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !71, metadata !DIExpression()), !dbg !59
  %cmp27 = icmp slt i32 %j.1, %d, !dbg !117
  br i1 %cmp27, label %for.body29, label %for.end50, !dbg !119

for.body29:                                       ; preds = %for.cond26
  %idxprom30 = sext i32 %i.1 to i64, !dbg !120
  %arrayidx31 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom30, !dbg !120
  %4 = load i32, i32* %arrayidx31, align 4, !dbg !120
  %idxprom32 = sext i32 %4 to i64, !dbg !122
  %arrayidx33 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom32, !dbg !122
  %5 = load double, double* %arrayidx33, align 8, !dbg !122
  %idxprom34 = sext i32 %j.1 to i64, !dbg !123
  %arrayidx35 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom34, !dbg !123
  %6 = load i32, i32* %arrayidx35, align 4, !dbg !123
  %idxprom36 = sext i32 %6 to i64, !dbg !124
  %arrayidx37 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom36, !dbg !124
  %7 = load double, double* %arrayidx37, align 8, !dbg !124
  %cmp38 = fcmp olt double %5, %7, !dbg !125
  br i1 %cmp38, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %for.body29
  %idxprom40 = sext i32 %i.1 to i64, !dbg !127
  %arrayidx41 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom40, !dbg !127
  %8 = load i32, i32* %arrayidx41, align 4, !dbg !127
  call void @llvm.dbg.value(metadata i32 %8, metadata !128, metadata !DIExpression()), !dbg !59
  %idxprom42 = sext i32 %j.1 to i64, !dbg !129
  %arrayidx43 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom42, !dbg !129
  %9 = load i32, i32* %arrayidx43, align 4, !dbg !129
  %idxprom44 = sext i32 %i.1 to i64, !dbg !130
  %arrayidx45 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom44, !dbg !130
  store i32 %9, i32* %arrayidx45, align 4, !dbg !131
  %idxprom46 = sext i32 %j.1 to i64, !dbg !132
  %arrayidx47 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom46, !dbg !132
  store i32 %8, i32* %arrayidx47, align 4, !dbg !133
  br label %if.end, !dbg !134

if.end:                                           ; preds = %if.then, %for.body29
  br label %for.inc48, !dbg !135

for.inc48:                                        ; preds = %if.end
  %inc49 = add nsw i32 %j.1, 1, !dbg !136
  call void @llvm.dbg.value(metadata i32 %inc49, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond26, !dbg !137, !llvm.loop !138

for.end50:                                        ; preds = %for.cond26
  br label %for.inc51, !dbg !139

for.inc51:                                        ; preds = %for.end50
  %inc52 = add nsw i32 %i.1, 1, !dbg !140
  call void @llvm.dbg.value(metadata i32 %inc52, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond21, !dbg !141, !llvm.loop !142

for.end53:                                        ; preds = %for.cond21
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !144, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !145, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double 1.000000e+00, metadata !146, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !70, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond54, !dbg !147

for.cond54:                                       ; preds = %for.inc62, %for.end53
  %s.1 = phi double [ 0.000000e+00, %for.end53 ], [ %add61, %for.inc62 ], !dbg !149
  %j.2 = phi i32 [ 0, %for.end53 ], [ %inc63, %for.inc62 ], !dbg !149
  call void @llvm.dbg.value(metadata i32 %j.2, metadata !71, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double %s.1, metadata !70, metadata !DIExpression()), !dbg !59
  %cmp55 = icmp slt i32 %j.2, %d, !dbg !150
  br i1 %cmp55, label %for.body57, label %for.end64, !dbg !152

for.body57:                                       ; preds = %for.cond54
  %idxprom58 = sext i32 %j.2 to i64, !dbg !153
  %arrayidx59 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom58, !dbg !153
  %10 = load i32, i32* %arrayidx59, align 4, !dbg !153
  %conv60 = sitofp i32 %10 to double, !dbg !153
  %add61 = fadd double %s.1, %conv60, !dbg !154
  call void @llvm.dbg.value(metadata double %add61, metadata !70, metadata !DIExpression()), !dbg !59
  br label %for.inc62, !dbg !155

for.inc62:                                        ; preds = %for.body57
  %inc63 = add nsw i32 %j.2, 1, !dbg !156
  call void @llvm.dbg.value(metadata i32 %inc63, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond54, !dbg !157, !llvm.loop !158

for.end64:                                        ; preds = %for.cond54
  %idxprom65 = sext i32 %d to i64, !dbg !160
  %arrayidx66 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom65, !dbg !160
  %11 = load double, double* %arrayidx66, align 8, !dbg !160
  %mul67 = fmul double %s.1, %11, !dbg !161
  call void @llvm.dbg.value(metadata double %mul67, metadata !70, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond68, !dbg !162

for.cond68:                                       ; preds = %for.inc150, %for.end64
  %s.2 = phi double [ %mul67, %for.end64 ], [ %s.3, %for.inc150 ], !dbg !59
  %i.2 = phi i32 [ 0, %for.end64 ], [ %inc151, %for.inc150 ], !dbg !164
  %ret.0 = phi double [ 0.000000e+00, %for.end64 ], [ %ret.1, %for.inc150 ], !dbg !59
  call void @llvm.dbg.value(metadata double %ret.0, metadata !145, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !80, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double %s.2, metadata !70, metadata !DIExpression()), !dbg !59
  %cmp69 = icmp sle i32 %i.2, %d, !dbg !165
  br i1 %cmp69, label %for.body71, label %for.end152, !dbg !167

for.body71:                                       ; preds = %for.cond68
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond72, !dbg !168

for.cond72:                                       ; preds = %for.inc85, %for.body71
  %j.3 = phi i32 [ 0, %for.body71 ], [ %inc86, %for.inc85 ], !dbg !171
  call void @llvm.dbg.value(metadata i32 %j.3, metadata !71, metadata !DIExpression()), !dbg !59
  %cmp73 = icmp slt i32 %j.3, %d, !dbg !172
  br i1 %cmp73, label %for.body75, label %for.end87, !dbg !174

for.body75:                                       ; preds = %for.cond72
  %idxprom76 = sext i32 %j.3 to i64, !dbg !175
  %arrayidx77 = getelementptr inbounds double, double* %x, i64 %idxprom76, !dbg !175
  %12 = load double, double* %arrayidx77, align 8, !dbg !175
  %add78 = fadd double %12, %s.2, !dbg !176
  %idxprom79 = sext i32 %j.3 to i64, !dbg !177
  %arrayidx80 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom79, !dbg !177
  %13 = load i32, i32* %arrayidx80, align 4, !dbg !177
  %conv81 = sitofp i32 %13 to double, !dbg !177
  %sub82 = fsub double %add78, %conv81, !dbg !178
  %idxprom83 = sext i32 %j.3 to i64, !dbg !179
  %arrayidx84 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom83, !dbg !179
  store double %sub82, double* %arrayidx84, align 8, !dbg !180
  br label %for.inc85, !dbg !179

for.inc85:                                        ; preds = %for.body75
  %inc86 = add nsw i32 %j.3, 1, !dbg !181
  call void @llvm.dbg.value(metadata i32 %inc86, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond72, !dbg !182, !llvm.loop !183

for.end87:                                        ; preds = %for.cond72
  %conv88 = sitofp i32 %d to double, !dbg !185
  %add89 = fadd double %conv88, 1.000000e+00, !dbg !187
  %mul90 = mul nsw i32 2, %d, !dbg !188
  %conv91 = sitofp i32 %mul90 to double, !dbg !189
  %div = fdiv double %add89, %conv91, !dbg !190
  call void @llvm.dbg.value(metadata double %div, metadata !92, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond92, !dbg !191

for.cond92:                                       ; preds = %for.inc106, %for.end87
  %j.4 = phi i32 [ 0, %for.end87 ], [ %inc107, %for.inc106 ], !dbg !192
  %t.0 = phi double [ %div, %for.end87 ], [ %sub101, %for.inc106 ], !dbg !192
  call void @llvm.dbg.value(metadata double %t.0, metadata !92, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %j.4, metadata !71, metadata !DIExpression()), !dbg !59
  %cmp93 = icmp slt i32 %j.4, %d, !dbg !193
  br i1 %cmp93, label %for.body95, label %for.end108.loopexit, !dbg !195

for.body95:                                       ; preds = %for.cond92
  %idxprom96 = sext i32 %j.4 to i64, !dbg !196
  %arrayidx97 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom96, !dbg !196
  %14 = load double, double* %arrayidx97, align 8, !dbg !196
  %idxprom98 = sext i32 %j.4 to i64, !dbg !198
  %arrayidx99 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom98, !dbg !198
  %15 = load double, double* %arrayidx99, align 8, !dbg !198
  %mul100 = fmul double %14, %15, !dbg !199
  %sub101 = fsub double %t.0, %mul100, !dbg !200
  call void @llvm.dbg.value(metadata double %sub101, metadata !92, metadata !DIExpression()), !dbg !59
  %cmp102 = fcmp ole double %sub101, 0.000000e+00, !dbg !201
  br i1 %cmp102, label %if.then104, label %if.end105, !dbg !203

if.then104:                                       ; preds = %for.body95
  br label %for.end108, !dbg !204

if.end105:                                        ; preds = %for.body95
  br label %for.inc106, !dbg !205

for.inc106:                                       ; preds = %if.end105
  %inc107 = add nsw i32 %j.4, 1, !dbg !206
  call void @llvm.dbg.value(metadata i32 %inc107, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond92, !dbg !207, !llvm.loop !208

for.end108.loopexit:                              ; preds = %for.cond92
  br label %for.end108, !dbg !210

for.end108:                                       ; preds = %for.end108.loopexit, %if.then104
  %t.1 = phi double [ %sub101, %if.then104 ], [ %t.0, %for.end108.loopexit ], !dbg !192
  call void @llvm.dbg.value(metadata double %t.1, metadata !92, metadata !DIExpression()), !dbg !59
  %cmp109 = fcmp oge double %t.1, 0.000000e+00, !dbg !212
  br i1 %cmp109, label %if.then111, label %if.end137, !dbg !213

if.then111:                                       ; preds = %for.end108
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !146, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 0, !dbg !214
  %arraydecay112 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 0, !dbg !216
  call void @hashed(i32* %arraydecay, i32* %arraydecay112, i32 %d), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond113, !dbg !218

for.cond113:                                      ; preds = %for.inc130, %if.then111
  %r.0 = phi double [ 0.000000e+00, %if.then111 ], [ %r.1, %for.inc130 ], !dbg !220
  %j.5 = phi i32 [ 0, %if.then111 ], [ %inc131, %for.inc130 ], !dbg !221
  call void @llvm.dbg.value(metadata i32 %j.5, metadata !71, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata double %r.0, metadata !146, metadata !DIExpression()), !dbg !59
  %cmp114 = icmp slt i32 %j.5, %d, !dbg !222
  br i1 %cmp114, label %for.body116, label %for.end132, !dbg !224

for.body116:                                      ; preds = %for.cond113
  %idxprom117 = sext i32 %j.5 to i64, !dbg !225
  %arrayidx118 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom117, !dbg !225
  %16 = load i32, i32* %arrayidx118, align 4, !dbg !225
  %tobool = icmp ne i32 %16, 0, !dbg !225
  br i1 %tobool, label %if.then119, label %if.end129, !dbg !227

if.then119:                                       ; preds = %for.body116
  %idxprom120 = sext i32 %j.5 to i64, !dbg !228
  %arrayidx121 = getelementptr inbounds [8 x i32], [8 x i32]* %g, i64 0, i64 %idxprom120, !dbg !228
  %17 = load i32, i32* %arrayidx121, align 4, !dbg !228
  %cmp122 = icmp eq i32 %17, 1, !dbg !229
  br i1 %cmp122, label %cond.true, label %cond.false, !dbg !228

cond.true:                                        ; preds = %if.then119
  %idxprom124 = sext i32 %j.5 to i64, !dbg !230
  %arrayidx125 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom124, !dbg !230
  %18 = load double, double* %arrayidx125, align 8, !dbg !230
  br label %cond.end, !dbg !228

cond.false:                                       ; preds = %if.then119
  %idxprom126 = sext i32 %j.5 to i64, !dbg !231
  %arrayidx127 = getelementptr inbounds [8 x double], [8 x double]* %u, i64 0, i64 %idxprom126, !dbg !231
  %19 = load double, double* %arrayidx127, align 8, !dbg !231
  %fneg = fneg double %19, !dbg !232
  br label %cond.end, !dbg !228

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %18, %cond.true ], [ %fneg, %cond.false ], !dbg !228
  %add128 = fadd double %r.0, %cond, !dbg !233
  call void @llvm.dbg.value(metadata double %add128, metadata !146, metadata !DIExpression()), !dbg !59
  br label %if.end129, !dbg !234

if.end129:                                        ; preds = %cond.end, %for.body116
  %r.1 = phi double [ %add128, %cond.end ], [ %r.0, %for.body116 ], !dbg !220
  call void @llvm.dbg.value(metadata double %r.1, metadata !146, metadata !DIExpression()), !dbg !59
  br label %for.inc130, !dbg !235

for.inc130:                                       ; preds = %if.end129
  %inc131 = add nsw i32 %j.5, 1, !dbg !236
  call void @llvm.dbg.value(metadata i32 %inc131, metadata !71, metadata !DIExpression()), !dbg !59
  br label %for.cond113, !dbg !237, !llvm.loop !238

for.end132:                                       ; preds = %for.cond113
  %mul133 = fmul double %t.1, %t.1, !dbg !240
  call void @llvm.dbg.value(metadata double %mul133, metadata !92, metadata !DIExpression()), !dbg !59
  %mul134 = fmul double %r.0, %mul133, !dbg !241
  %mul135 = fmul double %mul134, %mul133, !dbg !242
  %add136 = fadd double %ret.0, %mul135, !dbg !243
  call void @llvm.dbg.value(metadata double %add136, metadata !145, metadata !DIExpression()), !dbg !59
  br label %if.end137, !dbg !244

if.end137:                                        ; preds = %for.end132, %for.end108
  %ret.1 = phi double [ %add136, %for.end132 ], [ %ret.0, %for.end108 ], !dbg !59
  call void @llvm.dbg.value(metadata double %ret.1, metadata !145, metadata !DIExpression()), !dbg !59
  %cmp138 = icmp slt i32 %i.2, %d, !dbg !245
  br i1 %cmp138, label %if.then140, label %if.end149, !dbg !247

if.then140:                                       ; preds = %if.end137
  %idxprom141 = sext i32 %i.2 to i64, !dbg !248
  %arrayidx142 = getelementptr inbounds [8 x i32], [8 x i32]* %o, i64 0, i64 %idxprom141, !dbg !248
  %20 = load i32, i32* %arrayidx142, align 4, !dbg !248
  %idxprom143 = sext i32 %20 to i64, !dbg !250
  %arrayidx144 = getelementptr inbounds [8 x i32], [8 x i32]* %n, i64 0, i64 %idxprom143, !dbg !250
  %21 = load i32, i32* %arrayidx144, align 4, !dbg !251
  %inc145 = add nsw i32 %21, 1, !dbg !251
  store i32 %inc145, i32* %arrayidx144, align 4, !dbg !251
  %idxprom146 = sext i32 %d to i64, !dbg !252
  %arrayidx147 = getelementptr inbounds [8 x double], [8 x double]* @scale_u, i64 0, i64 %idxprom146, !dbg !252
  %22 = load double, double* %arrayidx147, align 8, !dbg !252
  %add148 = fadd double %s.2, %22, !dbg !253
  call void @llvm.dbg.value(metadata double %add148, metadata !70, metadata !DIExpression()), !dbg !59
  br label %if.end149, !dbg !254

if.end149:                                        ; preds = %if.then140, %if.end137
  %s.3 = phi double [ %add148, %if.then140 ], [ %s.2, %if.end137 ], !dbg !59
  call void @llvm.dbg.value(metadata double %s.3, metadata !70, metadata !DIExpression()), !dbg !59
  br label %for.inc150, !dbg !255

for.inc150:                                       ; preds = %if.end149
  %inc151 = add nsw i32 %i.2, 1, !dbg !256
  call void @llvm.dbg.value(metadata i32 %inc151, metadata !80, metadata !DIExpression()), !dbg !59
  br label %for.cond68, !dbg !257, !llvm.loop !258

for.end152:                                       ; preds = %for.cond68
  %mul153 = mul nsw i32 %d, %d, !dbg !260
  %conv154 = sitofp i32 %mul153 to double, !dbg !261
  %mul155 = fmul double %ret.0, %conv154, !dbg !262
  ret double %mul155, !dbg !263
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

declare dso_local void @hashed(i32*, i32*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise2(double %x, double %y) #0 !dbg !264 {
entry:
  %v = alloca [2 x double], align 16
  call void @llvm.dbg.value(metadata double %x, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata double %y, metadata !269, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !270, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata [2 x double]* %v, metadata !271, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i32 1, metadata !276, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata i32 0, metadata !277, metadata !DIExpression()), !dbg !268
  br label %for.cond, !dbg !278

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %shl, %for.inc ], !dbg !280
  %ws.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !280
  %r.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !268
  call void @llvm.dbg.value(metadata double %r.0, metadata !270, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata i32 %ws.0, metadata !277, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !276, metadata !DIExpression()), !dbg !268
  %cmp = icmp sle i32 %i.0, 128, !dbg !281
  br i1 %cmp, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %conv = sitofp i32 %i.0 to double, !dbg !284
  %mul = fmul double %x, %conv, !dbg !286
  %arrayidx = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !287
  store double %mul, double* %arrayidx, align 16, !dbg !288
  %conv1 = sitofp i32 %i.0 to double, !dbg !289
  %mul2 = fmul double %y, %conv1, !dbg !290
  %arrayidx3 = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 1, !dbg !291
  store double %mul2, double* %arrayidx3, align 8, !dbg !292
  %arraydecay = getelementptr inbounds [2 x double], [2 x double]* %v, i64 0, i64 0, !dbg !293
  %call = call double @noise(double* %arraydecay, i32 2), !dbg !294
  %add = fadd double %r.0, %call, !dbg !295
  call void @llvm.dbg.value(metadata double %add, metadata !270, metadata !DIExpression()), !dbg !268
  %inc = add nsw i32 %ws.0, 1, !dbg !296
  call void @llvm.dbg.value(metadata i32 %inc, metadata !277, metadata !DIExpression()), !dbg !268
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %shl = shl i32 %i.0, 1, !dbg !298
  call void @llvm.dbg.value(metadata i32 %shl, metadata !276, metadata !DIExpression()), !dbg !268
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  %conv4 = sitofp i32 %ws.0 to double, !dbg !302
  %div = fdiv double %r.0, %conv4, !dbg !303
  call void @llvm.dbg.value(metadata double %div, metadata !270, metadata !DIExpression()), !dbg !268
  ret double %div, !dbg !304
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @get_noise3(double %x, double %y, double %z) #0 !dbg !305 {
entry:
  %v = alloca [3 x double], align 16
  call void @llvm.dbg.value(metadata double %x, metadata !308, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata double %y, metadata !310, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata double %z, metadata !311, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !312, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata [3 x double]* %v, metadata !313, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata i32 1, metadata !318, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata i32 0, metadata !319, metadata !DIExpression()), !dbg !309
  br label %for.cond, !dbg !320

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %shl, %for.inc ], !dbg !322
  %ws.0 = phi i32 [ 0, %entry ], [ %conv12, %for.inc ], !dbg !322
  %r.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !309
  call void @llvm.dbg.value(metadata double %r.0, metadata !312, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata i32 %ws.0, metadata !319, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !318, metadata !DIExpression()), !dbg !309
  %cmp = icmp sle i32 %i.0, 32, !dbg !323
  br i1 %cmp, label %for.body, label %for.end, !dbg !325

for.body:                                         ; preds = %for.cond
  %conv = sitofp i32 %i.0 to double, !dbg !326
  %mul = fmul double %x, %conv, !dbg !328
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !329
  store double %mul, double* %arrayidx, align 16, !dbg !330
  %conv1 = sitofp i32 %i.0 to double, !dbg !331
  %mul2 = fmul double %y, %conv1, !dbg !332
  %arrayidx3 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 1, !dbg !333
  store double %mul2, double* %arrayidx3, align 8, !dbg !334
  %conv4 = sitofp i32 %i.0 to double, !dbg !335
  %mul5 = fmul double %z, %conv4, !dbg !336
  %arrayidx6 = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 2, !dbg !337
  store double %mul5, double* %arrayidx6, align 16, !dbg !338
  %conv7 = sitofp i32 %i.0 to double, !dbg !339
  %call = call double @sqrt(double %conv7) #4, !dbg !340
  %div = fdiv double 1.000000e+00, %call, !dbg !341
  call void @llvm.dbg.value(metadata double %div, metadata !342, metadata !DIExpression()), !dbg !309
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %v, i64 0, i64 0, !dbg !343
  %call8 = call double @noise(double* %arraydecay, i32 3), !dbg !344
  %mul9 = fmul double %call8, %div, !dbg !345
  %add = fadd double %r.0, %mul9, !dbg !346
  call void @llvm.dbg.value(metadata double %add, metadata !312, metadata !DIExpression()), !dbg !309
  %conv10 = sitofp i32 %ws.0 to double, !dbg !347
  %add11 = fadd double %conv10, %div, !dbg !347
  %conv12 = fptosi double %add11 to i32, !dbg !347
  call void @llvm.dbg.value(metadata i32 %conv12, metadata !319, metadata !DIExpression()), !dbg !309
  br label %for.inc, !dbg !348

for.inc:                                          ; preds = %for.body
  %shl = shl i32 %i.0, 1, !dbg !349
  call void @llvm.dbg.value(metadata i32 %shl, metadata !318, metadata !DIExpression()), !dbg !309
  br label %for.cond, !dbg !350, !llvm.loop !351

for.end:                                          ; preds = %for.cond
  %conv13 = sitofp i32 %ws.0 to double, !dbg !353
  %div14 = fdiv double %r.0, %conv13, !dbg !354
  ret double %div14, !dbg !355
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !356 {
entry:
  %pix = alloca [65536 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %c, metadata !362, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8** %v, metadata !364, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.declare(metadata [65536 x i8]* %pix, metadata !365, metadata !DIExpression()), !dbg !370
  call void @noise_init(), !dbg !371
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !372
  call void @llvm.dbg.value(metadata i8* %arraydecay, metadata !374, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !363
  br label %for.cond, !dbg !377

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !378
  %p.0 = phi i8* [ %arraydecay, %entry ], [ %incdec.ptr, %for.inc ], !dbg !378
  call void @llvm.dbg.value(metadata i8* %p.0, metadata !374, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !376, metadata !DIExpression()), !dbg !363
  %cmp = icmp slt i32 %i.0, 65536, !dbg !379
  br i1 %cmp, label %for.body, label %for.end, !dbg !381

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0, i32 1, !dbg !382
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !374, metadata !DIExpression()), !dbg !363
  store i8 0, i8* %p.0, align 1, !dbg !383
  br label %for.inc, !dbg !384

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !385
  call void @llvm.dbg.value(metadata i32 %inc, metadata !376, metadata !DIExpression()), !dbg !363
  br label %for.cond, !dbg !386, !llvm.loop !387

for.end:                                          ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !389
  call void @llvm.dbg.value(metadata i8* %arraydecay1, metadata !374, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !363
  br label %for.cond2, !dbg !391

for.cond2:                                        ; preds = %for.inc44, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc45, %for.inc44 ], !dbg !392
  %p.1 = phi i8* [ %arraydecay1, %for.end ], [ %p.2, %for.inc44 ], !dbg !393
  call void @llvm.dbg.value(metadata i8* %p.1, metadata !374, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !376, metadata !DIExpression()), !dbg !363
  %cmp3 = icmp slt i32 %i.1, 256, !dbg !394
  br i1 %cmp3, label %for.body4, label %for.end46, !dbg !396

for.body4:                                        ; preds = %for.cond2
  %sub = sub nsw i32 %i.1, 128, !dbg !397
  %conv = sitofp i32 %sub to double, !dbg !399
  %div = fdiv double %conv, 1.250000e+02, !dbg !400
  call void @llvm.dbg.value(metadata double %div, metadata !401, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i32 0, metadata !402, metadata !DIExpression()), !dbg !363
  br label %for.cond5, !dbg !403

for.cond5:                                        ; preds = %for.inc40, %for.body4
  %p.2 = phi i8* [ %p.1, %for.body4 ], [ %incdec.ptr42, %for.inc40 ], !dbg !392
  %j.0 = phi i32 [ 0, %for.body4 ], [ %inc41, %for.inc40 ], !dbg !405
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !402, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %p.2, metadata !374, metadata !DIExpression()), !dbg !363
  %cmp6 = icmp slt i32 %j.0, 256, !dbg !406
  br i1 %cmp6, label %for.body8, label %for.end43, !dbg !408

for.body8:                                        ; preds = %for.cond5
  %sub9 = sub nsw i32 %j.0, 128, !dbg !409
  %conv10 = sitofp i32 %sub9 to double, !dbg !411
  %div11 = fdiv double %conv10, 1.250000e+02, !dbg !412
  call void @llvm.dbg.value(metadata double %div11, metadata !413, metadata !DIExpression()), !dbg !363
  %conv12 = sitofp i32 %i.1 to double, !dbg !414
  %div13 = fdiv double %conv12, 2.560000e+02, !dbg !415
  %conv14 = sitofp i32 %j.0 to double, !dbg !416
  %div15 = fdiv double %conv14, 2.560000e+02, !dbg !417
  %call = call double @get_noise2(double %div13, double %div15), !dbg !418
  %add = fadd double %call, 1.000000e+00, !dbg !419
  %div16 = fdiv double %add, 6.000000e+00, !dbg !420
  %conv17 = sitofp i32 %i.1 to double, !dbg !421
  %mul = fmul double %div16, %conv17, !dbg !422
  %conv18 = fptoui double %mul to i8, !dbg !423
  store i8 %conv18, i8* %p.2, align 1, !dbg !424
  %mul19 = fmul double %div11, %div11, !dbg !425
  %sub20 = fsub double 1.000000e+00, %mul19, !dbg !426
  %mul21 = fmul double %div, %div, !dbg !427
  %sub22 = fsub double %sub20, %mul21, !dbg !428
  call void @llvm.dbg.value(metadata double %sub22, metadata !429, metadata !DIExpression()), !dbg !363
  %cmp23 = fcmp olt double %sub22, 0.000000e+00, !dbg !430
  br i1 %cmp23, label %if.then, label %if.end, !dbg !432

if.then:                                          ; preds = %for.body8
  br label %for.inc40, !dbg !433

if.end:                                           ; preds = %for.body8
  %call25 = call double @sqrt(double %sub22) #4, !dbg !434
  call void @llvm.dbg.value(metadata double %call25, metadata !429, metadata !DIExpression()), !dbg !363
  %call26 = call double @get_noise3(double %div11, double %div, double %call25), !dbg !435
  call void @llvm.dbg.value(metadata double %call26, metadata !436, metadata !DIExpression()), !dbg !363
  %add27 = fadd double %call26, 1.000000e+00, !dbg !437
  %div28 = fdiv double %add27, 2.000000e+00, !dbg !438
  call void @llvm.dbg.value(metadata double %div28, metadata !436, metadata !DIExpression()), !dbg !363
  %add29 = fadd double 1.000000e+00, %div11, !dbg !439
  %sub30 = fsub double %add29, %div, !dbg !440
  %add31 = fadd double %sub30, %call25, !dbg !441
  %div32 = fdiv double %add31, 3.500000e+00, !dbg !442
  %mul33 = fmul double %div28, %div32, !dbg !443
  call void @llvm.dbg.value(metadata double %mul33, metadata !436, metadata !DIExpression()), !dbg !363
  %cmp34 = fcmp olt double %mul33, 0.000000e+00, !dbg !444
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !446

if.then36:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !436, metadata !DIExpression()), !dbg !363
  br label %if.end37, !dbg !447

if.end37:                                         ; preds = %if.then36, %if.end
  %w.0 = phi double [ 0.000000e+00, %if.then36 ], [ %mul33, %if.end ], !dbg !448
  call void @llvm.dbg.value(metadata double %w.0, metadata !436, metadata !DIExpression()), !dbg !363
  %mul38 = fmul double %w.0, 2.550000e+02, !dbg !449
  %conv39 = fptoui double %mul38 to i8, !dbg !450
  store i8 %conv39, i8* %p.2, align 1, !dbg !451
  br label %for.inc40, !dbg !452

for.inc40:                                        ; preds = %if.end37, %if.then
  %inc41 = add nsw i32 %j.0, 1, !dbg !453
  call void @llvm.dbg.value(metadata i32 %inc41, metadata !402, metadata !DIExpression()), !dbg !363
  %incdec.ptr42 = getelementptr inbounds i8, i8* %p.2, i32 1, !dbg !454
  call void @llvm.dbg.value(metadata i8* %incdec.ptr42, metadata !374, metadata !DIExpression()), !dbg !363
  br label %for.cond5, !dbg !455, !llvm.loop !456

for.end43:                                        ; preds = %for.cond5
  br label %for.inc44, !dbg !458

for.inc44:                                        ; preds = %for.end43
  %inc45 = add nsw i32 %i.1, 1, !dbg !459
  call void @llvm.dbg.value(metadata i32 %inc45, metadata !376, metadata !DIExpression()), !dbg !363
  br label %for.cond2, !dbg !460, !llvm.loop !461

for.end46:                                        ; preds = %for.cond2
  %call47 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !463
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call47, metadata !464, metadata !DIExpression()), !dbg !363
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call47, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !525
  %arraydecay49 = getelementptr inbounds [65536 x i8], [65536 x i8]* %pix, i64 0, i64 0, !dbg !526
  %call50 = call i64 @fwrite(i8* %arraydecay49, i64 1, i64 65536, %struct._IO_FILE* %call47), !dbg !527
  %call51 = call i32 @fclose(%struct._IO_FILE* %call47), !dbg !528
  ret i32 0, !dbg !529
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!26 = !DILocation(line: 0, scope: !22)
!27 = !DILocation(line: 37, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !3, line: 37, column: 2)
!29 = !DILocation(line: 0, scope: !28)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !3, line: 37, column: 2)
!32 = !DILocation(line: 37, column: 2, scope: !28)
!33 = !DILocation(line: 38, column: 30, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !3, line: 37, column: 29)
!35 = !DILocation(line: 38, column: 28, scope: !34)
!36 = !DILocation(line: 38, column: 23, scope: !34)
!37 = !DILocation(line: 38, column: 21, scope: !34)
!38 = !DILocation(line: 38, column: 16, scope: !34)
!39 = !DILocation(line: 38, column: 3, scope: !34)
!40 = !DILocation(line: 38, column: 12, scope: !34)
!41 = !DILocation(line: 39, column: 16, scope: !34)
!42 = !DILocation(line: 39, column: 34, scope: !34)
!43 = !DILocation(line: 39, column: 32, scope: !34)
!44 = !DILocation(line: 39, column: 27, scope: !34)
!45 = !DILocation(line: 39, column: 25, scope: !34)
!46 = !DILocation(line: 39, column: 3, scope: !34)
!47 = !DILocation(line: 39, column: 14, scope: !34)
!48 = !DILocation(line: 40, column: 2, scope: !34)
!49 = !DILocation(line: 37, column: 25, scope: !31)
!50 = !DILocation(line: 37, column: 2, scope: !31)
!51 = distinct !{!51, !32, !52}
!52 = !DILocation(line: 40, column: 2, scope: !28)
!53 = !DILocation(line: 41, column: 1, scope: !22)
!54 = distinct !DISubprogram(name: "noise", scope: !3, file: !3, line: 43, type: !55, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!9, !57, !15}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!58 = !DILocalVariable(name: "x", arg: 1, scope: !54, file: !3, line: 43, type: !57)
!59 = !DILocation(line: 0, scope: !54)
!60 = !DILocalVariable(name: "d", arg: 2, scope: !54, file: !3, line: 43, type: !15)
!61 = !DILocalVariable(name: "n", scope: !54, file: !3, line: 47, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !10)
!63 = !DILocation(line: 47, column: 6, scope: !54)
!64 = !DILocalVariable(name: "o", scope: !54, file: !3, line: 47, type: !62)
!65 = !DILocation(line: 47, column: 15, scope: !54)
!66 = !DILocalVariable(name: "g", scope: !54, file: !3, line: 47, type: !62)
!67 = !DILocation(line: 47, column: 24, scope: !54)
!68 = !DILocalVariable(name: "u", scope: !54, file: !3, line: 48, type: !8)
!69 = !DILocation(line: 48, column: 26, scope: !54)
!70 = !DILocalVariable(name: "s", scope: !54, file: !3, line: 48, type: !9)
!71 = !DILocalVariable(name: "j", scope: !54, file: !3, line: 46, type: !15)
!72 = !DILocation(line: 50, column: 2, scope: !73)
!73 = distinct !DILexicalBlock(scope: !54, file: !3, line: 50, column: 2)
!74 = !DILocation(line: 0, scope: !73)
!75 = !DILocation(line: 50, column: 2, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !3, line: 50, column: 2)
!77 = distinct !{!77, !72, !72}
!78 = !DILocation(line: 51, column: 7, scope: !54)
!79 = !DILocation(line: 51, column: 4, scope: !54)
!80 = !DILocalVariable(name: "i", scope: !54, file: !3, line: 46, type: !15)
!81 = !DILocation(line: 53, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !54, file: !3, line: 53, column: 2)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 53, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 53, column: 2)
!86 = !DILocation(line: 53, column: 2, scope: !82)
!87 = !DILocation(line: 54, column: 3, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 53, column: 26)
!89 = !DILocation(line: 54, column: 8, scope: !88)
!90 = !DILocation(line: 55, column: 7, scope: !88)
!91 = !DILocation(line: 55, column: 12, scope: !88)
!92 = !DILocalVariable(name: "t", scope: !54, file: !3, line: 48, type: !9)
!93 = !DILocation(line: 56, column: 22, scope: !88)
!94 = !DILocation(line: 56, column: 15, scope: !88)
!95 = !DILocation(line: 56, column: 20, scope: !88)
!96 = !DILocation(line: 56, column: 14, scope: !88)
!97 = !DILocation(line: 56, column: 12, scope: !88)
!98 = !DILocation(line: 56, column: 3, scope: !88)
!99 = !DILocation(line: 56, column: 8, scope: !88)
!100 = !DILocation(line: 57, column: 2, scope: !88)
!101 = !DILocation(line: 53, column: 22, scope: !85)
!102 = !DILocation(line: 53, column: 2, scope: !85)
!103 = distinct !{!103, !86, !104}
!104 = !DILocation(line: 57, column: 2, scope: !82)
!105 = !DILocation(line: 58, column: 2, scope: !54)
!106 = !DILocation(line: 58, column: 7, scope: !54)
!107 = !DILocation(line: 60, column: 7, scope: !108)
!108 = distinct !DILexicalBlock(scope: !54, file: !3, line: 60, column: 2)
!109 = !DILocation(line: 0, scope: !108)
!110 = !DILocation(line: 60, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 60, column: 2)
!112 = !DILocation(line: 60, column: 16, scope: !111)
!113 = !DILocation(line: 60, column: 2, scope: !108)
!114 = !DILocation(line: 61, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 61, column: 3)
!116 = !DILocation(line: 0, scope: !115)
!117 = !DILocation(line: 61, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !3, line: 61, column: 3)
!119 = !DILocation(line: 61, column: 3, scope: !115)
!120 = !DILocation(line: 62, column: 10, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 62, column: 8)
!122 = !DILocation(line: 62, column: 8, scope: !121)
!123 = !DILocation(line: 62, column: 20, scope: !121)
!124 = !DILocation(line: 62, column: 18, scope: !121)
!125 = !DILocation(line: 62, column: 16, scope: !121)
!126 = !DILocation(line: 62, column: 8, scope: !118)
!127 = !DILocation(line: 63, column: 11, scope: !121)
!128 = !DILocalVariable(name: "tmp", scope: !54, file: !3, line: 47, type: !15)
!129 = !DILocation(line: 63, column: 24, scope: !121)
!130 = !DILocation(line: 63, column: 17, scope: !121)
!131 = !DILocation(line: 63, column: 22, scope: !121)
!132 = !DILocation(line: 63, column: 30, scope: !121)
!133 = !DILocation(line: 63, column: 35, scope: !121)
!134 = !DILocation(line: 63, column: 5, scope: !121)
!135 = !DILocation(line: 62, column: 24, scope: !121)
!136 = !DILocation(line: 61, column: 23, scope: !118)
!137 = !DILocation(line: 61, column: 3, scope: !118)
!138 = distinct !{!138, !119, !139}
!139 = !DILocation(line: 63, column: 37, scope: !115)
!140 = !DILocation(line: 60, column: 26, scope: !111)
!141 = !DILocation(line: 60, column: 2, scope: !111)
!142 = distinct !{!142, !113, !143}
!143 = !DILocation(line: 63, column: 37, scope: !108)
!144 = !DILocalVariable(name: "w", scope: !54, file: !3, line: 48, type: !9)
!145 = !DILocalVariable(name: "ret", scope: !54, file: !3, line: 48, type: !9)
!146 = !DILocalVariable(name: "r", scope: !54, file: !3, line: 48, type: !9)
!147 = !DILocation(line: 66, column: 7, scope: !148)
!148 = distinct !DILexicalBlock(scope: !54, file: !3, line: 66, column: 2)
!149 = !DILocation(line: 0, scope: !148)
!150 = !DILocation(line: 66, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 66, column: 2)
!152 = !DILocation(line: 66, column: 2, scope: !148)
!153 = !DILocation(line: 66, column: 38, scope: !151)
!154 = !DILocation(line: 66, column: 35, scope: !151)
!155 = !DILocation(line: 66, column: 33, scope: !151)
!156 = !DILocation(line: 66, column: 29, scope: !151)
!157 = !DILocation(line: 66, column: 2, scope: !151)
!158 = distinct !{!158, !152, !159}
!159 = !DILocation(line: 66, column: 41, scope: !148)
!160 = !DILocation(line: 67, column: 7, scope: !54)
!161 = !DILocation(line: 67, column: 4, scope: !54)
!162 = !DILocation(line: 69, column: 7, scope: !163)
!163 = distinct !DILexicalBlock(scope: !54, file: !3, line: 69, column: 2)
!164 = !DILocation(line: 0, scope: !163)
!165 = !DILocation(line: 69, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 69, column: 2)
!167 = !DILocation(line: 69, column: 2, scope: !163)
!168 = !DILocation(line: 70, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !170, file: !3, line: 70, column: 3)
!170 = distinct !DILexicalBlock(scope: !166, file: !3, line: 69, column: 27)
!171 = !DILocation(line: 0, scope: !169)
!172 = !DILocation(line: 70, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !3, line: 70, column: 3)
!174 = !DILocation(line: 70, column: 3, scope: !169)
!175 = !DILocation(line: 71, column: 11, scope: !173)
!176 = !DILocation(line: 71, column: 16, scope: !173)
!177 = !DILocation(line: 71, column: 22, scope: !173)
!178 = !DILocation(line: 71, column: 20, scope: !173)
!179 = !DILocation(line: 71, column: 4, scope: !173)
!180 = !DILocation(line: 71, column: 9, scope: !173)
!181 = !DILocation(line: 70, column: 23, scope: !173)
!182 = !DILocation(line: 70, column: 3, scope: !173)
!183 = distinct !{!183, !174, !184}
!184 = !DILocation(line: 71, column: 25, scope: !169)
!185 = !DILocation(line: 73, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !170, file: !3, line: 73, column: 3)
!187 = !DILocation(line: 73, column: 15, scope: !186)
!188 = !DILocation(line: 73, column: 26, scope: !186)
!189 = !DILocation(line: 73, column: 23, scope: !186)
!190 = !DILocation(line: 73, column: 21, scope: !186)
!191 = !DILocation(line: 73, column: 8, scope: !186)
!192 = !DILocation(line: 0, scope: !186)
!193 = !DILocation(line: 73, column: 41, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !3, line: 73, column: 3)
!195 = !DILocation(line: 73, column: 3, scope: !186)
!196 = !DILocation(line: 74, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !3, line: 73, column: 51)
!198 = !DILocation(line: 74, column: 16, scope: !197)
!199 = !DILocation(line: 74, column: 14, scope: !197)
!200 = !DILocation(line: 74, column: 6, scope: !197)
!201 = !DILocation(line: 75, column: 10, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !3, line: 75, column: 8)
!203 = !DILocation(line: 75, column: 8, scope: !197)
!204 = !DILocation(line: 75, column: 16, scope: !202)
!205 = !DILocation(line: 76, column: 3, scope: !197)
!206 = !DILocation(line: 73, column: 47, scope: !194)
!207 = !DILocation(line: 73, column: 3, scope: !194)
!208 = distinct !{!208, !195, !209}
!209 = !DILocation(line: 76, column: 3, scope: !186)
!210 = !DILocation(line: 78, column: 7, scope: !211)
!211 = distinct !DILexicalBlock(scope: !170, file: !3, line: 78, column: 7)
!212 = !DILocation(line: 78, column: 9, scope: !211)
!213 = !DILocation(line: 78, column: 7, scope: !170)
!214 = !DILocation(line: 80, column: 11, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !3, line: 78, column: 15)
!216 = !DILocation(line: 80, column: 14, scope: !215)
!217 = !DILocation(line: 80, column: 4, scope: !215)
!218 = !DILocation(line: 81, column: 9, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !3, line: 81, column: 4)
!220 = !DILocation(line: 0, scope: !215)
!221 = !DILocation(line: 0, scope: !219)
!222 = !DILocation(line: 81, column: 18, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !3, line: 81, column: 4)
!224 = !DILocation(line: 81, column: 4, scope: !219)
!225 = !DILocation(line: 82, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !3, line: 82, column: 9)
!227 = !DILocation(line: 82, column: 9, scope: !223)
!228 = !DILocation(line: 82, column: 21, scope: !226)
!229 = !DILocation(line: 82, column: 26, scope: !226)
!230 = !DILocation(line: 82, column: 33, scope: !226)
!231 = !DILocation(line: 82, column: 41, scope: !226)
!232 = !DILocation(line: 82, column: 40, scope: !226)
!233 = !DILocation(line: 82, column: 17, scope: !226)
!234 = !DILocation(line: 82, column: 15, scope: !226)
!235 = !DILocation(line: 82, column: 12, scope: !226)
!236 = !DILocation(line: 81, column: 24, scope: !223)
!237 = !DILocation(line: 81, column: 4, scope: !223)
!238 = distinct !{!238, !224, !239}
!239 = !DILocation(line: 82, column: 45, scope: !219)
!240 = !DILocation(line: 83, column: 6, scope: !215)
!241 = !DILocation(line: 84, column: 13, scope: !215)
!242 = !DILocation(line: 84, column: 17, scope: !215)
!243 = !DILocation(line: 84, column: 8, scope: !215)
!244 = !DILocation(line: 85, column: 3, scope: !215)
!245 = !DILocation(line: 87, column: 9, scope: !246)
!246 = distinct !DILexicalBlock(scope: !170, file: !3, line: 87, column: 7)
!247 = !DILocation(line: 87, column: 7, scope: !170)
!248 = !DILocation(line: 88, column: 6, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !3, line: 87, column: 14)
!250 = !DILocation(line: 88, column: 4, scope: !249)
!251 = !DILocation(line: 88, column: 11, scope: !249)
!252 = !DILocation(line: 89, column: 9, scope: !249)
!253 = !DILocation(line: 89, column: 6, scope: !249)
!254 = !DILocation(line: 90, column: 3, scope: !249)
!255 = !DILocation(line: 91, column: 2, scope: !170)
!256 = !DILocation(line: 69, column: 23, scope: !166)
!257 = !DILocation(line: 69, column: 2, scope: !166)
!258 = distinct !{!258, !167, !259}
!259 = !DILocation(line: 91, column: 2, scope: !163)
!260 = !DILocation(line: 92, column: 18, scope: !54)
!261 = !DILocation(line: 92, column: 15, scope: !54)
!262 = !DILocation(line: 92, column: 13, scope: !54)
!263 = !DILocation(line: 92, column: 2, scope: !54)
!264 = distinct !DISubprogram(name: "get_noise2", scope: !3, file: !3, line: 95, type: !265, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!265 = !DISubroutineType(types: !266)
!266 = !{!9, !9, !9}
!267 = !DILocalVariable(name: "x", arg: 1, scope: !264, file: !3, line: 95, type: !9)
!268 = !DILocation(line: 0, scope: !264)
!269 = !DILocalVariable(name: "y", arg: 2, scope: !264, file: !3, line: 95, type: !9)
!270 = !DILocalVariable(name: "r", scope: !264, file: !3, line: 98, type: !9)
!271 = !DILocalVariable(name: "v", scope: !264, file: !3, line: 98, type: !272)
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 128, elements: !273)
!273 = !{!274}
!274 = !DISubrange(count: 2)
!275 = !DILocation(line: 98, column: 16, scope: !264)
!276 = !DILocalVariable(name: "i", scope: !264, file: !3, line: 97, type: !15)
!277 = !DILocalVariable(name: "ws", scope: !264, file: !3, line: 97, type: !15)
!278 = !DILocation(line: 100, column: 7, scope: !279)
!279 = distinct !DILexicalBlock(scope: !264, file: !3, line: 100, column: 2)
!280 = !DILocation(line: 0, scope: !279)
!281 = !DILocation(line: 100, column: 24, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !3, line: 100, column: 2)
!283 = !DILocation(line: 100, column: 2, scope: !279)
!284 = !DILocation(line: 101, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !3, line: 100, column: 41)
!286 = !DILocation(line: 101, column: 12, scope: !285)
!287 = !DILocation(line: 101, column: 3, scope: !285)
!288 = !DILocation(line: 101, column: 8, scope: !285)
!289 = !DILocation(line: 101, column: 28, scope: !285)
!290 = !DILocation(line: 101, column: 26, scope: !285)
!291 = !DILocation(line: 101, column: 17, scope: !285)
!292 = !DILocation(line: 101, column: 22, scope: !285)
!293 = !DILocation(line: 102, column: 14, scope: !285)
!294 = !DILocation(line: 102, column: 8, scope: !285)
!295 = !DILocation(line: 102, column: 5, scope: !285)
!296 = !DILocation(line: 103, column: 6, scope: !285)
!297 = !DILocation(line: 104, column: 2, scope: !285)
!298 = !DILocation(line: 100, column: 34, scope: !282)
!299 = !DILocation(line: 100, column: 2, scope: !282)
!300 = distinct !{!300, !283, !301}
!301 = !DILocation(line: 104, column: 2, scope: !279)
!302 = !DILocation(line: 105, column: 7, scope: !264)
!303 = !DILocation(line: 105, column: 4, scope: !264)
!304 = !DILocation(line: 106, column: 2, scope: !264)
!305 = distinct !DISubprogram(name: "get_noise3", scope: !3, file: !3, line: 109, type: !306, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!306 = !DISubroutineType(types: !307)
!307 = !{!9, !9, !9, !9}
!308 = !DILocalVariable(name: "x", arg: 1, scope: !305, file: !3, line: 109, type: !9)
!309 = !DILocation(line: 0, scope: !305)
!310 = !DILocalVariable(name: "y", arg: 2, scope: !305, file: !3, line: 109, type: !9)
!311 = !DILocalVariable(name: "z", arg: 3, scope: !305, file: !3, line: 109, type: !9)
!312 = !DILocalVariable(name: "r", scope: !305, file: !3, line: 112, type: !9)
!313 = !DILocalVariable(name: "v", scope: !305, file: !3, line: 112, type: !314)
!314 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, elements: !315)
!315 = !{!316}
!316 = !DISubrange(count: 3)
!317 = !DILocation(line: 112, column: 16, scope: !305)
!318 = !DILocalVariable(name: "i", scope: !305, file: !3, line: 111, type: !15)
!319 = !DILocalVariable(name: "ws", scope: !305, file: !3, line: 111, type: !15)
!320 = !DILocation(line: 114, column: 7, scope: !321)
!321 = distinct !DILexicalBlock(scope: !305, file: !3, line: 114, column: 2)
!322 = !DILocation(line: 0, scope: !321)
!323 = !DILocation(line: 114, column: 24, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !3, line: 114, column: 2)
!325 = !DILocation(line: 114, column: 2, scope: !321)
!326 = !DILocation(line: 115, column: 14, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !3, line: 114, column: 40)
!328 = !DILocation(line: 115, column: 12, scope: !327)
!329 = !DILocation(line: 115, column: 3, scope: !327)
!330 = !DILocation(line: 115, column: 8, scope: !327)
!331 = !DILocation(line: 115, column: 28, scope: !327)
!332 = !DILocation(line: 115, column: 26, scope: !327)
!333 = !DILocation(line: 115, column: 17, scope: !327)
!334 = !DILocation(line: 115, column: 22, scope: !327)
!335 = !DILocation(line: 115, column: 42, scope: !327)
!336 = !DILocation(line: 115, column: 40, scope: !327)
!337 = !DILocation(line: 115, column: 31, scope: !327)
!338 = !DILocation(line: 115, column: 36, scope: !327)
!339 = !DILocation(line: 116, column: 15, scope: !327)
!340 = !DILocation(line: 116, column: 10, scope: !327)
!341 = !DILocation(line: 116, column: 9, scope: !327)
!342 = !DILocalVariable(name: "w", scope: !305, file: !3, line: 112, type: !9)
!343 = !DILocation(line: 117, column: 14, scope: !327)
!344 = !DILocation(line: 117, column: 8, scope: !327)
!345 = !DILocation(line: 117, column: 20, scope: !327)
!346 = !DILocation(line: 117, column: 5, scope: !327)
!347 = !DILocation(line: 118, column: 6, scope: !327)
!348 = !DILocation(line: 119, column: 2, scope: !327)
!349 = !DILocation(line: 114, column: 33, scope: !324)
!350 = !DILocation(line: 114, column: 2, scope: !324)
!351 = distinct !{!351, !325, !352}
!352 = !DILocation(line: 119, column: 2, scope: !321)
!353 = !DILocation(line: 120, column: 13, scope: !305)
!354 = !DILocation(line: 120, column: 11, scope: !305)
!355 = !DILocation(line: 120, column: 2, scope: !305)
!356 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 124, type: !357, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!357 = !DISubroutineType(types: !358)
!358 = !{!15, !15, !359}
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!361 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!362 = !DILocalVariable(name: "c", arg: 1, scope: !356, file: !3, line: 124, type: !15)
!363 = !DILocation(line: 0, scope: !356)
!364 = !DILocalVariable(name: "v", arg: 2, scope: !356, file: !3, line: 124, type: !359)
!365 = !DILocalVariable(name: "pix", scope: !356, file: !3, line: 126, type: !366)
!366 = !DICompositeType(tag: DW_TAG_array_type, baseType: !367, size: 524288, elements: !368)
!367 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!368 = !{!369}
!369 = !DISubrange(count: 65536)
!370 = !DILocation(line: 126, column: 16, scope: !356)
!371 = !DILocation(line: 131, column: 2, scope: !356)
!372 = !DILocation(line: 133, column: 11, scope: !373)
!373 = distinct !DILexicalBlock(scope: !356, file: !3, line: 133, column: 2)
!374 = !DILocalVariable(name: "p", scope: !356, file: !3, line: 126, type: !375)
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !367, size: 64)
!376 = !DILocalVariable(name: "i", scope: !356, file: !3, line: 127, type: !15)
!377 = !DILocation(line: 133, column: 7, scope: !373)
!378 = !DILocation(line: 0, scope: !373)
!379 = !DILocation(line: 133, column: 25, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !3, line: 133, column: 2)
!381 = !DILocation(line: 133, column: 2, scope: !373)
!382 = !DILocation(line: 133, column: 45, scope: !380)
!383 = !DILocation(line: 133, column: 48, scope: !380)
!384 = !DILocation(line: 133, column: 43, scope: !380)
!385 = !DILocation(line: 133, column: 39, scope: !380)
!386 = !DILocation(line: 133, column: 2, scope: !380)
!387 = distinct !{!387, !381, !388}
!388 = !DILocation(line: 133, column: 50, scope: !373)
!389 = !DILocation(line: 135, column: 11, scope: !390)
!390 = distinct !DILexicalBlock(scope: !356, file: !3, line: 135, column: 2)
!391 = !DILocation(line: 135, column: 7, scope: !390)
!392 = !DILocation(line: 0, scope: !390)
!393 = !DILocation(line: 135, column: 9, scope: !390)
!394 = !DILocation(line: 135, column: 25, scope: !395)
!395 = distinct !DILexicalBlock(scope: !390, file: !3, line: 135, column: 2)
!396 = !DILocation(line: 135, column: 2, scope: !390)
!397 = !DILocation(line: 136, column: 10, scope: !398)
!398 = distinct !DILexicalBlock(scope: !395, file: !3, line: 135, column: 37)
!399 = !DILocation(line: 136, column: 7, scope: !398)
!400 = !DILocation(line: 136, column: 17, scope: !398)
!401 = !DILocalVariable(name: "y", scope: !356, file: !3, line: 128, type: !9)
!402 = !DILocalVariable(name: "j", scope: !356, file: !3, line: 127, type: !15)
!403 = !DILocation(line: 137, column: 8, scope: !404)
!404 = distinct !DILexicalBlock(scope: !398, file: !3, line: 137, column: 3)
!405 = !DILocation(line: 0, scope: !404)
!406 = !DILocation(line: 137, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !404, file: !3, line: 137, column: 3)
!408 = !DILocation(line: 137, column: 3, scope: !404)
!409 = !DILocation(line: 138, column: 11, scope: !410)
!410 = distinct !DILexicalBlock(scope: !407, file: !3, line: 137, column: 34)
!411 = !DILocation(line: 138, column: 8, scope: !410)
!412 = !DILocation(line: 138, column: 18, scope: !410)
!413 = !DILocalVariable(name: "x", scope: !356, file: !3, line: 128, type: !9)
!414 = !DILocation(line: 139, column: 21, scope: !410)
!415 = !DILocation(line: 139, column: 22, scope: !410)
!416 = !DILocation(line: 139, column: 29, scope: !410)
!417 = !DILocation(line: 139, column: 30, scope: !410)
!418 = !DILocation(line: 139, column: 10, scope: !410)
!419 = !DILocation(line: 139, column: 37, scope: !410)
!420 = !DILocation(line: 139, column: 42, scope: !410)
!421 = !DILocation(line: 139, column: 48, scope: !410)
!422 = !DILocation(line: 139, column: 46, scope: !410)
!423 = !DILocation(line: 139, column: 9, scope: !410)
!424 = !DILocation(line: 139, column: 7, scope: !410)
!425 = !DILocation(line: 141, column: 12, scope: !410)
!426 = !DILocation(line: 141, column: 9, scope: !410)
!427 = !DILocation(line: 141, column: 18, scope: !410)
!428 = !DILocation(line: 141, column: 15, scope: !410)
!429 = !DILocalVariable(name: "z", scope: !356, file: !3, line: 128, type: !9)
!430 = !DILocation(line: 142, column: 10, scope: !431)
!431 = distinct !DILexicalBlock(scope: !410, file: !3, line: 142, column: 8)
!432 = !DILocation(line: 142, column: 8, scope: !410)
!433 = !DILocation(line: 142, column: 15, scope: !431)
!434 = !DILocation(line: 144, column: 8, scope: !410)
!435 = !DILocation(line: 146, column: 8, scope: !410)
!436 = !DILocalVariable(name: "w", scope: !356, file: !3, line: 128, type: !9)
!437 = !DILocation(line: 148, column: 11, scope: !410)
!438 = !DILocation(line: 148, column: 16, scope: !410)
!439 = !DILocation(line: 149, column: 12, scope: !410)
!440 = !DILocation(line: 149, column: 16, scope: !410)
!441 = !DILocation(line: 149, column: 20, scope: !410)
!442 = !DILocation(line: 149, column: 25, scope: !410)
!443 = !DILocation(line: 149, column: 6, scope: !410)
!444 = !DILocation(line: 150, column: 10, scope: !445)
!445 = distinct !DILexicalBlock(scope: !410, file: !3, line: 150, column: 8)
!446 = !DILocation(line: 150, column: 8, scope: !410)
!447 = !DILocation(line: 150, column: 15, scope: !445)
!448 = !DILocation(line: 0, scope: !410)
!449 = !DILocation(line: 152, column: 11, scope: !410)
!450 = !DILocation(line: 152, column: 9, scope: !410)
!451 = !DILocation(line: 152, column: 7, scope: !410)
!452 = !DILocation(line: 153, column: 3, scope: !410)
!453 = !DILocation(line: 137, column: 25, scope: !407)
!454 = !DILocation(line: 137, column: 30, scope: !407)
!455 = !DILocation(line: 137, column: 3, scope: !407)
!456 = distinct !{!456, !408, !457}
!457 = !DILocation(line: 153, column: 3, scope: !404)
!458 = !DILocation(line: 154, column: 2, scope: !398)
!459 = !DILocation(line: 135, column: 33, scope: !395)
!460 = !DILocation(line: 135, column: 2, scope: !395)
!461 = distinct !{!461, !396, !462}
!462 = !DILocation(line: 154, column: 2, scope: !390)
!463 = !DILocation(line: 156, column: 7, scope: !356)
!464 = !DILocalVariable(name: "fp", scope: !356, file: !3, line: 129, type: !465)
!465 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !466, size: 64)
!466 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !467, line: 7, baseType: !468)
!467 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!468 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !469, line: 49, size: 1728, elements: !470)
!469 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!470 = !{!471, !472, !473, !474, !475, !476, !477, !478, !479, !480, !481, !482, !483, !486, !488, !489, !490, !494, !496, !498, !502, !505, !507, !510, !513, !514, !516, !520, !521}
!471 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !468, file: !469, line: 51, baseType: !15, size: 32)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !468, file: !469, line: 54, baseType: !360, size: 64, offset: 64)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !468, file: !469, line: 55, baseType: !360, size: 64, offset: 128)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !468, file: !469, line: 56, baseType: !360, size: 64, offset: 192)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !468, file: !469, line: 57, baseType: !360, size: 64, offset: 256)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !468, file: !469, line: 58, baseType: !360, size: 64, offset: 320)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !468, file: !469, line: 59, baseType: !360, size: 64, offset: 384)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !468, file: !469, line: 60, baseType: !360, size: 64, offset: 448)
!479 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !468, file: !469, line: 61, baseType: !360, size: 64, offset: 512)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !468, file: !469, line: 64, baseType: !360, size: 64, offset: 576)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !468, file: !469, line: 65, baseType: !360, size: 64, offset: 640)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !468, file: !469, line: 66, baseType: !360, size: 64, offset: 704)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !468, file: !469, line: 68, baseType: !484, size: 64, offset: 768)
!484 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !485, size: 64)
!485 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !469, line: 36, flags: DIFlagFwdDecl)
!486 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !468, file: !469, line: 70, baseType: !487, size: 64, offset: 832)
!487 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !468, size: 64)
!488 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !468, file: !469, line: 72, baseType: !15, size: 32, offset: 896)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !468, file: !469, line: 73, baseType: !15, size: 32, offset: 928)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !468, file: !469, line: 74, baseType: !491, size: 64, offset: 960)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !492, line: 152, baseType: !493)
!492 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!493 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!494 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !468, file: !469, line: 77, baseType: !495, size: 16, offset: 1024)
!495 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!496 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !468, file: !469, line: 78, baseType: !497, size: 8, offset: 1040)
!497 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !468, file: !469, line: 79, baseType: !499, size: 8, offset: 1048)
!499 = !DICompositeType(tag: DW_TAG_array_type, baseType: !361, size: 8, elements: !500)
!500 = !{!501}
!501 = !DISubrange(count: 1)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !468, file: !469, line: 81, baseType: !503, size: 64, offset: 1088)
!503 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !504, size: 64)
!504 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !469, line: 43, baseType: null)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !468, file: !469, line: 89, baseType: !506, size: 64, offset: 1152)
!506 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !492, line: 153, baseType: !493)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !468, file: !469, line: 91, baseType: !508, size: 64, offset: 1216)
!508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64)
!509 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !469, line: 37, flags: DIFlagFwdDecl)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !468, file: !469, line: 92, baseType: !511, size: 64, offset: 1280)
!511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64)
!512 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !469, line: 38, flags: DIFlagFwdDecl)
!513 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !468, file: !469, line: 93, baseType: !487, size: 64, offset: 1344)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !468, file: !469, line: 94, baseType: !515, size: 64, offset: 1408)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !468, file: !469, line: 95, baseType: !517, size: 64, offset: 1472)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !518, line: 46, baseType: !519)
!518 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs-old/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!519 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !468, file: !469, line: 96, baseType: !15, size: 32, offset: 1536)
!521 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !468, file: !469, line: 98, baseType: !522, size: 160, offset: 1568)
!522 = !DICompositeType(tag: DW_TAG_array_type, baseType: !361, size: 160, elements: !523)
!523 = !{!524}
!524 = !DISubrange(count: 20)
!525 = !DILocation(line: 157, column: 2, scope: !356)
!526 = !DILocation(line: 158, column: 9, scope: !356)
!527 = !DILocation(line: 158, column: 2, scope: !356)
!528 = !DILocation(line: 159, column: 2, scope: !356)
!529 = !DILocation(line: 161, column: 2, scope: !356)
