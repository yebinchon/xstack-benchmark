; ModuleID = 'aliquot-sequence-classifications-1.bc'
source_filename = "aliquot-sequence-classifications-1.c"
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
define dso_local i64 @bruteForceProperDivisorSum(i64 %n) #0 !dbg !12 {
entry:
  %n.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %sum = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i64* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !20, metadata !DIExpression()), !dbg !21
  store i64 0, i64* %sum, align 8, !dbg !21
  store i64 1, i64* %i, align 8, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !25
  %1 = load i64, i64* %n.addr, align 8, !dbg !27
  %add = add i64 %1, 1, !dbg !28
  %div = udiv i64 %add, 2, !dbg !29
  %cmp = icmp ult i64 %0, %div, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %n.addr, align 8, !dbg !32
  %3 = load i64, i64* %i, align 8, !dbg !34
  %rem = urem i64 %2, %3, !dbg !35
  %cmp1 = icmp eq i64 %rem, 0, !dbg !36
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !37

land.lhs.true:                                    ; preds = %for.body
  %4 = load i64, i64* %n.addr, align 8, !dbg !38
  %5 = load i64, i64* %i, align 8, !dbg !39
  %cmp2 = icmp ne i64 %4, %5, !dbg !40
  br i1 %cmp2, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %land.lhs.true
  %6 = load i64, i64* %i, align 8, !dbg !42
  %7 = load i64, i64* %sum, align 8, !dbg !43
  %add3 = add i64 %7, %6, !dbg !43
  store i64 %add3, i64* %sum, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %if.end
  %8 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %8, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %9 = load i64, i64* %sum, align 8, !dbg !49
  ret i64 %9, !dbg !50
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printSeries(i64* %arr, i32 %size, i8* %type) #0 !dbg !51 {
entry:
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i32, align 4
  %type.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64* %arr, i64** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %arr.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8* %type, i8** %type.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %type.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %i, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i64*, i64** %arr.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !64
  %1 = load i64, i64* %arrayidx, align 8, !dbg !64
  %2 = load i8*, i8** %type.addr, align 8, !dbg !65
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i64 %1, i8* %2), !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !70
  %4 = load i32, i32* %size.addr, align 4, !dbg !72
  %sub = sub nsw i32 %4, 1, !dbg !73
  %cmp = icmp slt i32 %3, %sub, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %arr.addr, align 8, !dbg !76
  %6 = load i32, i32* %i, align 4, !dbg !77
  %idxprom = sext i32 %6 to i64, !dbg !76
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %idxprom, !dbg !76
  %7 = load i64, i64* %arrayidx1, align 8, !dbg !76
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 %7), !dbg !78
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !79
  %inc = add nsw i32 %8, 1, !dbg !79
  store i32 %inc, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %arr.addr, align 8, !dbg !83
  %10 = load i32, i32* %i, align 4, !dbg !84
  %idxprom3 = sext i32 %10 to i64, !dbg !83
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 %idxprom3, !dbg !83
  %11 = load i64, i64* %arrayidx4, align 8, !dbg !83
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %11), !dbg !85
  ret void, !dbg !86
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @aliquotClassifier(i64 %n) #0 !dbg !87 {
entry:
  %n.addr = alloca i64, align 8
  %arr = alloca [16 x i64], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [16 x i64]* %arr, metadata !92, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32* %i, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %j, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i64, i64* %n.addr, align 8, !dbg !101
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !102
  store i64 %0, i64* %arrayidx, align 16, !dbg !103
  store i32 1, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc63, %entry
  %1 = load i32, i32* %i, align 4, !dbg !107
  %cmp = icmp slt i32 %1, 16, !dbg !109
  br i1 %cmp, label %for.body, label %for.end65, !dbg !110

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !111
  %sub = sub nsw i32 %2, 1, !dbg !113
  %idxprom = sext i32 %sub to i64, !dbg !114
  %arrayidx1 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom, !dbg !114
  %3 = load i64, i64* %arrayidx1, align 8, !dbg !114
  %call = call i64 @bruteForceProperDivisorSum(i64 %3), !dbg !115
  %4 = load i32, i32* %i, align 4, !dbg !116
  %idxprom2 = sext i32 %4 to i64, !dbg !117
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom2, !dbg !117
  store i64 %call, i64* %arrayidx3, align 8, !dbg !118
  %5 = load i32, i32* %i, align 4, !dbg !119
  %idxprom4 = sext i32 %5 to i64, !dbg !121
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom4, !dbg !121
  %6 = load i64, i64* %arrayidx5, align 8, !dbg !121
  %cmp6 = icmp eq i64 %6, 0, !dbg !122
  br i1 %cmp6, label %if.then, label %lor.lhs.false, !dbg !123

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !124
  %idxprom7 = sext i32 %7 to i64, !dbg !125
  %arrayidx8 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom7, !dbg !125
  %8 = load i64, i64* %arrayidx8, align 8, !dbg !125
  %9 = load i64, i64* %n.addr, align 8, !dbg !126
  %cmp9 = icmp eq i64 %8, %9, !dbg !127
  br i1 %cmp9, label %if.then, label %lor.lhs.false10, !dbg !128

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %10 = load i32, i32* %i, align 4, !dbg !129
  %idxprom11 = sext i32 %10 to i64, !dbg !130
  %arrayidx12 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom11, !dbg !130
  %11 = load i64, i64* %arrayidx12, align 8, !dbg !130
  %12 = load i32, i32* %i, align 4, !dbg !131
  %sub13 = sub nsw i32 %12, 1, !dbg !132
  %idxprom14 = sext i32 %sub13 to i64, !dbg !133
  %arrayidx15 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom14, !dbg !133
  %13 = load i64, i64* %arrayidx15, align 8, !dbg !133
  %cmp16 = icmp eq i64 %11, %13, !dbg !134
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !135

