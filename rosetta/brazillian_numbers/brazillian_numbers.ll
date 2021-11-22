; ModuleID = 'brazillian_numbers.c'
source_filename = "brazillian_numbers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c" odd \00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" prime \00", align 1
@__const.main.kinds = private unnamed_addr constant [3 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0)], align 16
@.str.3 = private unnamed_addr constant [30 x i8] c"First 20%sBrazilian numbers:\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"The 100,000th Brazilian number: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @same_digits(i32 %n, i32 %b) #0 !dbg !7 {
entry:
  %retval = alloca i8, align 1
  %n.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %f, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %n.addr, align 4, !dbg !19
  %1 = load i32, i32* %b.addr, align 4, !dbg !20
  %rem = srem i32 %0, %1, !dbg !21
  store i32 %rem, i32* %f, align 4, !dbg !18
  %2 = load i32, i32* %b.addr, align 4, !dbg !22
  %3 = load i32, i32* %n.addr, align 4, !dbg !23
  %div = sdiv i32 %3, %2, !dbg !23
  store i32 %div, i32* %n.addr, align 4, !dbg !23
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %if.end, %entry
  %4 = load i32, i32* %n.addr, align 4, !dbg !25
  %cmp = icmp sgt i32 %4, 0, !dbg !26
  br i1 %cmp, label %while.body, label %while.end, !dbg !24

while.body:                                       ; preds = %while.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !27
  %6 = load i32, i32* %b.addr, align 4, !dbg !30
  %rem1 = srem i32 %5, %6, !dbg !31
  %7 = load i32, i32* %f, align 4, !dbg !32
  %cmp2 = icmp ne i32 %rem1, %7, !dbg !33
  br i1 %cmp2, label %if.then, label %if.end, !dbg !34, !cf.info !35

if.then:                                          ; preds = %while.body
  store i8 0, i8* %retval, align 1, !dbg !36
  br label %return, !dbg !36

if.end:                                           ; preds = %while.body
  %8 = load i32, i32* %b.addr, align 4, !dbg !37
  %9 = load i32, i32* %n.addr, align 4, !dbg !38
  %div3 = sdiv i32 %9, %8, !dbg !38
  store i32 %div3, i32* %n.addr, align 4, !dbg !38
  br label %while.cond, !dbg !24, !llvm.loop !39

while.end:                                        ; preds = %while.cond
  store i8 1, i8* %retval, align 1, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %while.end, %if.then
  %10 = load i8, i8* %retval, align 1, !dbg !42
  ret i8 %10, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_brazilian(i32 %n) #0 !dbg !43 {
entry:
  %retval = alloca i8, align 1
  %n.addr = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %b, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32, i32* %n.addr, align 4, !dbg !50
  %cmp = icmp slt i32 %0, 7, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53, !cf.info !35

if.then:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1, !dbg !54
  br label %return, !dbg !54

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !55
  %rem = srem i32 %1, 2, !dbg !57
  %tobool = icmp ne i32 %rem, 0, !dbg !57
  br i1 %tobool, label %if.end3, label %land.lhs.true, !dbg !58, !cf.info !35

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32, i32* %n.addr, align 4, !dbg !59
  %cmp1 = icmp sge i32 %2, 8, !dbg !60
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !61, !cf.info !35

if.then2:                                         ; preds = %land.lhs.true
  store i8 1, i8* %retval, align 1, !dbg !62
  br label %return, !dbg !62

if.end3:                                          ; preds = %land.lhs.true, %if.end
  store i32 2, i32* %b, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i32, i32* %b, align 4, !dbg !66
  %4 = load i32, i32* %n.addr, align 4, !dbg !68
  %sub = sub nsw i32 %4, 1, !dbg !69
  %cmp4 = icmp slt i32 %3, %sub, !dbg !70
  br i1 %cmp4, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !72
  %6 = load i32, i32* %b, align 4, !dbg !75
  %call = call signext i8 @same_digits(i32 %5, i32 %6), !dbg !76
  %tobool5 = icmp ne i8 %call, 0, !dbg !76
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !77, !cf.info !35

