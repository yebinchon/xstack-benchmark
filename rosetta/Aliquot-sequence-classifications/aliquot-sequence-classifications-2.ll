; ModuleID = 'aliquot-sequence-classifications-2.c'
source_filename = "aliquot-sequence-classifications-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [38 x i8] c"\0AInteger : %llu, Type : %s, Series : \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%llu, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Terminating\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Perfect\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Amicable\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Aspiring\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Sociable\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Cyclic\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Non-Terminating\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Usage : %s <positive integer>\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @raiseTo(i64 %base, i64 %power) #0 !dbg !12 {
entry:
  %base.addr = alloca i64, align 8
  %power.addr = alloca i64, align 8
  %result = alloca i64, align 8
  %i = alloca i64, align 8
  store i64 %base, i64* %base.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %base.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i64 %power, i64* %power.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %power.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %result, metadata !20, metadata !DIExpression()), !dbg !21
  store i64 1, i64* %result, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !23
  store i64 0, i64* %i, align 8, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !27
  %1 = load i64, i64* %power.addr, align 8, !dbg !29
  %cmp = icmp ult i64 %0, %1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %base.addr, align 8, !dbg !32
  %3 = load i64, i64* %result, align 8, !dbg !34
  %mul = mul i64 %3, %2, !dbg !34
  store i64 %mul, i64* %result, align 8, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !36
  %inc = add i64 %4, 1, !dbg !36
  store i64 %inc, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %5 = load i64, i64* %result, align 8, !dbg !40
  ret i64 %5, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @properDivisorSum(i64 %n) #0 !dbg !42 {
entry:
  %n.addr = alloca i64, align 8
  %prod = alloca i64, align 8
  %temp = alloca i64, align 8
  %i = alloca i64, align 8
  %count = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %prod, metadata !47, metadata !DIExpression()), !dbg !48
  store i64 1, i64* %prod, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %temp, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i64, i64* %n.addr, align 8, !dbg !51
  store i64 %0, i64* %temp, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %count, metadata !54, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %count, align 8, !dbg !55
  br label %while.cond, !dbg !56

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i64, i64* %n.addr, align 8, !dbg !57
  %rem = urem i64 %1, 2, !dbg !58
  %cmp = icmp eq i64 %rem, 0, !dbg !59
  br i1 %cmp, label %while.body, label %while.end, !dbg !56

while.body:                                       ; preds = %while.cond
  %2 = load i64, i64* %count, align 8, !dbg !60
  %inc = add i64 %2, 1, !dbg !60
  store i64 %inc, i64* %count, align 8, !dbg !60
  %3 = load i64, i64* %n.addr, align 8, !dbg !62
  %div = udiv i64 %3, 2, !dbg !62
  store i64 %div, i64* %n.addr, align 8, !dbg !62
  br label %while.cond, !dbg !56, !llvm.loop !63

while.end:                                        ; preds = %while.cond
  %4 = load i64, i64* %count, align 8, !dbg !65
  %cmp1 = icmp ne i64 %4, 0, !dbg !67
  br i1 %cmp1, label %if.then, label %if.end, !dbg !68, !cf.info !69

if.then:                                          ; preds = %while.end
  %5 = load i64, i64* %count, align 8, !dbg !70
  %add = add i64 %5, 1, !dbg !71
  %call = call i64 @raiseTo(i64 2, i64 %add), !dbg !72
  %sub = sub i64 %call, 1, !dbg !73
  %6 = load i64, i64* %prod, align 8, !dbg !74
  %mul = mul i64 %6, %sub, !dbg !74
  store i64 %mul, i64* %prod, align 8, !dbg !74
  br label %if.end, !dbg !75

if.end:                                           ; preds = %if.then, %while.end
  store i64 3, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !79
  %8 = load i64, i64* %i, align 8, !dbg !81
  %mul2 = mul i64 %7, %8, !dbg !82
  %9 = load i64, i64* %n.addr, align 8, !dbg !83
  %cmp3 = icmp ule i64 %mul2, %9, !dbg !84
  br i1 %cmp3, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %count, align 8, !dbg !86
  br label %while.cond4, !dbg !88

while.cond4:                                      ; preds = %while.body7, %for.body
  %10 = load i64, i64* %n.addr, align 8, !dbg !89
  %11 = load i64, i64* %i, align 8, !dbg !90
  %rem5 = urem i64 %10, %11, !dbg !91
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !92
  br i1 %cmp6, label %while.body7, label %while.end10, !dbg !88

while.body7:                                      ; preds = %while.cond4
  %12 = load i64, i64* %count, align 8, !dbg !93
  %inc8 = add i64 %12, 1, !dbg !93
  store i64 %inc8, i64* %count, align 8, !dbg !93
  %13 = load i64, i64* %i, align 8, !dbg !95
  %14 = load i64, i64* %n.addr, align 8, !dbg !96
  %div9 = udiv i64 %14, %13, !dbg !96
  store i64 %div9, i64* %n.addr, align 8, !dbg !96
  br label %while.cond4, !dbg !88, !llvm.loop !97

while.end10:                                      ; preds = %while.cond4
  %15 = load i64, i64* %count, align 8, !dbg !99
  %cmp11 = icmp eq i64 %15, 1, !dbg !101
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !102, !cf.info !69

if.then12:                                        ; preds = %while.end10
  %16 = load i64, i64* %i, align 8, !dbg !103
  %add13 = add i64 %16, 1, !dbg !104
  %17 = load i64, i64* %prod, align 8, !dbg !105
  %mul14 = mul i64 %17, %add13, !dbg !105
  store i64 %mul14, i64* %prod, align 8, !dbg !105
  br label %if.end24, !dbg !106

if.else:                                          ; preds = %while.end10
  %18 = load i64, i64* %count, align 8, !dbg !107
  %cmp15 = icmp ugt i64 %18, 1, !dbg !109
  br i1 %cmp15, label %if.then16, label %if.end23, !dbg !110, !cf.info !69

