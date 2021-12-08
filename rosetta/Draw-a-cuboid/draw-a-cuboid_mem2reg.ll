; ModuleID = 'draw-a-cuboid.ll'
source_filename = "draw-a-cuboid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.face_t = type { [4 x double*], [3 x double] }

@.str = private unnamed_addr constant [11 x i8] c".:!*oe&#%@\00", align 1
@shades = dso_local global i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@v000 = dso_local global [3 x double] [double -4.000000e+00, double -3.000000e+00, double -2.000000e+00], align 16, !dbg !8
@v100 = dso_local global [3 x double] [double 4.000000e+00, double -3.000000e+00, double -2.000000e+00], align 16, !dbg !14
@v010 = dso_local global [3 x double] [double -4.000000e+00, double 3.000000e+00, double -2.000000e+00], align 16, !dbg !16
@v110 = dso_local global [3 x double] [double 4.000000e+00, double 3.000000e+00, double -2.000000e+00], align 16, !dbg !18
@v001 = dso_local global [3 x double] [double -4.000000e+00, double -3.000000e+00, double 2.000000e+00], align 16, !dbg !20
@v101 = dso_local global [3 x double] [double 4.000000e+00, double -3.000000e+00, double 2.000000e+00], align 16, !dbg !22
@v011 = dso_local global [3 x double] [double -4.000000e+00, double 3.000000e+00, double 2.000000e+00], align 16, !dbg !24
@v111 = dso_local global [3 x double] [double 4.000000e+00, double 3.000000e+00, double 2.000000e+00], align 16, !dbg !26
@f = dso_local global [6 x %struct.face_t] [%struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v000, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v010, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v110, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v100, i32 0, i32 0)], [3 x double] [double 0.000000e+00, double 0.000000e+00, double -1.000000e+00] }, %struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v001, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v011, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v111, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v101, i32 0, i32 0)], [3 x double] [double 0.000000e+00, double 0.000000e+00, double 1.000000e+00] }, %struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v000, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v010, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v011, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v001, i32 0, i32 0)], [3 x double] [double -1.000000e+00, double 0.000000e+00, double 0.000000e+00] }, %struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v100, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v110, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v111, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v101, i32 0, i32 0)], [3 x double] [double 1.000000e+00, double 0.000000e+00, double 0.000000e+00] }, %struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v000, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v100, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v101, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v001, i32 0, i32 0)], [3 x double] [double 0.000000e+00, double -1.000000e+00, double 0.000000e+00] }, %struct.face_t { [4 x double*] [double* getelementptr inbounds ([3 x double], [3 x double]* @v010, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v110, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v111, i32 0, i32 0), double* getelementptr inbounds ([3 x double], [3 x double]* @v011, i32 0, i32 0)], [3 x double] [double 0.000000e+00, double 1.000000e+00, double 0.000000e+00] }], align 16, !dbg !28
@__const.main.eye = private unnamed_addr constant [3 x double] [double 7.000000e+00, double 7.000000e+00, double 6.000000e+00], align 16
@__const.main.dir = private unnamed_addr constant [3 x double] [double -1.000000e+00, double -1.000000e+00, double -1.000000e+00], align 16
@__const.main.dy = private unnamed_addr constant [3 x double] [double 0.000000e+00, double 0.000000e+00, double 1.000000e+00], align 16
@__const.main.light = private unnamed_addr constant [3 x double] [double 6.000000e+00, double 8.000000e+00, double 6.000000e+00], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @vsub(double* %v1, double* %v2, double* %s) #0 !dbg !49 {
entry:
  call void @llvm.dbg.value(metadata double* %v1, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata double* %v2, metadata !54, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata double* %s, metadata !55, metadata !DIExpression()), !dbg !53
  %arrayidx = getelementptr inbounds double, double* %v1, i64 0, !dbg !56
  %0 = load double, double* %arrayidx, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds double, double* %v2, i64 0, !dbg !57
  %1 = load double, double* %arrayidx1, align 8, !dbg !57
  %sub = fsub double %0, %1, !dbg !58
  %arrayidx2 = getelementptr inbounds double, double* %s, i64 0, !dbg !59
  store double %sub, double* %arrayidx2, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds double, double* %v1, i64 1, !dbg !61
  %2 = load double, double* %arrayidx3, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds double, double* %v2, i64 1, !dbg !62
  %3 = load double, double* %arrayidx4, align 8, !dbg !62
  %sub5 = fsub double %2, %3, !dbg !63
  %arrayidx6 = getelementptr inbounds double, double* %s, i64 1, !dbg !64
  store double %sub5, double* %arrayidx6, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds double, double* %v1, i64 2, !dbg !66
  %4 = load double, double* %arrayidx7, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds double, double* %v2, i64 2, !dbg !67
  %5 = load double, double* %arrayidx8, align 8, !dbg !67
  %sub9 = fsub double %4, %5, !dbg !68
  %arrayidx10 = getelementptr inbounds double, double* %s, i64 2, !dbg !69
  store double %sub9, double* %arrayidx10, align 8, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @normalize(double* %v) #0 !dbg !72 {
entry:
  call void @llvm.dbg.value(metadata double* %v, metadata !75, metadata !DIExpression()), !dbg !76
  %arrayidx = getelementptr inbounds double, double* %v, i64 0, !dbg !77
  %0 = load double, double* %arrayidx, align 8, !dbg !77
  %arrayidx1 = getelementptr inbounds double, double* %v, i64 0, !dbg !78
  %1 = load double, double* %arrayidx1, align 8, !dbg !78
  %mul = fmul double %0, %1, !dbg !79
  %arrayidx2 = getelementptr inbounds double, double* %v, i64 1, !dbg !80
  %2 = load double, double* %arrayidx2, align 8, !dbg !80
  %arrayidx3 = getelementptr inbounds double, double* %v, i64 1, !dbg !81
  %3 = load double, double* %arrayidx3, align 8, !dbg !81
  %mul4 = fmul double %2, %3, !dbg !82
  %add = fadd double %mul, %mul4, !dbg !83
  %arrayidx5 = getelementptr inbounds double, double* %v, i64 2, !dbg !84
  %4 = load double, double* %arrayidx5, align 8, !dbg !84
  %arrayidx6 = getelementptr inbounds double, double* %v, i64 2, !dbg !85
  %5 = load double, double* %arrayidx6, align 8, !dbg !85
  %mul7 = fmul double %4, %5, !dbg !86
  %add8 = fadd double %add, %mul7, !dbg !87
  %call = call double @sqrt(double %add8) #5, !dbg !88
  call void @llvm.dbg.value(metadata double %call, metadata !89, metadata !DIExpression()), !dbg !76
  %arrayidx9 = getelementptr inbounds double, double* %v, i64 0, !dbg !90
  %6 = load double, double* %arrayidx9, align 8, !dbg !91
  %div = fdiv double %6, %call, !dbg !91
  store double %div, double* %arrayidx9, align 8, !dbg !91
  %arrayidx10 = getelementptr inbounds double, double* %v, i64 1, !dbg !92
  %7 = load double, double* %arrayidx10, align 8, !dbg !93
  %div11 = fdiv double %7, %call, !dbg !93
  store double %div11, double* %arrayidx10, align 8, !dbg !93
  %arrayidx12 = getelementptr inbounds double, double* %v, i64 2, !dbg !94
  %8 = load double, double* %arrayidx12, align 8, !dbg !95
  %div13 = fdiv double %8, %call, !dbg !95
  store double %div13, double* %arrayidx12, align 8, !dbg !95
  ret double %call, !dbg !96
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @dot(double* %x, double* %y) #0 !dbg !97 {
entry:
  call void @llvm.dbg.value(metadata double* %x, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata double* %y, metadata !102, metadata !DIExpression()), !dbg !101
  %arrayidx = getelementptr inbounds double, double* %x, i64 0, !dbg !103
  %0 = load double, double* %arrayidx, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds double, double* %y, i64 0, !dbg !104
  %1 = load double, double* %arrayidx1, align 8, !dbg !104
  %mul = fmul double %0, %1, !dbg !105
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 1, !dbg !106
  %2 = load double, double* %arrayidx2, align 8, !dbg !106
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 1, !dbg !107
  %3 = load double, double* %arrayidx3, align 8, !dbg !107
  %mul4 = fmul double %2, %3, !dbg !108
  %add = fadd double %mul, %mul4, !dbg !109
  %arrayidx5 = getelementptr inbounds double, double* %x, i64 2, !dbg !110
  %4 = load double, double* %arrayidx5, align 8, !dbg !110
  %arrayidx6 = getelementptr inbounds double, double* %y, i64 2, !dbg !111
  %5 = load double, double* %arrayidx6, align 8, !dbg !111
  %mul7 = fmul double %4, %5, !dbg !112
  %add8 = fadd double %add, %mul7, !dbg !113
  ret double %add8, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define dso_local double* @cross(double* %x, double* %y, double* %s) #0 !dbg !115 {
