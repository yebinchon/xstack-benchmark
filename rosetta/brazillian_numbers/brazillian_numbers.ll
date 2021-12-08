; ModuleID = 'brazillian_numbers.ll'
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
  br i1 %cmp2, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %while.body
  store i8 0, i8* %retval, align 1, !dbg !35
  br label %return, !dbg !35

if.end:                                           ; preds = %while.body
  %8 = load i32, i32* %b.addr, align 4, !dbg !36
  %9 = load i32, i32* %n.addr, align 4, !dbg !37
  %div3 = sdiv i32 %9, %8, !dbg !37
  store i32 %div3, i32* %n.addr, align 4, !dbg !37
  br label %while.cond, !dbg !24, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  store i8 1, i8* %retval, align 1, !dbg !40
  br label %return, !dbg !40

return:                                           ; preds = %while.end, %if.then
  %10 = load i8, i8* %retval, align 1, !dbg !41
  ret i8 %10, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_brazilian(i32 %n) #0 !dbg !42 {
entry:
  %retval = alloca i8, align 1
  %n.addr = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %b, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32, i32* %n.addr, align 4, !dbg !49
  %cmp = icmp slt i32 %0, 7, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1, !dbg !53
  br label %return, !dbg !53

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !54
  %rem = srem i32 %1, 2, !dbg !56
  %tobool = icmp ne i32 %rem, 0, !dbg !56
  br i1 %tobool, label %if.end3, label %land.lhs.true, !dbg !57

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32, i32* %n.addr, align 4, !dbg !58
  %cmp1 = icmp sge i32 %2, 8, !dbg !59
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !60

if.then2:                                         ; preds = %land.lhs.true
  store i8 1, i8* %retval, align 1, !dbg !61
  br label %return, !dbg !61

if.end3:                                          ; preds = %land.lhs.true, %if.end
  store i32 2, i32* %b, align 4, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i32, i32* %b, align 4, !dbg !65
  %4 = load i32, i32* %n.addr, align 4, !dbg !67
  %sub = sub nsw i32 %4, 1, !dbg !68
  %cmp4 = icmp slt i32 %3, %sub, !dbg !69
  br i1 %cmp4, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !71
  %6 = load i32, i32* %b, align 4, !dbg !74
  %call = call signext i8 @same_digits(i32 %5, i32 %6), !dbg !75
  %tobool5 = icmp ne i8 %call, 0, !dbg !75
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !76

if.then6:                                         ; preds = %for.body
  store i8 1, i8* %retval, align 1, !dbg !77
  br label %return, !dbg !77

if.end7:                                          ; preds = %for.body
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %if.end7
  %7 = load i32, i32* %b, align 4, !dbg !79
  %inc = add nsw i32 %7, 1, !dbg !79
  store i32 %inc, i32* %b, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  store i8 0, i8* %retval, align 1, !dbg !83
  br label %return, !dbg !83

return:                                           ; preds = %for.end, %if.then6, %if.then2, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !84
  ret i8 %8, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_prime(i32 %n) #0 !dbg !85 {
entry:
  %retval = alloca i8, align 1
  %n.addr = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %d, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 5, i32* %d, align 4, !dbg !89
  %0 = load i32, i32* %n.addr, align 4, !dbg !90
  %cmp = icmp slt i32 %0, 2, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1, !dbg !94
  br label %return, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !95
  %rem = srem i32 %1, 2, !dbg !97
  %tobool = icmp ne i32 %rem, 0, !dbg !97
  br i1 %tobool, label %if.end4, label %if.then1, !dbg !98

if.then1:                                         ; preds = %if.end
  %2 = load i32, i32* %n.addr, align 4, !dbg !99
  %cmp2 = icmp eq i32 %2, 2, !dbg !100
  %conv = zext i1 %cmp2 to i32, !dbg !100
  %conv3 = trunc i32 %conv to i8, !dbg !99
  store i8 %conv3, i8* %retval, align 1, !dbg !101
  br label %return, !dbg !101

