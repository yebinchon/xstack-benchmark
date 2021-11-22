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
  %h = alloca [3 x i64], align 16
  %k = alloca [3 x i64], align 16
  call void @llvm.dbg.value(metadata double %f, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %md, metadata !20, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64* %num, metadata !21, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64* %denom, metadata !22, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [3 x i64]* %h, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = bitcast [3 x i64]* %h to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i64]* @__const.rat_approx.h to i8*), i64 24, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata [3 x i64]* %k, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = bitcast [3 x i64]* %k to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([3 x i64]* @__const.rat_approx.k to i8*), i64 24, i1 false), !dbg !29
  call void @llvm.dbg.value(metadata i64 1, metadata !30, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 0, metadata !31, metadata !DIExpression()), !dbg !19
  %cmp = icmp sle i64 %md, 1, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !35, !cf.info !36

if.then:                                          ; preds = %entry
  store i64 1, i64* %denom, align 8, !dbg !37
  %conv = fptosi double %f to i64, !dbg !39
  store i64 %conv, i64* %num, align 8, !dbg !40
  br label %return, !dbg !41

if.end:                                           ; preds = %entry
  %cmp1 = fcmp olt double %f, 0.000000e+00, !dbg !42
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !44, !cf.info !36

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !31, metadata !DIExpression()), !dbg !19
  %fneg = fneg double %f, !dbg !45
  call void @llvm.dbg.value(metadata double %fneg, metadata !18, metadata !DIExpression()), !dbg !19
  br label %if.end4, !dbg !47

