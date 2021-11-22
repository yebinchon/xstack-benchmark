; ModuleID = 'last-letter-first-letter-2.c'
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
  %g.addr = alloca %struct.edge*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca %struct.node*, align 8
  store %struct.edge* %g, %struct.edge** %g.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.edge** %g.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load %struct.edge*, %struct.edge** %g.addr, align 8, !dbg !66
  %tobool = icmp ne %struct.edge* %0, null, !dbg !66
  br i1 %tobool, label %if.end, label %if.then, !dbg !68, !cf.info !69

if.then:                                          ; preds = %entry
  br label %return, !dbg !70

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = load %struct.edge*, %struct.edge** %g.addr, align 8, !dbg !73
  %e = getelementptr inbounds %struct.edge, %struct.edge* %1, i32 0, i32 1, !dbg !74
  %2 = load i8, i8* %e, align 1, !dbg !74
  %conv = sext i8 %2 to i32, !dbg !73
  store i32 %conv, i32* %i, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !75, metadata !DIExpression()), !dbg !76
  %3 = load %struct.edge*, %struct.edge** %g.addr, align 8, !dbg !77
  %s = getelementptr inbounds %struct.edge, %struct.edge* %3, i32 0, i32 0, !dbg !78
  %4 = load i8, i8* %s, align 8, !dbg !78
  %conv1 = sext i8 %4 to i32, !dbg !77
  store i32 %conv1, i32* %j, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata %struct.node** %n, metadata !79, metadata !DIExpression()), !dbg !81
  %5 = load i32, i32* %j, align 4, !dbg !82
  %idx.ext = sext i32 %5 to i64, !dbg !83
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext, !dbg !83
  store %struct.node* %add.ptr, %struct.node** %n, align 8, !dbg !81
  %6 = load %struct.node*, %struct.node** %n, align 8, !dbg !84
  %e2 = getelementptr inbounds %struct.node, %struct.node* %6, i32 0, i32 0, !dbg !85
  %7 = load i32, i32* %i, align 4, !dbg !86
  %idxprom = sext i32 %7 to i64, !dbg !84
  %arrayidx = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e2, i64 0, i64 %idxprom, !dbg !84
  %8 = load %struct.edge*, %struct.edge** %arrayidx, align 8, !dbg !84
  %9 = load %struct.edge*, %struct.edge** %g.addr, align 8, !dbg !87
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %9, i32 0, i32 3, !dbg !88
  store %struct.edge* %8, %struct.edge** %lnk, align 8, !dbg !89
  %10 = load %struct.edge*, %struct.edge** %g.addr, align 8, !dbg !90
  %11 = load %struct.node*, %struct.node** %n, align 8, !dbg !91
  %e3 = getelementptr inbounds %struct.node, %struct.node* %11, i32 0, i32 0, !dbg !92
  %12 = load i32, i32* %i, align 4, !dbg !93
  %idxprom4 = sext i32 %12 to i64, !dbg !91
  %arrayidx5 = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e3, i64 0, i64 %idxprom4, !dbg !91
  store %struct.edge* %10, %struct.edge** %arrayidx5, align 8, !dbg !94
  %13 = load %struct.node*, %struct.node** %n, align 8, !dbg !95
  %out = getelementptr inbounds %struct.node, %struct.node* %13, i32 0, i32 4, !dbg !96
  %14 = load i32, i32* %i, align 4, !dbg !97
  %idxprom6 = sext i32 %14 to i64, !dbg !95
  %arrayidx7 = getelementptr inbounds [26 x i32], [26 x i32]* %out, i64 0, i64 %idxprom6, !dbg !95
  %15 = load i32, i32* %arrayidx7, align 4, !dbg !98
  %inc = add nsw i32 %15, 1, !dbg !98
  store i32 %inc, i32* %arrayidx7, align 4, !dbg !98
  %16 = load %struct.node*, %struct.node** %n, align 8, !dbg !99
  %nout = getelementptr inbounds %struct.node, %struct.node* %16, i32 0, i32 2, !dbg !100
  %17 = load i32, i32* %nout, align 4, !dbg !101
  %inc8 = add nsw i32 %17, 1, !dbg !101
  store i32 %inc8, i32* %nout, align 4, !dbg !101
  %18 = load i32, i32* %i, align 4, !dbg !102
  %idx.ext9 = sext i32 %18 to i64, !dbg !103
  %add.ptr10 = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext9, !dbg !103
  store %struct.node* %add.ptr10, %struct.node** %n, align 8, !dbg !104
  %19 = load %struct.node*, %struct.node** %n, align 8, !dbg !105
  %in = getelementptr inbounds %struct.node, %struct.node* %19, i32 0, i32 3, !dbg !106
  %20 = load i32, i32* %j, align 4, !dbg !107
  %idxprom11 = sext i32 %20 to i64, !dbg !105
  %arrayidx12 = getelementptr inbounds [26 x i32], [26 x i32]* %in, i64 0, i64 %idxprom11, !dbg !105
  %21 = load i32, i32* %arrayidx12, align 4, !dbg !108
  %inc13 = add nsw i32 %21, 1, !dbg !108
  store i32 %inc13, i32* %arrayidx12, align 4, !dbg !108
  %22 = load %struct.node*, %struct.node** %n, align 8, !dbg !109
  %nin = getelementptr inbounds %struct.node, %struct.node* %22, i32 0, i32 1, !dbg !110
  %23 = load i32, i32* %nin, align 8, !dbg !111
  %inc14 = add nsw i32 %23, 1, !dbg !111
  store i32 %inc14, i32* %nin, align 8, !dbg !111
  br label %return, !dbg !112

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !112
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.edge* @remove_edge(i32 %i, i32 %j) #0 !dbg !113 {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %n = alloca %struct.node*, align 8
  %g = alloca %struct.edge*, align 8
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata %struct.node** %n, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* %i.addr, align 4, !dbg !122
  %idx.ext = sext i32 %0 to i64, !dbg !123
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext, !dbg !123
  store %struct.node* %add.ptr, %struct.node** %n, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata %struct.edge** %g, metadata !124, metadata !DIExpression()), !dbg !125
  %1 = load %struct.node*, %struct.node** %n, align 8, !dbg !126
  %e = getelementptr inbounds %struct.node, %struct.node* %1, i32 0, i32 0, !dbg !127
  %2 = load i32, i32* %j.addr, align 4, !dbg !128
  %idxprom = sext i32 %2 to i64, !dbg !126
  %arrayidx = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e, i64 0, i64 %idxprom, !dbg !126
  %3 = load %struct.edge*, %struct.edge** %arrayidx, align 8, !dbg !126
  store %struct.edge* %3, %struct.edge** %g, align 8, !dbg !125
  %4 = load %struct.edge*, %struct.edge** %g, align 8, !dbg !129
  %tobool = icmp ne %struct.edge* %4, null, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131, !cf.info !69

if.then:                                          ; preds = %entry
  %5 = load %struct.edge*, %struct.edge** %g, align 8, !dbg !132
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %5, i32 0, i32 3, !dbg !134
  %6 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !134
  %7 = load %struct.node*, %struct.node** %n, align 8, !dbg !135
  %e1 = getelementptr inbounds %struct.node, %struct.node* %7, i32 0, i32 0, !dbg !136
  %8 = load i32, i32* %j.addr, align 4, !dbg !137
  %idxprom2 = sext i32 %8 to i64, !dbg !135
  %arrayidx3 = getelementptr inbounds [26 x %struct.edge*], [26 x %struct.edge*]* %e1, i64 0, i64 %idxprom2, !dbg !135
  store %struct.edge* %6, %struct.edge** %arrayidx3, align 8, !dbg !138
  %9 = load %struct.edge*, %struct.edge** %g, align 8, !dbg !139
  %lnk4 = getelementptr inbounds %struct.edge, %struct.edge* %9, i32 0, i32 3, !dbg !140
  store %struct.edge* null, %struct.edge** %lnk4, align 8, !dbg !141
  %10 = load %struct.node*, %struct.node** %n, align 8, !dbg !142
  %out = getelementptr inbounds %struct.node, %struct.node* %10, i32 0, i32 4, !dbg !143
  %11 = load i32, i32* %j.addr, align 4, !dbg !144
  %idxprom5 = sext i32 %11 to i64, !dbg !142
  %arrayidx6 = getelementptr inbounds [26 x i32], [26 x i32]* %out, i64 0, i64 %idxprom5, !dbg !142
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !145
  %dec = add nsw i32 %12, -1, !dbg !145
  store i32 %dec, i32* %arrayidx6, align 4, !dbg !145
  %13 = load %struct.node*, %struct.node** %n, align 8, !dbg !146
  %nout = getelementptr inbounds %struct.node, %struct.node* %13, i32 0, i32 2, !dbg !147
  %14 = load i32, i32* %nout, align 4, !dbg !148
  %dec7 = add nsw i32 %14, -1, !dbg !148
  store i32 %dec7, i32* %nout, align 4, !dbg !148
  %15 = load i32, i32* %j.addr, align 4, !dbg !149
  %idx.ext8 = sext i32 %15 to i64, !dbg !150
  %add.ptr9 = getelementptr inbounds %struct.node, %struct.node* getelementptr inbounds ([26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 0), i64 %idx.ext8, !dbg !150
  store %struct.node* %add.ptr9, %struct.node** %n, align 8, !dbg !151
  %16 = load %struct.node*, %struct.node** %n, align 8, !dbg !152
  %in = getelementptr inbounds %struct.node, %struct.node* %16, i32 0, i32 3, !dbg !153
  %17 = load i32, i32* %i.addr, align 4, !dbg !154
  %idxprom10 = sext i32 %17 to i64, !dbg !152
  %arrayidx11 = getelementptr inbounds [26 x i32], [26 x i32]* %in, i64 0, i64 %idxprom10, !dbg !152
  %18 = load i32, i32* %arrayidx11, align 4, !dbg !155
  %dec12 = add nsw i32 %18, -1, !dbg !155
  store i32 %dec12, i32* %arrayidx11, align 4, !dbg !155
  %19 = load %struct.node*, %struct.node** %n, align 8, !dbg !156
  %nin = getelementptr inbounds %struct.node, %struct.node* %19, i32 0, i32 1, !dbg !157
  %20 = load i32, i32* %nin, align 8, !dbg !158
  %dec13 = add nsw i32 %20, -1, !dbg !158
  store i32 %dec13, i32* %nin, align 8, !dbg !158
  br label %if.end, !dbg !159

if.end:                                           ; preds = %if.then, %entry
  %21 = load %struct.edge*, %struct.edge** %g, align 8, !dbg !160
  ret %struct.edge* %21, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @read_names() #0 !dbg !162 {
entry:
  %fp = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %buf = alloca i8*, align 8
  %p = alloca %struct.edge*, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !165, metadata !DIExpression()), !dbg !225
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !226
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %i, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32* %len, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !231, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata %struct.edge** %p, metadata !233, metadata !DIExpression()), !dbg !234
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !235
  %tobool = icmp ne %struct._IO_FILE* %0, null, !dbg !235
  br i1 %tobool, label %if.end, label %if.then, !dbg !237, !cf.info !69

if.then:                                          ; preds = %entry
  call void @abort() #8, !dbg !238
  unreachable, !dbg !238

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !239
  %call1 = call i32 @fseek(%struct._IO_FILE* %1, i64 0, i32 2), !dbg !240
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !241
  %call2 = call i64 @ftell(%struct._IO_FILE* %2), !dbg !242
  %conv = trunc i64 %call2 to i32, !dbg !242
  store i32 %conv, i32* %len, align 4, !dbg !243
  %3 = load i32, i32* %len, align 4, !dbg !244
  %add = add nsw i32 %3, 1, !dbg !245
  %conv3 = sext i32 %add to i64, !dbg !244
  %call4 = call noalias i8* @malloc(i64 %conv3) #9, !dbg !246
  store i8* %call4, i8** %buf, align 8, !dbg !247
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !248
  %call5 = call i32 @fseek(%struct._IO_FILE* %4, i64 0, i32 0), !dbg !249
  %5 = load i8*, i8** %buf, align 8, !dbg !250
  %6 = load i32, i32* %len, align 4, !dbg !251
  %conv6 = sext i32 %6 to i64, !dbg !251
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !252
  %call7 = call i64 @fread(i8* %5, i64 1, i64 %conv6, %struct._IO_FILE* %7), !dbg !253
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !254
  %call8 = call i32 @fclose(%struct._IO_FILE* %8), !dbg !255
  %9 = load i8*, i8** %buf, align 8, !dbg !256
  %10 = load i32, i32* %len, align 4, !dbg !257
  %idxprom = sext i32 %10 to i64, !dbg !256
  %arrayidx = getelementptr inbounds i8, i8* %9, i64 %idxprom, !dbg !256
  store i8 0, i8* %arrayidx, align 1, !dbg !258
  store i32 0, i32* %i, align 4, !dbg !259
  store i32 0, i32* @n_names, align 4, !dbg !261
  br label %for.cond, !dbg !262

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i32, i32* %i, align 4, !dbg !263
  %12 = load i32, i32* %len, align 4, !dbg !265
  %cmp = icmp slt i32 %11, %12, !dbg !266
  br i1 %cmp, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %call10 = call i16** @__ctype_b_loc() #10, !dbg !268
  %13 = load i16*, i16** %call10, align 8, !dbg !268
  %14 = load i8*, i8** %buf, align 8, !dbg !268
  %15 = load i32, i32* %i, align 4, !dbg !268
  %idxprom11 = sext i32 %15 to i64, !dbg !268
  %arrayidx12 = getelementptr inbounds i8, i8* %14, i64 %idxprom11, !dbg !268
  %16 = load i8, i8* %arrayidx12, align 1, !dbg !268
  %conv13 = sext i8 %16 to i32, !dbg !268
  %idxprom14 = sext i32 %conv13 to i64, !dbg !268
  %arrayidx15 = getelementptr inbounds i16, i16* %13, i64 %idxprom14, !dbg !268
  %17 = load i16, i16* %arrayidx15, align 2, !dbg !268
  %conv16 = zext i16 %17 to i32, !dbg !268
  %and = and i32 %conv16, 8192, !dbg !268
  %tobool17 = icmp ne i32 %and, 0, !dbg !268
  br i1 %tobool17, label %if.then18, label %if.end21, !dbg !270, !cf.info !69

