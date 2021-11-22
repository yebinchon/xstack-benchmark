; ModuleID = 'dining-philosophers-2.c'
source_filename = "dining-philosophers-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.philData = type { %union.pthread_mutex_t*, %union.pthread_mutex_t*, i8*, i64, i32 }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@running = dso_local global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [30 x i8] c"%s is sleeping --er thinking\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%s is hungry\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"%s is eating\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Kant\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"Guatma\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Russel\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"Aristotle\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Bart\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"Failed to initialize mutexes.\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"cleanup time\0A\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"error joining thread for %s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @PhilPhunction(i8* %p) #0 !dbg !59 {
entry:
  %p.addr = alloca i8*, align 8
  %phil = alloca %struct.philData*, align 8
  %failed = alloca i32, align 4
  %tries_left = alloca i32, align 4
  %fork_lft = alloca %union.pthread_mutex_t*, align 8
  %fork_rgt = alloca %union.pthread_mutex_t*, align 8
  %fork_tmp = alloca %union.pthread_mutex_t*, align 8
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata %struct.philData** %phil, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** %p.addr, align 8, !dbg !66
  %1 = bitcast i8* %0 to %struct.philData*, !dbg !67
  store %struct.philData* %1, %struct.philData** %phil, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32* %failed, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %tries_left, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %union.pthread_mutex_t** %fork_lft, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %union.pthread_mutex_t** %fork_rgt, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %union.pthread_mutex_t** %fork_tmp, metadata !76, metadata !DIExpression()), !dbg !77
  br label %while.cond, !dbg !78

while.cond:                                       ; preds = %if.end24, %entry
  %2 = load i32, i32* @running, align 4, !dbg !79
  %tobool = icmp ne i32 %2, 0, !dbg !78
  br i1 %tobool, label %while.body, label %while.end, !dbg !78

while.body:                                       ; preds = %while.cond
  %3 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !80
  %name = getelementptr inbounds %struct.philData, %struct.philData* %3, i32 0, i32 2, !dbg !82
  %4 = load i8*, i8** %name, align 8, !dbg !82
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0), i8* %4), !dbg !83
  %call1 = call i32 @rand() #6, !dbg !84
  %rem = srem i32 %call1, 8, !dbg !85
  %add = add nsw i32 1, %rem, !dbg !86
  %call2 = call i32 @sleep(i32 %add), !dbg !87
  %5 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !88
  %fork_lft3 = getelementptr inbounds %struct.philData, %struct.philData* %5, i32 0, i32 0, !dbg !89
  %6 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft3, align 8, !dbg !89
  store %union.pthread_mutex_t* %6, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !90
  %7 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !91
  %fork_rgt4 = getelementptr inbounds %struct.philData, %struct.philData* %7, i32 0, i32 1, !dbg !92
  %8 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt4, align 8, !dbg !92
  store %union.pthread_mutex_t* %8, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !93
  %9 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !94
  %name5 = getelementptr inbounds %struct.philData, %struct.philData* %9, i32 0, i32 2, !dbg !95
  %10 = load i8*, i8** %name5, align 8, !dbg !95
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i8* %10), !dbg !96
  store i32 2, i32* %tries_left, align 4, !dbg !97
  br label %do.body, !dbg !98

do.body:                                          ; preds = %land.end, %while.body
  %11 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !99
  %call7 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %11) #6, !dbg !101
  store i32 %call7, i32* %failed, align 4, !dbg !102
  %12 = load i32, i32* %tries_left, align 4, !dbg !103
  %cmp = icmp sgt i32 %12, 0, !dbg !104
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !105

cond.true:                                        ; preds = %do.body
  %13 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !106
  %call8 = call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %13) #6, !dbg !107
  br label %cond.end, !dbg !105

