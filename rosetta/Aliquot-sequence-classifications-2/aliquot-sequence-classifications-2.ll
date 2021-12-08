; ModuleID = 'aliquot-sequence-classifications-2.bc'
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
  br i1 %cmp1, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %while.end
  %5 = load i64, i64* %count, align 8, !dbg !69
  %add = add i64 %5, 1, !dbg !70
  %call = call i64 @raiseTo(i64 2, i64 %add), !dbg !71
  %sub = sub i64 %call, 1, !dbg !72
  %6 = load i64, i64* %prod, align 8, !dbg !73
  %mul = mul i64 %6, %sub, !dbg !73
  store i64 %mul, i64* %prod, align 8, !dbg !73
  br label %if.end, !dbg !74

if.end:                                           ; preds = %if.then, %while.end
  store i64 3, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !78
  %8 = load i64, i64* %i, align 8, !dbg !80
  %mul2 = mul i64 %7, %8, !dbg !81
  %9 = load i64, i64* %n.addr, align 8, !dbg !82
  %cmp3 = icmp ule i64 %mul2, %9, !dbg !83
  br i1 %cmp3, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %count, align 8, !dbg !85
  br label %while.cond4, !dbg !87

while.cond4:                                      ; preds = %while.body7, %for.body
  %10 = load i64, i64* %n.addr, align 8, !dbg !88
  %11 = load i64, i64* %i, align 8, !dbg !89
  %rem5 = urem i64 %10, %11, !dbg !90
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !91
  br i1 %cmp6, label %while.body7, label %while.end10, !dbg !87

while.body7:                                      ; preds = %while.cond4
  %12 = load i64, i64* %count, align 8, !dbg !92
  %inc8 = add i64 %12, 1, !dbg !92
  store i64 %inc8, i64* %count, align 8, !dbg !92
  %13 = load i64, i64* %i, align 8, !dbg !94
  %14 = load i64, i64* %n.addr, align 8, !dbg !95
  %div9 = udiv i64 %14, %13, !dbg !95
  store i64 %div9, i64* %n.addr, align 8, !dbg !95
  br label %while.cond4, !dbg !87, !llvm.loop !96

while.end10:                                      ; preds = %while.cond4
  %15 = load i64, i64* %count, align 8, !dbg !98
  %cmp11 = icmp eq i64 %15, 1, !dbg !100
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !101

if.then12:                                        ; preds = %while.end10
  %16 = load i64, i64* %i, align 8, !dbg !102
  %add13 = add i64 %16, 1, !dbg !103
  %17 = load i64, i64* %prod, align 8, !dbg !104
  %mul14 = mul i64 %17, %add13, !dbg !104
  store i64 %mul14, i64* %prod, align 8, !dbg !104
  br label %if.end24, !dbg !105

if.else:                                          ; preds = %while.end10
  %18 = load i64, i64* %count, align 8, !dbg !106
  %cmp15 = icmp ugt i64 %18, 1, !dbg !108
  br i1 %cmp15, label %if.then16, label %if.end23, !dbg !109

if.then16:                                        ; preds = %if.else
  %19 = load i64, i64* %i, align 8, !dbg !110
  %20 = load i64, i64* %count, align 8, !dbg !111
  %add17 = add i64 %20, 1, !dbg !112
  %call18 = call i64 @raiseTo(i64 %19, i64 %add17), !dbg !113
  %sub19 = sub i64 %call18, 1, !dbg !114
  %21 = load i64, i64* %i, align 8, !dbg !115
  %sub20 = sub i64 %21, 1, !dbg !116
  %div21 = udiv i64 %sub19, %sub20, !dbg !117
  %22 = load i64, i64* %prod, align 8, !dbg !118
  %mul22 = mul i64 %22, %div21, !dbg !118
  store i64 %mul22, i64* %prod, align 8, !dbg !118
  br label %if.end23, !dbg !119

if.end23:                                         ; preds = %if.then16, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then12
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %if.end24
  %23 = load i64, i64* %i, align 8, !dbg !121
  %add25 = add i64 %23, 2, !dbg !121
  store i64 %add25, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  %24 = load i64, i64* %n.addr, align 8, !dbg !125
  %cmp26 = icmp ugt i64 %24, 2, !dbg !127
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !128

if.then27:                                        ; preds = %for.end
  %25 = load i64, i64* %n.addr, align 8, !dbg !129
  %add28 = add i64 %25, 1, !dbg !130
  %26 = load i64, i64* %prod, align 8, !dbg !131
  %mul29 = mul i64 %26, %add28, !dbg !131
  store i64 %mul29, i64* %prod, align 8, !dbg !131
  br label %if.end30, !dbg !132

if.end30:                                         ; preds = %if.then27, %for.end
  %27 = load i64, i64* %prod, align 8, !dbg !133
  %28 = load i64, i64* %temp, align 8, !dbg !134
  %sub31 = sub i64 %27, %28, !dbg !135
  ret i64 %sub31, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printSeries(i64* %arr, i32 %size, i8* %type) #0 !dbg !137 {
