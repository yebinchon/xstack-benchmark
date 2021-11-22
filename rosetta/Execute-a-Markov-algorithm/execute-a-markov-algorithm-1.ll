; ModuleID = 'execute-a-markov-algorithm-1.c'
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
  %r.addr = alloca %struct.ruleset_t*, align 8
  store %struct.ruleset_t* %r, %struct.ruleset_t** %r.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.ruleset_t** %r.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !48
  %rules = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %0, i32 0, i32 1, !dbg !50
  %1 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !50
  %tobool = icmp ne %struct.rule_t* %1, null, !dbg !48
  br i1 %tobool, label %if.then, label %if.end, !dbg !51, !cf.info !52

if.then:                                          ; preds = %entry
  %2 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !53
  %rules1 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %2, i32 0, i32 1, !dbg !54
  %3 = load %struct.rule_t*, %struct.rule_t** %rules1, align 8, !dbg !54
  %4 = bitcast %struct.rule_t* %3 to i8*, !dbg !53
  call void @free(i8* %4) #7, !dbg !55
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !56
  %buf = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %5, i32 0, i32 2, !dbg !58
  %6 = load i8*, i8** %buf, align 8, !dbg !58
  %tobool2 = icmp ne i8* %6, null, !dbg !56
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !59, !cf.info !52

if.then3:                                         ; preds = %if.end
  %7 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !60
  %buf4 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %7, i32 0, i32 2, !dbg !61
  %8 = load i8*, i8** %buf4, align 8, !dbg !61
  call void @free(i8* %8) #7, !dbg !62
  br label %if.end5, !dbg !62

if.end5:                                          ; preds = %if.then3, %if.end
  %9 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !63
  %10 = bitcast %struct.ruleset_t* %9 to i8*, !dbg !63
  call void @free(i8* %10) #7, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.string* @str_new(i8* %s) #0 !dbg !66 {
entry:
  %s.addr = alloca i8*, align 8
  %l = alloca i32, align 4
  %str = alloca %struct.string*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %l, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i8*, i8** %s.addr, align 8, !dbg !84
  %call = call i64 @strlen(i8* %0) #8, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !85
  store i32 %conv, i32* %l, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata %struct.string** %str, metadata !86, metadata !DIExpression()), !dbg !87
  %call1 = call noalias i8* @malloc(i64 16) #7, !dbg !88
  %1 = bitcast i8* %call1 to %struct.string*, !dbg !88
  store %struct.string* %1, %struct.string** %str, align 8, !dbg !87
  %2 = load i32, i32* %l, align 4, !dbg !89
  %add = add nsw i32 %2, 1, !dbg !90
  %conv2 = sext i32 %add to i64, !dbg !89
  %call3 = call noalias i8* @malloc(i64 %conv2) #7, !dbg !91
  %3 = load %struct.string*, %struct.string** %str, align 8, !dbg !92
  %s4 = getelementptr inbounds %struct.string, %struct.string* %3, i32 0, i32 0, !dbg !93
  store i8* %call3, i8** %s4, align 8, !dbg !94
  %4 = load %struct.string*, %struct.string** %str, align 8, !dbg !95
  %s5 = getelementptr inbounds %struct.string, %struct.string* %4, i32 0, i32 0, !dbg !96
  %5 = load i8*, i8** %s5, align 8, !dbg !96
  %6 = load i8*, i8** %s.addr, align 8, !dbg !97
  %call6 = call i8* @strcpy(i8* %5, i8* %6) #7, !dbg !98
  %7 = load i32, i32* %l, align 4, !dbg !99
  %add7 = add nsw i32 %7, 1, !dbg !100
  %conv8 = sext i32 %add7 to i64, !dbg !99
  %8 = load %struct.string*, %struct.string** %str, align 8, !dbg !101
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %8, i32 0, i32 1, !dbg !102
  store i64 %conv8, i64* %alloc_len, align 8, !dbg !103
  %9 = load %struct.string*, %struct.string** %str, align 8, !dbg !104
  ret %struct.string* %9, !dbg !105
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_append(%struct.string* %str, i8* %s, i32 %len) #0 !dbg !106 {
entry:
  %str.addr = alloca %struct.string*, align 8
  %s.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %l = alloca i32, align 4
  store %struct.string* %str, %struct.string** %str.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.string** %str.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %l, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !117
  %s1 = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 0, !dbg !118
  %1 = load i8*, i8** %s1, align 8, !dbg !118
  %call = call i64 @strlen(i8* %1) #8, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !119
  store i32 %conv, i32* %l, align 4, !dbg !116
  %2 = load i32, i32* %len.addr, align 4, !dbg !120
  %cmp = icmp eq i32 %2, -1, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123, !cf.info !52

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %s.addr, align 8, !dbg !124
  %call3 = call i64 @strlen(i8* %3) #8, !dbg !125
  %conv4 = trunc i64 %call3 to i32, !dbg !125
  store i32 %conv4, i32* %len.addr, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !128
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %4, i32 0, i32 1, !dbg !130
  %5 = load i64, i64* %alloc_len, align 8, !dbg !130
  %6 = load i32, i32* %l, align 4, !dbg !131
  %7 = load i32, i32* %len.addr, align 4, !dbg !132
  %add = add nsw i32 %6, %7, !dbg !133
  %add5 = add nsw i32 %add, 1, !dbg !134
  %conv6 = sext i32 %add5 to i64, !dbg !131
  %cmp7 = icmp ult i64 %5, %conv6, !dbg !135
  br i1 %cmp7, label %if.then9, label %if.end18, !dbg !136, !cf.info !52

if.then9:                                         ; preds = %if.end
  %8 = load i32, i32* %l, align 4, !dbg !137
  %9 = load i32, i32* %len.addr, align 4, !dbg !139
  %add10 = add nsw i32 %8, %9, !dbg !140
  %add11 = add nsw i32 %add10, 1, !dbg !141
  %conv12 = sext i32 %add11 to i64, !dbg !137
  %10 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !142
  %alloc_len13 = getelementptr inbounds %struct.string, %struct.string* %10, i32 0, i32 1, !dbg !143
  store i64 %conv12, i64* %alloc_len13, align 8, !dbg !144
  %11 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !145
  %s14 = getelementptr inbounds %struct.string, %struct.string* %11, i32 0, i32 0, !dbg !146
  %12 = load i8*, i8** %s14, align 8, !dbg !146
  %13 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !147
  %alloc_len15 = getelementptr inbounds %struct.string, %struct.string* %13, i32 0, i32 1, !dbg !148
  %14 = load i64, i64* %alloc_len15, align 8, !dbg !148
  %call16 = call i8* @realloc(i8* %12, i64 %14) #7, !dbg !149
  %15 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !150
  %s17 = getelementptr inbounds %struct.string, %struct.string* %15, i32 0, i32 0, !dbg !151
  store i8* %call16, i8** %s17, align 8, !dbg !152
  br label %if.end18, !dbg !153

if.end18:                                         ; preds = %if.then9, %if.end
  %16 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !154
  %s19 = getelementptr inbounds %struct.string, %struct.string* %16, i32 0, i32 0, !dbg !155
  %17 = load i8*, i8** %s19, align 8, !dbg !155
  %18 = load i32, i32* %l, align 4, !dbg !156
  %idx.ext = sext i32 %18 to i64, !dbg !157
  %add.ptr = getelementptr inbounds i8, i8* %17, i64 %idx.ext, !dbg !157
  %19 = load i8*, i8** %s.addr, align 8, !dbg !158
  %20 = load i32, i32* %len.addr, align 4, !dbg !159
  %conv20 = sext i32 %20 to i64, !dbg !159
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %19, i64 %conv20, i1 false), !dbg !160
  %21 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !161
  %s21 = getelementptr inbounds %struct.string, %struct.string* %21, i32 0, i32 0, !dbg !162
  %22 = load i8*, i8** %s21, align 8, !dbg !162
  %23 = load i32, i32* %l, align 4, !dbg !163
  %24 = load i32, i32* %len.addr, align 4, !dbg !164
  %add22 = add nsw i32 %23, %24, !dbg !165
  %idxprom = sext i32 %add22 to i64, !dbg !161
  %arrayidx = getelementptr inbounds i8, i8* %22, i64 %idxprom, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  ret void, !dbg !167
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_transfer(%struct.string* %dest, %struct.string* %src) #0 !dbg !168 {
entry:
  %dest.addr = alloca %struct.string*, align 8
  %src.addr = alloca %struct.string*, align 8
  %tlen = alloca i64, align 8
  %ts = alloca i8*, align 8
  store %struct.string* %dest, %struct.string** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.string** %dest.addr, metadata !171, metadata !DIExpression()), !dbg !172
  store %struct.string* %src, %struct.string** %src.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.string** %src.addr, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %tlen, metadata !175, metadata !DIExpression()), !dbg !176
  %0 = load %struct.string*, %struct.string** %dest.addr, align 8, !dbg !177
  %alloc_len = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 1, !dbg !178
  %1 = load i64, i64* %alloc_len, align 8, !dbg !178
  store i64 %1, i64* %tlen, align 8, !dbg !176
  %2 = load %struct.string*, %struct.string** %src.addr, align 8, !dbg !179
  %alloc_len1 = getelementptr inbounds %struct.string, %struct.string* %2, i32 0, i32 1, !dbg !180
  %3 = load i64, i64* %alloc_len1, align 8, !dbg !180
  %4 = load %struct.string*, %struct.string** %dest.addr, align 8, !dbg !181
  %alloc_len2 = getelementptr inbounds %struct.string, %struct.string* %4, i32 0, i32 1, !dbg !182
  store i64 %3, i64* %alloc_len2, align 8, !dbg !183
  %5 = load i64, i64* %tlen, align 8, !dbg !184
  %6 = load %struct.string*, %struct.string** %src.addr, align 8, !dbg !185
  %alloc_len3 = getelementptr inbounds %struct.string, %struct.string* %6, i32 0, i32 1, !dbg !186
  store i64 %5, i64* %alloc_len3, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i8** %ts, metadata !188, metadata !DIExpression()), !dbg !189
  %7 = load %struct.string*, %struct.string** %dest.addr, align 8, !dbg !190
  %s = getelementptr inbounds %struct.string, %struct.string* %7, i32 0, i32 0, !dbg !191
  %8 = load i8*, i8** %s, align 8, !dbg !191
  store i8* %8, i8** %ts, align 8, !dbg !189
  %9 = load %struct.string*, %struct.string** %src.addr, align 8, !dbg !192
  %s4 = getelementptr inbounds %struct.string, %struct.string* %9, i32 0, i32 0, !dbg !193
  %10 = load i8*, i8** %s4, align 8, !dbg !193
  %11 = load %struct.string*, %struct.string** %dest.addr, align 8, !dbg !194
  %s5 = getelementptr inbounds %struct.string, %struct.string* %11, i32 0, i32 0, !dbg !195
  store i8* %10, i8** %s5, align 8, !dbg !196
  %12 = load i8*, i8** %ts, align 8, !dbg !197
  %13 = load %struct.string*, %struct.string** %src.addr, align 8, !dbg !198
  %s6 = getelementptr inbounds %struct.string, %struct.string* %13, i32 0, i32 0, !dbg !199
  store i8* %12, i8** %s6, align 8, !dbg !200
  %14 = load %struct.string*, %struct.string** %src.addr, align 8, !dbg !201
  %s7 = getelementptr inbounds %struct.string, %struct.string* %14, i32 0, i32 0, !dbg !202
  %15 = load i8*, i8** %s7, align 8, !dbg !202
  %arrayidx = getelementptr inbounds i8, i8* %15, i64 0, !dbg !201
  store i8 0, i8* %arrayidx, align 1, !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_del(%struct.string* %s) #0 !dbg !205 {
