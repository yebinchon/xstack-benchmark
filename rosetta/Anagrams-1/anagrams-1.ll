; ModuleID = 'anagrams-1.ll'
source_filename = "anagrams-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sHashEntry = type { i8*, %struct.sHashEntry*, %struct.sDictWord*, %struct.sHashEntry*, i16 }
%struct.sDictWord = type { i8*, %struct.sDictWord* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@cxmap = internal global [96 x i16] [i16 6, i16 31, i16 77, i16 12, i16 92, i16 40, i16 93, i16 14, i16 9, i16 51, i16 49, i16 86, i16 82, i16 25, i16 41, i16 83, i16 50, i16 72, i16 53, i16 85, i16 94, i16 20, i16 39, i16 36, i16 2, i16 62, i16 24, i16 74, i16 63, i16 76, i16 69, i16 48, i16 8, i16 44, i16 26, i16 3, i16 11, i16 13, i16 79, i16 7, i16 32, i16 29, i16 81, i16 59, i16 17, i16 88, i16 0, i16 73, i16 21, i16 45, i16 65, i16 23, i16 95, i16 57, i16 22, i16 66, i16 55, i16 34, i16 28, i16 15, i16 67, i16 91, i16 70, i16 75, i16 10, i16 38, i16 46, i16 64, i16 18, i16 33, i16 60, i16 54, i16 56, i16 30, i16 1, i16 27, i16 5, i16 78, i16 68, i16 61, i16 4, i16 16, i16 90, i16 42, i16 35, i16 52, i16 37, i16 47, i16 43, i16 80, i16 58, i16 84, i16 71, i16 89, i16 19, i16 87], align 16, !dbg !0
@mostPerms = dso_local global %struct.sHashEntry* null, align 8, !dbg !6
@hashTable = common dso_local global [8192 x %struct.sHashEntry*] zeroinitializer, align 16, !dbg !27
@.str = private unnamed_addr constant [35 x i8] c"%d words in dictionary max ana=%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"unixdict.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"anaout.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%s, \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @sortedWord(i8* %word, i8* %wbuf) #0 !dbg !39 {
entry:
  %word.addr = alloca i8*, align 8
  %wbuf.addr = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  %endwrd = alloca i8*, align 8
  %t = alloca i8, align 1
  %swaps = alloca i32, align 4
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* %wbuf, i8** %wbuf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %wbuf.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8** %p1, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %p2, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i8** %endwrd, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i8* %t, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %swaps, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = load i8*, i8** %wbuf.addr, align 8, !dbg !58
  %1 = load i8*, i8** %word.addr, align 8, !dbg !59
  %call = call i8* @strcpy(i8* %0, i8* %1) #5, !dbg !60
  %2 = load i8*, i8** %wbuf.addr, align 8, !dbg !61
  %3 = load i8*, i8** %wbuf.addr, align 8, !dbg !62
  %call1 = call i64 @strlen(i8* %3) #6, !dbg !63
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %call1, !dbg !64
  store i8* %add.ptr, i8** %endwrd, align 8, !dbg !65
  br label %do.body, !dbg !66

do.body:                                          ; preds = %do.cond, %entry
  store i32 0, i32* %swaps, align 4, !dbg !67
  %4 = load i8*, i8** %wbuf.addr, align 8, !dbg !69
  store i8* %4, i8** %p1, align 8, !dbg !70
  %5 = load i8*, i8** %endwrd, align 8, !dbg !71
  %add.ptr2 = getelementptr inbounds i8, i8* %5, i64 -1, !dbg !72
  store i8* %add.ptr2, i8** %p2, align 8, !dbg !73
  br label %while.cond, !dbg !74

while.cond:                                       ; preds = %if.end, %do.body
  %6 = load i8*, i8** %p1, align 8, !dbg !75
  %7 = load i8*, i8** %p2, align 8, !dbg !76
  %cmp = icmp ult i8* %6, %7, !dbg !77
  br i1 %cmp, label %while.body, label %while.end, !dbg !74

while.body:                                       ; preds = %while.cond
  %8 = load i8*, i8** %p2, align 8, !dbg !78
  %9 = load i8, i8* %8, align 1, !dbg !81
  %conv = sext i8 %9 to i32, !dbg !81
  %10 = load i8*, i8** %p1, align 8, !dbg !82
  %11 = load i8, i8* %10, align 1, !dbg !83
  %conv3 = sext i8 %11 to i32, !dbg !83
  %cmp4 = icmp sgt i32 %conv, %conv3, !dbg !84
  br i1 %cmp4, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %while.body
  %12 = load i8*, i8** %p2, align 8, !dbg !86
  %13 = load i8, i8* %12, align 1, !dbg !88
  store i8 %13, i8* %t, align 1, !dbg !89
  %14 = load i8*, i8** %p1, align 8, !dbg !90
  %15 = load i8, i8* %14, align 1, !dbg !91
  %16 = load i8*, i8** %p2, align 8, !dbg !92
  store i8 %15, i8* %16, align 1, !dbg !93
  %17 = load i8, i8* %t, align 1, !dbg !94
  %18 = load i8*, i8** %p1, align 8, !dbg !95
  store i8 %17, i8* %18, align 1, !dbg !96
  store i32 1, i32* %swaps, align 4, !dbg !97
  br label %if.end, !dbg !98

if.end:                                           ; preds = %if.then, %while.body
  %19 = load i8*, i8** %p1, align 8, !dbg !99
  %incdec.ptr = getelementptr inbounds i8, i8* %19, i32 1, !dbg !99
  store i8* %incdec.ptr, i8** %p1, align 8, !dbg !99
  %20 = load i8*, i8** %p2, align 8, !dbg !100
  %incdec.ptr6 = getelementptr inbounds i8, i8* %20, i32 -1, !dbg !100
  store i8* %incdec.ptr6, i8** %p2, align 8, !dbg !100
  br label %while.cond, !dbg !74, !llvm.loop !101

while.end:                                        ; preds = %while.cond
  %21 = load i8*, i8** %wbuf.addr, align 8, !dbg !103
  store i8* %21, i8** %p1, align 8, !dbg !104
  %22 = load i8*, i8** %p1, align 8, !dbg !105
  %add.ptr7 = getelementptr inbounds i8, i8* %22, i64 1, !dbg !106
  store i8* %add.ptr7, i8** %p2, align 8, !dbg !107
  br label %while.cond8, !dbg !108

while.cond8:                                      ; preds = %if.end17, %while.end
  %23 = load i8*, i8** %p2, align 8, !dbg !109
  %24 = load i8*, i8** %endwrd, align 8, !dbg !110
  %cmp9 = icmp ult i8* %23, %24, !dbg !111
  br i1 %cmp9, label %while.body11, label %while.end20, !dbg !108

while.body11:                                     ; preds = %while.cond8
  %25 = load i8*, i8** %p2, align 8, !dbg !112
  %26 = load i8, i8* %25, align 1, !dbg !115
  %conv12 = sext i8 %26 to i32, !dbg !115
  %27 = load i8*, i8** %p1, align 8, !dbg !116
  %28 = load i8, i8* %27, align 1, !dbg !117
  %conv13 = sext i8 %28 to i32, !dbg !117
  %cmp14 = icmp sgt i32 %conv12, %conv13, !dbg !118
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !119

if.then16:                                        ; preds = %while.body11
  %29 = load i8*, i8** %p2, align 8, !dbg !120
  %30 = load i8, i8* %29, align 1, !dbg !122
  store i8 %30, i8* %t, align 1, !dbg !123
  %31 = load i8*, i8** %p1, align 8, !dbg !124
  %32 = load i8, i8* %31, align 1, !dbg !125
  %33 = load i8*, i8** %p2, align 8, !dbg !126
  store i8 %32, i8* %33, align 1, !dbg !127
  %34 = load i8, i8* %t, align 1, !dbg !128
  %35 = load i8*, i8** %p1, align 8, !dbg !129
  store i8 %34, i8* %35, align 1, !dbg !130
  store i32 1, i32* %swaps, align 4, !dbg !131
  br label %if.end17, !dbg !132

if.end17:                                         ; preds = %if.then16, %while.body11
  %36 = load i8*, i8** %p1, align 8, !dbg !133
  %incdec.ptr18 = getelementptr inbounds i8, i8* %36, i32 1, !dbg !133
  store i8* %incdec.ptr18, i8** %p1, align 8, !dbg !133
  %37 = load i8*, i8** %p2, align 8, !dbg !134
  %incdec.ptr19 = getelementptr inbounds i8, i8* %37, i32 1, !dbg !134
  store i8* %incdec.ptr19, i8** %p2, align 8, !dbg !134
  br label %while.cond8, !dbg !108, !llvm.loop !135

while.end20:                                      ; preds = %while.cond8
  br label %do.cond, !dbg !137

do.cond:                                          ; preds = %while.end20
  %38 = load i32, i32* %swaps, align 4, !dbg !138
  %tobool = icmp ne i32 %38, 0, !dbg !137
  br i1 %tobool, label %do.body, label %do.end, !dbg !137, !llvm.loop !139

do.end:                                           ; preds = %do.cond
  %39 = load i8*, i8** %wbuf.addr, align 8, !dbg !141
  ret i8* %39, !dbg !142
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Str_Hash(i8* %key, i32 %ix_max) #0 !dbg !143 {
entry:
  %key.addr = alloca i8*, align 8
  %ix_max.addr = alloca i32, align 4
  %cp = alloca i8*, align 8
  %mash = alloca i16, align 2
  %hash = alloca i32, align 4
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 %ix_max, i32* %ix_max.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ix_max.addr, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i8** %cp, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i16* %mash, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %hash, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 33501551, i32* %hash, align 4, !dbg !155
  %0 = load i8*, i8** %key.addr, align 8, !dbg !156
  store i8* %0, i8** %cp, align 8, !dbg !158
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %cp, align 8, !dbg !160
  %2 = load i8, i8* %1, align 1, !dbg !162
  %tobool = icmp ne i8 %2, 0, !dbg !163
  br i1 %tobool, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %cp, align 8, !dbg !164
  %4 = load i8, i8* %3, align 1, !dbg !166
  %conv = sext i8 %4 to i64, !dbg !166
  %rem = urem i64 %conv, 96, !dbg !167
  %arrayidx = getelementptr inbounds [96 x i16], [96 x i16]* @cxmap, i64 0, i64 %rem, !dbg !168
  %5 = load i16, i16* %arrayidx, align 2, !dbg !168
  store i16 %5, i16* %mash, align 2, !dbg !169
  %6 = load i32, i32* %hash, align 4, !dbg !170
  %shr = ashr i32 %6, 4, !dbg !171
  %xor = xor i32 %shr, 96849756, !dbg !172
  %7 = load i32, i32* %hash, align 4, !dbg !173
  %shl = shl i32 %7, 1, !dbg !174
  %8 = load i16, i16* %mash, align 2, !dbg !175
  %conv1 = sext i16 %8 to i32, !dbg !175
  %shl2 = shl i32 %conv1, 5, !dbg !176
  %add = add nsw i32 %shl, %shl2, !dbg !177
  %xor3 = xor i32 %xor, %add, !dbg !178
  store i32 %xor3, i32* %hash, align 4, !dbg !179
  %9 = load i32, i32* %hash, align 4, !dbg !180
  %and = and i32 %9, 1073741823, !dbg !180
  store i32 %and, i32* %hash, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %10 = load i8*, i8** %cp, align 8, !dbg !182
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1, !dbg !182
  store i8* %incdec.ptr, i8** %cp, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %hash, align 4, !dbg !186
  %12 = load i32, i32* %ix_max.addr, align 4, !dbg !187
  %rem4 = srem i32 %11, %12, !dbg !188
  ret i32 %rem4, !dbg !189
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @buildAnagrams(%struct._IO_FILE* %fin) #0 !dbg !190 {
entry:
  %fin.addr = alloca %struct._IO_FILE*, align 8
  %buffer = alloca [40 x i8], align 16
  %bufr2 = alloca [40 x i8], align 16
  %hkey = alloca i8*, align 8
  %hix = alloca i32, align 4
  %he = alloca %struct.sHashEntry*, align 8
  %hep = alloca %struct.sHashEntry**, align 8
  %we = alloca %struct.sDictWord*, align 8
  %maxPC = alloca i32, align 4
  %numWords = alloca i32, align 4
  store %struct._IO_FILE* %fin, %struct._IO_FILE** %fin.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fin.addr, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata [40 x i8]* %buffer, metadata !255, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata [40 x i8]* %bufr2, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i8** %hkey, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %hix, metadata !264, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata %struct.sHashEntry** %he, metadata !266, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata %struct.sHashEntry*** %hep, metadata !268, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata %struct.sDictWord** %we, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata i32* %maxPC, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 2, i32* %maxPC, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %numWords, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 0, i32* %numWords, align 4, !dbg !276
  br label %while.cond, !dbg !277

while.cond:                                       ; preds = %if.end46, %entry
  %arraydecay = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !278
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fin.addr, align 8, !dbg !279
  %call = call i8* @fgets(i8* %arraydecay, i32 40, %struct._IO_FILE* %0), !dbg !280
  %tobool = icmp ne i8* %call, null, !dbg !277
  br i1 %tobool, label %while.body, label %while.end48, !dbg !277

while.body:                                       ; preds = %while.cond
  %arraydecay1 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !281
  store i8* %arraydecay1, i8** %hkey, align 8, !dbg !284
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %while.body
  %1 = load i8*, i8** %hkey, align 8, !dbg !286
  %2 = load i8, i8* %1, align 1, !dbg !288
  %conv = sext i8 %2 to i32, !dbg !288
  %tobool2 = icmp ne i32 %conv, 0, !dbg !288
  br i1 %tobool2, label %land.rhs, label %land.end, !dbg !289

land.rhs:                                         ; preds = %for.cond
  %3 = load i8*, i8** %hkey, align 8, !dbg !290
  %4 = load i8, i8* %3, align 1, !dbg !291
  %conv3 = sext i8 %4 to i32, !dbg !291
  %cmp = icmp ne i32 %conv3, 10, !dbg !292
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !293
  br i1 %5, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !294

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %hkey, align 8, !dbg !295
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !295
  store i8* %incdec.ptr, i8** %hkey, align 8, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %land.end
  %7 = load i8*, i8** %hkey, align 8, !dbg !299
  store i8 0, i8* %7, align 1, !dbg !300
  %arraydecay5 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !301
  %arraydecay6 = getelementptr inbounds [40 x i8], [40 x i8]* %bufr2, i64 0, i64 0, !dbg !302
  %call7 = call i8* @sortedWord(i8* %arraydecay5, i8* %arraydecay6), !dbg !303
  store i8* %call7, i8** %hkey, align 8, !dbg !304
  %8 = load i8*, i8** %hkey, align 8, !dbg !305
  %call8 = call i32 @Str_Hash(i8* %8, i32 8192), !dbg !306
  store i32 %call8, i32* %hix, align 4, !dbg !307
  %9 = load i32, i32* %hix, align 4, !dbg !308
  %idxprom = sext i32 %9 to i64, !dbg !309
  %arrayidx = getelementptr inbounds [8192 x %struct.sHashEntry*], [8192 x %struct.sHashEntry*]* @hashTable, i64 0, i64 %idxprom, !dbg !309
  %10 = load %struct.sHashEntry*, %struct.sHashEntry** %arrayidx, align 8, !dbg !309
  store %struct.sHashEntry* %10, %struct.sHashEntry** %he, align 8, !dbg !310
  %11 = load i32, i32* %hix, align 4, !dbg !311
  %idxprom9 = sext i32 %11 to i64, !dbg !312
  %arrayidx10 = getelementptr inbounds [8192 x %struct.sHashEntry*], [8192 x %struct.sHashEntry*]* @hashTable, i64 0, i64 %idxprom9, !dbg !312
  store %struct.sHashEntry** %arrayidx10, %struct.sHashEntry*** %hep, align 8, !dbg !313
  br label %while.cond11, !dbg !314

while.cond11:                                     ; preds = %while.body17, %for.end
  %12 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !315
  %tobool12 = icmp ne %struct.sHashEntry* %12, null, !dbg !315
  br i1 %tobool12, label %land.rhs13, label %land.end16, !dbg !316

land.rhs13:                                       ; preds = %while.cond11
  %13 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !317
  %key = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %13, i32 0, i32 0, !dbg !318
  %14 = load i8*, i8** %key, align 8, !dbg !318
  %15 = load i8*, i8** %hkey, align 8, !dbg !319
  %call14 = call i32 @strcmp(i8* %14, i8* %15) #6, !dbg !320
  %tobool15 = icmp ne i32 %call14, 0, !dbg !316
  br label %land.end16

land.end16:                                       ; preds = %land.rhs13, %while.cond11
  %16 = phi i1 [ false, %while.cond11 ], [ %tobool15, %land.rhs13 ], !dbg !321
  br i1 %16, label %while.body17, label %while.end, !dbg !314

while.body17:                                     ; preds = %land.end16
  %17 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !322
  %next = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %17, i32 0, i32 1, !dbg !324
  store %struct.sHashEntry** %next, %struct.sHashEntry*** %hep, align 8, !dbg !325
  %18 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !326
  %next18 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %18, i32 0, i32 1, !dbg !327
  %19 = load %struct.sHashEntry*, %struct.sHashEntry** %next18, align 8, !dbg !327
  store %struct.sHashEntry* %19, %struct.sHashEntry** %he, align 8, !dbg !328
  br label %while.cond11, !dbg !314, !llvm.loop !329

while.end:                                        ; preds = %land.end16
  %20 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !331
  %tobool19 = icmp ne %struct.sHashEntry* %20, null, !dbg !331
  br i1 %tobool19, label %if.end, label %if.then, !dbg !333

if.then:                                          ; preds = %while.end
  %call20 = call noalias i8* @malloc(i64 40) #5, !dbg !334
  %21 = bitcast i8* %call20 to %struct.sHashEntry*, !dbg !334
  store %struct.sHashEntry* %21, %struct.sHashEntry** %he, align 8, !dbg !336
  %22 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !337
  %next21 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %22, i32 0, i32 1, !dbg !338
  store %struct.sHashEntry* null, %struct.sHashEntry** %next21, align 8, !dbg !339
  %23 = load i8*, i8** %hkey, align 8, !dbg !340
  %call22 = call noalias i8* @strdup(i8* %23) #5, !dbg !341
  %24 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !342
  %key23 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %24, i32 0, i32 0, !dbg !343
  store i8* %call22, i8** %key23, align 8, !dbg !344
  %25 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !345
  %wordCount = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %25, i32 0, i32 4, !dbg !346
  store i16 0, i16* %wordCount, align 8, !dbg !347
  %26 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !348
  %words = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %26, i32 0, i32 2, !dbg !349
  store %struct.sDictWord* null, %struct.sDictWord** %words, align 8, !dbg !350
  %27 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !351
  %link = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %27, i32 0, i32 3, !dbg !352
  store %struct.sHashEntry* null, %struct.sHashEntry** %link, align 8, !dbg !353
  %28 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !354
  %29 = load %struct.sHashEntry**, %struct.sHashEntry*** %hep, align 8, !dbg !355
  store %struct.sHashEntry* %28, %struct.sHashEntry** %29, align 8, !dbg !356
  br label %if.end, !dbg !357

if.end:                                           ; preds = %if.then, %while.end
  %call24 = call noalias i8* @malloc(i64 16) #5, !dbg !358
  %30 = bitcast i8* %call24 to %struct.sDictWord*, !dbg !358
  store %struct.sDictWord* %30, %struct.sDictWord** %we, align 8, !dbg !359
  %arraydecay25 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !360
  %call26 = call noalias i8* @strdup(i8* %arraydecay25) #5, !dbg !361
  %31 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !362
  %word = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %31, i32 0, i32 0, !dbg !363
  store i8* %call26, i8** %word, align 8, !dbg !364
  %32 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !365
  %words27 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %32, i32 0, i32 2, !dbg !366
  %33 = load %struct.sDictWord*, %struct.sDictWord** %words27, align 8, !dbg !366
  %34 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !367
  %next28 = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %34, i32 0, i32 1, !dbg !368
  store %struct.sDictWord* %33, %struct.sDictWord** %next28, align 8, !dbg !369
  %35 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !370
  %36 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !371
  %words29 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %36, i32 0, i32 2, !dbg !372
  store %struct.sDictWord* %35, %struct.sDictWord** %words29, align 8, !dbg !373
  %37 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !374
  %wordCount30 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %37, i32 0, i32 4, !dbg !375
  %38 = load i16, i16* %wordCount30, align 8, !dbg !376
  %inc = add i16 %38, 1, !dbg !376
  store i16 %inc, i16* %wordCount30, align 8, !dbg !376
  %39 = load i32, i32* %maxPC, align 4, !dbg !377
  %40 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !379
  %wordCount31 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %40, i32 0, i32 4, !dbg !380
  %41 = load i16, i16* %wordCount31, align 8, !dbg !380
  %conv32 = sext i16 %41 to i32, !dbg !379
  %cmp33 = icmp slt i32 %39, %conv32, !dbg !381
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !382

if.then35:                                        ; preds = %if.end
  %42 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !383
  %wordCount36 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %42, i32 0, i32 4, !dbg !385
  %43 = load i16, i16* %wordCount36, align 8, !dbg !385
  %conv37 = sext i16 %43 to i32, !dbg !383
  store i32 %conv37, i32* %maxPC, align 4, !dbg !386
  %44 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !387
  store %struct.sHashEntry* %44, %struct.sHashEntry** @mostPerms, align 8, !dbg !388
  %45 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !389
  %link38 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %45, i32 0, i32 3, !dbg !390
  store %struct.sHashEntry* null, %struct.sHashEntry** %link38, align 8, !dbg !391
  br label %if.end46, !dbg !392

if.else:                                          ; preds = %if.end
  %46 = load i32, i32* %maxPC, align 4, !dbg !393
  %47 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !395
  %wordCount39 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %47, i32 0, i32 4, !dbg !396
  %48 = load i16, i16* %wordCount39, align 8, !dbg !396
  %conv40 = sext i16 %48 to i32, !dbg !395
  %cmp41 = icmp eq i32 %46, %conv40, !dbg !397
  br i1 %cmp41, label %if.then43, label %if.end45, !dbg !398

if.then43:                                        ; preds = %if.else
  %49 = load %struct.sHashEntry*, %struct.sHashEntry** @mostPerms, align 8, !dbg !399
  %50 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !401
  %link44 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %50, i32 0, i32 3, !dbg !402
  store %struct.sHashEntry* %49, %struct.sHashEntry** %link44, align 8, !dbg !403
  %51 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !404
  store %struct.sHashEntry* %51, %struct.sHashEntry** @mostPerms, align 8, !dbg !405
  br label %if.end45, !dbg !406

if.end45:                                         ; preds = %if.then43, %if.else
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then35
  %52 = load i32, i32* %numWords, align 4, !dbg !407
  %inc47 = add nsw i32 %52, 1, !dbg !407
  store i32 %inc47, i32* %numWords, align 4, !dbg !407
  br label %while.cond, !dbg !277, !llvm.loop !408

while.end48:                                      ; preds = %while.cond
  %53 = load i32, i32* %numWords, align 4, !dbg !410
  %54 = load i32, i32* %maxPC, align 4, !dbg !411
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %53, i32 %54), !dbg !412
  %55 = load i32, i32* %maxPC, align 4, !dbg !413
  ret i32 %55, !dbg !414
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #2

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !415 {
entry:
  %retval = alloca i32, align 4
  %he = alloca %struct.sHashEntry*, align 8
  %we = alloca %struct.sDictWord*, align 8
  %f1 = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.sHashEntry** %he, metadata !418, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata %struct.sDictWord** %we, metadata !420, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %f1, metadata !422, metadata !DIExpression()), !dbg !423
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !424
  store %struct._IO_FILE* %call, %struct._IO_FILE** %f1, align 8, !dbg !425
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !426
  %call1 = call i32 @buildAnagrams(%struct._IO_FILE* %0), !dbg !427
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !428
  %call2 = call i32 @fclose(%struct._IO_FILE* %1), !dbg !429
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !430
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %f1, align 8, !dbg !431
  %2 = load %struct.sHashEntry*, %struct.sHashEntry** @mostPerms, align 8, !dbg !432
  store %struct.sHashEntry* %2, %struct.sHashEntry** %he, align 8, !dbg !434
  br label %for.cond, !dbg !435