entry:
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i32, align 4
  %type.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64* %arr, i64** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %arr.addr, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i8* %type, i8** %type.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %type.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i64*, i64** %arr.addr, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !150
  %1 = load i64, i64* %arrayidx, align 8, !dbg !150
  %2 = load i8*, i8** %type.addr, align 8, !dbg !151
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i64 %1, i8* %2), !dbg !152
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !156
  %4 = load i32, i32* %size.addr, align 4, !dbg !158
  %sub = sub nsw i32 %4, 1, !dbg !159
  %cmp = icmp slt i32 %3, %sub, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %arr.addr, align 8, !dbg !162
  %6 = load i32, i32* %i, align 4, !dbg !163
  %idxprom = sext i32 %6 to i64, !dbg !162
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %idxprom, !dbg !162
  %7 = load i64, i64* %arrayidx1, align 8, !dbg !162
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 %7), !dbg !164
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !165
  %inc = add nsw i32 %8, 1, !dbg !165
  store i32 %inc, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %arr.addr, align 8, !dbg !169
  %10 = load i32, i32* %i, align 4, !dbg !170
  %idxprom3 = sext i32 %10 to i64, !dbg !169
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 %idxprom3, !dbg !169
  %11 = load i64, i64* %arrayidx4, align 8, !dbg !169
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %11), !dbg !171
  ret void, !dbg !172
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @aliquotClassifier(i64 %n) #0 !dbg !173 {
entry:
  %n.addr = alloca i64, align 8
  %arr = alloca [16 x i64], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [16 x i64]* %arr, metadata !178, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %j, metadata !185, metadata !DIExpression()), !dbg !186
  %0 = load i64, i64* %n.addr, align 8, !dbg !187
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !188
  store i64 %0, i64* %arrayidx, align 16, !dbg !189
  store i32 1, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc63, %entry
  %1 = load i32, i32* %i, align 4, !dbg !193
  %cmp = icmp slt i32 %1, 16, !dbg !195
  br i1 %cmp, label %for.body, label %for.end65, !dbg !196

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !197
  %sub = sub nsw i32 %2, 1, !dbg !199
  %idxprom = sext i32 %sub to i64, !dbg !200
  %arrayidx1 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom, !dbg !200
  %3 = load i64, i64* %arrayidx1, align 8, !dbg !200
  %call = call i64 @properDivisorSum(i64 %3), !dbg !201
  %4 = load i32, i32* %i, align 4, !dbg !202
  %idxprom2 = sext i32 %4 to i64, !dbg !203
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom2, !dbg !203
  store i64 %call, i64* %arrayidx3, align 8, !dbg !204
  %5 = load i32, i32* %i, align 4, !dbg !205
  %idxprom4 = sext i32 %5 to i64, !dbg !207
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom4, !dbg !207
  %6 = load i64, i64* %arrayidx5, align 8, !dbg !207
  %cmp6 = icmp eq i64 %6, 0, !dbg !208
  br i1 %cmp6, label %if.then, label %lor.lhs.false, !dbg !209

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !210
  %idxprom7 = sext i32 %7 to i64, !dbg !211
  %arrayidx8 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom7, !dbg !211
  %8 = load i64, i64* %arrayidx8, align 8, !dbg !211
  %9 = load i64, i64* %n.addr, align 8, !dbg !212
  %cmp9 = icmp eq i64 %8, %9, !dbg !213
  br i1 %cmp9, label %if.then, label %lor.lhs.false10, !dbg !214

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %10 = load i32, i32* %i, align 4, !dbg !215
  %idxprom11 = sext i32 %10 to i64, !dbg !216
  %arrayidx12 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom11, !dbg !216
  %11 = load i64, i64* %arrayidx12, align 8, !dbg !216
  %12 = load i32, i32* %i, align 4, !dbg !217
  %sub13 = sub nsw i32 %12, 1, !dbg !218
  %idxprom14 = sext i32 %sub13 to i64, !dbg !219
  %arrayidx15 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom14, !dbg !219
  %13 = load i64, i64* %arrayidx15, align 8, !dbg !219
  %cmp16 = icmp eq i64 %11, %13, !dbg !220
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !221

land.lhs.true:                                    ; preds = %lor.lhs.false10
  %14 = load i32, i32* %i, align 4, !dbg !222
  %idxprom17 = sext i32 %14 to i64, !dbg !223
  %arrayidx18 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom17, !dbg !223
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !223
  %16 = load i64, i64* %n.addr, align 8, !dbg !224
  %cmp19 = icmp ne i64 %15, %16, !dbg !225
  br i1 %cmp19, label %if.then, label %if.end, !dbg !226

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %for.body
  %arraydecay = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !227
  %17 = load i32, i32* %i, align 4, !dbg !229
  %add = add nsw i32 %17, 1, !dbg !230
  %18 = load i32, i32* %i, align 4, !dbg !231
  %idxprom20 = sext i32 %18 to i64, !dbg !232
  %arrayidx21 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom20, !dbg !232
  %19 = load i64, i64* %arrayidx21, align 8, !dbg !232
  %cmp22 = icmp eq i64 %19, 0, !dbg !233
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !234

cond.true:                                        ; preds = %if.then
  br label %cond.end49, !dbg !234

