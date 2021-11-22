; ModuleID = 'atomic-updates-1.ll'
source_filename = "atomic-updates-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@bucket_mutex = common dso_local global [15 x %union.pthread_mutex_t] zeroinitializer, align 16, !dbg !0
@buckets = common dso_local global [15 x i32] zeroinitializer, align 16, !dbg !8
@.str = private unnamed_addr constant [5 x i8] c"%3d \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"= %d\0A\00", align 1
@equalizer = common dso_local global i64 0, align 8, !dbg !14
@randomizer = common dso_local global i64 0, align 8, !dbg !19

; Function Attrs: noinline nounwind uwtable
define dso_local void @transfer_value(i32 %from, i32 %to, i32 %howmuch) #0 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata i32 %from, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %to, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch, metadata !63, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8 0, metadata !64, metadata !DIExpression()), !dbg !61
  %cmp = icmp eq i32 %from, %to, !dbg !66
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !68, !cf.info !69

lor.lhs.false:                                    ; preds = %entry
  %cmp1 = icmp slt i32 %howmuch, 0, !dbg !70
  br i1 %cmp1, label %if.then, label %lor.lhs.false2, !dbg !71, !cf.info !69

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %cmp3 = icmp slt i32 %from, 0, !dbg !72
  br i1 %cmp3, label %if.then, label %lor.lhs.false4, !dbg !73, !cf.info !69

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %cmp5 = icmp slt i32 %to, 0, !dbg !74
  br i1 %cmp5, label %if.then, label %lor.lhs.false6, !dbg !75, !cf.info !69

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %cmp7 = icmp sge i32 %from, 15, !dbg !76
  br i1 %cmp7, label %if.then, label %lor.lhs.false8, !dbg !77, !cf.info !69

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %cmp9 = icmp sge i32 %to, 15, !dbg !78
  br i1 %cmp9, label %if.then, label %if.end, !dbg !79, !cf.info !69

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return, !dbg !80

if.end:                                           ; preds = %lor.lhs.false8
  %cmp10 = icmp sgt i32 %from, %to, !dbg !81
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !83, !cf.info !69

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %from, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 %to, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %from, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8 1, metadata !64, metadata !DIExpression()), !dbg !61
  %sub = sub nsw i32 0, %howmuch, !dbg !87
  call void @llvm.dbg.value(metadata i32 %sub, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end12, !dbg !88

if.end12:                                         ; preds = %if.then11, %if.end
  %swapped.0 = phi i8 [ 1, %if.then11 ], [ 0, %if.end ], !dbg !61
  %howmuch.addr.0 = phi i32 [ %sub, %if.then11 ], [ %howmuch, %if.end ]
  %to.addr.0 = phi i32 [ %from, %if.then11 ], [ %to, %if.end ]
  %from.addr.0 = phi i32 [ %to, %if.then11 ], [ %from, %if.end ]
  call void @llvm.dbg.value(metadata i32 %from.addr.0, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %to.addr.0, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.0, metadata !63, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8 %swapped.0, metadata !64, metadata !DIExpression()), !dbg !61
  %idxprom = sext i32 %from.addr.0 to i64, !dbg !89
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !89
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !90
  %idxprom13 = sext i32 %to.addr.0 to i64, !dbg !91
  %arrayidx14 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom13, !dbg !91
  %call15 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx14) #4, !dbg !92
  %idxprom16 = sext i32 %from.addr.0 to i64, !dbg !93
  %arrayidx17 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom16, !dbg !93
  %0 = load i32, i32* %arrayidx17, align 4, !dbg !93
  %cmp18 = icmp sgt i32 %howmuch.addr.0, %0, !dbg !95
  br i1 %cmp18, label %land.lhs.true, label %if.end22, !dbg !96, !cf.info !69

land.lhs.true:                                    ; preds = %if.end12
  %tobool = trunc i8 %swapped.0 to i1, !dbg !97
  br i1 %tobool, label %if.end22, label %if.then19, !dbg !98, !cf.info !69