if.then6:                                         ; preds = %for.body
  store i8 1, i8* %retval, align 1, !dbg !78
  br label %return, !dbg !78

if.end7:                                          ; preds = %for.body
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %if.end7
  %7 = load i32, i32* %b, align 4, !dbg !80
  %inc = add nsw i32 %7, 1, !dbg !80
  store i32 %inc, i32* %b, align 4, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  store i8 0, i8* %retval, align 1, !dbg !84
  br label %return, !dbg !84

return:                                           ; preds = %for.end, %if.then6, %if.then2, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !85
  ret i8 %8, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_prime(i32 %n) #0 !dbg !86 {
entry:
  %retval = alloca i8, align 1
  %n.addr = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %d, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 5, i32* %d, align 4, !dbg !90
  %0 = load i32, i32* %n.addr, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 2, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94, !cf.info !35

if.then:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1, !dbg !95
  br label %return, !dbg !95

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !96
  %rem = srem i32 %1, 2, !dbg !98
  %tobool = icmp ne i32 %rem, 0, !dbg !98
  br i1 %tobool, label %if.end4, label %if.then1, !dbg !99, !cf.info !35

if.then1:                                         ; preds = %if.end
  %2 = load i32, i32* %n.addr, align 4, !dbg !100
  %cmp2 = icmp eq i32 %2, 2, !dbg !101
  %conv = zext i1 %cmp2 to i32, !dbg !101
  %conv3 = trunc i32 %conv to i8, !dbg !100
  store i8 %conv3, i8* %retval, align 1, !dbg !102
  br label %return, !dbg !102

if.end4:                                          ; preds = %if.end
  %3 = load i32, i32* %n.addr, align 4, !dbg !103
  %rem5 = srem i32 %3, 3, !dbg !105
  %tobool6 = icmp ne i32 %rem5, 0, !dbg !105
  br i1 %tobool6, label %if.end11, label %if.then7, !dbg !106, !cf.info !35

if.then7:                                         ; preds = %if.end4
  %4 = load i32, i32* %n.addr, align 4, !dbg !107
  %cmp8 = icmp eq i32 %4, 3, !dbg !108
  %conv9 = zext i1 %cmp8 to i32, !dbg !108
  %conv10 = trunc i32 %conv9 to i8, !dbg !107
  store i8 %conv10, i8* %retval, align 1, !dbg !109
  br label %return, !dbg !109

if.end11:                                         ; preds = %if.end4
  br label %while.cond, !dbg !110

while.cond:                                       ; preds = %if.end21, %if.end11
  %5 = load i32, i32* %d, align 4, !dbg !111
  %6 = load i32, i32* %d, align 4, !dbg !112
  %mul = mul nsw i32 %5, %6, !dbg !113
  %7 = load i32, i32* %n.addr, align 4, !dbg !114
  %cmp12 = icmp sle i32 %mul, %7, !dbg !115
  br i1 %cmp12, label %while.body, label %while.end, !dbg !110

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %n.addr, align 4, !dbg !116
  %9 = load i32, i32* %d, align 4, !dbg !119
  %rem14 = srem i32 %8, %9, !dbg !120
  %tobool15 = icmp ne i32 %rem14, 0, !dbg !120
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !121, !cf.info !35

if.then16:                                        ; preds = %while.body
  store i8 0, i8* %retval, align 1, !dbg !122
  br label %return, !dbg !122

if.end17:                                         ; preds = %while.body
  %10 = load i32, i32* %d, align 4, !dbg !123
  %add = add nsw i32 %10, 2, !dbg !123
  store i32 %add, i32* %d, align 4, !dbg !123
  %11 = load i32, i32* %n.addr, align 4, !dbg !124
  %12 = load i32, i32* %d, align 4, !dbg !126
  %rem18 = srem i32 %11, %12, !dbg !127
  %tobool19 = icmp ne i32 %rem18, 0, !dbg !127
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !128, !cf.info !35