cond.false:                                       ; preds = %if.then
  %20 = load i32, i32* %i, align 4, !dbg !235
  %idxprom23 = sext i32 %20 to i64, !dbg !236
  %arrayidx24 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom23, !dbg !236
  %21 = load i64, i64* %arrayidx24, align 8, !dbg !236
  %22 = load i64, i64* %n.addr, align 8, !dbg !237
  %cmp25 = icmp eq i64 %21, %22, !dbg !238
  br i1 %cmp25, label %land.lhs.true26, label %cond.false29, !dbg !239

land.lhs.true26:                                  ; preds = %cond.false
  %23 = load i32, i32* %i, align 4, !dbg !240
  %cmp27 = icmp eq i32 %23, 1, !dbg !241
  br i1 %cmp27, label %cond.true28, label %cond.false29, !dbg !242

cond.true28:                                      ; preds = %land.lhs.true26
  br label %cond.end47, !dbg !242

cond.false29:                                     ; preds = %land.lhs.true26, %cond.false
  %24 = load i32, i32* %i, align 4, !dbg !243
  %idxprom30 = sext i32 %24 to i64, !dbg !244
  %arrayidx31 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom30, !dbg !244
  %25 = load i64, i64* %arrayidx31, align 8, !dbg !244
  %26 = load i64, i64* %n.addr, align 8, !dbg !245
  %cmp32 = icmp eq i64 %25, %26, !dbg !246
  br i1 %cmp32, label %land.lhs.true33, label %cond.false36, !dbg !247

land.lhs.true33:                                  ; preds = %cond.false29
  %27 = load i32, i32* %i, align 4, !dbg !248
  %cmp34 = icmp eq i32 %27, 2, !dbg !249
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !250

cond.true35:                                      ; preds = %land.lhs.true33
  br label %cond.end, !dbg !250

cond.false36:                                     ; preds = %land.lhs.true33, %cond.false29
  %28 = load i32, i32* %i, align 4, !dbg !251
  %idxprom37 = sext i32 %28 to i64, !dbg !252
  %arrayidx38 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom37, !dbg !252
  %29 = load i64, i64* %arrayidx38, align 8, !dbg !252
  %30 = load i32, i32* %i, align 4, !dbg !253
  %sub39 = sub nsw i32 %30, 1, !dbg !254
  %idxprom40 = sext i32 %sub39 to i64, !dbg !255
  %arrayidx41 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom40, !dbg !255
  %31 = load i64, i64* %arrayidx41, align 8, !dbg !255
  %cmp42 = icmp eq i64 %29, %31, !dbg !256
  br i1 %cmp42, label %land.rhs, label %land.end, !dbg !257

land.rhs:                                         ; preds = %cond.false36
  %32 = load i32, i32* %i, align 4, !dbg !258
  %idxprom43 = sext i32 %32 to i64, !dbg !259
  %arrayidx44 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom43, !dbg !259
  %33 = load i64, i64* %arrayidx44, align 8, !dbg !259
  %34 = load i64, i64* %n.addr, align 8, !dbg !260
  %cmp45 = icmp ne i64 %33, %34, !dbg !261
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false36
  %35 = phi i1 [ false, %cond.false36 ], [ %cmp45, %land.rhs ], !dbg !262
  %36 = zext i1 %35 to i64, !dbg !263
  %cond = select i1 %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), !dbg !263
  br label %cond.end, !dbg !250

cond.end:                                         ; preds = %land.end, %cond.true35
  %cond46 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), %cond.true35 ], [ %cond, %land.end ], !dbg !250
  br label %cond.end47, !dbg !242

cond.end47:                                       ; preds = %cond.end, %cond.true28
  %cond48 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), %cond.true28 ], [ %cond46, %cond.end ], !dbg !242
  br label %cond.end49, !dbg !234

cond.end49:                                       ; preds = %cond.end47, %cond.true
  %cond50 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond48, %cond.end47 ], !dbg !234
  call void @printSeries(i64* %arraydecay, i32 %add, i8* %cond50), !dbg !264
  br label %return, !dbg !265

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false10
  store i32 1, i32* %j, align 4, !dbg !266
  br label %for.cond51, !dbg !268

for.cond51:                                       ; preds = %for.inc, %if.end
  %37 = load i32, i32* %j, align 4, !dbg !269
  %38 = load i32, i32* %i, align 4, !dbg !271
  %cmp52 = icmp slt i32 %37, %38, !dbg !272
  br i1 %cmp52, label %for.body53, label %for.end, !dbg !273

for.body53:                                       ; preds = %for.cond51
  %39 = load i32, i32* %j, align 4, !dbg !274
  %idxprom54 = sext i32 %39 to i64, !dbg !277
  %arrayidx55 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom54, !dbg !277
  %40 = load i64, i64* %arrayidx55, align 8, !dbg !277
  %41 = load i32, i32* %i, align 4, !dbg !278
  %idxprom56 = sext i32 %41 to i64, !dbg !279
  %arrayidx57 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom56, !dbg !279
  %42 = load i64, i64* %arrayidx57, align 8, !dbg !279
  %cmp58 = icmp eq i64 %40, %42, !dbg !280
  br i1 %cmp58, label %if.then59, label %if.end62, !dbg !281

if.then59:                                        ; preds = %for.body53
  %arraydecay60 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !282
  %43 = load i32, i32* %i, align 4, !dbg !284
  %add61 = add nsw i32 %43, 1, !dbg !285
  call void @printSeries(i64* %arraydecay60, i32 %add61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)), !dbg !286
  br label %return, !dbg !287