land.lhs.true:                                    ; preds = %lor.lhs.false10
  %14 = load i32, i32* %i, align 4, !dbg !136
  %idxprom17 = sext i32 %14 to i64, !dbg !137
  %arrayidx18 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom17, !dbg !137
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !137
  %16 = load i64, i64* %n.addr, align 8, !dbg !138
  %cmp19 = icmp ne i64 %15, %16, !dbg !139
  br i1 %cmp19, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %for.body
  %arraydecay = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !141
  %17 = load i32, i32* %i, align 4, !dbg !143
  %add = add nsw i32 %17, 1, !dbg !144
  %18 = load i32, i32* %i, align 4, !dbg !145
  %idxprom20 = sext i32 %18 to i64, !dbg !146
  %arrayidx21 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom20, !dbg !146
  %19 = load i64, i64* %arrayidx21, align 8, !dbg !146
  %cmp22 = icmp eq i64 %19, 0, !dbg !147
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !148

cond.true:                                        ; preds = %if.then
  br label %cond.end49, !dbg !148

cond.false:                                       ; preds = %if.then
  %20 = load i32, i32* %i, align 4, !dbg !149
  %idxprom23 = sext i32 %20 to i64, !dbg !150
  %arrayidx24 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom23, !dbg !150
  %21 = load i64, i64* %arrayidx24, align 8, !dbg !150
  %22 = load i64, i64* %n.addr, align 8, !dbg !151
  %cmp25 = icmp eq i64 %21, %22, !dbg !152
  br i1 %cmp25, label %land.lhs.true26, label %cond.false29, !dbg !153

land.lhs.true26:                                  ; preds = %cond.false
  %23 = load i32, i32* %i, align 4, !dbg !154
  %cmp27 = icmp eq i32 %23, 1, !dbg !155
  br i1 %cmp27, label %cond.true28, label %cond.false29, !dbg !156

cond.true28:                                      ; preds = %land.lhs.true26
  br label %cond.end47, !dbg !156

cond.false29:                                     ; preds = %land.lhs.true26, %cond.false
  %24 = load i32, i32* %i, align 4, !dbg !157
  %idxprom30 = sext i32 %24 to i64, !dbg !158
  %arrayidx31 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom30, !dbg !158
  %25 = load i64, i64* %arrayidx31, align 8, !dbg !158
  %26 = load i64, i64* %n.addr, align 8, !dbg !159
  %cmp32 = icmp eq i64 %25, %26, !dbg !160
  br i1 %cmp32, label %land.lhs.true33, label %cond.false36, !dbg !161

land.lhs.true33:                                  ; preds = %cond.false29
  %27 = load i32, i32* %i, align 4, !dbg !162
  %cmp34 = icmp eq i32 %27, 2, !dbg !163
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !164

cond.true35:                                      ; preds = %land.lhs.true33
  br label %cond.end, !dbg !164

