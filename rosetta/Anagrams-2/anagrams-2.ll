; ModuleID = 'anagrams-2.ll'
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
  br i1 %cmp15, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %for.body8
  %13 = load i8*, i8** %s.addr, align 8, !dbg !75
  %14 = load i32, i32* %j, align 4, !dbg !77
  %idxprom17 = sext i32 %14 to i64, !dbg !75
  %arrayidx18 = getelementptr inbounds i8, i8* %13, i64 %idxprom17, !dbg !75
  %15 = load i8, i8* %arrayidx18, align 1, !dbg !75
  store i8 %15, i8* %t, align 1, !dbg !78
  %16 = load i8*, i8** %s.addr, align 8, !dbg !79
  %17 = load i32, i32* %i, align 4, !dbg !80
  %idxprom19 = sext i32 %17 to i64, !dbg !79
  %arrayidx20 = getelementptr inbounds i8, i8* %16, i64 %idxprom19, !dbg !79
  %18 = load i8, i8* %arrayidx20, align 1, !dbg !79
  %19 = load i8*, i8** %s.addr, align 8, !dbg !81
  %20 = load i32, i32* %j, align 4, !dbg !82
  %idxprom21 = sext i32 %20 to i64, !dbg !81
  %arrayidx22 = getelementptr inbounds i8, i8* %19, i64 %idxprom21, !dbg !81
  store i8 %18, i8* %arrayidx22, align 1, !dbg !83
  %21 = load i8, i8* %t, align 1, !dbg !84
  %22 = load i8*, i8** %s.addr, align 8, !dbg !85
  %23 = load i32, i32* %i, align 4, !dbg !86
  %idxprom23 = sext i32 %23 to i64, !dbg !85
  %arrayidx24 = getelementptr inbounds i8, i8* %22, i64 %idxprom23, !dbg !85
  store i8 %21, i8* %arrayidx24, align 1, !dbg !87
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %if.end
  %24 = load i32, i32* %j, align 4, !dbg !90
  %inc = add nsw i32 %24, 1, !dbg !90
  store i32 %inc, i32* %j, align 4, !dbg !90
  br label %for.cond2, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond2
  br label %for.inc25, !dbg !94

for.inc25:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !95
  %inc26 = add nsw i32 %25, 1, !dbg !95
  store i32 %inc26, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end27:                                        ; preds = %for.cond
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !100 {
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
  call void @llvm.dbg.declare(metadata %struct.stat* %s, metadata !103, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i8** %words, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i8** %keys, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %j, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %k, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i64* %longest, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %offset, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %n_word, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 0, i32* %n_word, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata %struct.kw_t** %list, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !167, metadata !DIExpression()), !dbg !168
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 0), !dbg !169
  store i32 %call, i32* %fd, align 4, !dbg !168
  %0 = load i32, i32* %fd, align 4, !dbg !170
  %cmp = icmp eq i32 %0, -1, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !174
  br label %return, !dbg !174

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd, align 4, !dbg !175
  %call1 = call i32 @fstat(i32 %1, %struct.stat* %s) #7, !dbg !176
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !177
  %2 = load i64, i64* %st_size, align 8, !dbg !177
  %mul = mul nsw i64 %2, 2, !dbg !178
  %call2 = call noalias i8* @malloc(i64 %mul) #7, !dbg !179
  store i8* %call2, i8** %words, align 8, !dbg !180
  %3 = load i8*, i8** %words, align 8, !dbg !181
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !182
  %4 = load i64, i64* %st_size3, align 8, !dbg !182
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !183
  store i8* %add.ptr, i8** %keys, align 8, !dbg !184
  %5 = load i32, i32* %fd, align 4, !dbg !185
  %6 = load i8*, i8** %words, align 8, !dbg !186
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !187
  %7 = load i64, i64* %st_size4, align 8, !dbg !187
  %call5 = call i64 @read(i32 %5, i8* %6, i64 %7), !dbg !188
  %8 = load i8*, i8** %keys, align 8, !dbg !189
  %9 = load i8*, i8** %words, align 8, !dbg !190
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !191
  %10 = load i64, i64* %st_size6, align 8, !dbg !191
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %9, i64 %10, i1 false), !dbg !192
  store i64 0, i64* %j, align 8, !dbg !193
  store i64 0, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !197
  %st_size7 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !199
  %12 = load i64, i64* %st_size7, align 8, !dbg !199
  %cmp8 = icmp ult i64 %11, %12, !dbg !200
  br i1 %cmp8, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** %words, align 8, !dbg !202
  %14 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !202
  %15 = load i8, i8* %arrayidx, align 1, !dbg !202
  %conv = sext i8 %15 to i32, !dbg !202
  %cmp9 = icmp eq i32 %conv, 10, !dbg !206
  br i1 %cmp9, label %if.then11, label %if.end15, !dbg !207

