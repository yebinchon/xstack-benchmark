; ModuleID = 'anagrams-deranged-anagrams.c'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !43, !cf.info !44

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval, align 4, !dbg !45
  br label %return, !dbg !45

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %9, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !51
  br label %return, !dbg !51

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %10, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count_letters(i8* %s, i8* %c) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* %c, i8** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %c.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %i, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %len, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** %c.addr, align 8, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 26, i1 false), !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  store i32 0, i32* %len, align 4, !dbg !69
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s.addr, align 8, !dbg !71
  %2 = load i32, i32* %i, align 4, !dbg !73
  %idxprom = sext i32 %2 to i64, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !71
  %3 = load i8, i8* %arrayidx, align 1, !dbg !71
  %tobool = icmp ne i8 %3, 0, !dbg !74
  br i1 %tobool, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %s.addr, align 8, !dbg !75
  %5 = load i32, i32* %i, align 4, !dbg !78
  %idxprom1 = sext i32 %5 to i64, !dbg !75
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %idxprom1, !dbg !75
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !75
  %conv = sext i8 %6 to i32, !dbg !75
  %cmp = icmp slt i32 %conv, 97, !dbg !79
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !80, !cf.info !44

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i8*, i8** %s.addr, align 8, !dbg !81
  %8 = load i32, i32* %i, align 4, !dbg !82
  %idxprom4 = sext i32 %8 to i64, !dbg !81
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %idxprom4, !dbg !81
  %9 = load i8, i8* %arrayidx5, align 1, !dbg !81
  %conv6 = sext i8 %9 to i32, !dbg !81
  %cmp7 = icmp sgt i32 %conv6, 122, !dbg !83
  br i1 %cmp7, label %if.then, label %if.end, !dbg !84, !cf.info !44

if.then:                                          ; preds = %lor.lhs.false, %for.body
  store i32 0, i32* %retval, align 4, !dbg !85
  br label %return, !dbg !85

if.end:                                           ; preds = %lor.lhs.false
  %10 = load i32, i32* %len, align 4, !dbg !86
  %inc = add nsw i32 %10, 1, !dbg !86
  store i32 %inc, i32* %len, align 4, !dbg !86
  %11 = load i8*, i8** %c.addr, align 8, !dbg !87
  %12 = load i8*, i8** %s.addr, align 8, !dbg !88
  %13 = load i32, i32* %i, align 4, !dbg !89
  %idxprom9 = sext i32 %13 to i64, !dbg !88
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i64 %idxprom9, !dbg !88
  %14 = load i8, i8* %arrayidx10, align 1, !dbg !88
  %idxprom11 = zext i8 %14 to i64, !dbg !90
  %arrayidx12 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom11, !dbg !90
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !90
  %idxprom13 = sext i32 %15 to i64, !dbg !87
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i64 %idxprom13, !dbg !87
  %16 = load i8, i8* %arrayidx14, align 1, !dbg !91
  %inc15 = add i8 %16, 1, !dbg !91
  store i8 %inc15, i8* %arrayidx14, align 1, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %i, align 4, !dbg !93
  %inc16 = add nsw i32 %17, 1, !dbg !93
  store i32 %inc16, i32* %i, align 4, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %len, align 4, !dbg !97
  store i32 %18, i32* %retval, align 4, !dbg !98
  br label %return, !dbg !98

return:                                           ; preds = %for.end, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !99
  ret i32 %19, !dbg !99
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @insert(%union.node* %root, i8* %s, i8* %cnt) #0 !dbg !100 {
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
  call void @llvm.dbg.declare(metadata %union.node** %root.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i8* %cnt, i8** %cnt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %cnt.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata %union.node** %n, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata %struct.word** %v, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata %struct.word** %w, metadata !129, metadata !DIExpression()), !dbg !130
  store %struct.word* null, %struct.word** %w, align 8, !dbg !130
  store i32 0, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !134
  %cmp = icmp slt i32 %0, 25, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %1 = load %union.node*, %union.node** %root.addr, align 8, !dbg !138
  %down = bitcast %union.node* %1 to [10 x %union.node*]*, !dbg !141
  %2 = load i8*, i8** %cnt.addr, align 8, !dbg !142
  %3 = load i32, i32* %i, align 4, !dbg !143
  %idxprom = sext i32 %3 to i64, !dbg !142
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom, !dbg !142
  %4 = load i8, i8* %arrayidx, align 1, !dbg !142
  %idxprom1 = zext i8 %4 to i64, !dbg !138
  %arrayidx2 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down, i64 0, i64 %idxprom1, !dbg !138
  %5 = load %union.node*, %union.node** %arrayidx2, align 8, !dbg !138
  store %union.node* %5, %union.node** %n, align 8, !dbg !144
  %tobool = icmp ne %union.node* %5, null, !dbg !144
  br i1 %tobool, label %if.end, label %if.then, !dbg !145, !cf.info !44

