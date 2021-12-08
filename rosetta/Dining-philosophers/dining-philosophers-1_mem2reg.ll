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
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata i32 %y, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %x, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8* %fmt, metadata !63, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %ap, metadata !64, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !81
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !81
  call void @llvm.va_start(i8* %arraydecay1), !dbg !81
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* @print.screen) #2, !dbg !82
  %add = add nsw i32 %y, 1, !dbg !83
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0), i32 %add, i32 %x), !dbg !83
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, !dbg !84
  %call4 = call i32 @vprintf(i8* %fmt, %struct.__va_list_tag* %arraydecay3), !dbg !85
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0), i32 6, i32 1), !dbg !86
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !87
  %call6 = call i32 @fflush(%struct._IO_FILE* %0), !dbg !88
  %call7 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* @print.screen) #2, !dbg !89
  ret void, !dbg !90
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
define dso_local void @eat(i32 %id) #0 !dbg !91 {
entry:
  %f = alloca [2 x i32], align 4
  call void @llvm.dbg.value(metadata i32 %id, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [2 x i32]* %f, metadata !96, metadata !DIExpression()), !dbg !100
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 1, !dbg !101
  store i32 %id, i32* %arrayidx, align 4, !dbg !102
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 0, !dbg !103
  store i32 %id, i32* %arrayidx1, align 4, !dbg !104
  %add = add nsw i32 %id, 1, !dbg !105
  %rem = srem i32 %add, 5, !dbg !106
  %and = and i32 %id, 1, !dbg !107
  %idxprom = sext i32 %and to i64, !dbg !108
  %arrayidx2 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom, !dbg !108
  store i32 %rem, i32* %arrayidx2, align 4, !dbg !109
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !110
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 12, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0)), !dbg !111
  call void @llvm.dbg.value(metadata i32 0, metadata !112, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !115
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !112, metadata !DIExpression()), !dbg !95
  %cmp = icmp slt i32 %i.0, 2, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %idxprom3 = sext i32 %i.0 to i64, !dbg !119
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom3, !dbg !119
  %0 = load i32, i32* %arrayidx4, align 4, !dbg !119
  %idx.ext = sext i32 %0 to i64, !dbg !121
  %add.ptr = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext, !dbg !121
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %add.ptr) #2, !dbg !122
  %tobool = icmp ne i32 %i.0, 0, !dbg !123
  br i1 %tobool, label %if.end, label %if.then, !dbg !125

if.then:                                          ; preds = %for.body
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !126
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %for.body
  %idxprom5 = sext i32 %i.0 to i64, !dbg !127
  %arrayidx6 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom5, !dbg !127
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !127
  %cmp7 = icmp ne i32 %1, %id, !dbg !128
  %conv = zext i1 %cmp7 to i32, !dbg !128
  %mul = mul nsw i32 %conv, 6, !dbg !129
  %add8 = add nsw i32 12, %mul, !dbg !130
  %idxprom9 = sext i32 %i.0 to i64, !dbg !131
  %arrayidx10 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom9, !dbg !131
  %2 = load i32, i32* %arrayidx10, align 4, !dbg !131
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 %add8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i32 %2), !dbg !132
  %call11 = call i32 @sleep(i32 1), !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !135
  call void @llvm.dbg.value(metadata i32 %inc, metadata !112, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !112, metadata !DIExpression()), !dbg !95
  %call12 = call i32 @rand() #2, !dbg !139
  %rem13 = srem i32 %call12, 8, !dbg !141
  %add14 = add nsw i32 3, %rem13, !dbg !142
  call void @llvm.dbg.value(metadata i32 %add14, metadata !143, metadata !DIExpression()), !dbg !95
  br label %for.cond15, !dbg !144

for.cond15:                                       ; preds = %for.inc22, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc23, %for.inc22 ], !dbg !145
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !112, metadata !DIExpression()), !dbg !95
  %cmp16 = icmp slt i32 %i.1, %add14, !dbg !146
  br i1 %cmp16, label %for.body18, label %for.end24, !dbg !148

for.body18:                                       ; preds = %for.cond15
  %mul19 = mul nsw i32 %i.1, 4, !dbg !149
  %add20 = add nsw i32 24, %mul19, !dbg !150
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 %add20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0)), !dbg !151
  %call21 = call i32 @sleep(i32 1), !dbg !152
  br label %for.inc22, !dbg !151

