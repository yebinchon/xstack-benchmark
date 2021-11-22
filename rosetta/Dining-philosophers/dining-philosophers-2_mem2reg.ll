; ModuleID = 'dining-philosophers-2.ll'
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
  call void @llvm.dbg.value(metadata i8* %p, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = bitcast i8* %p to %struct.philData*, !dbg !64
  call void @llvm.dbg.value(metadata %struct.philData* %0, metadata !65, metadata !DIExpression()), !dbg !63
  br label %while.cond, !dbg !66

while.cond:                                       ; preds = %if.end24, %entry
  %1 = load i32, i32* @running, align 4, !dbg !67
  %tobool = icmp ne i32 %1, 0, !dbg !66
  br i1 %tobool, label %while.body, label %while.end, !dbg !66

while.body:                                       ; preds = %while.cond
  %name = getelementptr inbounds %struct.philData, %struct.philData* %0, i32 0, i32 2, !dbg !68
  %2 = load i8*, i8** %name, align 8, !dbg !68
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0), i8* %2), !dbg !70
  %call1 = call i32 @rand() #6, !dbg !71
  %rem = srem i32 %call1, 8, !dbg !72
  %add = add nsw i32 1, %rem, !dbg !73
  %call2 = call i32 @sleep(i32 %add), !dbg !74
  %fork_lft3 = getelementptr inbounds %struct.philData, %struct.philData* %0, i32 0, i32 0, !dbg !75
  %3 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_lft3, align 8, !dbg !75
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %3, metadata !76, metadata !DIExpression()), !dbg !63
  %fork_rgt4 = getelementptr inbounds %struct.philData, %struct.philData* %0, i32 0, i32 1, !dbg !77
  %4 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %fork_rgt4, align 8, !dbg !77
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %4, metadata !78, metadata !DIExpression()), !dbg !63
  %name5 = getelementptr inbounds %struct.philData, %struct.philData* %0, i32 0, i32 2, !dbg !79
  %5 = load i8*, i8** %name5, align 8, !dbg !79
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i8* %5), !dbg !80
  call void @llvm.dbg.value(metadata i32 2, metadata !81, metadata !DIExpression()), !dbg !63
  br label %do.body, !dbg !82

do.body:                                          ; preds = %land.end, %while.body
  %tries_left.0 = phi i32 [ 2, %while.body ], [ %tries_left.1, %land.end ], !dbg !83
  %fork_lft.0 = phi %union.pthread_mutex_t* [ %3, %while.body ], [ %fork_lft.1, %land.end ], !dbg !83
  %fork_rgt.0 = phi %union.pthread_mutex_t* [ %4, %while.body ], [ %fork_rgt.1, %land.end ], !dbg !83
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_rgt.0, metadata !78, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_lft.0, metadata !76, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata i32 %tries_left.0, metadata !81, metadata !DIExpression()), !dbg !63
  %call7 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %fork_lft.0) #6, !dbg !84
  call void @llvm.dbg.value(metadata i32 %call7, metadata !86, metadata !DIExpression()), !dbg !63
  %cmp = icmp sgt i32 %tries_left.0, 0, !dbg !87
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !88

cond.true:                                        ; preds = %do.body
  %call8 = call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %fork_rgt.0) #6, !dbg !89
  br label %cond.end, !dbg !88

cond.false:                                       ; preds = %do.body
  %call9 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %fork_rgt.0) #6, !dbg !90
  br label %cond.end, !dbg !88

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call8, %cond.true ], [ %call9, %cond.false ], !dbg !88
  call void @llvm.dbg.value(metadata i32 %cond, metadata !86, metadata !DIExpression()), !dbg !63
  %tobool10 = icmp ne i32 %cond, 0, !dbg !91
  br i1 %tobool10, label %if.then, label %if.end, !dbg !93, !cf.info !94

