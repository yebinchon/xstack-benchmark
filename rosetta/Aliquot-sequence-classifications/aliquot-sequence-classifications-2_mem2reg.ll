; ModuleID = 'aliquot-sequence-classifications-2.ll'
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
  call void @llvm.dbg.value(metadata i64 %base, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %power, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 1, metadata !19, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 0, metadata !20, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %result.0 = phi i64 [ 1, %entry ], [ %mul, %for.inc ], !dbg !17
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ], !dbg !23
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !20, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %result.0, metadata !19, metadata !DIExpression()), !dbg !17
  %cmp = icmp ult i64 %i.0, %power, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %mul = mul i64 %result.0, %base, !dbg !27
  call void @llvm.dbg.value(metadata i64 %mul, metadata !19, metadata !DIExpression()), !dbg !17
  br label %for.inc, !dbg !29

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !30
  call void @llvm.dbg.value(metadata i64 %inc, metadata !20, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !31, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  ret i64 %result.0, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @properDivisorSum(i64 %n) #0 !dbg !35 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %n, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 0, metadata !42, metadata !DIExpression()), !dbg !39
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %while.body, %entry
  %count.0 = phi i64 [ 0, %entry ], [ %inc, %while.body ], !dbg !39
  %n.addr.0 = phi i64 [ %n, %entry ], [ %div, %while.body ]
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %count.0, metadata !42, metadata !DIExpression()), !dbg !39
  %rem = urem i64 %n.addr.0, 2, !dbg !44
  %cmp = icmp eq i64 %rem, 0, !dbg !45
  br i1 %cmp, label %while.body, label %while.end, !dbg !43

while.body:                                       ; preds = %while.cond
  %inc = add i64 %count.0, 1, !dbg !46
  call void @llvm.dbg.value(metadata i64 %inc, metadata !42, metadata !DIExpression()), !dbg !39
  %div = udiv i64 %n.addr.0, 2, !dbg !48
  call void @llvm.dbg.value(metadata i64 %div, metadata !38, metadata !DIExpression()), !dbg !39
  br label %while.cond, !dbg !43, !llvm.loop !49

while.end:                                        ; preds = %while.cond
  %cmp1 = icmp ne i64 %count.0, 0, !dbg !51
  br i1 %cmp1, label %if.then, label %if.end, !dbg !53, !cf.info !54

if.then:                                          ; preds = %while.end
  %add = add i64 %count.0, 1, !dbg !55
  %call = call i64 @raiseTo(i64 2, i64 %add), !dbg !56
  %sub = sub i64 %call, 1, !dbg !57
  %mul = mul i64 1, %sub, !dbg !58
  call void @llvm.dbg.value(metadata i64 %mul, metadata !40, metadata !DIExpression()), !dbg !39
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %while.end
  %prod.0 = phi i64 [ %mul, %if.then ], [ 1, %while.end ], !dbg !39
  call void @llvm.dbg.value(metadata i64 %prod.0, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 3, metadata !60, metadata !DIExpression()), !dbg !39
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i64 [ 3, %if.end ], [ %add25, %for.inc ], !dbg !63
  %prod.1 = phi i64 [ %prod.0, %if.end ], [ %prod.3, %for.inc ], !dbg !39
  %n.addr.1 = phi i64 [ %n.addr.0, %if.end ], [ %n.addr.2, %for.inc ]
  call void @llvm.dbg.value(metadata i64 %n.addr.1, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %prod.1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !60, metadata !DIExpression()), !dbg !39
  %mul2 = mul i64 %i.0, %i.0, !dbg !64
  %cmp3 = icmp ule i64 %mul2, %n.addr.1, !dbg !66
  br i1 %cmp3, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i64 0, metadata !42, metadata !DIExpression()), !dbg !39
  br label %while.cond4, !dbg !68

while.cond4:                                      ; preds = %while.body7, %for.body
  %count.1 = phi i64 [ 0, %for.body ], [ %inc8, %while.body7 ], !dbg !70
  %n.addr.2 = phi i64 [ %n.addr.1, %for.body ], [ %div9, %while.body7 ]
  call void @llvm.dbg.value(metadata i64 %n.addr.2, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %count.1, metadata !42, metadata !DIExpression()), !dbg !39
  %rem5 = urem i64 %n.addr.2, %i.0, !dbg !71
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !72
  br i1 %cmp6, label %while.body7, label %while.end10, !dbg !68

while.body7:                                      ; preds = %while.cond4
  %inc8 = add i64 %count.1, 1, !dbg !73
  call void @llvm.dbg.value(metadata i64 %inc8, metadata !42, metadata !DIExpression()), !dbg !39
  %div9 = udiv i64 %n.addr.2, %i.0, !dbg !75
  call void @llvm.dbg.value(metadata i64 %div9, metadata !38, metadata !DIExpression()), !dbg !39
  br label %while.cond4, !dbg !68, !llvm.loop !76

while.end10:                                      ; preds = %while.cond4
  %cmp11 = icmp eq i64 %count.1, 1, !dbg !78
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !80, !cf.info !54

