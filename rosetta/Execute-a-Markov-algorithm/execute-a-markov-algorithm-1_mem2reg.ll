; ModuleID = 'execute-a-markov-algorithm-1.ll'
source_filename = "execute-a-markov-algorithm-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ruleset_t = type { i32, %struct.rule_t*, i8* }
%struct.rule_t = type { i8*, i8*, i32 }
%struct.string = type { i8*, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"parse error: no -> in %.*s\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"left side blank? %.*s\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"Rules from '%s' ok\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"text:     %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"markoved: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"I bought a B of As from T S.\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"rule1\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"rule2\00", align 1
@.str.11 = private unnamed_addr constant [40 x i8] c"I bought a B of As W my Bgage from T S.\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"rule3\00", align 1
@.str.13 = private unnamed_addr constant [13 x i8] c"_1111*11111_\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"rule4\00", align 1
@.str.15 = private unnamed_addr constant [14 x i8] c"000000A000000\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"rule5\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @ruleset_del(%struct.ruleset_t* %r) #0 !dbg !26 {
entry:
  call void @llvm.dbg.value(metadata %struct.ruleset_t* %r, metadata !46, metadata !DIExpression()), !dbg !47
  %rules = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !48
  %0 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !48
  %tobool = icmp ne %struct.rule_t* %0, null, !dbg !50
  br i1 %tobool, label %if.then, label %if.end, !dbg !51, !cf.info !52

if.then:                                          ; preds = %entry
  %rules1 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !53
  %1 = load %struct.rule_t*, %struct.rule_t** %rules1, align 8, !dbg !53
  %2 = bitcast %struct.rule_t* %1 to i8*, !dbg !54
  call void @free(i8* %2) #7, !dbg !55
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %buf = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 2, !dbg !56
  %3 = load i8*, i8** %buf, align 8, !dbg !56
  %tobool2 = icmp ne i8* %3, null, !dbg !58
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !59, !cf.info !52

if.then3:                                         ; preds = %if.end
  %buf4 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 2, !dbg !60
  %4 = load i8*, i8** %buf4, align 8, !dbg !60
  call void @free(i8* %4) #7, !dbg !61
  br label %if.end5, !dbg !61

if.end5:                                          ; preds = %if.then3, %if.end
  %5 = bitcast %struct.ruleset_t* %r to i8*, !dbg !62
  call void @free(i8* %5) #7, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.string* @str_new(i8* %s) #0 !dbg !65 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @strlen(i8* %s) #8, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !81
  call void @llvm.dbg.value(metadata i32 %conv, metadata !82, metadata !DIExpression()), !dbg !80
  %call1 = call noalias i8* @malloc(i64 16) #7, !dbg !83
  %0 = bitcast i8* %call1 to %struct.string*, !dbg !83
  call void @llvm.dbg.value(metadata %struct.string* %0, metadata !84, metadata !DIExpression()), !dbg !80
  %add = add nsw i32 %conv, 1, !dbg !85
  %conv2 = sext i32 %add to i64, !dbg !86
  %call3 = call noalias i8* @malloc(i64 %conv2) #7, !dbg !87
  %s4 = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 0, !dbg !88
  store i8* %call3, i8** %s4, align 8, !dbg !89
  %s5 = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 0, !dbg !90
  %1 = load i8*, i8** %s5, align 8, !dbg !90
  %call6 = call i8* @strcpy(i8* %1, i8* %s) #7, !dbg !91
  %add7 = add nsw i32 %conv, 1, !dbg !92
  %conv8 = sext i32 %add7 to i64, !dbg !93
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 1, !dbg !94
  store i64 %conv8, i64* %alloc_len, align 8, !dbg !95
  ret %struct.string* %0, !dbg !96
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_append(%struct.string* %str, i8* %s, i32 %len) #0 !dbg !97 {
entry:
  call void @llvm.dbg.value(metadata %struct.string* %str, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i8* %s, metadata !102, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i32 %len, metadata !103, metadata !DIExpression()), !dbg !101
  %s1 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !104
  %0 = load i8*, i8** %s1, align 8, !dbg !104
  %call = call i64 @strlen(i8* %0) #8, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !105
  call void @llvm.dbg.value(metadata i32 %conv, metadata !106, metadata !DIExpression()), !dbg !101
  %cmp = icmp eq i32 %len, -1, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !109, !cf.info !52

if.then:                                          ; preds = %entry
  %call3 = call i64 @strlen(i8* %s) #8, !dbg !110
  %conv4 = trunc i64 %call3 to i32, !dbg !110
  call void @llvm.dbg.value(metadata i32 %conv4, metadata !103, metadata !DIExpression()), !dbg !101
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %entry
  %len.addr.0 = phi i32 [ %conv4, %if.then ], [ %len, %entry ]
  call void @llvm.dbg.value(metadata i32 %len.addr.0, metadata !103, metadata !DIExpression()), !dbg !101
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 1, !dbg !112
  %1 = load i64, i64* %alloc_len, align 8, !dbg !112
  %add = add nsw i32 %conv, %len.addr.0, !dbg !114
  %add5 = add nsw i32 %add, 1, !dbg !115
  %conv6 = sext i32 %add5 to i64, !dbg !116
  %cmp7 = icmp ult i64 %1, %conv6, !dbg !117
  br i1 %cmp7, label %if.then9, label %if.end18, !dbg !118, !cf.info !52

if.then9:                                         ; preds = %if.end
  %add10 = add nsw i32 %conv, %len.addr.0, !dbg !119
  %add11 = add nsw i32 %add10, 1, !dbg !121
  %conv12 = sext i32 %add11 to i64, !dbg !122
  %alloc_len13 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 1, !dbg !123
  store i64 %conv12, i64* %alloc_len13, align 8, !dbg !124
  %s14 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !125
  %2 = load i8*, i8** %s14, align 8, !dbg !125
  %alloc_len15 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 1, !dbg !126
  %3 = load i64, i64* %alloc_len15, align 8, !dbg !126
  %call16 = call i8* @realloc(i8* %2, i64 %3) #7, !dbg !127
  %s17 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !128
  store i8* %call16, i8** %s17, align 8, !dbg !129
  br label %if.end18, !dbg !130

if.end18:                                         ; preds = %if.then9, %if.end
  %s19 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !131
  %4 = load i8*, i8** %s19, align 8, !dbg !131
  %idx.ext = sext i32 %conv to i64, !dbg !132
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext, !dbg !132
  %conv20 = sext i32 %len.addr.0 to i64, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %s, i64 %conv20, i1 false), !dbg !134
  %s21 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !135
  %5 = load i8*, i8** %s21, align 8, !dbg !135
  %add22 = add nsw i32 %conv, %len.addr.0, !dbg !136
  %idxprom = sext i32 %add22 to i64, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  ret void, !dbg !139
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_transfer(%struct.string* %dest, %struct.string* %src) #0 !dbg !140 {
entry:
  call void @llvm.dbg.value(metadata %struct.string* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.value(metadata %struct.string* %src, metadata !145, metadata !DIExpression()), !dbg !144
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %dest, i32 0, i32 1, !dbg !146
  %0 = load i64, i64* %alloc_len, align 8, !dbg !146
  call void @llvm.dbg.value(metadata i64 %0, metadata !147, metadata !DIExpression()), !dbg !144
  %alloc_len1 = getelementptr inbounds %struct.string, %struct.string* %src, i32 0, i32 1, !dbg !148
  %1 = load i64, i64* %alloc_len1, align 8, !dbg !148
  %alloc_len2 = getelementptr inbounds %struct.string, %struct.string* %dest, i32 0, i32 1, !dbg !149
  store i64 %1, i64* %alloc_len2, align 8, !dbg !150
  %alloc_len3 = getelementptr inbounds %struct.string, %struct.string* %src, i32 0, i32 1, !dbg !151
  store i64 %0, i64* %alloc_len3, align 8, !dbg !152
  %s = getelementptr inbounds %struct.string, %struct.string* %dest, i32 0, i32 0, !dbg !153
  %2 = load i8*, i8** %s, align 8, !dbg !153
  call void @llvm.dbg.value(metadata i8* %2, metadata !154, metadata !DIExpression()), !dbg !144
  %s4 = getelementptr inbounds %struct.string, %struct.string* %src, i32 0, i32 0, !dbg !155
  %3 = load i8*, i8** %s4, align 8, !dbg !155
  %s5 = getelementptr inbounds %struct.string, %struct.string* %dest, i32 0, i32 0, !dbg !156
  store i8* %3, i8** %s5, align 8, !dbg !157
  %s6 = getelementptr inbounds %struct.string, %struct.string* %src, i32 0, i32 0, !dbg !158
  store i8* %2, i8** %s6, align 8, !dbg !159
  %s7 = getelementptr inbounds %struct.string, %struct.string* %src, i32 0, i32 0, !dbg !160
  %4 = load i8*, i8** %s7, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_del(%struct.string* %s) #0 !dbg !164 {
entry:
  call void @llvm.dbg.value(metadata %struct.string* %s, metadata !167, metadata !DIExpression()), !dbg !168
  %s1 = getelementptr inbounds %struct.string, %struct.string* %s, i32 0, i32 0, !dbg !169
  %0 = load i8*, i8** %s1, align 8, !dbg !169
  %tobool = icmp ne i8* %0, null, !dbg !171
  br i1 %tobool, label %if.then, label %if.end, !dbg !172, !cf.info !52

if.then:                                          ; preds = %entry
  %s2 = getelementptr inbounds %struct.string, %struct.string* %s, i32 0, i32 0, !dbg !173
  %1 = load i8*, i8** %s2, align 8, !dbg !173
  call void @free(i8* %1) #7, !dbg !174
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  %2 = bitcast %struct.string* %s to i8*, !dbg !175
  call void @free(i8* %2) #7, !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_markov(%struct.string* %str, %struct.ruleset_t* %r) #0 !dbg !178 {
entry:
  call void @llvm.dbg.value(metadata %struct.string* %str, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata %struct.ruleset_t* %r, metadata !183, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 0, metadata !184, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 0, metadata !185, metadata !DIExpression()), !dbg !182
  %call = call %struct.string* @str_new(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)), !dbg !186
  call void @llvm.dbg.value(metadata %struct.string* %call, metadata !187, metadata !DIExpression()), !dbg !182
  br label %while.cond, !dbg !188