if.then:                                          ; preds = %cond.end
  %call11 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %fork_lft.0) #6, !dbg !95
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_lft.0, metadata !97, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_rgt.0, metadata !76, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_lft.0, metadata !78, metadata !DIExpression()), !dbg !63
  %sub = sub nsw i32 %tries_left.0, 1, !dbg !98
  call void @llvm.dbg.value(metadata i32 %sub, metadata !81, metadata !DIExpression()), !dbg !63
  br label %if.end, !dbg !99

if.end:                                           ; preds = %if.then, %cond.end
  %tries_left.1 = phi i32 [ %sub, %if.then ], [ %tries_left.0, %cond.end ], !dbg !83
  %fork_lft.1 = phi %union.pthread_mutex_t* [ %fork_rgt.0, %if.then ], [ %fork_lft.0, %cond.end ], !dbg !83
  %fork_rgt.1 = phi %union.pthread_mutex_t* [ %fork_lft.0, %if.then ], [ %fork_rgt.0, %cond.end ], !dbg !83
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_rgt.1, metadata !78, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata %union.pthread_mutex_t* %fork_lft.1, metadata !76, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.value(metadata i32 %tries_left.1, metadata !81, metadata !DIExpression()), !dbg !63
  br label %do.cond, !dbg !100

do.cond:                                          ; preds = %if.end
  %tobool12 = icmp ne i32 %cond, 0, !dbg !101
  br i1 %tobool12, label %land.rhs, label %land.end, !dbg !102

land.rhs:                                         ; preds = %do.cond
  %6 = load i32, i32* @running, align 4, !dbg !103
  %tobool13 = icmp ne i32 %6, 0, !dbg !102
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %7 = phi i1 [ false, %do.cond ], [ %tobool13, %land.rhs ], !dbg !83
  br i1 %7, label %do.body, label %do.end, !dbg !100, !llvm.loop !104

do.end:                                           ; preds = %land.end
  %tobool14 = icmp ne i32 %cond, 0, !dbg !106
  br i1 %tobool14, label %if.end24, label %if.then15, !dbg !108, !cf.info !94

if.then15:                                        ; preds = %do.end
  %name16 = getelementptr inbounds %struct.philData, %struct.philData* %0, i32 0, i32 2, !dbg !109
  %8 = load i8*, i8** %name16, align 8, !dbg !109
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i8* %8), !dbg !111
  %call18 = call i32 @rand() #6, !dbg !112
  %rem19 = srem i32 %call18, 8, !dbg !113
  %add20 = add nsw i32 1, %rem19, !dbg !114
  %call21 = call i32 @sleep(i32 %add20), !dbg !115
  %call22 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %fork_rgt.1) #6, !dbg !116
  %call23 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %fork_lft.1) #6, !dbg !117
  br label %if.end24, !dbg !118

if.end24:                                         ; preds = %if.then15, %do.end
  br label %while.cond, !dbg !66, !llvm.loop !119

while.end:                                        ; preds = %while.cond
  ret i8* null, !dbg !121
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
define dso_local void @Ponder() #0 !dbg !122 {
entry:
  %nameList = alloca [5 x i8*], align 16
  %forks = alloca [5 x %union.pthread_mutex_t], align 16
  %philosophers = alloca [5 x %struct.philData], align 16
  call void @llvm.dbg.declare(metadata [5 x i8*]* %nameList, metadata !125, metadata !DIExpression()), !dbg !129
  %0 = bitcast [5 x i8*]* %nameList to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !129
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !129
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !129
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8** %2, align 16, !dbg !129
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !129
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8** %3, align 8, !dbg !129
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !129
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8** %4, align 16, !dbg !129
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !129
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8** %5, align 8, !dbg !129
  %6 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 4, !dbg !129
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8** %6, align 16, !dbg !129
  call void @llvm.dbg.declare(metadata [5 x %union.pthread_mutex_t]* %forks, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [5 x %struct.philData]* %philosophers, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i32 0, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !140
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !136, metadata !DIExpression()), !dbg !137
  %cmp = icmp slt i32 %i.0, 5, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom, !dbg !144
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #6, !dbg !146
  call void @llvm.dbg.value(metadata i32 %call, metadata !147, metadata !DIExpression()), !dbg !137
  %tobool = icmp ne i32 %call, 0, !dbg !148
  br i1 %tobool, label %if.then, label %if.end, !dbg !150, !cf.info !94

