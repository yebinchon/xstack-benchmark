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
  call void @llvm.dbg.value(metadata i32 %n, metadata !22, metadata !DIExpression()), !dbg !23
  %rem = srem i32 2147483647, %n, !dbg !24
  %sub = sub nsw i32 2147483647, %rem, !dbg !25
  call void @llvm.dbg.value(metadata i32 %sub, metadata !26, metadata !DIExpression()), !dbg !23
  br label %do.body, !dbg !27

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 @rand() #6, !dbg !28
  call void @llvm.dbg.value(metadata i32 %call, metadata !30, metadata !DIExpression()), !dbg !23
  br label %do.cond, !dbg !31

do.cond:                                          ; preds = %do.body
  %cmp = icmp sge i32 %call, %sub, !dbg !32
  br i1 %cmp, label %do.body, label %do.end, !dbg !31, !llvm.loop !33

do.end:                                           ; preds = %do.cond
  %div = sdiv i32 %sub, %n, !dbg !35
  %div1 = sdiv i32 %call, %div, !dbg !36
  ret i32 %div1, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @get_digits(i32 %n, i8* %ret) #0 !dbg !38 {
entry:
  %d = alloca [10 x i8], align 1
  call void @llvm.dbg.value(metadata i32 %n, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i8* %ret, metadata !43, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i8]* %d, metadata !44, metadata !DIExpression()), !dbg !48
  %0 = bitcast [10 x i8]* %d to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.get_digits.d, i32 0, i32 0), i64 10, i1 false), !dbg !48
  call void @llvm.dbg.value(metadata i32 0, metadata !49, metadata !DIExpression()), !dbg !42
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !52
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !49, metadata !DIExpression()), !dbg !42
  %cmp = icmp slt i32 %i.0, %n, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 9, %i.0, !dbg !56
  %call = call i32 @irand(i32 %sub), !dbg !58
  call void @llvm.dbg.value(metadata i32 %call, metadata !59, metadata !DIExpression()), !dbg !42
  %add = add nsw i32 %i.0, %call, !dbg !60
  %idxprom = sext i32 %add to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom, !dbg !61
  %1 = load i8, i8* %arrayidx, align 1, !dbg !61
  %idxprom1 = sext i32 %i.0 to i64, !dbg !62
  %arrayidx2 = getelementptr inbounds i8, i8* %ret, i64 %idxprom1, !dbg !62
  store i8 %1, i8* %arrayidx2, align 1, !dbg !63
  %tobool = icmp ne i32 %call, 0, !dbg !64
  br i1 %tobool, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %for.body
  %idxprom3 = sext i32 %i.0 to i64, !dbg !67
  %arrayidx4 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom3, !dbg !67
  %2 = load i8, i8* %arrayidx4, align 1, !dbg !67
  %add5 = add nsw i32 %i.0, %call, !dbg !68
  %idxprom6 = sext i32 %add5 to i64, !dbg !69
  %arrayidx7 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom6, !dbg !69
  store i8 %2, i8* %arrayidx7, align 1, !dbg !70
  %idxprom8 = sext i32 %i.0 to i64, !dbg !71
  %arrayidx9 = getelementptr inbounds i8, i8* %ret, i64 %idxprom8, !dbg !71
  %3 = load i8, i8* %arrayidx9, align 1, !dbg !71
  %idxprom10 = sext i32 %i.0 to i64, !dbg !72
  %arrayidx11 = getelementptr inbounds [10 x i8], [10 x i8]* %d, i64 0, i64 %idxprom10, !dbg !72
  store i8 %3, i8* %arrayidx11, align 1, !dbg !73
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !75
  call void @llvm.dbg.value(metadata i32 %inc, metadata !49, metadata !DIExpression()), !dbg !42
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  ret i8* %ret, !dbg !79
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @score(i8* %digits, i8* %guess, i32* %cow) #0 !dbg !80 {
entry:
  call void @llvm.dbg.value(metadata i8* %digits, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i8* %guess, metadata !86, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32* %cow, metadata !87, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !88, metadata !DIExpression()), !dbg !85
  store i32 0, i32* %cow, align 4, !dbg !89
  call void @llvm.dbg.value(metadata i32 0, metadata !90, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !91, metadata !DIExpression()), !dbg !85
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc13, %for.inc ], !dbg !94
  %bits.0 = phi i32 [ 0, %entry ], [ %bits.1, %for.inc ], !dbg !85
  %bull.0 = phi i32 [ 0, %entry ], [ %bull.1, %for.inc ], !dbg !95
  call void @llvm.dbg.value(metadata i32 %bull.0, metadata !90, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 %bits.0, metadata !88, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !91, metadata !DIExpression()), !dbg !85
  %idxprom = sext i32 %i.0 to i64, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %guess, i64 %idxprom, !dbg !96
  %0 = load i8, i8* %arrayidx, align 1, !dbg !96
  %conv = sext i8 %0 to i32, !dbg !96
  %cmp = icmp ne i32 %conv, 0, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %idxprom2 = sext i32 %i.0 to i64, !dbg !100
  %arrayidx3 = getelementptr inbounds i8, i8* %guess, i64 %idxprom2, !dbg !100
  %1 = load i8, i8* %arrayidx3, align 1, !dbg !100
  %conv4 = sext i8 %1 to i32, !dbg !100
  %idxprom5 = sext i32 %i.0 to i64, !dbg !102
  %arrayidx6 = getelementptr inbounds i8, i8* %digits, i64 %idxprom5, !dbg !102
  %2 = load i8, i8* %arrayidx6, align 1, !dbg !102
  %conv7 = sext i8 %2 to i32, !dbg !102
  %cmp8 = icmp ne i32 %conv4, %conv7, !dbg !103
  br i1 %cmp8, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %for.body
  %idxprom10 = sext i32 %i.0 to i64, !dbg !105
  %arrayidx11 = getelementptr inbounds i8, i8* %digits, i64 %idxprom10, !dbg !105
  %3 = load i8, i8* %arrayidx11, align 1, !dbg !105
  %conv12 = sext i8 %3 to i32, !dbg !105
  %sub = sub nsw i32 %conv12, 49, !dbg !105
  %shl = shl i32 1, %sub, !dbg !105
  %or = or i32 %bits.0, %shl, !dbg !106
  call void @llvm.dbg.value(metadata i32 %or, metadata !88, metadata !DIExpression()), !dbg !85
  br label %if.end, !dbg !107