if.then11:                                        ; preds = %for.body
  %16 = load i8*, i8** %keys, align 8, !dbg !208
  %17 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx12 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !208
  store i8 0, i8* %arrayidx12, align 1, !dbg !211
  %18 = load i8*, i8** %words, align 8, !dbg !212
  %19 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx13 = getelementptr inbounds i8, i8* %18, i64 %19, !dbg !212
  store i8 0, i8* %arrayidx13, align 1, !dbg !214
  %20 = load i8*, i8** %keys, align 8, !dbg !215
  %21 = load i64, i64* %j, align 8, !dbg !216
  %add.ptr14 = getelementptr inbounds i8, i8* %20, i64 %21, !dbg !217
  call void @sort_letters(i8* %add.ptr14), !dbg !218
  %22 = load i64, i64* %i, align 8, !dbg !219
  %add = add i64 %22, 1, !dbg !220
  store i64 %add, i64* %j, align 8, !dbg !221
  %23 = load i32, i32* %n_word, align 4, !dbg !222
  %inc = add nsw i32 %23, 1, !dbg !222
  store i32 %inc, i32* %n_word, align 4, !dbg !222
  br label %if.end15, !dbg !223

if.end15:                                         ; preds = %if.then11, %for.body
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %if.end15
  %24 = load i64, i64* %i, align 8, !dbg !225
  %inc16 = add i64 %24, 1, !dbg !225
  store i64 %inc16, i64* %i, align 8, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %25 = load i32, i32* %n_word, align 4, !dbg !229
  %conv17 = sext i32 %25 to i64, !dbg !229
  %call18 = call noalias i8* @calloc(i64 %conv17, i64 24) #7, !dbg !230
  %26 = bitcast i8* %call18 to %struct.kw_t*, !dbg !230
  store %struct.kw_t* %26, %struct.kw_t** %list, align 8, !dbg !231
  store i64 0, i64* %k, align 8, !dbg !232
  store i64 0, i64* %j, align 8, !dbg !234
  store i64 0, i64* %i, align 8, !dbg !235
  br label %for.cond19, !dbg !236

for.cond19:                                       ; preds = %for.inc36, %for.end
  %27 = load i64, i64* %i, align 8, !dbg !237
  %st_size20 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !239
  %28 = load i64, i64* %st_size20, align 8, !dbg !239
  %cmp21 = icmp ult i64 %27, %28, !dbg !240
  br i1 %cmp21, label %for.body23, label %for.end38, !dbg !241

for.body23:                                       ; preds = %for.cond19
  %29 = load i8*, i8** %words, align 8, !dbg !242
  %30 = load i64, i64* %i, align 8, !dbg !245
  %arrayidx24 = getelementptr inbounds i8, i8* %29, i64 %30, !dbg !242
  %31 = load i8, i8* %arrayidx24, align 1, !dbg !242
  %conv25 = sext i8 %31 to i32, !dbg !242
  %cmp26 = icmp eq i32 %conv25, 0, !dbg !246
  br i1 %cmp26, label %if.then28, label %if.end35, !dbg !247

if.then28:                                        ; preds = %for.body23
  %32 = load i8*, i8** %keys, align 8, !dbg !248
  %33 = load i64, i64* %k, align 8, !dbg !250
  %add.ptr29 = getelementptr inbounds i8, i8* %32, i64 %33, !dbg !251
  %34 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !252
  %35 = load i64, i64* %j, align 8, !dbg !253
  %arrayidx30 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %34, i64 %35, !dbg !252
  %key = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx30, i32 0, i32 0, !dbg !254
  store i8* %add.ptr29, i8** %key, align 8, !dbg !255
  %36 = load i8*, i8** %words, align 8, !dbg !256
  %37 = load i64, i64* %k, align 8, !dbg !257
  %add.ptr31 = getelementptr inbounds i8, i8* %36, i64 %37, !dbg !258
  %38 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !259
  %39 = load i64, i64* %j, align 8, !dbg !260
  %arrayidx32 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %38, i64 %39, !dbg !259
  %word = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx32, i32 0, i32 1, !dbg !261
  store i8* %add.ptr31, i8** %word, align 8, !dbg !262
  %40 = load i64, i64* %i, align 8, !dbg !263
  %add33 = add i64 %40, 1, !dbg !264
  store i64 %add33, i64* %k, align 8, !dbg !265
  %41 = load i64, i64* %j, align 8, !dbg !266
  %inc34 = add i64 %41, 1, !dbg !266
  store i64 %inc34, i64* %j, align 8, !dbg !266
  br label %if.end35, !dbg !267

if.end35:                                         ; preds = %if.then28, %for.body23
  br label %for.inc36, !dbg !268