if.then:                                          ; preds = %for.body
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i64 0, i64 0)), !dbg !151
  call void @exit(i32 1) #7, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !155
  call void @llvm.dbg.value(metadata i32 %inc, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond2, !dbg !159

for.cond2:                                        ; preds = %for.inc14, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !161
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !136, metadata !DIExpression()), !dbg !137
  %cmp3 = icmp slt i32 %i.1, 5, !dbg !162
  br i1 %cmp3, label %for.body4, label %for.end16, !dbg !164

for.body4:                                        ; preds = %for.cond2
  %idxprom5 = sext i32 %i.1 to i64, !dbg !165
  %arrayidx6 = getelementptr inbounds [5 x %struct.philData], [5 x %struct.philData]* %philosophers, i64 0, i64 %idxprom5, !dbg !165
  call void @llvm.dbg.value(metadata %struct.philData* %arrayidx6, metadata !167, metadata !DIExpression()), !dbg !137
  %idxprom7 = sext i32 %i.1 to i64, !dbg !168
  %arrayidx8 = getelementptr inbounds [5 x i8*], [5 x i8*]* %nameList, i64 0, i64 %idxprom7, !dbg !168
  %7 = load i8*, i8** %arrayidx8, align 8, !dbg !168
  %name = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx6, i32 0, i32 2, !dbg !169
  store i8* %7, i8** %name, align 8, !dbg !170
  %idxprom9 = sext i32 %i.1 to i64, !dbg !171
  %arrayidx10 = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom9, !dbg !171
  %fork_lft = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx6, i32 0, i32 0, !dbg !172
  store %union.pthread_mutex_t* %arrayidx10, %union.pthread_mutex_t** %fork_lft, align 8, !dbg !173
  %add = add nsw i32 %i.1, 1, !dbg !174
  %rem = srem i32 %add, 5, !dbg !175
  %idxprom11 = sext i32 %rem to i64, !dbg !176
  %arrayidx12 = getelementptr inbounds [5 x %union.pthread_mutex_t], [5 x %union.pthread_mutex_t]* %forks, i64 0, i64 %idxprom11, !dbg !176
  %fork_rgt = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx6, i32 0, i32 1, !dbg !177
  store %union.pthread_mutex_t* %arrayidx12, %union.pthread_mutex_t** %fork_rgt, align 8, !dbg !178
  %thread = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx6, i32 0, i32 3, !dbg !179
  %8 = bitcast %struct.philData* %arrayidx6 to i8*, !dbg !180
  %call13 = call i32 @pthread_create(i64* %thread, %union.pthread_attr_t* null, i8* (i8*)* @PhilPhunction, i8* %8) #6, !dbg !181
  %fail = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx6, i32 0, i32 4, !dbg !182
  store i32 %call13, i32* %fail, align 8, !dbg !183
  br label %for.inc14, !dbg !184

for.inc14:                                        ; preds = %for.body4
  %inc15 = add nsw i32 %i.1, 1, !dbg !185
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond2, !dbg !186, !llvm.loop !187

for.end16:                                        ; preds = %for.cond2
  %call17 = call i32 @sleep(i32 40), !dbg !189
  store i32 0, i32* @running, align 4, !dbg !190
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i64 0, i64 0)), !dbg !191
  call void @llvm.dbg.value(metadata i32 0, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond19, !dbg !192

for.cond19:                                       ; preds = %for.inc33, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc34, %for.inc33 ], !dbg !194
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !136, metadata !DIExpression()), !dbg !137
  %cmp20 = icmp slt i32 %i.2, 5, !dbg !195
  br i1 %cmp20, label %for.body21, label %for.end35, !dbg !197

