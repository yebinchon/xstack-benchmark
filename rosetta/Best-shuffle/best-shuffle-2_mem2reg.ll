; ModuleID = 'best-shuffle-2.ll'
source_filename = "best-shuffle-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.letter_group_t = type { i8, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@all_letters = common dso_local global [26 x %struct.letter_group_t] zeroinitializer, align 16, !dbg !0
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [22 x i8] c"Abort: Bad string %s\0A\00", align 1
@letters = common dso_local global [26 x %struct.letter_group_t*] zeroinitializer, align 16, !dbg !8
@least_overlap = common dso_local global i32 0, align 4, !dbg !21
@seq_no = common dso_local global i32 0, align 4, !dbg !23
@best = common dso_local global [100 x i8] zeroinitializer, align 16, !dbg !32
@out = common dso_local global [100 x i8] zeroinitializer, align 16, !dbg !25
@orig = common dso_local global [100 x i8] zeroinitializer, align 16, !dbg !30
@.str.1 = private unnamed_addr constant [22 x i8] c"%s -> %s, overlap %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"abracadebra\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"grrrrrr\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"elk\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"seesaw\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count_letters(i8* %s) #0 !dbg !39 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 0, metadata !46, metadata !DIExpression()), !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !49
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !46, metadata !DIExpression()), !dbg !45
  %cmp = icmp slt i32 %i.0, 26, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom, !dbg !53
  %count = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx, i32 0, i32 1, !dbg !55
  store i32 0, i32* %count, align 4, !dbg !56
  %add = add nsw i32 %i.0, 97, !dbg !57
  %conv = trunc i32 %add to i8, !dbg !58
  %idxprom1 = sext i32 %i.0 to i64, !dbg !59
  %arrayidx2 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom1, !dbg !59
  %c3 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx2, i32 0, i32 0, !dbg !60
  store i8 %conv, i8* %c3, align 8, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc, metadata !46, metadata !DIExpression()), !dbg !45
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !67

while.cond:                                       ; preds = %if.end, %for.end
  %s.addr.0 = phi i8* [ %s, %for.end ], [ %incdec.ptr, %if.end ]
  call void @llvm.dbg.value(metadata i8* %s.addr.0, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i8, i8* %s.addr.0, align 1, !dbg !68
  %conv4 = sext i8 %0 to i32, !dbg !68
  %cmp5 = icmp ne i32 %conv4, 0, !dbg !69
  br i1 %cmp5, label %while.body, label %while.end, !dbg !67

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %s.addr.0, i32 1, !dbg !70
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !44, metadata !DIExpression()), !dbg !45
  %1 = load i8, i8* %s.addr.0, align 1, !dbg !72
  %conv7 = sext i8 %1 to i32, !dbg !72
  call void @llvm.dbg.value(metadata i32 %conv7, metadata !46, metadata !DIExpression()), !dbg !45
  %cmp8 = icmp slt i32 %conv7, 97, !dbg !73
  br i1 %cmp8, label %if.then, label %lor.lhs.false, !dbg !75, !cf.info !76

lor.lhs.false:                                    ; preds = %while.body
  %cmp10 = icmp sgt i32 %conv7, 122, !dbg !77
  br i1 %cmp10, label %if.then, label %if.end, !dbg !78, !cf.info !76

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !79
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* %incdec.ptr), !dbg !81
  call void @exit(i32 1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %lor.lhs.false
  %sub = sub nsw i32 %conv7, 97, !dbg !83
  %idxprom12 = sext i32 %sub to i64, !dbg !84
  %arrayidx13 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom12, !dbg !84
  %count14 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx13, i32 0, i32 1, !dbg !85
  %3 = load i32, i32* %count14, align 4, !dbg !86
  %inc15 = add nsw i32 %3, 1, !dbg !86
  store i32 %inc15, i32* %count14, align 4, !dbg !86
  br label %while.cond, !dbg !67, !llvm.loop !87

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !46, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 0, metadata !89, metadata !DIExpression()), !dbg !45
  br label %for.cond16, !dbg !90

for.cond16:                                       ; preds = %for.inc28, %while.end
  %c.0 = phi i32 [ 0, %while.end ], [ %c.1, %for.inc28 ], !dbg !92
  %i.1 = phi i32 [ 0, %while.end ], [ %inc29, %for.inc28 ], !dbg !92
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !46, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !89, metadata !DIExpression()), !dbg !45
  %cmp17 = icmp slt i32 %i.1, 26, !dbg !93
  br i1 %cmp17, label %for.body19, label %for.end30, !dbg !95

