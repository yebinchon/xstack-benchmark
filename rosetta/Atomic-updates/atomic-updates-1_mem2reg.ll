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
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !68

lor.lhs.false:                                    ; preds = %entry
  %cmp1 = icmp slt i32 %howmuch, 0, !dbg !69
  br i1 %cmp1, label %if.then, label %lor.lhs.false2, !dbg !70

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %cmp3 = icmp slt i32 %from, 0, !dbg !71
  br i1 %cmp3, label %if.then, label %lor.lhs.false4, !dbg !72

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %cmp5 = icmp slt i32 %to, 0, !dbg !73
  br i1 %cmp5, label %if.then, label %lor.lhs.false6, !dbg !74

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %cmp7 = icmp sge i32 %from, 15, !dbg !75
  br i1 %cmp7, label %if.then, label %lor.lhs.false8, !dbg !76

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %cmp9 = icmp sge i32 %to, 15, !dbg !77
  br i1 %cmp9, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return, !dbg !79

if.end:                                           ; preds = %lor.lhs.false8
  %cmp10 = icmp sgt i32 %from, %to, !dbg !80
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !82

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %from, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 %to, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %from, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8 1, metadata !64, metadata !DIExpression()), !dbg !61
  %sub = sub nsw i32 0, %howmuch, !dbg !86
  call void @llvm.dbg.value(metadata i32 %sub, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end12, !dbg !87

if.end12:                                         ; preds = %if.then11, %if.end
  %swapped.0 = phi i8 [ 1, %if.then11 ], [ 0, %if.end ], !dbg !61
  %howmuch.addr.0 = phi i32 [ %sub, %if.then11 ], [ %howmuch, %if.end ]
  %to.addr.0 = phi i32 [ %from, %if.then11 ], [ %to, %if.end ]
  %from.addr.0 = phi i32 [ %to, %if.then11 ], [ %from, %if.end ]
  call void @llvm.dbg.value(metadata i32 %from.addr.0, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %to.addr.0, metadata !62, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.0, metadata !63, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i8 %swapped.0, metadata !64, metadata !DIExpression()), !dbg !61
  %idxprom = sext i32 %from.addr.0 to i64, !dbg !88
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !88
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !89
  %idxprom13 = sext i32 %to.addr.0 to i64, !dbg !90
  %arrayidx14 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom13, !dbg !90
  %call15 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx14) #4, !dbg !91
  %idxprom16 = sext i32 %from.addr.0 to i64, !dbg !92
  %arrayidx17 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom16, !dbg !92
  %0 = load i32, i32* %arrayidx17, align 4, !dbg !92
  %cmp18 = icmp sgt i32 %howmuch.addr.0, %0, !dbg !94
  br i1 %cmp18, label %land.lhs.true, label %if.end22, !dbg !95

land.lhs.true:                                    ; preds = %if.end12
  %tobool = trunc i8 %swapped.0 to i1, !dbg !96
  br i1 %tobool, label %if.end22, label %if.then19, !dbg !97