if.then18:                                        ; preds = %for.body
  %18 = load i8*, i8** %buf, align 8, !dbg !271
  %19 = load i32, i32* %i, align 4, !dbg !272
  %idxprom19 = sext i32 %19 to i64, !dbg !271
  %arrayidx20 = getelementptr inbounds i8, i8* %18, i64 %idxprom19, !dbg !271
  store i8 0, i8* %arrayidx20, align 1, !dbg !273
  %20 = load i32, i32* @n_names, align 4, !dbg !274
  %inc = add nsw i32 %20, 1, !dbg !274
  store i32 %inc, i32* @n_names, align 4, !dbg !274
  br label %if.end21, !dbg !271

if.end21:                                         ; preds = %if.then18, %for.body
  br label %for.inc, !dbg !268

for.inc:                                          ; preds = %if.end21
  %21 = load i32, i32* %i, align 4, !dbg !275
  %inc22 = add nsw i32 %21, 1, !dbg !275
  store i32 %inc22, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !276, !llvm.loop !277

for.end:                                          ; preds = %for.cond
  %22 = load i8*, i8** %buf, align 8, !dbg !279
  %23 = load i32, i32* %len, align 4, !dbg !281
  %sub = sub nsw i32 %23, 1, !dbg !282
  %idxprom23 = sext i32 %sub to i64, !dbg !279
  %arrayidx24 = getelementptr inbounds i8, i8* %22, i64 %idxprom23, !dbg !279
  %24 = load i8, i8* %arrayidx24, align 1, !dbg !279
  %tobool25 = icmp ne i8 %24, 0, !dbg !279
  br i1 %tobool25, label %if.then26, label %if.end28, !dbg !283, !cf.info !69

if.then26:                                        ; preds = %for.end
  %25 = load i32, i32* @n_names, align 4, !dbg !284
  %inc27 = add nsw i32 %25, 1, !dbg !284
  store i32 %inc27, i32* @n_names, align 4, !dbg !284
  br label %if.end28, !dbg !285

if.end28:                                         ; preds = %if.then26, %for.end
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([26 x %struct.node]* @nodes to i8*), i8 0, i64 11024, i1 false), !dbg !286
  %26 = load i32, i32* @n_names, align 4, !dbg !287
  %conv29 = sext i32 %26 to i64, !dbg !287
  %call30 = call noalias i8* @calloc(i64 %conv29, i64 8) #9, !dbg !288
  %27 = bitcast i8* %call30 to %struct.edge**, !dbg !288
  store %struct.edge** %27, %struct.edge*** @tmp, align 8, !dbg !289
  %28 = load i32, i32* @n_names, align 4, !dbg !290
  %conv31 = sext i32 %28 to i64, !dbg !290
  %mul = mul i64 24, %conv31, !dbg !291
  %call32 = call noalias i8* @malloc(i64 %mul) #9, !dbg !292
  %29 = bitcast i8* %call32 to %struct.edge*, !dbg !292
  store %struct.edge* %29, %struct.edge** @names, align 8, !dbg !293
  store %struct.edge* %29, %struct.edge** %p, align 8, !dbg !294
  store i32 0, i32* %i, align 4, !dbg !295
  br label %for.cond33, !dbg !297

for.cond33:                                       ; preds = %for.inc83, %if.end28
  %30 = load i32, i32* %i, align 4, !dbg !298
  %31 = load i32, i32* @n_names, align 4, !dbg !300
  %cmp34 = icmp slt i32 %30, %31, !dbg !301
  br i1 %cmp34, label %for.body36, label %for.end85, !dbg !302

for.body36:                                       ; preds = %for.cond33
  %32 = load i32, i32* %i, align 4, !dbg !303
  %tobool37 = icmp ne i32 %32, 0, !dbg !303
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !306, !cf.info !69

if.then38:                                        ; preds = %for.body36
  %33 = load %struct.edge*, %struct.edge** @names, align 8, !dbg !307
  %34 = load i32, i32* %i, align 4, !dbg !308
  %sub39 = sub nsw i32 %34, 1, !dbg !309
  %idxprom40 = sext i32 %sub39 to i64, !dbg !307
  %arrayidx41 = getelementptr inbounds %struct.edge, %struct.edge* %33, i64 %idxprom40, !dbg !307
  %str = getelementptr inbounds %struct.edge, %struct.edge* %arrayidx41, i32 0, i32 2, !dbg !310
  %35 = load i8*, i8** %str, align 8, !dbg !310
  %36 = load i32, i32* %len, align 4, !dbg !311
  %idx.ext = sext i32 %36 to i64, !dbg !312
  %add.ptr = getelementptr inbounds i8, i8* %35, i64 %idx.ext, !dbg !312
  %add.ptr42 = getelementptr inbounds i8, i8* %add.ptr, i64 1, !dbg !313
  %37 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !314
  %str43 = getelementptr inbounds %struct.edge, %struct.edge* %37, i32 0, i32 2, !dbg !315
  store i8* %add.ptr42, i8** %str43, align 8, !dbg !316
  br label %if.end45, !dbg !314

if.else:                                          ; preds = %for.body36
  %38 = load i8*, i8** %buf, align 8, !dbg !317
  %39 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !318
  %str44 = getelementptr inbounds %struct.edge, %struct.edge* %39, i32 0, i32 2, !dbg !319
  store i8* %38, i8** %str44, align 8, !dbg !320
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then38
  %40 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !321
  %str46 = getelementptr inbounds %struct.edge, %struct.edge* %40, i32 0, i32 2, !dbg !322
  %41 = load i8*, i8** %str46, align 8, !dbg !322
  %call47 = call i64 @strlen(i8* %41) #11, !dbg !323
  %conv48 = trunc i64 %call47 to i32, !dbg !323
  store i32 %conv48, i32* %len, align 4, !dbg !324
  %42 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !325
  %str49 = getelementptr inbounds %struct.edge, %struct.edge* %42, i32 0, i32 2, !dbg !326
  %43 = load i8*, i8** %str49, align 8, !dbg !326
  %arrayidx50 = getelementptr inbounds i8, i8* %43, i64 0, !dbg !325
  %44 = load i8, i8* %arrayidx50, align 1, !dbg !325
  %conv51 = sext i8 %44 to i32, !dbg !325
  %sub52 = sub nsw i32 %conv51, 97, !dbg !327
  %conv53 = trunc i32 %sub52 to i8, !dbg !325
  %45 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !328
  %s = getelementptr inbounds %struct.edge, %struct.edge* %45, i32 0, i32 0, !dbg !329
  store i8 %conv53, i8* %s, align 8, !dbg !330
  %46 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !331
  %str54 = getelementptr inbounds %struct.edge, %struct.edge* %46, i32 0, i32 2, !dbg !332
  %47 = load i8*, i8** %str54, align 8, !dbg !332
  %48 = load i32, i32* %len, align 4, !dbg !333
  %sub55 = sub nsw i32 %48, 1, !dbg !334
  %idxprom56 = sext i32 %sub55 to i64, !dbg !331
  %arrayidx57 = getelementptr inbounds i8, i8* %47, i64 %idxprom56, !dbg !331
  %49 = load i8, i8* %arrayidx57, align 1, !dbg !331
  %conv58 = sext i8 %49 to i32, !dbg !331
  %sub59 = sub nsw i32 %conv58, 97, !dbg !335
  %conv60 = trunc i32 %sub59 to i8, !dbg !331
  %50 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !336
  %e = getelementptr inbounds %struct.edge, %struct.edge* %50, i32 0, i32 1, !dbg !337
  store i8 %conv60, i8* %e, align 1, !dbg !338
  %51 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !339
  %s61 = getelementptr inbounds %struct.edge, %struct.edge* %51, i32 0, i32 0, !dbg !341
  %52 = load i8, i8* %s61, align 8, !dbg !341
  %conv62 = sext i8 %52 to i32, !dbg !339
  %cmp63 = icmp slt i32 %conv62, 0, !dbg !342
  br i1 %cmp63, label %if.then79, label %lor.lhs.false, !dbg !343, !cf.info !69

lor.lhs.false:                                    ; preds = %if.end45
  %53 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !344
  %s65 = getelementptr inbounds %struct.edge, %struct.edge* %53, i32 0, i32 0, !dbg !345
  %54 = load i8, i8* %s65, align 8, !dbg !345
  %conv66 = sext i8 %54 to i32, !dbg !344
  %cmp67 = icmp sge i32 %conv66, 26, !dbg !346
  br i1 %cmp67, label %if.then79, label %lor.lhs.false69, !dbg !347, !cf.info !69

lor.lhs.false69:                                  ; preds = %lor.lhs.false
  %55 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !348
  %e70 = getelementptr inbounds %struct.edge, %struct.edge* %55, i32 0, i32 1, !dbg !349
  %56 = load i8, i8* %e70, align 1, !dbg !349
  %conv71 = sext i8 %56 to i32, !dbg !348
  %cmp72 = icmp slt i32 %conv71, 0, !dbg !350
  br i1 %cmp72, label %if.then79, label %lor.lhs.false74, !dbg !351, !cf.info !69

lor.lhs.false74:                                  ; preds = %lor.lhs.false69
  %57 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !352
  %e75 = getelementptr inbounds %struct.edge, %struct.edge* %57, i32 0, i32 1, !dbg !353
  %58 = load i8, i8* %e75, align 1, !dbg !353
  %conv76 = sext i8 %58 to i32, !dbg !352
  %cmp77 = icmp sge i32 %conv76, 26, !dbg !354
  br i1 %cmp77, label %if.then79, label %if.end82, !dbg !355, !cf.info !69

if.then79:                                        ; preds = %lor.lhs.false74, %lor.lhs.false69, %lor.lhs.false, %if.end45
  %59 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !356
  %str80 = getelementptr inbounds %struct.edge, %struct.edge* %59, i32 0, i32 2, !dbg !358
  %60 = load i8*, i8** %str80, align 8, !dbg !358
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i8* %60), !dbg !359
  call void @abort() #8, !dbg !360
  unreachable, !dbg !360

if.end82:                                         ; preds = %lor.lhs.false74
  br label %for.inc83, !dbg !361

for.inc83:                                        ; preds = %if.end82
  %61 = load i32, i32* %i, align 4, !dbg !362
  %inc84 = add nsw i32 %61, 1, !dbg !362
  store i32 %inc84, i32* %i, align 4, !dbg !362
  %62 = load %struct.edge*, %struct.edge** %p, align 8, !dbg !363
  %incdec.ptr = getelementptr inbounds %struct.edge, %struct.edge* %62, i32 1, !dbg !363
  store %struct.edge* %incdec.ptr, %struct.edge** %p, align 8, !dbg !363
  br label %for.cond33, !dbg !364, !llvm.loop !365

for.end85:                                        ; preds = %for.cond33
  %63 = load i32, i32* @n_names, align 4, !dbg !367
  %call86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i32 %63), !dbg !368
  ret void, !dbg !369
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
define dso_local void @show_chain(%struct.chain* %c) #0 !dbg !370 {
entry:
  %c.addr = alloca %struct.chain*, align 8
  %e = alloca %struct.edge*, align 8
  store %struct.chain* %c, %struct.chain** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.chain** %c.addr, metadata !381, metadata !DIExpression()), !dbg !382
  %0 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !383
  %len = getelementptr inbounds %struct.chain, %struct.chain* %0, i32 0, i32 2, !dbg !384
  %1 = load i32, i32* %len, align 8, !dbg !384
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %1), !dbg !385
  call void @llvm.dbg.declare(metadata %struct.edge** %e, metadata !386, metadata !DIExpression()), !dbg !388
  %2 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !389
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %2, i32 0, i32 0, !dbg !390
  %3 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !390
  store %struct.edge* %3, %struct.edge** %e, align 8, !dbg !388
  br label %for.cond, !dbg !391

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !392
  %tobool = icmp ne %struct.edge* %4, null, !dbg !392
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !394

lor.rhs:                                          ; preds = %for.cond
  %call2 = call i32 @putchar(i32 10), !dbg !395
  %tobool3 = icmp ne i32 %call2, 0, !dbg !396
  %lnot = xor i1 %tobool3, true, !dbg !396
  br label %lor.end, !dbg !394

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %5 = phi i1 [ true, %for.cond ], [ %lnot, %lor.rhs ]
  br i1 %5, label %for.body, label %for.end, !dbg !397

for.body:                                         ; preds = %lor.end
  %6 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !398
  %str = getelementptr inbounds %struct.edge, %struct.edge* %6, i32 0, i32 2, !dbg !399
  %7 = load i8*, i8** %str, align 8, !dbg !399
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i8* %7), !dbg !400
  br label %for.inc, !dbg !400