for.inc22:                                        ; preds = %for.body18
  %inc23 = add nsw i32 %i.1, 1, !dbg !153
  call void @llvm.dbg.value(metadata i32 %inc23, metadata !112, metadata !DIExpression()), !dbg !95
  br label %for.cond15, !dbg !154, !llvm.loop !155

for.end24:                                        ; preds = %for.cond15
  call void @llvm.dbg.value(metadata i32 0, metadata !112, metadata !DIExpression()), !dbg !95
  br label %for.cond25, !dbg !157

for.cond25:                                       ; preds = %for.inc34, %for.end24
  %i.2 = phi i32 [ 0, %for.end24 ], [ %inc35, %for.inc34 ], !dbg !159
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !112, metadata !DIExpression()), !dbg !95
  %cmp26 = icmp slt i32 %i.2, 2, !dbg !160
  br i1 %cmp26, label %for.body28, label %for.end36, !dbg !162

for.body28:                                       ; preds = %for.cond25
  %idxprom29 = sext i32 %i.2 to i64, !dbg !163
  %arrayidx30 = getelementptr inbounds [2 x i32], [2 x i32]* %f, i64 0, i64 %idxprom29, !dbg !163
  %3 = load i32, i32* %arrayidx30, align 4, !dbg !163
  %idx.ext31 = sext i32 %3 to i64, !dbg !164
  %add.ptr32 = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext31, !dbg !164
  %call33 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %add.ptr32) #2, !dbg !165
  br label %for.inc34, !dbg !165

for.inc34:                                        ; preds = %for.body28
  %inc35 = add nsw i32 %i.2, 1, !dbg !166
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !112, metadata !DIExpression()), !dbg !95
  br label %for.cond25, !dbg !167, !llvm.loop !168

for.end36:                                        ; preds = %for.cond25
  ret void, !dbg !170
}

declare dso_local i32 @sleep(i32) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @think(i32 %id) #0 !dbg !171 {
entry:
  %buf = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %id, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [64 x i8]* %buf, metadata !174, metadata !DIExpression()), !dbg !178
  %0 = bitcast [64 x i8]* %buf to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 64, i1 false), !dbg !178
  br label %do.body, !dbg !179

do.body:                                          ; preds = %do.cond, %entry
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0)), !dbg !180
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 0, !dbg !182
  %call = call i32 @rand() #2, !dbg !183
  %rem = srem i32 %call, 5, !dbg !184
  call void @llvm.dbg.value(metadata i32 %rem, metadata !185, metadata !DIExpression()), !dbg !173
  %idxprom = sext i32 %rem to i64, !dbg !186
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @topic, i64 0, i64 %idxprom, !dbg !186
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !186
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0), i8* %1) #2, !dbg !187
  call void @llvm.dbg.value(metadata i32 0, metadata !188, metadata !DIExpression()), !dbg !173
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %do.body
  %i.0 = phi i32 [ 0, %do.body ], [ %inc, %for.inc ], !dbg !191
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !188, metadata !DIExpression()), !dbg !173
  %idxprom2 = sext i32 %i.0 to i64, !dbg !192
  %arrayidx3 = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 %idxprom2, !dbg !192
  %2 = load i8, i8* %arrayidx3, align 1, !dbg !192
  %tobool = icmp ne i8 %2, 0, !dbg !194
  br i1 %tobool, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 12, !dbg !195
  %idxprom4 = sext i32 %i.0 to i64, !dbg !197
  %arrayidx5 = getelementptr inbounds [64 x i8], [64 x i8]* %buf, i64 0, i64 %idxprom4, !dbg !197
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !197
  %conv = sext i8 %3 to i32, !dbg !197
  call void (i32, i32, i8*, ...) @print(i32 %id, i32 %add, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i64 0, i64 0), i32 %conv), !dbg !198
  %cmp = icmp slt i32 %i.0, 5, !dbg !199
  br i1 %cmp, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %for.body
  %call7 = call i32 @usleep(i32 200000), !dbg !202
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !204
  call void @llvm.dbg.value(metadata i32 %inc, metadata !188, metadata !DIExpression()), !dbg !173
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %call8 = call i32 @rand() #2, !dbg !208
  %rem9 = srem i32 %call8, 1000000, !dbg !209
  %add10 = add nsw i32 500000, %rem9, !dbg !210
  %call11 = call i32 @usleep(i32 %add10), !dbg !211
  br label %do.cond, !dbg !212

