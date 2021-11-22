; ModuleID = 'best-shuffle-2.c'
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
  %s.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %i, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %c, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !53
  %cmp = icmp slt i32 %0, 26, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !57
  %idxprom = sext i32 %1 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom, !dbg !59
  %count = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx, i32 0, i32 1, !dbg !60
  store i32 0, i32* %count, align 4, !dbg !61
  %2 = load i32, i32* %i, align 4, !dbg !62
  %add = add nsw i32 %2, 97, !dbg !63
  %conv = trunc i32 %add to i8, !dbg !62
  %3 = load i32, i32* %i, align 4, !dbg !64
  %idxprom1 = sext i32 %3 to i64, !dbg !65
  %arrayidx2 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom1, !dbg !65
  %c3 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx2, i32 0, i32 0, !dbg !66
  store i8 %conv, i8* %c3, align 8, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !69
  %inc = add nsw i32 %4, 1, !dbg !69
  store i32 %inc, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !73

while.cond:                                       ; preds = %if.end, %for.end
  %5 = load i8*, i8** %s.addr, align 8, !dbg !74
  %6 = load i8, i8* %5, align 1, !dbg !75
  %conv4 = sext i8 %6 to i32, !dbg !75
  %cmp5 = icmp ne i32 %conv4, 0, !dbg !76
  br i1 %cmp5, label %while.body, label %while.end, !dbg !73

while.body:                                       ; preds = %while.cond
  %7 = load i8*, i8** %s.addr, align 8, !dbg !77
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !77
  store i8* %incdec.ptr, i8** %s.addr, align 8, !dbg !77
  %8 = load i8, i8* %7, align 1, !dbg !79
  %conv7 = sext i8 %8 to i32, !dbg !79
  store i32 %conv7, i32* %i, align 4, !dbg !80
  %9 = load i32, i32* %i, align 4, !dbg !81
  %cmp8 = icmp slt i32 %9, 97, !dbg !83
  br i1 %cmp8, label %if.then, label %lor.lhs.false, !dbg !84, !cf.info !85

