; ModuleID = 'dining-philosophers-1.ll'
source_filename = "dining-philosophers-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"Aristotle\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Kant\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Spinoza\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Marx\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Russell\00", align 1
@names = dso_local global [5 x i8*] [i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0)], align 16, !dbg !0
@.str.5 = private unnamed_addr constant [11 x i8] c"Spaghetti!\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"Life\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Universe\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"Everything\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"Bathroom\00", align 1
@topic = dso_local global [5 x i8*] [i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0)], align 16, !dbg !9
@print.screen = internal global %union.pthread_mutex_t zeroinitializer, align 8, !dbg !17
@.str.10 = private unnamed_addr constant [9 x i8] c"\1B[%d;%dH\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.11 = private unnamed_addr constant [4 x i8] c"\1B[K\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"..oO (forks, need forks)\00", align 1
@forks = common dso_local global [5 x %union.pthread_mutex_t] zeroinitializer, align 16, !dbg !53
@.str.13 = private unnamed_addr constant [7 x i8] c"fork%d\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"nom\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"..oO (%s)\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"%10s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print(i32 %y, i32 %x, i8* %fmt, ...) #0 !dbg !19 {
entry:
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %fmt.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8* %fmt, i8** %fmt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fmt.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %ap, metadata !66, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !83
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !83
  call void @llvm.va_start(i8* %arraydecay1), !dbg !83
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @print.screen) #2, !dbg !84
  %0 = load i32, i32* %y.addr, align 4, !dbg !85
  %add = add nsw i32 %0, 1, !dbg !85
  %1 = load i32, i32* %x.addr, align 4, !dbg !85
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0), i32 %add, i32 %1), !dbg !85
  %2 = load i8*, i8** %fmt.addr, align 8, !dbg !86
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !87
  %call4 = call i32 @vprintf(i8* %2, %struct.__va_list_tag* %arraydecay3), !dbg !88
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0), i32 6, i32 1), !dbg !89
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !90
  %call6 = call i32 @fflush(%struct._IO_FILE* %3), !dbg !91
  %call7 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @print.screen) #2, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #3

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @vprintf(i8*, %struct.__va_list_tag*) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @eat(i32 %id) #0 !dbg !94 {
entry:
  %id.addr = alloca i32, align 4
  %f = alloca [2 x i32], align 4
  %ration = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [2 x i32]* %f, metadata !99, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %ration, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %i, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* %id.addr, align 4, !dbg !108
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 1, !dbg !109
  store i32 %0, i32* %arrayidx, align 4, !dbg !110
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 0, !dbg !111
  store i32 %0, i32* %arrayidx1, align 4, !dbg !112
  %1 = load i32, i32* %id.addr, align 4, !dbg !113
  %add = add nsw i32 %1, 1, !dbg !114
  %rem = srem i32 %add, 5, !dbg !115
  %2 = load i32, i32* %id.addr, align 4, !dbg !116
  %and = and i32 %2, 1, !dbg !117
  %idxprom = sext i32 %and to i64, !dbg !118
  %arrayidx2 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom, !dbg !118
  store i32 %rem, i32* %arrayidx2, align 4, !dbg !119
  %3 = load i32, i32* %id.addr, align 4, !dbg !120
  call void (i32, i32, i8*, ...) @print(i32 %3, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !120
  %4 = load i32, i32* %id.addr, align 4, !dbg !121
  call void (i32, i32, i8*, ...) @print(i32 %4, i32 12, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0)), !dbg !122
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %i, align 4, !dbg !126
  %cmp = icmp slt i32 %5, 2, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !130
  %idxprom3 = sext i32 %6 to i64, !dbg !132
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom3, !dbg !132
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !132
  %idx.ext = sext i32 %7 to i64, !dbg !133
  %add.ptr = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext, !dbg !133
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %add.ptr) #2, !dbg !134
  %8 = load i32, i32* %i, align 4, !dbg !135
  %tobool = icmp ne i32 %8, 0, !dbg !135
  br i1 %tobool, label %if.end, label %if.then, !dbg !137