while.cond:                                       ; preds = %if.end38, %entry
  %done.0 = phi i32 [ 0, %entry ], [ %done.1, %if.end38 ], !dbg !189
  call void @llvm.dbg.value(metadata i32 %done.0, metadata !185, metadata !DIExpression()), !dbg !182
  %tobool = icmp ne i32 %done.0, 0, !dbg !190
  %lnot = xor i1 %tobool, true, !dbg !190
  br i1 %lnot, label %while.body, label %while.end, !dbg !188

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !184, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 0, metadata !191, metadata !DIExpression()), !dbg !182
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc33, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc34, %for.inc33 ], !dbg !195
  %changed.0 = phi i32 [ 0, %while.body ], [ %changed.1, %for.inc33 ], !dbg !196
  %done.1 = phi i32 [ %done.0, %while.body ], [ %done.3, %for.inc33 ], !dbg !182
  call void @llvm.dbg.value(metadata i32 %done.1, metadata !185, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 %changed.0, metadata !184, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !191, metadata !DIExpression()), !dbg !182
  %tobool1 = icmp ne i32 %done.1, 0, !dbg !197
  br i1 %tobool1, label %land.end, label %land.lhs.true, !dbg !199

land.lhs.true:                                    ; preds = %for.cond
  %tobool2 = icmp ne i32 %changed.0, 0, !dbg !200
  br i1 %tobool2, label %land.end, label %land.rhs, !dbg !201

land.rhs:                                         ; preds = %land.lhs.true
  %n = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 0, !dbg !202
  %0 = load i32, i32* %n, align 8, !dbg !202
  %cmp = icmp slt i32 %i.0, %0, !dbg !203
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.cond
  %1 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !204
  br i1 %1, label %for.body, label %for.end35, !dbg !205

for.body:                                         ; preds = %land.end
  %rules = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !206
  %2 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !206
  %idxprom = sext i32 %i.0 to i64, !dbg !208
  %arrayidx = getelementptr inbounds %struct.rule_t, %struct.rule_t* %2, i64 %idxprom, !dbg !208
  %pat = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx, i32 0, i32 0, !dbg !209
  %3 = load i8*, i8** %pat, align 8, !dbg !209
  %call3 = call i64 @strlen(i8* %3) #8, !dbg !210
  %conv = trunc i64 %call3 to i32, !dbg !210
  call void @llvm.dbg.value(metadata i32 %conv, metadata !211, metadata !DIExpression()), !dbg !182
  %s = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !212
  %4 = load i8*, i8** %s, align 8, !dbg !212
  %call4 = call i64 @strlen(i8* %4) #8, !dbg !213
  %conv5 = trunc i64 %call4 to i32, !dbg !213
  call void @llvm.dbg.value(metadata i32 %conv5, metadata !214, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()), !dbg !182
  br label %for.cond6, !dbg !216

for.cond6:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !218
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !215, metadata !DIExpression()), !dbg !182
  %cmp7 = icmp slt i32 %j.0, %conv5, !dbg !219
  br i1 %cmp7, label %for.body9, label %for.end, !dbg !221

for.body9:                                        ; preds = %for.cond6
  %s10 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !222
  %5 = load i8*, i8** %s10, align 8, !dbg !222
  %idx.ext = sext i32 %j.0 to i64, !dbg !225
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %idx.ext, !dbg !225
  %rules11 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !226
  %6 = load %struct.rule_t*, %struct.rule_t** %rules11, align 8, !dbg !226
  %idxprom12 = sext i32 %i.0 to i64, !dbg !227
  %arrayidx13 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %6, i64 %idxprom12, !dbg !227
  %pat14 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx13, i32 0, i32 0, !dbg !228
  %7 = load i8*, i8** %pat14, align 8, !dbg !228
  %conv15 = sext i32 %conv to i64, !dbg !229
  %call16 = call i32 @strncmp(i8* %add.ptr, i8* %7, i64 %conv15) #8, !dbg !230
  %tobool17 = icmp ne i32 %call16, 0, !dbg !230
  br i1 %tobool17, label %if.then, label %if.end, !dbg !231, !cf.info !52

if.then:                                          ; preds = %for.body9
  br label %for.inc, !dbg !232

if.end:                                           ; preds = %for.body9
  %s18 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !233
  %8 = load i8*, i8** %s18, align 8, !dbg !233
  call void @str_append(%struct.string* %call, i8* %8, i32 %j.0), !dbg !234
  %rules19 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !235
  %9 = load %struct.rule_t*, %struct.rule_t** %rules19, align 8, !dbg !235
  %idxprom20 = sext i32 %i.0 to i64, !dbg !236
  %arrayidx21 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %9, i64 %idxprom20, !dbg !236
  %repl = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx21, i32 0, i32 1, !dbg !237
  %10 = load i8*, i8** %repl, align 8, !dbg !237
  call void @str_append(%struct.string* %call, i8* %10, i32 -1), !dbg !238
  %s22 = getelementptr inbounds %struct.string, %struct.string* %str, i32 0, i32 0, !dbg !239
  %11 = load i8*, i8** %s22, align 8, !dbg !239
  %idx.ext23 = sext i32 %j.0 to i64, !dbg !240
  %add.ptr24 = getelementptr inbounds i8, i8* %11, i64 %idx.ext23, !dbg !240
  %idx.ext25 = sext i32 %conv to i64, !dbg !241
  %add.ptr26 = getelementptr inbounds i8, i8* %add.ptr24, i64 %idx.ext25, !dbg !241
  call void @str_append(%struct.string* %call, i8* %add.ptr26, i32 -1), !dbg !242
  call void @str_transfer(%struct.string* %str, %struct.string* %call), !dbg !243
  call void @llvm.dbg.value(metadata i32 1, metadata !184, metadata !DIExpression()), !dbg !182
  %rules27 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %r, i32 0, i32 1, !dbg !244
  %12 = load %struct.rule_t*, %struct.rule_t** %rules27, align 8, !dbg !244
  %idxprom28 = sext i32 %i.0 to i64, !dbg !246
  %arrayidx29 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %12, i64 %idxprom28, !dbg !246
  %terminate = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx29, i32 0, i32 2, !dbg !247
  %13 = load i32, i32* %terminate, align 8, !dbg !247
  %tobool30 = icmp ne i32 %13, 0, !dbg !246
  br i1 %tobool30, label %if.then31, label %if.end32, !dbg !248, !cf.info !52

if.then31:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !185, metadata !DIExpression()), !dbg !182
  br label %if.end32, !dbg !249

if.end32:                                         ; preds = %if.then31, %if.end
  %done.2 = phi i32 [ 1, %if.then31 ], [ %done.1, %if.end ], !dbg !182
  call void @llvm.dbg.value(metadata i32 %done.2, metadata !185, metadata !DIExpression()), !dbg !182
  br label %for.end, !dbg !250

for.inc:                                          ; preds = %if.then
  %inc = add nsw i32 %j.0, 1, !dbg !251
  call void @llvm.dbg.value(metadata i32 %inc, metadata !215, metadata !DIExpression()), !dbg !182
  br label %for.cond6, !dbg !252, !llvm.loop !253

for.end:                                          ; preds = %if.end32, %for.cond6
  %changed.1 = phi i32 [ 1, %if.end32 ], [ %changed.0, %for.cond6 ], !dbg !196
  %done.3 = phi i32 [ %done.2, %if.end32 ], [ %done.1, %for.cond6 ], !dbg !182
  call void @llvm.dbg.value(metadata i32 %done.3, metadata !185, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i32 %changed.1, metadata !184, metadata !DIExpression()), !dbg !182
  br label %for.inc33, !dbg !255

for.inc33:                                        ; preds = %for.end
  %inc34 = add nsw i32 %i.0, 1, !dbg !256
  call void @llvm.dbg.value(metadata i32 %inc34, metadata !191, metadata !DIExpression()), !dbg !182
  br label %for.cond, !dbg !257, !llvm.loop !258