if.then:                                          ; preds = %for.body
  %call = call noalias i8* @calloc(i64 1, i64 80) #5, !dbg !146
  %6 = bitcast i8* %call to %union.node*, !dbg !146
  store %union.node* %6, %union.node** %n, align 8, !dbg !147
  %7 = load %union.node*, %union.node** %root.addr, align 8, !dbg !148
  %down3 = bitcast %union.node* %7 to [10 x %union.node*]*, !dbg !149
  %8 = load i8*, i8** %cnt.addr, align 8, !dbg !150
  %9 = load i32, i32* %i, align 4, !dbg !151
  %idxprom4 = sext i32 %9 to i64, !dbg !150
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %idxprom4, !dbg !150
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !150
  %idxprom6 = zext i8 %10 to i64, !dbg !148
  %arrayidx7 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down3, i64 0, i64 %idxprom6, !dbg !148
  store %union.node* %6, %union.node** %arrayidx7, align 8, !dbg !152
  br label %if.end, !dbg !148

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %11, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  %12 = load %union.node*, %union.node** %n, align 8, !dbg !155
  store %union.node* %12, %union.node** %root.addr, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %call8 = call noalias i8* @malloc(i64 16) #5, !dbg !160
  %13 = bitcast i8* %call8 to %struct.word*, !dbg !160
  store %struct.word* %13, %struct.word** %w, align 8, !dbg !161
  %14 = load i8*, i8** %s.addr, align 8, !dbg !162
  %15 = load %struct.word*, %struct.word** %w, align 8, !dbg !163
  %w9 = getelementptr inbounds %struct.word, %struct.word* %15, i32 0, i32 0, !dbg !164
  store i8* %14, i8** %w9, align 8, !dbg !165
  %16 = load %union.node*, %union.node** %root.addr, align 8, !dbg !166
  %list = bitcast %union.node* %16 to [10 x %struct.word*]*, !dbg !167
  %17 = load i8*, i8** %cnt.addr, align 8, !dbg !168
  %arrayidx10 = getelementptr inbounds i8, i8* %17, i64 25, !dbg !168
  %18 = load i8, i8* %arrayidx10, align 1, !dbg !168
  %idxprom11 = zext i8 %18 to i64, !dbg !166
  %arrayidx12 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list, i64 0, i64 %idxprom11, !dbg !166
  %19 = load %struct.word*, %struct.word** %arrayidx12, align 8, !dbg !166
  %20 = load %struct.word*, %struct.word** %w, align 8, !dbg !169
  %next = getelementptr inbounds %struct.word, %struct.word* %20, i32 0, i32 1, !dbg !170
  store %struct.word* %19, %struct.word** %next, align 8, !dbg !171
  %21 = load %struct.word*, %struct.word** %w, align 8, !dbg !172
  %22 = load %union.node*, %union.node** %root.addr, align 8, !dbg !173
  %list13 = bitcast %union.node* %22 to [10 x %struct.word*]*, !dbg !174
  %23 = load i8*, i8** %cnt.addr, align 8, !dbg !175
  %arrayidx14 = getelementptr inbounds i8, i8* %23, i64 25, !dbg !175
  %24 = load i8, i8* %arrayidx14, align 1, !dbg !175
  %idxprom15 = zext i8 %24 to i64, !dbg !173
  %arrayidx16 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list13, i64 0, i64 %idxprom15, !dbg !173
  store %struct.word* %21, %struct.word** %arrayidx16, align 8, !dbg !176
  %25 = load %struct.word*, %struct.word** %w, align 8, !dbg !177
  %next17 = getelementptr inbounds %struct.word, %struct.word* %25, i32 0, i32 1, !dbg !179
  %26 = load %struct.word*, %struct.word** %next17, align 8, !dbg !179
  store %struct.word* %26, %struct.word** %v, align 8, !dbg !180
  br label %for.cond18, !dbg !181

for.cond18:                                       ; preds = %for.inc28, %for.end
  %27 = load %struct.word*, %struct.word** %v, align 8, !dbg !182
  %tobool19 = icmp ne %struct.word* %27, null, !dbg !184
  br i1 %tobool19, label %for.body20, label %for.end30, !dbg !184

for.body20:                                       ; preds = %for.cond18
  %28 = load %struct.word*, %struct.word** %w, align 8, !dbg !185
  %w21 = getelementptr inbounds %struct.word, %struct.word* %28, i32 0, i32 0, !dbg !188
  %29 = load i8*, i8** %w21, align 8, !dbg !188
  %30 = load %struct.word*, %struct.word** %v, align 8, !dbg !189
  %w22 = getelementptr inbounds %struct.word, %struct.word* %30, i32 0, i32 0, !dbg !190
  %31 = load i8*, i8** %w22, align 8, !dbg !190
  %call23 = call i32 @deranged(i8* %29, i8* %31), !dbg !191
  %tobool24 = icmp ne i32 %call23, 0, !dbg !191
  br i1 %tobool24, label %if.then25, label %if.end27, !dbg !192, !cf.info !44

if.then25:                                        ; preds = %for.body20
  %32 = load %struct.word*, %struct.word** %v, align 8, !dbg !193
  %w26 = getelementptr inbounds %struct.word, %struct.word* %32, i32 0, i32 0, !dbg !194
  %33 = load i8*, i8** %w26, align 8, !dbg !194
  store i8* %33, i8** %retval, align 8, !dbg !195
  br label %return, !dbg !195

if.end27:                                         ; preds = %for.body20
  br label %for.inc28, !dbg !196

for.inc28:                                        ; preds = %if.end27
  %34 = load %struct.word*, %struct.word** %v, align 8, !dbg !197
  %next29 = getelementptr inbounds %struct.word, %struct.word* %34, i32 0, i32 1, !dbg !198
  %35 = load %struct.word*, %struct.word** %next29, align 8, !dbg !198
  store %struct.word* %35, %struct.word** %v, align 8, !dbg !199
  br label %for.cond18, !dbg !200, !llvm.loop !201