if.then16:                                        ; preds = %if.else
  %19 = load i64, i64* %i, align 8, !dbg !111
  %20 = load i64, i64* %count, align 8, !dbg !112
  %add17 = add i64 %20, 1, !dbg !113
  %call18 = call i64 @raiseTo(i64 %19, i64 %add17), !dbg !114
  %sub19 = sub i64 %call18, 1, !dbg !115
  %21 = load i64, i64* %i, align 8, !dbg !116
  %sub20 = sub i64 %21, 1, !dbg !117
  %div21 = udiv i64 %sub19, %sub20, !dbg !118
  %22 = load i64, i64* %prod, align 8, !dbg !119
  %mul22 = mul i64 %22, %div21, !dbg !119
  store i64 %mul22, i64* %prod, align 8, !dbg !119
  br label %if.end23, !dbg !120

if.end23:                                         ; preds = %if.then16, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then12
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %if.end24
  %23 = load i64, i64* %i, align 8, !dbg !122
  %add25 = add i64 %23, 2, !dbg !122
  store i64 %add25, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %24 = load i64, i64* %n.addr, align 8, !dbg !126
  %cmp26 = icmp ugt i64 %24, 2, !dbg !128
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !129, !cf.info !69

if.then27:                                        ; preds = %for.end
  %25 = load i64, i64* %n.addr, align 8, !dbg !130
  %add28 = add i64 %25, 1, !dbg !131
  %26 = load i64, i64* %prod, align 8, !dbg !132
  %mul29 = mul i64 %26, %add28, !dbg !132
  store i64 %mul29, i64* %prod, align 8, !dbg !132
  br label %if.end30, !dbg !133

if.end30:                                         ; preds = %if.then27, %for.end
  %27 = load i64, i64* %prod, align 8, !dbg !134
  %28 = load i64, i64* %temp, align 8, !dbg !135
  %sub31 = sub i64 %27, %28, !dbg !136
  ret i64 %sub31, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printSeries(i64* %arr, i32 %size, i8* %type) #0 !dbg !138 {
entry:
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i32, align 4
  %type.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64* %arr, i64** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %arr.addr, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !145, metadata !DIExpression()), !dbg !146
  store i8* %type, i8** %type.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %type.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i64*, i64** %arr.addr, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !151
  %1 = load i64, i64* %arrayidx, align 8, !dbg !151
  %2 = load i8*, i8** %type.addr, align 8, !dbg !152
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i64 %1, i8* %2), !dbg !153
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !157
  %4 = load i32, i32* %size.addr, align 4, !dbg !159
  %sub = sub nsw i32 %4, 1, !dbg !160
  %cmp = icmp slt i32 %3, %sub, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %arr.addr, align 8, !dbg !163
  %6 = load i32, i32* %i, align 4, !dbg !164
  %idxprom = sext i32 %6 to i64, !dbg !163
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %idxprom, !dbg !163
  %7 = load i64, i64* %arrayidx1, align 8, !dbg !163
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 %7), !dbg !165
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %8, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %arr.addr, align 8, !dbg !170
  %10 = load i32, i32* %i, align 4, !dbg !171
  %idxprom3 = sext i32 %10 to i64, !dbg !170
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 %idxprom3, !dbg !170
  %11 = load i64, i64* %arrayidx4, align 8, !dbg !170
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %11), !dbg !172
  ret void, !dbg !173
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @aliquotClassifier(i64 %n) #0 !dbg !174 {
entry:
  %n.addr = alloca i64, align 8
  %arr = alloca [16 x i64], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [16 x i64]* %arr, metadata !179, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i32* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %j, metadata !186, metadata !DIExpression()), !dbg !187
  %0 = load i64, i64* %n.addr, align 8, !dbg !188
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !189
  store i64 %0, i64* %arrayidx, align 16, !dbg !190
  store i32 1, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc63, %entry
  %1 = load i32, i32* %i, align 4, !dbg !194
  %cmp = icmp slt i32 %1, 16, !dbg !196
  br i1 %cmp, label %for.body, label %for.end65, !dbg !197

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !198
  %sub = sub nsw i32 %2, 1, !dbg !200
  %idxprom = sext i32 %sub to i64, !dbg !201
  %arrayidx1 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom, !dbg !201
  %3 = load i64, i64* %arrayidx1, align 8, !dbg !201
  %call = call i64 @properDivisorSum(i64 %3), !dbg !202
  %4 = load i32, i32* %i, align 4, !dbg !203
  %idxprom2 = sext i32 %4 to i64, !dbg !204
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom2, !dbg !204
  store i64 %call, i64* %arrayidx3, align 8, !dbg !205
  %5 = load i32, i32* %i, align 4, !dbg !206
  %idxprom4 = sext i32 %5 to i64, !dbg !208
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom4, !dbg !208
  %6 = load i64, i64* %arrayidx5, align 8, !dbg !208
  %cmp6 = icmp eq i64 %6, 0, !dbg !209
  br i1 %cmp6, label %if.then, label %lor.lhs.false, !dbg !210, !cf.info !69

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !211
  %idxprom7 = sext i32 %7 to i64, !dbg !212
  %arrayidx8 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom7, !dbg !212
  %8 = load i64, i64* %arrayidx8, align 8, !dbg !212
  %9 = load i64, i64* %n.addr, align 8, !dbg !213
  %cmp9 = icmp eq i64 %8, %9, !dbg !214
  br i1 %cmp9, label %if.then, label %lor.lhs.false10, !dbg !215, !cf.info !69

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %10 = load i32, i32* %i, align 4, !dbg !216
  %idxprom11 = sext i32 %10 to i64, !dbg !217
  %arrayidx12 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom11, !dbg !217
  %11 = load i64, i64* %arrayidx12, align 8, !dbg !217
  %12 = load i32, i32* %i, align 4, !dbg !218
  %sub13 = sub nsw i32 %12, 1, !dbg !219
  %idxprom14 = sext i32 %sub13 to i64, !dbg !220
  %arrayidx15 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom14, !dbg !220
  %13 = load i64, i64* %arrayidx15, align 8, !dbg !220
  %cmp16 = icmp eq i64 %11, %13, !dbg !221
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !222, !cf.info !69