if.then:                                          ; preds = %for.body
  %9 = load i32, i32* %id.addr, align 4, !dbg !138
  call void (i32, i32, i8*, ...) @print(i32 %9, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !138
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then, %for.body
  %10 = load i32, i32* %id.addr, align 4, !dbg !139
  %11 = load i32, i32* %i, align 4, !dbg !140
  %idxprom5 = sext i32 %11 to i64, !dbg !141
  %arrayidx6 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom5, !dbg !141
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !141
  %13 = load i32, i32* %id.addr, align 4, !dbg !142
  %cmp7 = icmp ne i32 %12, %13, !dbg !143
  %conv = zext i1 %cmp7 to i32, !dbg !143
  %mul = mul nsw i32 %conv, 6, !dbg !144
  %add8 = add nsw i32 12, %mul, !dbg !145
  %14 = load i32, i32* %i, align 4, !dbg !146
  %idxprom9 = sext i32 %14 to i64, !dbg !147
  %arrayidx10 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom9, !dbg !147
  %15 = load i32, i32* %arrayidx10, align 4, !dbg !147
  call void (i32, i32, i8*, ...) @print(i32 %10, i32 %add8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i32 %15), !dbg !148
  %call11 = call i32 @sleep(i32 1), !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %if.end
  %16 = load i32, i32* %i, align 4, !dbg !151
  %inc = add nsw i32 %16, 1, !dbg !151
  store i32 %inc, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !155
  %call12 = call i32 @rand() #2, !dbg !157
  %rem13 = srem i32 %call12, 8, !dbg !158
  %add14 = add nsw i32 3, %rem13, !dbg !159
  store i32 %add14, i32* %ration, align 4, !dbg !160
  br label %for.cond15, !dbg !161

for.cond15:                                       ; preds = %for.inc22, %for.end
  %17 = load i32, i32* %i, align 4, !dbg !162
  %18 = load i32, i32* %ration, align 4, !dbg !164
  %cmp16 = icmp slt i32 %17, %18, !dbg !165
  br i1 %cmp16, label %for.body18, label %for.end24, !dbg !166

for.body18:                                       ; preds = %for.cond15
  %19 = load i32, i32* %id.addr, align 4, !dbg !167
  %20 = load i32, i32* %i, align 4, !dbg !168
  %mul19 = mul nsw i32 %20, 4, !dbg !169
  %add20 = add nsw i32 24, %mul19, !dbg !170
  call void (i32, i32, i8*, ...) @print(i32 %19, i32 %add20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0)), !dbg !171
  %call21 = call i32 @sleep(i32 1), !dbg !172
  br label %for.inc22, !dbg !171

for.inc22:                                        ; preds = %for.body18
  %21 = load i32, i32* %i, align 4, !dbg !173
  %inc23 = add nsw i32 %21, 1, !dbg !173
  store i32 %inc23, i32* %i, align 4, !dbg !173
  br label %for.cond15, !dbg !174, !llvm.loop !175

for.end24:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4, !dbg !177
  br label %for.cond25, !dbg !179

for.cond25:                                       ; preds = %for.inc34, %for.end24
  %22 = load i32, i32* %i, align 4, !dbg !180
  %cmp26 = icmp slt i32 %22, 2, !dbg !182
  br i1 %cmp26, label %for.body28, label %for.end36, !dbg !183

for.body28:                                       ; preds = %for.cond25
  %23 = load i32, i32* %i, align 4, !dbg !184
  %idxprom29 = sext i32 %23 to i64, !dbg !185
  %arrayidx30 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom29, !dbg !185
  %24 = load i32, i32* %arrayidx30, align 4, !dbg !185
  %idx.ext31 = sext i32 %24 to i64, !dbg !186
  %add.ptr32 = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext31, !dbg !186
  %call33 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %add.ptr32) #2, !dbg !187
  br label %for.inc34, !dbg !187

for.inc34:                                        ; preds = %for.body28
  %25 = load i32, i32* %i, align 4, !dbg !188
  %inc35 = add nsw i32 %25, 1, !dbg !188
  store i32 %inc35, i32* %i, align 4, !dbg !188
  br label %for.cond25, !dbg !189, !llvm.loop !190

for.end36:                                        ; preds = %for.cond25
  ret void, !dbg !192
}

