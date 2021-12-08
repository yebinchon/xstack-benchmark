; ModuleID = 'aliquot-sequence-classifications-1.ll'
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
  call void @llvm.dbg.value(metadata i64 %n, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 0, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 1, metadata !19, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 1, %entry ], [ %inc, %for.inc ], !dbg !22
  %sum.0 = phi i64 [ 0, %entry ], [ %sum.1, %for.inc ], !dbg !17
  call void @llvm.dbg.value(metadata i64 %sum.0, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !19, metadata !DIExpression()), !dbg !17
  %add = add i64 %n, 1, !dbg !23
  %div = udiv i64 %add, 2, !dbg !25
  %cmp = icmp ult i64 %i.0, %div, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %rem = urem i64 %n, %i.0, !dbg !28
  %cmp1 = icmp eq i64 %rem, 0, !dbg !30
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !31

land.lhs.true:                                    ; preds = %for.body
  %cmp2 = icmp ne i64 %n, %i.0, !dbg !32
  br i1 %cmp2, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %land.lhs.true
  %add3 = add i64 %sum.0, %i.0, !dbg !34
  call void @llvm.dbg.value(metadata i64 %add3, metadata !18, metadata !DIExpression()), !dbg !17
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  %sum.1 = phi i64 [ %add3, %if.then ], [ %sum.0, %land.lhs.true ], [ %sum.0, %for.body ], !dbg !17
  call void @llvm.dbg.value(metadata i64 %sum.1, metadata !18, metadata !DIExpression()), !dbg !17
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %if.end
  %inc = add i64 %i.0, 1, !dbg !37
  call void @llvm.dbg.value(metadata i64 %inc, metadata !19, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  ret i64 %sum.0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printSeries(i64* %arr, i32 %size, i8* %type) #0 !dbg !42 {
entry:
  call void @llvm.dbg.value(metadata i64* %arr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i32 %size, metadata !49, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i8* %type, metadata !50, metadata !DIExpression()), !dbg !48
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 0, !dbg !51
  %0 = load i64, i64* %arrayidx, align 8, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i64 %0, i8* %type), !dbg !52
  call void @llvm.dbg.value(metadata i32 0, metadata !53, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !56
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !53, metadata !DIExpression()), !dbg !48
  %sub = sub nsw i32 %size, 1, !dbg !57
  %cmp = icmp slt i32 %i.0, %sub, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !61
  %arrayidx1 = getelementptr inbounds i64, i64* %arr, i64 %idxprom, !dbg !61
  %1 = load i64, i64* %arrayidx1, align 8, !dbg !61
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !62
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc, metadata !53, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %idxprom3 = sext i32 %i.0 to i64, !dbg !67
  %arrayidx4 = getelementptr inbounds i64, i64* %arr, i64 %idxprom3, !dbg !67
  %2 = load i64, i64* %arrayidx4, align 8, !dbg !67
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %2), !dbg !68
  ret void, !dbg !69
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @aliquotClassifier(i64 %n) #0 !dbg !70 {
entry:
  %arr = alloca [16 x i64], align 16
  call void @llvm.dbg.value(metadata i64 %n, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [16 x i64]* %arr, metadata !75, metadata !DIExpression()), !dbg !79
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !80
  store i64 %n, i64* %arrayidx, align 16, !dbg !81
  call void @llvm.dbg.value(metadata i32 1, metadata !82, metadata !DIExpression()), !dbg !74
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc64, %for.inc63 ], !dbg !85
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !82, metadata !DIExpression()), !dbg !74
  %cmp = icmp slt i32 %i.0, 16, !dbg !86
  br i1 %cmp, label %for.body, label %for.end65, !dbg !88

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %i.0, 1, !dbg !89
  %idxprom = sext i32 %sub to i64, !dbg !91
  %arrayidx1 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom, !dbg !91
  %0 = load i64, i64* %arrayidx1, align 8, !dbg !91
  %call = call i64 @bruteForceProperDivisorSum(i64 %0), !dbg !92
  %idxprom2 = sext i32 %i.0 to i64, !dbg !93
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom2, !dbg !93
  store i64 %call, i64* %arrayidx3, align 8, !dbg !94
  %idxprom4 = sext i32 %i.0 to i64, !dbg !95
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom4, !dbg !95
  %1 = load i64, i64* %arrayidx5, align 8, !dbg !95
  %cmp6 = icmp eq i64 %1, 0, !dbg !97
  br i1 %cmp6, label %if.then, label %lor.lhs.false, !dbg !98

