; ModuleID = 'anagrams-deranged-anagrams.bc'
source_filename = "anagrams-deranged-anagrams.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.node = type { [10 x %union.node*] }
%struct.word = type { i8*, %struct.word* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [27 x i8] c"zqxjkvbpygfwmucldrhsnioate\00", align 1
@freq = dso_local global i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@char_to_idx = common dso_local global [128 x i32] zeroinitializer, align 16, !dbg !8
@.str.1 = private unnamed_addr constant [13 x i8] c"unixdict.txt\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"longest derangement: %s %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @deranged(i8* %s1, i8* %s2) #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %s1.addr = alloca i8*, align 8
  %s2.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %s1, i8** %s1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s1.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* %s2, i8** %s2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s2.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %s1.addr, align 8, !dbg !33
  %1 = load i32, i32* %i, align 4, !dbg !35
  %idxprom = sext i32 %1 to i64, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !33
  %2 = load i8, i8* %arrayidx, align 1, !dbg !33
  %tobool = icmp ne i8 %2, 0, !dbg !36
  br i1 %tobool, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s1.addr, align 8, !dbg !37
  %4 = load i32, i32* %i, align 4, !dbg !39
  %idxprom1 = sext i32 %4 to i64, !dbg !37
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %idxprom1, !dbg !37
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !37
  %conv = sext i8 %5 to i32, !dbg !37
  %6 = load i8*, i8** %s2.addr, align 8, !dbg !40
  %7 = load i32, i32* %i, align 4, !dbg !41
  %idxprom3 = sext i32 %7 to i64, !dbg !40
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %idxprom3, !dbg !40
  %8 = load i8, i8* %arrayidx4, align 1, !dbg !40
  %conv5 = sext i8 %8 to i32, !dbg !40
  %cmp = icmp eq i32 %conv, %conv5, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval, align 4, !dbg !44
  br label %return, !dbg !44

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %9, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !50
  br label %return, !dbg !50

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %10, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count_letters(i8* %s, i8* %c) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8* %c, i8** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %c.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %i, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %len, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** %c.addr, align 8, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 26, i1 false), !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  store i32 0, i32* %len, align 4, !dbg !68
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s.addr, align 8, !dbg !70
  %2 = load i32, i32* %i, align 4, !dbg !72
  %idxprom = sext i32 %2 to i64, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !70
  %3 = load i8, i8* %arrayidx, align 1, !dbg !70
  %tobool = icmp ne i8 %3, 0, !dbg !73
  br i1 %tobool, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %s.addr, align 8, !dbg !74
  %5 = load i32, i32* %i, align 4, !dbg !77
  %idxprom1 = sext i32 %5 to i64, !dbg !74
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %idxprom1, !dbg !74
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !74
  %conv = sext i8 %6 to i32, !dbg !74
  %cmp = icmp slt i32 %conv, 97, !dbg !78
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !79

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i8*, i8** %s.addr, align 8, !dbg !80
  %8 = load i32, i32* %i, align 4, !dbg !81
  %idxprom4 = sext i32 %8 to i64, !dbg !80
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %idxprom4, !dbg !80
  %9 = load i8, i8* %arrayidx5, align 1, !dbg !80
  %conv6 = sext i8 %9 to i32, !dbg !80
  %cmp7 = icmp sgt i32 %conv6, 122, !dbg !82
  br i1 %cmp7, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %lor.lhs.false, %for.body
  store i32 0, i32* %retval, align 4, !dbg !84
  br label %return, !dbg !84

if.end:                                           ; preds = %lor.lhs.false
  %10 = load i32, i32* %len, align 4, !dbg !85
  %inc = add nsw i32 %10, 1, !dbg !85
  store i32 %inc, i32* %len, align 4, !dbg !85
  %11 = load i8*, i8** %c.addr, align 8, !dbg !86
  %12 = load i8*, i8** %s.addr, align 8, !dbg !87
  %13 = load i32, i32* %i, align 4, !dbg !88
  %idxprom9 = sext i32 %13 to i64, !dbg !87
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i64 %idxprom9, !dbg !87
  %14 = load i8, i8* %arrayidx10, align 1, !dbg !87
  %idxprom11 = zext i8 %14 to i64, !dbg !89
  %arrayidx12 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom11, !dbg !89
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !89
  %idxprom13 = sext i32 %15 to i64, !dbg !86
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i64 %idxprom13, !dbg !86
  %16 = load i8, i8* %arrayidx14, align 1, !dbg !90
  %inc15 = add i8 %16, 1, !dbg !90
  store i8 %inc15, i8* %arrayidx14, align 1, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %i, align 4, !dbg !92
  %inc16 = add nsw i32 %17, 1, !dbg !92
  store i32 %inc16, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %len, align 4, !dbg !96
  store i32 %18, i32* %retval, align 4, !dbg !97
  br label %return, !dbg !97

return:                                           ; preds = %for.end, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !98
  ret i32 %19, !dbg !98
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @insert(%union.node* %root, i8* %s, i8* %cnt) #0 !dbg !99 {
entry:
  %retval = alloca i8*, align 8
  %root.addr = alloca %union.node*, align 8
  %s.addr = alloca i8*, align 8
  %cnt.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %n = alloca %union.node*, align 8
  %v = alloca %struct.word*, align 8
  %w = alloca %struct.word*, align 8
  store %union.node* %root, %union.node** %root.addr, align 8
  call void @llvm.dbg.declare(metadata %union.node** %root.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* %cnt, i8** %cnt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %cnt.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata %union.node** %n, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata %struct.word** %v, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata %struct.word** %w, metadata !128, metadata !DIExpression()), !dbg !129
  store %struct.word* null, %struct.word** %w, align 8, !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !133
  %cmp = icmp slt i32 %0, 25, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load %union.node*, %union.node** %root.addr, align 8, !dbg !137
  %down = bitcast %union.node* %1 to [10 x %union.node*]*, !dbg !140
  %2 = load i8*, i8** %cnt.addr, align 8, !dbg !141
  %3 = load i32, i32* %i, align 4, !dbg !142
  %idxprom = sext i32 %3 to i64, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom, !dbg !141
  %4 = load i8, i8* %arrayidx, align 1, !dbg !141
  %idxprom1 = zext i8 %4 to i64, !dbg !137
  %arrayidx2 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down, i64 0, i64 %idxprom1, !dbg !137
  %5 = load %union.node*, %union.node** %arrayidx2, align 8, !dbg !137
  store %union.node* %5, %union.node** %n, align 8, !dbg !143
  %tobool = icmp ne %union.node* %5, null, !dbg !143
  br i1 %tobool, label %if.end, label %if.then, !dbg !144