if.end4:                                          ; preds = %if.end
  %3 = load i32, i32* %n.addr, align 4, !dbg !102
  %rem5 = srem i32 %3, 3, !dbg !104
  %tobool6 = icmp ne i32 %rem5, 0, !dbg !104
  br i1 %tobool6, label %if.end11, label %if.then7, !dbg !105

if.then7:                                         ; preds = %if.end4
  %4 = load i32, i32* %n.addr, align 4, !dbg !106
  %cmp8 = icmp eq i32 %4, 3, !dbg !107
  %conv9 = zext i1 %cmp8 to i32, !dbg !107
  %conv10 = trunc i32 %conv9 to i8, !dbg !106
  store i8 %conv10, i8* %retval, align 1, !dbg !108
  br label %return, !dbg !108

if.end11:                                         ; preds = %if.end4
  br label %while.cond, !dbg !109

while.cond:                                       ; preds = %if.end21, %if.end11
  %5 = load i32, i32* %d, align 4, !dbg !110
  %6 = load i32, i32* %d, align 4, !dbg !111
  %mul = mul nsw i32 %5, %6, !dbg !112
  %7 = load i32, i32* %n.addr, align 4, !dbg !113
  %cmp12 = icmp sle i32 %mul, %7, !dbg !114
  br i1 %cmp12, label %while.body, label %while.end, !dbg !109

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %n.addr, align 4, !dbg !115
  %9 = load i32, i32* %d, align 4, !dbg !118
  %rem14 = srem i32 %8, %9, !dbg !119
  %tobool15 = icmp ne i32 %rem14, 0, !dbg !119
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !120

if.then16:                                        ; preds = %while.body
  store i8 0, i8* %retval, align 1, !dbg !121
  br label %return, !dbg !121

if.end17:                                         ; preds = %while.body
  %10 = load i32, i32* %d, align 4, !dbg !122
  %add = add nsw i32 %10, 2, !dbg !122
  store i32 %add, i32* %d, align 4, !dbg !122
  %11 = load i32, i32* %n.addr, align 4, !dbg !123
  %12 = load i32, i32* %d, align 4, !dbg !125
  %rem18 = srem i32 %11, %12, !dbg !126
  %tobool19 = icmp ne i32 %rem18, 0, !dbg !126
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !127

if.then20:                                        ; preds = %if.end17
  store i8 0, i8* %retval, align 1, !dbg !128
  br label %return, !dbg !128

if.end21:                                         ; preds = %if.end17
  %13 = load i32, i32* %d, align 4, !dbg !129
  %add22 = add nsw i32 %13, 4, !dbg !129
  store i32 %add22, i32* %d, align 4, !dbg !129
  br label %while.cond, !dbg !109, !llvm.loop !130

while.end:                                        ; preds = %while.cond
  store i8 1, i8* %retval, align 1, !dbg !132
  br label %return, !dbg !132

return:                                           ; preds = %while.end, %if.then20, %if.then16, %if.then7, %if.then1, %if.then
  %14 = load i8, i8* %retval, align 1, !dbg !133
  ret i8 %14, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %kinds = alloca [3 x i8*], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %c, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i32* %n, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [3 x i8*]* %kinds, metadata !143, metadata !DIExpression()), !dbg !149
  %0 = bitcast [3 x i8*]* %kinds to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8*]* @__const.main.kinds to i8*), i64 24, i1 false), !dbg !149
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !153
  %cmp = icmp slt i32 %1, 3, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %2 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %kinds, i64 0, i64 %idxprom, !dbg !159
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !159
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i8* %3), !dbg !160
  store i32 0, i32* %c, align 4, !dbg !161
  store i32 7, i32* %n, align 4, !dbg !162
  br label %while.body, !dbg !163

while.body:                                       ; preds = %sw.epilog, %for.body
  %4 = load i32, i32* %n, align 4, !dbg !164
  %call1 = call signext i8 @is_brazilian(i32 %4), !dbg !167
  %tobool = icmp ne i8 %call1, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end6, !dbg !168

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %n, align 4, !dbg !169
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %5), !dbg !171
  %6 = load i32, i32* %c, align 4, !dbg !172
  %inc = add nsw i32 %6, 1, !dbg !172
  store i32 %inc, i32* %c, align 4, !dbg !172
  %cmp3 = icmp eq i32 %inc, 20, !dbg !174
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !175