for.inc36:                                        ; preds = %if.end35
  %42 = load i64, i64* %i, align 8, !dbg !269
  %inc37 = add i64 %42, 1, !dbg !269
  store i64 %inc37, i64* %i, align 8, !dbg !269
  br label %for.cond19, !dbg !270, !llvm.loop !271

for.end38:                                        ; preds = %for.cond19
  %43 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !273
  %44 = bitcast %struct.kw_t* %43 to i8*, !dbg !273
  %45 = load i32, i32* %n_word, align 4, !dbg !274
  %conv39 = sext i32 %45 to i64, !dbg !274
  call void @qsort(i8* %44, i64 %conv39, i64 24, i32 (i8*, i8*)* @lst_cmp), !dbg !275
  store i64 0, i64* %longest, align 8, !dbg !276
  store i64 0, i64* %offset, align 8, !dbg !278
  store i64 0, i64* %k, align 8, !dbg !279
  store i64 0, i64* %j, align 8, !dbg !280
  store i64 0, i64* %i, align 8, !dbg !281
  br label %for.cond40, !dbg !282

for.cond40:                                       ; preds = %for.inc67, %for.end38
  %46 = load i64, i64* %i, align 8, !dbg !283
  %47 = load i32, i32* %n_word, align 4, !dbg !285
  %conv41 = sext i32 %47 to i64, !dbg !285
  %cmp42 = icmp ult i64 %46, %conv41, !dbg !286
  br i1 %cmp42, label %for.body44, label %for.end69, !dbg !287

for.body44:                                       ; preds = %for.cond40
  %48 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !288
  %49 = load i64, i64* %i, align 8, !dbg !291
  %arrayidx45 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %48, i64 %49, !dbg !288
  %key46 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx45, i32 0, i32 0, !dbg !292
  %50 = load i8*, i8** %key46, align 8, !dbg !292
  %51 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !293
  %52 = load i64, i64* %j, align 8, !dbg !294
  %arrayidx47 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %51, i64 %52, !dbg !293
  %key48 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx47, i32 0, i32 0, !dbg !295
  %53 = load i8*, i8** %key48, align 8, !dbg !295
  %call49 = call i32 @strcmp(i8* %50, i8* %53) #6, !dbg !296
  %tobool = icmp ne i32 %call49, 0, !dbg !296
  br i1 %tobool, label %if.end52, label %if.then50, !dbg !297

if.then50:                                        ; preds = %for.body44
  %54 = load i64, i64* %k, align 8, !dbg !298
  %inc51 = add i64 %54, 1, !dbg !298
  store i64 %inc51, i64* %k, align 8, !dbg !298
  br label %for.inc67, !dbg !300

if.end52:                                         ; preds = %for.body44
  %55 = load i64, i64* %k, align 8, !dbg !301
  %56 = load i64, i64* %longest, align 8, !dbg !303
  %cmp53 = icmp ult i64 %55, %56, !dbg !304
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !305

if.then55:                                        ; preds = %if.end52
  store i64 0, i64* %k, align 8, !dbg !306
  %57 = load i64, i64* %i, align 8, !dbg !308
  store i64 %57, i64* %j, align 8, !dbg !309
  br label %for.inc67, !dbg !310

if.end56:                                         ; preds = %if.end52
  %58 = load i64, i64* %k, align 8, !dbg !311
  %59 = load i64, i64* %longest, align 8, !dbg !313
  %cmp57 = icmp ugt i64 %58, %59, !dbg !314
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !315

if.then59:                                        ; preds = %if.end56
  store i64 0, i64* %offset, align 8, !dbg !316
  br label %if.end60, !dbg !317

if.end60:                                         ; preds = %if.then59, %if.end56
  br label %while.cond, !dbg !318

while.cond:                                       ; preds = %while.body, %if.end60
  %60 = load i64, i64* %j, align 8, !dbg !319
  %61 = load i64, i64* %i, align 8, !dbg !320
  %cmp61 = icmp ult i64 %60, %61, !dbg !321
  br i1 %cmp61, label %while.body, label %while.end, !dbg !318

while.body:                                       ; preds = %while.cond
  %62 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !322
  %63 = load i64, i64* %offset, align 8, !dbg !323
  %inc63 = add i64 %63, 1, !dbg !323
  store i64 %inc63, i64* %offset, align 8, !dbg !323
  %arrayidx64 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %62, i64 %63, !dbg !322
  %64 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !324
  %65 = load i64, i64* %j, align 8, !dbg !325
  %inc65 = add i64 %65, 1, !dbg !325
  store i64 %inc65, i64* %j, align 8, !dbg !325
  %arrayidx66 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %64, i64 %65, !dbg !324
  %66 = bitcast %struct.kw_t* %arrayidx64 to i8*, !dbg !324
  %67 = bitcast %struct.kw_t* %arrayidx66 to i8*, !dbg !324
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %66, i8* align 8 %67, i64 24, i1 false), !dbg !324
  br label %while.cond, !dbg !318, !llvm.loop !326

