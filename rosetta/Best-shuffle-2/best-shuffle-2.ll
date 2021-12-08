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
  br i1 %cmp8, label %if.then, label %lor.lhs.false, !dbg !84

lor.lhs.false:                                    ; preds = %while.body
  %10 = load i32, i32* %i, align 4, !dbg !85
  %cmp10 = icmp sgt i32 %10, 122, !dbg !86
  br i1 %cmp10, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !88
  %12 = load i8*, i8** %s.addr, align 8, !dbg !90
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* %12), !dbg !91
  call void @exit(i32 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i32, i32* %i, align 4, !dbg !93
  %sub = sub nsw i32 %13, 97, !dbg !94
  %idxprom12 = sext i32 %sub to i64, !dbg !95
  %arrayidx13 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom12, !dbg !95
  %count14 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx13, i32 0, i32 1, !dbg !96
  %14 = load i32, i32* %count14, align 4, !dbg !97
  %inc15 = add nsw i32 %14, 1, !dbg !97
  store i32 %inc15, i32* %count14, align 4, !dbg !97
  br label %while.cond, !dbg !73, !llvm.loop !98

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %i, align 4, !dbg !100
  store i32 0, i32* %c, align 4, !dbg !102
  br label %for.cond16, !dbg !103

for.cond16:                                       ; preds = %for.inc28, %while.end
  %15 = load i32, i32* %i, align 4, !dbg !104
  %cmp17 = icmp slt i32 %15, 26, !dbg !106
  br i1 %cmp17, label %for.body19, label %for.end30, !dbg !107

for.body19:                                       ; preds = %for.cond16
  %16 = load i32, i32* %i, align 4, !dbg !108
  %idxprom20 = sext i32 %16 to i64, !dbg !110
  %arrayidx21 = getelementptr inbounds [26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 %idxprom20, !dbg !110
  %count22 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %arrayidx21, i32 0, i32 1, !dbg !111
  %17 = load i32, i32* %count22, align 4, !dbg !111
  %tobool = icmp ne i32 %17, 0, !dbg !110
  br i1 %tobool, label %if.then23, label %if.end27, !dbg !112

if.then23:                                        ; preds = %for.body19
  %18 = load i32, i32* %i, align 4, !dbg !113
  %idx.ext = sext i32 %18 to i64, !dbg !114
  %add.ptr = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* getelementptr inbounds ([26 x %struct.letter_group_t], [26 x %struct.letter_group_t]* @all_letters, i64 0, i64 0), i64 %idx.ext, !dbg !114
  %19 = load i32, i32* %c, align 4, !dbg !115
  %inc24 = add nsw i32 %19, 1, !dbg !115
  store i32 %inc24, i32* %c, align 4, !dbg !115
  %idxprom25 = sext i32 %19 to i64, !dbg !116
  %arrayidx26 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom25, !dbg !116
  store %struct.letter_group_t* %add.ptr, %struct.letter_group_t** %arrayidx26, align 8, !dbg !117
  br label %if.end27, !dbg !116

if.end27:                                         ; preds = %if.then23, %for.body19
  br label %for.inc28, !dbg !111

for.inc28:                                        ; preds = %if.end27
  %20 = load i32, i32* %i, align 4, !dbg !118
  %inc29 = add nsw i32 %20, 1, !dbg !118
  store i32 %inc29, i32* %i, align 4, !dbg !118
  br label %for.cond16, !dbg !119, !llvm.loop !120

for.end30:                                        ; preds = %for.cond16
  %21 = load i32, i32* %c, align 4, !dbg !122
  ret i32 %21, !dbg !123
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @permutate(i32 %n_letters, i32 %pos, i32 %overlap) #0 !dbg !124 {
entry:
  %n_letters.addr = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  %overlap.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ol = alloca i32, align 4
  store i32 %n_letters, i32* %n_letters.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_letters.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 %pos, i32* %pos.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pos.addr, metadata !129, metadata !DIExpression()), !dbg !130
  store i32 %overlap, i32* %overlap.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %overlap.addr, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32* %ol, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = load i32, i32* %pos.addr, align 4, !dbg !137
  %cmp = icmp slt i32 %0, 0, !dbg !139
  br i1 %cmp, label %if.then, label %if.end9, !dbg !140

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %overlap.addr, align 4, !dbg !141
  %2 = load i32, i32* @least_overlap, align 4, !dbg !144
  %cmp1 = icmp slt i32 %1, %2, !dbg !145
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !146

if.then2:                                         ; preds = %if.then
  %3 = load i32, i32* %overlap.addr, align 4, !dbg !147
  store i32 %3, i32* @least_overlap, align 4, !dbg !149
  store i32 0, i32* @seq_no, align 4, !dbg !150
  br label %if.end, !dbg !151

if.end:                                           ; preds = %if.then2, %if.then
  %call = call i32 @rand() #7, !dbg !152
  %conv = sitofp i32 %call to double, !dbg !154
  %div = fdiv double %conv, 0x41E0000000000000, !dbg !155
  %4 = load i32, i32* @seq_no, align 4, !dbg !156
  %inc = add nsw i32 %4, 1, !dbg !156
  store i32 %inc, i32* @seq_no, align 4, !dbg !156
  %conv3 = sitofp i32 %inc to double, !dbg !156
  %mul = fmul double %div, %conv3, !dbg !157
  %cmp4 = fcmp ole double %mul, 1.000000e+00, !dbg !158
  br i1 %cmp4, label %if.then6, label %if.end8, !dbg !159

if.then6:                                         ; preds = %if.end
  %call7 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @out, i64 0, i64 0)) #7, !dbg !160
  br label %if.end8, !dbg !160

