; ModuleID = 'anagrams-deranged-anagrams.ll'
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
  call void @llvm.dbg.value(metadata i8* %s1, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i8* %s2, metadata !26, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i32 0, metadata !27, metadata !DIExpression()), !dbg !25
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !30
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !27, metadata !DIExpression()), !dbg !25
  %idxprom = sext i32 %i.0 to i64, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %s1, i64 %idxprom, !dbg !31
  %0 = load i8, i8* %arrayidx, align 1, !dbg !31
  %tobool = icmp ne i8 %0, 0, !dbg !33
  br i1 %tobool, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %idxprom1 = sext i32 %i.0 to i64, !dbg !34
  %arrayidx2 = getelementptr inbounds i8, i8* %s1, i64 %idxprom1, !dbg !34
  %1 = load i8, i8* %arrayidx2, align 1, !dbg !34
  %conv = sext i8 %1 to i32, !dbg !34
  %idxprom3 = sext i32 %i.0 to i64, !dbg !36
  %arrayidx4 = getelementptr inbounds i8, i8* %s2, i64 %idxprom3, !dbg !36
  %2 = load i8, i8* %arrayidx4, align 1, !dbg !36
  %conv5 = sext i8 %2 to i32, !dbg !36
  %cmp = icmp eq i32 %conv, %conv5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %for.body
  br label %return, !dbg !39

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !41
  call void @llvm.dbg.value(metadata i32 %inc, metadata !27, metadata !DIExpression()), !dbg !25
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !45

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 1, %for.end ], !dbg !25
  ret i32 %retval.0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count_letters(i8* %s, i8* %c) #0 !dbg !47 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i8* %c, metadata !53, metadata !DIExpression()), !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 1 %c, i8 0, i64 26, i1 false), !dbg !54
  call void @llvm.dbg.value(metadata i32 0, metadata !55, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 0, metadata !56, metadata !DIExpression()), !dbg !52
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc ], !dbg !59
  %len.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !59
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !56, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !55, metadata !DIExpression()), !dbg !52
  %idxprom = sext i32 %i.0 to i64, !dbg !60
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !60
  %0 = load i8, i8* %arrayidx, align 1, !dbg !60
  %tobool = icmp ne i8 %0, 0, !dbg !62
  br i1 %tobool, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %idxprom1 = sext i32 %i.0 to i64, !dbg !63
  %arrayidx2 = getelementptr inbounds i8, i8* %s, i64 %idxprom1, !dbg !63
  %1 = load i8, i8* %arrayidx2, align 1, !dbg !63
  %conv = sext i8 %1 to i32, !dbg !63
  %cmp = icmp slt i32 %conv, 97, !dbg !66
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !67

lor.lhs.false:                                    ; preds = %for.body
  %idxprom4 = sext i32 %i.0 to i64, !dbg !68
  %arrayidx5 = getelementptr inbounds i8, i8* %s, i64 %idxprom4, !dbg !68
  %2 = load i8, i8* %arrayidx5, align 1, !dbg !68
  %conv6 = sext i8 %2 to i32, !dbg !68
  %cmp7 = icmp sgt i32 %conv6, 122, !dbg !69
  br i1 %cmp7, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %return, !dbg !71

if.end:                                           ; preds = %lor.lhs.false
  %inc = add nsw i32 %len.0, 1, !dbg !72
  call void @llvm.dbg.value(metadata i32 %inc, metadata !56, metadata !DIExpression()), !dbg !52
  %idxprom9 = sext i32 %i.0 to i64, !dbg !73
  %arrayidx10 = getelementptr inbounds i8, i8* %s, i64 %idxprom9, !dbg !73
  %3 = load i8, i8* %arrayidx10, align 1, !dbg !73
  %idxprom11 = zext i8 %3 to i64, !dbg !74
  %arrayidx12 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom11, !dbg !74
  %4 = load i32, i32* %arrayidx12, align 4, !dbg !74
  %idxprom13 = sext i32 %4 to i64, !dbg !75
  %arrayidx14 = getelementptr inbounds i8, i8* %c, i64 %idxprom13, !dbg !75
  %5 = load i8, i8* %arrayidx14, align 1, !dbg !76
  %inc15 = add i8 %5, 1, !dbg !76
  store i8 %inc15, i8* %arrayidx14, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %if.end
  %inc16 = add nsw i32 %i.0, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %inc16, metadata !55, metadata !DIExpression()), !dbg !52
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !82

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %len.0, %for.end ], !dbg !52
  ret i32 %retval.0, !dbg !83
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @insert(%union.node* %root, i8* %s, i8* %cnt) #0 !dbg !84 {
entry:
  call void @llvm.dbg.value(metadata %union.node* %root, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i8* %s, metadata !103, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i8* %cnt, metadata !104, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata %struct.word* null, metadata !105, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 0, metadata !106, metadata !DIExpression()), !dbg !102
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !109
  %root.addr.0 = phi %union.node* [ %root, %entry ], [ %n.0, %for.inc ]
  call void @llvm.dbg.value(metadata %union.node* %root.addr.0, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !106, metadata !DIExpression()), !dbg !102
  %cmp = icmp slt i32 %i.0, 25, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %down = bitcast %union.node* %root.addr.0 to [10 x %union.node*]*, !dbg !113
  %idxprom = sext i32 %i.0 to i64, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %cnt, i64 %idxprom, !dbg !116
  %0 = load i8, i8* %arrayidx, align 1, !dbg !116
  %idxprom1 = zext i8 %0 to i64, !dbg !117
  %arrayidx2 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down, i64 0, i64 %idxprom1, !dbg !117
  %1 = load %union.node*, %union.node** %arrayidx2, align 8, !dbg !117
  call void @llvm.dbg.value(metadata %union.node* %1, metadata !118, metadata !DIExpression()), !dbg !102
  %tobool = icmp ne %union.node* %1, null, !dbg !119
  br i1 %tobool, label %if.end, label %if.then, !dbg !120