for.body19:                                       ; preds = %for.cond16
  %idxprom20 = sext i32 %i.1 to i64, !dbg !96
  %arrayidx21 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom20, !dbg !96
  %count22 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx21, i32 0, i32 1, !dbg !98
  %4 = load i32, i32* %count22, align 4, !dbg !98
  %tobool = icmp ne i32 %4, 0, !dbg !96
  br i1 %tobool, label %if.then23, label %if.end27, !dbg !99, !cf.info !76

if.then23:                                        ; preds = %for.body19
  %idx.ext = sext i32 %i.1 to i64, !dbg !100
  %add.ptr = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* getelementptr inbounds ([26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 0), i64 %idx.ext, !dbg !100
  %inc24 = add nsw i32 %c.0, 1, !dbg !101
  call void @llvm.dbg.value(metadata i32 %inc24, metadata !89, metadata !DIExpression()), !dbg !45
  %idxprom25 = sext i32 %c.0 to i64, !dbg !102
  %arrayidx26 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom25, !dbg !102
  store %struct.letter_group_t* %add.ptr, %struct.letter_group_t** %arrayidx26, align 8, !dbg !103
  br label %if.end27, !dbg !102

if.end27:                                         ; preds = %if.then23, %for.body19
  %c.1 = phi i32 [ %inc24, %if.then23 ], [ %c.0, %for.body19 ], !dbg !92
  call void @llvm.dbg.value(metadata i32 %c.1, metadata !89, metadata !DIExpression()), !dbg !45
  br label %for.inc28, !dbg !98

for.inc28:                                        ; preds = %if.end27
  %inc29 = add nsw i32 %i.1, 1, !dbg !104
  call void @llvm.dbg.value(metadata i32 %inc29, metadata !46, metadata !DIExpression()), !dbg !45
  br label %for.cond16, !dbg !105, !llvm.loop !106

for.end30:                                        ; preds = %for.cond16
  ret i32 %c.0, !dbg !108
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @permutate(i32 %n_letters, i32 %pos, i32 %overlap) #0 !dbg !109 {
entry:
  call void @llvm.dbg.value(metadata i32 %n_letters, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i32 %pos, metadata !114, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i32 %overlap, metadata !115, metadata !DIExpression()), !dbg !113
  %cmp = icmp slt i32 %pos, 0, !dbg !116
  br i1 %cmp, label %if.then, label %if.end9, !dbg !118, !cf.info !76

if.then:                                          ; preds = %entry
  %0 = load i32, i32* @least_overlap, align 4, !dbg !119
  %cmp1 = icmp slt i32 %overlap, %0, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !123, !cf.info !76

if.then2:                                         ; preds = %if.then
  store i32 %overlap, i32* @least_overlap, align 4, !dbg !124
  store i32 0, i32* @seq_no, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then2, %if.then
  %call = call i32 @rand() #7, !dbg !128
  %conv = sitofp i32 %call to double, !dbg !130
  %div = fdiv double %conv, 0x41E0000000000000, !dbg !131
  %1 = load i32, i32* @seq_no, align 4, !dbg !132
  %inc = add nsw i32 %1, 1, !dbg !132
  store i32 %inc, i32* @seq_no, align 4, !dbg !132
  %conv3 = sitofp i32 %inc to double, !dbg !132
  %mul = fmul double %div, %conv3, !dbg !133
  %cmp4 = fcmp ole double %mul, 1.000000e+00, !dbg !134
  br i1 %cmp4, label %if.then6, label %if.end8, !dbg !135, !cf.info !76

if.then6:                                         ; preds = %if.end
  %call7 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @out, i64 0, i64 0)) #7, !dbg !136
  br label %if.end8, !dbg !136

if.end8:                                          ; preds = %if.then6, %if.end
  br label %return, !dbg !137

if.end9:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !138, metadata !DIExpression()), !dbg !113
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end9
  %i.0 = phi i32 [ 0, %if.end9 ], [ %inc38, %for.inc ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !138, metadata !DIExpression()), !dbg !113
  %cmp10 = icmp slt i32 %i.0, %n_letters, !dbg !142
  br i1 %cmp10, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom, !dbg !145
  %2 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx, align 8, !dbg !145
  %count = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %2, i32 0, i32 1, !dbg !148
  %3 = load i32, i32* %count, align 4, !dbg !148
  %tobool = icmp ne i32 %3, 0, !dbg !145
  br i1 %tobool, label %if.end13, label %if.then12, !dbg !149, !cf.info !76