if.then19:                                        ; preds = %land.lhs.true
  %idxprom20 = sext i32 %from.addr.0 to i64, !dbg !98
  %arrayidx21 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom20, !dbg !98
  %1 = load i32, i32* %arrayidx21, align 4, !dbg !98
  call void @llvm.dbg.value(metadata i32 %1, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end22, !dbg !99

if.end22:                                         ; preds = %if.then19, %land.lhs.true, %if.end12
  %howmuch.addr.1 = phi i32 [ %howmuch.addr.0, %land.lhs.true ], [ %1, %if.then19 ], [ %howmuch.addr.0, %if.end12 ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.1, metadata !63, metadata !DIExpression()), !dbg !61
  %sub23 = sub nsw i32 0, %howmuch.addr.1, !dbg !100
  %idxprom24 = sext i32 %to.addr.0 to i64, !dbg !102
  %arrayidx25 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom24, !dbg !102
  %2 = load i32, i32* %arrayidx25, align 4, !dbg !102
  %cmp26 = icmp sgt i32 %sub23, %2, !dbg !103
  br i1 %cmp26, label %land.lhs.true27, label %if.end33, !dbg !104

land.lhs.true27:                                  ; preds = %if.end22
  %tobool28 = trunc i8 %swapped.0 to i1, !dbg !105
  br i1 %tobool28, label %if.then29, label %if.end33, !dbg !106

if.then29:                                        ; preds = %land.lhs.true27
  %idxprom30 = sext i32 %to.addr.0 to i64, !dbg !107
  %arrayidx31 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom30, !dbg !107
  %3 = load i32, i32* %arrayidx31, align 4, !dbg !107
  %sub32 = sub nsw i32 0, %3, !dbg !108
  call void @llvm.dbg.value(metadata i32 %sub32, metadata !63, metadata !DIExpression()), !dbg !61
  br label %if.end33, !dbg !109

if.end33:                                         ; preds = %if.then29, %land.lhs.true27, %if.end22
  %howmuch.addr.2 = phi i32 [ %sub32, %if.then29 ], [ %howmuch.addr.1, %land.lhs.true27 ], [ %howmuch.addr.1, %if.end22 ], !dbg !61
  call void @llvm.dbg.value(metadata i32 %howmuch.addr.2, metadata !63, metadata !DIExpression()), !dbg !61
  %idxprom34 = sext i32 %from.addr.0 to i64, !dbg !110
  %arrayidx35 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom34, !dbg !110
  %4 = load i32, i32* %arrayidx35, align 4, !dbg !111
  %sub36 = sub nsw i32 %4, %howmuch.addr.2, !dbg !111
  store i32 %sub36, i32* %arrayidx35, align 4, !dbg !111
  %idxprom37 = sext i32 %to.addr.0 to i64, !dbg !112
  %arrayidx38 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom37, !dbg !112
  %5 = load i32, i32* %arrayidx38, align 4, !dbg !113
  %add = add nsw i32 %5, %howmuch.addr.2, !dbg !113
  store i32 %add, i32* %arrayidx38, align 4, !dbg !113
  %idxprom39 = sext i32 %from.addr.0 to i64, !dbg !114
  %arrayidx40 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom39, !dbg !114
  %call41 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx40) #4, !dbg !115
  %idxprom42 = sext i32 %to.addr.0 to i64, !dbg !116
  %arrayidx43 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom42, !dbg !116
  %call44 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx43) #4, !dbg !117
  br label %return, !dbg !118

return:                                           ; preds = %if.end33, %if.then
  ret void, !dbg !118
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_buckets() #0 !dbg !119 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !127
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !124, metadata !DIExpression()), !dbg !123
  %cmp = icmp slt i32 %i.0, 15, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !131
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !132
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !133
  call void @llvm.dbg.value(metadata i32 %inc, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond1, !dbg !137

for.cond1:                                        ; preds = %for.inc9, %for.end
  %sum.0 = phi i32 [ 0, %for.end ], [ %add, %for.inc9 ], !dbg !123
  %i.1 = phi i32 [ 0, %for.end ], [ %inc10, %for.inc9 ], !dbg !139
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !124, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !122, metadata !DIExpression()), !dbg !123
  %cmp2 = icmp slt i32 %i.1, 15, !dbg !140
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !142

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64, !dbg !143
  %arrayidx5 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom4, !dbg !143
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !143
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !145
  %idxprom7 = sext i32 %i.1 to i64, !dbg !146
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !146
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !146
  %add = add nsw i32 %sum.0, %1, !dbg !147
  call void @llvm.dbg.value(metadata i32 %add, metadata !122, metadata !DIExpression()), !dbg !123
  br label %for.inc9, !dbg !148

for.inc9:                                         ; preds = %for.body3
  %inc10 = add nsw i32 %i.1, 1, !dbg !149
  call void @llvm.dbg.value(metadata i32 %inc10, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond1, !dbg !150, !llvm.loop !151

for.end11:                                        ; preds = %for.cond1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %sum.0), !dbg !153
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond13, !dbg !154