for.body21:                                       ; preds = %for.cond19
  %idxprom22 = sext i32 %i.2 to i64, !dbg !198
  %arrayidx23 = getelementptr inbounds [5 x %struct.philData], [5 x %struct.philData]* %philosophers, i64 0, i64 %idxprom22, !dbg !198
  call void @llvm.dbg.value(metadata %struct.philData* %arrayidx23, metadata !167, metadata !DIExpression()), !dbg !137
  %fail24 = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx23, i32 0, i32 4, !dbg !200
  %9 = load i32, i32* %fail24, align 8, !dbg !200
  %tobool25 = icmp ne i32 %9, 0, !dbg !202
  br i1 %tobool25, label %if.end32, label %land.lhs.true, !dbg !203, !cf.info !94

land.lhs.true:                                    ; preds = %for.body21
  %thread26 = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx23, i32 0, i32 3, !dbg !204
  %10 = load i64, i64* %thread26, align 8, !dbg !204
  %call27 = call i32 @pthread_join(i64 %10, i8** null), !dbg !205
  %tobool28 = icmp ne i32 %call27, 0, !dbg !205
  br i1 %tobool28, label %if.then29, label %if.end32, !dbg !206, !cf.info !94

if.then29:                                        ; preds = %land.lhs.true
  %name30 = getelementptr inbounds %struct.philData, %struct.philData* %arrayidx23, i32 0, i32 2, !dbg !207
  %11 = load i8*, i8** %name30, align 8, !dbg !207
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.10, i64 0, i64 0), i8* %11), !dbg !209
  call void @exit(i32 1) #7, !dbg !210
  unreachable, !dbg !210

if.end32:                                         ; preds = %land.lhs.true, %for.body21
  br label %for.inc33, !dbg !211

for.inc33:                                        ; preds = %if.end32
  %inc34 = add nsw i32 %i.2, 1, !dbg !212
  call void @llvm.dbg.value(metadata i32 %inc34, metadata !136, metadata !DIExpression()), !dbg !137
  br label %for.cond19, !dbg !213, !llvm.loop !214

for.end35:                                        ; preds = %for.cond19
  ret void, !dbg !216
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare !callback !217 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #3