land.lhs.true:                                    ; preds = %lor.lhs.false10
  %14 = load i32, i32* %i, align 4, !dbg !223
  %idxprom17 = sext i32 %14 to i64, !dbg !224
  %arrayidx18 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom17, !dbg !224
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !224
  %16 = load i64, i64* %n.addr, align 8, !dbg !225
  %cmp19 = icmp ne i64 %15, %16, !dbg !226
  br i1 %cmp19, label %if.then, label %if.end, !dbg !227, !cf.info !69

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %for.body
  %arraydecay = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !228
  %17 = load i32, i32* %i, align 4, !dbg !230
  %add = add nsw i32 %17, 1, !dbg !231
  %18 = load i32, i32* %i, align 4, !dbg !232
  %idxprom20 = sext i32 %18 to i64, !dbg !233
  %arrayidx21 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom20, !dbg !233
  %19 = load i64, i64* %arrayidx21, align 8, !dbg !233
  %cmp22 = icmp eq i64 %19, 0, !dbg !234
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !235

cond.true:                                        ; preds = %if.then
  br label %cond.end49, !dbg !235

cond.false:                                       ; preds = %if.then
  %20 = load i32, i32* %i, align 4, !dbg !236
  %idxprom23 = sext i32 %20 to i64, !dbg !237
  %arrayidx24 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom23, !dbg !237
  %21 = load i64, i64* %arrayidx24, align 8, !dbg !237
  %22 = load i64, i64* %n.addr, align 8, !dbg !238
  %cmp25 = icmp eq i64 %21, %22, !dbg !239
  br i1 %cmp25, label %land.lhs.true26, label %cond.false29, !dbg !240

land.lhs.true26:                                  ; preds = %cond.false
  %23 = load i32, i32* %i, align 4, !dbg !241
  %cmp27 = icmp eq i32 %23, 1, !dbg !242
  br i1 %cmp27, label %cond.true28, label %cond.false29, !dbg !243

cond.true28:                                      ; preds = %land.lhs.true26
  br label %cond.end47, !dbg !243

cond.false29:                                     ; preds = %land.lhs.true26, %cond.false
  %24 = load i32, i32* %i, align 4, !dbg !244
  %idxprom30 = sext i32 %24 to i64, !dbg !245
  %arrayidx31 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom30, !dbg !245
  %25 = load i64, i64* %arrayidx31, align 8, !dbg !245
  %26 = load i64, i64* %n.addr, align 8, !dbg !246
  %cmp32 = icmp eq i64 %25, %26, !dbg !247
  br i1 %cmp32, label %land.lhs.true33, label %cond.false36, !dbg !248

land.lhs.true33:                                  ; preds = %cond.false29
  %27 = load i32, i32* %i, align 4, !dbg !249
  %cmp34 = icmp eq i32 %27, 2, !dbg !250
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !251

cond.true35:                                      ; preds = %land.lhs.true33
  br label %cond.end, !dbg !251

cond.false36:                                     ; preds = %land.lhs.true33, %cond.false29
  %28 = load i32, i32* %i, align 4, !dbg !252
  %idxprom37 = sext i32 %28 to i64, !dbg !253
  %arrayidx38 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom37, !dbg !253
  %29 = load i64, i64* %arrayidx38, align 8, !dbg !253
  %30 = load i32, i32* %i, align 4, !dbg !254
  %sub39 = sub nsw i32 %30, 1, !dbg !255
  %idxprom40 = sext i32 %sub39 to i64, !dbg !256
  %arrayidx41 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom40, !dbg !256
  %31 = load i64, i64* %arrayidx41, align 8, !dbg !256
  %cmp42 = icmp eq i64 %29, %31, !dbg !257
  br i1 %cmp42, label %land.rhs, label %land.end, !dbg !258

land.rhs:                                         ; preds = %cond.false36
  %32 = load i32, i32* %i, align 4, !dbg !259
  %idxprom43 = sext i32 %32 to i64, !dbg !260
  %arrayidx44 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom43, !dbg !260
  %33 = load i64, i64* %arrayidx44, align 8, !dbg !260
  %34 = load i64, i64* %n.addr, align 8, !dbg !261
  %cmp45 = icmp ne i64 %33, %34, !dbg !262
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false36
  %35 = phi i1 [ false, %cond.false36 ], [ %cmp45, %land.rhs ], !dbg !263
  %36 = zext i1 %35 to i64, !dbg !264
  %cond = select i1 %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), !dbg !264
  br label %cond.end, !dbg !251

cond.end:                                         ; preds = %land.end, %cond.true35
  %cond46 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), %cond.true35 ], [ %cond, %land.end ], !dbg !251
  br label %cond.end47, !dbg !243

cond.end47:                                       ; preds = %cond.end, %cond.true28
  %cond48 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), %cond.true28 ], [ %cond46, %cond.end ], !dbg !243
  br label %cond.end49, !dbg !235

cond.end49:                                       ; preds = %cond.end47, %cond.true
  %cond50 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond48, %cond.end47 ], !dbg !235
  call void @printSeries(i64* %arraydecay, i32 %add, i8* %cond50), !dbg !265
  br label %return, !dbg !266

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false10
  store i32 1, i32* %j, align 4, !dbg !267
  br label %for.cond51, !dbg !269

for.cond51:                                       ; preds = %for.inc, %if.end
  %37 = load i32, i32* %j, align 4, !dbg !270
  %38 = load i32, i32* %i, align 4, !dbg !272
  %cmp52 = icmp slt i32 %37, %38, !dbg !273
  br i1 %cmp52, label %for.body53, label %for.end, !dbg !274

for.body53:                                       ; preds = %for.cond51
  %39 = load i32, i32* %j, align 4, !dbg !275
  %idxprom54 = sext i32 %39 to i64, !dbg !278
  %arrayidx55 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom54, !dbg !278
  %40 = load i64, i64* %arrayidx55, align 8, !dbg !278
  %41 = load i32, i32* %i, align 4, !dbg !279
  %idxprom56 = sext i32 %41 to i64, !dbg !280
  %arrayidx57 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom56, !dbg !280
  %42 = load i64, i64* %arrayidx57, align 8, !dbg !280
  %cmp58 = icmp eq i64 %40, %42, !dbg !281
  br i1 %cmp58, label %if.then59, label %if.end62, !dbg !282, !cf.info !69

