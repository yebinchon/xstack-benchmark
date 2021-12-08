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
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  store i64 1, i64* %denom, align 8, !dbg !36
  %conv = fptosi double %f to i64, !dbg !38
  store i64 %conv, i64* %num, align 8, !dbg !39
  br label %return, !dbg !40

if.end:                                           ; preds = %entry
  %cmp1 = fcmp olt double %f, 0.000000e+00, !dbg !41
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !43

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !31, metadata !DIExpression()), !dbg !19
  %fneg = fneg double %f, !dbg !44
  call void @llvm.dbg.value(metadata double %fneg, metadata !18, metadata !DIExpression()), !dbg !19
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.then3, %if.end
  %neg.0 = phi i32 [ 1, %if.then3 ], [ 0, %if.end ], !dbg !19
  %f.addr.0 = phi double [ %fneg, %if.then3 ], [ %f, %if.end ]
  call void @llvm.dbg.value(metadata double %f.addr.0, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 %neg.0, metadata !31, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !47

while.cond:                                       ; preds = %while.body, %if.end4
  %n.0 = phi i64 [ 1, %if.end4 ], [ %shl, %while.body ], !dbg !19
  %f.addr.1 = phi double [ %f.addr.0, %if.end4 ], [ %mul, %while.body ], !dbg !19
  call void @llvm.dbg.value(metadata double %f.addr.1, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.0, metadata !30, metadata !DIExpression()), !dbg !19
  %2 = call double @llvm.floor.f64(double %f.addr.1), !dbg !48
  %cmp5 = fcmp une double %f.addr.1, %2, !dbg !49
  br i1 %cmp5, label %while.body, label %while.end, !dbg !47

while.body:                                       ; preds = %while.cond
  %shl = shl i64 %n.0, 1, !dbg !50
  call void @llvm.dbg.value(metadata i64 %shl, metadata !30, metadata !DIExpression()), !dbg !19
  %mul = fmul double %f.addr.1, 2.000000e+00, !dbg !52
  call void @llvm.dbg.value(metadata double %mul, metadata !18, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !47, !llvm.loop !53

while.end:                                        ; preds = %while.cond
  %conv7 = fptosi double %f.addr.1 to i64, !dbg !55
  call void @llvm.dbg.value(metadata i64 %conv7, metadata !56, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i32 0, metadata !57, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %while.end
  %d.0 = phi i64 [ %conv7, %while.end ], [ %n.1, %for.inc ], !dbg !19
  %n.1 = phi i64 [ %n.0, %while.end ], [ %rem, %for.inc ], !dbg !19
  %i.0 = phi i32 [ 0, %while.end ], [ %inc, %for.inc ], !dbg !60
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !57, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !30, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !56, metadata !DIExpression()), !dbg !19
  %cmp8 = icmp slt i32 %i.0, 64, !dbg !61
  br i1 %cmp8, label %for.body, label %for.end.loopexit, !dbg !63

for.body:                                         ; preds = %for.cond
  %tobool = icmp ne i64 %n.1, 0, !dbg !64
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !64

cond.true:                                        ; preds = %for.body
  %div = sdiv i64 %d.0, %n.1, !dbg !66
  br label %cond.end, !dbg !64

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !64

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 0, %cond.false ], !dbg !64
  call void @llvm.dbg.value(metadata i64 %cond, metadata !67, metadata !DIExpression()), !dbg !19
  %tobool10 = icmp ne i32 %i.0, 0, !dbg !68
  br i1 %tobool10, label %land.lhs.true, label %if.end13, !dbg !70

land.lhs.true:                                    ; preds = %cond.end
  %tobool11 = icmp ne i64 %cond, 0, !dbg !71
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !72

if.then12:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !73

if.end13:                                         ; preds = %land.lhs.true, %cond.end
  call void @llvm.dbg.value(metadata i64 %d.0, metadata !74, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %n.1, metadata !56, metadata !DIExpression()), !dbg !19
  %rem = srem i64 %d.0, %n.1, !dbg !75
  call void @llvm.dbg.value(metadata i64 %rem, metadata !30, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %cond, metadata !74, metadata !DIExpression()), !dbg !19
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !76
  %3 = load i64, i64* %arrayidx, align 8, !dbg !76
  %mul14 = mul nsw i64 %3, %cond, !dbg !78
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !79
  %4 = load i64, i64* %arrayidx15, align 16, !dbg !79
  %add = add nsw i64 %mul14, %4, !dbg !80
  %cmp16 = icmp sge i64 %add, %md, !dbg !81
  br i1 %cmp16, label %if.then18, label %if.end30, !dbg !82

if.then18:                                        ; preds = %if.end13
  %arrayidx19 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !83
  %5 = load i64, i64* %arrayidx19, align 16, !dbg !83
  %sub = sub nsw i64 %md, %5, !dbg !85
  %arrayidx20 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !86
  %6 = load i64, i64* %arrayidx20, align 8, !dbg !86
  %div21 = sdiv i64 %sub, %6, !dbg !87
  call void @llvm.dbg.value(metadata i64 %div21, metadata !74, metadata !DIExpression()), !dbg !19
  %mul22 = mul nsw i64 %div21, 2, !dbg !88
  %cmp23 = icmp sge i64 %mul22, %cond, !dbg !90
  br i1 %cmp23, label %if.then28, label %lor.lhs.false, !dbg !91

lor.lhs.false:                                    ; preds = %if.then18
  %arrayidx25 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !92
  %7 = load i64, i64* %arrayidx25, align 8, !dbg !92
  %cmp26 = icmp sge i64 %7, %md, !dbg !93
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !94

if.then28:                                        ; preds = %lor.lhs.false, %if.then18
  call void @llvm.dbg.value(metadata i32 65, metadata !57, metadata !DIExpression()), !dbg !19
  br label %if.end29, !dbg !95

if.else:                                          ; preds = %lor.lhs.false
  br label %for.end, !dbg !96

if.end29:                                         ; preds = %if.then28
  br label %if.end30, !dbg !97

if.end30:                                         ; preds = %if.end29, %if.end13
  %x.0 = phi i64 [ %div21, %if.end29 ], [ %cond, %if.end13 ], !dbg !98
  %i.1 = phi i32 [ 65, %if.end29 ], [ %i.0, %if.end13 ], !dbg !60
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !57, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i64 %x.0, metadata !74, metadata !DIExpression()), !dbg !19
  %arrayidx31 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !99
  %8 = load i64, i64* %arrayidx31, align 8, !dbg !99
  %mul32 = mul nsw i64 %x.0, %8, !dbg !100
  %arrayidx33 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !101
  %9 = load i64, i64* %arrayidx33, align 16, !dbg !101
  %add34 = add nsw i64 %mul32, %9, !dbg !102
  %arrayidx35 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !103
  store i64 %add34, i64* %arrayidx35, align 16, !dbg !104
  %arrayidx36 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !105
  %10 = load i64, i64* %arrayidx36, align 8, !dbg !105
  %arrayidx37 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 0, !dbg !106
  store i64 %10, i64* %arrayidx37, align 16, !dbg !107
  %arrayidx38 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 2, !dbg !108
  %11 = load i64, i64* %arrayidx38, align 16, !dbg !108
  %arrayidx39 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !109
  store i64 %11, i64* %arrayidx39, align 8, !dbg !110
  %arrayidx40 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !111
  %12 = load i64, i64* %arrayidx40, align 8, !dbg !111
  %mul41 = mul nsw i64 %x.0, %12, !dbg !112
  %arrayidx42 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !113
  %13 = load i64, i64* %arrayidx42, align 16, !dbg !113
  %add43 = add nsw i64 %mul41, %13, !dbg !114
  %arrayidx44 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !115
  store i64 %add43, i64* %arrayidx44, align 16, !dbg !116
  %arrayidx45 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !117
  %14 = load i64, i64* %arrayidx45, align 8, !dbg !117
  %arrayidx46 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 0, !dbg !118
  store i64 %14, i64* %arrayidx46, align 16, !dbg !119
  %arrayidx47 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 2, !dbg !120
  %15 = load i64, i64* %arrayidx47, align 16, !dbg !120
  %arrayidx48 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !121
  store i64 %15, i64* %arrayidx48, align 8, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %if.end30
  %inc = add nsw i32 %i.1, 1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %inc, metadata !57, metadata !DIExpression()), !dbg !19
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !128