for.end35:                                        ; preds = %land.end
  %tobool36 = icmp ne i32 %changed.0, 0, !dbg !260
  br i1 %tobool36, label %if.end38, label %if.then37, !dbg !262, !cf.info !52

if.then37:                                        ; preds = %for.end35
  br label %while.end, !dbg !263

if.end38:                                         ; preds = %for.end35
  br label %while.cond, !dbg !188, !llvm.loop !264

while.end:                                        ; preds = %if.then37, %while.cond
  call void @str_del(%struct.string* %call), !dbg !266
  ret void, !dbg !267
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strncmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.ruleset_t* @read_rules(i8* %name) #0 !dbg !268 {
entry:
  %s = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata i8* %name, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata %struct.stat* %s, metadata !273, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata %struct.rule_t* null, metadata !314, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata i32 0, metadata !315, metadata !DIExpression()), !dbg !272
  %call = call i32 (i8*, i32, ...) @open(i8* %name, i32 0), !dbg !316
  call void @llvm.dbg.value(metadata i32 %call, metadata !317, metadata !DIExpression()), !dbg !272
  %cmp = icmp eq i32 %call, -1, !dbg !318
  br i1 %cmp, label %if.then, label %if.end, !dbg !320, !cf.info !52

if.then:                                          ; preds = %entry
  br label %return, !dbg !321

if.end:                                           ; preds = %entry
  %call1 = call i32 @fstat(i32 %call, %struct.stat* %s) #7, !dbg !322
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !323
  %0 = load i64, i64* %st_size, align 8, !dbg !323
  %add = add nsw i64 %0, 2, !dbg !324
  %call2 = call noalias i8* @malloc(i64 %add) #7, !dbg !325
  call void @llvm.dbg.value(metadata i8* %call2, metadata !326, metadata !DIExpression()), !dbg !272
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !327
  %1 = load i64, i64* %st_size3, align 8, !dbg !327
  %call4 = call i64 @read(i32 %call, i8* %call2, i64 %1), !dbg !328
  %st_size5 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !329
  %2 = load i64, i64* %st_size5, align 8, !dbg !329
  %arrayidx = getelementptr inbounds i8, i8* %call2, i64 %2, !dbg !330
  store i8 10, i8* %arrayidx, align 1, !dbg !331
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !332
  %3 = load i64, i64* %st_size6, align 8, !dbg !332
  %add7 = add nsw i64 %3, 1, !dbg !333
  %arrayidx8 = getelementptr inbounds i8, i8* %call2, i64 %add7, !dbg !334
  store i8 0, i8* %arrayidx8, align 1, !dbg !335
  %call9 = call i32 @close(i32 %call), !dbg !336
  call void @llvm.dbg.value(metadata i64 0, metadata !337, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata i64 0, metadata !338, metadata !DIExpression()), !dbg !272
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc118, %if.end
  %j.0 = phi i64 [ 0, %if.end ], [ %j.1, %for.inc118 ], !dbg !341
  %i.0 = phi i64 [ 0, %if.end ], [ %inc119, %for.inc118 ], !dbg !342
  %rules.0 = phi %struct.rule_t* [ null, %if.end ], [ %rules.1, %for.inc118 ], !dbg !343
  %n.0 = phi i32 [ 0, %if.end ], [ %n.1, %for.inc118 ], !dbg !344
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !315, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata %struct.rule_t* %rules.0, metadata !314, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !338, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata i64 %j.0, metadata !337, metadata !DIExpression()), !dbg !272
  %arrayidx10 = getelementptr inbounds i8, i8* %call2, i64 %i.0, !dbg !345
  %4 = load i8, i8* %arrayidx10, align 1, !dbg !345
  %conv = sext i8 %4 to i32, !dbg !345
  %cmp11 = icmp ne i32 %conv, 0, !dbg !347
  br i1 %cmp11, label %for.body, label %for.end120, !dbg !348

for.body:                                         ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds i8, i8* %call2, i64 %i.0, !dbg !349
  %5 = load i8, i8* %arrayidx13, align 1, !dbg !349
  %conv14 = sext i8 %5 to i32, !dbg !349
  %cmp15 = icmp ne i32 %conv14, 10, !dbg !352
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !353, !cf.info !52

if.then17:                                        ; preds = %for.body
  br label %for.inc118, !dbg !354

if.end18:                                         ; preds = %for.body
  %arrayidx19 = getelementptr inbounds i8, i8* %call2, i64 %j.0, !dbg !355
  %6 = load i8, i8* %arrayidx19, align 1, !dbg !355
  %conv20 = sext i8 %6 to i32, !dbg !355
  %cmp21 = icmp eq i32 %conv20, 35, !dbg !357
  br i1 %cmp21, label %if.then25, label %lor.lhs.false, !dbg !358, !cf.info !52

lor.lhs.false:                                    ; preds = %if.end18
  %cmp23 = icmp eq i64 %i.0, %j.0, !dbg !359
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !360, !cf.info !52

if.then25:                                        ; preds = %lor.lhs.false, %if.end18
  %add26 = add i64 %i.0, 1, !dbg !361
  call void @llvm.dbg.value(metadata i64 %add26, metadata !337, metadata !DIExpression()), !dbg !272
  br label %for.inc118, !dbg !363

if.end27:                                         ; preds = %lor.lhs.false
  %add28 = add i64 %j.0, 1, !dbg !364
  call void @llvm.dbg.value(metadata i64 %add28, metadata !366, metadata !DIExpression()), !dbg !272
  br label %for.cond29, !dbg !367

for.cond29:                                       ; preds = %for.inc, %if.end27
  %k.0 = phi i64 [ %add28, %if.end27 ], [ %inc, %for.inc ], !dbg !368
  call void @llvm.dbg.value(metadata i64 %k.0, metadata !366, metadata !DIExpression()), !dbg !272
  %sub = sub i64 %i.0, 3, !dbg !369
  %cmp30 = icmp ult i64 %k.0, %sub, !dbg !371
  br i1 %cmp30, label %for.body32, label %for.end, !dbg !372

for.body32:                                       ; preds = %for.cond29
  %call33 = call i16** @__ctype_b_loc() #9, !dbg !373
  %7 = load i16*, i16** %call33, align 8, !dbg !373
  %arrayidx34 = getelementptr inbounds i8, i8* %call2, i64 %k.0, !dbg !373
  %8 = load i8, i8* %arrayidx34, align 1, !dbg !373
  %conv35 = sext i8 %8 to i32, !dbg !373
  %idxprom = sext i32 %conv35 to i64, !dbg !373
  %arrayidx36 = getelementptr inbounds i16, i16* %7, i64 %idxprom, !dbg !373
  %9 = load i16, i16* %arrayidx36, align 2, !dbg !373
  %conv37 = zext i16 %9 to i32, !dbg !373
  %and = and i32 %conv37, 8192, !dbg !373
  %tobool = icmp ne i32 %and, 0, !dbg !373
  br i1 %tobool, label %land.lhs.true, label %if.end42, !dbg !375, !cf.info !52

land.lhs.true:                                    ; preds = %for.body32
  %add.ptr = getelementptr inbounds i8, i8* %call2, i64 %k.0, !dbg !376
  %add.ptr38 = getelementptr inbounds i8, i8* %add.ptr, i64 1, !dbg !377
  %call39 = call i32 @strncmp(i8* %add.ptr38, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i64 2) #8, !dbg !378
  %tobool40 = icmp ne i32 %call39, 0, !dbg !378
  br i1 %tobool40, label %if.end42, label %if.then41, !dbg !379, !cf.info !52

if.then41:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !380

if.end42:                                         ; preds = %land.lhs.true, %for.body32
  br label %for.inc, !dbg !381

for.inc:                                          ; preds = %if.end42
  %inc = add i64 %k.0, 1, !dbg !382
  call void @llvm.dbg.value(metadata i64 %inc, metadata !366, metadata !DIExpression()), !dbg !272
  br label %for.cond29, !dbg !383, !llvm.loop !384

for.end:                                          ; preds = %if.then41, %for.cond29
  %sub43 = sub i64 %i.0, 3, !dbg !386
  %cmp44 = icmp uge i64 %k.0, %sub43, !dbg !388
  br i1 %cmp44, label %if.then46, label %if.end50, !dbg !389, !cf.info !52

if.then46:                                        ; preds = %for.end
  %sub47 = sub i64 %i.0, %j.0, !dbg !390
  %add.ptr48 = getelementptr inbounds i8, i8* %call2, i64 %j.0, !dbg !392
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i64 %sub47, i8* %add.ptr48), !dbg !393
  br label %for.end120, !dbg !394

if.end50:                                         ; preds = %for.end
  call void @llvm.dbg.value(metadata i64 %k.0, metadata !395, metadata !DIExpression()), !dbg !272
  br label %for.cond51, !dbg !396

for.cond51:                                       ; preds = %for.body62, %if.end50
  %tmp.0 = phi i64 [ %k.0, %if.end50 ], [ %tmp.1, %for.body62 ], !dbg !398
  call void @llvm.dbg.value(metadata i64 %tmp.0, metadata !395, metadata !DIExpression()), !dbg !272
  %cmp52 = icmp ugt i64 %tmp.0, %j.0, !dbg !399
  br i1 %cmp52, label %land.rhs, label %land.end, !dbg !401