if.then:                                          ; preds = %for.body
  %call = call noalias i8* @calloc(i64 1, i64 80) #5, !dbg !145
  %6 = bitcast i8* %call to %union.node*, !dbg !145
  store %union.node* %6, %union.node** %n, align 8, !dbg !146
  %7 = load %union.node*, %union.node** %root.addr, align 8, !dbg !147
  %down3 = bitcast %union.node* %7 to [10 x %union.node*]*, !dbg !148
  %8 = load i8*, i8** %cnt.addr, align 8, !dbg !149
  %9 = load i32, i32* %i, align 4, !dbg !150
  %idxprom4 = sext i32 %9 to i64, !dbg !149
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %idxprom4, !dbg !149
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !149
  %idxprom6 = zext i8 %10 to i64, !dbg !147
  %arrayidx7 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down3, i64 0, i64 %idxprom6, !dbg !147
  store %union.node* %6, %union.node** %arrayidx7, align 8, !dbg !151
  br label %if.end, !dbg !147

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %11, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  %12 = load %union.node*, %union.node** %n, align 8, !dbg !154
  store %union.node* %12, %union.node** %root.addr, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %call8 = call noalias i8* @malloc(i64 16) #5, !dbg !159
  %13 = bitcast i8* %call8 to %struct.word*, !dbg !159
  store %struct.word* %13, %struct.word** %w, align 8, !dbg !160
  %14 = load i8*, i8** %s.addr, align 8, !dbg !161
  %15 = load %struct.word*, %struct.word** %w, align 8, !dbg !162
  %w9 = getelementptr inbounds %struct.word, %struct.word* %15, i32 0, i32 0, !dbg !163
  store i8* %14, i8** %w9, align 8, !dbg !164
  %16 = load %union.node*, %union.node** %root.addr, align 8, !dbg !165
  %list = bitcast %union.node* %16 to [10 x %struct.word*]*, !dbg !166
  %17 = load i8*, i8** %cnt.addr, align 8, !dbg !167
  %arrayidx10 = getelementptr inbounds i8, i8* %17, i64 25, !dbg !167
  %18 = load i8, i8* %arrayidx10, align 1, !dbg !167
  %idxprom11 = zext i8 %18 to i64, !dbg !165
  %arrayidx12 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list, i64 0, i64 %idxprom11, !dbg !165
  %19 = load %struct.word*, %struct.word** %arrayidx12, align 8, !dbg !165
  %20 = load %struct.word*, %struct.word** %w, align 8, !dbg !168
  %next = getelementptr inbounds %struct.word, %struct.word* %20, i32 0, i32 1, !dbg !169
  store %struct.word* %19, %struct.word** %next, align 8, !dbg !170
  %21 = load %struct.word*, %struct.word** %w, align 8, !dbg !171
  %22 = load %union.node*, %union.node** %root.addr, align 8, !dbg !172
  %list13 = bitcast %union.node* %22 to [10 x %struct.word*]*, !dbg !173
  %23 = load i8*, i8** %cnt.addr, align 8, !dbg !174
  %arrayidx14 = getelementptr inbounds i8, i8* %23, i64 25, !dbg !174
  %24 = load i8, i8* %arrayidx14, align 1, !dbg !174
  %idxprom15 = zext i8 %24 to i64, !dbg !172
  %arrayidx16 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list13, i64 0, i64 %idxprom15, !dbg !172
  store %struct.word* %21, %struct.word** %arrayidx16, align 8, !dbg !175
  %25 = load %struct.word*, %struct.word** %w, align 8, !dbg !176
  %next17 = getelementptr inbounds %struct.word, %struct.word* %25, i32 0, i32 1, !dbg !178
  %26 = load %struct.word*, %struct.word** %next17, align 8, !dbg !178
  store %struct.word* %26, %struct.word** %v, align 8, !dbg !179
  br label %for.cond18, !dbg !180

for.cond18:                                       ; preds = %for.inc28, %for.end
  %27 = load %struct.word*, %struct.word** %v, align 8, !dbg !181
  %tobool19 = icmp ne %struct.word* %27, null, !dbg !183
  br i1 %tobool19, label %for.body20, label %for.end30, !dbg !183

for.body20:                                       ; preds = %for.cond18
  %28 = load %struct.word*, %struct.word** %w, align 8, !dbg !184
  %w21 = getelementptr inbounds %struct.word, %struct.word* %28, i32 0, i32 0, !dbg !187
  %29 = load i8*, i8** %w21, align 8, !dbg !187
  %30 = load %struct.word*, %struct.word** %v, align 8, !dbg !188
  %w22 = getelementptr inbounds %struct.word, %struct.word* %30, i32 0, i32 0, !dbg !189
  %31 = load i8*, i8** %w22, align 8, !dbg !189
  %call23 = call i32 @deranged(i8* %29, i8* %31), !dbg !190
  %tobool24 = icmp ne i32 %call23, 0, !dbg !190
  br i1 %tobool24, label %if.then25, label %if.end27, !dbg !191