entry:
  %s.addr = alloca %struct.string*, align 8
  store %struct.string* %s, %struct.string** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.string** %s.addr, metadata !208, metadata !DIExpression()), !dbg !209
  %0 = load %struct.string*, %struct.string** %s.addr, align 8, !dbg !210
  %s1 = getelementptr inbounds %struct.string, %struct.string* %0, i32 0, i32 0, !dbg !212
  %1 = load i8*, i8** %s1, align 8, !dbg !212
  %tobool = icmp ne i8* %1, null, !dbg !210
  br i1 %tobool, label %if.then, label %if.end, !dbg !213, !cf.info !52

if.then:                                          ; preds = %entry
  %2 = load %struct.string*, %struct.string** %s.addr, align 8, !dbg !214
  %s2 = getelementptr inbounds %struct.string, %struct.string* %2, i32 0, i32 0, !dbg !215
  %3 = load i8*, i8** %s2, align 8, !dbg !215
  call void @free(i8* %3) #7, !dbg !216
  br label %if.end, !dbg !216

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.string*, %struct.string** %s.addr, align 8, !dbg !217
  %5 = bitcast %struct.string* %4 to i8*, !dbg !217
  call void @free(i8* %5) #7, !dbg !218
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_markov(%struct.string* %str, %struct.ruleset_t* %r) #0 !dbg !220 {
entry:
  %str.addr = alloca %struct.string*, align 8
  %r.addr = alloca %struct.ruleset_t*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sl = alloca i32, align 4
  %pl = alloca i32, align 4
  %changed = alloca i32, align 4
  %done = alloca i32, align 4
  %tmp = alloca %struct.string*, align 8
  store %struct.string* %str, %struct.string** %str.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.string** %str.addr, metadata !223, metadata !DIExpression()), !dbg !224
  store %struct.ruleset_t* %r, %struct.ruleset_t** %r.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.ruleset_t** %r.addr, metadata !225, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.declare(metadata i32* %i, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32* %j, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %sl, metadata !231, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata i32* %pl, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %changed, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 0, i32* %changed, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %done, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 0, i32* %done, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata %struct.string** %tmp, metadata !239, metadata !DIExpression()), !dbg !240
  %call = call %struct.string* @str_new(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)), !dbg !241
  store %struct.string* %call, %struct.string** %tmp, align 8, !dbg !240
  br label %while.cond, !dbg !242

while.cond:                                       ; preds = %if.end38, %entry
  %0 = load i32, i32* %done, align 4, !dbg !243
  %tobool = icmp ne i32 %0, 0, !dbg !244
  %lnot = xor i1 %tobool, true, !dbg !244
  br i1 %lnot, label %while.body, label %while.end, !dbg !242

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %changed, align 4, !dbg !245
  store i32 0, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc33, %while.body
  %1 = load i32, i32* %done, align 4, !dbg !250
  %tobool1 = icmp ne i32 %1, 0, !dbg !250
  br i1 %tobool1, label %land.end, label %land.lhs.true, !dbg !252

land.lhs.true:                                    ; preds = %for.cond
  %2 = load i32, i32* %changed, align 4, !dbg !253
  %tobool2 = icmp ne i32 %2, 0, !dbg !253
  br i1 %tobool2, label %land.end, label %land.rhs, !dbg !254

land.rhs:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %i, align 4, !dbg !255
  %4 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !256
  %n = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %4, i32 0, i32 0, !dbg !257
  %5 = load i32, i32* %n, align 8, !dbg !257
  %cmp = icmp slt i32 %3, %5, !dbg !258
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.cond
  %6 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !259
  br i1 %6, label %for.body, label %for.end35, !dbg !260

for.body:                                         ; preds = %land.end
  %7 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !261
  %rules = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %7, i32 0, i32 1, !dbg !263
  %8 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !263
  %9 = load i32, i32* %i, align 4, !dbg !264
  %idxprom = sext i32 %9 to i64, !dbg !261
  %arrayidx = getelementptr inbounds %struct.rule_t, %struct.rule_t* %8, i64 %idxprom, !dbg !261
  %pat = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx, i32 0, i32 0, !dbg !265
  %10 = load i8*, i8** %pat, align 8, !dbg !265
  %call3 = call i64 @strlen(i8* %10) #8, !dbg !266
  %conv = trunc i64 %call3 to i32, !dbg !266
  store i32 %conv, i32* %pl, align 4, !dbg !267
  %11 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !268
  %s = getelementptr inbounds %struct.string, %struct.string* %11, i32 0, i32 0, !dbg !269
  %12 = load i8*, i8** %s, align 8, !dbg !269
  %call4 = call i64 @strlen(i8* %12) #8, !dbg !270
  %conv5 = trunc i64 %call4 to i32, !dbg !270
  store i32 %conv5, i32* %sl, align 4, !dbg !271
  store i32 0, i32* %j, align 4, !dbg !272
  br label %for.cond6, !dbg !274

for.cond6:                                        ; preds = %for.inc, %for.body
  %13 = load i32, i32* %j, align 4, !dbg !275
  %14 = load i32, i32* %sl, align 4, !dbg !277
  %cmp7 = icmp slt i32 %13, %14, !dbg !278
  br i1 %cmp7, label %for.body9, label %for.end, !dbg !279

for.body9:                                        ; preds = %for.cond6
  %15 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !280
  %s10 = getelementptr inbounds %struct.string, %struct.string* %15, i32 0, i32 0, !dbg !283
  %16 = load i8*, i8** %s10, align 8, !dbg !283
  %17 = load i32, i32* %j, align 4, !dbg !284
  %idx.ext = sext i32 %17 to i64, !dbg !285
  %add.ptr = getelementptr inbounds i8, i8* %16, i64 %idx.ext, !dbg !285
  %18 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !286
  %rules11 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %18, i32 0, i32 1, !dbg !287
  %19 = load %struct.rule_t*, %struct.rule_t** %rules11, align 8, !dbg !287
  %20 = load i32, i32* %i, align 4, !dbg !288
  %idxprom12 = sext i32 %20 to i64, !dbg !286
  %arrayidx13 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %19, i64 %idxprom12, !dbg !286
  %pat14 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx13, i32 0, i32 0, !dbg !289
  %21 = load i8*, i8** %pat14, align 8, !dbg !289
  %22 = load i32, i32* %pl, align 4, !dbg !290
  %conv15 = sext i32 %22 to i64, !dbg !290
  %call16 = call i32 @strncmp(i8* %add.ptr, i8* %21, i64 %conv15) #8, !dbg !291
  %tobool17 = icmp ne i32 %call16, 0, !dbg !291
  br i1 %tobool17, label %if.then, label %if.end, !dbg !292, !cf.info !52

if.then:                                          ; preds = %for.body9
  br label %for.inc, !dbg !293

if.end:                                           ; preds = %for.body9
  %23 = load %struct.string*, %struct.string** %tmp, align 8, !dbg !294
  %24 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !295
  %s18 = getelementptr inbounds %struct.string, %struct.string* %24, i32 0, i32 0, !dbg !296
  %25 = load i8*, i8** %s18, align 8, !dbg !296
  %26 = load i32, i32* %j, align 4, !dbg !297
  call void @str_append(%struct.string* %23, i8* %25, i32 %26), !dbg !298
  %27 = load %struct.string*, %struct.string** %tmp, align 8, !dbg !299
  %28 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !300
  %rules19 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %28, i32 0, i32 1, !dbg !301
  %29 = load %struct.rule_t*, %struct.rule_t** %rules19, align 8, !dbg !301
  %30 = load i32, i32* %i, align 4, !dbg !302
  %idxprom20 = sext i32 %30 to i64, !dbg !300
  %arrayidx21 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %29, i64 %idxprom20, !dbg !300
  %repl = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx21, i32 0, i32 1, !dbg !303
  %31 = load i8*, i8** %repl, align 8, !dbg !303
  call void @str_append(%struct.string* %27, i8* %31, i32 -1), !dbg !304
  %32 = load %struct.string*, %struct.string** %tmp, align 8, !dbg !305
  %33 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !306
  %s22 = getelementptr inbounds %struct.string, %struct.string* %33, i32 0, i32 0, !dbg !307
  %34 = load i8*, i8** %s22, align 8, !dbg !307
  %35 = load i32, i32* %j, align 4, !dbg !308
  %idx.ext23 = sext i32 %35 to i64, !dbg !309
  %add.ptr24 = getelementptr inbounds i8, i8* %34, i64 %idx.ext23, !dbg !309
  %36 = load i32, i32* %pl, align 4, !dbg !310
  %idx.ext25 = sext i32 %36 to i64, !dbg !311
  %add.ptr26 = getelementptr inbounds i8, i8* %add.ptr24, i64 %idx.ext25, !dbg !311
  call void @str_append(%struct.string* %32, i8* %add.ptr26, i32 -1), !dbg !312
  %37 = load %struct.string*, %struct.string** %str.addr, align 8, !dbg !313
  %38 = load %struct.string*, %struct.string** %tmp, align 8, !dbg !314
  call void @str_transfer(%struct.string* %37, %struct.string* %38), !dbg !315
  store i32 1, i32* %changed, align 4, !dbg !316
  %39 = load %struct.ruleset_t*, %struct.ruleset_t** %r.addr, align 8, !dbg !317
  %rules27 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %39, i32 0, i32 1, !dbg !319
  %40 = load %struct.rule_t*, %struct.rule_t** %rules27, align 8, !dbg !319
  %41 = load i32, i32* %i, align 4, !dbg !320
  %idxprom28 = sext i32 %41 to i64, !dbg !317
  %arrayidx29 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %40, i64 %idxprom28, !dbg !317
  %terminate = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx29, i32 0, i32 2, !dbg !321
  %42 = load i32, i32* %terminate, align 8, !dbg !321
  %tobool30 = icmp ne i32 %42, 0, !dbg !317
  br i1 %tobool30, label %if.then31, label %if.end32, !dbg !322, !cf.info !52

if.then31:                                        ; preds = %if.end
  store i32 1, i32* %done, align 4, !dbg !323
  br label %if.end32, !dbg !324

if.end32:                                         ; preds = %if.then31, %if.end
  br label %for.end, !dbg !325

for.inc:                                          ; preds = %if.then
  %43 = load i32, i32* %j, align 4, !dbg !326
  %inc = add nsw i32 %43, 1, !dbg !326
  store i32 %inc, i32* %j, align 4, !dbg !326
  br label %for.cond6, !dbg !327, !llvm.loop !328

for.end:                                          ; preds = %if.end32, %for.cond6
  br label %for.inc33, !dbg !330

for.inc33:                                        ; preds = %for.end
  %44 = load i32, i32* %i, align 4, !dbg !331
  %inc34 = add nsw i32 %44, 1, !dbg !331
  store i32 %inc34, i32* %i, align 4, !dbg !331
  br label %for.cond, !dbg !332, !llvm.loop !333