cond.false:                                       ; preds = %do.body
  %14 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !108
  %call9 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %14) #6, !dbg !109
  br label %cond.end, !dbg !105

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call8, %cond.true ], [ %call9, %cond.false ], !dbg !105
  store i32 %cond, i32* %failed, align 4, !dbg !110
  %15 = load i32, i32* %failed, align 4, !dbg !111
  %tobool10 = icmp ne i32 %15, 0, !dbg !111
  br i1 %tobool10, label %if.then, label %if.end, !dbg !113, !cf.info !114

if.then:                                          ; preds = %cond.end
  %16 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !115
  %call11 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %16) #6, !dbg !117
  %17 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !118
  store %union.pthread_mutex_t* %17, %union.pthread_mutex_t** %fork_tmp, align 8, !dbg !119
  %18 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !120
  store %union.pthread_mutex_t* %18, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !121
  %19 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_tmp, align 8, !dbg !122
  store %union.pthread_mutex_t* %19, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !123
  %20 = load i32, i32* %tries_left, align 4, !dbg !124
  %sub = sub nsw i32 %20, 1, !dbg !124
  store i32 %sub, i32* %tries_left, align 4, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %cond.end
  br label %do.cond, !dbg !126

do.cond:                                          ; preds = %if.end
  %21 = load i32, i32* %failed, align 4, !dbg !127
  %tobool12 = icmp ne i32 %21, 0, !dbg !127
  br i1 %tobool12, label %land.rhs, label %land.end, !dbg !128

land.rhs:                                         ; preds = %do.cond
  %22 = load i32, i32* @running, align 4, !dbg !129
  %tobool13 = icmp ne i32 %22, 0, !dbg !128
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %23 = phi i1 [ false, %do.cond ], [ %tobool13, %land.rhs ], !dbg !130
  br i1 %23, label %do.body, label %do.end, !dbg !126, !llvm.loop !131

do.end:                                           ; preds = %land.end
  %24 = load i32, i32* %failed, align 4, !dbg !133
  %tobool14 = icmp ne i32 %24, 0, !dbg !133
  br i1 %tobool14, label %if.end24, label %if.then15, !dbg !135, !cf.info !114

if.then15:                                        ; preds = %do.end
  %25 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !136
  %name16 = getelementptr inbounds %struct.philData, %struct.philData* %25, i32 0, i32 2, !dbg !138
  %26 = load i8*, i8** %name16, align 8, !dbg !138
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i8* %26), !dbg !139
  %call18 = call i32 @rand() #6, !dbg !140
  %rem19 = srem i32 %call18, 8, !dbg !141
  %add20 = add nsw i32 1, %rem19, !dbg !142
  %call21 = call i32 @sleep(i32 %add20), !dbg !143
  %27 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !144
  %call22 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %27) #6, !dbg !145
  %28 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !146
  %call23 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %28) #6, !dbg !147
  br label %if.end24, !dbg !148

if.end24:                                         ; preds = %if.then15, %do.end
  br label %while.cond, !dbg !78, !llvm.loop !149

while.end:                                        ; preds = %while.cond
  ret i8* null, !dbg !151
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @sleep(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #3

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_trylock(%union.pthread_mutex_t*) #3

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @Ponder() #0 !dbg !152 {
entry:
  %nameList = alloca [5 x i8*], align 16
  %forks = alloca [5 x %union.pthread_mutex_t], align 16
  %philosophers = alloca [5 x %struct.philData], align 16
  %phil = alloca %struct.philData*, align 8
  %i = alloca i32, align 4
  %failed = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i8*]* %nameList, metadata !155, metadata !DIExpression()), !dbg !159
  %0 = bitcast [5 x i8*]* %nameList to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !159
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !159
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !159
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8** %2, align 16, !dbg !159
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !159
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8** %3, align 8, !dbg !159
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !159
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8** %4, align 16, !dbg !159
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !159
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8** %5, align 8, !dbg !159
  %6 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 4, !dbg !159
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8** %6, align 16, !dbg !159
  call void @llvm.dbg.declare(metadata [5 x %union.pthread_mutex_t]* %forks, metadata !160, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [5 x %struct.philData]* %philosophers, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata %struct.philData** %phil, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %failed, metadata !170, metadata !DIExpression()), !dbg !171
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4, !dbg !175
  %cmp = icmp slt i32 %7, 5, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !179
  %idxprom = sext i32 %8 to i64, !dbg !181
  %arrayidx = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom, !dbg !181
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #6, !dbg !182
  store i32 %call, i32* %failed, align 4, !dbg !183
  %9 = load i32, i32* %failed, align 4, !dbg !184
  %tobool = icmp ne i32 %9, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end, !dbg !186, !cf.info !114