if.then4:                                         ; preds = %if.then
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0)), !dbg !176
  br label %while.end, !dbg !178

if.end:                                           ; preds = %if.then
  br label %if.end6, !dbg !179

if.end6:                                          ; preds = %if.end, %while.body
  %7 = load i32, i32* %i, align 4, !dbg !180
  switch i32 %7, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb8
    i32 2, label %sw.bb9
  ], !dbg !181

sw.bb:                                            ; preds = %if.end6
  %8 = load i32, i32* %n, align 4, !dbg !182
  %inc7 = add nsw i32 %8, 1, !dbg !182
  store i32 %inc7, i32* %n, align 4, !dbg !182
  br label %sw.epilog, !dbg !184

sw.bb8:                                           ; preds = %if.end6
  %9 = load i32, i32* %n, align 4, !dbg !185
  %add = add nsw i32 %9, 2, !dbg !185
  store i32 %add, i32* %n, align 4, !dbg !185
  br label %sw.epilog, !dbg !186

sw.bb9:                                           ; preds = %if.end6
  br label %do.body, !dbg !187

do.body:                                          ; preds = %do.cond, %sw.bb9
  %10 = load i32, i32* %n, align 4, !dbg !188
  %add10 = add nsw i32 %10, 2, !dbg !188
  store i32 %add10, i32* %n, align 4, !dbg !188
  br label %do.cond, !dbg !190

do.cond:                                          ; preds = %do.body
  %11 = load i32, i32* %n, align 4, !dbg !191
  %call11 = call signext i8 @is_prime(i32 %11), !dbg !192
  %tobool12 = icmp ne i8 %call11, 0, !dbg !193
  %lnot = xor i1 %tobool12, true, !dbg !193
  br i1 %lnot, label %do.body, label %do.end, !dbg !190, !llvm.loop !194

do.end:                                           ; preds = %do.cond
  br label %sw.epilog, !dbg !196

sw.epilog:                                        ; preds = %do.end, %sw.bb8, %sw.bb, %if.end6
  br label %while.body, !dbg !163, !llvm.loop !197

while.end:                                        ; preds = %if.then4
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %while.end
  %12 = load i32, i32* %i, align 4, !dbg !200
  %inc13 = add nsw i32 %12, 1, !dbg !200
  store i32 %inc13, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  store i32 7, i32* %n, align 4, !dbg !204
  store i32 0, i32* %c, align 4, !dbg !206
  br label %for.cond14, !dbg !207

for.cond14:                                       ; preds = %for.inc22, %for.end
  %13 = load i32, i32* %c, align 4, !dbg !208
  %cmp15 = icmp slt i32 %13, 100000, !dbg !210
  br i1 %cmp15, label %for.body16, label %for.end24, !dbg !211

for.body16:                                       ; preds = %for.cond14
  %14 = load i32, i32* %n, align 4, !dbg !212
  %call17 = call signext i8 @is_brazilian(i32 %14), !dbg !215
  %tobool18 = icmp ne i8 %call17, 0, !dbg !215
  br i1 %tobool18, label %if.then19, label %if.end21, !dbg !216

if.then19:                                        ; preds = %for.body16
  %15 = load i32, i32* %c, align 4, !dbg !217
  %inc20 = add nsw i32 %15, 1, !dbg !217
  store i32 %inc20, i32* %c, align 4, !dbg !217
  br label %if.end21, !dbg !218

if.end21:                                         ; preds = %if.then19, %for.body16
  br label %for.inc22, !dbg !219

for.inc22:                                        ; preds = %if.end21
  %16 = load i32, i32* %n, align 4, !dbg !220
  %inc23 = add nsw i32 %16, 1, !dbg !220
  store i32 %inc23, i32* %n, align 4, !dbg !220
  br label %for.cond14, !dbg !221, !llvm.loop !222

