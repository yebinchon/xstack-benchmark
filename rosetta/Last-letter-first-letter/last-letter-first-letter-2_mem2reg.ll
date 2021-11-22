; ModuleID = 'last-letter-first-letter-2.ll'
source_filename = "last-letter-first-letter-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { [26 x %struct.edge*], i32, i32, [26 x i32], [26 x i32] }
%struct.edge = type { i8, i8, i8*, %struct.edge* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.chain = type { %struct.edge*, %struct.edge*, i32, [26 x i32] }

@nodes = common dso_local global [26 x %struct.node] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"poke646\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@n_names = common dso_local global i32 0, align 4, !dbg !41
@tmp = common dso_local global %struct.edge** null, align 8, !dbg !38
@names = common dso_local global %struct.edge* null, align 8, !dbg !25
@.str.2 = private unnamed_addr constant [45 x i8] c"bad name %s: first/last char must be letter\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"read %d names\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c" %s\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"longest found: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @store_edge(%struct.edge* %g) #0 !dbg !60 {
entry:
  call void @llvm.dbg.value(metadata %struct.edge* %g, metadata !64, metadata !DIExpression()), !dbg !65
  %tobool = icmp ne %struct.edge* %g, null, !dbg !66
  br i1 %tobool, label %if.end, label %if.then, !dbg !68, !cf.info !69

if.then:                                          ; preds = %entry
  br label %return, !dbg !70

if.end:                                           ; preds = %entry
  %e = getelementptr inbounds %struct.edge, %struct.edge* %g, i32 0, i32 1, !dbg !71
  %0 = load i8, i8* %e, align 1, !dbg !71
  %conv = sext i8 %0 to i32, !dbg !72
  call void @llvm.dbg.value(metadata i32 %conv, metadata !73, metadata !DIExpression()), !dbg !65
  %s = getelementptr inbounds %struct.edge, %struct.edge* %g, i32 0, i32 0, !dbg !74
  %1 = load i8, i8* %s, align 8, !dbg !74
  %conv1 = sext i8 %1 to i32, !dbg !75
  call void @llvm.dbg.value(metadata i32 %conv1, metadata !76, metadata !DIExpression()), !dbg !65
  %idx.ext = sext i32 %conv1 to i64, !dbg !77
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext, !dbg !77
  call void @llvm.dbg.value(metadata %struct.node* %add.ptr, metadata !78, metadata !DIExpression()), !dbg !65
  %e2 = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 0, !dbg !80
  %idxprom = sext i32 %conv to i64, !dbg !81
  %arrayidx = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e2, i64 0, i64 %idxprom, !dbg !81
  %2 = load %struct.edge*, %struct.edge** %arrayidx, align 8, !dbg !81
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %g, i32 0, i32 3, !dbg !82
  store %struct.edge* %2, %struct.edge** %lnk, align 8, !dbg !83
  %e3 = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 0, !dbg !84
  %idxprom4 = sext i32 %conv to i64, !dbg !85
  %arrayidx5 = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e3, i64 0, i64 %idxprom4, !dbg !85
  store %struct.edge* %g, %struct.edge** %arrayidx5, align 8, !dbg !86
  %out = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 4, !dbg !87
  %idxprom6 = sext i32 %conv to i64, !dbg !88
  %arrayidx7 = getelementptr inbounds [26 x i32], [26 x i32]* %out, i64 0, i64 %idxprom6, !dbg !88
  %3 = load i32, i32* %arrayidx7, align 4, !dbg !89
  %inc = add nsw i32 %3, 1, !dbg !89
  store i32 %inc, i32* %arrayidx7, align 4, !dbg !89
  %nout = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 2, !dbg !90
  %4 = load i32, i32* %nout, align 4, !dbg !91
  %inc8 = add nsw i32 %4, 1, !dbg !91
  store i32 %inc8, i32* %nout, align 4, !dbg !91
  %idx.ext9 = sext i32 %conv to i64, !dbg !92
  %add.ptr10 = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext9, !dbg !92
  call void @llvm.dbg.value(metadata %struct.node* %add.ptr10, metadata !78, metadata !DIExpression()), !dbg !65
  %in = getelementptr inbounds %struct.node, %struct.node* %add.ptr10, i32 0, i32 3, !dbg !93
  %idxprom11 = sext i32 %conv1 to i64, !dbg !94
  %arrayidx12 = getelementptr inbounds [26 x i32], [26 x i32]* %in, i64 0, i64 %idxprom11, !dbg !94
  %5 = load i32, i32* %arrayidx12, align 4, !dbg !95
  %inc13 = add nsw i32 %5, 1, !dbg !95
  store i32 %inc13, i32* %arrayidx12, align 4, !dbg !95
  %nin = getelementptr inbounds %struct.node, %struct.node* %add.ptr10, i32 0, i32 1, !dbg !96
  %6 = load i32, i32* %nin, align 8, !dbg !97
  %inc14 = add nsw i32 %6, 1, !dbg !97
  store i32 %inc14, i32* %nin, align 8, !dbg !97
  br label %return, !dbg !98

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !98
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.edge* @remove_edge(i32 %i, i32 %j) #0 !dbg !99 {
entry:
  call void @llvm.dbg.value(metadata i32 %i, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.value(metadata i32 %j, metadata !104, metadata !DIExpression()), !dbg !103
  %idx.ext = sext i32 %i to i64, !dbg !105
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext, !dbg !105
  call void @llvm.dbg.value(metadata %struct.node* %add.ptr, metadata !106, metadata !DIExpression()), !dbg !103
  %e = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 0, !dbg !107
  %idxprom = sext i32 %j to i64, !dbg !108
  %arrayidx = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e, i64 0, i64 %idxprom, !dbg !108
  %0 = load %struct.edge*, %struct.edge** %arrayidx, align 8, !dbg !108
  call void @llvm.dbg.value(metadata %struct.edge* %0, metadata !109, metadata !DIExpression()), !dbg !103
  %tobool = icmp ne %struct.edge* %0, null, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112, !cf.info !69

if.then:                                          ; preds = %entry
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %0, i32 0, i32 3, !dbg !113
  %1 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !113
  %e1 = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 0, !dbg !115
  %idxprom2 = sext i32 %j to i64, !dbg !116
  %arrayidx3 = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e1, i64 0, i64 %idxprom2, !dbg !116
  store %struct.edge* %1, %struct.edge** %arrayidx3, align 8, !dbg !117
  %lnk4 = getelementptr inbounds %struct.edge, %struct.edge* %0, i32 0, i32 3, !dbg !118
  store %struct.edge* null, %struct.edge** %lnk4, align 8, !dbg !119
  %out = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 4, !dbg !120
  %idxprom5 = sext i32 %j to i64, !dbg !121
  %arrayidx6 = getelementptr inbounds [26 x i32], [26 x i32]* %out, i64 0, i64 %idxprom5, !dbg !121
  %2 = load i32, i32* %arrayidx6, align 4, !dbg !122
  %dec = add nsw i32 %2, -1, !dbg !122
  store i32 %dec, i32* %arrayidx6, align 4, !dbg !122
  %nout = getelementptr inbounds %struct.node, %struct.node* %add.ptr, i32 0, i32 2, !dbg !123
  %3 = load i32, i32* %nout, align 4, !dbg !124
  %dec7 = add nsw i32 %3, -1, !dbg !124
  store i32 %dec7, i32* %nout, align 4, !dbg !124
  %idx.ext8 = sext i32 %j to i64, !dbg !125
  %add.ptr9 = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext8, !dbg !125
  call void @llvm.dbg.value(metadata %struct.node* %add.ptr9, metadata !106, metadata !DIExpression()), !dbg !103
  %in = getelementptr inbounds %struct.node, %struct.node* %add.ptr9, i32 0, i32 3, !dbg !126
  %idxprom10 = sext i32 %i to i64, !dbg !127
  %arrayidx11 = getelementptr inbounds [26 x i32], [26 x i32]* %in, i64 0, i64 %idxprom10, !dbg !127
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !128
  %dec12 = add nsw i32 %4, -1, !dbg !128
  store i32 %dec12, i32* %arrayidx11, align 4, !dbg !128
  %nin = getelementptr inbounds %struct.node, %struct.node* %add.ptr9, i32 0, i32 1, !dbg !129
  %5 = load i32, i32* %nin, align 8, !dbg !130
  %dec13 = add nsw i32 %5, -1, !dbg !130
  store i32 %dec13, i32* %nin, align 8, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  ret %struct.edge* %0, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @read_names() #0 !dbg !133 {
entry:
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !136
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !137, metadata !DIExpression()), !dbg !197
  %tobool = icmp ne %struct._IO_FILE* %call, null, !dbg !198
  br i1 %tobool, label %if.end, label %if.then, !dbg !200, !cf.info !69

if.then:                                          ; preds = %entry
  call void @abort() #8, !dbg !201
  unreachable, !dbg !201

if.end:                                           ; preds = %entry
  %call1 = call i32 @fseek(%struct._IO_FILE* %call, i64 0, i32 2), !dbg !202
  %call2 = call i64 @ftell(%struct._IO_FILE* %call), !dbg !203
  %conv = trunc i64 %call2 to i32, !dbg !203
  call void @llvm.dbg.value(metadata i32 %conv, metadata !204, metadata !DIExpression()), !dbg !197
  %add = add nsw i32 %conv, 1, !dbg !205
  %conv3 = sext i32 %add to i64, !dbg !206
  %call4 = call noalias i8* @malloc(i64 %conv3) #9, !dbg !207
  call void @llvm.dbg.value(metadata i8* %call4, metadata !208, metadata !DIExpression()), !dbg !197
  %call5 = call i32 @fseek(%struct._IO_FILE* %call, i64 0, i32 0), !dbg !209
  %conv6 = sext i32 %conv to i64, !dbg !210
  %call7 = call i64 @fread(i8* %call4, i64 1, i64 %conv6, %struct._IO_FILE* %call), !dbg !211
  %call8 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !212
  %idxprom = sext i32 %conv to i64, !dbg !213
  %arrayidx = getelementptr inbounds i8, i8* %call4, i64 %idxprom, !dbg !213
  store i8 0, i8* %arrayidx, align 1, !dbg !214
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()), !dbg !197
  store i32 0, i32* @n_names, align 4, !dbg !216
  br label %for.cond, !dbg !218

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc22, %for.inc ], !dbg !219
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !215, metadata !DIExpression()), !dbg !197
  %cmp = icmp slt i32 %i.0, %conv, !dbg !220
  br i1 %cmp, label %for.body, label %for.end, !dbg !222

for.body:                                         ; preds = %for.cond
  %call10 = call i16** @__ctype_b_loc() #10, !dbg !223
  %0 = load i16*, i16** %call10, align 8, !dbg !223
  %idxprom11 = sext i32 %i.0 to i64, !dbg !223
  %arrayidx12 = getelementptr inbounds i8, i8* %call4, i64 %idxprom11, !dbg !223
  %1 = load i8, i8* %arrayidx12, align 1, !dbg !223
  %conv13 = sext i8 %1 to i32, !dbg !223
  %idxprom14 = sext i32 %conv13 to i64, !dbg !223
  %arrayidx15 = getelementptr inbounds i16, i16* %0, i64 %idxprom14, !dbg !223
  %2 = load i16, i16* %arrayidx15, align 2, !dbg !223
  %conv16 = zext i16 %2 to i32, !dbg !223
  %and = and i32 %conv16, 8192, !dbg !223
  %tobool17 = icmp ne i32 %and, 0, !dbg !223
  br i1 %tobool17, label %if.then18, label %if.end21, !dbg !225, !cf.info !69

