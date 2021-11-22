; ModuleID = 'lu-decomposition.c'
source_filename = "lu-decomposition.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%8.4g\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"      \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" [ \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c" ]\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@A3 = dso_local global [3 x [3 x double]] [[3 x double] [double 1.000000e+00, double 3.000000e+00, double 5.000000e+00], [3 x double] [double 2.000000e+00, double 4.000000e+00, double 7.000000e+00], [3 x double] [double 1.000000e+00, double 1.000000e+00, double 0.000000e+00]], align 16, !dbg !0
@A4 = dso_local global [4 x [4 x double]] [[4 x double] [double 1.100000e+01, double 9.000000e+00, double 2.400000e+01, double 2.000000e+00], [4 x double] [double 1.000000e+00, double 5.000000e+00, double 2.000000e+00, double 6.000000e+00], [4 x double] [double 3.000000e+00, double 1.700000e+01, double 1.800000e+01, double 1.000000e+00], [4 x double] [double 2.000000e+00, double 5.000000e+00, double 7.000000e+00, double 1.000000e+00]], align 16, !dbg !12
@.str.6 = private unnamed_addr constant [4 x i8] c"A =\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"L =\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"U =\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"P =\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @mat_zero(double** %x, i32 %n) #0 !dbg !24 {
entry:
  %x.addr = alloca double**, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %x, double*** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %x.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !38
  %1 = load i32, i32* %n.addr, align 4, !dbg !38
  %cmp = icmp slt i32 %0, %1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end8, !dbg !37

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !40, metadata !DIExpression()), !dbg !42
  store i32 0, i32* %j, align 4, !dbg !42
  br label %for.cond1, !dbg !42

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !43
  %3 = load i32, i32* %n.addr, align 4, !dbg !43
  %cmp2 = icmp slt i32 %2, %3, !dbg !43
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !42

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %x.addr, align 8, !dbg !45
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %5 to i64, !dbg !45
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !45
  %6 = load double*, double** %arrayidx, align 8, !dbg !45
  %7 = load i32, i32* %j, align 4, !dbg !47
  %idxprom4 = sext i32 %7 to i64, !dbg !45
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !45
  store double 0.000000e+00, double* %arrayidx5, align 8, !dbg !48
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !43
  %inc = add nsw i32 %8, 1, !dbg !43
  store i32 %inc, i32* %j, align 4, !dbg !43
  br label %for.cond1, !dbg !43, !llvm.loop !49

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !50

for.inc6:                                         ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !38
  %inc7 = add nsw i32 %9, 1, !dbg !38
  store i32 %inc7, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !38, !llvm.loop !51

for.end8:                                         ; preds = %for.cond
  ret void, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double** @mat_new(i32 %n) #0 !dbg !54 {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca double**, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata double*** %x, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* %n.addr, align 4, !dbg !61
  %conv = sext i32 %0 to i64, !dbg !61
  %mul = mul i64 8, %conv, !dbg !62
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !63
  %1 = bitcast i8* %call to double**, !dbg !63
  store double** %1, double*** %x, align 8, !dbg !60
  %2 = load i32, i32* %n.addr, align 4, !dbg !64
  %conv1 = sext i32 %2 to i64, !dbg !64
  %mul2 = mul i64 8, %conv1, !dbg !65
  %3 = load i32, i32* %n.addr, align 4, !dbg !66
  %conv3 = sext i32 %3 to i64, !dbg !66
  %mul4 = mul i64 %mul2, %conv3, !dbg !67
  %call5 = call noalias i8* @malloc(i64 %mul4) #4, !dbg !68
  %4 = bitcast i8* %call5 to double*, !dbg !68
  %5 = load double**, double*** %x, align 8, !dbg !69
  %arrayidx = getelementptr inbounds double*, double** %5, i64 0, !dbg !69
  store double* %4, double** %arrayidx, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !74
  %7 = load i32, i32* %n.addr, align 4, !dbg !74
  %cmp = icmp slt i32 %6, %7, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %8 = load double**, double*** %x, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds double*, double** %8, i64 0, !dbg !76
  %9 = load double*, double** %arrayidx7, align 8, !dbg !76
  %10 = load i32, i32* %n.addr, align 4, !dbg !77
  %11 = load i32, i32* %i, align 4, !dbg !78
  %mul8 = mul nsw i32 %10, %11, !dbg !79
  %idx.ext = sext i32 %mul8 to i64, !dbg !80
  %add.ptr = getelementptr inbounds double, double* %9, i64 %idx.ext, !dbg !80
  %12 = load double**, double*** %x, align 8, !dbg !81
  %13 = load i32, i32* %i, align 4, !dbg !82
  %idxprom = sext i32 %13 to i64, !dbg !81
  %arrayidx9 = getelementptr inbounds double*, double** %12, i64 %idxprom, !dbg !81
  store double* %add.ptr, double** %arrayidx9, align 8, !dbg !83
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %14, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !74, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %15 = load double**, double*** %x, align 8, !dbg !86
  %16 = load i32, i32* %n.addr, align 4, !dbg !86
  call void @mat_zero(double** %15, i32 %16), !dbg !86
  %17 = load double**, double*** %x, align 8, !dbg !87
  ret double** %17, !dbg !88
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double** @mat_copy(i8* %s, i32 %n) #0 !dbg !89 {
entry:
  %s.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x = alloca double**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata double*** %x, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32, i32* %n.addr, align 4, !dbg !99
  %call = call double** @mat_new(i32 %0), !dbg !100
  store double** %call, double*** %x, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !103
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32, i32* %i, align 4, !dbg !104
  %2 = load i32, i32* %n.addr, align 4, !dbg !104
  %cmp = icmp slt i32 %1, %2, !dbg !104
  br i1 %cmp, label %for.body, label %for.end12, !dbg !103

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !106, metadata !DIExpression()), !dbg !108
  store i32 0, i32* %j, align 4, !dbg !108
  br label %for.cond1, !dbg !108

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !109
  %4 = load i32, i32* %n.addr, align 4, !dbg !109
  %cmp2 = icmp slt i32 %3, %4, !dbg !109
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !108

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %n.addr, align 4, !dbg !111
  %6 = zext i32 %5 to i64, !dbg !112
  %7 = load i8*, i8** %s.addr, align 8, !dbg !113
  %8 = bitcast i8* %7 to double*, !dbg !114
  %9 = load i32, i32* %i, align 4, !dbg !115
  %idxprom = sext i32 %9 to i64, !dbg !112
  %10 = mul nsw i64 %idxprom, %6, !dbg !112
  %arrayidx = getelementptr inbounds double, double* %8, i64 %10, !dbg !112
  %11 = load i32, i32* %j, align 4, !dbg !116
  %idxprom4 = sext i32 %11 to i64, !dbg !112
  %arrayidx5 = getelementptr inbounds double, double* %arrayidx, i64 %idxprom4, !dbg !112
  %12 = load double, double* %arrayidx5, align 8, !dbg !112
  %13 = load double**, double*** %x, align 8, !dbg !117
  %14 = load i32, i32* %i, align 4, !dbg !118
  %idxprom6 = sext i32 %14 to i64, !dbg !117
  %arrayidx7 = getelementptr inbounds double*, double** %13, i64 %idxprom6, !dbg !117
  %15 = load double*, double** %arrayidx7, align 8, !dbg !117
  %16 = load i32, i32* %j, align 4, !dbg !119
  %idxprom8 = sext i32 %16 to i64, !dbg !117
  %arrayidx9 = getelementptr inbounds double, double* %15, i64 %idxprom8, !dbg !117
  store double %12, double* %arrayidx9, align 8, !dbg !120
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body3
  %17 = load i32, i32* %j, align 4, !dbg !109
  %inc = add nsw i32 %17, 1, !dbg !109
  store i32 %inc, i32* %j, align 4, !dbg !109
  br label %for.cond1, !dbg !109, !llvm.loop !121

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !122

for.inc10:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4, !dbg !104
  %inc11 = add nsw i32 %18, 1, !dbg !104
  store i32 %inc11, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !104, !llvm.loop !123

for.end12:                                        ; preds = %for.cond
  %19 = load double**, double*** %x, align 8, !dbg !125
  ret double** %19, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mat_del(double** %x) #0 !dbg !127 {
entry:
  %x.addr = alloca double**, align 8
  store double** %x, double*** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %x.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load double**, double*** %x.addr, align 8, !dbg !132
  %arrayidx = getelementptr inbounds double*, double** %0, i64 0, !dbg !132
  %1 = load double*, double** %arrayidx, align 8, !dbg !132
  %2 = bitcast double* %1 to i8*, !dbg !132
  call void @free(i8* %2) #4, !dbg !133
  %3 = load double**, double*** %x.addr, align 8, !dbg !134
  %4 = bitcast double** %3 to i8*, !dbg !134
  call void @free(i8* %4) #4, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @mat_show(double** %x, i8* %fmt, i32 %n) #0 !dbg !137 {
entry:
  %x.addr = alloca double**, align 8
  %fmt.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %x, double*** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %x.addr, metadata !142, metadata !DIExpression()), !dbg !143
  store i8* %fmt, i8** %fmt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fmt.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = load i8*, i8** %fmt.addr, align 8, !dbg !148
  %tobool = icmp ne i8* %0, null, !dbg !148
  br i1 %tobool, label %if.end, label %if.then, !dbg !150, !cf.info !151

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %fmt.addr, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i32 0, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc14, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !157
  %2 = load i32, i32* %n.addr, align 4, !dbg !157
  %cmp = icmp slt i32 %1, %2, !dbg !157
  br i1 %cmp, label %for.body, label %for.end16, !dbg !156

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !159
  %tobool1 = icmp ne i32 %3, 0, !dbg !159
  %4 = zext i1 %tobool1 to i64, !dbg !159
  %cond = select i1 %tobool1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), !dbg !159
  %call = call i32 (i8*, ...) @printf(i8* %cond), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %j, metadata !162, metadata !DIExpression()), !dbg !164
  store i32 0, i32* %j, align 4, !dbg !164
  br label %for.cond2, !dbg !164

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !dbg !165
  %6 = load i32, i32* %n.addr, align 4, !dbg !165
  %cmp3 = icmp slt i32 %5, %6, !dbg !165
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !164

