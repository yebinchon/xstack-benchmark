; ModuleID = 'convert-decimal-number-to-rational-1.c'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !49, !cf.info !50

if.then:                                          ; preds = %entry
  %3 = load i64*, i64** %denom.addr, align 8, !dbg !51
  store i64 1, i64* %3, align 8, !dbg !53
  %4 = load double, double* %f.addr, align 8, !dbg !54
  %conv = fptosi double %4 to i64, !dbg !55
  %5 = load i64*, i64** %num.addr, align 8, !dbg !56
  store i64 %conv, i64* %5, align 8, !dbg !57
  br label %return, !dbg !58

if.end:                                           ; preds = %entry
  %6 = load double, double* %f.addr, align 8, !dbg !59
  %cmp1 = fcmp olt double %6, 0.000000e+00, !dbg !61
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !62, !cf.info !50

if.then3:                                         ; preds = %if.end
  store i32 1, i32* %neg, align 4, !dbg !63
  %7 = load double, double* %f.addr, align 8, !dbg !65
  %fneg = fneg double %7, !dbg !66
  store double %fneg, double* %f.addr, align 8, !dbg !67
  br label %if.end4, !dbg !68

if.end4:                                          ; preds = %if.then3, %if.end
  br label %while.cond, !dbg !69

while.cond:                                       ; preds = %while.body, %if.end4
  %8 = load double, double* %f.addr, align 8, !dbg !70
  %9 = load double, double* %f.addr, align 8, !dbg !71
  %10 = call double @llvm.floor.f64(double %9), !dbg !72
  %cmp5 = fcmp une double %8, %10, !dbg !73
  br i1 %cmp5, label %while.body, label %while.end, !dbg !69

while.body:                                       ; preds = %while.cond
  %11 = load i64, i64* %n, align 8, !dbg !74
  %shl = shl i64 %11, 1, !dbg !74
  store i64 %shl, i64* %n, align 8, !dbg !74
  %12 = load double, double* %f.addr, align 8, !dbg !76
  %mul = fmul double %12, 2.000000e+00, !dbg !76
  store double %mul, double* %f.addr, align 8, !dbg !76
  br label %while.cond, !dbg !69, !llvm.loop !77

while.end:                                        ; preds = %while.cond
  %13 = load double, double* %f.addr, align 8, !dbg !79
  %conv7 = fptosi double %13 to i64, !dbg !79
  store i64 %conv7, i64* %d, align 8, !dbg !80
  store i32 0, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %while.end
  %14 = load i32, i32* %i, align 4, !dbg !84
  %cmp8 = icmp slt i32 %14, 64, !dbg !86
  br i1 %cmp8, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %15 = load i64, i64* %n, align 8, !dbg !88
  %tobool = icmp ne i64 %15, 0, !dbg !88
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !88

cond.true:                                        ; preds = %for.body
  %16 = load i64, i64* %d, align 8, !dbg !90
  %17 = load i64, i64* %n, align 8, !dbg !91
  %div = sdiv i64 %16, %17, !dbg !92
  br label %cond.end, !dbg !88

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !88

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 0, %cond.false ], !dbg !88
  store i64 %cond, i64* %a, align 8, !dbg !93
  %18 = load i32, i32* %i, align 4, !dbg !94
  %tobool10 = icmp ne i32 %18, 0, !dbg !94
  br i1 %tobool10, label %land.lhs.true, label %if.end13, !dbg !96, !cf.info !50

land.lhs.true:                                    ; preds = %cond.end
  %19 = load i64, i64* %a, align 8, !dbg !97
  %tobool11 = icmp ne i64 %19, 0, !dbg !97
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !98, !cf.info !50

if.then12:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !99

