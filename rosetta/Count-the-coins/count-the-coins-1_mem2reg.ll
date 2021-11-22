; ModuleID = 'count-the-coins-1.ll'
source_filename = "count-the-coins-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.i128 = type { [2 x i64] }

@__const.main.us_coins = private unnamed_addr constant [7 x i32] [i32 100, i32 50, i32 25, i32 10, i32 5, i32 1, i32 0], align 16
@__const.main.eu_coins = private unnamed_addr constant [9 x i32] [i32 200, i32 100, i32 50, i32 20, i32 10, i32 5, i32 2, i32 1, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i64 %v.coerce0, i64 %v.coerce1) #0 !dbg !7 {
entry:
  %v = alloca %struct.i128, align 8
  %x = alloca [4 x i32], align 16
  %buf = alloca [100 x i8], align 16
  %0 = bitcast %struct.i128* %v to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %v.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %v.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.i128* %v, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [4 x i32]* %x, metadata !24, metadata !DIExpression()), !dbg !31
  %arrayinit.begin = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 0, !dbg !32
  %x1 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !33
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %x1, i64 0, i64 0, !dbg !34
  %3 = load i64, i64* %arrayidx, align 8, !dbg !34
  %conv = trunc i64 %3 to i32, !dbg !34
  store i32 %conv, i32* %arrayinit.begin, align 4, !dbg !32
  %arrayinit.element = getelementptr inbounds i32, i32* %arrayinit.begin, i64 1, !dbg !32
  %x2 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !35
  %arrayidx3 = getelementptr inbounds [2 x i64], [2 x i64]* %x2, i64 0, i64 0, !dbg !36
  %4 = load i64, i64* %arrayidx3, align 8, !dbg !36
  %shr = lshr i64 %4, 32, !dbg !37
  %conv4 = trunc i64 %shr to i32, !dbg !36
  store i32 %conv4, i32* %arrayinit.element, align 4, !dbg !32
  %arrayinit.element5 = getelementptr inbounds i32, i32* %arrayinit.element, i64 1, !dbg !32
  %x6 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !38
  %arrayidx7 = getelementptr inbounds [2 x i64], [2 x i64]* %x6, i64 0, i64 1, !dbg !39
  %5 = load i64, i64* %arrayidx7, align 8, !dbg !39
  %conv8 = trunc i64 %5 to i32, !dbg !39
  store i32 %conv8, i32* %arrayinit.element5, align 4, !dbg !32
  %arrayinit.element9 = getelementptr inbounds i32, i32* %arrayinit.element5, i64 1, !dbg !32
  %x10 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !40
  %arrayidx11 = getelementptr inbounds [2 x i64], [2 x i64]* %x10, i64 0, i64 1, !dbg !41
  %6 = load i64, i64* %arrayidx11, align 8, !dbg !41
  %shr12 = lshr i64 %6, 32, !dbg !42
  %conv13 = trunc i64 %shr12 to i32, !dbg !41
  store i32 %conv13, i32* %arrayinit.element9, align 4, !dbg !32
  call void @llvm.dbg.value(metadata i32 0, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 4, metadata !46, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %buf, metadata !47, metadata !DIExpression()), !dbg !52
  br label %do.body, !dbg !53

do.body:                                          ; preds = %do.cond, %entry
  %len.0 = phi i32 [ 4, %entry ], [ %len.1, %do.cond ], !dbg !45
  %j.0 = phi i32 [ 0, %entry ], [ %inc, %do.cond ], !dbg !45
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !46, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i64 0, metadata !54, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !57, metadata !DIExpression()), !dbg !45
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.body, %do.body
  %c.0 = phi i64 [ 0, %do.body ], [ %rem, %for.body ], !dbg !56
  %i.0 = phi i32 [ %len.0, %do.body ], [ %dec, %for.body ], !dbg !60
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !57, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i64 %c.0, metadata !54, metadata !DIExpression()), !dbg !56
  %dec = add nsw i32 %i.0, -1, !dbg !61
  call void @llvm.dbg.value(metadata i32 %dec, metadata !57, metadata !DIExpression()), !dbg !45
  %tobool = icmp ne i32 %i.0, 0, !dbg !63
  br i1 %tobool, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %shl = shl i64 %c.0, 32, !dbg !64
  %idxprom = sext i32 %dec to i64, !dbg !66
  %arrayidx14 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom, !dbg !66
  %7 = load i32, i32* %arrayidx14, align 4, !dbg !66
  %conv15 = zext i32 %7 to i64, !dbg !66
  %add = add i64 %shl, %conv15, !dbg !67
  call void @llvm.dbg.value(metadata i64 %add, metadata !54, metadata !DIExpression()), !dbg !56
  %div = udiv i64 %add, 10, !dbg !68
  %conv16 = trunc i64 %div to i32, !dbg !69
  %idxprom17 = sext i32 %dec to i64, !dbg !70
  %arrayidx18 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom17, !dbg !70
  store i32 %conv16, i32* %arrayidx18, align 4, !dbg !71
  %rem = urem i64 %add, 10, !dbg !72
  call void @llvm.dbg.value(metadata i64 %rem, metadata !54, metadata !DIExpression()), !dbg !56
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %add19 = add i64 %c.0, 48, !dbg !76
  %conv20 = trunc i64 %add19 to i8, !dbg !77
  %inc = add nsw i32 %j.0, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %inc, metadata !43, metadata !DIExpression()), !dbg !45
  %idxprom21 = sext i32 %j.0 to i64, !dbg !79
  %arrayidx22 = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 %idxprom21, !dbg !79
  store i8 %conv20, i8* %arrayidx22, align 1, !dbg !80
  call void @llvm.dbg.value(metadata i32 4, metadata !46, metadata !DIExpression()), !dbg !45
  br label %for.cond23, !dbg !81

for.cond23:                                       ; preds = %for.inc, %for.end
  %len.1 = phi i32 [ 4, %for.end ], [ %dec28, %for.inc ], !dbg !83
  call void @llvm.dbg.value(metadata i32 %len.1, metadata !46, metadata !DIExpression()), !dbg !45
  %sub = sub nsw i32 %len.1, 1, !dbg !84
  %idxprom24 = sext i32 %sub to i64, !dbg !86
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom24, !dbg !86
  %8 = load i32, i32* %arrayidx25, align 4, !dbg !86
  %tobool26 = icmp ne i32 %8, 0, !dbg !87
  %lnot = xor i1 %tobool26, true, !dbg !87
  br i1 %lnot, label %for.body27, label %for.end29, !dbg !88

for.body27:                                       ; preds = %for.cond23
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body27
  %dec28 = add nsw i32 %len.1, -1, !dbg !89
  call void @llvm.dbg.value(metadata i32 %dec28, metadata !46, metadata !DIExpression()), !dbg !45
  br label %for.cond23, !dbg !90, !llvm.loop !91

for.end29:                                        ; preds = %for.cond23
  br label %do.cond, !dbg !93