if.then12:                                        ; preds = %for.body
  br label %for.inc, !dbg !150

if.end13:                                         ; preds = %for.body
  %idxprom14 = sext i32 %i.0 to i64, !dbg !151
  %arrayidx15 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom14, !dbg !151
  %4 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx15, align 8, !dbg !151
  %c = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %4, i32 0, i32 0, !dbg !152
  %5 = load i8, i8* %c, align 4, !dbg !152
  %idxprom16 = sext i32 %pos to i64, !dbg !153
  %arrayidx17 = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom16, !dbg !153
  store i8 %5, i8* %arrayidx17, align 1, !dbg !154
  %idxprom18 = sext i32 %i.0 to i64, !dbg !155
  %arrayidx19 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom18, !dbg !155
  %6 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx19, align 8, !dbg !155
  %count20 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %6, i32 0, i32 1, !dbg !156
  %7 = load i32, i32* %count20, align 4, !dbg !157
  %dec = add nsw i32 %7, -1, !dbg !157
  store i32 %dec, i32* %count20, align 4, !dbg !157
  %idxprom21 = sext i32 %i.0 to i64, !dbg !158
  %arrayidx22 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom21, !dbg !158
  %8 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx22, align 8, !dbg !158
  %c23 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %8, i32 0, i32 0, !dbg !159
  %9 = load i8, i8* %c23, align 4, !dbg !159
  %conv24 = sext i8 %9 to i32, !dbg !158
  %idxprom25 = sext i32 %pos to i64, !dbg !160
  %arrayidx26 = getelementptr inbounds [100 x i8], [100 x i8]* @orig, i64 0, i64 %idxprom25, !dbg !160
  %10 = load i8, i8* %arrayidx26, align 1, !dbg !160
  %conv27 = sext i8 %10 to i32, !dbg !160
  %cmp28 = icmp eq i32 %conv24, %conv27, !dbg !161
  br i1 %cmp28, label %cond.true, label %cond.false, !dbg !162

cond.true:                                        ; preds = %if.end13
  %add = add nsw i32 %overlap, 1, !dbg !163
  br label %cond.end, !dbg !162

cond.false:                                       ; preds = %if.end13
  br label %cond.end, !dbg !162

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %overlap, %cond.false ], !dbg !162
  call void @llvm.dbg.value(metadata i32 %cond, metadata !164, metadata !DIExpression()), !dbg !113
  %11 = load i32, i32* @least_overlap, align 4, !dbg !165
  %cmp30 = icmp sle i32 %cond, %11, !dbg !167
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !168, !cf.info !76

if.then32:                                        ; preds = %cond.end
  %sub = sub nsw i32 %pos, 1, !dbg !169
  call void @permutate(i32 %n_letters, i32 %sub, i32 %cond), !dbg !170
  br label %if.end33, !dbg !170

if.end33:                                         ; preds = %if.then32, %cond.end
  %idxprom34 = sext i32 %i.0 to i64, !dbg !171
  %arrayidx35 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom34, !dbg !171
  %12 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx35, align 8, !dbg !171
  %count36 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %12, i32 0, i32 1, !dbg !172
  %13 = load i32, i32* %count36, align 4, !dbg !173
  %inc37 = add nsw i32 %13, 1, !dbg !173
  store i32 %inc37, i32* %count36, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %if.end33, %if.then12
  %inc38 = add nsw i32 %i.0, 1, !dbg !175
  call void @llvm.dbg.value(metadata i32 %inc38, metadata !138, metadata !DIExpression()), !dbg !113
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !179

