; ModuleID = 'convert-decimal-number-to-rational-1.ll'
source_filename = "convert-decimal-number-to-rational-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.rat_approx.h = private unnamed_addr constant [3 x i64] [i64 0, i64 1, i64 0], align 16
@__const.rat_approx.k = private unnamed_addr constant [3 x i64] [i64 1, i64 0, i64 0], align 16
@.str = private unnamed_addr constant [13 x i8] c"f = %16.14f\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"denom <= %d: \00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"%lld/%lld\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"\0Af = %16.14f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @rat_approx(double %f, i64 %md, i64* %num, i64* %denom) #0 !dbg !13 {
entry:
  %f.addr = alloca double, align 8
  %md.addr = alloca i64, align 8
  %num.addr = alloca i64*, align 8
  %denom.addr = alloca i64*, align 8
  %a = alloca i64, align 8
  %h = alloca [3 x i64], align 16
  %k = alloca [3 x i64], align 16
  %x = alloca i64, align 8
  %d = alloca i64, align 8
  %n = alloca i64, align 8
  %i = alloca i32, align 4
  %neg = alloca i32, align 4
  store double %f, double* %f.addr, align 8
  call void @llvm.dbg.declare(metadata double* %f.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i64 %md, i64* %md.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %md.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i64* %num, i64** %num.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %num.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* %denom, i64** %denom.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %denom.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %a, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [3 x i64]* %h, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = bitcast [3 x i64]* %h to i8*, !dbg !32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i64]* @__const.rat_approx.h to i8*), i64 24, i1 false), !dbg !32
  call void @llvm.dbg.declare(metadata [3 x i64]* %k, metadata !33, metadata !DIExpression()), !dbg !34
  %1 = bitcast [3 x i64]* %k to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([3 x i64]* @__const.rat_approx.k to i8*), i64 24, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %x, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %d, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %n, metadata !39, metadata !DIExpression()), !dbg !40
  store i64 1, i64* %n, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %neg, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %neg, align 4, !dbg !45
  %2 = load i64, i64* %md.addr, align 8, !dbg !46
  %cmp = icmp sle i64 %2, 1, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %3 = load i64*, i64** %denom.addr, align 8, !dbg !50
  store i64 1, i64* %3, align 8, !dbg !52
  %4 = load double, double* %f.addr, align 8, !dbg !53
  %conv = fptosi double %4 to i64, !dbg !54
  %5 = load i64*, i64** %num.addr, align 8, !dbg !55
  store i64 %conv, i64* %5, align 8, !dbg !56
  br label %return, !dbg !57

if.end:                                           ; preds = %entry
  %6 = load double, double* %f.addr, align 8, !dbg !58
  %cmp1 = fcmp olt double %6, 0.000000e+00, !dbg !60
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !61

if.then3:                                         ; preds = %if.end
  store i32 1, i32* %neg, align 4, !dbg !62
  %7 = load double, double* %f.addr, align 8, !dbg !64
  %fneg = fneg double %7, !dbg !65
  store double %fneg, double* %f.addr, align 8, !dbg !66
  br label %if.end4, !dbg !67

if.end4:                                          ; preds = %if.then3, %if.end
  br label %while.cond, !dbg !68

while.cond:                                       ; preds = %while.body, %if.end4
  %8 = load double, double* %f.addr, align 8, !dbg !69
  %9 = load double, double* %f.addr, align 8, !dbg !70
  %10 = call double @llvm.floor.f64(double %9), !dbg !71
  %cmp5 = fcmp une double %8, %10, !dbg !72
  br i1 %cmp5, label %while.body, label %while.end, !dbg !68

while.body:                                       ; preds = %while.cond
  %11 = load i64, i64* %n, align 8, !dbg !73
  %shl = shl i64 %11, 1, !dbg !73
  store i64 %shl, i64* %n, align 8, !dbg !73
  %12 = load double, double* %f.addr, align 8, !dbg !75
  %mul = fmul double %12, 2.000000e+00, !dbg !75
  store double %mul, double* %f.addr, align 8, !dbg !75
  br label %while.cond, !dbg !68, !llvm.loop !76