if.then25:                                        ; preds = %for.body20
  %32 = load %struct.word*, %struct.word** %v, align 8, !dbg !192
  %w26 = getelementptr inbounds %struct.word, %struct.word* %32, i32 0, i32 0, !dbg !193
  %33 = load i8*, i8** %w26, align 8, !dbg !193
  store i8* %33, i8** %retval, align 8, !dbg !194
  br label %return, !dbg !194

if.end27:                                         ; preds = %for.body20
  br label %for.inc28, !dbg !195

for.inc28:                                        ; preds = %if.end27
  %34 = load %struct.word*, %struct.word** %v, align 8, !dbg !196
  %next29 = getelementptr inbounds %struct.word, %struct.word* %34, i32 0, i32 1, !dbg !197
  %35 = load %struct.word*, %struct.word** %next29, align 8, !dbg !197
  store %struct.word* %35, %struct.word** %v, align 8, !dbg !198
  br label %for.cond18, !dbg !199, !llvm.loop !200

for.end30:                                        ; preds = %for.cond18
  store i8* null, i8** %retval, align 8, !dbg !202
  br label %return, !dbg !202

return:                                           ; preds = %for.end30, %if.then25
  %36 = load i8*, i8** %retval, align 8, !dbg !203
  ret i8* %36, !dbg !203
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !204 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %words = alloca i8*, align 8
  %st = alloca %struct.stat, align 8
  %fd = alloca i32, align 4
  %root = alloca %union.node, align 8
  %cnt = alloca [26 x i8], align 16
  %best_len = alloca i32, align 4
  %b1 = alloca i8*, align 8
  %b2 = alloca i8*, align 8
  %match = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !209, metadata !DIExpression()), !dbg !210
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata i32* %j, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 0, i32* %j, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata i8** %words, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !219, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !262, metadata !DIExpression()), !dbg !263
  %0 = load i32, i32* %c.addr, align 4, !dbg !264
  %cmp = icmp slt i32 %0, 2, !dbg !265
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !264

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !264

cond.false:                                       ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !266
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !266
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !266
  br label %cond.end, !dbg !264

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), %cond.true ], [ %2, %cond.false ], !dbg !264
  %call = call i32 (i8*, i32, ...) @open(i8* %cond, i32 0), !dbg !267
  store i32 %call, i32* %fd, align 4, !dbg !263
  %3 = load i32, i32* %fd, align 4, !dbg !268
  %call1 = call i32 @fstat(i32 %3, %struct.stat* %st) #5, !dbg !270
  %cmp2 = icmp slt i32 %call1, 0, !dbg !271
  br i1 %cmp2, label %if.then, label %if.end, !dbg !272

if.then:                                          ; preds = %cond.end
  store i32 1, i32* %retval, align 4, !dbg !273
  br label %return, !dbg !273