for.inc:                                          ; preds = %for.body
  %8 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !401
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %8, i32 0, i32 3, !dbg !402
  %9 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !402
  store %struct.edge* %9, %struct.edge** %e, align 8, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %lor.end
  ret void, !dbg !407
}

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @widest(i32 %n, i32 %out) #0 !dbg !408 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %mm = alloca i32, align 4
  %mi = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !411, metadata !DIExpression()), !dbg !412
  store i32 %out, i32* %out.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %out.addr, metadata !413, metadata !DIExpression()), !dbg !414
  %0 = load i32, i32* %n.addr, align 4, !dbg !415
  %idxprom = sext i32 %0 to i64, !dbg !417
  %arrayidx = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom, !dbg !417
  %out1 = getelementptr inbounds %struct.node, %struct.node* %arrayidx, i32 0, i32 4, !dbg !418
  %1 = load i32, i32* %n.addr, align 4, !dbg !419
  %idxprom2 = sext i32 %1 to i64, !dbg !417
  %arrayidx3 = getelementptr inbounds [26 x i32], [26 x i32]* %out1, i64 0, i64 %idxprom2, !dbg !417
  %2 = load i32, i32* %arrayidx3, align 4, !dbg !417
  %tobool = icmp ne i32 %2, 0, !dbg !417
  br i1 %tobool, label %if.then, label %if.end, !dbg !420, !cf.info !69

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !dbg !421
  store i32 %3, i32* %retval, align 4, !dbg !422
  br label %return, !dbg !422

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %mm, metadata !423, metadata !DIExpression()), !dbg !424
  store i32 -1, i32* %mm, align 4, !dbg !424
  call void @llvm.dbg.declare(metadata i32* %mi, metadata !425, metadata !DIExpression()), !dbg !426
  store i32 -1, i32* %mi, align 4, !dbg !426
  call void @llvm.dbg.declare(metadata i32* %i, metadata !427, metadata !DIExpression()), !dbg !429
  store i32 0, i32* %i, align 4, !dbg !429
  br label %for.cond, !dbg !429

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !430
  %cmp = icmp slt i32 %4, 26, !dbg !430
  br i1 %cmp, label %for.body, label %for.end, !dbg !429

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %out.addr, align 4, !dbg !432
  %tobool4 = icmp ne i32 %5, 0, !dbg !432
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !435, !cf.info !69

if.then5:                                         ; preds = %for.body
  %6 = load i32, i32* %n.addr, align 4, !dbg !436
  %idxprom6 = sext i32 %6 to i64, !dbg !439
  %arrayidx7 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom6, !dbg !439
  %out8 = getelementptr inbounds %struct.node, %struct.node* %arrayidx7, i32 0, i32 4, !dbg !440
  %7 = load i32, i32* %i, align 4, !dbg !441
  %idxprom9 = sext i32 %7 to i64, !dbg !439
  %arrayidx10 = getelementptr inbounds [26 x i32], [26 x i32]* %out8, i64 0, i64 %idxprom9, !dbg !439
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !439
  %tobool11 = icmp ne i32 %8, 0, !dbg !439
  br i1 %tobool11, label %land.lhs.true, label %if.end19, !dbg !442, !cf.info !69

land.lhs.true:                                    ; preds = %if.then5
  %9 = load i32, i32* %i, align 4, !dbg !443
  %idxprom12 = sext i32 %9 to i64, !dbg !444
  %arrayidx13 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom12, !dbg !444
  %nout = getelementptr inbounds %struct.node, %struct.node* %arrayidx13, i32 0, i32 2, !dbg !445
  %10 = load i32, i32* %nout, align 4, !dbg !445
  %11 = load i32, i32* %mm, align 4, !dbg !446
  %cmp14 = icmp sgt i32 %10, %11, !dbg !447
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !448, !cf.info !69

if.then15:                                        ; preds = %land.lhs.true
  %12 = load i32, i32* %i, align 4, !dbg !449
  store i32 %12, i32* %mi, align 4, !dbg !450
  %13 = load i32, i32* %i, align 4, !dbg !451
  %idxprom16 = sext i32 %13 to i64, !dbg !452
  %arrayidx17 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom16, !dbg !452
  %nout18 = getelementptr inbounds %struct.node, %struct.node* %arrayidx17, i32 0, i32 2, !dbg !453
  %14 = load i32, i32* %nout18, align 4, !dbg !453
  store i32 %14, i32* %mm, align 4, !dbg !454
  br label %if.end19, !dbg !455

if.end19:                                         ; preds = %if.then15, %land.lhs.true, %if.then5
  br label %if.end35, !dbg !456

if.else:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !457
  %idxprom20 = sext i32 %15 to i64, !dbg !460
  %arrayidx21 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom20, !dbg !460
  %out22 = getelementptr inbounds %struct.node, %struct.node* %arrayidx21, i32 0, i32 4, !dbg !461
  %16 = load i32, i32* %n.addr, align 4, !dbg !462
  %idxprom23 = sext i32 %16 to i64, !dbg !460
  %arrayidx24 = getelementptr inbounds [26 x i32], [26 x i32]* %out22, i64 0, i64 %idxprom23, !dbg !460
  %17 = load i32, i32* %arrayidx24, align 4, !dbg !460
  %tobool25 = icmp ne i32 %17, 0, !dbg !460
  br i1 %tobool25, label %land.lhs.true26, label %if.end34, !dbg !463, !cf.info !69

land.lhs.true26:                                  ; preds = %if.else
  %18 = load i32, i32* %i, align 4, !dbg !464
  %idxprom27 = sext i32 %18 to i64, !dbg !465
  %arrayidx28 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom27, !dbg !465
  %nin = getelementptr inbounds %struct.node, %struct.node* %arrayidx28, i32 0, i32 1, !dbg !466
  %19 = load i32, i32* %nin, align 8, !dbg !466
  %20 = load i32, i32* %mm, align 4, !dbg !467
  %cmp29 = icmp sgt i32 %19, %20, !dbg !468
  br i1 %cmp29, label %if.then30, label %if.end34, !dbg !469, !cf.info !69

if.then30:                                        ; preds = %land.lhs.true26
  %21 = load i32, i32* %i, align 4, !dbg !470
  store i32 %21, i32* %mi, align 4, !dbg !471
  %22 = load i32, i32* %i, align 4, !dbg !472
  %idxprom31 = sext i32 %22 to i64, !dbg !473
  %arrayidx32 = getelementptr inbounds [26 x %struct.node], [26 x %struct.node]* @nodes, i64 0, i64 %idxprom31, !dbg !473
  %nin33 = getelementptr inbounds %struct.node, %struct.node* %arrayidx32, i32 0, i32 1, !dbg !474
  %23 = load i32, i32* %nin33, align 8, !dbg !474
  store i32 %23, i32* %mm, align 4, !dbg !475
  br label %if.end34, !dbg !476

if.end34:                                         ; preds = %if.then30, %land.lhs.true26, %if.else
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end19
  br label %for.inc, !dbg !477

for.inc:                                          ; preds = %if.end35
  %24 = load i32, i32* %i, align 4, !dbg !430
  %inc = add nsw i32 %24, 1, !dbg !430
  store i32 %inc, i32* %i, align 4, !dbg !430
  br label %for.cond, !dbg !430, !llvm.loop !478

for.end:                                          ; preds = %for.cond
  %25 = load i32, i32* %mi, align 4, !dbg !480
  store i32 %25, i32* %retval, align 4, !dbg !481
  br label %return, !dbg !481

return:                                           ; preds = %for.end, %if.then
  %26 = load i32, i32* %retval, align 4, !dbg !482
  ret i32 %26, !dbg !482
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @insert(%struct.chain* %c, %struct.edge* %e) #0 !dbg !483 {
entry:
  %c.addr = alloca %struct.chain*, align 8
  %e.addr = alloca %struct.edge*, align 8
  store %struct.chain* %c, %struct.chain** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.chain** %c.addr, metadata !486, metadata !DIExpression()), !dbg !487
  store %struct.edge* %e, %struct.edge** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.edge** %e.addr, metadata !488, metadata !DIExpression()), !dbg !489
  %0 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !490
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %0, i32 0, i32 0, !dbg !491
  %1 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !491
  %2 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !492
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %2, i32 0, i32 3, !dbg !493
  store %struct.edge* %1, %struct.edge** %lnk, align 8, !dbg !494
  %3 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !495
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %3, i32 0, i32 1, !dbg !497
  %4 = load %struct.edge*, %struct.edge** %tail, align 8, !dbg !497
  %tobool = icmp ne %struct.edge* %4, null, !dbg !495
  br i1 %tobool, label %if.end, label %if.then, !dbg !498, !cf.info !69

if.then:                                          ; preds = %entry
  %5 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !499
  %6 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !500
  %tail2 = getelementptr inbounds %struct.chain, %struct.chain* %6, i32 0, i32 1, !dbg !501
  store %struct.edge* %5, %struct.edge** %tail2, align 8, !dbg !502
  br label %if.end, !dbg !500

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !503
  %8 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !504
  %e3 = getelementptr inbounds %struct.chain, %struct.chain* %8, i32 0, i32 0, !dbg !505
  store %struct.edge* %7, %struct.edge** %e3, align 8, !dbg !506
  %9 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !507
  %len = getelementptr inbounds %struct.chain, %struct.chain* %9, i32 0, i32 2, !dbg !508
  %10 = load i32, i32* %len, align 8, !dbg !509
  %inc = add nsw i32 %10, 1, !dbg !509
  store i32 %inc, i32* %len, align 8, !dbg !509
  ret void, !dbg !510
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @append(%struct.chain* %c, %struct.edge* %e) #0 !dbg !511 {
entry:
  %c.addr = alloca %struct.chain*, align 8
  %e.addr = alloca %struct.edge*, align 8
  store %struct.chain* %c, %struct.chain** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.chain** %c.addr, metadata !512, metadata !DIExpression()), !dbg !513
  store %struct.edge* %e, %struct.edge** %e.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.edge** %e.addr, metadata !514, metadata !DIExpression()), !dbg !515
  %0 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !516
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %0, i32 0, i32 1, !dbg !518
  %1 = load %struct.edge*, %struct.edge** %tail, align 8, !dbg !518
  %tobool = icmp ne %struct.edge* %1, null, !dbg !516
  br i1 %tobool, label %if.then, label %if.else, !dbg !519, !cf.info !69

if.then:                                          ; preds = %entry
  %2 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !520
  %3 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !521
  %tail1 = getelementptr inbounds %struct.chain, %struct.chain* %3, i32 0, i32 1, !dbg !522
  %4 = load %struct.edge*, %struct.edge** %tail1, align 8, !dbg !522
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %4, i32 0, i32 3, !dbg !523
  store %struct.edge* %2, %struct.edge** %lnk, align 8, !dbg !524
  br label %if.end, !dbg !521

if.else:                                          ; preds = %entry
  %5 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !525
  %6 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !526
  %e2 = getelementptr inbounds %struct.chain, %struct.chain* %6, i32 0, i32 0, !dbg !527
  store %struct.edge* %5, %struct.edge** %e2, align 8, !dbg !528
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load %struct.edge*, %struct.edge** %e.addr, align 8, !dbg !529
  %8 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !530
  %tail3 = getelementptr inbounds %struct.chain, %struct.chain* %8, i32 0, i32 1, !dbg !531
  store %struct.edge* %7, %struct.edge** %tail3, align 8, !dbg !532
  %9 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !533
  %len = getelementptr inbounds %struct.chain, %struct.chain* %9, i32 0, i32 2, !dbg !534
  %10 = load i32, i32* %len, align 8, !dbg !535
  %inc = add nsw i32 %10, 1, !dbg !535
  store i32 %inc, i32* %len, align 8, !dbg !535
  ret void, !dbg !536
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.edge* @shift(%struct.chain* %c) #0 !dbg !537 {
entry:
  %c.addr = alloca %struct.chain*, align 8
  %e = alloca %struct.edge*, align 8
  store %struct.chain* %c, %struct.chain** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.chain** %c.addr, metadata !540, metadata !DIExpression()), !dbg !541
  call void @llvm.dbg.declare(metadata %struct.edge** %e, metadata !542, metadata !DIExpression()), !dbg !543
  %0 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !544
  %e1 = getelementptr inbounds %struct.chain, %struct.chain* %0, i32 0, i32 0, !dbg !545
  %1 = load %struct.edge*, %struct.edge** %e1, align 8, !dbg !545
  store %struct.edge* %1, %struct.edge** %e, align 8, !dbg !543
  %2 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !546
  %tobool = icmp ne %struct.edge* %2, null, !dbg !546
  br i1 %tobool, label %if.then, label %if.end5, !dbg !548, !cf.info !69

if.then:                                          ; preds = %entry
  %3 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !549
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %3, i32 0, i32 3, !dbg !551
  %4 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !551
  %5 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !552
  %e2 = getelementptr inbounds %struct.chain, %struct.chain* %5, i32 0, i32 0, !dbg !553
  store %struct.edge* %4, %struct.edge** %e2, align 8, !dbg !554
  %6 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !555
  %len = getelementptr inbounds %struct.chain, %struct.chain* %6, i32 0, i32 2, !dbg !557
  %7 = load i32, i32* %len, align 8, !dbg !558
  %dec = add nsw i32 %7, -1, !dbg !558
  store i32 %dec, i32* %len, align 8, !dbg !558
  %tobool3 = icmp ne i32 %dec, 0, !dbg !558
  br i1 %tobool3, label %if.end, label %if.then4, !dbg !559, !cf.info !69

