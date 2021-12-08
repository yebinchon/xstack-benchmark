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
  call void @llvm.dbg.value(metadata i8* %a, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i8* %b, metadata !27, metadata !DIExpression()), !dbg !26
  %0 = bitcast i8* %a to %struct.kw_t*, !dbg !28
  %key = getelementptr inbounds %struct.kw_t, %struct.kw_t* %0, i32 0, i32 0, !dbg !29
  %1 = load i8*, i8** %key, align 8, !dbg !29
  %2 = bitcast i8* %b to %struct.kw_t*, !dbg !30
  %key1 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %2, i32 0, i32 0, !dbg !31
  %3 = load i8*, i8** %key1, align 8, !dbg !31
  %call = call i32 @strcmp(i8* %1, i8* %3) #6, !dbg !32
  ret i32 %call, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @sort_letters(i8* %s) #0 !dbg !34 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 0, metadata !40, metadata !DIExpression()), !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc25, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc26, %for.inc25 ], !dbg !43
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !40, metadata !DIExpression()), !dbg !39
  %idxprom = sext i32 %i.0 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !44
  %0 = load i8, i8* %arrayidx, align 1, !dbg !44
  %conv = sext i8 %0 to i32, !dbg !44
  %cmp = icmp ne i32 %conv, 0, !dbg !46
  br i1 %cmp, label %for.body, label %for.end27, !dbg !47

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 1, !dbg !48
  call void @llvm.dbg.value(metadata i32 %add, metadata !51, metadata !DIExpression()), !dbg !39
  br label %for.cond2, !dbg !52

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ %add, %for.body ], [ %inc, %for.inc ], !dbg !53
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !51, metadata !DIExpression()), !dbg !39
  %idxprom3 = sext i32 %j.0 to i64, !dbg !54
  %arrayidx4 = getelementptr inbounds i8, i8* %s, i64 %idxprom3, !dbg !54
  %1 = load i8, i8* %arrayidx4, align 1, !dbg !54
  %conv5 = sext i8 %1 to i32, !dbg !54
  %cmp6 = icmp ne i32 %conv5, 0, !dbg !56
  br i1 %cmp6, label %for.body8, label %for.end, !dbg !57

for.body8:                                        ; preds = %for.cond2
  %idxprom9 = sext i32 %j.0 to i64, !dbg !58
  %arrayidx10 = getelementptr inbounds i8, i8* %s, i64 %idxprom9, !dbg !58
  %2 = load i8, i8* %arrayidx10, align 1, !dbg !58
  %conv11 = sext i8 %2 to i32, !dbg !58
  %idxprom12 = sext i32 %i.0 to i64, !dbg !60
  %arrayidx13 = getelementptr inbounds i8, i8* %s, i64 %idxprom12, !dbg !60
  %3 = load i8, i8* %arrayidx13, align 1, !dbg !60
  %conv14 = sext i8 %3 to i32, !dbg !60
  %cmp15 = icmp slt i32 %conv11, %conv14, !dbg !61
  br i1 %cmp15, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %for.body8
  %idxprom17 = sext i32 %j.0 to i64, !dbg !63
  %arrayidx18 = getelementptr inbounds i8, i8* %s, i64 %idxprom17, !dbg !63
  %4 = load i8, i8* %arrayidx18, align 1, !dbg !63
  call void @llvm.dbg.value(metadata i8 %4, metadata !65, metadata !DIExpression()), !dbg !39
  %idxprom19 = sext i32 %i.0 to i64, !dbg !66
  %arrayidx20 = getelementptr inbounds i8, i8* %s, i64 %idxprom19, !dbg !66
  %5 = load i8, i8* %arrayidx20, align 1, !dbg !66
  %idxprom21 = sext i32 %j.0 to i64, !dbg !67
  %arrayidx22 = getelementptr inbounds i8, i8* %s, i64 %idxprom21, !dbg !67
  store i8 %5, i8* %arrayidx22, align 1, !dbg !68
  %idxprom23 = sext i32 %i.0 to i64, !dbg !69
  %arrayidx24 = getelementptr inbounds i8, i8* %s, i64 %idxprom23, !dbg !69
  store i8 %4, i8* %arrayidx24, align 1, !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %j.0, 1, !dbg !73
  call void @llvm.dbg.value(metadata i32 %inc, metadata !51, metadata !DIExpression()), !dbg !39
  br label %for.cond2, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond2
  br label %for.inc25, !dbg !77