for.body4:                                        ; preds = %for.cond2
  %7 = load i8*, i8** %fmt.addr, align 8, !dbg !167
  %8 = load double**, double*** %x.addr, align 8, !dbg !169
  %9 = load i32, i32* %i, align 4, !dbg !170
  %idxprom = sext i32 %9 to i64, !dbg !169
  %arrayidx = getelementptr inbounds double*, double** %8, i64 %idxprom, !dbg !169
  %10 = load double*, double** %arrayidx, align 8, !dbg !169
  %11 = load i32, i32* %j, align 4, !dbg !171
  %idxprom5 = sext i32 %11 to i64, !dbg !169
  %arrayidx6 = getelementptr inbounds double, double* %10, i64 %idxprom5, !dbg !169
  %12 = load double, double* %arrayidx6, align 8, !dbg !169
  %call7 = call i32 (i8*, ...) @printf(i8* %7, double %12), !dbg !172
  %13 = load i32, i32* %j, align 4, !dbg !173
  %14 = load i32, i32* %n.addr, align 4, !dbg !174
  %sub = sub nsw i32 %14, 1, !dbg !175
  %cmp8 = icmp slt i32 %13, %sub, !dbg !176
  br i1 %cmp8, label %cond.true, label %cond.false, !dbg !173

cond.true:                                        ; preds = %for.body4
  br label %cond.end, !dbg !173

cond.false:                                       ; preds = %for.body4
  %15 = load i32, i32* %i, align 4, !dbg !177
  %16 = load i32, i32* %n.addr, align 4, !dbg !178
  %sub9 = sub nsw i32 %16, 1, !dbg !179
  %cmp10 = icmp eq i32 %15, %sub9, !dbg !180
  %17 = zext i1 %cmp10 to i64, !dbg !177
  %cond11 = select i1 %cmp10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0), !dbg !177
  br label %cond.end, !dbg !173

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond12 = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond11, %cond.false ], !dbg !173
  %call13 = call i32 (i8*, ...) @printf(i8* %cond12), !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %cond.end
  %18 = load i32, i32* %j, align 4, !dbg !165
  %inc = add nsw i32 %18, 1, !dbg !165
  store i32 %inc, i32* %j, align 4, !dbg !165
  br label %for.cond2, !dbg !165, !llvm.loop !183

for.end:                                          ; preds = %for.cond2
  br label %for.inc14, !dbg !185

for.inc14:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !157
  %inc15 = add nsw i32 %19, 1, !dbg !157
  store i32 %inc15, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !157, !llvm.loop !186

for.end16:                                        ; preds = %for.cond
  ret void, !dbg !188
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local double** @mat_mul(double** %a, double** %b, i32 %n) #0 !dbg !189 {
entry:
  %a.addr = alloca double**, align 8
  %b.addr = alloca double**, align 8
  %n.addr = alloca i32, align 4
  %c = alloca double**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !192, metadata !DIExpression()), !dbg !193
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata double*** %c, metadata !198, metadata !DIExpression()), !dbg !199
  %0 = load i32, i32* %n.addr, align 4, !dbg !200
  %call = call double** @mat_new(i32 %0), !dbg !200
  store double** %call, double*** %c, align 8, !dbg !200
  store double** %call, double*** %c, align 8, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %i, metadata !201, metadata !DIExpression()), !dbg !203
  store i32 0, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc20, %entry
  %1 = load i32, i32* %i, align 4, !dbg !204
  %2 = load i32, i32* %n.addr, align 4, !dbg !204
  %cmp = icmp slt i32 %1, %2, !dbg !204
  br i1 %cmp, label %for.body, label %for.end22, !dbg !203

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !206, metadata !DIExpression()), !dbg !208
  store i32 0, i32* %j, align 4, !dbg !208
  br label %for.cond1, !dbg !208

for.cond1:                                        ; preds = %for.inc17, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !209
  %4 = load i32, i32* %n.addr, align 4, !dbg !209
  %cmp2 = icmp slt i32 %3, %4, !dbg !209
  br i1 %cmp2, label %for.body3, label %for.end19, !dbg !208

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %k, metadata !211, metadata !DIExpression()), !dbg !213
  store i32 0, i32* %k, align 4, !dbg !213
  br label %for.cond4, !dbg !213

for.cond4:                                        ; preds = %for.inc, %for.body3
  %5 = load i32, i32* %k, align 4, !dbg !214
  %6 = load i32, i32* %n.addr, align 4, !dbg !214
  %cmp5 = icmp slt i32 %5, %6, !dbg !214
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !213

for.body6:                                        ; preds = %for.cond4
  %7 = load double**, double*** %a.addr, align 8, !dbg !216
  %8 = load i32, i32* %i, align 4, !dbg !217
  %idxprom = sext i32 %8 to i64, !dbg !216
  %arrayidx = getelementptr inbounds double*, double** %7, i64 %idxprom, !dbg !216
  %9 = load double*, double** %arrayidx, align 8, !dbg !216
  %10 = load i32, i32* %k, align 4, !dbg !218
  %idxprom7 = sext i32 %10 to i64, !dbg !216
  %arrayidx8 = getelementptr inbounds double, double* %9, i64 %idxprom7, !dbg !216
  %11 = load double, double* %arrayidx8, align 8, !dbg !216
  %12 = load double**, double*** %b.addr, align 8, !dbg !219
  %13 = load i32, i32* %k, align 4, !dbg !220
  %idxprom9 = sext i32 %13 to i64, !dbg !219
  %arrayidx10 = getelementptr inbounds double*, double** %12, i64 %idxprom9, !dbg !219
  %14 = load double*, double** %arrayidx10, align 8, !dbg !219
  %15 = load i32, i32* %j, align 4, !dbg !221
  %idxprom11 = sext i32 %15 to i64, !dbg !219
  %arrayidx12 = getelementptr inbounds double, double* %14, i64 %idxprom11, !dbg !219
  %16 = load double, double* %arrayidx12, align 8, !dbg !219
  %mul = fmul double %11, %16, !dbg !222
  %17 = load double**, double*** %c, align 8, !dbg !223
  %18 = load i32, i32* %i, align 4, !dbg !224
  %idxprom13 = sext i32 %18 to i64, !dbg !223
  %arrayidx14 = getelementptr inbounds double*, double** %17, i64 %idxprom13, !dbg !223
  %19 = load double*, double** %arrayidx14, align 8, !dbg !223
  %20 = load i32, i32* %j, align 4, !dbg !225
  %idxprom15 = sext i32 %20 to i64, !dbg !223
  %arrayidx16 = getelementptr inbounds double, double* %19, i64 %idxprom15, !dbg !223
  %21 = load double, double* %arrayidx16, align 8, !dbg !226
  %add = fadd double %21, %mul, !dbg !226
  store double %add, double* %arrayidx16, align 8, !dbg !226
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body6
  %22 = load i32, i32* %k, align 4, !dbg !214
  %inc = add nsw i32 %22, 1, !dbg !214
  store i32 %inc, i32* %k, align 4, !dbg !214
  br label %for.cond4, !dbg !214, !llvm.loop !227

for.end:                                          ; preds = %for.cond4
  br label %for.inc17, !dbg !228

for.inc17:                                        ; preds = %for.end
  %23 = load i32, i32* %j, align 4, !dbg !209
  %inc18 = add nsw i32 %23, 1, !dbg !209
  store i32 %inc18, i32* %j, align 4, !dbg !209
  br label %for.cond1, !dbg !209, !llvm.loop !229

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20, !dbg !230

for.inc20:                                        ; preds = %for.end19
  %24 = load i32, i32* %i, align 4, !dbg !204
  %inc21 = add nsw i32 %24, 1, !dbg !204
  store i32 %inc21, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !204, !llvm.loop !231

for.end22:                                        ; preds = %for.cond
  %25 = load double**, double*** %c, align 8, !dbg !233
  ret double** %25, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mat_pivot(double** %a, double** %p, i32 %n) #0 !dbg !235 {
entry:
  %a.addr = alloca double**, align 8
  %p.addr = alloca double**, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i11 = alloca i32, align 4
  %max_j = alloca i32, align 4
  %j16 = alloca i32, align 4
  %k = alloca i32, align 4
  %tmp = alloca double, align 8
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !238, metadata !DIExpression()), !dbg !239
  store double** %p, double*** %p.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %p.addr, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %i, metadata !244, metadata !DIExpression()), !dbg !246
  store i32 0, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !247
  %1 = load i32, i32* %n.addr, align 4, !dbg !247
  %cmp = icmp slt i32 %0, %1, !dbg !247
  br i1 %cmp, label %for.body, label %for.end10, !dbg !246

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !249, metadata !DIExpression()), !dbg !251
  store i32 0, i32* %j, align 4, !dbg !251
  br label %for.cond1, !dbg !251

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !252
  %3 = load i32, i32* %n.addr, align 4, !dbg !252
  %cmp2 = icmp slt i32 %2, %3, !dbg !252
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !251

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !254
  %5 = load i32, i32* %j, align 4, !dbg !256
  %cmp4 = icmp eq i32 %4, %5, !dbg !257
  %conv = zext i1 %cmp4 to i32, !dbg !257
  %conv5 = sitofp i32 %conv to double, !dbg !258
  %6 = load double**, double*** %p.addr, align 8, !dbg !259
  %7 = load i32, i32* %i, align 4, !dbg !260
  %idxprom = sext i32 %7 to i64, !dbg !259
  %arrayidx = getelementptr inbounds double*, double** %6, i64 %idxprom, !dbg !259
  %8 = load double*, double** %arrayidx, align 8, !dbg !259
  %9 = load i32, i32* %j, align 4, !dbg !261
  %idxprom6 = sext i32 %9 to i64, !dbg !259
  %arrayidx7 = getelementptr inbounds double, double* %8, i64 %idxprom6, !dbg !259
  store double %conv5, double* %arrayidx7, align 8, !dbg !262
  br label %for.inc, !dbg !263

for.inc:                                          ; preds = %for.body3
  %10 = load i32, i32* %j, align 4, !dbg !252
  %inc = add nsw i32 %10, 1, !dbg !252
  store i32 %inc, i32* %j, align 4, !dbg !252
  br label %for.cond1, !dbg !252, !llvm.loop !264

for.end:                                          ; preds = %for.cond1
  br label %for.inc8, !dbg !265