lor.lhs.false:                                    ; preds = %while.body
  %10 = load i32, i32* %i, align 4, !dbg !86
  %cmp10 = icmp sgt i32 %10, 122, !dbg !87
  br i1 %cmp10, label %if.then, label %if.end, !dbg !88, !cf.info !85

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !89
  %12 = load i8*, i8** %s.addr, align 8, !dbg !91
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* %12), !dbg !92
  call void @exit(i32 1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i32, i32* %i, align 4, !dbg !94
  %sub = sub nsw i32 %13, 97, !dbg !95
  %idxprom12 = sext i32 %sub to i64, !dbg !96
  %arrayidx13 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom12, !dbg !96
  %count14 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx13, i32 0, i32 1, !dbg !97
  %14 = load i32, i32* %count14, align 4, !dbg !98
  %inc15 = add nsw i32 %14, 1, !dbg !98
  store i32 %inc15, i32* %count14, align 4, !dbg !98
  br label %while.cond, !dbg !73, !llvm.loop !99

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %i, align 4, !dbg !101
  store i32 0, i32* %c, align 4, !dbg !103
  br label %for.cond16, !dbg !104

for.cond16:                                       ; preds = %for.inc28, %while.end
  %15 = load i32, i32* %i, align 4, !dbg !105
  %cmp17 = icmp slt i32 %15, 26, !dbg !107
  br i1 %cmp17, label %for.body19, label %for.end30, !dbg !108

for.body19:                                       ; preds = %for.cond16
  %16 = load i32, i32* %i, align 4, !dbg !109
  %idxprom20 = sext i32 %16 to i64, !dbg !111
  %arrayidx21 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom20, !dbg !111
  %count22 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx21, i32 0, i32 1, !dbg !112
  %17 = load i32, i32* %count22, align 4, !dbg !112
  %tobool = icmp ne i32 %17, 0, !dbg !111
  br i1 %tobool, label %if.then23, label %if.end27, !dbg !113, !cf.info !85

if.then23:                                        ; preds = %for.body19
  %18 = load i32, i32* %i, align 4, !dbg !114
  %idx.ext = sext i32 %18 to i64, !dbg !115
  %add.ptr = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* getelementptr inbounds ([26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 0), i64 %idx.ext, !dbg !115
  %19 = load i32, i32* %c, align 4, !dbg !116
  %inc24 = add nsw i32 %19, 1, !dbg !116
  store i32 %inc24, i32* %c, align 4, !dbg !116
  %idxprom25 = sext i32 %19 to i64, !dbg !117
  %arrayidx26 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom25, !dbg !117
  store %struct.letter_group_t* %add.ptr, %struct.letter_group_t** %arrayidx26, align 8, !dbg !118
  br label %if.end27, !dbg !117

if.end27:                                         ; preds = %if.then23, %for.body19
  br label %for.inc28, !dbg !112

for.inc28:                                        ; preds = %if.end27
  %20 = load i32, i32* %i, align 4, !dbg !119
  %inc29 = add nsw i32 %20, 1, !dbg !119
  store i32 %inc29, i32* %i, align 4, !dbg !119
  br label %for.cond16, !dbg !120, !llvm.loop !121

for.end30:                                        ; preds = %for.cond16
  %21 = load i32, i32* %c, align 4, !dbg !123
  ret i32 %21, !dbg !124
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @permutate(i32 %n_letters, i32 %pos, i32 %overlap) #0 !dbg !125 {
entry:
  %n_letters.addr = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  %overlap.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ol = alloca i32, align 4
  store i32 %n_letters, i32* %n_letters.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_letters.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i32 %pos, i32* %pos.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pos.addr, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 %overlap, i32* %overlap.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %overlap.addr, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32* %ol, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = load i32, i32* %pos.addr, align 4, !dbg !138
  %cmp = icmp slt i32 %0, 0, !dbg !140
  br i1 %cmp, label %if.then, label %if.end9, !dbg !141, !cf.info !85

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %overlap.addr, align 4, !dbg !142
  %2 = load i32, i32* @least_overlap, align 4, !dbg !145
  %cmp1 = icmp slt i32 %1, %2, !dbg !146
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !147, !cf.info !85

if.then2:                                         ; preds = %if.then
  %3 = load i32, i32* %overlap.addr, align 4, !dbg !148
  store i32 %3, i32* @least_overlap, align 4, !dbg !150
  store i32 0, i32* @seq_no, align 4, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then2, %if.then
  %call = call i32 @rand() #7, !dbg !153
  %conv = sitofp i32 %call to double, !dbg !155
  %div = fdiv double %conv, 0x41E0000000000000, !dbg !156
  %4 = load i32, i32* @seq_no, align 4, !dbg !157
  %inc = add nsw i32 %4, 1, !dbg !157
  store i32 %inc, i32* @seq_no, align 4, !dbg !157
  %conv3 = sitofp i32 %inc to double, !dbg !157
  %mul = fmul double %div, %conv3, !dbg !158
  %cmp4 = fcmp ole double %mul, 1.000000e+00, !dbg !159
  br i1 %cmp4, label %if.then6, label %if.end8, !dbg !160, !cf.info !85

if.then6:                                         ; preds = %if.end
  %call7 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @out, i64 0, i64 0)) #7, !dbg !161
  br label %if.end8, !dbg !161

if.end8:                                          ; preds = %if.then6, %if.end
  br label %return, !dbg !162

if.end9:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end9
  %5 = load i32, i32* %i, align 4, !dbg !166
  %6 = load i32, i32* %n_letters.addr, align 4, !dbg !168
  %cmp10 = icmp slt i32 %5, %6, !dbg !169
  br i1 %cmp10, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !171
  %idxprom = sext i32 %7 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom, !dbg !174
  %8 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx, align 8, !dbg !174
  %count = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %8, i32 0, i32 1, !dbg !175
  %9 = load i32, i32* %count, align 4, !dbg !175
  %tobool = icmp ne i32 %9, 0, !dbg !174
  br i1 %tobool, label %if.end13, label %if.then12, !dbg !176, !cf.info !85

