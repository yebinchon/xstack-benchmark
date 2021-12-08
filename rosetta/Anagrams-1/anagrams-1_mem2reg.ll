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
  call void @llvm.dbg.value(metadata i8* %word, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %wbuf, metadata !45, metadata !DIExpression()), !dbg !44
  %call = call i8* @strcpy(i8* %wbuf, i8* %word) #5, !dbg !46
  %call1 = call i64 @strlen(i8* %wbuf) #6, !dbg !47
  %add.ptr = getelementptr inbounds i8, i8* %wbuf, i64 %call1, !dbg !48
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !49, metadata !DIExpression()), !dbg !44
  br label %do.body, !dbg !50

do.body:                                          ; preds = %do.cond, %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !51, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %wbuf, metadata !53, metadata !DIExpression()), !dbg !44
  %add.ptr2 = getelementptr inbounds i8, i8* %add.ptr, i64 -1, !dbg !54
  call void @llvm.dbg.value(metadata i8* %add.ptr2, metadata !56, metadata !DIExpression()), !dbg !44
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %if.end, %do.body
  %p2.0 = phi i8* [ %add.ptr2, %do.body ], [ %incdec.ptr6, %if.end ], !dbg !58
  %p1.0 = phi i8* [ %wbuf, %do.body ], [ %incdec.ptr, %if.end ], !dbg !58
  %swaps.0 = phi i32 [ 0, %do.body ], [ %swaps.1, %if.end ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %swaps.0, metadata !51, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %p1.0, metadata !53, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %p2.0, metadata !56, metadata !DIExpression()), !dbg !44
  %cmp = icmp ult i8* %p1.0, %p2.0, !dbg !59
  br i1 %cmp, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %0 = load i8, i8* %p2.0, align 1, !dbg !60
  %conv = sext i8 %0 to i32, !dbg !60
  %1 = load i8, i8* %p1.0, align 1, !dbg !63
  %conv3 = sext i8 %1 to i32, !dbg !63
  %cmp4 = icmp sgt i32 %conv, %conv3, !dbg !64
  br i1 %cmp4, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %while.body
  %2 = load i8, i8* %p2.0, align 1, !dbg !66
  call void @llvm.dbg.value(metadata i8 %2, metadata !68, metadata !DIExpression()), !dbg !44
  %3 = load i8, i8* %p1.0, align 1, !dbg !69
  store i8 %3, i8* %p2.0, align 1, !dbg !70
  store i8 %2, i8* %p1.0, align 1, !dbg !71
  call void @llvm.dbg.value(metadata i32 1, metadata !51, metadata !DIExpression()), !dbg !44
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %while.body
  %swaps.1 = phi i32 [ 1, %if.then ], [ %swaps.0, %while.body ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %swaps.1, metadata !51, metadata !DIExpression()), !dbg !44
  %incdec.ptr = getelementptr inbounds i8, i8* %p1.0, i32 1, !dbg !73
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !53, metadata !DIExpression()), !dbg !44
  %incdec.ptr6 = getelementptr inbounds i8, i8* %p2.0, i32 -1, !dbg !74
  call void @llvm.dbg.value(metadata i8* %incdec.ptr6, metadata !56, metadata !DIExpression()), !dbg !44
  br label %while.cond, !dbg !57, !llvm.loop !75

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.value(metadata i8* %wbuf, metadata !53, metadata !DIExpression()), !dbg !44
  %add.ptr7 = getelementptr inbounds i8, i8* %wbuf, i64 1, !dbg !77
  call void @llvm.dbg.value(metadata i8* %add.ptr7, metadata !56, metadata !DIExpression()), !dbg !44
  br label %while.cond8, !dbg !78

while.cond8:                                      ; preds = %if.end17, %while.end
  %p2.1 = phi i8* [ %add.ptr7, %while.end ], [ %incdec.ptr19, %if.end17 ], !dbg !58
  %p1.1 = phi i8* [ %wbuf, %while.end ], [ %incdec.ptr18, %if.end17 ], !dbg !58
  %swaps.2 = phi i32 [ %swaps.0, %while.end ], [ %swaps.3, %if.end17 ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %swaps.2, metadata !51, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %p1.1, metadata !53, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8* %p2.1, metadata !56, metadata !DIExpression()), !dbg !44
  %cmp9 = icmp ult i8* %p2.1, %add.ptr, !dbg !79
  br i1 %cmp9, label %while.body11, label %while.end20, !dbg !78

while.body11:                                     ; preds = %while.cond8
  %4 = load i8, i8* %p2.1, align 1, !dbg !80
  %conv12 = sext i8 %4 to i32, !dbg !80
  %5 = load i8, i8* %p1.1, align 1, !dbg !83
  %conv13 = sext i8 %5 to i32, !dbg !83
  %cmp14 = icmp sgt i32 %conv12, %conv13, !dbg !84
  br i1 %cmp14, label %if.then16, label %if.end17, !dbg !85

if.then16:                                        ; preds = %while.body11
  %6 = load i8, i8* %p2.1, align 1, !dbg !86
  call void @llvm.dbg.value(metadata i8 %6, metadata !68, metadata !DIExpression()), !dbg !44
  %7 = load i8, i8* %p1.1, align 1, !dbg !88
  store i8 %7, i8* %p2.1, align 1, !dbg !89
  store i8 %6, i8* %p1.1, align 1, !dbg !90
  call void @llvm.dbg.value(metadata i32 1, metadata !51, metadata !DIExpression()), !dbg !44
  br label %if.end17, !dbg !91

