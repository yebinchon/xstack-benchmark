; ModuleID = 'globally-replace-text-in-several-files.c'
source_filename = "globally-replace-text-in-several-files.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [16 x i8] c"Can't open '%s'\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Can't stat '%s'\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Can't alloc '%s'\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Bad read '%s'\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Goodbye, London!\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Hello, New York!\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"test1.txt\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"test2.txt\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"test3.txt\00", align 1
@__const.main.files = private unnamed_addr constant [3 x i8*] [i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0)], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @find_match(i8* %buf, i8* %buf_end, i8* %pat, i64 %len) #0 !dbg !10 {
entry:
  %retval = alloca i8*, align 8
  %buf.addr = alloca i8*, align 8
  %buf_end.addr = alloca i8*, align 8
  %pat.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %start = alloca i8*, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* %buf_end, i8** %buf_end.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf_end.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i8* %pat, i8** %pat.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pat.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i8** %start, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !32
  store i8* %0, i8** %start, align 8, !dbg !31
  br label %while.cond, !dbg !33

while.cond:                                       ; preds = %if.end9, %entry
  %1 = load i8*, i8** %start, align 8, !dbg !34
  %2 = load i64, i64* %len.addr, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !36
  %3 = load i8*, i8** %buf_end.addr, align 8, !dbg !37
  %cmp = icmp ult i8* %add.ptr, %3, !dbg !38
  br i1 %cmp, label %while.body, label %while.end, !dbg !33

while.body:                                       ; preds = %while.cond
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %while.body
  %4 = load i64, i64* %i, align 8, !dbg !43
  %5 = load i64, i64* %len.addr, align 8, !dbg !45
  %cmp1 = icmp ult i64 %4, %5, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %start, align 8, !dbg !48
  %7 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !48
  %8 = load i8, i8* %arrayidx, align 1, !dbg !48
  %conv = sext i8 %8 to i32, !dbg !48
  %9 = load i8*, i8** %pat.addr, align 8, !dbg !51
  %10 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !51
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !51
  %conv3 = sext i8 %11 to i32, !dbg !51
  %cmp4 = icmp ne i32 %conv, %conv3, !dbg !53
  br i1 %cmp4, label %if.then, label %if.end, !dbg !54, !cf.info !55

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !56

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %if.end
  %12 = load i64, i64* %i, align 8, !dbg !58
  %inc = add nsw i64 %12, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %if.then, %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !62
  %14 = load i64, i64* %len.addr, align 8, !dbg !64
  %cmp6 = icmp eq i64 %13, %14, !dbg !65
  br i1 %cmp6, label %if.then8, label %if.end9, !dbg !66, !cf.info !55

if.then8:                                         ; preds = %for.end
  %15 = load i8*, i8** %start, align 8, !dbg !67
  store i8* %15, i8** %retval, align 8, !dbg !68
  br label %return, !dbg !68

if.end9:                                          ; preds = %for.end
  %16 = load i8*, i8** %start, align 8, !dbg !69
  %incdec.ptr = getelementptr inbounds i8, i8* %16, i32 1, !dbg !69
  store i8* %incdec.ptr, i8** %start, align 8, !dbg !69
  br label %while.cond, !dbg !33, !llvm.loop !70

while.end:                                        ; preds = %while.cond
  store i8* null, i8** %retval, align 8, !dbg !72
  br label %return, !dbg !72