do.cond:                                          ; preds = %for.end
  %tobool12 = icmp ne i32 %rem, 0, !dbg !212
  br i1 %tobool12, label %do.body, label %do.end, !dbg !212, !llvm.loop !213

do.end:                                           ; preds = %do.cond
  ret void, !dbg !215
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

declare dso_local i32 @usleep(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @philosophize(i8* %a) #0 !dbg !216 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = bitcast i8* %a to i32*, !dbg !221
  %1 = load i32, i32* %0, align 4, !dbg !222
  call void @llvm.dbg.value(metadata i32 %1, metadata !223, metadata !DIExpression()), !dbg !220
  %idxprom = sext i32 %1 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom, !dbg !224
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !224
  call void (i32, i32, i8*, ...) @print(i32 %1, i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0), i8* %2), !dbg !225
  br label %while.body, !dbg !226

while.body:                                       ; preds = %while.body, %entry
  call void @think(i32 %1), !dbg !227
  call void @eat(i32 %1), !dbg !228
  br label %while.body, !dbg !226, !llvm.loop !229
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !231 {
entry:
  %id = alloca [5 x i32], align 16
  %tid = alloca [5 x i64], align 16
  call void @llvm.dbg.declare(metadata [5 x i32]* %id, metadata !234, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata [5 x i64]* %tid, metadata !237, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.value(metadata i32 0, metadata !242, metadata !DIExpression()), !dbg !243
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !246
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !242, metadata !DIExpression()), !dbg !243
  %cmp = icmp slt i32 %i.0, 5, !dbg !247
  br i1 %cmp, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !250
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %id, i64 0, i64 %idxprom, !dbg !250
  store i32 %i.0, i32* %arrayidx, align 4, !dbg !251
  %idx.ext = sext i32 %i.0 to i64, !dbg !252
  %add.ptr = getelementptr inbounds %union.pthread_mutex_t, %union.pthread_mutex_t* getelementptr inbounds ([5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* @forks, i64 0, i64 0), i64 %idx.ext, !dbg !252
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %add.ptr, %union.pthread_mutexattr_t* null) #2, !dbg !253
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !254
  call void @llvm.dbg.value(metadata i32 %inc, metadata !242, metadata !DIExpression()), !dbg !243
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !242, metadata !DIExpression()), !dbg !243
  br label %for.cond1, !dbg !258

for.cond1:                                        ; preds = %for.inc10, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc11, %for.inc10 ], !dbg !260
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !242, metadata !DIExpression()), !dbg !243
  %cmp2 = icmp slt i32 %i.1, 5, !dbg !261
  br i1 %cmp2, label %for.body3, label %for.end12, !dbg !263

for.body3:                                        ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %tid, i64 0, i64 0, !dbg !264
  %idx.ext4 = sext i32 %i.1 to i64, !dbg !265
  %add.ptr5 = getelementptr inbounds i64, i64* %arraydecay, i64 %idx.ext4, !dbg !265
  %arraydecay6 = getelementptr inbounds [5 x i32], [5 x i32]* %id, i64 0, i64 0, !dbg !266
  %idx.ext7 = sext i32 %i.1 to i64, !dbg !267
  %add.ptr8 = getelementptr inbounds i32, i32* %arraydecay6, i64 %idx.ext7, !dbg !267
  %0 = bitcast i32* %add.ptr8 to i8*, !dbg !266
  %call9 = call i32 @pthread_create(i64* %add.ptr5, %union.pthread_attr_t* null, i8* (i8*)* @philosophize, i8* %0) #2, !dbg !268
  br label %for.inc10, !dbg !268

for.inc10:                                        ; preds = %for.body3
  %inc11 = add nsw i32 %i.1, 1, !dbg !269
  call void @llvm.dbg.value(metadata i32 %inc11, metadata !242, metadata !DIExpression()), !dbg !243
  br label %for.cond1, !dbg !270, !llvm.loop !271

for.end12:                                        ; preds = %for.cond1
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %tid, i64 0, i64 0, !dbg !273
  %1 = load i64, i64* %arrayidx13, align 16, !dbg !273
  %call14 = call i32 @pthread_join(i64 %1, i8** null), !dbg !274
  ret i32 %call14, !dbg !275
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #3

; Function Attrs: nounwind
declare !callback !276 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #3