if.end17:                                         ; preds = %if.then16, %while.body11
  %swaps.3 = phi i32 [ 1, %if.then16 ], [ %swaps.2, %while.body11 ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %swaps.3, metadata !51, metadata !DIExpression()), !dbg !44
  %incdec.ptr18 = getelementptr inbounds i8, i8* %p1.1, i32 1, !dbg !92
  call void @llvm.dbg.value(metadata i8* %incdec.ptr18, metadata !53, metadata !DIExpression()), !dbg !44
  %incdec.ptr19 = getelementptr inbounds i8, i8* %p2.1, i32 1, !dbg !93
  call void @llvm.dbg.value(metadata i8* %incdec.ptr19, metadata !56, metadata !DIExpression()), !dbg !44
  br label %while.cond8, !dbg !78, !llvm.loop !94

while.end20:                                      ; preds = %while.cond8
  br label %do.cond, !dbg !96

do.cond:                                          ; preds = %while.end20
  %tobool = icmp ne i32 %swaps.2, 0, !dbg !96
  br i1 %tobool, label %do.body, label %do.end, !dbg !96, !llvm.loop !97

do.end:                                           ; preds = %do.cond
  ret i8* %wbuf, !dbg !99
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Str_Hash(i8* %key, i32 %ix_max) #0 !dbg !100 {
entry:
  call void @llvm.dbg.value(metadata i8* %key, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %ix_max, metadata !105, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 33501551, metadata !106, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i8* %key, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %cp.0 = phi i8* [ %key, %entry ], [ %incdec.ptr, %for.inc ], !dbg !110
  %hash.0 = phi i32 [ 33501551, %entry ], [ %and, %for.inc ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %hash.0, metadata !106, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i8* %cp.0, metadata !107, metadata !DIExpression()), !dbg !104
  %0 = load i8, i8* %cp.0, align 1, !dbg !111
  %tobool = icmp ne i8 %0, 0, !dbg !113
  br i1 %tobool, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %1 = load i8, i8* %cp.0, align 1, !dbg !114
  %conv = sext i8 %1 to i64, !dbg !114
  %rem = urem i64 %conv, 96, !dbg !116
  %arrayidx = getelementptr inbounds [96 x i16], [96 x i16]* @cxmap, i64 0, i64 %rem, !dbg !117
  %2 = load i16, i16* %arrayidx, align 2, !dbg !117
  call void @llvm.dbg.value(metadata i16 %2, metadata !118, metadata !DIExpression()), !dbg !104
  %shr = ashr i32 %hash.0, 4, !dbg !119
  %xor = xor i32 %shr, 96849756, !dbg !120
  %shl = shl i32 %hash.0, 1, !dbg !121
  %conv1 = sext i16 %2 to i32, !dbg !122
  %shl2 = shl i32 %conv1, 5, !dbg !123
  %add = add nsw i32 %shl, %shl2, !dbg !124
  %xor3 = xor i32 %xor, %add, !dbg !125
  call void @llvm.dbg.value(metadata i32 %xor3, metadata !106, metadata !DIExpression()), !dbg !104
  %and = and i32 %xor3, 1073741823, !dbg !126
  call void @llvm.dbg.value(metadata i32 %and, metadata !106, metadata !DIExpression()), !dbg !104
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %cp.0, i32 1, !dbg !128
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !107, metadata !DIExpression()), !dbg !104
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %rem4 = srem i32 %hash.0, %ix_max, !dbg !132
  ret i32 %rem4, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @buildAnagrams(%struct._IO_FILE* %fin) #0 !dbg !134 {
entry:
  %buffer = alloca [40 x i8], align 16
  %bufr2 = alloca [40 x i8], align 16
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %fin, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [40 x i8]* %buffer, metadata !199, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata [40 x i8]* %bufr2, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.value(metadata i32 2, metadata !206, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata i32 0, metadata !207, metadata !DIExpression()), !dbg !198
  br label %while.cond, !dbg !208

while.cond:                                       ; preds = %if.end46, %entry
  %maxPC.0 = phi i32 [ 2, %entry ], [ %maxPC.1, %if.end46 ], !dbg !198
  %numWords.0 = phi i32 [ 0, %entry ], [ %inc47, %if.end46 ], !dbg !198
  call void @llvm.dbg.value(metadata i32 %numWords.0, metadata !207, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata i32 %maxPC.0, metadata !206, metadata !DIExpression()), !dbg !198
  %arraydecay = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !209
  %call = call i8* @fgets(i8* %arraydecay, i32 40, %struct._IO_FILE* %fin), !dbg !210
  %tobool = icmp ne i8* %call, null, !dbg !208
  br i1 %tobool, label %while.body, label %while.end48, !dbg !208

while.body:                                       ; preds = %while.cond
  %arraydecay1 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !211
  call void @llvm.dbg.value(metadata i8* %arraydecay1, metadata !214, metadata !DIExpression()), !dbg !198
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %while.body
  %hkey.0 = phi i8* [ %arraydecay1, %while.body ], [ %incdec.ptr, %for.inc ], !dbg !216
  call void @llvm.dbg.value(metadata i8* %hkey.0, metadata !214, metadata !DIExpression()), !dbg !198
  %0 = load i8, i8* %hkey.0, align 1, !dbg !217
  %conv = sext i8 %0 to i32, !dbg !217
  %tobool2 = icmp ne i32 %conv, 0, !dbg !217
  br i1 %tobool2, label %land.rhs, label %land.end, !dbg !219

