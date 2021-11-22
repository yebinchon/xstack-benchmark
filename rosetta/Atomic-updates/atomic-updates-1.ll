; ModuleID = 'atomic-updates-1.c'
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
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %howmuch.addr = alloca i32, align 4
  %swapped = alloca i8, align 1
  %temp1 = alloca i32, align 4
  store i32 %from, i32* %from.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %from.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 %to, i32* %to.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %to.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 %howmuch, i32* %howmuch.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %howmuch.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8* %swapped, metadata !66, metadata !DIExpression()), !dbg !68
  store i8 0, i8* %swapped, align 1, !dbg !68
  %0 = load i32, i32* %from.addr, align 4, !dbg !69
  %1 = load i32, i32* %to.addr, align 4, !dbg !71
  %cmp = icmp eq i32 %0, %1, !dbg !72
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !73, !cf.info !74

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %howmuch.addr, align 4, !dbg !75
  %cmp1 = icmp slt i32 %2, 0, !dbg !76
  br i1 %cmp1, label %if.then, label %lor.lhs.false2, !dbg !77, !cf.info !74

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* %from.addr, align 4, !dbg !78
  %cmp3 = icmp slt i32 %3, 0, !dbg !79
  br i1 %cmp3, label %if.then, label %lor.lhs.false4, !dbg !80, !cf.info !74

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %4 = load i32, i32* %to.addr, align 4, !dbg !81
  %cmp5 = icmp slt i32 %4, 0, !dbg !82
  br i1 %cmp5, label %if.then, label %lor.lhs.false6, !dbg !83, !cf.info !74

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %5 = load i32, i32* %from.addr, align 4, !dbg !84
  %cmp7 = icmp sge i32 %5, 15, !dbg !85
  br i1 %cmp7, label %if.then, label %lor.lhs.false8, !dbg !86, !cf.info !74

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %6 = load i32, i32* %to.addr, align 4, !dbg !87
  %cmp9 = icmp sge i32 %6, 15, !dbg !88
  br i1 %cmp9, label %if.then, label %if.end, !dbg !89, !cf.info !74

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return, !dbg !90

if.end:                                           ; preds = %lor.lhs.false8
  %7 = load i32, i32* %from.addr, align 4, !dbg !91
  %8 = load i32, i32* %to.addr, align 4, !dbg !93
  %cmp10 = icmp sgt i32 %7, %8, !dbg !94
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !95, !cf.info !74

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %temp1, metadata !96, metadata !DIExpression()), !dbg !98
  %9 = load i32, i32* %from.addr, align 4, !dbg !99
  store i32 %9, i32* %temp1, align 4, !dbg !98
  %10 = load i32, i32* %to.addr, align 4, !dbg !100
  store i32 %10, i32* %from.addr, align 4, !dbg !101
  %11 = load i32, i32* %temp1, align 4, !dbg !102
  store i32 %11, i32* %to.addr, align 4, !dbg !103
  store i8 1, i8* %swapped, align 1, !dbg !104
  %12 = load i32, i32* %howmuch.addr, align 4, !dbg !105
  %sub = sub nsw i32 0, %12, !dbg !106
  store i32 %sub, i32* %howmuch.addr, align 4, !dbg !107
  br label %if.end12, !dbg !108

if.end12:                                         ; preds = %if.then11, %if.end
  %13 = load i32, i32* %from.addr, align 4, !dbg !109
  %idxprom = sext i32 %13 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !110
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !111
  %14 = load i32, i32* %to.addr, align 4, !dbg !112
  %idxprom13 = sext i32 %14 to i64, !dbg !113
  %arrayidx14 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom13, !dbg !113
  %call15 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx14) #4, !dbg !114
  %15 = load i32, i32* %howmuch.addr, align 4, !dbg !115
  %16 = load i32, i32* %from.addr, align 4, !dbg !117
  %idxprom16 = sext i32 %16 to i64, !dbg !118
  %arrayidx17 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom16, !dbg !118
  %17 = load i32, i32* %arrayidx17, align 4, !dbg !118
  %cmp18 = icmp sgt i32 %15, %17, !dbg !119
  br i1 %cmp18, label %land.lhs.true, label %if.end22, !dbg !120, !cf.info !74

land.lhs.true:                                    ; preds = %if.end12
  %18 = load i8, i8* %swapped, align 1, !dbg !121
  %tobool = trunc i8 %18 to i1, !dbg !121
  br i1 %tobool, label %if.end22, label %if.then19, !dbg !122, !cf.info !74