for.cond:                                         ; preds = %for.inc10, %entry
  %3 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !436
  %tobool = icmp ne %struct.sHashEntry* %3, null, !dbg !438
  br i1 %tobool, label %for.body, label %for.end11, !dbg !438

for.body:                                         ; preds = %for.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !439
  %5 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !441
  %wordCount = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %5, i32 0, i32 4, !dbg !442
  %6 = load i16, i16* %wordCount, align 8, !dbg !442
  %conv = sext i16 %6 to i32, !dbg !441
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %conv), !dbg !443
  %7 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !444
  %words = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 2, !dbg !446
  %8 = load %struct.sDictWord*, %struct.sDictWord** %words, align 8, !dbg !446
  store %struct.sDictWord* %8, %struct.sDictWord** %we, align 8, !dbg !447
  br label %for.cond5, !dbg !448

for.cond5:                                        ; preds = %for.inc, %for.body
  %9 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !449
  %tobool6 = icmp ne %struct.sDictWord* %9, null, !dbg !451
  br i1 %tobool6, label %for.body7, label %for.end, !dbg !451

for.body7:                                        ; preds = %for.cond5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !452
  %11 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !454
  %word = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %11, i32 0, i32 0, !dbg !455
  %12 = load i8*, i8** %word, align 8, !dbg !455
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i8* %12), !dbg !456
  br label %for.inc, !dbg !457