if.else:                                          ; preds = %for.body
  %inc = add nsw i32 %bull.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i32 %inc, metadata !90, metadata !DIExpression()), !dbg !85
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %bits.1 = phi i32 [ %or, %if.then ], [ %bits.0, %if.else ], !dbg !85
  %bull.1 = phi i32 [ %bull.0, %if.then ], [ %inc, %if.else ], !dbg !85
  call void @llvm.dbg.value(metadata i32 %bull.1, metadata !90, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 %bits.1, metadata !88, metadata !DIExpression()), !dbg !85
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %if.end
  %inc13 = add nsw i32 %i.0, 1, !dbg !110
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !91, metadata !DIExpression()), !dbg !85
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !114

while.cond:                                       ; preds = %while.body, %for.end
  %i.1 = phi i32 [ %i.0, %for.end ], [ %dec, %while.body ], !dbg !85
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !91, metadata !DIExpression()), !dbg !85
  %dec = add nsw i32 %i.1, -1, !dbg !115
  call void @llvm.dbg.value(metadata i32 %dec, metadata !91, metadata !DIExpression()), !dbg !85
  %tobool = icmp ne i32 %i.1, 0, !dbg !114
  br i1 %tobool, label %while.body, label %while.end, !dbg !114

while.body:                                       ; preds = %while.cond
  %idxprom14 = sext i32 %dec to i64, !dbg !116
  %arrayidx15 = getelementptr inbounds i8, i8* %guess, i64 %idxprom14, !dbg !116
  %4 = load i8, i8* %arrayidx15, align 1, !dbg !116
  %conv16 = sext i8 %4 to i32, !dbg !116
  %sub17 = sub nsw i32 %conv16, 49, !dbg !116
  %shl18 = shl i32 1, %sub17, !dbg !116
  %and = and i32 %bits.0, %shl18, !dbg !117
  %cmp19 = icmp ne i32 %and, 0, !dbg !118
  %conv20 = zext i1 %cmp19 to i32, !dbg !118
  %5 = load i32, i32* %cow, align 4, !dbg !119
  %add = add nsw i32 %5, %conv20, !dbg !119
  store i32 %add, i32* %cow, align 4, !dbg !119
  br label %while.cond, !dbg !114, !llvm.loop !120

while.end:                                        ; preds = %while.cond
  ret i32 %bull.0, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @pick(i32 %n, i32 %got, i32 %marker, i8* %buf) #0 !dbg !123 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata i32 %got, metadata !128, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata i32 %marker, metadata !129, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata i8* %buf, metadata !130, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata i32 1, metadata !131, metadata !DIExpression()), !dbg !127
  %cmp = icmp sge i32 %got, %n, !dbg !132
  br i1 %cmp, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** @list, align 8, !dbg !135
  %add = add nsw i32 %n, 1, !dbg !136
  %1 = load i32, i32* @len, align 4, !dbg !137
  %inc = add nsw i32 %1, 1, !dbg !137
  store i32 %inc, i32* @len, align 4, !dbg !137
  %mul = mul nsw i32 %add, %1, !dbg !138
  %idx.ext = sext i32 %mul to i64, !dbg !139
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 %idx.ext, !dbg !139
  %call = call i8* @strcpy(i8* %add.ptr, i8* %buf) #6, !dbg !140
  br label %if.end7, !dbg !140