entry:
  call void @llvm.dbg.value(metadata double* %x, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.value(metadata double* %y, metadata !120, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.value(metadata double* %s, metadata !121, metadata !DIExpression()), !dbg !119
  %arrayidx = getelementptr inbounds double, double* %x, i64 1, !dbg !122
  %0 = load double, double* %arrayidx, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds double, double* %y, i64 2, !dbg !123
  %1 = load double, double* %arrayidx1, align 8, !dbg !123
  %mul = fmul double %0, %1, !dbg !124
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 2, !dbg !125
  %2 = load double, double* %arrayidx2, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 1, !dbg !126
  %3 = load double, double* %arrayidx3, align 8, !dbg !126
  %mul4 = fmul double %2, %3, !dbg !127
  %sub = fsub double %mul, %mul4, !dbg !128
  %arrayidx5 = getelementptr inbounds double, double* %s, i64 0, !dbg !129
  store double %sub, double* %arrayidx5, align 8, !dbg !130
  %arrayidx6 = getelementptr inbounds double, double* %x, i64 2, !dbg !131
  %4 = load double, double* %arrayidx6, align 8, !dbg !131
  %arrayidx7 = getelementptr inbounds double, double* %y, i64 0, !dbg !132
  %5 = load double, double* %arrayidx7, align 8, !dbg !132
  %mul8 = fmul double %4, %5, !dbg !133
  %arrayidx9 = getelementptr inbounds double, double* %x, i64 0, !dbg !134
  %6 = load double, double* %arrayidx9, align 8, !dbg !134
  %arrayidx10 = getelementptr inbounds double, double* %y, i64 2, !dbg !135
  %7 = load double, double* %arrayidx10, align 8, !dbg !135
  %mul11 = fmul double %6, %7, !dbg !136
  %sub12 = fsub double %mul8, %mul11, !dbg !137
  %arrayidx13 = getelementptr inbounds double, double* %s, i64 1, !dbg !138
  store double %sub12, double* %arrayidx13, align 8, !dbg !139
  %arrayidx14 = getelementptr inbounds double, double* %x, i64 0, !dbg !140
  %8 = load double, double* %arrayidx14, align 8, !dbg !140
  %arrayidx15 = getelementptr inbounds double, double* %y, i64 1, !dbg !141
  %9 = load double, double* %arrayidx15, align 8, !dbg !141
  %mul16 = fmul double %8, %9, !dbg !142
  %arrayidx17 = getelementptr inbounds double, double* %x, i64 1, !dbg !143
  %10 = load double, double* %arrayidx17, align 8, !dbg !143
  %arrayidx18 = getelementptr inbounds double, double* %y, i64 0, !dbg !144
  %11 = load double, double* %arrayidx18, align 8, !dbg !144
  %mul19 = fmul double %10, %11, !dbg !145
  %sub20 = fsub double %mul16, %mul19, !dbg !146
  %arrayidx21 = getelementptr inbounds double, double* %s, i64 2, !dbg !147
  store double %sub20, double* %arrayidx21, align 8, !dbg !148
  ret double* %s, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define dso_local double* @madd(double* %x, double* %y, double %d, double* %r) #0 !dbg !150 {
entry:
  call void @llvm.dbg.value(metadata double* %x, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.value(metadata double* %y, metadata !155, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.value(metadata double %d, metadata !156, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.value(metadata double* %r, metadata !157, metadata !DIExpression()), !dbg !154
  %arrayidx = getelementptr inbounds double, double* %x, i64 0, !dbg !158
  %0 = load double, double* %arrayidx, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds double, double* %y, i64 0, !dbg !159
  %1 = load double, double* %arrayidx1, align 8, !dbg !159
  %mul = fmul double %1, %d, !dbg !160
  %add = fadd double %0, %mul, !dbg !161
  %arrayidx2 = getelementptr inbounds double, double* %r, i64 0, !dbg !162
  store double %add, double* %arrayidx2, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds double, double* %x, i64 1, !dbg !164
  %2 = load double, double* %arrayidx3, align 8, !dbg !164
  %arrayidx4 = getelementptr inbounds double, double* %y, i64 1, !dbg !165
  %3 = load double, double* %arrayidx4, align 8, !dbg !165
  %mul5 = fmul double %3, %d, !dbg !166
  %add6 = fadd double %2, %mul5, !dbg !167
  %arrayidx7 = getelementptr inbounds double, double* %r, i64 1, !dbg !168
  store double %add6, double* %arrayidx7, align 8, !dbg !169
  %arrayidx8 = getelementptr inbounds double, double* %x, i64 2, !dbg !170
  %4 = load double, double* %arrayidx8, align 8, !dbg !170
  %arrayidx9 = getelementptr inbounds double, double* %y, i64 2, !dbg !171
  %5 = load double, double* %arrayidx9, align 8, !dbg !171
  %mul10 = fmul double %5, %d, !dbg !172
  %add11 = fadd double %4, %mul10, !dbg !173
  %arrayidx12 = getelementptr inbounds double, double* %r, i64 2, !dbg !174
  store double %add11, double* %arrayidx12, align 8, !dbg !175
  ret double* %r, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @in_range(double %x, double %x0, double %x1) #0 !dbg !177 {
entry:
  call void @llvm.dbg.value(metadata double %x, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata double %x0, metadata !182, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata double %x1, metadata !183, metadata !DIExpression()), !dbg !181
  %sub = fsub double %x, %x0, !dbg !184
  %sub1 = fsub double %x, %x1, !dbg !185
  %mul = fmul double %sub, %sub1, !dbg !186
  %cmp = fcmp ole double %mul, 0.000000e+00, !dbg !187
  %conv = zext i1 %cmp to i32, !dbg !187
  ret i32 %conv, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @face_hit(%struct.face_t* %face, double* %src, double* %dir, double* %hit, double* %d) #0 !dbg !189 {
entry:
  call void @llvm.dbg.value(metadata %struct.face_t* %face, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata double* %src, metadata !195, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata double* %dir, metadata !196, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata double* %hit, metadata !197, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata double* %d, metadata !198, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i32 0, metadata !199, metadata !DIExpression()), !dbg !194
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !202
  %dist.0 = phi double [ undef, %entry ], [ %dist.1, %for.inc ]
  call void @llvm.dbg.value(metadata double %dist.0, metadata !203, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !199, metadata !DIExpression()), !dbg !194
  %cmp = icmp slt i32 %i.0, 3, !dbg !204
  br i1 %cmp, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %norm = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 1, !dbg !207
  %idxprom = sext i32 %i.0 to i64, !dbg !209
  %arrayidx = getelementptr inbounds [3 x double], [3 x double]* %norm, i64 0, i64 %idxprom, !dbg !209
  %0 = load double, double* %arrayidx, align 8, !dbg !209
  %tobool = fcmp une double %0, 0.000000e+00, !dbg !209
  br i1 %tobool, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %for.body
  %v = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !211
  %arrayidx1 = getelementptr inbounds [4 x double*], [4 x double*]* %v, i64 0, i64 0, !dbg !212
  %1 = load double*, double** %arrayidx1, align 8, !dbg !212
  %idxprom2 = sext i32 %i.0 to i64, !dbg !212
  %arrayidx3 = getelementptr inbounds double, double* %1, i64 %idxprom2, !dbg !212
  %2 = load double, double* %arrayidx3, align 8, !dbg !212
  %idxprom4 = sext i32 %i.0 to i64, !dbg !213
  %arrayidx5 = getelementptr inbounds double, double* %src, i64 %idxprom4, !dbg !213
  %3 = load double, double* %arrayidx5, align 8, !dbg !213
  %sub = fsub double %2, %3, !dbg !214
  %idxprom6 = sext i32 %i.0 to i64, !dbg !215
  %arrayidx7 = getelementptr inbounds double, double* %dir, i64 %idxprom6, !dbg !215
  %4 = load double, double* %arrayidx7, align 8, !dbg !215
  %div = fdiv double %sub, %4, !dbg !216
  call void @llvm.dbg.value(metadata double %div, metadata !203, metadata !DIExpression()), !dbg !194
  br label %if.end, !dbg !217

if.end:                                           ; preds = %if.then, %for.body
  %dist.1 = phi double [ %div, %if.then ], [ %dist.0, %for.body ]
  call void @llvm.dbg.value(metadata double %dist.1, metadata !203, metadata !DIExpression()), !dbg !194
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !219
  call void @llvm.dbg.value(metadata i32 %inc, metadata !199, metadata !DIExpression()), !dbg !194
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %call = call double* @madd(double* %src, double* %dir, double %dist.0, double* %hit), !dbg !223
  %norm8 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 1, !dbg !224
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %norm8, i64 0, i64 0, !dbg !225
  %call9 = call double @dot(double* %dir, double* %arraydecay), !dbg !226
  %mul = fmul double %call9, %dist.0, !dbg !227
  %5 = call double @llvm.fabs.f64(double %mul), !dbg !228
  store double %5, double* %d, align 8, !dbg !229
  %norm10 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 1, !dbg !230
  %arrayidx11 = getelementptr inbounds [3 x double], [3 x double]* %norm10, i64 0, i64 0, !dbg !232
  %6 = load double, double* %arrayidx11, align 8, !dbg !232
  %tobool12 = fcmp une double %6, 0.000000e+00, !dbg !232
  br i1 %tobool12, label %if.then13, label %if.else, !dbg !233

if.then13:                                        ; preds = %for.end
  %arrayidx14 = getelementptr inbounds double, double* %hit, i64 1, !dbg !234
  %7 = load double, double* %arrayidx14, align 8, !dbg !234
  %v15 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !236
  %arrayidx16 = getelementptr inbounds [4 x double*], [4 x double*]* %v15, i64 0, i64 0, !dbg !237
  %8 = load double*, double** %arrayidx16, align 8, !dbg !237
  %arrayidx17 = getelementptr inbounds double, double* %8, i64 1, !dbg !237
  %9 = load double, double* %arrayidx17, align 8, !dbg !237
  %v18 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !238
  %arrayidx19 = getelementptr inbounds [4 x double*], [4 x double*]* %v18, i64 0, i64 2, !dbg !239
  %10 = load double*, double** %arrayidx19, align 8, !dbg !239
  %arrayidx20 = getelementptr inbounds double, double* %10, i64 1, !dbg !239
  %11 = load double, double* %arrayidx20, align 8, !dbg !239
  %call21 = call i32 @in_range(double %7, double %9, double %11), !dbg !240
  %tobool22 = icmp ne i32 %call21, 0, !dbg !240
  br i1 %tobool22, label %land.rhs, label %land.end, !dbg !241

land.rhs:                                         ; preds = %if.then13
  %arrayidx23 = getelementptr inbounds double, double* %hit, i64 2, !dbg !242
  %12 = load double, double* %arrayidx23, align 8, !dbg !242
  %v24 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !243
  %arrayidx25 = getelementptr inbounds [4 x double*], [4 x double*]* %v24, i64 0, i64 0, !dbg !244
  %13 = load double*, double** %arrayidx25, align 8, !dbg !244
  %arrayidx26 = getelementptr inbounds double, double* %13, i64 2, !dbg !244
  %14 = load double, double* %arrayidx26, align 8, !dbg !244
  %v27 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !245
  %arrayidx28 = getelementptr inbounds [4 x double*], [4 x double*]* %v27, i64 0, i64 2, !dbg !246
  %15 = load double*, double** %arrayidx28, align 8, !dbg !246
  %arrayidx29 = getelementptr inbounds double, double* %15, i64 2, !dbg !246
  %16 = load double, double* %arrayidx29, align 8, !dbg !246
  %call30 = call i32 @in_range(double %12, double %14, double %16), !dbg !247
  %tobool31 = icmp ne i32 %call30, 0, !dbg !241
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then13
  %17 = phi i1 [ false, %if.then13 ], [ %tobool31, %land.rhs ], !dbg !248
  %land.ext = zext i1 %17 to i32, !dbg !241
  br label %return, !dbg !249

if.else:                                          ; preds = %for.end
  %norm32 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 1, !dbg !250
  %arrayidx33 = getelementptr inbounds [3 x double], [3 x double]* %norm32, i64 0, i64 1, !dbg !252
  %18 = load double, double* %arrayidx33, align 8, !dbg !252
  %tobool34 = fcmp une double %18, 0.000000e+00, !dbg !252
  br i1 %tobool34, label %if.then35, label %if.else57, !dbg !253

if.then35:                                        ; preds = %if.else
  %arrayidx36 = getelementptr inbounds double, double* %hit, i64 0, !dbg !254
  %19 = load double, double* %arrayidx36, align 8, !dbg !254
  %v37 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !256
  %arrayidx38 = getelementptr inbounds [4 x double*], [4 x double*]* %v37, i64 0, i64 0, !dbg !257
  %20 = load double*, double** %arrayidx38, align 8, !dbg !257
  %arrayidx39 = getelementptr inbounds double, double* %20, i64 0, !dbg !257
  %21 = load double, double* %arrayidx39, align 8, !dbg !257
  %v40 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !258
  %arrayidx41 = getelementptr inbounds [4 x double*], [4 x double*]* %v40, i64 0, i64 2, !dbg !259
  %22 = load double*, double** %arrayidx41, align 8, !dbg !259
  %arrayidx42 = getelementptr inbounds double, double* %22, i64 0, !dbg !259
  %23 = load double, double* %arrayidx42, align 8, !dbg !259
  %call43 = call i32 @in_range(double %19, double %21, double %23), !dbg !260
  %tobool44 = icmp ne i32 %call43, 0, !dbg !260
  br i1 %tobool44, label %land.rhs45, label %land.end55, !dbg !261

land.rhs45:                                       ; preds = %if.then35
  %arrayidx46 = getelementptr inbounds double, double* %hit, i64 2, !dbg !262
  %24 = load double, double* %arrayidx46, align 8, !dbg !262
  %v47 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !263
  %arrayidx48 = getelementptr inbounds [4 x double*], [4 x double*]* %v47, i64 0, i64 0, !dbg !264
  %25 = load double*, double** %arrayidx48, align 8, !dbg !264
  %arrayidx49 = getelementptr inbounds double, double* %25, i64 2, !dbg !264
  %26 = load double, double* %arrayidx49, align 8, !dbg !264
  %v50 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !265
  %arrayidx51 = getelementptr inbounds [4 x double*], [4 x double*]* %v50, i64 0, i64 2, !dbg !266
  %27 = load double*, double** %arrayidx51, align 8, !dbg !266
  %arrayidx52 = getelementptr inbounds double, double* %27, i64 2, !dbg !266
  %28 = load double, double* %arrayidx52, align 8, !dbg !266
  %call53 = call i32 @in_range(double %24, double %26, double %28), !dbg !267
  %tobool54 = icmp ne i32 %call53, 0, !dbg !261
  br label %land.end55

land.end55:                                       ; preds = %land.rhs45, %if.then35
  %29 = phi i1 [ false, %if.then35 ], [ %tobool54, %land.rhs45 ], !dbg !268
  %land.ext56 = zext i1 %29 to i32, !dbg !261
  br label %return, !dbg !269

if.else57:                                        ; preds = %if.else
  %norm58 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 1, !dbg !270
  %arrayidx59 = getelementptr inbounds [3 x double], [3 x double]* %norm58, i64 0, i64 2, !dbg !272
  %30 = load double, double* %arrayidx59, align 8, !dbg !272
  %tobool60 = fcmp une double %30, 0.000000e+00, !dbg !272
  br i1 %tobool60, label %if.then61, label %if.end83, !dbg !273

if.then61:                                        ; preds = %if.else57
  %arrayidx62 = getelementptr inbounds double, double* %hit, i64 0, !dbg !274
  %31 = load double, double* %arrayidx62, align 8, !dbg !274
  %v63 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !276
  %arrayidx64 = getelementptr inbounds [4 x double*], [4 x double*]* %v63, i64 0, i64 0, !dbg !277
  %32 = load double*, double** %arrayidx64, align 8, !dbg !277
  %arrayidx65 = getelementptr inbounds double, double* %32, i64 0, !dbg !277
  %33 = load double, double* %arrayidx65, align 8, !dbg !277
  %v66 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !278
  %arrayidx67 = getelementptr inbounds [4 x double*], [4 x double*]* %v66, i64 0, i64 2, !dbg !279
  %34 = load double*, double** %arrayidx67, align 8, !dbg !279
  %arrayidx68 = getelementptr inbounds double, double* %34, i64 0, !dbg !279
  %35 = load double, double* %arrayidx68, align 8, !dbg !279
  %call69 = call i32 @in_range(double %31, double %33, double %35), !dbg !280
  %tobool70 = icmp ne i32 %call69, 0, !dbg !280
  br i1 %tobool70, label %land.rhs71, label %land.end81, !dbg !281

land.rhs71:                                       ; preds = %if.then61
  %arrayidx72 = getelementptr inbounds double, double* %hit, i64 1, !dbg !282
  %36 = load double, double* %arrayidx72, align 8, !dbg !282
  %v73 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !283
  %arrayidx74 = getelementptr inbounds [4 x double*], [4 x double*]* %v73, i64 0, i64 0, !dbg !284
  %37 = load double*, double** %arrayidx74, align 8, !dbg !284
  %arrayidx75 = getelementptr inbounds double, double* %37, i64 1, !dbg !284
  %38 = load double, double* %arrayidx75, align 8, !dbg !284
  %v76 = getelementptr inbounds %struct.face_t, %struct.face_t* %face, i32 0, i32 0, !dbg !285
  %arrayidx77 = getelementptr inbounds [4 x double*], [4 x double*]* %v76, i64 0, i64 2, !dbg !286
  %39 = load double*, double** %arrayidx77, align 8, !dbg !286
  %arrayidx78 = getelementptr inbounds double, double* %39, i64 1, !dbg !286
  %40 = load double, double* %arrayidx78, align 8, !dbg !286
  %call79 = call i32 @in_range(double %36, double %38, double %40), !dbg !287
  %tobool80 = icmp ne i32 %call79, 0, !dbg !281
  br label %land.end81

land.end81:                                       ; preds = %land.rhs71, %if.then61
  %41 = phi i1 [ false, %if.then61 ], [ %tobool80, %land.rhs71 ], !dbg !288
  %land.ext82 = zext i1 %41 to i32, !dbg !281
  br label %return, !dbg !289

if.end83:                                         ; preds = %if.else57
  br label %if.end84

if.end84:                                         ; preds = %if.end83
  br label %if.end85

if.end85:                                         ; preds = %if.end84
  br label %return, !dbg !290

return:                                           ; preds = %if.end85, %land.end81, %land.end55, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ %land.ext56, %land.end55 ], [ %land.ext82, %land.end81 ], [ 0, %if.end85 ], !dbg !194
  ret i32 %retval.0, !dbg !291
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !292 {
entry:
  %eye = alloca [3 x double], align 16
  %dir = alloca [3 x double], align 16
  %orig = alloca [3 x double], align 16
  %hit = alloca [3 x double], align 16
  %dx = alloca [3 x double], align 16
  %dy = alloca [3 x double], align 16
  %proj = alloca [3 x double], align 16
  %d = alloca double, align 8
  %light = alloca [3 x double], align 16
  %ldist = alloca [3 x double], align 16
  call void @llvm.dbg.declare(metadata [3 x double]* %eye, metadata !294, metadata !DIExpression()), !dbg !295
  %0 = bitcast [3 x double]* %eye to i8*, !dbg !295
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x double]* @__const.main.eye to i8*), i64 24, i1 false), !dbg !295
  call void @llvm.dbg.declare(metadata [3 x double]* %dir, metadata !296, metadata !DIExpression()), !dbg !297
  %1 = bitcast [3 x double]* %dir to i8*, !dbg !297
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([3 x double]* @__const.main.dir to i8*), i64 24, i1 false), !dbg !297
  call void @llvm.dbg.declare(metadata [3 x double]* %orig, metadata !298, metadata !DIExpression()), !dbg !299
  %2 = bitcast [3 x double]* %orig to i8*, !dbg !299
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 24, i1 false), !dbg !299
  call void @llvm.dbg.declare(metadata [3 x double]* %hit, metadata !300, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata [3 x double]* %dx, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata [3 x double]* %dy, metadata !304, metadata !DIExpression()), !dbg !305
  %3 = bitcast [3 x double]* %dy to i8*, !dbg !305
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([3 x double]* @__const.main.dy to i8*), i64 24, i1 false), !dbg !305
  call void @llvm.dbg.declare(metadata [3 x double]* %proj, metadata !306, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.declare(metadata double* %d, metadata !308, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata [3 x double]* %light, metadata !310, metadata !DIExpression()), !dbg !311
  %4 = bitcast [3 x double]* %light to i8*, !dbg !311
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([3 x double]* @__const.main.light to i8*), i64 24, i1 false), !dbg !311
  call void @llvm.dbg.declare(metadata [3 x double]* %ldist, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double 1.000000e+01, metadata !314, metadata !DIExpression()), !dbg !315
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %eye, i64 0, i64 0, !dbg !316
  %arraydecay1 = getelementptr inbounds [3 x double], [3 x double]* %dy, i64 0, i64 0, !dbg !317
  %arraydecay2 = getelementptr inbounds [3 x double], [3 x double]* %dx, i64 0, i64 0, !dbg !318
  %call = call double* @cross(double* %arraydecay, double* %arraydecay1, double* %arraydecay2), !dbg !319
  %call3 = call double @normalize(double* %call), !dbg !320
  %arraydecay4 = getelementptr inbounds [3 x double], [3 x double]* %eye, i64 0, i64 0, !dbg !321
  %arraydecay5 = getelementptr inbounds [3 x double], [3 x double]* %dx, i64 0, i64 0, !dbg !322
  %arraydecay6 = getelementptr inbounds [3 x double], [3 x double]* %dy, i64 0, i64 0, !dbg !323
  %call7 = call double* @cross(double* %arraydecay4, double* %arraydecay5, double* %arraydecay6), !dbg !324
  %call8 = call double @normalize(double* %call7), !dbg !325
  call void @llvm.dbg.value(metadata i32 -10, metadata !326, metadata !DIExpression()), !dbg !315
  br label %for.cond, !dbg !327

