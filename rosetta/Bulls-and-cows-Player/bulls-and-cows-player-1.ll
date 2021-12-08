; ModuleID = 'bulls-and-cows-player-1.ll'
source_filename = "bulls-and-cows-player-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"--------+--------------------\0A\00", align 1
@line = dso_local global i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@len = dso_local global i32 0, align 4, !dbg !6
@__const.get_digits.d = private unnamed_addr constant [10 x i8] c"123456789\00", align 1
@list = common dso_local global i8* null, align 8, !dbg !9
@.str.1 = private unnamed_addr constant [57 x i8] c"Guess %2d| %s    (from: %d)\0AScore   | %d bull, %d cow\0A%s\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"%sSecret  | %s\0A%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @irand(i32 %n) #0 !dbg !19 {
entry:
  %n.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %rand_max = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %r, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %rand_max, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %n.addr, align 4, !dbg !28
  %rem = srem i32 2147483647, %0, !dbg !29
  %sub = sub nsw i32 2147483647, %rem, !dbg !30
  store i32 %sub, i32* %rand_max, align 4, !dbg !27
  br label %do.body, !dbg !31

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 @rand() #6, !dbg !32
  store i32 %call, i32* %r, align 4, !dbg !34
  br label %do.cond, !dbg !35

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %r, align 4, !dbg !36
  %2 = load i32, i32* %rand_max, align 4, !dbg !37
  %cmp = icmp sge i32 %1, %2, !dbg !38
  br i1 %cmp, label %do.body, label %do.end, !dbg !35, !llvm.loop !39

do.end:                                           ; preds = %do.cond
  %3 = load i32, i32* %r, align 4, !dbg !41
  %4 = load i32, i32* %rand_max, align 4, !dbg !42
  %5 = load i32, i32* %n.addr, align 4, !dbg !43
  %div = sdiv i32 %4, %5, !dbg !44
  %div1 = sdiv i32 %3, %div, !dbg !45
  ret i32 %div1, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @get_digits(i32 %n, i8* %ret) #0 !dbg !47 {
entry:
  %n.addr = alloca i32, align 4
  %ret.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %d = alloca [10 x i8], align 1
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8* %ret, i8** %ret.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ret.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %j, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [10 x i8]* %d, metadata !58, metadata !DIExpression()), !dbg !62
  %0 = bitcast [10 x i8]* %d to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.get_digits.d, i32 0, i32 0), i64 10, i1 false), !dbg !62
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !66
  %2 = load i32, i32* %n.addr, align 4, !dbg !68
  %cmp = icmp slt i32 %1, %2, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !71
  %sub = sub nsw i32 9, %3, !dbg !73
  %call = call i32 @irand(i32 %sub), !dbg !74
  store i32 %call, i32* %j, align 4, !dbg !75
  %4 = load i32, i32* %i, align 4, !dbg !76
  %5 = load i32, i32* %j, align 4, !dbg !77
  %add = add nsw i32 %4, %5, !dbg !78
  %idxprom = sext i32 %add to i64, !dbg !79
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom, !dbg !79
  %6 = load i8, i8* %arrayidx, align 1, !dbg !79
  %7 = load i8*, i8** %ret.addr, align 8, !dbg !80
  %8 = load i32, i32* %i, align 4, !dbg !81
  %idxprom1 = sext i32 %8 to i64, !dbg !80
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %idxprom1, !dbg !80
  store i8 %6, i8* %arrayidx2, align 1, !dbg !82
  %9 = load i32, i32* %j, align 4, !dbg !83
  %tobool = icmp ne i32 %9, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !86
  %idxprom3 = sext i32 %10 to i64, !dbg !87
  %arrayidx4 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom3, !dbg !87
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !87
  %12 = load i32, i32* %i, align 4, !dbg !88
  %13 = load i32, i32* %j, align 4, !dbg !89
  %add5 = add nsw i32 %12, %13, !dbg !90
  %idxprom6 = sext i32 %add5 to i64, !dbg !91
  %arrayidx7 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom6, !dbg !91
  store i8 %11, i8* %arrayidx7, align 1, !dbg !92
  %14 = load i8*, i8** %ret.addr, align 8, !dbg !93
  %15 = load i32, i32* %i, align 4, !dbg !94
  %idxprom8 = sext i32 %15 to i64, !dbg !93
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i64 %idxprom8, !dbg !93
  %16 = load i8, i8* %arrayidx9, align 1, !dbg !93
  %17 = load i32, i32* %i, align 4, !dbg !95
  %idxprom10 = sext i32 %17 to i64, !dbg !96
  %arrayidx11 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom10, !dbg !96
  store i8 %16, i8* %arrayidx11, align 1, !dbg !97
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %if.end
  %18 = load i32, i32* %i, align 4, !dbg !99
  %inc = add nsw i32 %18, 1, !dbg !99
  store i32 %inc, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %19 = load i8*, i8** %ret.addr, align 8, !dbg !103
  ret i8* %19, !dbg !104
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @score(i8* %digits, i8* %guess, i32* %cow) #0 !dbg !105 {
entry:
  %digits.addr = alloca i8*, align 8
  %guess.addr = alloca i8*, align 8
  %cow.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %bits = alloca i32, align 4
  %bull = alloca i32, align 4
  store i8* %digits, i8** %digits.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %digits.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* %guess, i8** %guess.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %guess.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i32* %cow, i32** %cow.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %cow.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %bits, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %bits, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %bull, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i32*, i32** %cow.addr, align 8, !dbg !121
  store i32 0, i32* %0, align 4, !dbg !122
  store i32 0, i32* %bull, align 4, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %guess.addr, align 8, !dbg !126
  %2 = load i32, i32* %i, align 4, !dbg !128
  %idxprom = sext i32 %2 to i64, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !126
  %3 = load i8, i8* %arrayidx, align 1, !dbg !126
  %conv = sext i8 %3 to i32, !dbg !126
  %cmp = icmp ne i32 %conv, 0, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %guess.addr, align 8, !dbg !131
  %5 = load i32, i32* %i, align 4, !dbg !133
  %idxprom2 = sext i32 %5 to i64, !dbg !131
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 %idxprom2, !dbg !131
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !131
  %conv4 = sext i8 %6 to i32, !dbg !131
  %7 = load i8*, i8** %digits.addr, align 8, !dbg !134
  %8 = load i32, i32* %i, align 4, !dbg !135
  %idxprom5 = sext i32 %8 to i64, !dbg !134
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %idxprom5, !dbg !134
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !134
  %conv7 = sext i8 %9 to i32, !dbg !134
  %cmp8 = icmp ne i32 %conv4, %conv7, !dbg !136
  br i1 %cmp8, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %for.body
  %10 = load i8*, i8** %digits.addr, align 8, !dbg !138
  %11 = load i32, i32* %i, align 4, !dbg !138
  %idxprom10 = sext i32 %11 to i64, !dbg !138
  %arrayidx11 = getelementptr inbounds i8, i8* %10, i64 %idxprom10, !dbg !138
  %12 = load i8, i8* %arrayidx11, align 1, !dbg !138
  %conv12 = sext i8 %12 to i32, !dbg !138
  %sub = sub nsw i32 %conv12, 49, !dbg !138
  %shl = shl i32 1, %sub, !dbg !138
  %13 = load i32, i32* %bits, align 4, !dbg !139
  %or = or i32 %13, %shl, !dbg !139
  store i32 %or, i32* %bits, align 4, !dbg !139
  br label %if.end, !dbg !140