cond.false36:                                     ; preds = %land.lhs.true33, %cond.false29
  %28 = load i32, i32* %i, align 4, !dbg !165
  %idxprom37 = sext i32 %28 to i64, !dbg !166
  %arrayidx38 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom37, !dbg !166
  %29 = load i64, i64* %arrayidx38, align 8, !dbg !166
  %30 = load i32, i32* %i, align 4, !dbg !167
  %sub39 = sub nsw i32 %30, 1, !dbg !168
  %idxprom40 = sext i32 %sub39 to i64, !dbg !169
  %arrayidx41 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom40, !dbg !169
  %31 = load i64, i64* %arrayidx41, align 8, !dbg !169
  %cmp42 = icmp eq i64 %29, %31, !dbg !170
  br i1 %cmp42, label %land.rhs, label %land.end, !dbg !171

land.rhs:                                         ; preds = %cond.false36
  %32 = load i32, i32* %i, align 4, !dbg !172
  %idxprom43 = sext i32 %32 to i64, !dbg !173
  %arrayidx44 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom43, !dbg !173
  %33 = load i64, i64* %arrayidx44, align 8, !dbg !173
  %34 = load i64, i64* %n.addr, align 8, !dbg !174
  %cmp45 = icmp ne i64 %33, %34, !dbg !175
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false36
  %35 = phi i1 [ false, %cond.false36 ], [ %cmp45, %land.rhs ], !dbg !176
  %36 = zext i1 %35 to i64, !dbg !177
  %cond = select i1 %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), !dbg !177
  br label %cond.end, !dbg !164

cond.end:                                         ; preds = %land.end, %cond.true35
  %cond46 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), %cond.true35 ], [ %cond, %land.end ], !dbg !164
  br label %cond.end47, !dbg !156

cond.end47:                                       ; preds = %cond.end, %cond.true28
  %cond48 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), %cond.true28 ], [ %cond46, %cond.end ], !dbg !156
  br label %cond.end49, !dbg !148

cond.end49:                                       ; preds = %cond.end47, %cond.true
  %cond50 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond48, %cond.end47 ], !dbg !148
  call void @printSeries(i64* %arraydecay, i32 %add, i8* %cond50), !dbg !178
  br label %return, !dbg !179

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false10
  store i32 1, i32* %j, align 4, !dbg !180
  br label %for.cond51, !dbg !182

for.cond51:                                       ; preds = %for.inc, %if.end
  %37 = load i32, i32* %j, align 4, !dbg !183
  %38 = load i32, i32* %i, align 4, !dbg !185
  %cmp52 = icmp slt i32 %37, %38, !dbg !186
  br i1 %cmp52, label %for.body53, label %for.end, !dbg !187

for.body53:                                       ; preds = %for.cond51
  %39 = load i32, i32* %j, align 4, !dbg !188
  %idxprom54 = sext i32 %39 to i64, !dbg !191
  %arrayidx55 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom54, !dbg !191
  %40 = load i64, i64* %arrayidx55, align 8, !dbg !191
  %41 = load i32, i32* %i, align 4, !dbg !192
  %idxprom56 = sext i32 %41 to i64, !dbg !193
  %arrayidx57 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom56, !dbg !193
  %42 = load i64, i64* %arrayidx57, align 8, !dbg !193
  %cmp58 = icmp eq i64 %40, %42, !dbg !194
  br i1 %cmp58, label %if.then59, label %if.end62, !dbg !195

if.then59:                                        ; preds = %for.body53
  %arraydecay60 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !196
  %43 = load i32, i32* %i, align 4, !dbg !198
  %add61 = add nsw i32 %43, 1, !dbg !199
  call void @printSeries(i64* %arraydecay60, i32 %add61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)), !dbg !200
  br label %return, !dbg !201

if.end62:                                         ; preds = %for.body53
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %if.end62
  %44 = load i32, i32* %j, align 4, !dbg !203
  %inc = add nsw i32 %44, 1, !dbg !203
  store i32 %inc, i32* %j, align 4, !dbg !203
  br label %for.cond51, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond51
  br label %for.inc63, !dbg !207