if.else:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !141, metadata !DIExpression()), !dbg !127
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.else
  %i.0 = phi i32 [ 0, %if.else ], [ %inc5, %for.inc ], !dbg !144
  %bits.0 = phi i32 [ 1, %if.else ], [ %mul6, %for.inc ], !dbg !127
  call void @llvm.dbg.value(metadata i32 %bits.0, metadata !131, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !141, metadata !DIExpression()), !dbg !127
  %cmp1 = icmp slt i32 %i.0, 9, !dbg !145
  br i1 %cmp1, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %and = and i32 %marker, %bits.0, !dbg !148
  %tobool = icmp ne i32 %and, 0, !dbg !148
  br i1 %tobool, label %if.then2, label %if.end, !dbg !151

if.then2:                                         ; preds = %for.body
  br label %for.inc, !dbg !152

if.end:                                           ; preds = %for.body
  %add3 = add nsw i32 %i.0, 49, !dbg !153
  %conv = trunc i32 %add3 to i8, !dbg !154
  %idxprom = sext i32 %got to i64, !dbg !155
  %arrayidx = getelementptr inbounds i8, i8* %buf, i64 %idxprom, !dbg !155
  store i8 %conv, i8* %arrayidx, align 1, !dbg !156
  %add4 = add nsw i32 %got, 1, !dbg !157
  %or = or i32 %marker, %bits.0, !dbg !158
  call void @pick(i32 %n, i32 %add4, i32 %or, i8* %buf), !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %if.end, %if.then2
  %inc5 = add nsw i32 %i.0, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %inc5, metadata !141, metadata !DIExpression()), !dbg !127
  %mul6 = mul nsw i32 %bits.0, 2, !dbg !162
  call void @llvm.dbg.value(metadata i32 %mul6, metadata !131, metadata !DIExpression()), !dbg !127
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  br label %if.end7

if.end7:                                          ; preds = %for.end, %if.then
  ret void, !dbg !166
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @filter(i8* %buf, i32 %n, i32 %bull, i32 %cow) #0 !dbg !167 {
entry:
  %c = alloca i32, align 4
  call void @llvm.dbg.value(metadata i8* %buf, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 %n, metadata !172, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 %bull, metadata !173, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 %cow, metadata !174, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 0, metadata !175, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i32* %c, metadata !176, metadata !DIExpression()), !dbg !177
  %0 = load i8*, i8** @list, align 8, !dbg !178
  call void @llvm.dbg.value(metadata i8* %0, metadata !179, metadata !DIExpression()), !dbg !171
  br label %while.cond, !dbg !180

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %i.1, %if.end ], !dbg !181
  %ptr.0 = phi i8* [ %0, %entry ], [ %ptr.1, %if.end ], !dbg !182
  call void @llvm.dbg.value(metadata i8* %ptr.0, metadata !179, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !175, metadata !DIExpression()), !dbg !171
  %1 = load i32, i32* @len, align 4, !dbg !183
  %cmp = icmp slt i32 %i.0, %1, !dbg !184
  br i1 %cmp, label %while.body, label %while.end, !dbg !180

while.body:                                       ; preds = %while.cond
  %call = call i32 @score(i8* %ptr.0, i8* %buf, i32* %c), !dbg !185
  %cmp1 = icmp ne i32 %call, %bull, !dbg !188
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !189

lor.lhs.false:                                    ; preds = %while.body
  %2 = load i32, i32* %c, align 4, !dbg !190
  %cmp2 = icmp ne i32 %2, %cow, !dbg !191
  br i1 %cmp2, label %if.then, label %if.else, !dbg !192

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %3 = load i8*, i8** @list, align 8, !dbg !193
  %4 = load i32, i32* @len, align 4, !dbg !194
  %dec = add nsw i32 %4, -1, !dbg !194
  store i32 %dec, i32* @len, align 4, !dbg !194
  %add = add nsw i32 %n, 1, !dbg !195
  %mul = mul nsw i32 %dec, %add, !dbg !196
  %idx.ext = sext i32 %mul to i64, !dbg !197
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %idx.ext, !dbg !197
  %call3 = call i8* @strcpy(i8* %ptr.0, i8* %add.ptr) #6, !dbg !198
  br label %if.end, !dbg !198

if.else:                                          ; preds = %lor.lhs.false
  %add4 = add nsw i32 %n, 1, !dbg !199
  %idx.ext5 = sext i32 %add4 to i64, !dbg !200
  %add.ptr6 = getelementptr inbounds i8, i8* %ptr.0, i64 %idx.ext5, !dbg !200
  call void @llvm.dbg.value(metadata i8* %add.ptr6, metadata !179, metadata !DIExpression()), !dbg !171
  %inc = add nsw i32 %i.0, 1, !dbg !201
  call void @llvm.dbg.value(metadata i32 %inc, metadata !175, metadata !DIExpression()), !dbg !171
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %i.1 = phi i32 [ %i.0, %if.then ], [ %inc, %if.else ], !dbg !171
  %ptr.1 = phi i8* [ %ptr.0, %if.then ], [ %add.ptr6, %if.else ], !dbg !171
  call void @llvm.dbg.value(metadata i8* %ptr.1, metadata !179, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !175, metadata !DIExpression()), !dbg !171
  br label %while.cond, !dbg !180, !llvm.loop !202