if.else:                                          ; preds = %for.body
  %14 = load i32, i32* %bull, align 4, !dbg !141
  %inc = add nsw i32 %14, 1, !dbg !141
  store i32 %inc, i32* %bull, align 4, !dbg !141
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4, !dbg !143
  %inc13 = add nsw i32 %15, 1, !dbg !143
  store i32 %inc13, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !147

while.cond:                                       ; preds = %while.body, %for.end
  %16 = load i32, i32* %i, align 4, !dbg !148
  %dec = add nsw i32 %16, -1, !dbg !148
  store i32 %dec, i32* %i, align 4, !dbg !148
  %tobool = icmp ne i32 %16, 0, !dbg !147
  br i1 %tobool, label %while.body, label %while.end, !dbg !147

while.body:                                       ; preds = %while.cond
  %17 = load i32, i32* %bits, align 4, !dbg !149
  %18 = load i8*, i8** %guess.addr, align 8, !dbg !150
  %19 = load i32, i32* %i, align 4, !dbg !150
  %idxprom14 = sext i32 %19 to i64, !dbg !150
  %arrayidx15 = getelementptr inbounds i8, i8* %18, i64 %idxprom14, !dbg !150
  %20 = load i8, i8* %arrayidx15, align 1, !dbg !150
  %conv16 = sext i8 %20 to i32, !dbg !150
  %sub17 = sub nsw i32 %conv16, 49, !dbg !150
  %shl18 = shl i32 1, %sub17, !dbg !150
  %and = and i32 %17, %shl18, !dbg !151
  %cmp19 = icmp ne i32 %and, 0, !dbg !152
  %conv20 = zext i1 %cmp19 to i32, !dbg !152
  %21 = load i32*, i32** %cow.addr, align 8, !dbg !153
  %22 = load i32, i32* %21, align 4, !dbg !154
  %add = add nsw i32 %22, %conv20, !dbg !154
  store i32 %add, i32* %21, align 4, !dbg !154
  br label %while.cond, !dbg !147, !llvm.loop !155

while.end:                                        ; preds = %while.cond
  %23 = load i32, i32* %bull, align 4, !dbg !157
  ret i32 %23, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @pick(i32 %n, i32 %got, i32 %marker, i8* %buf) #0 !dbg !159 {
entry:
  %n.addr = alloca i32, align 4
  %got.addr = alloca i32, align 4
  %marker.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %bits = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 %got, i32* %got.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %got.addr, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 %marker, i32* %marker.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %marker.addr, metadata !166, metadata !DIExpression()), !dbg !167
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i32* %bits, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 1, i32* %bits, align 4, !dbg !173
  %0 = load i32, i32* %got.addr, align 4, !dbg !174
  %1 = load i32, i32* %n.addr, align 4, !dbg !176
  %cmp = icmp sge i32 %0, %1, !dbg !177
  br i1 %cmp, label %if.then, label %if.else, !dbg !178

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** @list, align 8, !dbg !179
  %3 = load i32, i32* %n.addr, align 4, !dbg !180
  %add = add nsw i32 %3, 1, !dbg !181
  %4 = load i32, i32* @len, align 4, !dbg !182
  %inc = add nsw i32 %4, 1, !dbg !182
  store i32 %inc, i32* @len, align 4, !dbg !182
  %mul = mul nsw i32 %add, %4, !dbg !183
  %idx.ext = sext i32 %mul to i64, !dbg !184
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !184
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !185
  %call = call i8* @strcpy(i8* %add.ptr, i8* %5) #6, !dbg !186
  br label %if.end7, !dbg !186

if.else:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.else
  %6 = load i32, i32* %i, align 4, !dbg !190
  %cmp1 = icmp slt i32 %6, 9, !dbg !192
  br i1 %cmp1, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %marker.addr, align 4, !dbg !194
  %8 = load i32, i32* %bits, align 4, !dbg !197
  %and = and i32 %7, %8, !dbg !198
  %tobool = icmp ne i32 %and, 0, !dbg !198
  br i1 %tobool, label %if.then2, label %if.end, !dbg !199

if.then2:                                         ; preds = %for.body
  br label %for.inc, !dbg !200