declare dso_local i32 @sleep(i32) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @think(i32 %id) #0 !dbg !193 {
entry:
  %id.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i32, align 4
  %buf = alloca [64 x i8], align 16
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %t, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [64 x i8]* %buf, metadata !200, metadata !DIExpression()), !dbg !204
  %0 = bitcast [64 x i8]* %buf to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 64, i1 false), !dbg !204
  br label %do.body, !dbg !205

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %id.addr, align 4, !dbg !206
  call void (i32, i32, i8*, ...) @print(i32 %1, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !206
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 0, !dbg !208
  %call = call i32 @rand() #2, !dbg !209
  %rem = srem i32 %call, 5, !dbg !210
  store i32 %rem, i32* %t, align 4, !dbg !211
  %idxprom = sext i32 %rem to i64, !dbg !212
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @topic, i64 0, i64 %idxprom, !dbg !212
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !212
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0), i8* %2) #2, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %i, align 4, !dbg !217
  %idxprom2 = sext i32 %3 to i64, !dbg !219
  %arrayidx3 = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 %idxprom2, !dbg !219
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !219
  %tobool = icmp ne i8 %4, 0, !dbg !220
  br i1 %tobool, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %id.addr, align 4, !dbg !221
  %6 = load i32, i32* %i, align 4, !dbg !223
  %add = add nsw i32 %6, 12, !dbg !224
  %7 = load i32, i32* %i, align 4, !dbg !225
  %idxprom4 = sext i32 %7 to i64, !dbg !226
  %arrayidx5 = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 %idxprom4, !dbg !226
  %8 = load i8, i8* %arrayidx5, align 1, !dbg !226
  %conv = sext i8 %8 to i32, !dbg !226
  call void (i32, i32, i8*, ...) @print(i32 %5, i32 %add, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i64 0, i64 0), i32 %conv), !dbg !227
  %9 = load i32, i32* %i, align 4, !dbg !228
  %cmp = icmp slt i32 %9, 5, !dbg !230
  br i1 %cmp, label %if.then, label %if.end, !dbg !231

if.then:                                          ; preds = %for.body
  %call7 = call i32 @usleep(i32 200000), !dbg !232
  br label %if.end, !dbg !232

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4, !dbg !234
  %inc = add nsw i32 %10, 1, !dbg !234
  store i32 %inc, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %call8 = call i32 @rand() #2, !dbg !238
  %rem9 = srem i32 %call8, 1000000, !dbg !239
  %add10 = add nsw i32 500000, %rem9, !dbg !240
  %call11 = call i32 @usleep(i32 %add10), !dbg !241
  br label %do.cond, !dbg !242

do.cond:                                          ; preds = %for.end
  %11 = load i32, i32* %t, align 4, !dbg !243
  %tobool12 = icmp ne i32 %11, 0, !dbg !242
  br i1 %tobool12, label %do.body, label %do.end, !dbg !242, !llvm.loop !244

do.end:                                           ; preds = %do.cond
  ret void, !dbg !246
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

declare dso_local i32 @usleep(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @philosophize(i8* %a) #0 !dbg !247 {
entry:
  %a.addr = alloca i8*, align 8
  %id = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !250, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.declare(metadata i32* %id, metadata !252, metadata !DIExpression()), !dbg !253
  %0 = load i8*, i8** %a.addr, align 8, !dbg !254
  %1 = bitcast i8* %0 to i32*, !dbg !255
  %2 = load i32, i32* %1, align 4, !dbg !256
  store i32 %2, i32* %id, align 4, !dbg !253
  %3 = load i32, i32* %id, align 4, !dbg !257
  %4 = load i32, i32* %id, align 4, !dbg !258
  %idxprom = sext i32 %4 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom, !dbg !259
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !259
  call void (i32, i32, i8*, ...) @print(i32 %3, i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0), i8* %5), !dbg !260
  br label %while.body, !dbg !261