if.then18:                                        ; preds = %for.body
  %idxprom19 = sext i32 %i.0 to i64, !dbg !226
  %arrayidx20 = getelementptr inbounds i8, i8* %call4, i64 %idxprom19, !dbg !226
  store i8 0, i8* %arrayidx20, align 1, !dbg !227
  %3 = load i32, i32* @n_names, align 4, !dbg !228
  %inc = add nsw i32 %3, 1, !dbg !228
  store i32 %inc, i32* @n_names, align 4, !dbg !228
  br label %if.end21, !dbg !226

if.end21:                                         ; preds = %if.then18, %for.body
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %if.end21
  %inc22 = add nsw i32 %i.0, 1, !dbg !229
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !215, metadata !DIExpression()), !dbg !197
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  %sub = sub nsw i32 %conv, 1, !dbg !233
  %idxprom23 = sext i32 %sub to i64, !dbg !235
  %arrayidx24 = getelementptr inbounds i8, i8* %call4, i64 %idxprom23, !dbg !235
  %4 = load i8, i8* %arrayidx24, align 1, !dbg !235
  %tobool25 = icmp ne i8 %4, 0, !dbg !235
  br i1 %tobool25, label %if.then26, label %if.end28, !dbg !236, !cf.info !69

if.then26:                                        ; preds = %for.end
  %5 = load i32, i32* @n_names, align 4, !dbg !237
  %inc27 = add nsw i32 %5, 1, !dbg !237
  store i32 %inc27, i32* @n_names, align 4, !dbg !237
  br label %if.end28, !dbg !238

if.end28:                                         ; preds = %if.then26, %for.end
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([26 x %struct.node]* @nodes to i8*), i8 0, i64 11024, i1 false), !dbg !239
  %6 = load i32, i32* @n_names, align 4, !dbg !240
  %conv29 = sext i32 %6 to i64, !dbg !240
  %call30 = call noalias i8* @calloc(i64 %conv29, i64 8) #9, !dbg !241
  %7 = bitcast i8* %call30 to %struct.edge**, !dbg !241
  store %struct.edge** %7, %struct.edge*** @tmp, align 8, !dbg !242
  %8 = load i32, i32* @n_names, align 4, !dbg !243
  %conv31 = sext i32 %8 to i64, !dbg !243
  %mul = mul i64 24, %conv31, !dbg !244
  %call32 = call noalias i8* @malloc(i64 %mul) #9, !dbg !245
  %9 = bitcast i8* %call32 to %struct.edge*, !dbg !245
  store %struct.edge* %9, %struct.edge** @names, align 8, !dbg !246
  call void @llvm.dbg.value(metadata %struct.edge* %9, metadata !247, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()), !dbg !197
  br label %for.cond33, !dbg !248

for.cond33:                                       ; preds = %for.inc83, %if.end28
  %len.0 = phi i32 [ %conv, %if.end28 ], [ %conv48, %for.inc83 ], !dbg !197
  %i.1 = phi i32 [ 0, %if.end28 ], [ %inc84, %for.inc83 ], !dbg !250
  %p.0 = phi %struct.edge* [ %9, %if.end28 ], [ %incdec.ptr, %for.inc83 ], !dbg !197
  call void @llvm.dbg.value(metadata %struct.edge* %p.0, metadata !247, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !215, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !204, metadata !DIExpression()), !dbg !197
  %10 = load i32, i32* @n_names, align 4, !dbg !251
  %cmp34 = icmp slt i32 %i.1, %10, !dbg !253
  br i1 %cmp34, label %for.body36, label %for.end85, !dbg !254

for.body36:                                       ; preds = %for.cond33
  %tobool37 = icmp ne i32 %i.1, 0, !dbg !255
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !258, !cf.info !69

if.then38:                                        ; preds = %for.body36
  %11 = load %struct.edge*, %struct.edge** @names, align 8, !dbg !259
  %sub39 = sub nsw i32 %i.1, 1, !dbg !260
  %idxprom40 = sext i32 %sub39 to i64, !dbg !259
  %arrayidx41 = getelementptr inbounds %struct.edge, %struct.edge* %11, i64 %idxprom40, !dbg !259
  %str = getelementptr inbounds %struct.edge, %struct.edge* %arrayidx41, i32 0, i32 2, !dbg !261
  %12 = load i8*, i8** %str, align 8, !dbg !261
  %idx.ext = sext i32 %len.0 to i64, !dbg !262
  %add.ptr = getelementptr inbounds i8, i8* %12, i64 %idx.ext, !dbg !262
  %add.ptr42 = getelementptr inbounds i8, i8* %add.ptr, i64 1, !dbg !263
  %str43 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !264
  store i8* %add.ptr42, i8** %str43, align 8, !dbg !265
  br label %if.end45, !dbg !266

if.else:                                          ; preds = %for.body36
  %str44 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !267
  store i8* %call4, i8** %str44, align 8, !dbg !268
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then38
  %str46 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !269
  %13 = load i8*, i8** %str46, align 8, !dbg !269
  %call47 = call i64 @strlen(i8* %13) #11, !dbg !270
  %conv48 = trunc i64 %call47 to i32, !dbg !270
  call void @llvm.dbg.value(metadata i32 %conv48, metadata !204, metadata !DIExpression()), !dbg !197
  %str49 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !271
  %14 = load i8*, i8** %str49, align 8, !dbg !271
  %arrayidx50 = getelementptr inbounds i8, i8* %14, i64 0, !dbg !272
  %15 = load i8, i8* %arrayidx50, align 1, !dbg !272
  %conv51 = sext i8 %15 to i32, !dbg !272
  %sub52 = sub nsw i32 %conv51, 97, !dbg !273
  %conv53 = trunc i32 %sub52 to i8, !dbg !272
  %s = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 0, !dbg !274
  store i8 %conv53, i8* %s, align 8, !dbg !275
  %str54 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !276
  %16 = load i8*, i8** %str54, align 8, !dbg !276
  %sub55 = sub nsw i32 %conv48, 1, !dbg !277
  %idxprom56 = sext i32 %sub55 to i64, !dbg !278
  %arrayidx57 = getelementptr inbounds i8, i8* %16, i64 %idxprom56, !dbg !278
  %17 = load i8, i8* %arrayidx57, align 1, !dbg !278
  %conv58 = sext i8 %17 to i32, !dbg !278
  %sub59 = sub nsw i32 %conv58, 97, !dbg !279
  %conv60 = trunc i32 %sub59 to i8, !dbg !278
  %e = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 1, !dbg !280
  store i8 %conv60, i8* %e, align 1, !dbg !281
  %s61 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 0, !dbg !282
  %18 = load i8, i8* %s61, align 8, !dbg !282
  %conv62 = sext i8 %18 to i32, !dbg !284
  %cmp63 = icmp slt i32 %conv62, 0, !dbg !285
  br i1 %cmp63, label %if.then79, label %lor.lhs.false, !dbg !286, !cf.info !69

lor.lhs.false:                                    ; preds = %if.end45
  %s65 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 0, !dbg !287
  %19 = load i8, i8* %s65, align 8, !dbg !287
  %conv66 = sext i8 %19 to i32, !dbg !288
  %cmp67 = icmp sge i32 %conv66, 26, !dbg !289
  br i1 %cmp67, label %if.then79, label %lor.lhs.false69, !dbg !290, !cf.info !69

lor.lhs.false69:                                  ; preds = %lor.lhs.false
  %e70 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 1, !dbg !291
  %20 = load i8, i8* %e70, align 1, !dbg !291
  %conv71 = sext i8 %20 to i32, !dbg !292
  %cmp72 = icmp slt i32 %conv71, 0, !dbg !293
  br i1 %cmp72, label %if.then79, label %lor.lhs.false74, !dbg !294, !cf.info !69

lor.lhs.false74:                                  ; preds = %lor.lhs.false69
  %e75 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 1, !dbg !295
  %21 = load i8, i8* %e75, align 1, !dbg !295
  %conv76 = sext i8 %21 to i32, !dbg !296
  %cmp77 = icmp sge i32 %conv76, 26, !dbg !297
  br i1 %cmp77, label %if.then79, label %if.end82, !dbg !298, !cf.info !69

if.then79:                                        ; preds = %lor.lhs.false74, %lor.lhs.false69, %lor.lhs.false, %if.end45
  %str80 = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 0, i32 2, !dbg !299
  %22 = load i8*, i8** %str80, align 8, !dbg !299
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i8* %22), !dbg !301
  call void @abort() #8, !dbg !302
  unreachable, !dbg !302

if.end82:                                         ; preds = %lor.lhs.false74
  br label %for.inc83, !dbg !303

for.inc83:                                        ; preds = %if.end82
  %inc84 = add nsw i32 %i.1, 1, !dbg !304
  call void @llvm.dbg.value(metadata i32 %inc84, metadata !215, metadata !DIExpression()), !dbg !197
  %incdec.ptr = getelementptr inbounds %struct.edge, %struct.edge* %p.0, i32 1, !dbg !305
  call void @llvm.dbg.value(metadata %struct.edge* %incdec.ptr, metadata !247, metadata !DIExpression()), !dbg !197
  br label %for.cond33, !dbg !306, !llvm.loop !307

for.end85:                                        ; preds = %for.cond33
  %23 = load i32, i32* @n_names, align 4, !dbg !309
  %call86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i32 %23), !dbg !310
  ret void, !dbg !311
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

declare dso_local i32 @fseek(%struct._IO_FILE*, i64, i32) #2

declare dso_local i64 @ftell(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

declare dso_local i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #4

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #7

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_chain(%struct.chain* %c) #0 !dbg !312 {
entry:
  call void @llvm.dbg.value(metadata %struct.chain* %c, metadata !323, metadata !DIExpression()), !dbg !324
  %len = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 2, !dbg !325
  %0 = load i32, i32* %len, align 8, !dbg !325
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %0), !dbg !326
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !327
  %1 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !327
  call void @llvm.dbg.value(metadata %struct.edge* %1, metadata !329, metadata !DIExpression()), !dbg !330
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %entry
  %e.0 = phi %struct.edge* [ %1, %entry ], [ %4, %for.inc ], !dbg !330
  call void @llvm.dbg.value(metadata %struct.edge* %e.0, metadata !329, metadata !DIExpression()), !dbg !330
  %tobool = icmp ne %struct.edge* %e.0, null, !dbg !332
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !334

lor.rhs:                                          ; preds = %for.cond
  %call2 = call i32 @putchar(i32 10), !dbg !335
  %tobool3 = icmp ne i32 %call2, 0, !dbg !336
  %lnot = xor i1 %tobool3, true, !dbg !336
  br label %lor.end, !dbg !334

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %2 = phi i1 [ true, %for.cond ], [ %lnot, %lor.rhs ]
  br i1 %2, label %for.body, label %for.end, !dbg !337