do.cond:                                          ; preds = %for.end29
  %tobool30 = icmp ne i32 %len.1, 0, !dbg !93
  br i1 %tobool30, label %do.body, label %do.end, !dbg !93, !llvm.loop !94

do.end:                                           ; preds = %do.cond
  br label %while.cond, !dbg !96

while.cond:                                       ; preds = %while.body, %do.end
  %j.1 = phi i32 [ %inc, %do.end ], [ %dec31, %while.body ], !dbg !45
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !43, metadata !DIExpression()), !dbg !45
  %dec31 = add nsw i32 %j.1, -1, !dbg !97
  call void @llvm.dbg.value(metadata i32 %dec31, metadata !43, metadata !DIExpression()), !dbg !45
  %tobool32 = icmp ne i32 %j.1, 0, !dbg !96
  br i1 %tobool32, label %while.body, label %while.end, !dbg !96

while.body:                                       ; preds = %while.cond
  %idxprom33 = sext i32 %dec31 to i64, !dbg !98
  %arrayidx34 = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 %idxprom33, !dbg !98
  %9 = load i8, i8* %arrayidx34, align 1, !dbg !98
  %conv35 = sext i8 %9 to i32, !dbg !98
  %call = call i32 @putchar(i32 %conv35), !dbg !99
  br label %while.cond, !dbg !96, !llvm.loop !100

while.end:                                        ; preds = %while.cond
  %call36 = call i32 @putchar(i32 10), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @count(i32 %sum, i32* %coins) #0 !dbg !104 {
entry:
  %retval = alloca %struct.i128, align 8
  %.compoundliteral = alloca %struct.i128, align 8
  %c = alloca %struct.i128, align 8
  call void @llvm.dbg.value(metadata i32 %sum, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32* %coins, metadata !110, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32 0, metadata !111, metadata !DIExpression()), !dbg !109
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %n.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !114
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !111, metadata !DIExpression()), !dbg !109
  %idxprom = sext i32 %n.0 to i64, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %coins, i64 %idxprom, !dbg !115
  %0 = load i32, i32* %arrayidx, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %n.0, 1, !dbg !118
  call void @llvm.dbg.value(metadata i32 %inc, metadata !111, metadata !DIExpression()), !dbg !109
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %conv = sext i32 %n.0 to i64, !dbg !122
  %mul = mul i64 8, %conv, !dbg !123
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !124
  %1 = bitcast i8* %call to %struct.i128**, !dbg !124
  call void @llvm.dbg.value(metadata %struct.i128** %1, metadata !125, metadata !DIExpression()), !dbg !109
  %conv1 = sext i32 %n.0 to i64, !dbg !128
  %mul2 = mul i64 4, %conv1, !dbg !129
  %call3 = call noalias i8* @malloc(i64 %mul2) #5, !dbg !130
  %2 = bitcast i8* %call3 to i32*, !dbg !130
  call void @llvm.dbg.value(metadata i32* %2, metadata !131, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32 0, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond4, !dbg !133

for.cond4:                                        ; preds = %for.inc17, %for.end
  %i.0 = phi i32 [ 0, %for.end ], [ %inc18, %for.inc17 ], !dbg !135
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !132, metadata !DIExpression()), !dbg !109
  %cmp = icmp slt i32 %i.0, %n.0, !dbg !136
  br i1 %cmp, label %for.body6, label %for.end19, !dbg !138

for.body6:                                        ; preds = %for.cond4
  %idxprom7 = sext i32 %i.0 to i64, !dbg !139
  %arrayidx8 = getelementptr inbounds i32, i32* %coins, i64 %idxprom7, !dbg !139
  %3 = load i32, i32* %arrayidx8, align 4, !dbg !139
  %idxprom9 = sext i32 %i.0 to i64, !dbg !141
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %idxprom9, !dbg !141
  store i32 %3, i32* %arrayidx10, align 4, !dbg !142
  %idxprom11 = sext i32 %i.0 to i64, !dbg !143
  %arrayidx12 = getelementptr inbounds i32, i32* %coins, i64 %idxprom11, !dbg !143
  %4 = load i32, i32* %arrayidx12, align 4, !dbg !143
  %conv13 = sext i32 %4 to i64, !dbg !143
  %call14 = call noalias i8* @calloc(i64 16, i64 %conv13) #5, !dbg !144
  %5 = bitcast i8* %call14 to %struct.i128*, !dbg !144
  %idxprom15 = sext i32 %i.0 to i64, !dbg !145
  %arrayidx16 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 %idxprom15, !dbg !145
  store %struct.i128* %5, %struct.i128** %arrayidx16, align 8, !dbg !146
  br label %for.inc17, !dbg !147

for.inc17:                                        ; preds = %for.body6
  %inc18 = add nsw i32 %i.0, 1, !dbg !148
  call void @llvm.dbg.value(metadata i32 %inc18, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond4, !dbg !149, !llvm.loop !150

for.end19:                                        ; preds = %for.cond4
  %arrayidx20 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 0, !dbg !152
  %6 = load %struct.i128*, %struct.i128** %arrayidx20, align 8, !dbg !152
  %arrayidx21 = getelementptr inbounds i32, i32* %coins, i64 0, !dbg !153
  %7 = load i32, i32* %arrayidx21, align 4, !dbg !153
  %sub = sub nsw i32 %7, 1, !dbg !154
  %idxprom22 = sext i32 %sub to i64, !dbg !152
  %arrayidx23 = getelementptr inbounds %struct.i128, %struct.i128* %6, i64 %idxprom22, !dbg !152
  %x = getelementptr inbounds %struct.i128, %struct.i128* %.compoundliteral, i32 0, i32 0, !dbg !155
  %arrayinit.begin = getelementptr inbounds [2 x i64], [2 x i64]* %x, i64 0, i64 0, !dbg !156
  store i64 1, i64* %arrayinit.begin, align 8, !dbg !156
  %arrayinit.element = getelementptr inbounds i64, i64* %arrayinit.begin, i64 1, !dbg !156
  store i64 0, i64* %arrayinit.element, align 8, !dbg !156
  %8 = bitcast %struct.i128* %arrayidx23 to i8*, !dbg !157
  %9 = bitcast %struct.i128* %.compoundliteral to i8*, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 8 %9, i64 16, i1 false), !dbg !157
  call void @llvm.dbg.value(metadata i32 0, metadata !158, metadata !DIExpression()), !dbg !109
  br label %for.cond24, !dbg !159

for.cond24:                                       ; preds = %for.inc78, %for.end19
  %k.0 = phi i32 [ 0, %for.end19 ], [ %inc79, %for.inc78 ], !dbg !161
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !158, metadata !DIExpression()), !dbg !109
  %cmp25 = icmp sle i32 %k.0, %sum, !dbg !162
  br i1 %cmp25, label %for.body27, label %for.end80, !dbg !164