if.then19:                                        ; preds = %land.lhs.true
  %idxprom20 = sext i32 %from.addr.0 to i64, !dbg !99
  %arrayidx21 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom20, !dbg !99
  %1 = load i32, i32* %arrayidx21, align 4, !dbg !99
  call void @llvm.dbg.value(metadata i32 %1, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end22, !dbg !100

if.end22:                                         ; preds = %if.then19, %land.lhs.true, %if.end12
  %howmuch.addr.1 = phi i32 [ %howmuch.addr.0, %land.lhs.true ], [ %1, %if.then19 ], [ %howmuch.addr.0, %if.end12 ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.1, metadata !63, metadata !DIExpression()), !dbg !61
  %sub23 = sub nsw i32 0, %howmuch.addr.1, !dbg !101
  %idxprom24 = sext i32 %to.addr.0 to i64, !dbg !103
  %arrayidx25 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom24, !dbg !103
  %2 = load i32, i32* %arrayidx25, align 4, !dbg !103
  %cmp26 = icmp sgt i32 %sub23, %2, !dbg !104
  br i1 %cmp26, label %land.lhs.true27, label %if.end33, !dbg !105, !cf.info !69

land.lhs.true27:                                  ; preds = %if.end22
  %tobool28 = trunc i8 %swapped.0 to i1, !dbg !106
  br i1 %tobool28, label %if.then29, label %if.end33, !dbg !107, !cf.info !69

if.then29:                                        ; preds = %land.lhs.true27
  %idxprom30 = sext i32 %to.addr.0 to i64, !dbg !108
  %arrayidx31 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom30, !dbg !108
  %3 = load i32, i32* %arrayidx31, align 4, !dbg !108
  %sub32 = sub nsw i32 0, %3, !dbg !109
  call void @llvm.dbg.value(metadata i32 %sub32, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end33, !dbg !110

if.end33:                                         ; preds = %if.then29, %land.lhs.true27, %if.end22
  %howmuch.addr.2 = phi i32 [ %sub32, %if.then29 ], [ %howmuch.addr.1, %land.lhs.true27 ], [ %howmuch.addr.1, %if.end22 ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.2, metadata !63, metadata !DIExpression()), !dbg !61
  %idxprom34 = sext i32 %from.addr.0 to i64, !dbg !111
  %arrayidx35 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom34, !dbg !111
  %4 = load i32, i32* %arrayidx35, align 4, !dbg !112
  %sub36 = sub nsw i32 %4, %howmuch.addr.2, !dbg !112
  store i32 %sub36, i32* %arrayidx35, align 4, !dbg !112
  %idxprom37 = sext i32 %to.addr.0 to i64, !dbg !113
  %arrayidx38 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom37, !dbg !113
  %5 = load i32, i32* %arrayidx38, align 4, !dbg !114
  %add = add nsw i32 %5, %howmuch.addr.2, !dbg !114
  store i32 %add, i32* %arrayidx38, align 4, !dbg !114
  %idxprom39 = sext i32 %from.addr.0 to i64, !dbg !115
  %arrayidx40 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom39, !dbg !115
  %call41 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx40) #4, !dbg !116
  %idxprom42 = sext i32 %to.addr.0 to i64, !dbg !117
  %arrayidx43 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom42, !dbg !117
  %call44 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx43) #4, !dbg !118
  br label %return, !dbg !119

return:                                           ; preds = %if.end33, %if.then
  ret void, !dbg !119
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_buckets() #0 !dbg !120 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !128
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !125, metadata !DIExpression()), !dbg !124
  %cmp = icmp slt i32 %i.0, 15, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !132
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !133
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !134
  call void @llvm.dbg.value(metadata i32 %inc, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond1, !dbg !138

for.cond1:                                        ; preds = %for.inc9, %for.end
  %sum.0 = phi i32 [ 0, %for.end ], [ %add, %for.inc9 ], !dbg !124
  %i.1 = phi i32 [ 0, %for.end ], [ %inc10, %for.inc9 ], !dbg !140
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !125, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !123, metadata !DIExpression()), !dbg !124
  %cmp2 = icmp slt i32 %i.1, 15, !dbg !141
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !143

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64, !dbg !144
  %arrayidx5 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom4, !dbg !144
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !144
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !146
  %idxprom7 = sext i32 %i.1 to i64, !dbg !147
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !147
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !147
  %add = add nsw i32 %sum.0, %1, !dbg !148
  call void @llvm.dbg.value(metadata i32 %add, metadata !123, metadata !DIExpression()), !dbg !124
  br label %for.inc9, !dbg !149

