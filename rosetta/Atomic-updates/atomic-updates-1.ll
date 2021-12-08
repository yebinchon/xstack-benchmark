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
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !73

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %howmuch.addr, align 4, !dbg !74
  %cmp1 = icmp slt i32 %2, 0, !dbg !75
  br i1 %cmp1, label %if.then, label %lor.lhs.false2, !dbg !76

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* %from.addr, align 4, !dbg !77
  %cmp3 = icmp slt i32 %3, 0, !dbg !78
  br i1 %cmp3, label %if.then, label %lor.lhs.false4, !dbg !79

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %4 = load i32, i32* %to.addr, align 4, !dbg !80
  %cmp5 = icmp slt i32 %4, 0, !dbg !81
  br i1 %cmp5, label %if.then, label %lor.lhs.false6, !dbg !82

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %5 = load i32, i32* %from.addr, align 4, !dbg !83
  %cmp7 = icmp sge i32 %5, 15, !dbg !84
  br i1 %cmp7, label %if.then, label %lor.lhs.false8, !dbg !85

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %6 = load i32, i32* %to.addr, align 4, !dbg !86
  %cmp9 = icmp sge i32 %6, 15, !dbg !87
  br i1 %cmp9, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return, !dbg !89

if.end:                                           ; preds = %lor.lhs.false8
  %7 = load i32, i32* %from.addr, align 4, !dbg !90
  %8 = load i32, i32* %to.addr, align 4, !dbg !92
  %cmp10 = icmp sgt i32 %7, %8, !dbg !93
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !94

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %temp1, metadata !95, metadata !DIExpression()), !dbg !97
  %9 = load i32, i32* %from.addr, align 4, !dbg !98
  store i32 %9, i32* %temp1, align 4, !dbg !97
  %10 = load i32, i32* %to.addr, align 4, !dbg !99
  store i32 %10, i32* %from.addr, align 4, !dbg !100
  %11 = load i32, i32* %temp1, align 4, !dbg !101
  store i32 %11, i32* %to.addr, align 4, !dbg !102
  store i8 1, i8* %swapped, align 1, !dbg !103
  %12 = load i32, i32* %howmuch.addr, align 4, !dbg !104
  %sub = sub nsw i32 0, %12, !dbg !105
  store i32 %sub, i32* %howmuch.addr, align 4, !dbg !106
  br label %if.end12, !dbg !107

if.end12:                                         ; preds = %if.then11, %if.end
  %13 = load i32, i32* %from.addr, align 4, !dbg !108
  %idxprom = sext i32 %13 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !109
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !110
  %14 = load i32, i32* %to.addr, align 4, !dbg !111
  %idxprom13 = sext i32 %14 to i64, !dbg !112
  %arrayidx14 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom13, !dbg !112
  %call15 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx14) #4, !dbg !113
  %15 = load i32, i32* %howmuch.addr, align 4, !dbg !114
  %16 = load i32, i32* %from.addr, align 4, !dbg !116
  %idxprom16 = sext i32 %16 to i64, !dbg !117
  %arrayidx17 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom16, !dbg !117
  %17 = load i32, i32* %arrayidx17, align 4, !dbg !117
  %cmp18 = icmp sgt i32 %15, %17, !dbg !118
  br i1 %cmp18, label %land.lhs.true, label %if.end22, !dbg !119

land.lhs.true:                                    ; preds = %if.end12
  %18 = load i8, i8* %swapped, align 1, !dbg !120
  %tobool = trunc i8 %18 to i1, !dbg !120
  br i1 %tobool, label %if.end22, label %if.then19, !dbg !121

if.then19:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %from.addr, align 4, !dbg !122
  %idxprom20 = sext i32 %19 to i64, !dbg !123
  %arrayidx21 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom20, !dbg !123
  %20 = load i32, i32* %arrayidx21, align 4, !dbg !123
  store i32 %20, i32* %howmuch.addr, align 4, !dbg !124
  br label %if.end22, !dbg !125

if.end22:                                         ; preds = %if.then19, %land.lhs.true, %if.end12
  %21 = load i32, i32* %howmuch.addr, align 4, !dbg !126
  %sub23 = sub nsw i32 0, %21, !dbg !128
  %22 = load i32, i32* %to.addr, align 4, !dbg !129
  %idxprom24 = sext i32 %22 to i64, !dbg !130
  %arrayidx25 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom24, !dbg !130
  %23 = load i32, i32* %arrayidx25, align 4, !dbg !130
  %cmp26 = icmp sgt i32 %sub23, %23, !dbg !131
  br i1 %cmp26, label %land.lhs.true27, label %if.end33, !dbg !132