for.inc8:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !247
  %inc9 = add nsw i32 %11, 1, !dbg !247
  store i32 %inc9, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !247, !llvm.loop !266

for.end10:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !268, metadata !DIExpression()), !dbg !270
  store i32 0, i32* %i11, align 4, !dbg !270
  br label %for.cond12, !dbg !270

for.cond12:                                       ; preds = %for.inc61, %for.end10
  %12 = load i32, i32* %i11, align 4, !dbg !271
  %13 = load i32, i32* %n.addr, align 4, !dbg !271
  %cmp13 = icmp slt i32 %12, %13, !dbg !271
  br i1 %cmp13, label %for.body15, label %for.end63, !dbg !270

for.body15:                                       ; preds = %for.cond12
  call void @llvm.dbg.declare(metadata i32* %max_j, metadata !273, metadata !DIExpression()), !dbg !275
  %14 = load i32, i32* %i11, align 4, !dbg !276
  store i32 %14, i32* %max_j, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata i32* %j16, metadata !277, metadata !DIExpression()), !dbg !279
  %15 = load i32, i32* %i11, align 4, !dbg !279
  store i32 %15, i32* %j16, align 4, !dbg !279
  br label %for.cond17, !dbg !279

for.cond17:                                       ; preds = %for.inc31, %for.body15
  %16 = load i32, i32* %j16, align 4, !dbg !280
  %17 = load i32, i32* %n.addr, align 4, !dbg !280
  %cmp18 = icmp slt i32 %16, %17, !dbg !280
  br i1 %cmp18, label %for.body20, label %for.end33, !dbg !279

for.body20:                                       ; preds = %for.cond17
  %18 = load double**, double*** %a.addr, align 8, !dbg !282
  %19 = load i32, i32* %j16, align 4, !dbg !284
  %idxprom21 = sext i32 %19 to i64, !dbg !282
  %arrayidx22 = getelementptr inbounds double*, double** %18, i64 %idxprom21, !dbg !282
  %20 = load double*, double** %arrayidx22, align 8, !dbg !282
  %21 = load i32, i32* %i11, align 4, !dbg !285
  %idxprom23 = sext i32 %21 to i64, !dbg !282
  %arrayidx24 = getelementptr inbounds double, double* %20, i64 %idxprom23, !dbg !282
  %22 = load double, double* %arrayidx24, align 8, !dbg !282
  %23 = call double @llvm.fabs.f64(double %22), !dbg !286
  %24 = load double**, double*** %a.addr, align 8, !dbg !287
  %25 = load i32, i32* %max_j, align 4, !dbg !288
  %idxprom25 = sext i32 %25 to i64, !dbg !287
  %arrayidx26 = getelementptr inbounds double*, double** %24, i64 %idxprom25, !dbg !287
  %26 = load double*, double** %arrayidx26, align 8, !dbg !287
  %27 = load i32, i32* %i11, align 4, !dbg !289
  %idxprom27 = sext i32 %27 to i64, !dbg !287
  %arrayidx28 = getelementptr inbounds double, double* %26, i64 %idxprom27, !dbg !287
  %28 = load double, double* %arrayidx28, align 8, !dbg !287
  %29 = call double @llvm.fabs.f64(double %28), !dbg !290
  %cmp29 = fcmp ogt double %23, %29, !dbg !291
  br i1 %cmp29, label %if.then, label %if.end, !dbg !292, !cf.info !151

if.then:                                          ; preds = %for.body20
  %30 = load i32, i32* %j16, align 4, !dbg !293
  store i32 %30, i32* %max_j, align 4, !dbg !294
  br label %if.end, !dbg !295

if.end:                                           ; preds = %if.then, %for.body20
  br label %for.inc31, !dbg !296

for.inc31:                                        ; preds = %if.end
  %31 = load i32, i32* %j16, align 4, !dbg !280
  %inc32 = add nsw i32 %31, 1, !dbg !280
  store i32 %inc32, i32* %j16, align 4, !dbg !280
  br label %for.cond17, !dbg !280, !llvm.loop !297

for.end33:                                        ; preds = %for.cond17
  %32 = load i32, i32* %max_j, align 4, !dbg !299
  %33 = load i32, i32* %i11, align 4, !dbg !301
  %cmp34 = icmp ne i32 %32, %33, !dbg !302
  br i1 %cmp34, label %if.then36, label %if.end60, !dbg !303, !cf.info !151

if.then36:                                        ; preds = %for.end33
  call void @llvm.dbg.declare(metadata i32* %k, metadata !304, metadata !DIExpression()), !dbg !306
  store i32 0, i32* %k, align 4, !dbg !306
  br label %for.cond37, !dbg !306

for.cond37:                                       ; preds = %for.inc57, %if.then36
  %34 = load i32, i32* %k, align 4, !dbg !307
  %35 = load i32, i32* %n.addr, align 4, !dbg !307
  %cmp38 = icmp slt i32 %34, %35, !dbg !307
  br i1 %cmp38, label %for.body40, label %for.end59, !dbg !306

for.body40:                                       ; preds = %for.cond37
  call void @llvm.dbg.declare(metadata double* %tmp, metadata !309, metadata !DIExpression()), !dbg !312
  %36 = load double**, double*** %p.addr, align 8, !dbg !312
  %37 = load i32, i32* %i11, align 4, !dbg !312
  %idxprom41 = sext i32 %37 to i64, !dbg !312
  %arrayidx42 = getelementptr inbounds double*, double** %36, i64 %idxprom41, !dbg !312
  %38 = load double*, double** %arrayidx42, align 8, !dbg !312
  %39 = load i32, i32* %k, align 4, !dbg !312
  %idxprom43 = sext i32 %39 to i64, !dbg !312
  %arrayidx44 = getelementptr inbounds double, double* %38, i64 %idxprom43, !dbg !312
  %40 = load double, double* %arrayidx44, align 8, !dbg !312
  store double %40, double* %tmp, align 8, !dbg !312
  %41 = load double**, double*** %p.addr, align 8, !dbg !312
  %42 = load i32, i32* %max_j, align 4, !dbg !312
  %idxprom45 = sext i32 %42 to i64, !dbg !312
  %arrayidx46 = getelementptr inbounds double*, double** %41, i64 %idxprom45, !dbg !312
  %43 = load double*, double** %arrayidx46, align 8, !dbg !312
  %44 = load i32, i32* %k, align 4, !dbg !312
  %idxprom47 = sext i32 %44 to i64, !dbg !312
  %arrayidx48 = getelementptr inbounds double, double* %43, i64 %idxprom47, !dbg !312
  %45 = load double, double* %arrayidx48, align 8, !dbg !312
  %46 = load double**, double*** %p.addr, align 8, !dbg !312
  %47 = load i32, i32* %i11, align 4, !dbg !312
  %idxprom49 = sext i32 %47 to i64, !dbg !312
  %arrayidx50 = getelementptr inbounds double*, double** %46, i64 %idxprom49, !dbg !312
  %48 = load double*, double** %arrayidx50, align 8, !dbg !312
  %49 = load i32, i32* %k, align 4, !dbg !312
  %idxprom51 = sext i32 %49 to i64, !dbg !312
  %arrayidx52 = getelementptr inbounds double, double* %48, i64 %idxprom51, !dbg !312
  store double %45, double* %arrayidx52, align 8, !dbg !312
  %50 = load double, double* %tmp, align 8, !dbg !312
  %51 = load double**, double*** %p.addr, align 8, !dbg !312
  %52 = load i32, i32* %max_j, align 4, !dbg !312
  %idxprom53 = sext i32 %52 to i64, !dbg !312
  %arrayidx54 = getelementptr inbounds double*, double** %51, i64 %idxprom53, !dbg !312
  %53 = load double*, double** %arrayidx54, align 8, !dbg !312
  %54 = load i32, i32* %k, align 4, !dbg !312
  %idxprom55 = sext i32 %54 to i64, !dbg !312
  %arrayidx56 = getelementptr inbounds double, double* %53, i64 %idxprom55, !dbg !312
  store double %50, double* %arrayidx56, align 8, !dbg !312
  br label %for.inc57, !dbg !313

for.inc57:                                        ; preds = %for.body40
  %55 = load i32, i32* %k, align 4, !dbg !307
  %inc58 = add nsw i32 %55, 1, !dbg !307
  store i32 %inc58, i32* %k, align 4, !dbg !307
  br label %for.cond37, !dbg !307, !llvm.loop !314

for.end59:                                        ; preds = %for.cond37
  br label %if.end60, !dbg !315

if.end60:                                         ; preds = %for.end59, %for.end33
  br label %for.inc61, !dbg !316

for.inc61:                                        ; preds = %if.end60
  %56 = load i32, i32* %i11, align 4, !dbg !271
  %inc62 = add nsw i32 %56, 1, !dbg !271
  store i32 %inc62, i32* %i11, align 4, !dbg !271
  br label %for.cond12, !dbg !271, !llvm.loop !317

for.end63:                                        ; preds = %for.cond12
  ret void, !dbg !319
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @mat_LU(double** %A, double** %L, double** %U, double** %P, i32 %n) #0 !dbg !320 {
entry:
  %A.addr = alloca double**, align 8
  %L.addr = alloca double**, align 8
  %U.addr = alloca double**, align 8
  %P.addr = alloca double**, align 8
  %n.addr = alloca i32, align 4
  %Aprime = alloca double**, align 8
  %i = alloca i32, align 4
  %i3 = alloca i32, align 4
  %j = alloca i32, align 4
  %s = alloca double, align 8
  %k = alloca i32, align 4
  %k35 = alloca i32, align 4
  store double** %A, double*** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %A.addr, metadata !323, metadata !DIExpression()), !dbg !324
  store double** %L, double*** %L.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %L.addr, metadata !325, metadata !DIExpression()), !dbg !326
  store double** %U, double*** %U.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %U.addr, metadata !327, metadata !DIExpression()), !dbg !328
  store double** %P, double*** %P.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %P.addr, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !331, metadata !DIExpression()), !dbg !332
  %0 = load double**, double*** %L.addr, align 8, !dbg !333
  %1 = load i32, i32* %n.addr, align 4, !dbg !333
  call void @mat_zero(double** %0, i32 %1), !dbg !333
  %2 = load double**, double*** %U.addr, align 8, !dbg !334
  %3 = load i32, i32* %n.addr, align 4, !dbg !334
  call void @mat_zero(double** %2, i32 %3), !dbg !334
  %4 = load double**, double*** %A.addr, align 8, !dbg !335
  %5 = load double**, double*** %P.addr, align 8, !dbg !335
  %6 = load i32, i32* %n.addr, align 4, !dbg !335
  call void @mat_pivot(double** %4, double** %5, i32 %6), !dbg !335
  call void @llvm.dbg.declare(metadata double*** %Aprime, metadata !336, metadata !DIExpression()), !dbg !337
  %7 = load double**, double*** %P.addr, align 8, !dbg !338
  %8 = load double**, double*** %A.addr, align 8, !dbg !338
  %9 = load i32, i32* %n.addr, align 4, !dbg !338
  %call = call double** @mat_mul(double** %7, double** %8, i32 %9), !dbg !338
  store double** %call, double*** %Aprime, align 8, !dbg !337
  call void @llvm.dbg.declare(metadata i32* %i, metadata !339, metadata !DIExpression()), !dbg !341
  store i32 0, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !341

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i32, i32* %i, align 4, !dbg !342
  %11 = load i32, i32* %n.addr, align 4, !dbg !342
  %cmp = icmp slt i32 %10, %11, !dbg !342
  br i1 %cmp, label %for.body, label %for.end, !dbg !341