for.end30:                                        ; preds = %for.cond18
  store i8* null, i8** %retval, align 8, !dbg !203
  br label %return, !dbg !203

return:                                           ; preds = %for.end30, %if.then25
  %36 = load i8*, i8** %retval, align 8, !dbg !204
  ret i8* %36, !dbg !204
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !205 {
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
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !210, metadata !DIExpression()), !dbg !211
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata i32* %i, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32* %j, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 0, i32* %j, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata i8** %words, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !220, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !263, metadata !DIExpression()), !dbg !264
  %0 = load i32, i32* %c.addr, align 4, !dbg !265
  %cmp = icmp slt i32 %0, 2, !dbg !266
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !265

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !265

cond.false:                                       ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !267
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !267
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !267
  br label %cond.end, !dbg !265

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), %cond.true ], [ %2, %cond.false ], !dbg !265
  %call = call i32 (i8*, i32, ...) @open(i8* %cond, i32 0), !dbg !268
  store i32 %call, i32* %fd, align 4, !dbg !264
  %3 = load i32, i32* %fd, align 4, !dbg !269
  %call1 = call i32 @fstat(i32 %3, %struct.stat* %st) #5, !dbg !271
  %cmp2 = icmp slt i32 %call1, 0, !dbg !272
  br i1 %cmp2, label %if.then, label %if.end, !dbg !273, !cf.info !44

if.then:                                          ; preds = %cond.end
  store i32 1, i32* %retval, align 4, !dbg !274
  br label %return, !dbg !274