land.lhs.true27:                                  ; preds = %if.end22
  %24 = load i8, i8* %swapped, align 1, !dbg !133
  %tobool28 = trunc i8 %24 to i1, !dbg !133
  br i1 %tobool28, label %if.then29, label %if.end33, !dbg !134

if.then29:                                        ; preds = %land.lhs.true27
  %25 = load i32, i32* %to.addr, align 4, !dbg !135
  %idxprom30 = sext i32 %25 to i64, !dbg !136
  %arrayidx31 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom30, !dbg !136
  %26 = load i32, i32* %arrayidx31, align 4, !dbg !136
  %sub32 = sub nsw i32 0, %26, !dbg !137
  store i32 %sub32, i32* %howmuch.addr, align 4, !dbg !138
  br label %if.end33, !dbg !139

if.end33:                                         ; preds = %if.then29, %land.lhs.true27, %if.end22
  %27 = load i32, i32* %howmuch.addr, align 4, !dbg !140
  %28 = load i32, i32* %from.addr, align 4, !dbg !141
  %idxprom34 = sext i32 %28 to i64, !dbg !142
  %arrayidx35 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom34, !dbg !142
  %29 = load i32, i32* %arrayidx35, align 4, !dbg !143
  %sub36 = sub nsw i32 %29, %27, !dbg !143
  store i32 %sub36, i32* %arrayidx35, align 4, !dbg !143
  %30 = load i32, i32* %howmuch.addr, align 4, !dbg !144
  %31 = load i32, i32* %to.addr, align 4, !dbg !145
  %idxprom37 = sext i32 %31 to i64, !dbg !146
  %arrayidx38 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom37, !dbg !146
  %32 = load i32, i32* %arrayidx38, align 4, !dbg !147
  %add = add nsw i32 %32, %30, !dbg !147
  store i32 %add, i32* %arrayidx38, align 4, !dbg !147
  %33 = load i32, i32* %from.addr, align 4, !dbg !148
  %idxprom39 = sext i32 %33 to i64, !dbg !149
  %arrayidx40 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom39, !dbg !149
  %call41 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx40) #4, !dbg !150
  %34 = load i32, i32* %to.addr, align 4, !dbg !151
  %idxprom42 = sext i32 %34 to i64, !dbg !152
  %arrayidx43 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom42, !dbg !152
  %call44 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx43) #4, !dbg !153
  br label %return, !dbg !154

return:                                           ; preds = %if.end33, %if.then
  ret void, !dbg !154
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_buckets() #0 !dbg !155 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !160, metadata !DIExpression()), !dbg !161
  store i32 0, i32* %sum, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !165
  %cmp = icmp slt i32 %0, 15, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !169
  %idxprom = sext i32 %1 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !170
  %call = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %arrayidx) #4, !dbg !171
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %2, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond1, !dbg !178

for.cond1:                                        ; preds = %for.inc9, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !179
  %cmp2 = icmp slt i32 %3, 15, !dbg !181
  br i1 %cmp2, label %for.body3, label %for.end11, !dbg !182

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !183
  %idxprom4 = sext i32 %4 to i64, !dbg !185
  %arrayidx5 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom4, !dbg !185
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !185
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %5), !dbg !186
  %6 = load i32, i32* %i, align 4, !dbg !187
  %idxprom7 = sext i32 %6 to i64, !dbg !188
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !188
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !188
  %8 = load i32, i32* %sum, align 4, !dbg !189
  %add = add nsw i32 %8, %7, !dbg !189
  store i32 %add, i32* %sum, align 4, !dbg !189
  br label %for.inc9, !dbg !190

for.inc9:                                         ; preds = %for.body3
  %9 = load i32, i32* %i, align 4, !dbg !191
  %inc10 = add nsw i32 %9, 1, !dbg !191
  store i32 %inc10, i32* %i, align 4, !dbg !191
  br label %for.cond1, !dbg !192, !llvm.loop !193

for.end11:                                        ; preds = %for.cond1
  %10 = load i32, i32* %sum, align 4, !dbg !195
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %10), !dbg !196
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond13, !dbg !199

for.cond13:                                       ; preds = %for.inc19, %for.end11
  %11 = load i32, i32* %i, align 4, !dbg !200
  %cmp14 = icmp slt i32 %11, 15, !dbg !202
  br i1 %cmp14, label %for.body15, label %for.end21, !dbg !203