for.end:                                          ; preds = %for.end.loopexit, %if.else, %if.then12
  %arrayidx49 = getelementptr inbounds [3 x i64], [3 x i64]* %k, i64 0, i64 1, !dbg !128
  %16 = load i64, i64* %arrayidx49, align 8, !dbg !128
  store i64 %16, i64* %denom, align 8, !dbg !129
  %tobool50 = icmp ne i32 %neg.0, 0, !dbg !130
  br i1 %tobool50, label %cond.true51, label %cond.false54, !dbg !130

cond.true51:                                      ; preds = %for.end
  %arrayidx52 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !131
  %17 = load i64, i64* %arrayidx52, align 8, !dbg !131
  %sub53 = sub nsw i64 0, %17, !dbg !132
  br label %cond.end56, !dbg !130

cond.false54:                                     ; preds = %for.end
  %arrayidx55 = getelementptr inbounds [3 x i64], [3 x i64]* %h, i64 0, i64 1, !dbg !133
  %18 = load i64, i64* %arrayidx55, align 8, !dbg !133
  br label %cond.end56, !dbg !130

cond.end56:                                       ; preds = %cond.false54, %cond.true51
  %cond57 = phi i64 [ %sub53, %cond.true51 ], [ %18, %cond.false54 ], !dbg !130
  store i64 %cond57, i64* %num, align 8, !dbg !134
  br label %return, !dbg !135