land.rhs:                                         ; preds = %for.cond
  %1 = load i8, i8* %hkey.0, align 1, !dbg !220
  %conv3 = sext i8 %1 to i32, !dbg !220
  %cmp = icmp ne i32 %conv3, 10, !dbg !221
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %2 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !222
  br i1 %2, label %for.body, label %for.end, !dbg !223

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %hkey.0, i32 1, !dbg !224
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !214, metadata !DIExpression()), !dbg !198
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %land.end
  store i8 0, i8* %hkey.0, align 1, !dbg !228
  %arraydecay5 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !229
  %arraydecay6 = getelementptr inbounds [40 x i8], [40 x i8]* %bufr2, i64 0, i64 0, !dbg !230
  %call7 = call i8* @sortedWord(i8* %arraydecay5, i8* %arraydecay6), !dbg !231
  call void @llvm.dbg.value(metadata i8* %call7, metadata !214, metadata !DIExpression()), !dbg !198
  %call8 = call i32 @Str_Hash(i8* %call7, i32 8192), !dbg !232
  call void @llvm.dbg.value(metadata i32 %call8, metadata !233, metadata !DIExpression()), !dbg !198
  %idxprom = sext i32 %call8 to i64, !dbg !234
  %arrayidx = getelementptr inbounds [8192 x %struct.sHashEntry*], [8192 x %struct.sHashEntry*]* @hashTable, i64 0, i64 %idxprom, !dbg !234
  %3 = load %struct.sHashEntry*, %struct.sHashEntry** %arrayidx, align 8, !dbg !234
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %3, metadata !235, metadata !DIExpression()), !dbg !198
  %idxprom9 = sext i32 %call8 to i64, !dbg !236
  %arrayidx10 = getelementptr inbounds [8192 x %struct.sHashEntry*], [8192 x %struct.sHashEntry*]* @hashTable, i64 0, i64 %idxprom9, !dbg !236
  call void @llvm.dbg.value(metadata %struct.sHashEntry** %arrayidx10, metadata !237, metadata !DIExpression()), !dbg !198
  br label %while.cond11, !dbg !239

while.cond11:                                     ; preds = %while.body17, %for.end
  %hep.0 = phi %struct.sHashEntry** [ %arrayidx10, %for.end ], [ %next, %while.body17 ], !dbg !240
  %he.0 = phi %struct.sHashEntry* [ %3, %for.end ], [ %6, %while.body17 ], !dbg !240
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %he.0, metadata !235, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.value(metadata %struct.sHashEntry** %hep.0, metadata !237, metadata !DIExpression()), !dbg !198
  %tobool12 = icmp ne %struct.sHashEntry* %he.0, null, !dbg !241
  br i1 %tobool12, label %land.rhs13, label %land.end16, !dbg !242

land.rhs13:                                       ; preds = %while.cond11
  %key = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 0, !dbg !243
  %4 = load i8*, i8** %key, align 8, !dbg !243
  %call14 = call i32 @strcmp(i8* %4, i8* %call7) #6, !dbg !244
  %tobool15 = icmp ne i32 %call14, 0, !dbg !242
  br label %land.end16

land.end16:                                       ; preds = %land.rhs13, %while.cond11
  %5 = phi i1 [ false, %while.cond11 ], [ %tobool15, %land.rhs13 ], !dbg !240
  br i1 %5, label %while.body17, label %while.end, !dbg !239

while.body17:                                     ; preds = %land.end16
  %next = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 1, !dbg !245
  call void @llvm.dbg.value(metadata %struct.sHashEntry** %next, metadata !237, metadata !DIExpression()), !dbg !198
  %next18 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 1, !dbg !247
  %6 = load %struct.sHashEntry*, %struct.sHashEntry** %next18, align 8, !dbg !247
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %6, metadata !235, metadata !DIExpression()), !dbg !198
  br label %while.cond11, !dbg !239, !llvm.loop !248

while.end:                                        ; preds = %land.end16
  %tobool19 = icmp ne %struct.sHashEntry* %he.0, null, !dbg !250
  br i1 %tobool19, label %if.end, label %if.then, !dbg !252

if.then:                                          ; preds = %while.end
  %call20 = call noalias i8* @malloc(i64 40) #5, !dbg !253
  %7 = bitcast i8* %call20 to %struct.sHashEntry*, !dbg !253
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %7, metadata !235, metadata !DIExpression()), !dbg !198
  %next21 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 1, !dbg !255
  store %struct.sHashEntry* null, %struct.sHashEntry** %next21, align 8, !dbg !256
  %call22 = call noalias i8* @strdup(i8* %call7) #5, !dbg !257
  %key23 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 0, !dbg !258
  store i8* %call22, i8** %key23, align 8, !dbg !259
  %wordCount = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 4, !dbg !260
  store i16 0, i16* %wordCount, align 8, !dbg !261
  %words = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 2, !dbg !262
  store %struct.sDictWord* null, %struct.sDictWord** %words, align 8, !dbg !263
  %link = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %7, i32 0, i32 3, !dbg !264
  store %struct.sHashEntry* null, %struct.sHashEntry** %link, align 8, !dbg !265
  store %struct.sHashEntry* %7, %struct.sHashEntry** %hep.0, align 8, !dbg !266
  br label %if.end, !dbg !267