if.end8:                                          ; preds = %if.then6, %if.end
  br label %return, !dbg !161

if.end9:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.end9
  %5 = load i32, i32* %i, align 4, !dbg !165
  %6 = load i32, i32* %n_letters.addr, align 4, !dbg !167
  %cmp10 = icmp slt i32 %5, %6, !dbg !168
  br i1 %cmp10, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !170
  %idxprom = sext i32 %7 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom, !dbg !173
  %8 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx, align 8, !dbg !173
  %count = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %8, i32 0, i32 1, !dbg !174
  %9 = load i32, i32* %count, align 4, !dbg !174
  %tobool = icmp ne i32 %9, 0, !dbg !173
  br i1 %tobool, label %if.end13, label %if.then12, !dbg !175

if.then12:                                        ; preds = %for.body
  br label %for.inc, !dbg !176

if.end13:                                         ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !177
  %idxprom14 = sext i32 %10 to i64, !dbg !178
  %arrayidx15 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom14, !dbg !178
  %11 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx15, align 8, !dbg !178
  %c = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %11, i32 0, i32 0, !dbg !179
  %12 = load i8, i8* %c, align 4, !dbg !179
  %13 = load i32, i32* %pos.addr, align 4, !dbg !180
  %idxprom16 = sext i32 %13 to i64, !dbg !181
  %arrayidx17 = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom16, !dbg !181
  store i8 %12, i8* %arrayidx17, align 1, !dbg !182
  %14 = load i32, i32* %i, align 4, !dbg !183
  %idxprom18 = sext i32 %14 to i64, !dbg !184
  %arrayidx19 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom18, !dbg !184
  %15 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx19, align 8, !dbg !184
  %count20 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %15, i32 0, i32 1, !dbg !185
  %16 = load i32, i32* %count20, align 4, !dbg !186
  %dec = add nsw i32 %16, -1, !dbg !186
  store i32 %dec, i32* %count20, align 4, !dbg !186
  %17 = load i32, i32* %i, align 4, !dbg !187
  %idxprom21 = sext i32 %17 to i64, !dbg !188
  %arrayidx22 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom21, !dbg !188
  %18 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx22, align 8, !dbg !188
  %c23 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %18, i32 0, i32 0, !dbg !189
  %19 = load i8, i8* %c23, align 4, !dbg !189
  %conv24 = sext i8 %19 to i32, !dbg !188
  %20 = load i32, i32* %pos.addr, align 4, !dbg !190
  %idxprom25 = sext i32 %20 to i64, !dbg !191
  %arrayidx26 = getelementptr inbounds [100 x i8], [100 x i8]* @orig, i64 0, i64 %idxprom25, !dbg !191
  %21 = load i8, i8* %arrayidx26, align 1, !dbg !191
  %conv27 = sext i8 %21 to i32, !dbg !191
  %cmp28 = icmp eq i32 %conv24, %conv27, !dbg !192
  br i1 %cmp28, label %cond.true, label %cond.false, !dbg !193