return:                                           ; preds = %for.end, %if.end8
  ret void, !dbg !180
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_string(i8* %str) #0 !dbg !181 {
entry:
  call void @llvm.dbg.value(metadata i8* %str, metadata !184, metadata !DIExpression()), !dbg !185
  %call = call i64 @strlen(i8* %str) #8, !dbg !186
  %conv = trunc i64 %call to i32, !dbg !186
  store i32 %conv, i32* @least_overlap, align 4, !dbg !187
  %call1 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @orig, i64 0, i64 0), i8* %str) #7, !dbg !188
  store i32 0, i32* @seq_no, align 4, !dbg !189
  %0 = load i32, i32* @least_overlap, align 4, !dbg !190
  %idxprom = sext i32 %0 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom, !dbg !191
  store i8 0, i8* %arrayidx, align 1, !dbg !192
  %1 = load i32, i32* @least_overlap, align 4, !dbg !193
  %inc = add nsw i32 %1, 1, !dbg !193
  store i32 %inc, i32* @least_overlap, align 4, !dbg !193
  %call2 = call i32 @count_letters(i8* %str), !dbg !194
  %2 = load i32, i32* @least_overlap, align 4, !dbg !195
  %sub = sub nsw i32 %2, 2, !dbg !196
  call void @permutate(i32 %call2, i32 %sub, i32 0), !dbg !197
  %3 = load i32, i32* @least_overlap, align 4, !dbg !198
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* %str, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i32 %3), !dbg !199
  ret void, !dbg !200
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !201 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !204
  call void @srand(i32 %call) #7, !dbg !205
  call void @do_string(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !206
  call void @do_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !207
  call void @do_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)), !dbg !208
  call void @do_string(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0)), !dbg !209
  call void @do_string(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)), !dbg !210
  ret i32 0, !dbg !211
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