for.end24:                                        ; preds = %for.cond14
  %17 = load i32, i32* %n, align 4, !dbg !224
  %sub = sub nsw i32 %17, 1, !dbg !225
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0), i32 %sub), !dbg !226
  ret i32 0, !dbg !227
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "brazillian_numbers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/brazillian_numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!35 = !DILocation(line: 12, column: 21, scope: !28)
!36 = !DILocation(line: 13, column: 10, scope: !29)
!37 = !DILocation(line: 13, column: 7, scope: !29)
!38 = distinct !{!38, !24, !39}
!39 = !DILocation(line: 14, column: 3, scope: !7)
!40 = !DILocation(line: 15, column: 3, scope: !7)
!41 = !DILocation(line: 16, column: 1, scope: !7)
!42 = distinct !DISubprogram(name: "is_brazilian", scope: !1, file: !1, line: 18, type: !43, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!10, !12}
!45 = !DILocalVariable(name: "n", arg: 1, scope: !42, file: !1, line: 18, type: !12)
!46 = !DILocation(line: 18, column: 23, scope: !42)
!47 = !DILocalVariable(name: "b", scope: !42, file: !1, line: 19, type: !12)
!48 = !DILocation(line: 19, column: 7, scope: !42)
!49 = !DILocation(line: 20, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !1, line: 20, column: 7)
!51 = !DILocation(line: 20, column: 9, scope: !50)
!52 = !DILocation(line: 20, column: 7, scope: !42)
!53 = !DILocation(line: 20, column: 14, scope: !50)
!54 = !DILocation(line: 21, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !42, file: !1, line: 21, column: 7)
!56 = !DILocation(line: 21, column: 11, scope: !55)
!57 = !DILocation(line: 21, column: 16, scope: !55)
!58 = !DILocation(line: 21, column: 19, scope: !55)
!59 = !DILocation(line: 21, column: 21, scope: !55)
!60 = !DILocation(line: 21, column: 7, scope: !42)
!61 = !DILocation(line: 21, column: 27, scope: !55)
!62 = !DILocation(line: 22, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !42, file: !1, line: 22, column: 3)
!64 = !DILocation(line: 22, column: 8, scope: !63)
!65 = !DILocation(line: 22, column: 15, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 22, column: 3)
!67 = !DILocation(line: 22, column: 19, scope: !66)
!68 = !DILocation(line: 22, column: 21, scope: !66)
!69 = !DILocation(line: 22, column: 17, scope: !66)
!70 = !DILocation(line: 22, column: 3, scope: !63)
!71 = !DILocation(line: 23, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 23, column: 9)
!73 = distinct !DILexicalBlock(scope: !66, file: !1, line: 22, column: 31)
!74 = !DILocation(line: 23, column: 24, scope: !72)
!75 = !DILocation(line: 23, column: 9, scope: !72)
!76 = !DILocation(line: 23, column: 9, scope: !73)
!77 = !DILocation(line: 23, column: 28, scope: !72)
!78 = !DILocation(line: 24, column: 3, scope: !73)
!79 = !DILocation(line: 22, column: 26, scope: !66)
!80 = !DILocation(line: 22, column: 3, scope: !66)
!81 = distinct !{!81, !70, !82}
!82 = !DILocation(line: 24, column: 3, scope: !63)
!83 = !DILocation(line: 25, column: 3, scope: !42)
!84 = !DILocation(line: 26, column: 1, scope: !42)
!85 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 28, type: !43, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "n", arg: 1, scope: !85, file: !1, line: 28, type: !12)
!87 = !DILocation(line: 28, column: 19, scope: !85)
!88 = !DILocalVariable(name: "d", scope: !85, file: !1, line: 29, type: !12)
!89 = !DILocation(line: 29, column: 7, scope: !85)
!90 = !DILocation(line: 30, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 30, column: 7)
!92 = !DILocation(line: 30, column: 9, scope: !91)
!93 = !DILocation(line: 30, column: 7, scope: !85)
!94 = !DILocation(line: 30, column: 14, scope: !91)
!95 = !DILocation(line: 31, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !85, file: !1, line: 31, column: 7)
!97 = !DILocation(line: 31, column: 11, scope: !96)
!98 = !DILocation(line: 31, column: 7, scope: !85)
!99 = !DILocation(line: 31, column: 24, scope: !96)
!100 = !DILocation(line: 31, column: 26, scope: !96)
!101 = !DILocation(line: 31, column: 17, scope: !96)
!102 = !DILocation(line: 32, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !85, file: !1, line: 32, column: 7)
!104 = !DILocation(line: 32, column: 11, scope: !103)
!105 = !DILocation(line: 32, column: 7, scope: !85)
!106 = !DILocation(line: 32, column: 24, scope: !103)
!107 = !DILocation(line: 32, column: 26, scope: !103)
!108 = !DILocation(line: 32, column: 17, scope: !103)
!109 = !DILocation(line: 33, column: 3, scope: !85)
!110 = !DILocation(line: 33, column: 10, scope: !85)
!111 = !DILocation(line: 33, column: 14, scope: !85)
!112 = !DILocation(line: 33, column: 12, scope: !85)
!113 = !DILocation(line: 33, column: 19, scope: !85)
!114 = !DILocation(line: 33, column: 16, scope: !85)
!115 = !DILocation(line: 34, column: 11, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 34, column: 9)
!117 = distinct !DILexicalBlock(scope: !85, file: !1, line: 33, column: 22)
!118 = !DILocation(line: 34, column: 15, scope: !116)
!119 = !DILocation(line: 34, column: 13, scope: !116)
!120 = !DILocation(line: 34, column: 9, scope: !117)
!121 = !DILocation(line: 34, column: 19, scope: !116)
!122 = !DILocation(line: 35, column: 7, scope: !117)
!123 = !DILocation(line: 36, column: 11, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !1, line: 36, column: 9)
!125 = !DILocation(line: 36, column: 15, scope: !124)
!126 = !DILocation(line: 36, column: 13, scope: !124)
!127 = !DILocation(line: 36, column: 9, scope: !117)
!128 = !DILocation(line: 36, column: 19, scope: !124)
!129 = !DILocation(line: 37, column: 7, scope: !117)
!130 = distinct !{!130, !109, !131}
!131 = !DILocation(line: 38, column: 3, scope: !85)
!132 = !DILocation(line: 39, column: 3, scope: !85)
!133 = !DILocation(line: 40, column: 1, scope: !85)
!134 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !135, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DISubroutineType(types: !136)
!136 = !{!12}
!137 = !DILocalVariable(name: "i", scope: !134, file: !1, line: 43, type: !12)
!138 = !DILocation(line: 43, column: 7, scope: !134)
!139 = !DILocalVariable(name: "c", scope: !134, file: !1, line: 43, type: !12)
!140 = !DILocation(line: 43, column: 10, scope: !134)
!141 = !DILocalVariable(name: "n", scope: !134, file: !1, line: 43, type: !12)
!142 = !DILocation(line: 43, column: 13, scope: !134)
!143 = !DILocalVariable(name: "kinds", scope: !134, file: !1, line: 44, type: !144)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !145, size: 192, elements: !147)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!147 = !{!148}
!148 = !DISubrange(count: 3)
!149 = !DILocation(line: 44, column: 15, scope: !134)
!150 = !DILocation(line: 45, column: 10, scope: !151)
!151 = distinct !DILexicalBlock(scope: !134, file: !1, line: 45, column: 3)
!152 = !DILocation(line: 45, column: 8, scope: !151)
!153 = !DILocation(line: 45, column: 15, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !1, line: 45, column: 3)
!155 = !DILocation(line: 45, column: 17, scope: !154)
!156 = !DILocation(line: 45, column: 3, scope: !151)
!157 = !DILocation(line: 46, column: 52, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !1, line: 45, column: 27)
!159 = !DILocation(line: 46, column: 46, scope: !158)
!160 = !DILocation(line: 46, column: 5, scope: !158)
!161 = !DILocation(line: 47, column: 7, scope: !158)
!162 = !DILocation(line: 48, column: 7, scope: !158)
!163 = !DILocation(line: 49, column: 5, scope: !158)
!164 = !DILocation(line: 50, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !1, line: 50, column: 11)
!166 = distinct !DILexicalBlock(scope: !158, file: !1, line: 49, column: 18)
!167 = !DILocation(line: 50, column: 11, scope: !165)
!168 = !DILocation(line: 50, column: 11, scope: !166)
!169 = !DILocation(line: 51, column: 23, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !1, line: 50, column: 28)
!171 = !DILocation(line: 51, column: 9, scope: !170)
!172 = !DILocation(line: 52, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !1, line: 52, column: 13)
!174 = !DILocation(line: 52, column: 17, scope: !173)
!175 = !DILocation(line: 52, column: 13, scope: !170)
!176 = !DILocation(line: 53, column: 11, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !1, line: 52, column: 24)
!178 = !DILocation(line: 54, column: 11, scope: !177)
!179 = !DILocation(line: 56, column: 7, scope: !170)
!180 = !DILocation(line: 57, column: 15, scope: !166)
!181 = !DILocation(line: 57, column: 7, scope: !166)
!182 = !DILocation(line: 58, column: 18, scope: !183)
!183 = distinct !DILexicalBlock(scope: !166, file: !1, line: 57, column: 18)
!184 = !DILocation(line: 58, column: 22, scope: !183)
!185 = !DILocation(line: 59, column: 19, scope: !183)
!186 = !DILocation(line: 59, column: 25, scope: !183)
!187 = !DILocation(line: 61, column: 17, scope: !183)
!188 = !DILocation(line: 62, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !183, file: !1, line: 61, column: 20)
!190 = !DILocation(line: 63, column: 17, scope: !189)
!191 = !DILocation(line: 63, column: 36, scope: !183)
!192 = !DILocation(line: 63, column: 27, scope: !183)
!193 = !DILocation(line: 63, column: 26, scope: !183)
!194 = distinct !{!194, !187, !195}
!195 = !DILocation(line: 63, column: 38, scope: !183)
!196 = !DILocation(line: 64, column: 17, scope: !183)
!197 = distinct !{!197, !163, !198}
!198 = !DILocation(line: 66, column: 5, scope: !158)
!199 = !DILocation(line: 67, column: 3, scope: !158)
!200 = !DILocation(line: 45, column: 22, scope: !154)
!201 = !DILocation(line: 45, column: 3, scope: !154)
!202 = distinct !{!202, !156, !203}
!203 = !DILocation(line: 67, column: 3, scope: !151)
!204 = !DILocation(line: 69, column: 10, scope: !205)
!205 = distinct !DILexicalBlock(scope: !134, file: !1, line: 69, column: 3)
!206 = !DILocation(line: 69, column: 17, scope: !205)
!207 = !DILocation(line: 69, column: 8, scope: !205)
!208 = !DILocation(line: 69, column: 22, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !1, line: 69, column: 3)
!210 = !DILocation(line: 69, column: 24, scope: !209)
!211 = !DILocation(line: 69, column: 3, scope: !205)
!212 = !DILocation(line: 70, column: 22, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !1, line: 70, column: 9)
!214 = distinct !DILexicalBlock(scope: !209, file: !1, line: 69, column: 39)
!215 = !DILocation(line: 70, column: 9, scope: !213)
!216 = !DILocation(line: 70, column: 9, scope: !214)
!217 = !DILocation(line: 70, column: 27, scope: !213)
!218 = !DILocation(line: 70, column: 26, scope: !213)
!219 = !DILocation(line: 71, column: 3, scope: !214)
!220 = !DILocation(line: 69, column: 34, scope: !209)
!221 = !DILocation(line: 69, column: 3, scope: !209)
!222 = distinct !{!222, !211, !223}
!223 = !DILocation(line: 71, column: 3, scope: !205)
!224 = !DILocation(line: 72, column: 50, scope: !134)
!225 = !DILocation(line: 72, column: 52, scope: !134)
!226 = !DILocation(line: 72, column: 3, scope: !134)
!227 = !DILocation(line: 73, column: 3, scope: !134)