if.then:                                          ; preds = %for.body
  %call = call noalias i8* @calloc(i64 1, i64 80) #5, !dbg !121
  %2 = bitcast i8* %call to %union.node*, !dbg !121
  call void @llvm.dbg.value(metadata %union.node* %2, metadata !118, metadata !DIExpression()), !dbg !102
  %down3 = bitcast %union.node* %root.addr.0 to [10 x %union.node*]*, !dbg !122
  %idxprom4 = sext i32 %i.0 to i64, !dbg !123
  %arrayidx5 = getelementptr inbounds i8, i8* %cnt, i64 %idxprom4, !dbg !123
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !123
  %idxprom6 = zext i8 %3 to i64, !dbg !124
  %arrayidx7 = getelementptr inbounds [10 x %union.node*], [10 x %union.node*]* %down3, i64 0, i64 %idxprom6, !dbg !124
  store %union.node* %2, %union.node** %arrayidx7, align 8, !dbg !125
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %for.body
  %n.0 = phi %union.node* [ %1, %for.body ], [ %2, %if.then ], !dbg !126
  call void @llvm.dbg.value(metadata %union.node* %n.0, metadata !118, metadata !DIExpression()), !dbg !102
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !128
  call void @llvm.dbg.value(metadata i32 %inc, metadata !106, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata %union.node* %n.0, metadata !101, metadata !DIExpression()), !dbg !102
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %call8 = call noalias i8* @malloc(i64 16) #5, !dbg !132
  %4 = bitcast i8* %call8 to %struct.word*, !dbg !132
  call void @llvm.dbg.value(metadata %struct.word* %4, metadata !105, metadata !DIExpression()), !dbg !102
  %w9 = getelementptr inbounds %struct.word, %struct.word* %4, i32 0, i32 0, !dbg !133
  store i8* %s, i8** %w9, align 8, !dbg !134
  %list = bitcast %union.node* %root.addr.0 to [10 x %struct.word*]*, !dbg !135
  %arrayidx10 = getelementptr inbounds i8, i8* %cnt, i64 25, !dbg !136
  %5 = load i8, i8* %arrayidx10, align 1, !dbg !136
  %idxprom11 = zext i8 %5 to i64, !dbg !137
  %arrayidx12 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list, i64 0, i64 %idxprom11, !dbg !137
  %6 = load %struct.word*, %struct.word** %arrayidx12, align 8, !dbg !137
  %next = getelementptr inbounds %struct.word, %struct.word* %4, i32 0, i32 1, !dbg !138
  store %struct.word* %6, %struct.word** %next, align 8, !dbg !139
  %list13 = bitcast %union.node* %root.addr.0 to [10 x %struct.word*]*, !dbg !140
  %arrayidx14 = getelementptr inbounds i8, i8* %cnt, i64 25, !dbg !141
  %7 = load i8, i8* %arrayidx14, align 1, !dbg !141
  %idxprom15 = zext i8 %7 to i64, !dbg !142
  %arrayidx16 = getelementptr inbounds [10 x %struct.word*], [10 x %struct.word*]* %list13, i64 0, i64 %idxprom15, !dbg !142
  store %struct.word* %4, %struct.word** %arrayidx16, align 8, !dbg !143
  %next17 = getelementptr inbounds %struct.word, %struct.word* %4, i32 0, i32 1, !dbg !144
  %8 = load %struct.word*, %struct.word** %next17, align 8, !dbg !144
  call void @llvm.dbg.value(metadata %struct.word* %8, metadata !146, metadata !DIExpression()), !dbg !102
  br label %for.cond18, !dbg !147

for.cond18:                                       ; preds = %for.inc28, %for.end
  %v.0 = phi %struct.word* [ %8, %for.end ], [ %12, %for.inc28 ], !dbg !148
  call void @llvm.dbg.value(metadata %struct.word* %v.0, metadata !146, metadata !DIExpression()), !dbg !102
  %tobool19 = icmp ne %struct.word* %v.0, null, !dbg !149
  br i1 %tobool19, label %for.body20, label %for.end30, !dbg !149