for.body:                                         ; preds = %for.cond
  %12 = load double**, double*** %L.addr, align 8, !dbg !344
  %13 = load i32, i32* %i, align 4, !dbg !346
  %idxprom = sext i32 %13 to i64, !dbg !344
  %arrayidx = getelementptr inbounds double*, double** %12, i64 %idxprom, !dbg !344
  %14 = load double*, double** %arrayidx, align 8, !dbg !344
  %15 = load i32, i32* %i, align 4, !dbg !347
  %idxprom1 = sext i32 %15 to i64, !dbg !344
  %arrayidx2 = getelementptr inbounds double, double* %14, i64 %idxprom1, !dbg !344
  store double 1.000000e+00, double* %arrayidx2, align 8, !dbg !348
  br label %for.inc, !dbg !349

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !342
  %inc = add nsw i32 %16, 1, !dbg !342
  store i32 %inc, i32* %i, align 4, !dbg !342
  br label %for.cond, !dbg !342, !llvm.loop !350

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i3, metadata !352, metadata !DIExpression()), !dbg !354
  store i32 0, i32* %i3, align 4, !dbg !354
  br label %for.cond4, !dbg !354

for.cond4:                                        ; preds = %for.inc69, %for.end
  %17 = load i32, i32* %i3, align 4, !dbg !355
  %18 = load i32, i32* %n.addr, align 4, !dbg !355
  %cmp5 = icmp slt i32 %17, %18, !dbg !355
  br i1 %cmp5, label %for.body6, label %for.end71, !dbg !354

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !357, metadata !DIExpression()), !dbg !359
  store i32 0, i32* %j, align 4, !dbg !359
  br label %for.cond7, !dbg !359

for.cond7:                                        ; preds = %for.inc66, %for.body6
  %19 = load i32, i32* %j, align 4, !dbg !360
  %20 = load i32, i32* %n.addr, align 4, !dbg !360
  %cmp8 = icmp slt i32 %19, %20, !dbg !360
  br i1 %cmp8, label %for.body9, label %for.end68, !dbg !359

for.body9:                                        ; preds = %for.cond7
  call void @llvm.dbg.declare(metadata double* %s, metadata !362, metadata !DIExpression()), !dbg !364
  %21 = load i32, i32* %j, align 4, !dbg !365
  %22 = load i32, i32* %i3, align 4, !dbg !367
  %cmp10 = icmp sle i32 %21, %22, !dbg !368
  br i1 %cmp10, label %if.then, label %if.end, !dbg !369, !cf.info !151

if.then:                                          ; preds = %for.body9
  store double 0.000000e+00, double* %s, align 8, !dbg !370
  call void @llvm.dbg.declare(metadata i32* %k, metadata !373, metadata !DIExpression()), !dbg !375
  store i32 0, i32* %k, align 4, !dbg !375
  br label %for.cond11, !dbg !375

for.cond11:                                       ; preds = %for.inc22, %if.then
  %23 = load i32, i32* %k, align 4, !dbg !376
  %24 = load i32, i32* %j, align 4, !dbg !376
  %cmp12 = icmp slt i32 %23, %24, !dbg !376
  br i1 %cmp12, label %for.body13, label %for.end24, !dbg !375

for.body13:                                       ; preds = %for.cond11
  %25 = load double**, double*** %L.addr, align 8, !dbg !376
  %26 = load i32, i32* %j, align 4, !dbg !376
  %idxprom14 = sext i32 %26 to i64, !dbg !376
  %arrayidx15 = getelementptr inbounds double*, double** %25, i64 %idxprom14, !dbg !376
  %27 = load double*, double** %arrayidx15, align 8, !dbg !376
  %28 = load i32, i32* %k, align 4, !dbg !376
  %idxprom16 = sext i32 %28 to i64, !dbg !376
  %arrayidx17 = getelementptr inbounds double, double* %27, i64 %idxprom16, !dbg !376
  %29 = load double, double* %arrayidx17, align 8, !dbg !376
  %30 = load double**, double*** %U.addr, align 8, !dbg !376
  %31 = load i32, i32* %k, align 4, !dbg !376
  %idxprom18 = sext i32 %31 to i64, !dbg !376
  %arrayidx19 = getelementptr inbounds double*, double** %30, i64 %idxprom18, !dbg !376
  %32 = load double*, double** %arrayidx19, align 8, !dbg !376
  %33 = load i32, i32* %i3, align 4, !dbg !376
  %idxprom20 = sext i32 %33 to i64, !dbg !376
  %arrayidx21 = getelementptr inbounds double, double* %32, i64 %idxprom20, !dbg !376
  %34 = load double, double* %arrayidx21, align 8, !dbg !376
  %mul = fmul double %29, %34, !dbg !376
  %35 = load double, double* %s, align 8, !dbg !376
  %add = fadd double %35, %mul, !dbg !376
  store double %add, double* %s, align 8, !dbg !376
  br label %for.inc22, !dbg !376

for.inc22:                                        ; preds = %for.body13
  %36 = load i32, i32* %k, align 4, !dbg !376
  %inc23 = add nsw i32 %36, 1, !dbg !376
  store i32 %inc23, i32* %k, align 4, !dbg !376
  br label %for.cond11, !dbg !376, !llvm.loop !378

for.end24:                                        ; preds = %for.cond11
  %37 = load double**, double*** %Aprime, align 8, !dbg !379
  %38 = load i32, i32* %j, align 4, !dbg !380
  %idxprom25 = sext i32 %38 to i64, !dbg !379
  %arrayidx26 = getelementptr inbounds double*, double** %37, i64 %idxprom25, !dbg !379
  %39 = load double*, double** %arrayidx26, align 8, !dbg !379
  %40 = load i32, i32* %i3, align 4, !dbg !381
  %idxprom27 = sext i32 %40 to i64, !dbg !379
  %arrayidx28 = getelementptr inbounds double, double* %39, i64 %idxprom27, !dbg !379
  %41 = load double, double* %arrayidx28, align 8, !dbg !379
  %42 = load double, double* %s, align 8, !dbg !382
  %sub = fsub double %41, %42, !dbg !383
  %43 = load double**, double*** %U.addr, align 8, !dbg !384
  %44 = load i32, i32* %j, align 4, !dbg !385
  %idxprom29 = sext i32 %44 to i64, !dbg !384
  %arrayidx30 = getelementptr inbounds double*, double** %43, i64 %idxprom29, !dbg !384
  %45 = load double*, double** %arrayidx30, align 8, !dbg !384
  %46 = load i32, i32* %i3, align 4, !dbg !386
  %idxprom31 = sext i32 %46 to i64, !dbg !384
  %arrayidx32 = getelementptr inbounds double, double* %45, i64 %idxprom31, !dbg !384
  store double %sub, double* %arrayidx32, align 8, !dbg !387
  br label %if.end, !dbg !388

if.end:                                           ; preds = %for.end24, %for.body9
  %47 = load i32, i32* %j, align 4, !dbg !389
  %48 = load i32, i32* %i3, align 4, !dbg !391
  %cmp33 = icmp sge i32 %47, %48, !dbg !392
  br i1 %cmp33, label %if.then34, label %if.end65, !dbg !393, !cf.info !151

if.then34:                                        ; preds = %if.end
  store double 0.000000e+00, double* %s, align 8, !dbg !394
  call void @llvm.dbg.declare(metadata i32* %k35, metadata !397, metadata !DIExpression()), !dbg !399
  store i32 0, i32* %k35, align 4, !dbg !399
  br label %for.cond36, !dbg !399

for.cond36:                                       ; preds = %for.inc49, %if.then34
  %49 = load i32, i32* %k35, align 4, !dbg !400
  %50 = load i32, i32* %i3, align 4, !dbg !400
  %cmp37 = icmp slt i32 %49, %50, !dbg !400
  br i1 %cmp37, label %for.body38, label %for.end51, !dbg !399

for.body38:                                       ; preds = %for.cond36
  %51 = load double**, double*** %L.addr, align 8, !dbg !400
  %52 = load i32, i32* %j, align 4, !dbg !400
  %idxprom39 = sext i32 %52 to i64, !dbg !400
  %arrayidx40 = getelementptr inbounds double*, double** %51, i64 %idxprom39, !dbg !400
  %53 = load double*, double** %arrayidx40, align 8, !dbg !400
  %54 = load i32, i32* %k35, align 4, !dbg !400
  %idxprom41 = sext i32 %54 to i64, !dbg !400
  %arrayidx42 = getelementptr inbounds double, double* %53, i64 %idxprom41, !dbg !400
  %55 = load double, double* %arrayidx42, align 8, !dbg !400
  %56 = load double**, double*** %U.addr, align 8, !dbg !400
  %57 = load i32, i32* %k35, align 4, !dbg !400
  %idxprom43 = sext i32 %57 to i64, !dbg !400
  %arrayidx44 = getelementptr inbounds double*, double** %56, i64 %idxprom43, !dbg !400
  %58 = load double*, double** %arrayidx44, align 8, !dbg !400
  %59 = load i32, i32* %i3, align 4, !dbg !400
  %idxprom45 = sext i32 %59 to i64, !dbg !400
  %arrayidx46 = getelementptr inbounds double, double* %58, i64 %idxprom45, !dbg !400
  %60 = load double, double* %arrayidx46, align 8, !dbg !400
  %mul47 = fmul double %55, %60, !dbg !400
  %61 = load double, double* %s, align 8, !dbg !400
  %add48 = fadd double %61, %mul47, !dbg !400
  store double %add48, double* %s, align 8, !dbg !400
  br label %for.inc49, !dbg !400