if.then12:                                        ; preds = %for.body
  br label %for.inc, !dbg !177

if.end13:                                         ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !178
  %idxprom14 = sext i32 %10 to i64, !dbg !179
  %arrayidx15 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom14, !dbg !179
  %11 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx15, align 8, !dbg !179
  %c = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %11, i32 0, i32 0, !dbg !180
  %12 = load i8, i8* %c, align 4, !dbg !180
  %13 = load i32, i32* %pos.addr, align 4, !dbg !181
  %idxprom16 = sext i32 %13 to i64, !dbg !182
  %arrayidx17 = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom16, !dbg !182
  store i8 %12, i8* %arrayidx17, align 1, !dbg !183
  %14 = load i32, i32* %i, align 4, !dbg !184
  %idxprom18 = sext i32 %14 to i64, !dbg !185
  %arrayidx19 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom18, !dbg !185
  %15 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx19, align 8, !dbg !185
  %count20 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %15, i32 0, i32 1, !dbg !186
  %16 = load i32, i32* %count20, align 4, !dbg !187
  %dec = add nsw i32 %16, -1, !dbg !187
  store i32 %dec, i32* %count20, align 4, !dbg !187
  %17 = load i32, i32* %i, align 4, !dbg !188
  %idxprom21 = sext i32 %17 to i64, !dbg !189
  %arrayidx22 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom21, !dbg !189
  %18 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx22, align 8, !dbg !189
  %c23 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %18, i32 0, i32 0, !dbg !190
  %19 = load i8, i8* %c23, align 4, !dbg !190
  %conv24 = sext i8 %19 to i32, !dbg !189
  %20 = load i32, i32* %pos.addr, align 4, !dbg !191
  %idxprom25 = sext i32 %20 to i64, !dbg !192
  %arrayidx26 = getelementptr inbounds [100 x i8], [100 x i8]* @orig, i64 0, i64 %idxprom25, !dbg !192
  %21 = load i8, i8* %arrayidx26, align 1, !dbg !192
  %conv27 = sext i8 %21 to i32, !dbg !192
  %cmp28 = icmp eq i32 %conv24, %conv27, !dbg !193
  br i1 %cmp28, label %cond.true, label %cond.false, !dbg !194

cond.true:                                        ; preds = %if.end13
  %22 = load i32, i32* %overlap.addr, align 4, !dbg !195
  %add = add nsw i32 %22, 1, !dbg !196
  br label %cond.end, !dbg !194

cond.false:                                       ; preds = %if.end13
  %23 = load i32, i32* %overlap.addr, align 4, !dbg !197
  br label %cond.end, !dbg !194

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %23, %cond.false ], !dbg !194
  store i32 %cond, i32* %ol, align 4, !dbg !198
  %24 = load i32, i32* %ol, align 4, !dbg !199
  %25 = load i32, i32* @least_overlap, align 4, !dbg !201
  %cmp30 = icmp sle i32 %24, %25, !dbg !202
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !203, !cf.info !85

if.then32:                                        ; preds = %cond.end
  %26 = load i32, i32* %n_letters.addr, align 4, !dbg !204
  %27 = load i32, i32* %pos.addr, align 4, !dbg !205
  %sub = sub nsw i32 %27, 1, !dbg !206
  %28 = load i32, i32* %ol, align 4, !dbg !207
  call void @permutate(i32 %26, i32 %sub, i32 %28), !dbg !208
  br label %if.end33, !dbg !208

if.end33:                                         ; preds = %if.then32, %cond.end
  %29 = load i32, i32* %i, align 4, !dbg !209
  %idxprom34 = sext i32 %29 to i64, !dbg !210
  %arrayidx35 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom34, !dbg !210
  %30 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx35, align 8, !dbg !210
  %count36 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %30, i32 0, i32 1, !dbg !211
  %31 = load i32, i32* %count36, align 4, !dbg !212
  %inc37 = add nsw i32 %31, 1, !dbg !212
  store i32 %inc37, i32* %count36, align 4, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %if.end33, %if.then12
  %32 = load i32, i32* %i, align 4, !dbg !214
  %inc38 = add nsw i32 %32, 1, !dbg !214
  store i32 %inc38, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !218