while.end:                                        ; preds = %while.cond
  %68 = load i64, i64* %k, align 8, !dbg !328
  store i64 %68, i64* %longest, align 8, !dbg !329
  store i64 0, i64* %k, align 8, !dbg !330
  br label %for.inc67, !dbg !331

for.inc67:                                        ; preds = %while.end, %if.then55, %if.then50
  %69 = load i64, i64* %i, align 8, !dbg !332
  %inc68 = add i64 %69, 1, !dbg !332
  store i64 %inc68, i64* %i, align 8, !dbg !332
  br label %for.cond40, !dbg !333, !llvm.loop !334

for.end69:                                        ; preds = %for.cond40
  store i64 0, i64* %i, align 8, !dbg !336
  br label %for.cond70, !dbg !338

for.cond70:                                       ; preds = %for.inc90, %for.end69
  %70 = load i64, i64* %i, align 8, !dbg !339
  %71 = load i64, i64* %offset, align 8, !dbg !341
  %cmp71 = icmp ult i64 %70, %71, !dbg !342
  br i1 %cmp71, label %for.body73, label %for.end92, !dbg !343

for.body73:                                       ; preds = %for.cond70
  %72 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !344
  %73 = load i64, i64* %i, align 8, !dbg !346
  %arrayidx74 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %72, i64 %73, !dbg !344
  %word75 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx74, i32 0, i32 1, !dbg !347
  %74 = load i8*, i8** %word75, align 8, !dbg !347
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %74), !dbg !348
  %75 = load i64, i64* %i, align 8, !dbg !349
  %76 = load i32, i32* %n_word, align 4, !dbg !351
  %sub = sub nsw i32 %76, 1, !dbg !352
  %conv77 = sext i32 %sub to i64, !dbg !351
  %cmp78 = icmp ult i64 %75, %conv77, !dbg !353
  br i1 %cmp78, label %land.lhs.true, label %if.end89, !dbg !354

land.lhs.true:                                    ; preds = %for.body73
  %77 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !355
  %78 = load i64, i64* %i, align 8, !dbg !356
  %arrayidx80 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %77, i64 %78, !dbg !355
  %key81 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx80, i32 0, i32 0, !dbg !357
  %79 = load i8*, i8** %key81, align 8, !dbg !357
  %80 = load %struct.kw_t*, %struct.kw_t** %list, align 8, !dbg !358
  %81 = load i64, i64* %i, align 8, !dbg !359
  %add82 = add i64 %81, 1, !dbg !360
  %arrayidx83 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %80, i64 %add82, !dbg !358
  %key84 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx83, i32 0, i32 0, !dbg !361
  %82 = load i8*, i8** %key84, align 8, !dbg !361
  %call85 = call i32 @strcmp(i8* %79, i8* %82) #6, !dbg !362
  %tobool86 = icmp ne i32 %call85, 0, !dbg !362
  br i1 %tobool86, label %if.then87, label %if.end89, !dbg !363

if.then87:                                        ; preds = %land.lhs.true
  %call88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !364
  br label %if.end89, !dbg !364

if.end89:                                         ; preds = %if.then87, %land.lhs.true, %for.body73
  br label %for.inc90, !dbg !365

for.inc90:                                        ; preds = %if.end89
  %83 = load i64, i64* %i, align 8, !dbg !366
  %inc91 = add i64 %83, 1, !dbg !366
  store i64 %inc91, i64* %i, align 8, !dbg !366
  br label %for.cond70, !dbg !367, !llvm.loop !368

for.end92:                                        ; preds = %for.cond70
  %84 = load i32, i32* %fd, align 4, !dbg !370
  %call93 = call i32 @close(i32 %84), !dbg !371
  store i32 0, i32* %retval, align 4, !dbg !372
  br label %return, !dbg !372