for.inc9:                                         ; preds = %for.body3
  %inc10 = add nsw i32 %i.1, 1, !dbg !150
  call void @llvm.dbg.value(metadata i32 %inc10, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond1, !dbg !151, !llvm.loop !152

for.end11:                                        ; preds = %for.cond1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %sum.0), !dbg !154
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond13, !dbg !155

for.cond13:                                       ; preds = %for.inc19, %for.end11
  %i.2 = phi i32 [ 0, %for.end11 ], [ %inc20, %for.inc19 ], !dbg !157
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !125, metadata !DIExpression()), !dbg !124
  %cmp14 = icmp slt i32 %i.2, 15, !dbg !158
  br i1 %cmp14, label %for.body15, label %for.end21, !dbg !160

for.body15:                                       ; preds = %for.cond13
  %idxprom16 = sext i32 %i.2 to i64, !dbg !161
  %arrayidx17 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom16, !dbg !161
  %call18 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx17) #4, !dbg !162
  br label %for.inc19, !dbg !162

for.inc19:                                        ; preds = %for.body15
  %inc20 = add nsw i32 %i.2, 1, !dbg !163
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !125, metadata !DIExpression()), !dbg !124
  br label %for.cond13, !dbg !164, !llvm.loop !165

for.end21:                                        ; preds = %for.cond13
  ret void, !dbg !167
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @equalizer_start(i8* %t) #0 !dbg !168 {
entry:
  call void @llvm.dbg.value(metadata i8* %t, metadata !171, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %if.end, %entry
  %call = call i32 @rand() #4, !dbg !174
  %rem = srem i32 %call, 15, !dbg !178
  call void @llvm.dbg.value(metadata i32 %rem, metadata !179, metadata !DIExpression()), !dbg !180
  %call1 = call i32 @rand() #4, !dbg !181
  %rem2 = srem i32 %call1, 15, !dbg !182
  call void @llvm.dbg.value(metadata i32 %rem2, metadata !183, metadata !DIExpression()), !dbg !180
  %idxprom = sext i32 %rem to i64, !dbg !184
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !184
  %0 = load i32, i32* %arrayidx, align 4, !dbg !184
  %idxprom3 = sext i32 %rem2 to i64, !dbg !185
  %arrayidx4 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom3, !dbg !185
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !185
  %sub = sub nsw i32 %0, %1, !dbg !186
  call void @llvm.dbg.value(metadata i32 %sub, metadata !187, metadata !DIExpression()), !dbg !180
  %cmp = icmp slt i32 %sub, 0, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !190, !cf.info !69

if.then:                                          ; preds = %for.cond
  %sub5 = sub nsw i32 0, %sub, !dbg !191
  %div = sdiv i32 %sub5, 2, !dbg !192
  call void @transfer_value(i32 %rem2, i32 %rem, i32 %div), !dbg !193
  br label %if.end, !dbg !193

if.else:                                          ; preds = %for.cond
  %div6 = sdiv i32 %sub, 2, !dbg !194
  call void @transfer_value(i32 %rem, i32 %rem2, i32 %div6), !dbg !195
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond, !dbg !196, !llvm.loop !197
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @randomizer_start(i8* %t) #0 !dbg !200 {
entry:
  call void @llvm.dbg.value(metadata i8* %t, metadata !201, metadata !DIExpression()), !dbg !202
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.cond, %entry
  %call = call i32 @rand() #4, !dbg !204
  %rem = srem i32 %call, 15, !dbg !208
  call void @llvm.dbg.value(metadata i32 %rem, metadata !209, metadata !DIExpression()), !dbg !210
  %call1 = call i32 @rand() #4, !dbg !211
  %rem2 = srem i32 %call1, 15, !dbg !212
  call void @llvm.dbg.value(metadata i32 %rem2, metadata !213, metadata !DIExpression()), !dbg !210
  %call3 = call i32 @rand() #4, !dbg !214
  %idxprom = sext i32 %rem to i64, !dbg !215
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !215
  %0 = load i32, i32* %arrayidx, align 4, !dbg !215
  %add = add nsw i32 %0, 1, !dbg !216
  %rem4 = srem i32 %call3, %add, !dbg !217
  call void @llvm.dbg.value(metadata i32 %rem4, metadata !218, metadata !DIExpression()), !dbg !210
  call void @transfer_value(i32 %rem, i32 %rem2, i32 %rem4), !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !224 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !228
  br label %for.cond, !dbg !230

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !232
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !229, metadata !DIExpression()), !dbg !228
  %cmp = icmp slt i32 %i.0, 15, !dbg !233
  br i1 %cmp, label %for.body, label %for.end, !dbg !235

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !236
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #4, !dbg !237
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !238
  call void @llvm.dbg.value(metadata i32 %inc, metadata !229, metadata !DIExpression()), !dbg !228
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !228
  br label %for.cond1, !dbg !242

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !244
  %total.0 = phi i32 [ 0, %for.end ], [ %add, %for.inc12 ], !dbg !228
  call void @llvm.dbg.value(metadata i32 %total.0, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !229, metadata !DIExpression()), !dbg !228
  %cmp2 = icmp slt i32 %i.1, 15, !dbg !245
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !247

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @rand() #4, !dbg !248
  %rem = srem i32 %call4, 100, !dbg !250
  %idxprom5 = sext i32 %i.1 to i64, !dbg !251
  %arrayidx6 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom5, !dbg !251
  store i32 %rem, i32* %arrayidx6, align 4, !dbg !252
  %idxprom7 = sext i32 %i.1 to i64, !dbg !253
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !253
  %0 = load i32, i32* %arrayidx8, align 4, !dbg !253
  %add = add nsw i32 %total.0, %0, !dbg !254
  call void @llvm.dbg.value(metadata i32 %add, metadata !227, metadata !DIExpression()), !dbg !228
  %idxprom9 = sext i32 %i.1 to i64, !dbg !255
  %arrayidx10 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom9, !dbg !255
  %1 = load i32, i32* %arrayidx10, align 4, !dbg !255
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !256
  br label %for.inc12, !dbg !257