return:                                           ; preds = %for.end, %if.end8
  ret void, !dbg !219
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_string(i8* %str) #0 !dbg !220 {
entry:
  %str.addr = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !223, metadata !DIExpression()), !dbg !224
  %0 = load i8*, i8** %str.addr, align 8, !dbg !225
  %call = call i64 @strlen(i8* %0) #8, !dbg !226
  %conv = trunc i64 %call to i32, !dbg !226
  store i32 %conv, i32* @least_overlap, align 4, !dbg !227
  %1 = load i8*, i8** %str.addr, align 8, !dbg !228
  %call1 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @orig, i64 0, i64 0), i8* %1) #7, !dbg !229
  store i32 0, i32* @seq_no, align 4, !dbg !230
  %2 = load i32, i32* @least_overlap, align 4, !dbg !231
  %idxprom = sext i32 %2 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom, !dbg !232
  store i8 0, i8* %arrayidx, align 1, !dbg !233
  %3 = load i32, i32* @least_overlap, align 4, !dbg !234
  %inc = add nsw i32 %3, 1, !dbg !234
  store i32 %inc, i32* @least_overlap, align 4, !dbg !234
  %4 = load i8*, i8** %str.addr, align 8, !dbg !235
  %call2 = call i32 @count_letters(i8* %4), !dbg !236
  %5 = load i32, i32* @least_overlap, align 4, !dbg !237
  %sub = sub nsw i32 %5, 2, !dbg !238
  call void @permutate(i32 %call2, i32 %sub, i32 0), !dbg !239
  %6 = load i8*, i8** %str.addr, align 8, !dbg !240
  %7 = load i32, i32* @least_overlap, align 4, !dbg !241
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* %6, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i32 %7), !dbg !242
  ret void, !dbg !243
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !244 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !247
  call void @srand(i32 %call) #7, !dbg !248
  call void @do_string(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !249
  call void @do_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !250
  call void @do_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)), !dbg !251
  call void @do_string(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0)), !dbg !252
  call void @do_string(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)), !dbg !253
  ret i32 0, !dbg !254
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