for.cond13:                                       ; preds = %for.inc19, %for.end11
  %i.2 = phi i32 [ 0, %for.end11 ], [ %inc20, %for.inc19 ], !dbg !156
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !124, metadata !DIExpression()), !dbg !123
  %cmp14 = icmp slt i32 %i.2, 15, !dbg !157
  br i1 %cmp14, label %for.body15, label %for.end21, !dbg !159

for.body15:                                       ; preds = %for.cond13
  %idxprom16 = sext i32 %i.2 to i64, !dbg !160
  %arrayidx17 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom16, !dbg !160
  %call18 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx17) #4, !dbg !161
  br label %for.inc19, !dbg !161

for.inc19:                                        ; preds = %for.body15
  %inc20 = add nsw i32 %i.2, 1, !dbg !162
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !124, metadata !DIExpression()), !dbg !123
  br label %for.cond13, !dbg !163, !llvm.loop !164

for.end21:                                        ; preds = %for.cond13
  ret void, !dbg !166
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @equalizer_start(i8* %t) #0 !dbg !167 {
entry:
  call void @llvm.dbg.value(metadata i8* %t, metadata !170, metadata !DIExpression()), !dbg !171
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %if.end, %entry
  %call = call i32 @rand() #4, !dbg !173
  %rem = srem i32 %call, 15, !dbg !177
  call void @llvm.dbg.value(metadata i32 %rem, metadata !178, metadata !DIExpression()), !dbg !179
  %call1 = call i32 @rand() #4, !dbg !180
  %rem2 = srem i32 %call1, 15, !dbg !181
  call void @llvm.dbg.value(metadata i32 %rem2, metadata !182, metadata !DIExpression()), !dbg !179
  %idxprom = sext i32 %rem to i64, !dbg !183
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !183
  %0 = load i32, i32* %arrayidx, align 4, !dbg !183
  %idxprom3 = sext i32 %rem2 to i64, !dbg !184
  %arrayidx4 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom3, !dbg !184
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !184
  %sub = sub nsw i32 %0, %1, !dbg !185
  call void @llvm.dbg.value(metadata i32 %sub, metadata !186, metadata !DIExpression()), !dbg !179
  %cmp = icmp slt i32 %sub, 0, !dbg !187
  br i1 %cmp, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %for.cond
  %sub5 = sub nsw i32 0, %sub, !dbg !190
  %div = sdiv i32 %sub5, 2, !dbg !191
  call void @transfer_value(i32 %rem2, i32 %rem, i32 %div), !dbg !192
  br label %if.end, !dbg !192