for.body27:                                       ; preds = %for.cond24
  call void @llvm.dbg.value(metadata i32 0, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond28, !dbg !165

for.cond28:                                       ; preds = %for.inc40, %for.body27
  %i.1 = phi i32 [ 0, %for.body27 ], [ %inc41, %for.inc40 ], !dbg !168
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !132, metadata !DIExpression()), !dbg !109
  %cmp29 = icmp slt i32 %i.1, %n.0, !dbg !169
  br i1 %cmp29, label %for.body31, label %for.end42, !dbg !171

for.body31:                                       ; preds = %for.cond28
  %idxprom32 = sext i32 %i.1 to i64, !dbg !172
  %arrayidx33 = getelementptr inbounds i32, i32* %2, i64 %idxprom32, !dbg !172
  %10 = load i32, i32* %arrayidx33, align 4, !dbg !174
  %dec = add nsw i32 %10, -1, !dbg !174
  store i32 %dec, i32* %arrayidx33, align 4, !dbg !174
  %tobool34 = icmp ne i32 %10, 0, !dbg !174
  br i1 %tobool34, label %if.end, label %if.then, !dbg !175, !cf.info !176

if.then:                                          ; preds = %for.body31
  %idxprom35 = sext i32 %i.1 to i64, !dbg !177
  %arrayidx36 = getelementptr inbounds i32, i32* %coins, i64 %idxprom35, !dbg !177
  %11 = load i32, i32* %arrayidx36, align 4, !dbg !177
  %sub37 = sub nsw i32 %11, 1, !dbg !178
  %idxprom38 = sext i32 %i.1 to i64, !dbg !179
  %arrayidx39 = getelementptr inbounds i32, i32* %2, i64 %idxprom38, !dbg !179
  store i32 %sub37, i32* %arrayidx39, align 4, !dbg !180
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %for.body31
  br label %for.inc40, !dbg !174

for.inc40:                                        ; preds = %if.end
  %inc41 = add nsw i32 %i.1, 1, !dbg !181
  call void @llvm.dbg.value(metadata i32 %inc41, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond28, !dbg !182, !llvm.loop !183

for.end42:                                        ; preds = %for.cond28
  call void @llvm.dbg.declare(metadata %struct.i128* %c, metadata !185, metadata !DIExpression()), !dbg !186
  %arrayidx43 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 0, !dbg !187
  %12 = load %struct.i128*, %struct.i128** %arrayidx43, align 8, !dbg !187
  %arrayidx44 = getelementptr inbounds i32, i32* %2, i64 0, !dbg !188
  %13 = load i32, i32* %arrayidx44, align 4, !dbg !188
  %idxprom45 = sext i32 %13 to i64, !dbg !187
  %arrayidx46 = getelementptr inbounds %struct.i128, %struct.i128* %12, i64 %idxprom45, !dbg !187
  %14 = bitcast %struct.i128* %c to i8*, !dbg !187
  %15 = bitcast %struct.i128* %arrayidx46 to i8*, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 16, i1 false), !dbg !187
  call void @llvm.dbg.value(metadata i32 1, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond47, !dbg !189

for.cond47:                                       ; preds = %for.inc75, %for.end42
  %i.2 = phi i32 [ 1, %for.end42 ], [ %inc76, %for.inc75 ], !dbg !191
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !132, metadata !DIExpression()), !dbg !109
  %cmp48 = icmp slt i32 %i.2, %n.0, !dbg !192
  br i1 %cmp48, label %for.body50, label %for.end77, !dbg !194

for.body50:                                       ; preds = %for.cond47
  %idxprom51 = sext i32 %i.2 to i64, !dbg !195
  %arrayidx52 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 %idxprom51, !dbg !195
  %16 = load %struct.i128*, %struct.i128** %arrayidx52, align 8, !dbg !195
  %idxprom53 = sext i32 %i.2 to i64, !dbg !197
  %arrayidx54 = getelementptr inbounds i32, i32* %2, i64 %idxprom53, !dbg !197
  %17 = load i32, i32* %arrayidx54, align 4, !dbg !197
  %idx.ext = sext i32 %17 to i64, !dbg !198
  %add.ptr = getelementptr inbounds %struct.i128, %struct.i128* %16, i64 %idx.ext, !dbg !198
  call void @llvm.dbg.value(metadata %struct.i128* %add.ptr, metadata !199, metadata !DIExpression()), !dbg !200
  %x55 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !201
  %arrayidx56 = getelementptr inbounds [2 x i64], [2 x i64]* %x55, i64 0, i64 0, !dbg !202
  %18 = load i64, i64* %arrayidx56, align 8, !dbg !202
  %x57 = getelementptr inbounds %struct.i128, %struct.i128* %add.ptr, i32 0, i32 0, !dbg !203
  %arrayidx58 = getelementptr inbounds [2 x i64], [2 x i64]* %x57, i64 0, i64 0, !dbg !204
  %19 = load i64, i64* %arrayidx58, align 8, !dbg !205
  %add = add i64 %19, %18, !dbg !205
  store i64 %add, i64* %arrayidx58, align 8, !dbg !205
  %x59 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !206
  %arrayidx60 = getelementptr inbounds [2 x i64], [2 x i64]* %x59, i64 0, i64 1, !dbg !207
  %20 = load i64, i64* %arrayidx60, align 8, !dbg !207
  %x61 = getelementptr inbounds %struct.i128, %struct.i128* %add.ptr, i32 0, i32 0, !dbg !208
  %arrayidx62 = getelementptr inbounds [2 x i64], [2 x i64]* %x61, i64 0, i64 1, !dbg !209
  %21 = load i64, i64* %arrayidx62, align 8, !dbg !210
  %add63 = add i64 %21, %20, !dbg !210
  store i64 %add63, i64* %arrayidx62, align 8, !dbg !210
  %x64 = getelementptr inbounds %struct.i128, %struct.i128* %add.ptr, i32 0, i32 0, !dbg !211
  %arrayidx65 = getelementptr inbounds [2 x i64], [2 x i64]* %x64, i64 0, i64 0, !dbg !213
  %22 = load i64, i64* %arrayidx65, align 8, !dbg !213
  %x66 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !214
  %arrayidx67 = getelementptr inbounds [2 x i64], [2 x i64]* %x66, i64 0, i64 0, !dbg !215
  %23 = load i64, i64* %arrayidx67, align 8, !dbg !215
  %cmp68 = icmp ult i64 %22, %23, !dbg !216
  br i1 %cmp68, label %if.then70, label %if.end74, !dbg !217, !cf.info !176

if.then70:                                        ; preds = %for.body50
  %x71 = getelementptr inbounds %struct.i128, %struct.i128* %add.ptr, i32 0, i32 0, !dbg !218
  %arrayidx72 = getelementptr inbounds [2 x i64], [2 x i64]* %x71, i64 0, i64 1, !dbg !219
  %24 = load i64, i64* %arrayidx72, align 8, !dbg !220
  %inc73 = add i64 %24, 1, !dbg !220
  store i64 %inc73, i64* %arrayidx72, align 8, !dbg !220
  br label %if.end74, !dbg !219