if.then:                                          ; preds = %for.body
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i64 0, i64 0)), !dbg !187
  call void @exit(i32 1) #7, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4, !dbg !191
  %inc = add nsw i32 %10, 1, !dbg !191
  store i32 %inc, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond2, !dbg !197

for.cond2:                                        ; preds = %for.inc14, %for.end
  %11 = load i32, i32* %i, align 4, !dbg !198
  %cmp3 = icmp slt i32 %11, 5, !dbg !200
  br i1 %cmp3, label %for.body4, label %for.end16, !dbg !201

for.body4:                                        ; preds = %for.cond2
  %12 = load i32, i32* %i, align 4, !dbg !202
  %idxprom5 = sext i32 %12 to i64, !dbg !204
  %arrayidx6 = getelementptr inbounds [5 x %struct.philData], [5 x %struct.philData]* %philosophers, i64 0, i64 %idxprom5, !dbg !204
  store %struct.philData* %arrayidx6, %struct.philData** %phil, align 8, !dbg !205
  %13 = load i32, i32* %i, align 4, !dbg !206
  %idxprom7 = sext i32 %13 to i64, !dbg !207
  %arrayidx8 = getelementptr inbounds [5 x i8*], [5 x i8*]* %nameList, i64 0, i64 %idxprom7, !dbg !207
  %14 = load i8*, i8** %arrayidx8, align 8, !dbg !207
  %15 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !208
  %name = getelementptr inbounds %struct.philData, %struct.philData* %15, i32 0, i32 2, !dbg !209
  store i8* %14, i8** %name, align 8, !dbg !210
  %16 = load i32, i32* %i, align 4, !dbg !211
  %idxprom9 = sext i32 %16 to i64, !dbg !212
  %arrayidx10 = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom9, !dbg !212
  %17 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !213
  %fork_lft = getelementptr inbounds %struct.philData, %struct.philData* %17, i32 0, i32 0, !dbg !214
  store %union.pthread_mutex_t* %arrayidx10, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !215
  %18 = load i32, i32* %i, align 4, !dbg !216
  %add = add nsw i32 %18, 1, !dbg !217
  %rem = srem i32 %add, 5, !dbg !218
  %idxprom11 = sext i32 %rem to i64, !dbg !219
  %arrayidx12 = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom11, !dbg !219
  %19 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !220
  %fork_rgt = getelementptr inbounds %struct.philData, %struct.philData* %19, i32 0, i32 1, !dbg !221
  store %union.pthread_mutex_t* %arrayidx12, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !222
  %20 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !223
  %thread = getelementptr inbounds %struct.philData, %struct.philData* %20, i32 0, i32 3, !dbg !224
  %21 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !225
  %22 = bitcast %struct.philData* %21 to i8*, !dbg !225
  %call13 = call i32 @pthread_create(i64* %thread, %union.pthread_attr_t* null, i8* (i8*)* @PhilPhunction, i8* %22) #6, !dbg !226
  %23 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !227
  %fail = getelementptr inbounds %struct.philData, %struct.philData* %23, i32 0, i32 4, !dbg !228
  store i32 %call13, i32* %fail, align 8, !dbg !229
  br label %for.inc14, !dbg !230

for.inc14:                                        ; preds = %for.body4
  %24 = load i32, i32* %i, align 4, !dbg !231
  %inc15 = add nsw i32 %24, 1, !dbg !231
  store i32 %inc15, i32* %i, align 4, !dbg !231
  br label %for.cond2, !dbg !232, !llvm.loop !233