land.rhs:                                         ; preds = %for.cond51
  %call54 = call i16** @__ctype_b_loc() #9, !dbg !402
  %10 = load i16*, i16** %call54, align 8, !dbg !402
  %dec = add i64 %tmp.0, -1, !dbg !402
  call void @llvm.dbg.value(metadata i64 %dec, metadata !395, metadata !DIExpression()), !dbg !272
  %arrayidx55 = getelementptr inbounds i8, i8* %call2, i64 %dec, !dbg !402
  %11 = load i8, i8* %arrayidx55, align 1, !dbg !402
  %conv56 = sext i8 %11 to i32, !dbg !402
  %idxprom57 = sext i32 %conv56 to i64, !dbg !402
  %arrayidx58 = getelementptr inbounds i16, i16* %10, i64 %idxprom57, !dbg !402
  %12 = load i16, i16* %arrayidx58, align 2, !dbg !402
  %conv59 = zext i16 %12 to i32, !dbg !402
  %and60 = and i32 %conv59, 8192, !dbg !402
  %tobool61 = icmp ne i32 %and60, 0, !dbg !401
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond51
  %tmp.1 = phi i64 [ %dec, %land.rhs ], [ %tmp.0, %for.cond51 ], !dbg !398
  %13 = phi i1 [ false, %for.cond51 ], [ %tobool61, %land.rhs ], !dbg !403
  call void @llvm.dbg.value(metadata i64 %tmp.1, metadata !395, metadata !DIExpression()), !dbg !272
  br i1 %13, label %for.body62, label %for.end63, !dbg !404

for.body62:                                       ; preds = %land.end
  br label %for.cond51, !dbg !405, !llvm.loop !406

for.end63:                                        ; preds = %land.end
  %cmp64 = icmp ult i64 %tmp.1, %j.0, !dbg !408
  br i1 %cmp64, label %if.then66, label %if.end70, !dbg !410, !cf.info !52

if.then66:                                        ; preds = %for.end63
  %sub67 = sub i64 %i.0, %j.0, !dbg !411
  %add.ptr68 = getelementptr inbounds i8, i8* %call2, i64 %j.0, !dbg !413
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i64 %sub67, i8* %add.ptr68), !dbg !414
  br label %for.end120, !dbg !415

if.end70:                                         ; preds = %for.end63
  %inc71 = add i64 %tmp.1, 1, !dbg !416
  call void @llvm.dbg.value(metadata i64 %inc71, metadata !395, metadata !DIExpression()), !dbg !272
  %arrayidx72 = getelementptr inbounds i8, i8* %call2, i64 %inc71, !dbg !417
  store i8 0, i8* %arrayidx72, align 1, !dbg !418
  %add73 = add i64 %k.0, 3, !dbg !419
  call void @llvm.dbg.value(metadata i64 %add73, metadata !366, metadata !DIExpression()), !dbg !272
  br label %for.cond74, !dbg !421

for.cond74:                                       ; preds = %for.body88, %if.end70
  %k.1 = phi i64 [ %add73, %if.end70 ], [ %k.2, %for.body88 ], !dbg !422
  call void @llvm.dbg.value(metadata i64 %k.1, metadata !366, metadata !DIExpression()), !dbg !272
  %cmp75 = icmp ult i64 %k.1, %i.0, !dbg !423
  br i1 %cmp75, label %land.rhs77, label %land.end87, !dbg !425

land.rhs77:                                       ; preds = %for.cond74
  %call78 = call i16** @__ctype_b_loc() #9, !dbg !426
  %14 = load i16*, i16** %call78, align 8, !dbg !426
  %inc79 = add i64 %k.1, 1, !dbg !426
  call void @llvm.dbg.value(metadata i64 %inc79, metadata !366, metadata !DIExpression()), !dbg !272
  %arrayidx80 = getelementptr inbounds i8, i8* %call2, i64 %inc79, !dbg !426
  %15 = load i8, i8* %arrayidx80, align 1, !dbg !426
  %conv81 = sext i8 %15 to i32, !dbg !426
  %idxprom82 = sext i32 %conv81 to i64, !dbg !426
  %arrayidx83 = getelementptr inbounds i16, i16* %14, i64 %idxprom82, !dbg !426
  %16 = load i16, i16* %arrayidx83, align 2, !dbg !426
  %conv84 = zext i16 %16 to i32, !dbg !426
  %and85 = and i32 %conv84, 8192, !dbg !426
  %tobool86 = icmp ne i32 %and85, 0, !dbg !425
  br label %land.end87

land.end87:                                       ; preds = %land.rhs77, %for.cond74
  %k.2 = phi i64 [ %inc79, %land.rhs77 ], [ %k.1, %for.cond74 ], !dbg !422
  %17 = phi i1 [ false, %for.cond74 ], [ %tobool86, %land.rhs77 ], !dbg !427
  call void @llvm.dbg.value(metadata i64 %k.2, metadata !366, metadata !DIExpression()), !dbg !272
  br i1 %17, label %for.body88, label %for.end89, !dbg !428

for.body88:                                       ; preds = %land.end87
  br label %for.cond74, !dbg !429, !llvm.loop !430

for.end89:                                        ; preds = %land.end87
  %arrayidx90 = getelementptr inbounds i8, i8* %call2, i64 %i.0, !dbg !432
  store i8 0, i8* %arrayidx90, align 1, !dbg !433
  %18 = bitcast %struct.rule_t* %rules.0 to i8*, !dbg !434
  %add91 = add nsw i32 1, %n.0, !dbg !435
  %conv92 = sext i32 %add91 to i64, !dbg !436
  %mul = mul i64 24, %conv92, !dbg !437
  %call93 = call i8* @realloc(i8* %18, i64 %mul) #7, !dbg !438
  %19 = bitcast i8* %call93 to %struct.rule_t*, !dbg !438
  call void @llvm.dbg.value(metadata %struct.rule_t* %19, metadata !314, metadata !DIExpression()), !dbg !272
  %add.ptr94 = getelementptr inbounds i8, i8* %call2, i64 %j.0, !dbg !439
  %idxprom95 = sext i32 %n.0 to i64, !dbg !440
  %arrayidx96 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom95, !dbg !440
  %pat = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx96, i32 0, i32 0, !dbg !441
  store i8* %add.ptr94, i8** %pat, align 8, !dbg !442
  %arrayidx97 = getelementptr inbounds i8, i8* %call2, i64 %k.2, !dbg !443
  %20 = load i8, i8* %arrayidx97, align 1, !dbg !443
  %conv98 = sext i8 %20 to i32, !dbg !443
  %cmp99 = icmp eq i32 %conv98, 46, !dbg !445
  br i1 %cmp99, label %if.then101, label %if.else, !dbg !446, !cf.info !52

if.then101:                                       ; preds = %for.end89
  %idxprom102 = sext i32 %n.0 to i64, !dbg !447
  %arrayidx103 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom102, !dbg !447
  %terminate = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx103, i32 0, i32 2, !dbg !449
  store i32 1, i32* %terminate, align 8, !dbg !450
  %add.ptr104 = getelementptr inbounds i8, i8* %call2, i64 %k.2, !dbg !451
  %add.ptr105 = getelementptr inbounds i8, i8* %add.ptr104, i64 1, !dbg !452
  %idxprom106 = sext i32 %n.0 to i64, !dbg !453
  %arrayidx107 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom106, !dbg !453
  %repl = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx107, i32 0, i32 1, !dbg !454
  store i8* %add.ptr105, i8** %repl, align 8, !dbg !455
  br label %if.end115, !dbg !456

if.else:                                          ; preds = %for.end89
  %idxprom108 = sext i32 %n.0 to i64, !dbg !457
  %arrayidx109 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom108, !dbg !457
  %terminate110 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx109, i32 0, i32 2, !dbg !459
  store i32 0, i32* %terminate110, align 8, !dbg !460
  %add.ptr111 = getelementptr inbounds i8, i8* %call2, i64 %k.2, !dbg !461
  %idxprom112 = sext i32 %n.0 to i64, !dbg !462
  %arrayidx113 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom112, !dbg !462
  %repl114 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx113, i32 0, i32 1, !dbg !463
  store i8* %add.ptr111, i8** %repl114, align 8, !dbg !464
  br label %if.end115

if.end115:                                        ; preds = %if.else, %if.then101
  %inc116 = add nsw i32 %n.0, 1, !dbg !465
  call void @llvm.dbg.value(metadata i32 %inc116, metadata !315, metadata !DIExpression()), !dbg !272
  %add117 = add i64 %i.0, 1, !dbg !466
  call void @llvm.dbg.value(metadata i64 %add117, metadata !337, metadata !DIExpression()), !dbg !272
  br label %for.inc118, !dbg !467