cond.true:                                        ; preds = %if.end13
  %22 = load i32, i32* %overlap.addr, align 4, !dbg !194
  %add = add nsw i32 %22, 1, !dbg !195
  br label %cond.end, !dbg !193

cond.false:                                       ; preds = %if.end13
  %23 = load i32, i32* %overlap.addr, align 4, !dbg !196
  br label %cond.end, !dbg !193

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %23, %cond.false ], !dbg !193
  store i32 %cond, i32* %ol, align 4, !dbg !197
  %24 = load i32, i32* %ol, align 4, !dbg !198
  %25 = load i32, i32* @least_overlap, align 4, !dbg !200
  %cmp30 = icmp sle i32 %24, %25, !dbg !201
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !202

if.then32:                                        ; preds = %cond.end
  %26 = load i32, i32* %n_letters.addr, align 4, !dbg !203
  %27 = load i32, i32* %pos.addr, align 4, !dbg !204
  %sub = sub nsw i32 %27, 1, !dbg !205
  %28 = load i32, i32* %ol, align 4, !dbg !206
  call void @permutate(i32 %26, i32 %sub, i32 %28), !dbg !207
  br label %if.end33, !dbg !207

if.end33:                                         ; preds = %if.then32, %cond.end
  %29 = load i32, i32* %i, align 4, !dbg !208
  %idxprom34 = sext i32 %29 to i64, !dbg !209
  %arrayidx35 = getelementptr inbounds [26 x %struct.letter_group_t*], [26 x %struct.letter_group_t*]* @letters, i64 0, i64 %idxprom34, !dbg !209
  %30 = load %struct.letter_group_t*, %struct.letter_group_t** %arrayidx35, align 8, !dbg !209
  %count36 = getelementptr inbounds %struct.letter_group_t, %struct.letter_group_t* %30, i32 0, i32 1, !dbg !210
  %31 = load i32, i32* %count36, align 4, !dbg !211
  %inc37 = add nsw i32 %31, 1, !dbg !211
  store i32 %inc37, i32* %count36, align 4, !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %if.end33, %if.then12
  %32 = load i32, i32* %i, align 4, !dbg !213
  %inc38 = add nsw i32 %32, 1, !dbg !213
  store i32 %inc38, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !217