for.body20:                                       ; preds = %for.cond18
  %w21 = getelementptr inbounds %struct.word, %struct.word* %4, i32 0, i32 0, !dbg !150
  %9 = load i8*, i8** %w21, align 8, !dbg !150
  %w22 = getelementptr inbounds %struct.word, %struct.word* %v.0, i32 0, i32 0, !dbg !154
  %10 = load i8*, i8** %w22, align 8, !dbg !154
  %call23 = call i32 @deranged(i8* %9, i8* %10), !dbg !155
  %tobool24 = icmp ne i32 %call23, 0, !dbg !155
  br i1 %tobool24, label %if.then25, label %if.end27, !dbg !156

if.then25:                                        ; preds = %for.body20
  %w26 = getelementptr inbounds %struct.word, %struct.word* %v.0, i32 0, i32 0, !dbg !157
  %11 = load i8*, i8** %w26, align 8, !dbg !157
  br label %return, !dbg !158

if.end27:                                         ; preds = %for.body20
  br label %for.inc28, !dbg !159

for.inc28:                                        ; preds = %if.end27
  %next29 = getelementptr inbounds %struct.word, %struct.word* %v.0, i32 0, i32 1, !dbg !160
  %12 = load %struct.word*, %struct.word** %next29, align 8, !dbg !160
  call void @llvm.dbg.value(metadata %struct.word* %12, metadata !146, metadata !DIExpression()), !dbg !102
  br label %for.cond18, !dbg !161, !llvm.loop !162

for.end30:                                        ; preds = %for.cond18
  br label %return, !dbg !164

return:                                           ; preds = %for.end30, %if.then25
  %retval.0 = phi i8* [ %11, %if.then25 ], [ null, %for.end30 ], !dbg !102
  ret i8* %retval.0, !dbg !165
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !166 {
entry:
  %st = alloca %struct.stat, align 8
  %root = alloca %union.node, align 8
  %cnt = alloca [26 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %c, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8** %v, metadata !173, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 0, metadata !174, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !175, metadata !DIExpression()), !dbg !217
  %cmp = icmp slt i32 %c, 2, !dbg !218
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !219

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !219

cond.false:                                       ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 1, !dbg !220
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !220
  br label %cond.end, !dbg !219

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), %cond.true ], [ %0, %cond.false ], !dbg !219
  %call = call i32 (i8*, i32, ...) @open(i8* %cond, i32 0), !dbg !221
  call void @llvm.dbg.value(metadata i32 %call, metadata !222, metadata !DIExpression()), !dbg !172
  %call1 = call i32 @fstat(i32 %call, %struct.stat* %st) #5, !dbg !223
  %cmp2 = icmp slt i32 %call1, 0, !dbg !225
  br i1 %cmp2, label %if.then, label %if.end, !dbg !226

if.then:                                          ; preds = %cond.end
  br label %return, !dbg !227

if.end:                                           ; preds = %cond.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !228
  %1 = load i64, i64* %st_size, align 8, !dbg !228
  %call3 = call noalias i8* @malloc(i64 %1) #5, !dbg !229
  call void @llvm.dbg.value(metadata i8* %call3, metadata !230, metadata !DIExpression()), !dbg !172
  %st_size4 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !231
  %2 = load i64, i64* %st_size4, align 8, !dbg !231
  %call5 = call i64 @read(i32 %call, i8* %call3, i64 %2), !dbg !232
  %call6 = call i32 @close(i32 %call), !dbg !233
  call void @llvm.dbg.declare(metadata %union.node* %root, metadata !234, metadata !DIExpression()), !dbg !235
  %3 = bitcast %union.node* %root to i8*, !dbg !235
  call void @llvm.memset.p0i8.i64(i8* align 8 %3, i8 0, i64 80, i1 false), !dbg !235
  call void @llvm.dbg.declare(metadata [26 x i8]* %cnt, metadata !236, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.value(metadata i32 0, metadata !241, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 0, metadata !242, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !245
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !242, metadata !DIExpression()), !dbg !172
  %4 = load i8*, i8** @freq, align 8, !dbg !246
  %idxprom = sext i32 %i.0 to i64, !dbg !246
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !246
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !246
  %tobool = icmp ne i8 %5, 0, !dbg !248
  br i1 %tobool, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** @freq, align 8, !dbg !249
  %idxprom8 = sext i32 %i.0 to i64, !dbg !249
  %arrayidx9 = getelementptr inbounds i8, i8* %6, i64 %idxprom8, !dbg !249
  %7 = load i8, i8* %arrayidx9, align 1, !dbg !249
  %idxprom10 = zext i8 %7 to i64, !dbg !250
  %arrayidx11 = getelementptr inbounds [128 x i32], [128 x i32]* @char_to_idx, i64 0, i64 %idxprom10, !dbg !250
  store i32 %i.0, i32* %arrayidx11, align 4, !dbg !251
  br label %for.inc, !dbg !250

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !252
  call void @llvm.dbg.value(metadata i32 %inc, metadata !242, metadata !DIExpression()), !dbg !172
  br label %for.cond, !dbg !253, !llvm.loop !254

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !174, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 0, metadata !242, metadata !DIExpression()), !dbg !172
  br label %for.cond12, !dbg !256