for.inc118:                                       ; preds = %if.end115, %if.then25, %if.then17
  %j.1 = phi i64 [ %j.0, %if.then17 ], [ %add26, %if.then25 ], [ %add117, %if.end115 ], !dbg !342
  %rules.1 = phi %struct.rule_t* [ %rules.0, %if.then17 ], [ %rules.0, %if.then25 ], [ %19, %if.end115 ], !dbg !272
  %n.1 = phi i32 [ %n.0, %if.then17 ], [ %n.0, %if.then25 ], [ %inc116, %if.end115 ], !dbg !272
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !315, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata %struct.rule_t* %rules.1, metadata !314, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.value(metadata i64 %j.1, metadata !337, metadata !DIExpression()), !dbg !272
  %inc119 = add i64 %i.0, 1, !dbg !468
  call void @llvm.dbg.value(metadata i64 %inc119, metadata !338, metadata !DIExpression()), !dbg !272
  br label %for.cond, !dbg !469, !llvm.loop !470

for.end120:                                       ; preds = %if.then66, %if.then46, %for.cond
  %call121 = call noalias i8* @malloc(i64 24) #7, !dbg !472
  %21 = bitcast i8* %call121 to %struct.ruleset_t*, !dbg !472
  call void @llvm.dbg.value(metadata %struct.ruleset_t* %21, metadata !473, metadata !DIExpression()), !dbg !272
  %buf122 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %21, i32 0, i32 2, !dbg !474
  store i8* %call2, i8** %buf122, align 8, !dbg !475
  %rules123 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %21, i32 0, i32 1, !dbg !476
  store %struct.rule_t* %rules.0, %struct.rule_t** %rules123, align 8, !dbg !477
  %n124 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %21, i32 0, i32 0, !dbg !478
  store i32 %n.0, i32* %n124, align 8, !dbg !479
  br label %return, !dbg !480

return:                                           ; preds = %for.end120, %if.then
  %retval.0 = phi %struct.ruleset_t* [ null, %if.then ], [ %21, %for.end120 ], !dbg !272
  ret %struct.ruleset_t* %retval.0, !dbg !481
}

declare dso_local i32 @open(i8*, i32, ...) #5

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #2

declare dso_local i64 @read(i32, i8*, i64) #5

declare dso_local i32 @close(i32) #5

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #6

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test_rules(i8* %s, i8* %file) #0 !dbg !482 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !485, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.value(metadata i8* %file, metadata !487, metadata !DIExpression()), !dbg !486
  %call = call %struct.ruleset_t* @read_rules(i8* %file), !dbg !488
  call void @llvm.dbg.value(metadata %struct.ruleset_t* %call, metadata !489, metadata !DIExpression()), !dbg !486
  %tobool = icmp ne %struct.ruleset_t* %call, null, !dbg !490
  br i1 %tobool, label %if.end, label %if.then, !dbg !492, !cf.info !52

if.then:                                          ; preds = %entry
  br label %return, !dbg !493