if.else:                                          ; preds = %for.cond
  %div6 = sdiv i32 %sub, 2, !dbg !193
  call void @transfer_value(i32 %rem, i32 %rem2, i32 %div6), !dbg !194
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond, !dbg !195, !llvm.loop !196
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @randomizer_start(i8* %t) #0 !dbg !199 {
entry:
  call void @llvm.dbg.value(metadata i8* %t, metadata !200, metadata !DIExpression()), !dbg !201
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.cond, %entry
  %call = call i32 @rand() #4, !dbg !203
  %rem = srem i32 %call, 15, !dbg !207
  call void @llvm.dbg.value(metadata i32 %rem, metadata !208, metadata !DIExpression()), !dbg !209
  %call1 = call i32 @rand() #4, !dbg !210
  %rem2 = srem i32 %call1, 15, !dbg !211
  call void @llvm.dbg.value(metadata i32 %rem2, metadata !212, metadata !DIExpression()), !dbg !209
  %call3 = call i32 @rand() #4, !dbg !213
  %idxprom = sext i32 %rem to i64, !dbg !214
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !214
  %0 = load i32, i32* %arrayidx, align 4, !dbg !214
  %add = add nsw i32 %0, 1, !dbg !215
  %rem4 = srem i32 %call3, %add, !dbg !216
  call void @llvm.dbg.value(metadata i32 %rem4, metadata !217, metadata !DIExpression()), !dbg !209
  call void @transfer_value(i32 %rem, i32 %rem2, i32 %rem4), !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !223 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i32 0, metadata !228, metadata !DIExpression()), !dbg !227
  br label %for.cond, !dbg !229

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !231
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !228, metadata !DIExpression()), !dbg !227
  %cmp = icmp slt i32 %i.0, 15, !dbg !232
  br i1 %cmp, label %for.body, label %for.end, !dbg !234

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !235
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !235
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #4, !dbg !236
  br label %for.inc, !dbg !236

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !237
  call void @llvm.dbg.value(metadata i32 %inc, metadata !228, metadata !DIExpression()), !dbg !227
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !228, metadata !DIExpression()), !dbg !227
  br label %for.cond1, !dbg !241

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !243
  %total.0 = phi i32 [ 0, %for.end ], [ %add, %for.inc12 ], !dbg !227
  call void @llvm.dbg.value(metadata i32 %total.0, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !228, metadata !DIExpression()), !dbg !227
  %cmp2 = icmp slt i32 %i.1, 15, !dbg !244
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !246

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @rand() #4, !dbg !247
  %rem = srem i32 %call4, 100, !dbg !249
  %idxprom5 = sext i32 %i.1 to i64, !dbg !250
  %arrayidx6 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom5, !dbg !250
  store i32 %rem, i32* %arrayidx6, align 4, !dbg !251
  %idxprom7 = sext i32 %i.1 to i64, !dbg !252
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !252
  %0 = load i32, i32* %arrayidx8, align 4, !dbg !252
  %add = add nsw i32 %total.0, %0, !dbg !253
  call void @llvm.dbg.value(metadata i32 %add, metadata !226, metadata !DIExpression()), !dbg !227
  %idxprom9 = sext i32 %i.1 to i64, !dbg !254
  %arrayidx10 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom9, !dbg !254
  %1 = load i32, i32* %arrayidx10, align 4, !dbg !254
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !255
  br label %for.inc12, !dbg !256

for.inc12:                                        ; preds = %for.body3
  %inc13 = add nsw i32 %i.1, 1, !dbg !257
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !228, metadata !DIExpression()), !dbg !227
  br label %for.cond1, !dbg !258, !llvm.loop !259

for.end14:                                        ; preds = %for.cond1
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %total.0), !dbg !261
  %call16 = call i32 @pthread_create(i64* @equalizer, %union.pthread_attr_t* null, i8* (i8*)* @equalizer_start, i8* null) #4, !dbg !262
  %call17 = call i32 @pthread_create(i64* @randomizer, %union.pthread_attr_t* null, i8* (i8*)* @randomizer_start, i8* null) #4, !dbg !263
  br label %for.cond18, !dbg !264

for.cond18:                                       ; preds = %for.cond18, %for.end14
  %call19 = call i32 @sleep(i32 1), !dbg !265
  call void @print_buckets(), !dbg !269
  br label %for.cond18, !dbg !270, !llvm.loop !271
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #2