for.body:                                         ; preds = %lor.end
  %str = getelementptr inbounds %struct.edge, %struct.edge* %e.0, i32 0, i32 2, !dbg !338
  %3 = load i8*, i8** %str, align 8, !dbg !338
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8* %3), !dbg !339
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %for.body
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %e.0, i32 0, i32 3, !dbg !340
  %4 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !340
  call void @llvm.dbg.value(metadata %struct.edge* %4, metadata !329, metadata !DIExpression()), !dbg !330
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %lor.end
  ret void, !dbg !344
}

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @widest(i32 %n, i32 %out) #0 !dbg !345 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %out, metadata !350, metadata !DIExpression()), !dbg !349
  %idxprom = sext i32 %n to i64, !dbg !351
  %arrayidx = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom, !dbg !351
  %out1 = getelementptr inbounds %struct.node, %struct.node* %arrayidx, i32 0, i32 4, !dbg !353
  %idxprom2 = sext i32 %n to i64, !dbg !351
  %arrayidx3 = getelementptr inbounds [26 x i32], [26 x i32]* %out1, i64 0, i64 %idxprom2, !dbg !351
  %0 = load i32, i32* %arrayidx3, align 4, !dbg !351
  %tobool = icmp ne i32 %0, 0, !dbg !351
  br i1 %tobool, label %if.then, label %if.end, !dbg !354, !cf.info !69

if.then:                                          ; preds = %entry
  br label %return, !dbg !355

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i32 -1, metadata !356, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 -1, metadata !357, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 0, metadata !358, metadata !DIExpression()), !dbg !360
  br label %for.cond, !dbg !361

for.cond:                                         ; preds = %for.inc, %if.end
  %mm.0 = phi i32 [ -1, %if.end ], [ %mm.3, %for.inc ], !dbg !349
  %mi.0 = phi i32 [ -1, %if.end ], [ %mi.3, %for.inc ], !dbg !349
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !360
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !358, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.value(metadata i32 %mi.0, metadata !357, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %mm.0, metadata !356, metadata !DIExpression()), !dbg !349
  %cmp = icmp slt i32 %i.0, 26, !dbg !362
  br i1 %cmp, label %for.body, label %for.end, !dbg !361

for.body:                                         ; preds = %for.cond
  %tobool4 = icmp ne i32 %out, 0, !dbg !364
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !367, !cf.info !69

if.then5:                                         ; preds = %for.body
  %idxprom6 = sext i32 %n to i64, !dbg !368
  %arrayidx7 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom6, !dbg !368
  %out8 = getelementptr inbounds %struct.node, %struct.node* %arrayidx7, i32 0, i32 4, !dbg !371
  %idxprom9 = sext i32 %i.0 to i64, !dbg !368
  %arrayidx10 = getelementptr inbounds [26 x i32], [26 x i32]* %out8, i64 0, i64 %idxprom9, !dbg !368
  %1 = load i32, i32* %arrayidx10, align 4, !dbg !368
  %tobool11 = icmp ne i32 %1, 0, !dbg !368
  br i1 %tobool11, label %land.lhs.true, label %if.end19, !dbg !372, !cf.info !69

land.lhs.true:                                    ; preds = %if.then5
  %idxprom12 = sext i32 %i.0 to i64, !dbg !373
  %arrayidx13 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom12, !dbg !373
  %nout = getelementptr inbounds %struct.node, %struct.node* %arrayidx13, i32 0, i32 2, !dbg !374
  %2 = load i32, i32* %nout, align 4, !dbg !374
  %cmp14 = icmp sgt i32 %2, %mm.0, !dbg !375
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !376, !cf.info !69

if.then15:                                        ; preds = %land.lhs.true
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !357, metadata !DIExpression()), !dbg !349
  %idxprom16 = sext i32 %i.0 to i64, !dbg !377
  %arrayidx17 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom16, !dbg !377
  %nout18 = getelementptr inbounds %struct.node, %struct.node* %arrayidx17, i32 0, i32 2, !dbg !378
  %3 = load i32, i32* %nout18, align 4, !dbg !378
  call void @llvm.dbg.value(metadata i32 %3, metadata !356, metadata !DIExpression()), !dbg !349
  br label %if.end19, !dbg !379

if.end19:                                         ; preds = %if.then15, %land.lhs.true, %if.then5
  %mm.1 = phi i32 [ %3, %if.then15 ], [ %mm.0, %land.lhs.true ], [ %mm.0, %if.then5 ], !dbg !349
  %mi.1 = phi i32 [ %i.0, %if.then15 ], [ %mi.0, %land.lhs.true ], [ %mi.0, %if.then5 ], !dbg !349
  call void @llvm.dbg.value(metadata i32 %mi.1, metadata !357, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %mm.1, metadata !356, metadata !DIExpression()), !dbg !349
  br label %if.end35, !dbg !380

if.else:                                          ; preds = %for.body
  %idxprom20 = sext i32 %i.0 to i64, !dbg !381
  %arrayidx21 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom20, !dbg !381
  %out22 = getelementptr inbounds %struct.node, %struct.node* %arrayidx21, i32 0, i32 4, !dbg !384
  %idxprom23 = sext i32 %n to i64, !dbg !381
  %arrayidx24 = getelementptr inbounds [26 x i32], [26 x i32]* %out22, i64 0, i64 %idxprom23, !dbg !381
  %4 = load i32, i32* %arrayidx24, align 4, !dbg !381
  %tobool25 = icmp ne i32 %4, 0, !dbg !381
  br i1 %tobool25, label %land.lhs.true26, label %if.end34, !dbg !385, !cf.info !69

land.lhs.true26:                                  ; preds = %if.else
  %idxprom27 = sext i32 %i.0 to i64, !dbg !386
  %arrayidx28 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom27, !dbg !386
  %nin = getelementptr inbounds %struct.node, %struct.node* %arrayidx28, i32 0, i32 1, !dbg !387
  %5 = load i32, i32* %nin, align 8, !dbg !387
  %cmp29 = icmp sgt i32 %5, %mm.0, !dbg !388
  br i1 %cmp29, label %if.then30, label %if.end34, !dbg !389, !cf.info !69

if.then30:                                        ; preds = %land.lhs.true26
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !357, metadata !DIExpression()), !dbg !349
  %idxprom31 = sext i32 %i.0 to i64, !dbg !390
  %arrayidx32 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom31, !dbg !390
  %nin33 = getelementptr inbounds %struct.node, %struct.node* %arrayidx32, i32 0, i32 1, !dbg !391
  %6 = load i32, i32* %nin33, align 8, !dbg !391
  call void @llvm.dbg.value(metadata i32 %6, metadata !356, metadata !DIExpression()), !dbg !349
  br label %if.end34, !dbg !392

if.end34:                                         ; preds = %if.then30, %land.lhs.true26, %if.else
  %mm.2 = phi i32 [ %6, %if.then30 ], [ %mm.0, %land.lhs.true26 ], [ %mm.0, %if.else ], !dbg !349
  %mi.2 = phi i32 [ %i.0, %if.then30 ], [ %mi.0, %land.lhs.true26 ], [ %mi.0, %if.else ], !dbg !349
  call void @llvm.dbg.value(metadata i32 %mi.2, metadata !357, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %mm.2, metadata !356, metadata !DIExpression()), !dbg !349
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end19
  %mm.3 = phi i32 [ %mm.1, %if.end19 ], [ %mm.2, %if.end34 ], !dbg !393
  %mi.3 = phi i32 [ %mi.1, %if.end19 ], [ %mi.2, %if.end34 ], !dbg !393
  call void @llvm.dbg.value(metadata i32 %mi.3, metadata !357, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %mm.3, metadata !356, metadata !DIExpression()), !dbg !349
  br label %for.inc, !dbg !394

for.inc:                                          ; preds = %if.end35
  %inc = add nsw i32 %i.0, 1, !dbg !362
  call void @llvm.dbg.value(metadata i32 %inc, metadata !358, metadata !DIExpression()), !dbg !360
  br label %for.cond, !dbg !362, !llvm.loop !395

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !397

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ %n, %if.then ], [ %mi.0, %for.end ], !dbg !349
  ret i32 %retval.0, !dbg !398
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @insert(%struct.chain* %c, %struct.edge* %e) #0 !dbg !399 {
entry:
  call void @llvm.dbg.value(metadata %struct.chain* %c, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.value(metadata %struct.edge* %e, metadata !404, metadata !DIExpression()), !dbg !403
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !405
  %0 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !405
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %e, i32 0, i32 3, !dbg !406
  store %struct.edge* %0, %struct.edge** %lnk, align 8, !dbg !407
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !408
  %1 = load %struct.edge*, %struct.edge** %tail, align 8, !dbg !408
  %tobool = icmp ne %struct.edge* %1, null, !dbg !410
  br i1 %tobool, label %if.end, label %if.then, !dbg !411, !cf.info !69

if.then:                                          ; preds = %entry
  %tail2 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !412
  store %struct.edge* %e, %struct.edge** %tail2, align 8, !dbg !413
  br label %if.end, !dbg !414

if.end:                                           ; preds = %if.then, %entry
  %e3 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !415
  store %struct.edge* %e, %struct.edge** %e3, align 8, !dbg !416
  %len = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 2, !dbg !417
  %2 = load i32, i32* %len, align 8, !dbg !418
  %inc = add nsw i32 %2, 1, !dbg !418
  store i32 %inc, i32* %len, align 8, !dbg !418
  ret void, !dbg !419
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @append(%struct.chain* %c, %struct.edge* %e) #0 !dbg !420 {
entry:
  call void @llvm.dbg.value(metadata %struct.chain* %c, metadata !421, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata %struct.edge* %e, metadata !423, metadata !DIExpression()), !dbg !422
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !424
  %0 = load %struct.edge*, %struct.edge** %tail, align 8, !dbg !424
  %tobool = icmp ne %struct.edge* %0, null, !dbg !426
  br i1 %tobool, label %if.then, label %if.else, !dbg !427, !cf.info !69

if.then:                                          ; preds = %entry
  %tail1 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !428
  %1 = load %struct.edge*, %struct.edge** %tail1, align 8, !dbg !428
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %1, i32 0, i32 3, !dbg !429
  store %struct.edge* %e, %struct.edge** %lnk, align 8, !dbg !430
  br label %if.end, !dbg !431

if.else:                                          ; preds = %entry
  %e2 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !432
  store %struct.edge* %e, %struct.edge** %e2, align 8, !dbg !433
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tail3 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !434
  store %struct.edge* %e, %struct.edge** %tail3, align 8, !dbg !435
  %len = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 2, !dbg !436
  %2 = load i32, i32* %len, align 8, !dbg !437
  %inc = add nsw i32 %2, 1, !dbg !437
  store i32 %inc, i32* %len, align 8, !dbg !437
  ret void, !dbg !438
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.edge* @shift(%struct.chain* %c) #0 !dbg !439 {
entry:
  call void @llvm.dbg.value(metadata %struct.chain* %c, metadata !442, metadata !DIExpression()), !dbg !443
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !444
  %0 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !444
  call void @llvm.dbg.value(metadata %struct.edge* %0, metadata !445, metadata !DIExpression()), !dbg !443
  %tobool = icmp ne %struct.edge* %0, null, !dbg !446
  br i1 %tobool, label %if.then, label %if.end5, !dbg !448, !cf.info !69

if.then:                                          ; preds = %entry
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %0, i32 0, i32 3, !dbg !449
  %1 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !449
  %e2 = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 0, !dbg !451
  store %struct.edge* %1, %struct.edge** %e2, align 8, !dbg !452
  %len = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 2, !dbg !453
  %2 = load i32, i32* %len, align 8, !dbg !455
  %dec = add nsw i32 %2, -1, !dbg !455
  store i32 %dec, i32* %len, align 8, !dbg !455
  %tobool3 = icmp ne i32 %dec, 0, !dbg !455
  br i1 %tobool3, label %if.end, label %if.then4, !dbg !456, !cf.info !69

if.then4:                                         ; preds = %if.then
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %c, i32 0, i32 1, !dbg !457
  store %struct.edge* null, %struct.edge** %tail, align 8, !dbg !458
  br label %if.end, !dbg !459

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end5, !dbg !460

if.end5:                                          ; preds = %if.end, %entry
  ret %struct.edge* %0, !dbg !461
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.chain* @make_chain(i32 %s) #0 !dbg !462 {
entry:
  call void @llvm.dbg.value(metadata i32 %s, metadata !465, metadata !DIExpression()), !dbg !466
  %call = call noalias i8* @calloc(i64 1, i64 128) #9, !dbg !467
  %0 = bitcast i8* %call to %struct.chain*, !dbg !467
  call void @llvm.dbg.value(metadata %struct.chain* %0, metadata !468, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 %s, metadata !469, metadata !DIExpression()), !dbg !471
  br label %for.cond, !dbg !472

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ %s, %entry ], [ %call1, %for.inc ], !dbg !471
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !469, metadata !DIExpression()), !dbg !471
  %call1 = call i32 @widest(i32 %j.0, i32 0), !dbg !473
  call void @llvm.dbg.value(metadata i32 %call1, metadata !475, metadata !DIExpression()), !dbg !471
  %cmp = icmp sge i32 %call1, 0, !dbg !476
  br i1 %cmp, label %for.body, label %for.end, !dbg !477

