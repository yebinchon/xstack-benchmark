; ModuleID = 'anagrams-2.c'
source_filename = "anagrams-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.kw_t = type { i8*, i8*, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [13 x i8] c"unixdict.txt\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lst_cmp(i8* %a, i8* %b) #0 !dbg !20 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !25, metadata !DIExpression()), !dbg !26
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %a.addr, align 8, !dbg !29
  %1 = bitcast i8* %0 to %struct.kw_t*, !dbg !30
  %key = getelementptr inbounds %struct.kw_t, %struct.kw_t* %1, i32 0, i32 0, !dbg !31
  %2 = load i8*, i8** %key, align 8, !dbg !31
  %3 = load i8*, i8** %b.addr, align 8, !dbg !32
  %4 = bitcast i8* %3 to %struct.kw_t*, !dbg !33
  %key1 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %4, i32 0, i32 0, !dbg !34
  %5 = load i8*, i8** %key1, align 8, !dbg !34
  %call = call i32 @strcmp(i8* %2, i8* %5) #6, !dbg !35
  ret i32 %call, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @sort_letters(i8* %s) #0 !dbg !37 {
entry:
  %s.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %t = alloca i8, align 1
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %j, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8* %t, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc25, %entry
  %0 = load i8*, i8** %s.addr, align 8, !dbg !52
  %1 = load i32, i32* %i, align 4, !dbg !54
  %idxprom = sext i32 %1 to i64, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !52
  %2 = load i8, i8* %arrayidx, align 1, !dbg !52
  %conv = sext i8 %2 to i32, !dbg !52
  %cmp = icmp ne i32 %conv, 0, !dbg !55
  br i1 %cmp, label %for.body, label %for.end27, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !57
  %add = add nsw i32 %3, 1, !dbg !60
  store i32 %add, i32* %j, align 4, !dbg !61
  br label %for.cond2, !dbg !62

for.cond2:                                        ; preds = %for.inc, %for.body
  %4 = load i8*, i8** %s.addr, align 8, !dbg !63
  %5 = load i32, i32* %j, align 4, !dbg !65
  %idxprom3 = sext i32 %5 to i64, !dbg !63
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %idxprom3, !dbg !63
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !63
  %conv5 = sext i8 %6 to i32, !dbg !63
  %cmp6 = icmp ne i32 %conv5, 0, !dbg !66
  br i1 %cmp6, label %for.body8, label %for.end, !dbg !67

for.body8:                                        ; preds = %for.cond2
  %7 = load i8*, i8** %s.addr, align 8, !dbg !68
  %8 = load i32, i32* %j, align 4, !dbg !70
  %idxprom9 = sext i32 %8 to i64, !dbg !68
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i64 %idxprom9, !dbg !68
  %9 = load i8, i8* %arrayidx10, align 1, !dbg !68
  %conv11 = sext i8 %9 to i32, !dbg !68
  %10 = load i8*, i8** %s.addr, align 8, !dbg !71
  %11 = load i32, i32* %i, align 4, !dbg !72
  %idxprom12 = sext i32 %11 to i64, !dbg !71
  %arrayidx13 = getelementptr inbounds i8, i8* %10, i64 %idxprom12, !dbg !71
  %12 = load i8, i8* %arrayidx13, align 1, !dbg !71
  %conv14 = sext i8 %12 to i32, !dbg !71
  %cmp15 = icmp slt i32 %conv11, %conv14, !dbg !73
  br i1 %cmp15, label %if.then, label %if.end, !dbg !74, !cf.info !75

if.then:                                          ; preds = %for.body8
  %13 = load i8*, i8** %s.addr, align 8, !dbg !76
  %14 = load i32, i32* %j, align 4, !dbg !78
  %idxprom17 = sext i32 %14 to i64, !dbg !76
  %arrayidx18 = getelementptr inbounds i8, i8* %13, i64 %idxprom17, !dbg !76
  %15 = load i8, i8* %arrayidx18, align 1, !dbg !76
  store i8 %15, i8* %t, align 1, !dbg !79
  %16 = load i8*, i8** %s.addr, align 8, !dbg !80
  %17 = load i32, i32* %i, align 4, !dbg !81
  %idxprom19 = sext i32 %17 to i64, !dbg !80
  %arrayidx20 = getelementptr inbounds i8, i8* %16, i64 %idxprom19, !dbg !80
  %18 = load i8, i8* %arrayidx20, align 1, !dbg !80
  %19 = load i8*, i8** %s.addr, align 8, !dbg !82
  %20 = load i32, i32* %j, align 4, !dbg !83
  %idxprom21 = sext i32 %20 to i64, !dbg !82
  %arrayidx22 = getelementptr inbounds i8, i8* %19, i64 %idxprom21, !dbg !82
  store i8 %18, i8* %arrayidx22, align 1, !dbg !84
  %21 = load i8, i8* %t, align 1, !dbg !85
  %22 = load i8*, i8** %s.addr, align 8, !dbg !86
  %23 = load i32, i32* %i, align 4, !dbg !87
  %idxprom23 = sext i32 %23 to i64, !dbg !86
  %arrayidx24 = getelementptr inbounds i8, i8* %22, i64 %idxprom23, !dbg !86
  store i8 %21, i8* %arrayidx24, align 1, !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %if.end
  %24 = load i32, i32* %j, align 4, !dbg !91
  %inc = add nsw i32 %24, 1, !dbg !91
  store i32 %inc, i32* %j, align 4, !dbg !91
  br label %for.cond2, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond2
  br label %for.inc25, !dbg !95