declare dso_local i32 @time(...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "all_letters", scope: !2, file: !3, line: 10, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "best-shuffle-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{!0, !8, !21, !23, !25, !30, !32}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "letters", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1664, elements: !19)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_p", file: !3, line: 8, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "letter_group_t", file: !3, line: 5, size: 64, elements: !14)
!14 = !{!15, !17}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !13, file: !3, line: 6, baseType: !16, size: 8)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !13, file: !3, line: 7, baseType: !18, size: 32, offset: 32)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{!20}
!20 = !DISubrange(count: 26)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "least_overlap", scope: !2, file: !3, line: 41, type: !18, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "seq_no", scope: !2, file: !3, line: 41, type: !18, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "out", scope: !2, file: !3, line: 42, type: !27, isLocal: false, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "orig", scope: !2, file: !3, line: 42, type: !27, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "best", scope: !2, file: !3, line: 42, type: !27, isLocal: false, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1664, elements: !19)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!39 = distinct !DISubprogram(name: "count_letters", scope: !3, file: !3, line: 16, type: !40, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!18, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!44 = !DILocalVariable(name: "s", arg: 1, scope: !39, file: !3, line: 16, type: !42)
!45 = !DILocation(line: 0, scope: !39)
!46 = !DILocalVariable(name: "i", scope: !39, file: !3, line: 18, type: !18)
!47 = !DILocation(line: 19, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !3, line: 19, column: 2)
!49 = !DILocation(line: 0, scope: !48)
!50 = !DILocation(line: 19, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !3, line: 19, column: 2)
!52 = !DILocation(line: 19, column: 2, scope: !48)
!53 = !DILocation(line: 20, column: 3, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 19, column: 27)
!55 = !DILocation(line: 20, column: 18, scope: !54)
!56 = !DILocation(line: 20, column: 24, scope: !54)
!57 = !DILocation(line: 21, column: 24, scope: !54)
!58 = !DILocation(line: 21, column: 22, scope: !54)
!59 = !DILocation(line: 21, column: 3, scope: !54)
!60 = !DILocation(line: 21, column: 18, scope: !54)
!61 = !DILocation(line: 21, column: 20, scope: !54)
!62 = !DILocation(line: 22, column: 2, scope: !54)
!63 = !DILocation(line: 19, column: 23, scope: !51)
!64 = !DILocation(line: 19, column: 2, scope: !51)
!65 = distinct !{!65, !52, !66}
!66 = !DILocation(line: 22, column: 2, scope: !48)
!67 = !DILocation(line: 23, column: 2, scope: !39)
!68 = !DILocation(line: 23, column: 9, scope: !39)
!69 = !DILocation(line: 23, column: 12, scope: !39)
!70 = !DILocation(line: 24, column: 10, scope: !71)
!71 = distinct !DILexicalBlock(scope: !39, file: !3, line: 23, column: 21)
!72 = !DILocation(line: 24, column: 7, scope: !71)
!73 = !DILocation(line: 27, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !3, line: 27, column: 7)
!75 = !DILocation(line: 27, column: 15, scope: !74)
!76 = !{!"if"}
!77 = !DILocation(line: 27, column: 20, scope: !74)
!78 = !DILocation(line: 27, column: 7, scope: !71)
!79 = !DILocation(line: 28, column: 12, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !3, line: 27, column: 27)
!81 = !DILocation(line: 28, column: 4, scope: !80)
!82 = !DILocation(line: 29, column: 4, scope: !80)
!83 = !DILocation(line: 32, column: 17, scope: !71)
!84 = !DILocation(line: 32, column: 3, scope: !71)
!85 = !DILocation(line: 32, column: 24, scope: !71)
!86 = !DILocation(line: 32, column: 29, scope: !71)
!87 = distinct !{!87, !67, !88}
!88 = !DILocation(line: 33, column: 2, scope: !39)
!89 = !DILocalVariable(name: "c", scope: !39, file: !3, line: 18, type: !18)
!90 = !DILocation(line: 34, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !39, file: !3, line: 34, column: 2)
!92 = !DILocation(line: 0, scope: !91)
!93 = !DILocation(line: 34, column: 23, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 34, column: 2)
!95 = !DILocation(line: 34, column: 2, scope: !91)
!96 = !DILocation(line: 35, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 35, column: 7)
!98 = !DILocation(line: 35, column: 22, scope: !97)
!99 = !DILocation(line: 35, column: 7, scope: !94)
!100 = !DILocation(line: 36, column: 31, scope: !97)
!101 = !DILocation(line: 36, column: 13, scope: !97)
!102 = !DILocation(line: 36, column: 4, scope: !97)
!103 = !DILocation(line: 36, column: 17, scope: !97)
!104 = !DILocation(line: 34, column: 30, scope: !94)
!105 = !DILocation(line: 34, column: 2, scope: !94)
!106 = distinct !{!106, !95, !107}
!107 = !DILocation(line: 36, column: 33, scope: !91)
!108 = !DILocation(line: 38, column: 2, scope: !39)
!109 = distinct !DISubprogram(name: "permutate", scope: !3, file: !3, line: 44, type: !110, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DISubroutineType(types: !111)
!111 = !{null, !18, !18, !18}
!112 = !DILocalVariable(name: "n_letters", arg: 1, scope: !109, file: !3, line: 44, type: !18)
!113 = !DILocation(line: 0, scope: !109)
!114 = !DILocalVariable(name: "pos", arg: 2, scope: !109, file: !3, line: 44, type: !18)
!115 = !DILocalVariable(name: "overlap", arg: 3, scope: !109, file: !3, line: 44, type: !18)
!116 = !DILocation(line: 47, column: 10, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !3, line: 47, column: 6)
!118 = !DILocation(line: 47, column: 6, scope: !109)
!119 = !DILocation(line: 52, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !3, line: 52, column: 7)
!121 = distinct !DILexicalBlock(scope: !117, file: !3, line: 47, column: 15)
!122 = !DILocation(line: 52, column: 15, scope: !120)
!123 = !DILocation(line: 52, column: 7, scope: !121)
!124 = !DILocation(line: 53, column: 18, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !3, line: 52, column: 32)
!126 = !DILocation(line: 54, column: 11, scope: !125)
!127 = !DILocation(line: 55, column: 3, scope: !125)
!128 = !DILocation(line: 61, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !3, line: 61, column: 8)
!130 = !DILocation(line: 61, column: 8, scope: !129)
!131 = !DILocation(line: 61, column: 23, scope: !129)
!132 = !DILocation(line: 61, column: 44, scope: !129)
!133 = !DILocation(line: 61, column: 42, scope: !129)
!134 = !DILocation(line: 61, column: 53, scope: !129)
!135 = !DILocation(line: 61, column: 8, scope: !121)
!136 = !DILocation(line: 62, column: 4, scope: !129)
!137 = !DILocation(line: 64, column: 3, scope: !121)
!138 = !DILocalVariable(name: "i", scope: !109, file: !3, line: 46, type: !18)
!139 = !DILocation(line: 68, column: 7, scope: !140)
!140 = distinct !DILexicalBlock(scope: !109, file: !3, line: 68, column: 2)
!141 = !DILocation(line: 0, scope: !140)
!142 = !DILocation(line: 68, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !3, line: 68, column: 2)
!144 = !DILocation(line: 68, column: 2, scope: !140)
!145 = !DILocation(line: 69, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !3, line: 69, column: 7)
!147 = distinct !DILexicalBlock(scope: !143, file: !3, line: 68, column: 34)
!148 = !DILocation(line: 69, column: 20, scope: !146)
!149 = !DILocation(line: 69, column: 7, scope: !147)
!150 = !DILocation(line: 69, column: 27, scope: !146)
!151 = !DILocation(line: 71, column: 14, scope: !147)
!152 = !DILocation(line: 71, column: 26, scope: !147)
!153 = !DILocation(line: 71, column: 3, scope: !147)
!154 = !DILocation(line: 71, column: 12, scope: !147)
!155 = !DILocation(line: 72, column: 3, scope: !147)
!156 = !DILocation(line: 72, column: 15, scope: !147)
!157 = !DILocation(line: 72, column: 21, scope: !147)
!158 = !DILocation(line: 73, column: 9, scope: !147)
!159 = !DILocation(line: 73, column: 21, scope: !147)
!160 = !DILocation(line: 73, column: 26, scope: !147)
!161 = !DILocation(line: 73, column: 23, scope: !147)
!162 = !DILocation(line: 73, column: 8, scope: !147)
!163 = !DILocation(line: 73, column: 47, scope: !147)
!164 = !DILocalVariable(name: "ol", scope: !109, file: !3, line: 46, type: !18)
!165 = !DILocation(line: 76, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !147, file: !3, line: 76, column: 7)
!167 = !DILocation(line: 76, column: 10, scope: !166)
!168 = !DILocation(line: 76, column: 7, scope: !147)
!169 = !DILocation(line: 77, column: 29, scope: !166)
!170 = !DILocation(line: 77, column: 4, scope: !166)
!171 = !DILocation(line: 79, column: 3, scope: !147)
!172 = !DILocation(line: 79, column: 15, scope: !147)
!173 = !DILocation(line: 79, column: 21, scope: !147)
!174 = !DILocation(line: 80, column: 2, scope: !147)
!175 = !DILocation(line: 68, column: 30, scope: !143)
!176 = !DILocation(line: 68, column: 2, scope: !143)
!177 = distinct !{!177, !144, !178}
!178 = !DILocation(line: 80, column: 2, scope: !140)
!179 = !DILocation(line: 81, column: 2, scope: !109)
!180 = !DILocation(line: 82, column: 1, scope: !109)
!181 = distinct !DISubprogram(name: "do_string", scope: !3, file: !3, line: 84, type: !182, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DISubroutineType(types: !183)
!183 = !{null, !42}
!184 = !DILocalVariable(name: "str", arg: 1, scope: !181, file: !3, line: 84, type: !42)
!185 = !DILocation(line: 0, scope: !181)
!186 = !DILocation(line: 86, column: 18, scope: !181)
!187 = !DILocation(line: 86, column: 16, scope: !181)
!188 = !DILocation(line: 87, column: 2, scope: !181)
!189 = !DILocation(line: 89, column: 9, scope: !181)
!190 = !DILocation(line: 90, column: 6, scope: !181)
!191 = !DILocation(line: 90, column: 2, scope: !181)
!192 = !DILocation(line: 90, column: 21, scope: !181)
!193 = !DILocation(line: 91, column: 16, scope: !181)
!194 = !DILocation(line: 93, column: 12, scope: !181)
!195 = !DILocation(line: 93, column: 32, scope: !181)
!196 = !DILocation(line: 93, column: 46, scope: !181)
!197 = !DILocation(line: 93, column: 2, scope: !181)
!198 = !DILocation(line: 94, column: 46, scope: !181)
!199 = !DILocation(line: 94, column: 2, scope: !181)
!200 = !DILocation(line: 95, column: 1, scope: !181)
!201 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 97, type: !202, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DISubroutineType(types: !203)
!203 = !{!18}
!204 = !DILocation(line: 99, column: 8, scope: !201)
!205 = !DILocation(line: 99, column: 2, scope: !201)
!206 = !DILocation(line: 100, column: 2, scope: !201)
!207 = !DILocation(line: 101, column: 2, scope: !201)
!208 = !DILocation(line: 102, column: 2, scope: !201)
!209 = !DILocation(line: 103, column: 2, scope: !201)
!210 = !DILocation(line: 104, column: 2, scope: !201)
!211 = !DILocation(line: 105, column: 2, scope: !201)