if.end:                                           ; preds = %cond.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !274
  %4 = load i64, i64* %st_size, align 8, !dbg !274
  %call3 = call noalias i8* @malloc(i64 %4) #5, !dbg !275
  store i8* %call3, i8** %words, align 8, !dbg !276
  %5 = load i32, i32* %fd, align 4, !dbg !277
  %6 = load i8*, i8** %words, align 8, !dbg !278
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !279
  %7 = load i64, i64* %st_size4, align 8, !dbg !279
  %call5 = call i64 @read(i32 %5, i8* %6, i64 %7), !dbg !280
  %8 = load i32, i32* %fd, align 4, !dbg !281
  %call6 = call i32 @close(i32 %8), !dbg !282
  call void @llvm.dbg.declare(metadata %union.node* %root, metadata !283, metadata !DIExpression()), !dbg !284
  %9 = bitcast %union.node* %root to i8*, !dbg !284
  call void @llvm.memset.p0i8.i64(i8* align 8 %9, i8 0, i64 80, i1 false), !dbg !284
  call void @llvm.dbg.declare(metadata [26 x i8]* %cnt, metadata !285, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32* %best_len, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 0, i32* %best_len, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata i8** %b1, metadata !292, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata i8** %b2, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 0, i32* %i, align 4, !dbg !296
  br label %for.cond, !dbg !298

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i8*, i8** @freq, align 8, !dbg !299
  %11 = load i32, i32* %i, align 4, !dbg !301
  %idxprom = sext i32 %11 to i64, !dbg !299
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i64 %idxprom, !dbg !299
  %12 = load i8, i8* %arrayidx7, align 1, !dbg !299
  %tobool = icmp ne i8 %12, 0, !dbg !302
  br i1 %tobool, label %for.body, label %for.end, !dbg !302

for.body:                                         ; preds = %for.cond
  %13 = load i32, i32* %i, align 4, !dbg !303
  %14 = load i8*, i8** @freq, align 8, !dbg !304
  %15 = load i32, i32* %i, align 4, !dbg !305
  %idxprom8 = sext i32 %15 to i64, !dbg !304
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i64 %idxprom8, !dbg !304
  %16 = load i8, i8* %arrayidx9, align 1, !dbg !304
  %idxprom10 = zext i8 %16 to i64, !dbg !306
  %arrayidx11 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom10, !dbg !306
  store i32 %13, i32* %arrayidx11, align 4, !dbg !307
  br label %for.inc, !dbg !306

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !308
  %inc = add nsw i32 %17, 1, !dbg !308
  store i32 %inc, i32* %i, align 4, !dbg !308
  br label %for.cond, !dbg !309, !llvm.loop !310

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !312
  store i32 0, i32* %i, align 4, !dbg !314
  br label %for.cond12, !dbg !315

for.cond12:                                       ; preds = %for.inc42, %for.end
  %18 = load i32, i32* %i, align 4, !dbg !316
  %conv = sext i32 %18 to i64, !dbg !316
  %st_size13 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !318
  %19 = load i64, i64* %st_size13, align 8, !dbg !318
  %cmp14 = icmp slt i64 %conv, %19, !dbg !319
  br i1 %cmp14, label %for.body16, label %for.end44, !dbg !320

for.body16:                                       ; preds = %for.cond12
  %20 = load i8*, i8** %words, align 8, !dbg !321
  %21 = load i32, i32* %i, align 4, !dbg !324
  %idxprom17 = sext i32 %21 to i64, !dbg !321
  %arrayidx18 = getelementptr inbounds i8, i8* %20, i64 %idxprom17, !dbg !321
  %22 = load i8, i8* %arrayidx18, align 1, !dbg !321
  %conv19 = sext i8 %22 to i32, !dbg !321
  %cmp20 = icmp ne i32 %conv19, 10, !dbg !325
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !326

if.then22:                                        ; preds = %for.body16
  br label %for.inc42, !dbg !327

if.end23:                                         ; preds = %for.body16
  %23 = load i8*, i8** %words, align 8, !dbg !328
  %24 = load i32, i32* %i, align 4, !dbg !329
  %idxprom24 = sext i32 %24 to i64, !dbg !328
  %arrayidx25 = getelementptr inbounds i8, i8* %23, i64 %idxprom24, !dbg !328
  store i8 0, i8* %arrayidx25, align 1, !dbg !330
  %25 = load i32, i32* %i, align 4, !dbg !331
  %26 = load i32, i32* %j, align 4, !dbg !333
  %sub = sub nsw i32 %25, %26, !dbg !334
  %27 = load i32, i32* %best_len, align 4, !dbg !335
  %cmp26 = icmp sgt i32 %sub, %27, !dbg !336
  br i1 %cmp26, label %if.then28, label %if.end40, !dbg !337

if.then28:                                        ; preds = %if.end23
  %28 = load i8*, i8** %words, align 8, !dbg !338
  %29 = load i32, i32* %j, align 4, !dbg !340
  %idx.ext = sext i32 %29 to i64, !dbg !341
  %add.ptr = getelementptr inbounds i8, i8* %28, i64 %idx.ext, !dbg !341
  %arraydecay = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !342
  %call29 = call i32 @count_letters(i8* %add.ptr, i8* %arraydecay), !dbg !343
  call void @llvm.dbg.declare(metadata i8** %match, metadata !344, metadata !DIExpression()), !dbg !345
  %30 = load i8*, i8** %words, align 8, !dbg !346
  %31 = load i32, i32* %j, align 4, !dbg !347
  %idx.ext30 = sext i32 %31 to i64, !dbg !348
  %add.ptr31 = getelementptr inbounds i8, i8* %30, i64 %idx.ext30, !dbg !348
  %arraydecay32 = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !349
  %call33 = call i8* @insert(%union.node* %root, i8* %add.ptr31, i8* %arraydecay32), !dbg !350
  store i8* %call33, i8** %match, align 8, !dbg !345
  %32 = load i8*, i8** %match, align 8, !dbg !351
  %tobool34 = icmp ne i8* %32, null, !dbg !351
  br i1 %tobool34, label %if.then35, label %if.end39, !dbg !353

if.then35:                                        ; preds = %if.then28
  %33 = load i32, i32* %i, align 4, !dbg !354
  %34 = load i32, i32* %j, align 4, !dbg !356
  %sub36 = sub nsw i32 %33, %34, !dbg !357
  store i32 %sub36, i32* %best_len, align 4, !dbg !358
  %35 = load i8*, i8** %words, align 8, !dbg !359
  %36 = load i32, i32* %j, align 4, !dbg !360
  %idx.ext37 = sext i32 %36 to i64, !dbg !361
  %add.ptr38 = getelementptr inbounds i8, i8* %35, i64 %idx.ext37, !dbg !361
  store i8* %add.ptr38, i8** %b1, align 8, !dbg !362
  %37 = load i8*, i8** %match, align 8, !dbg !363
  store i8* %37, i8** %b2, align 8, !dbg !364
  br label %if.end39, !dbg !365

if.end39:                                         ; preds = %if.then35, %if.then28
  br label %if.end40, !dbg !366

if.end40:                                         ; preds = %if.end39, %if.end23
  %38 = load i32, i32* %i, align 4, !dbg !367
  %inc41 = add nsw i32 %38, 1, !dbg !367
  store i32 %inc41, i32* %i, align 4, !dbg !367
  store i32 %inc41, i32* %j, align 4, !dbg !368
  br label %for.inc42, !dbg !369

for.inc42:                                        ; preds = %if.end40, %if.then22
  %39 = load i32, i32* %i, align 4, !dbg !370
  %inc43 = add nsw i32 %39, 1, !dbg !370
  store i32 %inc43, i32* %i, align 4, !dbg !370
  br label %for.cond12, !dbg !371, !llvm.loop !372

for.end44:                                        ; preds = %for.cond12
  %40 = load i32, i32* %best_len, align 4, !dbg !374
  %tobool45 = icmp ne i32 %40, 0, !dbg !374
  br i1 %tobool45, label %if.then46, label %if.end48, !dbg !376

if.then46:                                        ; preds = %for.end44
  %41 = load i8*, i8** %b1, align 8, !dbg !377
  %42 = load i8*, i8** %b2, align 8, !dbg !378
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* %41, i8* %42), !dbg !379
  br label %if.end48, !dbg !379

if.end48:                                         ; preds = %if.then46, %for.end44
  store i32 0, i32* %retval, align 4, !dbg !380
  br label %return, !dbg !380

return:                                           ; preds = %if.end48, %if.then
  %43 = load i32, i32* %retval, align 4, !dbg !381
  ret i32 %43, !dbg !381
}

declare dso_local i32 @open(i8*, i32, ...) #4

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #3

declare dso_local i64 @read(i32, i8*, i64) #4