for.body15:                                       ; preds = %for.cond13
  %12 = load i32, i32* %i, align 4, !dbg !204
  %idxprom16 = sext i32 %12 to i64, !dbg !205
  %arrayidx17 = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom16, !dbg !205
  %call18 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %arrayidx17) #4, !dbg !206
  br label %for.inc19, !dbg !206

for.inc19:                                        ; preds = %for.body15
  %13 = load i32, i32* %i, align 4, !dbg !207
  %inc20 = add nsw i32 %13, 1, !dbg !207
  store i32 %inc20, i32* %i, align 4, !dbg !207
  br label %for.cond13, !dbg !208, !llvm.loop !209

for.end21:                                        ; preds = %for.cond13
  ret void, !dbg !211
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @equalizer_start(i8* %t) #0 !dbg !212 {
entry:
  %t.addr = alloca i8*, align 8
  %b1 = alloca i32, align 4
  %b2 = alloca i32, align 4
  %diff = alloca i32, align 4
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !215, metadata !DIExpression()), !dbg !216
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i32* %b1, metadata !218, metadata !DIExpression()), !dbg !222
  %call = call i32 @rand() #4, !dbg !223
  %rem = srem i32 %call, 15, !dbg !224
  store i32 %rem, i32* %b1, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata i32* %b2, metadata !225, metadata !DIExpression()), !dbg !226
  %call1 = call i32 @rand() #4, !dbg !227
  %rem2 = srem i32 %call1, 15, !dbg !228
  store i32 %rem2, i32* %b2, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i32, i32* %b1, align 4, !dbg !231
  %idxprom = sext i32 %0 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !232
  %1 = load i32, i32* %arrayidx, align 4, !dbg !232
  %2 = load i32, i32* %b2, align 4, !dbg !233
  %idxprom3 = sext i32 %2 to i64, !dbg !234
  %arrayidx4 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom3, !dbg !234
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !234
  %sub = sub nsw i32 %1, %3, !dbg !235
  store i32 %sub, i32* %diff, align 4, !dbg !230
  %4 = load i32, i32* %diff, align 4, !dbg !236
  %cmp = icmp slt i32 %4, 0, !dbg !238
  br i1 %cmp, label %if.then, label %if.else, !dbg !239

if.then:                                          ; preds = %for.cond
  %5 = load i32, i32* %b2, align 4, !dbg !240
  %6 = load i32, i32* %b1, align 4, !dbg !241
  %7 = load i32, i32* %diff, align 4, !dbg !242
  %sub5 = sub nsw i32 0, %7, !dbg !243
  %div = sdiv i32 %sub5, 2, !dbg !244
  call void @transfer_value(i32 %5, i32 %6, i32 %div), !dbg !245
  br label %if.end, !dbg !245

if.else:                                          ; preds = %for.cond
  %8 = load i32, i32* %b1, align 4, !dbg !246
  %9 = load i32, i32* %b2, align 4, !dbg !247
  %10 = load i32, i32* %diff, align 4, !dbg !248
  %div6 = sdiv i32 %10, 2, !dbg !249
  call void @transfer_value(i32 %8, i32 %9, i32 %div6), !dbg !250
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond, !dbg !251, !llvm.loop !252
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @randomizer_start(i8* %t) #0 !dbg !255 {
entry:
  %t.addr = alloca i8*, align 8
  %b1 = alloca i32, align 4
  %b2 = alloca i32, align 4
  %diff = alloca i32, align 4
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !256, metadata !DIExpression()), !dbg !257
  br label %for.cond, !dbg !258