if.end13:                                         ; preds = %land.lhs.true, %cond.end
  %20 = load i64, i64* %d, align 8, !dbg !100
  store i64 %20, i64* %x, align 8, !dbg !101
  %21 = load i64, i64* %n, align 8, !dbg !102
  store i64 %21, i64* %d, align 8, !dbg !103
  %22 = load i64, i64* %x, align 8, !dbg !104
  %23 = load i64, i64* %n, align 8, !dbg !105
  %rem = srem i64 %22, %23, !dbg !106
  store i64 %rem, i64* %n, align 8, !dbg !107
  %24 = load i64, i64* %a, align 8, !dbg !108
  store i64 %24, i64* %x, align 8, !dbg !109
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !110
  %25 = load i64, i64* %arrayidx, align 8, !dbg !110
  %26 = load i64, i64* %a, align 8, !dbg !112
  %mul14 = mul nsw i64 %25, %26, !dbg !113
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !114
  %27 = load i64, i64* %arrayidx15, align 16, !dbg !114
  %add = add nsw i64 %mul14, %27, !dbg !115
  %28 = load i64, i64* %md.addr, align 8, !dbg !116
  %cmp16 = icmp sge i64 %add, %28, !dbg !117
  br i1 %cmp16, label %if.then18, label %if.end30, !dbg !118, !cf.info !50

if.then18:                                        ; preds = %if.end13
  %29 = load i64, i64* %md.addr, align 8, !dbg !119
  %arrayidx19 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !121
  %30 = load i64, i64* %arrayidx19, align 16, !dbg !121
  %sub = sub nsw i64 %29, %30, !dbg !122
  %arrayidx20 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !123
  %31 = load i64, i64* %arrayidx20, align 8, !dbg !123
  %div21 = sdiv i64 %sub, %31, !dbg !124
  store i64 %div21, i64* %x, align 8, !dbg !125
  %32 = load i64, i64* %x, align 8, !dbg !126
  %mul22 = mul nsw i64 %32, 2, !dbg !128
  %33 = load i64, i64* %a, align 8, !dbg !129
  %cmp23 = icmp sge i64 %mul22, %33, !dbg !130
  br i1 %cmp23, label %if.then28, label %lor.lhs.false, !dbg !131, !cf.info !50

lor.lhs.false:                                    ; preds = %if.then18
  %arrayidx25 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !132
  %34 = load i64, i64* %arrayidx25, align 8, !dbg !132
  %35 = load i64, i64* %md.addr, align 8, !dbg !133
  %cmp26 = icmp sge i64 %34, %35, !dbg !134
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !135, !cf.info !50

if.then28:                                        ; preds = %lor.lhs.false, %if.then18
  store i32 65, i32* %i, align 4, !dbg !136
  br label %if.end29, !dbg !137

if.else:                                          ; preds = %lor.lhs.false
  br label %for.end, !dbg !138

if.end29:                                         ; preds = %if.then28
  br label %if.end30, !dbg !139

if.end30:                                         ; preds = %if.end29, %if.end13
  %36 = load i64, i64* %x, align 8, !dbg !140
  %arrayidx31 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !141
  %37 = load i64, i64* %arrayidx31, align 8, !dbg !141
  %mul32 = mul nsw i64 %36, %37, !dbg !142
  %arrayidx33 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !143
  %38 = load i64, i64* %arrayidx33, align 16, !dbg !143
  %add34 = add nsw i64 %mul32, %38, !dbg !144
  %arrayidx35 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !145
  store i64 %add34, i64* %arrayidx35, align 16, !dbg !146
  %arrayidx36 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !147
  %39 = load i64, i64* %arrayidx36, align 8, !dbg !147
  %arrayidx37 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !148
  store i64 %39, i64* %arrayidx37, align 16, !dbg !149
  %arrayidx38 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !150
  %40 = load i64, i64* %arrayidx38, align 16, !dbg !150
  %arrayidx39 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !151
  store i64 %40, i64* %arrayidx39, align 8, !dbg !152
  %41 = load i64, i64* %x, align 8, !dbg !153
  %arrayidx40 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !154
  %42 = load i64, i64* %arrayidx40, align 8, !dbg !154
  %mul41 = mul nsw i64 %41, %42, !dbg !155
  %arrayidx42 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !156
  %43 = load i64, i64* %arrayidx42, align 16, !dbg !156
  %add43 = add nsw i64 %mul41, %43, !dbg !157
  %arrayidx44 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !158
  store i64 %add43, i64* %arrayidx44, align 16, !dbg !159
  %arrayidx45 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !160
  %44 = load i64, i64* %arrayidx45, align 8, !dbg !160
  %arrayidx46 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !161
  store i64 %44, i64* %arrayidx46, align 16, !dbg !162
  %arrayidx47 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !163
  %45 = load i64, i64* %arrayidx47, align 16, !dbg !163
  %arrayidx48 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !164
  store i64 %45, i64* %arrayidx48, align 8, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %if.end30
  %46 = load i32, i32* %i, align 4, !dbg !167
  %inc = add nsw i32 %46, 1, !dbg !167
  store i32 %inc, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %if.else, %if.then12, %for.cond
  %arrayidx49 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !171
  %47 = load i64, i64* %arrayidx49, align 8, !dbg !171
  %48 = load i64*, i64** %denom.addr, align 8, !dbg !172
  store i64 %47, i64* %48, align 8, !dbg !173
  %49 = load i32, i32* %neg, align 4, !dbg !174
  %tobool50 = icmp ne i32 %49, 0, !dbg !174
  br i1 %tobool50, label %cond.true51, label %cond.false54, !dbg !174