if.end:                                           ; preds = %cond.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !275
  %4 = load i64, i64* %st_size, align 8, !dbg !275
  %call3 = call noalias i8* @malloc(i64 %4) #5, !dbg !276
  store i8* %call3, i8** %words, align 8, !dbg !277
  %5 = load i32, i32* %fd, align 4, !dbg !278
  %6 = load i8*, i8** %words, align 8, !dbg !279
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !280
  %7 = load i64, i64* %st_size4, align 8, !dbg !280
  %call5 = call i64 @read(i32 %5, i8* %6, i64 %7), !dbg !281
  %8 = load i32, i32* %fd, align 4, !dbg !282
  %call6 = call i32 @close(i32 %8), !dbg !283
  call void @llvm.dbg.declare(metadata %union.node* %root, metadata !284, metadata !DIExpression()), !dbg !285
  %9 = bitcast %union.node* %root to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 8 %9, i8 0, i64 80, i1 false), !dbg !285
  call void @llvm.dbg.declare(metadata [26 x i8]* %cnt, metadata !286, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.declare(metadata i32* %best_len, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 0, i32* %best_len, align 4, !dbg !292
  call void @llvm.dbg.declare(metadata i8** %b1, metadata !293, metadata !DIExpression()), !dbg !294
  call void @llvm.dbg.declare(metadata i8** %b2, metadata !295, metadata !DIExpression()), !dbg !296
  store i32 0, i32* %i, align 4, !dbg !297
  br label %for.cond, !dbg !299

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i8*, i8** @freq, align 8, !dbg !300
  %11 = load i32, i32* %i, align 4, !dbg !302
  %idxprom = sext i32 %11 to i64, !dbg !300
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i64 %idxprom, !dbg !300
  %12 = load i8, i8* %arrayidx7, align 1, !dbg !300
  %tobool = icmp ne i8 %12, 0, !dbg !303
  br i1 %tobool, label %for.body, label %for.end, !dbg !303

for.body:                                         ; preds = %for.cond
  %13 = load i32, i32* %i, align 4, !dbg !304
  %14 = load i8*, i8** @freq, align 8, !dbg !305
  %15 = load i32, i32* %i, align 4, !dbg !306
  %idxprom8 = sext i32 %15 to i64, !dbg !305
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i64 %idxprom8, !dbg !305
  %16 = load i8, i8* %arrayidx9, align 1, !dbg !305
  %idxprom10 = zext i8 %16 to i64, !dbg !307
  %arrayidx11 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom10, !dbg !307
  store i32 %13, i32* %arrayidx11, align 4, !dbg !308
  br label %for.inc, !dbg !307

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !309
  %inc = add nsw i32 %17, 1, !dbg !309
  store i32 %inc, i32* %i, align 4, !dbg !309
  br label %for.cond, !dbg !310, !llvm.loop !311

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !313
  store i32 0, i32* %i, align 4, !dbg !315
  br label %for.cond12, !dbg !316

for.cond12:                                       ; preds = %for.inc42, %for.end
  %18 = load i32, i32* %i, align 4, !dbg !317
  %conv = sext i32 %18 to i64, !dbg !317
  %st_size13 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !319
  %19 = load i64, i64* %st_size13, align 8, !dbg !319
  %cmp14 = icmp slt i64 %conv, %19, !dbg !320
  br i1 %cmp14, label %for.body16, label %for.end44, !dbg !321

for.body16:                                       ; preds = %for.cond12
  %20 = load i8*, i8** %words, align 8, !dbg !322
  %21 = load i32, i32* %i, align 4, !dbg !325
  %idxprom17 = sext i32 %21 to i64, !dbg !322
  %arrayidx18 = getelementptr inbounds i8, i8* %20, i64 %idxprom17, !dbg !322
  %22 = load i8, i8* %arrayidx18, align 1, !dbg !322
  %conv19 = sext i8 %22 to i32, !dbg !322
  %cmp20 = icmp ne i32 %conv19, 10, !dbg !326
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !327, !cf.info !44

if.then22:                                        ; preds = %for.body16
  br label %for.inc42, !dbg !328

if.end23:                                         ; preds = %for.body16
  %23 = load i8*, i8** %words, align 8, !dbg !329
  %24 = load i32, i32* %i, align 4, !dbg !330
  %idxprom24 = sext i32 %24 to i64, !dbg !329
  %arrayidx25 = getelementptr inbounds i8, i8* %23, i64 %idxprom24, !dbg !329
  store i8 0, i8* %arrayidx25, align 1, !dbg !331
  %25 = load i32, i32* %i, align 4, !dbg !332
  %26 = load i32, i32* %j, align 4, !dbg !334
  %sub = sub nsw i32 %25, %26, !dbg !335
  %27 = load i32, i32* %best_len, align 4, !dbg !336
  %cmp26 = icmp sgt i32 %sub, %27, !dbg !337
  br i1 %cmp26, label %if.then28, label %if.end40, !dbg !338, !cf.info !44

if.then28:                                        ; preds = %if.end23
  %28 = load i8*, i8** %words, align 8, !dbg !339
  %29 = load i32, i32* %j, align 4, !dbg !341
  %idx.ext = sext i32 %29 to i64, !dbg !342
  %add.ptr = getelementptr inbounds i8, i8* %28, i64 %idx.ext, !dbg !342
  %arraydecay = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !343
  %call29 = call i32 @count_letters(i8* %add.ptr, i8* %arraydecay), !dbg !344
  call void @llvm.dbg.declare(metadata i8** %match, metadata !345, metadata !DIExpression()), !dbg !346
  %30 = load i8*, i8** %words, align 8, !dbg !347
  %31 = load i32, i32* %j, align 4, !dbg !348
  %idx.ext30 = sext i32 %31 to i64, !dbg !349
  %add.ptr31 = getelementptr inbounds i8, i8* %30, i64 %idx.ext30, !dbg !349
  %arraydecay32 = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !350
  %call33 = call i8* @insert(%union.node* %root, i8* %add.ptr31, i8* %arraydecay32), !dbg !351
  store i8* %call33, i8** %match, align 8, !dbg !346
  %32 = load i8*, i8** %match, align 8, !dbg !352
  %tobool34 = icmp ne i8* %32, null, !dbg !352
  br i1 %tobool34, label %if.then35, label %if.end39, !dbg !354, !cf.info !44

if.then35:                                        ; preds = %if.then28
  %33 = load i32, i32* %i, align 4, !dbg !355
  %34 = load i32, i32* %j, align 4, !dbg !357
  %sub36 = sub nsw i32 %33, %34, !dbg !358
  store i32 %sub36, i32* %best_len, align 4, !dbg !359
  %35 = load i8*, i8** %words, align 8, !dbg !360
  %36 = load i32, i32* %j, align 4, !dbg !361
  %idx.ext37 = sext i32 %36 to i64, !dbg !362
  %add.ptr38 = getelementptr inbounds i8, i8* %35, i64 %idx.ext37, !dbg !362
  store i8* %add.ptr38, i8** %b1, align 8, !dbg !363
  %37 = load i8*, i8** %match, align 8, !dbg !364
  store i8* %37, i8** %b2, align 8, !dbg !365
  br label %if.end39, !dbg !366

if.end39:                                         ; preds = %if.then35, %if.then28
  br label %if.end40, !dbg !367

if.end40:                                         ; preds = %if.end39, %if.end23
  %38 = load i32, i32* %i, align 4, !dbg !368
  %inc41 = add nsw i32 %38, 1, !dbg !368
  store i32 %inc41, i32* %i, align 4, !dbg !368
  store i32 %inc41, i32* %j, align 4, !dbg !369
  br label %for.inc42, !dbg !370

for.inc42:                                        ; preds = %if.end40, %if.then22
  %39 = load i32, i32* %i, align 4, !dbg !371
  %inc43 = add nsw i32 %39, 1, !dbg !371
  store i32 %inc43, i32* %i, align 4, !dbg !371
  br label %for.cond12, !dbg !372, !llvm.loop !373

for.end44:                                        ; preds = %for.cond12
  %40 = load i32, i32* %best_len, align 4, !dbg !375
  %tobool45 = icmp ne i32 %40, 0, !dbg !375
  br i1 %tobool45, label %if.then46, label %if.end48, !dbg !377, !cf.info !44

if.then46:                                        ; preds = %for.end44
  %41 = load i8*, i8** %b1, align 8, !dbg !378
  %42 = load i8*, i8** %b2, align 8, !dbg !379
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* %41, i8* %42), !dbg !380
  br label %if.end48, !dbg !380

if.end48:                                         ; preds = %if.then46, %for.end44
  store i32 0, i32* %retval, align 4, !dbg !381
  br label %return, !dbg !381

return:                                           ; preds = %if.end48, %if.then
  %43 = load i32, i32* %retval, align 4, !dbg !382
  ret i32 %43, !dbg !382
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
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
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!44 = !{!"if"}
!45 = !DILocation(line: 28, column: 23, scope: !38)
!46 = !DILocation(line: 28, column: 20, scope: !38)
!47 = !DILocation(line: 27, column: 22, scope: !34)
!48 = !DILocation(line: 27, column: 2, scope: !34)
!49 = distinct !{!49, !36, !50}
!50 = !DILocation(line: 28, column: 30, scope: !31)
!51 = !DILocation(line: 29, column: 2, scope: !21)
!52 = !DILocation(line: 30, column: 1, scope: !21)
!53 = distinct !DISubprogram(name: "count_letters", scope: !3, file: !3, line: 32, type: !54, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !14, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!57 = !DILocalVariable(name: "s", arg: 1, scope: !53, file: !3, line: 32, type: !14)
!58 = !DILocation(line: 32, column: 31, scope: !53)
!59 = !DILocalVariable(name: "c", arg: 2, scope: !53, file: !3, line: 32, type: !56)
!60 = !DILocation(line: 32, column: 49, scope: !53)
!61 = !DILocalVariable(name: "i", scope: !53, file: !3, line: 34, type: !11)
!62 = !DILocation(line: 34, column: 6, scope: !53)
!63 = !DILocalVariable(name: "len", scope: !53, file: !3, line: 34, type: !11)
!64 = !DILocation(line: 34, column: 9, scope: !53)
!65 = !DILocation(line: 35, column: 9, scope: !53)
!66 = !DILocation(line: 35, column: 2, scope: !53)
!67 = !DILocation(line: 36, column: 15, scope: !68)
!68 = distinct !DILexicalBlock(scope: !53, file: !3, line: 36, column: 2)
!69 = !DILocation(line: 36, column: 11, scope: !68)
!70 = !DILocation(line: 36, column: 7, scope: !68)
!71 = !DILocation(line: 36, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 36, column: 2)
!73 = !DILocation(line: 36, column: 22, scope: !72)
!74 = !DILocation(line: 36, column: 2, scope: !68)
!75 = !DILocation(line: 37, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !3, line: 37, column: 7)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 36, column: 31)
!78 = !DILocation(line: 37, column: 9, scope: !76)
!79 = !DILocation(line: 37, column: 12, scope: !76)
!80 = !DILocation(line: 37, column: 18, scope: !76)
!81 = !DILocation(line: 37, column: 21, scope: !76)
!82 = !DILocation(line: 37, column: 23, scope: !76)
!83 = !DILocation(line: 37, column: 26, scope: !76)
!84 = !DILocation(line: 37, column: 7, scope: !77)
!85 = !DILocation(line: 38, column: 4, scope: !76)
!86 = !DILocation(line: 39, column: 6, scope: !77)
!87 = !DILocation(line: 39, column: 10, scope: !77)
!88 = !DILocation(line: 39, column: 39, scope: !77)
!89 = !DILocation(line: 39, column: 41, scope: !77)
!90 = !DILocation(line: 39, column: 12, scope: !77)
!91 = !DILocation(line: 39, column: 45, scope: !77)
!92 = !DILocation(line: 40, column: 2, scope: !77)
!93 = !DILocation(line: 36, column: 27, scope: !72)
!94 = !DILocation(line: 36, column: 2, scope: !72)
!95 = distinct !{!95, !74, !96}
!96 = !DILocation(line: 40, column: 2, scope: !68)
!97 = !DILocation(line: 41, column: 9, scope: !53)
!98 = !DILocation(line: 41, column: 2, scope: !53)
!99 = !DILocation(line: 42, column: 1, scope: !53)
!100 = distinct !DISubprogram(name: "insert", scope: !3, file: !3, line: 44, type: !101, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!14, !103, !14, !56}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "node", file: !3, line: 19, size: 640, elements: !105)
!105 = !{!106, !110}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "down", scope: !104, file: !3, line: 20, baseType: !107, size: 640)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 640, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 10)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !104, file: !3, line: 21, baseType: !111, size: 640)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !112, size: 640, elements: !108)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "word", file: !3, line: 14, size: 128, elements: !114)
!114 = !{!115, !116}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !113, file: !3, line: 15, baseType: !14, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !113, file: !3, line: 16, baseType: !112, size: 64, offset: 64)
!117 = !DILocalVariable(name: "root", arg: 1, scope: !100, file: !3, line: 44, type: !103)
!118 = !DILocation(line: 44, column: 33, scope: !100)
!119 = !DILocalVariable(name: "s", arg: 2, scope: !100, file: !3, line: 44, type: !14)
!120 = !DILocation(line: 44, column: 51, scope: !100)
!121 = !DILocalVariable(name: "cnt", arg: 3, scope: !100, file: !3, line: 44, type: !56)
!122 = !DILocation(line: 44, column: 69, scope: !100)
!123 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 46, type: !11)
!124 = !DILocation(line: 46, column: 6, scope: !100)
!125 = !DILocalVariable(name: "n", scope: !100, file: !3, line: 47, type: !103)
!126 = !DILocation(line: 47, column: 14, scope: !100)
!127 = !DILocalVariable(name: "v", scope: !100, file: !3, line: 48, type: !112)
!128 = !DILocation(line: 48, column: 15, scope: !100)
!129 = !DILocalVariable(name: "w", scope: !100, file: !3, line: 48, type: !112)
!130 = !DILocation(line: 48, column: 19, scope: !100)
!131 = !DILocation(line: 50, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !100, file: !3, line: 50, column: 2)
!133 = !DILocation(line: 50, column: 7, scope: !132)
!134 = !DILocation(line: 50, column: 14, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !3, line: 50, column: 2)
!136 = !DILocation(line: 50, column: 16, scope: !135)
!137 = !DILocation(line: 50, column: 2, scope: !132)
!138 = !DILocation(line: 51, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 51, column: 7)
!140 = distinct !DILexicalBlock(scope: !135, file: !3, line: 50, column: 37)
!141 = !DILocation(line: 51, column: 19, scope: !139)
!142 = !DILocation(line: 51, column: 24, scope: !139)
!143 = !DILocation(line: 51, column: 28, scope: !139)
!144 = !DILocation(line: 51, column: 11, scope: !139)
!145 = !DILocation(line: 51, column: 7, scope: !140)
!146 = !DILocation(line: 52, column: 29, scope: !139)
!147 = !DILocation(line: 52, column: 27, scope: !139)
!148 = !DILocation(line: 52, column: 4, scope: !139)
!149 = !DILocation(line: 52, column: 10, scope: !139)
!150 = !DILocation(line: 52, column: 15, scope: !139)
!151 = !DILocation(line: 52, column: 19, scope: !139)
!152 = !DILocation(line: 52, column: 23, scope: !139)
!153 = !DILocation(line: 53, column: 2, scope: !140)
!154 = !DILocation(line: 50, column: 23, scope: !135)
!155 = !DILocation(line: 50, column: 34, scope: !135)
!156 = !DILocation(line: 50, column: 32, scope: !135)
!157 = !DILocation(line: 50, column: 2, scope: !135)
!158 = distinct !{!158, !137, !159}
!159 = !DILocation(line: 53, column: 2, scope: !132)
!160 = !DILocation(line: 55, column: 6, scope: !100)
!161 = !DILocation(line: 55, column: 4, scope: !100)
!162 = !DILocation(line: 56, column: 9, scope: !100)
!163 = !DILocation(line: 56, column: 2, scope: !100)
!164 = !DILocation(line: 56, column: 5, scope: !100)
!165 = !DILocation(line: 56, column: 7, scope: !100)
!166 = !DILocation(line: 57, column: 12, scope: !100)
!167 = !DILocation(line: 57, column: 18, scope: !100)
!168 = !DILocation(line: 57, column: 23, scope: !100)
!169 = !DILocation(line: 57, column: 2, scope: !100)
!170 = !DILocation(line: 57, column: 5, scope: !100)
!171 = !DILocation(line: 57, column: 10, scope: !100)
!172 = !DILocation(line: 58, column: 24, scope: !100)
!173 = !DILocation(line: 58, column: 2, scope: !100)
!174 = !DILocation(line: 58, column: 8, scope: !100)
!175 = !DILocation(line: 58, column: 13, scope: !100)
!176 = !DILocation(line: 58, column: 22, scope: !100)
!177 = !DILocation(line: 60, column: 11, scope: !178)
!178 = distinct !DILexicalBlock(scope: !100, file: !3, line: 60, column: 2)
!179 = !DILocation(line: 60, column: 14, scope: !178)
!180 = !DILocation(line: 60, column: 9, scope: !178)
!181 = !DILocation(line: 60, column: 7, scope: !178)
!182 = !DILocation(line: 60, column: 20, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !3, line: 60, column: 2)
!184 = !DILocation(line: 60, column: 2, scope: !178)
!185 = !DILocation(line: 61, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !3, line: 61, column: 7)
!187 = distinct !DILexicalBlock(scope: !183, file: !3, line: 60, column: 36)
!188 = !DILocation(line: 61, column: 19, scope: !186)
!189 = !DILocation(line: 61, column: 22, scope: !186)
!190 = !DILocation(line: 61, column: 25, scope: !186)
!191 = !DILocation(line: 61, column: 7, scope: !186)
!192 = !DILocation(line: 61, column: 7, scope: !187)
!193 = !DILocation(line: 62, column: 11, scope: !186)
!194 = !DILocation(line: 62, column: 14, scope: !186)
!195 = !DILocation(line: 62, column: 4, scope: !186)
!196 = !DILocation(line: 63, column: 2, scope: !187)
!197 = !DILocation(line: 60, column: 27, scope: !183)
!198 = !DILocation(line: 60, column: 30, scope: !183)
!199 = !DILocation(line: 60, column: 25, scope: !183)
!200 = !DILocation(line: 60, column: 2, scope: !183)
!201 = distinct !{!201, !184, !202}
!202 = !DILocation(line: 63, column: 2, scope: !178)
!203 = !DILocation(line: 64, column: 2, scope: !100)
!204 = !DILocation(line: 65, column: 1, scope: !100)
!205 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 67, type: !206, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DISubroutineType(types: !207)
!207 = !{!11, !11, !208}
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!210 = !DILocalVariable(name: "c", arg: 1, scope: !205, file: !3, line: 67, type: !11)
!211 = !DILocation(line: 67, column: 14, scope: !205)
!212 = !DILocalVariable(name: "v", arg: 2, scope: !205, file: !3, line: 67, type: !208)
!213 = !DILocation(line: 67, column: 24, scope: !205)
!214 = !DILocalVariable(name: "i", scope: !205, file: !3, line: 69, type: !11)
!215 = !DILocation(line: 69, column: 6, scope: !205)
!216 = !DILocalVariable(name: "j", scope: !205, file: !3, line: 69, type: !11)
!217 = !DILocation(line: 69, column: 9, scope: !205)
!218 = !DILocalVariable(name: "words", scope: !205, file: !3, line: 70, type: !209)
!219 = !DILocation(line: 70, column: 8, scope: !205)
!220 = !DILocalVariable(name: "st", scope: !205, file: !3, line: 71, type: !221)
!221 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !222, line: 46, size: 1152, elements: !223)
!222 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!223 = !{!224, !228, !230, !232, !235, !237, !239, !240, !241, !244, !246, !248, !256, !257, !258}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !221, file: !222, line: 48, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !226, line: 145, baseType: !227)
!226 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!227 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !221, file: !222, line: 53, baseType: !229, size: 64, offset: 64)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !226, line: 148, baseType: !227)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !221, file: !222, line: 61, baseType: !231, size: 64, offset: 128)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !226, line: 151, baseType: !227)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !221, file: !222, line: 62, baseType: !233, size: 32, offset: 192)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !226, line: 150, baseType: !234)
!234 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !221, file: !222, line: 64, baseType: !236, size: 32, offset: 224)
!236 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !226, line: 146, baseType: !234)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !221, file: !222, line: 65, baseType: !238, size: 32, offset: 256)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !226, line: 147, baseType: !234)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !221, file: !222, line: 67, baseType: !11, size: 32, offset: 288)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !221, file: !222, line: 69, baseType: !225, size: 64, offset: 320)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !221, file: !222, line: 74, baseType: !242, size: 64, offset: 384)
!242 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !226, line: 152, baseType: !243)
!243 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !221, file: !222, line: 78, baseType: !245, size: 64, offset: 448)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !226, line: 174, baseType: !243)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !221, file: !222, line: 80, baseType: !247, size: 64, offset: 512)
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !226, line: 179, baseType: !243)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !221, file: !222, line: 91, baseType: !249, size: 128, offset: 576)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !250, line: 10, size: 128, elements: !251)
!250 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!251 = !{!252, !254}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !249, file: !250, line: 12, baseType: !253, size: 64)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !226, line: 160, baseType: !243)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !249, file: !250, line: 16, baseType: !255, size: 64, offset: 64)
!255 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !226, line: 196, baseType: !243)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !221, file: !222, line: 92, baseType: !249, size: 128, offset: 704)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !221, file: !222, line: 93, baseType: !249, size: 128, offset: 832)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !221, file: !222, line: 106, baseType: !259, size: 192, offset: 960)
!259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !255, size: 192, elements: !260)
!260 = !{!261}
!261 = !DISubrange(count: 3)
!262 = !DILocation(line: 71, column: 14, scope: !205)
!263 = !DILocalVariable(name: "fd", scope: !205, file: !3, line: 73, type: !11)
!264 = !DILocation(line: 73, column: 6, scope: !205)
!265 = !DILocation(line: 73, column: 16, scope: !205)
!266 = !DILocation(line: 73, column: 18, scope: !205)
!267 = !DILocation(line: 73, column: 41, scope: !205)
!268 = !DILocation(line: 73, column: 11, scope: !205)
!269 = !DILocation(line: 74, column: 12, scope: !270)
!270 = distinct !DILexicalBlock(scope: !205, file: !3, line: 74, column: 6)
!271 = !DILocation(line: 74, column: 6, scope: !270)
!272 = !DILocation(line: 74, column: 21, scope: !270)
!273 = !DILocation(line: 74, column: 6, scope: !205)
!274 = !DILocation(line: 74, column: 26, scope: !270)
!275 = !DILocation(line: 76, column: 20, scope: !205)
!276 = !DILocation(line: 76, column: 10, scope: !205)
!277 = !DILocation(line: 76, column: 8, scope: !205)
!278 = !DILocation(line: 77, column: 7, scope: !205)
!279 = !DILocation(line: 77, column: 11, scope: !205)
!280 = !DILocation(line: 77, column: 21, scope: !205)
!281 = !DILocation(line: 77, column: 2, scope: !205)
!282 = !DILocation(line: 78, column: 8, scope: !205)
!283 = !DILocation(line: 78, column: 2, scope: !205)
!284 = !DILocalVariable(name: "root", scope: !205, file: !3, line: 80, type: !104)
!285 = !DILocation(line: 80, column: 13, scope: !205)
!286 = !DILocalVariable(name: "cnt", scope: !205, file: !3, line: 81, type: !287)
!287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 208, elements: !288)
!288 = !{!289}
!289 = !DISubrange(count: 26)
!290 = !DILocation(line: 81, column: 16, scope: !205)
!291 = !DILocalVariable(name: "best_len", scope: !205, file: !3, line: 82, type: !11)
!292 = !DILocation(line: 82, column: 6, scope: !205)
!293 = !DILocalVariable(name: "b1", scope: !205, file: !3, line: 83, type: !14)
!294 = !DILocation(line: 83, column: 14, scope: !205)
!295 = !DILocalVariable(name: "b2", scope: !205, file: !3, line: 83, type: !14)
!296 = !DILocation(line: 83, column: 19, scope: !205)
!297 = !DILocation(line: 85, column: 9, scope: !298)
!298 = distinct !DILexicalBlock(scope: !205, file: !3, line: 85, column: 2)
!299 = !DILocation(line: 85, column: 7, scope: !298)
!300 = !DILocation(line: 85, column: 14, scope: !301)
!301 = distinct !DILexicalBlock(scope: !298, file: !3, line: 85, column: 2)
!302 = !DILocation(line: 85, column: 19, scope: !301)
!303 = !DILocation(line: 85, column: 2, scope: !298)
!304 = !DILocation(line: 86, column: 41, scope: !301)
!305 = !DILocation(line: 86, column: 30, scope: !301)
!306 = !DILocation(line: 86, column: 35, scope: !301)
!307 = !DILocation(line: 86, column: 3, scope: !301)
!308 = !DILocation(line: 86, column: 39, scope: !301)
!309 = !DILocation(line: 85, column: 24, scope: !301)
!310 = !DILocation(line: 85, column: 2, scope: !301)
!311 = distinct !{!311, !303, !312}
!312 = !DILocation(line: 86, column: 41, scope: !298)
!313 = !DILocation(line: 89, column: 13, scope: !314)
!314 = distinct !DILexicalBlock(scope: !205, file: !3, line: 89, column: 2)
!315 = !DILocation(line: 89, column: 9, scope: !314)
!316 = !DILocation(line: 89, column: 7, scope: !314)
!317 = !DILocation(line: 89, column: 18, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !3, line: 89, column: 2)
!319 = !DILocation(line: 89, column: 25, scope: !318)
!320 = !DILocation(line: 89, column: 20, scope: !318)
!321 = !DILocation(line: 89, column: 2, scope: !314)
!322 = !DILocation(line: 90, column: 7, scope: !323)
!323 = distinct !DILexicalBlock(scope: !324, file: !3, line: 90, column: 7)
!324 = distinct !DILexicalBlock(scope: !318, file: !3, line: 89, column: 39)
!325 = !DILocation(line: 90, column: 13, scope: !323)
!326 = !DILocation(line: 90, column: 16, scope: !323)
!327 = !DILocation(line: 90, column: 7, scope: !324)
!328 = !DILocation(line: 90, column: 25, scope: !323)
!329 = !DILocation(line: 91, column: 3, scope: !324)
!330 = !DILocation(line: 91, column: 9, scope: !324)
!331 = !DILocation(line: 91, column: 12, scope: !324)
!332 = !DILocation(line: 93, column: 7, scope: !333)
!333 = distinct !DILexicalBlock(scope: !324, file: !3, line: 93, column: 7)
!334 = !DILocation(line: 93, column: 11, scope: !333)
!335 = !DILocation(line: 93, column: 9, scope: !333)
!336 = !DILocation(line: 93, column: 15, scope: !333)
!337 = !DILocation(line: 93, column: 13, scope: !333)
!338 = !DILocation(line: 93, column: 7, scope: !324)
!339 = !DILocation(line: 94, column: 18, scope: !340)
!340 = distinct !DILexicalBlock(scope: !333, file: !3, line: 93, column: 25)
!341 = !DILocation(line: 94, column: 26, scope: !340)
!342 = !DILocation(line: 94, column: 24, scope: !340)
!343 = !DILocation(line: 94, column: 29, scope: !340)
!344 = !DILocation(line: 94, column: 4, scope: !340)
!345 = !DILocalVariable(name: "match", scope: !340, file: !3, line: 95, type: !14)
!346 = !DILocation(line: 95, column: 16, scope: !340)
!347 = !DILocation(line: 95, column: 38, scope: !340)
!348 = !DILocation(line: 95, column: 46, scope: !340)
!349 = !DILocation(line: 95, column: 44, scope: !340)
!350 = !DILocation(line: 95, column: 49, scope: !340)
!351 = !DILocation(line: 95, column: 24, scope: !340)
!352 = !DILocation(line: 97, column: 8, scope: !353)
!353 = distinct !DILexicalBlock(scope: !340, file: !3, line: 97, column: 8)
!354 = !DILocation(line: 97, column: 8, scope: !340)
!355 = !DILocation(line: 98, column: 16, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !3, line: 97, column: 15)
!357 = !DILocation(line: 98, column: 20, scope: !356)
!358 = !DILocation(line: 98, column: 18, scope: !356)
!359 = !DILocation(line: 98, column: 14, scope: !356)
!360 = !DILocation(line: 99, column: 10, scope: !356)
!361 = !DILocation(line: 99, column: 18, scope: !356)
!362 = !DILocation(line: 99, column: 16, scope: !356)
!363 = !DILocation(line: 99, column: 8, scope: !356)
!364 = !DILocation(line: 100, column: 10, scope: !356)
!365 = !DILocation(line: 100, column: 8, scope: !356)
!366 = !DILocation(line: 101, column: 4, scope: !356)
!367 = !DILocation(line: 102, column: 3, scope: !340)
!368 = !DILocation(line: 104, column: 7, scope: !324)
!369 = !DILocation(line: 104, column: 5, scope: !324)
!370 = !DILocation(line: 105, column: 2, scope: !324)
!371 = !DILocation(line: 89, column: 35, scope: !318)
!372 = !DILocation(line: 89, column: 2, scope: !318)
!373 = distinct !{!373, !321, !374}
!374 = !DILocation(line: 105, column: 2, scope: !314)
!375 = !DILocation(line: 107, column: 6, scope: !376)
!376 = distinct !DILexicalBlock(scope: !205, file: !3, line: 107, column: 6)
!377 = !DILocation(line: 107, column: 6, scope: !205)
!378 = !DILocation(line: 107, column: 55, scope: !376)
!379 = !DILocation(line: 107, column: 59, scope: !376)
!380 = !DILocation(line: 107, column: 16, scope: !376)
!381 = !DILocation(line: 109, column: 2, scope: !205)
!382 = !DILocation(line: 110, column: 1, scope: !205)