for.end35:                                        ; preds = %land.end
  %45 = load i32, i32* %changed, align 4, !dbg !335
  %tobool36 = icmp ne i32 %45, 0, !dbg !335
  br i1 %tobool36, label %if.end38, label %if.then37, !dbg !337, !cf.info !52

if.then37:                                        ; preds = %for.end35
  br label %while.end, !dbg !338

if.end38:                                         ; preds = %for.end35
  br label %while.cond, !dbg !242, !llvm.loop !339

while.end:                                        ; preds = %if.then37, %while.cond
  %46 = load %struct.string*, %struct.string** %tmp, align 8, !dbg !341
  call void @str_del(%struct.string* %46), !dbg !342
  ret void, !dbg !343
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strncmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.ruleset_t* @read_rules(i8* %name) #0 !dbg !344 {
entry:
  %retval = alloca %struct.ruleset_t*, align 8
  %name.addr = alloca i8*, align 8
  %s = alloca %struct.stat, align 8
  %buf = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  %tmp = alloca i64, align 8
  %rules = alloca %struct.rule_t*, align 8
  %n = alloca i32, align 4
  %fd = alloca i32, align 4
  %r = alloca %struct.ruleset_t*, align 8
  store i8* %name, i8** %name.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %name.addr, metadata !347, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.declare(metadata %struct.stat* %s, metadata !349, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !390, metadata !DIExpression()), !dbg !391
  call void @llvm.dbg.declare(metadata i64* %i, metadata !392, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata i64* %j, metadata !394, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata i64* %k, metadata !396, metadata !DIExpression()), !dbg !397
  call void @llvm.dbg.declare(metadata i64* %tmp, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata %struct.rule_t** %rules, metadata !400, metadata !DIExpression()), !dbg !401
  store %struct.rule_t* null, %struct.rule_t** %rules, align 8, !dbg !401
  call void @llvm.dbg.declare(metadata i32* %n, metadata !402, metadata !DIExpression()), !dbg !403
  store i32 0, i32* %n, align 4, !dbg !403
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !404, metadata !DIExpression()), !dbg !405
  %0 = load i8*, i8** %name.addr, align 8, !dbg !406
  %call = call i32 (i8*, i32, ...) @open(i8* %0, i32 0), !dbg !407
  store i32 %call, i32* %fd, align 4, !dbg !405
  %1 = load i32, i32* %fd, align 4, !dbg !408
  %cmp = icmp eq i32 %1, -1, !dbg !410
  br i1 %cmp, label %if.then, label %if.end, !dbg !411, !cf.info !52

if.then:                                          ; preds = %entry
  store %struct.ruleset_t* null, %struct.ruleset_t** %retval, align 8, !dbg !412
  br label %return, !dbg !412

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %fd, align 4, !dbg !413
  %call1 = call i32 @fstat(i32 %2, %struct.stat* %s) #7, !dbg !414
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !415
  %3 = load i64, i64* %st_size, align 8, !dbg !415
  %add = add nsw i64 %3, 2, !dbg !416
  %call2 = call noalias i8* @malloc(i64 %add) #7, !dbg !417
  store i8* %call2, i8** %buf, align 8, !dbg !418
  %4 = load i32, i32* %fd, align 4, !dbg !419
  %5 = load i8*, i8** %buf, align 8, !dbg !420
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !421
  %6 = load i64, i64* %st_size3, align 8, !dbg !421
  %call4 = call i64 @read(i32 %4, i8* %5, i64 %6), !dbg !422
  %7 = load i8*, i8** %buf, align 8, !dbg !423
  %st_size5 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !424
  %8 = load i64, i64* %st_size5, align 8, !dbg !424
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !423
  store i8 10, i8* %arrayidx, align 1, !dbg !425
  %9 = load i8*, i8** %buf, align 8, !dbg !426
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %s, i32 0, i32 8, !dbg !427
  %10 = load i64, i64* %st_size6, align 8, !dbg !427
  %add7 = add nsw i64 %10, 1, !dbg !428
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i64 %add7, !dbg !426
  store i8 0, i8* %arrayidx8, align 1, !dbg !429
  %11 = load i32, i32* %fd, align 4, !dbg !430
  %call9 = call i32 @close(i32 %11), !dbg !431
  store i64 0, i64* %j, align 8, !dbg !432
  store i64 0, i64* %i, align 8, !dbg !434
  br label %for.cond, !dbg !435

for.cond:                                         ; preds = %for.inc118, %if.end
  %12 = load i8*, i8** %buf, align 8, !dbg !436
  %13 = load i64, i64* %i, align 8, !dbg !438
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !436
  %14 = load i8, i8* %arrayidx10, align 1, !dbg !436
  %conv = sext i8 %14 to i32, !dbg !436
  %cmp11 = icmp ne i32 %conv, 0, !dbg !439
  br i1 %cmp11, label %for.body, label %for.end120, !dbg !440

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %buf, align 8, !dbg !441
  %16 = load i64, i64* %i, align 8, !dbg !444
  %arrayidx13 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !441
  %17 = load i8, i8* %arrayidx13, align 1, !dbg !441
  %conv14 = sext i8 %17 to i32, !dbg !441
  %cmp15 = icmp ne i32 %conv14, 10, !dbg !445
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !446, !cf.info !52

if.then17:                                        ; preds = %for.body
  br label %for.inc118, !dbg !447

if.end18:                                         ; preds = %for.body
  %18 = load i8*, i8** %buf, align 8, !dbg !448
  %19 = load i64, i64* %j, align 8, !dbg !450
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 %19, !dbg !448
  %20 = load i8, i8* %arrayidx19, align 1, !dbg !448
  %conv20 = sext i8 %20 to i32, !dbg !448
  %cmp21 = icmp eq i32 %conv20, 35, !dbg !451
  br i1 %cmp21, label %if.then25, label %lor.lhs.false, !dbg !452, !cf.info !52

lor.lhs.false:                                    ; preds = %if.end18
  %21 = load i64, i64* %i, align 8, !dbg !453
  %22 = load i64, i64* %j, align 8, !dbg !454
  %cmp23 = icmp eq i64 %21, %22, !dbg !455
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !456, !cf.info !52

if.then25:                                        ; preds = %lor.lhs.false, %if.end18
  %23 = load i64, i64* %i, align 8, !dbg !457
  %add26 = add i64 %23, 1, !dbg !459
  store i64 %add26, i64* %j, align 8, !dbg !460
  br label %for.inc118, !dbg !461

if.end27:                                         ; preds = %lor.lhs.false
  %24 = load i64, i64* %j, align 8, !dbg !462
  %add28 = add i64 %24, 1, !dbg !464
  store i64 %add28, i64* %k, align 8, !dbg !465
  br label %for.cond29, !dbg !466

for.cond29:                                       ; preds = %for.inc, %if.end27
  %25 = load i64, i64* %k, align 8, !dbg !467
  %26 = load i64, i64* %i, align 8, !dbg !469
  %sub = sub i64 %26, 3, !dbg !470
  %cmp30 = icmp ult i64 %25, %sub, !dbg !471
  br i1 %cmp30, label %for.body32, label %for.end, !dbg !472

for.body32:                                       ; preds = %for.cond29
  %call33 = call i16** @__ctype_b_loc() #9, !dbg !473
  %27 = load i16*, i16** %call33, align 8, !dbg !473
  %28 = load i8*, i8** %buf, align 8, !dbg !473
  %29 = load i64, i64* %k, align 8, !dbg !473
  %arrayidx34 = getelementptr inbounds i8, i8* %28, i64 %29, !dbg !473
  %30 = load i8, i8* %arrayidx34, align 1, !dbg !473
  %conv35 = sext i8 %30 to i32, !dbg !473
  %idxprom = sext i32 %conv35 to i64, !dbg !473
  %arrayidx36 = getelementptr inbounds i16, i16* %27, i64 %idxprom, !dbg !473
  %31 = load i16, i16* %arrayidx36, align 2, !dbg !473
  %conv37 = zext i16 %31 to i32, !dbg !473
  %and = and i32 %conv37, 8192, !dbg !473
  %tobool = icmp ne i32 %and, 0, !dbg !473
  br i1 %tobool, label %land.lhs.true, label %if.end42, !dbg !475, !cf.info !52

land.lhs.true:                                    ; preds = %for.body32
  %32 = load i8*, i8** %buf, align 8, !dbg !476
  %33 = load i64, i64* %k, align 8, !dbg !477
  %add.ptr = getelementptr inbounds i8, i8* %32, i64 %33, !dbg !478
  %add.ptr38 = getelementptr inbounds i8, i8* %add.ptr, i64 1, !dbg !479
  %call39 = call i32 @strncmp(i8* %add.ptr38, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i64 2) #8, !dbg !480
  %tobool40 = icmp ne i32 %call39, 0, !dbg !480
  br i1 %tobool40, label %if.end42, label %if.then41, !dbg !481, !cf.info !52

if.then41:                                        ; preds = %land.lhs.true
  br label %for.end, !dbg !482

if.end42:                                         ; preds = %land.lhs.true, %for.body32
  br label %for.inc, !dbg !483

for.inc:                                          ; preds = %if.end42
  %34 = load i64, i64* %k, align 8, !dbg !484
  %inc = add i64 %34, 1, !dbg !484
  store i64 %inc, i64* %k, align 8, !dbg !484
  br label %for.cond29, !dbg !485, !llvm.loop !486

for.end:                                          ; preds = %if.then41, %for.cond29
  %35 = load i64, i64* %k, align 8, !dbg !488
  %36 = load i64, i64* %i, align 8, !dbg !490
  %sub43 = sub i64 %36, 3, !dbg !491
  %cmp44 = icmp uge i64 %35, %sub43, !dbg !492
  br i1 %cmp44, label %if.then46, label %if.end50, !dbg !493, !cf.info !52

if.then46:                                        ; preds = %for.end
  %37 = load i64, i64* %i, align 8, !dbg !494
  %38 = load i64, i64* %j, align 8, !dbg !496
  %sub47 = sub i64 %37, %38, !dbg !497
  %39 = load i8*, i8** %buf, align 8, !dbg !498
  %40 = load i64, i64* %j, align 8, !dbg !499
  %add.ptr48 = getelementptr inbounds i8, i8* %39, i64 %40, !dbg !500
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i64 %sub47, i8* %add.ptr48), !dbg !501
  br label %for.end120, !dbg !502

if.end50:                                         ; preds = %for.end
  %41 = load i64, i64* %k, align 8, !dbg !503
  store i64 %41, i64* %tmp, align 8, !dbg !505
  br label %for.cond51, !dbg !506

for.cond51:                                       ; preds = %for.body62, %if.end50
  %42 = load i64, i64* %tmp, align 8, !dbg !507
  %43 = load i64, i64* %j, align 8, !dbg !509
  %cmp52 = icmp ugt i64 %42, %43, !dbg !510
  br i1 %cmp52, label %land.rhs, label %land.end, !dbg !511