if.end4:                                          ; preds = %if.then3, %if.end
  %neg.0 = phi i32 [ 1, %if.then3 ], [ 0, %if.end ], !dbg !19
  %f.addr.0 = phi double [ %fneg, %if.then3 ], [ %f, %if.end ]
  call void @llvm.dbg.value(metadata double %f.addr.0, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 %neg.0, metadata !31, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !48

while.cond:                                       ; preds = %while.body, %if.end4
  %n.0 = phi i64 [ 1, %if.end4 ], [ %shl, %while.body ], !dbg !19
  %f.addr.1 = phi double [ %f.addr.0, %if.end4 ], [ %mul, %while.body ], !dbg !19
  call void @llvm.dbg.value(metadata double %f.addr.1, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.0, metadata !30, metadata !DIExpression()), !dbg !19
  %2 = call double @llvm.floor.f64(double %f.addr.1), !dbg !49
  %cmp5 = fcmp une double %f.addr.1, %2, !dbg !50
  br i1 %cmp5, label %while.body, label %while.end, !dbg !48

while.body:                                       ; preds = %while.cond
  %shl = shl i64 %n.0, 1, !dbg !51
  call void @llvm.dbg.value(metadata i64 %shl, metadata !30, metadata !DIExpression()), !dbg !19
  %mul = fmul double %f.addr.1, 2.000000e+00, !dbg !53
  call void @llvm.dbg.value(metadata double %mul, metadata !18, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !48, !llvm.loop !54

while.end:                                        ; preds = %while.cond
  %conv7 = fptosi double %f.addr.1 to i64, !dbg !56
  call void @llvm.dbg.value(metadata i64 %conv7, metadata !57, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 0, metadata !58, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %while.end
  %d.0 = phi i64 [ %conv7, %while.end ], [ %n.1, %for.inc ], !dbg !19
  %n.1 = phi i64 [ %n.0, %while.end ], [ %rem, %for.inc ], !dbg !19
  %i.0 = phi i32 [ 0, %while.end ], [ %inc, %for.inc ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !58, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !30, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !57, metadata !DIExpression()), !dbg !19
  %cmp8 = icmp slt i32 %i.0, 64, !dbg !62
  br i1 %cmp8, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %tobool = icmp ne i64 %n.1, 0, !dbg !65
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !65

cond.true:                                        ; preds = %for.body
  %div = sdiv i64 %d.0, %n.1, !dbg !67
  br label %cond.end, !dbg !65

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !65

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 0, %cond.false ], !dbg !65
  call void @llvm.dbg.value(metadata i64 %cond, metadata !68, metadata !DIExpression()), !dbg !19
  %tobool10 = icmp ne i32 %i.0, 0, !dbg !69
  br i1 %tobool10, label %land.lhs.true, label %if.end13, !dbg !71, !cf.info !36

land.lhs.true:                                    ; preds = %cond.end
  %tobool11 = icmp ne i64 %cond, 0, !dbg !72
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !73, !cf.info !36

if.then12:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !74

if.end13:                                         ; preds = %land.lhs.true, %cond.end
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !75, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !57, metadata !DIExpression()), !dbg !19
  %rem = srem i64 %d.0, %n.1, !dbg !76
  call void @llvm.dbg.value(metadata i64 %rem, metadata !30, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %cond, metadata !75, metadata !DIExpression()), !dbg !19
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !77
  %3 = load i64, i64* %arrayidx, align 8, !dbg !77
  %mul14 = mul nsw i64 %3, %cond, !dbg !79
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !80
  %4 = load i64, i64* %arrayidx15, align 16, !dbg !80
  %add = add nsw i64 %mul14, %4, !dbg !81
  %cmp16 = icmp sge i64 %add, %md, !dbg !82
  br i1 %cmp16, label %if.then18, label %if.end30, !dbg !83, !cf.info !36

if.then18:                                        ; preds = %if.end13
  %arrayidx19 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !84
  %5 = load i64, i64* %arrayidx19, align 16, !dbg !84
  %sub = sub nsw i64 %md, %5, !dbg !86
  %arrayidx20 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !87
  %6 = load i64, i64* %arrayidx20, align 8, !dbg !87
  %div21 = sdiv i64 %sub, %6, !dbg !88
  call void @llvm.dbg.value(metadata i64 %div21, metadata !75, metadata !DIExpression()), !dbg !19
  %mul22 = mul nsw i64 %div21, 2, !dbg !89
  %cmp23 = icmp sge i64 %mul22, %cond, !dbg !91
  br i1 %cmp23, label %if.then28, label %lor.lhs.false, !dbg !92, !cf.info !36

lor.lhs.false:                                    ; preds = %if.then18
  %arrayidx25 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !93
  %7 = load i64, i64* %arrayidx25, align 8, !dbg !93
  %cmp26 = icmp sge i64 %7, %md, !dbg !94
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !95, !cf.info !36

if.then28:                                        ; preds = %lor.lhs.false, %if.then18
  call void @llvm.dbg.value(metadata i32 65, metadata !58, metadata !DIExpression()), !dbg !19
  br label %if.end29, !dbg !96

if.else:                                          ; preds = %lor.lhs.false
  br label %for.end, !dbg !97

if.end29:                                         ; preds = %if.then28
  br label %if.end30, !dbg !98

if.end30:                                         ; preds = %if.end29, %if.end13
  %x.0 = phi i64 [ %div21, %if.end29 ], [ %cond, %if.end13 ], !dbg !99
  %i.1 = phi i32 [ 65, %if.end29 ], [ %i.0, %if.end13 ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !58, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %x.0, metadata !75, metadata !DIExpression()), !dbg !19
  %arrayidx31 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !100
  %8 = load i64, i64* %arrayidx31, align 8, !dbg !100
  %mul32 = mul nsw i64 %x.0, %8, !dbg !101
  %arrayidx33 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !102
  %9 = load i64, i64* %arrayidx33, align 16, !dbg !102
  %add34 = add nsw i64 %mul32, %9, !dbg !103
  %arrayidx35 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !104
  store i64 %add34, i64* %arrayidx35, align 16, !dbg !105
  %arrayidx36 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !106
  %10 = load i64, i64* %arrayidx36, align 8, !dbg !106
  %arrayidx37 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !107
  store i64 %10, i64* %arrayidx37, align 16, !dbg !108
  %arrayidx38 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !109
  %11 = load i64, i64* %arrayidx38, align 16, !dbg !109
  %arrayidx39 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !110
  store i64 %11, i64* %arrayidx39, align 8, !dbg !111
  %arrayidx40 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !112
  %12 = load i64, i64* %arrayidx40, align 8, !dbg !112
  %mul41 = mul nsw i64 %x.0, %12, !dbg !113
  %arrayidx42 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !114
  %13 = load i64, i64* %arrayidx42, align 16, !dbg !114
  %add43 = add nsw i64 %mul41, %13, !dbg !115
  %arrayidx44 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !116
  store i64 %add43, i64* %arrayidx44, align 16, !dbg !117
  %arrayidx45 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !118
  %14 = load i64, i64* %arrayidx45, align 8, !dbg !118
  %arrayidx46 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !119
  store i64 %14, i64* %arrayidx46, align 16, !dbg !120
  %arrayidx47 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !121
  %15 = load i64, i64* %arrayidx47, align 16, !dbg !121
  %arrayidx48 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !122
  store i64 %15, i64* %arrayidx48, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %if.end30
  %inc = add nsw i32 %i.1, 1, !dbg !125
  call void @llvm.dbg.value(metadata i32 %inc, metadata !58, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %if.else, %if.then12, %for.cond
  %arrayidx49 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !129
  %16 = load i64, i64* %arrayidx49, align 8, !dbg !129
  store i64 %16, i64* %denom, align 8, !dbg !130
  %tobool50 = icmp ne i32 %neg.0, 0, !dbg !131
  br i1 %tobool50, label %cond.true51, label %cond.false54, !dbg !131

cond.true51:                                      ; preds = %for.end
  %arrayidx52 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !132
  %17 = load i64, i64* %arrayidx52, align 8, !dbg !132
  %sub53 = sub nsw i64 0, %17, !dbg !133
  br label %cond.end56, !dbg !131

cond.false54:                                     ; preds = %for.end
  %arrayidx55 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !134
  %18 = load i64, i64* %arrayidx55, align 8, !dbg !134
  br label %cond.end56, !dbg !131

cond.end56:                                       ; preds = %cond.false54, %cond.true51
  %cond57 = phi i64 [ %sub53, %cond.true51 ], [ %18, %cond.false54 ], !dbg !131
  store i64 %cond57, i64* %num, align 8, !dbg !135
  br label %return, !dbg !136

return:                                           ; preds = %cond.end56, %if.then
  ret void, !dbg !136
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !137 {
entry:
  %d = alloca i64, align 8
  %n = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %d, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %n, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.value(metadata double 0x3FC2492492492492, metadata !144, metadata !DIExpression()), !dbg !145
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 0x3FC2492492492492), !dbg !146
  call void @llvm.dbg.value(metadata i32 1, metadata !147, metadata !DIExpression()), !dbg !145
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %mul, %for.inc ], !dbg !150
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !147, metadata !DIExpression()), !dbg !145
  %cmp = icmp sle i32 %i.0, 20000000, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %i.0), !dbg !154
  %conv = sext i32 %i.0 to i64, !dbg !156
  call void @rat_approx(double 0x3FC2492492492492, i64 %conv, i64* %n, i64* %d), !dbg !157
  %0 = load i64, i64* %n, align 8, !dbg !158
  %1 = load i64, i64* %d, align 8, !dbg !159
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %0, i64 %1), !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %mul = mul nsw i32 %i.0, 16, !dbg !162
  call void @llvm.dbg.value(metadata i32 %mul, metadata !147, metadata !DIExpression()), !dbg !145
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %call3 = call double @atan2(double 1.000000e+00, double 1.000000e+00) #5, !dbg !166
  %mul4 = fmul double %call3, 4.000000e+00, !dbg !167
  call void @llvm.dbg.value(metadata double %mul4, metadata !144, metadata !DIExpression()), !dbg !145
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %mul4), !dbg !168
  call void @llvm.dbg.value(metadata i32 1, metadata !147, metadata !DIExpression()), !dbg !145
  br label %for.cond6, !dbg !169