for.inc25:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !96
  %inc26 = add nsw i32 %25, 1, !dbg !96
  store i32 %inc26, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end27:                                        ; preds = %for.cond
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.stat, align 8
  %words = alloca i8*, align 8
  %keys = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  %longest = alloca i64, align 8
  %offset = alloca i64, align 8
  %n_word = alloca i32, align 4
  %list = alloca %struct.kw_t*, align 8
  %fd = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.stat* %s, metadata !104, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i8** %words, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i8** %keys, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %j, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %k, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %longest, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %offset, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %n_word, metadata !163, metadata !DIExpression()), !dbg !164
  store i32 0, i32* %n_word, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata %struct.kw_t** %list, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 0), !dbg !170
  store i32 %call, i32* %fd, align 4, !dbg !169
  %0 = load i32, i32* %fd, align 4, !dbg !171
  %cmp = icmp eq i32 %0, -1, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174, !cf.info !75

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !175
  br label %return, !dbg !175

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd, align 4, !dbg !176
  %call1 = call i32 @fstat(i32 %1, %struct.stat* %s) #7, !dbg !177
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !178
  %2 = load i64, i64* %st_size, align 8, !dbg !178
  %mul = mul nsw i64 %2, 2, !dbg !179
  %call2 = call noalias i8* @malloc(i64 %mul) #7, !dbg !180
  store i8* %call2, i8** %words, align 8, !dbg !181
  %3 = load i8*, i8** %words, align 8, !dbg !182
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !183
  %4 = load i64, i64* %st_size3, align 8, !dbg !183
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !184
  store i8* %add.ptr, i8** %keys, align 8, !dbg !185
  %5 = load i32, i32* %fd, align 4, !dbg !186
  %6 = load i8*, i8** %words, align 8, !dbg !187
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !188
  %7 = load i64, i64* %st_size4, align 8, !dbg !188
  %call5 = call i64 @read(i32 %5, i8* %6, i64 %7), !dbg !189
  %8 = load i8*, i8** %keys, align 8, !dbg !190
  %9 = load i8*, i8** %words, align 8, !dbg !191
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !192
  %10 = load i64, i64* %st_size6, align 8, !dbg !192
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 %10, i1 false), !dbg !193
  store i64 0, i64* %j, align 8, !dbg !194
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !198
  %st_size7 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !200
  %12 = load i64, i64* %st_size7, align 8, !dbg !200
  %cmp8 = icmp ult i64 %11, %12, !dbg !201
  br i1 %cmp8, label %for.body, label %for.end, !dbg !202

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %words, align 8, !dbg !203
  %14 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !203
  %15 = load i8, i8* %arrayidx, align 1, !dbg !203
  %conv = sext i8 %15 to i32, !dbg !203
  %cmp9 = icmp eq i32 %conv, 10, !dbg !207
  br i1 %cmp9, label %if.then11, label %if.end15, !dbg !208, !cf.info !75

if.then11:                                        ; preds = %for.body
  %16 = load i8*, i8** %keys, align 8, !dbg !209
  %17 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx12 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !209
  store i8 0, i8* %arrayidx12, align 1, !dbg !212
  %18 = load i8*, i8** %words, align 8, !dbg !213
  %19 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx13 = getelementptr inbounds i8, i8* %18, i64 %19, !dbg !213
  store i8 0, i8* %arrayidx13, align 1, !dbg !215
  %20 = load i8*, i8** %keys, align 8, !dbg !216
  %21 = load i64, i64* %j, align 8, !dbg !217
  %add.ptr14 = getelementptr inbounds i8, i8* %20, i64 %21, !dbg !218
  call void @sort_letters(i8* %add.ptr14), !dbg !219
  %22 = load i64, i64* %i, align 8, !dbg !220
  %add = add i64 %22, 1, !dbg !221
  store i64 %add, i64* %j, align 8, !dbg !222
  %23 = load i32, i32* %n_word, align 4, !dbg !223
  %inc = add nsw i32 %23, 1, !dbg !223
  store i32 %inc, i32* %n_word, align 4, !dbg !223
  br label %if.end15, !dbg !224

if.end15:                                         ; preds = %if.then11, %for.body
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %if.end15
  %24 = load i64, i64* %i, align 8, !dbg !226
  %inc16 = add i64 %24, 1, !dbg !226
  store i64 %inc16, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %25 = load i32, i32* %n_word, align 4, !dbg !230
  %conv17 = sext i32 %25 to i64, !dbg !230
  %call18 = call noalias i8* @calloc(i64 %conv17, i64 24) #7, !dbg !231
  %26 = bitcast i8* %call18 to %struct.kw_t*, !dbg !231
  store %struct.kw_t* %26, %struct.kw_t** %list, align 8, !dbg !232
  store i64 0, i64* %k, align 8, !dbg !233
  store i64 0, i64* %j, align 8, !dbg !235
  store i64 0, i64* %i, align 8, !dbg !236
  br label %for.cond19, !dbg !237

for.cond19:                                       ; preds = %for.inc36, %for.end
  %27 = load i64, i64* %i, align 8, !dbg !238
  %st_size20 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !240
  %28 = load i64, i64* %st_size20, align 8, !dbg !240
  %cmp21 = icmp ult i64 %27, %28, !dbg !241
  br i1 %cmp21, label %for.body23, label %for.end38, !dbg !242

for.body23:                                       ; preds = %for.cond19
  %29 = load i8*, i8** %words, align 8, !dbg !243
  %30 = load i64, i64* %i, align 8, !dbg !246
  %arrayidx24 = getelementptr inbounds i8, i8* %29, i64 %30, !dbg !243
  %31 = load i8, i8* %arrayidx24, align 1, !dbg !243
  %conv25 = sext i8 %31 to i32, !dbg !243
  %cmp26 = icmp eq i32 %conv25, 0, !dbg !247
  br i1 %cmp26, label %if.then28, label %if.end35, !dbg !248, !cf.info !75