if.then19:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %from.addr, align 4, !dbg !123
  %idxprom20 = sext i32 %19 to i64, !dbg !124
  %arrayidx21 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom20, !dbg !124
  %20 = load i32, i32* %arrayidx21, align 4, !dbg !124
  store i32 %20, i32* %howmuch.addr, align 4, !dbg !125
  br label %if.end22, !dbg !126

if.end22:                                         ; preds = %if.then19, %land.lhs.true, %if.end12
  %21 = load i32, i32* %howmuch.addr, align 4, !dbg !127
  %sub23 = sub nsw i32 0, %21, !dbg !129
  %22 = load i32, i32* %to.addr, align 4, !dbg !130
  %idxprom24 = sext i32 %22 to i64, !dbg !131
  %arrayidx25 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom24, !dbg !131
  %23 = load i32, i32* %arrayidx25, align 4, !dbg !131
  %cmp26 = icmp sgt i32 %sub23, %23, !dbg !132
  br i1 %cmp26, label %land.lhs.true27, label %if.end33, !dbg !133, !cf.info !74

land.lhs.true27:                                  ; preds = %if.end22
  %24 = load i8, i8* %swapped, align 1, !dbg !134
  %tobool28 = trunc i8 %24 to i1, !dbg !134
  br i1 %tobool28, label %if.then29, label %if.end33, !dbg !135, !cf.info !74

if.then29:                                        ; preds = %land.lhs.true27
  %25 = load i32, i32* %to.addr, align 4, !dbg !136
  %idxprom30 = sext i32 %25 to i64, !dbg !137
  %arrayidx31 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom30, !dbg !137
  %26 = load i32, i32* %arrayidx31, align 4, !dbg !137
  %sub32 = sub nsw i32 0, %26, !dbg !138
  store i32 %sub32, i32* %howmuch.addr, align 4, !dbg !139
  br label %if.end33, !dbg !140

if.end33:                                         ; preds = %if.then29, %land.lhs.true27, %if.end22
  %27 = load i32, i32* %howmuch.addr, align 4, !dbg !141
  %28 = load i32, i32* %from.addr, align 4, !dbg !142
  %idxprom34 = sext i32 %28 to i64, !dbg !143
  %arrayidx35 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom34, !dbg !143
  %29 = load i32, i32* %arrayidx35, align 4, !dbg !144
  %sub36 = sub nsw i32 %29, %27, !dbg !144
  store i32 %sub36, i32* %arrayidx35, align 4, !dbg !144
  %30 = load i32, i32* %howmuch.addr, align 4, !dbg !145
  %31 = load i32, i32* %to.addr, align 4, !dbg !146
  %idxprom37 = sext i32 %31 to i64, !dbg !147
  %arrayidx38 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom37, !dbg !147
  %32 = load i32, i32* %arrayidx38, align 4, !dbg !148
  %add = add nsw i32 %32, %30, !dbg !148
  store i32 %add, i32* %arrayidx38, align 4, !dbg !148
  %33 = load i32, i32* %from.addr, align 4, !dbg !149
  %idxprom39 = sext i32 %33 to i64, !dbg !150
  %arrayidx40 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom39, !dbg !150
  %call41 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx40) #4, !dbg !151
  %34 = load i32, i32* %to.addr, align 4, !dbg !152
  %idxprom42 = sext i32 %34 to i64, !dbg !153
  %arrayidx43 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom42, !dbg !153
  %call44 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx43) #4, !dbg !154
  br label %return, !dbg !155

return:                                           ; preds = %if.end33, %if.then
  ret void, !dbg !155
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_buckets() #0 !dbg !156 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !161, metadata !DIExpression()), !dbg !162
  store i32 0, i32* %sum, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !166
  %cmp = icmp slt i32 %0, 15, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !170
  %idxprom = sext i32 %1 to i64, !dbg !171
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !171
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !172
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %2, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !177
  br label %for.cond1, !dbg !179

for.cond1:                                        ; preds = %for.inc9, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !180
  %cmp2 = icmp slt i32 %3, 15, !dbg !182
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !183

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !184
  %idxprom4 = sext i32 %4 to i64, !dbg !186
  %arrayidx5 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom4, !dbg !186
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !186
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %5), !dbg !187
  %6 = load i32, i32* %i, align 4, !dbg !188
  %idxprom7 = sext i32 %6 to i64, !dbg !189
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !189
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !189
  %8 = load i32, i32* %sum, align 4, !dbg !190
  %add = add nsw i32 %8, %7, !dbg !190
  store i32 %add, i32* %sum, align 4, !dbg !190
  br label %for.inc9, !dbg !191

for.inc9:                                         ; preds = %for.body3
  %9 = load i32, i32* %i, align 4, !dbg !192
  %inc10 = add nsw i32 %9, 1, !dbg !192
  store i32 %inc10, i32* %i, align 4, !dbg !192
  br label %for.cond1, !dbg !193, !llvm.loop !194