for.cond6:                                        ; preds = %for.inc13, %for.end
  %i.1 = phi i32 [ 1, %for.end ], [ %mul14, %for.inc13 ], !dbg !171
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !147, metadata !DIExpression()), !dbg !145
  %cmp7 = icmp sle i32 %i.1, 20000000, !dbg !172
  br i1 %cmp7, label %for.body9, label %for.end15, !dbg !174

for.body9:                                        ; preds = %for.cond6
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %i.1), !dbg !175
  %conv11 = sext i32 %i.1 to i64, !dbg !177
  call void @rat_approx(double %mul4, i64 %conv11, i64* %n, i64* %d), !dbg !178
  %2 = load i64, i64* %n, align 8, !dbg !179
  %3 = load i64, i64* %d, align 8, !dbg !180
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %2, i64 %3), !dbg !181
  br label %for.inc13, !dbg !182

for.inc13:                                        ; preds = %for.body9
  %mul14 = mul nsw i32 %i.1, 16, !dbg !183
  call void @llvm.dbg.value(metadata i32 %mul14, metadata !147, metadata !DIExpression()), !dbg !145
  br label %for.cond6, !dbg !184, !llvm.loop !185

for.end15:                                        ; preds = %for.cond6
  ret i32 0, !dbg !187
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!19 = !DILocation(line: 0, scope: !13)
!20 = !DILocalVariable(name: "md", arg: 2, scope: !13, file: !1, line: 15, type: !4)
!21 = !DILocalVariable(name: "num", arg: 3, scope: !13, file: !1, line: 15, type: !17)
!22 = !DILocalVariable(name: "denom", arg: 4, scope: !13, file: !1, line: 15, type: !17)
!23 = !DILocalVariable(name: "h", scope: !13, file: !1, line: 18, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 3)
!27 = !DILocation(line: 18, column: 13, scope: !13)
!28 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 18, type: !24)
!29 = !DILocation(line: 18, column: 33, scope: !13)
!30 = !DILocalVariable(name: "n", scope: !13, file: !1, line: 19, type: !4)
!31 = !DILocalVariable(name: "neg", scope: !13, file: !1, line: 20, type: !32)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DILocation(line: 22, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !1, line: 22, column: 6)
!35 = !DILocation(line: 22, column: 6, scope: !13)
!36 = !{!"if"}
!37 = !DILocation(line: 22, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 22, column: 15)
!39 = !DILocation(line: 22, column: 36, scope: !38)
!40 = !DILocation(line: 22, column: 34, scope: !38)
!41 = !DILocation(line: 22, column: 49, scope: !38)
!42 = !DILocation(line: 24, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !13, file: !1, line: 24, column: 6)
!44 = !DILocation(line: 24, column: 6, scope: !13)
!45 = !DILocation(line: 24, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 24, column: 13)
!47 = !DILocation(line: 24, column: 32, scope: !46)
!48 = !DILocation(line: 26, column: 2, scope: !13)
!49 = !DILocation(line: 26, column: 14, scope: !13)
!50 = !DILocation(line: 26, column: 11, scope: !13)
!51 = !DILocation(line: 26, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 24)
!53 = !DILocation(line: 26, column: 37, scope: !52)
!54 = distinct !{!54, !48, !55}
!55 = !DILocation(line: 26, column: 43, scope: !13)
!56 = !DILocation(line: 27, column: 6, scope: !13)
!57 = !DILocalVariable(name: "d", scope: !13, file: !1, line: 19, type: !4)
!58 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 20, type: !32)
!59 = !DILocation(line: 30, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !13, file: !1, line: 30, column: 2)
!61 = !DILocation(line: 0, scope: !60)
!62 = !DILocation(line: 30, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 30, column: 2)
!64 = !DILocation(line: 30, column: 2, scope: !60)
!65 = !DILocation(line: 31, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 30, column: 27)
!67 = !DILocation(line: 31, column: 13, scope: !66)
!68 = !DILocalVariable(name: "a", scope: !13, file: !1, line: 18, type: !4)
!69 = !DILocation(line: 32, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 32, column: 7)
!71 = !DILocation(line: 32, column: 9, scope: !70)
!72 = !DILocation(line: 32, column: 13, scope: !70)
!73 = !DILocation(line: 32, column: 7, scope: !66)
!74 = !DILocation(line: 32, column: 16, scope: !70)
!75 = !DILocalVariable(name: "x", scope: !13, file: !1, line: 19, type: !4)
!76 = !DILocation(line: 34, column: 23, scope: !66)
!77 = !DILocation(line: 37, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !66, file: !1, line: 37, column: 7)
!79 = !DILocation(line: 37, column: 12, scope: !78)
!80 = !DILocation(line: 37, column: 18, scope: !78)
!81 = !DILocation(line: 37, column: 16, scope: !78)
!82 = !DILocation(line: 37, column: 23, scope: !78)
!83 = !DILocation(line: 37, column: 7, scope: !66)
!84 = !DILocation(line: 38, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !1, line: 37, column: 30)
!86 = !DILocation(line: 38, column: 12, scope: !85)
!87 = !DILocation(line: 38, column: 22, scope: !85)
!88 = !DILocation(line: 38, column: 20, scope: !85)
!89 = !DILocation(line: 39, column: 10, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 39, column: 8)
!91 = !DILocation(line: 39, column: 14, scope: !90)
!92 = !DILocation(line: 39, column: 19, scope: !90)
!93 = !DILocation(line: 39, column: 22, scope: !90)
!94 = !DILocation(line: 39, column: 27, scope: !90)
!95 = !DILocation(line: 39, column: 8, scope: !85)
!96 = !DILocation(line: 40, column: 5, scope: !90)
!97 = !DILocation(line: 42, column: 5, scope: !90)
!98 = !DILocation(line: 43, column: 3, scope: !85)
!99 = !DILocation(line: 0, scope: !66)
!100 = !DILocation(line: 45, column: 14, scope: !66)
!101 = !DILocation(line: 45, column: 12, scope: !66)
!102 = !DILocation(line: 45, column: 21, scope: !66)
!103 = !DILocation(line: 45, column: 19, scope: !66)
!104 = !DILocation(line: 45, column: 3, scope: !66)
!105 = !DILocation(line: 45, column: 8, scope: !66)
!106 = !DILocation(line: 45, column: 34, scope: !66)
!107 = !DILocation(line: 45, column: 27, scope: !66)
!108 = !DILocation(line: 45, column: 32, scope: !66)
!109 = !DILocation(line: 45, column: 47, scope: !66)
!110 = !DILocation(line: 45, column: 40, scope: !66)
!111 = !DILocation(line: 45, column: 45, scope: !66)
!112 = !DILocation(line: 46, column: 14, scope: !66)
!113 = !DILocation(line: 46, column: 12, scope: !66)
!114 = !DILocation(line: 46, column: 21, scope: !66)
!115 = !DILocation(line: 46, column: 19, scope: !66)
!116 = !DILocation(line: 46, column: 3, scope: !66)
!117 = !DILocation(line: 46, column: 8, scope: !66)
!118 = !DILocation(line: 46, column: 34, scope: !66)
!119 = !DILocation(line: 46, column: 27, scope: !66)
!120 = !DILocation(line: 46, column: 32, scope: !66)
!121 = !DILocation(line: 46, column: 47, scope: !66)
!122 = !DILocation(line: 46, column: 40, scope: !66)
!123 = !DILocation(line: 46, column: 45, scope: !66)
!124 = !DILocation(line: 47, column: 2, scope: !66)
!125 = !DILocation(line: 30, column: 23, scope: !63)
!126 = !DILocation(line: 30, column: 2, scope: !63)
!127 = distinct !{!127, !64, !128}
!128 = !DILocation(line: 47, column: 2, scope: !60)
!129 = !DILocation(line: 48, column: 11, scope: !13)
!130 = !DILocation(line: 48, column: 9, scope: !13)
!131 = !DILocation(line: 49, column: 9, scope: !13)
!132 = !DILocation(line: 49, column: 16, scope: !13)
!133 = !DILocation(line: 49, column: 15, scope: !13)
!134 = !DILocation(line: 49, column: 23, scope: !13)
!135 = !DILocation(line: 49, column: 7, scope: !13)
!136 = !DILocation(line: 50, column: 1, scope: !13)
!137 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 52, type: !138, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DISubroutineType(types: !139)
!139 = !{!32}
!140 = !DILocalVariable(name: "d", scope: !137, file: !1, line: 55, type: !4)
!141 = !DILocation(line: 55, column: 10, scope: !137)
!142 = !DILocalVariable(name: "n", scope: !137, file: !1, line: 55, type: !4)
!143 = !DILocation(line: 55, column: 13, scope: !137)
!144 = !DILocalVariable(name: "f", scope: !137, file: !1, line: 56, type: !16)
!145 = !DILocation(line: 0, scope: !137)
!146 = !DILocation(line: 58, column: 2, scope: !137)
!147 = !DILocalVariable(name: "i", scope: !137, file: !1, line: 54, type: !32)
!148 = !DILocation(line: 59, column: 7, scope: !149)
!149 = distinct !DILexicalBlock(scope: !137, file: !1, line: 59, column: 2)
!150 = !DILocation(line: 0, scope: !149)
!151 = !DILocation(line: 59, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !1, line: 59, column: 2)
!153 = !DILocation(line: 59, column: 2, scope: !149)
!154 = !DILocation(line: 60, column: 3, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 59, column: 38)
!156 = !DILocation(line: 61, column: 17, scope: !155)
!157 = !DILocation(line: 61, column: 3, scope: !155)
!158 = !DILocation(line: 62, column: 25, scope: !155)
!159 = !DILocation(line: 62, column: 28, scope: !155)
!160 = !DILocation(line: 62, column: 3, scope: !155)
!161 = !DILocation(line: 63, column: 2, scope: !155)
!162 = !DILocation(line: 59, column: 31, scope: !152)
!163 = !DILocation(line: 59, column: 2, scope: !152)
!164 = distinct !{!164, !153, !165}
!165 = !DILocation(line: 63, column: 2, scope: !149)
!166 = !DILocation(line: 65, column: 32, scope: !137)
!167 = !DILocation(line: 65, column: 43, scope: !137)
!168 = !DILocation(line: 65, column: 2, scope: !137)
!169 = !DILocation(line: 66, column: 7, scope: !170)
!170 = distinct !DILexicalBlock(scope: !137, file: !1, line: 66, column: 2)
!171 = !DILocation(line: 0, scope: !170)
!172 = !DILocation(line: 66, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !1, line: 66, column: 2)
!174 = !DILocation(line: 66, column: 2, scope: !170)
!175 = !DILocation(line: 67, column: 3, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !1, line: 66, column: 38)
!177 = !DILocation(line: 68, column: 17, scope: !176)
!178 = !DILocation(line: 68, column: 3, scope: !176)
!179 = !DILocation(line: 69, column: 25, scope: !176)
!180 = !DILocation(line: 69, column: 28, scope: !176)
!181 = !DILocation(line: 69, column: 3, scope: !176)
!182 = !DILocation(line: 70, column: 2, scope: !176)
!183 = !DILocation(line: 66, column: 31, scope: !173)
!184 = !DILocation(line: 66, column: 2, scope: !173)
!185 = distinct !{!185, !174, !186}
!186 = !DILocation(line: 70, column: 2, scope: !170)
!187 = !DILocation(line: 72, column: 2, scope: !137)