if.then28:                                        ; preds = %for.body23
  %32 = load i8*, i8** %keys, align 8, !dbg !249
  %33 = load i64, i64* %k, align 8, !dbg !251
  %add.ptr29 = getelementptr inbounds i8, i8* %32, i64 %33, !dbg !252
  %34 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !253
  %35 = load i64, i64* %j, align 8, !dbg !254
  %arrayidx30 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %34, i64 %35, !dbg !253
  %key = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx30, i32 0, i32 0, !dbg !255
  store i8* %add.ptr29, i8** %key, align 8, !dbg !256
  %36 = load i8*, i8** %words, align 8, !dbg !257
  %37 = load i64, i64* %k, align 8, !dbg !258
  %add.ptr31 = getelementptr inbounds i8, i8* %36, i64 %37, !dbg !259
  %38 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !260
  %39 = load i64, i64* %j, align 8, !dbg !261
  %arrayidx32 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %38, i64 %39, !dbg !260
  %word = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx32, i32 0, i32 1, !dbg !262
  store i8* %add.ptr31, i8** %word, align 8, !dbg !263
  %40 = load i64, i64* %i, align 8, !dbg !264
  %add33 = add i64 %40, 1, !dbg !265
  store i64 %add33, i64* %k, align 8, !dbg !266
  %41 = load i64, i64* %j, align 8, !dbg !267
  %inc34 = add i64 %41, 1, !dbg !267
  store i64 %inc34, i64* %j, align 8, !dbg !267
  br label %if.end35, !dbg !268

if.end35:                                         ; preds = %if.then28, %for.body23
  br label %for.inc36, !dbg !269

for.inc36:                                        ; preds = %if.end35
  %42 = load i64, i64* %i, align 8, !dbg !270
  %inc37 = add i64 %42, 1, !dbg !270
  store i64 %inc37, i64* %i, align 8, !dbg !270
  br label %for.cond19, !dbg !271, !llvm.loop !272

for.end38:                                        ; preds = %for.cond19
  %43 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !274
  %44 = bitcast %struct.kw_t* %43 to i8*, !dbg !274
  %45 = load i32, i32* %n_word, align 4, !dbg !275
  %conv39 = sext i32 %45 to i64, !dbg !275
  call void @qsort(i8* %44, i64 %conv39, i64 24, i32 (i8*, i8*)* @lst_cmp), !dbg !276
  store i64 0, i64* %longest, align 8, !dbg !277
  store i64 0, i64* %offset, align 8, !dbg !279
  store i64 0, i64* %k, align 8, !dbg !280
  store i64 0, i64* %j, align 8, !dbg !281
  store i64 0, i64* %i, align 8, !dbg !282
  br label %for.cond40, !dbg !283

for.cond40:                                       ; preds = %for.inc67, %for.end38
  %46 = load i64, i64* %i, align 8, !dbg !284
  %47 = load i32, i32* %n_word, align 4, !dbg !286
  %conv41 = sext i32 %47 to i64, !dbg !286
  %cmp42 = icmp ult i64 %46, %conv41, !dbg !287
  br i1 %cmp42, label %for.body44, label %for.end69, !dbg !288

for.body44:                                       ; preds = %for.cond40
  %48 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !289
  %49 = load i64, i64* %i, align 8, !dbg !292
  %arrayidx45 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %48, i64 %49, !dbg !289
  %key46 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx45, i32 0, i32 0, !dbg !293
  %50 = load i8*, i8** %key46, align 8, !dbg !293
  %51 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !294
  %52 = load i64, i64* %j, align 8, !dbg !295
  %arrayidx47 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %51, i64 %52, !dbg !294
  %key48 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx47, i32 0, i32 0, !dbg !296
  %53 = load i8*, i8** %key48, align 8, !dbg !296
  %call49 = call i32 @strcmp(i8* %50, i8* %53) #6, !dbg !297
  %tobool = icmp ne i32 %call49, 0, !dbg !297
  br i1 %tobool, label %if.end52, label %if.then50, !dbg !298, !cf.info !75

if.then50:                                        ; preds = %for.body44
  %54 = load i64, i64* %k, align 8, !dbg !299
  %inc51 = add i64 %54, 1, !dbg !299
  store i64 %inc51, i64* %k, align 8, !dbg !299
  br label %for.inc67, !dbg !301

if.end52:                                         ; preds = %for.body44
  %55 = load i64, i64* %k, align 8, !dbg !302
  %56 = load i64, i64* %longest, align 8, !dbg !304
  %cmp53 = icmp ult i64 %55, %56, !dbg !305
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !306, !cf.info !75

if.then55:                                        ; preds = %if.end52
  store i64 0, i64* %k, align 8, !dbg !307
  %57 = load i64, i64* %i, align 8, !dbg !309
  store i64 %57, i64* %j, align 8, !dbg !310
  br label %for.inc67, !dbg !311

if.end56:                                         ; preds = %if.end52
  %58 = load i64, i64* %k, align 8, !dbg !312
  %59 = load i64, i64* %longest, align 8, !dbg !314
  %cmp57 = icmp ugt i64 %58, %59, !dbg !315
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !316, !cf.info !75

if.then59:                                        ; preds = %if.end56
  store i64 0, i64* %offset, align 8, !dbg !317
  br label %if.end60, !dbg !318

if.end60:                                         ; preds = %if.then59, %if.end56
  br label %while.cond, !dbg !319