lor.lhs.false:                                    ; preds = %for.body
  %idxprom7 = sext i32 %i.0 to i64, !dbg !99
  %arrayidx8 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom7, !dbg !99
  %2 = load i64, i64* %arrayidx8, align 8, !dbg !99
  %cmp9 = icmp eq i64 %2, %n, !dbg !100
  br i1 %cmp9, label %if.then, label %lor.lhs.false10, !dbg !101

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %idxprom11 = sext i32 %i.0 to i64, !dbg !102
  %arrayidx12 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom11, !dbg !102
  %3 = load i64, i64* %arrayidx12, align 8, !dbg !102
  %sub13 = sub nsw i32 %i.0, 1, !dbg !103
  %idxprom14 = sext i32 %sub13 to i64, !dbg !104
  %arrayidx15 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom14, !dbg !104
  %4 = load i64, i64* %arrayidx15, align 8, !dbg !104
  %cmp16 = icmp eq i64 %3, %4, !dbg !105
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !106

land.lhs.true:                                    ; preds = %lor.lhs.false10
  %idxprom17 = sext i32 %i.0 to i64, !dbg !107
  %arrayidx18 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom17, !dbg !107
  %5 = load i64, i64* %arrayidx18, align 8, !dbg !107
  %cmp19 = icmp ne i64 %5, %n, !dbg !108
  br i1 %cmp19, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %for.body
  %arraydecay = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !110
  %add = add nsw i32 %i.0, 1, !dbg !112
  %idxprom20 = sext i32 %i.0 to i64, !dbg !113
  %arrayidx21 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom20, !dbg !113
  %6 = load i64, i64* %arrayidx21, align 8, !dbg !113
  %cmp22 = icmp eq i64 %6, 0, !dbg !114
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !115

cond.true:                                        ; preds = %if.then
  br label %cond.end49, !dbg !115

cond.false:                                       ; preds = %if.then
  %idxprom23 = sext i32 %i.0 to i64, !dbg !116
  %arrayidx24 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom23, !dbg !116
  %7 = load i64, i64* %arrayidx24, align 8, !dbg !116
  %cmp25 = icmp eq i64 %7, %n, !dbg !117
  br i1 %cmp25, label %land.lhs.true26, label %cond.false29, !dbg !118

land.lhs.true26:                                  ; preds = %cond.false
  %cmp27 = icmp eq i32 %i.0, 1, !dbg !119
  br i1 %cmp27, label %cond.true28, label %cond.false29, !dbg !120

cond.true28:                                      ; preds = %land.lhs.true26
  br label %cond.end47, !dbg !120

cond.false29:                                     ; preds = %land.lhs.true26, %cond.false
  %idxprom30 = sext i32 %i.0 to i64, !dbg !121
  %arrayidx31 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom30, !dbg !121
  %8 = load i64, i64* %arrayidx31, align 8, !dbg !121
  %cmp32 = icmp eq i64 %8, %n, !dbg !122
  br i1 %cmp32, label %land.lhs.true33, label %cond.false36, !dbg !123

land.lhs.true33:                                  ; preds = %cond.false29
  %cmp34 = icmp eq i32 %i.0, 2, !dbg !124
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !125

cond.true35:                                      ; preds = %land.lhs.true33
  br label %cond.end, !dbg !125

cond.false36:                                     ; preds = %land.lhs.true33, %cond.false29
  %idxprom37 = sext i32 %i.0 to i64, !dbg !126
  %arrayidx38 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom37, !dbg !126
  %9 = load i64, i64* %arrayidx38, align 8, !dbg !126
  %sub39 = sub nsw i32 %i.0, 1, !dbg !127
  %idxprom40 = sext i32 %sub39 to i64, !dbg !128
  %arrayidx41 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom40, !dbg !128
  %10 = load i64, i64* %arrayidx41, align 8, !dbg !128
  %cmp42 = icmp eq i64 %9, %10, !dbg !129
  br i1 %cmp42, label %land.rhs, label %land.end, !dbg !130