cond.true51:                                      ; preds = %for.end
  %arrayidx52 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !175
  %50 = load i64, i64* %arrayidx52, align 8, !dbg !175
  %sub53 = sub nsw i64 0, %50, !dbg !176
  br label %cond.end56, !dbg !174

cond.false54:                                     ; preds = %for.end
  %arrayidx55 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !177
  %51 = load i64, i64* %arrayidx55, align 8, !dbg !177
  br label %cond.end56, !dbg !174

cond.end56:                                       ; preds = %cond.false54, %cond.true51
  %cond57 = phi i64 [ %sub53, %cond.true51 ], [ %51, %cond.false54 ], !dbg !174
  %52 = load i64*, i64** %num.addr, align 8, !dbg !178
  store i64 %cond57, i64* %52, align 8, !dbg !179
  br label %return, !dbg !180

return:                                           ; preds = %cond.end56, %if.then
  ret void, !dbg !180
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !181 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %d = alloca i64, align 8
  %n = alloca i64, align 8
  %f = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %d, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i64* %n, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata double* %f, metadata !190, metadata !DIExpression()), !dbg !191
  store double 0x3FC2492492492492, double* %f, align 8, !dbg !192
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 0x3FC2492492492492), !dbg !193
  store i32 1, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !197
  %cmp = icmp sle i32 %0, 20000000, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !201
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %1), !dbg !203
  %2 = load double, double* %f, align 8, !dbg !204
  %3 = load i32, i32* %i, align 4, !dbg !205
  %conv = sext i32 %3 to i64, !dbg !205
  call void @rat_approx(double %2, i64 %conv, i64* %n, i64* %d), !dbg !206
  %4 = load i64, i64* %n, align 8, !dbg !207
  %5 = load i64, i64* %d, align 8, !dbg !208
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %4, i64 %5), !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !211
  %mul = mul nsw i32 %6, 16, !dbg !211
  store i32 %mul, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  %call3 = call double @atan2(double 1.000000e+00, double 1.000000e+00) #5, !dbg !215
  %mul4 = fmul double %call3, 4.000000e+00, !dbg !216
  store double %mul4, double* %f, align 8, !dbg !217
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %mul4), !dbg !218
  store i32 1, i32* %i, align 4, !dbg !219
  br label %for.cond6, !dbg !221

for.cond6:                                        ; preds = %for.inc13, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !222
  %cmp7 = icmp sle i32 %7, 20000000, !dbg !224
  br i1 %cmp7, label %for.body9, label %for.end15, !dbg !225

for.body9:                                        ; preds = %for.cond6
  %8 = load i32, i32* %i, align 4, !dbg !226
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %8), !dbg !228
  %9 = load double, double* %f, align 8, !dbg !229
  %10 = load i32, i32* %i, align 4, !dbg !230
  %conv11 = sext i32 %10 to i64, !dbg !230
  call void @rat_approx(double %9, i64 %conv11, i64* %n, i64* %d), !dbg !231
  %11 = load i64, i64* %n, align 8, !dbg !232
  %12 = load i64, i64* %d, align 8, !dbg !233
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %11, i64 %12), !dbg !234
  br label %for.inc13, !dbg !235