for.body:                                         ; preds = %for.cond
  %call2 = call %struct.edge* @remove_edge(i32 %call1, i32 %j.0), !dbg !478
  call void @insert(%struct.chain* %0, %struct.edge* %call2), !dbg !479
  br label %for.inc, !dbg !479

for.inc:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %call1, metadata !469, metadata !DIExpression()), !dbg !471
  br label %for.cond, !dbg !480, !llvm.loop !481

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 %s, metadata !483, metadata !DIExpression()), !dbg !485
  br label %for.cond5, !dbg !486

for.cond5:                                        ; preds = %for.inc10, %for.end
  %j4.0 = phi i32 [ %s, %for.end ], [ %call6, %for.inc10 ], !dbg !485
  call void @llvm.dbg.value(metadata i32 %j4.0, metadata !483, metadata !DIExpression()), !dbg !485
  %call6 = call i32 @widest(i32 %j4.0, i32 1), !dbg !487
  call void @llvm.dbg.value(metadata i32 %call6, metadata !489, metadata !DIExpression()), !dbg !485
  %cmp7 = icmp sge i32 %call6, 0, !dbg !490
  br i1 %cmp7, label %for.body8, label %for.end11, !dbg !491

for.body8:                                        ; preds = %for.cond5
  %call9 = call %struct.edge* @remove_edge(i32 %j4.0, i32 %call6), !dbg !492
  call void @append(%struct.chain* %0, %struct.edge* %call9), !dbg !493
  br label %for.inc10, !dbg !493

for.inc10:                                        ; preds = %for.body8
  call void @llvm.dbg.value(metadata i32 %call6, metadata !483, metadata !DIExpression()), !dbg !485
  br label %for.cond5, !dbg !494, !llvm.loop !495

for.end11:                                        ; preds = %for.cond5
  call void @llvm.dbg.value(metadata i32 0, metadata !497, metadata !DIExpression()), !dbg !499
  br label %for.cond12, !dbg !500

for.cond12:                                       ; preds = %for.inc65, %for.end11
  %step.0 = phi i32 [ 0, %for.end11 ], [ %inc66, %for.inc65 ], !dbg !499
  call void @llvm.dbg.value(metadata i32 %step.0, metadata !497, metadata !DIExpression()), !dbg !499
  %e13 = getelementptr inbounds %struct.chain, %struct.chain* %0, i32 0, i32 0, !dbg !501
  %1 = load %struct.edge*, %struct.edge** %e13, align 8, !dbg !501
  call void @llvm.dbg.value(metadata %struct.edge* %1, metadata !504, metadata !DIExpression()), !dbg !505
  call void @llvm.dbg.value(metadata i32 0, metadata !506, metadata !DIExpression()), !dbg !508
  br label %for.cond15, !dbg !509

for.cond15:                                       ; preds = %for.inc18, %for.cond12
  %i14.0 = phi i32 [ 0, %for.cond12 ], [ %inc, %for.inc18 ], !dbg !508
  %e.0 = phi %struct.edge* [ %1, %for.cond12 ], [ %2, %for.inc18 ], !dbg !505
  call void @llvm.dbg.value(metadata %struct.edge* %e.0, metadata !504, metadata !DIExpression()), !dbg !505
  call void @llvm.dbg.value(metadata i32 %i14.0, metadata !506, metadata !DIExpression()), !dbg !508
  %cmp16 = icmp slt i32 %i14.0, %step.0, !dbg !510
  br i1 %cmp16, label %for.body17, label %for.end19, !dbg !512

for.body17:                                       ; preds = %for.cond15
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %e.0, i32 0, i32 3, !dbg !513
  %2 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !513
  call void @llvm.dbg.value(metadata %struct.edge* %2, metadata !504, metadata !DIExpression()), !dbg !505
  %tobool = icmp ne %struct.edge* %2, null, !dbg !515
  br i1 %tobool, label %if.end, label %if.then, !dbg !516, !cf.info !69

if.then:                                          ; preds = %for.body17
  br label %for.end19, !dbg !517

if.end:                                           ; preds = %for.body17
  br label %for.inc18, !dbg !518

for.inc18:                                        ; preds = %if.end
  %inc = add nsw i32 %i14.0, 1, !dbg !519
  call void @llvm.dbg.value(metadata i32 %inc, metadata !506, metadata !DIExpression()), !dbg !508
  br label %for.cond15, !dbg !520, !llvm.loop !521

for.end19:                                        ; preds = %if.then, %for.cond15
  %e.1 = phi %struct.edge* [ %2, %if.then ], [ %e.0, %for.cond15 ], !dbg !505
  call void @llvm.dbg.value(metadata %struct.edge* %e.1, metadata !504, metadata !DIExpression()), !dbg !505
  %tobool20 = icmp ne %struct.edge* %e.1, null, !dbg !523
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !525, !cf.info !69

if.then21:                                        ; preds = %for.end19
  ret %struct.chain* %0, !dbg !526

if.end22:                                         ; preds = %for.end19
  call void @llvm.dbg.value(metadata i32 0, metadata !527, metadata !DIExpression()), !dbg !505
  %s25 = getelementptr inbounds %struct.edge, %struct.edge* %e.1, i32 0, i32 0, !dbg !528
  %3 = load i8, i8* %s25, align 8, !dbg !528
  %conv = sext i8 %3 to i32, !dbg !530
  call void @llvm.dbg.value(metadata i32 %conv, metadata !531, metadata !DIExpression()), !dbg !532
  br label %for.cond26, !dbg !533

for.cond26:                                       ; preds = %for.inc36, %if.end22
  %n.0 = phi i32 [ 0, %if.end22 ], [ %inc35, %for.inc36 ], !dbg !505
  %j24.0 = phi i32 [ %conv, %if.end22 ], [ %call27, %for.inc36 ], !dbg !532
  call void @llvm.dbg.value(metadata i32 %j24.0, metadata !531, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !527, metadata !DIExpression()), !dbg !505
  %call27 = call i32 @widest(i32 %j24.0, i32 0), !dbg !534
  call void @llvm.dbg.value(metadata i32 %call27, metadata !536, metadata !DIExpression()), !dbg !532
  %cmp28 = icmp sge i32 %call27, 0, !dbg !537
  br i1 %cmp28, label %for.body30, label %for.end37, !dbg !538

for.body30:                                       ; preds = %for.cond26
  %call31 = call %struct.edge* @remove_edge(i32 %call27, i32 %j24.0), !dbg !539
  call void @llvm.dbg.value(metadata %struct.edge* %call31, metadata !504, metadata !DIExpression()), !dbg !505
  %tobool32 = icmp ne %struct.edge* %call31, null, !dbg !542
  br i1 %tobool32, label %if.end34, label %if.then33, !dbg !543, !cf.info !69

if.then33:                                        ; preds = %for.body30
  br label %for.end37, !dbg !544

if.end34:                                         ; preds = %for.body30
  %4 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !545
  %inc35 = add nsw i32 %n.0, 1, !dbg !546
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !527, metadata !DIExpression()), !dbg !505
  %idxprom = sext i32 %n.0 to i64, !dbg !545
  %arrayidx = getelementptr inbounds %struct.edge*, %struct.edge** %4, i64 %idxprom, !dbg !545
  store %struct.edge* %call31, %struct.edge** %arrayidx, align 8, !dbg !547
  br label %for.inc36, !dbg !548

for.inc36:                                        ; preds = %if.end34
  call void @llvm.dbg.value(metadata i32 %call27, metadata !531, metadata !DIExpression()), !dbg !532
  br label %for.cond26, !dbg !549, !llvm.loop !550

for.end37:                                        ; preds = %if.then33, %for.cond26
  %cmp38 = icmp sgt i32 %n.0, %step.0, !dbg !552
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !554, !cf.info !69

if.then40:                                        ; preds = %for.end37
  call void @llvm.dbg.value(metadata i32 0, metadata !555, metadata !DIExpression()), !dbg !558
  br label %for.cond42, !dbg !559

for.cond42:                                       ; preds = %for.inc47, %if.then40
  %i41.0 = phi i32 [ 0, %if.then40 ], [ %inc48, %for.inc47 ], !dbg !558
  call void @llvm.dbg.value(metadata i32 %i41.0, metadata !555, metadata !DIExpression()), !dbg !558
  %cmp43 = icmp slt i32 %i41.0, %step.0, !dbg !560
  br i1 %cmp43, label %for.body45, label %for.end49, !dbg !559

for.body45:                                       ; preds = %for.cond42
  %call46 = call %struct.edge* @shift(%struct.chain* %0), !dbg !562
  call void @store_edge(%struct.edge* %call46), !dbg !563
  br label %for.inc47, !dbg !563

for.inc47:                                        ; preds = %for.body45
  %inc48 = add nsw i32 %i41.0, 1, !dbg !560
  call void @llvm.dbg.value(metadata i32 %inc48, metadata !555, metadata !DIExpression()), !dbg !558
  br label %for.cond42, !dbg !560, !llvm.loop !564

for.end49:                                        ; preds = %for.cond42
  call void @llvm.dbg.value(metadata i32 0, metadata !566, metadata !DIExpression()), !dbg !568
  br label %for.cond51, !dbg !569

for.cond51:                                       ; preds = %for.inc57, %for.end49
  %i50.0 = phi i32 [ 0, %for.end49 ], [ %inc58, %for.inc57 ], !dbg !568
  call void @llvm.dbg.value(metadata i32 %i50.0, metadata !566, metadata !DIExpression()), !dbg !568
  %cmp52 = icmp slt i32 %i50.0, %n.0, !dbg !570
  br i1 %cmp52, label %for.body54, label %for.end59, !dbg !569

for.body54:                                       ; preds = %for.cond51
  %5 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !572
  %idxprom55 = sext i32 %i50.0 to i64, !dbg !572
  %arrayidx56 = getelementptr inbounds %struct.edge*, %struct.edge** %5, i64 %idxprom55, !dbg !572
  %6 = load %struct.edge*, %struct.edge** %arrayidx56, align 8, !dbg !572
  call void @insert(%struct.chain* %0, %struct.edge* %6), !dbg !573
  br label %for.inc57, !dbg !573

for.inc57:                                        ; preds = %for.body54
  %inc58 = add nsw i32 %i50.0, 1, !dbg !570
  call void @llvm.dbg.value(metadata i32 %inc58, metadata !566, metadata !DIExpression()), !dbg !568
  br label %for.cond51, !dbg !570, !llvm.loop !574