if.then20:                                        ; preds = %if.end17
  store i8 0, i8* %retval, align 1, !dbg !129
  br label %return, !dbg !129

if.end21:                                         ; preds = %if.end17
  %13 = load i32, i32* %d, align 4, !dbg !130
  %add22 = add nsw i32 %13, 4, !dbg !130
  store i32 %add22, i32* %d, align 4, !dbg !130
  br label %while.cond, !dbg !110, !llvm.loop !131

while.end:                                        ; preds = %while.cond
  store i8 1, i8* %retval, align 1, !dbg !133
  br label %return, !dbg !133

return:                                           ; preds = %while.end, %if.then20, %if.then16, %if.then7, %if.then1, %if.then
  %14 = load i8, i8* %retval, align 1, !dbg !134
  ret i8 %14, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !135 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %kinds = alloca [3 x i8*], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %c, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %n, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [3 x i8*]* %kinds, metadata !144, metadata !DIExpression()), !dbg !150
  %0 = bitcast [3 x i8*]* %kinds to i8*, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8*]* @__const.main.kinds to i8*), i64 24, i1 false), !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !154
  %cmp = icmp slt i32 %1, 3, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !158
  %idxprom = sext i32 %2 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %kinds, i64 0, i64 %idxprom, !dbg !160
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !160
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i8* %3), !dbg !161
  store i32 0, i32* %c, align 4, !dbg !162
  store i32 7, i32* %n, align 4, !dbg !163
  br label %while.body, !dbg !164

while.body:                                       ; preds = %for.body, %sw.epilog
  %4 = load i32, i32* %n, align 4, !dbg !165
  %call1 = call signext i8 @is_brazilian(i32 %4), !dbg !168
  %tobool = icmp ne i8 %call1, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end6, !dbg !169, !cf.info !35

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %n, align 4, !dbg !170
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %5), !dbg !172
  %6 = load i32, i32* %c, align 4, !dbg !173
  %inc = add nsw i32 %6, 1, !dbg !173
  store i32 %inc, i32* %c, align 4, !dbg !173
  %cmp3 = icmp eq i32 %inc, 20, !dbg !175
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !176, !cf.info !35

if.then4:                                         ; preds = %if.then
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0)), !dbg !177
  br label %while.end, !dbg !179

if.end:                                           ; preds = %if.then
  br label %if.end6, !dbg !180

if.end6:                                          ; preds = %if.end, %while.body
  %7 = load i32, i32* %i, align 4, !dbg !181
  switch i32 %7, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb8
    i32 2, label %sw.bb9
  ], !dbg !182

sw.bb:                                            ; preds = %if.end6
  %8 = load i32, i32* %n, align 4, !dbg !183
  %inc7 = add nsw i32 %8, 1, !dbg !183
  store i32 %inc7, i32* %n, align 4, !dbg !183
  br label %sw.epilog, !dbg !185

sw.bb8:                                           ; preds = %if.end6
  %9 = load i32, i32* %n, align 4, !dbg !186
  %add = add nsw i32 %9, 2, !dbg !186
  store i32 %add, i32* %n, align 4, !dbg !186
  br label %sw.epilog, !dbg !187

sw.bb9:                                           ; preds = %if.end6
  br label %do.body, !dbg !188

do.body:                                          ; preds = %do.cond, %sw.bb9
  %10 = load i32, i32* %n, align 4, !dbg !189
  %add10 = add nsw i32 %10, 2, !dbg !189
  store i32 %add10, i32* %n, align 4, !dbg !189
  br label %do.cond, !dbg !191

do.cond:                                          ; preds = %do.body
  %11 = load i32, i32* %n, align 4, !dbg !192
  %call11 = call signext i8 @is_prime(i32 %11), !dbg !193
  %tobool12 = icmp ne i8 %call11, 0, !dbg !194
  %lnot = xor i1 %tobool12, true, !dbg !194
  br i1 %lnot, label %do.body, label %do.end, !dbg !191, !llvm.loop !195