return:                                           ; preds = %cond.end56, %if.then
  ret void, !dbg !135
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !136 {
entry:
  %d = alloca i64, align 8
  %n = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %d, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %n, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double 0x3FC2492492492492, metadata !143, metadata !DIExpression()), !dbg !144
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 0x3FC2492492492492), !dbg !145
  call void @llvm.dbg.value(metadata i32 1, metadata !146, metadata !DIExpression()), !dbg !144
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %mul, %for.inc ], !dbg !149
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !146, metadata !DIExpression()), !dbg !144
  %cmp = icmp sle i32 %i.0, 20000000, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %i.0), !dbg !153
  %conv = sext i32 %i.0 to i64, !dbg !155
  call void @rat_approx(double 0x3FC2492492492492, i64 %conv, i64* %n, i64* %d), !dbg !156
  %0 = load i64, i64* %n, align 8, !dbg !157
  %1 = load i64, i64* %d, align 8, !dbg !158
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %0, i64 %1), !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %mul = mul nsw i32 %i.0, 16, !dbg !161
  call void @llvm.dbg.value(metadata i32 %mul, metadata !146, metadata !DIExpression()), !dbg !144
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %call3 = call double @atan2(double 1.000000e+00, double 1.000000e+00) #5, !dbg !165
  %mul4 = fmul double %call3, 4.000000e+00, !dbg !166
  call void @llvm.dbg.value(metadata double %mul4, metadata !143, metadata !DIExpression()), !dbg !144
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %mul4), !dbg !167
  call void @llvm.dbg.value(metadata i32 1, metadata !146, metadata !DIExpression()), !dbg !144
  br label %for.cond6, !dbg !168

for.cond6:                                        ; preds = %for.inc13, %for.end
  %i.1 = phi i32 [ 1, %for.end ], [ %mul14, %for.inc13 ], !dbg !170
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !146, metadata !DIExpression()), !dbg !144
  %cmp7 = icmp sle i32 %i.1, 20000000, !dbg !171
  br i1 %cmp7, label %for.body9, label %for.end15, !dbg !173

for.body9:                                        ; preds = %for.cond6
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %i.1), !dbg !174
  %conv11 = sext i32 %i.1 to i64, !dbg !176
  call void @rat_approx(double %mul4, i64 %conv11, i64* %n, i64* %d), !dbg !177
  %2 = load i64, i64* %n, align 8, !dbg !178
  %3 = load i64, i64* %d, align 8, !dbg !179
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i64 %2, i64 %3), !dbg !180
  br label %for.inc13, !dbg !181

for.inc13:                                        ; preds = %for.body9
  %mul14 = mul nsw i32 %i.1, 16, !dbg !182
  call void @llvm.dbg.value(metadata i32 %mul14, metadata !146, metadata !DIExpression()), !dbg !144
  br label %for.cond6, !dbg !183, !llvm.loop !184