land.rhs:                                         ; preds = %for.cond51
  %call54 = call i16** @__ctype_b_loc() #9, !dbg !512
  %44 = load i16*, i16** %call54, align 8, !dbg !512
  %45 = load i8*, i8** %buf, align 8, !dbg !512
  %46 = load i64, i64* %tmp, align 8, !dbg !512
  %dec = add i64 %46, -1, !dbg !512
  store i64 %dec, i64* %tmp, align 8, !dbg !512
  %arrayidx55 = getelementptr inbounds i8, i8* %45, i64 %dec, !dbg !512
  %47 = load i8, i8* %arrayidx55, align 1, !dbg !512
  %conv56 = sext i8 %47 to i32, !dbg !512
  %idxprom57 = sext i32 %conv56 to i64, !dbg !512
  %arrayidx58 = getelementptr inbounds i16, i16* %44, i64 %idxprom57, !dbg !512
  %48 = load i16, i16* %arrayidx58, align 2, !dbg !512
  %conv59 = zext i16 %48 to i32, !dbg !512
  %and60 = and i32 %conv59, 8192, !dbg !512
  %tobool61 = icmp ne i32 %and60, 0, !dbg !511
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond51
  %49 = phi i1 [ false, %for.cond51 ], [ %tobool61, %land.rhs ], !dbg !513
  br i1 %49, label %for.body62, label %for.end63, !dbg !514

for.body62:                                       ; preds = %land.end
  br label %for.cond51, !dbg !515, !llvm.loop !516

for.end63:                                        ; preds = %land.end
  %50 = load i64, i64* %tmp, align 8, !dbg !518
  %51 = load i64, i64* %j, align 8, !dbg !520
  %cmp64 = icmp ult i64 %50, %51, !dbg !521
  br i1 %cmp64, label %if.then66, label %if.end70, !dbg !522, !cf.info !52

if.then66:                                        ; preds = %for.end63
  %52 = load i64, i64* %i, align 8, !dbg !523
  %53 = load i64, i64* %j, align 8, !dbg !525
  %sub67 = sub i64 %52, %53, !dbg !526
  %54 = load i8*, i8** %buf, align 8, !dbg !527
  %55 = load i64, i64* %j, align 8, !dbg !528
  %add.ptr68 = getelementptr inbounds i8, i8* %54, i64 %55, !dbg !529
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i64 %sub67, i8* %add.ptr68), !dbg !530
  br label %for.end120, !dbg !531

if.end70:                                         ; preds = %for.end63
  %56 = load i8*, i8** %buf, align 8, !dbg !532
  %57 = load i64, i64* %tmp, align 8, !dbg !533
  %inc71 = add i64 %57, 1, !dbg !533
  store i64 %inc71, i64* %tmp, align 8, !dbg !533
  %arrayidx72 = getelementptr inbounds i8, i8* %56, i64 %inc71, !dbg !532
  store i8 0, i8* %arrayidx72, align 1, !dbg !534
  %58 = load i64, i64* %k, align 8, !dbg !535
  %add73 = add i64 %58, 3, !dbg !535
  store i64 %add73, i64* %k, align 8, !dbg !535
  br label %for.cond74, !dbg !537

for.cond74:                                       ; preds = %for.body88, %if.end70
  %59 = load i64, i64* %k, align 8, !dbg !538
  %60 = load i64, i64* %i, align 8, !dbg !540
  %cmp75 = icmp ult i64 %59, %60, !dbg !541
  br i1 %cmp75, label %land.rhs77, label %land.end87, !dbg !542

land.rhs77:                                       ; preds = %for.cond74
  %call78 = call i16** @__ctype_b_loc() #9, !dbg !543
  %61 = load i16*, i16** %call78, align 8, !dbg !543
  %62 = load i8*, i8** %buf, align 8, !dbg !543
  %63 = load i64, i64* %k, align 8, !dbg !543
  %inc79 = add i64 %63, 1, !dbg !543
  store i64 %inc79, i64* %k, align 8, !dbg !543
  %arrayidx80 = getelementptr inbounds i8, i8* %62, i64 %inc79, !dbg !543
  %64 = load i8, i8* %arrayidx80, align 1, !dbg !543
  %conv81 = sext i8 %64 to i32, !dbg !543
  %idxprom82 = sext i32 %conv81 to i64, !dbg !543
  %arrayidx83 = getelementptr inbounds i16, i16* %61, i64 %idxprom82, !dbg !543
  %65 = load i16, i16* %arrayidx83, align 2, !dbg !543
  %conv84 = zext i16 %65 to i32, !dbg !543
  %and85 = and i32 %conv84, 8192, !dbg !543
  %tobool86 = icmp ne i32 %and85, 0, !dbg !542
  br label %land.end87

land.end87:                                       ; preds = %land.rhs77, %for.cond74
  %66 = phi i1 [ false, %for.cond74 ], [ %tobool86, %land.rhs77 ], !dbg !544
  br i1 %66, label %for.body88, label %for.end89, !dbg !545

for.body88:                                       ; preds = %land.end87
  br label %for.cond74, !dbg !546, !llvm.loop !547

for.end89:                                        ; preds = %land.end87
  %67 = load i8*, i8** %buf, align 8, !dbg !549
  %68 = load i64, i64* %i, align 8, !dbg !550
  %arrayidx90 = getelementptr inbounds i8, i8* %67, i64 %68, !dbg !549
  store i8 0, i8* %arrayidx90, align 1, !dbg !551
  %69 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !552
  %70 = bitcast %struct.rule_t* %69 to i8*, !dbg !552
  %71 = load i32, i32* %n, align 4, !dbg !553
  %add91 = add nsw i32 1, %71, !dbg !554
  %conv92 = sext i32 %add91 to i64, !dbg !555
  %mul = mul i64 24, %conv92, !dbg !556
  %call93 = call i8* @realloc(i8* %70, i64 %mul) #7, !dbg !557
  %72 = bitcast i8* %call93 to %struct.rule_t*, !dbg !557
  store %struct.rule_t* %72, %struct.rule_t** %rules, align 8, !dbg !558
  %73 = load i8*, i8** %buf, align 8, !dbg !559
  %74 = load i64, i64* %j, align 8, !dbg !560
  %add.ptr94 = getelementptr inbounds i8, i8* %73, i64 %74, !dbg !561
  %75 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !562
  %76 = load i32, i32* %n, align 4, !dbg !563
  %idxprom95 = sext i32 %76 to i64, !dbg !562
  %arrayidx96 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %75, i64 %idxprom95, !dbg !562
  %pat = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx96, i32 0, i32 0, !dbg !564
  store i8* %add.ptr94, i8** %pat, align 8, !dbg !565
  %77 = load i8*, i8** %buf, align 8, !dbg !566
  %78 = load i64, i64* %k, align 8, !dbg !568
  %arrayidx97 = getelementptr inbounds i8, i8* %77, i64 %78, !dbg !566
  %79 = load i8, i8* %arrayidx97, align 1, !dbg !566
  %conv98 = sext i8 %79 to i32, !dbg !566
  %cmp99 = icmp eq i32 %conv98, 46, !dbg !569
  br i1 %cmp99, label %if.then101, label %if.else, !dbg !570, !cf.info !52

if.then101:                                       ; preds = %for.end89
  %80 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !571
  %81 = load i32, i32* %n, align 4, !dbg !573
  %idxprom102 = sext i32 %81 to i64, !dbg !571
  %arrayidx103 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %80, i64 %idxprom102, !dbg !571
  %terminate = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx103, i32 0, i32 2, !dbg !574
  store i32 1, i32* %terminate, align 8, !dbg !575
  %82 = load i8*, i8** %buf, align 8, !dbg !576
  %83 = load i64, i64* %k, align 8, !dbg !577
  %add.ptr104 = getelementptr inbounds i8, i8* %82, i64 %83, !dbg !578
  %add.ptr105 = getelementptr inbounds i8, i8* %add.ptr104, i64 1, !dbg !579
  %84 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !580
  %85 = load i32, i32* %n, align 4, !dbg !581
  %idxprom106 = sext i32 %85 to i64, !dbg !580
  %arrayidx107 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %84, i64 %idxprom106, !dbg !580
  %repl = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx107, i32 0, i32 1, !dbg !582
  store i8* %add.ptr105, i8** %repl, align 8, !dbg !583
  br label %if.end115, !dbg !584

if.else:                                          ; preds = %for.end89
  %86 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !585
  %87 = load i32, i32* %n, align 4, !dbg !587
  %idxprom108 = sext i32 %87 to i64, !dbg !585
  %arrayidx109 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %86, i64 %idxprom108, !dbg !585
  %terminate110 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx109, i32 0, i32 2, !dbg !588
  store i32 0, i32* %terminate110, align 8, !dbg !589
  %88 = load i8*, i8** %buf, align 8, !dbg !590
  %89 = load i64, i64* %k, align 8, !dbg !591
  %add.ptr111 = getelementptr inbounds i8, i8* %88, i64 %89, !dbg !592
  %90 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !593
  %91 = load i32, i32* %n, align 4, !dbg !594
  %idxprom112 = sext i32 %91 to i64, !dbg !593
  %arrayidx113 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %90, i64 %idxprom112, !dbg !593
  %repl114 = getelementptr inbounds %struct.rule_t, %struct.rule_t* %arrayidx113, i32 0, i32 1, !dbg !595
  store i8* %add.ptr111, i8** %repl114, align 8, !dbg !596
  br label %if.end115

if.end115:                                        ; preds = %if.else, %if.then101
  %92 = load i32, i32* %n, align 4, !dbg !597
  %inc116 = add nsw i32 %92, 1, !dbg !597
  store i32 %inc116, i32* %n, align 4, !dbg !597
  %93 = load i64, i64* %i, align 8, !dbg !598
  %add117 = add i64 %93, 1, !dbg !599
  store i64 %add117, i64* %j, align 8, !dbg !600
  br label %for.inc118, !dbg !601

for.inc118:                                       ; preds = %if.end115, %if.then25, %if.then17
  %94 = load i64, i64* %i, align 8, !dbg !602
  %inc119 = add i64 %94, 1, !dbg !602
  store i64 %inc119, i64* %i, align 8, !dbg !602
  br label %for.cond, !dbg !603, !llvm.loop !604

for.end120:                                       ; preds = %if.then66, %if.then46, %for.cond
  call void @llvm.dbg.declare(metadata %struct.ruleset_t** %r, metadata !606, metadata !DIExpression()), !dbg !607
  %call121 = call noalias i8* @malloc(i64 24) #7, !dbg !608
  %95 = bitcast i8* %call121 to %struct.ruleset_t*, !dbg !608
  store %struct.ruleset_t* %95, %struct.ruleset_t** %r, align 8, !dbg !607
  %96 = load i8*, i8** %buf, align 8, !dbg !609
  %97 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !610
  %buf122 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %97, i32 0, i32 2, !dbg !611
  store i8* %96, i8** %buf122, align 8, !dbg !612
  %98 = load %struct.rule_t*, %struct.rule_t** %rules, align 8, !dbg !613
  %99 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !614
  %rules123 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %99, i32 0, i32 1, !dbg !615
  store %struct.rule_t* %98, %struct.rule_t** %rules123, align 8, !dbg !616
  %100 = load i32, i32* %n, align 4, !dbg !617
  %101 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !618
  %n124 = getelementptr inbounds %struct.ruleset_t, %struct.ruleset_t* %101, i32 0, i32 0, !dbg !619
  store i32 %100, i32* %n124, align 8, !dbg !620
  %102 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !621
  store %struct.ruleset_t* %102, %struct.ruleset_t** %retval, align 8, !dbg !622
  br label %return, !dbg !622