for.inc25:                                        ; preds = %for.end
  %inc26 = add nsw i32 %i.0, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %inc26, metadata !40, metadata !DIExpression()), !dbg !39
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end27:                                        ; preds = %for.cond
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !83 {
entry:
  %s = alloca %struct.stat, align 8
  call void @llvm.dbg.declare(metadata %struct.stat* %s, metadata !86, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.value(metadata i32 0, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 0), !dbg !131
  call void @llvm.dbg.value(metadata i32 %call, metadata !132, metadata !DIExpression()), !dbg !130
  %cmp = icmp eq i32 %call, -1, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  br label %return, !dbg !136

if.end:                                           ; preds = %entry
  %call1 = call i32 @fstat(i32 %call, %struct.stat* %s) #7, !dbg !137
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !138
  %0 = load i64, i64* %st_size, align 8, !dbg !138
  %mul = mul nsw i64 %0, 2, !dbg !139
  %call2 = call noalias i8* @malloc(i64 %mul) #7, !dbg !140
  call void @llvm.dbg.value(metadata i8* %call2, metadata !141, metadata !DIExpression()), !dbg !130
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !142
  %1 = load i64, i64* %st_size3, align 8, !dbg !142
  %add.ptr = getelementptr inbounds i8, i8* %call2, i64 %1, !dbg !143
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !144, metadata !DIExpression()), !dbg !130
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !145
  %2 = load i64, i64* %st_size4, align 8, !dbg !145
  %call5 = call i64 @read(i32 %call, i8* %call2, i64 %2), !dbg !146
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !147
  %3 = load i64, i64* %st_size6, align 8, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %call2, i64 %3, i1 false), !dbg !148
  call void @llvm.dbg.value(metadata i64 0, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %j.0 = phi i64 [ 0, %if.end ], [ %j.1, %for.inc ], !dbg !155
  %i.0 = phi i64 [ 0, %if.end ], [ %inc16, %for.inc ], !dbg !155
  %n_word.0 = phi i32 [ 0, %if.end ], [ %n_word.1, %for.inc ], !dbg !130
  call void @llvm.dbg.value(metadata i32 %n_word.0, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !152, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.0, metadata !149, metadata !DIExpression()), !dbg !130
  %st_size7 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !156
  %4 = load i64, i64* %st_size7, align 8, !dbg !156
  %cmp8 = icmp ult i64 %i.0, %4, !dbg !158
  br i1 %cmp8, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, i8* %call2, i64 %i.0, !dbg !160
  %5 = load i8, i8* %arrayidx, align 1, !dbg !160
  %conv = sext i8 %5 to i32, !dbg !160
  %cmp9 = icmp eq i32 %conv, 10, !dbg !163
  br i1 %cmp9, label %if.then11, label %if.end15, !dbg !164

if.then11:                                        ; preds = %for.body
  %arrayidx12 = getelementptr inbounds i8, i8* %add.ptr, i64 %i.0, !dbg !165
  store i8 0, i8* %arrayidx12, align 1, !dbg !167
  %arrayidx13 = getelementptr inbounds i8, i8* %call2, i64 %i.0, !dbg !168
  store i8 0, i8* %arrayidx13, align 1, !dbg !169
  %add.ptr14 = getelementptr inbounds i8, i8* %add.ptr, i64 %j.0, !dbg !170
  call void @sort_letters(i8* %add.ptr14), !dbg !171
  %add = add i64 %i.0, 1, !dbg !172
  call void @llvm.dbg.value(metadata i64 %add, metadata !149, metadata !DIExpression()), !dbg !130
  %inc = add nsw i32 %n_word.0, 1, !dbg !173
  call void @llvm.dbg.value(metadata i32 %inc, metadata !129, metadata !DIExpression()), !dbg !130
  br label %if.end15, !dbg !174

if.end15:                                         ; preds = %if.then11, %for.body
  %j.1 = phi i64 [ %add, %if.then11 ], [ %j.0, %for.body ], !dbg !155
  %n_word.1 = phi i32 [ %inc, %if.then11 ], [ %n_word.0, %for.body ], !dbg !130
  call void @llvm.dbg.value(metadata i32 %n_word.1, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.1, metadata !149, metadata !DIExpression()), !dbg !130
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %if.end15
  %inc16 = add i64 %i.0, 1, !dbg !176
  call void @llvm.dbg.value(metadata i64 %inc16, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %conv17 = sext i32 %n_word.0 to i64, !dbg !180
  %call18 = call noalias i8* @calloc(i64 %conv17, i64 24) #7, !dbg !181
  %6 = bitcast i8* %call18 to %struct.kw_t*, !dbg !181
  call void @llvm.dbg.value(metadata %struct.kw_t* %6, metadata !182, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !184, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond19, !dbg !185

for.cond19:                                       ; preds = %for.inc36, %for.end
  %k.0 = phi i64 [ 0, %for.end ], [ %k.1, %for.inc36 ], !dbg !187
  %j.2 = phi i64 [ 0, %for.end ], [ %j.3, %for.inc36 ], !dbg !187
  %i.1 = phi i64 [ 0, %for.end ], [ %inc37, %for.inc36 ], !dbg !187
  call void @llvm.dbg.value(metadata i64 %i.1, metadata !152, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.2, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %k.0, metadata !184, metadata !DIExpression()), !dbg !130
  %st_size20 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !188
  %7 = load i64, i64* %st_size20, align 8, !dbg !188
  %cmp21 = icmp ult i64 %i.1, %7, !dbg !190
  br i1 %cmp21, label %for.body23, label %for.end38, !dbg !191

for.body23:                                       ; preds = %for.cond19
  %arrayidx24 = getelementptr inbounds i8, i8* %call2, i64 %i.1, !dbg !192
  %8 = load i8, i8* %arrayidx24, align 1, !dbg !192
  %conv25 = sext i8 %8 to i32, !dbg !192
  %cmp26 = icmp eq i32 %conv25, 0, !dbg !195
  br i1 %cmp26, label %if.then28, label %if.end35, !dbg !196

if.then28:                                        ; preds = %for.body23
  %add.ptr29 = getelementptr inbounds i8, i8* %add.ptr, i64 %k.0, !dbg !197
  %arrayidx30 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %j.2, !dbg !199
  %key = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx30, i32 0, i32 0, !dbg !200
  store i8* %add.ptr29, i8** %key, align 8, !dbg !201
  %add.ptr31 = getelementptr inbounds i8, i8* %call2, i64 %k.0, !dbg !202
  %arrayidx32 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %j.2, !dbg !203
  %word = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx32, i32 0, i32 1, !dbg !204
  store i8* %add.ptr31, i8** %word, align 8, !dbg !205
  %add33 = add i64 %i.1, 1, !dbg !206
  call void @llvm.dbg.value(metadata i64 %add33, metadata !184, metadata !DIExpression()), !dbg !130
  %inc34 = add i64 %j.2, 1, !dbg !207
  call void @llvm.dbg.value(metadata i64 %inc34, metadata !149, metadata !DIExpression()), !dbg !130
  br label %if.end35, !dbg !208

if.end35:                                         ; preds = %if.then28, %for.body23
  %k.1 = phi i64 [ %add33, %if.then28 ], [ %k.0, %for.body23 ], !dbg !187
  %j.3 = phi i64 [ %inc34, %if.then28 ], [ %j.2, %for.body23 ], !dbg !187
  call void @llvm.dbg.value(metadata i64 %j.3, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %k.1, metadata !184, metadata !DIExpression()), !dbg !130
  br label %for.inc36, !dbg !209

for.inc36:                                        ; preds = %if.end35
  %inc37 = add i64 %i.1, 1, !dbg !210
  call void @llvm.dbg.value(metadata i64 %inc37, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond19, !dbg !211, !llvm.loop !212

for.end38:                                        ; preds = %for.cond19
  %9 = bitcast %struct.kw_t* %6 to i8*, !dbg !214
  %conv39 = sext i32 %n_word.0 to i64, !dbg !215
  call void @qsort(i8* %9, i64 %conv39, i64 24, i32 (i8*, i8*)* @lst_cmp), !dbg !216
  call void @llvm.dbg.value(metadata i64 0, metadata !217, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !218, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !184, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond40, !dbg !219

for.cond40:                                       ; preds = %for.inc67, %for.end38
  %longest.0 = phi i64 [ 0, %for.end38 ], [ %longest.1, %for.inc67 ], !dbg !221
  %k.2 = phi i64 [ 0, %for.end38 ], [ %k.3, %for.inc67 ], !dbg !222
  %j.4 = phi i64 [ 0, %for.end38 ], [ %j.6, %for.inc67 ], !dbg !222
  %i.2 = phi i64 [ 0, %for.end38 ], [ %inc68, %for.inc67 ], !dbg !222
  %offset.0 = phi i64 [ 0, %for.end38 ], [ %offset.3, %for.inc67 ], !dbg !223
  call void @llvm.dbg.value(metadata i64 %offset.0, metadata !218, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %i.2, metadata !152, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.4, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %k.2, metadata !184, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %longest.0, metadata !217, metadata !DIExpression()), !dbg !130
  %conv41 = sext i32 %n_word.0 to i64, !dbg !224
  %cmp42 = icmp ult i64 %i.2, %conv41, !dbg !226
  br i1 %cmp42, label %for.body44, label %for.end69, !dbg !227

for.body44:                                       ; preds = %for.cond40
  %arrayidx45 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %i.2, !dbg !228
  %key46 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx45, i32 0, i32 0, !dbg !231
  %10 = load i8*, i8** %key46, align 8, !dbg !231
  %arrayidx47 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %j.4, !dbg !232
  %key48 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx47, i32 0, i32 0, !dbg !233
  %11 = load i8*, i8** %key48, align 8, !dbg !233
  %call49 = call i32 @strcmp(i8* %10, i8* %11) #6, !dbg !234
  %tobool = icmp ne i32 %call49, 0, !dbg !234
  br i1 %tobool, label %if.end52, label %if.then50, !dbg !235

if.then50:                                        ; preds = %for.body44
  %inc51 = add i64 %k.2, 1, !dbg !236
  call void @llvm.dbg.value(metadata i64 %inc51, metadata !184, metadata !DIExpression()), !dbg !130
  br label %for.inc67, !dbg !238

if.end52:                                         ; preds = %for.body44
  %cmp53 = icmp ult i64 %k.2, %longest.0, !dbg !239
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !241

if.then55:                                        ; preds = %if.end52
  call void @llvm.dbg.value(metadata i64 0, metadata !184, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %i.2, metadata !149, metadata !DIExpression()), !dbg !130
  br label %for.inc67, !dbg !242

if.end56:                                         ; preds = %if.end52
  %cmp57 = icmp ugt i64 %k.2, %longest.0, !dbg !244
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !246

if.then59:                                        ; preds = %if.end56
  call void @llvm.dbg.value(metadata i64 0, metadata !218, metadata !DIExpression()), !dbg !130
  br label %if.end60, !dbg !247

if.end60:                                         ; preds = %if.then59, %if.end56
  %offset.1 = phi i64 [ 0, %if.then59 ], [ %offset.0, %if.end56 ], !dbg !222
  call void @llvm.dbg.value(metadata i64 %offset.1, metadata !218, metadata !DIExpression()), !dbg !130
  br label %while.cond, !dbg !248

while.cond:                                       ; preds = %while.body, %if.end60
  %j.5 = phi i64 [ %j.4, %if.end60 ], [ %inc65, %while.body ], !dbg !222
  %offset.2 = phi i64 [ %offset.1, %if.end60 ], [ %inc63, %while.body ], !dbg !249
  call void @llvm.dbg.value(metadata i64 %offset.2, metadata !218, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.5, metadata !149, metadata !DIExpression()), !dbg !130
  %cmp61 = icmp ult i64 %j.5, %i.2, !dbg !250
  br i1 %cmp61, label %while.body, label %while.end, !dbg !248

while.body:                                       ; preds = %while.cond
  %inc63 = add i64 %offset.2, 1, !dbg !251
  call void @llvm.dbg.value(metadata i64 %inc63, metadata !218, metadata !DIExpression()), !dbg !130
  %arrayidx64 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %offset.2, !dbg !252
  %inc65 = add i64 %j.5, 1, !dbg !253
  call void @llvm.dbg.value(metadata i64 %inc65, metadata !149, metadata !DIExpression()), !dbg !130
  %arrayidx66 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %j.5, !dbg !254
  %12 = bitcast %struct.kw_t* %arrayidx64 to i8*, !dbg !254
  %13 = bitcast %struct.kw_t* %arrayidx66 to i8*, !dbg !254
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 24, i1 false), !dbg !254
  br label %while.cond, !dbg !248, !llvm.loop !255

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.value(metadata i64 %k.2, metadata !217, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 0, metadata !184, metadata !DIExpression()), !dbg !130
  br label %for.inc67, !dbg !257

for.inc67:                                        ; preds = %while.end, %if.then55, %if.then50
  %longest.1 = phi i64 [ %longest.0, %if.then55 ], [ %k.2, %while.end ], [ %longest.0, %if.then50 ], !dbg !222
  %k.3 = phi i64 [ 0, %if.then55 ], [ 0, %while.end ], [ %inc51, %if.then50 ], !dbg !249
  %j.6 = phi i64 [ %i.2, %if.then55 ], [ %j.5, %while.end ], [ %j.4, %if.then50 ], !dbg !222
  %offset.3 = phi i64 [ %offset.0, %if.then55 ], [ %offset.2, %while.end ], [ %offset.0, %if.then50 ], !dbg !222
  call void @llvm.dbg.value(metadata i64 %offset.3, metadata !218, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %j.6, metadata !149, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %k.3, metadata !184, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i64 %longest.1, metadata !217, metadata !DIExpression()), !dbg !130
  %inc68 = add i64 %i.2, 1, !dbg !258
  call void @llvm.dbg.value(metadata i64 %inc68, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond40, !dbg !259, !llvm.loop !260

for.end69:                                        ; preds = %for.cond40
  call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond70, !dbg !262

for.cond70:                                       ; preds = %for.inc90, %for.end69
  %i.3 = phi i64 [ 0, %for.end69 ], [ %inc91, %for.inc90 ], !dbg !264
  call void @llvm.dbg.value(metadata i64 %i.3, metadata !152, metadata !DIExpression()), !dbg !130
  %cmp71 = icmp ult i64 %i.3, %offset.0, !dbg !265
  br i1 %cmp71, label %for.body73, label %for.end92, !dbg !267

for.body73:                                       ; preds = %for.cond70
  %arrayidx74 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %i.3, !dbg !268
  %word75 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx74, i32 0, i32 1, !dbg !270
  %14 = load i8*, i8** %word75, align 8, !dbg !270
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %14), !dbg !271
  %sub = sub nsw i32 %n_word.0, 1, !dbg !272
  %conv77 = sext i32 %sub to i64, !dbg !274
  %cmp78 = icmp ult i64 %i.3, %conv77, !dbg !275
  br i1 %cmp78, label %land.lhs.true, label %if.end89, !dbg !276

land.lhs.true:                                    ; preds = %for.body73
  %arrayidx80 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %i.3, !dbg !277
  %key81 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx80, i32 0, i32 0, !dbg !278
  %15 = load i8*, i8** %key81, align 8, !dbg !278
  %add82 = add i64 %i.3, 1, !dbg !279
  %arrayidx83 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %6, i64 %add82, !dbg !280
  %key84 = getelementptr inbounds %struct.kw_t, %struct.kw_t* %arrayidx83, i32 0, i32 0, !dbg !281
  %16 = load i8*, i8** %key84, align 8, !dbg !281
  %call85 = call i32 @strcmp(i8* %15, i8* %16) #6, !dbg !282
  %tobool86 = icmp ne i32 %call85, 0, !dbg !282
  br i1 %tobool86, label %if.then87, label %if.end89, !dbg !283

if.then87:                                        ; preds = %land.lhs.true
  %call88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !284
  br label %if.end89, !dbg !284

if.end89:                                         ; preds = %if.then87, %land.lhs.true, %for.body73
  br label %for.inc90, !dbg !285

for.inc90:                                        ; preds = %if.end89
  %inc91 = add i64 %i.3, 1, !dbg !286
  call void @llvm.dbg.value(metadata i64 %inc91, metadata !152, metadata !DIExpression()), !dbg !130
  br label %for.cond70, !dbg !287, !llvm.loop !288

for.end92:                                        ; preds = %for.cond70
  %call93 = call i32 @close(i32 %call), !dbg !290
  br label %return, !dbg !291

return:                                           ; preds = %for.end92, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %for.end92 ], !dbg !130
  ret i32 %retval.0, !dbg !292
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!26 = !DILocation(line: 0, scope: !20)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !1, line: 11, type: !23)
!28 = !DILocation(line: 13, column: 17, scope: !20)
!29 = !DILocation(line: 13, column: 34, scope: !20)
!30 = !DILocation(line: 13, column: 40, scope: !20)
!31 = !DILocation(line: 13, column: 57, scope: !20)
!32 = !DILocation(line: 13, column: 9, scope: !20)
!33 = !DILocation(line: 13, column: 2, scope: !20)
!34 = distinct !DISubprogram(name: "sort_letters", scope: !1, file: !1, line: 17, type: !35, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!38 = !DILocalVariable(name: "s", arg: 1, scope: !34, file: !1, line: 17, type: !37)
!39 = !DILocation(line: 0, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 19, type: !15)
!41 = !DILocation(line: 21, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !1, line: 21, column: 2)
!43 = !DILocation(line: 0, scope: !42)
!44 = !DILocation(line: 21, column: 14, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 21, column: 2)
!46 = !DILocation(line: 21, column: 19, scope: !45)
!47 = !DILocation(line: 21, column: 2, scope: !42)
!48 = !DILocation(line: 22, column: 14, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 22, column: 3)
!50 = distinct !DILexicalBlock(scope: !45, file: !1, line: 21, column: 33)
!51 = !DILocalVariable(name: "j", scope: !34, file: !1, line: 19, type: !15)
!52 = !DILocation(line: 22, column: 8, scope: !49)
!53 = !DILocation(line: 0, scope: !49)
!54 = !DILocation(line: 22, column: 19, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 22, column: 3)
!56 = !DILocation(line: 22, column: 24, scope: !55)
!57 = !DILocation(line: 22, column: 3, scope: !49)
!58 = !DILocation(line: 23, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 23, column: 8)
!60 = !DILocation(line: 23, column: 15, scope: !59)
!61 = !DILocation(line: 23, column: 13, scope: !59)
!62 = !DILocation(line: 23, column: 8, scope: !55)
!63 = !DILocation(line: 24, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 23, column: 21)
!65 = !DILocalVariable(name: "t", scope: !34, file: !1, line: 20, type: !12)
!66 = !DILocation(line: 24, column: 22, scope: !64)
!67 = !DILocation(line: 24, column: 15, scope: !64)
!68 = !DILocation(line: 24, column: 20, scope: !64)
!69 = !DILocation(line: 24, column: 28, scope: !64)
!70 = !DILocation(line: 24, column: 33, scope: !64)
!71 = !DILocation(line: 25, column: 4, scope: !64)
!72 = !DILocation(line: 23, column: 18, scope: !59)
!73 = !DILocation(line: 22, column: 34, scope: !55)
!74 = !DILocation(line: 22, column: 3, scope: !55)
!75 = distinct !{!75, !57, !76}
!76 = !DILocation(line: 25, column: 4, scope: !49)
!77 = !DILocation(line: 26, column: 2, scope: !50)
!78 = !DILocation(line: 21, column: 29, scope: !45)
!79 = !DILocation(line: 21, column: 2, scope: !45)
!80 = distinct !{!80, !47, !81}
!81 = !DILocation(line: 26, column: 2, scope: !42)
!82 = !DILocation(line: 27, column: 1, scope: !34)
!83 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !84, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!15}
!86 = !DILocalVariable(name: "s", scope: !83, file: !1, line: 31, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !88, line: 46, size: 1152, elements: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!89 = !{!90, !94, !96, !98, !101, !103, !105, !106, !107, !110, !112, !114, !122, !123, !124}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !87, file: !88, line: 48, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !92, line: 145, baseType: !93)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!93 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !87, file: !88, line: 53, baseType: !95, size: 64, offset: 64)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !92, line: 148, baseType: !93)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !87, file: !88, line: 61, baseType: !97, size: 64, offset: 128)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !92, line: 151, baseType: !93)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !87, file: !88, line: 62, baseType: !99, size: 32, offset: 192)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !92, line: 150, baseType: !100)
!100 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !87, file: !88, line: 64, baseType: !102, size: 32, offset: 224)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !92, line: 146, baseType: !100)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !87, file: !88, line: 65, baseType: !104, size: 32, offset: 256)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !92, line: 147, baseType: !100)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !87, file: !88, line: 67, baseType: !15, size: 32, offset: 288)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !87, file: !88, line: 69, baseType: !91, size: 64, offset: 320)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !87, file: !88, line: 74, baseType: !108, size: 64, offset: 384)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !92, line: 152, baseType: !109)
!109 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !87, file: !88, line: 78, baseType: !111, size: 64, offset: 448)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !92, line: 174, baseType: !109)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !87, file: !88, line: 80, baseType: !113, size: 64, offset: 512)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !92, line: 179, baseType: !109)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !87, file: !88, line: 91, baseType: !115, size: 128, offset: 576)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !116, line: 10, size: 128, elements: !117)
!116 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!117 = !{!118, !120}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !115, file: !116, line: 12, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !92, line: 160, baseType: !109)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !115, file: !116, line: 16, baseType: !121, size: 64, offset: 64)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !92, line: 196, baseType: !109)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !87, file: !88, line: 92, baseType: !115, size: 128, offset: 704)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !87, file: !88, line: 93, baseType: !115, size: 128, offset: 832)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !87, file: !88, line: 106, baseType: !125, size: 192, offset: 960)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !121, size: 192, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 3)
!128 = !DILocation(line: 31, column: 14, scope: !83)
!129 = !DILocalVariable(name: "n_word", scope: !83, file: !1, line: 34, type: !15)
!130 = !DILocation(line: 0, scope: !83)
!131 = !DILocation(line: 37, column: 11, scope: !83)
!132 = !DILocalVariable(name: "fd", scope: !83, file: !1, line: 37, type: !15)
!133 = !DILocation(line: 38, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !83, file: !1, line: 38, column: 6)
!135 = !DILocation(line: 38, column: 6, scope: !83)
!136 = !DILocation(line: 38, column: 16, scope: !134)
!137 = !DILocation(line: 39, column: 2, scope: !83)
!138 = !DILocation(line: 40, column: 19, scope: !83)
!139 = !DILocation(line: 40, column: 27, scope: !83)
!140 = !DILocation(line: 40, column: 10, scope: !83)
!141 = !DILocalVariable(name: "words", scope: !83, file: !1, line: 32, type: !37)
!142 = !DILocation(line: 41, column: 20, scope: !83)
!143 = !DILocation(line: 41, column: 16, scope: !83)
!144 = !DILocalVariable(name: "keys", scope: !83, file: !1, line: 32, type: !37)
!145 = !DILocation(line: 43, column: 20, scope: !83)
!146 = !DILocation(line: 43, column: 2, scope: !83)
!147 = !DILocation(line: 44, column: 24, scope: !83)
!148 = !DILocation(line: 44, column: 2, scope: !83)
!149 = !DILocalVariable(name: "j", scope: !83, file: !1, line: 33, type: !150)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !151, line: 46, baseType: !93)
!151 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!152 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 33, type: !150)
!153 = !DILocation(line: 47, column: 7, scope: !154)
!154 = distinct !DILexicalBlock(scope: !83, file: !1, line: 47, column: 2)
!155 = !DILocation(line: 0, scope: !154)
!156 = !DILocation(line: 47, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 47, column: 2)
!158 = !DILocation(line: 47, column: 20, scope: !157)
!159 = !DILocation(line: 47, column: 2, scope: !154)
!160 = !DILocation(line: 48, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !1, line: 48, column: 7)
!162 = distinct !DILexicalBlock(scope: !157, file: !1, line: 47, column: 38)
!163 = !DILocation(line: 48, column: 16, scope: !161)
!164 = !DILocation(line: 48, column: 7, scope: !162)
!165 = !DILocation(line: 49, column: 15, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !1, line: 48, column: 25)
!167 = !DILocation(line: 49, column: 23, scope: !166)
!168 = !DILocation(line: 49, column: 4, scope: !166)
!169 = !DILocation(line: 49, column: 13, scope: !166)
!170 = !DILocation(line: 50, column: 22, scope: !166)
!171 = !DILocation(line: 50, column: 4, scope: !166)
!172 = !DILocation(line: 51, column: 10, scope: !166)
!173 = !DILocation(line: 52, column: 11, scope: !166)
!174 = !DILocation(line: 53, column: 3, scope: !166)
!175 = !DILocation(line: 54, column: 2, scope: !162)
!176 = !DILocation(line: 47, column: 34, scope: !157)
!177 = !DILocation(line: 47, column: 2, scope: !157)
!178 = distinct !{!178, !159, !179}
!179 = !DILocation(line: 54, column: 2, scope: !154)
!180 = !DILocation(line: 56, column: 16, scope: !83)
!181 = !DILocation(line: 56, column: 9, scope: !83)
!182 = !DILocalVariable(name: "list", scope: !83, file: !1, line: 35, type: !183)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!184 = !DILocalVariable(name: "k", scope: !83, file: !1, line: 33, type: !150)
!185 = !DILocation(line: 59, column: 7, scope: !186)
!186 = distinct !DILexicalBlock(scope: !83, file: !1, line: 59, column: 2)
!187 = !DILocation(line: 0, scope: !186)
!188 = !DILocation(line: 59, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !1, line: 59, column: 2)
!190 = !DILocation(line: 59, column: 24, scope: !189)
!191 = !DILocation(line: 59, column: 2, scope: !186)
!192 = !DILocation(line: 60, column: 7, scope: !193)
!193 = distinct !DILexicalBlock(scope: !194, file: !1, line: 60, column: 7)
!194 = distinct !DILexicalBlock(scope: !189, file: !1, line: 59, column: 42)
!195 = !DILocation(line: 60, column: 16, scope: !193)
!196 = !DILocation(line: 60, column: 7, scope: !194)
!197 = !DILocation(line: 61, column: 23, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !1, line: 60, column: 25)
!199 = !DILocation(line: 61, column: 4, scope: !198)
!200 = !DILocation(line: 61, column: 12, scope: !198)
!201 = !DILocation(line: 61, column: 16, scope: !198)
!202 = !DILocation(line: 62, column: 25, scope: !198)
!203 = !DILocation(line: 62, column: 4, scope: !198)
!204 = !DILocation(line: 62, column: 12, scope: !198)
!205 = !DILocation(line: 62, column: 17, scope: !198)
!206 = !DILocation(line: 63, column: 10, scope: !198)
!207 = !DILocation(line: 64, column: 5, scope: !198)
!208 = !DILocation(line: 65, column: 3, scope: !198)
!209 = !DILocation(line: 66, column: 2, scope: !194)
!210 = !DILocation(line: 59, column: 38, scope: !189)
!211 = !DILocation(line: 59, column: 2, scope: !189)
!212 = distinct !{!212, !191, !213}
!213 = !DILocation(line: 66, column: 2, scope: !186)
!214 = !DILocation(line: 68, column: 8, scope: !83)
!215 = !DILocation(line: 68, column: 14, scope: !83)
!216 = !DILocation(line: 68, column: 2, scope: !83)
!217 = !DILocalVariable(name: "longest", scope: !83, file: !1, line: 33, type: !150)
!218 = !DILocalVariable(name: "offset", scope: !83, file: !1, line: 33, type: !150)
!219 = !DILocation(line: 71, column: 7, scope: !220)
!220 = distinct !DILexicalBlock(scope: !83, file: !1, line: 71, column: 2)
!221 = !DILocation(line: 71, column: 36, scope: !220)
!222 = !DILocation(line: 0, scope: !220)
!223 = !DILocation(line: 71, column: 26, scope: !220)
!224 = !DILocation(line: 71, column: 45, scope: !225)
!225 = distinct !DILexicalBlock(scope: !220, file: !1, line: 71, column: 2)
!226 = !DILocation(line: 71, column: 43, scope: !225)
!227 = !DILocation(line: 71, column: 2, scope: !220)
!228 = !DILocation(line: 72, column: 15, scope: !229)
!229 = distinct !DILexicalBlock(scope: !230, file: !1, line: 72, column: 7)
!230 = distinct !DILexicalBlock(scope: !225, file: !1, line: 71, column: 58)
!231 = !DILocation(line: 72, column: 23, scope: !229)
!232 = !DILocation(line: 72, column: 28, scope: !229)
!233 = !DILocation(line: 72, column: 36, scope: !229)
!234 = !DILocation(line: 72, column: 8, scope: !229)
!235 = !DILocation(line: 72, column: 7, scope: !230)
!236 = !DILocation(line: 73, column: 4, scope: !237)
!237 = distinct !DILexicalBlock(scope: !229, file: !1, line: 72, column: 42)
!238 = !DILocation(line: 74, column: 4, scope: !237)
!239 = !DILocation(line: 78, column: 9, scope: !240)
!240 = distinct !DILexicalBlock(scope: !230, file: !1, line: 78, column: 7)
!241 = !DILocation(line: 78, column: 7, scope: !230)
!242 = !DILocation(line: 81, column: 4, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !1, line: 78, column: 20)
!244 = !DILocation(line: 84, column: 9, scope: !245)
!245 = distinct !DILexicalBlock(scope: !230, file: !1, line: 84, column: 7)
!246 = !DILocation(line: 84, column: 7, scope: !230)
!247 = !DILocation(line: 84, column: 20, scope: !245)
!248 = !DILocation(line: 86, column: 3, scope: !230)
!249 = !DILocation(line: 0, scope: !230)
!250 = !DILocation(line: 86, column: 12, scope: !230)
!251 = !DILocation(line: 86, column: 28, scope: !230)
!252 = !DILocation(line: 86, column: 17, scope: !230)
!253 = !DILocation(line: 86, column: 40, scope: !230)
!254 = !DILocation(line: 86, column: 34, scope: !230)
!255 = distinct !{!255, !248, !256}
!256 = !DILocation(line: 86, column: 42, scope: !230)
!257 = !DILocation(line: 89, column: 2, scope: !230)
!258 = !DILocation(line: 71, column: 54, scope: !225)
!259 = !DILocation(line: 71, column: 2, scope: !225)
!260 = distinct !{!260, !227, !261}
!261 = !DILocation(line: 89, column: 2, scope: !220)
!262 = !DILocation(line: 92, column: 7, scope: !263)
!263 = distinct !DILexicalBlock(scope: !83, file: !1, line: 92, column: 2)
!264 = !DILocation(line: 0, scope: !263)
!265 = !DILocation(line: 92, column: 16, scope: !266)
!266 = distinct !DILexicalBlock(scope: !263, file: !1, line: 92, column: 2)
!267 = !DILocation(line: 92, column: 2, scope: !263)
!268 = !DILocation(line: 93, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !1, line: 92, column: 31)
!270 = !DILocation(line: 93, column: 25, scope: !269)
!271 = !DILocation(line: 93, column: 3, scope: !269)
!272 = !DILocation(line: 94, column: 18, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !1, line: 94, column: 7)
!274 = !DILocation(line: 94, column: 11, scope: !273)
!275 = !DILocation(line: 94, column: 9, scope: !273)
!276 = !DILocation(line: 94, column: 22, scope: !273)
!277 = !DILocation(line: 94, column: 32, scope: !273)
!278 = !DILocation(line: 94, column: 40, scope: !273)
!279 = !DILocation(line: 94, column: 51, scope: !273)
!280 = !DILocation(line: 94, column: 45, scope: !273)
!281 = !DILocation(line: 94, column: 55, scope: !273)
!282 = !DILocation(line: 94, column: 25, scope: !273)
!283 = !DILocation(line: 94, column: 7, scope: !269)
!284 = !DILocation(line: 95, column: 4, scope: !273)
!285 = !DILocation(line: 96, column: 2, scope: !269)
!286 = !DILocation(line: 92, column: 27, scope: !266)
!287 = !DILocation(line: 92, column: 2, scope: !266)
!288 = distinct !{!288, !267, !289}
!289 = !DILocation(line: 96, column: 2, scope: !263)
!290 = !DILocation(line: 99, column: 2, scope: !83)
!291 = !DILocation(line: 100, column: 2, scope: !83)
!292 = !DILocation(line: 101, column: 1, scope: !83)