return:                                           ; preds = %while.end, %if.then8
  %17 = load i8*, i8** %retval, align 8, !dbg !73
  ret i8* %17, !dbg !73
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @replace(i8* %from, i8* %to, i8* %fname) #0 !dbg !74 {
entry:
  %from.addr = alloca i8*, align 8
  %to.addr = alloca i8*, align 8
  %fname.addr = alloca i8*, align 8
  %st = alloca %struct.stat, align 8
  %ret = alloca i32, align 4
  %buf = alloca i8*, align 8
  %start = alloca i8*, align 8
  %end = alloca i8*, align 8
  %len = alloca i64, align 8
  %nlen = alloca i64, align 8
  %fd = alloca i32, align 4
  store i8* %from, i8** %from.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %from.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* %to, i8** %to.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %to.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* %fname, i8** %fname.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fname.addr, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !84, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 0, i32* %ret, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* null, i8** %buf, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i8** %start, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i8** %end, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %len, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i8*, i8** %from.addr, align 8, !dbg !135
  %call = call i64 @strlen(i8* %0) #6, !dbg !136
  store i64 %call, i64* %len, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i64* %nlen, metadata !137, metadata !DIExpression()), !dbg !138
  %1 = load i8*, i8** %to.addr, align 8, !dbg !139
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !140
  store i64 %call1, i64* %nlen, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !141, metadata !DIExpression()), !dbg !142
  %2 = load i8*, i8** %fname.addr, align 8, !dbg !143
  %call2 = call i32 (i8*, i32, ...) @open(i8* %2, i32 2), !dbg !144
  store i32 %call2, i32* %fd, align 4, !dbg !142
  %3 = load i32, i32* %fd, align 4, !dbg !145
  %cmp = icmp eq i32 %3, -1, !dbg !147
  br i1 %cmp, label %if.then, label %if.end, !dbg !148, !cf.info !55

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %fname.addr, align 8, !dbg !149
  call void (i8*, ...) @warn(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i8* %4), !dbg !149
  br label %done, !dbg !149

if.end:                                           ; preds = %entry
  %5 = load i32, i32* %fd, align 4, !dbg !151
  %call3 = call i32 @fstat(i32 %5, %struct.stat* %st) #7, !dbg !153
  %cmp4 = icmp eq i32 %call3, -1, !dbg !154
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !155, !cf.info !55

if.then5:                                         ; preds = %if.end
  %6 = load i8*, i8** %fname.addr, align 8, !dbg !156
  call void (i8*, ...) @warn(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i8* %6), !dbg !156
  br label %done, !dbg !156

if.end6:                                          ; preds = %if.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !158
  %7 = load i64, i64* %st_size, align 8, !dbg !158
  %call7 = call noalias i8* @malloc(i64 %7) #7, !dbg !160
  store i8* %call7, i8** %buf, align 8, !dbg !161
  %tobool = icmp ne i8* %call7, null, !dbg !161
  br i1 %tobool, label %if.end9, label %if.then8, !dbg !162, !cf.info !55

if.then8:                                         ; preds = %if.end6
  %8 = load i8*, i8** %fname.addr, align 8, !dbg !163
  call void (i8*, ...) @warn(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* %8), !dbg !163
  br label %done, !dbg !163

if.end9:                                          ; preds = %if.end6
  %9 = load i32, i32* %fd, align 4, !dbg !165
  %10 = load i8*, i8** %buf, align 8, !dbg !167
  %st_size10 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !168
  %11 = load i64, i64* %st_size10, align 8, !dbg !168
  %call11 = call i64 @read(i32 %9, i8* %10, i64 %11), !dbg !169
  %st_size12 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !170
  %12 = load i64, i64* %st_size12, align 8, !dbg !170
  %cmp13 = icmp ne i64 %call11, %12, !dbg !171
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !172, !cf.info !55

if.then14:                                        ; preds = %if.end9
  %13 = load i8*, i8** %fname.addr, align 8, !dbg !173
  call void (i8*, ...) @warn(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* %13), !dbg !173
  br label %done, !dbg !173

if.end15:                                         ; preds = %if.end9
  %14 = load i8*, i8** %buf, align 8, !dbg !175
  store i8* %14, i8** %start, align 8, !dbg !176
  %15 = load i8*, i8** %start, align 8, !dbg !177
  %16 = load i8*, i8** %buf, align 8, !dbg !178
  %st_size16 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !179
  %17 = load i64, i64* %st_size16, align 8, !dbg !179
  %add.ptr = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !180
  %18 = load i8*, i8** %from.addr, align 8, !dbg !181
  %19 = load i64, i64* %len, align 8, !dbg !182
  %call17 = call i8* @find_match(i8* %15, i8* %add.ptr, i8* %18, i64 %19), !dbg !183
  store i8* %call17, i8** %end, align 8, !dbg !184
  %20 = load i8*, i8** %end, align 8, !dbg !185
  %tobool18 = icmp ne i8* %20, null, !dbg !185
  br i1 %tobool18, label %if.end20, label %if.then19, !dbg !187, !cf.info !55