while.end:                                        ; preds = %while.cond
  %13 = load double, double* %f.addr, align 8, !dbg !78
  %conv7 = fptosi double %13 to i64, !dbg !78
  store i64 %conv7, i64* %d, align 8, !dbg !79
  store i32 0, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %while.end
  %14 = load i32, i32* %i, align 4, !dbg !83
  %cmp8 = icmp slt i32 %14, 64, !dbg !85
  br i1 %cmp8, label %for.body, label %for.end.loopexit, !dbg !86

for.body:                                         ; preds = %for.cond
  %15 = load i64, i64* %n, align 8, !dbg !87
  %tobool = icmp ne i64 %15, 0, !dbg !87
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !87

cond.true:                                        ; preds = %for.body
  %16 = load i64, i64* %d, align 8, !dbg !89
  %17 = load i64, i64* %n, align 8, !dbg !90
  %div = sdiv i64 %16, %17, !dbg !91
  br label %cond.end, !dbg !87

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !87

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 0, %cond.false ], !dbg !87
  store i64 %cond, i64* %a, align 8, !dbg !92
  %18 = load i32, i32* %i, align 4, !dbg !93
  %tobool10 = icmp ne i32 %18, 0, !dbg !93
  br i1 %tobool10, label %land.lhs.true, label %if.end13, !dbg !95

land.lhs.true:                                    ; preds = %cond.end
  %19 = load i64, i64* %a, align 8, !dbg !96
  %tobool11 = icmp ne i64 %19, 0, !dbg !96
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !97

if.then12:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !98

if.end13:                                         ; preds = %land.lhs.true, %cond.end
  %20 = load i64, i64* %d, align 8, !dbg !99
  store i64 %20, i64* %x, align 8, !dbg !100
  %21 = load i64, i64* %n, align 8, !dbg !101
  store i64 %21, i64* %d, align 8, !dbg !102
  %22 = load i64, i64* %x, align 8, !dbg !103
  %23 = load i64, i64* %n, align 8, !dbg !104
  %rem = srem i64 %22, %23, !dbg !105
  store i64 %rem, i64* %n, align 8, !dbg !106
  %24 = load i64, i64* %a, align 8, !dbg !107
  store i64 %24, i64* %x, align 8, !dbg !108
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !109
  %25 = load i64, i64* %arrayidx, align 8, !dbg !109
  %26 = load i64, i64* %a, align 8, !dbg !111
  %mul14 = mul nsw i64 %25, %26, !dbg !112
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !113
  %27 = load i64, i64* %arrayidx15, align 16, !dbg !113
  %add = add nsw i64 %mul14, %27, !dbg !114
  %28 = load i64, i64* %md.addr, align 8, !dbg !115
  %cmp16 = icmp sge i64 %add, %28, !dbg !116
  br i1 %cmp16, label %if.then18, label %if.end30, !dbg !117

if.then18:                                        ; preds = %if.end13
  %29 = load i64, i64* %md.addr, align 8, !dbg !118
  %arrayidx19 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !120
  %30 = load i64, i64* %arrayidx19, align 16, !dbg !120
  %sub = sub nsw i64 %29, %30, !dbg !121
  %arrayidx20 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !122
  %31 = load i64, i64* %arrayidx20, align 8, !dbg !122
  %div21 = sdiv i64 %sub, %31, !dbg !123
  store i64 %div21, i64* %x, align 8, !dbg !124
  %32 = load i64, i64* %x, align 8, !dbg !125
  %mul22 = mul nsw i64 %32, 2, !dbg !127
  %33 = load i64, i64* %a, align 8, !dbg !128
  %cmp23 = icmp sge i64 %mul22, %33, !dbg !129
  br i1 %cmp23, label %if.then28, label %lor.lhs.false, !dbg !130

lor.lhs.false:                                    ; preds = %if.then18
  %arrayidx25 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !131
  %34 = load i64, i64* %arrayidx25, align 8, !dbg !131
  %35 = load i64, i64* %md.addr, align 8, !dbg !132
  %cmp26 = icmp sge i64 %34, %35, !dbg !133
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !134

if.then28:                                        ; preds = %lor.lhs.false, %if.then18
  store i32 65, i32* %i, align 4, !dbg !135
  br label %if.end29, !dbg !136