for.end15:                                        ; preds = %for.cond6
  ret i32 0, !dbg !186
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
!36 = !DILocation(line: 22, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 22, column: 15)
!38 = !DILocation(line: 22, column: 36, scope: !37)
!39 = !DILocation(line: 22, column: 34, scope: !37)
!40 = !DILocation(line: 22, column: 49, scope: !37)
!41 = !DILocation(line: 24, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !13, file: !1, line: 24, column: 6)
!43 = !DILocation(line: 24, column: 6, scope: !13)
!44 = !DILocation(line: 24, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 24, column: 13)
!46 = !DILocation(line: 24, column: 32, scope: !45)
!47 = !DILocation(line: 26, column: 2, scope: !13)
!48 = !DILocation(line: 26, column: 14, scope: !13)
!49 = !DILocation(line: 26, column: 11, scope: !13)
!50 = !DILocation(line: 26, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 24)
!52 = !DILocation(line: 26, column: 37, scope: !51)
!53 = distinct !{!53, !47, !54}
!54 = !DILocation(line: 26, column: 43, scope: !13)
!55 = !DILocation(line: 27, column: 6, scope: !13)
!56 = !DILocalVariable(name: "d", scope: !13, file: !1, line: 19, type: !4)
!57 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 20, type: !32)
!58 = !DILocation(line: 30, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !13, file: !1, line: 30, column: 2)
!60 = !DILocation(line: 0, scope: !59)
!61 = !DILocation(line: 30, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !1, line: 30, column: 2)
!63 = !DILocation(line: 30, column: 2, scope: !59)
!64 = !DILocation(line: 31, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 30, column: 27)
!66 = !DILocation(line: 31, column: 13, scope: !65)
!67 = !DILocalVariable(name: "a", scope: !13, file: !1, line: 18, type: !4)
!68 = !DILocation(line: 32, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 32, column: 7)
!70 = !DILocation(line: 32, column: 9, scope: !69)
!71 = !DILocation(line: 32, column: 13, scope: !69)
!72 = !DILocation(line: 32, column: 7, scope: !65)
!73 = !DILocation(line: 32, column: 16, scope: !69)
!74 = !DILocalVariable(name: "x", scope: !13, file: !1, line: 19, type: !4)
!75 = !DILocation(line: 34, column: 23, scope: !65)
!76 = !DILocation(line: 37, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !65, file: !1, line: 37, column: 7)
!78 = !DILocation(line: 37, column: 12, scope: !77)
!79 = !DILocation(line: 37, column: 18, scope: !77)
!80 = !DILocation(line: 37, column: 16, scope: !77)
!81 = !DILocation(line: 37, column: 23, scope: !77)
!82 = !DILocation(line: 37, column: 7, scope: !65)
!83 = !DILocation(line: 38, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 37, column: 30)
!85 = !DILocation(line: 38, column: 12, scope: !84)
!86 = !DILocation(line: 38, column: 22, scope: !84)
!87 = !DILocation(line: 38, column: 20, scope: !84)
!88 = !DILocation(line: 39, column: 10, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 39, column: 8)
!90 = !DILocation(line: 39, column: 14, scope: !89)
!91 = !DILocation(line: 39, column: 19, scope: !89)
!92 = !DILocation(line: 39, column: 22, scope: !89)
!93 = !DILocation(line: 39, column: 27, scope: !89)
!94 = !DILocation(line: 39, column: 8, scope: !84)
!95 = !DILocation(line: 40, column: 5, scope: !89)
!96 = !DILocation(line: 42, column: 5, scope: !89)
!97 = !DILocation(line: 43, column: 3, scope: !84)
!98 = !DILocation(line: 0, scope: !65)
!99 = !DILocation(line: 45, column: 14, scope: !65)
!100 = !DILocation(line: 45, column: 12, scope: !65)
!101 = !DILocation(line: 45, column: 21, scope: !65)
!102 = !DILocation(line: 45, column: 19, scope: !65)
!103 = !DILocation(line: 45, column: 3, scope: !65)
!104 = !DILocation(line: 45, column: 8, scope: !65)
!105 = !DILocation(line: 45, column: 34, scope: !65)
!106 = !DILocation(line: 45, column: 27, scope: !65)
!107 = !DILocation(line: 45, column: 32, scope: !65)
!108 = !DILocation(line: 45, column: 47, scope: !65)
!109 = !DILocation(line: 45, column: 40, scope: !65)
!110 = !DILocation(line: 45, column: 45, scope: !65)
!111 = !DILocation(line: 46, column: 14, scope: !65)
!112 = !DILocation(line: 46, column: 12, scope: !65)
!113 = !DILocation(line: 46, column: 21, scope: !65)
!114 = !DILocation(line: 46, column: 19, scope: !65)
!115 = !DILocation(line: 46, column: 3, scope: !65)
!116 = !DILocation(line: 46, column: 8, scope: !65)
!117 = !DILocation(line: 46, column: 34, scope: !65)
!118 = !DILocation(line: 46, column: 27, scope: !65)
!119 = !DILocation(line: 46, column: 32, scope: !65)
!120 = !DILocation(line: 46, column: 47, scope: !65)
!121 = !DILocation(line: 46, column: 40, scope: !65)
!122 = !DILocation(line: 46, column: 45, scope: !65)
!123 = !DILocation(line: 47, column: 2, scope: !65)
!124 = !DILocation(line: 30, column: 23, scope: !62)
!125 = !DILocation(line: 30, column: 2, scope: !62)
!126 = distinct !{!126, !63, !127}
!127 = !DILocation(line: 47, column: 2, scope: !59)
!128 = !DILocation(line: 48, column: 11, scope: !13)
!129 = !DILocation(line: 48, column: 9, scope: !13)
!130 = !DILocation(line: 49, column: 9, scope: !13)
!131 = !DILocation(line: 49, column: 16, scope: !13)
!132 = !DILocation(line: 49, column: 15, scope: !13)
!133 = !DILocation(line: 49, column: 23, scope: !13)
!134 = !DILocation(line: 49, column: 7, scope: !13)
!135 = !DILocation(line: 50, column: 1, scope: !13)
!136 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 52, type: !137, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{!32}
!139 = !DILocalVariable(name: "d", scope: !136, file: !1, line: 55, type: !4)
!140 = !DILocation(line: 55, column: 10, scope: !136)
!141 = !DILocalVariable(name: "n", scope: !136, file: !1, line: 55, type: !4)
!142 = !DILocation(line: 55, column: 13, scope: !136)
!143 = !DILocalVariable(name: "f", scope: !136, file: !1, line: 56, type: !16)
!144 = !DILocation(line: 0, scope: !136)
!145 = !DILocation(line: 58, column: 2, scope: !136)
!146 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 54, type: !32)
!147 = !DILocation(line: 59, column: 7, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !1, line: 59, column: 2)
!149 = !DILocation(line: 0, scope: !148)
!150 = !DILocation(line: 59, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !1, line: 59, column: 2)
!152 = !DILocation(line: 59, column: 2, scope: !148)
!153 = !DILocation(line: 60, column: 3, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !1, line: 59, column: 38)
!155 = !DILocation(line: 61, column: 17, scope: !154)
!156 = !DILocation(line: 61, column: 3, scope: !154)
!157 = !DILocation(line: 62, column: 25, scope: !154)
!158 = !DILocation(line: 62, column: 28, scope: !154)
!159 = !DILocation(line: 62, column: 3, scope: !154)
!160 = !DILocation(line: 63, column: 2, scope: !154)
!161 = !DILocation(line: 59, column: 31, scope: !151)
!162 = !DILocation(line: 59, column: 2, scope: !151)
!163 = distinct !{!163, !152, !164}
!164 = !DILocation(line: 63, column: 2, scope: !148)
!165 = !DILocation(line: 65, column: 32, scope: !136)
!166 = !DILocation(line: 65, column: 43, scope: !136)
!167 = !DILocation(line: 65, column: 2, scope: !136)
!168 = !DILocation(line: 66, column: 7, scope: !169)
!169 = distinct !DILexicalBlock(scope: !136, file: !1, line: 66, column: 2)
!170 = !DILocation(line: 0, scope: !169)
!171 = !DILocation(line: 66, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !1, line: 66, column: 2)
!173 = !DILocation(line: 66, column: 2, scope: !169)
!174 = !DILocation(line: 67, column: 3, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !1, line: 66, column: 38)
!176 = !DILocation(line: 68, column: 17, scope: !175)
!177 = !DILocation(line: 68, column: 3, scope: !175)
!178 = !DILocation(line: 69, column: 25, scope: !175)
!179 = !DILocation(line: 69, column: 28, scope: !175)
!180 = !DILocation(line: 69, column: 3, scope: !175)
!181 = !DILocation(line: 70, column: 2, scope: !175)
!182 = !DILocation(line: 66, column: 31, scope: !172)
!183 = !DILocation(line: 66, column: 2, scope: !172)
!184 = distinct !{!184, !173, !185}
!185 = !DILocation(line: 70, column: 2, scope: !169)
!186 = !DILocation(line: 72, column: 2, scope: !136)