if.then19:                                        ; preds = %if.end15
  br label %done, !dbg !188

if.end20:                                         ; preds = %if.end15
  %21 = load i32, i32* %fd, align 4, !dbg !189
  %call21 = call i32 @ftruncate(i32 %21, i64 0) #7, !dbg !190
  %22 = load i32, i32* %fd, align 4, !dbg !191
  %call22 = call i64 @lseek(i32 %22, i64 0, i32 0) #7, !dbg !192
  br label %do.body, !dbg !193

do.body:                                          ; preds = %do.cond, %if.end20
  %23 = load i32, i32* %fd, align 4, !dbg !194
  %24 = load i8*, i8** %start, align 8, !dbg !196
  %25 = load i8*, i8** %end, align 8, !dbg !197
  %26 = load i8*, i8** %start, align 8, !dbg !198
  %sub.ptr.lhs.cast = ptrtoint i8* %25 to i64, !dbg !199
  %sub.ptr.rhs.cast = ptrtoint i8* %26 to i64, !dbg !199
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !199
  %call23 = call i64 @write(i32 %23, i8* %24, i64 %sub.ptr.sub), !dbg !200
  %27 = load i32, i32* %fd, align 4, !dbg !201
  %28 = load i8*, i8** %to.addr, align 8, !dbg !202
  %29 = load i64, i64* %nlen, align 8, !dbg !203
  %call24 = call i64 @write(i32 %27, i8* %28, i64 %29), !dbg !204
  %30 = load i8*, i8** %end, align 8, !dbg !205
  %31 = load i64, i64* %len, align 8, !dbg !206
  %add.ptr25 = getelementptr inbounds i8, i8* %30, i64 %31, !dbg !207
  store i8* %add.ptr25, i8** %start, align 8, !dbg !208
  %32 = load i8*, i8** %start, align 8, !dbg !209
  %33 = load i8*, i8** %buf, align 8, !dbg !210
  %st_size26 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !211
  %34 = load i64, i64* %st_size26, align 8, !dbg !211
  %add.ptr27 = getelementptr inbounds i8, i8* %33, i64 %34, !dbg !212
  %35 = load i8*, i8** %from.addr, align 8, !dbg !213
  %36 = load i64, i64* %len, align 8, !dbg !214
  %call28 = call i8* @find_match(i8* %32, i8* %add.ptr27, i8* %35, i64 %36), !dbg !215
  store i8* %call28, i8** %end, align 8, !dbg !216
  br label %do.cond, !dbg !217

do.cond:                                          ; preds = %do.body
  %37 = load i8*, i8** %end, align 8, !dbg !218
  %tobool29 = icmp ne i8* %37, null, !dbg !217
  br i1 %tobool29, label %do.body, label %do.end, !dbg !217, !llvm.loop !219

do.end:                                           ; preds = %do.cond
  %38 = load i8*, i8** %start, align 8, !dbg !221
  %39 = load i8*, i8** %buf, align 8, !dbg !223
  %st_size30 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !224
  %40 = load i64, i64* %st_size30, align 8, !dbg !224
  %add.ptr31 = getelementptr inbounds i8, i8* %39, i64 %40, !dbg !225
  %cmp32 = icmp ult i8* %38, %add.ptr31, !dbg !226
  br i1 %cmp32, label %if.then33, label %if.end40, !dbg !227, !cf.info !55

if.then33:                                        ; preds = %do.end
  %41 = load i32, i32* %fd, align 4, !dbg !228
  %42 = load i8*, i8** %start, align 8, !dbg !229
  %43 = load i8*, i8** %buf, align 8, !dbg !230
  %st_size34 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !231
  %44 = load i64, i64* %st_size34, align 8, !dbg !231
  %add.ptr35 = getelementptr inbounds i8, i8* %43, i64 %44, !dbg !232
  %45 = load i8*, i8** %start, align 8, !dbg !233
  %sub.ptr.lhs.cast36 = ptrtoint i8* %add.ptr35 to i64, !dbg !234
  %sub.ptr.rhs.cast37 = ptrtoint i8* %45 to i64, !dbg !234
  %sub.ptr.sub38 = sub i64 %sub.ptr.lhs.cast36, %sub.ptr.rhs.cast37, !dbg !234
  %call39 = call i64 @write(i32 %41, i8* %42, i64 %sub.ptr.sub38), !dbg !235
  br label %if.end40, !dbg !235