for.inc63:                                        ; preds = %for.end
  %45 = load i32, i32* %i, align 4, !dbg !208
  %inc64 = add nsw i32 %45, 1, !dbg !208
  store i32 %inc64, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end65:                                        ; preds = %for.cond
  %arraydecay66 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !212
  %46 = load i32, i32* %i, align 4, !dbg !213
  %add67 = add nsw i32 %46, 1, !dbg !214
  call void @printSeries(i64* %arraydecay66, i32 %add67, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !215
  br label %return, !dbg !216

return:                                           ; preds = %for.end65, %if.then59, %cond.end49
  ret void, !dbg !216
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @processFile(i8* %fileName) #0 !dbg !217 {
entry:
  %fileName.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [21 x i8], align 16
  store i8* %fileName, i8** %fileName.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fileName.addr, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !222, metadata !DIExpression()), !dbg !282
  %0 = load i8*, i8** %fileName.addr, align 8, !dbg !283
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)), !dbg !284
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !282
  call void @llvm.dbg.declare(metadata [21 x i8]* %str, metadata !285, metadata !DIExpression()), !dbg !289
  br label %while.cond, !dbg !290

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !291
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !292
  %call1 = call i8* @fgets(i8* %arraydecay, i32 21, %struct._IO_FILE* %1), !dbg !293
  %cmp = icmp ne i8* %call1, null, !dbg !294
  br i1 %cmp, label %while.body, label %while.end, !dbg !290

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !295
  %call3 = call i64 @strtoull(i8* %arraydecay2, i8** null, i32 10) #5, !dbg !296
  call void @aliquotClassifier(i64 %call3), !dbg !297
  br label %while.cond, !dbg !290, !llvm.loop !298

while.end:                                        ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !300
  %call4 = call i32 @fclose(%struct._IO_FILE* %2), !dbg !301
  ret void, !dbg !302
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !303 {
entry:
  %retval = alloca i32, align 4
  %argC.addr = alloca i32, align 4
  %argV.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argC, i32* %argC.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argC.addr, metadata !306, metadata !DIExpression()), !dbg !307
  store i8** %argV, i8*** %argV.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argV.addr, metadata !308, metadata !DIExpression()), !dbg !309
  %0 = load i32, i32* %argC.addr, align 4, !dbg !310
  %cmp = icmp ne i32 %0, 2, !dbg !312
  br i1 %cmp, label %if.then, label %if.else, !dbg !313

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argV.addr, align 8, !dbg !314
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !314
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !314
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), i8* %2), !dbg !315
  br label %if.end9, !dbg !315

if.else:                                          ; preds = %entry
  %3 = load i8**, i8*** %argV.addr, align 8, !dbg !316
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !316
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !316
  %call2 = call i8* @strchr(i8* %4, i32 46) #6, !dbg !319
  %cmp3 = icmp ne i8* %call2, null, !dbg !320
  br i1 %cmp3, label %if.then4, label %if.else6, !dbg !321

if.then4:                                         ; preds = %if.else
  %5 = load i8**, i8*** %argV.addr, align 8, !dbg !322
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !322
  %6 = load i8*, i8** %arrayidx5, align 8, !dbg !322
  call void @processFile(i8* %6), !dbg !323
  br label %if.end, !dbg !323