for.cond12:                                       ; preds = %for.inc42, %for.end
  %best_len.0 = phi i32 [ 0, %for.end ], [ %best_len.3, %for.inc42 ], !dbg !258
  %j.0 = phi i32 [ 0, %for.end ], [ %j.1, %for.inc42 ], !dbg !259
  %i.1 = phi i32 [ 0, %for.end ], [ %inc43, %for.inc42 ], !dbg !260
  %b1.0 = phi i8* [ undef, %for.end ], [ %b1.3, %for.inc42 ]
  %b2.0 = phi i8* [ undef, %for.end ], [ %b2.3, %for.inc42 ]
  call void @llvm.dbg.value(metadata i8* %b2.0, metadata !261, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8* %b1.0, metadata !262, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !242, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !174, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %best_len.0, metadata !241, metadata !DIExpression()), !dbg !172
  %conv = sext i32 %i.1 to i64, !dbg !263
  %st_size13 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8, !dbg !265
  %8 = load i64, i64* %st_size13, align 8, !dbg !265
  %cmp14 = icmp slt i64 %conv, %8, !dbg !266
  br i1 %cmp14, label %for.body16, label %for.end44, !dbg !267

for.body16:                                       ; preds = %for.cond12
  %idxprom17 = sext i32 %i.1 to i64, !dbg !268
  %arrayidx18 = getelementptr inbounds i8, i8* %call3, i64 %idxprom17, !dbg !268
  %9 = load i8, i8* %arrayidx18, align 1, !dbg !268
  %conv19 = sext i8 %9 to i32, !dbg !268
  %cmp20 = icmp ne i32 %conv19, 10, !dbg !271
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !272

if.then22:                                        ; preds = %for.body16
  br label %for.inc42, !dbg !273

if.end23:                                         ; preds = %for.body16
  %idxprom24 = sext i32 %i.1 to i64, !dbg !274
  %arrayidx25 = getelementptr inbounds i8, i8* %call3, i64 %idxprom24, !dbg !274
  store i8 0, i8* %arrayidx25, align 1, !dbg !275
  %sub = sub nsw i32 %i.1, %j.0, !dbg !276
  %cmp26 = icmp sgt i32 %sub, %best_len.0, !dbg !278
  br i1 %cmp26, label %if.then28, label %if.end40, !dbg !279

if.then28:                                        ; preds = %if.end23
  %idx.ext = sext i32 %j.0 to i64, !dbg !280
  %add.ptr = getelementptr inbounds i8, i8* %call3, i64 %idx.ext, !dbg !280
  %arraydecay = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !282
  %call29 = call i32 @count_letters(i8* %add.ptr, i8* %arraydecay), !dbg !283
  %idx.ext30 = sext i32 %j.0 to i64, !dbg !284
  %add.ptr31 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext30, !dbg !284
  %arraydecay32 = getelementptr inbounds [26 x i8], [26 x i8]* %cnt, i64 0, i64 0, !dbg !285
  %call33 = call i8* @insert(%union.node* %root, i8* %add.ptr31, i8* %arraydecay32), !dbg !286
  call void @llvm.dbg.value(metadata i8* %call33, metadata !287, metadata !DIExpression()), !dbg !288
  %tobool34 = icmp ne i8* %call33, null, !dbg !289
  br i1 %tobool34, label %if.then35, label %if.end39, !dbg !291

if.then35:                                        ; preds = %if.then28
  %sub36 = sub nsw i32 %i.1, %j.0, !dbg !292
  call void @llvm.dbg.value(metadata i32 %sub36, metadata !241, metadata !DIExpression()), !dbg !172
  %idx.ext37 = sext i32 %j.0 to i64, !dbg !294
  %add.ptr38 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext37, !dbg !294
  call void @llvm.dbg.value(metadata i8* %add.ptr38, metadata !262, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8* %call33, metadata !261, metadata !DIExpression()), !dbg !172
  br label %if.end39, !dbg !295

if.end39:                                         ; preds = %if.then35, %if.then28
  %best_len.1 = phi i32 [ %sub36, %if.then35 ], [ %best_len.0, %if.then28 ], !dbg !172
  %b1.1 = phi i8* [ %add.ptr38, %if.then35 ], [ %b1.0, %if.then28 ]
  %b2.1 = phi i8* [ %call33, %if.then35 ], [ %b2.0, %if.then28 ]
  call void @llvm.dbg.value(metadata i8* %b2.1, metadata !261, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8* %b1.1, metadata !262, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %best_len.1, metadata !241, metadata !DIExpression()), !dbg !172
  br label %if.end40, !dbg !296

if.end40:                                         ; preds = %if.end39, %if.end23
  %best_len.2 = phi i32 [ %best_len.1, %if.end39 ], [ %best_len.0, %if.end23 ], !dbg !172
  %b1.2 = phi i8* [ %b1.1, %if.end39 ], [ %b1.0, %if.end23 ]
  %b2.2 = phi i8* [ %b2.1, %if.end39 ], [ %b2.0, %if.end23 ]
  call void @llvm.dbg.value(metadata i8* %b2.2, metadata !261, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8* %b1.2, metadata !262, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %best_len.2, metadata !241, metadata !DIExpression()), !dbg !172
  %inc41 = add nsw i32 %i.1, 1, !dbg !297
  call void @llvm.dbg.value(metadata i32 %inc41, metadata !242, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %inc41, metadata !174, metadata !DIExpression()), !dbg !172
  br label %for.inc42, !dbg !298