return:                                           ; preds = %for.end92, %if.then
  %85 = load i32, i32* %retval, align 4, !dbg !373
  ret i32 %85, !dbg !373
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "anagrams-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Anagrams-2")
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
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!75 = !DILocation(line: 24, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !1, line: 23, column: 21)
!77 = !DILocation(line: 24, column: 11, scope: !76)
!78 = !DILocation(line: 24, column: 7, scope: !76)
!79 = !DILocation(line: 24, column: 22, scope: !76)
!80 = !DILocation(line: 24, column: 24, scope: !76)
!81 = !DILocation(line: 24, column: 15, scope: !76)
!82 = !DILocation(line: 24, column: 17, scope: !76)
!83 = !DILocation(line: 24, column: 20, scope: !76)
!84 = !DILocation(line: 24, column: 35, scope: !76)
!85 = !DILocation(line: 24, column: 28, scope: !76)
!86 = !DILocation(line: 24, column: 30, scope: !76)
!87 = !DILocation(line: 24, column: 33, scope: !76)
!88 = !DILocation(line: 25, column: 4, scope: !76)
!89 = !DILocation(line: 23, column: 18, scope: !69)
!90 = !DILocation(line: 22, column: 34, scope: !64)
!91 = !DILocation(line: 22, column: 3, scope: !64)
!92 = distinct !{!92, !67, !93}
!93 = !DILocation(line: 25, column: 4, scope: !58)
!94 = !DILocation(line: 26, column: 2, scope: !59)
!95 = !DILocation(line: 21, column: 29, scope: !53)
!96 = !DILocation(line: 21, column: 2, scope: !53)
!97 = distinct !{!97, !56, !98}
!98 = !DILocation(line: 26, column: 2, scope: !50)
!99 = !DILocation(line: 27, column: 1, scope: !37)
!100 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !101, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!15}
!103 = !DILocalVariable(name: "s", scope: !100, file: !1, line: 31, type: !104)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !105, line: 46, size: 1152, elements: !106)
!105 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!106 = !{!107, !111, !113, !115, !118, !120, !122, !123, !124, !127, !129, !131, !139, !140, !141}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !104, file: !105, line: 48, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !109, line: 145, baseType: !110)
!109 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!110 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !104, file: !105, line: 53, baseType: !112, size: 64, offset: 64)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !109, line: 148, baseType: !110)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !104, file: !105, line: 61, baseType: !114, size: 64, offset: 128)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !109, line: 151, baseType: !110)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !104, file: !105, line: 62, baseType: !116, size: 32, offset: 192)
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !109, line: 150, baseType: !117)
!117 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !104, file: !105, line: 64, baseType: !119, size: 32, offset: 224)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !109, line: 146, baseType: !117)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !104, file: !105, line: 65, baseType: !121, size: 32, offset: 256)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !109, line: 147, baseType: !117)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !104, file: !105, line: 67, baseType: !15, size: 32, offset: 288)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !104, file: !105, line: 69, baseType: !108, size: 64, offset: 320)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !104, file: !105, line: 74, baseType: !125, size: 64, offset: 384)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !109, line: 152, baseType: !126)
!126 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !104, file: !105, line: 78, baseType: !128, size: 64, offset: 448)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !109, line: 174, baseType: !126)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !104, file: !105, line: 80, baseType: !130, size: 64, offset: 512)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !109, line: 179, baseType: !126)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !104, file: !105, line: 91, baseType: !132, size: 128, offset: 576)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !133, line: 10, size: 128, elements: !134)
!133 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!134 = !{!135, !137}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !132, file: !133, line: 12, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !109, line: 160, baseType: !126)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !132, file: !133, line: 16, baseType: !138, size: 64, offset: 64)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !109, line: 196, baseType: !126)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !104, file: !105, line: 92, baseType: !132, size: 128, offset: 704)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !104, file: !105, line: 93, baseType: !132, size: 128, offset: 832)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !104, file: !105, line: 106, baseType: !142, size: 192, offset: 960)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 192, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 3)
!145 = !DILocation(line: 31, column: 14, scope: !100)
!146 = !DILocalVariable(name: "words", scope: !100, file: !1, line: 32, type: !40)
!147 = !DILocation(line: 32, column: 8, scope: !100)
!148 = !DILocalVariable(name: "keys", scope: !100, file: !1, line: 32, type: !40)
!149 = !DILocation(line: 32, column: 16, scope: !100)
!150 = !DILocalVariable(name: "i", scope: !100, file: !1, line: 33, type: !151)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !152, line: 46, baseType: !110)
!152 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!153 = !DILocation(line: 33, column: 9, scope: !100)
!154 = !DILocalVariable(name: "j", scope: !100, file: !1, line: 33, type: !151)
!155 = !DILocation(line: 33, column: 12, scope: !100)
!156 = !DILocalVariable(name: "k", scope: !100, file: !1, line: 33, type: !151)
!157 = !DILocation(line: 33, column: 15, scope: !100)
!158 = !DILocalVariable(name: "longest", scope: !100, file: !1, line: 33, type: !151)
!159 = !DILocation(line: 33, column: 18, scope: !100)
!160 = !DILocalVariable(name: "offset", scope: !100, file: !1, line: 33, type: !151)
!161 = !DILocation(line: 33, column: 27, scope: !100)
!162 = !DILocalVariable(name: "n_word", scope: !100, file: !1, line: 34, type: !15)
!163 = !DILocation(line: 34, column: 6, scope: !100)
!164 = !DILocalVariable(name: "list", scope: !100, file: !1, line: 35, type: !165)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!166 = !DILocation(line: 35, column: 8, scope: !100)
!167 = !DILocalVariable(name: "fd", scope: !100, file: !1, line: 37, type: !15)
!168 = !DILocation(line: 37, column: 6, scope: !100)
!169 = !DILocation(line: 37, column: 11, scope: !100)
!170 = !DILocation(line: 38, column: 6, scope: !171)
!171 = distinct !DILexicalBlock(scope: !100, file: !1, line: 38, column: 6)
!172 = !DILocation(line: 38, column: 9, scope: !171)
!173 = !DILocation(line: 38, column: 6, scope: !100)
!174 = !DILocation(line: 38, column: 16, scope: !171)
!175 = !DILocation(line: 39, column: 8, scope: !100)
!176 = !DILocation(line: 39, column: 2, scope: !100)
!177 = !DILocation(line: 40, column: 19, scope: !100)
!178 = !DILocation(line: 40, column: 27, scope: !100)
!179 = !DILocation(line: 40, column: 10, scope: !100)
!180 = !DILocation(line: 40, column: 8, scope: !100)
!181 = !DILocation(line: 41, column: 10, scope: !100)
!182 = !DILocation(line: 41, column: 20, scope: !100)
!183 = !DILocation(line: 41, column: 16, scope: !100)
!184 = !DILocation(line: 41, column: 8, scope: !100)
!185 = !DILocation(line: 43, column: 7, scope: !100)
!186 = !DILocation(line: 43, column: 11, scope: !100)
!187 = !DILocation(line: 43, column: 20, scope: !100)
!188 = !DILocation(line: 43, column: 2, scope: !100)
!189 = !DILocation(line: 44, column: 9, scope: !100)
!190 = !DILocation(line: 44, column: 15, scope: !100)
!191 = !DILocation(line: 44, column: 24, scope: !100)
!192 = !DILocation(line: 44, column: 2, scope: !100)
!193 = !DILocation(line: 47, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !100, file: !1, line: 47, column: 2)
!195 = !DILocation(line: 47, column: 9, scope: !194)
!196 = !DILocation(line: 47, column: 7, scope: !194)
!197 = !DILocation(line: 47, column: 18, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !1, line: 47, column: 2)
!199 = !DILocation(line: 47, column: 24, scope: !198)
!200 = !DILocation(line: 47, column: 20, scope: !198)
!201 = !DILocation(line: 47, column: 2, scope: !194)
!202 = !DILocation(line: 48, column: 7, scope: !203)
!203 = distinct !DILexicalBlock(scope: !204, file: !1, line: 48, column: 7)
!204 = distinct !DILexicalBlock(scope: !198, file: !1, line: 47, column: 38)
!205 = !DILocation(line: 48, column: 13, scope: !203)
!206 = !DILocation(line: 48, column: 16, scope: !203)
!207 = !DILocation(line: 48, column: 7, scope: !204)
!208 = !DILocation(line: 49, column: 15, scope: !209)
!209 = distinct !DILexicalBlock(scope: !203, file: !1, line: 48, column: 25)
!210 = !DILocation(line: 49, column: 20, scope: !209)
!211 = !DILocation(line: 49, column: 23, scope: !209)
!212 = !DILocation(line: 49, column: 4, scope: !209)
!213 = !DILocation(line: 49, column: 10, scope: !209)
!214 = !DILocation(line: 49, column: 13, scope: !209)
!215 = !DILocation(line: 50, column: 17, scope: !209)
!216 = !DILocation(line: 50, column: 24, scope: !209)
!217 = !DILocation(line: 50, column: 22, scope: !209)
!218 = !DILocation(line: 50, column: 4, scope: !209)
!219 = !DILocation(line: 51, column: 8, scope: !209)
!220 = !DILocation(line: 51, column: 10, scope: !209)
!221 = !DILocation(line: 51, column: 6, scope: !209)
!222 = !DILocation(line: 52, column: 11, scope: !209)
!223 = !DILocation(line: 53, column: 3, scope: !209)
!224 = !DILocation(line: 54, column: 2, scope: !204)
!225 = !DILocation(line: 47, column: 34, scope: !198)
!226 = !DILocation(line: 47, column: 2, scope: !198)
!227 = distinct !{!227, !201, !228}
!228 = !DILocation(line: 54, column: 2, scope: !194)
!229 = !DILocation(line: 56, column: 16, scope: !100)
!230 = !DILocation(line: 56, column: 9, scope: !100)
!231 = !DILocation(line: 56, column: 7, scope: !100)
!232 = !DILocation(line: 59, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !100, file: !1, line: 59, column: 2)
!234 = !DILocation(line: 59, column: 13, scope: !233)
!235 = !DILocation(line: 59, column: 9, scope: !233)
!236 = !DILocation(line: 59, column: 7, scope: !233)
!237 = !DILocation(line: 59, column: 22, scope: !238)
!238 = distinct !DILexicalBlock(scope: !233, file: !1, line: 59, column: 2)
!239 = !DILocation(line: 59, column: 28, scope: !238)
!240 = !DILocation(line: 59, column: 24, scope: !238)
!241 = !DILocation(line: 59, column: 2, scope: !233)
!242 = !DILocation(line: 60, column: 7, scope: !243)
!243 = distinct !DILexicalBlock(scope: !244, file: !1, line: 60, column: 7)
!244 = distinct !DILexicalBlock(scope: !238, file: !1, line: 59, column: 42)
!245 = !DILocation(line: 60, column: 13, scope: !243)
!246 = !DILocation(line: 60, column: 16, scope: !243)
!247 = !DILocation(line: 60, column: 7, scope: !244)
!248 = !DILocation(line: 61, column: 18, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !1, line: 60, column: 25)
!250 = !DILocation(line: 61, column: 25, scope: !249)
!251 = !DILocation(line: 61, column: 23, scope: !249)
!252 = !DILocation(line: 61, column: 4, scope: !249)
!253 = !DILocation(line: 61, column: 9, scope: !249)
!254 = !DILocation(line: 61, column: 12, scope: !249)
!255 = !DILocation(line: 61, column: 16, scope: !249)
!256 = !DILocation(line: 62, column: 19, scope: !249)
!257 = !DILocation(line: 62, column: 27, scope: !249)
!258 = !DILocation(line: 62, column: 25, scope: !249)
!259 = !DILocation(line: 62, column: 4, scope: !249)
!260 = !DILocation(line: 62, column: 9, scope: !249)
!261 = !DILocation(line: 62, column: 12, scope: !249)
!262 = !DILocation(line: 62, column: 17, scope: !249)
!263 = !DILocation(line: 63, column: 8, scope: !249)
!264 = !DILocation(line: 63, column: 10, scope: !249)
!265 = !DILocation(line: 63, column: 6, scope: !249)
!266 = !DILocation(line: 64, column: 5, scope: !249)
!267 = !DILocation(line: 65, column: 3, scope: !249)
!268 = !DILocation(line: 66, column: 2, scope: !244)
!269 = !DILocation(line: 59, column: 38, scope: !238)
!270 = !DILocation(line: 59, column: 2, scope: !238)
!271 = distinct !{!271, !241, !272}
!272 = !DILocation(line: 66, column: 2, scope: !233)
!273 = !DILocation(line: 68, column: 8, scope: !100)
!274 = !DILocation(line: 68, column: 14, scope: !100)
!275 = !DILocation(line: 68, column: 2, scope: !100)
!276 = !DILocation(line: 71, column: 36, scope: !277)
!277 = distinct !DILexicalBlock(scope: !100, file: !1, line: 71, column: 2)
!278 = !DILocation(line: 71, column: 26, scope: !277)
!279 = !DILocation(line: 71, column: 17, scope: !277)
!280 = !DILocation(line: 71, column: 13, scope: !277)
!281 = !DILocation(line: 71, column: 9, scope: !277)
!282 = !DILocation(line: 71, column: 7, scope: !277)
!283 = !DILocation(line: 71, column: 41, scope: !284)
!284 = distinct !DILexicalBlock(scope: !277, file: !1, line: 71, column: 2)
!285 = !DILocation(line: 71, column: 45, scope: !284)
!286 = !DILocation(line: 71, column: 43, scope: !284)
!287 = !DILocation(line: 71, column: 2, scope: !277)
!288 = !DILocation(line: 72, column: 15, scope: !289)
!289 = distinct !DILexicalBlock(scope: !290, file: !1, line: 72, column: 7)
!290 = distinct !DILexicalBlock(scope: !284, file: !1, line: 71, column: 58)
!291 = !DILocation(line: 72, column: 20, scope: !289)
!292 = !DILocation(line: 72, column: 23, scope: !289)
!293 = !DILocation(line: 72, column: 28, scope: !289)
!294 = !DILocation(line: 72, column: 33, scope: !289)
!295 = !DILocation(line: 72, column: 36, scope: !289)
!296 = !DILocation(line: 72, column: 8, scope: !289)
!297 = !DILocation(line: 72, column: 7, scope: !290)
!298 = !DILocation(line: 73, column: 4, scope: !299)
!299 = distinct !DILexicalBlock(scope: !289, file: !1, line: 72, column: 42)
!300 = !DILocation(line: 74, column: 4, scope: !299)
!301 = !DILocation(line: 78, column: 7, scope: !302)
!302 = distinct !DILexicalBlock(scope: !290, file: !1, line: 78, column: 7)
!303 = !DILocation(line: 78, column: 11, scope: !302)
!304 = !DILocation(line: 78, column: 9, scope: !302)
!305 = !DILocation(line: 78, column: 7, scope: !290)
!306 = !DILocation(line: 79, column: 6, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !1, line: 78, column: 20)
!308 = !DILocation(line: 80, column: 8, scope: !307)
!309 = !DILocation(line: 80, column: 6, scope: !307)
!310 = !DILocation(line: 81, column: 4, scope: !307)
!311 = !DILocation(line: 84, column: 7, scope: !312)
!312 = distinct !DILexicalBlock(scope: !290, file: !1, line: 84, column: 7)
!313 = !DILocation(line: 84, column: 11, scope: !312)
!314 = !DILocation(line: 84, column: 9, scope: !312)
!315 = !DILocation(line: 84, column: 7, scope: !290)
!316 = !DILocation(line: 84, column: 27, scope: !312)
!317 = !DILocation(line: 84, column: 20, scope: !312)
!318 = !DILocation(line: 86, column: 3, scope: !290)
!319 = !DILocation(line: 86, column: 10, scope: !290)
!320 = !DILocation(line: 86, column: 14, scope: !290)
!321 = !DILocation(line: 86, column: 12, scope: !290)
!322 = !DILocation(line: 86, column: 17, scope: !290)
!323 = !DILocation(line: 86, column: 28, scope: !290)
!324 = !DILocation(line: 86, column: 34, scope: !290)
!325 = !DILocation(line: 86, column: 40, scope: !290)
!326 = distinct !{!326, !318, !327}
!327 = !DILocation(line: 86, column: 42, scope: !290)
!328 = !DILocation(line: 87, column: 13, scope: !290)
!329 = !DILocation(line: 87, column: 11, scope: !290)
!330 = !DILocation(line: 88, column: 5, scope: !290)
!331 = !DILocation(line: 89, column: 2, scope: !290)
!332 = !DILocation(line: 71, column: 54, scope: !284)
!333 = !DILocation(line: 71, column: 2, scope: !284)
!334 = distinct !{!334, !287, !335}
!335 = !DILocation(line: 89, column: 2, scope: !277)
!336 = !DILocation(line: 92, column: 9, scope: !337)
!337 = distinct !DILexicalBlock(scope: !100, file: !1, line: 92, column: 2)
!338 = !DILocation(line: 92, column: 7, scope: !337)
!339 = !DILocation(line: 92, column: 14, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !1, line: 92, column: 2)
!341 = !DILocation(line: 92, column: 18, scope: !340)
!342 = !DILocation(line: 92, column: 16, scope: !340)
!343 = !DILocation(line: 92, column: 2, scope: !337)
!344 = !DILocation(line: 93, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !1, line: 92, column: 31)
!346 = !DILocation(line: 93, column: 22, scope: !345)
!347 = !DILocation(line: 93, column: 25, scope: !345)
!348 = !DILocation(line: 93, column: 3, scope: !345)
!349 = !DILocation(line: 94, column: 7, scope: !350)
!350 = distinct !DILexicalBlock(scope: !345, file: !1, line: 94, column: 7)
!351 = !DILocation(line: 94, column: 11, scope: !350)
!352 = !DILocation(line: 94, column: 18, scope: !350)
!353 = !DILocation(line: 94, column: 9, scope: !350)
!354 = !DILocation(line: 94, column: 22, scope: !350)
!355 = !DILocation(line: 94, column: 32, scope: !350)
!356 = !DILocation(line: 94, column: 37, scope: !350)
!357 = !DILocation(line: 94, column: 40, scope: !350)
!358 = !DILocation(line: 94, column: 45, scope: !350)
!359 = !DILocation(line: 94, column: 50, scope: !350)
!360 = !DILocation(line: 94, column: 51, scope: !350)
!361 = !DILocation(line: 94, column: 55, scope: !350)
!362 = !DILocation(line: 94, column: 25, scope: !350)
!363 = !DILocation(line: 94, column: 7, scope: !345)
!364 = !DILocation(line: 95, column: 4, scope: !350)
!365 = !DILocation(line: 96, column: 2, scope: !345)
!366 = !DILocation(line: 92, column: 27, scope: !340)
!367 = !DILocation(line: 92, column: 2, scope: !340)
!368 = distinct !{!368, !343, !369}
!369 = !DILocation(line: 96, column: 2, scope: !337)
!370 = !DILocation(line: 99, column: 8, scope: !100)
!371 = !DILocation(line: 99, column: 2, scope: !100)
!372 = !DILocation(line: 100, column: 2, scope: !100)
!373 = !DILocation(line: 101, column: 1, scope: !100)