for.end11:                                        ; preds = %for.cond1
  %10 = load i32, i32* %sum, align 4, !dbg !196
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %10), !dbg !197
  store i32 0, i32* %i, align 4, !dbg !198
  br label %for.cond13, !dbg !200

for.cond13:                                       ; preds = %for.inc19, %for.end11
  %11 = load i32, i32* %i, align 4, !dbg !201
  %cmp14 = icmp slt i32 %11, 15, !dbg !203
  br i1 %cmp14, label %for.body15, label %for.end21, !dbg !204

for.body15:                                       ; preds = %for.cond13
  %12 = load i32, i32* %i, align 4, !dbg !205
  %idxprom16 = sext i32 %12 to i64, !dbg !206
  %arrayidx17 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom16, !dbg !206
  %call18 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx17) #4, !dbg !207
  br label %for.inc19, !dbg !207

for.inc19:                                        ; preds = %for.body15
  %13 = load i32, i32* %i, align 4, !dbg !208
  %inc20 = add nsw i32 %13, 1, !dbg !208
  store i32 %inc20, i32* %i, align 4, !dbg !208
  br label %for.cond13, !dbg !209, !llvm.loop !210

for.end21:                                        ; preds = %for.cond13
  ret void, !dbg !212
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @equalizer_start(i8* %t) #0 !dbg !213 {
entry:
  %t.addr = alloca i8*, align 8
  %b1 = alloca i32, align 4
  %b2 = alloca i32, align 4
  %diff = alloca i32, align 4
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !216, metadata !DIExpression()), !dbg !217
  br label %for.cond, !dbg !218

for.cond:                                         ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i32* %b1, metadata !219, metadata !DIExpression()), !dbg !223
  %call = call i32 @rand() #4, !dbg !224
  %rem = srem i32 %call, 15, !dbg !225
  store i32 %rem, i32* %b1, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %b2, metadata !226, metadata !DIExpression()), !dbg !227
  %call1 = call i32 @rand() #4, !dbg !228
  %rem2 = srem i32 %call1, 15, !dbg !229
  store i32 %rem2, i32* %b2, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !230, metadata !DIExpression()), !dbg !231
  %0 = load i32, i32* %b1, align 4, !dbg !232
  %idxprom = sext i32 %0 to i64, !dbg !233
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !233
  %1 = load i32, i32* %arrayidx, align 4, !dbg !233
  %2 = load i32, i32* %b2, align 4, !dbg !234
  %idxprom3 = sext i32 %2 to i64, !dbg !235
  %arrayidx4 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom3, !dbg !235
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !235
  %sub = sub nsw i32 %1, %3, !dbg !236
  store i32 %sub, i32* %diff, align 4, !dbg !231
  %4 = load i32, i32* %diff, align 4, !dbg !237
  %cmp = icmp slt i32 %4, 0, !dbg !239
  br i1 %cmp, label %if.then, label %if.else, !dbg !240, !cf.info !74

if.then:                                          ; preds = %for.cond
  %5 = load i32, i32* %b2, align 4, !dbg !241
  %6 = load i32, i32* %b1, align 4, !dbg !242
  %7 = load i32, i32* %diff, align 4, !dbg !243
  %sub5 = sub nsw i32 0, %7, !dbg !244
  %div = sdiv i32 %sub5, 2, !dbg !245
  call void @transfer_value(i32 %5, i32 %6, i32 %div), !dbg !246
  br label %if.end, !dbg !246

if.else:                                          ; preds = %for.cond
  %8 = load i32, i32* %b1, align 4, !dbg !247
  %9 = load i32, i32* %b2, align 4, !dbg !248
  %10 = load i32, i32* %diff, align 4, !dbg !249
  %div6 = sdiv i32 %10, 2, !dbg !250
  call void @transfer_value(i32 %8, i32 %9, i32 %div6), !dbg !251
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond, !dbg !252, !llvm.loop !253
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @randomizer_start(i8* %t) #0 !dbg !256 {
entry:
  %t.addr = alloca i8*, align 8
  %b1 = alloca i32, align 4
  %b2 = alloca i32, align 4
  %diff = alloca i32, align 4
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !257, metadata !DIExpression()), !dbg !258
  br label %for.cond, !dbg !259