land.rhs:                                         ; preds = %cond.false36
  %idxprom43 = sext i32 %i.0 to i64, !dbg !131
  %arrayidx44 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom43, !dbg !131
  %11 = load i64, i64* %arrayidx44, align 8, !dbg !131
  %cmp45 = icmp ne i64 %11, %n, !dbg !132
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false36
  %12 = phi i1 [ false, %cond.false36 ], [ %cmp45, %land.rhs ], !dbg !133
  %13 = zext i1 %12 to i64, !dbg !134
  %cond = select i1 %12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), !dbg !134
  br label %cond.end, !dbg !125

cond.end:                                         ; preds = %land.end, %cond.true35
  %cond46 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), %cond.true35 ], [ %cond, %land.end ], !dbg !125
  br label %cond.end47, !dbg !120

cond.end47:                                       ; preds = %cond.end, %cond.true28
  %cond48 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), %cond.true28 ], [ %cond46, %cond.end ], !dbg !120
  br label %cond.end49, !dbg !115

cond.end49:                                       ; preds = %cond.end47, %cond.true
  %cond50 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), %cond.true ], [ %cond48, %cond.end47 ], !dbg !115
  call void @printSeries(i64* %arraydecay, i32 %add, i8* %cond50), !dbg !135
  br label %return, !dbg !136

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false10
  call void @llvm.dbg.value(metadata i32 1, metadata !137, metadata !DIExpression()), !dbg !74
  br label %for.cond51, !dbg !138

for.cond51:                                       ; preds = %for.inc, %if.end
  %j.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ], !dbg !140
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !137, metadata !DIExpression()), !dbg !74
  %cmp52 = icmp slt i32 %j.0, %i.0, !dbg !141
  br i1 %cmp52, label %for.body53, label %for.end, !dbg !143

for.body53:                                       ; preds = %for.cond51
  %idxprom54 = sext i32 %j.0 to i64, !dbg !144
  %arrayidx55 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom54, !dbg !144
  %14 = load i64, i64* %arrayidx55, align 8, !dbg !144
  %idxprom56 = sext i32 %i.0 to i64, !dbg !147
  %arrayidx57 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 %idxprom56, !dbg !147
  %15 = load i64, i64* %arrayidx57, align 8, !dbg !147
  %cmp58 = icmp eq i64 %14, %15, !dbg !148
  br i1 %cmp58, label %if.then59, label %if.end62, !dbg !149

if.then59:                                        ; preds = %for.body53
  %arraydecay60 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !150
  %add61 = add nsw i32 %i.0, 1, !dbg !152
  call void @printSeries(i64* %arraydecay60, i32 %add61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)), !dbg !153
  br label %return, !dbg !154

if.end62:                                         ; preds = %for.body53
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %if.end62
  %inc = add nsw i32 %j.0, 1, !dbg !156
  call void @llvm.dbg.value(metadata i32 %inc, metadata !137, metadata !DIExpression()), !dbg !74
  br label %for.cond51, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond51
  br label %for.inc63, !dbg !160

for.inc63:                                        ; preds = %for.end
  %inc64 = add nsw i32 %i.0, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %inc64, metadata !82, metadata !DIExpression()), !dbg !74
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end65:                                        ; preds = %for.cond
  %arraydecay66 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i64 0, i64 0, !dbg !165
  %add67 = add nsw i32 %i.0, 1, !dbg !166
  call void @printSeries(i64* %arraydecay66, i32 %add67, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0)), !dbg !167
  br label %return, !dbg !168

return:                                           ; preds = %for.end65, %if.then59, %cond.end49
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @processFile(i8* %fileName) #0 !dbg !169 {
entry:
  %str = alloca [21 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %fileName, metadata !172, metadata !DIExpression()), !dbg !173
  %call = call %struct._IO_FILE* @fopen(i8* %fileName, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i64 0, i64 0)), !dbg !174
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !175, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [21 x i8]* %str, metadata !235, metadata !DIExpression()), !dbg !239
  br label %while.cond, !dbg !240

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !241
  %call1 = call i8* @fgets(i8* %arraydecay, i32 21, %struct._IO_FILE* %call), !dbg !242
  %cmp = icmp ne i8* %call1, null, !dbg !243
  br i1 %cmp, label %while.body, label %while.end, !dbg !240

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i64 0, i64 0, !dbg !244
  %call3 = call i64 @strtoull(i8* %arraydecay2, i8** null, i32 10) #5, !dbg !245
  call void @aliquotClassifier(i64 %call3), !dbg !246
  br label %while.cond, !dbg !240, !llvm.loop !247