for.cond:                                         ; preds = %for.inc76, %entry
  %i.0 = phi i32 [ -10, %entry ], [ %inc77, %for.inc76 ], !dbg !329
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !326, metadata !DIExpression()), !dbg !315
  %cmp = icmp sle i32 %i.0, 17, !dbg !330
  br i1 %cmp, label %for.body, label %for.end78, !dbg !332

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 -35, metadata !333, metadata !DIExpression()), !dbg !315
  br label %for.cond9, !dbg !334

for.cond9:                                        ; preds = %for.inc72, %for.body
  %j.0 = phi i32 [ -35, %for.body ], [ %inc73, %for.inc72 ], !dbg !337
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !333, metadata !DIExpression()), !dbg !315
  %cmp10 = icmp slt i32 %j.0, 35, !dbg !338
  br i1 %cmp10, label %for.body11, label %for.end74, !dbg !340

for.body11:                                       ; preds = %for.cond9
  %arraydecay12 = getelementptr inbounds [3 x double], [3 x double]* %orig, i64 0, i64 0, !dbg !341
  %arraydecay13 = getelementptr inbounds [3 x double], [3 x double]* %orig, i64 0, i64 0, !dbg !343
  %arraydecay14 = getelementptr inbounds [3 x double], [3 x double]* %proj, i64 0, i64 0, !dbg !344
  call void @vsub(double* %arraydecay12, double* %arraydecay13, double* %arraydecay14), !dbg !345
  %arraydecay15 = getelementptr inbounds [3 x double], [3 x double]* %proj, i64 0, i64 0, !dbg !346
  %arraydecay16 = getelementptr inbounds [3 x double], [3 x double]* %dx, i64 0, i64 0, !dbg !347
  %conv = sitofp i32 %j.0 to double, !dbg !348
  %div = fdiv double %conv, 6.000000e+00, !dbg !349
  %arraydecay17 = getelementptr inbounds [3 x double], [3 x double]* %proj, i64 0, i64 0, !dbg !350
  %call18 = call double* @madd(double* %arraydecay15, double* %arraydecay16, double %div, double* %arraydecay17), !dbg !351
  %arraydecay19 = getelementptr inbounds [3 x double], [3 x double]* %dy, i64 0, i64 0, !dbg !352
  %conv20 = sitofp i32 %i.0 to double, !dbg !353
  %div21 = fdiv double %conv20, 3.000000e+00, !dbg !354
  %arraydecay22 = getelementptr inbounds [3 x double], [3 x double]* %proj, i64 0, i64 0, !dbg !355
  %call23 = call double* @madd(double* %call18, double* %arraydecay19, double %div21, double* %arraydecay22), !dbg !356
  %arraydecay24 = getelementptr inbounds [3 x double], [3 x double]* %proj, i64 0, i64 0, !dbg !357
  %arraydecay25 = getelementptr inbounds [3 x double], [3 x double]* %eye, i64 0, i64 0, !dbg !358
  %arraydecay26 = getelementptr inbounds [3 x double], [3 x double]* %dir, i64 0, i64 0, !dbg !359
  call void @vsub(double* %arraydecay24, double* %arraydecay25, double* %arraydecay26), !dbg !360
  call void @llvm.dbg.value(metadata double 1.000000e+100, metadata !361, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata double* null, metadata !362, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata i32 0, metadata !363, metadata !DIExpression()), !dbg !315
  br label %for.cond27, !dbg !364