return:                                           ; preds = %for.end120, %if.then
  %103 = load %struct.ruleset_t*, %struct.ruleset_t** %retval, align 8, !dbg !623
  ret %struct.ruleset_t* %103, !dbg !623
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
define dso_local i32 @test_rules(i8* %s, i8* %file) #0 !dbg !624 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %file.addr = alloca i8*, align 8
  %r = alloca %struct.ruleset_t*, align 8
  %ss = alloca %struct.string*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !627, metadata !DIExpression()), !dbg !628
  store i8* %file, i8** %file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %file.addr, metadata !629, metadata !DIExpression()), !dbg !630
  call void @llvm.dbg.declare(metadata %struct.ruleset_t** %r, metadata !631, metadata !DIExpression()), !dbg !632
  %0 = load i8*, i8** %file.addr, align 8, !dbg !633
  %call = call %struct.ruleset_t* @read_rules(i8* %0), !dbg !634
  store %struct.ruleset_t* %call, %struct.ruleset_t** %r, align 8, !dbg !632
  %1 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !635
  %tobool = icmp ne %struct.ruleset_t* %1, null, !dbg !635
  br i1 %tobool, label %if.end, label %if.then, !dbg !637, !cf.info !52

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !638
  br label %return, !dbg !638

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %file.addr, align 8, !dbg !639
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8* %2), !dbg !640
  call void @llvm.dbg.declare(metadata %struct.string** %ss, metadata !641, metadata !DIExpression()), !dbg !642
  %3 = load i8*, i8** %s.addr, align 8, !dbg !643
  %call2 = call %struct.string* @str_new(i8* %3), !dbg !644
  store %struct.string* %call2, %struct.string** %ss, align 8, !dbg !642
  %4 = load %struct.string*, %struct.string** %ss, align 8, !dbg !645
  %s3 = getelementptr inbounds %struct.string, %struct.string* %4, i32 0, i32 0, !dbg !646
  %5 = load i8*, i8** %s3, align 8, !dbg !646
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i8* %5), !dbg !647
  %6 = load %struct.string*, %struct.string** %ss, align 8, !dbg !648
  %7 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !649
  call void @str_markov(%struct.string* %6, %struct.ruleset_t* %7), !dbg !650
  %8 = load %struct.string*, %struct.string** %ss, align 8, !dbg !651
  %s5 = getelementptr inbounds %struct.string, %struct.string* %8, i32 0, i32 0, !dbg !652
  %9 = load i8*, i8** %s5, align 8, !dbg !652
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i8* %9), !dbg !653
  %10 = load %struct.string*, %struct.string** %ss, align 8, !dbg !654
  call void @str_del(%struct.string* %10), !dbg !655
  %11 = load %struct.ruleset_t*, %struct.ruleset_t** %r, align 8, !dbg !656
  call void @ruleset_del(%struct.ruleset_t* %11), !dbg !657
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)), !dbg !658
  store i32 %call7, i32* %retval, align 4, !dbg !659
  br label %return, !dbg !659

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !660
  ret i32 %12, !dbg !660
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !661 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @test_rules(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0)), !dbg !664
  %call1 = call i32 @test_rules(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0)), !dbg !665
  %call2 = call i32 @test_rules(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0)), !dbg !666
  %call3 = call i32 @test_rules(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0)), !dbg !667
  %call4 = call i32 @test_rules(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i64 0, i64 0)), !dbg !668
  ret i32 0, !dbg !669
}

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
!47 = !DILocation(line: 23, column: 29, scope: !26)
!48 = !DILocation(line: 25, column: 6, scope: !49)
!49 = distinct !DILexicalBlock(scope: !26, file: !1, line: 25, column: 6)
!50 = !DILocation(line: 25, column: 9, scope: !49)
!51 = !DILocation(line: 25, column: 6, scope: !26)
!52 = !{!"if"}
!53 = !DILocation(line: 25, column: 21, scope: !49)
!54 = !DILocation(line: 25, column: 24, scope: !49)
!55 = !DILocation(line: 25, column: 16, scope: !49)
!56 = !DILocation(line: 26, column: 6, scope: !57)
!57 = distinct !DILexicalBlock(scope: !26, file: !1, line: 26, column: 6)
!58 = !DILocation(line: 26, column: 9, scope: !57)
!59 = !DILocation(line: 26, column: 6, scope: !26)
!60 = !DILocation(line: 26, column: 19, scope: !57)
!61 = !DILocation(line: 26, column: 22, scope: !57)
!62 = !DILocation(line: 26, column: 14, scope: !57)
!63 = !DILocation(line: 27, column: 7, scope: !26)
!64 = !DILocation(line: 27, column: 2, scope: !26)
!65 = !DILocation(line: 28, column: 1, scope: !26)
!66 = distinct !DISubprogram(name: "str_new", scope: !1, file: !1, line: 30, type: !67, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !78}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", file: !1, line: 10, baseType: !71)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 10, size: 128, elements: !72)
!72 = !{!73, !74}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !71, file: !1, line: 10, baseType: !40, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "alloc_len", scope: !71, file: !1, line: 10, baseType: !75, size: 64, offset: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !76, line: 46, baseType: !77)
!76 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!77 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!80 = !DILocalVariable(name: "s", arg: 1, scope: !66, file: !1, line: 30, type: !78)
!81 = !DILocation(line: 30, column: 30, scope: !66)
!82 = !DILocalVariable(name: "l", scope: !66, file: !1, line: 32, type: !20)
!83 = !DILocation(line: 32, column: 6, scope: !66)
!84 = !DILocation(line: 32, column: 17, scope: !66)
!85 = !DILocation(line: 32, column: 10, scope: !66)
!86 = !DILocalVariable(name: "str", scope: !66, file: !1, line: 33, type: !69)
!87 = !DILocation(line: 33, column: 10, scope: !66)
!88 = !DILocation(line: 33, column: 16, scope: !66)
!89 = !DILocation(line: 34, column: 18, scope: !66)
!90 = !DILocation(line: 34, column: 20, scope: !66)
!91 = !DILocation(line: 34, column: 11, scope: !66)
!92 = !DILocation(line: 34, column: 2, scope: !66)
!93 = !DILocation(line: 34, column: 7, scope: !66)
!94 = !DILocation(line: 34, column: 9, scope: !66)
!95 = !DILocation(line: 35, column: 9, scope: !66)
!96 = !DILocation(line: 35, column: 14, scope: !66)
!97 = !DILocation(line: 35, column: 17, scope: !66)
!98 = !DILocation(line: 35, column: 2, scope: !66)
!99 = !DILocation(line: 36, column: 19, scope: !66)
!100 = !DILocation(line: 36, column: 21, scope: !66)
!101 = !DILocation(line: 36, column: 2, scope: !66)
!102 = !DILocation(line: 36, column: 7, scope: !66)
!103 = !DILocation(line: 36, column: 17, scope: !66)
!104 = !DILocation(line: 37, column: 9, scope: !66)
!105 = !DILocation(line: 37, column: 2, scope: !66)
!106 = distinct !DISubprogram(name: "str_append", scope: !1, file: !1, line: 40, type: !107, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!107 = !DISubroutineType(types: !108)
!108 = !{null, !69, !78, !20}
!109 = !DILocalVariable(name: "str", arg: 1, scope: !106, file: !1, line: 40, type: !69)
!110 = !DILocation(line: 40, column: 25, scope: !106)
!111 = !DILocalVariable(name: "s", arg: 2, scope: !106, file: !1, line: 40, type: !78)
!112 = !DILocation(line: 40, column: 42, scope: !106)
!113 = !DILocalVariable(name: "len", arg: 3, scope: !106, file: !1, line: 40, type: !20)
!114 = !DILocation(line: 40, column: 49, scope: !106)
!115 = !DILocalVariable(name: "l", scope: !106, file: !1, line: 42, type: !20)
!116 = !DILocation(line: 42, column: 6, scope: !106)
!117 = !DILocation(line: 42, column: 17, scope: !106)
!118 = !DILocation(line: 42, column: 22, scope: !106)
!119 = !DILocation(line: 42, column: 10, scope: !106)
!120 = !DILocation(line: 43, column: 6, scope: !121)
!121 = distinct !DILexicalBlock(scope: !106, file: !1, line: 43, column: 6)
!122 = !DILocation(line: 43, column: 10, scope: !121)
!123 = !DILocation(line: 43, column: 6, scope: !106)
!124 = !DILocation(line: 43, column: 30, scope: !121)
!125 = !DILocation(line: 43, column: 23, scope: !121)
!126 = !DILocation(line: 43, column: 21, scope: !121)
!127 = !DILocation(line: 43, column: 17, scope: !121)
!128 = !DILocation(line: 45, column: 6, scope: !129)
!129 = distinct !DILexicalBlock(scope: !106, file: !1, line: 45, column: 6)
!130 = !DILocation(line: 45, column: 11, scope: !129)
!131 = !DILocation(line: 45, column: 23, scope: !129)
!132 = !DILocation(line: 45, column: 27, scope: !129)
!133 = !DILocation(line: 45, column: 25, scope: !129)
!134 = !DILocation(line: 45, column: 31, scope: !129)
!135 = !DILocation(line: 45, column: 21, scope: !129)
!136 = !DILocation(line: 45, column: 6, scope: !106)
!137 = !DILocation(line: 46, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !1, line: 45, column: 36)
!139 = !DILocation(line: 46, column: 24, scope: !138)
!140 = !DILocation(line: 46, column: 22, scope: !138)
!141 = !DILocation(line: 46, column: 28, scope: !138)
!142 = !DILocation(line: 46, column: 3, scope: !138)
!143 = !DILocation(line: 46, column: 8, scope: !138)
!144 = !DILocation(line: 46, column: 18, scope: !138)
!145 = !DILocation(line: 47, column: 20, scope: !138)
!146 = !DILocation(line: 47, column: 25, scope: !138)
!147 = !DILocation(line: 47, column: 28, scope: !138)
!148 = !DILocation(line: 47, column: 33, scope: !138)
!149 = !DILocation(line: 47, column: 12, scope: !138)
!150 = !DILocation(line: 47, column: 3, scope: !138)
!151 = !DILocation(line: 47, column: 8, scope: !138)
!152 = !DILocation(line: 47, column: 10, scope: !138)
!153 = !DILocation(line: 48, column: 2, scope: !138)
!154 = !DILocation(line: 49, column: 9, scope: !106)
!155 = !DILocation(line: 49, column: 14, scope: !106)
!156 = !DILocation(line: 49, column: 18, scope: !106)
!157 = !DILocation(line: 49, column: 16, scope: !106)
!158 = !DILocation(line: 49, column: 21, scope: !106)
!159 = !DILocation(line: 49, column: 24, scope: !106)
!160 = !DILocation(line: 49, column: 2, scope: !106)
!161 = !DILocation(line: 50, column: 2, scope: !106)
!162 = !DILocation(line: 50, column: 7, scope: !106)
!163 = !DILocation(line: 50, column: 9, scope: !106)
!164 = !DILocation(line: 50, column: 13, scope: !106)
!165 = !DILocation(line: 50, column: 11, scope: !106)
!166 = !DILocation(line: 50, column: 18, scope: !106)
!167 = !DILocation(line: 51, column: 1, scope: !106)
!168 = distinct !DISubprogram(name: "str_transfer", scope: !1, file: !1, line: 54, type: !169, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!169 = !DISubroutineType(types: !170)
!170 = !{null, !69, !69}
!171 = !DILocalVariable(name: "dest", arg: 1, scope: !168, file: !1, line: 54, type: !69)
!172 = !DILocation(line: 54, column: 27, scope: !168)
!173 = !DILocalVariable(name: "src", arg: 2, scope: !168, file: !1, line: 54, type: !69)
!174 = !DILocation(line: 54, column: 41, scope: !168)
!175 = !DILocalVariable(name: "tlen", scope: !168, file: !1, line: 56, type: !75)
!176 = !DILocation(line: 56, column: 9, scope: !168)
!177 = !DILocation(line: 56, column: 16, scope: !168)
!178 = !DILocation(line: 56, column: 22, scope: !168)
!179 = !DILocation(line: 57, column: 20, scope: !168)
!180 = !DILocation(line: 57, column: 25, scope: !168)
!181 = !DILocation(line: 57, column: 2, scope: !168)
!182 = !DILocation(line: 57, column: 8, scope: !168)
!183 = !DILocation(line: 57, column: 18, scope: !168)
!184 = !DILocation(line: 58, column: 19, scope: !168)
!185 = !DILocation(line: 58, column: 2, scope: !168)
!186 = !DILocation(line: 58, column: 7, scope: !168)
!187 = !DILocation(line: 58, column: 17, scope: !168)
!188 = !DILocalVariable(name: "ts", scope: !168, file: !1, line: 60, type: !40)
!189 = !DILocation(line: 60, column: 8, scope: !168)
!190 = !DILocation(line: 60, column: 13, scope: !168)
!191 = !DILocation(line: 60, column: 19, scope: !168)
!192 = !DILocation(line: 61, column: 12, scope: !168)
!193 = !DILocation(line: 61, column: 17, scope: !168)
!194 = !DILocation(line: 61, column: 2, scope: !168)
!195 = !DILocation(line: 61, column: 8, scope: !168)
!196 = !DILocation(line: 61, column: 10, scope: !168)
!197 = !DILocation(line: 62, column: 11, scope: !168)
!198 = !DILocation(line: 62, column: 2, scope: !168)
!199 = !DILocation(line: 62, column: 7, scope: !168)
!200 = !DILocation(line: 62, column: 9, scope: !168)
!201 = !DILocation(line: 63, column: 2, scope: !168)
!202 = !DILocation(line: 63, column: 7, scope: !168)
!203 = !DILocation(line: 63, column: 12, scope: !168)
!204 = !DILocation(line: 64, column: 1, scope: !168)
!205 = distinct !DISubprogram(name: "str_del", scope: !1, file: !1, line: 66, type: !206, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !69}
!208 = !DILocalVariable(name: "s", arg: 1, scope: !205, file: !1, line: 66, type: !69)
!209 = !DILocation(line: 66, column: 22, scope: !205)
!210 = !DILocation(line: 68, column: 6, scope: !211)
!211 = distinct !DILexicalBlock(scope: !205, file: !1, line: 68, column: 6)
!212 = !DILocation(line: 68, column: 9, scope: !211)
!213 = !DILocation(line: 68, column: 6, scope: !205)
!214 = !DILocation(line: 68, column: 17, scope: !211)
!215 = !DILocation(line: 68, column: 20, scope: !211)
!216 = !DILocation(line: 68, column: 12, scope: !211)
!217 = !DILocation(line: 69, column: 7, scope: !205)
!218 = !DILocation(line: 69, column: 2, scope: !205)
!219 = !DILocation(line: 70, column: 1, scope: !205)
!220 = distinct !DISubprogram(name: "str_markov", scope: !1, file: !1, line: 72, type: !221, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!221 = !DISubroutineType(types: !222)
!222 = !{null, !69, !29}
!223 = !DILocalVariable(name: "str", arg: 1, scope: !220, file: !1, line: 72, type: !69)
!224 = !DILocation(line: 72, column: 25, scope: !220)
!225 = !DILocalVariable(name: "r", arg: 2, scope: !220, file: !1, line: 72, type: !29)
!226 = !DILocation(line: 72, column: 41, scope: !220)
!227 = !DILocalVariable(name: "i", scope: !220, file: !1, line: 74, type: !20)
!228 = !DILocation(line: 74, column: 6, scope: !220)
!229 = !DILocalVariable(name: "j", scope: !220, file: !1, line: 74, type: !20)
!230 = !DILocation(line: 74, column: 9, scope: !220)
!231 = !DILocalVariable(name: "sl", scope: !220, file: !1, line: 74, type: !20)
!232 = !DILocation(line: 74, column: 12, scope: !220)
!233 = !DILocalVariable(name: "pl", scope: !220, file: !1, line: 74, type: !20)
!234 = !DILocation(line: 74, column: 16, scope: !220)
!235 = !DILocalVariable(name: "changed", scope: !220, file: !1, line: 75, type: !20)
!236 = !DILocation(line: 75, column: 6, scope: !220)
!237 = !DILocalVariable(name: "done", scope: !220, file: !1, line: 75, type: !20)
!238 = !DILocation(line: 75, column: 19, scope: !220)
!239 = !DILocalVariable(name: "tmp", scope: !220, file: !1, line: 76, type: !69)
!240 = !DILocation(line: 76, column: 10, scope: !220)
!241 = !DILocation(line: 76, column: 16, scope: !220)
!242 = !DILocation(line: 78, column: 2, scope: !220)
!243 = !DILocation(line: 78, column: 10, scope: !220)
!244 = !DILocation(line: 78, column: 9, scope: !220)
!245 = !DILocation(line: 79, column: 11, scope: !246)
!246 = distinct !DILexicalBlock(scope: !220, file: !1, line: 78, column: 16)
!247 = !DILocation(line: 80, column: 10, scope: !248)
!248 = distinct !DILexicalBlock(scope: !246, file: !1, line: 80, column: 3)
!249 = !DILocation(line: 80, column: 8, scope: !248)
!250 = !DILocation(line: 80, column: 16, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !1, line: 80, column: 3)
!252 = !DILocation(line: 80, column: 21, scope: !251)
!253 = !DILocation(line: 80, column: 25, scope: !251)
!254 = !DILocation(line: 80, column: 33, scope: !251)
!255 = !DILocation(line: 80, column: 36, scope: !251)
!256 = !DILocation(line: 80, column: 40, scope: !251)
!257 = !DILocation(line: 80, column: 43, scope: !251)
!258 = !DILocation(line: 80, column: 38, scope: !251)
!259 = !DILocation(line: 0, scope: !251)
!260 = !DILocation(line: 80, column: 3, scope: !248)
!261 = !DILocation(line: 81, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !251, file: !1, line: 80, column: 51)
!263 = !DILocation(line: 81, column: 19, scope: !262)
!264 = !DILocation(line: 81, column: 25, scope: !262)
!265 = !DILocation(line: 81, column: 28, scope: !262)
!266 = !DILocation(line: 81, column: 9, scope: !262)
!267 = !DILocation(line: 81, column: 7, scope: !262)
!268 = !DILocation(line: 82, column: 16, scope: !262)
!269 = !DILocation(line: 82, column: 21, scope: !262)
!270 = !DILocation(line: 82, column: 9, scope: !262)
!271 = !DILocation(line: 82, column: 7, scope: !262)
!272 = !DILocation(line: 83, column: 11, scope: !273)
!273 = distinct !DILexicalBlock(scope: !262, file: !1, line: 83, column: 4)
!274 = !DILocation(line: 83, column: 9, scope: !273)
!275 = !DILocation(line: 83, column: 16, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !1, line: 83, column: 4)
!277 = !DILocation(line: 83, column: 20, scope: !276)
!278 = !DILocation(line: 83, column: 18, scope: !276)
!279 = !DILocation(line: 83, column: 4, scope: !273)
!280 = !DILocation(line: 84, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !282, file: !1, line: 84, column: 9)
!282 = distinct !DILexicalBlock(scope: !276, file: !1, line: 83, column: 29)
!283 = !DILocation(line: 84, column: 22, scope: !281)
!284 = !DILocation(line: 84, column: 26, scope: !281)
!285 = !DILocation(line: 84, column: 24, scope: !281)
!286 = !DILocation(line: 84, column: 29, scope: !281)
!287 = !DILocation(line: 84, column: 32, scope: !281)
!288 = !DILocation(line: 84, column: 38, scope: !281)
!289 = !DILocation(line: 84, column: 41, scope: !281)
!290 = !DILocation(line: 84, column: 46, scope: !281)
!291 = !DILocation(line: 84, column: 9, scope: !281)
!292 = !DILocation(line: 84, column: 9, scope: !282)
!293 = !DILocation(line: 85, column: 6, scope: !281)
!294 = !DILocation(line: 86, column: 16, scope: !282)
!295 = !DILocation(line: 86, column: 21, scope: !282)
!296 = !DILocation(line: 86, column: 26, scope: !282)
!297 = !DILocation(line: 86, column: 29, scope: !282)
!298 = !DILocation(line: 86, column: 5, scope: !282)
!299 = !DILocation(line: 87, column: 16, scope: !282)
!300 = !DILocation(line: 87, column: 21, scope: !282)
!301 = !DILocation(line: 87, column: 24, scope: !282)
!302 = !DILocation(line: 87, column: 30, scope: !282)
!303 = !DILocation(line: 87, column: 33, scope: !282)
!304 = !DILocation(line: 87, column: 5, scope: !282)
!305 = !DILocation(line: 88, column: 16, scope: !282)
!306 = !DILocation(line: 88, column: 21, scope: !282)
!307 = !DILocation(line: 88, column: 26, scope: !282)
!308 = !DILocation(line: 88, column: 30, scope: !282)
!309 = !DILocation(line: 88, column: 28, scope: !282)
!310 = !DILocation(line: 88, column: 34, scope: !282)
!311 = !DILocation(line: 88, column: 32, scope: !282)
!312 = !DILocation(line: 88, column: 5, scope: !282)
!313 = !DILocation(line: 90, column: 18, scope: !282)
!314 = !DILocation(line: 90, column: 23, scope: !282)
!315 = !DILocation(line: 90, column: 5, scope: !282)
!316 = !DILocation(line: 91, column: 13, scope: !282)
!317 = !DILocation(line: 93, column: 9, scope: !318)
!318 = distinct !DILexicalBlock(scope: !282, file: !1, line: 93, column: 9)
!319 = !DILocation(line: 93, column: 12, scope: !318)
!320 = !DILocation(line: 93, column: 18, scope: !318)
!321 = !DILocation(line: 93, column: 21, scope: !318)
!322 = !DILocation(line: 93, column: 9, scope: !282)
!323 = !DILocation(line: 94, column: 11, scope: !318)
!324 = !DILocation(line: 94, column: 6, scope: !318)
!325 = !DILocation(line: 95, column: 5, scope: !282)
!326 = !DILocation(line: 83, column: 25, scope: !276)
!327 = !DILocation(line: 83, column: 4, scope: !276)
!328 = distinct !{!328, !279, !329}
!329 = !DILocation(line: 96, column: 4, scope: !273)
!330 = !DILocation(line: 97, column: 3, scope: !262)
!331 = !DILocation(line: 80, column: 47, scope: !251)
!332 = !DILocation(line: 80, column: 3, scope: !251)
!333 = distinct !{!333, !260, !334}
!334 = !DILocation(line: 97, column: 3, scope: !248)
!335 = !DILocation(line: 98, column: 8, scope: !336)
!336 = distinct !DILexicalBlock(scope: !246, file: !1, line: 98, column: 7)
!337 = !DILocation(line: 98, column: 7, scope: !246)
!338 = !DILocation(line: 98, column: 17, scope: !336)
!339 = distinct !{!339, !242, !340}
!340 = !DILocation(line: 99, column: 2, scope: !220)
!341 = !DILocation(line: 100, column: 10, scope: !220)
!342 = !DILocation(line: 100, column: 2, scope: !220)
!343 = !DILocation(line: 101, column: 2, scope: !220)
!344 = distinct !DISubprogram(name: "read_rules", scope: !1, file: !1, line: 104, type: !345, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!345 = !DISubroutineType(types: !346)
!346 = !{!29, !78}
!347 = !DILocalVariable(name: "name", arg: 1, scope: !344, file: !1, line: 104, type: !78)
!348 = !DILocation(line: 104, column: 35, scope: !344)
!349 = !DILocalVariable(name: "s", scope: !344, file: !1, line: 106, type: !350)
!350 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !351, line: 46, size: 1152, elements: !352)
!351 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!352 = !{!353, !356, !358, !360, !362, !364, !366, !367, !368, !371, !373, !375, !383, !384, !385}
!353 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !350, file: !351, line: 48, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !355, line: 145, baseType: !77)
!355 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!356 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !350, file: !351, line: 53, baseType: !357, size: 64, offset: 64)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !355, line: 148, baseType: !77)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !350, file: !351, line: 61, baseType: !359, size: 64, offset: 128)
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !355, line: 151, baseType: !77)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !350, file: !351, line: 62, baseType: !361, size: 32, offset: 192)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !355, line: 150, baseType: !5)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !350, file: !351, line: 64, baseType: !363, size: 32, offset: 224)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !355, line: 146, baseType: !5)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !350, file: !351, line: 65, baseType: !365, size: 32, offset: 256)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !355, line: 147, baseType: !5)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !350, file: !351, line: 67, baseType: !20, size: 32, offset: 288)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !350, file: !351, line: 69, baseType: !354, size: 64, offset: 320)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !350, file: !351, line: 74, baseType: !369, size: 64, offset: 384)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !355, line: 152, baseType: !370)
!370 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !350, file: !351, line: 78, baseType: !372, size: 64, offset: 448)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !355, line: 174, baseType: !370)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !350, file: !351, line: 80, baseType: !374, size: 64, offset: 512)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !355, line: 179, baseType: !370)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !350, file: !351, line: 91, baseType: !376, size: 128, offset: 576)
!376 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !377, line: 10, size: 128, elements: !378)
!377 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!378 = !{!379, !381}
!379 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !376, file: !377, line: 12, baseType: !380, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !355, line: 160, baseType: !370)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !376, file: !377, line: 16, baseType: !382, size: 64, offset: 64)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !355, line: 196, baseType: !370)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !350, file: !351, line: 92, baseType: !376, size: 128, offset: 704)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !350, file: !351, line: 93, baseType: !376, size: 128, offset: 832)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !350, file: !351, line: 106, baseType: !386, size: 192, offset: 960)
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !382, size: 192, elements: !387)
!387 = !{!388}
!388 = !DISubrange(count: 3)
!389 = !DILocation(line: 106, column: 14, scope: !344)
!390 = !DILocalVariable(name: "buf", scope: !344, file: !1, line: 107, type: !40)
!391 = !DILocation(line: 107, column: 8, scope: !344)
!392 = !DILocalVariable(name: "i", scope: !344, file: !1, line: 108, type: !75)
!393 = !DILocation(line: 108, column: 9, scope: !344)
!394 = !DILocalVariable(name: "j", scope: !344, file: !1, line: 108, type: !75)
!395 = !DILocation(line: 108, column: 12, scope: !344)
!396 = !DILocalVariable(name: "k", scope: !344, file: !1, line: 108, type: !75)
!397 = !DILocation(line: 108, column: 15, scope: !344)
!398 = !DILocalVariable(name: "tmp", scope: !344, file: !1, line: 108, type: !75)
!399 = !DILocation(line: 108, column: 18, scope: !344)
!400 = !DILocalVariable(name: "rules", scope: !344, file: !1, line: 109, type: !35)
!401 = !DILocation(line: 109, column: 10, scope: !344)
!402 = !DILocalVariable(name: "n", scope: !344, file: !1, line: 110, type: !20)
!403 = !DILocation(line: 110, column: 6, scope: !344)
!404 = !DILocalVariable(name: "fd", scope: !344, file: !1, line: 112, type: !20)
!405 = !DILocation(line: 112, column: 6, scope: !344)
!406 = !DILocation(line: 112, column: 16, scope: !344)
!407 = !DILocation(line: 112, column: 11, scope: !344)
!408 = !DILocation(line: 113, column: 6, scope: !409)
!409 = distinct !DILexicalBlock(scope: !344, file: !1, line: 113, column: 6)
!410 = !DILocation(line: 113, column: 9, scope: !409)
!411 = !DILocation(line: 113, column: 6, scope: !344)
!412 = !DILocation(line: 113, column: 16, scope: !409)
!413 = !DILocation(line: 115, column: 8, scope: !344)
!414 = !DILocation(line: 115, column: 2, scope: !344)
!415 = !DILocation(line: 116, column: 17, scope: !344)
!416 = !DILocation(line: 116, column: 25, scope: !344)
!417 = !DILocation(line: 116, column: 8, scope: !344)
!418 = !DILocation(line: 116, column: 6, scope: !344)
!419 = !DILocation(line: 117, column: 7, scope: !344)
!420 = !DILocation(line: 117, column: 11, scope: !344)
!421 = !DILocation(line: 117, column: 18, scope: !344)
!422 = !DILocation(line: 117, column: 2, scope: !344)
!423 = !DILocation(line: 118, column: 2, scope: !344)
!424 = !DILocation(line: 118, column: 8, scope: !344)
!425 = !DILocation(line: 118, column: 17, scope: !344)
!426 = !DILocation(line: 119, column: 2, scope: !344)
!427 = !DILocation(line: 119, column: 8, scope: !344)
!428 = !DILocation(line: 119, column: 16, scope: !344)
!429 = !DILocation(line: 119, column: 21, scope: !344)
!430 = !DILocation(line: 120, column: 8, scope: !344)
!431 = !DILocation(line: 120, column: 2, scope: !344)
!432 = !DILocation(line: 122, column: 13, scope: !433)
!433 = distinct !DILexicalBlock(scope: !344, file: !1, line: 122, column: 2)
!434 = !DILocation(line: 122, column: 9, scope: !433)
!435 = !DILocation(line: 122, column: 7, scope: !433)
!436 = !DILocation(line: 122, column: 18, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !1, line: 122, column: 2)
!438 = !DILocation(line: 122, column: 22, scope: !437)
!439 = !DILocation(line: 122, column: 25, scope: !437)
!440 = !DILocation(line: 122, column: 2, scope: !433)
!441 = !DILocation(line: 123, column: 7, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !1, line: 123, column: 7)
!443 = distinct !DILexicalBlock(scope: !437, file: !1, line: 122, column: 39)
!444 = !DILocation(line: 123, column: 11, scope: !442)
!445 = !DILocation(line: 123, column: 14, scope: !442)
!446 = !DILocation(line: 123, column: 7, scope: !443)
!447 = !DILocation(line: 123, column: 23, scope: !442)
!448 = !DILocation(line: 126, column: 7, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !1, line: 126, column: 7)
!450 = !DILocation(line: 126, column: 11, scope: !449)
!451 = !DILocation(line: 126, column: 14, scope: !449)
!452 = !DILocation(line: 126, column: 21, scope: !449)
!453 = !DILocation(line: 126, column: 24, scope: !449)
!454 = !DILocation(line: 126, column: 29, scope: !449)
!455 = !DILocation(line: 126, column: 26, scope: !449)
!456 = !DILocation(line: 126, column: 7, scope: !443)
!457 = !DILocation(line: 127, column: 8, scope: !458)
!458 = distinct !DILexicalBlock(scope: !449, file: !1, line: 126, column: 32)
!459 = !DILocation(line: 127, column: 10, scope: !458)
!460 = !DILocation(line: 127, column: 6, scope: !458)
!461 = !DILocation(line: 128, column: 4, scope: !458)
!462 = !DILocation(line: 132, column: 12, scope: !463)
!463 = distinct !DILexicalBlock(scope: !443, file: !1, line: 132, column: 3)
!464 = !DILocation(line: 132, column: 14, scope: !463)
!465 = !DILocation(line: 132, column: 10, scope: !463)
!466 = !DILocation(line: 132, column: 8, scope: !463)
!467 = !DILocation(line: 132, column: 19, scope: !468)
!468 = distinct !DILexicalBlock(scope: !463, file: !1, line: 132, column: 3)
!469 = !DILocation(line: 132, column: 23, scope: !468)
!470 = !DILocation(line: 132, column: 25, scope: !468)
!471 = !DILocation(line: 132, column: 21, scope: !468)
!472 = !DILocation(line: 132, column: 3, scope: !463)
!473 = !DILocation(line: 133, column: 8, scope: !474)
!474 = distinct !DILexicalBlock(scope: !468, file: !1, line: 133, column: 8)
!475 = !DILocation(line: 133, column: 24, scope: !474)
!476 = !DILocation(line: 133, column: 36, scope: !474)
!477 = !DILocation(line: 133, column: 42, scope: !474)
!478 = !DILocation(line: 133, column: 40, scope: !474)
!479 = !DILocation(line: 133, column: 44, scope: !474)
!480 = !DILocation(line: 133, column: 28, scope: !474)
!481 = !DILocation(line: 133, column: 8, scope: !468)
!482 = !DILocation(line: 134, column: 5, scope: !474)
!483 = !DILocation(line: 133, column: 56, scope: !474)
!484 = !DILocation(line: 132, column: 31, scope: !468)
!485 = !DILocation(line: 132, column: 3, scope: !468)
!486 = distinct !{!486, !472, !487}
!487 = !DILocation(line: 134, column: 5, scope: !463)
!488 = !DILocation(line: 136, column: 7, scope: !489)
!489 = distinct !DILexicalBlock(scope: !443, file: !1, line: 136, column: 7)
!490 = !DILocation(line: 136, column: 12, scope: !489)
!491 = !DILocation(line: 136, column: 14, scope: !489)
!492 = !DILocation(line: 136, column: 9, scope: !489)
!493 = !DILocation(line: 136, column: 7, scope: !443)
!494 = !DILocation(line: 137, column: 43, scope: !495)
!495 = distinct !DILexicalBlock(scope: !489, file: !1, line: 136, column: 19)
!496 = !DILocation(line: 137, column: 47, scope: !495)
!497 = !DILocation(line: 137, column: 45, scope: !495)
!498 = !DILocation(line: 137, column: 50, scope: !495)
!499 = !DILocation(line: 137, column: 56, scope: !495)
!500 = !DILocation(line: 137, column: 54, scope: !495)
!501 = !DILocation(line: 137, column: 4, scope: !495)
!502 = !DILocation(line: 138, column: 4, scope: !495)
!503 = !DILocation(line: 142, column: 14, scope: !504)
!504 = distinct !DILexicalBlock(scope: !443, file: !1, line: 142, column: 3)
!505 = !DILocation(line: 142, column: 12, scope: !504)
!506 = !DILocation(line: 142, column: 8, scope: !504)
!507 = !DILocation(line: 142, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !1, line: 142, column: 3)
!509 = !DILocation(line: 142, column: 23, scope: !508)
!510 = !DILocation(line: 142, column: 21, scope: !508)
!511 = !DILocation(line: 142, column: 25, scope: !508)
!512 = !DILocation(line: 142, column: 28, scope: !508)
!513 = !DILocation(line: 0, scope: !508)
!514 = !DILocation(line: 142, column: 3, scope: !504)
!515 = !DILocation(line: 142, column: 3, scope: !508)
!516 = distinct !{!516, !514, !517}
!517 = !DILocation(line: 142, column: 50, scope: !504)
!518 = !DILocation(line: 143, column: 7, scope: !519)
!519 = distinct !DILexicalBlock(scope: !443, file: !1, line: 143, column: 7)
!520 = !DILocation(line: 143, column: 13, scope: !519)
!521 = !DILocation(line: 143, column: 11, scope: !519)
!522 = !DILocation(line: 143, column: 7, scope: !443)
!523 = !DILocation(line: 144, column: 38, scope: !524)
!524 = distinct !DILexicalBlock(scope: !519, file: !1, line: 143, column: 16)
!525 = !DILocation(line: 144, column: 42, scope: !524)
!526 = !DILocation(line: 144, column: 40, scope: !524)
!527 = !DILocation(line: 144, column: 45, scope: !524)
!528 = !DILocation(line: 144, column: 51, scope: !524)
!529 = !DILocation(line: 144, column: 49, scope: !524)
!530 = !DILocation(line: 144, column: 4, scope: !524)
!531 = !DILocation(line: 145, column: 4, scope: !524)
!532 = !DILocation(line: 147, column: 3, scope: !443)
!533 = !DILocation(line: 147, column: 7, scope: !443)
!534 = !DILocation(line: 147, column: 14, scope: !443)
!535 = !DILocation(line: 150, column: 10, scope: !536)
!536 = distinct !DILexicalBlock(scope: !443, file: !1, line: 150, column: 3)
!537 = !DILocation(line: 150, column: 8, scope: !536)
!538 = !DILocation(line: 150, column: 16, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !1, line: 150, column: 3)
!540 = !DILocation(line: 150, column: 20, scope: !539)
!541 = !DILocation(line: 150, column: 18, scope: !539)
!542 = !DILocation(line: 150, column: 22, scope: !539)
!543 = !DILocation(line: 150, column: 25, scope: !539)
!544 = !DILocation(line: 0, scope: !539)
!545 = !DILocation(line: 150, column: 3, scope: !536)
!546 = !DILocation(line: 150, column: 3, scope: !539)
!547 = distinct !{!547, !545, !548}
!548 = !DILocation(line: 150, column: 44, scope: !536)
!549 = !DILocation(line: 151, column: 3, scope: !443)
!550 = !DILocation(line: 151, column: 7, scope: !443)
!551 = !DILocation(line: 151, column: 10, scope: !443)
!552 = !DILocation(line: 153, column: 19, scope: !443)
!553 = !DILocation(line: 153, column: 48, scope: !443)
!554 = !DILocation(line: 153, column: 46, scope: !443)
!555 = !DILocation(line: 153, column: 43, scope: !443)
!556 = !DILocation(line: 153, column: 41, scope: !443)
!557 = !DILocation(line: 153, column: 11, scope: !443)
!558 = !DILocation(line: 153, column: 9, scope: !443)
!559 = !DILocation(line: 154, column: 18, scope: !443)
!560 = !DILocation(line: 154, column: 24, scope: !443)
!561 = !DILocation(line: 154, column: 22, scope: !443)
!562 = !DILocation(line: 154, column: 3, scope: !443)
!563 = !DILocation(line: 154, column: 9, scope: !443)
!564 = !DILocation(line: 154, column: 12, scope: !443)
!565 = !DILocation(line: 154, column: 16, scope: !443)
!566 = !DILocation(line: 156, column: 7, scope: !567)
!567 = distinct !DILexicalBlock(scope: !443, file: !1, line: 156, column: 7)
!568 = !DILocation(line: 156, column: 11, scope: !567)
!569 = !DILocation(line: 156, column: 14, scope: !567)
!570 = !DILocation(line: 156, column: 7, scope: !443)
!571 = !DILocation(line: 157, column: 4, scope: !572)
!572 = distinct !DILexicalBlock(scope: !567, file: !1, line: 156, column: 22)
!573 = !DILocation(line: 157, column: 10, scope: !572)
!574 = !DILocation(line: 157, column: 13, scope: !572)
!575 = !DILocation(line: 157, column: 23, scope: !572)
!576 = !DILocation(line: 158, column: 20, scope: !572)
!577 = !DILocation(line: 158, column: 26, scope: !572)
!578 = !DILocation(line: 158, column: 24, scope: !572)
!579 = !DILocation(line: 158, column: 28, scope: !572)
!580 = !DILocation(line: 158, column: 4, scope: !572)
!581 = !DILocation(line: 158, column: 10, scope: !572)
!582 = !DILocation(line: 158, column: 13, scope: !572)
!583 = !DILocation(line: 158, column: 18, scope: !572)
!584 = !DILocation(line: 159, column: 3, scope: !572)
!585 = !DILocation(line: 160, column: 4, scope: !586)
!586 = distinct !DILexicalBlock(scope: !567, file: !1, line: 159, column: 10)
!587 = !DILocation(line: 160, column: 10, scope: !586)
!588 = !DILocation(line: 160, column: 13, scope: !586)
!589 = !DILocation(line: 160, column: 23, scope: !586)
!590 = !DILocation(line: 161, column: 20, scope: !586)
!591 = !DILocation(line: 161, column: 26, scope: !586)
!592 = !DILocation(line: 161, column: 24, scope: !586)
!593 = !DILocation(line: 161, column: 4, scope: !586)
!594 = !DILocation(line: 161, column: 10, scope: !586)
!595 = !DILocation(line: 161, column: 13, scope: !586)
!596 = !DILocation(line: 161, column: 18, scope: !586)
!597 = !DILocation(line: 163, column: 4, scope: !443)
!598 = !DILocation(line: 165, column: 7, scope: !443)
!599 = !DILocation(line: 165, column: 9, scope: !443)
!600 = !DILocation(line: 165, column: 5, scope: !443)
!601 = !DILocation(line: 166, column: 2, scope: !443)
!602 = !DILocation(line: 122, column: 35, scope: !437)
!603 = !DILocation(line: 122, column: 2, scope: !437)
!604 = distinct !{!604, !440, !605}
!605 = !DILocation(line: 166, column: 2, scope: !433)
!606 = !DILocalVariable(name: "r", scope: !344, file: !1, line: 168, type: !29)
!607 = !DILocation(line: 168, column: 13, scope: !344)
!608 = !DILocation(line: 168, column: 17, scope: !344)
!609 = !DILocation(line: 169, column: 11, scope: !344)
!610 = !DILocation(line: 169, column: 2, scope: !344)
!611 = !DILocation(line: 169, column: 5, scope: !344)
!612 = !DILocation(line: 169, column: 9, scope: !344)
!613 = !DILocation(line: 170, column: 13, scope: !344)
!614 = !DILocation(line: 170, column: 2, scope: !344)
!615 = !DILocation(line: 170, column: 5, scope: !344)
!616 = !DILocation(line: 170, column: 11, scope: !344)
!617 = !DILocation(line: 171, column: 9, scope: !344)
!618 = !DILocation(line: 171, column: 2, scope: !344)
!619 = !DILocation(line: 171, column: 5, scope: !344)
!620 = !DILocation(line: 171, column: 7, scope: !344)
!621 = !DILocation(line: 172, column: 9, scope: !344)
!622 = !DILocation(line: 172, column: 2, scope: !344)
!623 = !DILocation(line: 173, column: 1, scope: !344)
!624 = distinct !DISubprogram(name: "test_rules", scope: !1, file: !1, line: 175, type: !625, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!625 = !DISubroutineType(types: !626)
!626 = !{!20, !78, !78}
!627 = !DILocalVariable(name: "s", arg: 1, scope: !624, file: !1, line: 175, type: !78)
!628 = !DILocation(line: 175, column: 28, scope: !624)
!629 = !DILocalVariable(name: "file", arg: 2, scope: !624, file: !1, line: 175, type: !78)
!630 = !DILocation(line: 175, column: 43, scope: !624)
!631 = !DILocalVariable(name: "r", scope: !624, file: !1, line: 177, type: !29)
!632 = !DILocation(line: 177, column: 14, scope: !624)
!633 = !DILocation(line: 177, column: 29, scope: !624)
!634 = !DILocation(line: 177, column: 18, scope: !624)
!635 = !DILocation(line: 178, column: 7, scope: !636)
!636 = distinct !DILexicalBlock(scope: !624, file: !1, line: 178, column: 6)
!637 = !DILocation(line: 178, column: 6, scope: !624)
!638 = !DILocation(line: 178, column: 10, scope: !636)
!639 = !DILocation(line: 179, column: 33, scope: !624)
!640 = !DILocation(line: 179, column: 2, scope: !624)
!641 = !DILocalVariable(name: "ss", scope: !624, file: !1, line: 181, type: !69)
!642 = !DILocation(line: 181, column: 10, scope: !624)
!643 = !DILocation(line: 181, column: 23, scope: !624)
!644 = !DILocation(line: 181, column: 15, scope: !624)
!645 = !DILocation(line: 182, column: 27, scope: !624)
!646 = !DILocation(line: 182, column: 31, scope: !624)
!647 = !DILocation(line: 182, column: 2, scope: !624)
!648 = !DILocation(line: 184, column: 13, scope: !624)
!649 = !DILocation(line: 184, column: 17, scope: !624)
!650 = !DILocation(line: 184, column: 2, scope: !624)
!651 = !DILocation(line: 185, column: 27, scope: !624)
!652 = !DILocation(line: 185, column: 31, scope: !624)
!653 = !DILocation(line: 185, column: 2, scope: !624)
!654 = !DILocation(line: 187, column: 10, scope: !624)
!655 = !DILocation(line: 187, column: 2, scope: !624)
!656 = !DILocation(line: 188, column: 14, scope: !624)
!657 = !DILocation(line: 188, column: 2, scope: !624)
!658 = !DILocation(line: 190, column: 9, scope: !624)
!659 = !DILocation(line: 190, column: 2, scope: !624)
!660 = !DILocation(line: 191, column: 1, scope: !624)
!661 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 193, type: !662, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !45)
!662 = !DISubroutineType(types: !663)
!663 = !{!20}
!664 = !DILocation(line: 196, column: 2, scope: !661)
!665 = !DILocation(line: 197, column: 2, scope: !661)
!666 = !DILocation(line: 198, column: 2, scope: !661)
!667 = !DILocation(line: 199, column: 2, scope: !661)
!668 = !DILocation(line: 200, column: 2, scope: !661)
!669 = !DILocation(line: 202, column: 2, scope: !661)