while.end:                                        ; preds = %while.cond
  %call4 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !249
  ret void, !dbg !250
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argC, i8** %argV) #0 !dbg !251 {
entry:
  call void @llvm.dbg.value(metadata i32 %argC, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i8** %argV, metadata !256, metadata !DIExpression()), !dbg !255
  %cmp = icmp ne i32 %argC, 2, !dbg !257
  br i1 %cmp, label %if.then, label %if.else, !dbg !259

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argV, i64 0, !dbg !260
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !260
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), i8* %0), !dbg !261
  br label %if.end9, !dbg !261

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !262
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !262
  %call2 = call i8* @strchr(i8* %1, i32 46) #6, !dbg !265
  %cmp3 = icmp ne i8* %call2, null, !dbg !266
  br i1 %cmp3, label %if.then4, label %if.else6, !dbg !267

if.then4:                                         ; preds = %if.else
  %arrayidx5 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !268
  %2 = load i8*, i8** %arrayidx5, align 8, !dbg !268
  call void @processFile(i8* %2), !dbg !269
  br label %if.end, !dbg !269

if.else6:                                         ; preds = %if.else
  %arrayidx7 = getelementptr inbounds i8*, i8** %argV, i64 1, !dbg !270
  %3 = load i8*, i8** %arrayidx7, align 8, !dbg !270
  %call8 = call i64 @strtoull(i8* %3, i8** null, i32 10) #5, !dbg !271
  call void @aliquotClassifier(i64 %call8), !dbg !272
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0, !dbg !273
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
!17 = !DILocation(line: 0, scope: !12)
!18 = !DILocalVariable(name: "sum", scope: !12, file: !1, line: 6, type: !15)
!19 = !DILocalVariable(name: "i", scope: !12, file: !1, line: 6, type: !15)
!20 = !DILocation(line: 8, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !1, line: 8, column: 2)
!22 = !DILocation(line: 0, scope: !21)
!23 = !DILocation(line: 8, column: 14, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !1, line: 8, column: 2)
!25 = !DILocation(line: 8, column: 17, scope: !24)
!26 = !DILocation(line: 8, column: 11, scope: !24)
!27 = !DILocation(line: 8, column: 2, scope: !21)
!28 = !DILocation(line: 9, column: 7, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !1, line: 9, column: 6)
!30 = !DILocation(line: 9, column: 9, scope: !29)
!31 = !DILocation(line: 9, column: 13, scope: !29)
!32 = !DILocation(line: 9, column: 17, scope: !29)
!33 = !DILocation(line: 9, column: 6, scope: !24)
!34 = !DILocation(line: 10, column: 8, scope: !29)
!35 = !DILocation(line: 10, column: 4, scope: !29)
!36 = !DILocation(line: 9, column: 19, scope: !29)
!37 = !DILocation(line: 8, column: 21, scope: !24)
!38 = !DILocation(line: 8, column: 2, scope: !24)
!39 = distinct !{!39, !27, !40}
!40 = !DILocation(line: 10, column: 11, scope: !21)
!41 = !DILocation(line: 12, column: 2, scope: !12)
!42 = distinct !DISubprogram(name: "printSeries", scope: !1, file: !1, line: 15, type: !43, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !45, !46, !6}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DILocalVariable(name: "arr", arg: 1, scope: !42, file: !1, line: 15, type: !45)
!48 = !DILocation(line: 0, scope: !42)
!49 = !DILocalVariable(name: "size", arg: 2, scope: !42, file: !1, line: 15, type: !46)
!50 = !DILocalVariable(name: "type", arg: 3, scope: !42, file: !1, line: 15, type: !6)
!51 = !DILocation(line: 18, column: 50, scope: !42)
!52 = !DILocation(line: 18, column: 2, scope: !42)
!53 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 16, type: !46)
!54 = !DILocation(line: 20, column: 6, scope: !55)
!55 = distinct !DILexicalBlock(scope: !42, file: !1, line: 20, column: 2)
!56 = !DILocation(line: 0, scope: !55)
!57 = !DILocation(line: 20, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 20, column: 2)
!59 = !DILocation(line: 20, column: 11, scope: !58)
!60 = !DILocation(line: 20, column: 2, scope: !55)
!61 = !DILocation(line: 21, column: 19, scope: !58)
!62 = !DILocation(line: 21, column: 3, scope: !58)
!63 = !DILocation(line: 20, column: 20, scope: !58)
!64 = !DILocation(line: 20, column: 2, scope: !58)
!65 = distinct !{!65, !60, !66}
!66 = !DILocation(line: 21, column: 25, scope: !55)
!67 = !DILocation(line: 22, column: 16, scope: !42)
!68 = !DILocation(line: 22, column: 2, scope: !42)
!69 = !DILocation(line: 23, column: 1, scope: !42)
!70 = distinct !DISubprogram(name: "aliquotClassifier", scope: !1, file: !1, line: 25, type: !71, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{null, !15}
!73 = !DILocalVariable(name: "n", arg: 1, scope: !70, file: !1, line: 25, type: !15)
!74 = !DILocation(line: 0, scope: !70)
!75 = !DILocalVariable(name: "arr", scope: !70, file: !1, line: 26, type: !76)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 16)
!79 = !DILocation(line: 26, column: 21, scope: !70)
!80 = !DILocation(line: 29, column: 2, scope: !70)
!81 = !DILocation(line: 29, column: 9, scope: !70)
!82 = !DILocalVariable(name: "i", scope: !70, file: !1, line: 27, type: !46)
!83 = !DILocation(line: 31, column: 6, scope: !84)
!84 = distinct !DILexicalBlock(scope: !70, file: !1, line: 31, column: 2)
!85 = !DILocation(line: 0, scope: !84)
!86 = !DILocation(line: 31, column: 11, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 31, column: 2)
!88 = !DILocation(line: 31, column: 2, scope: !84)
!89 = !DILocation(line: 32, column: 44, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 31, column: 19)
!91 = !DILocation(line: 32, column: 39, scope: !90)
!92 = !DILocation(line: 32, column: 12, scope: !90)
!93 = !DILocation(line: 32, column: 3, scope: !90)
!94 = !DILocation(line: 32, column: 10, scope: !90)
!95 = !DILocation(line: 34, column: 6, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !1, line: 34, column: 6)
!97 = !DILocation(line: 34, column: 12, scope: !96)
!98 = !DILocation(line: 34, column: 15, scope: !96)
!99 = !DILocation(line: 34, column: 17, scope: !96)
!100 = !DILocation(line: 34, column: 23, scope: !96)
!101 = !DILocation(line: 34, column: 26, scope: !96)
!102 = !DILocation(line: 34, column: 29, scope: !96)
!103 = !DILocation(line: 34, column: 42, scope: !96)
!104 = !DILocation(line: 34, column: 37, scope: !96)
!105 = !DILocation(line: 34, column: 35, scope: !96)
!106 = !DILocation(line: 34, column: 46, scope: !96)
!107 = !DILocation(line: 34, column: 49, scope: !96)
!108 = !DILocation(line: 34, column: 55, scope: !96)
!109 = !DILocation(line: 34, column: 6, scope: !90)
!110 = !DILocation(line: 35, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !96, file: !1, line: 34, column: 60)
!112 = !DILocation(line: 35, column: 21, scope: !111)
!113 = !DILocation(line: 35, column: 25, scope: !111)
!114 = !DILocation(line: 35, column: 31, scope: !111)
!115 = !DILocation(line: 35, column: 24, scope: !111)
!116 = !DILocation(line: 35, column: 51, scope: !111)
!117 = !DILocation(line: 35, column: 57, scope: !111)
!118 = !DILocation(line: 35, column: 61, scope: !111)
!119 = !DILocation(line: 35, column: 65, scope: !111)
!120 = !DILocation(line: 35, column: 50, scope: !111)
!121 = !DILocation(line: 35, column: 81, scope: !111)
!122 = !DILocation(line: 35, column: 87, scope: !111)
!123 = !DILocation(line: 35, column: 91, scope: !111)
!124 = !DILocation(line: 35, column: 95, scope: !111)
!125 = !DILocation(line: 35, column: 80, scope: !111)
!126 = !DILocation(line: 35, column: 112, scope: !111)
!127 = !DILocation(line: 35, column: 125, scope: !111)
!128 = !DILocation(line: 35, column: 120, scope: !111)
!129 = !DILocation(line: 35, column: 118, scope: !111)
!130 = !DILocation(line: 35, column: 129, scope: !111)
!131 = !DILocation(line: 35, column: 132, scope: !111)
!132 = !DILocation(line: 35, column: 138, scope: !111)
!133 = !DILocation(line: 0, scope: !111)
!134 = !DILocation(line: 35, column: 111, scope: !111)
!135 = !DILocation(line: 35, column: 4, scope: !111)
!136 = !DILocation(line: 36, column: 4, scope: !111)
!137 = !DILocalVariable(name: "j", scope: !70, file: !1, line: 27, type: !46)
!138 = !DILocation(line: 39, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !90, file: !1, line: 39, column: 3)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 39, column: 12, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 39, column: 3)
!143 = !DILocation(line: 39, column: 3, scope: !139)
!144 = !DILocation(line: 40, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 40, column: 7)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 39, column: 19)
!147 = !DILocation(line: 40, column: 15, scope: !145)
!148 = !DILocation(line: 40, column: 13, scope: !145)
!149 = !DILocation(line: 40, column: 7, scope: !146)
!150 = !DILocation(line: 41, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !1, line: 40, column: 22)
!152 = !DILocation(line: 41, column: 22, scope: !151)
!153 = !DILocation(line: 41, column: 5, scope: !151)
!154 = !DILocation(line: 42, column: 5, scope: !151)
!155 = !DILocation(line: 44, column: 3, scope: !146)
!156 = !DILocation(line: 39, column: 16, scope: !142)
!157 = !DILocation(line: 39, column: 3, scope: !142)
!158 = distinct !{!158, !143, !159}
!159 = !DILocation(line: 44, column: 3, scope: !139)
!160 = !DILocation(line: 45, column: 2, scope: !90)
!161 = !DILocation(line: 31, column: 16, scope: !87)
!162 = !DILocation(line: 31, column: 2, scope: !87)
!163 = distinct !{!163, !88, !164}
!164 = !DILocation(line: 45, column: 2, scope: !84)
!165 = !DILocation(line: 47, column: 14, scope: !70)
!166 = !DILocation(line: 47, column: 19, scope: !70)
!167 = !DILocation(line: 47, column: 2, scope: !70)
!168 = !DILocation(line: 48, column: 1, scope: !70)
!169 = distinct !DISubprogram(name: "processFile", scope: !1, file: !1, line: 50, type: !170, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DISubroutineType(types: !171)
!171 = !{null, !6}
!172 = !DILocalVariable(name: "fileName", arg: 1, scope: !169, file: !1, line: 50, type: !6)
!173 = !DILocation(line: 0, scope: !169)
!174 = !DILocation(line: 51, column: 13, scope: !169)
!175 = !DILocalVariable(name: "fp", scope: !169, file: !1, line: 51, type: !176)
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !178, line: 7, baseType: !179)
!178 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !180, line: 49, size: 1728, elements: !181)
!180 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!181 = !{!182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !197, !199, !200, !201, !205, !207, !209, !213, !216, !218, !221, !224, !225, !226, !230, !231}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !179, file: !180, line: 51, baseType: !46, size: 32)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !179, file: !180, line: 54, baseType: !6, size: 64, offset: 64)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !179, file: !180, line: 55, baseType: !6, size: 64, offset: 128)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !179, file: !180, line: 56, baseType: !6, size: 64, offset: 192)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !179, file: !180, line: 57, baseType: !6, size: 64, offset: 256)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !179, file: !180, line: 58, baseType: !6, size: 64, offset: 320)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !179, file: !180, line: 59, baseType: !6, size: 64, offset: 384)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !179, file: !180, line: 60, baseType: !6, size: 64, offset: 448)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !179, file: !180, line: 61, baseType: !6, size: 64, offset: 512)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !179, file: !180, line: 64, baseType: !6, size: 64, offset: 576)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !179, file: !180, line: 65, baseType: !6, size: 64, offset: 640)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !179, file: !180, line: 66, baseType: !6, size: 64, offset: 704)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !179, file: !180, line: 68, baseType: !195, size: 64, offset: 768)
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !180, line: 36, flags: DIFlagFwdDecl)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !179, file: !180, line: 70, baseType: !198, size: 64, offset: 832)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !179, file: !180, line: 72, baseType: !46, size: 32, offset: 896)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !179, file: !180, line: 73, baseType: !46, size: 32, offset: 928)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !179, file: !180, line: 74, baseType: !202, size: 64, offset: 960)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !203, line: 152, baseType: !204)
!203 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!204 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !179, file: !180, line: 77, baseType: !206, size: 16, offset: 1024)
!206 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !179, file: !180, line: 78, baseType: !208, size: 8, offset: 1040)
!208 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !179, file: !180, line: 79, baseType: !210, size: 8, offset: 1048)
!210 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8, elements: !211)
!211 = !{!212}
!212 = !DISubrange(count: 1)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !179, file: !180, line: 81, baseType: !214, size: 64, offset: 1088)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !180, line: 43, baseType: null)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !179, file: !180, line: 89, baseType: !217, size: 64, offset: 1152)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !203, line: 153, baseType: !204)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !179, file: !180, line: 91, baseType: !219, size: 64, offset: 1216)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !180, line: 37, flags: DIFlagFwdDecl)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !179, file: !180, line: 92, baseType: !222, size: 64, offset: 1280)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !180, line: 38, flags: DIFlagFwdDecl)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !179, file: !180, line: 93, baseType: !198, size: 64, offset: 1344)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !179, file: !180, line: 94, baseType: !4, size: 64, offset: 1408)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !179, file: !180, line: 95, baseType: !227, size: 64, offset: 1472)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !228, line: 46, baseType: !229)
!228 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!229 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !179, file: !180, line: 96, baseType: !46, size: 32, offset: 1536)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !179, file: !180, line: 98, baseType: !232, size: 160, offset: 1568)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 20)
!235 = !DILocalVariable(name: "str", scope: !169, file: !1, line: 52, type: !236)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 168, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 21)
!239 = !DILocation(line: 52, column: 7, scope: !169)
!240 = !DILocation(line: 54, column: 2, scope: !169)
!241 = !DILocation(line: 54, column: 14, scope: !169)
!242 = !DILocation(line: 54, column: 8, scope: !169)
!243 = !DILocation(line: 54, column: 24, scope: !169)
!244 = !DILocation(line: 55, column: 30, scope: !169)
!245 = !DILocation(line: 55, column: 21, scope: !169)
!246 = !DILocation(line: 55, column: 3, scope: !169)
!247 = distinct !{!247, !240, !248}
!248 = !DILocation(line: 55, column: 50, scope: !169)
!249 = !DILocation(line: 57, column: 2, scope: !169)
!250 = !DILocation(line: 58, column: 1, scope: !169)
!251 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 60, type: !252, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!252 = !DISubroutineType(types: !253)
!253 = !{!46, !46, !5}
!254 = !DILocalVariable(name: "argC", arg: 1, scope: !251, file: !1, line: 60, type: !46)
!255 = !DILocation(line: 0, scope: !251)
!256 = !DILocalVariable(name: "argV", arg: 2, scope: !251, file: !1, line: 60, type: !5)
!257 = !DILocation(line: 62, column: 12, scope: !258)
!258 = distinct !DILexicalBlock(scope: !251, file: !1, line: 62, column: 8)
!259 = !DILocation(line: 62, column: 8, scope: !251)
!260 = !DILocation(line: 63, column: 42, scope: !258)
!261 = !DILocation(line: 63, column: 3, scope: !258)
!262 = !DILocation(line: 65, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !1, line: 65, column: 6)
!264 = distinct !DILexicalBlock(scope: !258, file: !1, line: 64, column: 6)
!265 = !DILocation(line: 65, column: 6, scope: !263)
!266 = !DILocation(line: 65, column: 25, scope: !263)
!267 = !DILocation(line: 65, column: 6, scope: !264)
!268 = !DILocation(line: 66, column: 16, scope: !263)
!269 = !DILocation(line: 66, column: 4, scope: !263)
!270 = !DILocation(line: 68, column: 31, scope: !263)
!271 = !DILocation(line: 68, column: 22, scope: !263)
!272 = !DILocation(line: 68, column: 4, scope: !263)
!273 = !DILocation(line: 70, column: 2, scope: !251)