while.end:                                        ; preds = %while.cond
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @game(i8* %tgt, i8* %buf) #0 !dbg !205 {
entry:
  %cow = alloca i32, align 4
  call void @llvm.dbg.value(metadata i8* %tgt, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i8* %buf, metadata !210, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i32* %cow, metadata !211, metadata !DIExpression()), !dbg !212
  %call = call i64 @strlen(i8* %tgt) #7, !dbg !213
  %conv = trunc i64 %call to i32, !dbg !213
  call void @llvm.dbg.value(metadata i32 %conv, metadata !214, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 1, metadata !216, metadata !DIExpression()), !dbg !209
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !219
  %p.0 = phi i32 [ 1, %entry ], [ %p.1, %for.inc ], !dbg !219
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !216, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !215, metadata !DIExpression()), !dbg !209
  %cmp = icmp slt i32 %i.0, %conv, !dbg !220
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !222

land.rhs:                                         ; preds = %for.cond
  %sub = sub nsw i32 9, %i.0, !dbg !223
  %mul = mul nsw i32 %p.0, %sub, !dbg !224
  call void @llvm.dbg.value(metadata i32 %mul, metadata !216, metadata !DIExpression()), !dbg !209
  %tobool = icmp ne i32 %mul, 0, !dbg !222
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %p.1 = phi i32 [ %mul, %land.rhs ], [ %p.0, %for.cond ], !dbg !219
  %0 = phi i1 [ false, %for.cond ], [ %tobool, %land.rhs ], !dbg !225
  call void @llvm.dbg.value(metadata i32 %p.1, metadata !216, metadata !DIExpression()), !dbg !209
  br i1 %0, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !227
  call void @llvm.dbg.value(metadata i32 %inc, metadata !215, metadata !DIExpression()), !dbg !209
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %land.end
  %add = add nsw i32 %conv, 1, !dbg !231
  %mul2 = mul nsw i32 %p.1, %add, !dbg !232
  %conv3 = sext i32 %mul2 to i64, !dbg !233
  %call4 = call noalias i8* @malloc(i64 %conv3) #6, !dbg !234
  store i8* %call4, i8** @list, align 8, !dbg !235
  call void @pick(i32 %conv, i32 0, i32 0, i8* %buf), !dbg !236
  call void @llvm.dbg.value(metadata i32 1, metadata !216, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 0, metadata !237, metadata !DIExpression()), !dbg !209
  br label %for.cond5, !dbg !238

for.cond5:                                        ; preds = %for.inc15, %for.end
  %p.2 = phi i32 [ 1, %for.end ], [ %inc16, %for.inc15 ], !dbg !240
  %bull.0 = phi i32 [ 0, %for.end ], [ %call13, %for.inc15 ], !dbg !240
  call void @llvm.dbg.value(metadata i32 %bull.0, metadata !237, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 %p.2, metadata !216, metadata !DIExpression()), !dbg !209
  %sub6 = sub nsw i32 %conv, %bull.0, !dbg !241
  %tobool7 = icmp ne i32 %sub6, 0, !dbg !243
  br i1 %tobool7, label %for.body8, label %for.end17, !dbg !243

for.body8:                                        ; preds = %for.cond5
  %1 = load i8*, i8** @list, align 8, !dbg !244
  %add9 = add nsw i32 %conv, 1, !dbg !246
  %2 = load i32, i32* @len, align 4, !dbg !247
  %call10 = call i32 @irand(i32 %2), !dbg !248
  %mul11 = mul nsw i32 %add9, %call10, !dbg !249
  %idx.ext = sext i32 %mul11 to i64, !dbg !250
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %idx.ext, !dbg !250
  %call12 = call i8* @strcpy(i8* %buf, i8* %add.ptr) #6, !dbg !251
  %call13 = call i32 @score(i8* %tgt, i8* %buf, i32* %cow), !dbg !252
  call void @llvm.dbg.value(metadata i32 %call13, metadata !237, metadata !DIExpression()), !dbg !209
  %3 = load i32, i32* @len, align 4, !dbg !253
  %4 = load i32, i32* %cow, align 4, !dbg !254
  %5 = load i8*, i8** @line, align 8, !dbg !255
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i64 0, i64 0), i32 %p.2, i8* %buf, i32 %3, i32 %call13, i32 %4, i8* %5), !dbg !256
  %6 = load i32, i32* %cow, align 4, !dbg !257
  call void @filter(i8* %buf, i32 %conv, i32 %call13, i32 %6), !dbg !258
  br label %for.inc15, !dbg !259

for.inc15:                                        ; preds = %for.body8
  %inc16 = add nsw i32 %p.2, 1, !dbg !260
  call void @llvm.dbg.value(metadata i32 %inc16, metadata !216, metadata !DIExpression()), !dbg !209
  br label %for.cond5, !dbg !261, !llvm.loop !262