if.then12:                                        ; preds = %while.end10
  %add13 = add i64 %i.0, 1, !dbg !81
  %mul14 = mul i64 %prod.1, %add13, !dbg !82
  call void @llvm.dbg.value(metadata i64 %mul14, metadata !40, metadata !DIExpression()), !dbg !39
  br label %if.end24, !dbg !83

if.else:                                          ; preds = %while.end10
  %cmp15 = icmp ugt i64 %count.1, 1, !dbg !84
  br i1 %cmp15, label %if.then16, label %if.end23, !dbg !86, !cf.info !54

if.then16:                                        ; preds = %if.else
  %add17 = add i64 %count.1, 1, !dbg !87
  %call18 = call i64 @raiseTo(i64 %i.0, i64 %add17), !dbg !88
  %sub19 = sub i64 %call18, 1, !dbg !89
  %sub20 = sub i64 %i.0, 1, !dbg !90
  %div21 = udiv i64 %sub19, %sub20, !dbg !91
  %mul22 = mul i64 %prod.1, %div21, !dbg !92
  call void @llvm.dbg.value(metadata i64 %mul22, metadata !40, metadata !DIExpression()), !dbg !39
  br label %if.end23, !dbg !93

if.end23:                                         ; preds = %if.then16, %if.else
  %prod.2 = phi i64 [ %mul22, %if.then16 ], [ %prod.1, %if.else ], !dbg !39
  call void @llvm.dbg.value(metadata i64 %prod.2, metadata !40, metadata !DIExpression()), !dbg !39
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then12
  %prod.3 = phi i64 [ %mul14, %if.then12 ], [ %prod.2, %if.end23 ], !dbg !94
  call void @llvm.dbg.value(metadata i64 %prod.3, metadata !40, metadata !DIExpression()), !dbg !39
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %if.end24
  %add25 = add i64 %i.0, 2, !dbg !96
  call void @llvm.dbg.value(metadata i64 %add25, metadata !60, metadata !DIExpression()), !dbg !39
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %cmp26 = icmp ugt i64 %n.addr.1, 2, !dbg !100
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !102, !cf.info !54

if.then27:                                        ; preds = %for.end
  %add28 = add i64 %n.addr.1, 1, !dbg !103
  %mul29 = mul i64 %prod.1, %add28, !dbg !104
  call void @llvm.dbg.value(metadata i64 %mul29, metadata !40, metadata !DIExpression()), !dbg !39
  br label %if.end30, !dbg !105

if.end30:                                         ; preds = %if.then27, %for.end
  %prod.4 = phi i64 [ %mul29, %if.then27 ], [ %prod.1, %for.end ], !dbg !39
  call void @llvm.dbg.value(metadata i64 %prod.4, metadata !40, metadata !DIExpression()), !dbg !39
  %sub31 = sub i64 %prod.4, %n, !dbg !106
  ret i64 %sub31, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printSeries(i64* %arr, i32 %size, i8* %type) #0 !dbg !108 {
entry:
  call void @llvm.dbg.value(metadata i64* %arr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i32 %size, metadata !115, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i8* %type, metadata !116, metadata !DIExpression()), !dbg !114
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 0, !dbg !117
  %0 = load i64, i64* %arrayidx, align 8, !dbg !117
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i64 %0, i8* %type), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !114
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !122
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !119, metadata !DIExpression()), !dbg !114
  %sub = sub nsw i32 %size, 1, !dbg !123
  %cmp = icmp slt i32 %i.0, %sub, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !127
  %arrayidx1 = getelementptr inbounds i64, i64* %arr, i64 %idxprom, !dbg !127
  %1 = load i64, i64* %arrayidx1, align 8, !dbg !127
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !128
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !129
  call void @llvm.dbg.value(metadata i32 %inc, metadata !119, metadata !DIExpression()), !dbg !114
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %idxprom3 = sext i32 %i.0 to i64, !dbg !133
  %arrayidx4 = getelementptr inbounds i64, i64* %arr, i64 %idxprom3, !dbg !133
  %2 = load i64, i64* %arrayidx4, align 8, !dbg !133
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %2), !dbg !134
  ret void, !dbg !135
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @aliquotClassifier(i64 %n) #0 !dbg !136 {
entry:
  %arr = alloca [16 x i64], align 16
  call void @llvm.dbg.value(metadata i64 %n, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [16 x i64]* %arr, metadata !141, metadata !DIExpression()), !dbg !145
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !146
  store i64 %n, i64* %arrayidx, align 16, !dbg !147
  call void @llvm.dbg.value(metadata i32 1, metadata !148, metadata !DIExpression()), !dbg !140
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc64, %for.inc63 ], !dbg !151
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !148, metadata !DIExpression()), !dbg !140
  %cmp = icmp slt i32 %i.0, 16, !dbg !152
  br i1 %cmp, label %for.body, label %for.end65, !dbg !154

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %i.0, 1, !dbg !155
  %idxprom = sext i32 %sub to i64, !dbg !157
  %arrayidx1 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom, !dbg !157
  %0 = load i64, i64* %arrayidx1, align 8, !dbg !157
  %call = call i64 @properDivisorSum(i64 %0), !dbg !158
  %idxprom2 = sext i32 %i.0 to i64, !dbg !159
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom2, !dbg !159
  store i64 %call, i64* %arrayidx3, align 8, !dbg !160
  %idxprom4 = sext i32 %i.0 to i64, !dbg !161
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom4, !dbg !161
  %1 = load i64, i64* %arrayidx5, align 8, !dbg !161
  %cmp6 = icmp eq i64 %1, 0, !dbg !163
  br i1 %cmp6, label %if.then, label %lor.lhs.false, !dbg !164, !cf.info !54