if.then59:                                        ; preds = %for.body53
  %arraydecay60 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !283
  %43 = load i32, i32* %i, align 4, !dbg !285
  %add61 = add nsw i32 %43, 1, !dbg !286
  call void @printSeries(i64* %arraydecay60, i32 %add61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)), !dbg !287
  br label %return, !dbg !288

if.end62:                                         ; preds = %for.body53
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %if.end62
  %44 = load i32, i32* %j, align 4, !dbg !290
  %inc = add nsw i32 %44, 1, !dbg !290
  store i32 %inc, i32* %j, align 4, !dbg !290
  br label %for.cond51, !dbg !291, !llvm.loop !292

for.end:                                          ; preds = %for.cond51
  br label %for.inc63, !dbg !294

for.inc63:                                        ; preds = %for.end
  %45 = load i32, i32* %i, align 4, !dbg !295
  %inc64 = add nsw i32 %45, 1, !dbg !295
  store i32 %inc64, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end65:                                        ; preds = %for.cond
  %arraydecay66 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !299
  %46 = load i32, i32* %i, align 4, !dbg !300
  %add67 = add nsw i32 %46, 1, !dbg !301
  call void @printSeries(i64* %arraydecay66, i32 %add67, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !302
  br label %return, !dbg !303

return:                                           ; preds = %for.end65, %if.then59, %cond.end49
  ret void, !dbg !303
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @processFile(i8* %fileName) #0 !dbg !304 {
entry:
  %fileName.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [21 x i8], align 16
  store i8* %fileName, i8** %fileName.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fileName.addr, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !309, metadata !DIExpression()), !dbg !369
  %0 = load i8*, i8** %fileName.addr, align 8, !dbg !370
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)), !dbg !371
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !369
  call void @llvm.dbg.declare(metadata [21 x i8]* %str, metadata !372, metadata !DIExpression()), !dbg !376
  br label %while.cond, !dbg !377

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !378
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !379
  %call1 = call i8* @fgets(i8* %arraydecay, i32 21, %struct._IO_FILE* %1), !dbg !380
  %cmp = icmp ne i8* %call1, null, !dbg !381
  br i1 %cmp, label %while.body, label %while.end, !dbg !377

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !382
  %call3 = call i64 @strtoull(i8* %arraydecay2, i8** null, i32 10) #5, !dbg !383
  call void @aliquotClassifier(i64 %call3), !dbg !384
  br label %while.cond, !dbg !377, !llvm.loop !385

while.end:                                        ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !387
  %call4 = call i32 @fclose(%struct._IO_FILE* %2), !dbg !388
  ret void, !dbg !389
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !390 {
entry:
  %retval = alloca i32, align 4
  %argC.addr = alloca i32, align 4
  %argV.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argC, i32* %argC.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argC.addr, metadata !393, metadata !DIExpression()), !dbg !394
  store i8** %argV, i8*** %argV.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argV.addr, metadata !395, metadata !DIExpression()), !dbg !396
  %0 = load i32, i32* %argC.addr, align 4, !dbg !397
  %cmp = icmp ne i32 %0, 2, !dbg !399
  br i1 %cmp, label %if.then, label %if.else, !dbg !400, !cf.info !69

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argV.addr, align 8, !dbg !401
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !401
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !401
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), i8* %2), !dbg !402
  br label %if.end9, !dbg !402

if.else:                                          ; preds = %entry
  %3 = load i8**, i8*** %argV.addr, align 8, !dbg !403
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !403
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !403
  %call2 = call i8* @strchr(i8* %4, i32 46) #6, !dbg !406
  %cmp3 = icmp ne i8* %call2, null, !dbg !407
  br i1 %cmp3, label %if.then4, label %if.else6, !dbg !408, !cf.info !69

if.then4:                                         ; preds = %if.else
  %5 = load i8**, i8*** %argV.addr, align 8, !dbg !409
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !409
  %6 = load i8*, i8** %arrayidx5, align 8, !dbg !409
  call void @processFile(i8* %6), !dbg !410
  br label %if.end, !dbg !410

if.else6:                                         ; preds = %if.else
  %7 = load i8**, i8*** %argV.addr, align 8, !dbg !411
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i64 1, !dbg !411
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !411
  %call8 = call i64 @strtoull(i8* %8, i8** null, i32 10) #5, !dbg !412
  call void @aliquotClassifier(i64 %call8), !dbg !413
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0, !dbg !414
}