for.inc42:                                        ; preds = %if.end40, %if.then22
  %best_len.3 = phi i32 [ %best_len.0, %if.then22 ], [ %best_len.2, %if.end40 ], !dbg !172
  %j.1 = phi i32 [ %j.0, %if.then22 ], [ %inc41, %if.end40 ], !dbg !260
  %i.2 = phi i32 [ %i.1, %if.then22 ], [ %inc41, %if.end40 ], !dbg !260
  %b1.3 = phi i8* [ %b1.0, %if.then22 ], [ %b1.2, %if.end40 ]
  %b2.3 = phi i8* [ %b2.0, %if.then22 ], [ %b2.2, %if.end40 ]
  call void @llvm.dbg.value(metadata i8* %b2.3, metadata !261, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8* %b1.3, metadata !262, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !242, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !174, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 %best_len.3, metadata !241, metadata !DIExpression()), !dbg !172
  %inc43 = add nsw i32 %i.2, 1, !dbg !299
  call void @llvm.dbg.value(metadata i32 %inc43, metadata !242, metadata !DIExpression()), !dbg !172
  br label %for.cond12, !dbg !300, !llvm.loop !301

for.end44:                                        ; preds = %for.cond12
  %tobool45 = icmp ne i32 %best_len.0, 0, !dbg !303
  br i1 %tobool45, label %if.then46, label %if.end48, !dbg !305

if.then46:                                        ; preds = %for.end44
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* %b1.0, i8* %b2.0), !dbg !306
  br label %if.end48, !dbg !306

if.end48:                                         ; preds = %if.then46, %for.end44
  br label %return, !dbg !307

return:                                           ; preds = %if.end48, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end48 ], !dbg !172
  ret i32 %retval.0, !dbg !308
}

declare dso_local i32 @open(i8*, i32, ...) #4

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #3

declare dso_local i64 @read(i32, i8*, i64) #4