if.end:                                           ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !201
  %add3 = add nsw i32 %9, 49, !dbg !202
  %conv = trunc i32 %add3 to i8, !dbg !201
  %10 = load i8*, i8** %buf.addr, align 8, !dbg !203
  %11 = load i32, i32* %got.addr, align 4, !dbg !204
  %idxprom = sext i32 %11 to i64, !dbg !203
  %arrayidx = getelementptr inbounds i8, i8* %10, i64 %idxprom, !dbg !203
  store i8 %conv, i8* %arrayidx, align 1, !dbg !205
  %12 = load i32, i32* %n.addr, align 4, !dbg !206
  %13 = load i32, i32* %got.addr, align 4, !dbg !207
  %add4 = add nsw i32 %13, 1, !dbg !208
  %14 = load i32, i32* %marker.addr, align 4, !dbg !209
  %15 = load i32, i32* %bits, align 4, !dbg !210
  %or = or i32 %14, %15, !dbg !211
  %16 = load i8*, i8** %buf.addr, align 8, !dbg !212
  call void @pick(i32 %12, i32 %add4, i32 %or, i8* %16), !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %if.end, %if.then2
  %17 = load i32, i32* %i, align 4, !dbg !215
  %inc5 = add nsw i32 %17, 1, !dbg !215
  store i32 %inc5, i32* %i, align 4, !dbg !215
  %18 = load i32, i32* %bits, align 4, !dbg !216
  %mul6 = mul nsw i32 %18, 2, !dbg !216
  store i32 %mul6, i32* %bits, align 4, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  br label %if.end7

if.end7:                                          ; preds = %for.end, %if.then
  ret void, !dbg !220
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @filter(i8* %buf, i32 %n, i32 %bull, i32 %cow) #0 !dbg !221 {
entry:
  %buf.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %bull.addr = alloca i32, align 4
  %cow.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %ptr = alloca i8*, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 %bull, i32* %bull.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bull.addr, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 %cow, i32* %cow.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cow.addr, metadata !230, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32* %i, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 0, i32* %i, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata i32* %c, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !236, metadata !DIExpression()), !dbg !237
  %0 = load i8*, i8** @list, align 8, !dbg !238
  store i8* %0, i8** %ptr, align 8, !dbg !237
  br label %while.cond, !dbg !239

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i32, i32* %i, align 4, !dbg !240
  %2 = load i32, i32* @len, align 4, !dbg !241
  %cmp = icmp slt i32 %1, %2, !dbg !242
  br i1 %cmp, label %while.body, label %while.end, !dbg !239

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %ptr, align 8, !dbg !243
  %4 = load i8*, i8** %buf.addr, align 8, !dbg !246
  %call = call i32 @score(i8* %3, i8* %4, i32* %c), !dbg !247
  %5 = load i32, i32* %bull.addr, align 4, !dbg !248
  %cmp1 = icmp ne i32 %call, %5, !dbg !249
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !250

lor.lhs.false:                                    ; preds = %while.body
  %6 = load i32, i32* %c, align 4, !dbg !251
  %7 = load i32, i32* %cow.addr, align 4, !dbg !252
  %cmp2 = icmp ne i32 %6, %7, !dbg !253
  br i1 %cmp2, label %if.then, label %if.else, !dbg !254

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %8 = load i8*, i8** %ptr, align 8, !dbg !255
  %9 = load i8*, i8** @list, align 8, !dbg !256
  %10 = load i32, i32* @len, align 4, !dbg !257
  %dec = add nsw i32 %10, -1, !dbg !257
  store i32 %dec, i32* @len, align 4, !dbg !257
  %11 = load i32, i32* %n.addr, align 4, !dbg !258
  %add = add nsw i32 %11, 1, !dbg !259
  %mul = mul nsw i32 %dec, %add, !dbg !260
  %idx.ext = sext i32 %mul to i64, !dbg !261
  %add.ptr = getelementptr inbounds i8, i8* %9, i64 %idx.ext, !dbg !261
  %call3 = call i8* @strcpy(i8* %8, i8* %add.ptr) #6, !dbg !262
  br label %if.end, !dbg !262

if.else:                                          ; preds = %lor.lhs.false
  %12 = load i32, i32* %n.addr, align 4, !dbg !263
  %add4 = add nsw i32 %12, 1, !dbg !264
  %13 = load i8*, i8** %ptr, align 8, !dbg !265
  %idx.ext5 = sext i32 %add4 to i64, !dbg !265
  %add.ptr6 = getelementptr inbounds i8, i8* %13, i64 %idx.ext5, !dbg !265
  store i8* %add.ptr6, i8** %ptr, align 8, !dbg !265
  %14 = load i32, i32* %i, align 4, !dbg !266
  %inc = add nsw i32 %14, 1, !dbg !266
  store i32 %inc, i32* %i, align 4, !dbg !266
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !239, !llvm.loop !267

while.end:                                        ; preds = %while.cond
  ret void, !dbg !269
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @game(i8* %tgt, i8* %buf) #0 !dbg !270 {
entry:
  %tgt.addr = alloca i8*, align 8
  %buf.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %p = alloca i32, align 4
  %bull = alloca i32, align 4
  %cow = alloca i32, align 4
  %n = alloca i32, align 4
  store i8* %tgt, i8** %tgt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %tgt.addr, metadata !273, metadata !DIExpression()), !dbg !274
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata i32* %i, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata i32* %p, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %bull, metadata !281, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.declare(metadata i32* %cow, metadata !283, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.declare(metadata i32* %n, metadata !285, metadata !DIExpression()), !dbg !286
  %0 = load i8*, i8** %tgt.addr, align 8, !dbg !287
  %call = call i64 @strlen(i8* %0) #7, !dbg !288
  %conv = trunc i64 %call to i32, !dbg !288
  store i32 %conv, i32* %n, align 4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !289
  store i32 1, i32* %p, align 4, !dbg !291
  br label %for.cond, !dbg !292

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !293
  %2 = load i32, i32* %n, align 4, !dbg !295
  %cmp = icmp slt i32 %1, %2, !dbg !296
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !297

land.rhs:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !298
  %sub = sub nsw i32 9, %3, !dbg !299
  %4 = load i32, i32* %p, align 4, !dbg !300
  %mul = mul nsw i32 %4, %sub, !dbg !300
  store i32 %mul, i32* %p, align 4, !dbg !300
  %tobool = icmp ne i32 %mul, 0, !dbg !297
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %tobool, %land.rhs ], !dbg !301
  br i1 %5, label %for.body, label %for.end, !dbg !302

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %6, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end:                                          ; preds = %land.end
  %7 = load i32, i32* %p, align 4, !dbg !307
  %8 = load i32, i32* %n, align 4, !dbg !308
  %add = add nsw i32 %8, 1, !dbg !309
  %mul2 = mul nsw i32 %7, %add, !dbg !310
  %conv3 = sext i32 %mul2 to i64, !dbg !307
  %call4 = call noalias i8* @malloc(i64 %conv3) #6, !dbg !311
  store i8* %call4, i8** @list, align 8, !dbg !312
  %9 = load i32, i32* %n, align 4, !dbg !313
  %10 = load i8*, i8** %buf.addr, align 8, !dbg !314
  call void @pick(i32 %9, i32 0, i32 0, i8* %10), !dbg !315
  store i32 1, i32* %p, align 4, !dbg !316
  store i32 0, i32* %bull, align 4, !dbg !318
  br label %for.cond5, !dbg !319