return:                                           ; preds = %for.end, %if.end8
  ret void, !dbg !218
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_string(i8* %str) #0 !dbg !219 {
entry:
  %str.addr = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i8*, i8** %str.addr, align 8, !dbg !224
  %call = call i64 @strlen(i8* %0) #8, !dbg !225
  %conv = trunc i64 %call to i32, !dbg !225
  store i32 %conv, i32* @least_overlap, align 4, !dbg !226
  %1 = load i8*, i8** %str.addr, align 8, !dbg !227
  %call1 = call i8* @strcpy(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @orig, i64 0, i64 0), i8* %1) #7, !dbg !228
  store i32 0, i32* @seq_no, align 4, !dbg !229
  %2 = load i32, i32* @least_overlap, align 4, !dbg !230
  %idxprom = sext i32 %2 to i64, !dbg !231
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* @out, i64 0, i64 %idxprom, !dbg !231
  store i8 0, i8* %arrayidx, align 1, !dbg !232
  %3 = load i32, i32* @least_overlap, align 4, !dbg !233
  %inc = add nsw i32 %3, 1, !dbg !233
  store i32 %inc, i32* @least_overlap, align 4, !dbg !233
  %4 = load i8*, i8** %str.addr, align 8, !dbg !234
  %call2 = call i32 @count_letters(i8* %4), !dbg !235
  %5 = load i32, i32* @least_overlap, align 4, !dbg !236
  %sub = sub nsw i32 %5, 2, !dbg !237
  call void @permutate(i32 %call2, i32 %sub, i32 0), !dbg !238
  %6 = load i8*, i8** %str.addr, align 8, !dbg !239
  %7 = load i32, i32* @least_overlap, align 4, !dbg !240
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* %6, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @best, i64 0, i64 0), i32 %7), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !243 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !246
  call void @srand(i32 %call) #7, !dbg !247
  call void @do_string(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !248
  call void @do_string(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !249
  call void @do_string(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0)), !dbg !250
  call void @do_string(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0)), !dbg !251
  call void @do_string(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)), !dbg !252
  ret i32 0, !dbg !253
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "best-shuffle-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle-2")
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
!38 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!85 = !DILocation(line: 27, column: 18, scope: !82)
!86 = !DILocation(line: 27, column: 20, scope: !82)
!87 = !DILocation(line: 27, column: 7, scope: !78)
!88 = !DILocation(line: 28, column: 12, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !3, line: 27, column: 27)
!90 = !DILocation(line: 28, column: 46, scope: !89)
!91 = !DILocation(line: 28, column: 4, scope: !89)
!92 = !DILocation(line: 29, column: 4, scope: !89)
!93 = !DILocation(line: 32, column: 15, scope: !78)
!94 = !DILocation(line: 32, column: 17, scope: !78)
!95 = !DILocation(line: 32, column: 3, scope: !78)
!96 = !DILocation(line: 32, column: 24, scope: !78)
!97 = !DILocation(line: 32, column: 29, scope: !78)
!98 = distinct !{!98, !73, !99}
!99 = !DILocation(line: 33, column: 2, scope: !39)
!100 = !DILocation(line: 34, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !39, file: !3, line: 34, column: 2)
!102 = !DILocation(line: 34, column: 16, scope: !101)
!103 = !DILocation(line: 34, column: 7, scope: !101)
!104 = !DILocation(line: 34, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 34, column: 2)
!106 = !DILocation(line: 34, column: 23, scope: !105)
!107 = !DILocation(line: 34, column: 2, scope: !101)
!108 = !DILocation(line: 35, column: 19, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !3, line: 35, column: 7)
!110 = !DILocation(line: 35, column: 7, scope: !109)
!111 = !DILocation(line: 35, column: 22, scope: !109)
!112 = !DILocation(line: 35, column: 7, scope: !105)
!113 = !DILocation(line: 36, column: 33, scope: !109)
!114 = !DILocation(line: 36, column: 31, scope: !109)
!115 = !DILocation(line: 36, column: 13, scope: !109)
!116 = !DILocation(line: 36, column: 4, scope: !109)
!117 = !DILocation(line: 36, column: 17, scope: !109)
!118 = !DILocation(line: 34, column: 30, scope: !105)
!119 = !DILocation(line: 34, column: 2, scope: !105)
!120 = distinct !{!120, !107, !121}
!121 = !DILocation(line: 36, column: 33, scope: !101)
!122 = !DILocation(line: 38, column: 9, scope: !39)
!123 = !DILocation(line: 38, column: 2, scope: !39)
!124 = distinct !DISubprogram(name: "permutate", scope: !3, file: !3, line: 44, type: !125, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DISubroutineType(types: !126)
!126 = !{null, !18, !18, !18}
!127 = !DILocalVariable(name: "n_letters", arg: 1, scope: !124, file: !3, line: 44, type: !18)
!128 = !DILocation(line: 44, column: 20, scope: !124)
!129 = !DILocalVariable(name: "pos", arg: 2, scope: !124, file: !3, line: 44, type: !18)
!130 = !DILocation(line: 44, column: 35, scope: !124)
!131 = !DILocalVariable(name: "overlap", arg: 3, scope: !124, file: !3, line: 44, type: !18)
!132 = !DILocation(line: 44, column: 44, scope: !124)
!133 = !DILocalVariable(name: "i", scope: !124, file: !3, line: 46, type: !18)
!134 = !DILocation(line: 46, column: 6, scope: !124)
!135 = !DILocalVariable(name: "ol", scope: !124, file: !3, line: 46, type: !18)
!136 = !DILocation(line: 46, column: 9, scope: !124)
!137 = !DILocation(line: 47, column: 6, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !3, line: 47, column: 6)
!139 = !DILocation(line: 47, column: 10, scope: !138)
!140 = !DILocation(line: 47, column: 6, scope: !124)
!141 = !DILocation(line: 52, column: 7, scope: !142)
!142 = distinct !DILexicalBlock(scope: !143, file: !3, line: 52, column: 7)
!143 = distinct !DILexicalBlock(scope: !138, file: !3, line: 47, column: 15)
!144 = !DILocation(line: 52, column: 17, scope: !142)
!145 = !DILocation(line: 52, column: 15, scope: !142)
!146 = !DILocation(line: 52, column: 7, scope: !143)
!147 = !DILocation(line: 53, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !3, line: 52, column: 32)
!149 = !DILocation(line: 53, column: 18, scope: !148)
!150 = !DILocation(line: 54, column: 11, scope: !148)
!151 = !DILocation(line: 55, column: 3, scope: !148)
!152 = !DILocation(line: 61, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !143, file: !3, line: 61, column: 8)
!154 = !DILocation(line: 61, column: 8, scope: !153)
!155 = !DILocation(line: 61, column: 23, scope: !153)
!156 = !DILocation(line: 61, column: 44, scope: !153)
!157 = !DILocation(line: 61, column: 42, scope: !153)
!158 = !DILocation(line: 61, column: 53, scope: !153)
!159 = !DILocation(line: 61, column: 8, scope: !143)
!160 = !DILocation(line: 62, column: 4, scope: !153)
!161 = !DILocation(line: 64, column: 3, scope: !143)
!162 = !DILocation(line: 68, column: 9, scope: !163)
!163 = distinct !DILexicalBlock(scope: !124, file: !3, line: 68, column: 2)
!164 = !DILocation(line: 68, column: 7, scope: !163)
!165 = !DILocation(line: 68, column: 14, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 68, column: 2)
!167 = !DILocation(line: 68, column: 18, scope: !166)
!168 = !DILocation(line: 68, column: 16, scope: !166)
!169 = !DILocation(line: 68, column: 2, scope: !163)
!170 = !DILocation(line: 69, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !172, file: !3, line: 69, column: 7)
!172 = distinct !DILexicalBlock(scope: !166, file: !3, line: 68, column: 34)
!173 = !DILocation(line: 69, column: 8, scope: !171)
!174 = !DILocation(line: 69, column: 20, scope: !171)
!175 = !DILocation(line: 69, column: 7, scope: !172)
!176 = !DILocation(line: 69, column: 27, scope: !171)
!177 = !DILocation(line: 71, column: 22, scope: !172)
!178 = !DILocation(line: 71, column: 14, scope: !172)
!179 = !DILocation(line: 71, column: 26, scope: !172)
!180 = !DILocation(line: 71, column: 7, scope: !172)
!181 = !DILocation(line: 71, column: 3, scope: !172)
!182 = !DILocation(line: 71, column: 12, scope: !172)
!183 = !DILocation(line: 72, column: 11, scope: !172)
!184 = !DILocation(line: 72, column: 3, scope: !172)
!185 = !DILocation(line: 72, column: 15, scope: !172)
!186 = !DILocation(line: 72, column: 21, scope: !172)
!187 = !DILocation(line: 73, column: 17, scope: !172)
!188 = !DILocation(line: 73, column: 9, scope: !172)
!189 = !DILocation(line: 73, column: 21, scope: !172)
!190 = !DILocation(line: 73, column: 31, scope: !172)
!191 = !DILocation(line: 73, column: 26, scope: !172)
!192 = !DILocation(line: 73, column: 23, scope: !172)
!193 = !DILocation(line: 73, column: 8, scope: !172)
!194 = !DILocation(line: 73, column: 39, scope: !172)
!195 = !DILocation(line: 73, column: 47, scope: !172)
!196 = !DILocation(line: 73, column: 53, scope: !172)
!197 = !DILocation(line: 73, column: 6, scope: !172)
!198 = !DILocation(line: 76, column: 7, scope: !199)
!199 = distinct !DILexicalBlock(scope: !172, file: !3, line: 76, column: 7)
!200 = !DILocation(line: 76, column: 13, scope: !199)
!201 = !DILocation(line: 76, column: 10, scope: !199)
!202 = !DILocation(line: 76, column: 7, scope: !172)
!203 = !DILocation(line: 77, column: 14, scope: !199)
!204 = !DILocation(line: 77, column: 25, scope: !199)
!205 = !DILocation(line: 77, column: 29, scope: !199)
!206 = !DILocation(line: 77, column: 34, scope: !199)
!207 = !DILocation(line: 77, column: 4, scope: !199)
!208 = !DILocation(line: 79, column: 11, scope: !172)
!209 = !DILocation(line: 79, column: 3, scope: !172)
!210 = !DILocation(line: 79, column: 15, scope: !172)
!211 = !DILocation(line: 79, column: 21, scope: !172)
!212 = !DILocation(line: 80, column: 2, scope: !172)
!213 = !DILocation(line: 68, column: 30, scope: !166)
!214 = !DILocation(line: 68, column: 2, scope: !166)
!215 = distinct !{!215, !169, !216}
!216 = !DILocation(line: 80, column: 2, scope: !163)
!217 = !DILocation(line: 81, column: 2, scope: !124)
!218 = !DILocation(line: 82, column: 1, scope: !124)
!219 = distinct !DISubprogram(name: "do_string", scope: !3, file: !3, line: 84, type: !220, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!220 = !DISubroutineType(types: !221)
!221 = !{null, !42}
!222 = !DILocalVariable(name: "str", arg: 1, scope: !219, file: !3, line: 84, type: !42)
!223 = !DILocation(line: 84, column: 28, scope: !219)
!224 = !DILocation(line: 86, column: 25, scope: !219)
!225 = !DILocation(line: 86, column: 18, scope: !219)
!226 = !DILocation(line: 86, column: 16, scope: !219)
!227 = !DILocation(line: 87, column: 15, scope: !219)
!228 = !DILocation(line: 87, column: 2, scope: !219)
!229 = !DILocation(line: 89, column: 9, scope: !219)
!230 = !DILocation(line: 90, column: 6, scope: !219)
!231 = !DILocation(line: 90, column: 2, scope: !219)
!232 = !DILocation(line: 90, column: 21, scope: !219)
!233 = !DILocation(line: 91, column: 16, scope: !219)
!234 = !DILocation(line: 93, column: 26, scope: !219)
!235 = !DILocation(line: 93, column: 12, scope: !219)
!236 = !DILocation(line: 93, column: 32, scope: !219)
!237 = !DILocation(line: 93, column: 46, scope: !219)
!238 = !DILocation(line: 93, column: 2, scope: !219)
!239 = !DILocation(line: 94, column: 35, scope: !219)
!240 = !DILocation(line: 94, column: 46, scope: !219)
!241 = !DILocation(line: 94, column: 2, scope: !219)
!242 = !DILocation(line: 95, column: 1, scope: !219)
!243 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 97, type: !244, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!244 = !DISubroutineType(types: !245)
!245 = !{!18}
!246 = !DILocation(line: 99, column: 8, scope: !243)
!247 = !DILocation(line: 99, column: 2, scope: !243)
!248 = !DILocation(line: 100, column: 2, scope: !243)
!249 = !DILocation(line: 101, column: 2, scope: !243)
!250 = !DILocation(line: 102, column: 2, scope: !243)
!251 = !DILocation(line: 103, column: 2, scope: !243)
!252 = !DILocation(line: 104, column: 2, scope: !243)
!253 = !DILocation(line: 105, column: 2, scope: !243)