if.end74:                                         ; preds = %if.then70, %for.body50
  %25 = bitcast %struct.i128* %c to i8*, !dbg !221
  %26 = bitcast %struct.i128* %add.ptr to i8*, !dbg !221
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %25, i8* align 8 %26, i64 16, i1 false), !dbg !221
  br label %for.inc75, !dbg !222

for.inc75:                                        ; preds = %if.end74
  %inc76 = add nsw i32 %i.2, 1, !dbg !223
  call void @llvm.dbg.value(metadata i32 %inc76, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond47, !dbg !224, !llvm.loop !225

for.end77:                                        ; preds = %for.cond47
  br label %for.inc78, !dbg !227

for.inc78:                                        ; preds = %for.end77
  %inc79 = add nsw i32 %k.0, 1, !dbg !228
  call void @llvm.dbg.value(metadata i32 %inc79, metadata !158, metadata !DIExpression()), !dbg !109
  br label %for.cond24, !dbg !229, !llvm.loop !230

for.end80:                                        ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata %struct.i128* %retval, metadata !232, metadata !DIExpression()), !dbg !233
  %sub81 = sub nsw i32 %n.0, 1, !dbg !234
  %idxprom82 = sext i32 %sub81 to i64, !dbg !235
  %arrayidx83 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 %idxprom82, !dbg !235
  %27 = load %struct.i128*, %struct.i128** %arrayidx83, align 8, !dbg !235
  %sub84 = sub nsw i32 %n.0, 1, !dbg !236
  %idxprom85 = sext i32 %sub84 to i64, !dbg !237
  %arrayidx86 = getelementptr inbounds i32, i32* %2, i64 %idxprom85, !dbg !237
  %28 = load i32, i32* %arrayidx86, align 4, !dbg !237
  %idxprom87 = sext i32 %28 to i64, !dbg !235
  %arrayidx88 = getelementptr inbounds %struct.i128, %struct.i128* %27, i64 %idxprom87, !dbg !235
  %29 = bitcast %struct.i128* %retval to i8*, !dbg !235
  %30 = bitcast %struct.i128* %arrayidx88 to i8*, !dbg !235
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %29, i8* align 8 %30, i64 16, i1 false), !dbg !235
  call void @llvm.dbg.value(metadata i32 0, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond89, !dbg !238

for.cond89:                                       ; preds = %for.inc95, %for.end80
  %i.3 = phi i32 [ 0, %for.end80 ], [ %inc96, %for.inc95 ], !dbg !240
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !132, metadata !DIExpression()), !dbg !109
  %cmp90 = icmp slt i32 %i.3, %n.0, !dbg !241
  br i1 %cmp90, label %for.body92, label %for.end97, !dbg !243

for.body92:                                       ; preds = %for.cond89
  %idxprom93 = sext i32 %i.3 to i64, !dbg !244
  %arrayidx94 = getelementptr inbounds %struct.i128*, %struct.i128** %1, i64 %idxprom93, !dbg !244
  %31 = load %struct.i128*, %struct.i128** %arrayidx94, align 8, !dbg !244
  %32 = bitcast %struct.i128* %31 to i8*, !dbg !244
  call void @free(i8* %32) #5, !dbg !245
  br label %for.inc95, !dbg !245

for.inc95:                                        ; preds = %for.body92
  %inc96 = add nsw i32 %i.3, 1, !dbg !246
  call void @llvm.dbg.value(metadata i32 %inc96, metadata !132, metadata !DIExpression()), !dbg !109
  br label %for.cond89, !dbg !247, !llvm.loop !248