; Function Attrs: nounwind
declare !callback !274 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
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
!56 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!69 = !DILocation(line: 20, column: 34, scope: !67)
!70 = !DILocation(line: 20, column: 40, scope: !67)
!71 = !DILocation(line: 21, column: 14, scope: !67)
!72 = !DILocation(line: 21, column: 20, scope: !67)
!73 = !DILocation(line: 21, column: 27, scope: !67)
!74 = !DILocation(line: 21, column: 32, scope: !67)
!75 = !DILocation(line: 21, column: 41, scope: !67)
!76 = !DILocation(line: 21, column: 55, scope: !67)
!77 = !DILocation(line: 21, column: 62, scope: !67)
!78 = !DILocation(line: 20, column: 8, scope: !57)
!79 = !DILocation(line: 21, column: 78, scope: !67)
!80 = !DILocation(line: 23, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !57, file: !3, line: 23, column: 8)
!82 = !DILocation(line: 23, column: 8, scope: !57)
!83 = !DILocalVariable(name: "temp1", scope: !84, file: !3, line: 24, type: !11)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 23, column: 20)
!85 = !DILocation(line: 0, scope: !84)
!86 = !DILocation(line: 28, column: 15, scope: !84)
!87 = !DILocation(line: 29, column: 3, scope: !84)
!88 = !DILocation(line: 31, column: 23, scope: !57)
!89 = !DILocation(line: 31, column: 3, scope: !57)
!90 = !DILocation(line: 32, column: 23, scope: !57)
!91 = !DILocation(line: 32, column: 3, scope: !57)
!92 = !DILocation(line: 34, column: 18, scope: !93)
!93 = distinct !DILexicalBlock(scope: !57, file: !3, line: 34, column: 8)
!94 = !DILocation(line: 34, column: 16, scope: !93)
!95 = !DILocation(line: 34, column: 32, scope: !93)
!96 = !DILocation(line: 34, column: 36, scope: !93)
!97 = !DILocation(line: 34, column: 8, scope: !57)
!98 = !DILocation(line: 35, column: 15, scope: !93)
!99 = !DILocation(line: 35, column: 5, scope: !93)
!100 = !DILocation(line: 36, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !57, file: !3, line: 36, column: 8)
!102 = !DILocation(line: 36, column: 19, scope: !101)
!103 = !DILocation(line: 36, column: 17, scope: !101)
!104 = !DILocation(line: 36, column: 31, scope: !101)
!105 = !DILocation(line: 36, column: 34, scope: !101)
!106 = !DILocation(line: 36, column: 8, scope: !57)
!107 = !DILocation(line: 37, column: 16, scope: !101)
!108 = !DILocation(line: 37, column: 15, scope: !101)
!109 = !DILocation(line: 37, column: 5, scope: !101)
!110 = !DILocation(line: 39, column: 3, scope: !57)
!111 = !DILocation(line: 39, column: 17, scope: !57)
!112 = !DILocation(line: 40, column: 3, scope: !57)
!113 = !DILocation(line: 40, column: 15, scope: !57)
!114 = !DILocation(line: 42, column: 25, scope: !57)
!115 = !DILocation(line: 42, column: 3, scope: !57)
!116 = !DILocation(line: 43, column: 25, scope: !57)
!117 = !DILocation(line: 43, column: 3, scope: !57)
!118 = !DILocation(line: 44, column: 1, scope: !57)
!119 = distinct !DISubprogram(name: "print_buckets", scope: !3, file: !3, line: 46, type: !120, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DISubroutineType(types: !121)
!121 = !{null}
!122 = !DILocalVariable(name: "sum", scope: !119, file: !3, line: 49, type: !11)
!123 = !DILocation(line: 0, scope: !119)
!124 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 48, type: !11)
!125 = !DILocation(line: 51, column: 7, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !3, line: 51, column: 3)
!127 = !DILocation(line: 0, scope: !126)
!128 = !DILocation(line: 51, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !3, line: 51, column: 3)
!130 = !DILocation(line: 51, column: 3, scope: !126)
!131 = !DILocation(line: 51, column: 52, scope: !129)
!132 = !DILocation(line: 51, column: 32, scope: !129)
!133 = !DILocation(line: 51, column: 28, scope: !129)
!134 = !DILocation(line: 51, column: 3, scope: !129)
!135 = distinct !{!135, !130, !136}
!136 = !DILocation(line: 51, column: 67, scope: !126)
!137 = !DILocation(line: 52, column: 7, scope: !138)
!138 = distinct !DILexicalBlock(scope: !119, file: !3, line: 52, column: 3)
!139 = !DILocation(line: 0, scope: !138)
!140 = !DILocation(line: 52, column: 14, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !3, line: 52, column: 3)
!142 = !DILocation(line: 52, column: 3, scope: !138)
!143 = !DILocation(line: 53, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 52, column: 32)
!145 = !DILocation(line: 53, column: 5, scope: !144)
!146 = !DILocation(line: 54, column: 12, scope: !144)
!147 = !DILocation(line: 54, column: 9, scope: !144)
!148 = !DILocation(line: 55, column: 3, scope: !144)
!149 = !DILocation(line: 52, column: 28, scope: !141)
!150 = !DILocation(line: 52, column: 3, scope: !141)
!151 = distinct !{!151, !142, !152}
!152 = !DILocation(line: 55, column: 3, scope: !138)
!153 = !DILocation(line: 56, column: 3, scope: !119)
!154 = !DILocation(line: 57, column: 7, scope: !155)
!155 = distinct !DILexicalBlock(scope: !119, file: !3, line: 57, column: 3)
!156 = !DILocation(line: 0, scope: !155)
!157 = !DILocation(line: 57, column: 14, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 57, column: 3)
!159 = !DILocation(line: 57, column: 3, scope: !155)
!160 = !DILocation(line: 57, column: 54, scope: !158)
!161 = !DILocation(line: 57, column: 32, scope: !158)
!162 = !DILocation(line: 57, column: 28, scope: !158)
!163 = !DILocation(line: 57, column: 3, scope: !158)
!164 = distinct !{!164, !159, !165}
!165 = !DILocation(line: 57, column: 69, scope: !155)
!166 = !DILocation(line: 58, column: 1, scope: !119)
!167 = distinct !DISubprogram(name: "equalizer_start", scope: !3, file: !3, line: 60, type: !168, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DISubroutineType(types: !169)
!169 = !{!6, !6}
!170 = !DILocalVariable(name: "t", arg: 1, scope: !167, file: !3, line: 60, type: !6)
!171 = !DILocation(line: 0, scope: !167)
!172 = !DILocation(line: 62, column: 3, scope: !167)
!173 = !DILocation(line: 63, column: 14, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !3, line: 62, column: 11)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 62, column: 3)
!176 = distinct !DILexicalBlock(scope: !167, file: !3, line: 62, column: 3)
!177 = !DILocation(line: 63, column: 20, scope: !174)
!178 = !DILocalVariable(name: "b1", scope: !174, file: !3, line: 63, type: !11)
!179 = !DILocation(line: 0, scope: !174)
!180 = !DILocation(line: 64, column: 14, scope: !174)
!181 = !DILocation(line: 64, column: 20, scope: !174)
!182 = !DILocalVariable(name: "b2", scope: !174, file: !3, line: 64, type: !11)
!183 = !DILocation(line: 65, column: 16, scope: !174)
!184 = !DILocation(line: 65, column: 30, scope: !174)
!185 = !DILocation(line: 65, column: 28, scope: !174)
!186 = !DILocalVariable(name: "diff", scope: !174, file: !3, line: 65, type: !11)
!187 = !DILocation(line: 66, column: 15, scope: !188)
!188 = distinct !DILexicalBlock(scope: !174, file: !3, line: 66, column: 10)
!189 = !DILocation(line: 66, column: 10, scope: !174)
!190 = !DILocation(line: 67, column: 30, scope: !188)
!191 = !DILocation(line: 67, column: 35, scope: !188)
!192 = !DILocation(line: 67, column: 7, scope: !188)
!193 = !DILocation(line: 69, column: 34, scope: !188)
!194 = !DILocation(line: 69, column: 7, scope: !188)
!195 = !DILocation(line: 62, column: 3, scope: !175)
!196 = distinct !{!196, !197, !198}
!197 = !DILocation(line: 62, column: 3, scope: !176)
!198 = !DILocation(line: 70, column: 3, scope: !176)
!199 = distinct !DISubprogram(name: "randomizer_start", scope: !3, file: !3, line: 74, type: !168, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!200 = !DILocalVariable(name: "t", arg: 1, scope: !199, file: !3, line: 74, type: !6)
!201 = !DILocation(line: 0, scope: !199)
!202 = !DILocation(line: 76, column: 3, scope: !199)
!203 = !DILocation(line: 77, column: 14, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !3, line: 76, column: 11)
!205 = distinct !DILexicalBlock(scope: !206, file: !3, line: 76, column: 3)
!206 = distinct !DILexicalBlock(scope: !199, file: !3, line: 76, column: 3)
!207 = !DILocation(line: 77, column: 20, scope: !204)
!208 = !DILocalVariable(name: "b1", scope: !204, file: !3, line: 77, type: !11)
!209 = !DILocation(line: 0, scope: !204)
!210 = !DILocation(line: 78, column: 14, scope: !204)
!211 = !DILocation(line: 78, column: 20, scope: !204)
!212 = !DILocalVariable(name: "b2", scope: !204, file: !3, line: 78, type: !11)
!213 = !DILocation(line: 79, column: 16, scope: !204)
!214 = !DILocation(line: 79, column: 24, scope: !204)
!215 = !DILocation(line: 79, column: 35, scope: !204)
!216 = !DILocation(line: 79, column: 22, scope: !204)
!217 = !DILocalVariable(name: "diff", scope: !204, file: !3, line: 79, type: !11)
!218 = !DILocation(line: 80, column: 5, scope: !204)
!219 = !DILocation(line: 76, column: 3, scope: !205)
!220 = distinct !{!220, !221, !222}
!221 = !DILocation(line: 76, column: 3, scope: !206)
!222 = !DILocation(line: 81, column: 3, scope: !206)
!223 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 85, type: !224, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DISubroutineType(types: !225)
!225 = !{!11}
!226 = !DILocalVariable(name: "total", scope: !223, file: !3, line: 87, type: !11)
!227 = !DILocation(line: 0, scope: !223)
!228 = !DILocalVariable(name: "i", scope: !223, file: !3, line: 87, type: !11)
!229 = !DILocation(line: 89, column: 7, scope: !230)
!230 = distinct !DILexicalBlock(scope: !223, file: !3, line: 89, column: 3)
!231 = !DILocation(line: 0, scope: !230)
!232 = !DILocation(line: 89, column: 14, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !3, line: 89, column: 3)
!234 = !DILocation(line: 89, column: 3, scope: !230)
!235 = !DILocation(line: 89, column: 52, scope: !233)
!236 = !DILocation(line: 89, column: 32, scope: !233)
!237 = !DILocation(line: 89, column: 28, scope: !233)
!238 = !DILocation(line: 89, column: 3, scope: !233)
!239 = distinct !{!239, !234, !240}
!240 = !DILocation(line: 89, column: 73, scope: !230)
!241 = !DILocation(line: 91, column: 7, scope: !242)
!242 = distinct !DILexicalBlock(scope: !223, file: !3, line: 91, column: 3)
!243 = !DILocation(line: 0, scope: !242)
!244 = !DILocation(line: 91, column: 14, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !3, line: 91, column: 3)
!246 = !DILocation(line: 91, column: 3, scope: !242)
!247 = !DILocation(line: 92, column: 18, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !3, line: 91, column: 32)
!249 = !DILocation(line: 92, column: 25, scope: !248)
!250 = !DILocation(line: 92, column: 5, scope: !248)
!251 = !DILocation(line: 92, column: 16, scope: !248)
!252 = !DILocation(line: 93, column: 14, scope: !248)
!253 = !DILocation(line: 93, column: 11, scope: !248)
!254 = !DILocation(line: 94, column: 20, scope: !248)
!255 = !DILocation(line: 94, column: 5, scope: !248)
!256 = !DILocation(line: 95, column: 3, scope: !248)
!257 = !DILocation(line: 91, column: 28, scope: !245)
!258 = !DILocation(line: 91, column: 3, scope: !245)
!259 = distinct !{!259, !246, !260}
!260 = !DILocation(line: 95, column: 3, scope: !242)
!261 = !DILocation(line: 96, column: 3, scope: !223)
!262 = !DILocation(line: 99, column: 3, scope: !223)
!263 = !DILocation(line: 100, column: 3, scope: !223)
!264 = !DILocation(line: 102, column: 3, scope: !223)
!265 = !DILocation(line: 103, column: 5, scope: !266)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 102, column: 11)
!267 = distinct !DILexicalBlock(scope: !268, file: !3, line: 102, column: 3)
!268 = distinct !DILexicalBlock(scope: !223, file: !3, line: 102, column: 3)
!269 = !DILocation(line: 104, column: 5, scope: !266)
!270 = !DILocation(line: 102, column: 3, scope: !267)
!271 = distinct !{!271, !272, !273}
!272 = !DILocation(line: 102, column: 3, scope: !268)
!273 = !DILocation(line: 105, column: 3, scope: !268)
!274 = !{!275}
!275 = !{i64 2, i64 3, i1 false}