do.end:                                           ; preds = %do.cond
  br label %sw.epilog, !dbg !197

sw.epilog:                                        ; preds = %if.end6, %do.end, %sw.bb8, %sw.bb
  br label %while.body, !dbg !164, !llvm.loop !198

while.end:                                        ; preds = %if.then4
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %while.end
  %12 = load i32, i32* %i, align 4, !dbg !201
  %inc13 = add nsw i32 %12, 1, !dbg !201
  store i32 %inc13, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  store i32 7, i32* %n, align 4, !dbg !205
  store i32 0, i32* %c, align 4, !dbg !207
  br label %for.cond14, !dbg !208

for.cond14:                                       ; preds = %for.inc22, %for.end
  %13 = load i32, i32* %c, align 4, !dbg !209
  %cmp15 = icmp slt i32 %13, 100000, !dbg !211
  br i1 %cmp15, label %for.body16, label %for.end24, !dbg !212

for.body16:                                       ; preds = %for.cond14
  %14 = load i32, i32* %n, align 4, !dbg !213
  %call17 = call signext i8 @is_brazilian(i32 %14), !dbg !216
  %tobool18 = icmp ne i8 %call17, 0, !dbg !216
  br i1 %tobool18, label %if.then19, label %if.end21, !dbg !217, !cf.info !35

if.then19:                                        ; preds = %for.body16
  %15 = load i32, i32* %c, align 4, !dbg !218
  %inc20 = add nsw i32 %15, 1, !dbg !218
  store i32 %inc20, i32* %c, align 4, !dbg !218
  br label %if.end21, !dbg !219

if.end21:                                         ; preds = %if.then19, %for.body16
  br label %for.inc22, !dbg !220

for.inc22:                                        ; preds = %if.end21
  %16 = load i32, i32* %n, align 4, !dbg !221
  %inc23 = add nsw i32 %16, 1, !dbg !221
  store i32 %inc23, i32* %n, align 4, !dbg !221
  br label %for.cond14, !dbg !222, !llvm.loop !223