for.cond27:                                       ; preds = %for.inc, %for.body11
  %dbest.0 = phi double [ 1.000000e+100, %for.body11 ], [ %dbest.2, %for.inc ], !dbg !366
  %norm.0 = phi double* [ null, %for.body11 ], [ %norm.2, %for.inc ], !dbg !366
  %k.0 = phi i32 [ 0, %for.body11 ], [ %inc, %for.inc ], !dbg !367
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !363, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata double* %norm.0, metadata !362, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata double %dbest.0, metadata !361, metadata !DIExpression()), !dbg !315
  %cmp28 = icmp slt i32 %k.0, 6, !dbg !368
  br i1 %cmp28, label %for.body30, label %for.end, !dbg !370

for.body30:                                       ; preds = %for.cond27
  %idx.ext = sext i32 %k.0 to i64, !dbg !371
  %add.ptr = getelementptr inbounds %struct.face_t, %struct.face_t* getelementptr inbounds ([6 x %struct.face_t], [6 x %struct.face_t]* @f, i64 0, i64 0), i64 %idx.ext, !dbg !371
  %arraydecay31 = getelementptr inbounds [3 x double], [3 x double]* %eye, i64 0, i64 0, !dbg !374
  %arraydecay32 = getelementptr inbounds [3 x double], [3 x double]* %dir, i64 0, i64 0, !dbg !375
  %arraydecay33 = getelementptr inbounds [3 x double], [3 x double]* %hit, i64 0, i64 0, !dbg !376
  %call34 = call i32 @face_hit(%struct.face_t* %add.ptr, double* %arraydecay31, double* %arraydecay32, double* %arraydecay33, double* %d), !dbg !377
  %tobool = icmp ne i32 %call34, 0, !dbg !377
  br i1 %tobool, label %if.end, label %if.then, !dbg !378