if.then4:                                         ; preds = %if.then
  %8 = load %struct.chain*, %struct.chain** %c.addr, align 8, !dbg !560
  %tail = getelementptr inbounds %struct.chain, %struct.chain* %8, i32 0, i32 1, !dbg !561
  store %struct.edge* null, %struct.edge** %tail, align 8, !dbg !562
  br label %if.end, !dbg !560

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end5, !dbg !563

if.end5:                                          ; preds = %if.end, %entry
  %9 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !564
  ret %struct.edge* %9, !dbg !565
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.chain* @make_chain(i32 %s) #0 !dbg !566 {
entry:
  %s.addr = alloca i32, align 4
  %c = alloca %struct.chain*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i3 = alloca i32, align 4
  %j4 = alloca i32, align 4
  %step = alloca i32, align 4
  %e = alloca %struct.edge*, align 8
  %i14 = alloca i32, align 4
  %n = alloca i32, align 4
  %i23 = alloca i32, align 4
  %j24 = alloca i32, align 4
  %i41 = alloca i32, align 4
  %i50 = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata %struct.chain** %c, metadata !571, metadata !DIExpression()), !dbg !572
  %call = call noalias i8* @calloc(i64 1, i64 128) #9, !dbg !573
  %0 = bitcast i8* %call to %struct.chain*, !dbg !573
  store %struct.chain* %0, %struct.chain** %c, align 8, !dbg !572
  call void @llvm.dbg.declare(metadata i32* %i, metadata !574, metadata !DIExpression()), !dbg !576
  call void @llvm.dbg.declare(metadata i32* %j, metadata !577, metadata !DIExpression()), !dbg !578
  %1 = load i32, i32* %s.addr, align 4, !dbg !579
  store i32 %1, i32* %j, align 4, !dbg !578
  br label %for.cond, !dbg !580

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %j, align 4, !dbg !581
  %call1 = call i32 @widest(i32 %2, i32 0), !dbg !583
  store i32 %call1, i32* %i, align 4, !dbg !584
  %cmp = icmp sge i32 %call1, 0, !dbg !585
  br i1 %cmp, label %for.body, label %for.end, !dbg !586

for.body:                                         ; preds = %for.cond
  %3 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !587
  %4 = load i32, i32* %i, align 4, !dbg !588
  %5 = load i32, i32* %j, align 4, !dbg !589
  %call2 = call %struct.edge* @remove_edge(i32 %4, i32 %5), !dbg !590
  call void @insert(%struct.chain* %3, %struct.edge* %call2), !dbg !591
  br label %for.inc, !dbg !591

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !592
  store i32 %6, i32* %j, align 4, !dbg !593
  br label %for.cond, !dbg !594, !llvm.loop !595

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i3, metadata !597, metadata !DIExpression()), !dbg !599
  call void @llvm.dbg.declare(metadata i32* %j4, metadata !600, metadata !DIExpression()), !dbg !601
  %7 = load i32, i32* %s.addr, align 4, !dbg !602
  store i32 %7, i32* %j4, align 4, !dbg !601
  br label %for.cond5, !dbg !603

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i32, i32* %j4, align 4, !dbg !604
  %call6 = call i32 @widest(i32 %8, i32 1), !dbg !606
  store i32 %call6, i32* %i3, align 4, !dbg !607
  %cmp7 = icmp sge i32 %call6, 0, !dbg !608
  br i1 %cmp7, label %for.body8, label %for.end11, !dbg !609

for.body8:                                        ; preds = %for.cond5
  %9 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !610
  %10 = load i32, i32* %j4, align 4, !dbg !611
  %11 = load i32, i32* %i3, align 4, !dbg !612
  %call9 = call %struct.edge* @remove_edge(i32 %10, i32 %11), !dbg !613
  call void @append(%struct.chain* %9, %struct.edge* %call9), !dbg !614
  br label %for.inc10, !dbg !614

for.inc10:                                        ; preds = %for.body8
  %12 = load i32, i32* %i3, align 4, !dbg !615
  store i32 %12, i32* %j4, align 4, !dbg !616
  br label %for.cond5, !dbg !617, !llvm.loop !618

for.end11:                                        ; preds = %for.cond5
  call void @llvm.dbg.declare(metadata i32* %step, metadata !620, metadata !DIExpression()), !dbg !622
  store i32 0, i32* %step, align 4, !dbg !622
  br label %for.cond12, !dbg !623

for.cond12:                                       ; preds = %for.inc65, %for.end11
  call void @llvm.dbg.declare(metadata %struct.edge** %e, metadata !624, metadata !DIExpression()), !dbg !627
  %13 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !628
  %e13 = getelementptr inbounds %struct.chain, %struct.chain* %13, i32 0, i32 0, !dbg !629
  %14 = load %struct.edge*, %struct.edge** %e13, align 8, !dbg !629
  store %struct.edge* %14, %struct.edge** %e, align 8, !dbg !627
  call void @llvm.dbg.declare(metadata i32* %i14, metadata !630, metadata !DIExpression()), !dbg !632
  store i32 0, i32* %i14, align 4, !dbg !632
  br label %for.cond15, !dbg !633

for.cond15:                                       ; preds = %for.inc18, %for.cond12
  %15 = load i32, i32* %i14, align 4, !dbg !634
  %16 = load i32, i32* %step, align 4, !dbg !636
  %cmp16 = icmp slt i32 %15, %16, !dbg !637
  br i1 %cmp16, label %for.body17, label %for.end19, !dbg !638

for.body17:                                       ; preds = %for.cond15
  %17 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !639
  %lnk = getelementptr inbounds %struct.edge, %struct.edge* %17, i32 0, i32 3, !dbg !641
  %18 = load %struct.edge*, %struct.edge** %lnk, align 8, !dbg !641
  store %struct.edge* %18, %struct.edge** %e, align 8, !dbg !642
  %tobool = icmp ne %struct.edge* %18, null, !dbg !642
  br i1 %tobool, label %if.end, label %if.then, !dbg !643, !cf.info !69

if.then:                                          ; preds = %for.body17
  br label %for.end19, !dbg !644

if.end:                                           ; preds = %for.body17
  br label %for.inc18, !dbg !645

for.inc18:                                        ; preds = %if.end
  %19 = load i32, i32* %i14, align 4, !dbg !646
  %inc = add nsw i32 %19, 1, !dbg !646
  store i32 %inc, i32* %i14, align 4, !dbg !646
  br label %for.cond15, !dbg !647, !llvm.loop !648

for.end19:                                        ; preds = %if.then, %for.cond15
  %20 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !650
  %tobool20 = icmp ne %struct.edge* %20, null, !dbg !650
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !652, !cf.info !69

if.then21:                                        ; preds = %for.end19
  %21 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !653
  ret %struct.chain* %21, !dbg !654

if.end22:                                         ; preds = %for.end19
  call void @llvm.dbg.declare(metadata i32* %n, metadata !655, metadata !DIExpression()), !dbg !656
  store i32 0, i32* %n, align 4, !dbg !656
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !657, metadata !DIExpression()), !dbg !659
  call void @llvm.dbg.declare(metadata i32* %j24, metadata !660, metadata !DIExpression()), !dbg !661
  %22 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !662
  %s25 = getelementptr inbounds %struct.edge, %struct.edge* %22, i32 0, i32 0, !dbg !663
  %23 = load i8, i8* %s25, align 8, !dbg !663
  %conv = sext i8 %23 to i32, !dbg !662
  store i32 %conv, i32* %j24, align 4, !dbg !661
  br label %for.cond26, !dbg !664

for.cond26:                                       ; preds = %for.inc36, %if.end22
  %24 = load i32, i32* %j24, align 4, !dbg !665
  %call27 = call i32 @widest(i32 %24, i32 0), !dbg !667
  store i32 %call27, i32* %i23, align 4, !dbg !668
  %cmp28 = icmp sge i32 %call27, 0, !dbg !669
  br i1 %cmp28, label %for.body30, label %for.end37, !dbg !670

for.body30:                                       ; preds = %for.cond26
  %25 = load i32, i32* %i23, align 4, !dbg !671
  %26 = load i32, i32* %j24, align 4, !dbg !674
  %call31 = call %struct.edge* @remove_edge(i32 %25, i32 %26), !dbg !675
  store %struct.edge* %call31, %struct.edge** %e, align 8, !dbg !676
  %tobool32 = icmp ne %struct.edge* %call31, null, !dbg !676
  br i1 %tobool32, label %if.end34, label %if.then33, !dbg !677, !cf.info !69

if.then33:                                        ; preds = %for.body30
  br label %for.end37, !dbg !678

if.end34:                                         ; preds = %for.body30
  %27 = load %struct.edge*, %struct.edge** %e, align 8, !dbg !679
  %28 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !680
  %29 = load i32, i32* %n, align 4, !dbg !681
  %inc35 = add nsw i32 %29, 1, !dbg !681
  store i32 %inc35, i32* %n, align 4, !dbg !681
  %idxprom = sext i32 %29 to i64, !dbg !680
  %arrayidx = getelementptr inbounds %struct.edge*, %struct.edge** %28, i64 %idxprom, !dbg !680
  store %struct.edge* %27, %struct.edge** %arrayidx, align 8, !dbg !682
  br label %for.inc36, !dbg !683

for.inc36:                                        ; preds = %if.end34
  %30 = load i32, i32* %i23, align 4, !dbg !684
  store i32 %30, i32* %j24, align 4, !dbg !685
  br label %for.cond26, !dbg !686, !llvm.loop !687

for.end37:                                        ; preds = %if.then33, %for.cond26
  %31 = load i32, i32* %n, align 4, !dbg !689
  %32 = load i32, i32* %step, align 4, !dbg !691
  %cmp38 = icmp sgt i32 %31, %32, !dbg !692
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !693, !cf.info !69

if.then40:                                        ; preds = %for.end37
  call void @llvm.dbg.declare(metadata i32* %i41, metadata !694, metadata !DIExpression()), !dbg !697
  store i32 0, i32* %i41, align 4, !dbg !697
  br label %for.cond42, !dbg !697

for.cond42:                                       ; preds = %for.inc47, %if.then40
  %33 = load i32, i32* %i41, align 4, !dbg !698
  %34 = load i32, i32* %step, align 4, !dbg !698
  %cmp43 = icmp slt i32 %33, %34, !dbg !698
  br i1 %cmp43, label %for.body45, label %for.end49, !dbg !697

for.body45:                                       ; preds = %for.cond42
  %35 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !700
  %call46 = call %struct.edge* @shift(%struct.chain* %35), !dbg !701
  call void @store_edge(%struct.edge* %call46), !dbg !702
  br label %for.inc47, !dbg !702

for.inc47:                                        ; preds = %for.body45
  %36 = load i32, i32* %i41, align 4, !dbg !698
  %inc48 = add nsw i32 %36, 1, !dbg !698
  store i32 %inc48, i32* %i41, align 4, !dbg !698
  br label %for.cond42, !dbg !698, !llvm.loop !703

for.end49:                                        ; preds = %for.cond42
  call void @llvm.dbg.declare(metadata i32* %i50, metadata !705, metadata !DIExpression()), !dbg !707
  store i32 0, i32* %i50, align 4, !dbg !707
  br label %for.cond51, !dbg !707

for.cond51:                                       ; preds = %for.inc57, %for.end49
  %37 = load i32, i32* %i50, align 4, !dbg !708
  %38 = load i32, i32* %n, align 4, !dbg !708
  %cmp52 = icmp slt i32 %37, %38, !dbg !708
  br i1 %cmp52, label %for.body54, label %for.end59, !dbg !707

for.body54:                                       ; preds = %for.cond51
  %39 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !710
  %40 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !711
  %41 = load i32, i32* %i50, align 4, !dbg !712
  %idxprom55 = sext i32 %41 to i64, !dbg !711
  %arrayidx56 = getelementptr inbounds %struct.edge*, %struct.edge** %40, i64 %idxprom55, !dbg !711
  %42 = load %struct.edge*, %struct.edge** %arrayidx56, align 8, !dbg !711
  call void @insert(%struct.chain* %39, %struct.edge* %42), !dbg !713
  br label %for.inc57, !dbg !713

for.inc57:                                        ; preds = %for.body54
  %43 = load i32, i32* %i50, align 4, !dbg !708
  %inc58 = add nsw i32 %43, 1, !dbg !708
  store i32 %inc58, i32* %i50, align 4, !dbg !708
  br label %for.cond51, !dbg !708, !llvm.loop !714

for.end59:                                        ; preds = %for.cond51
  store i32 -1, i32* %step, align 4, !dbg !716
  br label %if.end64, !dbg !717

if.else:                                          ; preds = %for.end37
  br label %while.cond, !dbg !718

while.cond:                                       ; preds = %while.body, %if.else
  %44 = load i32, i32* %n, align 4, !dbg !719
  %dec = add nsw i32 %44, -1, !dbg !719
  store i32 %dec, i32* %n, align 4, !dbg !719
  %cmp60 = icmp sge i32 %dec, 0, !dbg !720
  br i1 %cmp60, label %while.body, label %while.end, !dbg !718