for.inc12:                                        ; preds = %for.body3
  %inc13 = add nsw i32 %i.1, 1, !dbg !258
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !229, metadata !DIExpression()), !dbg !228
  br label %for.cond1, !dbg !259, !llvm.loop !260

for.end14:                                        ; preds = %for.cond1
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %total.0), !dbg !262
  %call16 = call i32 @pthread_create(i64* @equalizer, %union.pthread_attr_t* null, i8* (i8*)* @equalizer_start, i8* null) #4, !dbg !263
  %call17 = call i32 @pthread_create(i64* @randomizer, %union.pthread_attr_t* null, i8* (i8*)* @randomizer_start, i8* null) #4, !dbg !264
  br label %for.cond18, !dbg !265

for.cond18:                                       ; preds = %for.cond18, %for.end14
  %call19 = call i32 @sleep(i32 1), !dbg !266
  call void @print_buckets(), !dbg !270
  br label %for.cond18, !dbg !271, !llvm.loop !272
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #2

; Function Attrs: nounwind
declare !callback !275 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

declare dso_local i32 @sleep(i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!53, !54, !55}
!llvm.ident = !{!56}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bucket_mutex", scope: !2, file: !3, line: 10, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "atomic-updates-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Atomic-updates")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0, !8, !14, !19}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "buckets", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 480, elements: !12)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 15)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "equalizer", scope: !2, file: !3, line: 13, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !17, line: 27, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "")
!18 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "randomizer", scope: !2, file: !3, line: 14, type: !16, isLocal: false, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !12)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !17, line: 72, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 67, size: 320, elements: !24)
!24 = !{!25, !46, !51}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !23, file: !17, line: 69, baseType: !26, size: 320)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !27, line: 22, size: 320, elements: !28)
!27 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "")
!28 = !{!29, !30, !32, !33, !34, !35, !37, !38}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !26, file: !27, line: 24, baseType: !11, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !26, file: !27, line: 25, baseType: !31, size: 32, offset: 32)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !26, file: !27, line: 26, baseType: !11, size: 32, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !26, file: !27, line: 28, baseType: !31, size: 32, offset: 96)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !26, file: !27, line: 32, baseType: !11, size: 32, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !26, file: !27, line: 34, baseType: !36, size: 16, offset: 160)
!36 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !26, file: !27, line: 35, baseType: !36, size: 16, offset: 176)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !26, file: !27, line: 36, baseType: !39, size: 128, offset: 192)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !40, line: 53, baseType: !41)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "")
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !40, line: 49, size: 128, elements: !42)
!42 = !{!43, !45}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !41, file: !40, line: 51, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !41, file: !40, line: 52, baseType: !44, size: 64, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !23, file: !17, line: 70, baseType: !47, size: 320)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 320, elements: !49)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !{!50}
!50 = !DISubrange(count: 40)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !23, file: !17, line: 71, baseType: !52, size: 64)
!52 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!53 = !{i32 7, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!57 = distinct !DISubprogram(name: "transfer_value", scope: !3, file: !3, line: 16, type: !58, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !11, !11, !11}
!60 = !DILocalVariable(name: "from", arg: 1, scope: !57, file: !3, line: 16, type: !11)
!61 = !DILocation(line: 0, scope: !57)
!62 = !DILocalVariable(name: "to", arg: 2, scope: !57, file: !3, line: 16, type: !11)
!63 = !DILocalVariable(name: "howmuch", arg: 3, scope: !57, file: !3, line: 16, type: !11)
!64 = !DILocalVariable(name: "swapped", scope: !57, file: !3, line: 18, type: !65)
!65 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!66 = !DILocation(line: 20, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !57, file: !3, line: 20, column: 8)
!68 = !DILocation(line: 20, column: 21, scope: !67)
!69 = !{!"if"}
!70 = !DILocation(line: 20, column: 34, scope: !67)
!71 = !DILocation(line: 20, column: 40, scope: !67)
!72 = !DILocation(line: 21, column: 14, scope: !67)
!73 = !DILocation(line: 21, column: 20, scope: !67)
!74 = !DILocation(line: 21, column: 27, scope: !67)
!75 = !DILocation(line: 21, column: 32, scope: !67)
!76 = !DILocation(line: 21, column: 41, scope: !67)
!77 = !DILocation(line: 21, column: 55, scope: !67)
!78 = !DILocation(line: 21, column: 62, scope: !67)
!79 = !DILocation(line: 20, column: 8, scope: !57)
!80 = !DILocation(line: 21, column: 78, scope: !67)
!81 = !DILocation(line: 23, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !3, line: 23, column: 8)
!83 = !DILocation(line: 23, column: 8, scope: !57)
!84 = !DILocalVariable(name: "temp1", scope: !85, file: !3, line: 24, type: !11)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 23, column: 20)
!86 = !DILocation(line: 0, scope: !85)
!87 = !DILocation(line: 28, column: 15, scope: !85)
!88 = !DILocation(line: 29, column: 3, scope: !85)
!89 = !DILocation(line: 31, column: 23, scope: !57)
!90 = !DILocation(line: 31, column: 3, scope: !57)
!91 = !DILocation(line: 32, column: 23, scope: !57)
!92 = !DILocation(line: 32, column: 3, scope: !57)
!93 = !DILocation(line: 34, column: 18, scope: !94)
!94 = distinct !DILexicalBlock(scope: !57, file: !3, line: 34, column: 8)
!95 = !DILocation(line: 34, column: 16, scope: !94)
!96 = !DILocation(line: 34, column: 32, scope: !94)
!97 = !DILocation(line: 34, column: 36, scope: !94)
!98 = !DILocation(line: 34, column: 8, scope: !57)
!99 = !DILocation(line: 35, column: 15, scope: !94)
!100 = !DILocation(line: 35, column: 5, scope: !94)
!101 = !DILocation(line: 36, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !57, file: !3, line: 36, column: 8)
!103 = !DILocation(line: 36, column: 19, scope: !102)
!104 = !DILocation(line: 36, column: 17, scope: !102)
!105 = !DILocation(line: 36, column: 31, scope: !102)
!106 = !DILocation(line: 36, column: 34, scope: !102)
!107 = !DILocation(line: 36, column: 8, scope: !57)
!108 = !DILocation(line: 37, column: 16, scope: !102)
!109 = !DILocation(line: 37, column: 15, scope: !102)
!110 = !DILocation(line: 37, column: 5, scope: !102)
!111 = !DILocation(line: 39, column: 3, scope: !57)
!112 = !DILocation(line: 39, column: 17, scope: !57)
!113 = !DILocation(line: 40, column: 3, scope: !57)
!114 = !DILocation(line: 40, column: 15, scope: !57)
!115 = !DILocation(line: 42, column: 25, scope: !57)
!116 = !DILocation(line: 42, column: 3, scope: !57)
!117 = !DILocation(line: 43, column: 25, scope: !57)
!118 = !DILocation(line: 43, column: 3, scope: !57)
!119 = !DILocation(line: 44, column: 1, scope: !57)
!120 = distinct !DISubprogram(name: "print_buckets", scope: !3, file: !3, line: 46, type: !121, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DISubroutineType(types: !122)
!122 = !{null}
!123 = !DILocalVariable(name: "sum", scope: !120, file: !3, line: 49, type: !11)
!124 = !DILocation(line: 0, scope: !120)
!125 = !DILocalVariable(name: "i", scope: !120, file: !3, line: 48, type: !11)
!126 = !DILocation(line: 51, column: 7, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !3, line: 51, column: 3)
!128 = !DILocation(line: 0, scope: !127)
!129 = !DILocation(line: 51, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 51, column: 3)
!131 = !DILocation(line: 51, column: 3, scope: !127)
!132 = !DILocation(line: 51, column: 52, scope: !130)
!133 = !DILocation(line: 51, column: 32, scope: !130)
!134 = !DILocation(line: 51, column: 28, scope: !130)
!135 = !DILocation(line: 51, column: 3, scope: !130)
!136 = distinct !{!136, !131, !137}
!137 = !DILocation(line: 51, column: 67, scope: !127)
!138 = !DILocation(line: 52, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !120, file: !3, line: 52, column: 3)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 52, column: 14, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !3, line: 52, column: 3)
!143 = !DILocation(line: 52, column: 3, scope: !139)
!144 = !DILocation(line: 53, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 52, column: 32)
!146 = !DILocation(line: 53, column: 5, scope: !145)
!147 = !DILocation(line: 54, column: 12, scope: !145)
!148 = !DILocation(line: 54, column: 9, scope: !145)
!149 = !DILocation(line: 55, column: 3, scope: !145)
!150 = !DILocation(line: 52, column: 28, scope: !142)
!151 = !DILocation(line: 52, column: 3, scope: !142)
!152 = distinct !{!152, !143, !153}
!153 = !DILocation(line: 55, column: 3, scope: !139)
!154 = !DILocation(line: 56, column: 3, scope: !120)
!155 = !DILocation(line: 57, column: 7, scope: !156)
!156 = distinct !DILexicalBlock(scope: !120, file: !3, line: 57, column: 3)
!157 = !DILocation(line: 0, scope: !156)
!158 = !DILocation(line: 57, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 57, column: 3)
!160 = !DILocation(line: 57, column: 3, scope: !156)
!161 = !DILocation(line: 57, column: 54, scope: !159)
!162 = !DILocation(line: 57, column: 32, scope: !159)
!163 = !DILocation(line: 57, column: 28, scope: !159)
!164 = !DILocation(line: 57, column: 3, scope: !159)
!165 = distinct !{!165, !160, !166}
!166 = !DILocation(line: 57, column: 69, scope: !156)
!167 = !DILocation(line: 58, column: 1, scope: !120)
!168 = distinct !DISubprogram(name: "equalizer_start", scope: !3, file: !3, line: 60, type: !169, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!169 = !DISubroutineType(types: !170)
!170 = !{!6, !6}
!171 = !DILocalVariable(name: "t", arg: 1, scope: !168, file: !3, line: 60, type: !6)
!172 = !DILocation(line: 0, scope: !168)
!173 = !DILocation(line: 62, column: 3, scope: !168)
!174 = !DILocation(line: 63, column: 14, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 62, column: 11)
!176 = distinct !DILexicalBlock(scope: !177, file: !3, line: 62, column: 3)
!177 = distinct !DILexicalBlock(scope: !168, file: !3, line: 62, column: 3)
!178 = !DILocation(line: 63, column: 20, scope: !175)
!179 = !DILocalVariable(name: "b1", scope: !175, file: !3, line: 63, type: !11)
!180 = !DILocation(line: 0, scope: !175)
!181 = !DILocation(line: 64, column: 14, scope: !175)
!182 = !DILocation(line: 64, column: 20, scope: !175)
!183 = !DILocalVariable(name: "b2", scope: !175, file: !3, line: 64, type: !11)
!184 = !DILocation(line: 65, column: 16, scope: !175)
!185 = !DILocation(line: 65, column: 30, scope: !175)
!186 = !DILocation(line: 65, column: 28, scope: !175)
!187 = !DILocalVariable(name: "diff", scope: !175, file: !3, line: 65, type: !11)
!188 = !DILocation(line: 66, column: 15, scope: !189)
!189 = distinct !DILexicalBlock(scope: !175, file: !3, line: 66, column: 10)
!190 = !DILocation(line: 66, column: 10, scope: !175)
!191 = !DILocation(line: 67, column: 30, scope: !189)
!192 = !DILocation(line: 67, column: 35, scope: !189)
!193 = !DILocation(line: 67, column: 7, scope: !189)
!194 = !DILocation(line: 69, column: 34, scope: !189)
!195 = !DILocation(line: 69, column: 7, scope: !189)
!196 = !DILocation(line: 62, column: 3, scope: !176)
!197 = distinct !{!197, !198, !199}
!198 = !DILocation(line: 62, column: 3, scope: !177)
!199 = !DILocation(line: 70, column: 3, scope: !177)
!200 = distinct !DISubprogram(name: "randomizer_start", scope: !3, file: !3, line: 74, type: !169, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!201 = !DILocalVariable(name: "t", arg: 1, scope: !200, file: !3, line: 74, type: !6)
!202 = !DILocation(line: 0, scope: !200)
!203 = !DILocation(line: 76, column: 3, scope: !200)
!204 = !DILocation(line: 77, column: 14, scope: !205)
!205 = distinct !DILexicalBlock(scope: !206, file: !3, line: 76, column: 11)
!206 = distinct !DILexicalBlock(scope: !207, file: !3, line: 76, column: 3)
!207 = distinct !DILexicalBlock(scope: !200, file: !3, line: 76, column: 3)
!208 = !DILocation(line: 77, column: 20, scope: !205)
!209 = !DILocalVariable(name: "b1", scope: !205, file: !3, line: 77, type: !11)
!210 = !DILocation(line: 0, scope: !205)
!211 = !DILocation(line: 78, column: 14, scope: !205)
!212 = !DILocation(line: 78, column: 20, scope: !205)
!213 = !DILocalVariable(name: "b2", scope: !205, file: !3, line: 78, type: !11)
!214 = !DILocation(line: 79, column: 16, scope: !205)
!215 = !DILocation(line: 79, column: 24, scope: !205)
!216 = !DILocation(line: 79, column: 35, scope: !205)
!217 = !DILocation(line: 79, column: 22, scope: !205)
!218 = !DILocalVariable(name: "diff", scope: !205, file: !3, line: 79, type: !11)
!219 = !DILocation(line: 80, column: 5, scope: !205)
!220 = !DILocation(line: 76, column: 3, scope: !206)
!221 = distinct !{!221, !222, !223}
!222 = !DILocation(line: 76, column: 3, scope: !207)
!223 = !DILocation(line: 81, column: 3, scope: !207)
!224 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 85, type: !225, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!225 = !DISubroutineType(types: !226)
!226 = !{!11}
!227 = !DILocalVariable(name: "total", scope: !224, file: !3, line: 87, type: !11)
!228 = !DILocation(line: 0, scope: !224)
!229 = !DILocalVariable(name: "i", scope: !224, file: !3, line: 87, type: !11)
!230 = !DILocation(line: 89, column: 7, scope: !231)
!231 = distinct !DILexicalBlock(scope: !224, file: !3, line: 89, column: 3)
!232 = !DILocation(line: 0, scope: !231)
!233 = !DILocation(line: 89, column: 14, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !3, line: 89, column: 3)
!235 = !DILocation(line: 89, column: 3, scope: !231)
!236 = !DILocation(line: 89, column: 52, scope: !234)
!237 = !DILocation(line: 89, column: 32, scope: !234)
!238 = !DILocation(line: 89, column: 28, scope: !234)
!239 = !DILocation(line: 89, column: 3, scope: !234)
!240 = distinct !{!240, !235, !241}
!241 = !DILocation(line: 89, column: 73, scope: !231)
!242 = !DILocation(line: 91, column: 7, scope: !243)
!243 = distinct !DILexicalBlock(scope: !224, file: !3, line: 91, column: 3)
!244 = !DILocation(line: 0, scope: !243)
!245 = !DILocation(line: 91, column: 14, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !3, line: 91, column: 3)
!247 = !DILocation(line: 91, column: 3, scope: !243)
!248 = !DILocation(line: 92, column: 18, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !3, line: 91, column: 32)
!250 = !DILocation(line: 92, column: 25, scope: !249)
!251 = !DILocation(line: 92, column: 5, scope: !249)
!252 = !DILocation(line: 92, column: 16, scope: !249)
!253 = !DILocation(line: 93, column: 14, scope: !249)
!254 = !DILocation(line: 93, column: 11, scope: !249)
!255 = !DILocation(line: 94, column: 20, scope: !249)
!256 = !DILocation(line: 94, column: 5, scope: !249)
!257 = !DILocation(line: 95, column: 3, scope: !249)
!258 = !DILocation(line: 91, column: 28, scope: !246)
!259 = !DILocation(line: 91, column: 3, scope: !246)
!260 = distinct !{!260, !247, !261}
!261 = !DILocation(line: 95, column: 3, scope: !243)
!262 = !DILocation(line: 96, column: 3, scope: !224)
!263 = !DILocation(line: 99, column: 3, scope: !224)
!264 = !DILocation(line: 100, column: 3, scope: !224)
!265 = !DILocation(line: 102, column: 3, scope: !224)
!266 = !DILocation(line: 103, column: 5, scope: !267)
!267 = distinct !DILexicalBlock(scope: !268, file: !3, line: 102, column: 11)
!268 = distinct !DILexicalBlock(scope: !269, file: !3, line: 102, column: 3)
!269 = distinct !DILexicalBlock(scope: !224, file: !3, line: 102, column: 3)
!270 = !DILocation(line: 104, column: 5, scope: !267)
!271 = !DILocation(line: 102, column: 3, scope: !268)
!272 = distinct !{!272, !273, !274}
!273 = !DILocation(line: 102, column: 3, scope: !269)
!274 = !DILocation(line: 105, column: 3, scope: !269)
!275 = !{!276}
!276 = !{i64 2, i64 3, i1 false}