lor.lhs.false:                                    ; preds = %for.body
  %idxprom7 = sext i32 %i.0 to i64, !dbg !165
  %arrayidx8 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom7, !dbg !165
  %2 = load i64, i64* %arrayidx8, align 8, !dbg !165
  %cmp9 = icmp eq i64 %2, %n, !dbg !166
  br i1 %cmp9, label %if.then, label %lor.lhs.false10, !dbg !167, !cf.info !54

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %idxprom11 = sext i32 %i.0 to i64, !dbg !168
  %arrayidx12 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom11, !dbg !168
  %3 = load i64, i64* %arrayidx12, align 8, !dbg !168
  %sub13 = sub nsw i32 %i.0, 1, !dbg !169
  %idxprom14 = sext i32 %sub13 to i64, !dbg !170
  %arrayidx15 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom14, !dbg !170
  %4 = load i64, i64* %arrayidx15, align 8, !dbg !170
  %cmp16 = icmp eq i64 %3, %4, !dbg !171
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !172, !cf.info !54

land.lhs.true:                                    ; preds = %lor.lhs.false10
  %idxprom17 = sext i32 %i.0 to i64, !dbg !173
  %arrayidx18 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom17, !dbg !173
  %5 = load i64, i64* %arrayidx18, align 8, !dbg !173
  %cmp19 = icmp ne i64 %5, %n, !dbg !174
  br i1 %cmp19, label %if.then, label %if.end, !dbg !175, !cf.info !54

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %for.body
  %arraydecay = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !176
  %add = add nsw i32 %i.0, 1, !dbg !178
  %idxprom20 = sext i32 %i.0 to i64, !dbg !179
  %arrayidx21 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom20, !dbg !179
  %6 = load i64, i64* %arrayidx21, align 8, !dbg !179
  %cmp22 = icmp eq i64 %6, 0, !dbg !180
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !181

cond.true:                                        ; preds = %if.then
  br label %cond.end49, !dbg !181

cond.false:                                       ; preds = %if.then
  %idxprom23 = sext i32 %i.0 to i64, !dbg !182
  %arrayidx24 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom23, !dbg !182
  %7 = load i64, i64* %arrayidx24, align 8, !dbg !182
  %cmp25 = icmp eq i64 %7, %n, !dbg !183
  br i1 %cmp25, label %land.lhs.true26, label %cond.false29, !dbg !184

land.lhs.true26:                                  ; preds = %cond.false
  %cmp27 = icmp eq i32 %i.0, 1, !dbg !185
  br i1 %cmp27, label %cond.true28, label %cond.false29, !dbg !186

cond.true28:                                      ; preds = %land.lhs.true26
  br label %cond.end47, !dbg !186

cond.false29:                                     ; preds = %land.lhs.true26, %cond.false
  %idxprom30 = sext i32 %i.0 to i64, !dbg !187
  %arrayidx31 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom30, !dbg !187
  %8 = load i64, i64* %arrayidx31, align 8, !dbg !187
  %cmp32 = icmp eq i64 %8, %n, !dbg !188
  br i1 %cmp32, label %land.lhs.true33, label %cond.false36, !dbg !189

land.lhs.true33:                                  ; preds = %cond.false29
  %cmp34 = icmp eq i32 %i.0, 2, !dbg !190
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !191

cond.true35:                                      ; preds = %land.lhs.true33
  br label %cond.end, !dbg !191

cond.false36:                                     ; preds = %land.lhs.true33, %cond.false29
  %idxprom37 = sext i32 %i.0 to i64, !dbg !192
  %arrayidx38 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom37, !dbg !192
  %9 = load i64, i64* %arrayidx38, align 8, !dbg !192
  %sub39 = sub nsw i32 %i.0, 1, !dbg !193
  %idxprom40 = sext i32 %sub39 to i64, !dbg !194
  %arrayidx41 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom40, !dbg !194
  %10 = load i64, i64* %arrayidx41, align 8, !dbg !194
  %cmp42 = icmp eq i64 %9, %10, !dbg !195
  br i1 %cmp42, label %land.rhs, label %land.end, !dbg !196

land.rhs:                                         ; preds = %cond.false36
  %idxprom43 = sext i32 %i.0 to i64, !dbg !197
  %arrayidx44 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom43, !dbg !197
  %11 = load i64, i64* %arrayidx44, align 8, !dbg !197
  %cmp45 = icmp ne i64 %11, %n, !dbg !198
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false36
  %12 = phi i1 [ false, %cond.false36 ], [ %cmp45, %land.rhs ], !dbg !199
  %13 = zext i1 %12 to i64, !dbg !200
  %cond = select i1 %12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), !dbg !200
  br label %cond.end, !dbg !191