while.cond:                                       ; preds = %while.body, %if.end60
  %60 = load i64, i64* %j, align 8, !dbg !320
  %61 = load i64, i64* %i, align 8, !dbg !321
  %cmp61 = icmp ult i64 %60, %61, !dbg !322
  br i1 %cmp61, label %while.body, label %while.end, !dbg !319

while.body:                                       ; preds = %while.cond
  %62 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !323
  %63 = load i64, i64* %offset, align 8, !dbg !324
  %inc63 = add i64 %63, 1, !dbg !324
  store i64 %inc63, i64* %offset, align 8, !dbg !324
  %arrayidx64 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %62, i64 %63, !dbg !323
  %64 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !325
  %65 = load i64, i64* %j, align 8, !dbg !326
  %inc65 = add i64 %65, 1, !dbg !326
  store i64 %inc65, i64* %j, align 8, !dbg !326
  %arrayidx66 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %64, i64 %65, !dbg !325
  %66 = bitcast %struct.kw_t* %arrayidx64 to i8*, !dbg !325
  %67 = bitcast %struct.kw_t* %arrayidx66 to i8*, !dbg !325
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %66, i8* align 8 %67, i64 24, i1 false), !dbg !325
  br label %while.cond, !dbg !319, !llvm.loop !327

while.end:                                        ; preds = %while.cond
  %68 = load i64, i64* %k, align 8, !dbg !329
  store i64 %68, i64* %longest, align 8, !dbg !330
  store i64 0, i64* %k, align 8, !dbg !331
  br label %for.inc67, !dbg !332

for.inc67:                                        ; preds = %while.end, %if.then55, %if.then50
  %69 = load i64, i64* %i, align 8, !dbg !333
  %inc68 = add i64 %69, 1, !dbg !333
  store i64 %inc68, i64* %i, align 8, !dbg !333
  br label %for.cond40, !dbg !334, !llvm.loop !335

for.end69:                                        ; preds = %for.cond40
  store i64 0, i64* %i, align 8, !dbg !337
  br label %for.cond70, !dbg !339

for.cond70:                                       ; preds = %for.inc90, %for.end69
  %70 = load i64, i64* %i, align 8, !dbg !340
  %71 = load i64, i64* %offset, align 8, !dbg !342
  %cmp71 = icmp ult i64 %70, %71, !dbg !343
  br i1 %cmp71, label %for.body73, label %for.end92, !dbg !344

for.body73:                                       ; preds = %for.cond70
  %72 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !345
  %73 = load i64, i64* %i, align 8, !dbg !347
  %arrayidx74 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %72, i64 %73, !dbg !345
  %word75 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx74, i32 0, i32 1, !dbg !348
  %74 = load i8*, i8** %word75, align 8, !dbg !348
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %74), !dbg !349
  %75 = load i64, i64* %i, align 8, !dbg !350
  %76 = load i32, i32* %n_word, align 4, !dbg !352
  %sub = sub nsw i32 %76, 1, !dbg !353
  %conv77 = sext i32 %sub to i64, !dbg !352
  %cmp78 = icmp ult i64 %75, %conv77, !dbg !354
  br i1 %cmp78, label %land.lhs.true, label %if.end89, !dbg !355, !cf.info !75

land.lhs.true:                                    ; preds = %for.body73
  %77 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !356
  %78 = load i64, i64* %i, align 8, !dbg !357
  %arrayidx80 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %77, i64 %78, !dbg !356
  %key81 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx80, i32 0, i32 0, !dbg !358
  %79 = load i8*, i8** %key81, align 8, !dbg !358
  %80 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !359
  %81 = load i64, i64* %i, align 8, !dbg !360
  %add82 = add i64 %81, 1, !dbg !361
  %arrayidx83 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %80, i64 %add82, !dbg !359
  %key84 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx83, i32 0, i32 0, !dbg !362
  %82 = load i8*, i8** %key84, align 8, !dbg !362
  %call85 = call i32 @strcmp(i8* %79, i8* %82) #6, !dbg !363
  %tobool86 = icmp ne i32 %call85, 0, !dbg !363
  br i1 %tobool86, label %if.then87, label %if.end89, !dbg !364, !cf.info !75

if.then87:                                        ; preds = %land.lhs.true
  %call88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !365
  br label %if.end89, !dbg !365

if.end89:                                         ; preds = %if.then87, %land.lhs.true, %for.body73
  br label %for.inc90, !dbg !366

for.inc90:                                        ; preds = %if.end89
  %83 = load i64, i64* %i, align 8, !dbg !367
  %inc91 = add i64 %83, 1, !dbg !367
  store i64 %inc91, i64* %i, align 8, !dbg !367
  br label %for.cond70, !dbg !368, !llvm.loop !369

for.end92:                                        ; preds = %for.cond70
  %84 = load i32, i32* %fd, align 4, !dbg !371
  %call93 = call i32 @close(i32 %84), !dbg !372
  store i32 0, i32* %retval, align 4, !dbg !373
  br label %return, !dbg !373

return:                                           ; preds = %for.end92, %if.then
  %85 = load i32, i32* %retval, align 4, !dbg !374
  ret i32 %85, !dbg !374
}