if.end62:                                         ; preds = %for.body53
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %if.end62
  %44 = load i32, i32* %j, align 4, !dbg !289
  %inc = add nsw i32 %44, 1, !dbg !289
  store i32 %inc, i32* %j, align 4, !dbg !289
  br label %for.cond51, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond51
  br label %for.inc63, !dbg !293

for.inc63:                                        ; preds = %for.end
  %45 = load i32, i32* %i, align 4, !dbg !294
  %inc64 = add nsw i32 %45, 1, !dbg !294
  store i32 %inc64, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end65:                                        ; preds = %for.cond
  %arraydecay66 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !298
  %46 = load i32, i32* %i, align 4, !dbg !299
  %add67 = add nsw i32 %46, 1, !dbg !300
  call void @printSeries(i64* %arraydecay66, i32 %add67, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !301
  br label %return, !dbg !302

return:                                           ; preds = %for.end65, %if.then59, %cond.end49
  ret void, !dbg !302
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @processFile(i8* %fileName) #0 !dbg !303 {
entry:
  %fileName.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [21 x i8], align 16
  store i8* %fileName, i8** %fileName.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fileName.addr, metadata !306, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !308, metadata !DIExpression()), !dbg !368
  %0 = load i8*, i8** %fileName.addr, align 8, !dbg !369
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)), !dbg !370
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !368
  call void @llvm.dbg.declare(metadata [21 x i8]* %str, metadata !371, metadata !DIExpression()), !dbg !375
  br label %while.cond, !dbg !376

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !377
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !378
  %call1 = call i8* @fgets(i8* %arraydecay, i32 21, %struct._IO_FILE* %1), !dbg !379
  %cmp = icmp ne i8* %call1, null, !dbg !380
  br i1 %cmp, label %while.body, label %while.end, !dbg !376

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !381
  %call3 = call i64 @strtoull(i8* %arraydecay2, i8** null, i32 10) #5, !dbg !382
  call void @aliquotClassifier(i64 %call3), !dbg !383
  br label %while.cond, !dbg !376, !llvm.loop !384

while.end:                                        ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !386
  %call4 = call i32 @fclose(%struct._IO_FILE* %2), !dbg !387
  ret void, !dbg !388
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !389 {
entry:
  %retval = alloca i32, align 4
  %argC.addr = alloca i32, align 4
  %argV.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argC, i32* %argC.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argC.addr, metadata !392, metadata !DIExpression()), !dbg !393
  store i8** %argV, i8*** %argV.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argV.addr, metadata !394, metadata !DIExpression()), !dbg !395
  %0 = load i32, i32* %argC.addr, align 4, !dbg !396
  %cmp = icmp ne i32 %0, 2, !dbg !398
  br i1 %cmp, label %if.then, label %if.else, !dbg !399

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argV.addr, align 8, !dbg !400
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !400
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !400
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), i8* %2), !dbg !401
  br label %if.end9, !dbg !401

if.else:                                          ; preds = %entry
  %3 = load i8**, i8*** %argV.addr, align 8, !dbg !402
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !402
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !402
  %call2 = call i8* @strchr(i8* %4, i32 46) #6, !dbg !405
  %cmp3 = icmp ne i8* %call2, null, !dbg !406
  br i1 %cmp3, label %if.then4, label %if.else6, !dbg !407

if.then4:                                         ; preds = %if.else
  %5 = load i8**, i8*** %argV.addr, align 8, !dbg !408
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !408
  %6 = load i8*, i8** %arrayidx5, align 8, !dbg !408
  call void @processFile(i8* %6), !dbg !409
  br label %if.end, !dbg !409