for.end59:                                        ; preds = %for.cond51
  call void @llvm.dbg.value(metadata i32 -1, metadata !497, metadata !DIExpression()), !dbg !499
  br label %if.end64, !dbg !576

if.else:                                          ; preds = %for.end37
  br label %while.cond, !dbg !577

while.cond:                                       ; preds = %while.body, %if.else
  %n.1 = phi i32 [ %n.0, %if.else ], [ %dec, %while.body ], !dbg !505
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !527, metadata !DIExpression()), !dbg !505
  %dec = add nsw i32 %n.1, -1, !dbg !578
  call void @llvm.dbg.value(metadata i32 %dec, metadata !527, metadata !DIExpression()), !dbg !505
  %cmp60 = icmp sge i32 %dec, 0, !dbg !579
  br i1 %cmp60, label %while.body, label %while.end, !dbg !577

while.body:                                       ; preds = %while.cond
  %7 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !580
  %idxprom62 = sext i32 %dec to i64, !dbg !580
  %arrayidx63 = getelementptr inbounds %struct.edge*, %struct.edge** %7, i64 %idxprom62, !dbg !580
  %8 = load %struct.edge*, %struct.edge** %arrayidx63, align 8, !dbg !580
  call void @store_edge(%struct.edge* %8), !dbg !581
  br label %while.cond, !dbg !577, !llvm.loop !582

while.end:                                        ; preds = %while.cond
  br label %if.end64

if.end64:                                         ; preds = %while.end, %for.end59
  %step.1 = phi i32 [ -1, %for.end59 ], [ %step.0, %while.end ], !dbg !499
  call void @llvm.dbg.value(metadata i32 %step.1, metadata !497, metadata !DIExpression()), !dbg !499
  br label %for.inc65, !dbg !584

for.inc65:                                        ; preds = %if.end64
  %inc66 = add nsw i32 %step.1, 1, !dbg !585
  call void @llvm.dbg.value(metadata i32 %inc66, metadata !497, metadata !DIExpression()), !dbg !499
  br label %for.cond12, !dbg !586, !llvm.loop !587
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !590 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !593, metadata !DIExpression()), !dbg !594
  call void @read_names(), !dbg !595
  call void @llvm.dbg.value(metadata i32 0, metadata !596, metadata !DIExpression()), !dbg !598
  br label %for.cond, !dbg !599

for.cond:                                         ; preds = %for.inc6, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc6 ], !dbg !598
  %best.0 = phi i32 [ 0, %entry ], [ %best.1, %for.inc6 ], !dbg !594
  call void @llvm.dbg.value(metadata i32 %best.0, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !596, metadata !DIExpression()), !dbg !598
  %cmp = icmp slt i32 %i.0, 26, !dbg !600
  br i1 %cmp, label %for.body, label %for.end8, !dbg !599

for.body:                                         ; preds = %for.cond
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([26 x %struct.node]* @nodes to i8*), i8 0, i64 11024, i1 false), !dbg !602
  call void @llvm.dbg.value(metadata i32 0, metadata !604, metadata !DIExpression()), !dbg !606
  br label %for.cond1, !dbg !607

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !606
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !604, metadata !DIExpression()), !dbg !606
  %0 = load i32, i32* @n_names, align 4, !dbg !608
  %cmp2 = icmp slt i32 %j.0, %0, !dbg !608
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !607

for.body3:                                        ; preds = %for.cond1
  %1 = load %struct.edge*, %struct.edge** @names, align 8, !dbg !610
  %idx.ext = sext i32 %j.0 to i64, !dbg !611
  %add.ptr = getelementptr inbounds %struct.edge, %struct.edge* %1, i64 %idx.ext, !dbg !611
  call void @store_edge(%struct.edge* %add.ptr), !dbg !612
  br label %for.inc, !dbg !612

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1, !dbg !608
  call void @llvm.dbg.value(metadata i32 %inc, metadata !604, metadata !DIExpression()), !dbg !606
  br label %for.cond1, !dbg !608, !llvm.loop !613

for.end:                                          ; preds = %for.cond1
  %call = call %struct.chain* @make_chain(i32 %i.0), !dbg !615
  call void @llvm.dbg.value(metadata %struct.chain* %call, metadata !616, metadata !DIExpression()), !dbg !617
  %len = getelementptr inbounds %struct.chain, %struct.chain* %call, i32 0, i32 2, !dbg !618
  %2 = load i32, i32* %len, align 8, !dbg !618
  %cmp4 = icmp sgt i32 %2, %best.0, !dbg !620
  br i1 %cmp4, label %if.then, label %if.end, !dbg !621, !cf.info !69

if.then:                                          ; preds = %for.end
  call void @show_chain(%struct.chain* %call), !dbg !622
  %len5 = getelementptr inbounds %struct.chain, %struct.chain* %call, i32 0, i32 2, !dbg !624
  %3 = load i32, i32* %len5, align 8, !dbg !624
  call void @llvm.dbg.value(metadata i32 %3, metadata !593, metadata !DIExpression()), !dbg !594
  br label %if.end, !dbg !625

if.end:                                           ; preds = %if.then, %for.end
  %best.1 = phi i32 [ %3, %if.then ], [ %best.0, %for.end ], !dbg !594
  call void @llvm.dbg.value(metadata i32 %best.1, metadata !593, metadata !DIExpression()), !dbg !594
  %4 = bitcast %struct.chain* %call to i8*, !dbg !626
  call void @free(i8* %4) #9, !dbg !627
  br label %for.inc6, !dbg !628

for.inc6:                                         ; preds = %if.end
  %inc7 = add nsw i32 %i.0, 1, !dbg !600
  call void @llvm.dbg.value(metadata i32 %inc7, metadata !596, metadata !DIExpression()), !dbg !598
  br label %for.cond, !dbg !600, !llvm.loop !629