if.end40:                                         ; preds = %if.then33, %do.end
  br label %done, !dbg !224

done:                                             ; preds = %if.end40, %if.then19, %if.then14, %if.then8, %if.then5, %if.then
  call void @llvm.dbg.label(metadata !236), !dbg !237
  %46 = load i32, i32* %fd, align 4, !dbg !238
  %cmp41 = icmp ne i32 %46, -1, !dbg !240
  br i1 %cmp41, label %if.then42, label %if.end44, !dbg !241, !cf.info !55

if.then42:                                        ; preds = %done
  %47 = load i32, i32* %fd, align 4, !dbg !242
  %call43 = call i32 @close(i32 %47), !dbg !243
  br label %if.end44, !dbg !243

if.end44:                                         ; preds = %if.then42, %done
  %48 = load i8*, i8** %buf, align 8, !dbg !244
  %tobool45 = icmp ne i8* %48, null, !dbg !244
  br i1 %tobool45, label %if.then46, label %if.end47, !dbg !246, !cf.info !55

if.then46:                                        ; preds = %if.end44
  %49 = load i8*, i8** %buf, align 8, !dbg !247
  call void @free(i8* %49) #7, !dbg !248
  br label %if.end47, !dbg !248

if.end47:                                         ; preds = %if.then46, %if.end44
  %50 = load i32, i32* %ret, align 4, !dbg !249
  ret i32 %50, !dbg !250
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

declare dso_local i32 @open(i8*, i32, ...) #3