for.end24:                                        ; preds = %for.cond14
  %17 = load i32, i32* %n, align 4, !dbg !225
  %sub = sub nsw i32 %17, 1, !dbg !226
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0), i32 %sub), !dbg !227
  ret i32 0, !dbg !228
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "brazillian_numbers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/brazillian_numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "same_digits", scope: !1, file: !1, line: 8, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12, !12}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !1, line: 3, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 8, type: !12)
!14 = !DILocation(line: 8, column: 22, scope: !7)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 8, type: !12)
!16 = !DILocation(line: 8, column: 29, scope: !7)
!17 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 9, type: !12)
!18 = !DILocation(line: 9, column: 7, scope: !7)
!19 = !DILocation(line: 9, column: 11, scope: !7)
!20 = !DILocation(line: 9, column: 15, scope: !7)
!21 = !DILocation(line: 9, column: 13, scope: !7)
!22 = !DILocation(line: 10, column: 8, scope: !7)
!23 = !DILocation(line: 10, column: 5, scope: !7)
!24 = !DILocation(line: 11, column: 3, scope: !7)
!25 = !DILocation(line: 11, column: 10, scope: !7)
!26 = !DILocation(line: 11, column: 12, scope: !7)
!27 = !DILocation(line: 12, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 12, column: 9)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 17)
!30 = !DILocation(line: 12, column: 13, scope: !28)
!31 = !DILocation(line: 12, column: 11, scope: !28)
!32 = !DILocation(line: 12, column: 18, scope: !28)
!33 = !DILocation(line: 12, column: 15, scope: !28)
!34 = !DILocation(line: 12, column: 9, scope: !29)
!35 = !{!"if"}
!36 = !DILocation(line: 12, column: 21, scope: !28)
!37 = !DILocation(line: 13, column: 10, scope: !29)
!38 = !DILocation(line: 13, column: 7, scope: !29)
!39 = distinct !{!39, !24, !40}
!40 = !DILocation(line: 14, column: 3, scope: !7)
!41 = !DILocation(line: 15, column: 3, scope: !7)
!42 = !DILocation(line: 16, column: 1, scope: !7)
!43 = distinct !DISubprogram(name: "is_brazilian", scope: !1, file: !1, line: 18, type: !44, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10, !12}
!46 = !DILocalVariable(name: "n", arg: 1, scope: !43, file: !1, line: 18, type: !12)
!47 = !DILocation(line: 18, column: 23, scope: !43)
!48 = !DILocalVariable(name: "b", scope: !43, file: !1, line: 19, type: !12)
!49 = !DILocation(line: 19, column: 7, scope: !43)
!50 = !DILocation(line: 20, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !1, line: 20, column: 7)
!52 = !DILocation(line: 20, column: 9, scope: !51)
!53 = !DILocation(line: 20, column: 7, scope: !43)
!54 = !DILocation(line: 20, column: 14, scope: !51)
!55 = !DILocation(line: 21, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !43, file: !1, line: 21, column: 7)
!57 = !DILocation(line: 21, column: 11, scope: !56)
!58 = !DILocation(line: 21, column: 16, scope: !56)
!59 = !DILocation(line: 21, column: 19, scope: !56)
!60 = !DILocation(line: 21, column: 21, scope: !56)
!61 = !DILocation(line: 21, column: 7, scope: !43)
!62 = !DILocation(line: 21, column: 27, scope: !56)
!63 = !DILocation(line: 22, column: 10, scope: !64)
!64 = distinct !DILexicalBlock(scope: !43, file: !1, line: 22, column: 3)
!65 = !DILocation(line: 22, column: 8, scope: !64)
!66 = !DILocation(line: 22, column: 15, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 22, column: 3)
!68 = !DILocation(line: 22, column: 19, scope: !67)
!69 = !DILocation(line: 22, column: 21, scope: !67)
!70 = !DILocation(line: 22, column: 17, scope: !67)
!71 = !DILocation(line: 22, column: 3, scope: !64)
!72 = !DILocation(line: 23, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 23, column: 9)
!74 = distinct !DILexicalBlock(scope: !67, file: !1, line: 22, column: 31)
!75 = !DILocation(line: 23, column: 24, scope: !73)
!76 = !DILocation(line: 23, column: 9, scope: !73)
!77 = !DILocation(line: 23, column: 9, scope: !74)
!78 = !DILocation(line: 23, column: 28, scope: !73)
!79 = !DILocation(line: 24, column: 3, scope: !74)
!80 = !DILocation(line: 22, column: 26, scope: !67)
!81 = !DILocation(line: 22, column: 3, scope: !67)
!82 = distinct !{!82, !71, !83}
!83 = !DILocation(line: 24, column: 3, scope: !64)
!84 = !DILocation(line: 25, column: 3, scope: !43)
!85 = !DILocation(line: 26, column: 1, scope: !43)
!86 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 28, type: !44, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "n", arg: 1, scope: !86, file: !1, line: 28, type: !12)
!88 = !DILocation(line: 28, column: 19, scope: !86)
!89 = !DILocalVariable(name: "d", scope: !86, file: !1, line: 29, type: !12)
!90 = !DILocation(line: 29, column: 7, scope: !86)
!91 = !DILocation(line: 30, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !1, line: 30, column: 7)
!93 = !DILocation(line: 30, column: 9, scope: !92)
!94 = !DILocation(line: 30, column: 7, scope: !86)
!95 = !DILocation(line: 30, column: 14, scope: !92)
!96 = !DILocation(line: 31, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !86, file: !1, line: 31, column: 7)
!98 = !DILocation(line: 31, column: 11, scope: !97)
!99 = !DILocation(line: 31, column: 7, scope: !86)
!100 = !DILocation(line: 31, column: 24, scope: !97)
!101 = !DILocation(line: 31, column: 26, scope: !97)
!102 = !DILocation(line: 31, column: 17, scope: !97)
!103 = !DILocation(line: 32, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !86, file: !1, line: 32, column: 7)
!105 = !DILocation(line: 32, column: 11, scope: !104)
!106 = !DILocation(line: 32, column: 7, scope: !86)
!107 = !DILocation(line: 32, column: 24, scope: !104)
!108 = !DILocation(line: 32, column: 26, scope: !104)
!109 = !DILocation(line: 32, column: 17, scope: !104)
!110 = !DILocation(line: 33, column: 3, scope: !86)
!111 = !DILocation(line: 33, column: 10, scope: !86)
!112 = !DILocation(line: 33, column: 14, scope: !86)
!113 = !DILocation(line: 33, column: 12, scope: !86)
!114 = !DILocation(line: 33, column: 19, scope: !86)
!115 = !DILocation(line: 33, column: 16, scope: !86)
!116 = !DILocation(line: 34, column: 11, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 34, column: 9)
!118 = distinct !DILexicalBlock(scope: !86, file: !1, line: 33, column: 22)
!119 = !DILocation(line: 34, column: 15, scope: !117)
!120 = !DILocation(line: 34, column: 13, scope: !117)
!121 = !DILocation(line: 34, column: 9, scope: !118)
!122 = !DILocation(line: 34, column: 19, scope: !117)
!123 = !DILocation(line: 35, column: 7, scope: !118)
!124 = !DILocation(line: 36, column: 11, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !1, line: 36, column: 9)
!126 = !DILocation(line: 36, column: 15, scope: !125)
!127 = !DILocation(line: 36, column: 13, scope: !125)
!128 = !DILocation(line: 36, column: 9, scope: !118)
!129 = !DILocation(line: 36, column: 19, scope: !125)
!130 = !DILocation(line: 37, column: 7, scope: !118)
!131 = distinct !{!131, !110, !132}
!132 = !DILocation(line: 38, column: 3, scope: !86)
!133 = !DILocation(line: 39, column: 3, scope: !86)
!134 = !DILocation(line: 40, column: 1, scope: !86)
!135 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !136, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DISubroutineType(types: !137)
!137 = !{!12}
!138 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 43, type: !12)
!139 = !DILocation(line: 43, column: 7, scope: !135)
!140 = !DILocalVariable(name: "c", scope: !135, file: !1, line: 43, type: !12)
!141 = !DILocation(line: 43, column: 10, scope: !135)
!142 = !DILocalVariable(name: "n", scope: !135, file: !1, line: 43, type: !12)
!143 = !DILocation(line: 43, column: 13, scope: !135)
!144 = !DILocalVariable(name: "kinds", scope: !135, file: !1, line: 44, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !146, size: 192, elements: !148)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!148 = !{!149}
!149 = !DISubrange(count: 3)
!150 = !DILocation(line: 44, column: 15, scope: !135)
!151 = !DILocation(line: 45, column: 10, scope: !152)
!152 = distinct !DILexicalBlock(scope: !135, file: !1, line: 45, column: 3)
!153 = !DILocation(line: 45, column: 8, scope: !152)
!154 = !DILocation(line: 45, column: 15, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 45, column: 3)
!156 = !DILocation(line: 45, column: 17, scope: !155)
!157 = !DILocation(line: 45, column: 3, scope: !152)
!158 = !DILocation(line: 46, column: 52, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !1, line: 45, column: 27)
!160 = !DILocation(line: 46, column: 46, scope: !159)
!161 = !DILocation(line: 46, column: 5, scope: !159)
!162 = !DILocation(line: 47, column: 7, scope: !159)
!163 = !DILocation(line: 48, column: 7, scope: !159)
!164 = !DILocation(line: 49, column: 5, scope: !159)
!165 = !DILocation(line: 50, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !1, line: 50, column: 11)
!167 = distinct !DILexicalBlock(scope: !159, file: !1, line: 49, column: 18)
!168 = !DILocation(line: 50, column: 11, scope: !166)
!169 = !DILocation(line: 50, column: 11, scope: !167)
!170 = !DILocation(line: 51, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !1, line: 50, column: 28)
!172 = !DILocation(line: 51, column: 9, scope: !171)
!173 = !DILocation(line: 52, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !1, line: 52, column: 13)
!175 = !DILocation(line: 52, column: 17, scope: !174)
!176 = !DILocation(line: 52, column: 13, scope: !171)
!177 = !DILocation(line: 53, column: 11, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !1, line: 52, column: 24)
!179 = !DILocation(line: 54, column: 11, scope: !178)
!180 = !DILocation(line: 56, column: 7, scope: !171)
!181 = !DILocation(line: 57, column: 15, scope: !167)
!182 = !DILocation(line: 57, column: 7, scope: !167)
!183 = !DILocation(line: 58, column: 18, scope: !184)
!184 = distinct !DILexicalBlock(scope: !167, file: !1, line: 57, column: 18)
!185 = !DILocation(line: 58, column: 22, scope: !184)
!186 = !DILocation(line: 59, column: 19, scope: !184)
!187 = !DILocation(line: 59, column: 25, scope: !184)
!188 = !DILocation(line: 61, column: 17, scope: !184)
!189 = !DILocation(line: 62, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !1, line: 61, column: 20)
!191 = !DILocation(line: 63, column: 17, scope: !190)
!192 = !DILocation(line: 63, column: 36, scope: !184)
!193 = !DILocation(line: 63, column: 27, scope: !184)
!194 = !DILocation(line: 63, column: 26, scope: !184)
!195 = distinct !{!195, !188, !196}
!196 = !DILocation(line: 63, column: 38, scope: !184)
!197 = !DILocation(line: 64, column: 17, scope: !184)
!198 = distinct !{!198, !164, !199}
!199 = !DILocation(line: 66, column: 5, scope: !159)
!200 = !DILocation(line: 67, column: 3, scope: !159)
!201 = !DILocation(line: 45, column: 22, scope: !155)
!202 = !DILocation(line: 45, column: 3, scope: !155)
!203 = distinct !{!203, !157, !204}
!204 = !DILocation(line: 67, column: 3, scope: !152)
!205 = !DILocation(line: 69, column: 10, scope: !206)
!206 = distinct !DILexicalBlock(scope: !135, file: !1, line: 69, column: 3)
!207 = !DILocation(line: 69, column: 17, scope: !206)
!208 = !DILocation(line: 69, column: 8, scope: !206)
!209 = !DILocation(line: 69, column: 22, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !1, line: 69, column: 3)
!211 = !DILocation(line: 69, column: 24, scope: !210)
!212 = !DILocation(line: 69, column: 3, scope: !206)
!213 = !DILocation(line: 70, column: 22, scope: !214)
!214 = distinct !DILexicalBlock(scope: !215, file: !1, line: 70, column: 9)
!215 = distinct !DILexicalBlock(scope: !210, file: !1, line: 69, column: 39)
!216 = !DILocation(line: 70, column: 9, scope: !214)
!217 = !DILocation(line: 70, column: 9, scope: !215)
!218 = !DILocation(line: 70, column: 27, scope: !214)
!219 = !DILocation(line: 70, column: 26, scope: !214)
!220 = !DILocation(line: 71, column: 3, scope: !215)
!221 = !DILocation(line: 69, column: 34, scope: !210)
!222 = !DILocation(line: 69, column: 3, scope: !210)
!223 = distinct !{!223, !212, !224}
!224 = !DILocation(line: 71, column: 3, scope: !206)
!225 = !DILocation(line: 72, column: 50, scope: !135)
!226 = !DILocation(line: 72, column: 52, scope: !135)
!227 = !DILocation(line: 72, column: 3, scope: !135)
!228 = !DILocation(line: 73, column: 3, scope: !135)