; Function Attrs: nounwind readonly
declare dso_local i8* @strchr(i8*, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "aliquot-sequence-classifications-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Aliquot-sequence-classifications")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!12 = distinct !DISubprogram(name: "raiseTo", scope: !1, file: !1, line: 5, type: !13, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !15}
!15 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DILocalVariable(name: "base", arg: 1, scope: !12, file: !1, line: 5, type: !15)
!17 = !DILocation(line: 5, column: 47, scope: !12)
!18 = !DILocalVariable(name: "power", arg: 2, scope: !12, file: !1, line: 5, type: !15)
!19 = !DILocation(line: 5, column: 72, scope: !12)
!20 = !DILocalVariable(name: "result", scope: !12, file: !1, line: 6, type: !15)
!21 = !DILocation(line: 6, column: 24, scope: !12)
!22 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 6, type: !15)
!23 = !DILocation(line: 6, column: 35, scope: !12)
!24 = !DILocation(line: 7, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !1, line: 7, column: 5)
!26 = !DILocation(line: 7, column: 10, scope: !25)
!27 = !DILocation(line: 7, column: 15, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 7, column: 5)
!29 = !DILocation(line: 7, column: 17, scope: !28)
!30 = !DILocation(line: 7, column: 16, scope: !28)
!31 = !DILocation(line: 7, column: 5, scope: !25)
!32 = !DILocation(line: 8, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 7, column: 28)
!34 = !DILocation(line: 8, column: 15, scope: !33)
!35 = !DILocation(line: 9, column: 5, scope: !33)
!36 = !DILocation(line: 7, column: 24, scope: !28)
!37 = !DILocation(line: 7, column: 5, scope: !28)
!38 = distinct !{!38, !31, !39}
!39 = !DILocation(line: 9, column: 5, scope: !25)
!40 = !DILocation(line: 10, column: 12, scope: !12)
!41 = !DILocation(line: 10, column: 5, scope: !12)
!42 = distinct !DISubprogram(name: "properDivisorSum", scope: !1, file: !1, line: 13, type: !43, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!15, !15}
!45 = !DILocalVariable(name: "n", arg: 1, scope: !42, file: !1, line: 13, type: !15)
!46 = !DILocation(line: 13, column: 56, scope: !42)
!47 = !DILocalVariable(name: "prod", scope: !42, file: !1, line: 14, type: !15)
!48 = !DILocation(line: 14, column: 21, scope: !42)
!49 = !DILocalVariable(name: "temp", scope: !42, file: !1, line: 15, type: !15)
!50 = !DILocation(line: 15, column: 21, scope: !42)
!51 = !DILocation(line: 15, column: 28, scope: !42)
!52 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 15, type: !15)
!53 = !DILocation(line: 15, column: 30, scope: !42)
!54 = !DILocalVariable(name: "count", scope: !42, file: !1, line: 15, type: !15)
!55 = !DILocation(line: 15, column: 32, scope: !42)
!56 = !DILocation(line: 17, column: 2, scope: !42)
!57 = !DILocation(line: 17, column: 8, scope: !42)
!58 = !DILocation(line: 17, column: 9, scope: !42)
!59 = !DILocation(line: 17, column: 12, scope: !42)
!60 = !DILocation(line: 18, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !1, line: 17, column: 17)
!62 = !DILocation(line: 19, column: 5, scope: !61)
!63 = distinct !{!63, !56, !64}
!64 = !DILocation(line: 20, column: 2, scope: !42)
!65 = !DILocation(line: 22, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !42, file: !1, line: 22, column: 5)
!67 = !DILocation(line: 22, column: 10, scope: !66)
!68 = !DILocation(line: 22, column: 5, scope: !42)
!69 = !{!"if"}
!70 = !DILocation(line: 23, column: 22, scope: !66)
!71 = !DILocation(line: 23, column: 28, scope: !66)
!72 = !DILocation(line: 23, column: 12, scope: !66)
!73 = !DILocation(line: 23, column: 33, scope: !66)
!74 = !DILocation(line: 23, column: 8, scope: !66)
!75 = !DILocation(line: 23, column: 3, scope: !66)
!76 = !DILocation(line: 25, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !42, file: !1, line: 25, column: 2)
!78 = !DILocation(line: 25, column: 6, scope: !77)
!79 = !DILocation(line: 25, column: 10, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !1, line: 25, column: 2)
!81 = !DILocation(line: 25, column: 12, scope: !80)
!82 = !DILocation(line: 25, column: 11, scope: !80)
!83 = !DILocation(line: 25, column: 15, scope: !80)
!84 = !DILocation(line: 25, column: 13, scope: !80)
!85 = !DILocation(line: 25, column: 2, scope: !77)
!86 = !DILocation(line: 26, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 25, column: 22)
!88 = !DILocation(line: 28, column: 3, scope: !87)
!89 = !DILocation(line: 28, column: 9, scope: !87)
!90 = !DILocation(line: 28, column: 11, scope: !87)
!91 = !DILocation(line: 28, column: 10, scope: !87)
!92 = !DILocation(line: 28, column: 13, scope: !87)
!93 = !DILocation(line: 29, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !1, line: 28, column: 18)
!95 = !DILocation(line: 30, column: 9, scope: !94)
!96 = !DILocation(line: 30, column: 6, scope: !94)
!97 = distinct !{!97, !88, !98}
!98 = !DILocation(line: 31, column: 3, scope: !87)
!99 = !DILocation(line: 33, column: 6, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !1, line: 33, column: 6)
!101 = !DILocation(line: 33, column: 11, scope: !100)
!102 = !DILocation(line: 33, column: 6, scope: !87)
!103 = !DILocation(line: 34, column: 13, scope: !100)
!104 = !DILocation(line: 34, column: 14, scope: !100)
!105 = !DILocation(line: 34, column: 9, scope: !100)
!106 = !DILocation(line: 34, column: 4, scope: !100)
!107 = !DILocation(line: 35, column: 11, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !1, line: 35, column: 11)
!109 = !DILocation(line: 35, column: 17, scope: !108)
!110 = !DILocation(line: 35, column: 11, scope: !100)
!111 = !DILocation(line: 36, column: 22, scope: !108)
!112 = !DILocation(line: 36, column: 24, scope: !108)
!113 = !DILocation(line: 36, column: 30, scope: !108)
!114 = !DILocation(line: 36, column: 14, scope: !108)
!115 = !DILocation(line: 36, column: 35, scope: !108)
!116 = !DILocation(line: 36, column: 41, scope: !108)
!117 = !DILocation(line: 36, column: 42, scope: !108)
!118 = !DILocation(line: 36, column: 39, scope: !108)
!119 = !DILocation(line: 36, column: 9, scope: !108)
!120 = !DILocation(line: 36, column: 4, scope: !108)
!121 = !DILocation(line: 37, column: 2, scope: !87)
!122 = !DILocation(line: 25, column: 18, scope: !80)
!123 = !DILocation(line: 25, column: 2, scope: !80)
!124 = distinct !{!124, !85, !125}
!125 = !DILocation(line: 37, column: 2, scope: !77)
!126 = !DILocation(line: 39, column: 5, scope: !127)
!127 = distinct !DILexicalBlock(scope: !42, file: !1, line: 39, column: 5)
!128 = !DILocation(line: 39, column: 6, scope: !127)
!129 = !DILocation(line: 39, column: 5, scope: !42)
!130 = !DILocation(line: 40, column: 12, scope: !127)
!131 = !DILocation(line: 40, column: 13, scope: !127)
!132 = !DILocation(line: 40, column: 8, scope: !127)
!133 = !DILocation(line: 40, column: 3, scope: !127)
!134 = !DILocation(line: 42, column: 9, scope: !42)
!135 = !DILocation(line: 42, column: 16, scope: !42)
!136 = !DILocation(line: 42, column: 14, scope: !42)
!137 = !DILocation(line: 42, column: 2, scope: !42)
!138 = distinct !DISubprogram(name: "printSeries", scope: !1, file: !1, line: 45, type: !139, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !141, !142, !6}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!142 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!143 = !DILocalVariable(name: "arr", arg: 1, scope: !138, file: !1, line: 45, type: !141)
!144 = !DILocation(line: 45, column: 38, scope: !138)
!145 = !DILocalVariable(name: "size", arg: 2, scope: !138, file: !1, line: 45, type: !142)
!146 = !DILocation(line: 45, column: 46, scope: !138)
!147 = !DILocalVariable(name: "type", arg: 3, scope: !138, file: !1, line: 45, type: !6)
!148 = !DILocation(line: 45, column: 57, scope: !138)
!149 = !DILocalVariable(name: "i", scope: !138, file: !1, line: 46, type: !142)
!150 = !DILocation(line: 46, column: 6, scope: !138)
!151 = !DILocation(line: 48, column: 50, scope: !138)
!152 = !DILocation(line: 48, column: 57, scope: !138)
!153 = !DILocation(line: 48, column: 2, scope: !138)
!154 = !DILocation(line: 50, column: 7, scope: !155)
!155 = distinct !DILexicalBlock(scope: !138, file: !1, line: 50, column: 2)
!156 = !DILocation(line: 50, column: 6, scope: !155)
!157 = !DILocation(line: 50, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !1, line: 50, column: 2)
!159 = !DILocation(line: 50, column: 12, scope: !158)
!160 = !DILocation(line: 50, column: 16, scope: !158)
!161 = !DILocation(line: 50, column: 11, scope: !158)
!162 = !DILocation(line: 50, column: 2, scope: !155)
!163 = !DILocation(line: 51, column: 19, scope: !158)
!164 = !DILocation(line: 51, column: 23, scope: !158)
!165 = !DILocation(line: 51, column: 3, scope: !158)
!166 = !DILocation(line: 50, column: 20, scope: !158)
!167 = !DILocation(line: 50, column: 2, scope: !158)
!168 = distinct !{!168, !162, !169}
!169 = !DILocation(line: 51, column: 25, scope: !155)
!170 = !DILocation(line: 52, column: 16, scope: !138)
!171 = !DILocation(line: 52, column: 20, scope: !138)
!172 = !DILocation(line: 52, column: 2, scope: !138)
!173 = !DILocation(line: 53, column: 1, scope: !138)
!174 = distinct !DISubprogram(name: "aliquotClassifier", scope: !1, file: !1, line: 55, type: !175, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DISubroutineType(types: !176)
!176 = !{null, !15}
!177 = !DILocalVariable(name: "n", arg: 1, scope: !174, file: !1, line: 55, type: !15)
!178 = !DILocation(line: 55, column: 43, scope: !174)
!179 = !DILocalVariable(name: "arr", scope: !174, file: !1, line: 56, type: !180)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 16)
!183 = !DILocation(line: 56, column: 21, scope: !174)
!184 = !DILocalVariable(name: "i", scope: !174, file: !1, line: 57, type: !142)
!185 = !DILocation(line: 57, column: 6, scope: !174)
!186 = !DILocalVariable(name: "j", scope: !174, file: !1, line: 57, type: !142)
!187 = !DILocation(line: 57, column: 8, scope: !174)
!188 = !DILocation(line: 59, column: 11, scope: !174)
!189 = !DILocation(line: 59, column: 2, scope: !174)
!190 = !DILocation(line: 59, column: 9, scope: !174)
!191 = !DILocation(line: 61, column: 7, scope: !192)
!192 = distinct !DILexicalBlock(scope: !174, file: !1, line: 61, column: 2)
!193 = !DILocation(line: 61, column: 6, scope: !192)
!194 = !DILocation(line: 61, column: 10, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !1, line: 61, column: 2)
!196 = !DILocation(line: 61, column: 11, scope: !195)
!197 = !DILocation(line: 61, column: 2, scope: !192)
!198 = !DILocation(line: 62, column: 33, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !1, line: 61, column: 19)
!200 = !DILocation(line: 62, column: 34, scope: !199)
!201 = !DILocation(line: 62, column: 29, scope: !199)
!202 = !DILocation(line: 62, column: 12, scope: !199)
!203 = !DILocation(line: 62, column: 7, scope: !199)
!204 = !DILocation(line: 62, column: 3, scope: !199)
!205 = !DILocation(line: 62, column: 10, scope: !199)
!206 = !DILocation(line: 64, column: 10, scope: !207)
!207 = distinct !DILexicalBlock(scope: !199, file: !1, line: 64, column: 6)
!208 = !DILocation(line: 64, column: 6, scope: !207)
!209 = !DILocation(line: 64, column: 12, scope: !207)
!210 = !DILocation(line: 64, column: 15, scope: !207)
!211 = !DILocation(line: 64, column: 21, scope: !207)
!212 = !DILocation(line: 64, column: 17, scope: !207)
!213 = !DILocation(line: 64, column: 25, scope: !207)
!214 = !DILocation(line: 64, column: 23, scope: !207)
!215 = !DILocation(line: 64, column: 26, scope: !207)
!216 = !DILocation(line: 64, column: 33, scope: !207)
!217 = !DILocation(line: 64, column: 29, scope: !207)
!218 = !DILocation(line: 64, column: 41, scope: !207)
!219 = !DILocation(line: 64, column: 42, scope: !207)
!220 = !DILocation(line: 64, column: 37, scope: !207)
!221 = !DILocation(line: 64, column: 35, scope: !207)
!222 = !DILocation(line: 64, column: 46, scope: !207)
!223 = !DILocation(line: 64, column: 53, scope: !207)
!224 = !DILocation(line: 64, column: 49, scope: !207)
!225 = !DILocation(line: 64, column: 57, scope: !207)
!226 = !DILocation(line: 64, column: 55, scope: !207)
!227 = !DILocation(line: 64, column: 6, scope: !199)
!228 = !DILocation(line: 65, column: 16, scope: !229)
!229 = distinct !DILexicalBlock(scope: !207, file: !1, line: 64, column: 60)
!230 = !DILocation(line: 65, column: 20, scope: !229)
!231 = !DILocation(line: 65, column: 21, scope: !229)
!232 = !DILocation(line: 65, column: 29, scope: !229)
!233 = !DILocation(line: 65, column: 25, scope: !229)
!234 = !DILocation(line: 65, column: 31, scope: !229)
!235 = !DILocation(line: 65, column: 24, scope: !229)
!236 = !DILocation(line: 65, column: 55, scope: !229)
!237 = !DILocation(line: 65, column: 51, scope: !229)
!238 = !DILocation(line: 65, column: 59, scope: !229)
!239 = !DILocation(line: 65, column: 57, scope: !229)
!240 = !DILocation(line: 65, column: 61, scope: !229)
!241 = !DILocation(line: 65, column: 64, scope: !229)
!242 = !DILocation(line: 65, column: 65, scope: !229)
!243 = !DILocation(line: 65, column: 50, scope: !229)
!244 = !DILocation(line: 65, column: 85, scope: !229)
!245 = !DILocation(line: 65, column: 81, scope: !229)
!246 = !DILocation(line: 65, column: 89, scope: !229)
!247 = !DILocation(line: 65, column: 87, scope: !229)
!248 = !DILocation(line: 65, column: 91, scope: !229)
!249 = !DILocation(line: 65, column: 94, scope: !229)
!250 = !DILocation(line: 65, column: 95, scope: !229)
!251 = !DILocation(line: 65, column: 80, scope: !229)
!252 = !DILocation(line: 65, column: 116, scope: !229)
!253 = !DILocation(line: 65, column: 112, scope: !229)
!254 = !DILocation(line: 65, column: 124, scope: !229)
!255 = !DILocation(line: 65, column: 125, scope: !229)
!256 = !DILocation(line: 65, column: 120, scope: !229)
!257 = !DILocation(line: 65, column: 118, scope: !229)
!258 = !DILocation(line: 65, column: 129, scope: !229)
!259 = !DILocation(line: 65, column: 136, scope: !229)
!260 = !DILocation(line: 65, column: 132, scope: !229)
!261 = !DILocation(line: 65, column: 140, scope: !229)
!262 = !DILocation(line: 65, column: 138, scope: !229)
!263 = !DILocation(line: 0, scope: !229)
!264 = !DILocation(line: 65, column: 111, scope: !229)
!265 = !DILocation(line: 65, column: 4, scope: !229)
!266 = !DILocation(line: 66, column: 4, scope: !229)
!267 = !DILocation(line: 69, column: 8, scope: !268)
!268 = distinct !DILexicalBlock(scope: !199, file: !1, line: 69, column: 3)
!269 = !DILocation(line: 69, column: 7, scope: !268)
!270 = !DILocation(line: 69, column: 11, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !1, line: 69, column: 3)
!272 = !DILocation(line: 69, column: 13, scope: !271)
!273 = !DILocation(line: 69, column: 12, scope: !271)
!274 = !DILocation(line: 69, column: 3, scope: !268)
!275 = !DILocation(line: 70, column: 11, scope: !276)
!276 = distinct !DILexicalBlock(scope: !277, file: !1, line: 70, column: 7)
!277 = distinct !DILexicalBlock(scope: !271, file: !1, line: 69, column: 19)
!278 = !DILocation(line: 70, column: 7, scope: !276)
!279 = !DILocation(line: 70, column: 19, scope: !276)
!280 = !DILocation(line: 70, column: 15, scope: !276)
!281 = !DILocation(line: 70, column: 13, scope: !276)
!282 = !DILocation(line: 70, column: 7, scope: !277)
!283 = !DILocation(line: 71, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !276, file: !1, line: 70, column: 22)
!285 = !DILocation(line: 71, column: 21, scope: !284)
!286 = !DILocation(line: 71, column: 22, scope: !284)
!287 = !DILocation(line: 71, column: 5, scope: !284)
!288 = !DILocation(line: 72, column: 5, scope: !284)
!289 = !DILocation(line: 74, column: 3, scope: !277)
!290 = !DILocation(line: 69, column: 16, scope: !271)
!291 = !DILocation(line: 69, column: 3, scope: !271)
!292 = distinct !{!292, !274, !293}
!293 = !DILocation(line: 74, column: 3, scope: !268)
!294 = !DILocation(line: 75, column: 2, scope: !199)
!295 = !DILocation(line: 61, column: 16, scope: !195)
!296 = !DILocation(line: 61, column: 2, scope: !195)
!297 = distinct !{!297, !197, !298}
!298 = !DILocation(line: 75, column: 2, scope: !192)
!299 = !DILocation(line: 77, column: 14, scope: !174)
!300 = !DILocation(line: 77, column: 18, scope: !174)
!301 = !DILocation(line: 77, column: 19, scope: !174)
!302 = !DILocation(line: 77, column: 2, scope: !174)
!303 = !DILocation(line: 78, column: 1, scope: !174)
!304 = distinct !DISubprogram(name: "processFile", scope: !1, file: !1, line: 80, type: !305, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!305 = !DISubroutineType(types: !306)
!306 = !{null, !6}
!307 = !DILocalVariable(name: "fileName", arg: 1, scope: !304, file: !1, line: 80, type: !6)
!308 = !DILocation(line: 80, column: 24, scope: !304)
!309 = !DILocalVariable(name: "fp", scope: !304, file: !1, line: 81, type: !310)
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !312, line: 7, baseType: !313)
!312 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!313 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !314, line: 49, size: 1728, elements: !315)
!314 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!315 = !{!316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328, !331, !333, !334, !335, !339, !341, !343, !347, !350, !352, !355, !358, !359, !360, !364, !365}
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !313, file: !314, line: 51, baseType: !142, size: 32)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !313, file: !314, line: 54, baseType: !6, size: 64, offset: 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !313, file: !314, line: 55, baseType: !6, size: 64, offset: 128)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !313, file: !314, line: 56, baseType: !6, size: 64, offset: 192)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !313, file: !314, line: 57, baseType: !6, size: 64, offset: 256)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !313, file: !314, line: 58, baseType: !6, size: 64, offset: 320)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !313, file: !314, line: 59, baseType: !6, size: 64, offset: 384)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !313, file: !314, line: 60, baseType: !6, size: 64, offset: 448)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !313, file: !314, line: 61, baseType: !6, size: 64, offset: 512)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !313, file: !314, line: 64, baseType: !6, size: 64, offset: 576)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !313, file: !314, line: 65, baseType: !6, size: 64, offset: 640)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !313, file: !314, line: 66, baseType: !6, size: 64, offset: 704)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !313, file: !314, line: 68, baseType: !329, size: 64, offset: 768)
!329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !330, size: 64)
!330 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !314, line: 36, flags: DIFlagFwdDecl)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !313, file: !314, line: 70, baseType: !332, size: 64, offset: 832)
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !313, file: !314, line: 72, baseType: !142, size: 32, offset: 896)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !313, file: !314, line: 73, baseType: !142, size: 32, offset: 928)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !313, file: !314, line: 74, baseType: !336, size: 64, offset: 960)
!336 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !337, line: 152, baseType: !338)
!337 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!338 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !313, file: !314, line: 77, baseType: !340, size: 16, offset: 1024)
!340 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !313, file: !314, line: 78, baseType: !342, size: 8, offset: 1040)
!342 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !313, file: !314, line: 79, baseType: !344, size: 8, offset: 1048)
!344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8, elements: !345)
!345 = !{!346}
!346 = !DISubrange(count: 1)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !313, file: !314, line: 81, baseType: !348, size: 64, offset: 1088)
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !314, line: 43, baseType: null)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !313, file: !314, line: 89, baseType: !351, size: 64, offset: 1152)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !337, line: 153, baseType: !338)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !313, file: !314, line: 91, baseType: !353, size: 64, offset: 1216)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !314, line: 37, flags: DIFlagFwdDecl)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !313, file: !314, line: 92, baseType: !356, size: 64, offset: 1280)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!357 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !314, line: 38, flags: DIFlagFwdDecl)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !313, file: !314, line: 93, baseType: !332, size: 64, offset: 1344)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !313, file: !314, line: 94, baseType: !4, size: 64, offset: 1408)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !313, file: !314, line: 95, baseType: !361, size: 64, offset: 1472)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !362, line: 46, baseType: !363)
!362 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!363 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !313, file: !314, line: 96, baseType: !142, size: 32, offset: 1536)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !313, file: !314, line: 98, baseType: !366, size: 160, offset: 1568)
!366 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !367)
!367 = !{!368}
!368 = !DISubrange(count: 20)
!369 = !DILocation(line: 81, column: 8, scope: !304)
!370 = !DILocation(line: 81, column: 19, scope: !304)
!371 = !DILocation(line: 81, column: 13, scope: !304)
!372 = !DILocalVariable(name: "str", scope: !304, file: !1, line: 82, type: !373)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 168, elements: !374)
!374 = !{!375}
!375 = !DISubrange(count: 21)
!376 = !DILocation(line: 82, column: 7, scope: !304)
!377 = !DILocation(line: 84, column: 2, scope: !304)
!378 = !DILocation(line: 84, column: 14, scope: !304)
!379 = !DILocation(line: 84, column: 21, scope: !304)
!380 = !DILocation(line: 84, column: 8, scope: !304)
!381 = !DILocation(line: 84, column: 24, scope: !304)
!382 = !DILocation(line: 85, column: 30, scope: !304)
!383 = !DILocation(line: 85, column: 21, scope: !304)
!384 = !DILocation(line: 85, column: 3, scope: !304)
!385 = distinct !{!385, !377, !386}
!386 = !DILocation(line: 85, column: 50, scope: !304)
!387 = !DILocation(line: 87, column: 9, scope: !304)
!388 = !DILocation(line: 87, column: 2, scope: !304)
!389 = !DILocation(line: 88, column: 1, scope: !304)
!390 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 90, type: !391, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!391 = !DISubroutineType(types: !392)
!392 = !{!142, !142, !5}
!393 = !DILocalVariable(name: "argC", arg: 1, scope: !390, file: !1, line: 90, type: !142)
!394 = !DILocation(line: 90, column: 14, scope: !390)
!395 = !DILocalVariable(name: "argV", arg: 2, scope: !390, file: !1, line: 90, type: !5)
!396 = !DILocation(line: 90, column: 25, scope: !390)
!397 = !DILocation(line: 92, column: 8, scope: !398)
!398 = distinct !DILexicalBlock(scope: !390, file: !1, line: 92, column: 8)
!399 = !DILocation(line: 92, column: 12, scope: !398)
!400 = !DILocation(line: 92, column: 8, scope: !390)
!401 = !DILocation(line: 93, column: 42, scope: !398)
!402 = !DILocation(line: 93, column: 3, scope: !398)
!403 = !DILocation(line: 95, column: 13, scope: !404)
!404 = distinct !DILexicalBlock(scope: !405, file: !1, line: 95, column: 6)
!405 = distinct !DILexicalBlock(scope: !398, file: !1, line: 94, column: 6)
!406 = !DILocation(line: 95, column: 6, scope: !404)
!407 = !DILocation(line: 95, column: 25, scope: !404)
!408 = !DILocation(line: 95, column: 6, scope: !405)
!409 = !DILocation(line: 96, column: 16, scope: !404)
!410 = !DILocation(line: 96, column: 4, scope: !404)
!411 = !DILocation(line: 98, column: 31, scope: !404)
!412 = !DILocation(line: 98, column: 22, scope: !404)
!413 = !DILocation(line: 98, column: 4, scope: !404)
!414 = !DILocation(line: 100, column: 2, scope: !390)