if.then:                                          ; preds = %for.body30
  br label %for.inc, !dbg !379

if.end:                                           ; preds = %for.body30
  %5 = load double, double* %d, align 8, !dbg !380
  %cmp35 = fcmp ogt double %dbest.0, %5, !dbg !382
  br i1 %cmp35, label %if.then37, label %if.end40, !dbg !383

if.then37:                                        ; preds = %if.end
  %6 = load double, double* %d, align 8, !dbg !384
  call void @llvm.dbg.value(metadata double %6, metadata !361, metadata !DIExpression()), !dbg !315
  %idxprom = sext i32 %k.0 to i64, !dbg !386
  %arrayidx = getelementptr inbounds [6 x %struct.face_t], [6 x %struct.face_t]* @f, i64 0, i64 %idxprom, !dbg !386
  %norm38 = getelementptr inbounds %struct.face_t, %struct.face_t* %arrayidx, i32 0, i32 1, !dbg !387
  %arraydecay39 = getelementptr inbounds [3 x double], [3 x double]* %norm38, i64 0, i64 0, !dbg !386
  call void @llvm.dbg.value(metadata double* %arraydecay39, metadata !362, metadata !DIExpression()), !dbg !315
  br label %if.end40, !dbg !388

if.end40:                                         ; preds = %if.then37, %if.end
  %dbest.1 = phi double [ %6, %if.then37 ], [ %dbest.0, %if.end ], !dbg !366
  %norm.1 = phi double* [ %arraydecay39, %if.then37 ], [ %norm.0, %if.end ], !dbg !366
  call void @llvm.dbg.value(metadata double* %norm.1, metadata !362, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata double %dbest.1, metadata !361, metadata !DIExpression()), !dbg !315
  br label %for.inc, !dbg !389

for.inc:                                          ; preds = %if.end40, %if.then
  %dbest.2 = phi double [ %dbest.1, %if.end40 ], [ %dbest.0, %if.then ], !dbg !366
  %norm.2 = phi double* [ %norm.1, %if.end40 ], [ %norm.0, %if.then ], !dbg !366
  call void @llvm.dbg.value(metadata double* %norm.2, metadata !362, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.value(metadata double %dbest.2, metadata !361, metadata !DIExpression()), !dbg !315
  %inc = add nsw i32 %k.0, 1, !dbg !390
  call void @llvm.dbg.value(metadata i32 %inc, metadata !363, metadata !DIExpression()), !dbg !315
  br label %for.cond27, !dbg !391, !llvm.loop !392

for.end:                                          ; preds = %for.cond27
  %tobool41 = icmp ne double* %norm.0, null, !dbg !394
  br i1 %tobool41, label %if.end44, label %if.then42, !dbg !396

if.then42:                                        ; preds = %for.end
  %call43 = call i32 @putchar(i32 32), !dbg !397
  br label %for.inc72, !dbg !399

if.end44:                                         ; preds = %for.end
  %arraydecay45 = getelementptr inbounds [3 x double], [3 x double]* %light, i64 0, i64 0, !dbg !400
  %arraydecay46 = getelementptr inbounds [3 x double], [3 x double]* %hit, i64 0, i64 0, !dbg !401
  %arraydecay47 = getelementptr inbounds [3 x double], [3 x double]* %ldist, i64 0, i64 0, !dbg !402
  call void @vsub(double* %arraydecay45, double* %arraydecay46, double* %arraydecay47), !dbg !403
  %arraydecay48 = getelementptr inbounds [3 x double], [3 x double]* %ldist, i64 0, i64 0, !dbg !404
  %call49 = call double @normalize(double* %arraydecay48), !dbg !405
  call void @llvm.dbg.value(metadata double %call49, metadata !406, metadata !DIExpression()), !dbg !315
  %arraydecay50 = getelementptr inbounds [3 x double], [3 x double]* %ldist, i64 0, i64 0, !dbg !407
  %call51 = call double @dot(double* %norm.0, double* %arraydecay50), !dbg !408
  %div52 = fdiv double %call51, %call49, !dbg !409
  %mul = fmul double %div52, 1.000000e+01, !dbg !410
  call void @llvm.dbg.value(metadata double %mul, metadata !411, metadata !DIExpression()), !dbg !315
  %cmp53 = fcmp olt double %mul, 0.000000e+00, !dbg !412
  br i1 %cmp53, label %if.then55, label %if.else, !dbg !414

if.then55:                                        ; preds = %if.end44
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !411, metadata !DIExpression()), !dbg !315
  br label %if.end60, !dbg !415

if.else:                                          ; preds = %if.end44
  %cmp56 = fcmp ogt double %mul, 1.000000e+00, !dbg !416
  br i1 %cmp56, label %if.then58, label %if.end59, !dbg !418

if.then58:                                        ; preds = %if.else
  call void @llvm.dbg.value(metadata double 1.000000e+00, metadata !411, metadata !DIExpression()), !dbg !315
  br label %if.end59, !dbg !419

if.end59:                                         ; preds = %if.then58, %if.else
  %b.0 = phi double [ 1.000000e+00, %if.then58 ], [ %mul, %if.else ], !dbg !366
  call void @llvm.dbg.value(metadata double %b.0, metadata !411, metadata !DIExpression()), !dbg !315
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %if.then55
  %b.1 = phi double [ 0.000000e+00, %if.then55 ], [ %b.0, %if.end59 ], !dbg !420
  call void @llvm.dbg.value(metadata double %b.1, metadata !411, metadata !DIExpression()), !dbg !315
  %add = fadd double %b.1, 2.000000e-01, !dbg !421
  call void @llvm.dbg.value(metadata double %add, metadata !411, metadata !DIExpression()), !dbg !315
  %cmp61 = fcmp ogt double %add, 1.000000e+00, !dbg !422
  br i1 %cmp61, label %if.then63, label %if.else64, !dbg !424

if.then63:                                        ; preds = %if.end60
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !411, metadata !DIExpression()), !dbg !315
  br label %if.end65, !dbg !425

if.else64:                                        ; preds = %if.end60
  %sub = fsub double 1.000000e+00, %add, !dbg !426
  call void @llvm.dbg.value(metadata double %sub, metadata !411, metadata !DIExpression()), !dbg !315
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %if.then63
  %b.2 = phi double [ 0.000000e+00, %if.then63 ], [ %sub, %if.else64 ], !dbg !427
  call void @llvm.dbg.value(metadata double %b.2, metadata !411, metadata !DIExpression()), !dbg !315
  %7 = load i8*, i8** @shades, align 8, !dbg !428
  %mul66 = fmul double %b.2, 6.000000e+00, !dbg !429
  %conv67 = fptosi double %mul66 to i32, !dbg !430
  %idxprom68 = sext i32 %conv67 to i64, !dbg !428
  %arrayidx69 = getelementptr inbounds i8, i8* %7, i64 %idxprom68, !dbg !428
  %8 = load i8, i8* %arrayidx69, align 1, !dbg !428
  %conv70 = sext i8 %8 to i32, !dbg !428
  %call71 = call i32 @putchar(i32 %conv70), !dbg !431
  br label %for.inc72, !dbg !432

for.inc72:                                        ; preds = %if.end65, %if.then42
  %inc73 = add nsw i32 %j.0, 1, !dbg !433
  call void @llvm.dbg.value(metadata i32 %inc73, metadata !333, metadata !DIExpression()), !dbg !315
  br label %for.cond9, !dbg !434, !llvm.loop !435

for.end74:                                        ; preds = %for.cond9
  %call75 = call i32 @putchar(i32 10), !dbg !437
  br label %for.inc76, !dbg !438

for.inc76:                                        ; preds = %for.end74
  %inc77 = add nsw i32 %i.0, 1, !dbg !439
  call void @llvm.dbg.value(metadata i32 %inc77, metadata !326, metadata !DIExpression()), !dbg !315
  br label %for.cond, !dbg !440, !llvm.loop !441