declare dso_local i32 @time(...) #2

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
!45 = !DILocation(line: 16, column: 31, scope: !39)
!46 = !DILocalVariable(name: "i", scope: !39, file: !3, line: 18, type: !18)
!47 = !DILocation(line: 18, column: 6, scope: !39)
!48 = !DILocalVariable(name: "c", scope: !39, file: !3, line: 18, type: !18)
!49 = !DILocation(line: 18, column: 9, scope: !39)
!50 = !DILocation(line: 19, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !39, file: !3, line: 19, column: 2)
!52 = !DILocation(line: 19, column: 7, scope: !51)
!53 = !DILocation(line: 19, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 19, column: 2)
!55 = !DILocation(line: 19, column: 16, scope: !54)
!56 = !DILocation(line: 19, column: 2, scope: !51)
!57 = !DILocation(line: 20, column: 15, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 19, column: 27)
!59 = !DILocation(line: 20, column: 3, scope: !58)
!60 = !DILocation(line: 20, column: 18, scope: !58)
!61 = !DILocation(line: 20, column: 24, scope: !58)
!62 = !DILocation(line: 21, column: 22, scope: !58)
!63 = !DILocation(line: 21, column: 24, scope: !58)
!64 = !DILocation(line: 21, column: 15, scope: !58)
!65 = !DILocation(line: 21, column: 3, scope: !58)
!66 = !DILocation(line: 21, column: 18, scope: !58)
!67 = !DILocation(line: 21, column: 20, scope: !58)
!68 = !DILocation(line: 22, column: 2, scope: !58)
!69 = !DILocation(line: 19, column: 23, scope: !54)
!70 = !DILocation(line: 19, column: 2, scope: !54)
!71 = distinct !{!71, !56, !72}
!72 = !DILocation(line: 22, column: 2, scope: !51)
!73 = !DILocation(line: 23, column: 2, scope: !39)
!74 = !DILocation(line: 23, column: 10, scope: !39)
!75 = !DILocation(line: 23, column: 9, scope: !39)
!76 = !DILocation(line: 23, column: 12, scope: !39)
!77 = !DILocation(line: 24, column: 10, scope: !78)
!78 = distinct !DILexicalBlock(scope: !39, file: !3, line: 23, column: 21)
!79 = !DILocation(line: 24, column: 7, scope: !78)
!80 = !DILocation(line: 24, column: 5, scope: !78)
!81 = !DILocation(line: 27, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 27, column: 7)
!83 = !DILocation(line: 27, column: 9, scope: !82)
!84 = !DILocation(line: 27, column: 15, scope: !82)
!85 = !{!"if"}
!86 = !DILocation(line: 27, column: 18, scope: !82)
!87 = !DILocation(line: 27, column: 20, scope: !82)
!88 = !DILocation(line: 27, column: 7, scope: !78)
!89 = !DILocation(line: 28, column: 12, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !3, line: 27, column: 27)
!91 = !DILocation(line: 28, column: 46, scope: !90)
!92 = !DILocation(line: 28, column: 4, scope: !90)
!93 = !DILocation(line: 29, column: 4, scope: !90)
!94 = !DILocation(line: 32, column: 15, scope: !78)
!95 = !DILocation(line: 32, column: 17, scope: !78)
!96 = !DILocation(line: 32, column: 3, scope: !78)
!97 = !DILocation(line: 32, column: 24, scope: !78)
!98 = !DILocation(line: 32, column: 29, scope: !78)
!99 = distinct !{!99, !73, !100}
!100 = !DILocation(line: 33, column: 2, scope: !39)
!101 = !DILocation(line: 34, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !39, file: !3, line: 34, column: 2)
!103 = !DILocation(line: 34, column: 16, scope: !102)
!104 = !DILocation(line: 34, column: 7, scope: !102)
!105 = !DILocation(line: 34, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 34, column: 2)
!107 = !DILocation(line: 34, column: 23, scope: !106)
!108 = !DILocation(line: 34, column: 2, scope: !102)
!109 = !DILocation(line: 35, column: 19, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 35, column: 7)
!111 = !DILocation(line: 35, column: 7, scope: !110)
!112 = !DILocation(line: 35, column: 22, scope: !110)
!113 = !DILocation(line: 35, column: 7, scope: !106)
!114 = !DILocation(line: 36, column: 33, scope: !110)
!115 = !DILocation(line: 36, column: 31, scope: !110)
!116 = !DILocation(line: 36, column: 13, scope: !110)
!117 = !DILocation(line: 36, column: 4, scope: !110)
!118 = !DILocation(line: 36, column: 17, scope: !110)
!119 = !DILocation(line: 34, column: 30, scope: !106)
!120 = !DILocation(line: 34, column: 2, scope: !106)
!121 = distinct !{!121, !108, !122}
!122 = !DILocation(line: 36, column: 33, scope: !102)
!123 = !DILocation(line: 38, column: 9, scope: !39)
!124 = !DILocation(line: 38, column: 2, scope: !39)
!125 = distinct !DISubprogram(name: "permutate", scope: !3, file: !3, line: 44, type: !126, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DISubroutineType(types: !127)
!127 = !{null, !18, !18, !18}
!128 = !DILocalVariable(name: "n_letters", arg: 1, scope: !125, file: !3, line: 44, type: !18)
!129 = !DILocation(line: 44, column: 20, scope: !125)
!130 = !DILocalVariable(name: "pos", arg: 2, scope: !125, file: !3, line: 44, type: !18)
!131 = !DILocation(line: 44, column: 35, scope: !125)
!132 = !DILocalVariable(name: "overlap", arg: 3, scope: !125, file: !3, line: 44, type: !18)
!133 = !DILocation(line: 44, column: 44, scope: !125)
!134 = !DILocalVariable(name: "i", scope: !125, file: !3, line: 46, type: !18)
!135 = !DILocation(line: 46, column: 6, scope: !125)
!136 = !DILocalVariable(name: "ol", scope: !125, file: !3, line: 46, type: !18)
!137 = !DILocation(line: 46, column: 9, scope: !125)
!138 = !DILocation(line: 47, column: 6, scope: !139)
!139 = distinct !DILexicalBlock(scope: !125, file: !3, line: 47, column: 6)
!140 = !DILocation(line: 47, column: 10, scope: !139)
!141 = !DILocation(line: 47, column: 6, scope: !125)
!142 = !DILocation(line: 52, column: 7, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !3, line: 52, column: 7)
!144 = distinct !DILexicalBlock(scope: !139, file: !3, line: 47, column: 15)
!145 = !DILocation(line: 52, column: 17, scope: !143)
!146 = !DILocation(line: 52, column: 15, scope: !143)
!147 = !DILocation(line: 52, column: 7, scope: !144)
!148 = !DILocation(line: 53, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !3, line: 52, column: 32)
!150 = !DILocation(line: 53, column: 18, scope: !149)
!151 = !DILocation(line: 54, column: 11, scope: !149)
!152 = !DILocation(line: 55, column: 3, scope: !149)
!153 = !DILocation(line: 61, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !144, file: !3, line: 61, column: 8)
!155 = !DILocation(line: 61, column: 8, scope: !154)
!156 = !DILocation(line: 61, column: 23, scope: !154)
!157 = !DILocation(line: 61, column: 44, scope: !154)
!158 = !DILocation(line: 61, column: 42, scope: !154)
!159 = !DILocation(line: 61, column: 53, scope: !154)
!160 = !DILocation(line: 61, column: 8, scope: !144)
!161 = !DILocation(line: 62, column: 4, scope: !154)
!162 = !DILocation(line: 64, column: 3, scope: !144)
!163 = !DILocation(line: 68, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !125, file: !3, line: 68, column: 2)
!165 = !DILocation(line: 68, column: 7, scope: !164)
!166 = !DILocation(line: 68, column: 14, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !3, line: 68, column: 2)
!168 = !DILocation(line: 68, column: 18, scope: !167)
!169 = !DILocation(line: 68, column: 16, scope: !167)
!170 = !DILocation(line: 68, column: 2, scope: !164)
!171 = !DILocation(line: 69, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !173, file: !3, line: 69, column: 7)
!173 = distinct !DILexicalBlock(scope: !167, file: !3, line: 68, column: 34)
!174 = !DILocation(line: 69, column: 8, scope: !172)
!175 = !DILocation(line: 69, column: 20, scope: !172)
!176 = !DILocation(line: 69, column: 7, scope: !173)
!177 = !DILocation(line: 69, column: 27, scope: !172)
!178 = !DILocation(line: 71, column: 22, scope: !173)
!179 = !DILocation(line: 71, column: 14, scope: !173)
!180 = !DILocation(line: 71, column: 26, scope: !173)
!181 = !DILocation(line: 71, column: 7, scope: !173)
!182 = !DILocation(line: 71, column: 3, scope: !173)
!183 = !DILocation(line: 71, column: 12, scope: !173)
!184 = !DILocation(line: 72, column: 11, scope: !173)
!185 = !DILocation(line: 72, column: 3, scope: !173)
!186 = !DILocation(line: 72, column: 15, scope: !173)
!187 = !DILocation(line: 72, column: 21, scope: !173)
!188 = !DILocation(line: 73, column: 17, scope: !173)
!189 = !DILocation(line: 73, column: 9, scope: !173)
!190 = !DILocation(line: 73, column: 21, scope: !173)
!191 = !DILocation(line: 73, column: 31, scope: !173)
!192 = !DILocation(line: 73, column: 26, scope: !173)
!193 = !DILocation(line: 73, column: 23, scope: !173)
!194 = !DILocation(line: 73, column: 8, scope: !173)
!195 = !DILocation(line: 73, column: 39, scope: !173)
!196 = !DILocation(line: 73, column: 47, scope: !173)
!197 = !DILocation(line: 73, column: 53, scope: !173)
!198 = !DILocation(line: 73, column: 6, scope: !173)
!199 = !DILocation(line: 76, column: 7, scope: !200)
!200 = distinct !DILexicalBlock(scope: !173, file: !3, line: 76, column: 7)
!201 = !DILocation(line: 76, column: 13, scope: !200)
!202 = !DILocation(line: 76, column: 10, scope: !200)
!203 = !DILocation(line: 76, column: 7, scope: !173)
!204 = !DILocation(line: 77, column: 14, scope: !200)
!205 = !DILocation(line: 77, column: 25, scope: !200)
!206 = !DILocation(line: 77, column: 29, scope: !200)
!207 = !DILocation(line: 77, column: 34, scope: !200)
!208 = !DILocation(line: 77, column: 4, scope: !200)
!209 = !DILocation(line: 79, column: 11, scope: !173)
!210 = !DILocation(line: 79, column: 3, scope: !173)
!211 = !DILocation(line: 79, column: 15, scope: !173)
!212 = !DILocation(line: 79, column: 21, scope: !173)
!213 = !DILocation(line: 80, column: 2, scope: !173)
!214 = !DILocation(line: 68, column: 30, scope: !167)
!215 = !DILocation(line: 68, column: 2, scope: !167)
!216 = distinct !{!216, !170, !217}
!217 = !DILocation(line: 80, column: 2, scope: !164)
!218 = !DILocation(line: 81, column: 2, scope: !125)
!219 = !DILocation(line: 82, column: 1, scope: !125)
!220 = distinct !DISubprogram(name: "do_string", scope: !3, file: !3, line: 84, type: !221, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DISubroutineType(types: !222)
!222 = !{null, !42}
!223 = !DILocalVariable(name: "str", arg: 1, scope: !220, file: !3, line: 84, type: !42)
!224 = !DILocation(line: 84, column: 28, scope: !220)
!225 = !DILocation(line: 86, column: 25, scope: !220)
!226 = !DILocation(line: 86, column: 18, scope: !220)
!227 = !DILocation(line: 86, column: 16, scope: !220)
!228 = !DILocation(line: 87, column: 15, scope: !220)
!229 = !DILocation(line: 87, column: 2, scope: !220)
!230 = !DILocation(line: 89, column: 9, scope: !220)
!231 = !DILocation(line: 90, column: 6, scope: !220)
!232 = !DILocation(line: 90, column: 2, scope: !220)
!233 = !DILocation(line: 90, column: 21, scope: !220)
!234 = !DILocation(line: 91, column: 16, scope: !220)
!235 = !DILocation(line: 93, column: 26, scope: !220)
!236 = !DILocation(line: 93, column: 12, scope: !220)
!237 = !DILocation(line: 93, column: 32, scope: !220)
!238 = !DILocation(line: 93, column: 46, scope: !220)
!239 = !DILocation(line: 93, column: 2, scope: !220)
!240 = !DILocation(line: 94, column: 35, scope: !220)
!241 = !DILocation(line: 94, column: 46, scope: !220)
!242 = !DILocation(line: 94, column: 2, scope: !220)
!243 = !DILocation(line: 95, column: 1, scope: !220)
!244 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 97, type: !245, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!245 = !DISubroutineType(types: !246)
!246 = !{!18}
!247 = !DILocation(line: 99, column: 8, scope: !244)
!248 = !DILocation(line: 99, column: 2, scope: !244)
!249 = !DILocation(line: 100, column: 2, scope: !244)
!250 = !DILocation(line: 101, column: 2, scope: !244)
!251 = !DILocation(line: 102, column: 2, scope: !244)
!252 = !DILocation(line: 103, column: 2, scope: !244)
!253 = !DILocation(line: 104, column: 2, scope: !244)
!254 = !DILocation(line: 105, column: 2, scope: !244)