declare dso_local i32 @close(i32) #4

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!25 = !DILocation(line: 0, scope: !21)
!26 = !DILocalVariable(name: "s2", arg: 2, scope: !21, file: !3, line: 24, type: !14)
!27 = !DILocalVariable(name: "i", scope: !21, file: !3, line: 26, type: !11)
!28 = !DILocation(line: 27, column: 7, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 27, column: 2)
!30 = !DILocation(line: 0, scope: !29)
!31 = !DILocation(line: 27, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !3, line: 27, column: 2)
!33 = !DILocation(line: 27, column: 2, scope: !29)
!34 = !DILocation(line: 28, column: 7, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !3, line: 28, column: 7)
!36 = !DILocation(line: 28, column: 16, scope: !35)
!37 = !DILocation(line: 28, column: 13, scope: !35)
!38 = !DILocation(line: 28, column: 7, scope: !32)
!39 = !DILocation(line: 28, column: 23, scope: !35)
!40 = !DILocation(line: 28, column: 20, scope: !35)
!41 = !DILocation(line: 27, column: 22, scope: !32)
!42 = !DILocation(line: 27, column: 2, scope: !32)
!43 = distinct !{!43, !33, !44}
!44 = !DILocation(line: 28, column: 30, scope: !29)
!45 = !DILocation(line: 29, column: 2, scope: !21)
!46 = !DILocation(line: 30, column: 1, scope: !21)
!47 = distinct !DISubprogram(name: "count_letters", scope: !3, file: !3, line: 32, type: !48, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!11, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!51 = !DILocalVariable(name: "s", arg: 1, scope: !47, file: !3, line: 32, type: !14)
!52 = !DILocation(line: 0, scope: !47)
!53 = !DILocalVariable(name: "c", arg: 2, scope: !47, file: !3, line: 32, type: !50)
!54 = !DILocation(line: 35, column: 2, scope: !47)
!55 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 34, type: !11)
!56 = !DILocalVariable(name: "len", scope: !47, file: !3, line: 34, type: !11)
!57 = !DILocation(line: 36, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !47, file: !3, line: 36, column: 2)
!59 = !DILocation(line: 0, scope: !58)
!60 = !DILocation(line: 36, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !3, line: 36, column: 2)
!62 = !DILocation(line: 36, column: 2, scope: !58)
!63 = !DILocation(line: 37, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !65, file: !3, line: 37, column: 7)
!65 = distinct !DILexicalBlock(scope: !61, file: !3, line: 36, column: 31)
!66 = !DILocation(line: 37, column: 12, scope: !64)
!67 = !DILocation(line: 37, column: 18, scope: !64)
!68 = !DILocation(line: 37, column: 21, scope: !64)
!69 = !DILocation(line: 37, column: 26, scope: !64)
!70 = !DILocation(line: 37, column: 7, scope: !65)
!71 = !DILocation(line: 38, column: 4, scope: !64)
!72 = !DILocation(line: 39, column: 6, scope: !65)
!73 = !DILocation(line: 39, column: 39, scope: !65)
!74 = !DILocation(line: 39, column: 12, scope: !65)
!75 = !DILocation(line: 39, column: 10, scope: !65)
!76 = !DILocation(line: 39, column: 45, scope: !65)
!77 = !DILocation(line: 40, column: 2, scope: !65)
!78 = !DILocation(line: 36, column: 27, scope: !61)
!79 = !DILocation(line: 36, column: 2, scope: !61)
!80 = distinct !{!80, !62, !81}
!81 = !DILocation(line: 40, column: 2, scope: !58)
!82 = !DILocation(line: 41, column: 2, scope: !47)
!83 = !DILocation(line: 42, column: 1, scope: !47)
!84 = distinct !DISubprogram(name: "insert", scope: !3, file: !3, line: 44, type: !85, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!14, !87, !14, !50}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "node", file: !3, line: 19, size: 640, elements: !89)
!89 = !{!90, !94}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "down", scope: !88, file: !3, line: 20, baseType: !91, size: 640)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 640, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 10)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "list", scope: !88, file: !3, line: 21, baseType: !95, size: 640)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 640, elements: !92)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "word", file: !3, line: 14, size: 128, elements: !98)
!98 = !{!99, !100}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !97, file: !3, line: 15, baseType: !14, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !97, file: !3, line: 16, baseType: !96, size: 64, offset: 64)
!101 = !DILocalVariable(name: "root", arg: 1, scope: !84, file: !3, line: 44, type: !87)
!102 = !DILocation(line: 0, scope: !84)
!103 = !DILocalVariable(name: "s", arg: 2, scope: !84, file: !3, line: 44, type: !14)
!104 = !DILocalVariable(name: "cnt", arg: 3, scope: !84, file: !3, line: 44, type: !50)
!105 = !DILocalVariable(name: "w", scope: !84, file: !3, line: 48, type: !96)
!106 = !DILocalVariable(name: "i", scope: !84, file: !3, line: 46, type: !11)
!107 = !DILocation(line: 50, column: 7, scope: !108)
!108 = distinct !DILexicalBlock(scope: !84, file: !3, line: 50, column: 2)
!109 = !DILocation(line: 0, scope: !108)
!110 = !DILocation(line: 50, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 50, column: 2)
!112 = !DILocation(line: 50, column: 2, scope: !108)
!113 = !DILocation(line: 51, column: 19, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !3, line: 51, column: 7)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 50, column: 37)
!116 = !DILocation(line: 51, column: 24, scope: !114)
!117 = !DILocation(line: 51, column: 13, scope: !114)
!118 = !DILocalVariable(name: "n", scope: !84, file: !3, line: 47, type: !87)
!119 = !DILocation(line: 51, column: 11, scope: !114)
!120 = !DILocation(line: 51, column: 7, scope: !115)
!121 = !DILocation(line: 52, column: 29, scope: !114)
!122 = !DILocation(line: 52, column: 10, scope: !114)
!123 = !DILocation(line: 52, column: 15, scope: !114)
!124 = !DILocation(line: 52, column: 4, scope: !114)
!125 = !DILocation(line: 52, column: 23, scope: !114)
!126 = !DILocation(line: 0, scope: !114)
!127 = !DILocation(line: 53, column: 2, scope: !115)
!128 = !DILocation(line: 50, column: 23, scope: !111)
!129 = !DILocation(line: 50, column: 2, scope: !111)
!130 = distinct !{!130, !112, !131}
!131 = !DILocation(line: 53, column: 2, scope: !108)
!132 = !DILocation(line: 55, column: 6, scope: !84)
!133 = !DILocation(line: 56, column: 5, scope: !84)
!134 = !DILocation(line: 56, column: 7, scope: !84)
!135 = !DILocation(line: 57, column: 18, scope: !84)
!136 = !DILocation(line: 57, column: 23, scope: !84)
!137 = !DILocation(line: 57, column: 12, scope: !84)
!138 = !DILocation(line: 57, column: 5, scope: !84)
!139 = !DILocation(line: 57, column: 10, scope: !84)
!140 = !DILocation(line: 58, column: 8, scope: !84)
!141 = !DILocation(line: 58, column: 13, scope: !84)
!142 = !DILocation(line: 58, column: 2, scope: !84)
!143 = !DILocation(line: 58, column: 22, scope: !84)
!144 = !DILocation(line: 60, column: 14, scope: !145)
!145 = distinct !DILexicalBlock(scope: !84, file: !3, line: 60, column: 2)
!146 = !DILocalVariable(name: "v", scope: !84, file: !3, line: 48, type: !96)
!147 = !DILocation(line: 60, column: 7, scope: !145)
!148 = !DILocation(line: 0, scope: !145)
!149 = !DILocation(line: 60, column: 2, scope: !145)
!150 = !DILocation(line: 61, column: 19, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !3, line: 61, column: 7)
!152 = distinct !DILexicalBlock(scope: !153, file: !3, line: 60, column: 36)
!153 = distinct !DILexicalBlock(scope: !145, file: !3, line: 60, column: 2)
!154 = !DILocation(line: 61, column: 25, scope: !151)
!155 = !DILocation(line: 61, column: 7, scope: !151)
!156 = !DILocation(line: 61, column: 7, scope: !152)
!157 = !DILocation(line: 62, column: 14, scope: !151)
!158 = !DILocation(line: 62, column: 4, scope: !151)
!159 = !DILocation(line: 63, column: 2, scope: !152)
!160 = !DILocation(line: 60, column: 30, scope: !153)
!161 = !DILocation(line: 60, column: 2, scope: !153)
!162 = distinct !{!162, !149, !163}
!163 = !DILocation(line: 63, column: 2, scope: !145)
!164 = !DILocation(line: 64, column: 2, scope: !84)
!165 = !DILocation(line: 65, column: 1, scope: !84)
!166 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 67, type: !167, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DISubroutineType(types: !168)
!168 = !{!11, !11, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!171 = !DILocalVariable(name: "c", arg: 1, scope: !166, file: !3, line: 67, type: !11)
!172 = !DILocation(line: 0, scope: !166)
!173 = !DILocalVariable(name: "v", arg: 2, scope: !166, file: !3, line: 67, type: !169)
!174 = !DILocalVariable(name: "j", scope: !166, file: !3, line: 69, type: !11)
!175 = !DILocalVariable(name: "st", scope: !166, file: !3, line: 71, type: !176)
!176 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !177, line: 46, size: 1152, elements: !178)
!177 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!178 = !{!179, !183, !185, !187, !190, !192, !194, !195, !196, !199, !201, !203, !211, !212, !213}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !176, file: !177, line: 48, baseType: !180, size: 64)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !181, line: 145, baseType: !182)
!181 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!182 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !176, file: !177, line: 53, baseType: !184, size: 64, offset: 64)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !181, line: 148, baseType: !182)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !176, file: !177, line: 61, baseType: !186, size: 64, offset: 128)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !181, line: 151, baseType: !182)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !176, file: !177, line: 62, baseType: !188, size: 32, offset: 192)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !181, line: 150, baseType: !189)
!189 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !176, file: !177, line: 64, baseType: !191, size: 32, offset: 224)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !181, line: 146, baseType: !189)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !176, file: !177, line: 65, baseType: !193, size: 32, offset: 256)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !181, line: 147, baseType: !189)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !176, file: !177, line: 67, baseType: !11, size: 32, offset: 288)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !176, file: !177, line: 69, baseType: !180, size: 64, offset: 320)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !176, file: !177, line: 74, baseType: !197, size: 64, offset: 384)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !181, line: 152, baseType: !198)
!198 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !176, file: !177, line: 78, baseType: !200, size: 64, offset: 448)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !181, line: 174, baseType: !198)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !176, file: !177, line: 80, baseType: !202, size: 64, offset: 512)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !181, line: 179, baseType: !198)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !176, file: !177, line: 91, baseType: !204, size: 128, offset: 576)
!204 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !205, line: 10, size: 128, elements: !206)
!205 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!206 = !{!207, !209}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !204, file: !205, line: 12, baseType: !208, size: 64)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !181, line: 160, baseType: !198)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !204, file: !205, line: 16, baseType: !210, size: 64, offset: 64)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !181, line: 196, baseType: !198)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !176, file: !177, line: 92, baseType: !204, size: 128, offset: 704)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !176, file: !177, line: 93, baseType: !204, size: 128, offset: 832)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !176, file: !177, line: 106, baseType: !214, size: 192, offset: 960)
!214 = !DICompositeType(tag: DW_TAG_array_type, baseType: !210, size: 192, elements: !215)
!215 = !{!216}
!216 = !DISubrange(count: 3)
!217 = !DILocation(line: 71, column: 14, scope: !166)
!218 = !DILocation(line: 73, column: 18, scope: !166)
!219 = !DILocation(line: 73, column: 16, scope: !166)
!220 = !DILocation(line: 73, column: 41, scope: !166)
!221 = !DILocation(line: 73, column: 11, scope: !166)
!222 = !DILocalVariable(name: "fd", scope: !166, file: !3, line: 73, type: !11)
!223 = !DILocation(line: 74, column: 6, scope: !224)
!224 = distinct !DILexicalBlock(scope: !166, file: !3, line: 74, column: 6)
!225 = !DILocation(line: 74, column: 21, scope: !224)
!226 = !DILocation(line: 74, column: 6, scope: !166)
!227 = !DILocation(line: 74, column: 26, scope: !224)
!228 = !DILocation(line: 76, column: 20, scope: !166)
!229 = !DILocation(line: 76, column: 10, scope: !166)
!230 = !DILocalVariable(name: "words", scope: !166, file: !3, line: 70, type: !170)
!231 = !DILocation(line: 77, column: 21, scope: !166)
!232 = !DILocation(line: 77, column: 2, scope: !166)
!233 = !DILocation(line: 78, column: 2, scope: !166)
!234 = !DILocalVariable(name: "root", scope: !166, file: !3, line: 80, type: !88)
!235 = !DILocation(line: 80, column: 13, scope: !166)
!236 = !DILocalVariable(name: "cnt", scope: !166, file: !3, line: 81, type: !237)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 208, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 26)
!240 = !DILocation(line: 81, column: 16, scope: !166)
!241 = !DILocalVariable(name: "best_len", scope: !166, file: !3, line: 82, type: !11)
!242 = !DILocalVariable(name: "i", scope: !166, file: !3, line: 69, type: !11)
!243 = !DILocation(line: 85, column: 7, scope: !244)
!244 = distinct !DILexicalBlock(scope: !166, file: !3, line: 85, column: 2)
!245 = !DILocation(line: 0, scope: !244)
!246 = !DILocation(line: 85, column: 14, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !3, line: 85, column: 2)
!248 = !DILocation(line: 85, column: 2, scope: !244)
!249 = !DILocation(line: 86, column: 30, scope: !247)
!250 = !DILocation(line: 86, column: 3, scope: !247)
!251 = !DILocation(line: 86, column: 39, scope: !247)
!252 = !DILocation(line: 85, column: 24, scope: !247)
!253 = !DILocation(line: 85, column: 2, scope: !247)
!254 = distinct !{!254, !248, !255}
!255 = !DILocation(line: 86, column: 41, scope: !244)
!256 = !DILocation(line: 89, column: 7, scope: !257)
!257 = distinct !DILexicalBlock(scope: !166, file: !3, line: 89, column: 2)
!258 = !DILocation(line: 82, column: 6, scope: !166)
!259 = !DILocation(line: 89, column: 13, scope: !257)
!260 = !DILocation(line: 0, scope: !257)
!261 = !DILocalVariable(name: "b2", scope: !166, file: !3, line: 83, type: !14)
!262 = !DILocalVariable(name: "b1", scope: !166, file: !3, line: 83, type: !14)
!263 = !DILocation(line: 89, column: 18, scope: !264)
!264 = distinct !DILexicalBlock(scope: !257, file: !3, line: 89, column: 2)
!265 = !DILocation(line: 89, column: 25, scope: !264)
!266 = !DILocation(line: 89, column: 20, scope: !264)
!267 = !DILocation(line: 89, column: 2, scope: !257)
!268 = !DILocation(line: 90, column: 7, scope: !269)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 90, column: 7)
!270 = distinct !DILexicalBlock(scope: !264, file: !3, line: 89, column: 39)
!271 = !DILocation(line: 90, column: 16, scope: !269)
!272 = !DILocation(line: 90, column: 7, scope: !270)
!273 = !DILocation(line: 90, column: 25, scope: !269)
!274 = !DILocation(line: 91, column: 3, scope: !270)
!275 = !DILocation(line: 91, column: 12, scope: !270)
!276 = !DILocation(line: 93, column: 9, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !3, line: 93, column: 7)
!278 = !DILocation(line: 93, column: 13, scope: !277)
!279 = !DILocation(line: 93, column: 7, scope: !270)
!280 = !DILocation(line: 94, column: 24, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !3, line: 93, column: 25)
!282 = !DILocation(line: 94, column: 29, scope: !281)
!283 = !DILocation(line: 94, column: 4, scope: !281)
!284 = !DILocation(line: 95, column: 44, scope: !281)
!285 = !DILocation(line: 95, column: 49, scope: !281)
!286 = !DILocation(line: 95, column: 24, scope: !281)
!287 = !DILocalVariable(name: "match", scope: !281, file: !3, line: 95, type: !14)
!288 = !DILocation(line: 0, scope: !281)
!289 = !DILocation(line: 97, column: 8, scope: !290)
!290 = distinct !DILexicalBlock(scope: !281, file: !3, line: 97, column: 8)
!291 = !DILocation(line: 97, column: 8, scope: !281)
!292 = !DILocation(line: 98, column: 18, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !3, line: 97, column: 15)
!294 = !DILocation(line: 99, column: 16, scope: !293)
!295 = !DILocation(line: 101, column: 4, scope: !293)
!296 = !DILocation(line: 102, column: 3, scope: !281)
!297 = !DILocation(line: 104, column: 7, scope: !270)
!298 = !DILocation(line: 105, column: 2, scope: !270)
!299 = !DILocation(line: 89, column: 35, scope: !264)
!300 = !DILocation(line: 89, column: 2, scope: !264)
!301 = distinct !{!301, !267, !302}
!302 = !DILocation(line: 105, column: 2, scope: !257)
!303 = !DILocation(line: 107, column: 6, scope: !304)
!304 = distinct !DILexicalBlock(scope: !166, file: !3, line: 107, column: 6)
!305 = !DILocation(line: 107, column: 6, scope: !166)
!306 = !DILocation(line: 107, column: 16, scope: !304)
!307 = !DILocation(line: 109, column: 2, scope: !166)
!308 = !DILocation(line: 110, column: 1, scope: !166)