for.end17:                                        ; preds = %for.cond5
  ret void, !dbg !264
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !265 {
entry:
  %secret = alloca [10 x i8], align 1
  %answer = alloca [10 x i8], align 1
  call void @llvm.dbg.value(metadata i32 %c, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.value(metadata i8** %v, metadata !271, metadata !DIExpression()), !dbg !270
  %cmp = icmp sgt i32 %c, 1, !dbg !272
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !273

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 1, !dbg !274
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !274
  %call = call i32 @atoi(i8* %0) #7, !dbg !275
  br label %cond.end, !dbg !273

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !273

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 4, %cond.false ], !dbg !273
  call void @llvm.dbg.value(metadata i32 %cond, metadata !276, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [10 x i8]* %secret, metadata !277, metadata !DIExpression()), !dbg !278
  %1 = bitcast [10 x i8]* %secret to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 10, i1 false), !dbg !278
  call void @llvm.dbg.declare(metadata [10 x i8]* %answer, metadata !279, metadata !DIExpression()), !dbg !280
  %2 = bitcast [10 x i8]* %answer to i8*, !dbg !280
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 10, i1 false), !dbg !280
  %call1 = call i64 @time(i64* null) #6, !dbg !281
  %conv = trunc i64 %call1 to i32, !dbg !281
  call void @srand(i32 %conv) #6, !dbg !282
  %3 = load i8*, i8** @line, align 8, !dbg !283
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %secret, i64 0, i64 0, !dbg !284
  %call2 = call i8* @get_digits(i32 %cond, i8* %arraydecay), !dbg !285
  %4 = load i8*, i8** @line, align 8, !dbg !286
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* %3, i8* %call2, i8* %4), !dbg !287
  %arraydecay4 = getelementptr inbounds [10 x i8], [10 x i8]* %secret, i64 0, i64 0, !dbg !288
  %arraydecay5 = getelementptr inbounds [10 x i8], [10 x i8]* %answer, i64 0, i64 0, !dbg !289
  call void @game(i8* %arraydecay4, i8* %arraydecay5), !dbg !290
  ret i32 0, !dbg !291
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!23 = !DILocation(line: 0, scope: !19)
!24 = !DILocation(line: 12, column: 41, scope: !19)
!25 = !DILocation(line: 12, column: 29, scope: !19)
!26 = !DILocalVariable(name: "rand_max", scope: !19, file: !3, line: 12, type: !8)
!27 = !DILocation(line: 13, column: 2, scope: !19)
!28 = !DILocation(line: 13, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !19, file: !3, line: 13, column: 5)
!30 = !DILocalVariable(name: "r", scope: !19, file: !3, line: 12, type: !8)
!31 = !DILocation(line: 13, column: 19, scope: !29)
!32 = !DILocation(line: 13, column: 29, scope: !19)
!33 = distinct !{!33, !27, !34}
!34 = !DILocation(line: 13, column: 40, scope: !19)
!35 = !DILocation(line: 14, column: 23, scope: !19)
!36 = !DILocation(line: 14, column: 11, scope: !19)
!37 = !DILocation(line: 14, column: 2, scope: !19)
!38 = distinct !DISubprogram(name: "get_digits", scope: !3, file: !3, line: 17, type: !39, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!11, !8, !11}
!41 = !DILocalVariable(name: "n", arg: 1, scope: !38, file: !3, line: 17, type: !8)
!42 = !DILocation(line: 0, scope: !38)
!43 = !DILocalVariable(name: "ret", arg: 2, scope: !38, file: !3, line: 17, type: !11)
!44 = !DILocalVariable(name: "d", scope: !38, file: !3, line: 20, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 10)
!48 = !DILocation(line: 20, column: 7, scope: !38)
!49 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 19, type: !8)
!50 = !DILocation(line: 22, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !3, line: 22, column: 2)
!52 = !DILocation(line: 0, scope: !51)
!53 = !DILocation(line: 22, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 22, column: 2)
!55 = !DILocation(line: 22, column: 2, scope: !51)
!56 = !DILocation(line: 23, column: 15, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !3, line: 22, column: 26)
!58 = !DILocation(line: 23, column: 7, scope: !57)
!59 = !DILocalVariable(name: "j", scope: !38, file: !3, line: 19, type: !8)
!60 = !DILocation(line: 24, column: 16, scope: !57)
!61 = !DILocation(line: 24, column: 12, scope: !57)
!62 = !DILocation(line: 24, column: 3, scope: !57)
!63 = !DILocation(line: 24, column: 10, scope: !57)
!64 = !DILocation(line: 25, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !57, file: !3, line: 25, column: 7)
!66 = !DILocation(line: 25, column: 7, scope: !57)
!67 = !DILocation(line: 25, column: 21, scope: !65)
!68 = !DILocation(line: 25, column: 14, scope: !65)
!69 = !DILocation(line: 25, column: 10, scope: !65)
!70 = !DILocation(line: 25, column: 19, scope: !65)
!71 = !DILocation(line: 25, column: 34, scope: !65)
!72 = !DILocation(line: 25, column: 27, scope: !65)
!73 = !DILocation(line: 25, column: 32, scope: !65)
!74 = !DILocation(line: 26, column: 2, scope: !57)
!75 = !DILocation(line: 22, column: 22, scope: !54)
!76 = !DILocation(line: 22, column: 2, scope: !54)
!77 = distinct !{!77, !55, !78}
!78 = !DILocation(line: 26, column: 2, scope: !51)
!79 = !DILocation(line: 27, column: 2, scope: !38)
!80 = distinct !DISubprogram(name: "score", scope: !3, file: !3, line: 31, type: !81, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!8, !13, !13, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!84 = !DILocalVariable(name: "digits", arg: 1, scope: !80, file: !3, line: 31, type: !13)
!85 = !DILocation(line: 0, scope: !80)
!86 = !DILocalVariable(name: "guess", arg: 2, scope: !80, file: !3, line: 31, type: !13)
!87 = !DILocalVariable(name: "cow", arg: 3, scope: !80, file: !3, line: 31, type: !83)
!88 = !DILocalVariable(name: "bits", scope: !80, file: !3, line: 33, type: !8)
!89 = !DILocation(line: 33, column: 31, scope: !80)
!90 = !DILocalVariable(name: "bull", scope: !80, file: !3, line: 33, type: !8)
!91 = !DILocalVariable(name: "i", scope: !80, file: !3, line: 33, type: !8)
!92 = !DILocation(line: 35, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !80, file: !3, line: 35, column: 2)
!94 = !DILocation(line: 0, scope: !93)
!95 = !DILocation(line: 33, column: 19, scope: !80)
!96 = !DILocation(line: 35, column: 14, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 35, column: 2)
!98 = !DILocation(line: 35, column: 23, scope: !97)
!99 = !DILocation(line: 35, column: 2, scope: !93)
!100 = !DILocation(line: 36, column: 7, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 36, column: 7)
!102 = !DILocation(line: 36, column: 19, scope: !101)
!103 = !DILocation(line: 36, column: 16, scope: !101)
!104 = !DILocation(line: 36, column: 7, scope: !97)
!105 = !DILocation(line: 37, column: 12, scope: !101)
!106 = !DILocation(line: 37, column: 9, scope: !101)
!107 = !DILocation(line: 37, column: 4, scope: !101)
!108 = !DILocation(line: 38, column: 8, scope: !101)
!109 = !DILocation(line: 36, column: 27, scope: !101)
!110 = !DILocation(line: 35, column: 33, scope: !97)
!111 = !DILocation(line: 35, column: 2, scope: !97)
!112 = distinct !{!112, !99, !113}
!113 = !DILocation(line: 38, column: 10, scope: !93)
!114 = !DILocation(line: 40, column: 2, scope: !80)
!115 = !DILocation(line: 40, column: 10, scope: !80)
!116 = !DILocation(line: 40, column: 31, scope: !80)
!117 = !DILocation(line: 40, column: 29, scope: !80)
!118 = !DILocation(line: 40, column: 47, scope: !80)
!119 = !DILocation(line: 40, column: 19, scope: !80)
!120 = distinct !{!120, !114, !121}
!121 = !DILocation(line: 40, column: 51, scope: !80)
!122 = !DILocation(line: 42, column: 2, scope: !80)
!123 = distinct !DISubprogram(name: "pick", scope: !3, file: !3, line: 45, type: !124, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DISubroutineType(types: !125)
!125 = !{null, !8, !8, !8, !11}
!126 = !DILocalVariable(name: "n", arg: 1, scope: !123, file: !3, line: 45, type: !8)
!127 = !DILocation(line: 0, scope: !123)
!128 = !DILocalVariable(name: "got", arg: 2, scope: !123, file: !3, line: 45, type: !8)
!129 = !DILocalVariable(name: "marker", arg: 3, scope: !123, file: !3, line: 45, type: !8)
!130 = !DILocalVariable(name: "buf", arg: 4, scope: !123, file: !3, line: 45, type: !11)
!131 = !DILocalVariable(name: "bits", scope: !123, file: !3, line: 47, type: !8)
!132 = !DILocation(line: 48, column: 10, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !3, line: 48, column: 6)
!134 = !DILocation(line: 48, column: 6, scope: !123)
!135 = !DILocation(line: 49, column: 10, scope: !133)
!136 = !DILocation(line: 49, column: 20, scope: !133)
!137 = !DILocation(line: 49, column: 30, scope: !133)
!138 = !DILocation(line: 49, column: 25, scope: !133)
!139 = !DILocation(line: 49, column: 15, scope: !133)
!140 = !DILocation(line: 49, column: 3, scope: !133)
!141 = !DILocalVariable(name: "i", scope: !123, file: !3, line: 47, type: !8)
!142 = !DILocation(line: 51, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !133, file: !3, line: 51, column: 3)
!144 = !DILocation(line: 0, scope: !143)
!145 = !DILocation(line: 51, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !3, line: 51, column: 3)
!147 = !DILocation(line: 51, column: 3, scope: !143)
!148 = !DILocation(line: 52, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !3, line: 52, column: 8)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 51, column: 38)
!151 = !DILocation(line: 52, column: 8, scope: !150)
!152 = !DILocation(line: 52, column: 25, scope: !149)
!153 = !DILocation(line: 53, column: 17, scope: !150)
!154 = !DILocation(line: 53, column: 15, scope: !150)
!155 = !DILocation(line: 53, column: 4, scope: !150)
!156 = !DILocation(line: 53, column: 13, scope: !150)
!157 = !DILocation(line: 54, column: 16, scope: !150)
!158 = !DILocation(line: 54, column: 28, scope: !150)
!159 = !DILocation(line: 54, column: 4, scope: !150)
!160 = !DILocation(line: 55, column: 3, scope: !150)
!161 = !DILocation(line: 51, column: 23, scope: !146)
!162 = !DILocation(line: 51, column: 32, scope: !146)
!163 = !DILocation(line: 51, column: 3, scope: !146)
!164 = distinct !{!164, !147, !165}
!165 = !DILocation(line: 55, column: 3, scope: !143)
!166 = !DILocation(line: 56, column: 1, scope: !123)
!167 = distinct !DISubprogram(name: "filter", scope: !3, file: !3, line: 58, type: !168, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !13, !8, !8, !8}
!170 = !DILocalVariable(name: "buf", arg: 1, scope: !167, file: !3, line: 58, type: !13)
!171 = !DILocation(line: 0, scope: !167)
!172 = !DILocalVariable(name: "n", arg: 2, scope: !167, file: !3, line: 58, type: !8)
!173 = !DILocalVariable(name: "bull", arg: 3, scope: !167, file: !3, line: 58, type: !8)
!174 = !DILocalVariable(name: "cow", arg: 4, scope: !167, file: !3, line: 58, type: !8)
!175 = !DILocalVariable(name: "i", scope: !167, file: !3, line: 60, type: !8)
!176 = !DILocalVariable(name: "c", scope: !167, file: !3, line: 60, type: !8)
!177 = !DILocation(line: 60, column: 13, scope: !167)
!178 = !DILocation(line: 61, column: 14, scope: !167)
!179 = !DILocalVariable(name: "ptr", scope: !167, file: !3, line: 61, type: !11)
!180 = !DILocation(line: 63, column: 2, scope: !167)
!181 = !DILocation(line: 60, column: 6, scope: !167)
!182 = !DILocation(line: 61, column: 8, scope: !167)
!183 = !DILocation(line: 63, column: 13, scope: !167)
!184 = !DILocation(line: 63, column: 11, scope: !167)
!185 = !DILocation(line: 64, column: 7, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !3, line: 64, column: 7)
!187 = distinct !DILexicalBlock(scope: !167, file: !3, line: 63, column: 18)
!188 = !DILocation(line: 64, column: 27, scope: !186)
!189 = !DILocation(line: 64, column: 35, scope: !186)
!190 = !DILocation(line: 64, column: 38, scope: !186)
!191 = !DILocation(line: 64, column: 40, scope: !186)
!192 = !DILocation(line: 64, column: 7, scope: !187)
!193 = !DILocation(line: 65, column: 16, scope: !186)
!194 = !DILocation(line: 65, column: 23, scope: !186)
!195 = !DILocation(line: 65, column: 34, scope: !186)
!196 = !DILocation(line: 65, column: 29, scope: !186)
!197 = !DILocation(line: 65, column: 21, scope: !186)
!198 = !DILocation(line: 65, column: 4, scope: !186)
!199 = !DILocation(line: 67, column: 13, scope: !186)
!200 = !DILocation(line: 67, column: 8, scope: !186)
!201 = !DILocation(line: 67, column: 19, scope: !186)
!202 = distinct !{!202, !180, !203}
!203 = !DILocation(line: 68, column: 2, scope: !167)
!204 = !DILocation(line: 69, column: 1, scope: !167)
!205 = distinct !DISubprogram(name: "game", scope: !3, file: !3, line: 71, type: !206, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !13, !11}
!208 = !DILocalVariable(name: "tgt", arg: 1, scope: !205, file: !3, line: 71, type: !13)
!209 = !DILocation(line: 0, scope: !205)
!210 = !DILocalVariable(name: "buf", arg: 2, scope: !205, file: !3, line: 71, type: !11)
!211 = !DILocalVariable(name: "cow", scope: !205, file: !3, line: 73, type: !8)
!212 = !DILocation(line: 73, column: 18, scope: !205)
!213 = !DILocation(line: 73, column: 27, scope: !205)
!214 = !DILocalVariable(name: "n", scope: !205, file: !3, line: 73, type: !8)
!215 = !DILocalVariable(name: "i", scope: !205, file: !3, line: 73, type: !8)
!216 = !DILocalVariable(name: "p", scope: !205, file: !3, line: 73, type: !8)
!217 = !DILocation(line: 75, column: 7, scope: !218)
!218 = distinct !DILexicalBlock(scope: !205, file: !3, line: 75, column: 2)
!219 = !DILocation(line: 0, scope: !218)
!220 = !DILocation(line: 75, column: 23, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !3, line: 75, column: 2)
!222 = !DILocation(line: 75, column: 27, scope: !221)
!223 = !DILocation(line: 75, column: 38, scope: !221)
!224 = !DILocation(line: 75, column: 33, scope: !221)
!225 = !DILocation(line: 0, scope: !221)
!226 = !DILocation(line: 75, column: 2, scope: !218)
!227 = !DILocation(line: 75, column: 45, scope: !221)
!228 = !DILocation(line: 75, column: 2, scope: !221)
!229 = distinct !{!229, !226, !230}
!230 = !DILocation(line: 75, column: 48, scope: !218)
!231 = !DILocation(line: 76, column: 23, scope: !205)
!232 = !DILocation(line: 76, column: 18, scope: !205)
!233 = !DILocation(line: 76, column: 16, scope: !205)
!234 = !DILocation(line: 76, column: 9, scope: !205)
!235 = !DILocation(line: 76, column: 7, scope: !205)
!236 = !DILocation(line: 78, column: 2, scope: !205)
!237 = !DILocalVariable(name: "bull", scope: !205, file: !3, line: 73, type: !8)
!238 = !DILocation(line: 79, column: 7, scope: !239)
!239 = distinct !DILexicalBlock(scope: !205, file: !3, line: 79, column: 2)
!240 = !DILocation(line: 0, scope: !239)
!241 = !DILocation(line: 79, column: 26, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !3, line: 79, column: 2)
!243 = !DILocation(line: 79, column: 2, scope: !239)
!244 = !DILocation(line: 80, column: 15, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !3, line: 79, column: 39)
!246 = !DILocation(line: 80, column: 25, scope: !245)
!247 = !DILocation(line: 80, column: 38, scope: !245)
!248 = !DILocation(line: 80, column: 32, scope: !245)
!249 = !DILocation(line: 80, column: 30, scope: !245)
!250 = !DILocation(line: 80, column: 20, scope: !245)
!251 = !DILocation(line: 80, column: 3, scope: !245)
!252 = !DILocation(line: 81, column: 10, scope: !245)
!253 = !DILocation(line: 85, column: 12, scope: !245)
!254 = !DILocation(line: 85, column: 23, scope: !245)
!255 = !DILocation(line: 85, column: 28, scope: !245)
!256 = !DILocation(line: 83, column: 3, scope: !245)
!257 = !DILocation(line: 87, column: 24, scope: !245)
!258 = !DILocation(line: 87, column: 3, scope: !245)
!259 = !DILocation(line: 88, column: 2, scope: !245)
!260 = !DILocation(line: 79, column: 35, scope: !242)
!261 = !DILocation(line: 79, column: 2, scope: !242)
!262 = distinct !{!262, !243, !263}
!263 = !DILocation(line: 88, column: 2, scope: !239)
!264 = !DILocation(line: 89, column: 1, scope: !205)
!265 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 91, type: !266, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!266 = !DISubroutineType(types: !267)
!267 = !{!8, !8, !268}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!269 = !DILocalVariable(name: "c", arg: 1, scope: !265, file: !3, line: 91, type: !8)
!270 = !DILocation(line: 0, scope: !265)
!271 = !DILocalVariable(name: "v", arg: 2, scope: !265, file: !3, line: 91, type: !268)
!272 = !DILocation(line: 93, column: 12, scope: !265)
!273 = !DILocation(line: 93, column: 10, scope: !265)
!274 = !DILocation(line: 93, column: 23, scope: !265)
!275 = !DILocation(line: 93, column: 18, scope: !265)
!276 = !DILocalVariable(name: "n", scope: !265, file: !3, line: 93, type: !8)
!277 = !DILocalVariable(name: "secret", scope: !265, file: !3, line: 95, type: !45)
!278 = !DILocation(line: 95, column: 7, scope: !265)
!279 = !DILocalVariable(name: "answer", scope: !265, file: !3, line: 95, type: !45)
!280 = !DILocation(line: 95, column: 24, scope: !265)
!281 = !DILocation(line: 96, column: 8, scope: !265)
!282 = !DILocation(line: 96, column: 2, scope: !265)
!283 = !DILocation(line: 98, column: 31, scope: !265)
!284 = !DILocation(line: 98, column: 51, scope: !265)
!285 = !DILocation(line: 98, column: 37, scope: !265)
!286 = !DILocation(line: 98, column: 60, scope: !265)
!287 = !DILocation(line: 98, column: 2, scope: !265)
!288 = !DILocation(line: 99, column: 7, scope: !265)
!289 = !DILocation(line: 99, column: 15, scope: !265)
!290 = !DILocation(line: 99, column: 2, scope: !265)
!291 = !DILocation(line: 101, column: 2, scope: !265)