if.end:                                           ; preds = %if.then, %while.end
  %he.1 = phi %struct.sHashEntry* [ %he.0, %while.end ], [ %7, %if.then ], !dbg !240
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %he.1, metadata !235, metadata !DIExpression()), !dbg !198
  %call24 = call noalias i8* @malloc(i64 16) #5, !dbg !268
  %8 = bitcast i8* %call24 to %struct.sDictWord*, !dbg !268
  call void @llvm.dbg.value(metadata %struct.sDictWord* %8, metadata !269, metadata !DIExpression()), !dbg !198
  %arraydecay25 = getelementptr inbounds [40 x i8], [40 x i8]* %buffer, i64 0, i64 0, !dbg !270
  %call26 = call noalias i8* @strdup(i8* %arraydecay25) #5, !dbg !271
  %word = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %8, i32 0, i32 0, !dbg !272
  store i8* %call26, i8** %word, align 8, !dbg !273
  %words27 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 2, !dbg !274
  %9 = load %struct.sDictWord*, %struct.sDictWord** %words27, align 8, !dbg !274
  %next28 = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %8, i32 0, i32 1, !dbg !275
  store %struct.sDictWord* %9, %struct.sDictWord** %next28, align 8, !dbg !276
  %words29 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 2, !dbg !277
  store %struct.sDictWord* %8, %struct.sDictWord** %words29, align 8, !dbg !278
  %wordCount30 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 4, !dbg !279
  %10 = load i16, i16* %wordCount30, align 8, !dbg !280
  %inc = add i16 %10, 1, !dbg !280
  store i16 %inc, i16* %wordCount30, align 8, !dbg !280
  %wordCount31 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 4, !dbg !281
  %11 = load i16, i16* %wordCount31, align 8, !dbg !281
  %conv32 = sext i16 %11 to i32, !dbg !283
  %cmp33 = icmp slt i32 %maxPC.0, %conv32, !dbg !284
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !285

if.then35:                                        ; preds = %if.end
  %wordCount36 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 4, !dbg !286
  %12 = load i16, i16* %wordCount36, align 8, !dbg !286
  %conv37 = sext i16 %12 to i32, !dbg !288
  call void @llvm.dbg.value(metadata i32 %conv37, metadata !206, metadata !DIExpression()), !dbg !198
  store %struct.sHashEntry* %he.1, %struct.sHashEntry** @mostPerms, align 8, !dbg !289
  %link38 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 3, !dbg !290
  store %struct.sHashEntry* null, %struct.sHashEntry** %link38, align 8, !dbg !291
  br label %if.end46, !dbg !292

if.else:                                          ; preds = %if.end
  %wordCount39 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 4, !dbg !293
  %13 = load i16, i16* %wordCount39, align 8, !dbg !293
  %conv40 = sext i16 %13 to i32, !dbg !295
  %cmp41 = icmp eq i32 %maxPC.0, %conv40, !dbg !296
  br i1 %cmp41, label %if.then43, label %if.end45, !dbg !297

if.then43:                                        ; preds = %if.else
  %14 = load %struct.sHashEntry*, %struct.sHashEntry** @mostPerms, align 8, !dbg !298
  %link44 = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.1, i32 0, i32 3, !dbg !300
  store %struct.sHashEntry* %14, %struct.sHashEntry** %link44, align 8, !dbg !301
  store %struct.sHashEntry* %he.1, %struct.sHashEntry** @mostPerms, align 8, !dbg !302
  br label %if.end45, !dbg !303

if.end45:                                         ; preds = %if.then43, %if.else
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then35
  %maxPC.1 = phi i32 [ %conv37, %if.then35 ], [ %maxPC.0, %if.end45 ], !dbg !198
  call void @llvm.dbg.value(metadata i32 %maxPC.1, metadata !206, metadata !DIExpression()), !dbg !198
  %inc47 = add nsw i32 %numWords.0, 1, !dbg !304
  call void @llvm.dbg.value(metadata i32 %inc47, metadata !207, metadata !DIExpression()), !dbg !198
  br label %while.cond, !dbg !208, !llvm.loop !305

while.end48:                                      ; preds = %while.cond
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %numWords.0, i32 %maxPC.0), !dbg !307
  ret i32 %maxPC.0, !dbg !308
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
define dso_local i32 @main() #0 !dbg !309 {
entry:
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !312
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !313, metadata !DIExpression()), !dbg !314
  %call1 = call i32 @buildAnagrams(%struct._IO_FILE* %call), !dbg !315
  %call2 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !316
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !317
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call3, metadata !313, metadata !DIExpression()), !dbg !314
  %0 = load %struct.sHashEntry*, %struct.sHashEntry** @mostPerms, align 8, !dbg !318
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %0, metadata !320, metadata !DIExpression()), !dbg !314
  br label %for.cond, !dbg !321

for.cond:                                         ; preds = %for.inc10, %entry
  %he.0 = phi %struct.sHashEntry* [ %0, %entry ], [ %5, %for.inc10 ], !dbg !322
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %he.0, metadata !320, metadata !DIExpression()), !dbg !314
  %tobool = icmp ne %struct.sHashEntry* %he.0, null, !dbg !323
  br i1 %tobool, label %for.body, label %for.end11, !dbg !323

for.body:                                         ; preds = %for.cond
  %wordCount = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 4, !dbg !324
  %1 = load i16, i16* %wordCount, align 8, !dbg !324
  %conv = sext i16 %1 to i32, !dbg !327
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %conv), !dbg !328
  %words = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 2, !dbg !329
  %2 = load %struct.sDictWord*, %struct.sDictWord** %words, align 8, !dbg !329
  call void @llvm.dbg.value(metadata %struct.sDictWord* %2, metadata !331, metadata !DIExpression()), !dbg !314
  br label %for.cond5, !dbg !332