for.end97:                                        ; preds = %for.cond89
  %33 = bitcast %struct.i128** %1 to i8*, !dbg !250
  call void @free(i8* %33) #5, !dbg !251
  %34 = bitcast i32* %2 to i8*, !dbg !252
  call void @free(i8* %34) #5, !dbg !253
  %coerce.dive = getelementptr inbounds %struct.i128, %struct.i128* %retval, i32 0, i32 0, !dbg !254
  %35 = bitcast [2 x i64]* %coerce.dive to { i64, i64 }*, !dbg !254
  %36 = load { i64, i64 }, { i64, i64 }* %35, align 8, !dbg !254
  ret { i64, i64 } %36, !dbg !254
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count2(i32 %sum, i32* %coins) #0 !dbg !255 {
entry:
  call void @llvm.dbg.value(metadata i32 %sum, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.value(metadata i32* %coins, metadata !260, metadata !DIExpression()), !dbg !259
  %0 = load i32, i32* %coins, align 4, !dbg !261
  %tobool = icmp ne i32 %0, 0, !dbg !261
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !263, !cf.info !176

lor.lhs.false:                                    ; preds = %entry
  %cmp = icmp slt i32 %sum, 0, !dbg !264
  br i1 %cmp, label %if.then, label %if.end, !dbg !265, !cf.info !176

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !266

if.end:                                           ; preds = %lor.lhs.false
  %tobool1 = icmp ne i32 %sum, 0, !dbg !267
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !269, !cf.info !176

if.then2:                                         ; preds = %if.end
  br label %return, !dbg !270

if.end3:                                          ; preds = %if.end
  %1 = load i32, i32* %coins, align 4, !dbg !271
  %sub = sub nsw i32 %sum, %1, !dbg !272
  %call = call i32 @count2(i32 %sub, i32* %coins), !dbg !273
  %add.ptr = getelementptr inbounds i32, i32* %coins, i64 1, !dbg !274
  %call4 = call i32 @count2(i32 %sum, i32* %add.ptr), !dbg !275
  %add = add nsw i32 %call, %call4, !dbg !276
  br label %return, !dbg !277

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %add, %if.end3 ], [ 1, %if.then2 ], !dbg !259
  ret i32 %retval.0, !dbg !278
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !279 {
entry:
  %us_coins = alloca [7 x i32], align 16
  %eu_coins = alloca [9 x i32], align 16
  %agg.tmp = alloca %struct.i128, align 8
  %agg.tmp1 = alloca %struct.i128, align 8
  %agg.tmp5 = alloca %struct.i128, align 8
  %agg.tmp9 = alloca %struct.i128, align 8
  %agg.tmp13 = alloca %struct.i128, align 8
  %agg.tmp18 = alloca %struct.i128, align 8
  %agg.tmp22 = alloca %struct.i128, align 8
  %agg.tmp26 = alloca %struct.i128, align 8
  %agg.tmp30 = alloca %struct.i128, align 8
  call void @llvm.dbg.declare(metadata [7 x i32]* %us_coins, metadata !282, metadata !DIExpression()), !dbg !286
  %0 = bitcast [7 x i32]* %us_coins to i8*, !dbg !286
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([7 x i32]* @__const.main.us_coins to i8*), i64 28, i1 false), !dbg !286
  call void @llvm.dbg.declare(metadata [9 x i32]* %eu_coins, metadata !287, metadata !DIExpression()), !dbg !291
  %1 = bitcast [9 x i32]* %eu_coins to i8*, !dbg !291
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([9 x i32]* @__const.main.eu_coins to i8*), i64 36, i1 false), !dbg !291
  %arraydecay = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !292
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay, i64 2, !dbg !293
  %call = call { i64, i64 } @count(i32 100, i32* %add.ptr), !dbg !294
  %coerce.dive = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp, i32 0, i32 0, !dbg !294
  %2 = bitcast [2 x i64]* %coerce.dive to { i64, i64 }*, !dbg !294
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 0, !dbg !294
  %4 = extractvalue { i64, i64 } %call, 0, !dbg !294
  store i64 %4, i64* %3, align 8, !dbg !294
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 1, !dbg !294
  %6 = extractvalue { i64, i64 } %call, 1, !dbg !294
  store i64 %6, i64* %5, align 8, !dbg !294
  %7 = bitcast %struct.i128* %agg.tmp to { i64, i64 }*, !dbg !295
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 0, !dbg !295
  %9 = load i64, i64* %8, align 8, !dbg !295
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 1, !dbg !295
  %11 = load i64, i64* %10, align 8, !dbg !295
  call void @show(i64 %9, i64 %11), !dbg !295
  %arraydecay2 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !296
  %call3 = call { i64, i64 } @count(i32 1000, i32* %arraydecay2), !dbg !297
  %coerce.dive4 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp1, i32 0, i32 0, !dbg !297
  %12 = bitcast [2 x i64]* %coerce.dive4 to { i64, i64 }*, !dbg !297
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !297
  %14 = extractvalue { i64, i64 } %call3, 0, !dbg !297
  store i64 %14, i64* %13, align 8, !dbg !297
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !297
  %16 = extractvalue { i64, i64 } %call3, 1, !dbg !297
  store i64 %16, i64* %15, align 8, !dbg !297
  %17 = bitcast %struct.i128* %agg.tmp1 to { i64, i64 }*, !dbg !298
  %18 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 0, !dbg !298
  %19 = load i64, i64* %18, align 8, !dbg !298
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 1, !dbg !298
  %21 = load i64, i64* %20, align 8, !dbg !298
  call void @show(i64 %19, i64 %21), !dbg !298
  %arraydecay6 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !299
  %call7 = call { i64, i64 } @count(i32 100000, i32* %arraydecay6), !dbg !300
  %coerce.dive8 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp5, i32 0, i32 0, !dbg !300
  %22 = bitcast [2 x i64]* %coerce.dive8 to { i64, i64 }*, !dbg !300
  %23 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 0, !dbg !300
  %24 = extractvalue { i64, i64 } %call7, 0, !dbg !300
  store i64 %24, i64* %23, align 8, !dbg !300
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 1, !dbg !300
  %26 = extractvalue { i64, i64 } %call7, 1, !dbg !300
  store i64 %26, i64* %25, align 8, !dbg !300
  %27 = bitcast %struct.i128* %agg.tmp5 to { i64, i64 }*, !dbg !301
  %28 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 0, !dbg !301
  %29 = load i64, i64* %28, align 8, !dbg !301
  %30 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 1, !dbg !301
  %31 = load i64, i64* %30, align 8, !dbg !301
  call void @show(i64 %29, i64 %31), !dbg !301
  %arraydecay10 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !302
  %call11 = call { i64, i64 } @count(i32 1000000, i32* %arraydecay10), !dbg !303
  %coerce.dive12 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp9, i32 0, i32 0, !dbg !303
  %32 = bitcast [2 x i64]* %coerce.dive12 to { i64, i64 }*, !dbg !303
  %33 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 0, !dbg !303
  %34 = extractvalue { i64, i64 } %call11, 0, !dbg !303
  store i64 %34, i64* %33, align 8, !dbg !303
  %35 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 1, !dbg !303
  %36 = extractvalue { i64, i64 } %call11, 1, !dbg !303
  store i64 %36, i64* %35, align 8, !dbg !303
  %37 = bitcast %struct.i128* %agg.tmp9 to { i64, i64 }*, !dbg !304
  %38 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i32 0, i32 0, !dbg !304
  %39 = load i64, i64* %38, align 8, !dbg !304
  %40 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i32 0, i32 1, !dbg !304
  %41 = load i64, i64* %40, align 8, !dbg !304
  call void @show(i64 %39, i64 %41), !dbg !304
  %arraydecay14 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !305
  %call15 = call { i64, i64 } @count(i32 10000000, i32* %arraydecay14), !dbg !306
  %coerce.dive16 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp13, i32 0, i32 0, !dbg !306
  %42 = bitcast [2 x i64]* %coerce.dive16 to { i64, i64 }*, !dbg !306
  %43 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %42, i32 0, i32 0, !dbg !306
  %44 = extractvalue { i64, i64 } %call15, 0, !dbg !306
  store i64 %44, i64* %43, align 8, !dbg !306
  %45 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %42, i32 0, i32 1, !dbg !306
  %46 = extractvalue { i64, i64 } %call15, 1, !dbg !306
  store i64 %46, i64* %45, align 8, !dbg !306
  %47 = bitcast %struct.i128* %agg.tmp13 to { i64, i64 }*, !dbg !307
  %48 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %47, i32 0, i32 0, !dbg !307
  %49 = load i64, i64* %48, align 8, !dbg !307
  %50 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %47, i32 0, i32 1, !dbg !307
  %51 = load i64, i64* %50, align 8, !dbg !307
  call void @show(i64 %49, i64 %51), !dbg !307
  %call17 = call i32 @putchar(i32 10), !dbg !308
  %arraydecay19 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !309
  %call20 = call { i64, i64 } @count(i32 100, i32* %arraydecay19), !dbg !310
  %coerce.dive21 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp18, i32 0, i32 0, !dbg !310
  %52 = bitcast [2 x i64]* %coerce.dive21 to { i64, i64 }*, !dbg !310
  %53 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 0, !dbg !310
  %54 = extractvalue { i64, i64 } %call20, 0, !dbg !310
  store i64 %54, i64* %53, align 8, !dbg !310
  %55 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 1, !dbg !310
  %56 = extractvalue { i64, i64 } %call20, 1, !dbg !310
  store i64 %56, i64* %55, align 8, !dbg !310
  %57 = bitcast %struct.i128* %agg.tmp18 to { i64, i64 }*, !dbg !311
  %58 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %57, i32 0, i32 0, !dbg !311
  %59 = load i64, i64* %58, align 8, !dbg !311
  %60 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %57, i32 0, i32 1, !dbg !311
  %61 = load i64, i64* %60, align 8, !dbg !311
  call void @show(i64 %59, i64 %61), !dbg !311
  %arraydecay23 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !312
  %call24 = call { i64, i64 } @count(i32 100000, i32* %arraydecay23), !dbg !313
  %coerce.dive25 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp22, i32 0, i32 0, !dbg !313
  %62 = bitcast [2 x i64]* %coerce.dive25 to { i64, i64 }*, !dbg !313
  %63 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %62, i32 0, i32 0, !dbg !313
  %64 = extractvalue { i64, i64 } %call24, 0, !dbg !313
  store i64 %64, i64* %63, align 8, !dbg !313
  %65 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %62, i32 0, i32 1, !dbg !313
  %66 = extractvalue { i64, i64 } %call24, 1, !dbg !313
  store i64 %66, i64* %65, align 8, !dbg !313
  %67 = bitcast %struct.i128* %agg.tmp22 to { i64, i64 }*, !dbg !314
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 0, !dbg !314
  %69 = load i64, i64* %68, align 8, !dbg !314
  %70 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 1, !dbg !314
  %71 = load i64, i64* %70, align 8, !dbg !314
  call void @show(i64 %69, i64 %71), !dbg !314
  %arraydecay27 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !315
  %call28 = call { i64, i64 } @count(i32 1000000, i32* %arraydecay27), !dbg !316
  %coerce.dive29 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp26, i32 0, i32 0, !dbg !316
  %72 = bitcast [2 x i64]* %coerce.dive29 to { i64, i64 }*, !dbg !316
  %73 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 0, !dbg !316
  %74 = extractvalue { i64, i64 } %call28, 0, !dbg !316
  store i64 %74, i64* %73, align 8, !dbg !316
  %75 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 1, !dbg !316
  %76 = extractvalue { i64, i64 } %call28, 1, !dbg !316
  store i64 %76, i64* %75, align 8, !dbg !316
  %77 = bitcast %struct.i128* %agg.tmp26 to { i64, i64 }*, !dbg !317
  %78 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %77, i32 0, i32 0, !dbg !317
  %79 = load i64, i64* %78, align 8, !dbg !317
  %80 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %77, i32 0, i32 1, !dbg !317
  %81 = load i64, i64* %80, align 8, !dbg !317
  call void @show(i64 %79, i64 %81), !dbg !317
  %arraydecay31 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !318
  %call32 = call { i64, i64 } @count(i32 10000000, i32* %arraydecay31), !dbg !319
  %coerce.dive33 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp30, i32 0, i32 0, !dbg !319
  %82 = bitcast [2 x i64]* %coerce.dive33 to { i64, i64 }*, !dbg !319
  %83 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %82, i32 0, i32 0, !dbg !319
  %84 = extractvalue { i64, i64 } %call32, 0, !dbg !319
  store i64 %84, i64* %83, align 8, !dbg !319
  %85 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %82, i32 0, i32 1, !dbg !319
  %86 = extractvalue { i64, i64 } %call32, 1, !dbg !319
  store i64 %86, i64* %85, align 8, !dbg !319
  %87 = bitcast %struct.i128* %agg.tmp30 to { i64, i64 }*, !dbg !320
  %88 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %87, i32 0, i32 0, !dbg !320
  %89 = load i64, i64* %88, align 8, !dbg !320
  %90 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %87, i32 0, i32 1, !dbg !320
  %91 = load i64, i64* %90, align 8, !dbg !320
  call void @show(i64 %89, i64 %91), !dbg !320
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "count-the-coins-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Count-the-coins")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "show", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "i128", file: !1, line: 7, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 7, size: 128, elements: !12)
!12 = !{!13}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !11, file: !1, line: 7, baseType: !14, size: 128)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !20)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !18, line: 45, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !{!21}
!21 = !DISubrange(count: 2)
!22 = !DILocalVariable(name: "v", arg: 1, scope: !7, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 16, scope: !7)
!24 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 11, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 128, elements: !29)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !16, line: 26, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !18, line: 42, baseType: !28)
!28 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!29 = !{!30}
!30 = !DISubrange(count: 4)
!31 = !DILocation(line: 11, column: 11, scope: !7)
!32 = !DILocation(line: 11, column: 18, scope: !7)
!33 = !DILocation(line: 11, column: 21, scope: !7)
!34 = !DILocation(line: 11, column: 19, scope: !7)
!35 = !DILocation(line: 11, column: 29, scope: !7)
!36 = !DILocation(line: 11, column: 27, scope: !7)
!37 = !DILocation(line: 11, column: 34, scope: !7)
!38 = !DILocation(line: 11, column: 43, scope: !7)
!39 = !DILocation(line: 11, column: 41, scope: !7)
!40 = !DILocation(line: 11, column: 51, scope: !7)
!41 = !DILocation(line: 11, column: 49, scope: !7)
!42 = !DILocation(line: 11, column: 56, scope: !7)
!43 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 12, type: !44)
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DILocation(line: 0, scope: !7)
!46 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 12, type: !44)
!47 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 13, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 800, elements: !50)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 13, column: 7, scope: !7)
!53 = !DILocation(line: 14, column: 2, scope: !7)
!54 = !DILocalVariable(name: "c", scope: !55, file: !1, line: 15, type: !15)
!55 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 5)
!56 = !DILocation(line: 0, scope: !55)
!57 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 12, type: !44)
!58 = !DILocation(line: 16, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 16, column: 3)
!60 = !DILocation(line: 0, scope: !59)
!61 = !DILocation(line: 16, column: 18, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !1, line: 16, column: 3)
!63 = !DILocation(line: 16, column: 3, scope: !59)
!64 = !DILocation(line: 17, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 16, column: 24)
!66 = !DILocation(line: 17, column: 20, scope: !65)
!67 = !DILocation(line: 17, column: 18, scope: !65)
!68 = !DILocation(line: 18, column: 13, scope: !65)
!69 = !DILocation(line: 18, column: 11, scope: !65)
!70 = !DILocation(line: 18, column: 4, scope: !65)
!71 = !DILocation(line: 18, column: 9, scope: !65)
!72 = !DILocation(line: 18, column: 21, scope: !65)
!73 = !DILocation(line: 16, column: 3, scope: !62)
!74 = distinct !{!74, !63, !75}
!75 = !DILocation(line: 19, column: 3, scope: !59)
!76 = !DILocation(line: 21, column: 16, scope: !55)
!77 = !DILocation(line: 21, column: 14, scope: !55)
!78 = !DILocation(line: 21, column: 8, scope: !55)
!79 = !DILocation(line: 21, column: 3, scope: !55)
!80 = !DILocation(line: 21, column: 12, scope: !55)
!81 = !DILocation(line: 22, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !55, file: !1, line: 22, column: 3)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 22, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 22, column: 3)
!86 = !DILocation(line: 22, column: 18, scope: !85)
!87 = !DILocation(line: 22, column: 17, scope: !85)
!88 = !DILocation(line: 22, column: 3, scope: !82)
!89 = !DILocation(line: 22, column: 33, scope: !85)
!90 = !DILocation(line: 22, column: 3, scope: !85)
!91 = distinct !{!91, !88, !92}
!92 = !DILocation(line: 22, column: 36, scope: !82)
!93 = !DILocation(line: 23, column: 2, scope: !55)
!94 = distinct !{!94, !53, !95}
!95 = !DILocation(line: 23, column: 14, scope: !7)
!96 = !DILocation(line: 25, column: 2, scope: !7)
!97 = !DILocation(line: 25, column: 10, scope: !7)
!98 = !DILocation(line: 25, column: 22, scope: !7)
!99 = !DILocation(line: 25, column: 14, scope: !7)
!100 = distinct !{!100, !96, !101}
!101 = !DILocation(line: 25, column: 28, scope: !7)
!102 = !DILocation(line: 26, column: 2, scope: !7)
!103 = !DILocation(line: 27, column: 1, scope: !7)
!104 = distinct !DISubprogram(name: "count", scope: !1, file: !1, line: 29, type: !105, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!10, !44, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!108 = !DILocalVariable(name: "sum", arg: 1, scope: !104, file: !1, line: 29, type: !44)
!109 = !DILocation(line: 0, scope: !104)
!110 = !DILocalVariable(name: "coins", arg: 2, scope: !104, file: !1, line: 29, type: !107)
!111 = !DILocalVariable(name: "n", scope: !104, file: !1, line: 31, type: !44)
!112 = !DILocation(line: 32, column: 7, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !1, line: 32, column: 2)
!114 = !DILocation(line: 0, scope: !113)
!115 = !DILocation(line: 32, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !1, line: 32, column: 2)
!117 = !DILocation(line: 32, column: 2, scope: !113)
!118 = !DILocation(line: 32, column: 25, scope: !116)
!119 = !DILocation(line: 32, column: 2, scope: !116)
!120 = distinct !{!120, !117, !121}
!121 = !DILocation(line: 32, column: 28, scope: !113)
!122 = !DILocation(line: 34, column: 35, scope: !104)
!123 = !DILocation(line: 34, column: 33, scope: !104)
!124 = !DILocation(line: 34, column: 13, scope: !104)
!125 = !DILocalVariable(name: "v", scope: !104, file: !1, line: 34, type: !126)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!128 = !DILocation(line: 35, column: 34, scope: !104)
!129 = !DILocation(line: 35, column: 32, scope: !104)
!130 = !DILocation(line: 35, column: 13, scope: !104)
!131 = !DILocalVariable(name: "idx", scope: !104, file: !1, line: 35, type: !107)
!132 = !DILocalVariable(name: "i", scope: !104, file: !1, line: 31, type: !44)
!133 = !DILocation(line: 37, column: 7, scope: !134)
!134 = distinct !DILexicalBlock(scope: !104, file: !1, line: 37, column: 2)
!135 = !DILocation(line: 0, scope: !134)
!136 = !DILocation(line: 37, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !1, line: 37, column: 2)
!138 = !DILocation(line: 37, column: 2, scope: !134)
!139 = !DILocation(line: 38, column: 12, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !1, line: 37, column: 26)
!141 = !DILocation(line: 38, column: 3, scope: !140)
!142 = !DILocation(line: 38, column: 10, scope: !140)
!143 = !DILocation(line: 40, column: 31, scope: !140)
!144 = !DILocation(line: 40, column: 10, scope: !140)
!145 = !DILocation(line: 40, column: 3, scope: !140)
!146 = !DILocation(line: 40, column: 8, scope: !140)
!147 = !DILocation(line: 41, column: 2, scope: !140)
!148 = !DILocation(line: 37, column: 22, scope: !137)
!149 = !DILocation(line: 37, column: 2, scope: !137)
!150 = distinct !{!150, !138, !151}
!151 = !DILocation(line: 41, column: 2, scope: !134)
!152 = !DILocation(line: 43, column: 2, scope: !104)
!153 = !DILocation(line: 43, column: 7, scope: !104)
!154 = !DILocation(line: 43, column: 16, scope: !104)
!155 = !DILocation(line: 43, column: 30, scope: !104)
!156 = !DILocation(line: 43, column: 31, scope: !104)
!157 = !DILocation(line: 43, column: 23, scope: !104)
!158 = !DILocalVariable(name: "k", scope: !104, file: !1, line: 31, type: !44)
!159 = !DILocation(line: 45, column: 7, scope: !160)
!160 = distinct !DILexicalBlock(scope: !104, file: !1, line: 45, column: 2)
!161 = !DILocation(line: 0, scope: !160)
!162 = !DILocation(line: 45, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !1, line: 45, column: 2)
!164 = !DILocation(line: 45, column: 2, scope: !160)
!165 = !DILocation(line: 46, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !1, line: 46, column: 3)
!167 = distinct !DILexicalBlock(scope: !163, file: !1, line: 45, column: 29)
!168 = !DILocation(line: 0, scope: !166)
!169 = !DILocation(line: 46, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !1, line: 46, column: 3)
!171 = !DILocation(line: 46, column: 3, scope: !166)
!172 = !DILocation(line: 47, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !1, line: 47, column: 8)
!174 = !DILocation(line: 47, column: 15, scope: !173)
!175 = !DILocation(line: 47, column: 8, scope: !170)
!176 = !{!"if"}
!177 = !DILocation(line: 47, column: 28, scope: !173)
!178 = !DILocation(line: 47, column: 37, scope: !173)
!179 = !DILocation(line: 47, column: 19, scope: !173)
!180 = !DILocation(line: 47, column: 26, scope: !173)
!181 = !DILocation(line: 46, column: 23, scope: !170)
!182 = !DILocation(line: 46, column: 3, scope: !170)
!183 = distinct !{!183, !171, !184}
!184 = !DILocation(line: 47, column: 39, scope: !166)
!185 = !DILocalVariable(name: "c", scope: !167, file: !1, line: 49, type: !10)
!186 = !DILocation(line: 49, column: 8, scope: !167)
!187 = !DILocation(line: 49, column: 12, scope: !167)
!188 = !DILocation(line: 49, column: 18, scope: !167)
!189 = !DILocation(line: 51, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !167, file: !1, line: 51, column: 3)
!191 = !DILocation(line: 0, scope: !190)
!192 = !DILocation(line: 51, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !1, line: 51, column: 3)
!194 = !DILocation(line: 51, column: 3, scope: !190)
!195 = !DILocation(line: 52, column: 14, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !1, line: 51, column: 27)
!197 = !DILocation(line: 52, column: 21, scope: !196)
!198 = !DILocation(line: 52, column: 19, scope: !196)
!199 = !DILocalVariable(name: "p", scope: !196, file: !1, line: 52, type: !127)
!200 = !DILocation(line: 0, scope: !196)
!201 = !DILocation(line: 55, column: 17, scope: !196)
!202 = !DILocation(line: 55, column: 15, scope: !196)
!203 = !DILocation(line: 55, column: 7, scope: !196)
!204 = !DILocation(line: 55, column: 4, scope: !196)
!205 = !DILocation(line: 55, column: 12, scope: !196)
!206 = !DILocation(line: 56, column: 17, scope: !196)
!207 = !DILocation(line: 56, column: 15, scope: !196)
!208 = !DILocation(line: 56, column: 7, scope: !196)
!209 = !DILocation(line: 56, column: 4, scope: !196)
!210 = !DILocation(line: 56, column: 12, scope: !196)
!211 = !DILocation(line: 57, column: 11, scope: !212)
!212 = distinct !DILexicalBlock(scope: !196, file: !1, line: 57, column: 8)
!213 = !DILocation(line: 57, column: 8, scope: !212)
!214 = !DILocation(line: 57, column: 20, scope: !212)
!215 = !DILocation(line: 57, column: 18, scope: !212)
!216 = !DILocation(line: 57, column: 16, scope: !212)
!217 = !DILocation(line: 57, column: 8, scope: !196)
!218 = !DILocation(line: 58, column: 8, scope: !212)
!219 = !DILocation(line: 58, column: 5, scope: !212)
!220 = !DILocation(line: 58, column: 13, scope: !212)
!221 = !DILocation(line: 59, column: 8, scope: !196)
!222 = !DILocation(line: 60, column: 3, scope: !196)
!223 = !DILocation(line: 51, column: 23, scope: !193)
!224 = !DILocation(line: 51, column: 3, scope: !193)
!225 = distinct !{!225, !194, !226}
!226 = !DILocation(line: 60, column: 3, scope: !190)
!227 = !DILocation(line: 61, column: 2, scope: !167)
!228 = !DILocation(line: 45, column: 25, scope: !163)
!229 = !DILocation(line: 45, column: 2, scope: !163)
!230 = distinct !{!230, !164, !231}
!231 = !DILocation(line: 61, column: 2, scope: !160)
!232 = !DILocalVariable(name: "r", scope: !104, file: !1, line: 63, type: !10)
!233 = !DILocation(line: 63, column: 7, scope: !104)
!234 = !DILocation(line: 63, column: 15, scope: !104)
!235 = !DILocation(line: 63, column: 11, scope: !104)
!236 = !DILocation(line: 63, column: 25, scope: !104)
!237 = !DILocation(line: 63, column: 20, scope: !104)
!238 = !DILocation(line: 65, column: 7, scope: !239)
!239 = distinct !DILexicalBlock(scope: !104, file: !1, line: 65, column: 2)
!240 = !DILocation(line: 0, scope: !239)
!241 = !DILocation(line: 65, column: 16, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !1, line: 65, column: 2)
!243 = !DILocation(line: 65, column: 2, scope: !239)
!244 = !DILocation(line: 65, column: 31, scope: !242)
!245 = !DILocation(line: 65, column: 26, scope: !242)
!246 = !DILocation(line: 65, column: 22, scope: !242)
!247 = !DILocation(line: 65, column: 2, scope: !242)
!248 = distinct !{!248, !243, !249}
!249 = !DILocation(line: 65, column: 35, scope: !239)
!250 = !DILocation(line: 66, column: 7, scope: !104)
!251 = !DILocation(line: 66, column: 2, scope: !104)
!252 = !DILocation(line: 67, column: 7, scope: !104)
!253 = !DILocation(line: 67, column: 2, scope: !104)
!254 = !DILocation(line: 69, column: 2, scope: !104)
!255 = distinct !DISubprogram(name: "count2", scope: !1, file: !1, line: 73, type: !256, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!256 = !DISubroutineType(types: !257)
!257 = !{!44, !44, !107}
!258 = !DILocalVariable(name: "sum", arg: 1, scope: !255, file: !1, line: 73, type: !44)
!259 = !DILocation(line: 0, scope: !255)
!260 = !DILocalVariable(name: "coins", arg: 2, scope: !255, file: !1, line: 73, type: !107)
!261 = !DILocation(line: 75, column: 7, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !1, line: 75, column: 6)
!263 = !DILocation(line: 75, column: 14, scope: !262)
!264 = !DILocation(line: 75, column: 21, scope: !262)
!265 = !DILocation(line: 75, column: 6, scope: !255)
!266 = !DILocation(line: 75, column: 26, scope: !262)
!267 = !DILocation(line: 76, column: 7, scope: !268)
!268 = distinct !DILexicalBlock(scope: !255, file: !1, line: 76, column: 6)
!269 = !DILocation(line: 76, column: 6, scope: !255)
!270 = !DILocation(line: 76, column: 12, scope: !268)
!271 = !DILocation(line: 77, column: 22, scope: !255)
!272 = !DILocation(line: 77, column: 20, scope: !255)
!273 = !DILocation(line: 77, column: 9, scope: !255)
!274 = !DILocation(line: 77, column: 57, scope: !255)
!275 = !DILocation(line: 77, column: 39, scope: !255)
!276 = !DILocation(line: 77, column: 37, scope: !255)
!277 = !DILocation(line: 77, column: 2, scope: !255)
!278 = !DILocation(line: 78, column: 1, scope: !255)
!279 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 80, type: !280, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!280 = !DISubroutineType(types: !281)
!281 = !{!44}
!282 = !DILocalVariable(name: "us_coins", scope: !279, file: !1, line: 82, type: !283)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 224, elements: !284)
!284 = !{!285}
!285 = !DISubrange(count: 7)
!286 = !DILocation(line: 82, column: 6, scope: !279)
!287 = !DILocalVariable(name: "eu_coins", scope: !279, file: !1, line: 83, type: !288)
!288 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 288, elements: !289)
!289 = !{!290}
!290 = !DISubrange(count: 9)
!291 = !DILocation(line: 83, column: 6, scope: !279)
!292 = !DILocation(line: 85, column: 21, scope: !279)
!293 = !DILocation(line: 85, column: 30, scope: !279)
!294 = !DILocation(line: 85, column: 7, scope: !279)
!295 = !DILocation(line: 85, column: 2, scope: !279)
!296 = !DILocation(line: 86, column: 21, scope: !279)
!297 = !DILocation(line: 86, column: 7, scope: !279)
!298 = !DILocation(line: 86, column: 2, scope: !279)
!299 = !DILocation(line: 88, column: 27, scope: !279)
!300 = !DILocation(line: 88, column: 7, scope: !279)
!301 = !DILocation(line: 88, column: 2, scope: !279)
!302 = !DILocation(line: 89, column: 27, scope: !279)
!303 = !DILocation(line: 89, column: 7, scope: !279)
!304 = !DILocation(line: 89, column: 2, scope: !279)
!305 = !DILocation(line: 90, column: 27, scope: !279)
!306 = !DILocation(line: 90, column: 7, scope: !279)
!307 = !DILocation(line: 90, column: 2, scope: !279)
!308 = !DILocation(line: 92, column: 2, scope: !279)
!309 = !DILocation(line: 94, column: 27, scope: !279)
!310 = !DILocation(line: 94, column: 7, scope: !279)
!311 = !DILocation(line: 94, column: 2, scope: !279)
!312 = !DILocation(line: 95, column: 27, scope: !279)
!313 = !DILocation(line: 95, column: 7, scope: !279)
!314 = !DILocation(line: 95, column: 2, scope: !279)
!315 = !DILocation(line: 96, column: 27, scope: !279)
!316 = !DILocation(line: 96, column: 7, scope: !279)
!317 = !DILocation(line: 96, column: 2, scope: !279)
!318 = !DILocation(line: 97, column: 27, scope: !279)
!319 = !DILocation(line: 97, column: 7, scope: !279)
!320 = !DILocation(line: 97, column: 2, scope: !279)
!321 = !DILocation(line: 99, column: 2, scope: !279)