for.cond:                                         ; preds = %for.cond, %entry
  call void @llvm.dbg.declare(metadata i32* %b1, metadata !260, metadata !DIExpression()), !dbg !264
  %call = call i32 @rand() #4, !dbg !265
  %rem = srem i32 %call, 15, !dbg !266
  store i32 %rem, i32* %b1, align 4, !dbg !264
  call void @llvm.dbg.declare(metadata i32* %b2, metadata !267, metadata !DIExpression()), !dbg !268
  %call1 = call i32 @rand() #4, !dbg !269
  %rem2 = srem i32 %call1, 15, !dbg !270
  store i32 %rem2, i32* %b2, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !271, metadata !DIExpression()), !dbg !272
  %call3 = call i32 @rand() #4, !dbg !273
  %0 = load i32, i32* %b1, align 4, !dbg !274
  %idxprom = sext i32 %0 to i64, !dbg !275
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !275
  %1 = load i32, i32* %arrayidx, align 4, !dbg !275
  %add = add nsw i32 %1, 1, !dbg !276
  %rem4 = srem i32 %call3, %add, !dbg !277
  store i32 %rem4, i32* %diff, align 4, !dbg !272
  %2 = load i32, i32* %b1, align 4, !dbg !278
  %3 = load i32, i32* %b2, align 4, !dbg !279
  %4 = load i32, i32* %diff, align 4, !dbg !280
  call void @transfer_value(i32 %2, i32 %3, i32 %4), !dbg !281
  br label %for.cond, !dbg !282, !llvm.loop !283
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !286 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %total = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !289, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.declare(metadata i32* %total, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 0, i32* %total, align 4, !dbg !292
  store i32 0, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !295

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !296
  %cmp = icmp slt i32 %0, 15, !dbg !298
  br i1 %cmp, label %for.body, label %for.end, !dbg !299

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !300
  %idxprom = sext i32 %1 to i64, !dbg !301
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !301
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #4, !dbg !302
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %2, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !307
  br label %for.cond1, !dbg !309

for.cond1:                                        ; preds = %for.inc12, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !310
  %cmp2 = icmp slt i32 %3, 15, !dbg !312
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !313

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @rand() #4, !dbg !314
  %rem = srem i32 %call4, 100, !dbg !316
  %4 = load i32, i32* %i, align 4, !dbg !317
  %idxprom5 = sext i32 %4 to i64, !dbg !318
  %arrayidx6 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom5, !dbg !318
  store i32 %rem, i32* %arrayidx6, align 4, !dbg !319
  %5 = load i32, i32* %i, align 4, !dbg !320
  %idxprom7 = sext i32 %5 to i64, !dbg !321
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !321
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !321
  %7 = load i32, i32* %total, align 4, !dbg !322
  %add = add nsw i32 %7, %6, !dbg !322
  store i32 %add, i32* %total, align 4, !dbg !322
  %8 = load i32, i32* %i, align 4, !dbg !323
  %idxprom9 = sext i32 %8 to i64, !dbg !324
  %arrayidx10 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom9, !dbg !324
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !324
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %9), !dbg !325
  br label %for.inc12, !dbg !326

for.inc12:                                        ; preds = %for.body3
  %10 = load i32, i32* %i, align 4, !dbg !327
  %inc13 = add nsw i32 %10, 1, !dbg !327
  store i32 %inc13, i32* %i, align 4, !dbg !327
  br label %for.cond1, !dbg !328, !llvm.loop !329

for.end14:                                        ; preds = %for.cond1
  %11 = load i32, i32* %total, align 4, !dbg !331
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %11), !dbg !332
  %call16 = call i32 @pthread_create(i64* @equalizer, %union.pthread_attr_t* null, i8* (i8*)* @equalizer_start, i8* null) #4, !dbg !333
  %call17 = call i32 @pthread_create(i64* @randomizer, %union.pthread_attr_t* null, i8* (i8*)* @randomizer_start, i8* null) #4, !dbg !334
  br label %for.cond18, !dbg !335

for.cond18:                                       ; preds = %for.cond18, %for.end14
  %call19 = call i32 @sleep(i32 1), !dbg !336
  call void @print_buckets(), !dbg !340
  br label %for.cond18, !dbg !341, !llvm.loop !342
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #2

; Function Attrs: nounwind
declare !callback !345 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