for.end78:                                        ; preds = %for.cond
  ret i32 0, !dbg !443
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i32 @putchar(i32) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!45, !46, !47}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "shades", scope: !2, file: !3, line: 5, type: !42, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "draw-a-cuboid.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Draw-a-cuboid")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{!0, !8, !14, !16, !18, !20, !22, !24, !26, !28}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "v000", scope: !2, file: !3, line: 37, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 192, elements: !12)
!11 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!12 = !{!13}
!13 = !DISubrange(count: 3)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "v100", scope: !2, file: !3, line: 38, type: !10, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "v010", scope: !2, file: !3, line: 39, type: !10, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "v110", scope: !2, file: !3, line: 40, type: !10, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "v001", scope: !2, file: !3, line: 41, type: !10, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "v101", scope: !2, file: !3, line: 42, type: !10, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "v011", scope: !2, file: !3, line: 43, type: !10, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "v111", scope: !2, file: !3, line: 44, type: !10, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "f", scope: !2, file: !3, line: 51, type: !30, isLocal: false, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 2688, elements: !40)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "face_t", file: !3, line: 49, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 46, size: 448, elements: !33)
!33 = !{!34, !39}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !32, file: !3, line: 47, baseType: !35, size: 256)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 256, elements: !37)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!37 = !{!38}
!38 = !DISubrange(count: 4)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "norm", scope: !32, file: !3, line: 48, baseType: !10, size: 192, offset: 256)
!40 = !{!41}
!41 = !DISubrange(count: 6)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !{i32 7, !"Dwarf Version", i32 4}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!49 = distinct !DISubprogram(name: "vsub", scope: !3, file: !3, line: 7, type: !50, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !36, !36, !36}
!52 = !DILocalVariable(name: "v1", arg: 1, scope: !49, file: !3, line: 7, type: !36)
!53 = !DILocation(line: 0, scope: !49)
!54 = !DILocalVariable(name: "v2", arg: 2, scope: !49, file: !3, line: 7, type: !36)
!55 = !DILocalVariable(name: "s", arg: 3, scope: !49, file: !3, line: 7, type: !36)
!56 = !DILocation(line: 8, column: 9, scope: !49)
!57 = !DILocation(line: 8, column: 17, scope: !49)
!58 = !DILocation(line: 8, column: 15, scope: !49)
!59 = !DILocation(line: 8, column: 2, scope: !49)
!60 = !DILocation(line: 8, column: 7, scope: !49)
!61 = !DILocation(line: 9, column: 9, scope: !49)
!62 = !DILocation(line: 9, column: 17, scope: !49)
!63 = !DILocation(line: 9, column: 15, scope: !49)
!64 = !DILocation(line: 9, column: 2, scope: !49)
!65 = !DILocation(line: 9, column: 7, scope: !49)
!66 = !DILocation(line: 10, column: 9, scope: !49)
!67 = !DILocation(line: 10, column: 17, scope: !49)
!68 = !DILocation(line: 10, column: 15, scope: !49)
!69 = !DILocation(line: 10, column: 2, scope: !49)
!70 = !DILocation(line: 10, column: 7, scope: !49)
!71 = !DILocation(line: 11, column: 1, scope: !49)
!72 = distinct !DISubprogram(name: "normalize", scope: !3, file: !3, line: 13, type: !73, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!11, !36}
!75 = !DILocalVariable(name: "v", arg: 1, scope: !72, file: !3, line: 13, type: !36)
!76 = !DILocation(line: 0, scope: !72)
!77 = !DILocation(line: 14, column: 27, scope: !72)
!78 = !DILocation(line: 14, column: 32, scope: !72)
!79 = !DILocation(line: 14, column: 31, scope: !72)
!80 = !DILocation(line: 14, column: 39, scope: !72)
!81 = !DILocation(line: 14, column: 44, scope: !72)
!82 = !DILocation(line: 14, column: 43, scope: !72)
!83 = !DILocation(line: 14, column: 37, scope: !72)
!84 = !DILocation(line: 14, column: 51, scope: !72)
!85 = !DILocation(line: 14, column: 56, scope: !72)
!86 = !DILocation(line: 14, column: 55, scope: !72)
!87 = !DILocation(line: 14, column: 49, scope: !72)
!88 = !DILocation(line: 14, column: 22, scope: !72)
!89 = !DILocalVariable(name: "len", scope: !72, file: !3, line: 14, type: !11)
!90 = !DILocation(line: 15, column: 9, scope: !72)
!91 = !DILocation(line: 15, column: 14, scope: !72)
!92 = !DILocation(line: 15, column: 22, scope: !72)
!93 = !DILocation(line: 15, column: 27, scope: !72)
!94 = !DILocation(line: 15, column: 35, scope: !72)
!95 = !DILocation(line: 15, column: 40, scope: !72)
!96 = !DILocation(line: 16, column: 2, scope: !72)
!97 = distinct !DISubprogram(name: "dot", scope: !3, file: !3, line: 19, type: !98, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!11, !36, !36}
!100 = !DILocalVariable(name: "x", arg: 1, scope: !97, file: !3, line: 19, type: !36)
!101 = !DILocation(line: 0, scope: !97)
!102 = !DILocalVariable(name: "y", arg: 2, scope: !97, file: !3, line: 19, type: !36)
!103 = !DILocation(line: 20, column: 16, scope: !97)
!104 = !DILocation(line: 20, column: 21, scope: !97)
!105 = !DILocation(line: 20, column: 20, scope: !97)
!106 = !DILocation(line: 20, column: 28, scope: !97)
!107 = !DILocation(line: 20, column: 33, scope: !97)
!108 = !DILocation(line: 20, column: 32, scope: !97)
!109 = !DILocation(line: 20, column: 26, scope: !97)
!110 = !DILocation(line: 20, column: 40, scope: !97)
!111 = !DILocation(line: 20, column: 45, scope: !97)
!112 = !DILocation(line: 20, column: 44, scope: !97)
!113 = !DILocation(line: 20, column: 38, scope: !97)
!114 = !DILocation(line: 20, column: 9, scope: !97)
!115 = distinct !DISubprogram(name: "cross", scope: !3, file: !3, line: 23, type: !116, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DISubroutineType(types: !117)
!117 = !{!36, !36, !36, !36}
!118 = !DILocalVariable(name: "x", arg: 1, scope: !115, file: !3, line: 23, type: !36)
!119 = !DILocation(line: 0, scope: !115)
!120 = !DILocalVariable(name: "y", arg: 2, scope: !115, file: !3, line: 23, type: !36)
!121 = !DILocalVariable(name: "s", arg: 3, scope: !115, file: !3, line: 23, type: !36)
!122 = !DILocation(line: 24, column: 9, scope: !115)
!123 = !DILocation(line: 24, column: 16, scope: !115)
!124 = !DILocation(line: 24, column: 14, scope: !115)
!125 = !DILocation(line: 24, column: 23, scope: !115)
!126 = !DILocation(line: 24, column: 30, scope: !115)
!127 = !DILocation(line: 24, column: 28, scope: !115)
!128 = !DILocation(line: 24, column: 21, scope: !115)
!129 = !DILocation(line: 24, column: 2, scope: !115)
!130 = !DILocation(line: 24, column: 7, scope: !115)
!131 = !DILocation(line: 25, column: 9, scope: !115)
!132 = !DILocation(line: 25, column: 16, scope: !115)
!133 = !DILocation(line: 25, column: 14, scope: !115)
!134 = !DILocation(line: 25, column: 23, scope: !115)
!135 = !DILocation(line: 25, column: 30, scope: !115)
!136 = !DILocation(line: 25, column: 28, scope: !115)
!137 = !DILocation(line: 25, column: 21, scope: !115)
!138 = !DILocation(line: 25, column: 2, scope: !115)
!139 = !DILocation(line: 25, column: 7, scope: !115)
!140 = !DILocation(line: 26, column: 9, scope: !115)
!141 = !DILocation(line: 26, column: 16, scope: !115)
!142 = !DILocation(line: 26, column: 14, scope: !115)
!143 = !DILocation(line: 26, column: 23, scope: !115)
!144 = !DILocation(line: 26, column: 30, scope: !115)
!145 = !DILocation(line: 26, column: 28, scope: !115)
!146 = !DILocation(line: 26, column: 21, scope: !115)
!147 = !DILocation(line: 26, column: 2, scope: !115)
!148 = !DILocation(line: 26, column: 7, scope: !115)
!149 = !DILocation(line: 27, column: 2, scope: !115)
!150 = distinct !DISubprogram(name: "madd", scope: !3, file: !3, line: 30, type: !151, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DISubroutineType(types: !152)
!152 = !{!36, !36, !36, !11, !36}
!153 = !DILocalVariable(name: "x", arg: 1, scope: !150, file: !3, line: 30, type: !36)
!154 = !DILocation(line: 0, scope: !150)
!155 = !DILocalVariable(name: "y", arg: 2, scope: !150, file: !3, line: 30, type: !36)
!156 = !DILocalVariable(name: "d", arg: 3, scope: !150, file: !3, line: 30, type: !11)
!157 = !DILocalVariable(name: "r", arg: 4, scope: !150, file: !3, line: 30, type: !36)
!158 = !DILocation(line: 31, column: 9, scope: !150)
!159 = !DILocation(line: 31, column: 16, scope: !150)
!160 = !DILocation(line: 31, column: 21, scope: !150)
!161 = !DILocation(line: 31, column: 14, scope: !150)
!162 = !DILocation(line: 31, column: 2, scope: !150)
!163 = !DILocation(line: 31, column: 7, scope: !150)
!164 = !DILocation(line: 32, column: 9, scope: !150)
!165 = !DILocation(line: 32, column: 16, scope: !150)
!166 = !DILocation(line: 32, column: 21, scope: !150)
!167 = !DILocation(line: 32, column: 14, scope: !150)
!168 = !DILocation(line: 32, column: 2, scope: !150)
!169 = !DILocation(line: 32, column: 7, scope: !150)
!170 = !DILocation(line: 33, column: 9, scope: !150)
!171 = !DILocation(line: 33, column: 16, scope: !150)
!172 = !DILocation(line: 33, column: 21, scope: !150)
!173 = !DILocation(line: 33, column: 14, scope: !150)
!174 = !DILocation(line: 33, column: 2, scope: !150)
!175 = !DILocation(line: 33, column: 7, scope: !150)
!176 = !DILocation(line: 34, column: 2, scope: !150)
!177 = distinct !DISubprogram(name: "in_range", scope: !3, file: !3, line: 60, type: !178, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DISubroutineType(types: !179)
!179 = !{!6, !11, !11, !11}
!180 = !DILocalVariable(name: "x", arg: 1, scope: !177, file: !3, line: 60, type: !11)
!181 = !DILocation(line: 0, scope: !177)
!182 = !DILocalVariable(name: "x0", arg: 2, scope: !177, file: !3, line: 60, type: !11)
!183 = !DILocalVariable(name: "x1", arg: 3, scope: !177, file: !3, line: 60, type: !11)
!184 = !DILocation(line: 61, column: 12, scope: !177)
!185 = !DILocation(line: 61, column: 23, scope: !177)
!186 = !DILocation(line: 61, column: 18, scope: !177)
!187 = !DILocation(line: 61, column: 29, scope: !177)
!188 = !DILocation(line: 61, column: 2, scope: !177)
!189 = distinct !DISubprogram(name: "face_hit", scope: !3, file: !3, line: 64, type: !190, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DISubroutineType(types: !191)
!191 = !{!6, !192, !36, !36, !36, !36}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!193 = !DILocalVariable(name: "face", arg: 1, scope: !189, file: !3, line: 64, type: !192)
!194 = !DILocation(line: 0, scope: !189)
!195 = !DILocalVariable(name: "src", arg: 2, scope: !189, file: !3, line: 64, type: !36)
!196 = !DILocalVariable(name: "dir", arg: 3, scope: !189, file: !3, line: 64, type: !36)
!197 = !DILocalVariable(name: "hit", arg: 4, scope: !189, file: !3, line: 64, type: !36)
!198 = !DILocalVariable(name: "d", arg: 5, scope: !189, file: !3, line: 64, type: !36)
!199 = !DILocalVariable(name: "i", scope: !189, file: !3, line: 66, type: !6)
!200 = !DILocation(line: 68, column: 7, scope: !201)
!201 = distinct !DILexicalBlock(scope: !189, file: !3, line: 68, column: 2)
!202 = !DILocation(line: 0, scope: !201)
!203 = !DILocalVariable(name: "dist", scope: !189, file: !3, line: 67, type: !11)
!204 = !DILocation(line: 68, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !3, line: 68, column: 2)
!206 = !DILocation(line: 68, column: 2, scope: !201)
!207 = !DILocation(line: 69, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !3, line: 69, column: 7)
!209 = !DILocation(line: 69, column: 7, scope: !208)
!210 = !DILocation(line: 69, column: 7, scope: !205)
!211 = !DILocation(line: 70, column: 18, scope: !208)
!212 = !DILocation(line: 70, column: 12, scope: !208)
!213 = !DILocation(line: 70, column: 28, scope: !208)
!214 = !DILocation(line: 70, column: 26, scope: !208)
!215 = !DILocation(line: 70, column: 38, scope: !208)
!216 = !DILocation(line: 70, column: 36, scope: !208)
!217 = !DILocation(line: 70, column: 4, scope: !208)
!218 = !DILocation(line: 69, column: 19, scope: !208)
!219 = !DILocation(line: 68, column: 22, scope: !205)
!220 = !DILocation(line: 68, column: 2, scope: !205)
!221 = distinct !{!221, !206, !222}
!222 = !DILocation(line: 70, column: 43, scope: !201)
!223 = !DILocation(line: 72, column: 2, scope: !189)
!224 = !DILocation(line: 73, column: 27, scope: !189)
!225 = !DILocation(line: 73, column: 21, scope: !189)
!226 = !DILocation(line: 73, column: 12, scope: !189)
!227 = !DILocation(line: 73, column: 33, scope: !189)
!228 = !DILocation(line: 73, column: 7, scope: !189)
!229 = !DILocation(line: 73, column: 5, scope: !189)
!230 = !DILocation(line: 75, column: 12, scope: !231)
!231 = distinct !DILexicalBlock(scope: !189, file: !3, line: 75, column: 6)
!232 = !DILocation(line: 75, column: 6, scope: !231)
!233 = !DILocation(line: 75, column: 6, scope: !189)
!234 = !DILocation(line: 76, column: 20, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !3, line: 75, column: 21)
!236 = !DILocation(line: 76, column: 34, scope: !235)
!237 = !DILocation(line: 76, column: 28, scope: !235)
!238 = !DILocation(line: 76, column: 49, scope: !235)
!239 = !DILocation(line: 76, column: 43, scope: !235)
!240 = !DILocation(line: 76, column: 11, scope: !235)
!241 = !DILocation(line: 76, column: 58, scope: !235)
!242 = !DILocation(line: 77, column: 13, scope: !235)
!243 = !DILocation(line: 77, column: 27, scope: !235)
!244 = !DILocation(line: 77, column: 21, scope: !235)
!245 = !DILocation(line: 77, column: 42, scope: !235)
!246 = !DILocation(line: 77, column: 36, scope: !235)
!247 = !DILocation(line: 77, column: 4, scope: !235)
!248 = !DILocation(line: 0, scope: !235)
!249 = !DILocation(line: 76, column: 3, scope: !235)
!250 = !DILocation(line: 79, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !231, file: !3, line: 79, column: 11)
!252 = !DILocation(line: 79, column: 11, scope: !251)
!253 = !DILocation(line: 79, column: 11, scope: !231)
!254 = !DILocation(line: 80, column: 20, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !3, line: 79, column: 26)
!256 = !DILocation(line: 80, column: 34, scope: !255)
!257 = !DILocation(line: 80, column: 28, scope: !255)
!258 = !DILocation(line: 80, column: 49, scope: !255)
!259 = !DILocation(line: 80, column: 43, scope: !255)
!260 = !DILocation(line: 80, column: 11, scope: !255)
!261 = !DILocation(line: 80, column: 58, scope: !255)
!262 = !DILocation(line: 81, column: 13, scope: !255)
!263 = !DILocation(line: 81, column: 27, scope: !255)
!264 = !DILocation(line: 81, column: 21, scope: !255)
!265 = !DILocation(line: 81, column: 42, scope: !255)
!266 = !DILocation(line: 81, column: 36, scope: !255)
!267 = !DILocation(line: 81, column: 4, scope: !255)
!268 = !DILocation(line: 0, scope: !255)
!269 = !DILocation(line: 80, column: 3, scope: !255)
!270 = !DILocation(line: 83, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !251, file: !3, line: 83, column: 11)
!272 = !DILocation(line: 83, column: 11, scope: !271)
!273 = !DILocation(line: 83, column: 11, scope: !251)
!274 = !DILocation(line: 84, column: 20, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !3, line: 83, column: 26)
!276 = !DILocation(line: 84, column: 34, scope: !275)
!277 = !DILocation(line: 84, column: 28, scope: !275)
!278 = !DILocation(line: 84, column: 49, scope: !275)
!279 = !DILocation(line: 84, column: 43, scope: !275)
!280 = !DILocation(line: 84, column: 11, scope: !275)
!281 = !DILocation(line: 84, column: 58, scope: !275)
!282 = !DILocation(line: 85, column: 13, scope: !275)
!283 = !DILocation(line: 85, column: 27, scope: !275)
!284 = !DILocation(line: 85, column: 21, scope: !275)
!285 = !DILocation(line: 85, column: 42, scope: !275)
!286 = !DILocation(line: 85, column: 36, scope: !275)
!287 = !DILocation(line: 85, column: 4, scope: !275)
!288 = !DILocation(line: 0, scope: !275)
!289 = !DILocation(line: 84, column: 3, scope: !275)
!290 = !DILocation(line: 87, column: 2, scope: !189)
!291 = !DILocation(line: 88, column: 1, scope: !189)
!292 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 90, type: !293, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DISubroutineType(types: !5)
!294 = !DILocalVariable(name: "eye", scope: !292, file: !3, line: 93, type: !10)
!295 = !DILocation(line: 93, column: 9, scope: !292)
!296 = !DILocalVariable(name: "dir", scope: !292, file: !3, line: 94, type: !10)
!297 = !DILocation(line: 94, column: 9, scope: !292)
!298 = !DILocalVariable(name: "orig", scope: !292, file: !3, line: 94, type: !10)
!299 = !DILocation(line: 94, column: 34, scope: !292)
!300 = !DILocalVariable(name: "hit", scope: !292, file: !3, line: 95, type: !10)
!301 = !DILocation(line: 95, column: 9, scope: !292)
!302 = !DILocalVariable(name: "dx", scope: !292, file: !3, line: 95, type: !10)
!303 = !DILocation(line: 95, column: 17, scope: !292)
!304 = !DILocalVariable(name: "dy", scope: !292, file: !3, line: 95, type: !10)
!305 = !DILocation(line: 95, column: 24, scope: !292)
!306 = !DILocalVariable(name: "proj", scope: !292, file: !3, line: 95, type: !10)
!307 = !DILocation(line: 95, column: 43, scope: !292)
!308 = !DILocalVariable(name: "d", scope: !292, file: !3, line: 96, type: !11)
!309 = !DILocation(line: 96, column: 9, scope: !292)
!310 = !DILocalVariable(name: "light", scope: !292, file: !3, line: 97, type: !10)
!311 = !DILocation(line: 97, column: 9, scope: !292)
!312 = !DILocalVariable(name: "ldist", scope: !292, file: !3, line: 97, type: !10)
!313 = !DILocation(line: 97, column: 33, scope: !292)
!314 = !DILocalVariable(name: "strength", scope: !292, file: !3, line: 97, type: !11)
!315 = !DILocation(line: 0, scope: !292)
!316 = !DILocation(line: 99, column: 19, scope: !292)
!317 = !DILocation(line: 99, column: 24, scope: !292)
!318 = !DILocation(line: 99, column: 28, scope: !292)
!319 = !DILocation(line: 99, column: 13, scope: !292)
!320 = !DILocation(line: 99, column: 3, scope: !292)
!321 = !DILocation(line: 100, column: 18, scope: !292)
!322 = !DILocation(line: 100, column: 23, scope: !292)
!323 = !DILocation(line: 100, column: 27, scope: !292)
!324 = !DILocation(line: 100, column: 12, scope: !292)
!325 = !DILocation(line: 100, column: 2, scope: !292)
!326 = !DILocalVariable(name: "i", scope: !292, file: !3, line: 92, type: !6)
!327 = !DILocation(line: 102, column: 7, scope: !328)
!328 = distinct !DILexicalBlock(scope: !292, file: !3, line: 102, column: 2)
!329 = !DILocation(line: 0, scope: !328)
!330 = !DILocation(line: 102, column: 18, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !3, line: 102, column: 2)
!332 = !DILocation(line: 102, column: 2, scope: !328)
!333 = !DILocalVariable(name: "j", scope: !292, file: !3, line: 92, type: !6)
!334 = !DILocation(line: 103, column: 8, scope: !335)
!335 = distinct !DILexicalBlock(scope: !336, file: !3, line: 103, column: 3)
!336 = distinct !DILexicalBlock(scope: !331, file: !3, line: 102, column: 30)
!337 = !DILocation(line: 0, scope: !335)
!338 = !DILocation(line: 103, column: 19, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !3, line: 103, column: 3)
!340 = !DILocation(line: 103, column: 3, scope: !335)
!341 = !DILocation(line: 104, column: 9, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !3, line: 103, column: 30)
!343 = !DILocation(line: 104, column: 15, scope: !342)
!344 = !DILocation(line: 104, column: 21, scope: !342)
!345 = !DILocation(line: 104, column: 4, scope: !342)
!346 = !DILocation(line: 105, column: 14, scope: !342)
!347 = !DILocation(line: 105, column: 20, scope: !342)
!348 = !DILocation(line: 105, column: 24, scope: !342)
!349 = !DILocation(line: 105, column: 26, scope: !342)
!350 = !DILocation(line: 105, column: 32, scope: !342)
!351 = !DILocation(line: 105, column: 9, scope: !342)
!352 = !DILocation(line: 105, column: 39, scope: !342)
!353 = !DILocation(line: 105, column: 43, scope: !342)
!354 = !DILocation(line: 105, column: 44, scope: !342)
!355 = !DILocation(line: 105, column: 49, scope: !342)
!356 = !DILocation(line: 105, column: 4, scope: !342)
!357 = !DILocation(line: 106, column: 9, scope: !342)
!358 = !DILocation(line: 106, column: 15, scope: !342)
!359 = !DILocation(line: 106, column: 20, scope: !342)
!360 = !DILocation(line: 106, column: 4, scope: !342)
!361 = !DILocalVariable(name: "dbest", scope: !292, file: !3, line: 96, type: !11)
!362 = !DILocalVariable(name: "norm", scope: !292, file: !3, line: 96, type: !36)
!363 = !DILocalVariable(name: "k", scope: !292, file: !3, line: 92, type: !6)
!364 = !DILocation(line: 109, column: 10, scope: !365)
!365 = distinct !DILexicalBlock(scope: !342, file: !3, line: 109, column: 5)
!366 = !DILocation(line: 0, scope: !342)
!367 = !DILocation(line: 0, scope: !365)
!368 = !DILocation(line: 109, column: 19, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !3, line: 109, column: 5)
!370 = !DILocation(line: 109, column: 5, scope: !365)
!371 = !DILocation(line: 110, column: 21, scope: !372)
!372 = distinct !DILexicalBlock(scope: !373, file: !3, line: 110, column: 9)
!373 = distinct !DILexicalBlock(scope: !369, file: !3, line: 109, column: 29)
!374 = !DILocation(line: 110, column: 26, scope: !372)
!375 = !DILocation(line: 110, column: 31, scope: !372)
!376 = !DILocation(line: 110, column: 36, scope: !372)
!377 = !DILocation(line: 110, column: 10, scope: !372)
!378 = !DILocation(line: 110, column: 9, scope: !373)
!379 = !DILocation(line: 110, column: 46, scope: !372)
!380 = !DILocation(line: 111, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !373, file: !3, line: 111, column: 9)
!382 = !DILocation(line: 111, column: 15, scope: !381)
!383 = !DILocation(line: 111, column: 9, scope: !373)
!384 = !DILocation(line: 112, column: 14, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !3, line: 111, column: 20)
!386 = !DILocation(line: 113, column: 13, scope: !385)
!387 = !DILocation(line: 113, column: 18, scope: !385)
!388 = !DILocation(line: 114, column: 5, scope: !385)
!389 = !DILocation(line: 115, column: 4, scope: !373)
!390 = !DILocation(line: 109, column: 25, scope: !369)
!391 = !DILocation(line: 109, column: 5, scope: !369)
!392 = distinct !{!392, !370, !393}
!393 = !DILocation(line: 115, column: 4, scope: !365)
!394 = !DILocation(line: 117, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !342, file: !3, line: 117, column: 8)
!396 = !DILocation(line: 117, column: 8, scope: !342)
!397 = !DILocation(line: 118, column: 5, scope: !398)
!398 = distinct !DILexicalBlock(scope: !395, file: !3, line: 117, column: 15)
!399 = !DILocation(line: 119, column: 5, scope: !398)
!400 = !DILocation(line: 122, column: 9, scope: !342)
!401 = !DILocation(line: 122, column: 16, scope: !342)
!402 = !DILocation(line: 122, column: 21, scope: !342)
!403 = !DILocation(line: 122, column: 4, scope: !342)
!404 = !DILocation(line: 123, column: 22, scope: !342)
!405 = !DILocation(line: 123, column: 12, scope: !342)
!406 = !DILocalVariable(name: "decay", scope: !292, file: !3, line: 97, type: !11)
!407 = !DILocation(line: 124, column: 18, scope: !342)
!408 = !DILocation(line: 124, column: 8, scope: !342)
!409 = !DILocation(line: 124, column: 25, scope: !342)
!410 = !DILocation(line: 124, column: 33, scope: !342)
!411 = !DILocalVariable(name: "b", scope: !292, file: !3, line: 96, type: !11)
!412 = !DILocation(line: 125, column: 10, scope: !413)
!413 = distinct !DILexicalBlock(scope: !342, file: !3, line: 125, column: 8)
!414 = !DILocation(line: 125, column: 8, scope: !342)
!415 = !DILocation(line: 125, column: 15, scope: !413)
!416 = !DILocation(line: 126, column: 15, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !3, line: 126, column: 13)
!418 = !DILocation(line: 126, column: 13, scope: !413)
!419 = !DILocation(line: 126, column: 20, scope: !417)
!420 = !DILocation(line: 0, scope: !413)
!421 = !DILocation(line: 127, column: 6, scope: !342)
!422 = !DILocation(line: 128, column: 10, scope: !423)
!423 = distinct !DILexicalBlock(scope: !342, file: !3, line: 128, column: 8)
!424 = !DILocation(line: 128, column: 8, scope: !342)
!425 = !DILocation(line: 128, column: 15, scope: !423)
!426 = !DILocation(line: 129, column: 15, scope: !423)
!427 = !DILocation(line: 0, scope: !423)
!428 = !DILocation(line: 130, column: 12, scope: !342)
!429 = !DILocation(line: 130, column: 27, scope: !342)
!430 = !DILocation(line: 130, column: 19, scope: !342)
!431 = !DILocation(line: 130, column: 4, scope: !342)
!432 = !DILocation(line: 131, column: 3, scope: !342)
!433 = !DILocation(line: 103, column: 26, scope: !339)
!434 = !DILocation(line: 103, column: 3, scope: !339)
!435 = distinct !{!435, !340, !436}
!436 = !DILocation(line: 131, column: 3, scope: !335)
!437 = !DILocation(line: 132, column: 3, scope: !336)
!438 = !DILocation(line: 133, column: 2, scope: !336)
!439 = !DILocation(line: 102, column: 26, scope: !331)
!440 = !DILocation(line: 102, column: 2, scope: !331)
!441 = distinct !{!441, !332, !442}
!442 = !DILocation(line: 133, column: 2, scope: !328)
!443 = !DILocation(line: 135, column: 9, scope: !292)