for.end16:                                        ; preds = %for.cond2
  %call17 = call i32 @sleep(i32 40), !dbg !235
  store i32 0, i32* @running, align 4, !dbg !236
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i64 0, i64 0)), !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond19, !dbg !240

for.cond19:                                       ; preds = %for.inc33, %for.end16
  %25 = load i32, i32* %i, align 4, !dbg !241
  %cmp20 = icmp slt i32 %25, 5, !dbg !243
  br i1 %cmp20, label %for.body21, label %for.end35, !dbg !244

for.body21:                                       ; preds = %for.cond19
  %26 = load i32, i32* %i, align 4, !dbg !245
  %idxprom22 = sext i32 %26 to i64, !dbg !247
  %arrayidx23 = getelementptr inbounds [5 x %struct.philData], [5 x %struct.philData]* %philosophers, i64 0, i64 %idxprom22, !dbg !247
  store %struct.philData* %arrayidx23, %struct.philData** %phil, align 8, !dbg !248
  %27 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !249
  %fail24 = getelementptr inbounds %struct.philData, %struct.philData* %27, i32 0, i32 4, !dbg !251
  %28 = load i32, i32* %fail24, align 8, !dbg !251
  %tobool25 = icmp ne i32 %28, 0, !dbg !249
  br i1 %tobool25, label %if.end32, label %land.lhs.true, !dbg !252, !cf.info !114

land.lhs.true:                                    ; preds = %for.body21
  %29 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !253
  %thread26 = getelementptr inbounds %struct.philData, %struct.philData* %29, i32 0, i32 3, !dbg !254
  %30 = load i64, i64* %thread26, align 8, !dbg !254
  %call27 = call i32 @pthread_join(i64 %30, i8** null), !dbg !255
  %tobool28 = icmp ne i32 %call27, 0, !dbg !255
  br i1 %tobool28, label %if.then29, label %if.end32, !dbg !256, !cf.info !114

if.then29:                                        ; preds = %land.lhs.true
  %31 = load %struct.philData*, %struct.philData** %phil, align 8, !dbg !257
  %name30 = getelementptr inbounds %struct.philData, %struct.philData* %31, i32 0, i32 2, !dbg !259
  %32 = load i8*, i8** %name30, align 8, !dbg !259
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.10, i64 0, i64 0), i8* %32), !dbg !260
  call void @exit(i32 1) #7, !dbg !261
  unreachable, !dbg !261

if.end32:                                         ; preds = %land.lhs.true, %for.body21
  br label %for.inc33, !dbg !262

for.inc33:                                        ; preds = %if.end32
  %33 = load i32, i32* %i, align 4, !dbg !263
  %inc34 = add nsw i32 %33, 1, !dbg !263
  store i32 %inc34, i32* %i, align 4, !dbg !263
  br label %for.cond19, !dbg !264, !llvm.loop !265

for.end35:                                        ; preds = %for.cond19
  ret void, !dbg !267
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare !callback !268 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #3