for.cond5:                                        ; preds = %for.inc, %for.body
  %we.0 = phi %struct.sDictWord* [ %2, %for.body ], [ %4, %for.inc ], !dbg !333
  call void @llvm.dbg.value(metadata %struct.sDictWord* %we.0, metadata !331, metadata !DIExpression()), !dbg !314
  %tobool6 = icmp ne %struct.sDictWord* %we.0, null, !dbg !334
  br i1 %tobool6, label %for.body7, label %for.end, !dbg !334

for.body7:                                        ; preds = %for.cond5
  %word = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %we.0, i32 0, i32 0, !dbg !335
  %3 = load i8*, i8** %word, align 8, !dbg !335
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i8* %3), !dbg !338
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %for.body7
  %next = getelementptr inbounds %struct.sDictWord, %struct.sDictWord* %we.0, i32 0, i32 1, !dbg !340
  %4 = load %struct.sDictWord*, %struct.sDictWord** %next, align 8, !dbg !340
  call void @llvm.dbg.value(metadata %struct.sDictWord* %4, metadata !331, metadata !DIExpression()), !dbg !314
  br label %for.cond5, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond5
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !344
  br label %for.inc10, !dbg !345

for.inc10:                                        ; preds = %for.end
  %link = getelementptr inbounds %struct.sHashEntry, %struct.sHashEntry* %he.0, i32 0, i32 3, !dbg !346
  %5 = load %struct.sHashEntry*, %struct.sHashEntry** %link, align 8, !dbg !346
  call void @llvm.dbg.value(metadata %struct.sHashEntry* %5, metadata !320, metadata !DIExpression()), !dbg !314
  br label %for.cond, !dbg !347, !llvm.loop !348

for.end11:                                        ; preds = %for.cond
  %call12 = call i32 @fclose(%struct._IO_FILE* %call3), !dbg !350
  ret i32 0, !dbg !351
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #4