for.end8:                                         ; preds = %for.cond
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i32 %best.0), !dbg !631
  ret i32 0, !dbg !632
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind readnone }
attributes #11 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!56, !57, !58}
!llvm.ident = !{!59}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "nodes", scope: !2, file: !3, line: 11, type: !43, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !21, globals: !24, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "last-letter-first-letter-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Last-letter-first-letter")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 46, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20}
!9 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!10 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!11 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!12 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!13 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!14 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!15 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!16 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!17 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!18 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!19 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!20 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!21 = !{!22, !23}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!24 = !{!0, !25, !38, !41}
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "names", scope: !2, file: !3, line: 12, type: !27, isLocal: false, isDefinition: true)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "edge", file: !3, line: 7, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "edge", file: !3, line: 7, size: 192, elements: !30)
!30 = !{!31, !33, !34, !36}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !29, file: !3, line: 7, baseType: !32, size: 8)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !29, file: !3, line: 7, baseType: !32, size: 8, offset: 8)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "str", scope: !29, file: !3, line: 7, baseType: !35, size: 64, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "lnk", scope: !29, file: !3, line: 7, baseType: !37, size: 64, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "tmp", scope: !2, file: !3, line: 12, type: !40, isLocal: false, isDefinition: true)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "n_names", scope: !2, file: !3, line: 13, type: !22, isLocal: false, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 88192, elements: !49)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "node", file: !3, line: 8, baseType: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 8, size: 3392, elements: !46)
!46 = !{!47, !51, !52, !53, !55}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !45, file: !3, line: 8, baseType: !48, size: 1664)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 1664, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 26)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "nin", scope: !45, file: !3, line: 8, baseType: !22, size: 32, offset: 1664)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "nout", scope: !45, file: !3, line: 8, baseType: !22, size: 32, offset: 1696)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "in", scope: !45, file: !3, line: 8, baseType: !54, size: 832, offset: 1728)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 832, elements: !49)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "out", scope: !45, file: !3, line: 8, baseType: !54, size: 832, offset: 2560)
!56 = !{i32 7, !"Dwarf Version", i32 4}
!57 = !{i32 2, !"Debug Info Version", i32 3}
!58 = !{i32 1, !"wchar_size", i32 4}
!59 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!60 = distinct !DISubprogram(name: "store_edge", scope: !3, file: !3, line: 16, type: !61, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!61 = !DISubroutineType(types: !62)
!62 = !{null, !27}
!63 = !{}
!64 = !DILocalVariable(name: "g", arg: 1, scope: !60, file: !3, line: 16, type: !27)
!65 = !DILocation(line: 0, scope: !60)
!66 = !DILocation(line: 18, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !60, file: !3, line: 18, column: 6)
!68 = !DILocation(line: 18, column: 6, scope: !60)
!69 = !{!"if"}
!70 = !DILocation(line: 18, column: 10, scope: !67)
!71 = !DILocation(line: 19, column: 13, scope: !60)
!72 = !DILocation(line: 19, column: 10, scope: !60)
!73 = !DILocalVariable(name: "i", scope: !60, file: !3, line: 19, type: !22)
!74 = !DILocation(line: 19, column: 23, scope: !60)
!75 = !DILocation(line: 19, column: 20, scope: !60)
!76 = !DILocalVariable(name: "j", scope: !60, file: !3, line: 19, type: !22)
!77 = !DILocation(line: 20, column: 18, scope: !60)
!78 = !DILocalVariable(name: "n", scope: !60, file: !3, line: 20, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!80 = !DILocation(line: 22, column: 14, scope: !60)
!81 = !DILocation(line: 22, column: 11, scope: !60)
!82 = !DILocation(line: 22, column: 5, scope: !60)
!83 = !DILocation(line: 22, column: 9, scope: !60)
!84 = !DILocation(line: 24, column: 5, scope: !60)
!85 = !DILocation(line: 24, column: 2, scope: !60)
!86 = !DILocation(line: 24, column: 10, scope: !60)
!87 = !DILocation(line: 24, column: 18, scope: !60)
!88 = !DILocation(line: 24, column: 15, scope: !60)
!89 = !DILocation(line: 24, column: 24, scope: !60)
!90 = !DILocation(line: 24, column: 31, scope: !60)
!91 = !DILocation(line: 24, column: 35, scope: !60)
!92 = !DILocation(line: 25, column: 12, scope: !60)
!93 = !DILocation(line: 25, column: 20, scope: !60)
!94 = !DILocation(line: 25, column: 17, scope: !60)
!95 = !DILocation(line: 25, column: 25, scope: !60)
!96 = !DILocation(line: 25, column: 32, scope: !60)
!97 = !DILocation(line: 25, column: 35, scope: !60)
!98 = !DILocation(line: 26, column: 1, scope: !60)
!99 = distinct !DISubprogram(name: "remove_edge", scope: !3, file: !3, line: 29, type: !100, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!100 = !DISubroutineType(types: !101)
!101 = !{!27, !22, !22}
!102 = !DILocalVariable(name: "i", arg: 1, scope: !99, file: !3, line: 29, type: !22)
!103 = !DILocation(line: 0, scope: !99)
!104 = !DILocalVariable(name: "j", arg: 2, scope: !99, file: !3, line: 29, type: !22)
!105 = !DILocation(line: 31, column: 18, scope: !99)
!106 = !DILocalVariable(name: "n", scope: !99, file: !3, line: 31, type: !79)
!107 = !DILocation(line: 32, column: 15, scope: !99)
!108 = !DILocation(line: 32, column: 12, scope: !99)
!109 = !DILocalVariable(name: "g", scope: !99, file: !3, line: 32, type: !27)
!110 = !DILocation(line: 33, column: 6, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !3, line: 33, column: 6)
!112 = !DILocation(line: 33, column: 6, scope: !99)
!113 = !DILocation(line: 34, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !3, line: 33, column: 9)
!115 = !DILocation(line: 34, column: 6, scope: !114)
!116 = !DILocation(line: 34, column: 3, scope: !114)
!117 = !DILocation(line: 34, column: 11, scope: !114)
!118 = !DILocation(line: 35, column: 6, scope: !114)
!119 = !DILocation(line: 35, column: 10, scope: !114)
!120 = !DILocation(line: 36, column: 6, scope: !114)
!121 = !DILocation(line: 36, column: 3, scope: !114)
!122 = !DILocation(line: 36, column: 12, scope: !114)
!123 = !DILocation(line: 36, column: 19, scope: !114)
!124 = !DILocation(line: 36, column: 23, scope: !114)
!125 = !DILocation(line: 38, column: 13, scope: !114)
!126 = !DILocation(line: 39, column: 6, scope: !114)
!127 = !DILocation(line: 39, column: 3, scope: !114)
!128 = !DILocation(line: 39, column: 11, scope: !114)
!129 = !DILocation(line: 40, column: 6, scope: !114)
!130 = !DILocation(line: 40, column: 9, scope: !114)
!131 = !DILocation(line: 41, column: 2, scope: !114)
!132 = !DILocation(line: 42, column: 2, scope: !99)
!133 = distinct !DISubprogram(name: "read_names", scope: !3, file: !3, line: 45, type: !134, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!134 = !DISubroutineType(types: !135)
!135 = !{null}
!136 = !DILocation(line: 47, column: 13, scope: !133)
!137 = !DILocalVariable(name: "fp", scope: !133, file: !3, line: 47, type: !138)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !140, line: 7, baseType: !141)
!140 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !142, line: 49, size: 1728, elements: !143)
!142 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!143 = !{!144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !159, !161, !162, !163, !167, !168, !170, !174, !177, !179, !182, !185, !186, !188, !192, !193}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !141, file: !142, line: 51, baseType: !22, size: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !141, file: !142, line: 54, baseType: !35, size: 64, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !141, file: !142, line: 55, baseType: !35, size: 64, offset: 128)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !141, file: !142, line: 56, baseType: !35, size: 64, offset: 192)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !141, file: !142, line: 57, baseType: !35, size: 64, offset: 256)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !141, file: !142, line: 58, baseType: !35, size: 64, offset: 320)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !141, file: !142, line: 59, baseType: !35, size: 64, offset: 384)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !141, file: !142, line: 60, baseType: !35, size: 64, offset: 448)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !141, file: !142, line: 61, baseType: !35, size: 64, offset: 512)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !141, file: !142, line: 64, baseType: !35, size: 64, offset: 576)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !141, file: !142, line: 65, baseType: !35, size: 64, offset: 640)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !141, file: !142, line: 66, baseType: !35, size: 64, offset: 704)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !141, file: !142, line: 68, baseType: !157, size: 64, offset: 768)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !142, line: 36, flags: DIFlagFwdDecl)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !141, file: !142, line: 70, baseType: !160, size: 64, offset: 832)
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !141, file: !142, line: 72, baseType: !22, size: 32, offset: 896)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !141, file: !142, line: 73, baseType: !22, size: 32, offset: 928)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !141, file: !142, line: 74, baseType: !164, size: 64, offset: 960)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !165, line: 152, baseType: !166)
!165 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!166 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !141, file: !142, line: 77, baseType: !23, size: 16, offset: 1024)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !141, file: !142, line: 78, baseType: !169, size: 8, offset: 1040)
!169 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !141, file: !142, line: 79, baseType: !171, size: 8, offset: 1048)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 8, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 1)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !141, file: !142, line: 81, baseType: !175, size: 64, offset: 1088)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !142, line: 43, baseType: null)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !141, file: !142, line: 89, baseType: !178, size: 64, offset: 1152)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !165, line: 153, baseType: !166)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !141, file: !142, line: 91, baseType: !180, size: 64, offset: 1216)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !142, line: 37, flags: DIFlagFwdDecl)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !141, file: !142, line: 92, baseType: !183, size: 64, offset: 1280)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !142, line: 38, flags: DIFlagFwdDecl)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !141, file: !142, line: 93, baseType: !160, size: 64, offset: 1344)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !141, file: !142, line: 94, baseType: !187, size: 64, offset: 1408)
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !141, file: !142, line: 95, baseType: !189, size: 64, offset: 1472)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !190, line: 46, baseType: !191)
!190 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!191 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !141, file: !142, line: 96, baseType: !22, size: 32, offset: 1536)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !141, file: !142, line: 98, baseType: !194, size: 160, offset: 1568)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 160, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 20)
!197 = !DILocation(line: 0, scope: !133)
!198 = !DILocation(line: 52, column: 7, scope: !199)
!199 = distinct !DILexicalBlock(scope: !133, file: !3, line: 52, column: 6)
!200 = !DILocation(line: 52, column: 6, scope: !133)
!201 = !DILocation(line: 52, column: 11, scope: !199)
!202 = !DILocation(line: 54, column: 2, scope: !133)
!203 = !DILocation(line: 55, column: 8, scope: !133)
!204 = !DILocalVariable(name: "len", scope: !133, file: !3, line: 48, type: !22)
!205 = !DILocation(line: 56, column: 19, scope: !133)
!206 = !DILocation(line: 56, column: 15, scope: !133)
!207 = !DILocation(line: 56, column: 8, scope: !133)
!208 = !DILocalVariable(name: "buf", scope: !133, file: !3, line: 49, type: !35)
!209 = !DILocation(line: 57, column: 2, scope: !133)
!210 = !DILocation(line: 58, column: 16, scope: !133)
!211 = !DILocation(line: 58, column: 2, scope: !133)
!212 = !DILocation(line: 59, column: 2, scope: !133)
!213 = !DILocation(line: 61, column: 2, scope: !133)
!214 = !DILocation(line: 61, column: 11, scope: !133)
!215 = !DILocalVariable(name: "i", scope: !133, file: !3, line: 48, type: !22)
!216 = !DILocation(line: 62, column: 15, scope: !217)
!217 = distinct !DILexicalBlock(scope: !133, file: !3, line: 62, column: 2)
!218 = !DILocation(line: 62, column: 7, scope: !217)
!219 = !DILocation(line: 0, scope: !217)
!220 = !DILocation(line: 62, column: 26, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !3, line: 62, column: 2)
!222 = !DILocation(line: 62, column: 2, scope: !217)
!223 = !DILocation(line: 63, column: 7, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !3, line: 63, column: 7)
!225 = !DILocation(line: 63, column: 7, scope: !221)
!226 = !DILocation(line: 64, column: 4, scope: !224)
!227 = !DILocation(line: 64, column: 11, scope: !224)
!228 = !DILocation(line: 64, column: 23, scope: !224)
!229 = !DILocation(line: 62, column: 34, scope: !221)
!230 = !DILocation(line: 62, column: 2, scope: !221)
!231 = distinct !{!231, !222, !232}
!232 = !DILocation(line: 64, column: 23, scope: !217)
!233 = !DILocation(line: 66, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !133, file: !3, line: 66, column: 6)
!235 = !DILocation(line: 66, column: 6, scope: !234)
!236 = !DILocation(line: 66, column: 6, scope: !133)
!237 = !DILocation(line: 66, column: 25, scope: !234)
!238 = !DILocation(line: 66, column: 18, scope: !234)
!239 = !DILocation(line: 68, column: 2, scope: !133)
!240 = !DILocation(line: 69, column: 15, scope: !133)
!241 = !DILocation(line: 69, column: 8, scope: !133)
!242 = !DILocation(line: 69, column: 6, scope: !133)
!243 = !DILocation(line: 71, column: 36, scope: !133)
!244 = !DILocation(line: 71, column: 34, scope: !133)
!245 = !DILocation(line: 71, column: 14, scope: !133)
!246 = !DILocation(line: 71, column: 12, scope: !133)
!247 = !DILocalVariable(name: "p", scope: !133, file: !3, line: 50, type: !27)
!248 = !DILocation(line: 72, column: 7, scope: !249)
!249 = distinct !DILexicalBlock(scope: !133, file: !3, line: 72, column: 2)
!250 = !DILocation(line: 0, scope: !249)
!251 = !DILocation(line: 72, column: 18, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !3, line: 72, column: 2)
!253 = !DILocation(line: 72, column: 16, scope: !252)
!254 = !DILocation(line: 72, column: 2, scope: !249)
!255 = !DILocation(line: 73, column: 7, scope: !256)
!256 = distinct !DILexicalBlock(scope: !257, file: !3, line: 73, column: 7)
!257 = distinct !DILexicalBlock(scope: !252, file: !3, line: 72, column: 37)
!258 = !DILocation(line: 73, column: 7, scope: !257)
!259 = !DILocation(line: 73, column: 19, scope: !256)
!260 = !DILocation(line: 73, column: 26, scope: !256)
!261 = !DILocation(line: 73, column: 30, scope: !256)
!262 = !DILocation(line: 73, column: 34, scope: !256)
!263 = !DILocation(line: 73, column: 40, scope: !256)
!264 = !DILocation(line: 73, column: 13, scope: !256)
!265 = !DILocation(line: 73, column: 17, scope: !256)
!266 = !DILocation(line: 73, column: 10, scope: !256)
!267 = !DILocation(line: 74, column: 11, scope: !256)
!268 = !DILocation(line: 74, column: 15, scope: !256)
!269 = !DILocation(line: 76, column: 19, scope: !257)
!270 = !DILocation(line: 76, column: 9, scope: !257)
!271 = !DILocation(line: 77, column: 13, scope: !257)
!272 = !DILocation(line: 77, column: 10, scope: !257)
!273 = !DILocation(line: 77, column: 20, scope: !257)
!274 = !DILocation(line: 77, column: 6, scope: !257)
!275 = !DILocation(line: 77, column: 8, scope: !257)
!276 = !DILocation(line: 78, column: 13, scope: !257)
!277 = !DILocation(line: 78, column: 20, scope: !257)
!278 = !DILocation(line: 78, column: 10, scope: !257)
!279 = !DILocation(line: 78, column: 24, scope: !257)
!280 = !DILocation(line: 78, column: 6, scope: !257)
!281 = !DILocation(line: 78, column: 8, scope: !257)
!282 = !DILocation(line: 79, column: 10, scope: !283)
!283 = distinct !DILexicalBlock(scope: !257, file: !3, line: 79, column: 7)
!284 = !DILocation(line: 79, column: 7, scope: !283)
!285 = !DILocation(line: 79, column: 12, scope: !283)
!286 = !DILocation(line: 79, column: 16, scope: !283)
!287 = !DILocation(line: 79, column: 22, scope: !283)
!288 = !DILocation(line: 79, column: 19, scope: !283)
!289 = !DILocation(line: 79, column: 24, scope: !283)
!290 = !DILocation(line: 79, column: 30, scope: !283)
!291 = !DILocation(line: 79, column: 36, scope: !283)
!292 = !DILocation(line: 79, column: 33, scope: !283)
!293 = !DILocation(line: 79, column: 38, scope: !283)
!294 = !DILocation(line: 79, column: 42, scope: !283)
!295 = !DILocation(line: 79, column: 48, scope: !283)
!296 = !DILocation(line: 79, column: 45, scope: !283)
!297 = !DILocation(line: 79, column: 50, scope: !283)
!298 = !DILocation(line: 79, column: 7, scope: !257)
!299 = !DILocation(line: 81, column: 8, scope: !300)
!300 = distinct !DILexicalBlock(scope: !283, file: !3, line: 79, column: 57)
!301 = !DILocation(line: 80, column: 4, scope: !300)
!302 = !DILocation(line: 82, column: 4, scope: !300)
!303 = !DILocation(line: 84, column: 2, scope: !257)
!304 = !DILocation(line: 72, column: 28, scope: !252)
!305 = !DILocation(line: 72, column: 33, scope: !252)
!306 = !DILocation(line: 72, column: 2, scope: !252)
!307 = distinct !{!307, !254, !308}
!308 = !DILocation(line: 84, column: 2, scope: !249)
!309 = !DILocation(line: 85, column: 28, scope: !133)
!310 = !DILocation(line: 85, column: 2, scope: !133)
!311 = !DILocation(line: 86, column: 1, scope: !133)
!312 = distinct !DISubprogram(name: "show_chain", scope: !3, file: !3, line: 88, type: !313, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!313 = !DISubroutineType(types: !314)
!314 = !{null, !315}
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "chain", file: !3, line: 9, baseType: !317)
!317 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 9, size: 1024, elements: !318)
!318 = !{!319, !320, !321, !322}
!319 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !317, file: !3, line: 9, baseType: !27, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "tail", scope: !317, file: !3, line: 9, baseType: !27, size: 64, offset: 64)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !317, file: !3, line: 9, baseType: !22, size: 32, offset: 128)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "has", scope: !317, file: !3, line: 9, baseType: !54, size: 832, offset: 160)
!323 = !DILocalVariable(name: "c", arg: 1, scope: !312, file: !3, line: 88, type: !315)
!324 = !DILocation(line: 0, scope: !312)
!325 = !DILocation(line: 90, column: 19, scope: !312)
!326 = !DILocation(line: 90, column: 2, scope: !312)
!327 = !DILocation(line: 91, column: 21, scope: !328)
!328 = distinct !DILexicalBlock(scope: !312, file: !3, line: 91, column: 2)
!329 = !DILocalVariable(name: "e", scope: !328, file: !3, line: 91, type: !27)
!330 = !DILocation(line: 0, scope: !328)
!331 = !DILocation(line: 91, column: 7, scope: !328)
!332 = !DILocation(line: 91, column: 24, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !3, line: 91, column: 2)
!334 = !DILocation(line: 91, column: 26, scope: !333)
!335 = !DILocation(line: 91, column: 30, scope: !333)
!336 = !DILocation(line: 91, column: 29, scope: !333)
!337 = !DILocation(line: 91, column: 2, scope: !328)
!338 = !DILocation(line: 92, column: 20, scope: !333)
!339 = !DILocation(line: 92, column: 3, scope: !333)
!340 = !DILocation(line: 91, column: 52, scope: !333)
!341 = !DILocation(line: 91, column: 2, scope: !333)
!342 = distinct !{!342, !337, !343}
!343 = !DILocation(line: 92, column: 23, scope: !328)
!344 = !DILocation(line: 93, column: 1, scope: !312)
!345 = distinct !DISubprogram(name: "widest", scope: !3, file: !3, line: 96, type: !346, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!346 = !DISubroutineType(types: !347)
!347 = !{!22, !22, !22}
!348 = !DILocalVariable(name: "n", arg: 1, scope: !345, file: !3, line: 96, type: !22)
!349 = !DILocation(line: 0, scope: !345)
!350 = !DILocalVariable(name: "out", arg: 2, scope: !345, file: !3, line: 96, type: !22)
!351 = !DILocation(line: 98, column: 6, scope: !352)
!352 = distinct !DILexicalBlock(scope: !345, file: !3, line: 98, column: 6)
!353 = !DILocation(line: 98, column: 15, scope: !352)
!354 = !DILocation(line: 98, column: 6, scope: !345)
!355 = !DILocation(line: 98, column: 23, scope: !352)
!356 = !DILocalVariable(name: "mm", scope: !345, file: !3, line: 100, type: !22)
!357 = !DILocalVariable(name: "mi", scope: !345, file: !3, line: 100, type: !22)
!358 = !DILocalVariable(name: "i", scope: !359, file: !3, line: 101, type: !22)
!359 = distinct !DILexicalBlock(scope: !345, file: !3, line: 101, column: 2)
!360 = !DILocation(line: 0, scope: !359)
!361 = !DILocation(line: 101, column: 2, scope: !359)
!362 = !DILocation(line: 101, column: 2, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !3, line: 101, column: 2)
!364 = !DILocation(line: 102, column: 7, scope: !365)
!365 = distinct !DILexicalBlock(scope: !366, file: !3, line: 102, column: 7)
!366 = distinct !DILexicalBlock(scope: !363, file: !3, line: 101, column: 16)
!367 = !DILocation(line: 102, column: 7, scope: !366)
!368 = !DILocation(line: 103, column: 8, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !3, line: 103, column: 8)
!370 = distinct !DILexicalBlock(scope: !365, file: !3, line: 102, column: 12)
!371 = !DILocation(line: 103, column: 17, scope: !369)
!372 = !DILocation(line: 103, column: 24, scope: !369)
!373 = !DILocation(line: 103, column: 27, scope: !369)
!374 = !DILocation(line: 103, column: 36, scope: !369)
!375 = !DILocation(line: 103, column: 41, scope: !369)
!376 = !DILocation(line: 103, column: 8, scope: !370)
!377 = !DILocation(line: 104, column: 18, scope: !369)
!378 = !DILocation(line: 104, column: 27, scope: !369)
!379 = !DILocation(line: 104, column: 5, scope: !369)
!380 = !DILocation(line: 105, column: 3, scope: !370)
!381 = !DILocation(line: 106, column: 8, scope: !382)
!382 = distinct !DILexicalBlock(scope: !383, file: !3, line: 106, column: 8)
!383 = distinct !DILexicalBlock(scope: !365, file: !3, line: 105, column: 10)
!384 = !DILocation(line: 106, column: 17, scope: !382)
!385 = !DILocation(line: 106, column: 24, scope: !382)
!386 = !DILocation(line: 106, column: 27, scope: !382)
!387 = !DILocation(line: 106, column: 36, scope: !382)
!388 = !DILocation(line: 106, column: 40, scope: !382)
!389 = !DILocation(line: 106, column: 8, scope: !383)
!390 = !DILocation(line: 107, column: 18, scope: !382)
!391 = !DILocation(line: 107, column: 27, scope: !382)
!392 = !DILocation(line: 107, column: 5, scope: !382)
!393 = !DILocation(line: 0, scope: !365)
!394 = !DILocation(line: 109, column: 2, scope: !366)
!395 = distinct !{!395, !361, !396}
!396 = !DILocation(line: 109, column: 2, scope: !359)
!397 = !DILocation(line: 111, column: 2, scope: !345)
!398 = !DILocation(line: 112, column: 1, scope: !345)
!399 = distinct !DISubprogram(name: "insert", scope: !3, file: !3, line: 114, type: !400, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!400 = !DISubroutineType(types: !401)
!401 = !{null, !315, !27}
!402 = !DILocalVariable(name: "c", arg: 1, scope: !399, file: !3, line: 114, type: !315)
!403 = !DILocation(line: 0, scope: !399)
!404 = !DILocalVariable(name: "e", arg: 2, scope: !399, file: !3, line: 114, type: !27)
!405 = !DILocation(line: 116, column: 14, scope: !399)
!406 = !DILocation(line: 116, column: 5, scope: !399)
!407 = !DILocation(line: 116, column: 9, scope: !399)
!408 = !DILocation(line: 117, column: 10, scope: !409)
!409 = distinct !DILexicalBlock(scope: !399, file: !3, line: 117, column: 6)
!410 = !DILocation(line: 117, column: 7, scope: !409)
!411 = !DILocation(line: 117, column: 6, scope: !399)
!412 = !DILocation(line: 117, column: 19, scope: !409)
!413 = !DILocation(line: 117, column: 24, scope: !409)
!414 = !DILocation(line: 117, column: 16, scope: !409)
!415 = !DILocation(line: 118, column: 5, scope: !399)
!416 = !DILocation(line: 118, column: 7, scope: !399)
!417 = !DILocation(line: 119, column: 5, scope: !399)
!418 = !DILocation(line: 119, column: 8, scope: !399)
!419 = !DILocation(line: 120, column: 1, scope: !399)
!420 = distinct !DISubprogram(name: "append", scope: !3, file: !3, line: 122, type: !400, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!421 = !DILocalVariable(name: "c", arg: 1, scope: !420, file: !3, line: 122, type: !315)
!422 = !DILocation(line: 0, scope: !420)
!423 = !DILocalVariable(name: "e", arg: 2, scope: !420, file: !3, line: 122, type: !27)
!424 = !DILocation(line: 124, column: 9, scope: !425)
!425 = distinct !DILexicalBlock(scope: !420, file: !3, line: 124, column: 6)
!426 = !DILocation(line: 124, column: 6, scope: !425)
!427 = !DILocation(line: 124, column: 6, scope: !420)
!428 = !DILocation(line: 124, column: 18, scope: !425)
!429 = !DILocation(line: 124, column: 24, scope: !425)
!430 = !DILocation(line: 124, column: 28, scope: !425)
!431 = !DILocation(line: 124, column: 15, scope: !425)
!432 = !DILocation(line: 125, column: 10, scope: !425)
!433 = !DILocation(line: 125, column: 12, scope: !425)
!434 = !DILocation(line: 126, column: 5, scope: !420)
!435 = !DILocation(line: 126, column: 10, scope: !420)
!436 = !DILocation(line: 127, column: 5, scope: !420)
!437 = !DILocation(line: 127, column: 8, scope: !420)
!438 = !DILocation(line: 128, column: 1, scope: !420)
!439 = distinct !DISubprogram(name: "shift", scope: !3, file: !3, line: 130, type: !440, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!440 = !DISubroutineType(types: !441)
!441 = !{!27, !315}
!442 = !DILocalVariable(name: "c", arg: 1, scope: !439, file: !3, line: 130, type: !315)
!443 = !DILocation(line: 0, scope: !439)
!444 = !DILocation(line: 132, column: 15, scope: !439)
!445 = !DILocalVariable(name: "e", scope: !439, file: !3, line: 132, type: !27)
!446 = !DILocation(line: 133, column: 6, scope: !447)
!447 = distinct !DILexicalBlock(scope: !439, file: !3, line: 133, column: 6)
!448 = !DILocation(line: 133, column: 6, scope: !439)
!449 = !DILocation(line: 134, column: 13, scope: !450)
!450 = distinct !DILexicalBlock(scope: !447, file: !3, line: 133, column: 9)
!451 = !DILocation(line: 134, column: 6, scope: !450)
!452 = !DILocation(line: 134, column: 8, scope: !450)
!453 = !DILocation(line: 135, column: 13, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !3, line: 135, column: 7)
!455 = !DILocation(line: 135, column: 8, scope: !454)
!456 = !DILocation(line: 135, column: 7, scope: !450)
!457 = !DILocation(line: 135, column: 21, scope: !454)
!458 = !DILocation(line: 135, column: 26, scope: !454)
!459 = !DILocation(line: 135, column: 18, scope: !454)
!460 = !DILocation(line: 136, column: 2, scope: !450)
!461 = !DILocation(line: 137, column: 2, scope: !439)
!462 = distinct !DISubprogram(name: "make_chain", scope: !3, file: !3, line: 140, type: !463, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!463 = !DISubroutineType(types: !464)
!464 = !{!315, !22}
!465 = !DILocalVariable(name: "s", arg: 1, scope: !462, file: !3, line: 140, type: !22)
!466 = !DILocation(line: 0, scope: !462)
!467 = !DILocation(line: 142, column: 13, scope: !462)
!468 = !DILocalVariable(name: "c", scope: !462, file: !3, line: 142, type: !315)
!469 = !DILocalVariable(name: "j", scope: !470, file: !3, line: 145, type: !22)
!470 = distinct !DILexicalBlock(scope: !462, file: !3, line: 145, column: 2)
!471 = !DILocation(line: 0, scope: !470)
!472 = !DILocation(line: 145, column: 7, scope: !470)
!473 = !DILocation(line: 145, column: 26, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !3, line: 145, column: 2)
!475 = !DILocalVariable(name: "i", scope: !470, file: !3, line: 145, type: !22)
!476 = !DILocation(line: 145, column: 40, scope: !474)
!477 = !DILocation(line: 145, column: 2, scope: !470)
!478 = !DILocation(line: 146, column: 13, scope: !474)
!479 = !DILocation(line: 146, column: 3, scope: !474)
!480 = !DILocation(line: 145, column: 2, scope: !474)
!481 = distinct !{!481, !477, !482}
!482 = !DILocation(line: 146, column: 30, scope: !470)
!483 = !DILocalVariable(name: "j", scope: !484, file: !3, line: 149, type: !22)
!484 = distinct !DILexicalBlock(scope: !462, file: !3, line: 149, column: 2)
!485 = !DILocation(line: 0, scope: !484)
!486 = !DILocation(line: 149, column: 7, scope: !484)
!487 = !DILocation(line: 149, column: 26, scope: !488)
!488 = distinct !DILexicalBlock(scope: !484, file: !3, line: 149, column: 2)
!489 = !DILocalVariable(name: "i", scope: !484, file: !3, line: 149, type: !22)
!490 = !DILocation(line: 149, column: 40, scope: !488)
!491 = !DILocation(line: 149, column: 2, scope: !484)
!492 = !DILocation(line: 150, column: 13, scope: !488)
!493 = !DILocation(line: 150, column: 3, scope: !488)
!494 = !DILocation(line: 149, column: 2, scope: !488)
!495 = distinct !{!495, !491, !496}
!496 = !DILocation(line: 150, column: 30, scope: !484)
!497 = !DILocalVariable(name: "step", scope: !498, file: !3, line: 152, type: !22)
!498 = distinct !DILexicalBlock(scope: !462, file: !3, line: 152, column: 2)
!499 = !DILocation(line: 0, scope: !498)
!500 = !DILocation(line: 152, column: 7, scope: !498)
!501 = !DILocation(line: 153, column: 16, scope: !502)
!502 = distinct !DILexicalBlock(scope: !503, file: !3, line: 152, column: 30)
!503 = distinct !DILexicalBlock(scope: !498, file: !3, line: 152, column: 2)
!504 = !DILocalVariable(name: "e", scope: !502, file: !3, line: 153, type: !27)
!505 = !DILocation(line: 0, scope: !502)
!506 = !DILocalVariable(name: "i", scope: !507, file: !3, line: 155, type: !22)
!507 = distinct !DILexicalBlock(scope: !502, file: !3, line: 155, column: 3)
!508 = !DILocation(line: 0, scope: !507)
!509 = !DILocation(line: 155, column: 8, scope: !507)
!510 = !DILocation(line: 155, column: 21, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !3, line: 155, column: 3)
!512 = !DILocation(line: 155, column: 3, scope: !507)
!513 = !DILocation(line: 156, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !511, file: !3, line: 156, column: 8)
!515 = !DILocation(line: 156, column: 12, scope: !514)
!516 = !DILocation(line: 156, column: 8, scope: !511)
!517 = !DILocation(line: 156, column: 23, scope: !514)
!518 = !DILocation(line: 156, column: 20, scope: !514)
!519 = !DILocation(line: 155, column: 30, scope: !511)
!520 = !DILocation(line: 155, column: 3, scope: !511)
!521 = distinct !{!521, !512, !522}
!522 = !DILocation(line: 156, column: 23, scope: !507)
!523 = !DILocation(line: 157, column: 8, scope: !524)
!524 = distinct !DILexicalBlock(scope: !502, file: !3, line: 157, column: 7)
!525 = !DILocation(line: 157, column: 7, scope: !502)
!526 = !DILocation(line: 157, column: 11, scope: !524)
!527 = !DILocalVariable(name: "n", scope: !502, file: !3, line: 159, type: !22)
!528 = !DILocation(line: 160, column: 22, scope: !529)
!529 = distinct !DILexicalBlock(scope: !502, file: !3, line: 160, column: 3)
!530 = !DILocation(line: 160, column: 19, scope: !529)
!531 = !DILocalVariable(name: "j", scope: !529, file: !3, line: 160, type: !22)
!532 = !DILocation(line: 0, scope: !529)
!533 = !DILocation(line: 160, column: 8, scope: !529)
!534 = !DILocation(line: 160, column: 30, scope: !535)
!535 = distinct !DILexicalBlock(scope: !529, file: !3, line: 160, column: 3)
!536 = !DILocalVariable(name: "i", scope: !529, file: !3, line: 160, type: !22)
!537 = !DILocation(line: 160, column: 44, scope: !535)
!538 = !DILocation(line: 160, column: 3, scope: !529)
!539 = !DILocation(line: 161, column: 14, scope: !540)
!540 = distinct !DILexicalBlock(scope: !541, file: !3, line: 161, column: 8)
!541 = distinct !DILexicalBlock(scope: !535, file: !3, line: 160, column: 57)
!542 = !DILocation(line: 161, column: 12, scope: !540)
!543 = !DILocation(line: 161, column: 8, scope: !541)
!544 = !DILocation(line: 161, column: 34, scope: !540)
!545 = !DILocation(line: 162, column: 4, scope: !541)
!546 = !DILocation(line: 162, column: 9, scope: !541)
!547 = !DILocation(line: 162, column: 13, scope: !541)
!548 = !DILocation(line: 163, column: 3, scope: !541)
!549 = !DILocation(line: 160, column: 3, scope: !535)
!550 = distinct !{!550, !538, !551}
!551 = !DILocation(line: 163, column: 3, scope: !529)
!552 = !DILocation(line: 165, column: 9, scope: !553)
!553 = distinct !DILexicalBlock(scope: !502, file: !3, line: 165, column: 7)
!554 = !DILocation(line: 165, column: 7, scope: !502)
!555 = !DILocalVariable(name: "i", scope: !556, file: !3, line: 166, type: !22)
!556 = distinct !DILexicalBlock(scope: !557, file: !3, line: 166, column: 4)
!557 = distinct !DILexicalBlock(scope: !553, file: !3, line: 165, column: 17)
!558 = !DILocation(line: 0, scope: !556)
!559 = !DILocation(line: 166, column: 4, scope: !556)
!560 = !DILocation(line: 166, column: 4, scope: !561)
!561 = distinct !DILexicalBlock(scope: !556, file: !3, line: 166, column: 4)
!562 = !DILocation(line: 166, column: 31, scope: !561)
!563 = !DILocation(line: 166, column: 20, scope: !561)
!564 = distinct !{!564, !559, !565}
!565 = !DILocation(line: 166, column: 39, scope: !556)
!566 = !DILocalVariable(name: "i", scope: !567, file: !3, line: 167, type: !22)
!567 = distinct !DILexicalBlock(scope: !557, file: !3, line: 167, column: 4)
!568 = !DILocation(line: 0, scope: !567)
!569 = !DILocation(line: 167, column: 4, scope: !567)
!570 = !DILocation(line: 167, column: 4, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !3, line: 167, column: 4)
!572 = !DILocation(line: 167, column: 27, scope: !571)
!573 = !DILocation(line: 167, column: 17, scope: !571)
!574 = distinct !{!574, !569, !575}
!575 = !DILocation(line: 167, column: 33, scope: !567)
!576 = !DILocation(line: 169, column: 3, scope: !557)
!577 = !DILocation(line: 169, column: 10, scope: !553)
!578 = !DILocation(line: 169, column: 17, scope: !553)
!579 = !DILocation(line: 169, column: 21, scope: !553)
!580 = !DILocation(line: 170, column: 15, scope: !553)
!581 = !DILocation(line: 170, column: 4, scope: !553)
!582 = distinct !{!582, !577, !583}
!583 = !DILocation(line: 170, column: 21, scope: !553)
!584 = !DILocation(line: 171, column: 2, scope: !502)
!585 = !DILocation(line: 152, column: 26, scope: !503)
!586 = !DILocation(line: 152, column: 2, scope: !503)
!587 = distinct !{!587, !588, !589}
!588 = !DILocation(line: 152, column: 2, scope: !498)
!589 = !DILocation(line: 171, column: 2, scope: !498)
!590 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 175, type: !591, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!591 = !DISubroutineType(types: !592)
!592 = !{!22}
!593 = !DILocalVariable(name: "best", scope: !590, file: !3, line: 177, type: !22)
!594 = !DILocation(line: 0, scope: !590)
!595 = !DILocation(line: 178, column: 2, scope: !590)
!596 = !DILocalVariable(name: "i", scope: !597, file: !3, line: 180, type: !22)
!597 = distinct !DILexicalBlock(scope: !590, file: !3, line: 180, column: 2)
!598 = !DILocation(line: 0, scope: !597)
!599 = !DILocation(line: 180, column: 2, scope: !597)
!600 = !DILocation(line: 180, column: 2, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !3, line: 180, column: 2)
!602 = !DILocation(line: 182, column: 3, scope: !603)
!603 = distinct !DILexicalBlock(scope: !601, file: !3, line: 180, column: 16)
!604 = !DILocalVariable(name: "j", scope: !605, file: !3, line: 183, type: !22)
!605 = distinct !DILexicalBlock(scope: !603, file: !3, line: 183, column: 3)
!606 = !DILocation(line: 0, scope: !605)
!607 = !DILocation(line: 183, column: 3, scope: !605)
!608 = !DILocation(line: 183, column: 3, scope: !609)
!609 = distinct !DILexicalBlock(scope: !605, file: !3, line: 183, column: 3)
!610 = !DILocation(line: 183, column: 33, scope: !609)
!611 = !DILocation(line: 183, column: 39, scope: !609)
!612 = !DILocation(line: 183, column: 22, scope: !609)
!613 = distinct !{!613, !607, !614}
!614 = !DILocation(line: 183, column: 42, scope: !605)
!615 = !DILocation(line: 186, column: 14, scope: !603)
!616 = !DILocalVariable(name: "c", scope: !603, file: !3, line: 186, type: !315)
!617 = !DILocation(line: 0, scope: !603)
!618 = !DILocation(line: 187, column: 10, scope: !619)
!619 = distinct !DILexicalBlock(scope: !603, file: !3, line: 187, column: 7)
!620 = !DILocation(line: 187, column: 14, scope: !619)
!621 = !DILocation(line: 187, column: 7, scope: !603)
!622 = !DILocation(line: 188, column: 4, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !3, line: 187, column: 22)
!624 = !DILocation(line: 189, column: 14, scope: !623)
!625 = !DILocation(line: 190, column: 3, scope: !623)
!626 = !DILocation(line: 191, column: 8, scope: !603)
!627 = !DILocation(line: 191, column: 3, scope: !603)
!628 = !DILocation(line: 192, column: 2, scope: !603)
!629 = distinct !{!629, !599, !630}
!630 = !DILocation(line: 192, column: 2, scope: !597)
!631 = !DILocation(line: 194, column: 2, scope: !590)
!632 = !DILocation(line: 195, column: 2, scope: !590)