declare dso_local i32 @pthread_join(i64, i8**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !270 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @Ponder(), !dbg !273
  ret i32 0, !dbg !274
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!55, !56, !57}
!llvm.ident = !{!58}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "running", scope: !2, file: !3, line: 13, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !54, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dining-philosophers-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dining-philosophers")
!4 = !{}
!5 = !{!6, !53}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "Philosopher", file: !3, line: 11, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "philData", file: !3, line: 6, size: 320, elements: !9)
!9 = !{!10, !45, !46, !49, !52}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "fork_lft", scope: !8, file: !3, line: 7, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !13, line: 72, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!14 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !13, line: 67, size: 320, elements: !15)
!15 = !{!16, !38, !43}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !14, file: !13, line: 69, baseType: !17, size: 320)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !18, line: 22, size: 320, elements: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "")
!19 = !{!20, !22, !24, !25, !26, !27, !29, !30}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !17, file: !18, line: 24, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !17, file: !18, line: 25, baseType: !23, size: 32, offset: 32)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !17, file: !18, line: 26, baseType: !21, size: 32, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !17, file: !18, line: 28, baseType: !23, size: 32, offset: 96)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !17, file: !18, line: 32, baseType: !21, size: 32, offset: 128)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !17, file: !18, line: 34, baseType: !28, size: 16, offset: 160)
!28 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !17, file: !18, line: 35, baseType: !28, size: 16, offset: 176)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !17, file: !18, line: 36, baseType: !31, size: 128, offset: 192)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !32, line: 53, baseType: !33)
!32 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "")
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !32, line: 49, size: 128, elements: !34)
!34 = !{!35, !37}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !33, file: !32, line: 51, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !33, file: !32, line: 52, baseType: !36, size: 64, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !14, file: !13, line: 70, baseType: !39, size: 320)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 320, elements: !41)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !{!42}
!42 = !DISubrange(count: 40)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !14, file: !13, line: 71, baseType: !44, size: 64)
!44 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "fork_rgt", scope: !8, file: !3, line: 7, baseType: !11, size: 64, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !8, file: !3, line: 8, baseType: !47, size: 64, offset: 128)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "thread", scope: !8, file: !3, line: 9, baseType: !50, size: 64, offset: 192)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !13, line: 27, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "fail", scope: !8, file: !3, line: 10, baseType: !21, size: 32, offset: 256)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !{!0}
!55 = !{i32 7, !"Dwarf Version", i32 4}
!56 = !{i32 2, !"Debug Info Version", i32 3}
!57 = !{i32 1, !"wchar_size", i32 4}
!58 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!59 = distinct !DISubprogram(name: "PhilPhunction", scope: !3, file: !3, line: 15, type: !60, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!53, !53}
!62 = !DILocalVariable(name: "p", arg: 1, scope: !59, file: !3, line: 15, type: !53)
!63 = !DILocation(line: 15, column: 27, scope: !59)
!64 = !DILocalVariable(name: "phil", scope: !59, file: !3, line: 16, type: !6)
!65 = !DILocation(line: 16, column: 18, scope: !59)
!66 = !DILocation(line: 16, column: 39, scope: !59)
!67 = !DILocation(line: 16, column: 25, scope: !59)
!68 = !DILocalVariable(name: "failed", scope: !59, file: !3, line: 17, type: !21)
!69 = !DILocation(line: 17, column: 9, scope: !59)
!70 = !DILocalVariable(name: "tries_left", scope: !59, file: !3, line: 18, type: !21)
!71 = !DILocation(line: 18, column: 9, scope: !59)
!72 = !DILocalVariable(name: "fork_lft", scope: !59, file: !3, line: 19, type: !11)
!73 = !DILocation(line: 19, column: 22, scope: !59)
!74 = !DILocalVariable(name: "fork_rgt", scope: !59, file: !3, line: 19, type: !11)
!75 = !DILocation(line: 19, column: 33, scope: !59)
!76 = !DILocalVariable(name: "fork_tmp", scope: !59, file: !3, line: 19, type: !11)
!77 = !DILocation(line: 19, column: 44, scope: !59)
!78 = !DILocation(line: 21, column: 5, scope: !59)
!79 = !DILocation(line: 21, column: 12, scope: !59)
!80 = !DILocation(line: 22, column: 50, scope: !81)
!81 = distinct !DILexicalBlock(scope: !59, file: !3, line: 21, column: 21)
!82 = !DILocation(line: 22, column: 56, scope: !81)
!83 = !DILocation(line: 22, column: 9, scope: !81)
!84 = !DILocation(line: 23, column: 19, scope: !81)
!85 = !DILocation(line: 23, column: 25, scope: !81)
!86 = !DILocation(line: 23, column: 17, scope: !81)
!87 = !DILocation(line: 23, column: 9, scope: !81)
!88 = !DILocation(line: 25, column: 20, scope: !81)
!89 = !DILocation(line: 25, column: 26, scope: !81)
!90 = !DILocation(line: 25, column: 18, scope: !81)
!91 = !DILocation(line: 26, column: 20, scope: !81)
!92 = !DILocation(line: 26, column: 26, scope: !81)
!93 = !DILocation(line: 26, column: 18, scope: !81)
!94 = !DILocation(line: 27, column: 34, scope: !81)
!95 = !DILocation(line: 27, column: 40, scope: !81)
!96 = !DILocation(line: 27, column: 9, scope: !81)
!97 = !DILocation(line: 28, column: 20, scope: !81)
!98 = !DILocation(line: 29, column: 9, scope: !81)
!99 = !DILocation(line: 30, column: 42, scope: !100)
!100 = distinct !DILexicalBlock(scope: !81, file: !3, line: 29, column: 12)
!101 = !DILocation(line: 30, column: 22, scope: !100)
!102 = !DILocation(line: 30, column: 20, scope: !100)
!103 = !DILocation(line: 31, column: 23, scope: !100)
!104 = !DILocation(line: 31, column: 33, scope: !100)
!105 = !DILocation(line: 31, column: 22, scope: !100)
!106 = !DILocation(line: 31, column: 61, scope: !100)
!107 = !DILocation(line: 31, column: 38, scope: !100)
!108 = !DILocation(line: 32, column: 57, scope: !100)
!109 = !DILocation(line: 32, column: 38, scope: !100)
!110 = !DILocation(line: 31, column: 20, scope: !100)
!111 = !DILocation(line: 33, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !3, line: 33, column: 17)
!113 = !DILocation(line: 33, column: 17, scope: !100)
!114 = !{!"if"}
!115 = !DILocation(line: 34, column: 39, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !3, line: 33, column: 25)
!117 = !DILocation(line: 34, column: 17, scope: !116)
!118 = !DILocation(line: 35, column: 28, scope: !116)
!119 = !DILocation(line: 35, column: 26, scope: !116)
!120 = !DILocation(line: 36, column: 28, scope: !116)
!121 = !DILocation(line: 36, column: 26, scope: !116)
!122 = !DILocation(line: 37, column: 28, scope: !116)
!123 = !DILocation(line: 37, column: 26, scope: !116)
!124 = !DILocation(line: 38, column: 28, scope: !116)
!125 = !DILocation(line: 39, column: 13, scope: !116)
!126 = !DILocation(line: 40, column: 9, scope: !100)
!127 = !DILocation(line: 40, column: 17, scope: !81)
!128 = !DILocation(line: 40, column: 24, scope: !81)
!129 = !DILocation(line: 40, column: 27, scope: !81)
!130 = !DILocation(line: 0, scope: !81)
!131 = distinct !{!131, !98, !132}
!132 = !DILocation(line: 40, column: 34, scope: !81)
!133 = !DILocation(line: 42, column: 14, scope: !134)
!134 = distinct !DILexicalBlock(scope: !81, file: !3, line: 42, column: 13)
!135 = !DILocation(line: 42, column: 13, scope: !81)
!136 = !DILocation(line: 43, column: 38, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !3, line: 42, column: 22)
!138 = !DILocation(line: 43, column: 44, scope: !137)
!139 = !DILocation(line: 43, column: 13, scope: !137)
!140 = !DILocation(line: 44, column: 23, scope: !137)
!141 = !DILocation(line: 44, column: 30, scope: !137)
!142 = !DILocation(line: 44, column: 21, scope: !137)
!143 = !DILocation(line: 44, column: 13, scope: !137)
!144 = !DILocation(line: 45, column: 35, scope: !137)
!145 = !DILocation(line: 45, column: 13, scope: !137)
!146 = !DILocation(line: 46, column: 35, scope: !137)
!147 = !DILocation(line: 46, column: 13, scope: !137)
!148 = !DILocation(line: 47, column: 9, scope: !137)
!149 = distinct !{!149, !78, !150}
!150 = !DILocation(line: 48, column: 5, scope: !59)
!151 = !DILocation(line: 49, column: 5, scope: !59)
!152 = distinct !DISubprogram(name: "Ponder", scope: !3, file: !3, line: 52, type: !153, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DISubroutineType(types: !154)
!154 = !{null}
!155 = !DILocalVariable(name: "nameList", scope: !152, file: !3, line: 54, type: !156)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 320, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 5)
!159 = !DILocation(line: 54, column: 17, scope: !152)
!160 = !DILocalVariable(name: "forks", scope: !152, file: !3, line: 55, type: !161)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !157)
!162 = !DILocation(line: 55, column: 21, scope: !152)
!163 = !DILocalVariable(name: "philosophers", scope: !152, file: !3, line: 56, type: !164)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !157)
!165 = !DILocation(line: 56, column: 17, scope: !152)
!166 = !DILocalVariable(name: "phil", scope: !152, file: !3, line: 57, type: !6)
!167 = !DILocation(line: 57, column: 18, scope: !152)
!168 = !DILocalVariable(name: "i", scope: !152, file: !3, line: 58, type: !21)
!169 = !DILocation(line: 58, column: 9, scope: !152)
!170 = !DILocalVariable(name: "failed", scope: !152, file: !3, line: 59, type: !21)
!171 = !DILocation(line: 59, column: 9, scope: !152)
!172 = !DILocation(line: 61, column: 11, scope: !173)
!173 = distinct !DILexicalBlock(scope: !152, file: !3, line: 61, column: 5)
!174 = !DILocation(line: 61, column: 10, scope: !173)
!175 = !DILocation(line: 61, column: 14, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !3, line: 61, column: 5)
!177 = !DILocation(line: 61, column: 15, scope: !176)
!178 = !DILocation(line: 61, column: 5, scope: !173)
!179 = !DILocation(line: 62, column: 44, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !3, line: 61, column: 24)
!181 = !DILocation(line: 62, column: 38, scope: !180)
!182 = !DILocation(line: 62, column: 18, scope: !180)
!183 = !DILocation(line: 62, column: 16, scope: !180)
!184 = !DILocation(line: 63, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !3, line: 63, column: 13)
!186 = !DILocation(line: 63, column: 13, scope: !180)
!187 = !DILocation(line: 64, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !3, line: 63, column: 21)
!189 = !DILocation(line: 65, column: 13, scope: !188)
!190 = !DILocation(line: 67, column: 5, scope: !180)
!191 = !DILocation(line: 61, column: 20, scope: !176)
!192 = !DILocation(line: 61, column: 5, scope: !176)
!193 = distinct !{!193, !178, !194}
!194 = !DILocation(line: 67, column: 5, scope: !173)
!195 = !DILocation(line: 69, column: 11, scope: !196)
!196 = distinct !DILexicalBlock(scope: !152, file: !3, line: 69, column: 5)
!197 = !DILocation(line: 69, column: 10, scope: !196)
!198 = !DILocation(line: 69, column: 14, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !3, line: 69, column: 5)
!200 = !DILocation(line: 69, column: 15, scope: !199)
!201 = !DILocation(line: 69, column: 5, scope: !196)
!202 = !DILocation(line: 70, column: 30, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !3, line: 69, column: 24)
!204 = !DILocation(line: 70, column: 17, scope: !203)
!205 = !DILocation(line: 70, column: 14, scope: !203)
!206 = !DILocation(line: 71, column: 31, scope: !203)
!207 = !DILocation(line: 71, column: 22, scope: !203)
!208 = !DILocation(line: 71, column: 9, scope: !203)
!209 = !DILocation(line: 71, column: 15, scope: !203)
!210 = !DILocation(line: 71, column: 20, scope: !203)
!211 = !DILocation(line: 72, column: 33, scope: !203)
!212 = !DILocation(line: 72, column: 27, scope: !203)
!213 = !DILocation(line: 72, column: 9, scope: !203)
!214 = !DILocation(line: 72, column: 15, scope: !203)
!215 = !DILocation(line: 72, column: 24, scope: !203)
!216 = !DILocation(line: 73, column: 34, scope: !203)
!217 = !DILocation(line: 73, column: 35, scope: !203)
!218 = !DILocation(line: 73, column: 38, scope: !203)
!219 = !DILocation(line: 73, column: 27, scope: !203)
!220 = !DILocation(line: 73, column: 9, scope: !203)
!221 = !DILocation(line: 73, column: 15, scope: !203)
!222 = !DILocation(line: 73, column: 24, scope: !203)
!223 = !DILocation(line: 74, column: 39, scope: !203)
!224 = !DILocation(line: 74, column: 45, scope: !203)
!225 = !DILocation(line: 74, column: 74, scope: !203)
!226 = !DILocation(line: 74, column: 22, scope: !203)
!227 = !DILocation(line: 74, column: 9, scope: !203)
!228 = !DILocation(line: 74, column: 15, scope: !203)
!229 = !DILocation(line: 74, column: 20, scope: !203)
!230 = !DILocation(line: 75, column: 5, scope: !203)
!231 = !DILocation(line: 69, column: 20, scope: !199)
!232 = !DILocation(line: 69, column: 5, scope: !199)
!233 = distinct !{!233, !201, !234}
!234 = !DILocation(line: 75, column: 5, scope: !196)
!235 = !DILocation(line: 77, column: 5, scope: !152)
!236 = !DILocation(line: 78, column: 13, scope: !152)
!237 = !DILocation(line: 79, column: 5, scope: !152)
!238 = !DILocation(line: 81, column: 10, scope: !239)
!239 = distinct !DILexicalBlock(scope: !152, file: !3, line: 81, column: 5)
!240 = !DILocation(line: 81, column: 9, scope: !239)
!241 = !DILocation(line: 81, column: 14, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !3, line: 81, column: 5)
!243 = !DILocation(line: 81, column: 15, scope: !242)
!244 = !DILocation(line: 81, column: 5, scope: !239)
!245 = !DILocation(line: 82, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !3, line: 81, column: 24)
!247 = !DILocation(line: 82, column: 17, scope: !246)
!248 = !DILocation(line: 82, column: 14, scope: !246)
!249 = !DILocation(line: 83, column: 15, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !3, line: 83, column: 14)
!251 = !DILocation(line: 83, column: 21, scope: !250)
!252 = !DILocation(line: 83, column: 26, scope: !250)
!253 = !DILocation(line: 83, column: 43, scope: !250)
!254 = !DILocation(line: 83, column: 49, scope: !250)
!255 = !DILocation(line: 83, column: 29, scope: !250)
!256 = !DILocation(line: 83, column: 14, scope: !246)
!257 = !DILocation(line: 84, column: 51, scope: !258)
!258 = distinct !DILexicalBlock(scope: !250, file: !3, line: 83, column: 65)
!259 = !DILocation(line: 84, column: 57, scope: !258)
!260 = !DILocation(line: 84, column: 13, scope: !258)
!261 = !DILocation(line: 85, column: 13, scope: !258)
!262 = !DILocation(line: 87, column: 5, scope: !246)
!263 = !DILocation(line: 81, column: 20, scope: !242)
!264 = !DILocation(line: 81, column: 5, scope: !242)
!265 = distinct !{!265, !244, !266}
!266 = !DILocation(line: 87, column: 5, scope: !239)
!267 = !DILocation(line: 88, column: 1, scope: !152)
!268 = !{!269}
!269 = !{i64 2, i64 3, i1 false}
!270 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 90, type: !271, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!271 = !DISubroutineType(types: !272)
!272 = !{!21}
!273 = !DILocation(line: 92, column: 5, scope: !270)
!274 = !DILocation(line: 93, column: 5, scope: !270)