declare dso_local i32 @sleep(i32) #3

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
!61 = !DILocation(line: 16, column: 25, scope: !57)
!62 = !DILocalVariable(name: "to", arg: 2, scope: !57, file: !3, line: 16, type: !11)
!63 = !DILocation(line: 16, column: 35, scope: !57)
!64 = !DILocalVariable(name: "howmuch", arg: 3, scope: !57, file: !3, line: 16, type: !11)
!65 = !DILocation(line: 16, column: 43, scope: !57)
!66 = !DILocalVariable(name: "swapped", scope: !57, file: !3, line: 18, type: !67)
!67 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!68 = !DILocation(line: 18, column: 8, scope: !57)
!69 = !DILocation(line: 20, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !57, file: !3, line: 20, column: 8)
!71 = !DILocation(line: 20, column: 17, scope: !70)
!72 = !DILocation(line: 20, column: 14, scope: !70)
!73 = !DILocation(line: 20, column: 21, scope: !70)
!74 = !{!"if"}
!75 = !DILocation(line: 20, column: 26, scope: !70)
!76 = !DILocation(line: 20, column: 34, scope: !70)
!77 = !DILocation(line: 20, column: 40, scope: !70)
!78 = !DILocation(line: 21, column: 9, scope: !70)
!79 = !DILocation(line: 21, column: 14, scope: !70)
!80 = !DILocation(line: 21, column: 20, scope: !70)
!81 = !DILocation(line: 21, column: 24, scope: !70)
!82 = !DILocation(line: 21, column: 27, scope: !70)
!83 = !DILocation(line: 21, column: 32, scope: !70)
!84 = !DILocation(line: 21, column: 36, scope: !70)
!85 = !DILocation(line: 21, column: 41, scope: !70)
!86 = !DILocation(line: 21, column: 55, scope: !70)
!87 = !DILocation(line: 21, column: 59, scope: !70)
!88 = !DILocation(line: 21, column: 62, scope: !70)
!89 = !DILocation(line: 20, column: 8, scope: !57)
!90 = !DILocation(line: 21, column: 78, scope: !70)
!91 = !DILocation(line: 23, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !57, file: !3, line: 23, column: 8)
!93 = !DILocation(line: 23, column: 15, scope: !92)
!94 = !DILocation(line: 23, column: 13, scope: !92)
!95 = !DILocation(line: 23, column: 8, scope: !57)
!96 = !DILocalVariable(name: "temp1", scope: !97, file: !3, line: 24, type: !11)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 23, column: 20)
!98 = !DILocation(line: 24, column: 9, scope: !97)
!99 = !DILocation(line: 24, column: 17, scope: !97)
!100 = !DILocation(line: 25, column: 12, scope: !97)
!101 = !DILocation(line: 25, column: 10, scope: !97)
!102 = !DILocation(line: 26, column: 10, scope: !97)
!103 = !DILocation(line: 26, column: 8, scope: !97)
!104 = !DILocation(line: 27, column: 13, scope: !97)
!105 = !DILocation(line: 28, column: 16, scope: !97)
!106 = !DILocation(line: 28, column: 15, scope: !97)
!107 = !DILocation(line: 28, column: 13, scope: !97)
!108 = !DILocation(line: 29, column: 3, scope: !97)
!109 = !DILocation(line: 31, column: 36, scope: !57)
!110 = !DILocation(line: 31, column: 23, scope: !57)
!111 = !DILocation(line: 31, column: 3, scope: !57)
!112 = !DILocation(line: 32, column: 36, scope: !57)
!113 = !DILocation(line: 32, column: 23, scope: !57)
!114 = !DILocation(line: 32, column: 3, scope: !57)
!115 = !DILocation(line: 34, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !57, file: !3, line: 34, column: 8)
!117 = !DILocation(line: 34, column: 26, scope: !116)
!118 = !DILocation(line: 34, column: 18, scope: !116)
!119 = !DILocation(line: 34, column: 16, scope: !116)
!120 = !DILocation(line: 34, column: 32, scope: !116)
!121 = !DILocation(line: 34, column: 36, scope: !116)
!122 = !DILocation(line: 34, column: 8, scope: !57)
!123 = !DILocation(line: 35, column: 23, scope: !116)
!124 = !DILocation(line: 35, column: 15, scope: !116)
!125 = !DILocation(line: 35, column: 13, scope: !116)
!126 = !DILocation(line: 35, column: 5, scope: !116)
!127 = !DILocation(line: 36, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !57, file: !3, line: 36, column: 8)
!129 = !DILocation(line: 36, column: 8, scope: !128)
!130 = !DILocation(line: 36, column: 27, scope: !128)
!131 = !DILocation(line: 36, column: 19, scope: !128)
!132 = !DILocation(line: 36, column: 17, scope: !128)
!133 = !DILocation(line: 36, column: 31, scope: !128)
!134 = !DILocation(line: 36, column: 34, scope: !128)
!135 = !DILocation(line: 36, column: 8, scope: !57)
!136 = !DILocation(line: 37, column: 24, scope: !128)
!137 = !DILocation(line: 37, column: 16, scope: !128)
!138 = !DILocation(line: 37, column: 15, scope: !128)
!139 = !DILocation(line: 37, column: 13, scope: !128)
!140 = !DILocation(line: 37, column: 5, scope: !128)
!141 = !DILocation(line: 39, column: 20, scope: !57)
!142 = !DILocation(line: 39, column: 11, scope: !57)
!143 = !DILocation(line: 39, column: 3, scope: !57)
!144 = !DILocation(line: 39, column: 17, scope: !57)
!145 = !DILocation(line: 40, column: 18, scope: !57)
!146 = !DILocation(line: 40, column: 11, scope: !57)
!147 = !DILocation(line: 40, column: 3, scope: !57)
!148 = !DILocation(line: 40, column: 15, scope: !57)
!149 = !DILocation(line: 42, column: 38, scope: !57)
!150 = !DILocation(line: 42, column: 25, scope: !57)
!151 = !DILocation(line: 42, column: 3, scope: !57)
!152 = !DILocation(line: 43, column: 38, scope: !57)
!153 = !DILocation(line: 43, column: 25, scope: !57)
!154 = !DILocation(line: 43, column: 3, scope: !57)
!155 = !DILocation(line: 44, column: 1, scope: !57)
!156 = distinct !DISubprogram(name: "print_buckets", scope: !3, file: !3, line: 46, type: !157, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DISubroutineType(types: !158)
!158 = !{null}
!159 = !DILocalVariable(name: "i", scope: !156, file: !3, line: 48, type: !11)
!160 = !DILocation(line: 48, column: 7, scope: !156)
!161 = !DILocalVariable(name: "sum", scope: !156, file: !3, line: 49, type: !11)
!162 = !DILocation(line: 49, column: 7, scope: !156)
!163 = !DILocation(line: 51, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !3, line: 51, column: 3)
!165 = !DILocation(line: 51, column: 7, scope: !164)
!166 = !DILocation(line: 51, column: 12, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !3, line: 51, column: 3)
!168 = !DILocation(line: 51, column: 14, scope: !167)
!169 = !DILocation(line: 51, column: 3, scope: !164)
!170 = !DILocation(line: 51, column: 65, scope: !167)
!171 = !DILocation(line: 51, column: 52, scope: !167)
!172 = !DILocation(line: 51, column: 32, scope: !167)
!173 = !DILocation(line: 51, column: 28, scope: !167)
!174 = !DILocation(line: 51, column: 3, scope: !167)
!175 = distinct !{!175, !169, !176}
!176 = !DILocation(line: 51, column: 67, scope: !164)
!177 = !DILocation(line: 52, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !156, file: !3, line: 52, column: 3)
!179 = !DILocation(line: 52, column: 7, scope: !178)
!180 = !DILocation(line: 52, column: 12, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !3, line: 52, column: 3)
!182 = !DILocation(line: 52, column: 14, scope: !181)
!183 = !DILocation(line: 52, column: 3, scope: !178)
!184 = !DILocation(line: 53, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !3, line: 52, column: 32)
!186 = !DILocation(line: 53, column: 20, scope: !185)
!187 = !DILocation(line: 53, column: 5, scope: !185)
!188 = !DILocation(line: 54, column: 20, scope: !185)
!189 = !DILocation(line: 54, column: 12, scope: !185)
!190 = !DILocation(line: 54, column: 9, scope: !185)
!191 = !DILocation(line: 55, column: 3, scope: !185)
!192 = !DILocation(line: 52, column: 28, scope: !181)
!193 = !DILocation(line: 52, column: 3, scope: !181)
!194 = distinct !{!194, !183, !195}
!195 = !DILocation(line: 55, column: 3, scope: !178)
!196 = !DILocation(line: 56, column: 20, scope: !156)
!197 = !DILocation(line: 56, column: 3, scope: !156)
!198 = !DILocation(line: 57, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !156, file: !3, line: 57, column: 3)
!200 = !DILocation(line: 57, column: 7, scope: !199)
!201 = !DILocation(line: 57, column: 12, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !3, line: 57, column: 3)
!203 = !DILocation(line: 57, column: 14, scope: !202)
!204 = !DILocation(line: 57, column: 3, scope: !199)
!205 = !DILocation(line: 57, column: 67, scope: !202)
!206 = !DILocation(line: 57, column: 54, scope: !202)
!207 = !DILocation(line: 57, column: 32, scope: !202)
!208 = !DILocation(line: 57, column: 28, scope: !202)
!209 = !DILocation(line: 57, column: 3, scope: !202)
!210 = distinct !{!210, !204, !211}
!211 = !DILocation(line: 57, column: 69, scope: !199)
!212 = !DILocation(line: 58, column: 1, scope: !156)
!213 = distinct !DISubprogram(name: "equalizer_start", scope: !3, file: !3, line: 60, type: !214, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!214 = !DISubroutineType(types: !215)
!215 = !{!6, !6}
!216 = !DILocalVariable(name: "t", arg: 1, scope: !213, file: !3, line: 60, type: !6)
!217 = !DILocation(line: 60, column: 29, scope: !213)
!218 = !DILocation(line: 62, column: 3, scope: !213)
!219 = !DILocalVariable(name: "b1", scope: !220, file: !3, line: 63, type: !11)
!220 = distinct !DILexicalBlock(scope: !221, file: !3, line: 62, column: 11)
!221 = distinct !DILexicalBlock(scope: !222, file: !3, line: 62, column: 3)
!222 = distinct !DILexicalBlock(scope: !213, file: !3, line: 62, column: 3)
!223 = !DILocation(line: 63, column: 9, scope: !220)
!224 = !DILocation(line: 63, column: 14, scope: !220)
!225 = !DILocation(line: 63, column: 20, scope: !220)
!226 = !DILocalVariable(name: "b2", scope: !220, file: !3, line: 64, type: !11)
!227 = !DILocation(line: 64, column: 9, scope: !220)
!228 = !DILocation(line: 64, column: 14, scope: !220)
!229 = !DILocation(line: 64, column: 20, scope: !220)
!230 = !DILocalVariable(name: "diff", scope: !220, file: !3, line: 65, type: !11)
!231 = !DILocation(line: 65, column: 9, scope: !220)
!232 = !DILocation(line: 65, column: 24, scope: !220)
!233 = !DILocation(line: 65, column: 16, scope: !220)
!234 = !DILocation(line: 65, column: 38, scope: !220)
!235 = !DILocation(line: 65, column: 30, scope: !220)
!236 = !DILocation(line: 65, column: 28, scope: !220)
!237 = !DILocation(line: 66, column: 10, scope: !238)
!238 = distinct !DILexicalBlock(scope: !220, file: !3, line: 66, column: 10)
!239 = !DILocation(line: 66, column: 15, scope: !238)
!240 = !DILocation(line: 66, column: 10, scope: !220)
!241 = !DILocation(line: 67, column: 22, scope: !238)
!242 = !DILocation(line: 67, column: 26, scope: !238)
!243 = !DILocation(line: 67, column: 31, scope: !238)
!244 = !DILocation(line: 67, column: 30, scope: !238)
!245 = !DILocation(line: 67, column: 35, scope: !238)
!246 = !DILocation(line: 67, column: 7, scope: !238)
!247 = !DILocation(line: 69, column: 22, scope: !238)
!248 = !DILocation(line: 69, column: 26, scope: !238)
!249 = !DILocation(line: 69, column: 30, scope: !238)
!250 = !DILocation(line: 69, column: 34, scope: !238)
!251 = !DILocation(line: 69, column: 7, scope: !238)
!252 = !DILocation(line: 62, column: 3, scope: !221)
!253 = distinct !{!253, !254, !255}
!254 = !DILocation(line: 62, column: 3, scope: !222)
!255 = !DILocation(line: 70, column: 3, scope: !222)
!256 = distinct !DISubprogram(name: "randomizer_start", scope: !3, file: !3, line: 74, type: !214, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!257 = !DILocalVariable(name: "t", arg: 1, scope: !256, file: !3, line: 74, type: !6)
!258 = !DILocation(line: 74, column: 30, scope: !256)
!259 = !DILocation(line: 76, column: 3, scope: !256)
!260 = !DILocalVariable(name: "b1", scope: !261, file: !3, line: 77, type: !11)
!261 = distinct !DILexicalBlock(scope: !262, file: !3, line: 76, column: 11)
!262 = distinct !DILexicalBlock(scope: !263, file: !3, line: 76, column: 3)
!263 = distinct !DILexicalBlock(scope: !256, file: !3, line: 76, column: 3)
!264 = !DILocation(line: 77, column: 9, scope: !261)
!265 = !DILocation(line: 77, column: 14, scope: !261)
!266 = !DILocation(line: 77, column: 20, scope: !261)
!267 = !DILocalVariable(name: "b2", scope: !261, file: !3, line: 78, type: !11)
!268 = !DILocation(line: 78, column: 9, scope: !261)
!269 = !DILocation(line: 78, column: 14, scope: !261)
!270 = !DILocation(line: 78, column: 20, scope: !261)
!271 = !DILocalVariable(name: "diff", scope: !261, file: !3, line: 79, type: !11)
!272 = !DILocation(line: 79, column: 9, scope: !261)
!273 = !DILocation(line: 79, column: 16, scope: !261)
!274 = !DILocation(line: 79, column: 32, scope: !261)
!275 = !DILocation(line: 79, column: 24, scope: !261)
!276 = !DILocation(line: 79, column: 35, scope: !261)
!277 = !DILocation(line: 79, column: 22, scope: !261)
!278 = !DILocation(line: 80, column: 20, scope: !261)
!279 = !DILocation(line: 80, column: 24, scope: !261)
!280 = !DILocation(line: 80, column: 28, scope: !261)
!281 = !DILocation(line: 80, column: 5, scope: !261)
!282 = !DILocation(line: 76, column: 3, scope: !262)
!283 = distinct !{!283, !284, !285}
!284 = !DILocation(line: 76, column: 3, scope: !263)
!285 = !DILocation(line: 81, column: 3, scope: !263)
!286 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 85, type: !287, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!287 = !DISubroutineType(types: !288)
!288 = !{!11}
!289 = !DILocalVariable(name: "i", scope: !286, file: !3, line: 87, type: !11)
!290 = !DILocation(line: 87, column: 7, scope: !286)
!291 = !DILocalVariable(name: "total", scope: !286, file: !3, line: 87, type: !11)
!292 = !DILocation(line: 87, column: 10, scope: !286)
!293 = !DILocation(line: 89, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !286, file: !3, line: 89, column: 3)
!295 = !DILocation(line: 89, column: 7, scope: !294)
!296 = !DILocation(line: 89, column: 12, scope: !297)
!297 = distinct !DILexicalBlock(scope: !294, file: !3, line: 89, column: 3)
!298 = !DILocation(line: 89, column: 14, scope: !297)
!299 = !DILocation(line: 89, column: 3, scope: !294)
!300 = !DILocation(line: 89, column: 65, scope: !297)
!301 = !DILocation(line: 89, column: 52, scope: !297)
!302 = !DILocation(line: 89, column: 32, scope: !297)
!303 = !DILocation(line: 89, column: 28, scope: !297)
!304 = !DILocation(line: 89, column: 3, scope: !297)
!305 = distinct !{!305, !299, !306}
!306 = !DILocation(line: 89, column: 73, scope: !294)
!307 = !DILocation(line: 91, column: 8, scope: !308)
!308 = distinct !DILexicalBlock(scope: !286, file: !3, line: 91, column: 3)
!309 = !DILocation(line: 91, column: 7, scope: !308)
!310 = !DILocation(line: 91, column: 12, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !3, line: 91, column: 3)
!312 = !DILocation(line: 91, column: 14, scope: !311)
!313 = !DILocation(line: 91, column: 3, scope: !308)
!314 = !DILocation(line: 92, column: 18, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !3, line: 91, column: 32)
!316 = !DILocation(line: 92, column: 25, scope: !315)
!317 = !DILocation(line: 92, column: 13, scope: !315)
!318 = !DILocation(line: 92, column: 5, scope: !315)
!319 = !DILocation(line: 92, column: 16, scope: !315)
!320 = !DILocation(line: 93, column: 22, scope: !315)
!321 = !DILocation(line: 93, column: 14, scope: !315)
!322 = !DILocation(line: 93, column: 11, scope: !315)
!323 = !DILocation(line: 94, column: 28, scope: !315)
!324 = !DILocation(line: 94, column: 20, scope: !315)
!325 = !DILocation(line: 94, column: 5, scope: !315)
!326 = !DILocation(line: 95, column: 3, scope: !315)
!327 = !DILocation(line: 91, column: 28, scope: !311)
!328 = !DILocation(line: 91, column: 3, scope: !311)
!329 = distinct !{!329, !313, !330}
!330 = !DILocation(line: 95, column: 3, scope: !308)
!331 = !DILocation(line: 96, column: 20, scope: !286)
!332 = !DILocation(line: 96, column: 3, scope: !286)
!333 = !DILocation(line: 99, column: 3, scope: !286)
!334 = !DILocation(line: 100, column: 3, scope: !286)
!335 = !DILocation(line: 102, column: 3, scope: !286)
!336 = !DILocation(line: 103, column: 5, scope: !337)
!337 = distinct !DILexicalBlock(scope: !338, file: !3, line: 102, column: 11)
!338 = distinct !DILexicalBlock(scope: !339, file: !3, line: 102, column: 3)
!339 = distinct !DILexicalBlock(scope: !286, file: !3, line: 102, column: 3)
!340 = !DILocation(line: 104, column: 5, scope: !337)
!341 = !DILocation(line: 102, column: 3, scope: !338)
!342 = distinct !{!342, !343, !344}
!343 = !DILocation(line: 102, column: 3, scope: !339)
!344 = !DILocation(line: 105, column: 3, scope: !339)
!345 = !{!346}
!346 = !{i64 2, i64 3, i1 false}