cond.end:                                         ; preds = %land.end, %cond.true35
  %cond46 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), %cond.true35 ], [ %cond, %land.end ], !dbg !191
  br label %cond.end47, !dbg !186

cond.end47:                                       ; preds = %cond.end, %cond.true28
  %cond48 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), %cond.true28 ], [ %cond46, %cond.end ], !dbg !186
  br label %cond.end49, !dbg !181

cond.end49:                                       ; preds = %cond.end47, %cond.true
  %cond50 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond48, %cond.end47 ], !dbg !181
  call void @printSeries(i64* %arraydecay, i32 %add, i8* %cond50), !dbg !201
  br label %return, !dbg !202

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false10
  call void @llvm.dbg.value(metadata i32 1, metadata !203, metadata !DIExpression()), !dbg !140
  br label %for.cond51, !dbg !204

for.cond51:                                       ; preds = %for.inc, %if.end
  %j.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ], !dbg !206
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !203, metadata !DIExpression()), !dbg !140
  %cmp52 = icmp slt i32 %j.0, %i.0, !dbg !207
  br i1 %cmp52, label %for.body53, label %for.end, !dbg !209

for.body53:                                       ; preds = %for.cond51
  %idxprom54 = sext i32 %j.0 to i64, !dbg !210
  %arrayidx55 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom54, !dbg !210
  %14 = load i64, i64* %arrayidx55, align 8, !dbg !210
  %idxprom56 = sext i32 %i.0 to i64, !dbg !213
  %arrayidx57 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom56, !dbg !213
  %15 = load i64, i64* %arrayidx57, align 8, !dbg !213
  %cmp58 = icmp eq i64 %14, %15, !dbg !214
  br i1 %cmp58, label %if.then59, label %if.end62, !dbg !215, !cf.info !54

if.then59:                                        ; preds = %for.body53
  %arraydecay60 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !216
  %add61 = add nsw i32 %i.0, 1, !dbg !218
  call void @printSeries(i64* %arraydecay60, i32 %add61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)), !dbg !219
  br label %return, !dbg !220

if.end62:                                         ; preds = %for.body53
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %if.end62
  %inc = add nsw i32 %j.0, 1, !dbg !222
  call void @llvm.dbg.value(metadata i32 %inc, metadata !203, metadata !DIExpression()), !dbg !140
  br label %for.cond51, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond51
  br label %for.inc63, !dbg !226

for.inc63:                                        ; preds = %for.end
  %inc64 = add nsw i32 %i.0, 1, !dbg !227
  call void @llvm.dbg.value(metadata i32 %inc64, metadata !148, metadata !DIExpression()), !dbg !140
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end65:                                        ; preds = %for.cond
  %arraydecay66 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !231
  %add67 = add nsw i32 %i.0, 1, !dbg !232
  call void @printSeries(i64* %arraydecay66, i32 %add67, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !233
  br label %return, !dbg !234

return:                                           ; preds = %for.end65, %if.then59, %cond.end49
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @processFile(i8* %fileName) #0 !dbg !235 {
entry:
  %str = alloca [21 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %fileName, metadata !238, metadata !DIExpression()), !dbg !239
  %call = call %struct._IO_FILE* @fopen(i8* %fileName, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)), !dbg !240
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !241, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata [21 x i8]* %str, metadata !301, metadata !DIExpression()), !dbg !305
  br label %while.cond, !dbg !306

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !307
  %call1 = call i8* @fgets(i8* %arraydecay, i32 21, %struct._IO_FILE* %call), !dbg !308
  %cmp = icmp ne i8* %call1, null, !dbg !309
  br i1 %cmp, label %while.body, label %while.end, !dbg !306

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !310
  %call3 = call i64 @strtoull(i8* %arraydecay2, i8** null, i32 10) #5, !dbg !311
  call void @aliquotClassifier(i64 %call3), !dbg !312
  br label %while.cond, !dbg !306, !llvm.loop !313

while.end:                                        ; preds = %while.cond
  %call4 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !315
  ret void, !dbg !316
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !317 {
entry:
  call void @llvm.dbg.value(metadata i32 %argC, metadata !320, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata i8** %argV, metadata !322, metadata !DIExpression()), !dbg !321
  %cmp = icmp ne i32 %argC, 2, !dbg !323
  br i1 %cmp, label %if.then, label %if.else, !dbg !325, !cf.info !54

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argV, i64 0, !dbg !326
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !326
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), i8* %0), !dbg !327
  br label %if.end9, !dbg !327

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !328
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !328
  %call2 = call i8* @strchr(i8* %1, i32 46) #6, !dbg !331
  %cmp3 = icmp ne i8* %call2, null, !dbg !332
  br i1 %cmp3, label %if.then4, label %if.else6, !dbg !333, !cf.info !54

if.then4:                                         ; preds = %if.else
  %arrayidx5 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !334
  %2 = load i8*, i8** %arrayidx5, align 8, !dbg !334
  call void @processFile(i8* %2), !dbg !335
  br label %if.end, !dbg !335