while.body:                                       ; preds = %while.cond
  %45 = load %struct.edge**, %struct.edge*** @tmp, align 8, !dbg !721
  %46 = load i32, i32* %n, align 4, !dbg !722
  %idxprom62 = sext i32 %46 to i64, !dbg !721
  %arrayidx63 = getelementptr inbounds %struct.edge*, %struct.edge** %45, i64 %idxprom62, !dbg !721
  %47 = load %struct.edge*, %struct.edge** %arrayidx63, align 8, !dbg !721
  call void @store_edge(%struct.edge* %47), !dbg !723
  br label %while.cond, !dbg !718, !llvm.loop !724

while.end:                                        ; preds = %while.cond
  br label %if.end64

if.end64:                                         ; preds = %while.end, %for.end59
  br label %for.inc65, !dbg !726

for.inc65:                                        ; preds = %if.end64
  %48 = load i32, i32* %step, align 4, !dbg !727
  %inc66 = add nsw i32 %48, 1, !dbg !727
  store i32 %inc66, i32* %step, align 4, !dbg !727
  br label %for.cond12, !dbg !728, !llvm.loop !729
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !732 {
entry:
  %retval = alloca i32, align 4
  %best = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca %struct.chain*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %best, metadata !735, metadata !DIExpression()), !dbg !736
  store i32 0, i32* %best, align 4, !dbg !736
  call void @read_names(), !dbg !737
  call void @llvm.dbg.declare(metadata i32* %i, metadata !738, metadata !DIExpression()), !dbg !740
  store i32 0, i32* %i, align 4, !dbg !740
  br label %for.cond, !dbg !740

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !741
  %cmp = icmp slt i32 %0, 26, !dbg !741
  br i1 %cmp, label %for.body, label %for.end8, !dbg !740

for.body:                                         ; preds = %for.cond
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([26 x %struct.node]* @nodes to i8*), i8 0, i64 11024, i1 false), !dbg !743
  call void @llvm.dbg.declare(metadata i32* %j, metadata !745, metadata !DIExpression()), !dbg !747
  store i32 0, i32* %j, align 4, !dbg !747
  br label %for.cond1, !dbg !747

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !748
  %2 = load i32, i32* @n_names, align 4, !dbg !748
  %cmp2 = icmp slt i32 %1, %2, !dbg !748
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !747

for.body3:                                        ; preds = %for.cond1
  %3 = load %struct.edge*, %struct.edge** @names, align 8, !dbg !750
  %4 = load i32, i32* %j, align 4, !dbg !751
  %idx.ext = sext i32 %4 to i64, !dbg !752
  %add.ptr = getelementptr inbounds %struct.edge, %struct.edge* %3, i64 %idx.ext, !dbg !752
  call void @store_edge(%struct.edge* %add.ptr), !dbg !753
  br label %for.inc, !dbg !753

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %j, align 4, !dbg !748
  %inc = add nsw i32 %5, 1, !dbg !748
  store i32 %inc, i32* %j, align 4, !dbg !748
  br label %for.cond1, !dbg !748, !llvm.loop !754

for.end:                                          ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata %struct.chain** %c, metadata !756, metadata !DIExpression()), !dbg !757
  %6 = load i32, i32* %i, align 4, !dbg !758
  %call = call %struct.chain* @make_chain(i32 %6), !dbg !759
  store %struct.chain* %call, %struct.chain** %c, align 8, !dbg !757
  %7 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !760
  %len = getelementptr inbounds %struct.chain, %struct.chain* %7, i32 0, i32 2, !dbg !762
  %8 = load i32, i32* %len, align 8, !dbg !762
  %9 = load i32, i32* %best, align 4, !dbg !763
  %cmp4 = icmp sgt i32 %8, %9, !dbg !764
  br i1 %cmp4, label %if.then, label %if.end, !dbg !765, !cf.info !69

if.then:                                          ; preds = %for.end
  %10 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !766
  call void @show_chain(%struct.chain* %10), !dbg !768
  %11 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !769
  %len5 = getelementptr inbounds %struct.chain, %struct.chain* %11, i32 0, i32 2, !dbg !770
  %12 = load i32, i32* %len5, align 8, !dbg !770
  store i32 %12, i32* %best, align 4, !dbg !771
  br label %if.end, !dbg !772

if.end:                                           ; preds = %if.then, %for.end
  %13 = load %struct.chain*, %struct.chain** %c, align 8, !dbg !773
  %14 = bitcast %struct.chain* %13 to i8*, !dbg !773
  call void @free(i8* %14) #9, !dbg !774
  br label %for.inc6, !dbg !775

for.inc6:                                         ; preds = %if.end
  %15 = load i32, i32* %i, align 4, !dbg !741
  %inc7 = add nsw i32 %15, 1, !dbg !741
  store i32 %inc7, i32* %i, align 4, !dbg !741
  br label %for.cond, !dbg !741, !llvm.loop !776