if.else:                                          ; preds = %lor.lhs.false
  br label %for.end, !dbg !137

if.end29:                                         ; preds = %if.then28
  br label %if.end30, !dbg !138

if.end30:                                         ; preds = %if.end29, %if.end13
  %36 = load i64, i64* %x, align 8, !dbg !139
  %arrayidx31 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !140
  %37 = load i64, i64* %arrayidx31, align 8, !dbg !140
  %mul32 = mul nsw i64 %36, %37, !dbg !141
  %arrayidx33 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !142
  %38 = load i64, i64* %arrayidx33, align 16, !dbg !142
  %add34 = add nsw i64 %mul32, %38, !dbg !143
  %arrayidx35 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !144
  store i64 %add34, i64* %arrayidx35, align 16, !dbg !145
  %arrayidx36 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !146
  %39 = load i64, i64* %arrayidx36, align 8, !dbg !146
  %arrayidx37 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !147
  store i64 %39, i64* %arrayidx37, align 16, !dbg !148
  %arrayidx38 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !149
  %40 = load i64, i64* %arrayidx38, align 16, !dbg !149
  %arrayidx39 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !150
  store i64 %40, i64* %arrayidx39, align 8, !dbg !151
  %41 = load i64, i64* %x, align 8, !dbg !152
  %arrayidx40 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !153
  %42 = load i64, i64* %arrayidx40, align 8, !dbg !153
  %mul41 = mul nsw i64 %41, %42, !dbg !154
  %arrayidx42 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !155
  %43 = load i64, i64* %arrayidx42, align 16, !dbg !155
  %add43 = add nsw i64 %mul41, %43, !dbg !156
  %arrayidx44 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !157
  store i64 %add43, i64* %arrayidx44, align 16, !dbg !158
  %arrayidx45 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !159
  %44 = load i64, i64* %arrayidx45, align 8, !dbg !159
  %arrayidx46 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !160
  store i64 %44, i64* %arrayidx46, align 16, !dbg !161
  %arrayidx47 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !162
  %45 = load i64, i64* %arrayidx47, align 16, !dbg !162
  %arrayidx48 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !163
  store i64 %45, i64* %arrayidx48, align 8, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %if.end30
  %46 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %46, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !170

for.end:                                          ; preds = %for.end.loopexit, %if.else, %if.then12
  %arrayidx49 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !170
  %47 = load i64, i64* %arrayidx49, align 8, !dbg !170
  %48 = load i64*, i64** %denom.addr, align 8, !dbg !171
  store i64 %47, i64* %48, align 8, !dbg !172
  %49 = load i32, i32* %neg, align 4, !dbg !173
  %tobool50 = icmp ne i32 %49, 0, !dbg !173
  br i1 %tobool50, label %cond.true51, label %cond.false54, !dbg !173

cond.true51:                                      ; preds = %for.end
  %arrayidx52 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !174
  %50 = load i64, i64* %arrayidx52, align 8, !dbg !174
  %sub53 = sub nsw i64 0, %50, !dbg !175
  br label %cond.end56, !dbg !173

cond.false54:                                     ; preds = %for.end
  %arrayidx55 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !176
  %51 = load i64, i64* %arrayidx55, align 8, !dbg !176
  br label %cond.end56, !dbg !173

cond.end56:                                       ; preds = %cond.false54, %cond.true51
  %cond57 = phi i64 [ %sub53, %cond.true51 ], [ %51, %cond.false54 ], !dbg !173
  %52 = load i64*, i64** %num.addr, align 8, !dbg !177
  store i64 %cond57, i64* %52, align 8, !dbg !178
  br label %return, !dbg !179

return:                                           ; preds = %cond.end56, %if.then
  ret void, !dbg !179
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !180 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %d = alloca i64, align 8
  %n = alloca i64, align 8
  %f = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %d, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %n, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata double* %f, metadata !189, metadata !DIExpression()), !dbg !190
  store double 0x3FC2492492492492, double* %f, align 8, !dbg !191
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 0x3FC2492492492492), !dbg !192
  store i32 1, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !196
  %cmp = icmp sle i32 %0, 20000000, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !200
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %1), !dbg !202
  %2 = load double, double* %f, align 8, !dbg !203
  %3 = load i32, i32* %i, align 4, !dbg !204
  %conv = sext i32 %3 to i64, !dbg !204
  call void @rat_approx(double %2, i64 %conv, i64* %n, i64* %d), !dbg !205
  %4 = load i64, i64* %n, align 8, !dbg !206
  %5 = load i64, i64* %d, align 8, !dbg !207
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %4, i64 %5), !dbg !208
  br label %for.inc, !dbg !209

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !210
  %mul = mul nsw i32 %6, 16, !dbg !210
  store i32 %mul, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !211, !llvm.loop !212