for.inc49:                                        ; preds = %for.body38
  %62 = load i32, i32* %k35, align 4, !dbg !400
  %inc50 = add nsw i32 %62, 1, !dbg !400
  store i32 %inc50, i32* %k35, align 4, !dbg !400
  br label %for.cond36, !dbg !400, !llvm.loop !402

for.end51:                                        ; preds = %for.cond36
  %63 = load double**, double*** %Aprime, align 8, !dbg !403
  %64 = load i32, i32* %j, align 4, !dbg !404
  %idxprom52 = sext i32 %64 to i64, !dbg !403
  %arrayidx53 = getelementptr inbounds double*, double** %63, i64 %idxprom52, !dbg !403
  %65 = load double*, double** %arrayidx53, align 8, !dbg !403
  %66 = load i32, i32* %i3, align 4, !dbg !405
  %idxprom54 = sext i32 %66 to i64, !dbg !403
  %arrayidx55 = getelementptr inbounds double, double* %65, i64 %idxprom54, !dbg !403
  %67 = load double, double* %arrayidx55, align 8, !dbg !403
  %68 = load double, double* %s, align 8, !dbg !406
  %sub56 = fsub double %67, %68, !dbg !407
  %69 = load double**, double*** %U.addr, align 8, !dbg !408
  %70 = load i32, i32* %i3, align 4, !dbg !409
  %idxprom57 = sext i32 %70 to i64, !dbg !408
  %arrayidx58 = getelementptr inbounds double*, double** %69, i64 %idxprom57, !dbg !408
  %71 = load double*, double** %arrayidx58, align 8, !dbg !408
  %72 = load i32, i32* %i3, align 4, !dbg !410
  %idxprom59 = sext i32 %72 to i64, !dbg !408
  %arrayidx60 = getelementptr inbounds double, double* %71, i64 %idxprom59, !dbg !408
  %73 = load double, double* %arrayidx60, align 8, !dbg !408
  %div = fdiv double %sub56, %73, !dbg !411
  %74 = load double**, double*** %L.addr, align 8, !dbg !412
  %75 = load i32, i32* %j, align 4, !dbg !413
  %idxprom61 = sext i32 %75 to i64, !dbg !412
  %arrayidx62 = getelementptr inbounds double*, double** %74, i64 %idxprom61, !dbg !412
  %76 = load double*, double** %arrayidx62, align 8, !dbg !412
  %77 = load i32, i32* %i3, align 4, !dbg !414
  %idxprom63 = sext i32 %77 to i64, !dbg !412
  %arrayidx64 = getelementptr inbounds double, double* %76, i64 %idxprom63, !dbg !412
  store double %div, double* %arrayidx64, align 8, !dbg !415
  br label %if.end65, !dbg !416

if.end65:                                         ; preds = %for.end51, %if.end
  br label %for.inc66, !dbg !417

for.inc66:                                        ; preds = %if.end65
  %78 = load i32, i32* %j, align 4, !dbg !360
  %inc67 = add nsw i32 %78, 1, !dbg !360
  store i32 %inc67, i32* %j, align 4, !dbg !360
  br label %for.cond7, !dbg !360, !llvm.loop !418

for.end68:                                        ; preds = %for.cond7
  br label %for.inc69, !dbg !419

for.inc69:                                        ; preds = %for.end68
  %79 = load i32, i32* %i3, align 4, !dbg !355
  %inc70 = add nsw i32 %79, 1, !dbg !355
  store i32 %inc70, i32* %i3, align 4, !dbg !355
  br label %for.cond4, !dbg !355, !llvm.loop !420