declare dso_local i32 @fclose(%struct._IO_FILE*) #4

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!44 = !DILocation(line: 0, scope: !39)
!45 = !DILocalVariable(name: "wbuf", arg: 2, scope: !39, file: !3, line: 7, type: !42)
!46 = !DILocation(line: 13, column: 5, scope: !39)
!47 = !DILocation(line: 14, column: 19, scope: !39)
!48 = !DILocation(line: 14, column: 18, scope: !39)
!49 = !DILocalVariable(name: "endwrd", scope: !39, file: !3, line: 9, type: !42)
!50 = !DILocation(line: 15, column: 5, scope: !39)
!51 = !DILocalVariable(name: "swaps", scope: !39, file: !3, line: 11, type: !52)
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "p1", scope: !39, file: !3, line: 9, type: !42)
!54 = !DILocation(line: 17, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !3, line: 15, column: 8)
!56 = !DILocalVariable(name: "p2", scope: !39, file: !3, line: 9, type: !42)
!57 = !DILocation(line: 18, column: 8, scope: !55)
!58 = !DILocation(line: 0, scope: !55)
!59 = !DILocation(line: 18, column: 17, scope: !55)
!60 = !DILocation(line: 19, column: 15, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !3, line: 19, column: 15)
!62 = distinct !DILexicalBlock(scope: !55, file: !3, line: 18, column: 22)
!63 = !DILocation(line: 19, column: 21, scope: !61)
!64 = !DILocation(line: 19, column: 19, scope: !61)
!65 = !DILocation(line: 19, column: 15, scope: !62)
!66 = !DILocation(line: 20, column: 18, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !3, line: 19, column: 26)
!68 = !DILocalVariable(name: "t", scope: !39, file: !3, line: 10, type: !15)
!69 = !DILocation(line: 20, column: 29, scope: !67)
!70 = !DILocation(line: 20, column: 27, scope: !67)
!71 = !DILocation(line: 20, column: 38, scope: !67)
!72 = !DILocation(line: 22, column: 11, scope: !67)
!73 = !DILocation(line: 23, column: 13, scope: !62)
!74 = !DILocation(line: 23, column: 19, scope: !62)
!75 = distinct !{!75, !57, !76}
!76 = !DILocation(line: 24, column: 8, scope: !55)
!77 = !DILocation(line: 25, column: 26, scope: !55)
!78 = !DILocation(line: 26, column: 8, scope: !55)
!79 = !DILocation(line: 26, column: 17, scope: !55)
!80 = !DILocation(line: 27, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 27, column: 16)
!82 = distinct !DILexicalBlock(scope: !55, file: !3, line: 26, column: 27)
!83 = !DILocation(line: 27, column: 22, scope: !81)
!84 = !DILocation(line: 27, column: 20, scope: !81)
!85 = !DILocation(line: 27, column: 16, scope: !82)
!86 = !DILocation(line: 28, column: 18, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !3, line: 27, column: 27)
!88 = !DILocation(line: 28, column: 29, scope: !87)
!89 = !DILocation(line: 28, column: 27, scope: !87)
!90 = !DILocation(line: 28, column: 38, scope: !87)
!91 = !DILocation(line: 30, column: 12, scope: !87)
!92 = !DILocation(line: 31, column: 14, scope: !82)
!93 = !DILocation(line: 31, column: 20, scope: !82)
!94 = distinct !{!94, !78, !95}
!95 = !DILocation(line: 32, column: 8, scope: !55)
!96 = !DILocation(line: 33, column: 5, scope: !55)
!97 = distinct !{!97, !50, !98}
!98 = !DILocation(line: 33, column: 19, scope: !39)
!99 = !DILocation(line: 34, column: 5, scope: !39)
!100 = distinct !DISubprogram(name: "Str_Hash", scope: !3, file: !3, line: 51, type: !101, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!52, !13, !52}
!103 = !DILocalVariable(name: "key", arg: 1, scope: !100, file: !3, line: 51, type: !13)
!104 = !DILocation(line: 0, scope: !100)
!105 = !DILocalVariable(name: "ix_max", arg: 2, scope: !100, file: !3, line: 51, type: !52)
!106 = !DILocalVariable(name: "hash", scope: !100, file: !3, line: 55, type: !52)
!107 = !DILocalVariable(name: "cp", scope: !100, file: !3, line: 53, type: !13)
!108 = !DILocation(line: 56, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !3, line: 56, column: 4)
!110 = !DILocation(line: 0, scope: !109)
!111 = !DILocation(line: 56, column: 19, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !3, line: 56, column: 4)
!113 = !DILocation(line: 56, column: 4, scope: !109)
!114 = !DILocation(line: 57, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 56, column: 30)
!116 = !DILocation(line: 57, column: 24, scope: !115)
!117 = !DILocation(line: 57, column: 14, scope: !115)
!118 = !DILocalVariable(name: "mash", scope: !100, file: !3, line: 54, type: !26)
!119 = !DILocation(line: 58, column: 20, scope: !115)
!120 = !DILocation(line: 58, column: 25, scope: !115)
!121 = !DILocation(line: 58, column: 45, scope: !115)
!122 = !DILocation(line: 58, column: 53, scope: !115)
!123 = !DILocation(line: 58, column: 57, scope: !115)
!124 = !DILocation(line: 58, column: 50, scope: !115)
!125 = !DILocation(line: 58, column: 37, scope: !115)
!126 = !DILocation(line: 59, column: 12, scope: !115)
!127 = !DILocation(line: 60, column: 7, scope: !115)
!128 = !DILocation(line: 56, column: 26, scope: !112)
!129 = !DILocation(line: 56, column: 4, scope: !112)
!130 = distinct !{!130, !113, !131}
!131 = !DILocation(line: 60, column: 7, scope: !109)
!132 = !DILocation(line: 61, column: 17, scope: !100)
!133 = !DILocation(line: 61, column: 4, scope: !100)
!134 = distinct !DISubprogram(name: "buildAnagrams", scope: !3, file: !3, line: 85, type: !135, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DISubroutineType(types: !136)
!136 = !{!52, !137}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !139, line: 7, baseType: !140)
!139 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !141, line: 49, size: 1728, elements: !142)
!141 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!142 = !{!143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !158, !160, !161, !162, !166, !168, !170, !174, !177, !179, !182, !185, !186, !188, !192, !193}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !140, file: !141, line: 51, baseType: !52, size: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !140, file: !141, line: 54, baseType: !42, size: 64, offset: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !140, file: !141, line: 55, baseType: !42, size: 64, offset: 128)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !140, file: !141, line: 56, baseType: !42, size: 64, offset: 192)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !140, file: !141, line: 57, baseType: !42, size: 64, offset: 256)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !140, file: !141, line: 58, baseType: !42, size: 64, offset: 320)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !140, file: !141, line: 59, baseType: !42, size: 64, offset: 384)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !140, file: !141, line: 60, baseType: !42, size: 64, offset: 448)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !140, file: !141, line: 61, baseType: !42, size: 64, offset: 512)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !140, file: !141, line: 64, baseType: !42, size: 64, offset: 576)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !140, file: !141, line: 65, baseType: !42, size: 64, offset: 640)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !140, file: !141, line: 66, baseType: !42, size: 64, offset: 704)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !140, file: !141, line: 68, baseType: !156, size: 64, offset: 768)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!157 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !141, line: 36, flags: DIFlagFwdDecl)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !140, file: !141, line: 70, baseType: !159, size: 64, offset: 832)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !140, file: !141, line: 72, baseType: !52, size: 32, offset: 896)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !140, file: !141, line: 73, baseType: !52, size: 32, offset: 928)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !140, file: !141, line: 74, baseType: !163, size: 64, offset: 960)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !164, line: 152, baseType: !165)
!164 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!165 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !140, file: !141, line: 77, baseType: !167, size: 16, offset: 1024)
!167 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !140, file: !141, line: 78, baseType: !169, size: 8, offset: 1040)
!169 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !140, file: !141, line: 79, baseType: !171, size: 8, offset: 1048)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 8, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 1)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !140, file: !141, line: 81, baseType: !175, size: 64, offset: 1088)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !141, line: 43, baseType: null)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !140, file: !141, line: 89, baseType: !178, size: 64, offset: 1152)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !164, line: 153, baseType: !165)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !140, file: !141, line: 91, baseType: !180, size: 64, offset: 1216)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !141, line: 37, flags: DIFlagFwdDecl)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !140, file: !141, line: 92, baseType: !183, size: 64, offset: 1280)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !141, line: 38, flags: DIFlagFwdDecl)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !140, file: !141, line: 93, baseType: !159, size: 64, offset: 1344)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !140, file: !141, line: 94, baseType: !187, size: 64, offset: 1408)
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !140, file: !141, line: 95, baseType: !189, size: 64, offset: 1472)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !190, line: 46, baseType: !191)
!190 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!191 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !140, file: !141, line: 96, baseType: !52, size: 32, offset: 1536)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !140, file: !141, line: 98, baseType: !194, size: 160, offset: 1568)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 160, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 20)
!197 = !DILocalVariable(name: "fin", arg: 1, scope: !134, file: !3, line: 85, type: !137)
!198 = !DILocation(line: 0, scope: !134)
!199 = !DILocalVariable(name: "buffer", scope: !134, file: !3, line: 87, type: !200)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 40)
!203 = !DILocation(line: 87, column: 10, scope: !134)
!204 = !DILocalVariable(name: "bufr2", scope: !134, file: !3, line: 88, type: !200)
!205 = !DILocation(line: 88, column: 10, scope: !134)
!206 = !DILocalVariable(name: "maxPC", scope: !134, file: !3, line: 93, type: !52)
!207 = !DILocalVariable(name: "numWords", scope: !134, file: !3, line: 94, type: !52)
!208 = !DILocation(line: 96, column: 5, scope: !134)
!209 = !DILocation(line: 96, column: 19, scope: !134)
!210 = !DILocation(line: 96, column: 13, scope: !134)
!211 = !DILocation(line: 97, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !213, file: !3, line: 97, column: 9)
!213 = distinct !DILexicalBlock(scope: !134, file: !3, line: 96, column: 37)
!214 = !DILocalVariable(name: "hkey", scope: !134, file: !3, line: 89, type: !42)
!215 = !DILocation(line: 97, column: 13, scope: !212)
!216 = !DILocation(line: 0, scope: !212)
!217 = !DILocation(line: 97, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !212, file: !3, line: 97, column: 9)
!219 = !DILocation(line: 97, column: 34, scope: !218)
!220 = !DILocation(line: 97, column: 38, scope: !218)
!221 = !DILocation(line: 97, column: 43, scope: !218)
!222 = !DILocation(line: 0, scope: !218)
!223 = !DILocation(line: 97, column: 9, scope: !212)
!224 = !DILocation(line: 97, column: 56, scope: !218)
!225 = !DILocation(line: 97, column: 9, scope: !218)
!226 = distinct !{!226, !223, !227}
!227 = !DILocation(line: 97, column: 59, scope: !212)
!228 = !DILocation(line: 98, column: 15, scope: !213)
!229 = !DILocation(line: 99, column: 27, scope: !213)
!230 = !DILocation(line: 99, column: 35, scope: !213)
!231 = !DILocation(line: 99, column: 16, scope: !213)
!232 = !DILocation(line: 100, column: 15, scope: !213)
!233 = !DILocalVariable(name: "hix", scope: !134, file: !3, line: 90, type: !52)
!234 = !DILocation(line: 101, column: 14, scope: !213)
!235 = !DILocalVariable(name: "he", scope: !134, file: !3, line: 91, type: !8)
!236 = !DILocation(line: 101, column: 37, scope: !213)
!237 = !DILocalVariable(name: "hep", scope: !134, file: !3, line: 91, type: !238)
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!239 = !DILocation(line: 102, column: 9, scope: !213)
!240 = !DILocation(line: 0, scope: !213)
!241 = !DILocation(line: 102, column: 16, scope: !213)
!242 = !DILocation(line: 102, column: 19, scope: !213)
!243 = !DILocation(line: 102, column: 33, scope: !213)
!244 = !DILocation(line: 102, column: 22, scope: !213)
!245 = !DILocation(line: 103, column: 24, scope: !246)
!246 = distinct !DILexicalBlock(scope: !213, file: !3, line: 102, column: 47)
!247 = !DILocation(line: 104, column: 22, scope: !246)
!248 = distinct !{!248, !239, !249}
!249 = !DILocation(line: 105, column: 9, scope: !213)
!250 = !DILocation(line: 106, column: 16, scope: !251)
!251 = distinct !DILexicalBlock(scope: !213, file: !3, line: 106, column: 14)
!252 = !DILocation(line: 106, column: 14, scope: !213)
!253 = !DILocation(line: 107, column: 18, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !3, line: 106, column: 21)
!255 = !DILocation(line: 108, column: 17, scope: !254)
!256 = !DILocation(line: 108, column: 22, scope: !254)
!257 = !DILocation(line: 109, column: 23, scope: !254)
!258 = !DILocation(line: 109, column: 17, scope: !254)
!259 = !DILocation(line: 109, column: 21, scope: !254)
!260 = !DILocation(line: 110, column: 17, scope: !254)
!261 = !DILocation(line: 110, column: 27, scope: !254)
!262 = !DILocation(line: 111, column: 17, scope: !254)
!263 = !DILocation(line: 111, column: 23, scope: !254)
!264 = !DILocation(line: 112, column: 17, scope: !254)
!265 = !DILocation(line: 112, column: 22, scope: !254)
!266 = !DILocation(line: 113, column: 18, scope: !254)
!267 = !DILocation(line: 114, column: 9, scope: !254)
!268 = !DILocation(line: 115, column: 14, scope: !213)
!269 = !DILocalVariable(name: "we", scope: !134, file: !3, line: 92, type: !18)
!270 = !DILocation(line: 116, column: 27, scope: !213)
!271 = !DILocation(line: 116, column: 20, scope: !213)
!272 = !DILocation(line: 116, column: 13, scope: !213)
!273 = !DILocation(line: 116, column: 18, scope: !213)
!274 = !DILocation(line: 117, column: 24, scope: !213)
!275 = !DILocation(line: 117, column: 13, scope: !213)
!276 = !DILocation(line: 117, column: 18, scope: !213)
!277 = !DILocation(line: 118, column: 13, scope: !213)
!278 = !DILocation(line: 118, column: 19, scope: !213)
!279 = !DILocation(line: 119, column: 13, scope: !213)
!280 = !DILocation(line: 119, column: 22, scope: !213)
!281 = !DILocation(line: 120, column: 26, scope: !282)
!282 = distinct !DILexicalBlock(scope: !213, file: !3, line: 120, column: 14)
!283 = !DILocation(line: 120, column: 22, scope: !282)
!284 = !DILocation(line: 120, column: 20, scope: !282)
!285 = !DILocation(line: 120, column: 14, scope: !213)
!286 = !DILocation(line: 121, column: 25, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !3, line: 120, column: 37)
!288 = !DILocation(line: 121, column: 21, scope: !287)
!289 = !DILocation(line: 122, column: 23, scope: !287)
!290 = !DILocation(line: 123, column: 17, scope: !287)
!291 = !DILocation(line: 123, column: 22, scope: !287)
!292 = !DILocation(line: 124, column: 9, scope: !287)
!293 = !DILocation(line: 125, column: 31, scope: !294)
!294 = distinct !DILexicalBlock(scope: !282, file: !3, line: 125, column: 18)
!295 = !DILocation(line: 125, column: 27, scope: !294)
!296 = !DILocation(line: 125, column: 24, scope: !294)
!297 = !DILocation(line: 125, column: 18, scope: !282)
!298 = !DILocation(line: 126, column: 24, scope: !299)
!299 = distinct !DILexicalBlock(scope: !294, file: !3, line: 125, column: 42)
!300 = !DILocation(line: 126, column: 17, scope: !299)
!301 = !DILocation(line: 126, column: 22, scope: !299)
!302 = !DILocation(line: 127, column: 23, scope: !299)
!303 = !DILocation(line: 128, column: 9, scope: !299)
!304 = !DILocation(line: 130, column: 17, scope: !213)
!305 = distinct !{!305, !208, !306}
!306 = !DILocation(line: 131, column: 5, scope: !134)
!307 = !DILocation(line: 132, column: 5, scope: !134)
!308 = !DILocation(line: 133, column: 5, scope: !134)
!309 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 137, type: !310, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!310 = !DISubroutineType(types: !311)
!311 = !{!52}
!312 = !DILocation(line: 143, column: 10, scope: !309)
!313 = !DILocalVariable(name: "f1", scope: !309, file: !3, line: 141, type: !137)
!314 = !DILocation(line: 0, scope: !309)
!315 = !DILocation(line: 144, column: 5, scope: !309)
!316 = !DILocation(line: 145, column: 5, scope: !309)
!317 = !DILocation(line: 147, column: 10, scope: !309)
!318 = !DILocation(line: 150, column: 15, scope: !319)
!319 = distinct !DILexicalBlock(scope: !309, file: !3, line: 150, column: 5)
!320 = !DILocalVariable(name: "he", scope: !309, file: !3, line: 139, type: !8)
!321 = !DILocation(line: 150, column: 10, scope: !319)
!322 = !DILocation(line: 0, scope: !319)
!323 = !DILocation(line: 150, column: 5, scope: !319)
!324 = !DILocation(line: 151, column: 31, scope: !325)
!325 = distinct !DILexicalBlock(scope: !326, file: !3, line: 150, column: 45)
!326 = distinct !DILexicalBlock(scope: !319, file: !3, line: 150, column: 5)
!327 = !DILocation(line: 151, column: 27, scope: !325)
!328 = !DILocation(line: 151, column: 9, scope: !325)
!329 = !DILocation(line: 152, column: 22, scope: !330)
!330 = distinct !DILexicalBlock(scope: !325, file: !3, line: 152, column: 9)
!331 = !DILocalVariable(name: "we", scope: !309, file: !3, line: 140, type: !18)
!332 = !DILocation(line: 152, column: 13, scope: !330)
!333 = !DILocation(line: 0, scope: !330)
!334 = !DILocation(line: 152, column: 9, scope: !330)
!335 = !DILocation(line: 153, column: 36, scope: !336)
!336 = distinct !DILexicalBlock(scope: !337, file: !3, line: 152, column: 48)
!337 = distinct !DILexicalBlock(scope: !330, file: !3, line: 152, column: 9)
!338 = !DILocation(line: 153, column: 13, scope: !336)
!339 = !DILocation(line: 154, column: 9, scope: !336)
!340 = !DILocation(line: 152, column: 42, scope: !337)
!341 = !DILocation(line: 152, column: 9, scope: !337)
!342 = distinct !{!342, !334, !343}
!343 = !DILocation(line: 154, column: 9, scope: !330)
!344 = !DILocation(line: 155, column: 9, scope: !325)
!345 = !DILocation(line: 156, column: 5, scope: !325)
!346 = !DILocation(line: 150, column: 39, scope: !326)
!347 = !DILocation(line: 150, column: 5, scope: !326)
!348 = distinct !{!348, !323, !349}
!349 = !DILocation(line: 156, column: 5, scope: !319)
!350 = !DILocation(line: 158, column: 5, scope: !309)
!351 = !DILocation(line: 159, column: 5, scope: !309)