for.end8:                                         ; preds = %for.cond
  %16 = load i32, i32* %best, align 4, !dbg !778
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i32 %16), !dbg !779
  ret i32 0, !dbg !780
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

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
!65 = !DILocation(line: 16, column: 23, scope: !60)
!66 = !DILocation(line: 18, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !60, file: !3, line: 18, column: 6)
!68 = !DILocation(line: 18, column: 6, scope: !60)
!69 = !{!"if"}
!70 = !DILocation(line: 18, column: 10, scope: !67)
!71 = !DILocalVariable(name: "i", scope: !60, file: !3, line: 19, type: !22)
!72 = !DILocation(line: 19, column: 6, scope: !60)
!73 = !DILocation(line: 19, column: 10, scope: !60)
!74 = !DILocation(line: 19, column: 13, scope: !60)
!75 = !DILocalVariable(name: "j", scope: !60, file: !3, line: 19, type: !22)
!76 = !DILocation(line: 19, column: 16, scope: !60)
!77 = !DILocation(line: 19, column: 20, scope: !60)
!78 = !DILocation(line: 19, column: 23, scope: !60)
!79 = !DILocalVariable(name: "n", scope: !60, file: !3, line: 20, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!81 = !DILocation(line: 20, column: 8, scope: !60)
!82 = !DILocation(line: 20, column: 20, scope: !60)
!83 = !DILocation(line: 20, column: 18, scope: !60)
!84 = !DILocation(line: 22, column: 11, scope: !60)
!85 = !DILocation(line: 22, column: 14, scope: !60)
!86 = !DILocation(line: 22, column: 16, scope: !60)
!87 = !DILocation(line: 22, column: 2, scope: !60)
!88 = !DILocation(line: 22, column: 5, scope: !60)
!89 = !DILocation(line: 22, column: 9, scope: !60)
!90 = !DILocation(line: 24, column: 12, scope: !60)
!91 = !DILocation(line: 24, column: 2, scope: !60)
!92 = !DILocation(line: 24, column: 5, scope: !60)
!93 = !DILocation(line: 24, column: 7, scope: !60)
!94 = !DILocation(line: 24, column: 10, scope: !60)
!95 = !DILocation(line: 24, column: 15, scope: !60)
!96 = !DILocation(line: 24, column: 18, scope: !60)
!97 = !DILocation(line: 24, column: 22, scope: !60)
!98 = !DILocation(line: 24, column: 24, scope: !60)
!99 = !DILocation(line: 24, column: 28, scope: !60)
!100 = !DILocation(line: 24, column: 31, scope: !60)
!101 = !DILocation(line: 24, column: 35, scope: !60)
!102 = !DILocation(line: 25, column: 14, scope: !60)
!103 = !DILocation(line: 25, column: 12, scope: !60)
!104 = !DILocation(line: 25, column: 4, scope: !60)
!105 = !DILocation(line: 25, column: 17, scope: !60)
!106 = !DILocation(line: 25, column: 20, scope: !60)
!107 = !DILocation(line: 25, column: 23, scope: !60)
!108 = !DILocation(line: 25, column: 25, scope: !60)
!109 = !DILocation(line: 25, column: 29, scope: !60)
!110 = !DILocation(line: 25, column: 32, scope: !60)
!111 = !DILocation(line: 25, column: 35, scope: !60)
!112 = !DILocation(line: 26, column: 1, scope: !60)
!113 = distinct !DISubprogram(name: "remove_edge", scope: !3, file: !3, line: 29, type: !114, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!114 = !DISubroutineType(types: !115)
!115 = !{!27, !22, !22}
!116 = !DILocalVariable(name: "i", arg: 1, scope: !113, file: !3, line: 29, type: !22)
!117 = !DILocation(line: 29, column: 23, scope: !113)
!118 = !DILocalVariable(name: "j", arg: 2, scope: !113, file: !3, line: 29, type: !22)
!119 = !DILocation(line: 29, column: 30, scope: !113)
!120 = !DILocalVariable(name: "n", scope: !113, file: !3, line: 31, type: !80)
!121 = !DILocation(line: 31, column: 8, scope: !113)
!122 = !DILocation(line: 31, column: 20, scope: !113)
!123 = !DILocation(line: 31, column: 18, scope: !113)
!124 = !DILocalVariable(name: "g", scope: !113, file: !3, line: 32, type: !27)
!125 = !DILocation(line: 32, column: 8, scope: !113)
!126 = !DILocation(line: 32, column: 12, scope: !113)
!127 = !DILocation(line: 32, column: 15, scope: !113)
!128 = !DILocation(line: 32, column: 17, scope: !113)
!129 = !DILocation(line: 33, column: 6, scope: !130)
!130 = distinct !DILexicalBlock(scope: !113, file: !3, line: 33, column: 6)
!131 = !DILocation(line: 33, column: 6, scope: !113)
!132 = !DILocation(line: 34, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !3, line: 33, column: 9)
!134 = !DILocation(line: 34, column: 16, scope: !133)
!135 = !DILocation(line: 34, column: 3, scope: !133)
!136 = !DILocation(line: 34, column: 6, scope: !133)
!137 = !DILocation(line: 34, column: 8, scope: !133)
!138 = !DILocation(line: 34, column: 11, scope: !133)
!139 = !DILocation(line: 35, column: 3, scope: !133)
!140 = !DILocation(line: 35, column: 6, scope: !133)
!141 = !DILocation(line: 35, column: 10, scope: !133)
!142 = !DILocation(line: 36, column: 3, scope: !133)
!143 = !DILocation(line: 36, column: 6, scope: !133)
!144 = !DILocation(line: 36, column: 10, scope: !133)
!145 = !DILocation(line: 36, column: 12, scope: !133)
!146 = !DILocation(line: 36, column: 16, scope: !133)
!147 = !DILocation(line: 36, column: 19, scope: !133)
!148 = !DILocation(line: 36, column: 23, scope: !133)
!149 = !DILocation(line: 38, column: 15, scope: !133)
!150 = !DILocation(line: 38, column: 13, scope: !133)
!151 = !DILocation(line: 38, column: 5, scope: !133)
!152 = !DILocation(line: 39, column: 3, scope: !133)
!153 = !DILocation(line: 39, column: 6, scope: !133)
!154 = !DILocation(line: 39, column: 9, scope: !133)
!155 = !DILocation(line: 39, column: 11, scope: !133)
!156 = !DILocation(line: 40, column: 3, scope: !133)
!157 = !DILocation(line: 40, column: 6, scope: !133)
!158 = !DILocation(line: 40, column: 9, scope: !133)
!159 = !DILocation(line: 41, column: 2, scope: !133)
!160 = !DILocation(line: 42, column: 9, scope: !113)
!161 = !DILocation(line: 42, column: 2, scope: !113)
!162 = distinct !DISubprogram(name: "read_names", scope: !3, file: !3, line: 45, type: !163, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!163 = !DISubroutineType(types: !164)
!164 = !{null}
!165 = !DILocalVariable(name: "fp", scope: !162, file: !3, line: 47, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !168, line: 7, baseType: !169)
!168 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !170, line: 49, size: 1728, elements: !171)
!170 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!171 = !{!172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !187, !189, !190, !191, !195, !196, !198, !202, !205, !207, !210, !213, !214, !216, !220, !221}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !169, file: !170, line: 51, baseType: !22, size: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !169, file: !170, line: 54, baseType: !35, size: 64, offset: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !169, file: !170, line: 55, baseType: !35, size: 64, offset: 128)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !169, file: !170, line: 56, baseType: !35, size: 64, offset: 192)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !169, file: !170, line: 57, baseType: !35, size: 64, offset: 256)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !169, file: !170, line: 58, baseType: !35, size: 64, offset: 320)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !169, file: !170, line: 59, baseType: !35, size: 64, offset: 384)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !169, file: !170, line: 60, baseType: !35, size: 64, offset: 448)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !169, file: !170, line: 61, baseType: !35, size: 64, offset: 512)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !169, file: !170, line: 64, baseType: !35, size: 64, offset: 576)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !169, file: !170, line: 65, baseType: !35, size: 64, offset: 640)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !169, file: !170, line: 66, baseType: !35, size: 64, offset: 704)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !169, file: !170, line: 68, baseType: !185, size: 64, offset: 768)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !170, line: 36, flags: DIFlagFwdDecl)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !169, file: !170, line: 70, baseType: !188, size: 64, offset: 832)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !169, file: !170, line: 72, baseType: !22, size: 32, offset: 896)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !169, file: !170, line: 73, baseType: !22, size: 32, offset: 928)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !169, file: !170, line: 74, baseType: !192, size: 64, offset: 960)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !193, line: 152, baseType: !194)
!193 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!194 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !169, file: !170, line: 77, baseType: !23, size: 16, offset: 1024)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !169, file: !170, line: 78, baseType: !197, size: 8, offset: 1040)
!197 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !169, file: !170, line: 79, baseType: !199, size: 8, offset: 1048)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 8, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 1)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !169, file: !170, line: 81, baseType: !203, size: 64, offset: 1088)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !170, line: 43, baseType: null)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !169, file: !170, line: 89, baseType: !206, size: 64, offset: 1152)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !193, line: 153, baseType: !194)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !169, file: !170, line: 91, baseType: !208, size: 64, offset: 1216)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !170, line: 37, flags: DIFlagFwdDecl)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !169, file: !170, line: 92, baseType: !211, size: 64, offset: 1280)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!212 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !170, line: 38, flags: DIFlagFwdDecl)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !169, file: !170, line: 93, baseType: !188, size: 64, offset: 1344)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !169, file: !170, line: 94, baseType: !215, size: 64, offset: 1408)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !169, file: !170, line: 95, baseType: !217, size: 64, offset: 1472)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !218, line: 46, baseType: !219)
!218 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!219 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !169, file: !170, line: 96, baseType: !22, size: 32, offset: 1536)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !169, file: !170, line: 98, baseType: !222, size: 160, offset: 1568)
!222 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 160, elements: !223)
!223 = !{!224}
!224 = !DISubrange(count: 20)
!225 = !DILocation(line: 47, column: 8, scope: !162)
!226 = !DILocation(line: 47, column: 13, scope: !162)
!227 = !DILocalVariable(name: "i", scope: !162, file: !3, line: 48, type: !22)
!228 = !DILocation(line: 48, column: 6, scope: !162)
!229 = !DILocalVariable(name: "len", scope: !162, file: !3, line: 48, type: !22)
!230 = !DILocation(line: 48, column: 9, scope: !162)
!231 = !DILocalVariable(name: "buf", scope: !162, file: !3, line: 49, type: !35)
!232 = !DILocation(line: 49, column: 8, scope: !162)
!233 = !DILocalVariable(name: "p", scope: !162, file: !3, line: 50, type: !27)
!234 = !DILocation(line: 50, column: 8, scope: !162)
!235 = !DILocation(line: 52, column: 7, scope: !236)
!236 = distinct !DILexicalBlock(scope: !162, file: !3, line: 52, column: 6)
!237 = !DILocation(line: 52, column: 6, scope: !162)
!238 = !DILocation(line: 52, column: 11, scope: !236)
!239 = !DILocation(line: 54, column: 8, scope: !162)
!240 = !DILocation(line: 54, column: 2, scope: !162)
!241 = !DILocation(line: 55, column: 14, scope: !162)
!242 = !DILocation(line: 55, column: 8, scope: !162)
!243 = !DILocation(line: 55, column: 6, scope: !162)
!244 = !DILocation(line: 56, column: 15, scope: !162)
!245 = !DILocation(line: 56, column: 19, scope: !162)
!246 = !DILocation(line: 56, column: 8, scope: !162)
!247 = !DILocation(line: 56, column: 6, scope: !162)
!248 = !DILocation(line: 57, column: 8, scope: !162)
!249 = !DILocation(line: 57, column: 2, scope: !162)
!250 = !DILocation(line: 58, column: 8, scope: !162)
!251 = !DILocation(line: 58, column: 16, scope: !162)
!252 = !DILocation(line: 58, column: 21, scope: !162)
!253 = !DILocation(line: 58, column: 2, scope: !162)
!254 = !DILocation(line: 59, column: 9, scope: !162)
!255 = !DILocation(line: 59, column: 2, scope: !162)
!256 = !DILocation(line: 61, column: 2, scope: !162)
!257 = !DILocation(line: 61, column: 6, scope: !162)
!258 = !DILocation(line: 61, column: 11, scope: !162)
!259 = !DILocation(line: 62, column: 19, scope: !260)
!260 = distinct !DILexicalBlock(scope: !162, file: !3, line: 62, column: 2)
!261 = !DILocation(line: 62, column: 15, scope: !260)
!262 = !DILocation(line: 62, column: 7, scope: !260)
!263 = !DILocation(line: 62, column: 24, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !3, line: 62, column: 2)
!265 = !DILocation(line: 62, column: 28, scope: !264)
!266 = !DILocation(line: 62, column: 26, scope: !264)
!267 = !DILocation(line: 62, column: 2, scope: !260)
!268 = !DILocation(line: 63, column: 7, scope: !269)
!269 = distinct !DILexicalBlock(scope: !264, file: !3, line: 63, column: 7)
!270 = !DILocation(line: 63, column: 7, scope: !264)
!271 = !DILocation(line: 64, column: 4, scope: !269)
!272 = !DILocation(line: 64, column: 8, scope: !269)
!273 = !DILocation(line: 64, column: 11, scope: !269)
!274 = !DILocation(line: 64, column: 23, scope: !269)
!275 = !DILocation(line: 62, column: 34, scope: !264)
!276 = !DILocation(line: 62, column: 2, scope: !264)
!277 = distinct !{!277, !267, !278}
!278 = !DILocation(line: 64, column: 23, scope: !260)
!279 = !DILocation(line: 66, column: 6, scope: !280)
!280 = distinct !DILexicalBlock(scope: !162, file: !3, line: 66, column: 6)
!281 = !DILocation(line: 66, column: 10, scope: !280)
!282 = !DILocation(line: 66, column: 13, scope: !280)
!283 = !DILocation(line: 66, column: 6, scope: !162)
!284 = !DILocation(line: 66, column: 25, scope: !280)
!285 = !DILocation(line: 66, column: 18, scope: !280)
!286 = !DILocation(line: 68, column: 2, scope: !162)
!287 = !DILocation(line: 69, column: 15, scope: !162)
!288 = !DILocation(line: 69, column: 8, scope: !162)
!289 = !DILocation(line: 69, column: 6, scope: !162)
!290 = !DILocation(line: 71, column: 36, scope: !162)
!291 = !DILocation(line: 71, column: 34, scope: !162)
!292 = !DILocation(line: 71, column: 14, scope: !162)
!293 = !DILocation(line: 71, column: 12, scope: !162)
!294 = !DILocation(line: 71, column: 4, scope: !162)
!295 = !DILocation(line: 72, column: 9, scope: !296)
!296 = distinct !DILexicalBlock(scope: !162, file: !3, line: 72, column: 2)
!297 = !DILocation(line: 72, column: 7, scope: !296)
!298 = !DILocation(line: 72, column: 14, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !3, line: 72, column: 2)
!300 = !DILocation(line: 72, column: 18, scope: !299)
!301 = !DILocation(line: 72, column: 16, scope: !299)
!302 = !DILocation(line: 72, column: 2, scope: !296)
!303 = !DILocation(line: 73, column: 7, scope: !304)
!304 = distinct !DILexicalBlock(scope: !305, file: !3, line: 73, column: 7)
!305 = distinct !DILexicalBlock(scope: !299, file: !3, line: 72, column: 37)
!306 = !DILocation(line: 73, column: 7, scope: !305)
!307 = !DILocation(line: 73, column: 19, scope: !304)
!308 = !DILocation(line: 73, column: 25, scope: !304)
!309 = !DILocation(line: 73, column: 26, scope: !304)
!310 = !DILocation(line: 73, column: 30, scope: !304)
!311 = !DILocation(line: 73, column: 36, scope: !304)
!312 = !DILocation(line: 73, column: 34, scope: !304)
!313 = !DILocation(line: 73, column: 40, scope: !304)
!314 = !DILocation(line: 73, column: 10, scope: !304)
!315 = !DILocation(line: 73, column: 13, scope: !304)
!316 = !DILocation(line: 73, column: 17, scope: !304)
!317 = !DILocation(line: 74, column: 17, scope: !304)
!318 = !DILocation(line: 74, column: 8, scope: !304)
!319 = !DILocation(line: 74, column: 11, scope: !304)
!320 = !DILocation(line: 74, column: 15, scope: !304)
!321 = !DILocation(line: 76, column: 16, scope: !305)
!322 = !DILocation(line: 76, column: 19, scope: !305)
!323 = !DILocation(line: 76, column: 9, scope: !305)
!324 = !DILocation(line: 76, column: 7, scope: !305)
!325 = !DILocation(line: 77, column: 10, scope: !305)
!326 = !DILocation(line: 77, column: 13, scope: !305)
!327 = !DILocation(line: 77, column: 20, scope: !305)
!328 = !DILocation(line: 77, column: 3, scope: !305)
!329 = !DILocation(line: 77, column: 6, scope: !305)
!330 = !DILocation(line: 77, column: 8, scope: !305)
!331 = !DILocation(line: 78, column: 10, scope: !305)
!332 = !DILocation(line: 78, column: 13, scope: !305)
!333 = !DILocation(line: 78, column: 17, scope: !305)
!334 = !DILocation(line: 78, column: 20, scope: !305)
!335 = !DILocation(line: 78, column: 24, scope: !305)
!336 = !DILocation(line: 78, column: 3, scope: !305)
!337 = !DILocation(line: 78, column: 6, scope: !305)
!338 = !DILocation(line: 78, column: 8, scope: !305)
!339 = !DILocation(line: 79, column: 7, scope: !340)
!340 = distinct !DILexicalBlock(scope: !305, file: !3, line: 79, column: 7)
!341 = !DILocation(line: 79, column: 10, scope: !340)
!342 = !DILocation(line: 79, column: 12, scope: !340)
!343 = !DILocation(line: 79, column: 16, scope: !340)
!344 = !DILocation(line: 79, column: 19, scope: !340)
!345 = !DILocation(line: 79, column: 22, scope: !340)
!346 = !DILocation(line: 79, column: 24, scope: !340)
!347 = !DILocation(line: 79, column: 30, scope: !340)
!348 = !DILocation(line: 79, column: 33, scope: !340)
!349 = !DILocation(line: 79, column: 36, scope: !340)
!350 = !DILocation(line: 79, column: 38, scope: !340)
!351 = !DILocation(line: 79, column: 42, scope: !340)
!352 = !DILocation(line: 79, column: 45, scope: !340)
!353 = !DILocation(line: 79, column: 48, scope: !340)
!354 = !DILocation(line: 79, column: 50, scope: !340)
!355 = !DILocation(line: 79, column: 7, scope: !305)
!356 = !DILocation(line: 81, column: 5, scope: !357)
!357 = distinct !DILexicalBlock(scope: !340, file: !3, line: 79, column: 57)
!358 = !DILocation(line: 81, column: 8, scope: !357)
!359 = !DILocation(line: 80, column: 4, scope: !357)
!360 = !DILocation(line: 82, column: 4, scope: !357)
!361 = !DILocation(line: 84, column: 2, scope: !305)
!362 = !DILocation(line: 72, column: 28, scope: !299)
!363 = !DILocation(line: 72, column: 33, scope: !299)
!364 = !DILocation(line: 72, column: 2, scope: !299)
!365 = distinct !{!365, !302, !366}
!366 = !DILocation(line: 84, column: 2, scope: !296)
!367 = !DILocation(line: 85, column: 28, scope: !162)
!368 = !DILocation(line: 85, column: 2, scope: !162)
!369 = !DILocation(line: 86, column: 1, scope: !162)
!370 = distinct !DISubprogram(name: "show_chain", scope: !3, file: !3, line: 88, type: !371, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!371 = !DISubroutineType(types: !372)
!372 = !{null, !373}
!373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "chain", file: !3, line: 9, baseType: !375)
!375 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 9, size: 1024, elements: !376)
!376 = !{!377, !378, !379, !380}
!377 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !375, file: !3, line: 9, baseType: !27, size: 64)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "tail", scope: !375, file: !3, line: 9, baseType: !27, size: 64, offset: 64)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !375, file: !3, line: 9, baseType: !22, size: 32, offset: 128)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "has", scope: !375, file: !3, line: 9, baseType: !54, size: 832, offset: 160)
!381 = !DILocalVariable(name: "c", arg: 1, scope: !370, file: !3, line: 88, type: !373)
!382 = !DILocation(line: 88, column: 24, scope: !370)
!383 = !DILocation(line: 90, column: 16, scope: !370)
!384 = !DILocation(line: 90, column: 19, scope: !370)
!385 = !DILocation(line: 90, column: 2, scope: !370)
!386 = !DILocalVariable(name: "e", scope: !387, file: !3, line: 91, type: !27)
!387 = distinct !DILexicalBlock(scope: !370, file: !3, line: 91, column: 2)
!388 = !DILocation(line: 91, column: 14, scope: !387)
!389 = !DILocation(line: 91, column: 18, scope: !387)
!390 = !DILocation(line: 91, column: 21, scope: !387)
!391 = !DILocation(line: 91, column: 7, scope: !387)
!392 = !DILocation(line: 91, column: 24, scope: !393)
!393 = distinct !DILexicalBlock(scope: !387, file: !3, line: 91, column: 2)
!394 = !DILocation(line: 91, column: 26, scope: !393)
!395 = !DILocation(line: 91, column: 30, scope: !393)
!396 = !DILocation(line: 91, column: 29, scope: !393)
!397 = !DILocation(line: 91, column: 2, scope: !387)
!398 = !DILocation(line: 92, column: 17, scope: !393)
!399 = !DILocation(line: 92, column: 20, scope: !393)
!400 = !DILocation(line: 92, column: 3, scope: !393)
!401 = !DILocation(line: 91, column: 49, scope: !393)
!402 = !DILocation(line: 91, column: 52, scope: !393)
!403 = !DILocation(line: 91, column: 47, scope: !393)
!404 = !DILocation(line: 91, column: 2, scope: !393)
!405 = distinct !{!405, !397, !406}
!406 = !DILocation(line: 92, column: 23, scope: !387)
!407 = !DILocation(line: 93, column: 1, scope: !370)
!408 = distinct !DISubprogram(name: "widest", scope: !3, file: !3, line: 96, type: !409, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!409 = !DISubroutineType(types: !410)
!410 = !{!22, !22, !22}
!411 = !DILocalVariable(name: "n", arg: 1, scope: !408, file: !3, line: 96, type: !22)
!412 = !DILocation(line: 96, column: 16, scope: !408)
!413 = !DILocalVariable(name: "out", arg: 2, scope: !408, file: !3, line: 96, type: !22)
!414 = !DILocation(line: 96, column: 23, scope: !408)
!415 = !DILocation(line: 98, column: 12, scope: !416)
!416 = distinct !DILexicalBlock(scope: !408, file: !3, line: 98, column: 6)
!417 = !DILocation(line: 98, column: 6, scope: !416)
!418 = !DILocation(line: 98, column: 15, scope: !416)
!419 = !DILocation(line: 98, column: 19, scope: !416)
!420 = !DILocation(line: 98, column: 6, scope: !408)
!421 = !DILocation(line: 98, column: 30, scope: !416)
!422 = !DILocation(line: 98, column: 23, scope: !416)
!423 = !DILocalVariable(name: "mm", scope: !408, file: !3, line: 100, type: !22)
!424 = !DILocation(line: 100, column: 6, scope: !408)
!425 = !DILocalVariable(name: "mi", scope: !408, file: !3, line: 100, type: !22)
!426 = !DILocation(line: 100, column: 15, scope: !408)
!427 = !DILocalVariable(name: "i", scope: !428, file: !3, line: 101, type: !22)
!428 = distinct !DILexicalBlock(scope: !408, file: !3, line: 101, column: 2)
!429 = !DILocation(line: 101, column: 2, scope: !428)
!430 = !DILocation(line: 101, column: 2, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !3, line: 101, column: 2)
!432 = !DILocation(line: 102, column: 7, scope: !433)
!433 = distinct !DILexicalBlock(scope: !434, file: !3, line: 102, column: 7)
!434 = distinct !DILexicalBlock(scope: !431, file: !3, line: 101, column: 16)
!435 = !DILocation(line: 102, column: 7, scope: !434)
!436 = !DILocation(line: 103, column: 14, scope: !437)
!437 = distinct !DILexicalBlock(scope: !438, file: !3, line: 103, column: 8)
!438 = distinct !DILexicalBlock(scope: !433, file: !3, line: 102, column: 12)
!439 = !DILocation(line: 103, column: 8, scope: !437)
!440 = !DILocation(line: 103, column: 17, scope: !437)
!441 = !DILocation(line: 103, column: 21, scope: !437)
!442 = !DILocation(line: 103, column: 24, scope: !437)
!443 = !DILocation(line: 103, column: 33, scope: !437)
!444 = !DILocation(line: 103, column: 27, scope: !437)
!445 = !DILocation(line: 103, column: 36, scope: !437)
!446 = !DILocation(line: 103, column: 43, scope: !437)
!447 = !DILocation(line: 103, column: 41, scope: !437)
!448 = !DILocation(line: 103, column: 8, scope: !438)
!449 = !DILocation(line: 104, column: 10, scope: !437)
!450 = !DILocation(line: 104, column: 8, scope: !437)
!451 = !DILocation(line: 104, column: 24, scope: !437)
!452 = !DILocation(line: 104, column: 18, scope: !437)
!453 = !DILocation(line: 104, column: 27, scope: !437)
!454 = !DILocation(line: 104, column: 16, scope: !437)
!455 = !DILocation(line: 104, column: 5, scope: !437)
!456 = !DILocation(line: 105, column: 3, scope: !438)
!457 = !DILocation(line: 106, column: 14, scope: !458)
!458 = distinct !DILexicalBlock(scope: !459, file: !3, line: 106, column: 8)
!459 = distinct !DILexicalBlock(scope: !433, file: !3, line: 105, column: 10)
!460 = !DILocation(line: 106, column: 8, scope: !458)
!461 = !DILocation(line: 106, column: 17, scope: !458)
!462 = !DILocation(line: 106, column: 21, scope: !458)
!463 = !DILocation(line: 106, column: 24, scope: !458)
!464 = !DILocation(line: 106, column: 33, scope: !458)
!465 = !DILocation(line: 106, column: 27, scope: !458)
!466 = !DILocation(line: 106, column: 36, scope: !458)
!467 = !DILocation(line: 106, column: 42, scope: !458)
!468 = !DILocation(line: 106, column: 40, scope: !458)
!469 = !DILocation(line: 106, column: 8, scope: !459)
!470 = !DILocation(line: 107, column: 10, scope: !458)
!471 = !DILocation(line: 107, column: 8, scope: !458)
!472 = !DILocation(line: 107, column: 24, scope: !458)
!473 = !DILocation(line: 107, column: 18, scope: !458)
!474 = !DILocation(line: 107, column: 27, scope: !458)
!475 = !DILocation(line: 107, column: 16, scope: !458)
!476 = !DILocation(line: 107, column: 5, scope: !458)
!477 = !DILocation(line: 109, column: 2, scope: !434)
!478 = distinct !{!478, !429, !479}
!479 = !DILocation(line: 109, column: 2, scope: !428)
!480 = !DILocation(line: 111, column: 9, scope: !408)
!481 = !DILocation(line: 111, column: 2, scope: !408)
!482 = !DILocation(line: 112, column: 1, scope: !408)
!483 = distinct !DISubprogram(name: "insert", scope: !3, file: !3, line: 114, type: !484, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!484 = !DISubroutineType(types: !485)
!485 = !{null, !373, !27}
!486 = !DILocalVariable(name: "c", arg: 1, scope: !483, file: !3, line: 114, type: !373)
!487 = !DILocation(line: 114, column: 20, scope: !483)
!488 = !DILocalVariable(name: "e", arg: 2, scope: !483, file: !3, line: 114, type: !27)
!489 = !DILocation(line: 114, column: 29, scope: !483)
!490 = !DILocation(line: 116, column: 11, scope: !483)
!491 = !DILocation(line: 116, column: 14, scope: !483)
!492 = !DILocation(line: 116, column: 2, scope: !483)
!493 = !DILocation(line: 116, column: 5, scope: !483)
!494 = !DILocation(line: 116, column: 9, scope: !483)
!495 = !DILocation(line: 117, column: 7, scope: !496)
!496 = distinct !DILexicalBlock(scope: !483, file: !3, line: 117, column: 6)
!497 = !DILocation(line: 117, column: 10, scope: !496)
!498 = !DILocation(line: 117, column: 6, scope: !483)
!499 = !DILocation(line: 117, column: 26, scope: !496)
!500 = !DILocation(line: 117, column: 16, scope: !496)
!501 = !DILocation(line: 117, column: 19, scope: !496)
!502 = !DILocation(line: 117, column: 24, scope: !496)
!503 = !DILocation(line: 118, column: 9, scope: !483)
!504 = !DILocation(line: 118, column: 2, scope: !483)
!505 = !DILocation(line: 118, column: 5, scope: !483)
!506 = !DILocation(line: 118, column: 7, scope: !483)
!507 = !DILocation(line: 119, column: 2, scope: !483)
!508 = !DILocation(line: 119, column: 5, scope: !483)
!509 = !DILocation(line: 119, column: 8, scope: !483)
!510 = !DILocation(line: 120, column: 1, scope: !483)
!511 = distinct !DISubprogram(name: "append", scope: !3, file: !3, line: 122, type: !484, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!512 = !DILocalVariable(name: "c", arg: 1, scope: !511, file: !3, line: 122, type: !373)
!513 = !DILocation(line: 122, column: 20, scope: !511)
!514 = !DILocalVariable(name: "e", arg: 2, scope: !511, file: !3, line: 122, type: !27)
!515 = !DILocation(line: 122, column: 29, scope: !511)
!516 = !DILocation(line: 124, column: 6, scope: !517)
!517 = distinct !DILexicalBlock(scope: !511, file: !3, line: 124, column: 6)
!518 = !DILocation(line: 124, column: 9, scope: !517)
!519 = !DILocation(line: 124, column: 6, scope: !511)
!520 = !DILocation(line: 124, column: 30, scope: !517)
!521 = !DILocation(line: 124, column: 15, scope: !517)
!522 = !DILocation(line: 124, column: 18, scope: !517)
!523 = !DILocation(line: 124, column: 24, scope: !517)
!524 = !DILocation(line: 124, column: 28, scope: !517)
!525 = !DILocation(line: 125, column: 14, scope: !517)
!526 = !DILocation(line: 125, column: 7, scope: !517)
!527 = !DILocation(line: 125, column: 10, scope: !517)
!528 = !DILocation(line: 125, column: 12, scope: !517)
!529 = !DILocation(line: 126, column: 12, scope: !511)
!530 = !DILocation(line: 126, column: 2, scope: !511)
!531 = !DILocation(line: 126, column: 5, scope: !511)
!532 = !DILocation(line: 126, column: 10, scope: !511)
!533 = !DILocation(line: 127, column: 2, scope: !511)
!534 = !DILocation(line: 127, column: 5, scope: !511)
!535 = !DILocation(line: 127, column: 8, scope: !511)
!536 = !DILocation(line: 128, column: 1, scope: !511)
!537 = distinct !DISubprogram(name: "shift", scope: !3, file: !3, line: 130, type: !538, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!538 = !DISubroutineType(types: !539)
!539 = !{!27, !373}
!540 = !DILocalVariable(name: "c", arg: 1, scope: !537, file: !3, line: 130, type: !373)
!541 = !DILocation(line: 130, column: 21, scope: !537)
!542 = !DILocalVariable(name: "e", scope: !537, file: !3, line: 132, type: !27)
!543 = !DILocation(line: 132, column: 8, scope: !537)
!544 = !DILocation(line: 132, column: 12, scope: !537)
!545 = !DILocation(line: 132, column: 15, scope: !537)
!546 = !DILocation(line: 133, column: 6, scope: !547)
!547 = distinct !DILexicalBlock(scope: !537, file: !3, line: 133, column: 6)
!548 = !DILocation(line: 133, column: 6, scope: !537)
!549 = !DILocation(line: 134, column: 10, scope: !550)
!550 = distinct !DILexicalBlock(scope: !547, file: !3, line: 133, column: 9)
!551 = !DILocation(line: 134, column: 13, scope: !550)
!552 = !DILocation(line: 134, column: 3, scope: !550)
!553 = !DILocation(line: 134, column: 6, scope: !550)
!554 = !DILocation(line: 134, column: 8, scope: !550)
!555 = !DILocation(line: 135, column: 10, scope: !556)
!556 = distinct !DILexicalBlock(scope: !550, file: !3, line: 135, column: 7)
!557 = !DILocation(line: 135, column: 13, scope: !556)
!558 = !DILocation(line: 135, column: 8, scope: !556)
!559 = !DILocation(line: 135, column: 7, scope: !550)
!560 = !DILocation(line: 135, column: 18, scope: !556)
!561 = !DILocation(line: 135, column: 21, scope: !556)
!562 = !DILocation(line: 135, column: 26, scope: !556)
!563 = !DILocation(line: 136, column: 2, scope: !550)
!564 = !DILocation(line: 137, column: 9, scope: !537)
!565 = !DILocation(line: 137, column: 2, scope: !537)
!566 = distinct !DISubprogram(name: "make_chain", scope: !3, file: !3, line: 140, type: !567, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!567 = !DISubroutineType(types: !568)
!568 = !{!373, !22}
!569 = !DILocalVariable(name: "s", arg: 1, scope: !566, file: !3, line: 140, type: !22)
!570 = !DILocation(line: 140, column: 23, scope: !566)
!571 = !DILocalVariable(name: "c", scope: !566, file: !3, line: 142, type: !373)
!572 = !DILocation(line: 142, column: 9, scope: !566)
!573 = !DILocation(line: 142, column: 13, scope: !566)
!574 = !DILocalVariable(name: "i", scope: !575, file: !3, line: 145, type: !22)
!575 = distinct !DILexicalBlock(scope: !566, file: !3, line: 145, column: 2)
!576 = !DILocation(line: 145, column: 11, scope: !575)
!577 = !DILocalVariable(name: "j", scope: !575, file: !3, line: 145, type: !22)
!578 = !DILocation(line: 145, column: 14, scope: !575)
!579 = !DILocation(line: 145, column: 18, scope: !575)
!580 = !DILocation(line: 145, column: 7, scope: !575)
!581 = !DILocation(line: 145, column: 33, scope: !582)
!582 = distinct !DILexicalBlock(scope: !575, file: !3, line: 145, column: 2)
!583 = !DILocation(line: 145, column: 26, scope: !582)
!584 = !DILocation(line: 145, column: 24, scope: !582)
!585 = !DILocation(line: 145, column: 40, scope: !582)
!586 = !DILocation(line: 145, column: 2, scope: !575)
!587 = !DILocation(line: 146, column: 10, scope: !582)
!588 = !DILocation(line: 146, column: 25, scope: !582)
!589 = !DILocation(line: 146, column: 28, scope: !582)
!590 = !DILocation(line: 146, column: 13, scope: !582)
!591 = !DILocation(line: 146, column: 3, scope: !582)
!592 = !DILocation(line: 145, column: 50, scope: !582)
!593 = !DILocation(line: 145, column: 48, scope: !582)
!594 = !DILocation(line: 145, column: 2, scope: !582)
!595 = distinct !{!595, !586, !596}
!596 = !DILocation(line: 146, column: 30, scope: !575)
!597 = !DILocalVariable(name: "i", scope: !598, file: !3, line: 149, type: !22)
!598 = distinct !DILexicalBlock(scope: !566, file: !3, line: 149, column: 2)
!599 = !DILocation(line: 149, column: 11, scope: !598)
!600 = !DILocalVariable(name: "j", scope: !598, file: !3, line: 149, type: !22)
!601 = !DILocation(line: 149, column: 14, scope: !598)
!602 = !DILocation(line: 149, column: 18, scope: !598)
!603 = !DILocation(line: 149, column: 7, scope: !598)
!604 = !DILocation(line: 149, column: 33, scope: !605)
!605 = distinct !DILexicalBlock(scope: !598, file: !3, line: 149, column: 2)
!606 = !DILocation(line: 149, column: 26, scope: !605)
!607 = !DILocation(line: 149, column: 24, scope: !605)
!608 = !DILocation(line: 149, column: 40, scope: !605)
!609 = !DILocation(line: 149, column: 2, scope: !598)
!610 = !DILocation(line: 150, column: 10, scope: !605)
!611 = !DILocation(line: 150, column: 25, scope: !605)
!612 = !DILocation(line: 150, column: 28, scope: !605)
!613 = !DILocation(line: 150, column: 13, scope: !605)
!614 = !DILocation(line: 150, column: 3, scope: !605)
!615 = !DILocation(line: 149, column: 50, scope: !605)
!616 = !DILocation(line: 149, column: 48, scope: !605)
!617 = !DILocation(line: 149, column: 2, scope: !605)
!618 = distinct !{!618, !609, !619}
!619 = !DILocation(line: 150, column: 30, scope: !598)
!620 = !DILocalVariable(name: "step", scope: !621, file: !3, line: 152, type: !22)
!621 = distinct !DILexicalBlock(scope: !566, file: !3, line: 152, column: 2)
!622 = !DILocation(line: 152, column: 11, scope: !621)
!623 = !DILocation(line: 152, column: 7, scope: !621)
!624 = !DILocalVariable(name: "e", scope: !625, file: !3, line: 153, type: !27)
!625 = distinct !DILexicalBlock(scope: !626, file: !3, line: 152, column: 30)
!626 = distinct !DILexicalBlock(scope: !621, file: !3, line: 152, column: 2)
!627 = !DILocation(line: 153, column: 9, scope: !625)
!628 = !DILocation(line: 153, column: 13, scope: !625)
!629 = !DILocation(line: 153, column: 16, scope: !625)
!630 = !DILocalVariable(name: "i", scope: !631, file: !3, line: 155, type: !22)
!631 = distinct !DILexicalBlock(scope: !625, file: !3, line: 155, column: 3)
!632 = !DILocation(line: 155, column: 12, scope: !631)
!633 = !DILocation(line: 155, column: 8, scope: !631)
!634 = !DILocation(line: 155, column: 19, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 155, column: 3)
!636 = !DILocation(line: 155, column: 23, scope: !635)
!637 = !DILocation(line: 155, column: 21, scope: !635)
!638 = !DILocation(line: 155, column: 3, scope: !631)
!639 = !DILocation(line: 156, column: 14, scope: !640)
!640 = distinct !DILexicalBlock(scope: !635, file: !3, line: 156, column: 8)
!641 = !DILocation(line: 156, column: 17, scope: !640)
!642 = !DILocation(line: 156, column: 12, scope: !640)
!643 = !DILocation(line: 156, column: 8, scope: !635)
!644 = !DILocation(line: 156, column: 23, scope: !640)
!645 = !DILocation(line: 156, column: 20, scope: !640)
!646 = !DILocation(line: 155, column: 30, scope: !635)
!647 = !DILocation(line: 155, column: 3, scope: !635)
!648 = distinct !{!648, !638, !649}
!649 = !DILocation(line: 156, column: 23, scope: !631)
!650 = !DILocation(line: 157, column: 8, scope: !651)
!651 = distinct !DILexicalBlock(scope: !625, file: !3, line: 157, column: 7)
!652 = !DILocation(line: 157, column: 7, scope: !625)
!653 = !DILocation(line: 157, column: 18, scope: !651)
!654 = !DILocation(line: 157, column: 11, scope: !651)
!655 = !DILocalVariable(name: "n", scope: !625, file: !3, line: 159, type: !22)
!656 = !DILocation(line: 159, column: 7, scope: !625)
!657 = !DILocalVariable(name: "i", scope: !658, file: !3, line: 160, type: !22)
!658 = distinct !DILexicalBlock(scope: !625, file: !3, line: 160, column: 3)
!659 = !DILocation(line: 160, column: 12, scope: !658)
!660 = !DILocalVariable(name: "j", scope: !658, file: !3, line: 160, type: !22)
!661 = !DILocation(line: 160, column: 15, scope: !658)
!662 = !DILocation(line: 160, column: 19, scope: !658)
!663 = !DILocation(line: 160, column: 22, scope: !658)
!664 = !DILocation(line: 160, column: 8, scope: !658)
!665 = !DILocation(line: 160, column: 37, scope: !666)
!666 = distinct !DILexicalBlock(scope: !658, file: !3, line: 160, column: 3)
!667 = !DILocation(line: 160, column: 30, scope: !666)
!668 = !DILocation(line: 160, column: 28, scope: !666)
!669 = !DILocation(line: 160, column: 44, scope: !666)
!670 = !DILocation(line: 160, column: 3, scope: !658)
!671 = !DILocation(line: 161, column: 26, scope: !672)
!672 = distinct !DILexicalBlock(scope: !673, file: !3, line: 161, column: 8)
!673 = distinct !DILexicalBlock(scope: !666, file: !3, line: 160, column: 57)
!674 = !DILocation(line: 161, column: 29, scope: !672)
!675 = !DILocation(line: 161, column: 14, scope: !672)
!676 = !DILocation(line: 161, column: 12, scope: !672)
!677 = !DILocation(line: 161, column: 8, scope: !673)
!678 = !DILocation(line: 161, column: 34, scope: !672)
!679 = !DILocation(line: 162, column: 15, scope: !673)
!680 = !DILocation(line: 162, column: 4, scope: !673)
!681 = !DILocation(line: 162, column: 9, scope: !673)
!682 = !DILocation(line: 162, column: 13, scope: !673)
!683 = !DILocation(line: 163, column: 3, scope: !673)
!684 = !DILocation(line: 160, column: 54, scope: !666)
!685 = !DILocation(line: 160, column: 52, scope: !666)
!686 = !DILocation(line: 160, column: 3, scope: !666)
!687 = distinct !{!687, !670, !688}
!688 = !DILocation(line: 163, column: 3, scope: !658)
!689 = !DILocation(line: 165, column: 7, scope: !690)
!690 = distinct !DILexicalBlock(scope: !625, file: !3, line: 165, column: 7)
!691 = !DILocation(line: 165, column: 11, scope: !690)
!692 = !DILocation(line: 165, column: 9, scope: !690)
!693 = !DILocation(line: 165, column: 7, scope: !625)
!694 = !DILocalVariable(name: "i", scope: !695, file: !3, line: 166, type: !22)
!695 = distinct !DILexicalBlock(scope: !696, file: !3, line: 166, column: 4)
!696 = distinct !DILexicalBlock(scope: !690, file: !3, line: 165, column: 17)
!697 = !DILocation(line: 166, column: 4, scope: !695)
!698 = !DILocation(line: 166, column: 4, scope: !699)
!699 = distinct !DILexicalBlock(scope: !695, file: !3, line: 166, column: 4)
!700 = !DILocation(line: 166, column: 37, scope: !699)
!701 = !DILocation(line: 166, column: 31, scope: !699)
!702 = !DILocation(line: 166, column: 20, scope: !699)
!703 = distinct !{!703, !697, !704}
!704 = !DILocation(line: 166, column: 39, scope: !695)
!705 = !DILocalVariable(name: "i", scope: !706, file: !3, line: 167, type: !22)
!706 = distinct !DILexicalBlock(scope: !696, file: !3, line: 167, column: 4)
!707 = !DILocation(line: 167, column: 4, scope: !706)
!708 = !DILocation(line: 167, column: 4, scope: !709)
!709 = distinct !DILexicalBlock(scope: !706, file: !3, line: 167, column: 4)
!710 = !DILocation(line: 167, column: 24, scope: !709)
!711 = !DILocation(line: 167, column: 27, scope: !709)
!712 = !DILocation(line: 167, column: 31, scope: !709)
!713 = !DILocation(line: 167, column: 17, scope: !709)
!714 = distinct !{!714, !707, !715}
!715 = !DILocation(line: 167, column: 33, scope: !706)
!716 = !DILocation(line: 168, column: 9, scope: !696)
!717 = !DILocation(line: 169, column: 3, scope: !696)
!718 = !DILocation(line: 169, column: 10, scope: !690)
!719 = !DILocation(line: 169, column: 17, scope: !690)
!720 = !DILocation(line: 169, column: 21, scope: !690)
!721 = !DILocation(line: 170, column: 15, scope: !690)
!722 = !DILocation(line: 170, column: 19, scope: !690)
!723 = !DILocation(line: 170, column: 4, scope: !690)
!724 = distinct !{!724, !718, !725}
!725 = !DILocation(line: 170, column: 21, scope: !690)
!726 = !DILocation(line: 171, column: 2, scope: !625)
!727 = !DILocation(line: 152, column: 26, scope: !626)
!728 = !DILocation(line: 152, column: 2, scope: !626)
!729 = distinct !{!729, !730, !731}
!730 = !DILocation(line: 152, column: 2, scope: !621)
!731 = !DILocation(line: 171, column: 2, scope: !621)
!732 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 175, type: !733, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!733 = !DISubroutineType(types: !734)
!734 = !{!22}
!735 = !DILocalVariable(name: "best", scope: !732, file: !3, line: 177, type: !22)
!736 = !DILocation(line: 177, column: 6, scope: !732)
!737 = !DILocation(line: 178, column: 2, scope: !732)
!738 = !DILocalVariable(name: "i", scope: !739, file: !3, line: 180, type: !22)
!739 = distinct !DILexicalBlock(scope: !732, file: !3, line: 180, column: 2)
!740 = !DILocation(line: 180, column: 2, scope: !739)
!741 = !DILocation(line: 180, column: 2, scope: !742)
!742 = distinct !DILexicalBlock(scope: !739, file: !3, line: 180, column: 2)
!743 = !DILocation(line: 182, column: 3, scope: !744)
!744 = distinct !DILexicalBlock(scope: !742, file: !3, line: 180, column: 16)
!745 = !DILocalVariable(name: "j", scope: !746, file: !3, line: 183, type: !22)
!746 = distinct !DILexicalBlock(scope: !744, file: !3, line: 183, column: 3)
!747 = !DILocation(line: 183, column: 3, scope: !746)
!748 = !DILocation(line: 183, column: 3, scope: !749)
!749 = distinct !DILexicalBlock(scope: !746, file: !3, line: 183, column: 3)
!750 = !DILocation(line: 183, column: 33, scope: !749)
!751 = !DILocation(line: 183, column: 41, scope: !749)
!752 = !DILocation(line: 183, column: 39, scope: !749)
!753 = !DILocation(line: 183, column: 22, scope: !749)
!754 = distinct !{!754, !747, !755}
!755 = !DILocation(line: 183, column: 42, scope: !746)
!756 = !DILocalVariable(name: "c", scope: !744, file: !3, line: 186, type: !373)
!757 = !DILocation(line: 186, column: 10, scope: !744)
!758 = !DILocation(line: 186, column: 25, scope: !744)
!759 = !DILocation(line: 186, column: 14, scope: !744)
!760 = !DILocation(line: 187, column: 7, scope: !761)
!761 = distinct !DILexicalBlock(scope: !744, file: !3, line: 187, column: 7)
!762 = !DILocation(line: 187, column: 10, scope: !761)
!763 = !DILocation(line: 187, column: 16, scope: !761)
!764 = !DILocation(line: 187, column: 14, scope: !761)
!765 = !DILocation(line: 187, column: 7, scope: !744)
!766 = !DILocation(line: 188, column: 15, scope: !767)
!767 = distinct !DILexicalBlock(scope: !761, file: !3, line: 187, column: 22)
!768 = !DILocation(line: 188, column: 4, scope: !767)
!769 = !DILocation(line: 189, column: 11, scope: !767)
!770 = !DILocation(line: 189, column: 14, scope: !767)
!771 = !DILocation(line: 189, column: 9, scope: !767)
!772 = !DILocation(line: 190, column: 3, scope: !767)
!773 = !DILocation(line: 191, column: 8, scope: !744)
!774 = !DILocation(line: 191, column: 3, scope: !744)
!775 = !DILocation(line: 192, column: 2, scope: !744)
!776 = distinct !{!776, !740, !777}
!777 = !DILocation(line: 192, column: 2, scope: !739)
!778 = !DILocation(line: 194, column: 32, scope: !732)
!779 = !DILocation(line: 194, column: 2, scope: !732)
!780 = !DILocation(line: 195, column: 2, scope: !732)