while.body:                                       ; preds = %while.body, %entry
  %6 = load i32, i32* %id, align 4, !dbg !262
  call void @think(i32 %6), !dbg !263
  %7 = load i32, i32* %id, align 4, !dbg !264
  call void @eat(i32 %7), !dbg !265
  br label %while.body, !dbg !261, !llvm.loop !266
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !268 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca [5 x i32], align 16
  %tid = alloca [5 x i64], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata [5 x i32]* %id, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata [5 x i64]* %tid, metadata !276, metadata !DIExpression()), !dbg !280
  store i32 0, i32* %i, align 4, !dbg !281
  br label %for.cond, !dbg !283

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !284
  %cmp = icmp slt i32 %0, 5, !dbg !286
  br i1 %cmp, label %for.body, label %for.end, !dbg !287

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !288
  %2 = load i32, i32* %i, align 4, !dbg !289
  %idxprom = sext i32 %2 to i64, !dbg !290
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %id, i64 0, i64 %idxprom, !dbg !290
  store i32 %1, i32* %arrayidx, align 4, !dbg !291
  %idx.ext = sext i32 %1 to i64, !dbg !292
  %add.ptr = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext, !dbg !292
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %add.ptr, %union.pthread_mutexattr_t* null) #2, !dbg !293
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !294
  %inc = add nsw i32 %3, 1, !dbg !294
  store i32 %inc, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !298
  br label %for.cond1, !dbg !300

for.cond1:                                        ; preds = %for.inc10, %for.end
  %4 = load i32, i32* %i, align 4, !dbg !301
  %cmp2 = icmp slt i32 %4, 5, !dbg !303
  br i1 %cmp2, label %for.body3, label %for.end12, !dbg !304

for.body3:                                        ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %tid, i64 0, i64 0, !dbg !305
  %5 = load i32, i32* %i, align 4, !dbg !306
  %idx.ext4 = sext i32 %5 to i64, !dbg !307
  %add.ptr5 = getelementptr inbounds i64, i64* %arraydecay, i64 %idx.ext4, !dbg !307
  %arraydecay6 = getelementptr inbounds [5 x i32], [5 x i32]* %id, i64 0, i64 0, !dbg !308
  %6 = load i32, i32* %i, align 4, !dbg !309
  %idx.ext7 = sext i32 %6 to i64, !dbg !310
  %add.ptr8 = getelementptr inbounds i32, i32* %arraydecay6, i64 %idx.ext7, !dbg !310
  %7 = bitcast i32* %add.ptr8 to i8*, !dbg !308
  %call9 = call i32 @pthread_create(i64* %add.ptr5, %union.pthread_attr_t* null, i8* (i8*)* @philosophize, i8* %7) #2, !dbg !311
  br label %for.inc10, !dbg !311

for.inc10:                                        ; preds = %for.body3
  %8 = load i32, i32* %i, align 4, !dbg !312
  %inc11 = add nsw i32 %8, 1, !dbg !312
  store i32 %inc11, i32* %i, align 4, !dbg !312
  br label %for.cond1, !dbg !313, !llvm.loop !314

for.end12:                                        ; preds = %for.cond1
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %tid, i64 0, i64 0, !dbg !316
  %9 = load i64, i64* %arrayidx13, align 16, !dbg !316
  %call14 = call i32 @pthread_join(i64 %9, i8** null), !dbg !317
  ret i32 %call14, !dbg !318
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #3

; Function Attrs: nounwind
declare !callback !319 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #3