if.else6:                                         ; preds = %if.else
  %7 = load i8**, i8*** %argV.addr, align 8, !dbg !324
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i64 1, !dbg !324
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !324
  %call8 = call i64 @strtoull(i8* %8, i8** null, i32 10) #5, !dbg !325
  call void @aliquotClassifier(i64 %call8), !dbg !326
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0, !dbg !327
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
!1 = !DIFile(filename: "aliquot-sequence-classifications-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Aliquot-sequence-classifications-1")
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
!12 = distinct !DISubprogram(name: "bruteForceProperDivisorSum", scope: !1, file: !1, line: 5, type: !13, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15}
!15 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DILocalVariable(name: "n", arg: 1, scope: !12, file: !1, line: 5, type: !15)
!17 = !DILocation(line: 5, column: 66, scope: !12)
!18 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 6, type: !15)
!19 = !DILocation(line: 6, column: 21, scope: !12)
!20 = !DILocalVariable(name: "sum", scope: !12, file: !1, line: 6, type: !15)
!21 = !DILocation(line: 6, column: 23, scope: !12)
!22 = !DILocation(line: 8, column: 7, scope: !23)
!23 = distinct !DILexicalBlock(scope: !12, file: !1, line: 8, column: 2)
!24 = !DILocation(line: 8, column: 6, scope: !23)
!25 = !DILocation(line: 8, column: 10, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !1, line: 8, column: 2)
!27 = !DILocation(line: 8, column: 13, scope: !26)
!28 = !DILocation(line: 8, column: 14, scope: !26)
!29 = !DILocation(line: 8, column: 17, scope: !26)
!30 = !DILocation(line: 8, column: 11, scope: !26)
!31 = !DILocation(line: 8, column: 2, scope: !23)
!32 = !DILocation(line: 9, column: 6, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !1, line: 9, column: 6)
!34 = !DILocation(line: 9, column: 8, scope: !33)
!35 = !DILocation(line: 9, column: 7, scope: !33)
!36 = !DILocation(line: 9, column: 9, scope: !33)
!37 = !DILocation(line: 9, column: 13, scope: !33)
!38 = !DILocation(line: 9, column: 16, scope: !33)
!39 = !DILocation(line: 9, column: 19, scope: !33)
!40 = !DILocation(line: 9, column: 17, scope: !33)
!41 = !DILocation(line: 9, column: 6, scope: !26)
!42 = !DILocation(line: 10, column: 11, scope: !33)
!43 = !DILocation(line: 10, column: 8, scope: !33)
!44 = !DILocation(line: 10, column: 4, scope: !33)
!45 = !DILocation(line: 8, column: 21, scope: !26)
!46 = !DILocation(line: 8, column: 2, scope: !26)
!47 = distinct !{!47, !31, !48}
!48 = !DILocation(line: 10, column: 11, scope: !23)
!49 = !DILocation(line: 12, column: 9, scope: !12)
!50 = !DILocation(line: 12, column: 2, scope: !12)
!51 = distinct !DISubprogram(name: "printSeries", scope: !1, file: !1, line: 15, type: !52, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{null, !54, !55, !6}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DILocalVariable(name: "arr", arg: 1, scope: !51, file: !1, line: 15, type: !54)
!57 = !DILocation(line: 15, column: 38, scope: !51)
!58 = !DILocalVariable(name: "size", arg: 2, scope: !51, file: !1, line: 15, type: !55)
!59 = !DILocation(line: 15, column: 46, scope: !51)
!60 = !DILocalVariable(name: "type", arg: 3, scope: !51, file: !1, line: 15, type: !6)
!61 = !DILocation(line: 15, column: 57, scope: !51)
!62 = !DILocalVariable(name: "i", scope: !51, file: !1, line: 16, type: !55)
!63 = !DILocation(line: 16, column: 6, scope: !51)
!64 = !DILocation(line: 18, column: 50, scope: !51)
!65 = !DILocation(line: 18, column: 57, scope: !51)
!66 = !DILocation(line: 18, column: 2, scope: !51)
!67 = !DILocation(line: 20, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !51, file: !1, line: 20, column: 2)
!69 = !DILocation(line: 20, column: 6, scope: !68)
!70 = !DILocation(line: 20, column: 10, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !1, line: 20, column: 2)
!72 = !DILocation(line: 20, column: 12, scope: !71)
!73 = !DILocation(line: 20, column: 16, scope: !71)
!74 = !DILocation(line: 20, column: 11, scope: !71)
!75 = !DILocation(line: 20, column: 2, scope: !68)
!76 = !DILocation(line: 21, column: 19, scope: !71)
!77 = !DILocation(line: 21, column: 23, scope: !71)
!78 = !DILocation(line: 21, column: 3, scope: !71)
!79 = !DILocation(line: 20, column: 20, scope: !71)
!80 = !DILocation(line: 20, column: 2, scope: !71)
!81 = distinct !{!81, !75, !82}
!82 = !DILocation(line: 21, column: 25, scope: !68)
!83 = !DILocation(line: 22, column: 16, scope: !51)
!84 = !DILocation(line: 22, column: 20, scope: !51)
!85 = !DILocation(line: 22, column: 2, scope: !51)
!86 = !DILocation(line: 23, column: 1, scope: !51)
!87 = distinct !DISubprogram(name: "aliquotClassifier", scope: !1, file: !1, line: 25, type: !88, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{null, !15}
!90 = !DILocalVariable(name: "n", arg: 1, scope: !87, file: !1, line: 25, type: !15)
!91 = !DILocation(line: 25, column: 43, scope: !87)
!92 = !DILocalVariable(name: "arr", scope: !87, file: !1, line: 26, type: !93)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 16)
!96 = !DILocation(line: 26, column: 21, scope: !87)
!97 = !DILocalVariable(name: "i", scope: !87, file: !1, line: 27, type: !55)
!98 = !DILocation(line: 27, column: 6, scope: !87)
!99 = !DILocalVariable(name: "j", scope: !87, file: !1, line: 27, type: !55)
!100 = !DILocation(line: 27, column: 8, scope: !87)
!101 = !DILocation(line: 29, column: 11, scope: !87)
!102 = !DILocation(line: 29, column: 2, scope: !87)
!103 = !DILocation(line: 29, column: 9, scope: !87)
!104 = !DILocation(line: 31, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !87, file: !1, line: 31, column: 2)
!106 = !DILocation(line: 31, column: 6, scope: !105)
!107 = !DILocation(line: 31, column: 10, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 31, column: 2)
!109 = !DILocation(line: 31, column: 11, scope: !108)
!110 = !DILocation(line: 31, column: 2, scope: !105)
!111 = !DILocation(line: 32, column: 43, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 31, column: 19)
!113 = !DILocation(line: 32, column: 44, scope: !112)
!114 = !DILocation(line: 32, column: 39, scope: !112)
!115 = !DILocation(line: 32, column: 12, scope: !112)
!116 = !DILocation(line: 32, column: 7, scope: !112)
!117 = !DILocation(line: 32, column: 3, scope: !112)
!118 = !DILocation(line: 32, column: 10, scope: !112)
!119 = !DILocation(line: 34, column: 10, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !1, line: 34, column: 6)
!121 = !DILocation(line: 34, column: 6, scope: !120)
!122 = !DILocation(line: 34, column: 12, scope: !120)
!123 = !DILocation(line: 34, column: 15, scope: !120)
!124 = !DILocation(line: 34, column: 21, scope: !120)
!125 = !DILocation(line: 34, column: 17, scope: !120)
!126 = !DILocation(line: 34, column: 25, scope: !120)
!127 = !DILocation(line: 34, column: 23, scope: !120)
!128 = !DILocation(line: 34, column: 26, scope: !120)
!129 = !DILocation(line: 34, column: 33, scope: !120)
!130 = !DILocation(line: 34, column: 29, scope: !120)
!131 = !DILocation(line: 34, column: 41, scope: !120)
!132 = !DILocation(line: 34, column: 42, scope: !120)
!133 = !DILocation(line: 34, column: 37, scope: !120)
!134 = !DILocation(line: 34, column: 35, scope: !120)
!135 = !DILocation(line: 34, column: 46, scope: !120)
!136 = !DILocation(line: 34, column: 53, scope: !120)
!137 = !DILocation(line: 34, column: 49, scope: !120)
!138 = !DILocation(line: 34, column: 57, scope: !120)
!139 = !DILocation(line: 34, column: 55, scope: !120)
!140 = !DILocation(line: 34, column: 6, scope: !112)
!141 = !DILocation(line: 35, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !120, file: !1, line: 34, column: 60)
!143 = !DILocation(line: 35, column: 20, scope: !142)
!144 = !DILocation(line: 35, column: 21, scope: !142)
!145 = !DILocation(line: 35, column: 29, scope: !142)
!146 = !DILocation(line: 35, column: 25, scope: !142)
!147 = !DILocation(line: 35, column: 31, scope: !142)
!148 = !DILocation(line: 35, column: 24, scope: !142)
!149 = !DILocation(line: 35, column: 55, scope: !142)
!150 = !DILocation(line: 35, column: 51, scope: !142)
!151 = !DILocation(line: 35, column: 59, scope: !142)
!152 = !DILocation(line: 35, column: 57, scope: !142)
!153 = !DILocation(line: 35, column: 61, scope: !142)
!154 = !DILocation(line: 35, column: 64, scope: !142)
!155 = !DILocation(line: 35, column: 65, scope: !142)
!156 = !DILocation(line: 35, column: 50, scope: !142)
!157 = !DILocation(line: 35, column: 85, scope: !142)
!158 = !DILocation(line: 35, column: 81, scope: !142)
!159 = !DILocation(line: 35, column: 89, scope: !142)
!160 = !DILocation(line: 35, column: 87, scope: !142)
!161 = !DILocation(line: 35, column: 91, scope: !142)
!162 = !DILocation(line: 35, column: 94, scope: !142)
!163 = !DILocation(line: 35, column: 95, scope: !142)
!164 = !DILocation(line: 35, column: 80, scope: !142)
!165 = !DILocation(line: 35, column: 116, scope: !142)
!166 = !DILocation(line: 35, column: 112, scope: !142)
!167 = !DILocation(line: 35, column: 124, scope: !142)
!168 = !DILocation(line: 35, column: 125, scope: !142)
!169 = !DILocation(line: 35, column: 120, scope: !142)
!170 = !DILocation(line: 35, column: 118, scope: !142)
!171 = !DILocation(line: 35, column: 129, scope: !142)
!172 = !DILocation(line: 35, column: 136, scope: !142)
!173 = !DILocation(line: 35, column: 132, scope: !142)
!174 = !DILocation(line: 35, column: 140, scope: !142)
!175 = !DILocation(line: 35, column: 138, scope: !142)
!176 = !DILocation(line: 0, scope: !142)
!177 = !DILocation(line: 35, column: 111, scope: !142)
!178 = !DILocation(line: 35, column: 4, scope: !142)
!179 = !DILocation(line: 36, column: 4, scope: !142)
!180 = !DILocation(line: 39, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !112, file: !1, line: 39, column: 3)
!182 = !DILocation(line: 39, column: 7, scope: !181)
!183 = !DILocation(line: 39, column: 11, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !1, line: 39, column: 3)
!185 = !DILocation(line: 39, column: 13, scope: !184)
!186 = !DILocation(line: 39, column: 12, scope: !184)
!187 = !DILocation(line: 39, column: 3, scope: !181)
!188 = !DILocation(line: 40, column: 11, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !1, line: 40, column: 7)
!190 = distinct !DILexicalBlock(scope: !184, file: !1, line: 39, column: 19)
!191 = !DILocation(line: 40, column: 7, scope: !189)
!192 = !DILocation(line: 40, column: 19, scope: !189)
!193 = !DILocation(line: 40, column: 15, scope: !189)
!194 = !DILocation(line: 40, column: 13, scope: !189)
!195 = !DILocation(line: 40, column: 7, scope: !190)
!196 = !DILocation(line: 41, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !189, file: !1, line: 40, column: 22)
!198 = !DILocation(line: 41, column: 21, scope: !197)
!199 = !DILocation(line: 41, column: 22, scope: !197)
!200 = !DILocation(line: 41, column: 5, scope: !197)
!201 = !DILocation(line: 42, column: 5, scope: !197)
!202 = !DILocation(line: 44, column: 3, scope: !190)
!203 = !DILocation(line: 39, column: 16, scope: !184)
!204 = !DILocation(line: 39, column: 3, scope: !184)
!205 = distinct !{!205, !187, !206}
!206 = !DILocation(line: 44, column: 3, scope: !181)
!207 = !DILocation(line: 45, column: 2, scope: !112)
!208 = !DILocation(line: 31, column: 16, scope: !108)
!209 = !DILocation(line: 31, column: 2, scope: !108)
!210 = distinct !{!210, !110, !211}
!211 = !DILocation(line: 45, column: 2, scope: !105)
!212 = !DILocation(line: 47, column: 14, scope: !87)
!213 = !DILocation(line: 47, column: 18, scope: !87)
!214 = !DILocation(line: 47, column: 19, scope: !87)
!215 = !DILocation(line: 47, column: 2, scope: !87)
!216 = !DILocation(line: 48, column: 1, scope: !87)
!217 = distinct !DISubprogram(name: "processFile", scope: !1, file: !1, line: 50, type: !218, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!218 = !DISubroutineType(types: !219)
!219 = !{null, !6}
!220 = !DILocalVariable(name: "fileName", arg: 1, scope: !217, file: !1, line: 50, type: !6)
!221 = !DILocation(line: 50, column: 24, scope: !217)
!222 = !DILocalVariable(name: "fp", scope: !217, file: !1, line: 51, type: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !225, line: 7, baseType: !226)
!225 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!226 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !227, line: 49, size: 1728, elements: !228)
!227 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!228 = !{!229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !244, !246, !247, !248, !252, !254, !256, !260, !263, !265, !268, !271, !272, !273, !277, !278}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !226, file: !227, line: 51, baseType: !55, size: 32)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !226, file: !227, line: 54, baseType: !6, size: 64, offset: 64)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !226, file: !227, line: 55, baseType: !6, size: 64, offset: 128)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !226, file: !227, line: 56, baseType: !6, size: 64, offset: 192)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !226, file: !227, line: 57, baseType: !6, size: 64, offset: 256)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !226, file: !227, line: 58, baseType: !6, size: 64, offset: 320)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !226, file: !227, line: 59, baseType: !6, size: 64, offset: 384)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !226, file: !227, line: 60, baseType: !6, size: 64, offset: 448)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !226, file: !227, line: 61, baseType: !6, size: 64, offset: 512)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !226, file: !227, line: 64, baseType: !6, size: 64, offset: 576)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !226, file: !227, line: 65, baseType: !6, size: 64, offset: 640)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !226, file: !227, line: 66, baseType: !6, size: 64, offset: 704)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !226, file: !227, line: 68, baseType: !242, size: 64, offset: 768)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!243 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !227, line: 36, flags: DIFlagFwdDecl)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !226, file: !227, line: 70, baseType: !245, size: 64, offset: 832)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !226, file: !227, line: 72, baseType: !55, size: 32, offset: 896)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !226, file: !227, line: 73, baseType: !55, size: 32, offset: 928)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !226, file: !227, line: 74, baseType: !249, size: 64, offset: 960)
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !250, line: 152, baseType: !251)
!250 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!251 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !226, file: !227, line: 77, baseType: !253, size: 16, offset: 1024)
!253 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !226, file: !227, line: 78, baseType: !255, size: 8, offset: 1040)
!255 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !226, file: !227, line: 79, baseType: !257, size: 8, offset: 1048)
!257 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8, elements: !258)
!258 = !{!259}
!259 = !DISubrange(count: 1)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !226, file: !227, line: 81, baseType: !261, size: 64, offset: 1088)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !227, line: 43, baseType: null)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !226, file: !227, line: 89, baseType: !264, size: 64, offset: 1152)
!264 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !250, line: 153, baseType: !251)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !226, file: !227, line: 91, baseType: !266, size: 64, offset: 1216)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !227, line: 37, flags: DIFlagFwdDecl)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !226, file: !227, line: 92, baseType: !269, size: 64, offset: 1280)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !227, line: 38, flags: DIFlagFwdDecl)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !226, file: !227, line: 93, baseType: !245, size: 64, offset: 1344)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !226, file: !227, line: 94, baseType: !4, size: 64, offset: 1408)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !226, file: !227, line: 95, baseType: !274, size: 64, offset: 1472)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !275, line: 46, baseType: !276)
!275 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!276 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !226, file: !227, line: 96, baseType: !55, size: 32, offset: 1536)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !226, file: !227, line: 98, baseType: !279, size: 160, offset: 1568)
!279 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !280)
!280 = !{!281}
!281 = !DISubrange(count: 20)
!282 = !DILocation(line: 51, column: 8, scope: !217)
!283 = !DILocation(line: 51, column: 19, scope: !217)
!284 = !DILocation(line: 51, column: 13, scope: !217)
!285 = !DILocalVariable(name: "str", scope: !217, file: !1, line: 52, type: !286)
!286 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 168, elements: !287)
!287 = !{!288}
!288 = !DISubrange(count: 21)
!289 = !DILocation(line: 52, column: 7, scope: !217)
!290 = !DILocation(line: 54, column: 2, scope: !217)
!291 = !DILocation(line: 54, column: 14, scope: !217)
!292 = !DILocation(line: 54, column: 21, scope: !217)
!293 = !DILocation(line: 54, column: 8, scope: !217)
!294 = !DILocation(line: 54, column: 24, scope: !217)
!295 = !DILocation(line: 55, column: 30, scope: !217)
!296 = !DILocation(line: 55, column: 21, scope: !217)
!297 = !DILocation(line: 55, column: 3, scope: !217)
!298 = distinct !{!298, !290, !299}
!299 = !DILocation(line: 55, column: 50, scope: !217)
!300 = !DILocation(line: 57, column: 9, scope: !217)
!301 = !DILocation(line: 57, column: 2, scope: !217)
!302 = !DILocation(line: 58, column: 1, scope: !217)
!303 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 60, type: !304, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!304 = !DISubroutineType(types: !305)
!305 = !{!55, !55, !5}
!306 = !DILocalVariable(name: "argC", arg: 1, scope: !303, file: !1, line: 60, type: !55)
!307 = !DILocation(line: 60, column: 14, scope: !303)
!308 = !DILocalVariable(name: "argV", arg: 2, scope: !303, file: !1, line: 60, type: !5)
!309 = !DILocation(line: 60, column: 25, scope: !303)
!310 = !DILocation(line: 62, column: 8, scope: !311)
!311 = distinct !DILexicalBlock(scope: !303, file: !1, line: 62, column: 8)
!312 = !DILocation(line: 62, column: 12, scope: !311)
!313 = !DILocation(line: 62, column: 8, scope: !303)
!314 = !DILocation(line: 63, column: 42, scope: !311)
!315 = !DILocation(line: 63, column: 3, scope: !311)
!316 = !DILocation(line: 65, column: 13, scope: !317)
!317 = distinct !DILexicalBlock(scope: !318, file: !1, line: 65, column: 6)
!318 = distinct !DILexicalBlock(scope: !311, file: !1, line: 64, column: 6)
!319 = !DILocation(line: 65, column: 6, scope: !317)
!320 = !DILocation(line: 65, column: 25, scope: !317)
!321 = !DILocation(line: 65, column: 6, scope: !318)
!322 = !DILocation(line: 66, column: 16, scope: !317)
!323 = !DILocation(line: 66, column: 4, scope: !317)
!324 = !DILocation(line: 68, column: 31, scope: !317)
!325 = !DILocation(line: 68, column: 22, scope: !317)
!326 = !DILocation(line: 68, column: 4, scope: !317)
!327 = !DILocation(line: 70, column: 2, scope: !303)