for.inc13:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !236
  %mul14 = mul nsw i32 %13, 16, !dbg !236
  store i32 %mul14, i32* %i, align 4, !dbg !236
  br label %for.cond6, !dbg !237, !llvm.loop !238

for.end15:                                        ; preds = %for.cond6
  ret i32 0, !dbg !240
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
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
!12 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!50 = !{!"if"}
!51 = !DILocation(line: 22, column: 18, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 22, column: 15)
!53 = !DILocation(line: 22, column: 24, scope: !52)
!54 = !DILocation(line: 22, column: 46, scope: !52)
!55 = !DILocation(line: 22, column: 36, scope: !52)
!56 = !DILocation(line: 22, column: 30, scope: !52)
!57 = !DILocation(line: 22, column: 34, scope: !52)
!58 = !DILocation(line: 22, column: 49, scope: !52)
!59 = !DILocation(line: 24, column: 6, scope: !60)
!60 = distinct !DILexicalBlock(scope: !13, file: !1, line: 24, column: 6)
!61 = !DILocation(line: 24, column: 8, scope: !60)
!62 = !DILocation(line: 24, column: 6, scope: !13)
!63 = !DILocation(line: 24, column: 19, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 24, column: 13)
!65 = !DILocation(line: 24, column: 29, scope: !64)
!66 = !DILocation(line: 24, column: 28, scope: !64)
!67 = !DILocation(line: 24, column: 26, scope: !64)
!68 = !DILocation(line: 24, column: 32, scope: !64)
!69 = !DILocation(line: 26, column: 2, scope: !13)
!70 = !DILocation(line: 26, column: 9, scope: !13)
!71 = !DILocation(line: 26, column: 20, scope: !13)
!72 = !DILocation(line: 26, column: 14, scope: !13)
!73 = !DILocation(line: 26, column: 11, scope: !13)
!74 = !DILocation(line: 26, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 24)
!76 = !DILocation(line: 26, column: 37, scope: !75)
!77 = distinct !{!77, !69, !78}
!78 = !DILocation(line: 26, column: 43, scope: !13)
!79 = !DILocation(line: 27, column: 6, scope: !13)
!80 = !DILocation(line: 27, column: 4, scope: !13)
!81 = !DILocation(line: 30, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !13, file: !1, line: 30, column: 2)
!83 = !DILocation(line: 30, column: 7, scope: !82)
!84 = !DILocation(line: 30, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 30, column: 2)
!86 = !DILocation(line: 30, column: 16, scope: !85)
!87 = !DILocation(line: 30, column: 2, scope: !82)
!88 = !DILocation(line: 31, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 30, column: 27)
!90 = !DILocation(line: 31, column: 11, scope: !89)
!91 = !DILocation(line: 31, column: 15, scope: !89)
!92 = !DILocation(line: 31, column: 13, scope: !89)
!93 = !DILocation(line: 31, column: 5, scope: !89)
!94 = !DILocation(line: 32, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !1, line: 32, column: 7)
!96 = !DILocation(line: 32, column: 9, scope: !95)
!97 = !DILocation(line: 32, column: 13, scope: !95)
!98 = !DILocation(line: 32, column: 7, scope: !89)
!99 = !DILocation(line: 32, column: 16, scope: !95)
!100 = !DILocation(line: 34, column: 7, scope: !89)
!101 = !DILocation(line: 34, column: 5, scope: !89)
!102 = !DILocation(line: 34, column: 14, scope: !89)
!103 = !DILocation(line: 34, column: 12, scope: !89)
!104 = !DILocation(line: 34, column: 21, scope: !89)
!105 = !DILocation(line: 34, column: 25, scope: !89)
!106 = !DILocation(line: 34, column: 23, scope: !89)
!107 = !DILocation(line: 34, column: 19, scope: !89)
!108 = !DILocation(line: 36, column: 7, scope: !89)
!109 = !DILocation(line: 36, column: 5, scope: !89)
!110 = !DILocation(line: 37, column: 7, scope: !111)
!111 = distinct !DILexicalBlock(scope: !89, file: !1, line: 37, column: 7)
!112 = !DILocation(line: 37, column: 14, scope: !111)
!113 = !DILocation(line: 37, column: 12, scope: !111)
!114 = !DILocation(line: 37, column: 18, scope: !111)
!115 = !DILocation(line: 37, column: 16, scope: !111)
!116 = !DILocation(line: 37, column: 26, scope: !111)
!117 = !DILocation(line: 37, column: 23, scope: !111)
!118 = !DILocation(line: 37, column: 7, scope: !89)
!119 = !DILocation(line: 38, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !1, line: 37, column: 30)
!121 = !DILocation(line: 38, column: 14, scope: !120)
!122 = !DILocation(line: 38, column: 12, scope: !120)
!123 = !DILocation(line: 38, column: 22, scope: !120)
!124 = !DILocation(line: 38, column: 20, scope: !120)
!125 = !DILocation(line: 38, column: 6, scope: !120)
!126 = !DILocation(line: 39, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !1, line: 39, column: 8)
!128 = !DILocation(line: 39, column: 10, scope: !127)
!129 = !DILocation(line: 39, column: 17, scope: !127)
!130 = !DILocation(line: 39, column: 14, scope: !127)
!131 = !DILocation(line: 39, column: 19, scope: !127)
!132 = !DILocation(line: 39, column: 22, scope: !127)
!133 = !DILocation(line: 39, column: 30, scope: !127)
!134 = !DILocation(line: 39, column: 27, scope: !127)
!135 = !DILocation(line: 39, column: 8, scope: !120)
!136 = !DILocation(line: 40, column: 7, scope: !127)
!137 = !DILocation(line: 40, column: 5, scope: !127)
!138 = !DILocation(line: 42, column: 5, scope: !127)
!139 = !DILocation(line: 43, column: 3, scope: !120)
!140 = !DILocation(line: 45, column: 10, scope: !89)
!141 = !DILocation(line: 45, column: 14, scope: !89)
!142 = !DILocation(line: 45, column: 12, scope: !89)
!143 = !DILocation(line: 45, column: 21, scope: !89)
!144 = !DILocation(line: 45, column: 19, scope: !89)
!145 = !DILocation(line: 45, column: 3, scope: !89)
!146 = !DILocation(line: 45, column: 8, scope: !89)
!147 = !DILocation(line: 45, column: 34, scope: !89)
!148 = !DILocation(line: 45, column: 27, scope: !89)
!149 = !DILocation(line: 45, column: 32, scope: !89)
!150 = !DILocation(line: 45, column: 47, scope: !89)
!151 = !DILocation(line: 45, column: 40, scope: !89)
!152 = !DILocation(line: 45, column: 45, scope: !89)
!153 = !DILocation(line: 46, column: 10, scope: !89)
!154 = !DILocation(line: 46, column: 14, scope: !89)
!155 = !DILocation(line: 46, column: 12, scope: !89)
!156 = !DILocation(line: 46, column: 21, scope: !89)
!157 = !DILocation(line: 46, column: 19, scope: !89)
!158 = !DILocation(line: 46, column: 3, scope: !89)
!159 = !DILocation(line: 46, column: 8, scope: !89)
!160 = !DILocation(line: 46, column: 34, scope: !89)
!161 = !DILocation(line: 46, column: 27, scope: !89)
!162 = !DILocation(line: 46, column: 32, scope: !89)
!163 = !DILocation(line: 46, column: 47, scope: !89)
!164 = !DILocation(line: 46, column: 40, scope: !89)
!165 = !DILocation(line: 46, column: 45, scope: !89)
!166 = !DILocation(line: 47, column: 2, scope: !89)
!167 = !DILocation(line: 30, column: 23, scope: !85)
!168 = !DILocation(line: 30, column: 2, scope: !85)
!169 = distinct !{!169, !87, !170}
!170 = !DILocation(line: 47, column: 2, scope: !82)
!171 = !DILocation(line: 48, column: 11, scope: !13)
!172 = !DILocation(line: 48, column: 3, scope: !13)
!173 = !DILocation(line: 48, column: 9, scope: !13)
!174 = !DILocation(line: 49, column: 9, scope: !13)
!175 = !DILocation(line: 49, column: 16, scope: !13)
!176 = !DILocation(line: 49, column: 15, scope: !13)
!177 = !DILocation(line: 49, column: 23, scope: !13)
!178 = !DILocation(line: 49, column: 3, scope: !13)
!179 = !DILocation(line: 49, column: 7, scope: !13)
!180 = !DILocation(line: 50, column: 1, scope: !13)
!181 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 52, type: !182, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!182 = !DISubroutineType(types: !183)
!183 = !{!42}
!184 = !DILocalVariable(name: "i", scope: !181, file: !1, line: 54, type: !42)
!185 = !DILocation(line: 54, column: 6, scope: !181)
!186 = !DILocalVariable(name: "d", scope: !181, file: !1, line: 55, type: !4)
!187 = !DILocation(line: 55, column: 10, scope: !181)
!188 = !DILocalVariable(name: "n", scope: !181, file: !1, line: 55, type: !4)
!189 = !DILocation(line: 55, column: 13, scope: !181)
!190 = !DILocalVariable(name: "f", scope: !181, file: !1, line: 56, type: !16)
!191 = !DILocation(line: 56, column: 9, scope: !181)
!192 = !DILocation(line: 58, column: 28, scope: !181)
!193 = !DILocation(line: 58, column: 2, scope: !181)
!194 = !DILocation(line: 59, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !181, file: !1, line: 59, column: 2)
!196 = !DILocation(line: 59, column: 7, scope: !195)
!197 = !DILocation(line: 59, column: 14, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !1, line: 59, column: 2)
!199 = !DILocation(line: 59, column: 16, scope: !198)
!200 = !DILocation(line: 59, column: 2, scope: !195)
!201 = !DILocation(line: 60, column: 27, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !1, line: 59, column: 38)
!203 = !DILocation(line: 60, column: 3, scope: !202)
!204 = !DILocation(line: 61, column: 14, scope: !202)
!205 = !DILocation(line: 61, column: 17, scope: !202)
!206 = !DILocation(line: 61, column: 3, scope: !202)
!207 = !DILocation(line: 62, column: 25, scope: !202)
!208 = !DILocation(line: 62, column: 28, scope: !202)
!209 = !DILocation(line: 62, column: 3, scope: !202)
!210 = !DILocation(line: 63, column: 2, scope: !202)
!211 = !DILocation(line: 59, column: 31, scope: !198)
!212 = !DILocation(line: 59, column: 2, scope: !198)
!213 = distinct !{!213, !200, !214}
!214 = !DILocation(line: 63, column: 2, scope: !195)
!215 = !DILocation(line: 65, column: 32, scope: !181)
!216 = !DILocation(line: 65, column: 43, scope: !181)
!217 = !DILocation(line: 65, column: 30, scope: !181)
!218 = !DILocation(line: 65, column: 2, scope: !181)
!219 = !DILocation(line: 66, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !181, file: !1, line: 66, column: 2)
!221 = !DILocation(line: 66, column: 7, scope: !220)
!222 = !DILocation(line: 66, column: 14, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !1, line: 66, column: 2)
!224 = !DILocation(line: 66, column: 16, scope: !223)
!225 = !DILocation(line: 66, column: 2, scope: !220)
!226 = !DILocation(line: 67, column: 27, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !1, line: 66, column: 38)
!228 = !DILocation(line: 67, column: 3, scope: !227)
!229 = !DILocation(line: 68, column: 14, scope: !227)
!230 = !DILocation(line: 68, column: 17, scope: !227)
!231 = !DILocation(line: 68, column: 3, scope: !227)
!232 = !DILocation(line: 69, column: 25, scope: !227)
!233 = !DILocation(line: 69, column: 28, scope: !227)
!234 = !DILocation(line: 69, column: 3, scope: !227)
!235 = !DILocation(line: 70, column: 2, scope: !227)
!236 = !DILocation(line: 66, column: 31, scope: !223)
!237 = !DILocation(line: 66, column: 2, scope: !223)
!238 = distinct !{!238, !225, !239}
!239 = !DILocation(line: 70, column: 2, scope: !220)
!240 = !DILocation(line: 72, column: 2, scope: !181)