declare dso_local i32 @open(i8*, i32, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

declare dso_local i64 @read(i32, i8*, i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #4

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #3

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @close(i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "anagrams-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Anagrams")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "kw_t", file: !1, line: 9, baseType: !7)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 9, size: 192, elements: !8)
!8 = !{!9, !13, !14}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !7, file: !1, line: 9, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "word", scope: !7, file: !1, line: 9, baseType: !10, size: 64, offset: 64)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "cnt", scope: !7, file: !1, line: 9, baseType: !15, size: 32, offset: 128)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!20 = distinct !DISubprogram(name: "lst_cmp", scope: !1, file: !1, line: 11, type: !21, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!15, !23, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!25 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !1, line: 11, type: !23)
!26 = !DILocation(line: 11, column: 25, scope: !20)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !1, line: 11, type: !23)
!28 = !DILocation(line: 11, column: 40, scope: !20)
!29 = !DILocation(line: 13, column: 30, scope: !20)
!30 = !DILocation(line: 13, column: 17, scope: !20)
!31 = !DILocation(line: 13, column: 34, scope: !20)
!32 = !DILocation(line: 13, column: 53, scope: !20)
!33 = !DILocation(line: 13, column: 40, scope: !20)
!34 = !DILocation(line: 13, column: 57, scope: !20)
!35 = !DILocation(line: 13, column: 9, scope: !20)
!36 = !DILocation(line: 13, column: 2, scope: !20)
!37 = distinct !DISubprogram(name: "sort_letters", scope: !1, file: !1, line: 17, type: !38, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!41 = !DILocalVariable(name: "s", arg: 1, scope: !37, file: !1, line: 17, type: !40)
!42 = !DILocation(line: 17, column: 25, scope: !37)
!43 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 19, type: !15)
!44 = !DILocation(line: 19, column: 6, scope: !37)
!45 = !DILocalVariable(name: "j", scope: !37, file: !1, line: 19, type: !15)
!46 = !DILocation(line: 19, column: 9, scope: !37)
!47 = !DILocalVariable(name: "t", scope: !37, file: !1, line: 20, type: !12)
!48 = !DILocation(line: 20, column: 7, scope: !37)
!49 = !DILocation(line: 21, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !1, line: 21, column: 2)
!51 = !DILocation(line: 21, column: 7, scope: !50)
!52 = !DILocation(line: 21, column: 14, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 2)
!54 = !DILocation(line: 21, column: 16, scope: !53)
!55 = !DILocation(line: 21, column: 19, scope: !53)
!56 = !DILocation(line: 21, column: 2, scope: !50)
!57 = !DILocation(line: 22, column: 12, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 22, column: 3)
!59 = distinct !DILexicalBlock(scope: !53, file: !1, line: 21, column: 33)
!60 = !DILocation(line: 22, column: 14, scope: !58)
!61 = !DILocation(line: 22, column: 10, scope: !58)
!62 = !DILocation(line: 22, column: 8, scope: !58)
!63 = !DILocation(line: 22, column: 19, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 3)
!65 = !DILocation(line: 22, column: 21, scope: !64)
!66 = !DILocation(line: 22, column: 24, scope: !64)
!67 = !DILocation(line: 22, column: 3, scope: !58)
!68 = !DILocation(line: 23, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !1, line: 23, column: 8)
!70 = !DILocation(line: 23, column: 10, scope: !69)
!71 = !DILocation(line: 23, column: 15, scope: !69)
!72 = !DILocation(line: 23, column: 17, scope: !69)
!73 = !DILocation(line: 23, column: 13, scope: !69)
!74 = !DILocation(line: 23, column: 8, scope: !64)
!75 = !{!"if"}
!76 = !DILocation(line: 24, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !1, line: 23, column: 21)
!78 = !DILocation(line: 24, column: 11, scope: !77)
!79 = !DILocation(line: 24, column: 7, scope: !77)
!80 = !DILocation(line: 24, column: 22, scope: !77)
!81 = !DILocation(line: 24, column: 24, scope: !77)
!82 = !DILocation(line: 24, column: 15, scope: !77)
!83 = !DILocation(line: 24, column: 17, scope: !77)
!84 = !DILocation(line: 24, column: 20, scope: !77)
!85 = !DILocation(line: 24, column: 35, scope: !77)
!86 = !DILocation(line: 24, column: 28, scope: !77)
!87 = !DILocation(line: 24, column: 30, scope: !77)
!88 = !DILocation(line: 24, column: 33, scope: !77)
!89 = !DILocation(line: 25, column: 4, scope: !77)
!90 = !DILocation(line: 23, column: 18, scope: !69)
!91 = !DILocation(line: 22, column: 34, scope: !64)
!92 = !DILocation(line: 22, column: 3, scope: !64)
!93 = distinct !{!93, !67, !94}
!94 = !DILocation(line: 25, column: 4, scope: !58)
!95 = !DILocation(line: 26, column: 2, scope: !59)
!96 = !DILocation(line: 21, column: 29, scope: !53)
!97 = !DILocation(line: 21, column: 2, scope: !53)
!98 = distinct !{!98, !56, !99}
!99 = !DILocation(line: 26, column: 2, scope: !50)
!100 = !DILocation(line: 27, column: 1, scope: !37)
!101 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !102, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!15}
!104 = !DILocalVariable(name: "s", scope: !101, file: !1, line: 31, type: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !106, line: 46, size: 1152, elements: !107)
!106 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!107 = !{!108, !112, !114, !116, !119, !121, !123, !124, !125, !128, !130, !132, !140, !141, !142}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !105, file: !106, line: 48, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !110, line: 145, baseType: !111)
!110 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!111 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !105, file: !106, line: 53, baseType: !113, size: 64, offset: 64)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !110, line: 148, baseType: !111)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !105, file: !106, line: 61, baseType: !115, size: 64, offset: 128)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !110, line: 151, baseType: !111)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !105, file: !106, line: 62, baseType: !117, size: 32, offset: 192)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !110, line: 150, baseType: !118)
!118 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !105, file: !106, line: 64, baseType: !120, size: 32, offset: 224)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !110, line: 146, baseType: !118)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !105, file: !106, line: 65, baseType: !122, size: 32, offset: 256)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !110, line: 147, baseType: !118)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !105, file: !106, line: 67, baseType: !15, size: 32, offset: 288)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !105, file: !106, line: 69, baseType: !109, size: 64, offset: 320)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !105, file: !106, line: 74, baseType: !126, size: 64, offset: 384)
!126 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !110, line: 152, baseType: !127)
!127 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !105, file: !106, line: 78, baseType: !129, size: 64, offset: 448)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !110, line: 174, baseType: !127)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !105, file: !106, line: 80, baseType: !131, size: 64, offset: 512)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !110, line: 179, baseType: !127)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !105, file: !106, line: 91, baseType: !133, size: 128, offset: 576)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !134, line: 10, size: 128, elements: !135)
!134 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!135 = !{!136, !138}
!136 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !133, file: !134, line: 12, baseType: !137, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !110, line: 160, baseType: !127)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !133, file: !134, line: 16, baseType: !139, size: 64, offset: 64)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !110, line: 196, baseType: !127)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !105, file: !106, line: 92, baseType: !133, size: 128, offset: 704)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !105, file: !106, line: 93, baseType: !133, size: 128, offset: 832)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !105, file: !106, line: 106, baseType: !143, size: 192, offset: 960)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !139, size: 192, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 3)
!146 = !DILocation(line: 31, column: 14, scope: !101)
!147 = !DILocalVariable(name: "words", scope: !101, file: !1, line: 32, type: !40)
!148 = !DILocation(line: 32, column: 8, scope: !101)
!149 = !DILocalVariable(name: "keys", scope: !101, file: !1, line: 32, type: !40)
!150 = !DILocation(line: 32, column: 16, scope: !101)
!151 = !DILocalVariable(name: "i", scope: !101, file: !1, line: 33, type: !152)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !153, line: 46, baseType: !111)
!153 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!154 = !DILocation(line: 33, column: 9, scope: !101)
!155 = !DILocalVariable(name: "j", scope: !101, file: !1, line: 33, type: !152)
!156 = !DILocation(line: 33, column: 12, scope: !101)
!157 = !DILocalVariable(name: "k", scope: !101, file: !1, line: 33, type: !152)
!158 = !DILocation(line: 33, column: 15, scope: !101)
!159 = !DILocalVariable(name: "longest", scope: !101, file: !1, line: 33, type: !152)
!160 = !DILocation(line: 33, column: 18, scope: !101)
!161 = !DILocalVariable(name: "offset", scope: !101, file: !1, line: 33, type: !152)
!162 = !DILocation(line: 33, column: 27, scope: !101)
!163 = !DILocalVariable(name: "n_word", scope: !101, file: !1, line: 34, type: !15)
!164 = !DILocation(line: 34, column: 6, scope: !101)
!165 = !DILocalVariable(name: "list", scope: !101, file: !1, line: 35, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!167 = !DILocation(line: 35, column: 8, scope: !101)
!168 = !DILocalVariable(name: "fd", scope: !101, file: !1, line: 37, type: !15)
!169 = !DILocation(line: 37, column: 6, scope: !101)
!170 = !DILocation(line: 37, column: 11, scope: !101)
!171 = !DILocation(line: 38, column: 6, scope: !172)
!172 = distinct !DILexicalBlock(scope: !101, file: !1, line: 38, column: 6)
!173 = !DILocation(line: 38, column: 9, scope: !172)
!174 = !DILocation(line: 38, column: 6, scope: !101)
!175 = !DILocation(line: 38, column: 16, scope: !172)
!176 = !DILocation(line: 39, column: 8, scope: !101)
!177 = !DILocation(line: 39, column: 2, scope: !101)
!178 = !DILocation(line: 40, column: 19, scope: !101)
!179 = !DILocation(line: 40, column: 27, scope: !101)
!180 = !DILocation(line: 40, column: 10, scope: !101)
!181 = !DILocation(line: 40, column: 8, scope: !101)
!182 = !DILocation(line: 41, column: 10, scope: !101)
!183 = !DILocation(line: 41, column: 20, scope: !101)
!184 = !DILocation(line: 41, column: 16, scope: !101)
!185 = !DILocation(line: 41, column: 8, scope: !101)
!186 = !DILocation(line: 43, column: 7, scope: !101)
!187 = !DILocation(line: 43, column: 11, scope: !101)
!188 = !DILocation(line: 43, column: 20, scope: !101)
!189 = !DILocation(line: 43, column: 2, scope: !101)
!190 = !DILocation(line: 44, column: 9, scope: !101)
!191 = !DILocation(line: 44, column: 15, scope: !101)
!192 = !DILocation(line: 44, column: 24, scope: !101)
!193 = !DILocation(line: 44, column: 2, scope: !101)
!194 = !DILocation(line: 47, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !101, file: !1, line: 47, column: 2)
!196 = !DILocation(line: 47, column: 9, scope: !195)
!197 = !DILocation(line: 47, column: 7, scope: !195)
!198 = !DILocation(line: 47, column: 18, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !1, line: 47, column: 2)
!200 = !DILocation(line: 47, column: 24, scope: !199)
!201 = !DILocation(line: 47, column: 20, scope: !199)
!202 = !DILocation(line: 47, column: 2, scope: !195)
!203 = !DILocation(line: 48, column: 7, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !1, line: 48, column: 7)
!205 = distinct !DILexicalBlock(scope: !199, file: !1, line: 47, column: 38)
!206 = !DILocation(line: 48, column: 13, scope: !204)
!207 = !DILocation(line: 48, column: 16, scope: !204)
!208 = !DILocation(line: 48, column: 7, scope: !205)
!209 = !DILocation(line: 49, column: 15, scope: !210)
!210 = distinct !DILexicalBlock(scope: !204, file: !1, line: 48, column: 25)
!211 = !DILocation(line: 49, column: 20, scope: !210)
!212 = !DILocation(line: 49, column: 23, scope: !210)
!213 = !DILocation(line: 49, column: 4, scope: !210)
!214 = !DILocation(line: 49, column: 10, scope: !210)
!215 = !DILocation(line: 49, column: 13, scope: !210)
!216 = !DILocation(line: 50, column: 17, scope: !210)
!217 = !DILocation(line: 50, column: 24, scope: !210)
!218 = !DILocation(line: 50, column: 22, scope: !210)
!219 = !DILocation(line: 50, column: 4, scope: !210)
!220 = !DILocation(line: 51, column: 8, scope: !210)
!221 = !DILocation(line: 51, column: 10, scope: !210)
!222 = !DILocation(line: 51, column: 6, scope: !210)
!223 = !DILocation(line: 52, column: 11, scope: !210)
!224 = !DILocation(line: 53, column: 3, scope: !210)
!225 = !DILocation(line: 54, column: 2, scope: !205)
!226 = !DILocation(line: 47, column: 34, scope: !199)
!227 = !DILocation(line: 47, column: 2, scope: !199)
!228 = distinct !{!228, !202, !229}
!229 = !DILocation(line: 54, column: 2, scope: !195)
!230 = !DILocation(line: 56, column: 16, scope: !101)
!231 = !DILocation(line: 56, column: 9, scope: !101)
!232 = !DILocation(line: 56, column: 7, scope: !101)
!233 = !DILocation(line: 59, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !101, file: !1, line: 59, column: 2)
!235 = !DILocation(line: 59, column: 13, scope: !234)
!236 = !DILocation(line: 59, column: 9, scope: !234)
!237 = !DILocation(line: 59, column: 7, scope: !234)
!238 = !DILocation(line: 59, column: 22, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !1, line: 59, column: 2)
!240 = !DILocation(line: 59, column: 28, scope: !239)
!241 = !DILocation(line: 59, column: 24, scope: !239)
!242 = !DILocation(line: 59, column: 2, scope: !234)
!243 = !DILocation(line: 60, column: 7, scope: !244)
!244 = distinct !DILexicalBlock(scope: !245, file: !1, line: 60, column: 7)
!245 = distinct !DILexicalBlock(scope: !239, file: !1, line: 59, column: 42)
!246 = !DILocation(line: 60, column: 13, scope: !244)
!247 = !DILocation(line: 60, column: 16, scope: !244)
!248 = !DILocation(line: 60, column: 7, scope: !245)
!249 = !DILocation(line: 61, column: 18, scope: !250)
!250 = distinct !DILexicalBlock(scope: !244, file: !1, line: 60, column: 25)
!251 = !DILocation(line: 61, column: 25, scope: !250)
!252 = !DILocation(line: 61, column: 23, scope: !250)
!253 = !DILocation(line: 61, column: 4, scope: !250)
!254 = !DILocation(line: 61, column: 9, scope: !250)
!255 = !DILocation(line: 61, column: 12, scope: !250)
!256 = !DILocation(line: 61, column: 16, scope: !250)
!257 = !DILocation(line: 62, column: 19, scope: !250)
!258 = !DILocation(line: 62, column: 27, scope: !250)
!259 = !DILocation(line: 62, column: 25, scope: !250)
!260 = !DILocation(line: 62, column: 4, scope: !250)
!261 = !DILocation(line: 62, column: 9, scope: !250)
!262 = !DILocation(line: 62, column: 12, scope: !250)
!263 = !DILocation(line: 62, column: 17, scope: !250)
!264 = !DILocation(line: 63, column: 8, scope: !250)
!265 = !DILocation(line: 63, column: 10, scope: !250)
!266 = !DILocation(line: 63, column: 6, scope: !250)
!267 = !DILocation(line: 64, column: 5, scope: !250)
!268 = !DILocation(line: 65, column: 3, scope: !250)
!269 = !DILocation(line: 66, column: 2, scope: !245)
!270 = !DILocation(line: 59, column: 38, scope: !239)
!271 = !DILocation(line: 59, column: 2, scope: !239)
!272 = distinct !{!272, !242, !273}
!273 = !DILocation(line: 66, column: 2, scope: !234)
!274 = !DILocation(line: 68, column: 8, scope: !101)
!275 = !DILocation(line: 68, column: 14, scope: !101)
!276 = !DILocation(line: 68, column: 2, scope: !101)
!277 = !DILocation(line: 71, column: 36, scope: !278)
!278 = distinct !DILexicalBlock(scope: !101, file: !1, line: 71, column: 2)
!279 = !DILocation(line: 71, column: 26, scope: !278)
!280 = !DILocation(line: 71, column: 17, scope: !278)
!281 = !DILocation(line: 71, column: 13, scope: !278)
!282 = !DILocation(line: 71, column: 9, scope: !278)
!283 = !DILocation(line: 71, column: 7, scope: !278)
!284 = !DILocation(line: 71, column: 41, scope: !285)
!285 = distinct !DILexicalBlock(scope: !278, file: !1, line: 71, column: 2)
!286 = !DILocation(line: 71, column: 45, scope: !285)
!287 = !DILocation(line: 71, column: 43, scope: !285)
!288 = !DILocation(line: 71, column: 2, scope: !278)
!289 = !DILocation(line: 72, column: 15, scope: !290)
!290 = distinct !DILexicalBlock(scope: !291, file: !1, line: 72, column: 7)
!291 = distinct !DILexicalBlock(scope: !285, file: !1, line: 71, column: 58)
!292 = !DILocation(line: 72, column: 20, scope: !290)
!293 = !DILocation(line: 72, column: 23, scope: !290)
!294 = !DILocation(line: 72, column: 28, scope: !290)
!295 = !DILocation(line: 72, column: 33, scope: !290)
!296 = !DILocation(line: 72, column: 36, scope: !290)
!297 = !DILocation(line: 72, column: 8, scope: !290)
!298 = !DILocation(line: 72, column: 7, scope: !291)
!299 = !DILocation(line: 73, column: 4, scope: !300)
!300 = distinct !DILexicalBlock(scope: !290, file: !1, line: 72, column: 42)
!301 = !DILocation(line: 74, column: 4, scope: !300)
!302 = !DILocation(line: 78, column: 7, scope: !303)
!303 = distinct !DILexicalBlock(scope: !291, file: !1, line: 78, column: 7)
!304 = !DILocation(line: 78, column: 11, scope: !303)
!305 = !DILocation(line: 78, column: 9, scope: !303)
!306 = !DILocation(line: 78, column: 7, scope: !291)
!307 = !DILocation(line: 79, column: 6, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !1, line: 78, column: 20)
!309 = !DILocation(line: 80, column: 8, scope: !308)
!310 = !DILocation(line: 80, column: 6, scope: !308)
!311 = !DILocation(line: 81, column: 4, scope: !308)
!312 = !DILocation(line: 84, column: 7, scope: !313)
!313 = distinct !DILexicalBlock(scope: !291, file: !1, line: 84, column: 7)
!314 = !DILocation(line: 84, column: 11, scope: !313)
!315 = !DILocation(line: 84, column: 9, scope: !313)
!316 = !DILocation(line: 84, column: 7, scope: !291)
!317 = !DILocation(line: 84, column: 27, scope: !313)
!318 = !DILocation(line: 84, column: 20, scope: !313)
!319 = !DILocation(line: 86, column: 3, scope: !291)
!320 = !DILocation(line: 86, column: 10, scope: !291)
!321 = !DILocation(line: 86, column: 14, scope: !291)
!322 = !DILocation(line: 86, column: 12, scope: !291)
!323 = !DILocation(line: 86, column: 17, scope: !291)
!324 = !DILocation(line: 86, column: 28, scope: !291)
!325 = !DILocation(line: 86, column: 34, scope: !291)
!326 = !DILocation(line: 86, column: 40, scope: !291)
!327 = distinct !{!327, !319, !328}
!328 = !DILocation(line: 86, column: 42, scope: !291)
!329 = !DILocation(line: 87, column: 13, scope: !291)
!330 = !DILocation(line: 87, column: 11, scope: !291)
!331 = !DILocation(line: 88, column: 5, scope: !291)
!332 = !DILocation(line: 89, column: 2, scope: !291)
!333 = !DILocation(line: 71, column: 54, scope: !285)
!334 = !DILocation(line: 71, column: 2, scope: !285)
!335 = distinct !{!335, !288, !336}
!336 = !DILocation(line: 89, column: 2, scope: !278)
!337 = !DILocation(line: 92, column: 9, scope: !338)
!338 = distinct !DILexicalBlock(scope: !101, file: !1, line: 92, column: 2)
!339 = !DILocation(line: 92, column: 7, scope: !338)
!340 = !DILocation(line: 92, column: 14, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !1, line: 92, column: 2)
!342 = !DILocation(line: 92, column: 18, scope: !341)
!343 = !DILocation(line: 92, column: 16, scope: !341)
!344 = !DILocation(line: 92, column: 2, scope: !338)
!345 = !DILocation(line: 93, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !341, file: !1, line: 92, column: 31)
!347 = !DILocation(line: 93, column: 22, scope: !346)
!348 = !DILocation(line: 93, column: 25, scope: !346)
!349 = !DILocation(line: 93, column: 3, scope: !346)
!350 = !DILocation(line: 94, column: 7, scope: !351)
!351 = distinct !DILexicalBlock(scope: !346, file: !1, line: 94, column: 7)
!352 = !DILocation(line: 94, column: 11, scope: !351)
!353 = !DILocation(line: 94, column: 18, scope: !351)
!354 = !DILocation(line: 94, column: 9, scope: !351)
!355 = !DILocation(line: 94, column: 22, scope: !351)
!356 = !DILocation(line: 94, column: 32, scope: !351)
!357 = !DILocation(line: 94, column: 37, scope: !351)
!358 = !DILocation(line: 94, column: 40, scope: !351)
!359 = !DILocation(line: 94, column: 45, scope: !351)
!360 = !DILocation(line: 94, column: 50, scope: !351)
!361 = !DILocation(line: 94, column: 51, scope: !351)
!362 = !DILocation(line: 94, column: 55, scope: !351)
!363 = !DILocation(line: 94, column: 25, scope: !351)
!364 = !DILocation(line: 94, column: 7, scope: !346)
!365 = !DILocation(line: 95, column: 4, scope: !351)
!366 = !DILocation(line: 96, column: 2, scope: !346)
!367 = !DILocation(line: 92, column: 27, scope: !341)
!368 = !DILocation(line: 92, column: 2, scope: !341)
!369 = distinct !{!369, !344, !370}
!370 = !DILocation(line: 96, column: 2, scope: !338)
!371 = !DILocation(line: 99, column: 8, scope: !101)
!372 = !DILocation(line: 99, column: 2, scope: !101)
!373 = !DILocation(line: 100, column: 2, scope: !101)
!374 = !DILocation(line: 101, column: 1, scope: !101)