if.else6:                                         ; preds = %if.else
  %7 = load i8**, i8*** %argV.addr, align 8, !dbg !410
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i64 1, !dbg !410
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !410
  %call8 = call i64 @strtoull(i8* %8, i8** null, i32 10) #5, !dbg !411
  call void @aliquotClassifier(i64 %call8), !dbg !412
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0, !dbg !413
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "aliquot-sequence-classifications-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Aliquot-sequence-classifications-2")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!69 = !DILocation(line: 23, column: 22, scope: !66)
!70 = !DILocation(line: 23, column: 28, scope: !66)
!71 = !DILocation(line: 23, column: 12, scope: !66)
!72 = !DILocation(line: 23, column: 33, scope: !66)
!73 = !DILocation(line: 23, column: 8, scope: !66)
!74 = !DILocation(line: 23, column: 3, scope: !66)
!75 = !DILocation(line: 25, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !42, file: !1, line: 25, column: 2)
!77 = !DILocation(line: 25, column: 6, scope: !76)
!78 = !DILocation(line: 25, column: 10, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 25, column: 2)
!80 = !DILocation(line: 25, column: 12, scope: !79)
!81 = !DILocation(line: 25, column: 11, scope: !79)
!82 = !DILocation(line: 25, column: 15, scope: !79)
!83 = !DILocation(line: 25, column: 13, scope: !79)
!84 = !DILocation(line: 25, column: 2, scope: !76)
!85 = !DILocation(line: 26, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !1, line: 25, column: 22)
!87 = !DILocation(line: 28, column: 3, scope: !86)
!88 = !DILocation(line: 28, column: 9, scope: !86)
!89 = !DILocation(line: 28, column: 11, scope: !86)
!90 = !DILocation(line: 28, column: 10, scope: !86)
!91 = !DILocation(line: 28, column: 13, scope: !86)
!92 = !DILocation(line: 29, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !1, line: 28, column: 18)
!94 = !DILocation(line: 30, column: 9, scope: !93)
!95 = !DILocation(line: 30, column: 6, scope: !93)
!96 = distinct !{!96, !87, !97}
!97 = !DILocation(line: 31, column: 3, scope: !86)
!98 = !DILocation(line: 33, column: 6, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !1, line: 33, column: 6)
!100 = !DILocation(line: 33, column: 11, scope: !99)
!101 = !DILocation(line: 33, column: 6, scope: !86)
!102 = !DILocation(line: 34, column: 13, scope: !99)
!103 = !DILocation(line: 34, column: 14, scope: !99)
!104 = !DILocation(line: 34, column: 9, scope: !99)
!105 = !DILocation(line: 34, column: 4, scope: !99)
!106 = !DILocation(line: 35, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !1, line: 35, column: 11)
!108 = !DILocation(line: 35, column: 17, scope: !107)
!109 = !DILocation(line: 35, column: 11, scope: !99)
!110 = !DILocation(line: 36, column: 22, scope: !107)
!111 = !DILocation(line: 36, column: 24, scope: !107)
!112 = !DILocation(line: 36, column: 30, scope: !107)
!113 = !DILocation(line: 36, column: 14, scope: !107)
!114 = !DILocation(line: 36, column: 35, scope: !107)
!115 = !DILocation(line: 36, column: 41, scope: !107)
!116 = !DILocation(line: 36, column: 42, scope: !107)
!117 = !DILocation(line: 36, column: 39, scope: !107)
!118 = !DILocation(line: 36, column: 9, scope: !107)
!119 = !DILocation(line: 36, column: 4, scope: !107)
!120 = !DILocation(line: 37, column: 2, scope: !86)
!121 = !DILocation(line: 25, column: 18, scope: !79)
!122 = !DILocation(line: 25, column: 2, scope: !79)
!123 = distinct !{!123, !84, !124}
!124 = !DILocation(line: 37, column: 2, scope: !76)
!125 = !DILocation(line: 39, column: 5, scope: !126)
!126 = distinct !DILexicalBlock(scope: !42, file: !1, line: 39, column: 5)
!127 = !DILocation(line: 39, column: 6, scope: !126)
!128 = !DILocation(line: 39, column: 5, scope: !42)
!129 = !DILocation(line: 40, column: 12, scope: !126)
!130 = !DILocation(line: 40, column: 13, scope: !126)
!131 = !DILocation(line: 40, column: 8, scope: !126)
!132 = !DILocation(line: 40, column: 3, scope: !126)
!133 = !DILocation(line: 42, column: 9, scope: !42)
!134 = !DILocation(line: 42, column: 16, scope: !42)
!135 = !DILocation(line: 42, column: 14, scope: !42)
!136 = !DILocation(line: 42, column: 2, scope: !42)
!137 = distinct !DISubprogram(name: "printSeries", scope: !1, file: !1, line: 45, type: !138, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !140, !141, !6}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!141 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!142 = !DILocalVariable(name: "arr", arg: 1, scope: !137, file: !1, line: 45, type: !140)
!143 = !DILocation(line: 45, column: 38, scope: !137)
!144 = !DILocalVariable(name: "size", arg: 2, scope: !137, file: !1, line: 45, type: !141)
!145 = !DILocation(line: 45, column: 46, scope: !137)
!146 = !DILocalVariable(name: "type", arg: 3, scope: !137, file: !1, line: 45, type: !6)
!147 = !DILocation(line: 45, column: 57, scope: !137)
!148 = !DILocalVariable(name: "i", scope: !137, file: !1, line: 46, type: !141)
!149 = !DILocation(line: 46, column: 6, scope: !137)
!150 = !DILocation(line: 48, column: 50, scope: !137)
!151 = !DILocation(line: 48, column: 57, scope: !137)
!152 = !DILocation(line: 48, column: 2, scope: !137)
!153 = !DILocation(line: 50, column: 7, scope: !154)
!154 = distinct !DILexicalBlock(scope: !137, file: !1, line: 50, column: 2)
!155 = !DILocation(line: 50, column: 6, scope: !154)
!156 = !DILocation(line: 50, column: 10, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 50, column: 2)
!158 = !DILocation(line: 50, column: 12, scope: !157)
!159 = !DILocation(line: 50, column: 16, scope: !157)
!160 = !DILocation(line: 50, column: 11, scope: !157)
!161 = !DILocation(line: 50, column: 2, scope: !154)
!162 = !DILocation(line: 51, column: 19, scope: !157)
!163 = !DILocation(line: 51, column: 23, scope: !157)
!164 = !DILocation(line: 51, column: 3, scope: !157)
!165 = !DILocation(line: 50, column: 20, scope: !157)
!166 = !DILocation(line: 50, column: 2, scope: !157)
!167 = distinct !{!167, !161, !168}
!168 = !DILocation(line: 51, column: 25, scope: !154)
!169 = !DILocation(line: 52, column: 16, scope: !137)
!170 = !DILocation(line: 52, column: 20, scope: !137)
!171 = !DILocation(line: 52, column: 2, scope: !137)
!172 = !DILocation(line: 53, column: 1, scope: !137)
!173 = distinct !DISubprogram(name: "aliquotClassifier", scope: !1, file: !1, line: 55, type: !174, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DISubroutineType(types: !175)
!175 = !{null, !15}
!176 = !DILocalVariable(name: "n", arg: 1, scope: !173, file: !1, line: 55, type: !15)
!177 = !DILocation(line: 55, column: 43, scope: !173)
!178 = !DILocalVariable(name: "arr", scope: !173, file: !1, line: 56, type: !179)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 16)
!182 = !DILocation(line: 56, column: 21, scope: !173)
!183 = !DILocalVariable(name: "i", scope: !173, file: !1, line: 57, type: !141)
!184 = !DILocation(line: 57, column: 6, scope: !173)
!185 = !DILocalVariable(name: "j", scope: !173, file: !1, line: 57, type: !141)
!186 = !DILocation(line: 57, column: 8, scope: !173)
!187 = !DILocation(line: 59, column: 11, scope: !173)
!188 = !DILocation(line: 59, column: 2, scope: !173)
!189 = !DILocation(line: 59, column: 9, scope: !173)
!190 = !DILocation(line: 61, column: 7, scope: !191)
!191 = distinct !DILexicalBlock(scope: !173, file: !1, line: 61, column: 2)
!192 = !DILocation(line: 61, column: 6, scope: !191)
!193 = !DILocation(line: 61, column: 10, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !1, line: 61, column: 2)
!195 = !DILocation(line: 61, column: 11, scope: !194)
!196 = !DILocation(line: 61, column: 2, scope: !191)
!197 = !DILocation(line: 62, column: 33, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !1, line: 61, column: 19)
!199 = !DILocation(line: 62, column: 34, scope: !198)
!200 = !DILocation(line: 62, column: 29, scope: !198)
!201 = !DILocation(line: 62, column: 12, scope: !198)
!202 = !DILocation(line: 62, column: 7, scope: !198)
!203 = !DILocation(line: 62, column: 3, scope: !198)
!204 = !DILocation(line: 62, column: 10, scope: !198)
!205 = !DILocation(line: 64, column: 10, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !1, line: 64, column: 6)
!207 = !DILocation(line: 64, column: 6, scope: !206)
!208 = !DILocation(line: 64, column: 12, scope: !206)
!209 = !DILocation(line: 64, column: 15, scope: !206)
!210 = !DILocation(line: 64, column: 21, scope: !206)
!211 = !DILocation(line: 64, column: 17, scope: !206)
!212 = !DILocation(line: 64, column: 25, scope: !206)
!213 = !DILocation(line: 64, column: 23, scope: !206)
!214 = !DILocation(line: 64, column: 26, scope: !206)
!215 = !DILocation(line: 64, column: 33, scope: !206)
!216 = !DILocation(line: 64, column: 29, scope: !206)
!217 = !DILocation(line: 64, column: 41, scope: !206)
!218 = !DILocation(line: 64, column: 42, scope: !206)
!219 = !DILocation(line: 64, column: 37, scope: !206)
!220 = !DILocation(line: 64, column: 35, scope: !206)
!221 = !DILocation(line: 64, column: 46, scope: !206)
!222 = !DILocation(line: 64, column: 53, scope: !206)
!223 = !DILocation(line: 64, column: 49, scope: !206)
!224 = !DILocation(line: 64, column: 57, scope: !206)
!225 = !DILocation(line: 64, column: 55, scope: !206)
!226 = !DILocation(line: 64, column: 6, scope: !198)
!227 = !DILocation(line: 65, column: 16, scope: !228)
!228 = distinct !DILexicalBlock(scope: !206, file: !1, line: 64, column: 60)
!229 = !DILocation(line: 65, column: 20, scope: !228)
!230 = !DILocation(line: 65, column: 21, scope: !228)
!231 = !DILocation(line: 65, column: 29, scope: !228)
!232 = !DILocation(line: 65, column: 25, scope: !228)
!233 = !DILocation(line: 65, column: 31, scope: !228)
!234 = !DILocation(line: 65, column: 24, scope: !228)
!235 = !DILocation(line: 65, column: 55, scope: !228)
!236 = !DILocation(line: 65, column: 51, scope: !228)
!237 = !DILocation(line: 65, column: 59, scope: !228)
!238 = !DILocation(line: 65, column: 57, scope: !228)
!239 = !DILocation(line: 65, column: 61, scope: !228)
!240 = !DILocation(line: 65, column: 64, scope: !228)
!241 = !DILocation(line: 65, column: 65, scope: !228)
!242 = !DILocation(line: 65, column: 50, scope: !228)
!243 = !DILocation(line: 65, column: 85, scope: !228)
!244 = !DILocation(line: 65, column: 81, scope: !228)
!245 = !DILocation(line: 65, column: 89, scope: !228)
!246 = !DILocation(line: 65, column: 87, scope: !228)
!247 = !DILocation(line: 65, column: 91, scope: !228)
!248 = !DILocation(line: 65, column: 94, scope: !228)
!249 = !DILocation(line: 65, column: 95, scope: !228)
!250 = !DILocation(line: 65, column: 80, scope: !228)
!251 = !DILocation(line: 65, column: 116, scope: !228)
!252 = !DILocation(line: 65, column: 112, scope: !228)
!253 = !DILocation(line: 65, column: 124, scope: !228)
!254 = !DILocation(line: 65, column: 125, scope: !228)
!255 = !DILocation(line: 65, column: 120, scope: !228)
!256 = !DILocation(line: 65, column: 118, scope: !228)
!257 = !DILocation(line: 65, column: 129, scope: !228)
!258 = !DILocation(line: 65, column: 136, scope: !228)
!259 = !DILocation(line: 65, column: 132, scope: !228)
!260 = !DILocation(line: 65, column: 140, scope: !228)
!261 = !DILocation(line: 65, column: 138, scope: !228)
!262 = !DILocation(line: 0, scope: !228)
!263 = !DILocation(line: 65, column: 111, scope: !228)
!264 = !DILocation(line: 65, column: 4, scope: !228)
!265 = !DILocation(line: 66, column: 4, scope: !228)
!266 = !DILocation(line: 69, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !198, file: !1, line: 69, column: 3)
!268 = !DILocation(line: 69, column: 7, scope: !267)
!269 = !DILocation(line: 69, column: 11, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !1, line: 69, column: 3)
!271 = !DILocation(line: 69, column: 13, scope: !270)
!272 = !DILocation(line: 69, column: 12, scope: !270)
!273 = !DILocation(line: 69, column: 3, scope: !267)
!274 = !DILocation(line: 70, column: 11, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !1, line: 70, column: 7)
!276 = distinct !DILexicalBlock(scope: !270, file: !1, line: 69, column: 19)
!277 = !DILocation(line: 70, column: 7, scope: !275)
!278 = !DILocation(line: 70, column: 19, scope: !275)
!279 = !DILocation(line: 70, column: 15, scope: !275)
!280 = !DILocation(line: 70, column: 13, scope: !275)
!281 = !DILocation(line: 70, column: 7, scope: !276)
!282 = !DILocation(line: 71, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !275, file: !1, line: 70, column: 22)
!284 = !DILocation(line: 71, column: 21, scope: !283)
!285 = !DILocation(line: 71, column: 22, scope: !283)
!286 = !DILocation(line: 71, column: 5, scope: !283)
!287 = !DILocation(line: 72, column: 5, scope: !283)
!288 = !DILocation(line: 74, column: 3, scope: !276)
!289 = !DILocation(line: 69, column: 16, scope: !270)
!290 = !DILocation(line: 69, column: 3, scope: !270)
!291 = distinct !{!291, !273, !292}
!292 = !DILocation(line: 74, column: 3, scope: !267)
!293 = !DILocation(line: 75, column: 2, scope: !198)
!294 = !DILocation(line: 61, column: 16, scope: !194)
!295 = !DILocation(line: 61, column: 2, scope: !194)
!296 = distinct !{!296, !196, !297}
!297 = !DILocation(line: 75, column: 2, scope: !191)
!298 = !DILocation(line: 77, column: 14, scope: !173)
!299 = !DILocation(line: 77, column: 18, scope: !173)
!300 = !DILocation(line: 77, column: 19, scope: !173)
!301 = !DILocation(line: 77, column: 2, scope: !173)
!302 = !DILocation(line: 78, column: 1, scope: !173)
!303 = distinct !DISubprogram(name: "processFile", scope: !1, file: !1, line: 80, type: !304, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!304 = !DISubroutineType(types: !305)
!305 = !{null, !6}
!306 = !DILocalVariable(name: "fileName", arg: 1, scope: !303, file: !1, line: 80, type: !6)
!307 = !DILocation(line: 80, column: 24, scope: !303)
!308 = !DILocalVariable(name: "fp", scope: !303, file: !1, line: 81, type: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !311, line: 7, baseType: !312)
!311 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !313, line: 49, size: 1728, elements: !314)
!313 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!314 = !{!315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !330, !332, !333, !334, !338, !340, !342, !346, !349, !351, !354, !357, !358, !359, !363, !364}
!315 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !312, file: !313, line: 51, baseType: !141, size: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !312, file: !313, line: 54, baseType: !6, size: 64, offset: 64)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !312, file: !313, line: 55, baseType: !6, size: 64, offset: 128)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !312, file: !313, line: 56, baseType: !6, size: 64, offset: 192)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !312, file: !313, line: 57, baseType: !6, size: 64, offset: 256)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !312, file: !313, line: 58, baseType: !6, size: 64, offset: 320)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !312, file: !313, line: 59, baseType: !6, size: 64, offset: 384)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !312, file: !313, line: 60, baseType: !6, size: 64, offset: 448)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !312, file: !313, line: 61, baseType: !6, size: 64, offset: 512)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !312, file: !313, line: 64, baseType: !6, size: 64, offset: 576)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !312, file: !313, line: 65, baseType: !6, size: 64, offset: 640)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !312, file: !313, line: 66, baseType: !6, size: 64, offset: 704)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !312, file: !313, line: 68, baseType: !328, size: 64, offset: 768)
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!329 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !313, line: 36, flags: DIFlagFwdDecl)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !312, file: !313, line: 70, baseType: !331, size: 64, offset: 832)
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !312, file: !313, line: 72, baseType: !141, size: 32, offset: 896)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !312, file: !313, line: 73, baseType: !141, size: 32, offset: 928)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !312, file: !313, line: 74, baseType: !335, size: 64, offset: 960)
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !336, line: 152, baseType: !337)
!336 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!337 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !312, file: !313, line: 77, baseType: !339, size: 16, offset: 1024)
!339 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !312, file: !313, line: 78, baseType: !341, size: 8, offset: 1040)
!341 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !312, file: !313, line: 79, baseType: !343, size: 8, offset: 1048)
!343 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8, elements: !344)
!344 = !{!345}
!345 = !DISubrange(count: 1)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !312, file: !313, line: 81, baseType: !347, size: 64, offset: 1088)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!348 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !313, line: 43, baseType: null)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !312, file: !313, line: 89, baseType: !350, size: 64, offset: 1152)
!350 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !336, line: 153, baseType: !337)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !312, file: !313, line: 91, baseType: !352, size: 64, offset: 1216)
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !353, size: 64)
!353 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !313, line: 37, flags: DIFlagFwdDecl)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !312, file: !313, line: 92, baseType: !355, size: 64, offset: 1280)
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 64)
!356 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !313, line: 38, flags: DIFlagFwdDecl)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !312, file: !313, line: 93, baseType: !331, size: 64, offset: 1344)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !312, file: !313, line: 94, baseType: !4, size: 64, offset: 1408)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !312, file: !313, line: 95, baseType: !360, size: 64, offset: 1472)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !361, line: 46, baseType: !362)
!361 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!362 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !312, file: !313, line: 96, baseType: !141, size: 32, offset: 1536)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !312, file: !313, line: 98, baseType: !365, size: 160, offset: 1568)
!365 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !366)
!366 = !{!367}
!367 = !DISubrange(count: 20)
!368 = !DILocation(line: 81, column: 8, scope: !303)
!369 = !DILocation(line: 81, column: 19, scope: !303)
!370 = !DILocation(line: 81, column: 13, scope: !303)
!371 = !DILocalVariable(name: "str", scope: !303, file: !1, line: 82, type: !372)
!372 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 168, elements: !373)
!373 = !{!374}
!374 = !DISubrange(count: 21)
!375 = !DILocation(line: 82, column: 7, scope: !303)
!376 = !DILocation(line: 84, column: 2, scope: !303)
!377 = !DILocation(line: 84, column: 14, scope: !303)
!378 = !DILocation(line: 84, column: 21, scope: !303)
!379 = !DILocation(line: 84, column: 8, scope: !303)
!380 = !DILocation(line: 84, column: 24, scope: !303)
!381 = !DILocation(line: 85, column: 30, scope: !303)
!382 = !DILocation(line: 85, column: 21, scope: !303)
!383 = !DILocation(line: 85, column: 3, scope: !303)
!384 = distinct !{!384, !376, !385}
!385 = !DILocation(line: 85, column: 50, scope: !303)
!386 = !DILocation(line: 87, column: 9, scope: !303)
!387 = !DILocation(line: 87, column: 2, scope: !303)
!388 = !DILocation(line: 88, column: 1, scope: !303)
!389 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 90, type: !390, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!390 = !DISubroutineType(types: !391)
!391 = !{!141, !141, !5}
!392 = !DILocalVariable(name: "argC", arg: 1, scope: !389, file: !1, line: 90, type: !141)
!393 = !DILocation(line: 90, column: 14, scope: !389)
!394 = !DILocalVariable(name: "argV", arg: 2, scope: !389, file: !1, line: 90, type: !5)
!395 = !DILocation(line: 90, column: 25, scope: !389)
!396 = !DILocation(line: 92, column: 8, scope: !397)
!397 = distinct !DILexicalBlock(scope: !389, file: !1, line: 92, column: 8)
!398 = !DILocation(line: 92, column: 12, scope: !397)
!399 = !DILocation(line: 92, column: 8, scope: !389)
!400 = !DILocation(line: 93, column: 42, scope: !397)
!401 = !DILocation(line: 93, column: 3, scope: !397)
!402 = !DILocation(line: 95, column: 13, scope: !403)
!403 = distinct !DILexicalBlock(scope: !404, file: !1, line: 95, column: 6)
!404 = distinct !DILexicalBlock(scope: !397, file: !1, line: 94, column: 6)
!405 = !DILocation(line: 95, column: 6, scope: !403)
!406 = !DILocation(line: 95, column: 25, scope: !403)
!407 = !DILocation(line: 95, column: 6, scope: !404)
!408 = !DILocation(line: 96, column: 16, scope: !403)
!409 = !DILocation(line: 96, column: 4, scope: !403)
!410 = !DILocation(line: 98, column: 31, scope: !403)
!411 = !DILocation(line: 98, column: 22, scope: !403)
!412 = !DILocation(line: 98, column: 4, scope: !403)
!413 = !DILocation(line: 100, column: 2, scope: !389)