for.end:                                          ; preds = %for.cond
  %call3 = call double @atan2(double 1.000000e+00, double 1.000000e+00) #5, !dbg !214
  %mul4 = fmul double %call3, 4.000000e+00, !dbg !215
  store double %mul4, double* %f, align 8, !dbg !216
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %mul4), !dbg !217
  store i32 1, i32* %i, align 4, !dbg !218
  br label %for.cond6, !dbg !220

for.cond6:                                        ; preds = %for.inc13, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !221
  %cmp7 = icmp sle i32 %7, 20000000, !dbg !223
  br i1 %cmp7, label %for.body9, label %for.end15, !dbg !224

for.body9:                                        ; preds = %for.cond6
  %8 = load i32, i32* %i, align 4, !dbg !225
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %8), !dbg !227
  %9 = load double, double* %f, align 8, !dbg !228
  %10 = load i32, i32* %i, align 4, !dbg !229
  %conv11 = sext i32 %10 to i64, !dbg !229
  call void @rat_approx(double %9, i64 %conv11, i64* %n, i64* %d), !dbg !230
  %11 = load i64, i64* %n, align 8, !dbg !231
  %12 = load i64, i64* %d, align 8, !dbg !232
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %11, i64 %12), !dbg !233
  br label %for.inc13, !dbg !234

for.inc13:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !235
  %mul14 = mul nsw i32 %13, 16, !dbg !235
  store i32 %mul14, i32* %i, align 4, !dbg !235
  br label %for.cond6, !dbg !236, !llvm.loop !237