for.inc:                                          ; preds = %for.body7
  %13 = load %struct.sDictWord*, %struct.sDictWord** %we, align 8, !dbg !458
  %next = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %13, i32 0, i32 1, !dbg !459
  %14 = load %struct.sDictWord*, %struct.sDictWord** %next, align 8, !dbg !459
  store %struct.sDictWord* %14, %struct.sDictWord** %we, align 8, !dbg !460
  br label %for.cond5, !dbg !461, !llvm.loop !462

for.end:                                          ; preds = %for.cond5
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !464
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !465
  br label %for.inc10, !dbg !466

for.inc10:                                        ; preds = %for.end
  %16 = load %struct.sHashEntry*, %struct.sHashEntry** %he, align 8, !dbg !467
  %link = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %16, i32 0, i32 3, !dbg !468
  %17 = load %struct.sHashEntry*, %struct.sHashEntry** %link, align 8, !dbg !468
  store %struct.sHashEntry* %17, %struct.sHashEntry** %he, align 8, !dbg !469
  br label %for.cond, !dbg !470, !llvm.loop !471

for.end11:                                        ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %f1, align 8, !dbg !473
  %call12 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !474
  ret i32 0, !dbg !475
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #4

declare dso_local i32 @fclose(%struct._IO_FILE*) #4

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cxmap", scope: !2, file: !3, line: 38, type: !32, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "anagrams-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Anagrams-1")
!4 = !{}
!5 = !{!6, !27, !0}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "mostPerms", scope: !2, file: !3, line: 83, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "HashEntry", file: !3, line: 70, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sHashEntry", file: !3, line: 71, size: 320, elements: !11)
!11 = !{!12, !16, !17, !24, !25}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !10, file: !3, line: 72, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !10, file: !3, line: 73, baseType: !8, size: 64, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "words", scope: !10, file: !3, line: 74, baseType: !18, size: 64, offset: 128)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "DictWord", file: !3, line: 64, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sDictWord", file: !3, line: 65, size: 128, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "word", scope: !20, file: !3, line: 66, baseType: !13, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !20, file: !3, line: 67, baseType: !18, size: 64, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "link", scope: !10, file: !3, line: 75, baseType: !8, size: 64, offset: 192)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "wordCount", scope: !10, file: !3, line: 76, baseType: !26, size: 16, offset: 256)
!26 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "hashTable", scope: !2, file: !3, line: 81, type: !29, isLocal: false, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 524288, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 8192)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 1536, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 96)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!39 = distinct !DISubprogram(name: "sortedWord", scope: !3, file: !3, line: 7, type: !40, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !13, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!43 = !DILocalVariable(name: "word", arg: 1, scope: !39, file: !3, line: 7, type: !13)
!44 = !DILocation(line: 7, column: 30, scope: !39)
!45 = !DILocalVariable(name: "wbuf", arg: 2, scope: !39, file: !3, line: 7, type: !42)
!46 = !DILocation(line: 7, column: 42, scope: !39)
!47 = !DILocalVariable(name: "p1", scope: !39, file: !3, line: 9, type: !42)
!48 = !DILocation(line: 9, column: 11, scope: !39)
!49 = !DILocalVariable(name: "p2", scope: !39, file: !3, line: 9, type: !42)
!50 = !DILocation(line: 9, column: 16, scope: !39)
!51 = !DILocalVariable(name: "endwrd", scope: !39, file: !3, line: 9, type: !42)
!52 = !DILocation(line: 9, column: 21, scope: !39)
!53 = !DILocalVariable(name: "t", scope: !39, file: !3, line: 10, type: !15)
!54 = !DILocation(line: 10, column: 10, scope: !39)
!55 = !DILocalVariable(name: "swaps", scope: !39, file: !3, line: 11, type: !56)
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DILocation(line: 11, column: 9, scope: !39)
!58 = !DILocation(line: 13, column: 12, scope: !39)
!59 = !DILocation(line: 13, column: 18, scope: !39)
!60 = !DILocation(line: 13, column: 5, scope: !39)
!61 = !DILocation(line: 14, column: 14, scope: !39)
!62 = !DILocation(line: 14, column: 26, scope: !39)
!63 = !DILocation(line: 14, column: 19, scope: !39)
!64 = !DILocation(line: 14, column: 18, scope: !39)
!65 = !DILocation(line: 14, column: 12, scope: !39)
!66 = !DILocation(line: 15, column: 5, scope: !39)
!67 = !DILocation(line: 16, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !39, file: !3, line: 15, column: 8)
!69 = !DILocation(line: 17, column: 13, scope: !68)
!70 = !DILocation(line: 17, column: 11, scope: !68)
!71 = !DILocation(line: 17, column: 24, scope: !68)
!72 = !DILocation(line: 17, column: 30, scope: !68)
!73 = !DILocation(line: 17, column: 22, scope: !68)
!74 = !DILocation(line: 18, column: 8, scope: !68)
!75 = !DILocation(line: 18, column: 15, scope: !68)
!76 = !DILocation(line: 18, column: 18, scope: !68)
!77 = !DILocation(line: 18, column: 17, scope: !68)
!78 = !DILocation(line: 19, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 19, column: 15)
!80 = distinct !DILexicalBlock(scope: !68, file: !3, line: 18, column: 22)
!81 = !DILocation(line: 19, column: 15, scope: !79)
!82 = !DILocation(line: 19, column: 22, scope: !79)
!83 = !DILocation(line: 19, column: 21, scope: !79)
!84 = !DILocation(line: 19, column: 19, scope: !79)
!85 = !DILocation(line: 19, column: 15, scope: !80)
!86 = !DILocation(line: 20, column: 19, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !3, line: 19, column: 26)
!88 = !DILocation(line: 20, column: 18, scope: !87)
!89 = !DILocation(line: 20, column: 16, scope: !87)
!90 = !DILocation(line: 20, column: 30, scope: !87)
!91 = !DILocation(line: 20, column: 29, scope: !87)
!92 = !DILocation(line: 20, column: 24, scope: !87)
!93 = !DILocation(line: 20, column: 27, scope: !87)
!94 = !DILocation(line: 20, column: 40, scope: !87)
!95 = !DILocation(line: 20, column: 35, scope: !87)
!96 = !DILocation(line: 20, column: 38, scope: !87)
!97 = !DILocation(line: 21, column: 20, scope: !87)
!98 = !DILocation(line: 22, column: 11, scope: !87)
!99 = !DILocation(line: 23, column: 13, scope: !80)
!100 = !DILocation(line: 23, column: 19, scope: !80)
!101 = distinct !{!101, !74, !102}
!102 = !DILocation(line: 24, column: 8, scope: !68)
!103 = !DILocation(line: 25, column: 13, scope: !68)
!104 = !DILocation(line: 25, column: 11, scope: !68)
!105 = !DILocation(line: 25, column: 24, scope: !68)
!106 = !DILocation(line: 25, column: 26, scope: !68)
!107 = !DILocation(line: 25, column: 22, scope: !68)
!108 = !DILocation(line: 26, column: 8, scope: !68)
!109 = !DILocation(line: 26, column: 14, scope: !68)
!110 = !DILocation(line: 26, column: 19, scope: !68)
!111 = !DILocation(line: 26, column: 17, scope: !68)
!112 = !DILocation(line: 27, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !114, file: !3, line: 27, column: 16)
!114 = distinct !DILexicalBlock(scope: !68, file: !3, line: 26, column: 27)
!115 = !DILocation(line: 27, column: 16, scope: !113)
!116 = !DILocation(line: 27, column: 23, scope: !113)
!117 = !DILocation(line: 27, column: 22, scope: !113)
!118 = !DILocation(line: 27, column: 20, scope: !113)
!119 = !DILocation(line: 27, column: 16, scope: !114)
!120 = !DILocation(line: 28, column: 19, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !3, line: 27, column: 27)
!122 = !DILocation(line: 28, column: 18, scope: !121)
!123 = !DILocation(line: 28, column: 16, scope: !121)
!124 = !DILocation(line: 28, column: 30, scope: !121)
!125 = !DILocation(line: 28, column: 29, scope: !121)
!126 = !DILocation(line: 28, column: 24, scope: !121)
!127 = !DILocation(line: 28, column: 27, scope: !121)
!128 = !DILocation(line: 28, column: 40, scope: !121)
!129 = !DILocation(line: 28, column: 35, scope: !121)
!130 = !DILocation(line: 28, column: 38, scope: !121)
!131 = !DILocation(line: 29, column: 20, scope: !121)
!132 = !DILocation(line: 30, column: 12, scope: !121)
!133 = !DILocation(line: 31, column: 14, scope: !114)
!134 = !DILocation(line: 31, column: 20, scope: !114)
!135 = distinct !{!135, !108, !136}
!136 = !DILocation(line: 32, column: 8, scope: !68)
!137 = !DILocation(line: 33, column: 5, scope: !68)
!138 = !DILocation(line: 33, column: 14, scope: !39)
!139 = distinct !{!139, !66, !140}
!140 = !DILocation(line: 33, column: 19, scope: !39)
!141 = !DILocation(line: 34, column: 12, scope: !39)
!142 = !DILocation(line: 34, column: 5, scope: !39)
!143 = distinct !DISubprogram(name: "Str_Hash", scope: !3, file: !3, line: 51, type: !144, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!144 = !DISubroutineType(types: !145)
!145 = !{!56, !13, !56}
!146 = !DILocalVariable(name: "key", arg: 1, scope: !143, file: !3, line: 51, type: !13)
!147 = !DILocation(line: 51, column: 27, scope: !143)
!148 = !DILocalVariable(name: "ix_max", arg: 2, scope: !143, file: !3, line: 51, type: !56)
!149 = !DILocation(line: 51, column: 36, scope: !143)
!150 = !DILocalVariable(name: "cp", scope: !143, file: !3, line: 53, type: !13)
!151 = !DILocation(line: 53, column: 16, scope: !143)
!152 = !DILocalVariable(name: "mash", scope: !143, file: !3, line: 54, type: !26)
!153 = !DILocation(line: 54, column: 10, scope: !143)
!154 = !DILocalVariable(name: "hash", scope: !143, file: !3, line: 55, type: !56)
!155 = !DILocation(line: 55, column: 9, scope: !143)
!156 = !DILocation(line: 56, column: 14, scope: !157)
!157 = distinct !DILexicalBlock(scope: !143, file: !3, line: 56, column: 4)
!158 = !DILocation(line: 56, column: 12, scope: !157)
!159 = !DILocation(line: 56, column: 9, scope: !157)
!160 = !DILocation(line: 56, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 56, column: 4)
!162 = !DILocation(line: 56, column: 19, scope: !161)
!163 = !DILocation(line: 56, column: 4, scope: !157)
!164 = !DILocation(line: 57, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !3, line: 56, column: 30)
!166 = !DILocation(line: 57, column: 20, scope: !165)
!167 = !DILocation(line: 57, column: 24, scope: !165)
!168 = !DILocation(line: 57, column: 14, scope: !165)
!169 = !DILocation(line: 57, column: 12, scope: !165)
!170 = !DILocation(line: 58, column: 15, scope: !165)
!171 = !DILocation(line: 58, column: 20, scope: !165)
!172 = !DILocation(line: 58, column: 25, scope: !165)
!173 = !DILocation(line: 58, column: 41, scope: !165)
!174 = !DILocation(line: 58, column: 45, scope: !165)
!175 = !DILocation(line: 58, column: 53, scope: !165)
!176 = !DILocation(line: 58, column: 57, scope: !165)
!177 = !DILocation(line: 58, column: 50, scope: !165)
!178 = !DILocation(line: 58, column: 37, scope: !165)
!179 = !DILocation(line: 58, column: 12, scope: !165)
!180 = !DILocation(line: 59, column: 12, scope: !165)
!181 = !DILocation(line: 60, column: 7, scope: !165)
!182 = !DILocation(line: 56, column: 26, scope: !161)
!183 = !DILocation(line: 56, column: 4, scope: !161)
!184 = distinct !{!184, !163, !185}
!185 = !DILocation(line: 60, column: 7, scope: !157)
!186 = !DILocation(line: 61, column: 12, scope: !143)
!187 = !DILocation(line: 61, column: 19, scope: !143)
!188 = !DILocation(line: 61, column: 17, scope: !143)
!189 = !DILocation(line: 61, column: 4, scope: !143)
!190 = distinct !DISubprogram(name: "buildAnagrams", scope: !3, file: !3, line: 85, type: !191, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!191 = !DISubroutineType(types: !192)
!192 = !{!56, !193}
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !195, line: 7, baseType: !196)
!195 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !197, line: 49, size: 1728, elements: !198)
!197 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!198 = !{!199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !214, !216, !217, !218, !222, !224, !226, !230, !233, !235, !238, !241, !242, !244, !248, !249}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !196, file: !197, line: 51, baseType: !56, size: 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !196, file: !197, line: 54, baseType: !42, size: 64, offset: 64)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !196, file: !197, line: 55, baseType: !42, size: 64, offset: 128)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !196, file: !197, line: 56, baseType: !42, size: 64, offset: 192)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !196, file: !197, line: 57, baseType: !42, size: 64, offset: 256)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !196, file: !197, line: 58, baseType: !42, size: 64, offset: 320)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !196, file: !197, line: 59, baseType: !42, size: 64, offset: 384)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !196, file: !197, line: 60, baseType: !42, size: 64, offset: 448)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !196, file: !197, line: 61, baseType: !42, size: 64, offset: 512)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !196, file: !197, line: 64, baseType: !42, size: 64, offset: 576)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !196, file: !197, line: 65, baseType: !42, size: 64, offset: 640)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !196, file: !197, line: 66, baseType: !42, size: 64, offset: 704)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !196, file: !197, line: 68, baseType: !212, size: 64, offset: 768)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !197, line: 36, flags: DIFlagFwdDecl)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !196, file: !197, line: 70, baseType: !215, size: 64, offset: 832)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !196, file: !197, line: 72, baseType: !56, size: 32, offset: 896)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !196, file: !197, line: 73, baseType: !56, size: 32, offset: 928)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !196, file: !197, line: 74, baseType: !219, size: 64, offset: 960)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !220, line: 152, baseType: !221)
!220 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!221 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !196, file: !197, line: 77, baseType: !223, size: 16, offset: 1024)
!223 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !196, file: !197, line: 78, baseType: !225, size: 8, offset: 1040)
!225 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !196, file: !197, line: 79, baseType: !227, size: 8, offset: 1048)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 8, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 1)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !196, file: !197, line: 81, baseType: !231, size: 64, offset: 1088)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !197, line: 43, baseType: null)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !196, file: !197, line: 89, baseType: !234, size: 64, offset: 1152)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !220, line: 153, baseType: !221)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !196, file: !197, line: 91, baseType: !236, size: 64, offset: 1216)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !197, line: 37, flags: DIFlagFwdDecl)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !196, file: !197, line: 92, baseType: !239, size: 64, offset: 1280)
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !197, line: 38, flags: DIFlagFwdDecl)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !196, file: !197, line: 93, baseType: !215, size: 64, offset: 1344)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !196, file: !197, line: 94, baseType: !243, size: 64, offset: 1408)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !196, file: !197, line: 95, baseType: !245, size: 64, offset: 1472)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !246, line: 46, baseType: !247)
!246 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!247 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !196, file: !197, line: 96, baseType: !56, size: 32, offset: 1536)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !196, file: !197, line: 98, baseType: !250, size: 160, offset: 1568)
!250 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 160, elements: !251)
!251 = !{!252}
!252 = !DISubrange(count: 20)
!253 = !DILocalVariable(name: "fin", arg: 1, scope: !190, file: !3, line: 85, type: !193)
!254 = !DILocation(line: 85, column: 26, scope: !190)
!255 = !DILocalVariable(name: "buffer", scope: !190, file: !3, line: 87, type: !256)
!256 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !257)
!257 = !{!258}
!258 = !DISubrange(count: 40)
!259 = !DILocation(line: 87, column: 10, scope: !190)
!260 = !DILocalVariable(name: "bufr2", scope: !190, file: !3, line: 88, type: !256)
!261 = !DILocation(line: 88, column: 10, scope: !190)
!262 = !DILocalVariable(name: "hkey", scope: !190, file: !3, line: 89, type: !42)
!263 = !DILocation(line: 89, column: 11, scope: !190)
!264 = !DILocalVariable(name: "hix", scope: !190, file: !3, line: 90, type: !56)
!265 = !DILocation(line: 90, column: 9, scope: !190)
!266 = !DILocalVariable(name: "he", scope: !190, file: !3, line: 91, type: !8)
!267 = !DILocation(line: 91, column: 15, scope: !190)
!268 = !DILocalVariable(name: "hep", scope: !190, file: !3, line: 91, type: !269)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!270 = !DILocation(line: 91, column: 20, scope: !190)
!271 = !DILocalVariable(name: "we", scope: !190, file: !3, line: 92, type: !18)
!272 = !DILocation(line: 92, column: 15, scope: !190)
!273 = !DILocalVariable(name: "maxPC", scope: !190, file: !3, line: 93, type: !56)
!274 = !DILocation(line: 93, column: 10, scope: !190)
!275 = !DILocalVariable(name: "numWords", scope: !190, file: !3, line: 94, type: !56)
!276 = !DILocation(line: 94, column: 9, scope: !190)
!277 = !DILocation(line: 96, column: 5, scope: !190)
!278 = !DILocation(line: 96, column: 19, scope: !190)
!279 = !DILocation(line: 96, column: 31, scope: !190)
!280 = !DILocation(line: 96, column: 13, scope: !190)
!281 = !DILocation(line: 97, column: 20, scope: !282)
!282 = distinct !DILexicalBlock(scope: !283, file: !3, line: 97, column: 9)
!283 = distinct !DILexicalBlock(scope: !190, file: !3, line: 96, column: 37)
!284 = !DILocation(line: 97, column: 18, scope: !282)
!285 = !DILocation(line: 97, column: 13, scope: !282)
!286 = !DILocation(line: 97, column: 29, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !3, line: 97, column: 9)
!288 = !DILocation(line: 97, column: 28, scope: !287)
!289 = !DILocation(line: 97, column: 34, scope: !287)
!290 = !DILocation(line: 97, column: 39, scope: !287)
!291 = !DILocation(line: 97, column: 38, scope: !287)
!292 = !DILocation(line: 97, column: 43, scope: !287)
!293 = !DILocation(line: 0, scope: !287)
!294 = !DILocation(line: 97, column: 9, scope: !282)
!295 = !DILocation(line: 97, column: 56, scope: !287)
!296 = !DILocation(line: 97, column: 9, scope: !287)
!297 = distinct !{!297, !294, !298}
!298 = !DILocation(line: 97, column: 59, scope: !282)
!299 = !DILocation(line: 98, column: 10, scope: !283)
!300 = !DILocation(line: 98, column: 15, scope: !283)
!301 = !DILocation(line: 99, column: 27, scope: !283)
!302 = !DILocation(line: 99, column: 35, scope: !283)
!303 = !DILocation(line: 99, column: 16, scope: !283)
!304 = !DILocation(line: 99, column: 14, scope: !283)
!305 = !DILocation(line: 100, column: 24, scope: !283)
!306 = !DILocation(line: 100, column: 15, scope: !283)
!307 = !DILocation(line: 100, column: 13, scope: !283)
!308 = !DILocation(line: 101, column: 24, scope: !283)
!309 = !DILocation(line: 101, column: 14, scope: !283)
!310 = !DILocation(line: 101, column: 12, scope: !283)
!311 = !DILocation(line: 101, column: 47, scope: !283)
!312 = !DILocation(line: 101, column: 37, scope: !283)
!313 = !DILocation(line: 101, column: 34, scope: !283)
!314 = !DILocation(line: 102, column: 9, scope: !283)
!315 = !DILocation(line: 102, column: 16, scope: !283)
!316 = !DILocation(line: 102, column: 19, scope: !283)
!317 = !DILocation(line: 102, column: 29, scope: !283)
!318 = !DILocation(line: 102, column: 33, scope: !283)
!319 = !DILocation(line: 102, column: 39, scope: !283)
!320 = !DILocation(line: 102, column: 22, scope: !283)
!321 = !DILocation(line: 0, scope: !283)
!322 = !DILocation(line: 103, column: 20, scope: !323)
!323 = distinct !DILexicalBlock(scope: !283, file: !3, line: 102, column: 47)
!324 = !DILocation(line: 103, column: 24, scope: !323)
!325 = !DILocation(line: 103, column: 17, scope: !323)
!326 = !DILocation(line: 104, column: 18, scope: !323)
!327 = !DILocation(line: 104, column: 22, scope: !323)
!328 = !DILocation(line: 104, column: 16, scope: !323)
!329 = distinct !{!329, !314, !330}
!330 = !DILocation(line: 105, column: 9, scope: !283)
!331 = !DILocation(line: 106, column: 16, scope: !332)
!332 = distinct !DILexicalBlock(scope: !283, file: !3, line: 106, column: 14)
!333 = !DILocation(line: 106, column: 14, scope: !283)
!334 = !DILocation(line: 107, column: 18, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !3, line: 106, column: 21)
!336 = !DILocation(line: 107, column: 16, scope: !335)
!337 = !DILocation(line: 108, column: 13, scope: !335)
!338 = !DILocation(line: 108, column: 17, scope: !335)
!339 = !DILocation(line: 108, column: 22, scope: !335)
!340 = !DILocation(line: 109, column: 30, scope: !335)
!341 = !DILocation(line: 109, column: 23, scope: !335)
!342 = !DILocation(line: 109, column: 13, scope: !335)
!343 = !DILocation(line: 109, column: 17, scope: !335)
!344 = !DILocation(line: 109, column: 21, scope: !335)
!345 = !DILocation(line: 110, column: 13, scope: !335)
!346 = !DILocation(line: 110, column: 17, scope: !335)
!347 = !DILocation(line: 110, column: 27, scope: !335)
!348 = !DILocation(line: 111, column: 13, scope: !335)
!349 = !DILocation(line: 111, column: 17, scope: !335)
!350 = !DILocation(line: 111, column: 23, scope: !335)
!351 = !DILocation(line: 112, column: 13, scope: !335)
!352 = !DILocation(line: 112, column: 17, scope: !335)
!353 = !DILocation(line: 112, column: 22, scope: !335)
!354 = !DILocation(line: 113, column: 20, scope: !335)
!355 = !DILocation(line: 113, column: 14, scope: !335)
!356 = !DILocation(line: 113, column: 18, scope: !335)
!357 = !DILocation(line: 114, column: 9, scope: !335)
!358 = !DILocation(line: 115, column: 14, scope: !283)
!359 = !DILocation(line: 115, column: 12, scope: !283)
!360 = !DILocation(line: 116, column: 27, scope: !283)
!361 = !DILocation(line: 116, column: 20, scope: !283)
!362 = !DILocation(line: 116, column: 9, scope: !283)
!363 = !DILocation(line: 116, column: 13, scope: !283)
!364 = !DILocation(line: 116, column: 18, scope: !283)
!365 = !DILocation(line: 117, column: 20, scope: !283)
!366 = !DILocation(line: 117, column: 24, scope: !283)
!367 = !DILocation(line: 117, column: 9, scope: !283)
!368 = !DILocation(line: 117, column: 13, scope: !283)
!369 = !DILocation(line: 117, column: 18, scope: !283)
!370 = !DILocation(line: 118, column: 21, scope: !283)
!371 = !DILocation(line: 118, column: 9, scope: !283)
!372 = !DILocation(line: 118, column: 13, scope: !283)
!373 = !DILocation(line: 118, column: 19, scope: !283)
!374 = !DILocation(line: 119, column: 9, scope: !283)
!375 = !DILocation(line: 119, column: 13, scope: !283)
!376 = !DILocation(line: 119, column: 22, scope: !283)
!377 = !DILocation(line: 120, column: 14, scope: !378)
!378 = distinct !DILexicalBlock(scope: !283, file: !3, line: 120, column: 14)
!379 = !DILocation(line: 120, column: 22, scope: !378)
!380 = !DILocation(line: 120, column: 26, scope: !378)
!381 = !DILocation(line: 120, column: 20, scope: !378)
!382 = !DILocation(line: 120, column: 14, scope: !283)
!383 = !DILocation(line: 121, column: 21, scope: !384)
!384 = distinct !DILexicalBlock(scope: !378, file: !3, line: 120, column: 37)
!385 = !DILocation(line: 121, column: 25, scope: !384)
!386 = !DILocation(line: 121, column: 19, scope: !384)
!387 = !DILocation(line: 122, column: 25, scope: !384)
!388 = !DILocation(line: 122, column: 23, scope: !384)
!389 = !DILocation(line: 123, column: 13, scope: !384)
!390 = !DILocation(line: 123, column: 17, scope: !384)
!391 = !DILocation(line: 123, column: 22, scope: !384)
!392 = !DILocation(line: 124, column: 9, scope: !384)
!393 = !DILocation(line: 125, column: 18, scope: !394)
!394 = distinct !DILexicalBlock(scope: !378, file: !3, line: 125, column: 18)
!395 = !DILocation(line: 125, column: 27, scope: !394)
!396 = !DILocation(line: 125, column: 31, scope: !394)
!397 = !DILocation(line: 125, column: 24, scope: !394)
!398 = !DILocation(line: 125, column: 18, scope: !378)
!399 = !DILocation(line: 126, column: 24, scope: !400)
!400 = distinct !DILexicalBlock(scope: !394, file: !3, line: 125, column: 42)
!401 = !DILocation(line: 126, column: 13, scope: !400)
!402 = !DILocation(line: 126, column: 17, scope: !400)
!403 = !DILocation(line: 126, column: 22, scope: !400)
!404 = !DILocation(line: 127, column: 25, scope: !400)
!405 = !DILocation(line: 127, column: 23, scope: !400)
!406 = !DILocation(line: 128, column: 9, scope: !400)
!407 = !DILocation(line: 130, column: 17, scope: !283)
!408 = distinct !{!408, !277, !409}
!409 = !DILocation(line: 131, column: 5, scope: !190)
!410 = !DILocation(line: 132, column: 51, scope: !190)
!411 = !DILocation(line: 132, column: 61, scope: !190)
!412 = !DILocation(line: 132, column: 5, scope: !190)
!413 = !DILocation(line: 133, column: 12, scope: !190)
!414 = !DILocation(line: 133, column: 5, scope: !190)
!415 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 137, type: !416, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!416 = !DISubroutineType(types: !417)
!417 = !{!56}
!418 = !DILocalVariable(name: "he", scope: !415, file: !3, line: 139, type: !8)
!419 = !DILocation(line: 139, column: 15, scope: !415)
!420 = !DILocalVariable(name: "we", scope: !415, file: !3, line: 140, type: !18)
!421 = !DILocation(line: 140, column: 15, scope: !415)
!422 = !DILocalVariable(name: "f1", scope: !415, file: !3, line: 141, type: !193)
!423 = !DILocation(line: 141, column: 11, scope: !415)
!424 = !DILocation(line: 143, column: 10, scope: !415)
!425 = !DILocation(line: 143, column: 8, scope: !415)
!426 = !DILocation(line: 144, column: 19, scope: !415)
!427 = !DILocation(line: 144, column: 5, scope: !415)
!428 = !DILocation(line: 145, column: 12, scope: !415)
!429 = !DILocation(line: 145, column: 5, scope: !415)
!430 = !DILocation(line: 147, column: 10, scope: !415)
!431 = !DILocation(line: 147, column: 8, scope: !415)
!432 = !DILocation(line: 150, column: 15, scope: !433)
!433 = distinct !DILexicalBlock(scope: !415, file: !3, line: 150, column: 5)
!434 = !DILocation(line: 150, column: 13, scope: !433)
!435 = !DILocation(line: 150, column: 10, scope: !433)
!436 = !DILocation(line: 150, column: 26, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !3, line: 150, column: 5)
!438 = !DILocation(line: 150, column: 5, scope: !433)
!439 = !DILocation(line: 151, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !437, file: !3, line: 150, column: 45)
!441 = !DILocation(line: 151, column: 27, scope: !440)
!442 = !DILocation(line: 151, column: 31, scope: !440)
!443 = !DILocation(line: 151, column: 9, scope: !440)
!444 = !DILocation(line: 152, column: 18, scope: !445)
!445 = distinct !DILexicalBlock(scope: !440, file: !3, line: 152, column: 9)
!446 = !DILocation(line: 152, column: 22, scope: !445)
!447 = !DILocation(line: 152, column: 16, scope: !445)
!448 = !DILocation(line: 152, column: 13, scope: !445)
!449 = !DILocation(line: 152, column: 29, scope: !450)
!450 = distinct !DILexicalBlock(scope: !445, file: !3, line: 152, column: 9)
!451 = !DILocation(line: 152, column: 9, scope: !445)
!452 = !DILocation(line: 153, column: 21, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !3, line: 152, column: 48)
!454 = !DILocation(line: 153, column: 32, scope: !453)
!455 = !DILocation(line: 153, column: 36, scope: !453)
!456 = !DILocation(line: 153, column: 13, scope: !453)
!457 = !DILocation(line: 154, column: 9, scope: !453)
!458 = !DILocation(line: 152, column: 38, scope: !450)
!459 = !DILocation(line: 152, column: 42, scope: !450)
!460 = !DILocation(line: 152, column: 36, scope: !450)
!461 = !DILocation(line: 152, column: 9, scope: !450)
!462 = distinct !{!462, !451, !463}
!463 = !DILocation(line: 154, column: 9, scope: !445)
!464 = !DILocation(line: 155, column: 17, scope: !440)
!465 = !DILocation(line: 155, column: 9, scope: !440)
!466 = !DILocation(line: 156, column: 5, scope: !440)
!467 = !DILocation(line: 150, column: 35, scope: !437)
!468 = !DILocation(line: 150, column: 39, scope: !437)
!469 = !DILocation(line: 150, column: 33, scope: !437)
!470 = !DILocation(line: 150, column: 5, scope: !437)
!471 = distinct !{!471, !438, !472}
!472 = !DILocation(line: 156, column: 5, scope: !433)
!473 = !DILocation(line: 158, column: 12, scope: !415)
!474 = !DILocation(line: 158, column: 5, scope: !415)
!475 = !DILocation(line: 159, column: 5, scope: !415)