declare dso_local i32 @pthread_join(i64, i8**) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!56, !57, !58}
!llvm.ident = !{!59}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "names", scope: !2, file: !3, line: 8, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dining-philosophers-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dining-philosophers")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!0, !9, !17, !53}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "topic", scope: !2, file: !3, line: 12, type: !11, isLocal: false, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !15)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{!16}
!16 = !DISubrange(count: 5)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "screen", scope: !19, file: !3, line: 20, type: !22, isLocal: true, isDefinition: true)
!19 = distinct !DISubprogram(name: "print", scope: !3, file: !3, line: 18, type: !20, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !7, !7, !12, null}
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !23, line: 72, baseType: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !23, line: 67, size: 320, elements: !25)
!25 = !{!26, !47, !51}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !24, file: !23, line: 69, baseType: !27, size: 320)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !28, line: 22, size: 320, elements: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "")
!29 = !{!30, !31, !33, !34, !35, !36, !38, !39}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !27, file: !28, line: 24, baseType: !7, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !27, file: !28, line: 25, baseType: !32, size: 32, offset: 32)
!32 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !27, file: !28, line: 26, baseType: !7, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !27, file: !28, line: 28, baseType: !32, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !27, file: !28, line: 32, baseType: !7, size: 32, offset: 128)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !27, file: !28, line: 34, baseType: !37, size: 16, offset: 160)
!37 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !27, file: !28, line: 35, baseType: !37, size: 16, offset: 176)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !27, file: !28, line: 36, baseType: !40, size: 128, offset: 192)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !41, line: 53, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "")
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !41, line: 49, size: 128, elements: !43)
!43 = !{!44, !46}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !42, file: !41, line: 51, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !42, file: !41, line: 52, baseType: !45, size: 64, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !24, file: !23, line: 70, baseType: !48, size: 320)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 40)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !24, file: !23, line: 71, baseType: !52, size: 64)
!52 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "forks", scope: !2, file: !3, line: 9, type: !55, isLocal: false, isDefinition: true)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1600, elements: !15)
!56 = !{i32 7, !"Dwarf Version", i32 4}
!57 = !{i32 2, !"Debug Info Version", i32 3}
!58 = !{i32 1, !"wchar_size", i32 4}
!59 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!60 = !DILocalVariable(name: "y", arg: 1, scope: !19, file: !3, line: 18, type: !7)
!61 = !DILocation(line: 18, column: 16, scope: !19)
!62 = !DILocalVariable(name: "x", arg: 2, scope: !19, file: !3, line: 18, type: !7)
!63 = !DILocation(line: 18, column: 23, scope: !19)
!64 = !DILocalVariable(name: "fmt", arg: 3, scope: !19, file: !3, line: 18, type: !12)
!65 = !DILocation(line: 18, column: 38, scope: !19)
!66 = !DILocalVariable(name: "ap", scope: !19, file: !3, line: 21, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !68, line: 52, baseType: !69)
!68 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !70, line: 32, baseType: !71)
!70 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stdarg.h", directory: "")
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3, line: 21, baseType: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !73, size: 192, elements: !80)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !3, line: 21, size: 192, elements: !74)
!74 = !{!75, !76, !77, !79}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !73, file: !3, line: 21, baseType: !32, size: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !73, file: !3, line: 21, baseType: !32, size: 32, offset: 32)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !73, file: !3, line: 21, baseType: !78, size: 64, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !73, file: !3, line: 21, baseType: !78, size: 64, offset: 128)
!80 = !{!81}
!81 = !DISubrange(count: 1)
!82 = !DILocation(line: 21, column: 10, scope: !19)
!83 = !DILocation(line: 22, column: 2, scope: !19)
!84 = !DILocation(line: 24, column: 2, scope: !19)
!85 = !DILocation(line: 25, column: 2, scope: !19)
!86 = !DILocation(line: 25, column: 24, scope: !19)
!87 = !DILocation(line: 25, column: 29, scope: !19)
!88 = !DILocation(line: 25, column: 16, scope: !19)
!89 = !DILocation(line: 26, column: 2, scope: !19)
!90 = !DILocation(line: 26, column: 23, scope: !19)
!91 = !DILocation(line: 26, column: 16, scope: !19)
!92 = !DILocation(line: 27, column: 2, scope: !19)
!93 = !DILocation(line: 28, column: 1, scope: !19)
!94 = distinct !DISubprogram(name: "eat", scope: !3, file: !3, line: 30, type: !95, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !7}
!97 = !DILocalVariable(name: "id", arg: 1, scope: !94, file: !3, line: 30, type: !7)
!98 = !DILocation(line: 30, column: 14, scope: !94)
!99 = !DILocalVariable(name: "f", scope: !94, file: !3, line: 32, type: !100)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 2)
!103 = !DILocation(line: 32, column: 6, scope: !94)
!104 = !DILocalVariable(name: "ration", scope: !94, file: !3, line: 32, type: !7)
!105 = !DILocation(line: 32, column: 12, scope: !94)
!106 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 32, type: !7)
!107 = !DILocation(line: 32, column: 20, scope: !94)
!108 = !DILocation(line: 33, column: 16, scope: !94)
!109 = !DILocation(line: 33, column: 9, scope: !94)
!110 = !DILocation(line: 33, column: 14, scope: !94)
!111 = !DILocation(line: 33, column: 2, scope: !94)
!112 = !DILocation(line: 33, column: 7, scope: !94)
!113 = !DILocation(line: 37, column: 15, scope: !94)
!114 = !DILocation(line: 37, column: 18, scope: !94)
!115 = !DILocation(line: 37, column: 23, scope: !94)
!116 = !DILocation(line: 37, column: 4, scope: !94)
!117 = !DILocation(line: 37, column: 7, scope: !94)
!118 = !DILocation(line: 37, column: 2, scope: !94)
!119 = !DILocation(line: 37, column: 12, scope: !94)
!120 = !DILocation(line: 39, column: 2, scope: !94)
!121 = !DILocation(line: 40, column: 8, scope: !94)
!122 = !DILocation(line: 40, column: 2, scope: !94)
!123 = !DILocation(line: 42, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !94, file: !3, line: 42, column: 2)
!125 = !DILocation(line: 42, column: 7, scope: !124)
!126 = !DILocation(line: 42, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 42, column: 2)
!128 = !DILocation(line: 42, column: 16, scope: !127)
!129 = !DILocation(line: 42, column: 2, scope: !124)
!130 = !DILocation(line: 43, column: 18, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 42, column: 26)
!132 = !DILocation(line: 43, column: 16, scope: !131)
!133 = !DILocation(line: 43, column: 14, scope: !131)
!134 = !DILocation(line: 43, column: 3, scope: !131)
!135 = !DILocation(line: 44, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !3, line: 44, column: 7)
!137 = !DILocation(line: 44, column: 7, scope: !131)
!138 = !DILocation(line: 44, column: 11, scope: !136)
!139 = !DILocation(line: 46, column: 9, scope: !131)
!140 = !DILocation(line: 46, column: 21, scope: !131)
!141 = !DILocation(line: 46, column: 19, scope: !131)
!142 = !DILocation(line: 46, column: 27, scope: !131)
!143 = !DILocation(line: 46, column: 24, scope: !131)
!144 = !DILocation(line: 46, column: 31, scope: !131)
!145 = !DILocation(line: 46, column: 16, scope: !131)
!146 = !DILocation(line: 46, column: 48, scope: !131)
!147 = !DILocation(line: 46, column: 46, scope: !131)
!148 = !DILocation(line: 46, column: 3, scope: !131)
!149 = !DILocation(line: 48, column: 3, scope: !131)
!150 = !DILocation(line: 49, column: 2, scope: !131)
!151 = !DILocation(line: 42, column: 22, scope: !127)
!152 = !DILocation(line: 42, column: 2, scope: !127)
!153 = distinct !{!153, !129, !154}
!154 = !DILocation(line: 49, column: 2, scope: !124)
!155 = !DILocation(line: 51, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !94, file: !3, line: 51, column: 2)
!157 = !DILocation(line: 51, column: 27, scope: !156)
!158 = !DILocation(line: 51, column: 34, scope: !156)
!159 = !DILocation(line: 51, column: 25, scope: !156)
!160 = !DILocation(line: 51, column: 21, scope: !156)
!161 = !DILocation(line: 51, column: 7, scope: !156)
!162 = !DILocation(line: 51, column: 39, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !3, line: 51, column: 2)
!164 = !DILocation(line: 51, column: 43, scope: !163)
!165 = !DILocation(line: 51, column: 41, scope: !163)
!166 = !DILocation(line: 51, column: 2, scope: !156)
!167 = !DILocation(line: 52, column: 9, scope: !163)
!168 = !DILocation(line: 52, column: 18, scope: !163)
!169 = !DILocation(line: 52, column: 20, scope: !163)
!170 = !DILocation(line: 52, column: 16, scope: !163)
!171 = !DILocation(line: 52, column: 3, scope: !163)
!172 = !DILocation(line: 52, column: 33, scope: !163)
!173 = !DILocation(line: 51, column: 52, scope: !163)
!174 = !DILocation(line: 51, column: 2, scope: !163)
!175 = distinct !{!175, !166, !176}
!176 = !DILocation(line: 52, column: 40, scope: !156)
!177 = !DILocation(line: 55, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !94, file: !3, line: 55, column: 2)
!179 = !DILocation(line: 55, column: 7, scope: !178)
!180 = !DILocation(line: 55, column: 14, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !3, line: 55, column: 2)
!182 = !DILocation(line: 55, column: 16, scope: !181)
!183 = !DILocation(line: 55, column: 2, scope: !178)
!184 = !DILocation(line: 55, column: 43, scope: !181)
!185 = !DILocation(line: 55, column: 41, scope: !181)
!186 = !DILocation(line: 55, column: 39, scope: !181)
!187 = !DILocation(line: 55, column: 26, scope: !181)
!188 = !DILocation(line: 55, column: 22, scope: !181)
!189 = !DILocation(line: 55, column: 2, scope: !181)
!190 = distinct !{!190, !183, !191}
!191 = !DILocation(line: 55, column: 45, scope: !178)
!192 = !DILocation(line: 56, column: 1, scope: !94)
!193 = distinct !DISubprogram(name: "think", scope: !3, file: !3, line: 58, type: !95, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DILocalVariable(name: "id", arg: 1, scope: !193, file: !3, line: 58, type: !7)
!195 = !DILocation(line: 58, column: 16, scope: !193)
!196 = !DILocalVariable(name: "i", scope: !193, file: !3, line: 60, type: !7)
!197 = !DILocation(line: 60, column: 6, scope: !193)
!198 = !DILocalVariable(name: "t", scope: !193, file: !3, line: 60, type: !7)
!199 = !DILocation(line: 60, column: 9, scope: !193)
!200 = !DILocalVariable(name: "buf", scope: !193, file: !3, line: 61, type: !201)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 512, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 64)
!204 = !DILocation(line: 61, column: 7, scope: !193)
!205 = !DILocation(line: 63, column: 2, scope: !193)
!206 = !DILocation(line: 64, column: 3, scope: !207)
!207 = distinct !DILexicalBlock(scope: !193, file: !3, line: 63, column: 5)
!208 = !DILocation(line: 65, column: 11, scope: !207)
!209 = !DILocation(line: 65, column: 39, scope: !207)
!210 = !DILocation(line: 65, column: 46, scope: !207)
!211 = !DILocation(line: 65, column: 37, scope: !207)
!212 = !DILocation(line: 65, column: 29, scope: !207)
!213 = !DILocation(line: 65, column: 3, scope: !207)
!214 = !DILocation(line: 67, column: 10, scope: !215)
!215 = distinct !DILexicalBlock(scope: !207, file: !3, line: 67, column: 3)
!216 = !DILocation(line: 67, column: 8, scope: !215)
!217 = !DILocation(line: 67, column: 19, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !3, line: 67, column: 3)
!219 = !DILocation(line: 67, column: 15, scope: !218)
!220 = !DILocation(line: 67, column: 3, scope: !215)
!221 = !DILocation(line: 68, column: 10, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !3, line: 67, column: 28)
!223 = !DILocation(line: 68, column: 14, scope: !222)
!224 = !DILocation(line: 68, column: 15, scope: !222)
!225 = !DILocation(line: 68, column: 30, scope: !222)
!226 = !DILocation(line: 68, column: 26, scope: !222)
!227 = !DILocation(line: 68, column: 4, scope: !222)
!228 = !DILocation(line: 69, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !3, line: 69, column: 8)
!230 = !DILocation(line: 69, column: 10, scope: !229)
!231 = !DILocation(line: 69, column: 8, scope: !222)
!232 = !DILocation(line: 69, column: 15, scope: !229)
!233 = !DILocation(line: 70, column: 3, scope: !222)
!234 = !DILocation(line: 67, column: 24, scope: !218)
!235 = !DILocation(line: 67, column: 3, scope: !218)
!236 = distinct !{!236, !220, !237}
!237 = !DILocation(line: 70, column: 3, scope: !215)
!238 = !DILocation(line: 71, column: 19, scope: !207)
!239 = !DILocation(line: 71, column: 26, scope: !207)
!240 = !DILocation(line: 71, column: 17, scope: !207)
!241 = !DILocation(line: 71, column: 3, scope: !207)
!242 = !DILocation(line: 72, column: 2, scope: !207)
!243 = !DILocation(line: 72, column: 11, scope: !193)
!244 = distinct !{!244, !205, !245}
!245 = !DILocation(line: 72, column: 12, scope: !193)
!246 = !DILocation(line: 73, column: 1, scope: !193)
!247 = distinct !DISubprogram(name: "philosophize", scope: !3, file: !3, line: 75, type: !248, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DISubroutineType(types: !249)
!249 = !{!78, !78}
!250 = !DILocalVariable(name: "a", arg: 1, scope: !247, file: !3, line: 75, type: !78)
!251 = !DILocation(line: 75, column: 26, scope: !247)
!252 = !DILocalVariable(name: "id", scope: !247, file: !3, line: 77, type: !7)
!253 = !DILocation(line: 77, column: 6, scope: !247)
!254 = !DILocation(line: 77, column: 18, scope: !247)
!255 = !DILocation(line: 77, column: 12, scope: !247)
!256 = !DILocation(line: 77, column: 11, scope: !247)
!257 = !DILocation(line: 78, column: 8, scope: !247)
!258 = !DILocation(line: 78, column: 29, scope: !247)
!259 = !DILocation(line: 78, column: 23, scope: !247)
!260 = !DILocation(line: 78, column: 2, scope: !247)
!261 = !DILocation(line: 79, column: 2, scope: !247)
!262 = !DILocation(line: 79, column: 17, scope: !247)
!263 = !DILocation(line: 79, column: 11, scope: !247)
!264 = !DILocation(line: 79, column: 26, scope: !247)
!265 = !DILocation(line: 79, column: 22, scope: !247)
!266 = distinct !{!266, !261, !267}
!267 = !DILocation(line: 79, column: 28, scope: !247)
!268 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 82, type: !269, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!269 = !DISubroutineType(types: !270)
!270 = !{!7}
!271 = !DILocalVariable(name: "i", scope: !268, file: !3, line: 84, type: !7)
!272 = !DILocation(line: 84, column: 6, scope: !268)
!273 = !DILocalVariable(name: "id", scope: !268, file: !3, line: 84, type: !274)
!274 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !15)
!275 = !DILocation(line: 84, column: 9, scope: !268)
!276 = !DILocalVariable(name: "tid", scope: !268, file: !3, line: 85, type: !277)
!277 = !DICompositeType(tag: DW_TAG_array_type, baseType: !278, size: 320, elements: !15)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !23, line: 27, baseType: !279)
!279 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!280 = !DILocation(line: 85, column: 12, scope: !268)
!281 = !DILocation(line: 87, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !268, file: !3, line: 87, column: 2)
!283 = !DILocation(line: 87, column: 7, scope: !282)
!284 = !DILocation(line: 87, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !3, line: 87, column: 2)
!286 = !DILocation(line: 87, column: 16, scope: !285)
!287 = !DILocation(line: 87, column: 2, scope: !282)
!288 = !DILocation(line: 88, column: 39, scope: !285)
!289 = !DILocation(line: 88, column: 34, scope: !285)
!290 = !DILocation(line: 88, column: 31, scope: !285)
!291 = !DILocation(line: 88, column: 37, scope: !285)
!292 = !DILocation(line: 88, column: 28, scope: !285)
!293 = !DILocation(line: 88, column: 3, scope: !285)
!294 = !DILocation(line: 87, column: 22, scope: !285)
!295 = !DILocation(line: 87, column: 2, scope: !285)
!296 = distinct !{!296, !287, !297}
!297 = !DILocation(line: 88, column: 44, scope: !282)
!298 = !DILocation(line: 90, column: 9, scope: !299)
!299 = distinct !DILexicalBlock(scope: !268, file: !3, line: 90, column: 2)
!300 = !DILocation(line: 90, column: 7, scope: !299)
!301 = !DILocation(line: 90, column: 14, scope: !302)
!302 = distinct !DILexicalBlock(scope: !299, file: !3, line: 90, column: 2)
!303 = !DILocation(line: 90, column: 16, scope: !302)
!304 = !DILocation(line: 90, column: 2, scope: !299)
!305 = !DILocation(line: 91, column: 18, scope: !302)
!306 = !DILocation(line: 91, column: 24, scope: !302)
!307 = !DILocation(line: 91, column: 22, scope: !302)
!308 = !DILocation(line: 91, column: 44, scope: !302)
!309 = !DILocation(line: 91, column: 49, scope: !302)
!310 = !DILocation(line: 91, column: 47, scope: !302)
!311 = !DILocation(line: 91, column: 3, scope: !302)
!312 = !DILocation(line: 90, column: 22, scope: !302)
!313 = !DILocation(line: 90, column: 2, scope: !302)
!314 = distinct !{!314, !304, !315}
!315 = !DILocation(line: 91, column: 50, scope: !299)
!316 = !DILocation(line: 94, column: 22, scope: !268)
!317 = !DILocation(line: 94, column: 9, scope: !268)
!318 = !DILocation(line: 94, column: 2, scope: !268)
!319 = !{!320}
!320 = !{i64 2, i64 3, i1 false}