declare dso_local i32 @pthread_join(i64, i8**) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!61 = !DILocation(line: 0, scope: !19)
!62 = !DILocalVariable(name: "x", arg: 2, scope: !19, file: !3, line: 18, type: !7)
!63 = !DILocalVariable(name: "fmt", arg: 3, scope: !19, file: !3, line: 18, type: !12)
!64 = !DILocalVariable(name: "ap", scope: !19, file: !3, line: 21, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !66, line: 52, baseType: !67)
!66 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !68, line: 32, baseType: !69)
!68 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stdarg.h", directory: "")
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !3, line: 21, baseType: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 192, elements: !78)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !3, line: 21, size: 192, elements: !72)
!72 = !{!73, !74, !75, !77}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !71, file: !3, line: 21, baseType: !32, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !71, file: !3, line: 21, baseType: !32, size: 32, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !71, file: !3, line: 21, baseType: !76, size: 64, offset: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !71, file: !3, line: 21, baseType: !76, size: 64, offset: 128)
!78 = !{!79}
!79 = !DISubrange(count: 1)
!80 = !DILocation(line: 21, column: 10, scope: !19)
!81 = !DILocation(line: 22, column: 2, scope: !19)
!82 = !DILocation(line: 24, column: 2, scope: !19)
!83 = !DILocation(line: 25, column: 2, scope: !19)
!84 = !DILocation(line: 25, column: 29, scope: !19)
!85 = !DILocation(line: 25, column: 16, scope: !19)
!86 = !DILocation(line: 26, column: 2, scope: !19)
!87 = !DILocation(line: 26, column: 23, scope: !19)
!88 = !DILocation(line: 26, column: 16, scope: !19)
!89 = !DILocation(line: 27, column: 2, scope: !19)
!90 = !DILocation(line: 28, column: 1, scope: !19)
!91 = distinct !DISubprogram(name: "eat", scope: !3, file: !3, line: 30, type: !92, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DISubroutineType(types: !93)
!93 = !{null, !7}
!94 = !DILocalVariable(name: "id", arg: 1, scope: !91, file: !3, line: 30, type: !7)
!95 = !DILocation(line: 0, scope: !91)
!96 = !DILocalVariable(name: "f", scope: !91, file: !3, line: 32, type: !97)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 2)
!100 = !DILocation(line: 32, column: 6, scope: !91)
!101 = !DILocation(line: 33, column: 9, scope: !91)
!102 = !DILocation(line: 33, column: 14, scope: !91)
!103 = !DILocation(line: 33, column: 2, scope: !91)
!104 = !DILocation(line: 33, column: 7, scope: !91)
!105 = !DILocation(line: 37, column: 18, scope: !91)
!106 = !DILocation(line: 37, column: 23, scope: !91)
!107 = !DILocation(line: 37, column: 7, scope: !91)
!108 = !DILocation(line: 37, column: 2, scope: !91)
!109 = !DILocation(line: 37, column: 12, scope: !91)
!110 = !DILocation(line: 39, column: 2, scope: !91)
!111 = !DILocation(line: 40, column: 2, scope: !91)
!112 = !DILocalVariable(name: "i", scope: !91, file: !3, line: 32, type: !7)
!113 = !DILocation(line: 42, column: 7, scope: !114)
!114 = distinct !DILexicalBlock(scope: !91, file: !3, line: 42, column: 2)
!115 = !DILocation(line: 0, scope: !114)
!116 = !DILocation(line: 42, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !3, line: 42, column: 2)
!118 = !DILocation(line: 42, column: 2, scope: !114)
!119 = !DILocation(line: 43, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !3, line: 42, column: 26)
!121 = !DILocation(line: 43, column: 14, scope: !120)
!122 = !DILocation(line: 43, column: 3, scope: !120)
!123 = !DILocation(line: 44, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 44, column: 7)
!125 = !DILocation(line: 44, column: 7, scope: !120)
!126 = !DILocation(line: 44, column: 11, scope: !124)
!127 = !DILocation(line: 46, column: 19, scope: !120)
!128 = !DILocation(line: 46, column: 24, scope: !120)
!129 = !DILocation(line: 46, column: 31, scope: !120)
!130 = !DILocation(line: 46, column: 16, scope: !120)
!131 = !DILocation(line: 46, column: 46, scope: !120)
!132 = !DILocation(line: 46, column: 3, scope: !120)
!133 = !DILocation(line: 48, column: 3, scope: !120)
!134 = !DILocation(line: 49, column: 2, scope: !120)
!135 = !DILocation(line: 42, column: 22, scope: !117)
!136 = !DILocation(line: 42, column: 2, scope: !117)
!137 = distinct !{!137, !118, !138}
!138 = !DILocation(line: 49, column: 2, scope: !114)
!139 = !DILocation(line: 51, column: 27, scope: !140)
!140 = distinct !DILexicalBlock(scope: !91, file: !3, line: 51, column: 2)
!141 = !DILocation(line: 51, column: 34, scope: !140)
!142 = !DILocation(line: 51, column: 25, scope: !140)
!143 = !DILocalVariable(name: "ration", scope: !91, file: !3, line: 32, type: !7)
!144 = !DILocation(line: 51, column: 7, scope: !140)
!145 = !DILocation(line: 0, scope: !140)
!146 = !DILocation(line: 51, column: 41, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !3, line: 51, column: 2)
!148 = !DILocation(line: 51, column: 2, scope: !140)
!149 = !DILocation(line: 52, column: 20, scope: !147)
!150 = !DILocation(line: 52, column: 16, scope: !147)
!151 = !DILocation(line: 52, column: 3, scope: !147)
!152 = !DILocation(line: 52, column: 33, scope: !147)
!153 = !DILocation(line: 51, column: 52, scope: !147)
!154 = !DILocation(line: 51, column: 2, scope: !147)
!155 = distinct !{!155, !148, !156}
!156 = !DILocation(line: 52, column: 40, scope: !140)
!157 = !DILocation(line: 55, column: 7, scope: !158)
!158 = distinct !DILexicalBlock(scope: !91, file: !3, line: 55, column: 2)
!159 = !DILocation(line: 0, scope: !158)
!160 = !DILocation(line: 55, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 55, column: 2)
!162 = !DILocation(line: 55, column: 2, scope: !158)
!163 = !DILocation(line: 55, column: 41, scope: !161)
!164 = !DILocation(line: 55, column: 39, scope: !161)
!165 = !DILocation(line: 55, column: 26, scope: !161)
!166 = !DILocation(line: 55, column: 22, scope: !161)
!167 = !DILocation(line: 55, column: 2, scope: !161)
!168 = distinct !{!168, !162, !169}
!169 = !DILocation(line: 55, column: 45, scope: !158)
!170 = !DILocation(line: 56, column: 1, scope: !91)
!171 = distinct !DISubprogram(name: "think", scope: !3, file: !3, line: 58, type: !92, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!172 = !DILocalVariable(name: "id", arg: 1, scope: !171, file: !3, line: 58, type: !7)
!173 = !DILocation(line: 0, scope: !171)
!174 = !DILocalVariable(name: "buf", scope: !171, file: !3, line: 61, type: !175)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 512, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 64)
!178 = !DILocation(line: 61, column: 7, scope: !171)
!179 = !DILocation(line: 63, column: 2, scope: !171)
!180 = !DILocation(line: 64, column: 3, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !3, line: 63, column: 5)
!182 = !DILocation(line: 65, column: 11, scope: !181)
!183 = !DILocation(line: 65, column: 39, scope: !181)
!184 = !DILocation(line: 65, column: 46, scope: !181)
!185 = !DILocalVariable(name: "t", scope: !171, file: !3, line: 60, type: !7)
!186 = !DILocation(line: 65, column: 29, scope: !181)
!187 = !DILocation(line: 65, column: 3, scope: !181)
!188 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 60, type: !7)
!189 = !DILocation(line: 67, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !3, line: 67, column: 3)
!191 = !DILocation(line: 0, scope: !190)
!192 = !DILocation(line: 67, column: 15, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !3, line: 67, column: 3)
!194 = !DILocation(line: 67, column: 3, scope: !190)
!195 = !DILocation(line: 68, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !3, line: 67, column: 28)
!197 = !DILocation(line: 68, column: 26, scope: !196)
!198 = !DILocation(line: 68, column: 4, scope: !196)
!199 = !DILocation(line: 69, column: 10, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !3, line: 69, column: 8)
!201 = !DILocation(line: 69, column: 8, scope: !196)
!202 = !DILocation(line: 69, column: 15, scope: !200)
!203 = !DILocation(line: 70, column: 3, scope: !196)
!204 = !DILocation(line: 67, column: 24, scope: !193)
!205 = !DILocation(line: 67, column: 3, scope: !193)
!206 = distinct !{!206, !194, !207}
!207 = !DILocation(line: 70, column: 3, scope: !190)
!208 = !DILocation(line: 71, column: 19, scope: !181)
!209 = !DILocation(line: 71, column: 26, scope: !181)
!210 = !DILocation(line: 71, column: 17, scope: !181)
!211 = !DILocation(line: 71, column: 3, scope: !181)
!212 = !DILocation(line: 72, column: 2, scope: !181)
!213 = distinct !{!213, !179, !214}
!214 = !DILocation(line: 72, column: 12, scope: !171)
!215 = !DILocation(line: 73, column: 1, scope: !171)
!216 = distinct !DISubprogram(name: "philosophize", scope: !3, file: !3, line: 75, type: !217, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!217 = !DISubroutineType(types: !218)
!218 = !{!76, !76}
!219 = !DILocalVariable(name: "a", arg: 1, scope: !216, file: !3, line: 75, type: !76)
!220 = !DILocation(line: 0, scope: !216)
!221 = !DILocation(line: 77, column: 12, scope: !216)
!222 = !DILocation(line: 77, column: 11, scope: !216)
!223 = !DILocalVariable(name: "id", scope: !216, file: !3, line: 77, type: !7)
!224 = !DILocation(line: 78, column: 23, scope: !216)
!225 = !DILocation(line: 78, column: 2, scope: !216)
!226 = !DILocation(line: 79, column: 2, scope: !216)
!227 = !DILocation(line: 79, column: 11, scope: !216)
!228 = !DILocation(line: 79, column: 22, scope: !216)
!229 = distinct !{!229, !226, !230}
!230 = !DILocation(line: 79, column: 28, scope: !216)
!231 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 82, type: !232, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!232 = !DISubroutineType(types: !233)
!233 = !{!7}
!234 = !DILocalVariable(name: "id", scope: !231, file: !3, line: 84, type: !235)
!235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !15)
!236 = !DILocation(line: 84, column: 9, scope: !231)
!237 = !DILocalVariable(name: "tid", scope: !231, file: !3, line: 85, type: !238)
!238 = !DICompositeType(tag: DW_TAG_array_type, baseType: !239, size: 320, elements: !15)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !23, line: 27, baseType: !240)
!240 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!241 = !DILocation(line: 85, column: 12, scope: !231)
!242 = !DILocalVariable(name: "i", scope: !231, file: !3, line: 84, type: !7)
!243 = !DILocation(line: 0, scope: !231)
!244 = !DILocation(line: 87, column: 7, scope: !245)
!245 = distinct !DILexicalBlock(scope: !231, file: !3, line: 87, column: 2)
!246 = !DILocation(line: 0, scope: !245)
!247 = !DILocation(line: 87, column: 16, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !3, line: 87, column: 2)
!249 = !DILocation(line: 87, column: 2, scope: !245)
!250 = !DILocation(line: 88, column: 31, scope: !248)
!251 = !DILocation(line: 88, column: 37, scope: !248)
!252 = !DILocation(line: 88, column: 28, scope: !248)
!253 = !DILocation(line: 88, column: 3, scope: !248)
!254 = !DILocation(line: 87, column: 22, scope: !248)
!255 = !DILocation(line: 87, column: 2, scope: !248)
!256 = distinct !{!256, !249, !257}
!257 = !DILocation(line: 88, column: 44, scope: !245)
!258 = !DILocation(line: 90, column: 7, scope: !259)
!259 = distinct !DILexicalBlock(scope: !231, file: !3, line: 90, column: 2)
!260 = !DILocation(line: 0, scope: !259)
!261 = !DILocation(line: 90, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !3, line: 90, column: 2)
!263 = !DILocation(line: 90, column: 2, scope: !259)
!264 = !DILocation(line: 91, column: 18, scope: !262)
!265 = !DILocation(line: 91, column: 22, scope: !262)
!266 = !DILocation(line: 91, column: 44, scope: !262)
!267 = !DILocation(line: 91, column: 47, scope: !262)
!268 = !DILocation(line: 91, column: 3, scope: !262)
!269 = !DILocation(line: 90, column: 22, scope: !262)
!270 = !DILocation(line: 90, column: 2, scope: !262)
!271 = distinct !{!271, !263, !272}
!272 = !DILocation(line: 91, column: 50, scope: !259)
!273 = !DILocation(line: 94, column: 22, scope: !231)
!274 = !DILocation(line: 94, column: 9, scope: !231)
!275 = !DILocation(line: 94, column: 2, scope: !231)
!276 = !{!277}
!277 = !{i64 2, i64 3, i1 false}