declare dso_local void @warn(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

declare dso_local i64 @read(i32, i8*, i64) #3

; Function Attrs: nounwind
declare dso_local i32 @ftruncate(i32, i64) #4

; Function Attrs: nounwind
declare dso_local i64 @lseek(i32, i64, i32) #4

declare dso_local i64 @write(i32, i8*, i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @close(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !251 {
entry:
  %retval = alloca i32, align 4
  %from = alloca i8*, align 8
  %to = alloca i8*, align 8
  %files = alloca [3 x i8*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %from, metadata !254, metadata !DIExpression()), !dbg !255
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), i8** %from, align 8, !dbg !255
  call void @llvm.dbg.declare(metadata i8** %to, metadata !256, metadata !DIExpression()), !dbg !257
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0), i8** %to, align 8, !dbg !257
  call void @llvm.dbg.declare(metadata [3 x i8*]* %files, metadata !258, metadata !DIExpression()), !dbg !260
  %0 = bitcast [3 x i8*]* %files to i8*, !dbg !260
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8*]* @__const.main.files to i8*), i64 24, i1 false), !dbg !260
  call void @llvm.dbg.declare(metadata i32* %i, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !265

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !266
  %conv = sext i32 %1 to i64, !dbg !266
  %cmp = icmp ult i64 %conv, 3, !dbg !268
  br i1 %cmp, label %for.body, label %for.end, !dbg !269

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %from, align 8, !dbg !270
  %3 = load i8*, i8** %to, align 8, !dbg !271
  %4 = load i32, i32* %i, align 4, !dbg !272
  %idxprom = sext i32 %4 to i64, !dbg !273
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %files, i64 0, i64 %idxprom, !dbg !273
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !273
  %call = call i32 @replace(i8* %2, i8* %3, i8* %5), !dbg !274
  br label %for.inc, !dbg !274

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !275
  %inc = add nsw i32 %6, 1, !dbg !275
  store i32 %inc, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !276, !llvm.loop !277

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !279
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "globally-replace-text-in-several-files.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Globally-replace-text-in-several-files")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!10 = distinct !DISubprogram(name: "find_match", scope: !1, file: !1, line: 12, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!4, !13, !13, !13, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DILocalVariable(name: "buf", arg: 1, scope: !10, file: !1, line: 12, type: !13)
!19 = !DILocation(line: 12, column: 31, scope: !10)
!20 = !DILocalVariable(name: "buf_end", arg: 2, scope: !10, file: !1, line: 12, type: !13)
!21 = !DILocation(line: 12, column: 49, scope: !10)
!22 = !DILocalVariable(name: "pat", arg: 3, scope: !10, file: !1, line: 12, type: !13)
!23 = !DILocation(line: 12, column: 70, scope: !10)
!24 = !DILocalVariable(name: "len", arg: 4, scope: !10, file: !1, line: 12, type: !15)
!25 = !DILocation(line: 12, column: 82, scope: !10)
!26 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 14, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", file: !16, line: 35, baseType: !28)
!28 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!29 = !DILocation(line: 14, column: 12, scope: !10)
!30 = !DILocalVariable(name: "start", scope: !10, file: !1, line: 15, type: !4)
!31 = !DILocation(line: 15, column: 8, scope: !10)
!32 = !DILocation(line: 15, column: 16, scope: !10)
!33 = !DILocation(line: 16, column: 2, scope: !10)
!34 = !DILocation(line: 16, column: 9, scope: !10)
!35 = !DILocation(line: 16, column: 17, scope: !10)
!36 = !DILocation(line: 16, column: 15, scope: !10)
!37 = !DILocation(line: 16, column: 23, scope: !10)
!38 = !DILocation(line: 16, column: 21, scope: !10)
!39 = !DILocation(line: 17, column: 10, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 17, column: 3)
!41 = distinct !DILexicalBlock(scope: !10, file: !1, line: 16, column: 32)
!42 = !DILocation(line: 17, column: 8, scope: !40)
!43 = !DILocation(line: 17, column: 15, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 17, column: 3)
!45 = !DILocation(line: 17, column: 19, scope: !44)
!46 = !DILocation(line: 17, column: 17, scope: !44)
!47 = !DILocation(line: 17, column: 3, scope: !40)
!48 = !DILocation(line: 18, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 8)
!50 = !DILocation(line: 18, column: 14, scope: !49)
!51 = !DILocation(line: 18, column: 20, scope: !49)
!52 = !DILocation(line: 18, column: 24, scope: !49)
!53 = !DILocation(line: 18, column: 17, scope: !49)
!54 = !DILocation(line: 18, column: 8, scope: !44)
!55 = !{!"if"}
!56 = !DILocation(line: 18, column: 28, scope: !49)
!57 = !DILocation(line: 18, column: 25, scope: !49)
!58 = !DILocation(line: 17, column: 25, scope: !44)
!59 = !DILocation(line: 17, column: 3, scope: !44)
!60 = distinct !{!60, !47, !61}
!61 = !DILocation(line: 18, column: 28, scope: !40)
!62 = !DILocation(line: 20, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !41, file: !1, line: 20, column: 7)
!64 = !DILocation(line: 20, column: 12, scope: !63)
!65 = !DILocation(line: 20, column: 9, scope: !63)
!66 = !DILocation(line: 20, column: 7, scope: !41)
!67 = !DILocation(line: 20, column: 32, scope: !63)
!68 = !DILocation(line: 20, column: 17, scope: !63)
!69 = !DILocation(line: 21, column: 8, scope: !41)
!70 = distinct !{!70, !33, !71}
!71 = !DILocation(line: 22, column: 2, scope: !10)
!72 = !DILocation(line: 23, column: 2, scope: !10)
!73 = !DILocation(line: 24, column: 1, scope: !10)
!74 = distinct !DISubprogram(name: "replace", scope: !1, file: !1, line: 26, type: !75, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !13, !13, !13}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DILocalVariable(name: "from", arg: 1, scope: !74, file: !1, line: 26, type: !13)
!79 = !DILocation(line: 26, column: 25, scope: !74)
!80 = !DILocalVariable(name: "to", arg: 2, scope: !74, file: !1, line: 26, type: !13)
!81 = !DILocation(line: 26, column: 43, scope: !74)
!82 = !DILocalVariable(name: "fname", arg: 3, scope: !74, file: !1, line: 26, type: !13)
!83 = !DILocation(line: 26, column: 59, scope: !74)
!84 = !DILocalVariable(name: "st", scope: !74, file: !1, line: 29, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !86, line: 46, size: 1152, elements: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!87 = !{!88, !91, !93, !95, !98, !100, !102, !103, !104, !106, !108, !110, !118, !119, !120}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !85, file: !86, line: 48, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !90, line: 145, baseType: !17)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !85, file: !86, line: 53, baseType: !92, size: 64, offset: 64)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !90, line: 148, baseType: !17)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !85, file: !86, line: 61, baseType: !94, size: 64, offset: 128)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !90, line: 151, baseType: !17)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !85, file: !86, line: 62, baseType: !96, size: 32, offset: 192)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !90, line: 150, baseType: !97)
!97 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !85, file: !86, line: 64, baseType: !99, size: 32, offset: 224)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !90, line: 146, baseType: !97)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !85, file: !86, line: 65, baseType: !101, size: 32, offset: 256)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !90, line: 147, baseType: !97)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !85, file: !86, line: 67, baseType: !77, size: 32, offset: 288)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !85, file: !86, line: 69, baseType: !89, size: 64, offset: 320)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !85, file: !86, line: 74, baseType: !105, size: 64, offset: 384)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !90, line: 152, baseType: !28)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !85, file: !86, line: 78, baseType: !107, size: 64, offset: 448)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !90, line: 174, baseType: !28)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !85, file: !86, line: 80, baseType: !109, size: 64, offset: 512)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !90, line: 179, baseType: !28)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !85, file: !86, line: 91, baseType: !111, size: 128, offset: 576)
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !112, line: 10, size: 128, elements: !113)
!112 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!113 = !{!114, !116}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !111, file: !112, line: 12, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !90, line: 160, baseType: !28)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !111, file: !112, line: 16, baseType: !117, size: 64, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !90, line: 196, baseType: !28)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !85, file: !86, line: 92, baseType: !111, size: 128, offset: 704)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !85, file: !86, line: 93, baseType: !111, size: 128, offset: 832)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !85, file: !86, line: 106, baseType: !121, size: 192, offset: 960)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !117, size: 192, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 3)
!124 = !DILocation(line: 29, column: 14, scope: !74)
!125 = !DILocalVariable(name: "ret", scope: !74, file: !1, line: 30, type: !77)
!126 = !DILocation(line: 30, column: 6, scope: !74)
!127 = !DILocalVariable(name: "buf", scope: !74, file: !1, line: 31, type: !4)
!128 = !DILocation(line: 31, column: 8, scope: !74)
!129 = !DILocalVariable(name: "start", scope: !74, file: !1, line: 31, type: !4)
!130 = !DILocation(line: 31, column: 18, scope: !74)
!131 = !DILocalVariable(name: "end", scope: !74, file: !1, line: 31, type: !4)
!132 = !DILocation(line: 31, column: 26, scope: !74)
!133 = !DILocalVariable(name: "len", scope: !74, file: !1, line: 32, type: !15)
!134 = !DILocation(line: 32, column: 9, scope: !74)
!135 = !DILocation(line: 32, column: 22, scope: !74)
!136 = !DILocation(line: 32, column: 15, scope: !74)
!137 = !DILocalVariable(name: "nlen", scope: !74, file: !1, line: 32, type: !15)
!138 = !DILocation(line: 32, column: 29, scope: !74)
!139 = !DILocation(line: 32, column: 43, scope: !74)
!140 = !DILocation(line: 32, column: 36, scope: !74)
!141 = !DILocalVariable(name: "fd", scope: !74, file: !1, line: 33, type: !77)
!142 = !DILocation(line: 33, column: 6, scope: !74)
!143 = !DILocation(line: 33, column: 16, scope: !74)
!144 = !DILocation(line: 33, column: 11, scope: !74)
!145 = !DILocation(line: 35, column: 6, scope: !146)
!146 = distinct !DILexicalBlock(scope: !74, file: !1, line: 35, column: 6)
!147 = !DILocation(line: 35, column: 9, scope: !146)
!148 = !DILocation(line: 35, column: 6, scope: !74)
!149 = !DILocation(line: 35, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !1, line: 35, column: 16)
!151 = !DILocation(line: 36, column: 12, scope: !152)
!152 = distinct !DILexicalBlock(scope: !74, file: !1, line: 36, column: 6)
!153 = !DILocation(line: 36, column: 6, scope: !152)
!154 = !DILocation(line: 36, column: 21, scope: !152)
!155 = !DILocation(line: 36, column: 6, scope: !74)
!156 = !DILocation(line: 36, column: 28, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !1, line: 36, column: 28)
!158 = !DILocation(line: 37, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !74, file: !1, line: 37, column: 6)
!160 = !DILocation(line: 37, column: 14, scope: !159)
!161 = !DILocation(line: 37, column: 12, scope: !159)
!162 = !DILocation(line: 37, column: 6, scope: !74)
!163 = !DILocation(line: 37, column: 35, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !1, line: 37, column: 35)
!165 = !DILocation(line: 38, column: 11, scope: !166)
!166 = distinct !DILexicalBlock(scope: !74, file: !1, line: 38, column: 6)
!167 = !DILocation(line: 38, column: 15, scope: !166)
!168 = !DILocation(line: 38, column: 23, scope: !166)
!169 = !DILocation(line: 38, column: 6, scope: !166)
!170 = !DILocation(line: 38, column: 38, scope: !166)
!171 = !DILocation(line: 38, column: 32, scope: !166)
!172 = !DILocation(line: 38, column: 6, scope: !74)
!173 = !DILocation(line: 38, column: 47, scope: !174)
!174 = distinct !DILexicalBlock(scope: !166, file: !1, line: 38, column: 47)
!175 = !DILocation(line: 40, column: 10, scope: !74)
!176 = !DILocation(line: 40, column: 8, scope: !74)
!177 = !DILocation(line: 41, column: 19, scope: !74)
!178 = !DILocation(line: 41, column: 26, scope: !74)
!179 = !DILocation(line: 41, column: 35, scope: !74)
!180 = !DILocation(line: 41, column: 30, scope: !74)
!181 = !DILocation(line: 41, column: 44, scope: !74)
!182 = !DILocation(line: 41, column: 50, scope: !74)
!183 = !DILocation(line: 41, column: 8, scope: !74)
!184 = !DILocation(line: 41, column: 6, scope: !74)
!185 = !DILocation(line: 42, column: 7, scope: !186)
!186 = distinct !DILexicalBlock(scope: !74, file: !1, line: 42, column: 6)
!187 = !DILocation(line: 42, column: 6, scope: !74)
!188 = !DILocation(line: 42, column: 12, scope: !186)
!189 = !DILocation(line: 44, column: 12, scope: !74)
!190 = !DILocation(line: 44, column: 2, scope: !74)
!191 = !DILocation(line: 45, column: 8, scope: !74)
!192 = !DILocation(line: 45, column: 2, scope: !74)
!193 = !DILocation(line: 46, column: 2, scope: !74)
!194 = !DILocation(line: 47, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !74, file: !1, line: 46, column: 5)
!196 = !DILocation(line: 47, column: 13, scope: !195)
!197 = !DILocation(line: 47, column: 20, scope: !195)
!198 = !DILocation(line: 47, column: 26, scope: !195)
!199 = !DILocation(line: 47, column: 24, scope: !195)
!200 = !DILocation(line: 47, column: 3, scope: !195)
!201 = !DILocation(line: 48, column: 9, scope: !195)
!202 = !DILocation(line: 48, column: 13, scope: !195)
!203 = !DILocation(line: 48, column: 17, scope: !195)
!204 = !DILocation(line: 48, column: 3, scope: !195)
!205 = !DILocation(line: 49, column: 11, scope: !195)
!206 = !DILocation(line: 49, column: 17, scope: !195)
!207 = !DILocation(line: 49, column: 15, scope: !195)
!208 = !DILocation(line: 49, column: 9, scope: !195)
!209 = !DILocation(line: 51, column: 20, scope: !195)
!210 = !DILocation(line: 51, column: 27, scope: !195)
!211 = !DILocation(line: 51, column: 36, scope: !195)
!212 = !DILocation(line: 51, column: 31, scope: !195)
!213 = !DILocation(line: 51, column: 45, scope: !195)
!214 = !DILocation(line: 51, column: 51, scope: !195)
!215 = !DILocation(line: 51, column: 9, scope: !195)
!216 = !DILocation(line: 51, column: 7, scope: !195)
!217 = !DILocation(line: 52, column: 2, scope: !195)
!218 = !DILocation(line: 52, column: 11, scope: !74)
!219 = distinct !{!219, !193, !220}
!220 = !DILocation(line: 52, column: 14, scope: !74)
!221 = !DILocation(line: 55, column: 6, scope: !222)
!222 = distinct !DILexicalBlock(scope: !74, file: !1, line: 55, column: 6)
!223 = !DILocation(line: 55, column: 14, scope: !222)
!224 = !DILocation(line: 55, column: 23, scope: !222)
!225 = !DILocation(line: 55, column: 18, scope: !222)
!226 = !DILocation(line: 55, column: 12, scope: !222)
!227 = !DILocation(line: 55, column: 6, scope: !74)
!228 = !DILocation(line: 56, column: 9, scope: !222)
!229 = !DILocation(line: 56, column: 13, scope: !222)
!230 = !DILocation(line: 56, column: 20, scope: !222)
!231 = !DILocation(line: 56, column: 29, scope: !222)
!232 = !DILocation(line: 56, column: 24, scope: !222)
!233 = !DILocation(line: 56, column: 39, scope: !222)
!234 = !DILocation(line: 56, column: 37, scope: !222)
!235 = !DILocation(line: 56, column: 3, scope: !222)
!236 = !DILabel(scope: !74, name: "done", file: !1, line: 58)
!237 = !DILocation(line: 58, column: 1, scope: !74)
!238 = !DILocation(line: 59, column: 6, scope: !239)
!239 = distinct !DILexicalBlock(scope: !74, file: !1, line: 59, column: 6)
!240 = !DILocation(line: 59, column: 9, scope: !239)
!241 = !DILocation(line: 59, column: 6, scope: !74)
!242 = !DILocation(line: 59, column: 22, scope: !239)
!243 = !DILocation(line: 59, column: 16, scope: !239)
!244 = !DILocation(line: 60, column: 6, scope: !245)
!245 = distinct !DILexicalBlock(scope: !74, file: !1, line: 60, column: 6)
!246 = !DILocation(line: 60, column: 6, scope: !74)
!247 = !DILocation(line: 60, column: 16, scope: !245)
!248 = !DILocation(line: 60, column: 11, scope: !245)
!249 = !DILocation(line: 61, column: 9, scope: !74)
!250 = !DILocation(line: 61, column: 2, scope: !74)
!251 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 64, type: !252, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!252 = !DISubroutineType(types: !253)
!253 = !{!77}
!254 = !DILocalVariable(name: "from", scope: !251, file: !1, line: 66, type: !13)
!255 = !DILocation(line: 66, column: 14, scope: !251)
!256 = !DILocalVariable(name: "to", scope: !251, file: !1, line: 67, type: !13)
!257 = !DILocation(line: 67, column: 14, scope: !251)
!258 = !DILocalVariable(name: "files", scope: !251, file: !1, line: 68, type: !259)
!259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !122)
!260 = !DILocation(line: 68, column: 15, scope: !251)
!261 = !DILocalVariable(name: "i", scope: !251, file: !1, line: 69, type: !77)
!262 = !DILocation(line: 69, column: 6, scope: !251)
!263 = !DILocation(line: 71, column: 9, scope: !264)
!264 = distinct !DILexicalBlock(scope: !251, file: !1, line: 71, column: 2)
!265 = !DILocation(line: 71, column: 7, scope: !264)
!266 = !DILocation(line: 71, column: 14, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !1, line: 71, column: 2)
!268 = !DILocation(line: 71, column: 16, scope: !267)
!269 = !DILocation(line: 71, column: 2, scope: !264)
!270 = !DILocation(line: 72, column: 11, scope: !267)
!271 = !DILocation(line: 72, column: 17, scope: !267)
!272 = !DILocation(line: 72, column: 27, scope: !267)
!273 = !DILocation(line: 72, column: 21, scope: !267)
!274 = !DILocation(line: 72, column: 3, scope: !267)
!275 = !DILocation(line: 71, column: 48, scope: !267)
!276 = !DILocation(line: 71, column: 2, scope: !267)
!277 = distinct !{!277, !269, !278}
!278 = !DILocation(line: 72, column: 29, scope: !264)
!279 = !DILocation(line: 74, column: 2, scope: !251)