declare dso_local i32 @close(i32) #4

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "freq", scope: !2, file: !3, line: 10, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "anagrams-deranged-anagrams.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Anagrams-Deranged-anagrams")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "char_to_idx", scope: !2, file: !3, line: 11, type: !10, isLocal: false, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 4096, elements: !12)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 128)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!21 = distinct !DISubprogram(name: "deranged", scope: !3, file: !3, line: 24, type: !22, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{!11, !14, !14}
!24 = !DILocalVariable(name: "s1", arg: 1, scope: !21, file: !3, line: 24, type: !14)
!25 = !DILocation(line: 24, column: 26, scope: !21)
!26 = !DILocalVariable(name: "s2", arg: 2, scope: !21, file: !3, line: 24, type: !14)
!27 = !DILocation(line: 24, column: 42, scope: !21)
!28 = !DILocalVariable(name: "i", scope: !21, file: !3, line: 26, type: !11)
!29 = !DILocation(line: 26, column: 6, scope: !21)
!30 = !DILocation(line: 27, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !3, line: 27, column: 2)
!32 = !DILocation(line: 27, column: 7, scope: !31)
!33 = !DILocation(line: 27, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !3, line: 27, column: 2)
!35 = !DILocation(line: 27, column: 17, scope: !34)
!36 = !DILocation(line: 27, column: 2, scope: !31)
!37 = !DILocation(line: 28, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 28, column: 7)
!39 = !DILocation(line: 28, column: 10, scope: !38)
!40 = !DILocation(line: 28, column: 16, scope: !38)
!41 = !DILocation(line: 28, column: 19, scope: !38)
!42 = !DILocation(line: 28, column: 13, scope: !38)
!43 = !DILocation(line: 28, column: 7, scope: !34)
!44 = !DILocation(line: 28, column: 23, scope: !38)
!45 = !DILocation(line: 28, column: 20, scope: !38)
!46 = !DILocation(line: 27, column: 22, scope: !34)
!47 = !DILocation(line: 27, column: 2, scope: !34)
!48 = distinct !{!48, !36, !49}
!49 = !DILocation(line: 28, column: 30, scope: !31)
!50 = !DILocation(line: 29, column: 2, scope: !21)
!51 = !DILocation(line: 30, column: 1, scope: !21)
!52 = distinct !DISubprogram(name: "count_letters", scope: !3, file: !3, line: 32, type: !53, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !14, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!56 = !DILocalVariable(name: "s", arg: 1, scope: !52, file: !3, line: 32, type: !14)
!57 = !DILocation(line: 32, column: 31, scope: !52)
!58 = !DILocalVariable(name: "c", arg: 2, scope: !52, file: !3, line: 32, type: !55)
!59 = !DILocation(line: 32, column: 49, scope: !52)
!60 = !DILocalVariable(name: "i", scope: !52, file: !3, line: 34, type: !11)
!61 = !DILocation(line: 34, column: 6, scope: !52)
!62 = !DILocalVariable(name: "len", scope: !52, file: !3, line: 34, type: !11)
!63 = !DILocation(line: 34, column: 9, scope: !52)
!64 = !DILocation(line: 35, column: 9, scope: !52)
!65 = !DILocation(line: 35, column: 2, scope: !52)
!66 = !DILocation(line: 36, column: 15, scope: !67)
!67 = distinct !DILexicalBlock(scope: !52, file: !3, line: 36, column: 2)
!68 = !DILocation(line: 36, column: 11, scope: !67)
!69 = !DILocation(line: 36, column: 7, scope: !67)
!70 = !DILocation(line: 36, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 36, column: 2)
!72 = !DILocation(line: 36, column: 22, scope: !71)
!73 = !DILocation(line: 36, column: 2, scope: !67)
!74 = !DILocation(line: 37, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !3, line: 37, column: 7)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 36, column: 31)
!77 = !DILocation(line: 37, column: 9, scope: !75)
!78 = !DILocation(line: 37, column: 12, scope: !75)
!79 = !DILocation(line: 37, column: 18, scope: !75)
!80 = !DILocation(line: 37, column: 21, scope: !75)
!81 = !DILocation(line: 37, column: 23, scope: !75)
!82 = !DILocation(line: 37, column: 26, scope: !75)
!83 = !DILocation(line: 37, column: 7, scope: !76)
!84 = !DILocation(line: 38, column: 4, scope: !75)
!85 = !DILocation(line: 39, column: 6, scope: !76)
!86 = !DILocation(line: 39, column: 10, scope: !76)
!87 = !DILocation(line: 39, column: 39, scope: !76)
!88 = !DILocation(line: 39, column: 41, scope: !76)
!89 = !DILocation(line: 39, column: 12, scope: !76)
!90 = !DILocation(line: 39, column: 45, scope: !76)
!91 = !DILocation(line: 40, column: 2, scope: !76)
!92 = !DILocation(line: 36, column: 27, scope: !71)
!93 = !DILocation(line: 36, column: 2, scope: !71)
!94 = distinct !{!94, !73, !95}
!95 = !DILocation(line: 40, column: 2, scope: !67)
!96 = !DILocation(line: 41, column: 9, scope: !52)
!97 = !DILocation(line: 41, column: 2, scope: !52)
!98 = !DILocation(line: 42, column: 1, scope: !52)
!99 = distinct !DISubprogram(name: "insert", scope: !3, file: !3, line: 44, type: !100, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{!14, !102, !14, !55}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "node", file: !3, line: 19, size: 640, elements: !104)
!104 = !{!105, !109}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "down", scope: !103, file: !3, line: 20, baseType: !106, size: 640)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 640, elements: !107)
!107 = !{!108}
!108 = !DISubrange(count: 10)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !103, file: !3, line: 21, baseType: !110, size: 640)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !111, size: 640, elements: !107)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "word", file: !3, line: 14, size: 128, elements: !113)
!113 = !{!114, !115}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !112, file: !3, line: 15, baseType: !14, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !112, file: !3, line: 16, baseType: !111, size: 64, offset: 64)
!116 = !DILocalVariable(name: "root", arg: 1, scope: !99, file: !3, line: 44, type: !102)
!117 = !DILocation(line: 44, column: 33, scope: !99)
!118 = !DILocalVariable(name: "s", arg: 2, scope: !99, file: !3, line: 44, type: !14)
!119 = !DILocation(line: 44, column: 51, scope: !99)
!120 = !DILocalVariable(name: "cnt", arg: 3, scope: !99, file: !3, line: 44, type: !55)
!121 = !DILocation(line: 44, column: 69, scope: !99)
!122 = !DILocalVariable(name: "i", scope: !99, file: !3, line: 46, type: !11)
!123 = !DILocation(line: 46, column: 6, scope: !99)
!124 = !DILocalVariable(name: "n", scope: !99, file: !3, line: 47, type: !102)
!125 = !DILocation(line: 47, column: 14, scope: !99)
!126 = !DILocalVariable(name: "v", scope: !99, file: !3, line: 48, type: !111)
!127 = !DILocation(line: 48, column: 15, scope: !99)
!128 = !DILocalVariable(name: "w", scope: !99, file: !3, line: 48, type: !111)
!129 = !DILocation(line: 48, column: 19, scope: !99)
!130 = !DILocation(line: 50, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !99, file: !3, line: 50, column: 2)
!132 = !DILocation(line: 50, column: 7, scope: !131)
!133 = !DILocation(line: 50, column: 14, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !3, line: 50, column: 2)
!135 = !DILocation(line: 50, column: 16, scope: !134)
!136 = !DILocation(line: 50, column: 2, scope: !131)
!137 = !DILocation(line: 51, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 51, column: 7)
!139 = distinct !DILexicalBlock(scope: !134, file: !3, line: 50, column: 37)
!140 = !DILocation(line: 51, column: 19, scope: !138)
!141 = !DILocation(line: 51, column: 24, scope: !138)
!142 = !DILocation(line: 51, column: 28, scope: !138)
!143 = !DILocation(line: 51, column: 11, scope: !138)
!144 = !DILocation(line: 51, column: 7, scope: !139)
!145 = !DILocation(line: 52, column: 29, scope: !138)
!146 = !DILocation(line: 52, column: 27, scope: !138)
!147 = !DILocation(line: 52, column: 4, scope: !138)
!148 = !DILocation(line: 52, column: 10, scope: !138)
!149 = !DILocation(line: 52, column: 15, scope: !138)
!150 = !DILocation(line: 52, column: 19, scope: !138)
!151 = !DILocation(line: 52, column: 23, scope: !138)
!152 = !DILocation(line: 53, column: 2, scope: !139)
!153 = !DILocation(line: 50, column: 23, scope: !134)
!154 = !DILocation(line: 50, column: 34, scope: !134)
!155 = !DILocation(line: 50, column: 32, scope: !134)
!156 = !DILocation(line: 50, column: 2, scope: !134)
!157 = distinct !{!157, !136, !158}
!158 = !DILocation(line: 53, column: 2, scope: !131)
!159 = !DILocation(line: 55, column: 6, scope: !99)
!160 = !DILocation(line: 55, column: 4, scope: !99)
!161 = !DILocation(line: 56, column: 9, scope: !99)
!162 = !DILocation(line: 56, column: 2, scope: !99)
!163 = !DILocation(line: 56, column: 5, scope: !99)
!164 = !DILocation(line: 56, column: 7, scope: !99)
!165 = !DILocation(line: 57, column: 12, scope: !99)
!166 = !DILocation(line: 57, column: 18, scope: !99)
!167 = !DILocation(line: 57, column: 23, scope: !99)
!168 = !DILocation(line: 57, column: 2, scope: !99)
!169 = !DILocation(line: 57, column: 5, scope: !99)
!170 = !DILocation(line: 57, column: 10, scope: !99)
!171 = !DILocation(line: 58, column: 24, scope: !99)
!172 = !DILocation(line: 58, column: 2, scope: !99)
!173 = !DILocation(line: 58, column: 8, scope: !99)
!174 = !DILocation(line: 58, column: 13, scope: !99)
!175 = !DILocation(line: 58, column: 22, scope: !99)
!176 = !DILocation(line: 60, column: 11, scope: !177)
!177 = distinct !DILexicalBlock(scope: !99, file: !3, line: 60, column: 2)
!178 = !DILocation(line: 60, column: 14, scope: !177)
!179 = !DILocation(line: 60, column: 9, scope: !177)
!180 = !DILocation(line: 60, column: 7, scope: !177)
!181 = !DILocation(line: 60, column: 20, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !3, line: 60, column: 2)
!183 = !DILocation(line: 60, column: 2, scope: !177)
!184 = !DILocation(line: 61, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !3, line: 61, column: 7)
!186 = distinct !DILexicalBlock(scope: !182, file: !3, line: 60, column: 36)
!187 = !DILocation(line: 61, column: 19, scope: !185)
!188 = !DILocation(line: 61, column: 22, scope: !185)
!189 = !DILocation(line: 61, column: 25, scope: !185)
!190 = !DILocation(line: 61, column: 7, scope: !185)
!191 = !DILocation(line: 61, column: 7, scope: !186)
!192 = !DILocation(line: 62, column: 11, scope: !185)
!193 = !DILocation(line: 62, column: 14, scope: !185)
!194 = !DILocation(line: 62, column: 4, scope: !185)
!195 = !DILocation(line: 63, column: 2, scope: !186)
!196 = !DILocation(line: 60, column: 27, scope: !182)
!197 = !DILocation(line: 60, column: 30, scope: !182)
!198 = !DILocation(line: 60, column: 25, scope: !182)
!199 = !DILocation(line: 60, column: 2, scope: !182)
!200 = distinct !{!200, !183, !201}
!201 = !DILocation(line: 63, column: 2, scope: !177)
!202 = !DILocation(line: 64, column: 2, scope: !99)
!203 = !DILocation(line: 65, column: 1, scope: !99)
!204 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 67, type: !205, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DISubroutineType(types: !206)
!206 = !{!11, !11, !207}
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!209 = !DILocalVariable(name: "c", arg: 1, scope: !204, file: !3, line: 67, type: !11)
!210 = !DILocation(line: 67, column: 14, scope: !204)
!211 = !DILocalVariable(name: "v", arg: 2, scope: !204, file: !3, line: 67, type: !207)
!212 = !DILocation(line: 67, column: 24, scope: !204)
!213 = !DILocalVariable(name: "i", scope: !204, file: !3, line: 69, type: !11)
!214 = !DILocation(line: 69, column: 6, scope: !204)
!215 = !DILocalVariable(name: "j", scope: !204, file: !3, line: 69, type: !11)
!216 = !DILocation(line: 69, column: 9, scope: !204)
!217 = !DILocalVariable(name: "words", scope: !204, file: !3, line: 70, type: !208)
!218 = !DILocation(line: 70, column: 8, scope: !204)
!219 = !DILocalVariable(name: "st", scope: !204, file: !3, line: 71, type: !220)
!220 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !221, line: 46, size: 1152, elements: !222)
!221 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!222 = !{!223, !227, !229, !231, !234, !236, !238, !239, !240, !243, !245, !247, !255, !256, !257}
!223 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !220, file: !221, line: 48, baseType: !224, size: 64)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !225, line: 145, baseType: !226)
!225 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!226 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !220, file: !221, line: 53, baseType: !228, size: 64, offset: 64)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !225, line: 148, baseType: !226)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !220, file: !221, line: 61, baseType: !230, size: 64, offset: 128)
!230 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !225, line: 151, baseType: !226)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !220, file: !221, line: 62, baseType: !232, size: 32, offset: 192)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !225, line: 150, baseType: !233)
!233 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !220, file: !221, line: 64, baseType: !235, size: 32, offset: 224)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !225, line: 146, baseType: !233)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !220, file: !221, line: 65, baseType: !237, size: 32, offset: 256)
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !225, line: 147, baseType: !233)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !220, file: !221, line: 67, baseType: !11, size: 32, offset: 288)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !220, file: !221, line: 69, baseType: !224, size: 64, offset: 320)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !220, file: !221, line: 74, baseType: !241, size: 64, offset: 384)
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !225, line: 152, baseType: !242)
!242 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !220, file: !221, line: 78, baseType: !244, size: 64, offset: 448)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !225, line: 174, baseType: !242)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !220, file: !221, line: 80, baseType: !246, size: 64, offset: 512)
!246 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !225, line: 179, baseType: !242)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !220, file: !221, line: 91, baseType: !248, size: 128, offset: 576)
!248 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !249, line: 10, size: 128, elements: !250)
!249 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!250 = !{!251, !253}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !248, file: !249, line: 12, baseType: !252, size: 64)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !225, line: 160, baseType: !242)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !248, file: !249, line: 16, baseType: !254, size: 64, offset: 64)
!254 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !225, line: 196, baseType: !242)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !220, file: !221, line: 92, baseType: !248, size: 128, offset: 704)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !220, file: !221, line: 93, baseType: !248, size: 128, offset: 832)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !220, file: !221, line: 106, baseType: !258, size: 192, offset: 960)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !254, size: 192, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 3)
!261 = !DILocation(line: 71, column: 14, scope: !204)
!262 = !DILocalVariable(name: "fd", scope: !204, file: !3, line: 73, type: !11)
!263 = !DILocation(line: 73, column: 6, scope: !204)
!264 = !DILocation(line: 73, column: 16, scope: !204)
!265 = !DILocation(line: 73, column: 18, scope: !204)
!266 = !DILocation(line: 73, column: 41, scope: !204)
!267 = !DILocation(line: 73, column: 11, scope: !204)
!268 = !DILocation(line: 74, column: 12, scope: !269)
!269 = distinct !DILexicalBlock(scope: !204, file: !3, line: 74, column: 6)
!270 = !DILocation(line: 74, column: 6, scope: !269)
!271 = !DILocation(line: 74, column: 21, scope: !269)
!272 = !DILocation(line: 74, column: 6, scope: !204)
!273 = !DILocation(line: 74, column: 26, scope: !269)
!274 = !DILocation(line: 76, column: 20, scope: !204)
!275 = !DILocation(line: 76, column: 10, scope: !204)
!276 = !DILocation(line: 76, column: 8, scope: !204)
!277 = !DILocation(line: 77, column: 7, scope: !204)
!278 = !DILocation(line: 77, column: 11, scope: !204)
!279 = !DILocation(line: 77, column: 21, scope: !204)
!280 = !DILocation(line: 77, column: 2, scope: !204)
!281 = !DILocation(line: 78, column: 8, scope: !204)
!282 = !DILocation(line: 78, column: 2, scope: !204)
!283 = !DILocalVariable(name: "root", scope: !204, file: !3, line: 80, type: !103)
!284 = !DILocation(line: 80, column: 13, scope: !204)
!285 = !DILocalVariable(name: "cnt", scope: !204, file: !3, line: 81, type: !286)
!286 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 208, elements: !287)
!287 = !{!288}
!288 = !DISubrange(count: 26)
!289 = !DILocation(line: 81, column: 16, scope: !204)
!290 = !DILocalVariable(name: "best_len", scope: !204, file: !3, line: 82, type: !11)
!291 = !DILocation(line: 82, column: 6, scope: !204)
!292 = !DILocalVariable(name: "b1", scope: !204, file: !3, line: 83, type: !14)
!293 = !DILocation(line: 83, column: 14, scope: !204)
!294 = !DILocalVariable(name: "b2", scope: !204, file: !3, line: 83, type: !14)
!295 = !DILocation(line: 83, column: 19, scope: !204)
!296 = !DILocation(line: 85, column: 9, scope: !297)
!297 = distinct !DILexicalBlock(scope: !204, file: !3, line: 85, column: 2)
!298 = !DILocation(line: 85, column: 7, scope: !297)
!299 = !DILocation(line: 85, column: 14, scope: !300)
!300 = distinct !DILexicalBlock(scope: !297, file: !3, line: 85, column: 2)
!301 = !DILocation(line: 85, column: 19, scope: !300)
!302 = !DILocation(line: 85, column: 2, scope: !297)
!303 = !DILocation(line: 86, column: 41, scope: !300)
!304 = !DILocation(line: 86, column: 30, scope: !300)
!305 = !DILocation(line: 86, column: 35, scope: !300)
!306 = !DILocation(line: 86, column: 3, scope: !300)
!307 = !DILocation(line: 86, column: 39, scope: !300)
!308 = !DILocation(line: 85, column: 24, scope: !300)
!309 = !DILocation(line: 85, column: 2, scope: !300)
!310 = distinct !{!310, !302, !311}
!311 = !DILocation(line: 86, column: 41, scope: !297)
!312 = !DILocation(line: 89, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !204, file: !3, line: 89, column: 2)
!314 = !DILocation(line: 89, column: 9, scope: !313)
!315 = !DILocation(line: 89, column: 7, scope: !313)
!316 = !DILocation(line: 89, column: 18, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !3, line: 89, column: 2)
!318 = !DILocation(line: 89, column: 25, scope: !317)
!319 = !DILocation(line: 89, column: 20, scope: !317)
!320 = !DILocation(line: 89, column: 2, scope: !313)
!321 = !DILocation(line: 90, column: 7, scope: !322)
!322 = distinct !DILexicalBlock(scope: !323, file: !3, line: 90, column: 7)
!323 = distinct !DILexicalBlock(scope: !317, file: !3, line: 89, column: 39)
!324 = !DILocation(line: 90, column: 13, scope: !322)
!325 = !DILocation(line: 90, column: 16, scope: !322)
!326 = !DILocation(line: 90, column: 7, scope: !323)
!327 = !DILocation(line: 90, column: 25, scope: !322)
!328 = !DILocation(line: 91, column: 3, scope: !323)
!329 = !DILocation(line: 91, column: 9, scope: !323)
!330 = !DILocation(line: 91, column: 12, scope: !323)
!331 = !DILocation(line: 93, column: 7, scope: !332)
!332 = distinct !DILexicalBlock(scope: !323, file: !3, line: 93, column: 7)
!333 = !DILocation(line: 93, column: 11, scope: !332)
!334 = !DILocation(line: 93, column: 9, scope: !332)
!335 = !DILocation(line: 93, column: 15, scope: !332)
!336 = !DILocation(line: 93, column: 13, scope: !332)
!337 = !DILocation(line: 93, column: 7, scope: !323)
!338 = !DILocation(line: 94, column: 18, scope: !339)
!339 = distinct !DILexicalBlock(scope: !332, file: !3, line: 93, column: 25)
!340 = !DILocation(line: 94, column: 26, scope: !339)
!341 = !DILocation(line: 94, column: 24, scope: !339)
!342 = !DILocation(line: 94, column: 29, scope: !339)
!343 = !DILocation(line: 94, column: 4, scope: !339)
!344 = !DILocalVariable(name: "match", scope: !339, file: !3, line: 95, type: !14)
!345 = !DILocation(line: 95, column: 16, scope: !339)
!346 = !DILocation(line: 95, column: 38, scope: !339)
!347 = !DILocation(line: 95, column: 46, scope: !339)
!348 = !DILocation(line: 95, column: 44, scope: !339)
!349 = !DILocation(line: 95, column: 49, scope: !339)
!350 = !DILocation(line: 95, column: 24, scope: !339)
!351 = !DILocation(line: 97, column: 8, scope: !352)
!352 = distinct !DILexicalBlock(scope: !339, file: !3, line: 97, column: 8)
!353 = !DILocation(line: 97, column: 8, scope: !339)
!354 = !DILocation(line: 98, column: 16, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !3, line: 97, column: 15)
!356 = !DILocation(line: 98, column: 20, scope: !355)
!357 = !DILocation(line: 98, column: 18, scope: !355)
!358 = !DILocation(line: 98, column: 14, scope: !355)
!359 = !DILocation(line: 99, column: 10, scope: !355)
!360 = !DILocation(line: 99, column: 18, scope: !355)
!361 = !DILocation(line: 99, column: 16, scope: !355)
!362 = !DILocation(line: 99, column: 8, scope: !355)
!363 = !DILocation(line: 100, column: 10, scope: !355)
!364 = !DILocation(line: 100, column: 8, scope: !355)
!365 = !DILocation(line: 101, column: 4, scope: !355)
!366 = !DILocation(line: 102, column: 3, scope: !339)
!367 = !DILocation(line: 104, column: 7, scope: !323)
!368 = !DILocation(line: 104, column: 5, scope: !323)
!369 = !DILocation(line: 105, column: 2, scope: !323)
!370 = !DILocation(line: 89, column: 35, scope: !317)
!371 = !DILocation(line: 89, column: 2, scope: !317)
!372 = distinct !{!372, !320, !373}
!373 = !DILocation(line: 105, column: 2, scope: !313)
!374 = !DILocation(line: 107, column: 6, scope: !375)
!375 = distinct !DILexicalBlock(scope: !204, file: !3, line: 107, column: 6)
!376 = !DILocation(line: 107, column: 6, scope: !204)
!377 = !DILocation(line: 107, column: 55, scope: !375)
!378 = !DILocation(line: 107, column: 59, scope: !375)
!379 = !DILocation(line: 107, column: 16, scope: !375)
!380 = !DILocation(line: 109, column: 2, scope: !204)
!381 = !DILocation(line: 110, column: 1, scope: !204)