for.cond5:                                        ; preds = %for.inc15, %for.end
  %11 = load i32, i32* %n, align 4, !dbg !320
  %12 = load i32, i32* %bull, align 4, !dbg !322
  %sub6 = sub nsw i32 %11, %12, !dbg !323
  %tobool7 = icmp ne i32 %sub6, 0, !dbg !324
  br i1 %tobool7, label %for.body8, label %for.end17, !dbg !324

for.body8:                                        ; preds = %for.cond5
  %13 = load i8*, i8** %buf.addr, align 8, !dbg !325
  %14 = load i8*, i8** @list, align 8, !dbg !327
  %15 = load i32, i32* %n, align 4, !dbg !328
  %add9 = add nsw i32 %15, 1, !dbg !329
  %16 = load i32, i32* @len, align 4, !dbg !330
  %call10 = call i32 @irand(i32 %16), !dbg !331
  %mul11 = mul nsw i32 %add9, %call10, !dbg !332
  %idx.ext = sext i32 %mul11 to i64, !dbg !333
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %idx.ext, !dbg !333
  %call12 = call i8* @strcpy(i8* %13, i8* %add.ptr) #6, !dbg !334
  %17 = load i8*, i8** %tgt.addr, align 8, !dbg !335
  %18 = load i8*, i8** %buf.addr, align 8, !dbg !336
  %call13 = call i32 @score(i8* %17, i8* %18, i32* %cow), !dbg !337
  store i32 %call13, i32* %bull, align 4, !dbg !338
  %19 = load i32, i32* %p, align 4, !dbg !339
  %20 = load i8*, i8** %buf.addr, align 8, !dbg !340
  %21 = load i32, i32* @len, align 4, !dbg !341
  %22 = load i32, i32* %bull, align 4, !dbg !342
  %23 = load i32, i32* %cow, align 4, !dbg !343
  %24 = load i8*, i8** @line, align 8, !dbg !344
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i64 0, i64 0), i32 %19, i8* %20, i32 %21, i32 %22, i32 %23, i8* %24), !dbg !345
  %25 = load i8*, i8** %buf.addr, align 8, !dbg !346
  %26 = load i32, i32* %n, align 4, !dbg !347
  %27 = load i32, i32* %bull, align 4, !dbg !348
  %28 = load i32, i32* %cow, align 4, !dbg !349
  call void @filter(i8* %25, i32 %26, i32 %27, i32 %28), !dbg !350
  br label %for.inc15, !dbg !351

for.inc15:                                        ; preds = %for.body8
  %29 = load i32, i32* %p, align 4, !dbg !352
  %inc16 = add nsw i32 %29, 1, !dbg !352
  store i32 %inc16, i32* %p, align 4, !dbg !352
  br label %for.cond5, !dbg !353, !llvm.loop !354

for.end17:                                        ; preds = %for.cond5
  ret void, !dbg !356
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !357 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %secret = alloca [10 x i8], align 1
  %answer = alloca [10 x i8], align 1
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !361, metadata !DIExpression()), !dbg !362
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !363, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.declare(metadata i32* %n, metadata !365, metadata !DIExpression()), !dbg !366
  %0 = load i32, i32* %c.addr, align 4, !dbg !367
  %cmp = icmp sgt i32 %0, 1, !dbg !368
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !367