if.else6:                                         ; preds = %if.else
  %arrayidx7 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !336
  %3 = load i8*, i8** %arrayidx7, align 8, !dbg !336
  %call8 = call i64 @strtoull(i8* %3, i8** null, i32 10) #5, !dbg !337
  call void @aliquotClassifier(i64 %call8), !dbg !338
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0, !dbg !339
}

; Function Attrs: nounwind readonly
declare dso_local i8* @strchr(i8*, i32) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!17 = !DILocation(line: 0, scope: !12)
!18 = !DILocalVariable(name: "power", arg: 2, scope: !12, file: !1, line: 5, type: !15)
!19 = !DILocalVariable(name: "result", scope: !12, file: !1, line: 6, type: !15)
!20 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 6, type: !15)
!21 = !DILocation(line: 7, column: 10, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !1, line: 7, column: 5)
!23 = !DILocation(line: 0, scope: !22)
!24 = !DILocation(line: 7, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 7, column: 5)
!26 = !DILocation(line: 7, column: 5, scope: !22)
!27 = !DILocation(line: 8, column: 15, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 7, column: 28)
!29 = !DILocation(line: 9, column: 5, scope: !28)
!30 = !DILocation(line: 7, column: 24, scope: !25)
!31 = !DILocation(line: 7, column: 5, scope: !25)
!32 = distinct !{!32, !26, !33}
!33 = !DILocation(line: 9, column: 5, scope: !22)
!34 = !DILocation(line: 10, column: 5, scope: !12)
!35 = distinct !DISubprogram(name: "properDivisorSum", scope: !1, file: !1, line: 13, type: !36, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!15, !15}
!38 = !DILocalVariable(name: "n", arg: 1, scope: !35, file: !1, line: 13, type: !15)
!39 = !DILocation(line: 0, scope: !35)
!40 = !DILocalVariable(name: "prod", scope: !35, file: !1, line: 14, type: !15)
!41 = !DILocalVariable(name: "temp", scope: !35, file: !1, line: 15, type: !15)
!42 = !DILocalVariable(name: "count", scope: !35, file: !1, line: 15, type: !15)
!43 = !DILocation(line: 17, column: 2, scope: !35)
!44 = !DILocation(line: 17, column: 9, scope: !35)
!45 = !DILocation(line: 17, column: 12, scope: !35)
!46 = !DILocation(line: 18, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 17)
!48 = !DILocation(line: 19, column: 5, scope: !47)
!49 = distinct !{!49, !43, !50}
!50 = !DILocation(line: 20, column: 2, scope: !35)
!51 = !DILocation(line: 22, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !35, file: !1, line: 22, column: 5)
!53 = !DILocation(line: 22, column: 5, scope: !35)
!54 = !{!"if"}
!55 = !DILocation(line: 23, column: 28, scope: !52)
!56 = !DILocation(line: 23, column: 12, scope: !52)
!57 = !DILocation(line: 23, column: 33, scope: !52)
!58 = !DILocation(line: 23, column: 8, scope: !52)
!59 = !DILocation(line: 23, column: 3, scope: !52)
!60 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 15, type: !15)
!61 = !DILocation(line: 25, column: 6, scope: !62)
!62 = distinct !DILexicalBlock(scope: !35, file: !1, line: 25, column: 2)
!63 = !DILocation(line: 0, scope: !62)
!64 = !DILocation(line: 25, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 25, column: 2)
!66 = !DILocation(line: 25, column: 13, scope: !65)
!67 = !DILocation(line: 25, column: 2, scope: !62)
!68 = !DILocation(line: 28, column: 3, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 25, column: 22)
!70 = !DILocation(line: 0, scope: !69)
!71 = !DILocation(line: 28, column: 10, scope: !69)
!72 = !DILocation(line: 28, column: 13, scope: !69)
!73 = !DILocation(line: 29, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 28, column: 18)
!75 = !DILocation(line: 30, column: 6, scope: !74)
!76 = distinct !{!76, !68, !77}
!77 = !DILocation(line: 31, column: 3, scope: !69)
!78 = !DILocation(line: 33, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !69, file: !1, line: 33, column: 6)
!80 = !DILocation(line: 33, column: 6, scope: !69)
!81 = !DILocation(line: 34, column: 14, scope: !79)
!82 = !DILocation(line: 34, column: 9, scope: !79)
!83 = !DILocation(line: 34, column: 4, scope: !79)
!84 = !DILocation(line: 35, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !1, line: 35, column: 11)
!86 = !DILocation(line: 35, column: 11, scope: !79)
!87 = !DILocation(line: 36, column: 30, scope: !85)
!88 = !DILocation(line: 36, column: 14, scope: !85)
!89 = !DILocation(line: 36, column: 35, scope: !85)
!90 = !DILocation(line: 36, column: 42, scope: !85)
!91 = !DILocation(line: 36, column: 39, scope: !85)
!92 = !DILocation(line: 36, column: 9, scope: !85)
!93 = !DILocation(line: 36, column: 4, scope: !85)
!94 = !DILocation(line: 0, scope: !79)
!95 = !DILocation(line: 37, column: 2, scope: !69)
!96 = !DILocation(line: 25, column: 18, scope: !65)
!97 = !DILocation(line: 25, column: 2, scope: !65)
!98 = distinct !{!98, !67, !99}
!99 = !DILocation(line: 37, column: 2, scope: !62)
!100 = !DILocation(line: 39, column: 6, scope: !101)
!101 = distinct !DILexicalBlock(scope: !35, file: !1, line: 39, column: 5)
!102 = !DILocation(line: 39, column: 5, scope: !35)
!103 = !DILocation(line: 40, column: 13, scope: !101)
!104 = !DILocation(line: 40, column: 8, scope: !101)
!105 = !DILocation(line: 40, column: 3, scope: !101)
!106 = !DILocation(line: 42, column: 14, scope: !35)
!107 = !DILocation(line: 42, column: 2, scope: !35)
!108 = distinct !DISubprogram(name: "printSeries", scope: !1, file: !1, line: 45, type: !109, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DISubroutineType(types: !110)
!110 = !{null, !111, !112, !6}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!112 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!113 = !DILocalVariable(name: "arr", arg: 1, scope: !108, file: !1, line: 45, type: !111)
!114 = !DILocation(line: 0, scope: !108)
!115 = !DILocalVariable(name: "size", arg: 2, scope: !108, file: !1, line: 45, type: !112)
!116 = !DILocalVariable(name: "type", arg: 3, scope: !108, file: !1, line: 45, type: !6)
!117 = !DILocation(line: 48, column: 50, scope: !108)
!118 = !DILocation(line: 48, column: 2, scope: !108)
!119 = !DILocalVariable(name: "i", scope: !108, file: !1, line: 46, type: !112)
!120 = !DILocation(line: 50, column: 6, scope: !121)
!121 = distinct !DILexicalBlock(scope: !108, file: !1, line: 50, column: 2)
!122 = !DILocation(line: 0, scope: !121)
!123 = !DILocation(line: 50, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 50, column: 2)
!125 = !DILocation(line: 50, column: 11, scope: !124)
!126 = !DILocation(line: 50, column: 2, scope: !121)
!127 = !DILocation(line: 51, column: 19, scope: !124)
!128 = !DILocation(line: 51, column: 3, scope: !124)
!129 = !DILocation(line: 50, column: 20, scope: !124)
!130 = !DILocation(line: 50, column: 2, scope: !124)
!131 = distinct !{!131, !126, !132}
!132 = !DILocation(line: 51, column: 25, scope: !121)
!133 = !DILocation(line: 52, column: 16, scope: !108)
!134 = !DILocation(line: 52, column: 2, scope: !108)
!135 = !DILocation(line: 53, column: 1, scope: !108)
!136 = distinct !DISubprogram(name: "aliquotClassifier", scope: !1, file: !1, line: 55, type: !137, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{null, !15}
!139 = !DILocalVariable(name: "n", arg: 1, scope: !136, file: !1, line: 55, type: !15)
!140 = !DILocation(line: 0, scope: !136)
!141 = !DILocalVariable(name: "arr", scope: !136, file: !1, line: 56, type: !142)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 16)
!145 = !DILocation(line: 56, column: 21, scope: !136)
!146 = !DILocation(line: 59, column: 2, scope: !136)
!147 = !DILocation(line: 59, column: 9, scope: !136)
!148 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 57, type: !112)
!149 = !DILocation(line: 61, column: 6, scope: !150)
!150 = distinct !DILexicalBlock(scope: !136, file: !1, line: 61, column: 2)
!151 = !DILocation(line: 0, scope: !150)
!152 = !DILocation(line: 61, column: 11, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !1, line: 61, column: 2)
!154 = !DILocation(line: 61, column: 2, scope: !150)
!155 = !DILocation(line: 62, column: 34, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !1, line: 61, column: 19)
!157 = !DILocation(line: 62, column: 29, scope: !156)
!158 = !DILocation(line: 62, column: 12, scope: !156)
!159 = !DILocation(line: 62, column: 3, scope: !156)
!160 = !DILocation(line: 62, column: 10, scope: !156)
!161 = !DILocation(line: 64, column: 6, scope: !162)
!162 = distinct !DILexicalBlock(scope: !156, file: !1, line: 64, column: 6)
!163 = !DILocation(line: 64, column: 12, scope: !162)
!164 = !DILocation(line: 64, column: 15, scope: !162)
!165 = !DILocation(line: 64, column: 17, scope: !162)
!166 = !DILocation(line: 64, column: 23, scope: !162)
!167 = !DILocation(line: 64, column: 26, scope: !162)
!168 = !DILocation(line: 64, column: 29, scope: !162)
!169 = !DILocation(line: 64, column: 42, scope: !162)
!170 = !DILocation(line: 64, column: 37, scope: !162)
!171 = !DILocation(line: 64, column: 35, scope: !162)
!172 = !DILocation(line: 64, column: 46, scope: !162)
!173 = !DILocation(line: 64, column: 49, scope: !162)
!174 = !DILocation(line: 64, column: 55, scope: !162)
!175 = !DILocation(line: 64, column: 6, scope: !156)
!176 = !DILocation(line: 65, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !162, file: !1, line: 64, column: 60)
!178 = !DILocation(line: 65, column: 21, scope: !177)
!179 = !DILocation(line: 65, column: 25, scope: !177)
!180 = !DILocation(line: 65, column: 31, scope: !177)
!181 = !DILocation(line: 65, column: 24, scope: !177)
!182 = !DILocation(line: 65, column: 51, scope: !177)
!183 = !DILocation(line: 65, column: 57, scope: !177)
!184 = !DILocation(line: 65, column: 61, scope: !177)
!185 = !DILocation(line: 65, column: 65, scope: !177)
!186 = !DILocation(line: 65, column: 50, scope: !177)
!187 = !DILocation(line: 65, column: 81, scope: !177)
!188 = !DILocation(line: 65, column: 87, scope: !177)
!189 = !DILocation(line: 65, column: 91, scope: !177)
!190 = !DILocation(line: 65, column: 95, scope: !177)
!191 = !DILocation(line: 65, column: 80, scope: !177)
!192 = !DILocation(line: 65, column: 112, scope: !177)
!193 = !DILocation(line: 65, column: 125, scope: !177)
!194 = !DILocation(line: 65, column: 120, scope: !177)
!195 = !DILocation(line: 65, column: 118, scope: !177)
!196 = !DILocation(line: 65, column: 129, scope: !177)
!197 = !DILocation(line: 65, column: 132, scope: !177)
!198 = !DILocation(line: 65, column: 138, scope: !177)
!199 = !DILocation(line: 0, scope: !177)
!200 = !DILocation(line: 65, column: 111, scope: !177)
!201 = !DILocation(line: 65, column: 4, scope: !177)
!202 = !DILocation(line: 66, column: 4, scope: !177)
!203 = !DILocalVariable(name: "j", scope: !136, file: !1, line: 57, type: !112)
!204 = !DILocation(line: 69, column: 7, scope: !205)
!205 = distinct !DILexicalBlock(scope: !156, file: !1, line: 69, column: 3)
!206 = !DILocation(line: 0, scope: !205)
!207 = !DILocation(line: 69, column: 12, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !1, line: 69, column: 3)
!209 = !DILocation(line: 69, column: 3, scope: !205)
!210 = !DILocation(line: 70, column: 7, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !1, line: 70, column: 7)
!212 = distinct !DILexicalBlock(scope: !208, file: !1, line: 69, column: 19)
!213 = !DILocation(line: 70, column: 15, scope: !211)
!214 = !DILocation(line: 70, column: 13, scope: !211)
!215 = !DILocation(line: 70, column: 7, scope: !212)
!216 = !DILocation(line: 71, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !1, line: 70, column: 22)
!218 = !DILocation(line: 71, column: 22, scope: !217)
!219 = !DILocation(line: 71, column: 5, scope: !217)
!220 = !DILocation(line: 72, column: 5, scope: !217)
!221 = !DILocation(line: 74, column: 3, scope: !212)
!222 = !DILocation(line: 69, column: 16, scope: !208)
!223 = !DILocation(line: 69, column: 3, scope: !208)
!224 = distinct !{!224, !209, !225}
!225 = !DILocation(line: 74, column: 3, scope: !205)
!226 = !DILocation(line: 75, column: 2, scope: !156)
!227 = !DILocation(line: 61, column: 16, scope: !153)
!228 = !DILocation(line: 61, column: 2, scope: !153)
!229 = distinct !{!229, !154, !230}
!230 = !DILocation(line: 75, column: 2, scope: !150)
!231 = !DILocation(line: 77, column: 14, scope: !136)
!232 = !DILocation(line: 77, column: 19, scope: !136)
!233 = !DILocation(line: 77, column: 2, scope: !136)
!234 = !DILocation(line: 78, column: 1, scope: !136)
!235 = distinct !DISubprogram(name: "processFile", scope: !1, file: !1, line: 80, type: !236, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!236 = !DISubroutineType(types: !237)
!237 = !{null, !6}
!238 = !DILocalVariable(name: "fileName", arg: 1, scope: !235, file: !1, line: 80, type: !6)
!239 = !DILocation(line: 0, scope: !235)
!240 = !DILocation(line: 81, column: 13, scope: !235)
!241 = !DILocalVariable(name: "fp", scope: !235, file: !1, line: 81, type: !242)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !244, line: 7, baseType: !245)
!244 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!245 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !246, line: 49, size: 1728, elements: !247)
!246 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!247 = !{!248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !263, !265, !266, !267, !271, !273, !275, !279, !282, !284, !287, !290, !291, !292, !296, !297}
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !245, file: !246, line: 51, baseType: !112, size: 32)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !245, file: !246, line: 54, baseType: !6, size: 64, offset: 64)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !245, file: !246, line: 55, baseType: !6, size: 64, offset: 128)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !245, file: !246, line: 56, baseType: !6, size: 64, offset: 192)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !245, file: !246, line: 57, baseType: !6, size: 64, offset: 256)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !245, file: !246, line: 58, baseType: !6, size: 64, offset: 320)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !245, file: !246, line: 59, baseType: !6, size: 64, offset: 384)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !245, file: !246, line: 60, baseType: !6, size: 64, offset: 448)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !245, file: !246, line: 61, baseType: !6, size: 64, offset: 512)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !245, file: !246, line: 64, baseType: !6, size: 64, offset: 576)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !245, file: !246, line: 65, baseType: !6, size: 64, offset: 640)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !245, file: !246, line: 66, baseType: !6, size: 64, offset: 704)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !245, file: !246, line: 68, baseType: !261, size: 64, offset: 768)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!262 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !246, line: 36, flags: DIFlagFwdDecl)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !245, file: !246, line: 70, baseType: !264, size: 64, offset: 832)
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !245, file: !246, line: 72, baseType: !112, size: 32, offset: 896)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !245, file: !246, line: 73, baseType: !112, size: 32, offset: 928)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !245, file: !246, line: 74, baseType: !268, size: 64, offset: 960)
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !269, line: 152, baseType: !270)
!269 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!270 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !245, file: !246, line: 77, baseType: !272, size: 16, offset: 1024)
!272 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !245, file: !246, line: 78, baseType: !274, size: 8, offset: 1040)
!274 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !245, file: !246, line: 79, baseType: !276, size: 8, offset: 1048)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8, elements: !277)
!277 = !{!278}
!278 = !DISubrange(count: 1)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !245, file: !246, line: 81, baseType: !280, size: 64, offset: 1088)
!280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !246, line: 43, baseType: null)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !245, file: !246, line: 89, baseType: !283, size: 64, offset: 1152)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !269, line: 153, baseType: !270)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !245, file: !246, line: 91, baseType: !285, size: 64, offset: 1216)
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!286 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !246, line: 37, flags: DIFlagFwdDecl)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !245, file: !246, line: 92, baseType: !288, size: 64, offset: 1280)
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!289 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !246, line: 38, flags: DIFlagFwdDecl)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !245, file: !246, line: 93, baseType: !264, size: 64, offset: 1344)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !245, file: !246, line: 94, baseType: !4, size: 64, offset: 1408)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !245, file: !246, line: 95, baseType: !293, size: 64, offset: 1472)
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !294, line: 46, baseType: !295)
!294 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!295 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !245, file: !246, line: 96, baseType: !112, size: 32, offset: 1536)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !245, file: !246, line: 98, baseType: !298, size: 160, offset: 1568)
!298 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !299)
!299 = !{!300}
!300 = !DISubrange(count: 20)
!301 = !DILocalVariable(name: "str", scope: !235, file: !1, line: 82, type: !302)
!302 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 168, elements: !303)
!303 = !{!304}
!304 = !DISubrange(count: 21)
!305 = !DILocation(line: 82, column: 7, scope: !235)
!306 = !DILocation(line: 84, column: 2, scope: !235)
!307 = !DILocation(line: 84, column: 14, scope: !235)
!308 = !DILocation(line: 84, column: 8, scope: !235)
!309 = !DILocation(line: 84, column: 24, scope: !235)
!310 = !DILocation(line: 85, column: 30, scope: !235)
!311 = !DILocation(line: 85, column: 21, scope: !235)
!312 = !DILocation(line: 85, column: 3, scope: !235)
!313 = distinct !{!313, !306, !314}
!314 = !DILocation(line: 85, column: 50, scope: !235)
!315 = !DILocation(line: 87, column: 2, scope: !235)
!316 = !DILocation(line: 88, column: 1, scope: !235)
!317 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 90, type: !318, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!318 = !DISubroutineType(types: !319)
!319 = !{!112, !112, !5}
!320 = !DILocalVariable(name: "argC", arg: 1, scope: !317, file: !1, line: 90, type: !112)
!321 = !DILocation(line: 0, scope: !317)
!322 = !DILocalVariable(name: "argV", arg: 2, scope: !317, file: !1, line: 90, type: !5)
!323 = !DILocation(line: 92, column: 12, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !1, line: 92, column: 8)
!325 = !DILocation(line: 92, column: 8, scope: !317)
!326 = !DILocation(line: 93, column: 42, scope: !324)
!327 = !DILocation(line: 93, column: 3, scope: !324)
!328 = !DILocation(line: 95, column: 13, scope: !329)
!329 = distinct !DILexicalBlock(scope: !330, file: !1, line: 95, column: 6)
!330 = distinct !DILexicalBlock(scope: !324, file: !1, line: 94, column: 6)
!331 = !DILocation(line: 95, column: 6, scope: !329)
!332 = !DILocation(line: 95, column: 25, scope: !329)
!333 = !DILocation(line: 95, column: 6, scope: !330)
!334 = !DILocation(line: 96, column: 16, scope: !329)
!335 = !DILocation(line: 96, column: 4, scope: !329)
!336 = !DILocation(line: 98, column: 31, scope: !329)
!337 = !DILocation(line: 98, column: 22, scope: !329)
!338 = !DILocation(line: 98, column: 4, scope: !329)
!339 = !DILocation(line: 100, column: 2, scope: !317)