for.cond:                                         ; preds = %for.cond, %entry
  call void @llvm.dbg.declare(metadata i32* %b1, metadata !259, metadata !DIExpression()), !dbg !263
  %call = call i32 @rand() #4, !dbg !264
  %rem = srem i32 %call, 15, !dbg !265
  store i32 %rem, i32* %b1, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %b2, metadata !266, metadata !DIExpression()), !dbg !267
  %call1 = call i32 @rand() #4, !dbg !268
  %rem2 = srem i32 %call1, 15, !dbg !269
  store i32 %rem2, i32* %b2, align 4, !dbg !267
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !270, metadata !DIExpression()), !dbg !271
  %call3 = call i32 @rand() #4, !dbg !272
  %0 = load i32, i32* %b1, align 4, !dbg !273
  %idxprom = sext i32 %0 to i64, !dbg !274
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom, !dbg !274
  %1 = load i32, i32* %arrayidx, align 4, !dbg !274
  %add = add nsw i32 %1, 1, !dbg !275
  %rem4 = srem i32 %call3, %add, !dbg !276
  store i32 %rem4, i32* %diff, align 4, !dbg !271
  %2 = load i32, i32* %b1, align 4, !dbg !277
  %3 = load i32, i32* %b2, align 4, !dbg !278
  %4 = load i32, i32* %diff, align 4, !dbg !279
  call void @transfer_value(i32 %2, i32 %3, i32 %4), !dbg !280
  br label %for.cond, !dbg !281, !llvm.loop !282
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !285 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %total = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32* %total, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 0, i32* %total, align 4, !dbg !291
  store i32 0, i32* %i, align 4, !dbg !292
  br label %for.cond, !dbg !294

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !295
  %cmp = icmp slt i32 %0, 15, !dbg !297
  br i1 %cmp, label %for.body, label %for.end, !dbg !298

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !299
  %idxprom = sext i32 %1 to i64, !dbg !300
  %arrayidx = getelementptr inbounds [15 x %union.pthread_mutex_t], [15 x %union.pthread_mutex_t]* @bucket_mutex, i64 0, i64 %idxprom, !dbg !300
  %call = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %arrayidx, %union.pthread_mutexattr_t* null) #4, !dbg !301
  br label %for.inc, !dbg !301

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !302
  %inc = add nsw i32 %2, 1, !dbg !302
  store i32 %inc, i32* %i, align 4, !dbg !302
  br label %for.cond, !dbg !303, !llvm.loop !304

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !306
  br label %for.cond1, !dbg !308

for.cond1:                                        ; preds = %for.inc12, %for.end
  %3 = load i32, i32* %i, align 4, !dbg !309
  %cmp2 = icmp slt i32 %3, 15, !dbg !311
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !312

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @rand() #4, !dbg !313
  %rem = srem i32 %call4, 100, !dbg !315
  %4 = load i32, i32* %i, align 4, !dbg !316
  %idxprom5 = sext i32 %4 to i64, !dbg !317
  %arrayidx6 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom5, !dbg !317
  store i32 %rem, i32* %arrayidx6, align 4, !dbg !318
  %5 = load i32, i32* %i, align 4, !dbg !319
  %idxprom7 = sext i32 %5 to i64, !dbg !320
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom7, !dbg !320
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !320
  %7 = load i32, i32* %total, align 4, !dbg !321
  %add = add nsw i32 %7, %6, !dbg !321
  store i32 %add, i32* %total, align 4, !dbg !321
  %8 = load i32, i32* %i, align 4, !dbg !322
  %idxprom9 = sext i32 %8 to i64, !dbg !323
  %arrayidx10 = getelementptr inbounds [15 x i32], [15 x i32]* @buckets, i64 0, i64 %idxprom9, !dbg !323
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !323
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %9), !dbg !324
  br label %for.inc12, !dbg !325

for.inc12:                                        ; preds = %for.body3
  %10 = load i32, i32* %i, align 4, !dbg !326
  %inc13 = add nsw i32 %10, 1, !dbg !326
  store i32 %inc13, i32* %i, align 4, !dbg !326
  br label %for.cond1, !dbg !327, !llvm.loop !328

for.end14:                                        ; preds = %for.cond1
  %11 = load i32, i32* %total, align 4, !dbg !330
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 %11), !dbg !331
  %call16 = call i32 @pthread_create(i64* @equalizer, %union.pthread_attr_t* null, i8* (i8*)* @equalizer_start, i8* null) #4, !dbg !332
  %call17 = call i32 @pthread_create(i64* @randomizer, %union.pthread_attr_t* null, i8* (i8*)* @randomizer_start, i8* null) #4, !dbg !333
  br label %for.cond18, !dbg !334

for.cond18:                                       ; preds = %for.cond18, %for.end14
  %call19 = call i32 @sleep(i32 1), !dbg !335
  call void @print_buckets(), !dbg !339
  br label %for.cond18, !dbg !340, !llvm.loop !341
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #2