if.end:                                           ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8* %file), !dbg !494
  %call2 = call %struct.string* @str_new(i8* %s), !dbg !495
  call void @llvm.dbg.value(metadata %struct.string* %call2, metadata !496, metadata !DIExpression()), !dbg !486
  %s3 = getelementptr inbounds %struct.string, %struct.string* %call2, i32 0, i32 0, !dbg !497
  %0 = load i8*, i8** %s3, align 8, !dbg !497
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i8* %0), !dbg !498
  call void @str_markov(%struct.string* %call2, %struct.ruleset_t* %call), !dbg !499
  %s5 = getelementptr inbounds %struct.string, %struct.string* %call2, i32 0, i32 0, !dbg !500
  %1 = load i8*, i8** %s5, align 8, !dbg !500
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i8* %1), !dbg !501
  call void @str_del(%struct.string* %call2), !dbg !502
  call void @ruleset_del(%struct.ruleset_t* %call), !dbg !503
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !504
  br label %return, !dbg !505

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %call7, %if.end ], [ 0, %if.then ], !dbg !486
  ret i32 %retval.0, !dbg !506
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !507 {
entry:
  %call = call i32 @test_rules(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0)), !dbg !510
  %call1 = call i32 @test_rules(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0)), !dbg !511
  %call2 = call i32 @test_rules(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0)), !dbg !512
  %call3 = call i32 @test_rules(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0)), !dbg !513
  %call4 = call i32 @test_rules(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i64 0, i64 0)), !dbg !514
  ret i32 0, !dbg !515
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "execute-a-markov-algorithm-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Execute-a-Markov-algorithm")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 46, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18}
!7 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!8 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!9 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!10 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!11 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!12 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!13 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!14 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!15 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!16 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!17 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!18 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!26 = distinct !DISubprogram(name: "ruleset_del", scope: !1, file: !1, line: 23, type: !27, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "ruleset_t", file: !1, line: 21, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 17, size: 192, elements: !32)
!32 = !{!33, !34, !44}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !31, file: !1, line: 18, baseType: !20, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "rules", scope: !31, file: !1, line: 19, baseType: !35, size: 64, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "rule_t", file: !1, line: 15, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 12, size: 192, elements: !38)
!38 = !{!39, !42, !43}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "pat", scope: !37, file: !1, line: 13, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "repl", scope: !37, file: !1, line: 13, baseType: !40, size: 64, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "terminate", scope: !37, file: !1, line: 14, baseType: !20, size: 32, offset: 128)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !31, file: !1, line: 20, baseType: !40, size: 64, offset: 128)
!45 = !{}
!46 = !DILocalVariable(name: "r", arg: 1, scope: !26, file: !1, line: 23, type: !29)
!47 = !DILocation(line: 0, scope: !26)
!48 = !DILocation(line: 25, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !26, file: !1, line: 25, column: 6)
!50 = !DILocation(line: 25, column: 6, scope: !49)
!51 = !DILocation(line: 25, column: 6, scope: !26)
!52 = !{!"if"}
!53 = !DILocation(line: 25, column: 24, scope: !49)
!54 = !DILocation(line: 25, column: 21, scope: !49)
!55 = !DILocation(line: 25, column: 16, scope: !49)
!56 = !DILocation(line: 26, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !26, file: !1, line: 26, column: 6)
!58 = !DILocation(line: 26, column: 6, scope: !57)
!59 = !DILocation(line: 26, column: 6, scope: !26)
!60 = !DILocation(line: 26, column: 22, scope: !57)
!61 = !DILocation(line: 26, column: 14, scope: !57)
!62 = !DILocation(line: 27, column: 7, scope: !26)
!63 = !DILocation(line: 27, column: 2, scope: !26)
!64 = !DILocation(line: 28, column: 1, scope: !26)
!65 = distinct !DISubprogram(name: "str_new", scope: !1, file: !1, line: 30, type: !66, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !77}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", file: !1, line: 10, baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 10, size: 128, elements: !71)
!71 = !{!72, !73}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !70, file: !1, line: 10, baseType: !40, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "alloc_len", scope: !70, file: !1, line: 10, baseType: !74, size: 64, offset: 64)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 46, baseType: !76)
!75 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!79 = !DILocalVariable(name: "s", arg: 1, scope: !65, file: !1, line: 30, type: !77)
!80 = !DILocation(line: 0, scope: !65)
!81 = !DILocation(line: 32, column: 10, scope: !65)
!82 = !DILocalVariable(name: "l", scope: !65, file: !1, line: 32, type: !20)
!83 = !DILocation(line: 33, column: 16, scope: !65)
!84 = !DILocalVariable(name: "str", scope: !65, file: !1, line: 33, type: !68)
!85 = !DILocation(line: 34, column: 20, scope: !65)
!86 = !DILocation(line: 34, column: 18, scope: !65)
!87 = !DILocation(line: 34, column: 11, scope: !65)
!88 = !DILocation(line: 34, column: 7, scope: !65)
!89 = !DILocation(line: 34, column: 9, scope: !65)
!90 = !DILocation(line: 35, column: 14, scope: !65)
!91 = !DILocation(line: 35, column: 2, scope: !65)
!92 = !DILocation(line: 36, column: 21, scope: !65)
!93 = !DILocation(line: 36, column: 19, scope: !65)
!94 = !DILocation(line: 36, column: 7, scope: !65)
!95 = !DILocation(line: 36, column: 17, scope: !65)
!96 = !DILocation(line: 37, column: 2, scope: !65)
!97 = distinct !DISubprogram(name: "str_append", scope: !1, file: !1, line: 40, type: !98, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!98 = !DISubroutineType(types: !99)
!99 = !{null, !68, !77, !20}
!100 = !DILocalVariable(name: "str", arg: 1, scope: !97, file: !1, line: 40, type: !68)
!101 = !DILocation(line: 0, scope: !97)
!102 = !DILocalVariable(name: "s", arg: 2, scope: !97, file: !1, line: 40, type: !77)
!103 = !DILocalVariable(name: "len", arg: 3, scope: !97, file: !1, line: 40, type: !20)
!104 = !DILocation(line: 42, column: 22, scope: !97)
!105 = !DILocation(line: 42, column: 10, scope: !97)
!106 = !DILocalVariable(name: "l", scope: !97, file: !1, line: 42, type: !20)
!107 = !DILocation(line: 43, column: 10, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !1, line: 43, column: 6)
!109 = !DILocation(line: 43, column: 6, scope: !97)
!110 = !DILocation(line: 43, column: 23, scope: !108)
!111 = !DILocation(line: 43, column: 17, scope: !108)
!112 = !DILocation(line: 45, column: 11, scope: !113)
!113 = distinct !DILexicalBlock(scope: !97, file: !1, line: 45, column: 6)
!114 = !DILocation(line: 45, column: 25, scope: !113)
!115 = !DILocation(line: 45, column: 31, scope: !113)
!116 = !DILocation(line: 45, column: 23, scope: !113)
!117 = !DILocation(line: 45, column: 21, scope: !113)
!118 = !DILocation(line: 45, column: 6, scope: !97)
!119 = !DILocation(line: 46, column: 22, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !1, line: 45, column: 36)
!121 = !DILocation(line: 46, column: 28, scope: !120)
!122 = !DILocation(line: 46, column: 20, scope: !120)
!123 = !DILocation(line: 46, column: 8, scope: !120)
!124 = !DILocation(line: 46, column: 18, scope: !120)
!125 = !DILocation(line: 47, column: 25, scope: !120)
!126 = !DILocation(line: 47, column: 33, scope: !120)
!127 = !DILocation(line: 47, column: 12, scope: !120)
!128 = !DILocation(line: 47, column: 8, scope: !120)
!129 = !DILocation(line: 47, column: 10, scope: !120)
!130 = !DILocation(line: 48, column: 2, scope: !120)
!131 = !DILocation(line: 49, column: 14, scope: !97)
!132 = !DILocation(line: 49, column: 16, scope: !97)
!133 = !DILocation(line: 49, column: 24, scope: !97)
!134 = !DILocation(line: 49, column: 2, scope: !97)
!135 = !DILocation(line: 50, column: 7, scope: !97)
!136 = !DILocation(line: 50, column: 11, scope: !97)
!137 = !DILocation(line: 50, column: 2, scope: !97)
!138 = !DILocation(line: 50, column: 18, scope: !97)
!139 = !DILocation(line: 51, column: 1, scope: !97)
!140 = distinct !DISubprogram(name: "str_transfer", scope: !1, file: !1, line: 54, type: !141, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!141 = !DISubroutineType(types: !142)
!142 = !{null, !68, !68}
!143 = !DILocalVariable(name: "dest", arg: 1, scope: !140, file: !1, line: 54, type: !68)
!144 = !DILocation(line: 0, scope: !140)
!145 = !DILocalVariable(name: "src", arg: 2, scope: !140, file: !1, line: 54, type: !68)
!146 = !DILocation(line: 56, column: 22, scope: !140)
!147 = !DILocalVariable(name: "tlen", scope: !140, file: !1, line: 56, type: !74)
!148 = !DILocation(line: 57, column: 25, scope: !140)
!149 = !DILocation(line: 57, column: 8, scope: !140)
!150 = !DILocation(line: 57, column: 18, scope: !140)
!151 = !DILocation(line: 58, column: 7, scope: !140)
!152 = !DILocation(line: 58, column: 17, scope: !140)
!153 = !DILocation(line: 60, column: 19, scope: !140)
!154 = !DILocalVariable(name: "ts", scope: !140, file: !1, line: 60, type: !40)
!155 = !DILocation(line: 61, column: 17, scope: !140)
!156 = !DILocation(line: 61, column: 8, scope: !140)
!157 = !DILocation(line: 61, column: 10, scope: !140)
!158 = !DILocation(line: 62, column: 7, scope: !140)
!159 = !DILocation(line: 62, column: 9, scope: !140)
!160 = !DILocation(line: 63, column: 7, scope: !140)
!161 = !DILocation(line: 63, column: 2, scope: !140)
!162 = !DILocation(line: 63, column: 12, scope: !140)
!163 = !DILocation(line: 64, column: 1, scope: !140)
!164 = distinct !DISubprogram(name: "str_del", scope: !1, file: !1, line: 66, type: !165, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!165 = !DISubroutineType(types: !166)
!166 = !{null, !68}
!167 = !DILocalVariable(name: "s", arg: 1, scope: !164, file: !1, line: 66, type: !68)
!168 = !DILocation(line: 0, scope: !164)
!169 = !DILocation(line: 68, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !164, file: !1, line: 68, column: 6)
!171 = !DILocation(line: 68, column: 6, scope: !170)
!172 = !DILocation(line: 68, column: 6, scope: !164)
!173 = !DILocation(line: 68, column: 20, scope: !170)
!174 = !DILocation(line: 68, column: 12, scope: !170)
!175 = !DILocation(line: 69, column: 7, scope: !164)
!176 = !DILocation(line: 69, column: 2, scope: !164)
!177 = !DILocation(line: 70, column: 1, scope: !164)
!178 = distinct !DISubprogram(name: "str_markov", scope: !1, file: !1, line: 72, type: !179, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!179 = !DISubroutineType(types: !180)
!180 = !{null, !68, !29}
!181 = !DILocalVariable(name: "str", arg: 1, scope: !178, file: !1, line: 72, type: !68)
!182 = !DILocation(line: 0, scope: !178)
!183 = !DILocalVariable(name: "r", arg: 2, scope: !178, file: !1, line: 72, type: !29)
!184 = !DILocalVariable(name: "changed", scope: !178, file: !1, line: 75, type: !20)
!185 = !DILocalVariable(name: "done", scope: !178, file: !1, line: 75, type: !20)
!186 = !DILocation(line: 76, column: 16, scope: !178)
!187 = !DILocalVariable(name: "tmp", scope: !178, file: !1, line: 76, type: !68)
!188 = !DILocation(line: 78, column: 2, scope: !178)
!189 = !DILocation(line: 75, column: 19, scope: !178)
!190 = !DILocation(line: 78, column: 9, scope: !178)
!191 = !DILocalVariable(name: "i", scope: !178, file: !1, line: 74, type: !20)
!192 = !DILocation(line: 80, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !194, file: !1, line: 80, column: 3)
!194 = distinct !DILexicalBlock(scope: !178, file: !1, line: 78, column: 16)
!195 = !DILocation(line: 0, scope: !193)
!196 = !DILocation(line: 0, scope: !194)
!197 = !DILocation(line: 80, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !1, line: 80, column: 3)
!199 = !DILocation(line: 80, column: 21, scope: !198)
!200 = !DILocation(line: 80, column: 25, scope: !198)
!201 = !DILocation(line: 80, column: 33, scope: !198)
!202 = !DILocation(line: 80, column: 43, scope: !198)
!203 = !DILocation(line: 80, column: 38, scope: !198)
!204 = !DILocation(line: 0, scope: !198)
!205 = !DILocation(line: 80, column: 3, scope: !193)
!206 = !DILocation(line: 81, column: 19, scope: !207)
!207 = distinct !DILexicalBlock(scope: !198, file: !1, line: 80, column: 51)
!208 = !DILocation(line: 81, column: 16, scope: !207)
!209 = !DILocation(line: 81, column: 28, scope: !207)
!210 = !DILocation(line: 81, column: 9, scope: !207)
!211 = !DILocalVariable(name: "pl", scope: !178, file: !1, line: 74, type: !20)
!212 = !DILocation(line: 82, column: 21, scope: !207)
!213 = !DILocation(line: 82, column: 9, scope: !207)
!214 = !DILocalVariable(name: "sl", scope: !178, file: !1, line: 74, type: !20)
!215 = !DILocalVariable(name: "j", scope: !178, file: !1, line: 74, type: !20)
!216 = !DILocation(line: 83, column: 9, scope: !217)
!217 = distinct !DILexicalBlock(scope: !207, file: !1, line: 83, column: 4)
!218 = !DILocation(line: 0, scope: !217)
!219 = !DILocation(line: 83, column: 18, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !1, line: 83, column: 4)
!221 = !DILocation(line: 83, column: 4, scope: !217)
!222 = !DILocation(line: 84, column: 22, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 84, column: 9)
!224 = distinct !DILexicalBlock(scope: !220, file: !1, line: 83, column: 29)
!225 = !DILocation(line: 84, column: 24, scope: !223)
!226 = !DILocation(line: 84, column: 32, scope: !223)
!227 = !DILocation(line: 84, column: 29, scope: !223)
!228 = !DILocation(line: 84, column: 41, scope: !223)
!229 = !DILocation(line: 84, column: 46, scope: !223)
!230 = !DILocation(line: 84, column: 9, scope: !223)
!231 = !DILocation(line: 84, column: 9, scope: !224)
!232 = !DILocation(line: 85, column: 6, scope: !223)
!233 = !DILocation(line: 86, column: 26, scope: !224)
!234 = !DILocation(line: 86, column: 5, scope: !224)
!235 = !DILocation(line: 87, column: 24, scope: !224)
!236 = !DILocation(line: 87, column: 21, scope: !224)
!237 = !DILocation(line: 87, column: 33, scope: !224)
!238 = !DILocation(line: 87, column: 5, scope: !224)
!239 = !DILocation(line: 88, column: 26, scope: !224)
!240 = !DILocation(line: 88, column: 28, scope: !224)
!241 = !DILocation(line: 88, column: 32, scope: !224)
!242 = !DILocation(line: 88, column: 5, scope: !224)
!243 = !DILocation(line: 90, column: 5, scope: !224)
!244 = !DILocation(line: 93, column: 12, scope: !245)
!245 = distinct !DILexicalBlock(scope: !224, file: !1, line: 93, column: 9)
!246 = !DILocation(line: 93, column: 9, scope: !245)
!247 = !DILocation(line: 93, column: 21, scope: !245)
!248 = !DILocation(line: 93, column: 9, scope: !224)
!249 = !DILocation(line: 94, column: 6, scope: !245)
!250 = !DILocation(line: 95, column: 5, scope: !224)
!251 = !DILocation(line: 83, column: 25, scope: !220)
!252 = !DILocation(line: 83, column: 4, scope: !220)
!253 = distinct !{!253, !221, !254}
!254 = !DILocation(line: 96, column: 4, scope: !217)
!255 = !DILocation(line: 97, column: 3, scope: !207)
!256 = !DILocation(line: 80, column: 47, scope: !198)
!257 = !DILocation(line: 80, column: 3, scope: !198)
!258 = distinct !{!258, !205, !259}
!259 = !DILocation(line: 97, column: 3, scope: !193)
!260 = !DILocation(line: 98, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !194, file: !1, line: 98, column: 7)
!262 = !DILocation(line: 98, column: 7, scope: !194)
!263 = !DILocation(line: 98, column: 17, scope: !261)
!264 = distinct !{!264, !188, !265}
!265 = !DILocation(line: 99, column: 2, scope: !178)
!266 = !DILocation(line: 100, column: 2, scope: !178)
!267 = !DILocation(line: 101, column: 2, scope: !178)
!268 = distinct !DISubprogram(name: "read_rules", scope: !1, file: !1, line: 104, type: !269, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!269 = !DISubroutineType(types: !270)
!270 = !{!29, !77}
!271 = !DILocalVariable(name: "name", arg: 1, scope: !268, file: !1, line: 104, type: !77)
!272 = !DILocation(line: 0, scope: !268)
!273 = !DILocalVariable(name: "s", scope: !268, file: !1, line: 106, type: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !275, line: 46, size: 1152, elements: !276)
!275 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!276 = !{!277, !280, !282, !284, !286, !288, !290, !291, !292, !295, !297, !299, !307, !308, !309}
!277 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !274, file: !275, line: 48, baseType: !278, size: 64)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !279, line: 145, baseType: !76)
!279 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!280 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !274, file: !275, line: 53, baseType: !281, size: 64, offset: 64)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !279, line: 148, baseType: !76)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !274, file: !275, line: 61, baseType: !283, size: 64, offset: 128)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !279, line: 151, baseType: !76)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !274, file: !275, line: 62, baseType: !285, size: 32, offset: 192)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !279, line: 150, baseType: !5)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !274, file: !275, line: 64, baseType: !287, size: 32, offset: 224)
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !279, line: 146, baseType: !5)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !274, file: !275, line: 65, baseType: !289, size: 32, offset: 256)
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !279, line: 147, baseType: !5)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !274, file: !275, line: 67, baseType: !20, size: 32, offset: 288)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !274, file: !275, line: 69, baseType: !278, size: 64, offset: 320)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !274, file: !275, line: 74, baseType: !293, size: 64, offset: 384)
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !279, line: 152, baseType: !294)
!294 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !274, file: !275, line: 78, baseType: !296, size: 64, offset: 448)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !279, line: 174, baseType: !294)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !274, file: !275, line: 80, baseType: !298, size: 64, offset: 512)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !279, line: 179, baseType: !294)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !274, file: !275, line: 91, baseType: !300, size: 128, offset: 576)
!300 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !301, line: 10, size: 128, elements: !302)
!301 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!302 = !{!303, !305}
!303 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !300, file: !301, line: 12, baseType: !304, size: 64)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !279, line: 160, baseType: !294)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !300, file: !301, line: 16, baseType: !306, size: 64, offset: 64)
!306 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !279, line: 196, baseType: !294)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !274, file: !275, line: 92, baseType: !300, size: 128, offset: 704)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !274, file: !275, line: 93, baseType: !300, size: 128, offset: 832)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !274, file: !275, line: 106, baseType: !310, size: 192, offset: 960)
!310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !306, size: 192, elements: !311)
!311 = !{!312}
!312 = !DISubrange(count: 3)
!313 = !DILocation(line: 106, column: 14, scope: !268)
!314 = !DILocalVariable(name: "rules", scope: !268, file: !1, line: 109, type: !35)
!315 = !DILocalVariable(name: "n", scope: !268, file: !1, line: 110, type: !20)
!316 = !DILocation(line: 112, column: 11, scope: !268)
!317 = !DILocalVariable(name: "fd", scope: !268, file: !1, line: 112, type: !20)
!318 = !DILocation(line: 113, column: 9, scope: !319)
!319 = distinct !DILexicalBlock(scope: !268, file: !1, line: 113, column: 6)
!320 = !DILocation(line: 113, column: 6, scope: !268)
!321 = !DILocation(line: 113, column: 16, scope: !319)
!322 = !DILocation(line: 115, column: 2, scope: !268)
!323 = !DILocation(line: 116, column: 17, scope: !268)
!324 = !DILocation(line: 116, column: 25, scope: !268)
!325 = !DILocation(line: 116, column: 8, scope: !268)
!326 = !DILocalVariable(name: "buf", scope: !268, file: !1, line: 107, type: !40)
!327 = !DILocation(line: 117, column: 18, scope: !268)
!328 = !DILocation(line: 117, column: 2, scope: !268)
!329 = !DILocation(line: 118, column: 8, scope: !268)
!330 = !DILocation(line: 118, column: 2, scope: !268)
!331 = !DILocation(line: 118, column: 17, scope: !268)
!332 = !DILocation(line: 119, column: 8, scope: !268)
!333 = !DILocation(line: 119, column: 16, scope: !268)
!334 = !DILocation(line: 119, column: 2, scope: !268)
!335 = !DILocation(line: 119, column: 21, scope: !268)
!336 = !DILocation(line: 120, column: 2, scope: !268)
!337 = !DILocalVariable(name: "j", scope: !268, file: !1, line: 108, type: !74)
!338 = !DILocalVariable(name: "i", scope: !268, file: !1, line: 108, type: !74)
!339 = !DILocation(line: 122, column: 7, scope: !340)
!340 = distinct !DILexicalBlock(scope: !268, file: !1, line: 122, column: 2)
!341 = !DILocation(line: 122, column: 13, scope: !340)
!342 = !DILocation(line: 0, scope: !340)
!343 = !DILocation(line: 109, column: 10, scope: !268)
!344 = !DILocation(line: 110, column: 6, scope: !268)
!345 = !DILocation(line: 122, column: 18, scope: !346)
!346 = distinct !DILexicalBlock(scope: !340, file: !1, line: 122, column: 2)
!347 = !DILocation(line: 122, column: 25, scope: !346)
!348 = !DILocation(line: 122, column: 2, scope: !340)
!349 = !DILocation(line: 123, column: 7, scope: !350)
!350 = distinct !DILexicalBlock(scope: !351, file: !1, line: 123, column: 7)
!351 = distinct !DILexicalBlock(scope: !346, file: !1, line: 122, column: 39)
!352 = !DILocation(line: 123, column: 14, scope: !350)
!353 = !DILocation(line: 123, column: 7, scope: !351)
!354 = !DILocation(line: 123, column: 23, scope: !350)
!355 = !DILocation(line: 126, column: 7, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !1, line: 126, column: 7)
!357 = !DILocation(line: 126, column: 14, scope: !356)
!358 = !DILocation(line: 126, column: 21, scope: !356)
!359 = !DILocation(line: 126, column: 26, scope: !356)
!360 = !DILocation(line: 126, column: 7, scope: !351)
!361 = !DILocation(line: 127, column: 10, scope: !362)
!362 = distinct !DILexicalBlock(scope: !356, file: !1, line: 126, column: 32)
!363 = !DILocation(line: 128, column: 4, scope: !362)
!364 = !DILocation(line: 132, column: 14, scope: !365)
!365 = distinct !DILexicalBlock(scope: !351, file: !1, line: 132, column: 3)
!366 = !DILocalVariable(name: "k", scope: !268, file: !1, line: 108, type: !74)
!367 = !DILocation(line: 132, column: 8, scope: !365)
!368 = !DILocation(line: 0, scope: !365)
!369 = !DILocation(line: 132, column: 25, scope: !370)
!370 = distinct !DILexicalBlock(scope: !365, file: !1, line: 132, column: 3)
!371 = !DILocation(line: 132, column: 21, scope: !370)
!372 = !DILocation(line: 132, column: 3, scope: !365)
!373 = !DILocation(line: 133, column: 8, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !1, line: 133, column: 8)
!375 = !DILocation(line: 133, column: 24, scope: !374)
!376 = !DILocation(line: 133, column: 40, scope: !374)
!377 = !DILocation(line: 133, column: 44, scope: !374)
!378 = !DILocation(line: 133, column: 28, scope: !374)
!379 = !DILocation(line: 133, column: 8, scope: !370)
!380 = !DILocation(line: 134, column: 5, scope: !374)
!381 = !DILocation(line: 133, column: 56, scope: !374)
!382 = !DILocation(line: 132, column: 31, scope: !370)
!383 = !DILocation(line: 132, column: 3, scope: !370)
!384 = distinct !{!384, !372, !385}
!385 = !DILocation(line: 134, column: 5, scope: !365)
!386 = !DILocation(line: 136, column: 14, scope: !387)
!387 = distinct !DILexicalBlock(scope: !351, file: !1, line: 136, column: 7)
!388 = !DILocation(line: 136, column: 9, scope: !387)
!389 = !DILocation(line: 136, column: 7, scope: !351)
!390 = !DILocation(line: 137, column: 45, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !1, line: 136, column: 19)
!392 = !DILocation(line: 137, column: 54, scope: !391)
!393 = !DILocation(line: 137, column: 4, scope: !391)
!394 = !DILocation(line: 138, column: 4, scope: !391)
!395 = !DILocalVariable(name: "tmp", scope: !268, file: !1, line: 108, type: !74)
!396 = !DILocation(line: 142, column: 8, scope: !397)
!397 = distinct !DILexicalBlock(scope: !351, file: !1, line: 142, column: 3)
!398 = !DILocation(line: 0, scope: !397)
!399 = !DILocation(line: 142, column: 21, scope: !400)
!400 = distinct !DILexicalBlock(scope: !397, file: !1, line: 142, column: 3)
!401 = !DILocation(line: 142, column: 25, scope: !400)
!402 = !DILocation(line: 142, column: 28, scope: !400)
!403 = !DILocation(line: 0, scope: !400)
!404 = !DILocation(line: 142, column: 3, scope: !397)
!405 = !DILocation(line: 142, column: 3, scope: !400)
!406 = distinct !{!406, !404, !407}
!407 = !DILocation(line: 142, column: 50, scope: !397)
!408 = !DILocation(line: 143, column: 11, scope: !409)
!409 = distinct !DILexicalBlock(scope: !351, file: !1, line: 143, column: 7)
!410 = !DILocation(line: 143, column: 7, scope: !351)
!411 = !DILocation(line: 144, column: 40, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !1, line: 143, column: 16)
!413 = !DILocation(line: 144, column: 49, scope: !412)
!414 = !DILocation(line: 144, column: 4, scope: !412)
!415 = !DILocation(line: 145, column: 4, scope: !412)
!416 = !DILocation(line: 147, column: 7, scope: !351)
!417 = !DILocation(line: 147, column: 3, scope: !351)
!418 = !DILocation(line: 147, column: 14, scope: !351)
!419 = !DILocation(line: 150, column: 10, scope: !420)
!420 = distinct !DILexicalBlock(scope: !351, file: !1, line: 150, column: 3)
!421 = !DILocation(line: 150, column: 8, scope: !420)
!422 = !DILocation(line: 0, scope: !420)
!423 = !DILocation(line: 150, column: 18, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !1, line: 150, column: 3)
!425 = !DILocation(line: 150, column: 22, scope: !424)
!426 = !DILocation(line: 150, column: 25, scope: !424)
!427 = !DILocation(line: 0, scope: !424)
!428 = !DILocation(line: 150, column: 3, scope: !420)
!429 = !DILocation(line: 150, column: 3, scope: !424)
!430 = distinct !{!430, !428, !431}
!431 = !DILocation(line: 150, column: 44, scope: !420)
!432 = !DILocation(line: 151, column: 3, scope: !351)
!433 = !DILocation(line: 151, column: 10, scope: !351)
!434 = !DILocation(line: 153, column: 19, scope: !351)
!435 = !DILocation(line: 153, column: 46, scope: !351)
!436 = !DILocation(line: 153, column: 43, scope: !351)
!437 = !DILocation(line: 153, column: 41, scope: !351)
!438 = !DILocation(line: 153, column: 11, scope: !351)
!439 = !DILocation(line: 154, column: 22, scope: !351)
!440 = !DILocation(line: 154, column: 3, scope: !351)
!441 = !DILocation(line: 154, column: 12, scope: !351)
!442 = !DILocation(line: 154, column: 16, scope: !351)
!443 = !DILocation(line: 156, column: 7, scope: !444)
!444 = distinct !DILexicalBlock(scope: !351, file: !1, line: 156, column: 7)
!445 = !DILocation(line: 156, column: 14, scope: !444)
!446 = !DILocation(line: 156, column: 7, scope: !351)
!447 = !DILocation(line: 157, column: 4, scope: !448)
!448 = distinct !DILexicalBlock(scope: !444, file: !1, line: 156, column: 22)
!449 = !DILocation(line: 157, column: 13, scope: !448)
!450 = !DILocation(line: 157, column: 23, scope: !448)
!451 = !DILocation(line: 158, column: 24, scope: !448)
!452 = !DILocation(line: 158, column: 28, scope: !448)
!453 = !DILocation(line: 158, column: 4, scope: !448)
!454 = !DILocation(line: 158, column: 13, scope: !448)
!455 = !DILocation(line: 158, column: 18, scope: !448)
!456 = !DILocation(line: 159, column: 3, scope: !448)
!457 = !DILocation(line: 160, column: 4, scope: !458)
!458 = distinct !DILexicalBlock(scope: !444, file: !1, line: 159, column: 10)
!459 = !DILocation(line: 160, column: 13, scope: !458)
!460 = !DILocation(line: 160, column: 23, scope: !458)
!461 = !DILocation(line: 161, column: 24, scope: !458)
!462 = !DILocation(line: 161, column: 4, scope: !458)
!463 = !DILocation(line: 161, column: 13, scope: !458)
!464 = !DILocation(line: 161, column: 18, scope: !458)
!465 = !DILocation(line: 163, column: 4, scope: !351)
!466 = !DILocation(line: 165, column: 9, scope: !351)
!467 = !DILocation(line: 166, column: 2, scope: !351)
!468 = !DILocation(line: 122, column: 35, scope: !346)
!469 = !DILocation(line: 122, column: 2, scope: !346)
!470 = distinct !{!470, !348, !471}
!471 = !DILocation(line: 166, column: 2, scope: !340)
!472 = !DILocation(line: 168, column: 17, scope: !268)
!473 = !DILocalVariable(name: "r", scope: !268, file: !1, line: 168, type: !29)
!474 = !DILocation(line: 169, column: 5, scope: !268)
!475 = !DILocation(line: 169, column: 9, scope: !268)
!476 = !DILocation(line: 170, column: 5, scope: !268)
!477 = !DILocation(line: 170, column: 11, scope: !268)
!478 = !DILocation(line: 171, column: 5, scope: !268)
!479 = !DILocation(line: 171, column: 7, scope: !268)
!480 = !DILocation(line: 172, column: 2, scope: !268)
!481 = !DILocation(line: 173, column: 1, scope: !268)
!482 = distinct !DISubprogram(name: "test_rules", scope: !1, file: !1, line: 175, type: !483, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!483 = !DISubroutineType(types: !484)
!484 = !{!20, !77, !77}
!485 = !DILocalVariable(name: "s", arg: 1, scope: !482, file: !1, line: 175, type: !77)
!486 = !DILocation(line: 0, scope: !482)
!487 = !DILocalVariable(name: "file", arg: 2, scope: !482, file: !1, line: 175, type: !77)
!488 = !DILocation(line: 177, column: 18, scope: !482)
!489 = !DILocalVariable(name: "r", scope: !482, file: !1, line: 177, type: !29)
!490 = !DILocation(line: 178, column: 7, scope: !491)
!491 = distinct !DILexicalBlock(scope: !482, file: !1, line: 178, column: 6)
!492 = !DILocation(line: 178, column: 6, scope: !482)
!493 = !DILocation(line: 178, column: 10, scope: !491)
!494 = !DILocation(line: 179, column: 2, scope: !482)
!495 = !DILocation(line: 181, column: 15, scope: !482)
!496 = !DILocalVariable(name: "ss", scope: !482, file: !1, line: 181, type: !68)
!497 = !DILocation(line: 182, column: 31, scope: !482)
!498 = !DILocation(line: 182, column: 2, scope: !482)
!499 = !DILocation(line: 184, column: 2, scope: !482)
!500 = !DILocation(line: 185, column: 31, scope: !482)
!501 = !DILocation(line: 185, column: 2, scope: !482)
!502 = !DILocation(line: 187, column: 2, scope: !482)
!503 = !DILocation(line: 188, column: 2, scope: !482)
!504 = !DILocation(line: 190, column: 9, scope: !482)
!505 = !DILocation(line: 190, column: 2, scope: !482)
!506 = !DILocation(line: 191, column: 1, scope: !482)
!507 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 193, type: !508, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!508 = !DISubroutineType(types: !509)
!509 = !{!20}
!510 = !DILocation(line: 196, column: 2, scope: !507)
!511 = !DILocation(line: 197, column: 2, scope: !507)
!512 = !DILocation(line: 198, column: 2, scope: !507)
!513 = !DILocation(line: 199, column: 2, scope: !507)
!514 = !DILocation(line: 200, column: 2, scope: !507)
!515 = !DILocation(line: 202, column: 2, scope: !507)