for.end15:                                        ; preds = %for.cond6
  ret i32 0, !dbg !239
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "convert-decimal-number-to-rational-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Convert-decimal-number-to-rational")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!8 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!13 = distinct !DISubprogram(name: "rat_approx", scope: !1, file: !1, line: 15, type: !14, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16, !4, !17, !17}
!16 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!18 = !DILocalVariable(name: "f", arg: 1, scope: !13, file: !1, line: 15, type: !16)
!19 = !DILocation(line: 15, column: 24, scope: !13)
!20 = !DILocalVariable(name: "md", arg: 2, scope: !13, file: !1, line: 15, type: !4)
!21 = !DILocation(line: 15, column: 35, scope: !13)
!22 = !DILocalVariable(name: "num", arg: 3, scope: !13, file: !1, line: 15, type: !17)
!23 = !DILocation(line: 15, column: 48, scope: !13)
!24 = !DILocalVariable(name: "denom", arg: 4, scope: !13, file: !1, line: 15, type: !17)
!25 = !DILocation(line: 15, column: 62, scope: !13)
!26 = !DILocalVariable(name: "a", scope: !13, file: !1, line: 18, type: !4)
!27 = !DILocation(line: 18, column: 10, scope: !13)
!28 = !DILocalVariable(name: "h", scope: !13, file: !1, line: 18, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 3)
!32 = !DILocation(line: 18, column: 13, scope: !13)
!33 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 18, type: !29)
!34 = !DILocation(line: 18, column: 33, scope: !13)
!35 = !DILocalVariable(name: "x", scope: !13, file: !1, line: 19, type: !4)
!36 = !DILocation(line: 19, column: 10, scope: !13)
!37 = !DILocalVariable(name: "d", scope: !13, file: !1, line: 19, type: !4)
!38 = !DILocation(line: 19, column: 13, scope: !13)
!39 = !DILocalVariable(name: "n", scope: !13, file: !1, line: 19, type: !4)
!40 = !DILocation(line: 19, column: 16, scope: !13)
!41 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 20, type: !42)
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DILocation(line: 20, column: 6, scope: !13)
!44 = !DILocalVariable(name: "neg", scope: !13, file: !1, line: 20, type: !42)
!45 = !DILocation(line: 20, column: 9, scope: !13)
!46 = !DILocation(line: 22, column: 6, scope: !47)
!47 = distinct !DILexicalBlock(scope: !13, file: !1, line: 22, column: 6)
!48 = !DILocation(line: 22, column: 9, scope: !47)
!49 = !DILocation(line: 22, column: 6, scope: !13)
!50 = !DILocation(line: 22, column: 18, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 22, column: 15)
!52 = !DILocation(line: 22, column: 24, scope: !51)
!53 = !DILocation(line: 22, column: 46, scope: !51)
!54 = !DILocation(line: 22, column: 36, scope: !51)
!55 = !DILocation(line: 22, column: 30, scope: !51)
!56 = !DILocation(line: 22, column: 34, scope: !51)
!57 = !DILocation(line: 22, column: 49, scope: !51)
!58 = !DILocation(line: 24, column: 6, scope: !59)
!59 = distinct !DILexicalBlock(scope: !13, file: !1, line: 24, column: 6)
!60 = !DILocation(line: 24, column: 8, scope: !59)
!61 = !DILocation(line: 24, column: 6, scope: !13)
!62 = !DILocation(line: 24, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 24, column: 13)
!64 = !DILocation(line: 24, column: 29, scope: !63)
!65 = !DILocation(line: 24, column: 28, scope: !63)
!66 = !DILocation(line: 24, column: 26, scope: !63)
!67 = !DILocation(line: 24, column: 32, scope: !63)
!68 = !DILocation(line: 26, column: 2, scope: !13)
!69 = !DILocation(line: 26, column: 9, scope: !13)
!70 = !DILocation(line: 26, column: 20, scope: !13)
!71 = !DILocation(line: 26, column: 14, scope: !13)
!72 = !DILocation(line: 26, column: 11, scope: !13)
!73 = !DILocation(line: 26, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 24)
!75 = !DILocation(line: 26, column: 37, scope: !74)
!76 = distinct !{!76, !68, !77}
!77 = !DILocation(line: 26, column: 43, scope: !13)
!78 = !DILocation(line: 27, column: 6, scope: !13)
!79 = !DILocation(line: 27, column: 4, scope: !13)
!80 = !DILocation(line: 30, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !13, file: !1, line: 30, column: 2)
!82 = !DILocation(line: 30, column: 7, scope: !81)
!83 = !DILocation(line: 30, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 30, column: 2)
!85 = !DILocation(line: 30, column: 16, scope: !84)
!86 = !DILocation(line: 30, column: 2, scope: !81)
!87 = !DILocation(line: 31, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !1, line: 30, column: 27)
!89 = !DILocation(line: 31, column: 11, scope: !88)
!90 = !DILocation(line: 31, column: 15, scope: !88)
!91 = !DILocation(line: 31, column: 13, scope: !88)
!92 = !DILocation(line: 31, column: 5, scope: !88)
!93 = !DILocation(line: 32, column: 7, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 32, column: 7)
!95 = !DILocation(line: 32, column: 9, scope: !94)
!96 = !DILocation(line: 32, column: 13, scope: !94)
!97 = !DILocation(line: 32, column: 7, scope: !88)
!98 = !DILocation(line: 32, column: 16, scope: !94)
!99 = !DILocation(line: 34, column: 7, scope: !88)
!100 = !DILocation(line: 34, column: 5, scope: !88)
!101 = !DILocation(line: 34, column: 14, scope: !88)
!102 = !DILocation(line: 34, column: 12, scope: !88)
!103 = !DILocation(line: 34, column: 21, scope: !88)
!104 = !DILocation(line: 34, column: 25, scope: !88)
!105 = !DILocation(line: 34, column: 23, scope: !88)
!106 = !DILocation(line: 34, column: 19, scope: !88)
!107 = !DILocation(line: 36, column: 7, scope: !88)
!108 = !DILocation(line: 36, column: 5, scope: !88)
!109 = !DILocation(line: 37, column: 7, scope: !110)
!110 = distinct !DILexicalBlock(scope: !88, file: !1, line: 37, column: 7)
!111 = !DILocation(line: 37, column: 14, scope: !110)
!112 = !DILocation(line: 37, column: 12, scope: !110)
!113 = !DILocation(line: 37, column: 18, scope: !110)
!114 = !DILocation(line: 37, column: 16, scope: !110)
!115 = !DILocation(line: 37, column: 26, scope: !110)
!116 = !DILocation(line: 37, column: 23, scope: !110)
!117 = !DILocation(line: 37, column: 7, scope: !88)
!118 = !DILocation(line: 38, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !1, line: 37, column: 30)
!120 = !DILocation(line: 38, column: 14, scope: !119)
!121 = !DILocation(line: 38, column: 12, scope: !119)
!122 = !DILocation(line: 38, column: 22, scope: !119)
!123 = !DILocation(line: 38, column: 20, scope: !119)
!124 = !DILocation(line: 38, column: 6, scope: !119)
!125 = !DILocation(line: 39, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !1, line: 39, column: 8)
!127 = !DILocation(line: 39, column: 10, scope: !126)
!128 = !DILocation(line: 39, column: 17, scope: !126)
!129 = !DILocation(line: 39, column: 14, scope: !126)
!130 = !DILocation(line: 39, column: 19, scope: !126)
!131 = !DILocation(line: 39, column: 22, scope: !126)
!132 = !DILocation(line: 39, column: 30, scope: !126)
!133 = !DILocation(line: 39, column: 27, scope: !126)
!134 = !DILocation(line: 39, column: 8, scope: !119)
!135 = !DILocation(line: 40, column: 7, scope: !126)
!136 = !DILocation(line: 40, column: 5, scope: !126)
!137 = !DILocation(line: 42, column: 5, scope: !126)
!138 = !DILocation(line: 43, column: 3, scope: !119)
!139 = !DILocation(line: 45, column: 10, scope: !88)
!140 = !DILocation(line: 45, column: 14, scope: !88)
!141 = !DILocation(line: 45, column: 12, scope: !88)
!142 = !DILocation(line: 45, column: 21, scope: !88)
!143 = !DILocation(line: 45, column: 19, scope: !88)
!144 = !DILocation(line: 45, column: 3, scope: !88)
!145 = !DILocation(line: 45, column: 8, scope: !88)
!146 = !DILocation(line: 45, column: 34, scope: !88)
!147 = !DILocation(line: 45, column: 27, scope: !88)
!148 = !DILocation(line: 45, column: 32, scope: !88)
!149 = !DILocation(line: 45, column: 47, scope: !88)
!150 = !DILocation(line: 45, column: 40, scope: !88)
!151 = !DILocation(line: 45, column: 45, scope: !88)
!152 = !DILocation(line: 46, column: 10, scope: !88)
!153 = !DILocation(line: 46, column: 14, scope: !88)
!154 = !DILocation(line: 46, column: 12, scope: !88)
!155 = !DILocation(line: 46, column: 21, scope: !88)
!156 = !DILocation(line: 46, column: 19, scope: !88)
!157 = !DILocation(line: 46, column: 3, scope: !88)
!158 = !DILocation(line: 46, column: 8, scope: !88)
!159 = !DILocation(line: 46, column: 34, scope: !88)
!160 = !DILocation(line: 46, column: 27, scope: !88)
!161 = !DILocation(line: 46, column: 32, scope: !88)
!162 = !DILocation(line: 46, column: 47, scope: !88)
!163 = !DILocation(line: 46, column: 40, scope: !88)
!164 = !DILocation(line: 46, column: 45, scope: !88)
!165 = !DILocation(line: 47, column: 2, scope: !88)
!166 = !DILocation(line: 30, column: 23, scope: !84)
!167 = !DILocation(line: 30, column: 2, scope: !84)
!168 = distinct !{!168, !86, !169}
!169 = !DILocation(line: 47, column: 2, scope: !81)
!170 = !DILocation(line: 48, column: 11, scope: !13)
!171 = !DILocation(line: 48, column: 3, scope: !13)
!172 = !DILocation(line: 48, column: 9, scope: !13)
!173 = !DILocation(line: 49, column: 9, scope: !13)
!174 = !DILocation(line: 49, column: 16, scope: !13)
!175 = !DILocation(line: 49, column: 15, scope: !13)
!176 = !DILocation(line: 49, column: 23, scope: !13)
!177 = !DILocation(line: 49, column: 3, scope: !13)
!178 = !DILocation(line: 49, column: 7, scope: !13)
!179 = !DILocation(line: 50, column: 1, scope: !13)
!180 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 52, type: !181, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DISubroutineType(types: !182)
!182 = !{!42}
!183 = !DILocalVariable(name: "i", scope: !180, file: !1, line: 54, type: !42)
!184 = !DILocation(line: 54, column: 6, scope: !180)
!185 = !DILocalVariable(name: "d", scope: !180, file: !1, line: 55, type: !4)
!186 = !DILocation(line: 55, column: 10, scope: !180)
!187 = !DILocalVariable(name: "n", scope: !180, file: !1, line: 55, type: !4)
!188 = !DILocation(line: 55, column: 13, scope: !180)
!189 = !DILocalVariable(name: "f", scope: !180, file: !1, line: 56, type: !16)
!190 = !DILocation(line: 56, column: 9, scope: !180)
!191 = !DILocation(line: 58, column: 28, scope: !180)
!192 = !DILocation(line: 58, column: 2, scope: !180)
!193 = !DILocation(line: 59, column: 9, scope: !194)
!194 = distinct !DILexicalBlock(scope: !180, file: !1, line: 59, column: 2)
!195 = !DILocation(line: 59, column: 7, scope: !194)
!196 = !DILocation(line: 59, column: 14, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !1, line: 59, column: 2)
!198 = !DILocation(line: 59, column: 16, scope: !197)
!199 = !DILocation(line: 59, column: 2, scope: !194)
!200 = !DILocation(line: 60, column: 27, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !1, line: 59, column: 38)
!202 = !DILocation(line: 60, column: 3, scope: !201)
!203 = !DILocation(line: 61, column: 14, scope: !201)
!204 = !DILocation(line: 61, column: 17, scope: !201)
!205 = !DILocation(line: 61, column: 3, scope: !201)
!206 = !DILocation(line: 62, column: 25, scope: !201)
!207 = !DILocation(line: 62, column: 28, scope: !201)
!208 = !DILocation(line: 62, column: 3, scope: !201)
!209 = !DILocation(line: 63, column: 2, scope: !201)
!210 = !DILocation(line: 59, column: 31, scope: !197)
!211 = !DILocation(line: 59, column: 2, scope: !197)
!212 = distinct !{!212, !199, !213}
!213 = !DILocation(line: 63, column: 2, scope: !194)
!214 = !DILocation(line: 65, column: 32, scope: !180)
!215 = !DILocation(line: 65, column: 43, scope: !180)
!216 = !DILocation(line: 65, column: 30, scope: !180)
!217 = !DILocation(line: 65, column: 2, scope: !180)
!218 = !DILocation(line: 66, column: 9, scope: !219)
!219 = distinct !DILexicalBlock(scope: !180, file: !1, line: 66, column: 2)
!220 = !DILocation(line: 66, column: 7, scope: !219)
!221 = !DILocation(line: 66, column: 14, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !1, line: 66, column: 2)
!223 = !DILocation(line: 66, column: 16, scope: !222)
!224 = !DILocation(line: 66, column: 2, scope: !219)
!225 = !DILocation(line: 67, column: 27, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !1, line: 66, column: 38)
!227 = !DILocation(line: 67, column: 3, scope: !226)
!228 = !DILocation(line: 68, column: 14, scope: !226)
!229 = !DILocation(line: 68, column: 17, scope: !226)
!230 = !DILocation(line: 68, column: 3, scope: !226)
!231 = !DILocation(line: 69, column: 25, scope: !226)
!232 = !DILocation(line: 69, column: 28, scope: !226)
!233 = !DILocation(line: 69, column: 3, scope: !226)
!234 = !DILocation(line: 70, column: 2, scope: !226)
!235 = !DILocation(line: 66, column: 31, scope: !222)
!236 = !DILocation(line: 66, column: 2, scope: !222)
!237 = distinct !{!237, !224, !238}
!238 = !DILocation(line: 70, column: 2, scope: !219)
!239 = !DILocation(line: 72, column: 2, scope: !180)