; Function Attrs: nounwind
declare !callback !344 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

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
!74 = !DILocation(line: 20, column: 26, scope: !70)
!75 = !DILocation(line: 20, column: 34, scope: !70)
!76 = !DILocation(line: 20, column: 40, scope: !70)
!77 = !DILocation(line: 21, column: 9, scope: !70)
!78 = !DILocation(line: 21, column: 14, scope: !70)
!79 = !DILocation(line: 21, column: 20, scope: !70)
!80 = !DILocation(line: 21, column: 24, scope: !70)
!81 = !DILocation(line: 21, column: 27, scope: !70)
!82 = !DILocation(line: 21, column: 32, scope: !70)
!83 = !DILocation(line: 21, column: 36, scope: !70)
!84 = !DILocation(line: 21, column: 41, scope: !70)
!85 = !DILocation(line: 21, column: 55, scope: !70)
!86 = !DILocation(line: 21, column: 59, scope: !70)
!87 = !DILocation(line: 21, column: 62, scope: !70)
!88 = !DILocation(line: 20, column: 8, scope: !57)
!89 = !DILocation(line: 21, column: 78, scope: !70)
!90 = !DILocation(line: 23, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !57, file: !3, line: 23, column: 8)
!92 = !DILocation(line: 23, column: 15, scope: !91)
!93 = !DILocation(line: 23, column: 13, scope: !91)
!94 = !DILocation(line: 23, column: 8, scope: !57)
!95 = !DILocalVariable(name: "temp1", scope: !96, file: !3, line: 24, type: !11)
!96 = distinct !DILexicalBlock(scope: !91, file: !3, line: 23, column: 20)
!97 = !DILocation(line: 24, column: 9, scope: !96)
!98 = !DILocation(line: 24, column: 17, scope: !96)
!99 = !DILocation(line: 25, column: 12, scope: !96)
!100 = !DILocation(line: 25, column: 10, scope: !96)
!101 = !DILocation(line: 26, column: 10, scope: !96)
!102 = !DILocation(line: 26, column: 8, scope: !96)
!103 = !DILocation(line: 27, column: 13, scope: !96)
!104 = !DILocation(line: 28, column: 16, scope: !96)
!105 = !DILocation(line: 28, column: 15, scope: !96)
!106 = !DILocation(line: 28, column: 13, scope: !96)
!107 = !DILocation(line: 29, column: 3, scope: !96)
!108 = !DILocation(line: 31, column: 36, scope: !57)
!109 = !DILocation(line: 31, column: 23, scope: !57)
!110 = !DILocation(line: 31, column: 3, scope: !57)
!111 = !DILocation(line: 32, column: 36, scope: !57)
!112 = !DILocation(line: 32, column: 23, scope: !57)
!113 = !DILocation(line: 32, column: 3, scope: !57)
!114 = !DILocation(line: 34, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !57, file: !3, line: 34, column: 8)
!116 = !DILocation(line: 34, column: 26, scope: !115)
!117 = !DILocation(line: 34, column: 18, scope: !115)
!118 = !DILocation(line: 34, column: 16, scope: !115)
!119 = !DILocation(line: 34, column: 32, scope: !115)
!120 = !DILocation(line: 34, column: 36, scope: !115)
!121 = !DILocation(line: 34, column: 8, scope: !57)
!122 = !DILocation(line: 35, column: 23, scope: !115)
!123 = !DILocation(line: 35, column: 15, scope: !115)
!124 = !DILocation(line: 35, column: 13, scope: !115)
!125 = !DILocation(line: 35, column: 5, scope: !115)
!126 = !DILocation(line: 36, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !57, file: !3, line: 36, column: 8)
!128 = !DILocation(line: 36, column: 8, scope: !127)
!129 = !DILocation(line: 36, column: 27, scope: !127)
!130 = !DILocation(line: 36, column: 19, scope: !127)
!131 = !DILocation(line: 36, column: 17, scope: !127)
!132 = !DILocation(line: 36, column: 31, scope: !127)
!133 = !DILocation(line: 36, column: 34, scope: !127)
!134 = !DILocation(line: 36, column: 8, scope: !57)
!135 = !DILocation(line: 37, column: 24, scope: !127)
!136 = !DILocation(line: 37, column: 16, scope: !127)
!137 = !DILocation(line: 37, column: 15, scope: !127)
!138 = !DILocation(line: 37, column: 13, scope: !127)
!139 = !DILocation(line: 37, column: 5, scope: !127)
!140 = !DILocation(line: 39, column: 20, scope: !57)
!141 = !DILocation(line: 39, column: 11, scope: !57)
!142 = !DILocation(line: 39, column: 3, scope: !57)
!143 = !DILocation(line: 39, column: 17, scope: !57)
!144 = !DILocation(line: 40, column: 18, scope: !57)
!145 = !DILocation(line: 40, column: 11, scope: !57)
!146 = !DILocation(line: 40, column: 3, scope: !57)
!147 = !DILocation(line: 40, column: 15, scope: !57)
!148 = !DILocation(line: 42, column: 38, scope: !57)
!149 = !DILocation(line: 42, column: 25, scope: !57)
!150 = !DILocation(line: 42, column: 3, scope: !57)
!151 = !DILocation(line: 43, column: 38, scope: !57)
!152 = !DILocation(line: 43, column: 25, scope: !57)
!153 = !DILocation(line: 43, column: 3, scope: !57)
!154 = !DILocation(line: 44, column: 1, scope: !57)
!155 = distinct !DISubprogram(name: "print_buckets", scope: !3, file: !3, line: 46, type: !156, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DISubroutineType(types: !157)
!157 = !{null}
!158 = !DILocalVariable(name: "i", scope: !155, file: !3, line: 48, type: !11)
!159 = !DILocation(line: 48, column: 7, scope: !155)
!160 = !DILocalVariable(name: "sum", scope: !155, file: !3, line: 49, type: !11)
!161 = !DILocation(line: 49, column: 7, scope: !155)
!162 = !DILocation(line: 51, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !3, line: 51, column: 3)
!164 = !DILocation(line: 51, column: 7, scope: !163)
!165 = !DILocation(line: 51, column: 12, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 51, column: 3)
!167 = !DILocation(line: 51, column: 14, scope: !166)
!168 = !DILocation(line: 51, column: 3, scope: !163)
!169 = !DILocation(line: 51, column: 65, scope: !166)
!170 = !DILocation(line: 51, column: 52, scope: !166)
!171 = !DILocation(line: 51, column: 32, scope: !166)
!172 = !DILocation(line: 51, column: 28, scope: !166)
!173 = !DILocation(line: 51, column: 3, scope: !166)
!174 = distinct !{!174, !168, !175}
!175 = !DILocation(line: 51, column: 67, scope: !163)
!176 = !DILocation(line: 52, column: 8, scope: !177)
!177 = distinct !DILexicalBlock(scope: !155, file: !3, line: 52, column: 3)
!178 = !DILocation(line: 52, column: 7, scope: !177)
!179 = !DILocation(line: 52, column: 12, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !3, line: 52, column: 3)
!181 = !DILocation(line: 52, column: 14, scope: !180)
!182 = !DILocation(line: 52, column: 3, scope: !177)
!183 = !DILocation(line: 53, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !3, line: 52, column: 32)
!185 = !DILocation(line: 53, column: 20, scope: !184)
!186 = !DILocation(line: 53, column: 5, scope: !184)
!187 = !DILocation(line: 54, column: 20, scope: !184)
!188 = !DILocation(line: 54, column: 12, scope: !184)
!189 = !DILocation(line: 54, column: 9, scope: !184)
!190 = !DILocation(line: 55, column: 3, scope: !184)
!191 = !DILocation(line: 52, column: 28, scope: !180)
!192 = !DILocation(line: 52, column: 3, scope: !180)
!193 = distinct !{!193, !182, !194}
!194 = !DILocation(line: 55, column: 3, scope: !177)
!195 = !DILocation(line: 56, column: 20, scope: !155)
!196 = !DILocation(line: 56, column: 3, scope: !155)
!197 = !DILocation(line: 57, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !155, file: !3, line: 57, column: 3)
!199 = !DILocation(line: 57, column: 7, scope: !198)
!200 = !DILocation(line: 57, column: 12, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !3, line: 57, column: 3)
!202 = !DILocation(line: 57, column: 14, scope: !201)
!203 = !DILocation(line: 57, column: 3, scope: !198)
!204 = !DILocation(line: 57, column: 67, scope: !201)
!205 = !DILocation(line: 57, column: 54, scope: !201)
!206 = !DILocation(line: 57, column: 32, scope: !201)
!207 = !DILocation(line: 57, column: 28, scope: !201)
!208 = !DILocation(line: 57, column: 3, scope: !201)
!209 = distinct !{!209, !203, !210}
!210 = !DILocation(line: 57, column: 69, scope: !198)
!211 = !DILocation(line: 58, column: 1, scope: !155)
!212 = distinct !DISubprogram(name: "equalizer_start", scope: !3, file: !3, line: 60, type: !213, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!213 = !DISubroutineType(types: !214)
!214 = !{!6, !6}
!215 = !DILocalVariable(name: "t", arg: 1, scope: !212, file: !3, line: 60, type: !6)
!216 = !DILocation(line: 60, column: 29, scope: !212)
!217 = !DILocation(line: 62, column: 3, scope: !212)
!218 = !DILocalVariable(name: "b1", scope: !219, file: !3, line: 63, type: !11)
!219 = distinct !DILexicalBlock(scope: !220, file: !3, line: 62, column: 11)
!220 = distinct !DILexicalBlock(scope: !221, file: !3, line: 62, column: 3)
!221 = distinct !DILexicalBlock(scope: !212, file: !3, line: 62, column: 3)
!222 = !DILocation(line: 63, column: 9, scope: !219)
!223 = !DILocation(line: 63, column: 14, scope: !219)
!224 = !DILocation(line: 63, column: 20, scope: !219)
!225 = !DILocalVariable(name: "b2", scope: !219, file: !3, line: 64, type: !11)
!226 = !DILocation(line: 64, column: 9, scope: !219)
!227 = !DILocation(line: 64, column: 14, scope: !219)
!228 = !DILocation(line: 64, column: 20, scope: !219)
!229 = !DILocalVariable(name: "diff", scope: !219, file: !3, line: 65, type: !11)
!230 = !DILocation(line: 65, column: 9, scope: !219)
!231 = !DILocation(line: 65, column: 24, scope: !219)
!232 = !DILocation(line: 65, column: 16, scope: !219)
!233 = !DILocation(line: 65, column: 38, scope: !219)
!234 = !DILocation(line: 65, column: 30, scope: !219)
!235 = !DILocation(line: 65, column: 28, scope: !219)
!236 = !DILocation(line: 66, column: 10, scope: !237)
!237 = distinct !DILexicalBlock(scope: !219, file: !3, line: 66, column: 10)
!238 = !DILocation(line: 66, column: 15, scope: !237)
!239 = !DILocation(line: 66, column: 10, scope: !219)
!240 = !DILocation(line: 67, column: 22, scope: !237)
!241 = !DILocation(line: 67, column: 26, scope: !237)
!242 = !DILocation(line: 67, column: 31, scope: !237)
!243 = !DILocation(line: 67, column: 30, scope: !237)
!244 = !DILocation(line: 67, column: 35, scope: !237)
!245 = !DILocation(line: 67, column: 7, scope: !237)
!246 = !DILocation(line: 69, column: 22, scope: !237)
!247 = !DILocation(line: 69, column: 26, scope: !237)
!248 = !DILocation(line: 69, column: 30, scope: !237)
!249 = !DILocation(line: 69, column: 34, scope: !237)
!250 = !DILocation(line: 69, column: 7, scope: !237)
!251 = !DILocation(line: 62, column: 3, scope: !220)
!252 = distinct !{!252, !253, !254}
!253 = !DILocation(line: 62, column: 3, scope: !221)
!254 = !DILocation(line: 70, column: 3, scope: !221)
!255 = distinct !DISubprogram(name: "randomizer_start", scope: !3, file: !3, line: 74, type: !213, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!256 = !DILocalVariable(name: "t", arg: 1, scope: !255, file: !3, line: 74, type: !6)
!257 = !DILocation(line: 74, column: 30, scope: !255)
!258 = !DILocation(line: 76, column: 3, scope: !255)
!259 = !DILocalVariable(name: "b1", scope: !260, file: !3, line: 77, type: !11)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 76, column: 11)
!261 = distinct !DILexicalBlock(scope: !262, file: !3, line: 76, column: 3)
!262 = distinct !DILexicalBlock(scope: !255, file: !3, line: 76, column: 3)
!263 = !DILocation(line: 77, column: 9, scope: !260)
!264 = !DILocation(line: 77, column: 14, scope: !260)
!265 = !DILocation(line: 77, column: 20, scope: !260)
!266 = !DILocalVariable(name: "b2", scope: !260, file: !3, line: 78, type: !11)
!267 = !DILocation(line: 78, column: 9, scope: !260)
!268 = !DILocation(line: 78, column: 14, scope: !260)
!269 = !DILocation(line: 78, column: 20, scope: !260)
!270 = !DILocalVariable(name: "diff", scope: !260, file: !3, line: 79, type: !11)
!271 = !DILocation(line: 79, column: 9, scope: !260)
!272 = !DILocation(line: 79, column: 16, scope: !260)
!273 = !DILocation(line: 79, column: 32, scope: !260)
!274 = !DILocation(line: 79, column: 24, scope: !260)
!275 = !DILocation(line: 79, column: 35, scope: !260)
!276 = !DILocation(line: 79, column: 22, scope: !260)
!277 = !DILocation(line: 80, column: 20, scope: !260)
!278 = !DILocation(line: 80, column: 24, scope: !260)
!279 = !DILocation(line: 80, column: 28, scope: !260)
!280 = !DILocation(line: 80, column: 5, scope: !260)
!281 = !DILocation(line: 76, column: 3, scope: !261)
!282 = distinct !{!282, !283, !284}
!283 = !DILocation(line: 76, column: 3, scope: !262)
!284 = !DILocation(line: 81, column: 3, scope: !262)
!285 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 85, type: !286, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!286 = !DISubroutineType(types: !287)
!287 = !{!11}
!288 = !DILocalVariable(name: "i", scope: !285, file: !3, line: 87, type: !11)
!289 = !DILocation(line: 87, column: 7, scope: !285)
!290 = !DILocalVariable(name: "total", scope: !285, file: !3, line: 87, type: !11)
!291 = !DILocation(line: 87, column: 10, scope: !285)
!292 = !DILocation(line: 89, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !285, file: !3, line: 89, column: 3)
!294 = !DILocation(line: 89, column: 7, scope: !293)
!295 = !DILocation(line: 89, column: 12, scope: !296)
!296 = distinct !DILexicalBlock(scope: !293, file: !3, line: 89, column: 3)
!297 = !DILocation(line: 89, column: 14, scope: !296)
!298 = !DILocation(line: 89, column: 3, scope: !293)
!299 = !DILocation(line: 89, column: 65, scope: !296)
!300 = !DILocation(line: 89, column: 52, scope: !296)
!301 = !DILocation(line: 89, column: 32, scope: !296)
!302 = !DILocation(line: 89, column: 28, scope: !296)
!303 = !DILocation(line: 89, column: 3, scope: !296)
!304 = distinct !{!304, !298, !305}
!305 = !DILocation(line: 89, column: 73, scope: !293)
!306 = !DILocation(line: 91, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !285, file: !3, line: 91, column: 3)
!308 = !DILocation(line: 91, column: 7, scope: !307)
!309 = !DILocation(line: 91, column: 12, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !3, line: 91, column: 3)
!311 = !DILocation(line: 91, column: 14, scope: !310)
!312 = !DILocation(line: 91, column: 3, scope: !307)
!313 = !DILocation(line: 92, column: 18, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !3, line: 91, column: 32)
!315 = !DILocation(line: 92, column: 25, scope: !314)
!316 = !DILocation(line: 92, column: 13, scope: !314)
!317 = !DILocation(line: 92, column: 5, scope: !314)
!318 = !DILocation(line: 92, column: 16, scope: !314)
!319 = !DILocation(line: 93, column: 22, scope: !314)
!320 = !DILocation(line: 93, column: 14, scope: !314)
!321 = !DILocation(line: 93, column: 11, scope: !314)
!322 = !DILocation(line: 94, column: 28, scope: !314)
!323 = !DILocation(line: 94, column: 20, scope: !314)
!324 = !DILocation(line: 94, column: 5, scope: !314)
!325 = !DILocation(line: 95, column: 3, scope: !314)
!326 = !DILocation(line: 91, column: 28, scope: !310)
!327 = !DILocation(line: 91, column: 3, scope: !310)
!328 = distinct !{!328, !312, !329}
!329 = !DILocation(line: 95, column: 3, scope: !307)
!330 = !DILocation(line: 96, column: 20, scope: !285)
!331 = !DILocation(line: 96, column: 3, scope: !285)
!332 = !DILocation(line: 99, column: 3, scope: !285)
!333 = !DILocation(line: 100, column: 3, scope: !285)
!334 = !DILocation(line: 102, column: 3, scope: !285)
!335 = !DILocation(line: 103, column: 5, scope: !336)
!336 = distinct !DILexicalBlock(scope: !337, file: !3, line: 102, column: 11)
!337 = distinct !DILexicalBlock(scope: !338, file: !3, line: 102, column: 3)
!338 = distinct !DILexicalBlock(scope: !285, file: !3, line: 102, column: 3)
!339 = !DILocation(line: 104, column: 5, scope: !336)
!340 = !DILocation(line: 102, column: 3, scope: !337)
!341 = distinct !{!341, !342, !343}
!342 = !DILocation(line: 102, column: 3, scope: !338)
!343 = !DILocation(line: 105, column: 3, scope: !338)
!344 = !{!345}
!345 = !{i64 2, i64 3, i1 false}