declare dso_local i32 @pthread_join(i64, i8**) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !219 {
entry:
  call void @Ponder(), !dbg !222
  ret i32 0, !dbg !223
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!63 = !DILocation(line: 0, scope: !59)
!64 = !DILocation(line: 16, column: 25, scope: !59)
!65 = !DILocalVariable(name: "phil", scope: !59, file: !3, line: 16, type: !6)
!66 = !DILocation(line: 21, column: 5, scope: !59)
!67 = !DILocation(line: 21, column: 12, scope: !59)
!68 = !DILocation(line: 22, column: 56, scope: !69)
!69 = distinct !DILexicalBlock(scope: !59, file: !3, line: 21, column: 21)
!70 = !DILocation(line: 22, column: 9, scope: !69)
!71 = !DILocation(line: 23, column: 19, scope: !69)
!72 = !DILocation(line: 23, column: 25, scope: !69)
!73 = !DILocation(line: 23, column: 17, scope: !69)
!74 = !DILocation(line: 23, column: 9, scope: !69)
!75 = !DILocation(line: 25, column: 26, scope: !69)
!76 = !DILocalVariable(name: "fork_lft", scope: !59, file: !3, line: 19, type: !11)
!77 = !DILocation(line: 26, column: 26, scope: !69)
!78 = !DILocalVariable(name: "fork_rgt", scope: !59, file: !3, line: 19, type: !11)
!79 = !DILocation(line: 27, column: 40, scope: !69)
!80 = !DILocation(line: 27, column: 9, scope: !69)
!81 = !DILocalVariable(name: "tries_left", scope: !59, file: !3, line: 18, type: !21)
!82 = !DILocation(line: 29, column: 9, scope: !69)
!83 = !DILocation(line: 0, scope: !69)
!84 = !DILocation(line: 30, column: 22, scope: !85)
!85 = distinct !DILexicalBlock(scope: !69, file: !3, line: 29, column: 12)
!86 = !DILocalVariable(name: "failed", scope: !59, file: !3, line: 17, type: !21)
!87 = !DILocation(line: 31, column: 33, scope: !85)
!88 = !DILocation(line: 31, column: 22, scope: !85)
!89 = !DILocation(line: 31, column: 38, scope: !85)
!90 = !DILocation(line: 32, column: 38, scope: !85)
!91 = !DILocation(line: 33, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !3, line: 33, column: 17)
!93 = !DILocation(line: 33, column: 17, scope: !85)
!94 = !{!"if"}
!95 = !DILocation(line: 34, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 33, column: 25)
!97 = !DILocalVariable(name: "fork_tmp", scope: !59, file: !3, line: 19, type: !11)
!98 = !DILocation(line: 38, column: 28, scope: !96)
!99 = !DILocation(line: 39, column: 13, scope: !96)
!100 = !DILocation(line: 40, column: 9, scope: !85)
!101 = !DILocation(line: 40, column: 17, scope: !69)
!102 = !DILocation(line: 40, column: 24, scope: !69)
!103 = !DILocation(line: 40, column: 27, scope: !69)
!104 = distinct !{!104, !82, !105}
!105 = !DILocation(line: 40, column: 34, scope: !69)
!106 = !DILocation(line: 42, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !69, file: !3, line: 42, column: 13)
!108 = !DILocation(line: 42, column: 13, scope: !69)
!109 = !DILocation(line: 43, column: 44, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 42, column: 22)
!111 = !DILocation(line: 43, column: 13, scope: !110)
!112 = !DILocation(line: 44, column: 23, scope: !110)
!113 = !DILocation(line: 44, column: 30, scope: !110)
!114 = !DILocation(line: 44, column: 21, scope: !110)
!115 = !DILocation(line: 44, column: 13, scope: !110)
!116 = !DILocation(line: 45, column: 13, scope: !110)
!117 = !DILocation(line: 46, column: 13, scope: !110)
!118 = !DILocation(line: 47, column: 9, scope: !110)
!119 = distinct !{!119, !66, !120}
!120 = !DILocation(line: 48, column: 5, scope: !59)
!121 = !DILocation(line: 49, column: 5, scope: !59)
!122 = distinct !DISubprogram(name: "Ponder", scope: !3, file: !3, line: 52, type: !123, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DISubroutineType(types: !124)
!124 = !{null}
!125 = !DILocalVariable(name: "nameList", scope: !122, file: !3, line: 54, type: !126)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 320, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 5)
!129 = !DILocation(line: 54, column: 17, scope: !122)
!130 = !DILocalVariable(name: "forks", scope: !122, file: !3, line: 55, type: !131)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !127)
!132 = !DILocation(line: 55, column: 21, scope: !122)
!133 = !DILocalVariable(name: "philosophers", scope: !122, file: !3, line: 56, type: !134)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !127)
!135 = !DILocation(line: 56, column: 17, scope: !122)
!136 = !DILocalVariable(name: "i", scope: !122, file: !3, line: 58, type: !21)
!137 = !DILocation(line: 0, scope: !122)
!138 = !DILocation(line: 61, column: 10, scope: !139)
!139 = distinct !DILexicalBlock(scope: !122, file: !3, line: 61, column: 5)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 61, column: 15, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !3, line: 61, column: 5)
!143 = !DILocation(line: 61, column: 5, scope: !139)
!144 = !DILocation(line: 62, column: 38, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 61, column: 24)
!146 = !DILocation(line: 62, column: 18, scope: !145)
!147 = !DILocalVariable(name: "failed", scope: !122, file: !3, line: 59, type: !21)
!148 = !DILocation(line: 63, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !3, line: 63, column: 13)
!150 = !DILocation(line: 63, column: 13, scope: !145)
!151 = !DILocation(line: 64, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 63, column: 21)
!153 = !DILocation(line: 65, column: 13, scope: !152)
!154 = !DILocation(line: 67, column: 5, scope: !145)
!155 = !DILocation(line: 61, column: 20, scope: !142)
!156 = !DILocation(line: 61, column: 5, scope: !142)
!157 = distinct !{!157, !143, !158}
!158 = !DILocation(line: 67, column: 5, scope: !139)
!159 = !DILocation(line: 69, column: 10, scope: !160)
!160 = distinct !DILexicalBlock(scope: !122, file: !3, line: 69, column: 5)
!161 = !DILocation(line: 0, scope: !160)
!162 = !DILocation(line: 69, column: 15, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !3, line: 69, column: 5)
!164 = !DILocation(line: 69, column: 5, scope: !160)
!165 = !DILocation(line: 70, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 69, column: 24)
!167 = !DILocalVariable(name: "phil", scope: !122, file: !3, line: 57, type: !6)
!168 = !DILocation(line: 71, column: 22, scope: !166)
!169 = !DILocation(line: 71, column: 15, scope: !166)
!170 = !DILocation(line: 71, column: 20, scope: !166)
!171 = !DILocation(line: 72, column: 27, scope: !166)
!172 = !DILocation(line: 72, column: 15, scope: !166)
!173 = !DILocation(line: 72, column: 24, scope: !166)
!174 = !DILocation(line: 73, column: 35, scope: !166)
!175 = !DILocation(line: 73, column: 38, scope: !166)
!176 = !DILocation(line: 73, column: 27, scope: !166)
!177 = !DILocation(line: 73, column: 15, scope: !166)
!178 = !DILocation(line: 73, column: 24, scope: !166)
!179 = !DILocation(line: 74, column: 45, scope: !166)
!180 = !DILocation(line: 74, column: 74, scope: !166)
!181 = !DILocation(line: 74, column: 22, scope: !166)
!182 = !DILocation(line: 74, column: 15, scope: !166)
!183 = !DILocation(line: 74, column: 20, scope: !166)
!184 = !DILocation(line: 75, column: 5, scope: !166)
!185 = !DILocation(line: 69, column: 20, scope: !163)
!186 = !DILocation(line: 69, column: 5, scope: !163)
!187 = distinct !{!187, !164, !188}
!188 = !DILocation(line: 75, column: 5, scope: !160)
!189 = !DILocation(line: 77, column: 5, scope: !122)
!190 = !DILocation(line: 78, column: 13, scope: !122)
!191 = !DILocation(line: 79, column: 5, scope: !122)
!192 = !DILocation(line: 81, column: 9, scope: !193)
!193 = distinct !DILexicalBlock(scope: !122, file: !3, line: 81, column: 5)
!194 = !DILocation(line: 0, scope: !193)
!195 = !DILocation(line: 81, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !3, line: 81, column: 5)
!197 = !DILocation(line: 81, column: 5, scope: !193)
!198 = !DILocation(line: 82, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !3, line: 81, column: 24)
!200 = !DILocation(line: 83, column: 21, scope: !201)
!201 = distinct !DILexicalBlock(scope: !199, file: !3, line: 83, column: 14)
!202 = !DILocation(line: 83, column: 15, scope: !201)
!203 = !DILocation(line: 83, column: 26, scope: !201)
!204 = !DILocation(line: 83, column: 49, scope: !201)
!205 = !DILocation(line: 83, column: 29, scope: !201)
!206 = !DILocation(line: 83, column: 14, scope: !199)
!207 = !DILocation(line: 84, column: 57, scope: !208)
!208 = distinct !DILexicalBlock(scope: !201, file: !3, line: 83, column: 65)
!209 = !DILocation(line: 84, column: 13, scope: !208)
!210 = !DILocation(line: 85, column: 13, scope: !208)
!211 = !DILocation(line: 87, column: 5, scope: !199)
!212 = !DILocation(line: 81, column: 20, scope: !196)
!213 = !DILocation(line: 81, column: 5, scope: !196)
!214 = distinct !{!214, !197, !215}
!215 = !DILocation(line: 87, column: 5, scope: !193)
!216 = !DILocation(line: 88, column: 1, scope: !122)
!217 = !{!218}
!218 = !{i64 2, i64 3, i1 false}
!219 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 90, type: !220, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!220 = !DISubroutineType(types: !221)
!221 = !{!21}
!222 = !DILocation(line: 92, column: 5, scope: !219)
!223 = !DILocation(line: 93, column: 5, scope: !219)