cond.true:                                        ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !369
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !369
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !369
  %call = call i32 @atoi(i8* %2) #7, !dbg !370
  br label %cond.end, !dbg !367

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !367

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 4, %cond.false ], !dbg !367
  store i32 %cond, i32* %n, align 4, !dbg !366
  call void @llvm.dbg.declare(metadata [10 x i8]* %secret, metadata !371, metadata !DIExpression()), !dbg !372
  %3 = bitcast [10 x i8]* %secret to i8*, !dbg !372
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 0, i64 10, i1 false), !dbg !372
  call void @llvm.dbg.declare(metadata [10 x i8]* %answer, metadata !373, metadata !DIExpression()), !dbg !374
  %4 = bitcast [10 x i8]* %answer to i8*, !dbg !374
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 0, i64 10, i1 false), !dbg !374
  %call1 = call i64 @time(i64* null) #6, !dbg !375
  %conv = trunc i64 %call1 to i32, !dbg !375
  call void @srand(i32 %conv) #6, !dbg !376
  %5 = load i8*, i8** @line, align 8, !dbg !377
  %6 = load i32, i32* %n, align 4, !dbg !378
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %secret, i64 0, i64 0, !dbg !379
  %call2 = call i8* @get_digits(i32 %6, i8* %arraydecay), !dbg !380
  %7 = load i8*, i8** @line, align 8, !dbg !381
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %5, i8* %call2, i8* %7), !dbg !382
  %arraydecay4 = getelementptr inbounds [10 x i8], [10 x i8]* %secret, i64 0, i64 0, !dbg !383
  %arraydecay5 = getelementptr inbounds [10 x i8], [10 x i8]* %answer, i64 0, i64 0, !dbg !384
  call void @game(i8* %arraydecay4, i8* %arraydecay5), !dbg !385
  ret i32 0, !dbg !386
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "line", scope: !2, file: !3, line: 7, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "bulls-and-cows-player-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bulls-and-cows-Player")
!4 = !{}
!5 = !{!0, !6, !9}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "len", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "list", scope: !2, file: !3, line: 6, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!19 = distinct !DISubprogram(name: "irand", scope: !3, file: !3, line: 10, type: !20, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{!8, !8}
!22 = !DILocalVariable(name: "n", arg: 1, scope: !19, file: !3, line: 10, type: !8)
!23 = !DILocation(line: 10, column: 15, scope: !19)
!24 = !DILocalVariable(name: "r", scope: !19, file: !3, line: 12, type: !8)
!25 = !DILocation(line: 12, column: 6, scope: !19)
!26 = !DILocalVariable(name: "rand_max", scope: !19, file: !3, line: 12, type: !8)
!27 = !DILocation(line: 12, column: 9, scope: !19)
!28 = !DILocation(line: 12, column: 43, scope: !19)
!29 = !DILocation(line: 12, column: 41, scope: !19)
!30 = !DILocation(line: 12, column: 29, scope: !19)
!31 = !DILocation(line: 13, column: 2, scope: !19)
!32 = !DILocation(line: 13, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !3, line: 13, column: 5)
!34 = !DILocation(line: 13, column: 9, scope: !33)
!35 = !DILocation(line: 13, column: 19, scope: !33)
!36 = !DILocation(line: 13, column: 27, scope: !19)
!37 = !DILocation(line: 13, column: 32, scope: !19)
!38 = !DILocation(line: 13, column: 29, scope: !19)
!39 = distinct !{!39, !31, !40}
!40 = !DILocation(line: 13, column: 40, scope: !19)
!41 = !DILocation(line: 14, column: 9, scope: !19)
!42 = !DILocation(line: 14, column: 14, scope: !19)
!43 = !DILocation(line: 14, column: 25, scope: !19)
!44 = !DILocation(line: 14, column: 23, scope: !19)
!45 = !DILocation(line: 14, column: 11, scope: !19)
!46 = !DILocation(line: 14, column: 2, scope: !19)
!47 = distinct !DISubprogram(name: "get_digits", scope: !3, file: !3, line: 17, type: !48, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!11, !8, !11}
!50 = !DILocalVariable(name: "n", arg: 1, scope: !47, file: !3, line: 17, type: !8)
!51 = !DILocation(line: 17, column: 22, scope: !47)
!52 = !DILocalVariable(name: "ret", arg: 2, scope: !47, file: !3, line: 17, type: !11)
!53 = !DILocation(line: 17, column: 31, scope: !47)
!54 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 19, type: !8)
!55 = !DILocation(line: 19, column: 6, scope: !47)
!56 = !DILocalVariable(name: "j", scope: !47, file: !3, line: 19, type: !8)
!57 = !DILocation(line: 19, column: 9, scope: !47)
!58 = !DILocalVariable(name: "d", scope: !47, file: !3, line: 20, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 10)
!62 = !DILocation(line: 20, column: 7, scope: !47)
!63 = !DILocation(line: 22, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !47, file: !3, line: 22, column: 2)
!65 = !DILocation(line: 22, column: 7, scope: !64)
!66 = !DILocation(line: 22, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !3, line: 22, column: 2)
!68 = !DILocation(line: 22, column: 18, scope: !67)
!69 = !DILocation(line: 22, column: 16, scope: !67)
!70 = !DILocation(line: 22, column: 2, scope: !64)
!71 = !DILocation(line: 23, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 22, column: 26)
!73 = !DILocation(line: 23, column: 15, scope: !72)
!74 = !DILocation(line: 23, column: 7, scope: !72)
!75 = !DILocation(line: 23, column: 5, scope: !72)
!76 = !DILocation(line: 24, column: 14, scope: !72)
!77 = !DILocation(line: 24, column: 18, scope: !72)
!78 = !DILocation(line: 24, column: 16, scope: !72)
!79 = !DILocation(line: 24, column: 12, scope: !72)
!80 = !DILocation(line: 24, column: 3, scope: !72)
!81 = !DILocation(line: 24, column: 7, scope: !72)
!82 = !DILocation(line: 24, column: 10, scope: !72)
!83 = !DILocation(line: 25, column: 7, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !3, line: 25, column: 7)
!85 = !DILocation(line: 25, column: 7, scope: !72)
!86 = !DILocation(line: 25, column: 23, scope: !84)
!87 = !DILocation(line: 25, column: 21, scope: !84)
!88 = !DILocation(line: 25, column: 12, scope: !84)
!89 = !DILocation(line: 25, column: 16, scope: !84)
!90 = !DILocation(line: 25, column: 14, scope: !84)
!91 = !DILocation(line: 25, column: 10, scope: !84)
!92 = !DILocation(line: 25, column: 19, scope: !84)
!93 = !DILocation(line: 25, column: 34, scope: !84)
!94 = !DILocation(line: 25, column: 38, scope: !84)
!95 = !DILocation(line: 25, column: 29, scope: !84)
!96 = !DILocation(line: 25, column: 27, scope: !84)
!97 = !DILocation(line: 25, column: 32, scope: !84)
!98 = !DILocation(line: 26, column: 2, scope: !72)
!99 = !DILocation(line: 22, column: 22, scope: !67)
!100 = !DILocation(line: 22, column: 2, scope: !67)
!101 = distinct !{!101, !70, !102}
!102 = !DILocation(line: 26, column: 2, scope: !64)
!103 = !DILocation(line: 27, column: 9, scope: !47)
!104 = !DILocation(line: 27, column: 2, scope: !47)
!105 = distinct !DISubprogram(name: "score", scope: !3, file: !3, line: 31, type: !106, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!8, !13, !13, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!109 = !DILocalVariable(name: "digits", arg: 1, scope: !105, file: !3, line: 31, type: !13)
!110 = !DILocation(line: 31, column: 23, scope: !105)
!111 = !DILocalVariable(name: "guess", arg: 2, scope: !105, file: !3, line: 31, type: !13)
!112 = !DILocation(line: 31, column: 43, scope: !105)
!113 = !DILocalVariable(name: "cow", arg: 3, scope: !105, file: !3, line: 31, type: !108)
!114 = !DILocation(line: 31, column: 55, scope: !105)
!115 = !DILocalVariable(name: "i", scope: !105, file: !3, line: 33, type: !8)
!116 = !DILocation(line: 33, column: 6, scope: !105)
!117 = !DILocalVariable(name: "bits", scope: !105, file: !3, line: 33, type: !8)
!118 = !DILocation(line: 33, column: 9, scope: !105)
!119 = !DILocalVariable(name: "bull", scope: !105, file: !3, line: 33, type: !8)
!120 = !DILocation(line: 33, column: 19, scope: !105)
!121 = !DILocation(line: 33, column: 27, scope: !105)
!122 = !DILocation(line: 33, column: 31, scope: !105)
!123 = !DILocation(line: 35, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !105, file: !3, line: 35, column: 2)
!125 = !DILocation(line: 35, column: 7, scope: !124)
!126 = !DILocation(line: 35, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 35, column: 2)
!128 = !DILocation(line: 35, column: 20, scope: !127)
!129 = !DILocation(line: 35, column: 23, scope: !127)
!130 = !DILocation(line: 35, column: 2, scope: !124)
!131 = !DILocation(line: 36, column: 7, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !3, line: 36, column: 7)
!133 = !DILocation(line: 36, column: 13, scope: !132)
!134 = !DILocation(line: 36, column: 19, scope: !132)
!135 = !DILocation(line: 36, column: 26, scope: !132)
!136 = !DILocation(line: 36, column: 16, scope: !132)
!137 = !DILocation(line: 36, column: 7, scope: !127)
!138 = !DILocation(line: 37, column: 12, scope: !132)
!139 = !DILocation(line: 37, column: 9, scope: !132)
!140 = !DILocation(line: 37, column: 4, scope: !132)
!141 = !DILocation(line: 38, column: 8, scope: !132)
!142 = !DILocation(line: 36, column: 27, scope: !132)
!143 = !DILocation(line: 35, column: 33, scope: !127)
!144 = !DILocation(line: 35, column: 2, scope: !127)
!145 = distinct !{!145, !130, !146}
!146 = !DILocation(line: 38, column: 10, scope: !124)
!147 = !DILocation(line: 40, column: 2, scope: !105)
!148 = !DILocation(line: 40, column: 10, scope: !105)
!149 = !DILocation(line: 40, column: 24, scope: !105)
!150 = !DILocation(line: 40, column: 31, scope: !105)
!151 = !DILocation(line: 40, column: 29, scope: !105)
!152 = !DILocation(line: 40, column: 47, scope: !105)
!153 = !DILocation(line: 40, column: 15, scope: !105)
!154 = !DILocation(line: 40, column: 19, scope: !105)
!155 = distinct !{!155, !147, !156}
!156 = !DILocation(line: 40, column: 51, scope: !105)
!157 = !DILocation(line: 42, column: 9, scope: !105)
!158 = !DILocation(line: 42, column: 2, scope: !105)
!159 = distinct !DISubprogram(name: "pick", scope: !3, file: !3, line: 45, type: !160, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DISubroutineType(types: !161)
!161 = !{null, !8, !8, !8, !11}
!162 = !DILocalVariable(name: "n", arg: 1, scope: !159, file: !3, line: 45, type: !8)
!163 = !DILocation(line: 45, column: 15, scope: !159)
!164 = !DILocalVariable(name: "got", arg: 2, scope: !159, file: !3, line: 45, type: !8)
!165 = !DILocation(line: 45, column: 22, scope: !159)
!166 = !DILocalVariable(name: "marker", arg: 3, scope: !159, file: !3, line: 45, type: !8)
!167 = !DILocation(line: 45, column: 31, scope: !159)
!168 = !DILocalVariable(name: "buf", arg: 4, scope: !159, file: !3, line: 45, type: !11)
!169 = !DILocation(line: 45, column: 45, scope: !159)
!170 = !DILocalVariable(name: "i", scope: !159, file: !3, line: 47, type: !8)
!171 = !DILocation(line: 47, column: 6, scope: !159)
!172 = !DILocalVariable(name: "bits", scope: !159, file: !3, line: 47, type: !8)
!173 = !DILocation(line: 47, column: 9, scope: !159)
!174 = !DILocation(line: 48, column: 6, scope: !175)
!175 = distinct !DILexicalBlock(scope: !159, file: !3, line: 48, column: 6)
!176 = !DILocation(line: 48, column: 13, scope: !175)
!177 = !DILocation(line: 48, column: 10, scope: !175)
!178 = !DILocation(line: 48, column: 6, scope: !159)
!179 = !DILocation(line: 49, column: 10, scope: !175)
!180 = !DILocation(line: 49, column: 18, scope: !175)
!181 = !DILocation(line: 49, column: 20, scope: !175)
!182 = !DILocation(line: 49, column: 30, scope: !175)
!183 = !DILocation(line: 49, column: 25, scope: !175)
!184 = !DILocation(line: 49, column: 15, scope: !175)
!185 = !DILocation(line: 49, column: 34, scope: !175)
!186 = !DILocation(line: 49, column: 3, scope: !175)
!187 = !DILocation(line: 51, column: 10, scope: !188)
!188 = distinct !DILexicalBlock(scope: !175, file: !3, line: 51, column: 3)
!189 = !DILocation(line: 51, column: 8, scope: !188)
!190 = !DILocation(line: 51, column: 15, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !3, line: 51, column: 3)
!192 = !DILocation(line: 51, column: 17, scope: !191)
!193 = !DILocation(line: 51, column: 3, scope: !188)
!194 = !DILocation(line: 52, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 52, column: 8)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 51, column: 38)
!197 = !DILocation(line: 52, column: 18, scope: !195)
!198 = !DILocation(line: 52, column: 16, scope: !195)
!199 = !DILocation(line: 52, column: 8, scope: !196)
!200 = !DILocation(line: 52, column: 25, scope: !195)
!201 = !DILocation(line: 53, column: 15, scope: !196)
!202 = !DILocation(line: 53, column: 17, scope: !196)
!203 = !DILocation(line: 53, column: 4, scope: !196)
!204 = !DILocation(line: 53, column: 8, scope: !196)
!205 = !DILocation(line: 53, column: 13, scope: !196)
!206 = !DILocation(line: 54, column: 9, scope: !196)
!207 = !DILocation(line: 54, column: 12, scope: !196)
!208 = !DILocation(line: 54, column: 16, scope: !196)
!209 = !DILocation(line: 54, column: 21, scope: !196)
!210 = !DILocation(line: 54, column: 30, scope: !196)
!211 = !DILocation(line: 54, column: 28, scope: !196)
!212 = !DILocation(line: 54, column: 36, scope: !196)
!213 = !DILocation(line: 54, column: 4, scope: !196)
!214 = !DILocation(line: 55, column: 3, scope: !196)
!215 = !DILocation(line: 51, column: 23, scope: !191)
!216 = !DILocation(line: 51, column: 32, scope: !191)
!217 = !DILocation(line: 51, column: 3, scope: !191)
!218 = distinct !{!218, !193, !219}
!219 = !DILocation(line: 55, column: 3, scope: !188)
!220 = !DILocation(line: 56, column: 1, scope: !159)
!221 = distinct !DISubprogram(name: "filter", scope: !3, file: !3, line: 58, type: !222, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !13, !8, !8, !8}
!224 = !DILocalVariable(name: "buf", arg: 1, scope: !221, file: !3, line: 58, type: !13)
!225 = !DILocation(line: 58, column: 25, scope: !221)
!226 = !DILocalVariable(name: "n", arg: 2, scope: !221, file: !3, line: 58, type: !8)
!227 = !DILocation(line: 58, column: 34, scope: !221)
!228 = !DILocalVariable(name: "bull", arg: 3, scope: !221, file: !3, line: 58, type: !8)
!229 = !DILocation(line: 58, column: 41, scope: !221)
!230 = !DILocalVariable(name: "cow", arg: 4, scope: !221, file: !3, line: 58, type: !8)
!231 = !DILocation(line: 58, column: 51, scope: !221)
!232 = !DILocalVariable(name: "i", scope: !221, file: !3, line: 60, type: !8)
!233 = !DILocation(line: 60, column: 6, scope: !221)
!234 = !DILocalVariable(name: "c", scope: !221, file: !3, line: 60, type: !8)
!235 = !DILocation(line: 60, column: 13, scope: !221)
!236 = !DILocalVariable(name: "ptr", scope: !221, file: !3, line: 61, type: !11)
!237 = !DILocation(line: 61, column: 8, scope: !221)
!238 = !DILocation(line: 61, column: 14, scope: !221)
!239 = !DILocation(line: 63, column: 2, scope: !221)
!240 = !DILocation(line: 63, column: 9, scope: !221)
!241 = !DILocation(line: 63, column: 13, scope: !221)
!242 = !DILocation(line: 63, column: 11, scope: !221)
!243 = !DILocation(line: 64, column: 13, scope: !244)
!244 = distinct !DILexicalBlock(scope: !245, file: !3, line: 64, column: 7)
!245 = distinct !DILexicalBlock(scope: !221, file: !3, line: 63, column: 18)
!246 = !DILocation(line: 64, column: 18, scope: !244)
!247 = !DILocation(line: 64, column: 7, scope: !244)
!248 = !DILocation(line: 64, column: 30, scope: !244)
!249 = !DILocation(line: 64, column: 27, scope: !244)
!250 = !DILocation(line: 64, column: 35, scope: !244)
!251 = !DILocation(line: 64, column: 38, scope: !244)
!252 = !DILocation(line: 64, column: 43, scope: !244)
!253 = !DILocation(line: 64, column: 40, scope: !244)
!254 = !DILocation(line: 64, column: 7, scope: !245)
!255 = !DILocation(line: 65, column: 11, scope: !244)
!256 = !DILocation(line: 65, column: 16, scope: !244)
!257 = !DILocation(line: 65, column: 23, scope: !244)
!258 = !DILocation(line: 65, column: 32, scope: !244)
!259 = !DILocation(line: 65, column: 34, scope: !244)
!260 = !DILocation(line: 65, column: 29, scope: !244)
!261 = !DILocation(line: 65, column: 21, scope: !244)
!262 = !DILocation(line: 65, column: 4, scope: !244)
!263 = !DILocation(line: 67, column: 11, scope: !244)
!264 = !DILocation(line: 67, column: 13, scope: !244)
!265 = !DILocation(line: 67, column: 8, scope: !244)
!266 = !DILocation(line: 67, column: 19, scope: !244)
!267 = distinct !{!267, !239, !268}
!268 = !DILocation(line: 68, column: 2, scope: !221)
!269 = !DILocation(line: 69, column: 1, scope: !221)
!270 = distinct !DISubprogram(name: "game", scope: !3, file: !3, line: 71, type: !271, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!271 = !DISubroutineType(types: !272)
!272 = !{null, !13, !11}
!273 = !DILocalVariable(name: "tgt", arg: 1, scope: !270, file: !3, line: 71, type: !13)
!274 = !DILocation(line: 71, column: 23, scope: !270)
!275 = !DILocalVariable(name: "buf", arg: 2, scope: !270, file: !3, line: 71, type: !11)
!276 = !DILocation(line: 71, column: 34, scope: !270)
!277 = !DILocalVariable(name: "i", scope: !270, file: !3, line: 73, type: !8)
!278 = !DILocation(line: 73, column: 6, scope: !270)
!279 = !DILocalVariable(name: "p", scope: !270, file: !3, line: 73, type: !8)
!280 = !DILocation(line: 73, column: 9, scope: !270)
!281 = !DILocalVariable(name: "bull", scope: !270, file: !3, line: 73, type: !8)
!282 = !DILocation(line: 73, column: 12, scope: !270)
!283 = !DILocalVariable(name: "cow", scope: !270, file: !3, line: 73, type: !8)
!284 = !DILocation(line: 73, column: 18, scope: !270)
!285 = !DILocalVariable(name: "n", scope: !270, file: !3, line: 73, type: !8)
!286 = !DILocation(line: 73, column: 23, scope: !270)
!287 = !DILocation(line: 73, column: 34, scope: !270)
!288 = !DILocation(line: 73, column: 27, scope: !270)
!289 = !DILocation(line: 75, column: 9, scope: !290)
!290 = distinct !DILexicalBlock(scope: !270, file: !3, line: 75, column: 2)
!291 = !DILocation(line: 75, column: 16, scope: !290)
!292 = !DILocation(line: 75, column: 7, scope: !290)
!293 = !DILocation(line: 75, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !3, line: 75, column: 2)
!295 = !DILocation(line: 75, column: 25, scope: !294)
!296 = !DILocation(line: 75, column: 23, scope: !294)
!297 = !DILocation(line: 75, column: 27, scope: !294)
!298 = !DILocation(line: 75, column: 40, scope: !294)
!299 = !DILocation(line: 75, column: 38, scope: !294)
!300 = !DILocation(line: 75, column: 33, scope: !294)
!301 = !DILocation(line: 0, scope: !294)
!302 = !DILocation(line: 75, column: 2, scope: !290)
!303 = !DILocation(line: 75, column: 45, scope: !294)
!304 = !DILocation(line: 75, column: 2, scope: !294)
!305 = distinct !{!305, !302, !306}
!306 = !DILocation(line: 75, column: 48, scope: !290)
!307 = !DILocation(line: 76, column: 16, scope: !270)
!308 = !DILocation(line: 76, column: 21, scope: !270)
!309 = !DILocation(line: 76, column: 23, scope: !270)
!310 = !DILocation(line: 76, column: 18, scope: !270)
!311 = !DILocation(line: 76, column: 9, scope: !270)
!312 = !DILocation(line: 76, column: 7, scope: !270)
!313 = !DILocation(line: 78, column: 7, scope: !270)
!314 = !DILocation(line: 78, column: 16, scope: !270)
!315 = !DILocation(line: 78, column: 2, scope: !270)
!316 = !DILocation(line: 79, column: 9, scope: !317)
!317 = distinct !DILexicalBlock(scope: !270, file: !3, line: 79, column: 2)
!318 = !DILocation(line: 79, column: 19, scope: !317)
!319 = !DILocation(line: 79, column: 7, scope: !317)
!320 = !DILocation(line: 79, column: 24, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !3, line: 79, column: 2)
!322 = !DILocation(line: 79, column: 28, scope: !321)
!323 = !DILocation(line: 79, column: 26, scope: !321)
!324 = !DILocation(line: 79, column: 2, scope: !317)
!325 = !DILocation(line: 80, column: 10, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !3, line: 79, column: 39)
!327 = !DILocation(line: 80, column: 15, scope: !326)
!328 = !DILocation(line: 80, column: 23, scope: !326)
!329 = !DILocation(line: 80, column: 25, scope: !326)
!330 = !DILocation(line: 80, column: 38, scope: !326)
!331 = !DILocation(line: 80, column: 32, scope: !326)
!332 = !DILocation(line: 80, column: 30, scope: !326)
!333 = !DILocation(line: 80, column: 20, scope: !326)
!334 = !DILocation(line: 80, column: 3, scope: !326)
!335 = !DILocation(line: 81, column: 16, scope: !326)
!336 = !DILocation(line: 81, column: 21, scope: !326)
!337 = !DILocation(line: 81, column: 10, scope: !326)
!338 = !DILocation(line: 81, column: 8, scope: !326)
!339 = !DILocation(line: 85, column: 4, scope: !326)
!340 = !DILocation(line: 85, column: 7, scope: !326)
!341 = !DILocation(line: 85, column: 12, scope: !326)
!342 = !DILocation(line: 85, column: 17, scope: !326)
!343 = !DILocation(line: 85, column: 23, scope: !326)
!344 = !DILocation(line: 85, column: 28, scope: !326)
!345 = !DILocation(line: 83, column: 3, scope: !326)
!346 = !DILocation(line: 87, column: 10, scope: !326)
!347 = !DILocation(line: 87, column: 15, scope: !326)
!348 = !DILocation(line: 87, column: 18, scope: !326)
!349 = !DILocation(line: 87, column: 24, scope: !326)
!350 = !DILocation(line: 87, column: 3, scope: !326)
!351 = !DILocation(line: 88, column: 2, scope: !326)
!352 = !DILocation(line: 79, column: 35, scope: !321)
!353 = !DILocation(line: 79, column: 2, scope: !321)
!354 = distinct !{!354, !324, !355}
!355 = !DILocation(line: 88, column: 2, scope: !317)
!356 = !DILocation(line: 89, column: 1, scope: !270)
!357 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 91, type: !358, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DISubroutineType(types: !359)
!359 = !{!8, !8, !360}
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!361 = !DILocalVariable(name: "c", arg: 1, scope: !357, file: !3, line: 91, type: !8)
!362 = !DILocation(line: 91, column: 14, scope: !357)
!363 = !DILocalVariable(name: "v", arg: 2, scope: !357, file: !3, line: 91, type: !360)
!364 = !DILocation(line: 91, column: 24, scope: !357)
!365 = !DILocalVariable(name: "n", scope: !357, file: !3, line: 93, type: !8)
!366 = !DILocation(line: 93, column: 6, scope: !357)
!367 = !DILocation(line: 93, column: 10, scope: !357)
!368 = !DILocation(line: 93, column: 12, scope: !357)
!369 = !DILocation(line: 93, column: 23, scope: !357)
!370 = !DILocation(line: 93, column: 18, scope: !357)
!371 = !DILocalVariable(name: "secret", scope: !357, file: !3, line: 95, type: !59)
!372 = !DILocation(line: 95, column: 7, scope: !357)
!373 = !DILocalVariable(name: "answer", scope: !357, file: !3, line: 95, type: !59)
!374 = !DILocation(line: 95, column: 24, scope: !357)
!375 = !DILocation(line: 96, column: 8, scope: !357)
!376 = !DILocation(line: 96, column: 2, scope: !357)
!377 = !DILocation(line: 98, column: 31, scope: !357)
!378 = !DILocation(line: 98, column: 48, scope: !357)
!379 = !DILocation(line: 98, column: 51, scope: !357)
!380 = !DILocation(line: 98, column: 37, scope: !357)
!381 = !DILocation(line: 98, column: 60, scope: !357)
!382 = !DILocation(line: 98, column: 2, scope: !357)
!383 = !DILocation(line: 99, column: 7, scope: !357)
!384 = !DILocation(line: 99, column: 15, scope: !357)
!385 = !DILocation(line: 99, column: 2, scope: !357)
!386 = !DILocation(line: 101, column: 2, scope: !357)