for.end71:                                        ; preds = %for.cond4
  %80 = load double**, double*** %Aprime, align 8, !dbg !422
  call void @mat_del(double** %80), !dbg !422
  ret void, !dbg !423
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !424 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %A = alloca double**, align 8
  %L = alloca double**, align 8
  %P = alloca double**, align 8
  %U = alloca double**, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !427, metadata !DIExpression()), !dbg !428
  store i32 3, i32* %n, align 4, !dbg !428
  call void @llvm.dbg.declare(metadata double*** %A, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata double*** %L, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata double*** %P, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata double*** %U, metadata !435, metadata !DIExpression()), !dbg !436
  %0 = load i32, i32* %n, align 4, !dbg !437
  %call = call double** @mat_new(i32 %0), !dbg !437
  store double** %call, double*** %L, align 8, !dbg !437
  %1 = load i32, i32* %n, align 4, !dbg !438
  %call1 = call double** @mat_new(i32 %1), !dbg !438
  store double** %call1, double*** %P, align 8, !dbg !438
  %2 = load i32, i32* %n, align 4, !dbg !439
  %call2 = call double** @mat_new(i32 %2), !dbg !439
  store double** %call2, double*** %U, align 8, !dbg !439
  %3 = load i32, i32* %n, align 4, !dbg !440
  %call3 = call double** @mat_copy(i8* bitcast ([3 x [3 x double]]* @A3 to i8*), i32 %3), !dbg !440
  store double** %call3, double*** %A, align 8, !dbg !441
  %4 = load double**, double*** %A, align 8, !dbg !442
  %5 = load double**, double*** %L, align 8, !dbg !442
  %6 = load double**, double*** %U, align 8, !dbg !442
  %7 = load double**, double*** %P, align 8, !dbg !442
  %8 = load i32, i32* %n, align 4, !dbg !442
  call void @mat_LU(double** %4, double** %5, double** %6, double** %7, i32 %8), !dbg !442
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !443
  %9 = load double**, double*** %A, align 8, !dbg !443
  %10 = load i32, i32* %n, align 4, !dbg !443
  call void @mat_show(double** %9, i8* null, i32 %10), !dbg !443
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0)), !dbg !444
  %11 = load double**, double*** %L, align 8, !dbg !444
  %12 = load i32, i32* %n, align 4, !dbg !444
  call void @mat_show(double** %11, i8* null, i32 %12), !dbg !444
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0)), !dbg !445
  %13 = load double**, double*** %U, align 8, !dbg !445
  %14 = load i32, i32* %n, align 4, !dbg !445
  call void @mat_show(double** %13, i8* null, i32 %14), !dbg !445
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0)), !dbg !446
  %15 = load double**, double*** %P, align 8, !dbg !446
  %16 = load i32, i32* %n, align 4, !dbg !446
  call void @mat_show(double** %15, i8* null, i32 %16), !dbg !446
  %17 = load double**, double*** %A, align 8, !dbg !447
  call void @mat_del(double** %17), !dbg !447
  %18 = load double**, double*** %L, align 8, !dbg !448
  call void @mat_del(double** %18), !dbg !448
  %19 = load double**, double*** %U, align 8, !dbg !449
  call void @mat_del(double** %19), !dbg !449
  %20 = load double**, double*** %P, align 8, !dbg !450
  call void @mat_del(double** %20), !dbg !450
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !451
  store i32 4, i32* %n, align 4, !dbg !452
  %21 = load i32, i32* %n, align 4, !dbg !453
  %call9 = call double** @mat_new(i32 %21), !dbg !453
  store double** %call9, double*** %L, align 8, !dbg !453
  %22 = load i32, i32* %n, align 4, !dbg !454
  %call10 = call double** @mat_new(i32 %22), !dbg !454
  store double** %call10, double*** %P, align 8, !dbg !454
  %23 = load i32, i32* %n, align 4, !dbg !455
  %call11 = call double** @mat_new(i32 %23), !dbg !455
  store double** %call11, double*** %U, align 8, !dbg !455
  %24 = load i32, i32* %n, align 4, !dbg !456
  %call12 = call double** @mat_copy(i8* bitcast ([4 x [4 x double]]* @A4 to i8*), i32 %24), !dbg !456
  store double** %call12, double*** %A, align 8, !dbg !457
  %25 = load double**, double*** %A, align 8, !dbg !458
  %26 = load double**, double*** %L, align 8, !dbg !458
  %27 = load double**, double*** %U, align 8, !dbg !458
  %28 = load double**, double*** %P, align 8, !dbg !458
  %29 = load i32, i32* %n, align 4, !dbg !458
  call void @mat_LU(double** %25, double** %26, double** %27, double** %28, i32 %29), !dbg !458
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0)), !dbg !459
  %30 = load double**, double*** %A, align 8, !dbg !459
  %31 = load i32, i32* %n, align 4, !dbg !459
  call void @mat_show(double** %30, i8* null, i32 %31), !dbg !459
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0)), !dbg !460
  %32 = load double**, double*** %L, align 8, !dbg !460
  %33 = load i32, i32* %n, align 4, !dbg !460
  call void @mat_show(double** %32, i8* null, i32 %33), !dbg !460
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0)), !dbg !461
  %34 = load double**, double*** %U, align 8, !dbg !461
  %35 = load i32, i32* %n, align 4, !dbg !461
  call void @mat_show(double** %34, i8* null, i32 %35), !dbg !461
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0)), !dbg !462
  %36 = load double**, double*** %P, align 8, !dbg !462
  %37 = load i32, i32* %n, align 4, !dbg !462
  call void @mat_show(double** %36, i8* null, i32 %37), !dbg !462
  %38 = load double**, double*** %A, align 8, !dbg !463
  call void @mat_del(double** %38), !dbg !463
  %39 = load double**, double*** %L, align 8, !dbg !464
  call void @mat_del(double** %39), !dbg !464
  %40 = load double**, double*** %U, align 8, !dbg !465
  call void @mat_del(double** %40), !dbg !465
  %41 = load double**, double*** %P, align 8, !dbg !466
  call void @mat_del(double** %41), !dbg !466
  ret i32 0, !dbg !467
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "A3", scope: !2, file: !3, line: 104, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "lu-decomposition.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/LU-decomposition")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, elements: !9)
!8 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!9 = !{!10}
!10 = !DISubrange(count: -1)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "A4", scope: !2, file: !3, line: 105, type: !14, isLocal: false, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 1024, elements: !15)
!15 = !{!16, !16}
!16 = !DISubrange(count: 4)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 576, elements: !18)
!18 = !{!19, !19}
!19 = !DISubrange(count: 3)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!24 = distinct !DISubprogram(name: "mat_zero", scope: !3, file: !3, line: 18, type: !25, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !30}
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "mat", file: !3, line: 15, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !3, line: 18, type: !27)
!32 = !DILocation(line: 18, column: 19, scope: !24)
!33 = !DILocalVariable(name: "n", arg: 2, scope: !24, file: !3, line: 18, type: !30)
!34 = !DILocation(line: 18, column: 26, scope: !24)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 18, type: !30)
!36 = distinct !DILexicalBlock(scope: !24, file: !3, line: 18, column: 31)
!37 = !DILocation(line: 18, column: 31, scope: !36)
!38 = !DILocation(line: 18, column: 31, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !3, line: 18, column: 31)
!40 = !DILocalVariable(name: "j", scope: !41, file: !3, line: 18, type: !30)
!41 = distinct !DILexicalBlock(scope: !39, file: !3, line: 18, column: 31)
!42 = !DILocation(line: 18, column: 31, scope: !41)
!43 = !DILocation(line: 18, column: 31, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !3, line: 18, column: 31)
!45 = !DILocation(line: 18, column: 38, scope: !44)
!46 = !DILocation(line: 18, column: 40, scope: !44)
!47 = !DILocation(line: 18, column: 43, scope: !44)
!48 = !DILocation(line: 18, column: 46, scope: !44)
!49 = distinct !{!49, !42, !50}
!50 = !DILocation(line: 18, column: 48, scope: !41)
!51 = distinct !{!51, !37, !52}
!52 = !DILocation(line: 18, column: 48, scope: !36)
!53 = !DILocation(line: 18, column: 51, scope: !24)
!54 = distinct !DISubprogram(name: "mat_new", scope: !3, file: !3, line: 21, type: !55, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!27, !30}
!57 = !DILocalVariable(name: "n", arg: 1, scope: !54, file: !3, line: 21, type: !30)
!58 = !DILocation(line: 21, column: 13, scope: !54)
!59 = !DILocalVariable(name: "x", scope: !54, file: !3, line: 23, type: !27)
!60 = !DILocation(line: 23, column: 6, scope: !54)
!61 = !DILocation(line: 23, column: 35, scope: !54)
!62 = !DILocation(line: 23, column: 33, scope: !54)
!63 = !DILocation(line: 23, column: 10, scope: !54)
!64 = !DILocation(line: 24, column: 34, scope: !54)
!65 = !DILocation(line: 24, column: 32, scope: !54)
!66 = !DILocation(line: 24, column: 38, scope: !54)
!67 = !DILocation(line: 24, column: 36, scope: !54)
!68 = !DILocation(line: 24, column: 10, scope: !54)
!69 = !DILocation(line: 24, column: 2, scope: !54)
!70 = !DILocation(line: 24, column: 8, scope: !54)
!71 = !DILocalVariable(name: "i", scope: !72, file: !3, line: 26, type: !30)
!72 = distinct !DILexicalBlock(scope: !54, file: !3, line: 26, column: 2)
!73 = !DILocation(line: 26, column: 2, scope: !72)
!74 = !DILocation(line: 26, column: 2, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !3, line: 26, column: 2)
!76 = !DILocation(line: 26, column: 15, scope: !75)
!77 = !DILocation(line: 26, column: 22, scope: !75)
!78 = !DILocation(line: 26, column: 26, scope: !75)
!79 = !DILocation(line: 26, column: 24, scope: !75)
!80 = !DILocation(line: 26, column: 20, scope: !75)
!81 = !DILocation(line: 26, column: 8, scope: !75)
!82 = !DILocation(line: 26, column: 10, scope: !75)
!83 = !DILocation(line: 26, column: 13, scope: !75)
!84 = distinct !{!84, !73, !85}
!85 = !DILocation(line: 26, column: 26, scope: !72)
!86 = !DILocation(line: 27, column: 2, scope: !54)
!87 = !DILocation(line: 29, column: 9, scope: !54)
!88 = !DILocation(line: 29, column: 2, scope: !54)
!89 = distinct !DISubprogram(name: "mat_copy", scope: !3, file: !3, line: 33, type: !90, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DISubroutineType(types: !91)
!91 = !{!27, !92, !30}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!93 = !DILocalVariable(name: "s", arg: 1, scope: !89, file: !3, line: 33, type: !92)
!94 = !DILocation(line: 33, column: 20, scope: !89)
!95 = !DILocalVariable(name: "n", arg: 2, scope: !89, file: !3, line: 33, type: !30)
!96 = !DILocation(line: 33, column: 23, scope: !89)
!97 = !DILocalVariable(name: "x", scope: !89, file: !3, line: 35, type: !27)
!98 = !DILocation(line: 35, column: 6, scope: !89)
!99 = !DILocation(line: 35, column: 18, scope: !89)
!100 = !DILocation(line: 35, column: 10, scope: !89)
!101 = !DILocalVariable(name: "i", scope: !102, file: !3, line: 36, type: !30)
!102 = distinct !DILexicalBlock(scope: !89, file: !3, line: 36, column: 2)
!103 = !DILocation(line: 36, column: 2, scope: !102)
!104 = !DILocation(line: 36, column: 2, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 36, column: 2)
!106 = !DILocalVariable(name: "j", scope: !107, file: !3, line: 36, type: !30)
!107 = distinct !DILexicalBlock(scope: !105, file: !3, line: 36, column: 2)
!108 = !DILocation(line: 36, column: 2, scope: !107)
!109 = !DILocation(line: 36, column: 2, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 36, column: 2)
!111 = !DILocation(line: 36, column: 32, scope: !110)
!112 = !DILocation(line: 36, column: 19, scope: !110)
!113 = !DILocation(line: 36, column: 35, scope: !110)
!114 = !DILocation(line: 36, column: 20, scope: !110)
!115 = !DILocation(line: 36, column: 38, scope: !110)
!116 = !DILocation(line: 36, column: 41, scope: !110)
!117 = !DILocation(line: 36, column: 9, scope: !110)
!118 = !DILocation(line: 36, column: 11, scope: !110)
!119 = !DILocation(line: 36, column: 14, scope: !110)
!120 = !DILocation(line: 36, column: 17, scope: !110)
!121 = distinct !{!121, !108, !122}
!122 = !DILocation(line: 36, column: 42, scope: !107)
!123 = distinct !{!123, !103, !124}
!124 = !DILocation(line: 36, column: 42, scope: !102)
!125 = !DILocation(line: 37, column: 9, scope: !89)
!126 = !DILocation(line: 37, column: 2, scope: !89)
!127 = distinct !DISubprogram(name: "mat_del", scope: !3, file: !3, line: 41, type: !128, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DISubroutineType(types: !129)
!129 = !{null, !27}
!130 = !DILocalVariable(name: "x", arg: 1, scope: !127, file: !3, line: 41, type: !27)
!131 = !DILocation(line: 41, column: 18, scope: !127)
!132 = !DILocation(line: 41, column: 28, scope: !127)
!133 = !DILocation(line: 41, column: 23, scope: !127)
!134 = !DILocation(line: 41, column: 40, scope: !127)
!135 = !DILocation(line: 41, column: 35, scope: !127)
!136 = !DILocation(line: 41, column: 44, scope: !127)
!137 = distinct !DISubprogram(name: "mat_show", scope: !3, file: !3, line: 46, type: !138, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !27, !140, !30}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!142 = !DILocalVariable(name: "x", arg: 1, scope: !137, file: !3, line: 46, type: !27)
!143 = !DILocation(line: 46, column: 19, scope: !137)
!144 = !DILocalVariable(name: "fmt", arg: 2, scope: !137, file: !3, line: 46, type: !140)
!145 = !DILocation(line: 46, column: 28, scope: !137)
!146 = !DILocalVariable(name: "n", arg: 3, scope: !137, file: !3, line: 46, type: !30)
!147 = !DILocation(line: 46, column: 33, scope: !137)
!148 = !DILocation(line: 48, column: 7, scope: !149)
!149 = distinct !DILexicalBlock(scope: !137, file: !3, line: 48, column: 6)
!150 = !DILocation(line: 48, column: 6, scope: !137)
!151 = !{!"if"}
!152 = !DILocation(line: 48, column: 16, scope: !149)
!153 = !DILocation(line: 48, column: 12, scope: !149)
!154 = !DILocalVariable(name: "i", scope: !155, file: !3, line: 49, type: !30)
!155 = distinct !DILexicalBlock(scope: !137, file: !3, line: 49, column: 2)
!156 = !DILocation(line: 49, column: 2, scope: !155)
!157 = !DILocation(line: 49, column: 2, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 49, column: 2)
!159 = !DILocation(line: 50, column: 10, scope: !160)
!160 = distinct !DILexicalBlock(scope: !158, file: !3, line: 49, column: 8)
!161 = !DILocation(line: 50, column: 3, scope: !160)
!162 = !DILocalVariable(name: "j", scope: !163, file: !3, line: 51, type: !30)
!163 = distinct !DILexicalBlock(scope: !160, file: !3, line: 51, column: 3)
!164 = !DILocation(line: 51, column: 3, scope: !163)
!165 = !DILocation(line: 51, column: 3, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 51, column: 3)
!167 = !DILocation(line: 52, column: 11, scope: !168)
!168 = distinct !DILexicalBlock(scope: !166, file: !3, line: 51, column: 9)
!169 = !DILocation(line: 52, column: 16, scope: !168)
!170 = !DILocation(line: 52, column: 18, scope: !168)
!171 = !DILocation(line: 52, column: 21, scope: !168)
!172 = !DILocation(line: 52, column: 4, scope: !168)
!173 = !DILocation(line: 53, column: 11, scope: !168)
!174 = !DILocation(line: 53, column: 15, scope: !168)
!175 = !DILocation(line: 53, column: 17, scope: !168)
!176 = !DILocation(line: 53, column: 13, scope: !168)
!177 = !DILocation(line: 53, column: 30, scope: !168)
!178 = !DILocation(line: 53, column: 35, scope: !168)
!179 = !DILocation(line: 53, column: 37, scope: !168)
!180 = !DILocation(line: 53, column: 32, scope: !168)
!181 = !DILocation(line: 53, column: 4, scope: !168)
!182 = !DILocation(line: 54, column: 3, scope: !168)
!183 = distinct !{!183, !164, !184}
!184 = !DILocation(line: 54, column: 3, scope: !163)
!185 = !DILocation(line: 55, column: 2, scope: !160)
!186 = distinct !{!186, !156, !187}
!187 = !DILocation(line: 55, column: 2, scope: !155)
!188 = !DILocation(line: 56, column: 1, scope: !137)
!189 = distinct !DISubprogram(name: "mat_mul", scope: !3, file: !3, line: 59, type: !190, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DISubroutineType(types: !191)
!191 = !{!27, !27, !27, !30}
!192 = !DILocalVariable(name: "a", arg: 1, scope: !189, file: !3, line: 59, type: !27)
!193 = !DILocation(line: 59, column: 17, scope: !189)
!194 = !DILocalVariable(name: "b", arg: 2, scope: !189, file: !3, line: 59, type: !27)
!195 = !DILocation(line: 59, column: 24, scope: !189)
!196 = !DILocalVariable(name: "n", arg: 3, scope: !189, file: !3, line: 59, type: !30)
!197 = !DILocation(line: 59, column: 27, scope: !189)
!198 = !DILocalVariable(name: "c", scope: !189, file: !3, line: 61, type: !27)
!199 = !DILocation(line: 61, column: 6, scope: !189)
!200 = !DILocation(line: 61, column: 10, scope: !189)
!201 = !DILocalVariable(name: "i", scope: !202, file: !3, line: 62, type: !30)
!202 = distinct !DILexicalBlock(scope: !189, file: !3, line: 62, column: 2)
!203 = !DILocation(line: 62, column: 2, scope: !202)
!204 = !DILocation(line: 62, column: 2, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !3, line: 62, column: 2)
!206 = !DILocalVariable(name: "j", scope: !207, file: !3, line: 62, type: !30)
!207 = distinct !DILexicalBlock(scope: !205, file: !3, line: 62, column: 2)
!208 = !DILocation(line: 62, column: 2, scope: !207)
!209 = !DILocation(line: 62, column: 2, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !3, line: 62, column: 2)
!211 = !DILocalVariable(name: "k", scope: !212, file: !3, line: 62, type: !30)
!212 = distinct !DILexicalBlock(scope: !210, file: !3, line: 62, column: 2)
!213 = !DILocation(line: 62, column: 2, scope: !212)
!214 = !DILocation(line: 62, column: 2, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !3, line: 62, column: 2)
!216 = !DILocation(line: 62, column: 21, scope: !215)
!217 = !DILocation(line: 62, column: 23, scope: !215)
!218 = !DILocation(line: 62, column: 26, scope: !215)
!219 = !DILocation(line: 62, column: 31, scope: !215)
!220 = !DILocation(line: 62, column: 33, scope: !215)
!221 = !DILocation(line: 62, column: 36, scope: !215)
!222 = !DILocation(line: 62, column: 29, scope: !215)
!223 = !DILocation(line: 62, column: 10, scope: !215)
!224 = !DILocation(line: 62, column: 12, scope: !215)
!225 = !DILocation(line: 62, column: 15, scope: !215)
!226 = !DILocation(line: 62, column: 18, scope: !215)
!227 = distinct !{!227, !213, !228}
!228 = !DILocation(line: 62, column: 37, scope: !212)
!229 = distinct !{!229, !208, !230}
!230 = !DILocation(line: 62, column: 37, scope: !207)
!231 = distinct !{!231, !203, !232}
!232 = !DILocation(line: 62, column: 37, scope: !202)
!233 = !DILocation(line: 63, column: 9, scope: !189)
!234 = !DILocation(line: 63, column: 2, scope: !189)
!235 = distinct !DISubprogram(name: "mat_pivot", scope: !3, file: !3, line: 67, type: !236, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DISubroutineType(types: !237)
!237 = !{null, !27, !27, !30}
!238 = !DILocalVariable(name: "a", arg: 1, scope: !235, file: !3, line: 67, type: !27)
!239 = !DILocation(line: 67, column: 20, scope: !235)
!240 = !DILocalVariable(name: "p", arg: 2, scope: !235, file: !3, line: 67, type: !27)
!241 = !DILocation(line: 67, column: 27, scope: !235)
!242 = !DILocalVariable(name: "n", arg: 3, scope: !235, file: !3, line: 67, type: !30)
!243 = !DILocation(line: 67, column: 30, scope: !235)
!244 = !DILocalVariable(name: "i", scope: !245, file: !3, line: 69, type: !30)
!245 = distinct !DILexicalBlock(scope: !235, file: !3, line: 69, column: 2)
!246 = !DILocation(line: 69, column: 2, scope: !245)
!247 = !DILocation(line: 69, column: 2, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !3, line: 69, column: 2)
!249 = !DILocalVariable(name: "j", scope: !250, file: !3, line: 69, type: !30)
!250 = distinct !DILexicalBlock(scope: !248, file: !3, line: 69, column: 2)
!251 = !DILocation(line: 69, column: 2, scope: !250)
!252 = !DILocation(line: 69, column: 2, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !3, line: 69, column: 2)
!254 = !DILocation(line: 69, column: 22, scope: !255)
!255 = distinct !DILexicalBlock(scope: !253, file: !3, line: 69, column: 9)
!256 = !DILocation(line: 69, column: 27, scope: !255)
!257 = !DILocation(line: 69, column: 24, scope: !255)
!258 = !DILocation(line: 69, column: 21, scope: !255)
!259 = !DILocation(line: 69, column: 11, scope: !255)
!260 = !DILocation(line: 69, column: 13, scope: !255)
!261 = !DILocation(line: 69, column: 16, scope: !255)
!262 = !DILocation(line: 69, column: 19, scope: !255)
!263 = !DILocation(line: 69, column: 31, scope: !255)
!264 = distinct !{!264, !251, !265}
!265 = !DILocation(line: 69, column: 31, scope: !250)
!266 = distinct !{!266, !246, !267}
!267 = !DILocation(line: 69, column: 31, scope: !245)
!268 = !DILocalVariable(name: "i", scope: !269, file: !3, line: 70, type: !30)
!269 = distinct !DILexicalBlock(scope: !235, file: !3, line: 70, column: 2)
!270 = !DILocation(line: 70, column: 2, scope: !269)
!271 = !DILocation(line: 70, column: 2, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !3, line: 70, column: 2)
!273 = !DILocalVariable(name: "max_j", scope: !274, file: !3, line: 71, type: !30)
!274 = distinct !DILexicalBlock(scope: !272, file: !3, line: 70, column: 9)
!275 = !DILocation(line: 71, column: 7, scope: !274)
!276 = !DILocation(line: 71, column: 15, scope: !274)
!277 = !DILocalVariable(name: "j", scope: !278, file: !3, line: 72, type: !30)
!278 = distinct !DILexicalBlock(scope: !274, file: !3, line: 72, column: 3)
!279 = !DILocation(line: 72, column: 3, scope: !278)
!280 = !DILocation(line: 72, column: 3, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !3, line: 72, column: 3)
!282 = !DILocation(line: 73, column: 13, scope: !283)
!283 = distinct !DILexicalBlock(scope: !281, file: !3, line: 73, column: 8)
!284 = !DILocation(line: 73, column: 15, scope: !283)
!285 = !DILocation(line: 73, column: 18, scope: !283)
!286 = !DILocation(line: 73, column: 8, scope: !283)
!287 = !DILocation(line: 73, column: 29, scope: !283)
!288 = !DILocation(line: 73, column: 31, scope: !283)
!289 = !DILocation(line: 73, column: 38, scope: !283)
!290 = !DILocation(line: 73, column: 24, scope: !283)
!291 = !DILocation(line: 73, column: 22, scope: !283)
!292 = !DILocation(line: 73, column: 8, scope: !281)
!293 = !DILocation(line: 73, column: 51, scope: !283)
!294 = !DILocation(line: 73, column: 49, scope: !283)
!295 = !DILocation(line: 73, column: 43, scope: !283)
!296 = !DILocation(line: 73, column: 40, scope: !283)
!297 = distinct !{!297, !279, !298}
!298 = !DILocation(line: 73, column: 51, scope: !278)
!299 = !DILocation(line: 75, column: 7, scope: !300)
!300 = distinct !DILexicalBlock(scope: !274, file: !3, line: 75, column: 7)
!301 = !DILocation(line: 75, column: 16, scope: !300)
!302 = !DILocation(line: 75, column: 13, scope: !300)
!303 = !DILocation(line: 75, column: 7, scope: !274)
!304 = !DILocalVariable(name: "k", scope: !305, file: !3, line: 76, type: !30)
!305 = distinct !DILexicalBlock(scope: !300, file: !3, line: 76, column: 4)
!306 = !DILocation(line: 76, column: 4, scope: !305)
!307 = !DILocation(line: 76, column: 4, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !3, line: 76, column: 4)
!309 = !DILocalVariable(name: "tmp", scope: !310, file: !3, line: 76, type: !8)
!310 = distinct !DILexicalBlock(scope: !311, file: !3, line: 76, column: 12)
!311 = distinct !DILexicalBlock(scope: !308, file: !3, line: 76, column: 10)
!312 = !DILocation(line: 76, column: 12, scope: !310)
!313 = !DILocation(line: 76, column: 41, scope: !311)
!314 = distinct !{!314, !306, !315}
!315 = !DILocation(line: 76, column: 41, scope: !305)
!316 = !DILocation(line: 77, column: 2, scope: !274)
!317 = distinct !{!317, !270, !318}
!318 = !DILocation(line: 77, column: 2, scope: !269)
!319 = !DILocation(line: 78, column: 1, scope: !235)
!320 = distinct !DISubprogram(name: "mat_LU", scope: !3, file: !3, line: 81, type: !321, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!321 = !DISubroutineType(types: !322)
!322 = !{null, !27, !27, !27, !27, !30}
!323 = !DILocalVariable(name: "A", arg: 1, scope: !320, file: !3, line: 81, type: !27)
!324 = !DILocation(line: 81, column: 17, scope: !320)
!325 = !DILocalVariable(name: "L", arg: 2, scope: !320, file: !3, line: 81, type: !27)
!326 = !DILocation(line: 81, column: 24, scope: !320)
!327 = !DILocalVariable(name: "U", arg: 3, scope: !320, file: !3, line: 81, type: !27)
!328 = !DILocation(line: 81, column: 31, scope: !320)
!329 = !DILocalVariable(name: "P", arg: 4, scope: !320, file: !3, line: 81, type: !27)
!330 = !DILocation(line: 81, column: 38, scope: !320)
!331 = !DILocalVariable(name: "n", arg: 5, scope: !320, file: !3, line: 81, type: !30)
!332 = !DILocation(line: 81, column: 41, scope: !320)
!333 = !DILocation(line: 83, column: 2, scope: !320)
!334 = !DILocation(line: 83, column: 12, scope: !320)
!335 = !DILocation(line: 84, column: 2, scope: !320)
!336 = !DILocalVariable(name: "Aprime", scope: !320, file: !3, line: 86, type: !27)
!337 = !DILocation(line: 86, column: 6, scope: !320)
!338 = !DILocation(line: 86, column: 15, scope: !320)
!339 = !DILocalVariable(name: "i", scope: !340, file: !3, line: 88, type: !30)
!340 = distinct !DILexicalBlock(scope: !320, file: !3, line: 88, column: 2)
!341 = !DILocation(line: 88, column: 2, scope: !340)
!342 = !DILocation(line: 88, column: 2, scope: !343)
!343 = distinct !DILexicalBlock(scope: !340, file: !3, line: 88, column: 2)
!344 = !DILocation(line: 88, column: 11, scope: !345)
!345 = distinct !DILexicalBlock(scope: !343, file: !3, line: 88, column: 9)
!346 = !DILocation(line: 88, column: 13, scope: !345)
!347 = !DILocation(line: 88, column: 16, scope: !345)
!348 = !DILocation(line: 88, column: 19, scope: !345)
!349 = !DILocation(line: 88, column: 24, scope: !345)
!350 = distinct !{!350, !341, !351}
!351 = !DILocation(line: 88, column: 24, scope: !340)
!352 = !DILocalVariable(name: "i", scope: !353, file: !3, line: 89, type: !30)
!353 = distinct !DILexicalBlock(scope: !320, file: !3, line: 89, column: 2)
!354 = !DILocation(line: 89, column: 2, scope: !353)
!355 = !DILocation(line: 89, column: 2, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !3, line: 89, column: 2)
!357 = !DILocalVariable(name: "j", scope: !358, file: !3, line: 89, type: !30)
!358 = distinct !DILexicalBlock(scope: !356, file: !3, line: 89, column: 2)
!359 = !DILocation(line: 89, column: 2, scope: !358)
!360 = !DILocation(line: 89, column: 2, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !3, line: 89, column: 2)
!362 = !DILocalVariable(name: "s", scope: !363, file: !3, line: 90, type: !8)
!363 = distinct !DILexicalBlock(scope: !361, file: !3, line: 89, column: 9)
!364 = !DILocation(line: 90, column: 10, scope: !363)
!365 = !DILocation(line: 91, column: 7, scope: !366)
!366 = distinct !DILexicalBlock(scope: !363, file: !3, line: 91, column: 7)
!367 = !DILocation(line: 91, column: 12, scope: !366)
!368 = !DILocation(line: 91, column: 9, scope: !366)
!369 = !DILocation(line: 91, column: 7, scope: !363)
!370 = !DILocation(line: 92, column: 4, scope: !371)
!371 = distinct !DILexicalBlock(scope: !372, file: !3, line: 92, column: 4)
!372 = distinct !DILexicalBlock(scope: !366, file: !3, line: 91, column: 15)
!373 = !DILocalVariable(name: "k", scope: !374, file: !3, line: 92, type: !30)
!374 = distinct !DILexicalBlock(scope: !371, file: !3, line: 92, column: 4)
!375 = !DILocation(line: 92, column: 4, scope: !374)
!376 = !DILocation(line: 92, column: 4, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !3, line: 92, column: 4)
!378 = distinct !{!378, !375, !375}
!379 = !DILocation(line: 93, column: 14, scope: !372)
!380 = !DILocation(line: 93, column: 21, scope: !372)
!381 = !DILocation(line: 93, column: 24, scope: !372)
!382 = !DILocation(line: 93, column: 29, scope: !372)
!383 = !DILocation(line: 93, column: 27, scope: !372)
!384 = !DILocation(line: 93, column: 4, scope: !372)
!385 = !DILocation(line: 93, column: 6, scope: !372)
!386 = !DILocation(line: 93, column: 9, scope: !372)
!387 = !DILocation(line: 93, column: 12, scope: !372)
!388 = !DILocation(line: 94, column: 3, scope: !372)
!389 = !DILocation(line: 95, column: 7, scope: !390)
!390 = distinct !DILexicalBlock(scope: !363, file: !3, line: 95, column: 7)
!391 = !DILocation(line: 95, column: 12, scope: !390)
!392 = !DILocation(line: 95, column: 9, scope: !390)
!393 = !DILocation(line: 95, column: 7, scope: !363)
!394 = !DILocation(line: 96, column: 4, scope: !395)
!395 = distinct !DILexicalBlock(scope: !396, file: !3, line: 96, column: 4)
!396 = distinct !DILexicalBlock(scope: !390, file: !3, line: 95, column: 15)
!397 = !DILocalVariable(name: "k", scope: !398, file: !3, line: 96, type: !30)
!398 = distinct !DILexicalBlock(scope: !395, file: !3, line: 96, column: 4)
!399 = !DILocation(line: 96, column: 4, scope: !398)
!400 = !DILocation(line: 96, column: 4, scope: !401)
!401 = distinct !DILexicalBlock(scope: !398, file: !3, line: 96, column: 4)
!402 = distinct !{!402, !399, !399}
!403 = !DILocation(line: 97, column: 15, scope: !396)
!404 = !DILocation(line: 97, column: 22, scope: !396)
!405 = !DILocation(line: 97, column: 25, scope: !396)
!406 = !DILocation(line: 97, column: 30, scope: !396)
!407 = !DILocation(line: 97, column: 28, scope: !396)
!408 = !DILocation(line: 97, column: 35, scope: !396)
!409 = !DILocation(line: 97, column: 37, scope: !396)
!410 = !DILocation(line: 97, column: 40, scope: !396)
!411 = !DILocation(line: 97, column: 33, scope: !396)
!412 = !DILocation(line: 97, column: 4, scope: !396)
!413 = !DILocation(line: 97, column: 6, scope: !396)
!414 = !DILocation(line: 97, column: 9, scope: !396)
!415 = !DILocation(line: 97, column: 12, scope: !396)
!416 = !DILocation(line: 98, column: 3, scope: !396)
!417 = !DILocation(line: 99, column: 2, scope: !363)
!418 = distinct !{!418, !359, !419}
!419 = !DILocation(line: 99, column: 2, scope: !358)
!420 = distinct !{!420, !354, !421}
!421 = !DILocation(line: 99, column: 2, scope: !353)
!422 = !DILocation(line: 101, column: 2, scope: !320)
!423 = !DILocation(line: 102, column: 1, scope: !320)
!424 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 107, type: !425, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!425 = !DISubroutineType(types: !426)
!426 = !{!30}
!427 = !DILocalVariable(name: "n", scope: !424, file: !3, line: 109, type: !30)
!428 = !DILocation(line: 109, column: 6, scope: !424)
!429 = !DILocalVariable(name: "A", scope: !424, file: !3, line: 110, type: !27)
!430 = !DILocation(line: 110, column: 6, scope: !424)
!431 = !DILocalVariable(name: "L", scope: !424, file: !3, line: 110, type: !27)
!432 = !DILocation(line: 110, column: 9, scope: !424)
!433 = !DILocalVariable(name: "P", scope: !424, file: !3, line: 110, type: !27)
!434 = !DILocation(line: 110, column: 12, scope: !424)
!435 = !DILocalVariable(name: "U", scope: !424, file: !3, line: 110, type: !27)
!436 = !DILocation(line: 110, column: 15, scope: !424)
!437 = !DILocation(line: 112, column: 2, scope: !424)
!438 = !DILocation(line: 112, column: 11, scope: !424)
!439 = !DILocation(line: 112, column: 20, scope: !424)
!440 = !DILocation(line: 113, column: 6, scope: !424)
!441 = !DILocation(line: 113, column: 4, scope: !424)
!442 = !DILocation(line: 114, column: 2, scope: !424)
!443 = !DILocation(line: 115, column: 2, scope: !424)
!444 = !DILocation(line: 115, column: 12, scope: !424)
!445 = !DILocation(line: 115, column: 22, scope: !424)
!446 = !DILocation(line: 115, column: 32, scope: !424)
!447 = !DILocation(line: 116, column: 2, scope: !424)
!448 = !DILocation(line: 116, column: 12, scope: !424)
!449 = !DILocation(line: 116, column: 22, scope: !424)
!450 = !DILocation(line: 116, column: 32, scope: !424)
!451 = !DILocation(line: 118, column: 2, scope: !424)
!452 = !DILocation(line: 120, column: 4, scope: !424)
!453 = !DILocation(line: 122, column: 2, scope: !424)
!454 = !DILocation(line: 122, column: 11, scope: !424)
!455 = !DILocation(line: 122, column: 20, scope: !424)
!456 = !DILocation(line: 123, column: 6, scope: !424)
!457 = !DILocation(line: 123, column: 4, scope: !424)
!458 = !DILocation(line: 124, column: 2, scope: !424)
!459 = !DILocation(line: 125, column: 2, scope: !424)
!460 = !DILocation(line: 125, column: 12, scope: !424)
!461 = !DILocation(line: 125, column: 22, scope: !424)
!462 = !DILocation(line: 125, column: 32, scope: !424)
!463 = !DILocation(line: 126, column: 2, scope: !424)
!464 = !DILocation(line: 126, column: 12, scope: !424)
!465 = !DILocation(line: 126, column: 22, scope: !424)
!466 = !DILocation(line: 126, column: 32, scope: !424)
!467 = !DILocation(line: 128, column: 2, scope: !424)
