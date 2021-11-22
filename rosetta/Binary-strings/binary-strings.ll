; ModuleID = 'binary-strings.c'
source_filename = "binary-strings.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.str_t = type { i64, i64, i8* }

@.str = private unnamed_addr constant [18 x i8] c"aaaaHaaaaaFaaaaHa\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"___.\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%.*s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_new(i64 %len) #0 !dbg !7 {
entry:
  %len.addr = alloca i64, align 8
  %s = alloca %struct.str_t*, align 8
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct.str_t** %s, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call noalias i8* @malloc(i64 24) #6, !dbg !26
  %0 = bitcast i8* %call to %struct.str_t*, !dbg !26
  store %struct.str_t* %0, %struct.str_t** %s, align 8, !dbg !25
  %1 = load i64, i64* %len.addr, align 8, !dbg !27
  %cmp = icmp ult i64 %1, 8, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30, !cf.info !31

if.then:                                          ; preds = %entry
  store i64 8, i64* %len.addr, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !34
  %3 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !35
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 1, !dbg !36
  store i64 %2, i64* %alloc, align 8, !dbg !37
  %4 = load i64, i64* %len.addr, align 8, !dbg !38
  %call1 = call noalias i8* @malloc(i64 %4) #6, !dbg !39
  %5 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !40
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !41
  store i8* %call1, i8** %s2, align 8, !dbg !42
  %6 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !43
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 0, !dbg !44
  store i64 0, i64* %len3, align 8, !dbg !45
  %7 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !46
  ret %struct.str_t* %7, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_extend(%struct.str_t* %s) #0 !dbg !48 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %ns = alloca i64, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %ns, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !55
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !56
  %1 = load i64, i64* %alloc, align 8, !dbg !56
  %mul = mul i64 %1, 2, !dbg !57
  store i64 %mul, i64* %ns, align 8, !dbg !54
  %2 = load i64, i64* %ns, align 8, !dbg !58
  %3 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !60
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 1, !dbg !61
  %4 = load i64, i64* %alloc1, align 8, !dbg !61
  %sub = sub i64 %2, %4, !dbg !62
  %cmp = icmp ugt i64 %sub, 1024, !dbg !63
  br i1 %cmp, label %if.then, label %if.end, !dbg !64, !cf.info !31

if.then:                                          ; preds = %entry
  %5 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !65
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 1, !dbg !66
  %6 = load i64, i64* %alloc2, align 8, !dbg !66
  %add = add i64 %6, 1024, !dbg !67
  store i64 %add, i64* %ns, align 8, !dbg !68
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !70
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !71
  %8 = load i8*, i8** %s3, align 8, !dbg !71
  %9 = load i64, i64* %ns, align 8, !dbg !72
  %call = call i8* @realloc(i8* %8, i64 %9) #6, !dbg !73
  %10 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !74
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 2, !dbg !75
  store i8* %call, i8** %s4, align 8, !dbg !76
  %11 = load i64, i64* %ns, align 8, !dbg !77
  %12 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !78
  %alloc5 = getelementptr inbounds %struct.str_t, %struct.str_t* %12, i32 0, i32 1, !dbg !79
  store i64 %11, i64* %alloc5, align 8, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_del(%struct.str_t* %s) #0 !dbg !82 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !85
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 2, !dbg !86
  %1 = load i8*, i8** %s1, align 8, !dbg !86
  call void @free(i8* %1) #6, !dbg !87
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !88
  %3 = bitcast %struct.str_t* %2 to i8*, !dbg !88
  call void @free(i8* %3) #6, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @str_cmp(%struct.str_t* %l, %struct.str_t* %r) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %l.addr = alloca %struct.str_t*, align 8
  %r.addr = alloca %struct.str_t*, align 8
  %res = alloca i32, align 4
  %len = alloca i32, align 4
  store %struct.str_t* %l, %struct.str_t** %l.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %l.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store %struct.str_t* %r, %struct.str_t** %r.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %r.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %res, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %len, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !103
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !104
  %1 = load i64, i64* %len1, align 8, !dbg !104
  %conv = trunc i64 %1 to i32, !dbg !103
  store i32 %conv, i32* %len, align 4, !dbg !102
  %2 = load i32, i32* %len, align 4, !dbg !105
  %conv2 = sext i32 %2 to i64, !dbg !105
  %3 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !107
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !108
  %4 = load i64, i64* %len3, align 8, !dbg !108
  %cmp = icmp ugt i64 %conv2, %4, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110, !cf.info !31

if.then:                                          ; preds = %entry
  %5 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !111
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 0, !dbg !112
  %6 = load i64, i64* %len5, align 8, !dbg !112
  %conv6 = trunc i64 %6 to i32, !dbg !111
  store i32 %conv6, i32* %len, align 4, !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !115
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !117
  %8 = load i8*, i8** %s, align 8, !dbg !117
  %9 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !118
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 2, !dbg !119
  %10 = load i8*, i8** %s7, align 8, !dbg !119
  %11 = load i32, i32* %len, align 4, !dbg !120
  %conv8 = sext i32 %11 to i64, !dbg !120
  %call = call i32 @memcmp(i8* %8, i8* %10, i64 %conv8) #7, !dbg !121
  store i32 %call, i32* %res, align 4, !dbg !122
  %tobool = icmp ne i32 %call, 0, !dbg !122
  br i1 %tobool, label %if.then9, label %if.end10, !dbg !123, !cf.info !31

if.then9:                                         ; preds = %if.end
  %12 = load i32, i32* %res, align 4, !dbg !124
  store i32 %12, i32* %retval, align 4, !dbg !125
  br label %return, !dbg !125

if.end10:                                         ; preds = %if.end
  %13 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !126
  %len11 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !127
  %14 = load i64, i64* %len11, align 8, !dbg !127
  %15 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !128
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %15, i32 0, i32 0, !dbg !129
  %16 = load i64, i64* %len12, align 8, !dbg !129
  %cmp13 = icmp ugt i64 %14, %16, !dbg !130
  %17 = zext i1 %cmp13 to i64, !dbg !126
  %cond = select i1 %cmp13, i32 1, i32 -1, !dbg !126
  store i32 %cond, i32* %retval, align 4, !dbg !131
  br label %return, !dbg !131

return:                                           ; preds = %if.end10, %if.then9
  %18 = load i32, i32* %retval, align 4, !dbg !132
  ret i32 %18, !dbg !132
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_dup(%struct.str_t* %src) #0 !dbg !133 {
entry:
  %src.addr = alloca %struct.str_t*, align 8
  %x = alloca %struct.str_t*, align 8
  store %struct.str_t* %src, %struct.str_t** %src.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %src.addr, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !140
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !141
  %1 = load i64, i64* %len, align 8, !dbg !141
  %call = call %struct.str_t* @str_new(i64 %1), !dbg !142
  store %struct.str_t* %call, %struct.str_t** %x, align 8, !dbg !139
  %2 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !143
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 2, !dbg !144
  %3 = load i8*, i8** %s, align 8, !dbg !144
  %4 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !145
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 2, !dbg !146
  %5 = load i8*, i8** %s1, align 8, !dbg !146
  %6 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !147
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 0, !dbg !148
  %7 = load i64, i64* %len2, align 8, !dbg !148
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %5, i64 %7, i1 false), !dbg !149
  %8 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !150
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 0, !dbg !151
  %9 = load i64, i64* %len3, align 8, !dbg !151
  %10 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !152
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 0, !dbg !153
  store i64 %9, i64* %len4, align 8, !dbg !154
  %11 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !155
  ret %struct.str_t* %11, !dbg !156
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_from_chars(i8* %t) #0 !dbg !157 {
entry:
  %retval = alloca %struct.str_t*, align 8
  %t.addr = alloca i8*, align 8
  %l = alloca i64, align 8
  %x = alloca %struct.str_t*, align 8
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = load i8*, i8** %t.addr, align 8, !dbg !165
  %tobool = icmp ne i8* %0, null, !dbg !165
  br i1 %tobool, label %if.end, label %if.then, !dbg !167, !cf.info !31

if.then:                                          ; preds = %entry
  %call = call %struct.str_t* @str_new(i64 0), !dbg !168
  store %struct.str_t* %call, %struct.str_t** %retval, align 8, !dbg !169
  br label %return, !dbg !169

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %l, metadata !170, metadata !DIExpression()), !dbg !171
  %1 = load i8*, i8** %t.addr, align 8, !dbg !172
  %call1 = call i64 @strlen(i8* %1) #7, !dbg !173
  store i64 %call1, i64* %l, align 8, !dbg !171
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !174, metadata !DIExpression()), !dbg !175
  %2 = load i64, i64* %l, align 8, !dbg !176
  %add = add i64 %2, 1, !dbg !177
  %call2 = call %struct.str_t* @str_new(i64 %add), !dbg !178
  store %struct.str_t* %call2, %struct.str_t** %x, align 8, !dbg !175
  %3 = load i64, i64* %l, align 8, !dbg !179
  %4 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !180
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !181
  store i64 %3, i64* %len, align 8, !dbg !182
  %5 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !183
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !184
  %6 = load i8*, i8** %s, align 8, !dbg !184
  %7 = load i8*, i8** %t.addr, align 8, !dbg !185
  %8 = load i64, i64* %l, align 8, !dbg !186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 %8, i1 false), !dbg !187
  %9 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !188
  store %struct.str_t* %9, %struct.str_t** %retval, align 8, !dbg !189
  br label %return, !dbg !189

return:                                           ; preds = %if.end, %if.then
  %10 = load %struct.str_t*, %struct.str_t** %retval, align 8, !dbg !190
  ret %struct.str_t* %10, !dbg !190
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_append(%struct.str_t* %s, i8 zeroext %b) #0 !dbg !191 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %b.addr = alloca i8, align 1
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i8 %b, i8* %b.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %b.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !198
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !200
  %1 = load i64, i64* %len, align 8, !dbg !200
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !201
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 1, !dbg !202
  %3 = load i64, i64* %alloc, align 8, !dbg !202
  %cmp = icmp uge i64 %1, %3, !dbg !203
  br i1 %cmp, label %if.then, label %if.end, !dbg !204, !cf.info !31

if.then:                                          ; preds = %entry
  %4 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !205
  call void @str_extend(%struct.str_t* %4), !dbg !206
  br label %if.end, !dbg !206

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8, i8* %b.addr, align 1, !dbg !207
  %6 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !208
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 2, !dbg !209
  %7 = load i8*, i8** %s1, align 8, !dbg !209
  %8 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !210
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 0, !dbg !211
  %9 = load i64, i64* %len2, align 8, !dbg !212
  %inc = add i64 %9, 1, !dbg !212
  store i64 %inc, i64* %len2, align 8, !dbg !212
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %9, !dbg !208
  store i8 %5, i8* %arrayidx, align 1, !dbg !213
  ret void, !dbg !214
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_substr(%struct.str_t* %s, i32 %from, i32 %to) #0 !dbg !215 {
entry:
  %retval = alloca %struct.str_t*, align 8
  %s.addr = alloca %struct.str_t*, align 8
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %x = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 %from, i32* %from.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %from.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 %to, i32* %to.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %to.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i32, i32* %to.addr, align 4, !dbg !224
  %tobool = icmp ne i32 %0, 0, !dbg !224
  br i1 %tobool, label %if.end, label %if.then, !dbg !226, !cf.info !31

if.then:                                          ; preds = %entry
  %1 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !227
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %1, i32 0, i32 0, !dbg !228
  %2 = load i64, i64* %len, align 8, !dbg !228
  %conv = trunc i64 %2 to i32, !dbg !227
  store i32 %conv, i32* %to.addr, align 4, !dbg !229
  br label %if.end, !dbg !230

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %from.addr, align 4, !dbg !231
  %cmp = icmp slt i32 %3, 0, !dbg !233
  br i1 %cmp, label %if.then2, label %if.end6, !dbg !234, !cf.info !31

if.then2:                                         ; preds = %if.end
  %4 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !235
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !236
  %5 = load i64, i64* %len3, align 8, !dbg !236
  %6 = load i32, i32* %from.addr, align 4, !dbg !237
  %conv4 = sext i32 %6 to i64, !dbg !237
  %add = add i64 %conv4, %5, !dbg !237
  %conv5 = trunc i64 %add to i32, !dbg !237
  store i32 %conv5, i32* %from.addr, align 4, !dbg !237
  br label %if.end6, !dbg !238

if.end6:                                          ; preds = %if.then2, %if.end
  %7 = load i32, i32* %from.addr, align 4, !dbg !239
  %cmp7 = icmp slt i32 %7, 0, !dbg !241
  br i1 %cmp7, label %if.then13, label %lor.lhs.false, !dbg !242, !cf.info !31

lor.lhs.false:                                    ; preds = %if.end6
  %8 = load i32, i32* %from.addr, align 4, !dbg !243
  %conv9 = sext i32 %8 to i64, !dbg !243
  %9 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !244
  %len10 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !245
  %10 = load i64, i64* %len10, align 8, !dbg !245
  %cmp11 = icmp uge i64 %conv9, %10, !dbg !246
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !247, !cf.info !31

if.then13:                                        ; preds = %lor.lhs.false, %if.end6
  store %struct.str_t* null, %struct.str_t** %retval, align 8, !dbg !248
  br label %return, !dbg !248

if.end14:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %to.addr, align 4, !dbg !249
  %12 = load i32, i32* %from.addr, align 4, !dbg !251
  %cmp15 = icmp slt i32 %11, %12, !dbg !252
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !253, !cf.info !31

if.then17:                                        ; preds = %if.end14
  %13 = load i32, i32* %from.addr, align 4, !dbg !254
  %add18 = add nsw i32 %13, 1, !dbg !255
  store i32 %add18, i32* %to.addr, align 4, !dbg !256
  br label %if.end19, !dbg !257

if.end19:                                         ; preds = %if.then17, %if.end14
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !258, metadata !DIExpression()), !dbg !259
  %14 = load i32, i32* %to.addr, align 4, !dbg !260
  %15 = load i32, i32* %from.addr, align 4, !dbg !261
  %sub = sub nsw i32 %14, %15, !dbg !262
  %conv20 = sext i32 %sub to i64, !dbg !260
  %call = call %struct.str_t* @str_new(i64 %conv20), !dbg !263
  store %struct.str_t* %call, %struct.str_t** %x, align 8, !dbg !259
  %16 = load i32, i32* %to.addr, align 4, !dbg !264
  %17 = load i32, i32* %from.addr, align 4, !dbg !265
  %sub21 = sub nsw i32 %16, %17, !dbg !266
  %conv22 = sext i32 %sub21 to i64, !dbg !264
  %18 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !267
  %len23 = getelementptr inbounds %struct.str_t, %struct.str_t* %18, i32 0, i32 0, !dbg !268
  store i64 %conv22, i64* %len23, align 8, !dbg !269
  %19 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !270
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %19, i32 0, i32 2, !dbg !271
  %20 = load i8*, i8** %s24, align 8, !dbg !271
  %21 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !272
  %s25 = getelementptr inbounds %struct.str_t, %struct.str_t* %21, i32 0, i32 2, !dbg !273
  %22 = load i8*, i8** %s25, align 8, !dbg !273
  %23 = load i32, i32* %from.addr, align 4, !dbg !274
  %idx.ext = sext i32 %23 to i64, !dbg !275
  %add.ptr = getelementptr inbounds i8, i8* %22, i64 %idx.ext, !dbg !275
  %24 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !276
  %len26 = getelementptr inbounds %struct.str_t, %struct.str_t* %24, i32 0, i32 0, !dbg !277
  %25 = load i64, i64* %len26, align 8, !dbg !277
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %20, i8* align 1 %add.ptr, i64 %25, i1 false), !dbg !278
  %26 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !279
  store %struct.str_t* %26, %struct.str_t** %retval, align 8, !dbg !280
  br label %return, !dbg !280

return:                                           ; preds = %if.end19, %if.then13
  %27 = load %struct.str_t*, %struct.str_t** %retval, align 8, !dbg !281
  ret %struct.str_t* %27, !dbg !281
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_cat(%struct.str_t* %s, %struct.str_t* %s2) #0 !dbg !282 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %s2.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !285, metadata !DIExpression()), !dbg !286
  store %struct.str_t* %s2, %struct.str_t** %s2.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s2.addr, metadata !287, metadata !DIExpression()), !dbg !288
  br label %while.cond, !dbg !289

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !290
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !291
  %1 = load i64, i64* %alloc, align 8, !dbg !291
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !292
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 0, !dbg !293
  %3 = load i64, i64* %len, align 8, !dbg !293
  %4 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !294
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !295
  %5 = load i64, i64* %len1, align 8, !dbg !295
  %add = add i64 %3, %5, !dbg !296
  %cmp = icmp ult i64 %1, %add, !dbg !297
  br i1 %cmp, label %while.body, label %while.end, !dbg !289

while.body:                                       ; preds = %while.cond
  %6 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !298
  call void @str_extend(%struct.str_t* %6), !dbg !299
  br label %while.cond, !dbg !289, !llvm.loop !300

while.end:                                        ; preds = %while.cond
  %7 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !302
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !303
  %8 = load i8*, i8** %s3, align 8, !dbg !303
  %9 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !304
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !305
  %10 = load i64, i64* %len4, align 8, !dbg !305
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 %10, !dbg !306
  %11 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !307
  %s5 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 2, !dbg !308
  %12 = load i8*, i8** %s5, align 8, !dbg !308
  %13 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !309
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !310
  %14 = load i64, i64* %len6, align 8, !dbg !310
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %12, i64 %14, i1 false), !dbg !311
  %15 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !312
  %len7 = getelementptr inbounds %struct.str_t, %struct.str_t* %15, i32 0, i32 0, !dbg !313
  %16 = load i64, i64* %len7, align 8, !dbg !313
  %17 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !314
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %17, i32 0, i32 0, !dbg !315
  %18 = load i64, i64* %len8, align 8, !dbg !316
  %add9 = add i64 %18, %16, !dbg !316
  store i64 %add9, i64* %len8, align 8, !dbg !316
  %19 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !317
  ret %struct.str_t* %19, !dbg !318
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_swap(%struct.str_t* %a, %struct.str_t* %b) #0 !dbg !319 {
entry:
  %a.addr = alloca %struct.str_t*, align 8
  %b.addr = alloca %struct.str_t*, align 8
  %tz = alloca i64, align 8
  %ts = alloca i8*, align 8
  store %struct.str_t* %a, %struct.str_t** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %a.addr, metadata !322, metadata !DIExpression()), !dbg !323
  store %struct.str_t* %b, %struct.str_t** %b.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %b.addr, metadata !324, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.declare(metadata i64* %tz, metadata !326, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata i8** %ts, metadata !328, metadata !DIExpression()), !dbg !329
  %0 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !330
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !331
  %1 = load i64, i64* %alloc, align 8, !dbg !331
  store i64 %1, i64* %tz, align 8, !dbg !332
  %2 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !333
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 1, !dbg !334
  %3 = load i64, i64* %alloc1, align 8, !dbg !334
  %4 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !335
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 1, !dbg !336
  store i64 %3, i64* %alloc2, align 8, !dbg !337
  %5 = load i64, i64* %tz, align 8, !dbg !338
  %6 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !339
  %alloc3 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 1, !dbg !340
  store i64 %5, i64* %alloc3, align 8, !dbg !341
  %7 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !342
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 0, !dbg !343
  %8 = load i64, i64* %len, align 8, !dbg !343
  store i64 %8, i64* %tz, align 8, !dbg !344
  %9 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !345
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !346
  %10 = load i64, i64* %len4, align 8, !dbg !346
  %11 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !347
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 0, !dbg !348
  store i64 %10, i64* %len5, align 8, !dbg !349
  %12 = load i64, i64* %tz, align 8, !dbg !350
  %13 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !351
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !352
  store i64 %12, i64* %len6, align 8, !dbg !353
  %14 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !354
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %14, i32 0, i32 2, !dbg !355
  %15 = load i8*, i8** %s, align 8, !dbg !355
  store i8* %15, i8** %ts, align 8, !dbg !356
  %16 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !357
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %16, i32 0, i32 2, !dbg !358
  %17 = load i8*, i8** %s7, align 8, !dbg !358
  %18 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !359
  %s8 = getelementptr inbounds %struct.str_t, %struct.str_t* %18, i32 0, i32 2, !dbg !360
  store i8* %17, i8** %s8, align 8, !dbg !361
  %19 = load i8*, i8** %ts, align 8, !dbg !362
  %20 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !363
  %s9 = getelementptr inbounds %struct.str_t, %struct.str_t* %20, i32 0, i32 2, !dbg !364
  store i8* %19, i8** %s9, align 8, !dbg !365
  ret void, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_subst(%struct.str_t* %tgt, %struct.str_t* %pat, %struct.str_t* %repl) #0 !dbg !367 {
entry:
  %tgt.addr = alloca %struct.str_t*, align 8
  %pat.addr = alloca %struct.str_t*, align 8
  %repl.addr = alloca %struct.str_t*, align 8
  %tmp = alloca %struct.str_t*, align 8
  %i = alloca i32, align 4
  store %struct.str_t* %tgt, %struct.str_t** %tgt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %tgt.addr, metadata !370, metadata !DIExpression()), !dbg !371
  store %struct.str_t* %pat, %struct.str_t** %pat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %pat.addr, metadata !372, metadata !DIExpression()), !dbg !373
  store %struct.str_t* %repl, %struct.str_t** %repl.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %repl.addr, metadata !374, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata %struct.str_t** %tmp, metadata !376, metadata !DIExpression()), !dbg !377
  %call = call %struct.str_t* @str_new(i64 0), !dbg !378
  store %struct.str_t* %call, %struct.str_t** %tmp, align 8, !dbg !377
  call void @llvm.dbg.declare(metadata i32* %i, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 0, i32* %i, align 4, !dbg !381
  br label %for.cond, !dbg !383

for.cond:                                         ; preds = %if.end19, %entry
  %0 = load i32, i32* %i, align 4, !dbg !384
  %conv = sext i32 %0 to i64, !dbg !384
  %1 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !386
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %1, i32 0, i32 0, !dbg !387
  %2 = load i64, i64* %len, align 8, !dbg !387
  %add = add i64 %conv, %2, !dbg !388
  %3 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !389
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !390
  %4 = load i64, i64* %len1, align 8, !dbg !390
  %cmp = icmp ule i64 %add, %4, !dbg !391
  br i1 %cmp, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %5 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !393
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !396
  %6 = load i8*, i8** %s, align 8, !dbg !396
  %7 = load i32, i32* %i, align 4, !dbg !397
  %idx.ext = sext i32 %7 to i64, !dbg !398
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 %idx.ext, !dbg !398
  %8 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !399
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 2, !dbg !400
  %9 = load i8*, i8** %s3, align 8, !dbg !400
  %10 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !401
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 0, !dbg !402
  %11 = load i64, i64* %len4, align 8, !dbg !402
  %call5 = call i32 @memcmp(i8* %add.ptr, i8* %9, i64 %11) #7, !dbg !403
  %tobool = icmp ne i32 %call5, 0, !dbg !403
  br i1 %tobool, label %if.then, label %if.else, !dbg !404, !cf.info !31

if.then:                                          ; preds = %for.body
  %12 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !405
  %13 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !407
  %s6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 2, !dbg !408
  %14 = load i8*, i8** %s6, align 8, !dbg !408
  %15 = load i32, i32* %i, align 4, !dbg !409
  %idxprom = sext i32 %15 to i64, !dbg !407
  %arrayidx = getelementptr inbounds i8, i8* %14, i64 %idxprom, !dbg !407
  %16 = load i8, i8* %arrayidx, align 1, !dbg !407
  call void @str_append(%struct.str_t* %12, i8 zeroext %16), !dbg !410
  %17 = load i32, i32* %i, align 4, !dbg !411
  %inc = add nsw i32 %17, 1, !dbg !411
  store i32 %inc, i32* %i, align 4, !dbg !411
  br label %if.end19, !dbg !412

if.else:                                          ; preds = %for.body
  %18 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !413
  %19 = load %struct.str_t*, %struct.str_t** %repl.addr, align 8, !dbg !415
  %call7 = call %struct.str_t* @str_cat(%struct.str_t* %18, %struct.str_t* %19), !dbg !416
  %20 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !417
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %20, i32 0, i32 0, !dbg !418
  %21 = load i64, i64* %len8, align 8, !dbg !418
  %22 = load i32, i32* %i, align 4, !dbg !419
  %conv9 = sext i32 %22 to i64, !dbg !419
  %add10 = add i64 %conv9, %21, !dbg !419
  %conv11 = trunc i64 %add10 to i32, !dbg !419
  store i32 %conv11, i32* %i, align 4, !dbg !419
  %23 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !420
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %23, i32 0, i32 0, !dbg !422
  %24 = load i64, i64* %len12, align 8, !dbg !422
  %tobool13 = icmp ne i64 %24, 0, !dbg !420
  br i1 %tobool13, label %if.end, label %if.then14, !dbg !423, !cf.info !31

if.then14:                                        ; preds = %if.else
  %25 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !424
  %26 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !425
  %s15 = getelementptr inbounds %struct.str_t, %struct.str_t* %26, i32 0, i32 2, !dbg !426
  %27 = load i8*, i8** %s15, align 8, !dbg !426
  %28 = load i32, i32* %i, align 4, !dbg !427
  %inc16 = add nsw i32 %28, 1, !dbg !427
  store i32 %inc16, i32* %i, align 4, !dbg !427
  %idxprom17 = sext i32 %28 to i64, !dbg !425
  %arrayidx18 = getelementptr inbounds i8, i8* %27, i64 %idxprom17, !dbg !425
  %29 = load i8, i8* %arrayidx18, align 1, !dbg !425
  call void @str_append(%struct.str_t* %25, i8 zeroext %29), !dbg !428
  br label %if.end, !dbg !428

if.end:                                           ; preds = %if.then14, %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  br label %for.cond, !dbg !429, !llvm.loop !430

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !432

while.cond:                                       ; preds = %while.body, %for.end
  %30 = load i32, i32* %i, align 4, !dbg !433
  %conv20 = sext i32 %30 to i64, !dbg !433
  %31 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !434
  %len21 = getelementptr inbounds %struct.str_t, %struct.str_t* %31, i32 0, i32 0, !dbg !435
  %32 = load i64, i64* %len21, align 8, !dbg !435
  %cmp22 = icmp ult i64 %conv20, %32, !dbg !436
  br i1 %cmp22, label %while.body, label %while.end, !dbg !432

while.body:                                       ; preds = %while.cond
  %33 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !437
  %34 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !438
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %34, i32 0, i32 2, !dbg !439
  %35 = load i8*, i8** %s24, align 8, !dbg !439
  %36 = load i32, i32* %i, align 4, !dbg !440
  %inc25 = add nsw i32 %36, 1, !dbg !440
  store i32 %inc25, i32* %i, align 4, !dbg !440
  %idxprom26 = sext i32 %36 to i64, !dbg !438
  %arrayidx27 = getelementptr inbounds i8, i8* %35, i64 %idxprom26, !dbg !438
  %37 = load i8, i8* %arrayidx27, align 1, !dbg !438
  call void @str_append(%struct.str_t* %33, i8 zeroext %37), !dbg !441
  br label %while.cond, !dbg !432, !llvm.loop !442

while.end:                                        ; preds = %while.cond
  %38 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !444
  %39 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !445
  call void @str_swap(%struct.str_t* %38, %struct.str_t* %39), !dbg !446
  %40 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !447
  call void @str_del(%struct.str_t* %40), !dbg !448
  %41 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !449
  ret %struct.str_t* %41, !dbg !450
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_set(%struct.str_t* %dest, %struct.str_t* %src) #0 !dbg !451 {
entry:
  %dest.addr = alloca %struct.str_t*, align 8
  %src.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %dest, %struct.str_t** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %dest.addr, metadata !452, metadata !DIExpression()), !dbg !453
  store %struct.str_t* %src, %struct.str_t** %src.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %src.addr, metadata !454, metadata !DIExpression()), !dbg !455
  br label %while.cond, !dbg !456

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !457
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !458
  %1 = load i64, i64* %len, align 8, !dbg !458
  %2 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !459
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 0, !dbg !460
  %3 = load i64, i64* %len1, align 8, !dbg !460
  %cmp = icmp ult i64 %1, %3, !dbg !461
  br i1 %cmp, label %while.body, label %while.end, !dbg !456

while.body:                                       ; preds = %while.cond
  %4 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !462
  call void @str_extend(%struct.str_t* %4), !dbg !463
  br label %while.cond, !dbg !456, !llvm.loop !464

while.end:                                        ; preds = %while.cond
  %5 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !466
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !467
  %6 = load i8*, i8** %s, align 8, !dbg !467
  %7 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !468
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !469
  %8 = load i8*, i8** %s2, align 8, !dbg !469
  %9 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !470
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !471
  %10 = load i64, i64* %len3, align 8, !dbg !471
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %8, i64 %10, i1 false), !dbg !472
  %11 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !473
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 0, !dbg !474
  %12 = load i64, i64* %len4, align 8, !dbg !474
  %13 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !475
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !476
  store i64 %12, i64* %len5, align 8, !dbg !477
  ret void, !dbg !478
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !479 {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.str_t*, align 8
  %s2 = alloca %struct.str_t*, align 8
  %s3 = alloca %struct.str_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.str_t** %s, metadata !482, metadata !DIExpression()), !dbg !483
  %call = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !484
  store %struct.str_t* %call, %struct.str_t** %s, align 8, !dbg !483
  call void @llvm.dbg.declare(metadata %struct.str_t** %s2, metadata !485, metadata !DIExpression()), !dbg !486
  %call1 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !487
  store %struct.str_t* %call1, %struct.str_t** %s2, align 8, !dbg !486
  call void @llvm.dbg.declare(metadata %struct.str_t** %s3, metadata !488, metadata !DIExpression()), !dbg !489
  %call2 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0)), !dbg !490
  store %struct.str_t* %call2, %struct.str_t** %s3, align 8, !dbg !489
  %0 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !491
  %1 = load %struct.str_t*, %struct.str_t** %s3, align 8, !dbg !492
  %2 = load %struct.str_t*, %struct.str_t** %s2, align 8, !dbg !493
  %call3 = call %struct.str_t* @str_subst(%struct.str_t* %0, %struct.str_t* %1, %struct.str_t* %2), !dbg !494
  %3 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !495
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !496
  %4 = load i64, i64* %len, align 8, !dbg !496
  %5 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !497
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !498
  %6 = load i8*, i8** %s4, align 8, !dbg !498
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %4, i8* %6), !dbg !499
  %7 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !500
  call void @str_del(%struct.str_t* %7), !dbg !501
  %8 = load %struct.str_t*, %struct.str_t** %s2, align 8, !dbg !502
  call void @str_del(%struct.str_t* %8), !dbg !503
  %9 = load %struct.str_t*, %struct.str_t** %s3, align 8, !dbg !504
  call void @str_del(%struct.str_t* %9), !dbg !505
  ret i32 0, !dbg !506
}

declare dso_local i32 @printf(i8*, ...) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-strings.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-strings")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "str_new", scope: !1, file: !1, line: 11, type: !8, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !15}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "bstr", file: !1, line: 8, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "str_t", file: !1, line: 5, size: 192, elements: !13)
!13 = !{!14, !18, !19}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !12, file: !1, line: 6, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "alloc", scope: !12, file: !1, line: 6, baseType: !15, size: 64, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !12, file: !1, line: 7, baseType: !20, size: 64, offset: 128)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DILocalVariable(name: "len", arg: 1, scope: !7, file: !1, line: 11, type: !15)
!23 = !DILocation(line: 11, column: 21, scope: !7)
!24 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 13, type: !10)
!25 = !DILocation(line: 13, column: 7, scope: !7)
!26 = !DILocation(line: 13, column: 11, scope: !7)
!27 = !DILocation(line: 14, column: 6, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 6)
!29 = !DILocation(line: 14, column: 10, scope: !28)
!30 = !DILocation(line: 14, column: 6, scope: !7)
!31 = !{!"if"}
!32 = !DILocation(line: 14, column: 19, scope: !28)
!33 = !DILocation(line: 14, column: 15, scope: !28)
!34 = !DILocation(line: 15, column: 13, scope: !7)
!35 = !DILocation(line: 15, column: 2, scope: !7)
!36 = !DILocation(line: 15, column: 5, scope: !7)
!37 = !DILocation(line: 15, column: 11, scope: !7)
!38 = !DILocation(line: 16, column: 16, scope: !7)
!39 = !DILocation(line: 16, column: 9, scope: !7)
!40 = !DILocation(line: 16, column: 2, scope: !7)
!41 = !DILocation(line: 16, column: 5, scope: !7)
!42 = !DILocation(line: 16, column: 7, scope: !7)
!43 = !DILocation(line: 17, column: 2, scope: !7)
!44 = !DILocation(line: 17, column: 5, scope: !7)
!45 = !DILocation(line: 17, column: 9, scope: !7)
!46 = !DILocation(line: 18, column: 9, scope: !7)
!47 = !DILocation(line: 18, column: 2, scope: !7)
!48 = distinct !DISubprogram(name: "str_extend", scope: !1, file: !1, line: 21, type: !49, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !10}
!51 = !DILocalVariable(name: "s", arg: 1, scope: !48, file: !1, line: 21, type: !10)
!52 = !DILocation(line: 21, column: 22, scope: !48)
!53 = !DILocalVariable(name: "ns", scope: !48, file: !1, line: 23, type: !15)
!54 = !DILocation(line: 23, column: 9, scope: !48)
!55 = !DILocation(line: 23, column: 14, scope: !48)
!56 = !DILocation(line: 23, column: 17, scope: !48)
!57 = !DILocation(line: 23, column: 23, scope: !48)
!58 = !DILocation(line: 24, column: 6, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !1, line: 24, column: 6)
!60 = !DILocation(line: 24, column: 11, scope: !59)
!61 = !DILocation(line: 24, column: 14, scope: !59)
!62 = !DILocation(line: 24, column: 9, scope: !59)
!63 = !DILocation(line: 24, column: 20, scope: !59)
!64 = !DILocation(line: 24, column: 6, scope: !48)
!65 = !DILocation(line: 24, column: 33, scope: !59)
!66 = !DILocation(line: 24, column: 36, scope: !59)
!67 = !DILocation(line: 24, column: 42, scope: !59)
!68 = !DILocation(line: 24, column: 31, scope: !59)
!69 = !DILocation(line: 24, column: 28, scope: !59)
!70 = !DILocation(line: 25, column: 17, scope: !48)
!71 = !DILocation(line: 25, column: 20, scope: !48)
!72 = !DILocation(line: 25, column: 23, scope: !48)
!73 = !DILocation(line: 25, column: 9, scope: !48)
!74 = !DILocation(line: 25, column: 2, scope: !48)
!75 = !DILocation(line: 25, column: 5, scope: !48)
!76 = !DILocation(line: 25, column: 7, scope: !48)
!77 = !DILocation(line: 26, column: 13, scope: !48)
!78 = !DILocation(line: 26, column: 2, scope: !48)
!79 = !DILocation(line: 26, column: 5, scope: !48)
!80 = !DILocation(line: 26, column: 11, scope: !48)
!81 = !DILocation(line: 27, column: 1, scope: !48)
!82 = distinct !DISubprogram(name: "str_del", scope: !1, file: !1, line: 29, type: !49, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "s", arg: 1, scope: !82, file: !1, line: 29, type: !10)
!84 = !DILocation(line: 29, column: 19, scope: !82)
!85 = !DILocation(line: 31, column: 7, scope: !82)
!86 = !DILocation(line: 31, column: 10, scope: !82)
!87 = !DILocation(line: 31, column: 2, scope: !82)
!88 = !DILocation(line: 31, column: 19, scope: !82)
!89 = !DILocation(line: 31, column: 14, scope: !82)
!90 = !DILocation(line: 32, column: 1, scope: !82)
!91 = distinct !DISubprogram(name: "str_cmp", scope: !1, file: !1, line: 34, type: !92, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !10, !10}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DILocalVariable(name: "l", arg: 1, scope: !91, file: !1, line: 34, type: !10)
!96 = !DILocation(line: 34, column: 18, scope: !91)
!97 = !DILocalVariable(name: "r", arg: 2, scope: !91, file: !1, line: 34, type: !10)
!98 = !DILocation(line: 34, column: 26, scope: !91)
!99 = !DILocalVariable(name: "res", scope: !91, file: !1, line: 36, type: !94)
!100 = !DILocation(line: 36, column: 6, scope: !91)
!101 = !DILocalVariable(name: "len", scope: !91, file: !1, line: 36, type: !94)
!102 = !DILocation(line: 36, column: 11, scope: !91)
!103 = !DILocation(line: 36, column: 17, scope: !91)
!104 = !DILocation(line: 36, column: 20, scope: !91)
!105 = !DILocation(line: 37, column: 6, scope: !106)
!106 = distinct !DILexicalBlock(scope: !91, file: !1, line: 37, column: 6)
!107 = !DILocation(line: 37, column: 12, scope: !106)
!108 = !DILocation(line: 37, column: 15, scope: !106)
!109 = !DILocation(line: 37, column: 10, scope: !106)
!110 = !DILocation(line: 37, column: 6, scope: !91)
!111 = !DILocation(line: 37, column: 26, scope: !106)
!112 = !DILocation(line: 37, column: 29, scope: !106)
!113 = !DILocation(line: 37, column: 24, scope: !106)
!114 = !DILocation(line: 37, column: 20, scope: !106)
!115 = !DILocation(line: 39, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !91, file: !1, line: 39, column: 6)
!117 = !DILocation(line: 39, column: 23, scope: !116)
!118 = !DILocation(line: 39, column: 26, scope: !116)
!119 = !DILocation(line: 39, column: 29, scope: !116)
!120 = !DILocation(line: 39, column: 32, scope: !116)
!121 = !DILocation(line: 39, column: 13, scope: !116)
!122 = !DILocation(line: 39, column: 11, scope: !116)
!123 = !DILocation(line: 39, column: 6, scope: !91)
!124 = !DILocation(line: 39, column: 46, scope: !116)
!125 = !DILocation(line: 39, column: 39, scope: !116)
!126 = !DILocation(line: 40, column: 9, scope: !91)
!127 = !DILocation(line: 40, column: 12, scope: !91)
!128 = !DILocation(line: 40, column: 18, scope: !91)
!129 = !DILocation(line: 40, column: 21, scope: !91)
!130 = !DILocation(line: 40, column: 16, scope: !91)
!131 = !DILocation(line: 40, column: 2, scope: !91)
!132 = !DILocation(line: 41, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "str_dup", scope: !1, file: !1, line: 43, type: !134, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DISubroutineType(types: !135)
!135 = !{!10, !10}
!136 = !DILocalVariable(name: "src", arg: 1, scope: !133, file: !1, line: 43, type: !10)
!137 = !DILocation(line: 43, column: 19, scope: !133)
!138 = !DILocalVariable(name: "x", scope: !133, file: !1, line: 45, type: !10)
!139 = !DILocation(line: 45, column: 7, scope: !133)
!140 = !DILocation(line: 45, column: 19, scope: !133)
!141 = !DILocation(line: 45, column: 24, scope: !133)
!142 = !DILocation(line: 45, column: 11, scope: !133)
!143 = !DILocation(line: 46, column: 9, scope: !133)
!144 = !DILocation(line: 46, column: 12, scope: !133)
!145 = !DILocation(line: 46, column: 15, scope: !133)
!146 = !DILocation(line: 46, column: 20, scope: !133)
!147 = !DILocation(line: 46, column: 23, scope: !133)
!148 = !DILocation(line: 46, column: 28, scope: !133)
!149 = !DILocation(line: 46, column: 2, scope: !133)
!150 = !DILocation(line: 47, column: 11, scope: !133)
!151 = !DILocation(line: 47, column: 16, scope: !133)
!152 = !DILocation(line: 47, column: 2, scope: !133)
!153 = !DILocation(line: 47, column: 5, scope: !133)
!154 = !DILocation(line: 47, column: 9, scope: !133)
!155 = !DILocation(line: 48, column: 9, scope: !133)
!156 = !DILocation(line: 48, column: 2, scope: !133)
!157 = distinct !DISubprogram(name: "str_from_chars", scope: !1, file: !1, line: 51, type: !158, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DISubroutineType(types: !159)
!159 = !{!10, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !162)
!162 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!163 = !DILocalVariable(name: "t", arg: 1, scope: !157, file: !1, line: 51, type: !160)
!164 = !DILocation(line: 51, column: 33, scope: !157)
!165 = !DILocation(line: 53, column: 7, scope: !166)
!166 = distinct !DILexicalBlock(scope: !157, file: !1, line: 53, column: 6)
!167 = !DILocation(line: 53, column: 6, scope: !157)
!168 = !DILocation(line: 53, column: 17, scope: !166)
!169 = !DILocation(line: 53, column: 10, scope: !166)
!170 = !DILocalVariable(name: "l", scope: !157, file: !1, line: 54, type: !15)
!171 = !DILocation(line: 54, column: 9, scope: !157)
!172 = !DILocation(line: 54, column: 20, scope: !157)
!173 = !DILocation(line: 54, column: 13, scope: !157)
!174 = !DILocalVariable(name: "x", scope: !157, file: !1, line: 55, type: !10)
!175 = !DILocation(line: 55, column: 7, scope: !157)
!176 = !DILocation(line: 55, column: 19, scope: !157)
!177 = !DILocation(line: 55, column: 21, scope: !157)
!178 = !DILocation(line: 55, column: 11, scope: !157)
!179 = !DILocation(line: 56, column: 11, scope: !157)
!180 = !DILocation(line: 56, column: 2, scope: !157)
!181 = !DILocation(line: 56, column: 5, scope: !157)
!182 = !DILocation(line: 56, column: 9, scope: !157)
!183 = !DILocation(line: 57, column: 9, scope: !157)
!184 = !DILocation(line: 57, column: 12, scope: !157)
!185 = !DILocation(line: 57, column: 15, scope: !157)
!186 = !DILocation(line: 57, column: 18, scope: !157)
!187 = !DILocation(line: 57, column: 2, scope: !157)
!188 = !DILocation(line: 58, column: 9, scope: !157)
!189 = !DILocation(line: 58, column: 2, scope: !157)
!190 = !DILocation(line: 59, column: 1, scope: !157)
!191 = distinct !DISubprogram(name: "str_append", scope: !1, file: !1, line: 61, type: !192, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!192 = !DISubroutineType(types: !193)
!193 = !{null, !10, !21}
!194 = !DILocalVariable(name: "s", arg: 1, scope: !191, file: !1, line: 61, type: !10)
!195 = !DILocation(line: 61, column: 22, scope: !191)
!196 = !DILocalVariable(name: "b", arg: 2, scope: !191, file: !1, line: 61, type: !21)
!197 = !DILocation(line: 61, column: 39, scope: !191)
!198 = !DILocation(line: 63, column: 6, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !1, line: 63, column: 6)
!200 = !DILocation(line: 63, column: 9, scope: !199)
!201 = !DILocation(line: 63, column: 16, scope: !199)
!202 = !DILocation(line: 63, column: 19, scope: !199)
!203 = !DILocation(line: 63, column: 13, scope: !199)
!204 = !DILocation(line: 63, column: 6, scope: !191)
!205 = !DILocation(line: 63, column: 37, scope: !199)
!206 = !DILocation(line: 63, column: 26, scope: !199)
!207 = !DILocation(line: 64, column: 19, scope: !191)
!208 = !DILocation(line: 64, column: 2, scope: !191)
!209 = !DILocation(line: 64, column: 5, scope: !191)
!210 = !DILocation(line: 64, column: 7, scope: !191)
!211 = !DILocation(line: 64, column: 10, scope: !191)
!212 = !DILocation(line: 64, column: 13, scope: !191)
!213 = !DILocation(line: 64, column: 17, scope: !191)
!214 = !DILocation(line: 65, column: 1, scope: !191)
!215 = distinct !DISubprogram(name: "str_substr", scope: !1, file: !1, line: 67, type: !216, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!216 = !DISubroutineType(types: !217)
!217 = !{!10, !10, !94, !94}
!218 = !DILocalVariable(name: "s", arg: 1, scope: !215, file: !1, line: 67, type: !10)
!219 = !DILocation(line: 67, column: 22, scope: !215)
!220 = !DILocalVariable(name: "from", arg: 2, scope: !215, file: !1, line: 67, type: !94)
!221 = !DILocation(line: 67, column: 29, scope: !215)
!222 = !DILocalVariable(name: "to", arg: 3, scope: !215, file: !1, line: 67, type: !94)
!223 = !DILocation(line: 67, column: 39, scope: !215)
!224 = !DILocation(line: 69, column: 7, scope: !225)
!225 = distinct !DILexicalBlock(scope: !215, file: !1, line: 69, column: 6)
!226 = !DILocation(line: 69, column: 6, scope: !215)
!227 = !DILocation(line: 69, column: 16, scope: !225)
!228 = !DILocation(line: 69, column: 19, scope: !225)
!229 = !DILocation(line: 69, column: 14, scope: !225)
!230 = !DILocation(line: 69, column: 11, scope: !225)
!231 = !DILocation(line: 70, column: 6, scope: !232)
!232 = distinct !DILexicalBlock(scope: !215, file: !1, line: 70, column: 6)
!233 = !DILocation(line: 70, column: 11, scope: !232)
!234 = !DILocation(line: 70, column: 6, scope: !215)
!235 = !DILocation(line: 70, column: 24, scope: !232)
!236 = !DILocation(line: 70, column: 27, scope: !232)
!237 = !DILocation(line: 70, column: 21, scope: !232)
!238 = !DILocation(line: 70, column: 16, scope: !232)
!239 = !DILocation(line: 71, column: 6, scope: !240)
!240 = distinct !DILexicalBlock(scope: !215, file: !1, line: 71, column: 6)
!241 = !DILocation(line: 71, column: 11, scope: !240)
!242 = !DILocation(line: 71, column: 15, scope: !240)
!243 = !DILocation(line: 71, column: 18, scope: !240)
!244 = !DILocation(line: 71, column: 26, scope: !240)
!245 = !DILocation(line: 71, column: 29, scope: !240)
!246 = !DILocation(line: 71, column: 23, scope: !240)
!247 = !DILocation(line: 71, column: 6, scope: !215)
!248 = !DILocation(line: 72, column: 3, scope: !240)
!249 = !DILocation(line: 73, column: 6, scope: !250)
!250 = distinct !DILexicalBlock(scope: !215, file: !1, line: 73, column: 6)
!251 = !DILocation(line: 73, column: 11, scope: !250)
!252 = !DILocation(line: 73, column: 9, scope: !250)
!253 = !DILocation(line: 73, column: 6, scope: !215)
!254 = !DILocation(line: 73, column: 22, scope: !250)
!255 = !DILocation(line: 73, column: 27, scope: !250)
!256 = !DILocation(line: 73, column: 20, scope: !250)
!257 = !DILocation(line: 73, column: 17, scope: !250)
!258 = !DILocalVariable(name: "x", scope: !215, file: !1, line: 74, type: !10)
!259 = !DILocation(line: 74, column: 7, scope: !215)
!260 = !DILocation(line: 74, column: 19, scope: !215)
!261 = !DILocation(line: 74, column: 24, scope: !215)
!262 = !DILocation(line: 74, column: 22, scope: !215)
!263 = !DILocation(line: 74, column: 11, scope: !215)
!264 = !DILocation(line: 75, column: 11, scope: !215)
!265 = !DILocation(line: 75, column: 16, scope: !215)
!266 = !DILocation(line: 75, column: 14, scope: !215)
!267 = !DILocation(line: 75, column: 2, scope: !215)
!268 = !DILocation(line: 75, column: 5, scope: !215)
!269 = !DILocation(line: 75, column: 9, scope: !215)
!270 = !DILocation(line: 76, column: 9, scope: !215)
!271 = !DILocation(line: 76, column: 12, scope: !215)
!272 = !DILocation(line: 76, column: 15, scope: !215)
!273 = !DILocation(line: 76, column: 18, scope: !215)
!274 = !DILocation(line: 76, column: 22, scope: !215)
!275 = !DILocation(line: 76, column: 20, scope: !215)
!276 = !DILocation(line: 76, column: 28, scope: !215)
!277 = !DILocation(line: 76, column: 31, scope: !215)
!278 = !DILocation(line: 76, column: 2, scope: !215)
!279 = !DILocation(line: 77, column: 9, scope: !215)
!280 = !DILocation(line: 77, column: 2, scope: !215)
!281 = !DILocation(line: 78, column: 1, scope: !215)
!282 = distinct !DISubprogram(name: "str_cat", scope: !1, file: !1, line: 80, type: !283, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!283 = !DISubroutineType(types: !284)
!284 = !{!10, !10, !10}
!285 = !DILocalVariable(name: "s", arg: 1, scope: !282, file: !1, line: 80, type: !10)
!286 = !DILocation(line: 80, column: 19, scope: !282)
!287 = !DILocalVariable(name: "s2", arg: 2, scope: !282, file: !1, line: 80, type: !10)
!288 = !DILocation(line: 80, column: 27, scope: !282)
!289 = !DILocation(line: 82, column: 2, scope: !282)
!290 = !DILocation(line: 82, column: 9, scope: !282)
!291 = !DILocation(line: 82, column: 12, scope: !282)
!292 = !DILocation(line: 82, column: 20, scope: !282)
!293 = !DILocation(line: 82, column: 23, scope: !282)
!294 = !DILocation(line: 82, column: 29, scope: !282)
!295 = !DILocation(line: 82, column: 33, scope: !282)
!296 = !DILocation(line: 82, column: 27, scope: !282)
!297 = !DILocation(line: 82, column: 18, scope: !282)
!298 = !DILocation(line: 82, column: 49, scope: !282)
!299 = !DILocation(line: 82, column: 38, scope: !282)
!300 = distinct !{!300, !289, !301}
!301 = !DILocation(line: 82, column: 50, scope: !282)
!302 = !DILocation(line: 83, column: 9, scope: !282)
!303 = !DILocation(line: 83, column: 12, scope: !282)
!304 = !DILocation(line: 83, column: 16, scope: !282)
!305 = !DILocation(line: 83, column: 19, scope: !282)
!306 = !DILocation(line: 83, column: 14, scope: !282)
!307 = !DILocation(line: 83, column: 24, scope: !282)
!308 = !DILocation(line: 83, column: 28, scope: !282)
!309 = !DILocation(line: 83, column: 31, scope: !282)
!310 = !DILocation(line: 83, column: 35, scope: !282)
!311 = !DILocation(line: 83, column: 2, scope: !282)
!312 = !DILocation(line: 84, column: 12, scope: !282)
!313 = !DILocation(line: 84, column: 16, scope: !282)
!314 = !DILocation(line: 84, column: 2, scope: !282)
!315 = !DILocation(line: 84, column: 5, scope: !282)
!316 = !DILocation(line: 84, column: 9, scope: !282)
!317 = !DILocation(line: 85, column: 9, scope: !282)
!318 = !DILocation(line: 85, column: 2, scope: !282)
!319 = distinct !DISubprogram(name: "str_swap", scope: !1, file: !1, line: 88, type: !320, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !10, !10}
!322 = !DILocalVariable(name: "a", arg: 1, scope: !319, file: !1, line: 88, type: !10)
!323 = !DILocation(line: 88, column: 20, scope: !319)
!324 = !DILocalVariable(name: "b", arg: 2, scope: !319, file: !1, line: 88, type: !10)
!325 = !DILocation(line: 88, column: 28, scope: !319)
!326 = !DILocalVariable(name: "tz", scope: !319, file: !1, line: 90, type: !15)
!327 = !DILocation(line: 90, column: 9, scope: !319)
!328 = !DILocalVariable(name: "ts", scope: !319, file: !1, line: 91, type: !20)
!329 = !DILocation(line: 91, column: 17, scope: !319)
!330 = !DILocation(line: 92, column: 7, scope: !319)
!331 = !DILocation(line: 92, column: 10, scope: !319)
!332 = !DILocation(line: 92, column: 5, scope: !319)
!333 = !DILocation(line: 92, column: 28, scope: !319)
!334 = !DILocation(line: 92, column: 31, scope: !319)
!335 = !DILocation(line: 92, column: 17, scope: !319)
!336 = !DILocation(line: 92, column: 20, scope: !319)
!337 = !DILocation(line: 92, column: 26, scope: !319)
!338 = !DILocation(line: 92, column: 49, scope: !319)
!339 = !DILocation(line: 92, column: 38, scope: !319)
!340 = !DILocation(line: 92, column: 41, scope: !319)
!341 = !DILocation(line: 92, column: 47, scope: !319)
!342 = !DILocation(line: 93, column: 7, scope: !319)
!343 = !DILocation(line: 93, column: 10, scope: !319)
!344 = !DILocation(line: 93, column: 5, scope: !319)
!345 = !DILocation(line: 93, column: 24, scope: !319)
!346 = !DILocation(line: 93, column: 27, scope: !319)
!347 = !DILocation(line: 93, column: 15, scope: !319)
!348 = !DILocation(line: 93, column: 18, scope: !319)
!349 = !DILocation(line: 93, column: 22, scope: !319)
!350 = !DILocation(line: 93, column: 41, scope: !319)
!351 = !DILocation(line: 93, column: 32, scope: !319)
!352 = !DILocation(line: 93, column: 35, scope: !319)
!353 = !DILocation(line: 93, column: 39, scope: !319)
!354 = !DILocation(line: 94, column: 7, scope: !319)
!355 = !DILocation(line: 94, column: 10, scope: !319)
!356 = !DILocation(line: 94, column: 5, scope: !319)
!357 = !DILocation(line: 94, column: 20, scope: !319)
!358 = !DILocation(line: 94, column: 23, scope: !319)
!359 = !DILocation(line: 94, column: 13, scope: !319)
!360 = !DILocation(line: 94, column: 16, scope: !319)
!361 = !DILocation(line: 94, column: 18, scope: !319)
!362 = !DILocation(line: 94, column: 33, scope: !319)
!363 = !DILocation(line: 94, column: 26, scope: !319)
!364 = !DILocation(line: 94, column: 29, scope: !319)
!365 = !DILocation(line: 94, column: 31, scope: !319)
!366 = !DILocation(line: 95, column: 1, scope: !319)
!367 = distinct !DISubprogram(name: "str_subst", scope: !1, file: !1, line: 97, type: !368, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!368 = !DISubroutineType(types: !369)
!369 = !{!10, !10, !10, !10}
!370 = !DILocalVariable(name: "tgt", arg: 1, scope: !367, file: !1, line: 97, type: !10)
!371 = !DILocation(line: 97, column: 21, scope: !367)
!372 = !DILocalVariable(name: "pat", arg: 2, scope: !367, file: !1, line: 97, type: !10)
!373 = !DILocation(line: 97, column: 31, scope: !367)
!374 = !DILocalVariable(name: "repl", arg: 3, scope: !367, file: !1, line: 97, type: !10)
!375 = !DILocation(line: 97, column: 41, scope: !367)
!376 = !DILocalVariable(name: "tmp", scope: !367, file: !1, line: 99, type: !10)
!377 = !DILocation(line: 99, column: 7, scope: !367)
!378 = !DILocation(line: 99, column: 13, scope: !367)
!379 = !DILocalVariable(name: "i", scope: !367, file: !1, line: 100, type: !94)
!380 = !DILocation(line: 100, column: 6, scope: !367)
!381 = !DILocation(line: 101, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !367, file: !1, line: 101, column: 2)
!383 = !DILocation(line: 101, column: 7, scope: !382)
!384 = !DILocation(line: 101, column: 14, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !1, line: 101, column: 2)
!386 = !DILocation(line: 101, column: 18, scope: !385)
!387 = !DILocation(line: 101, column: 23, scope: !385)
!388 = !DILocation(line: 101, column: 16, scope: !385)
!389 = !DILocation(line: 101, column: 30, scope: !385)
!390 = !DILocation(line: 101, column: 35, scope: !385)
!391 = !DILocation(line: 101, column: 27, scope: !385)
!392 = !DILocation(line: 101, column: 2, scope: !382)
!393 = !DILocation(line: 102, column: 14, scope: !394)
!394 = distinct !DILexicalBlock(scope: !395, file: !1, line: 102, column: 7)
!395 = distinct !DILexicalBlock(scope: !385, file: !1, line: 101, column: 41)
!396 = !DILocation(line: 102, column: 19, scope: !394)
!397 = !DILocation(line: 102, column: 23, scope: !394)
!398 = !DILocation(line: 102, column: 21, scope: !394)
!399 = !DILocation(line: 102, column: 26, scope: !394)
!400 = !DILocation(line: 102, column: 31, scope: !394)
!401 = !DILocation(line: 102, column: 34, scope: !394)
!402 = !DILocation(line: 102, column: 39, scope: !394)
!403 = !DILocation(line: 102, column: 7, scope: !394)
!404 = !DILocation(line: 102, column: 7, scope: !395)
!405 = !DILocation(line: 103, column: 15, scope: !406)
!406 = distinct !DILexicalBlock(scope: !394, file: !1, line: 102, column: 45)
!407 = !DILocation(line: 103, column: 20, scope: !406)
!408 = !DILocation(line: 103, column: 25, scope: !406)
!409 = !DILocation(line: 103, column: 27, scope: !406)
!410 = !DILocation(line: 103, column: 4, scope: !406)
!411 = !DILocation(line: 104, column: 5, scope: !406)
!412 = !DILocation(line: 105, column: 3, scope: !406)
!413 = !DILocation(line: 106, column: 12, scope: !414)
!414 = distinct !DILexicalBlock(scope: !394, file: !1, line: 105, column: 10)
!415 = !DILocation(line: 106, column: 17, scope: !414)
!416 = !DILocation(line: 106, column: 4, scope: !414)
!417 = !DILocation(line: 107, column: 9, scope: !414)
!418 = !DILocation(line: 107, column: 14, scope: !414)
!419 = !DILocation(line: 107, column: 6, scope: !414)
!420 = !DILocation(line: 108, column: 9, scope: !421)
!421 = distinct !DILexicalBlock(scope: !414, file: !1, line: 108, column: 8)
!422 = !DILocation(line: 108, column: 14, scope: !421)
!423 = !DILocation(line: 108, column: 8, scope: !414)
!424 = !DILocation(line: 108, column: 30, scope: !421)
!425 = !DILocation(line: 108, column: 35, scope: !421)
!426 = !DILocation(line: 108, column: 40, scope: !421)
!427 = !DILocation(line: 108, column: 43, scope: !421)
!428 = !DILocation(line: 108, column: 19, scope: !421)
!429 = !DILocation(line: 101, column: 2, scope: !385)
!430 = distinct !{!430, !392, !431}
!431 = !DILocation(line: 110, column: 2, scope: !382)
!432 = !DILocation(line: 111, column: 2, scope: !367)
!433 = !DILocation(line: 111, column: 9, scope: !367)
!434 = !DILocation(line: 111, column: 13, scope: !367)
!435 = !DILocation(line: 111, column: 18, scope: !367)
!436 = !DILocation(line: 111, column: 11, scope: !367)
!437 = !DILocation(line: 111, column: 34, scope: !367)
!438 = !DILocation(line: 111, column: 39, scope: !367)
!439 = !DILocation(line: 111, column: 44, scope: !367)
!440 = !DILocation(line: 111, column: 47, scope: !367)
!441 = !DILocation(line: 111, column: 23, scope: !367)
!442 = distinct !{!442, !432, !443}
!443 = !DILocation(line: 111, column: 50, scope: !367)
!444 = !DILocation(line: 112, column: 11, scope: !367)
!445 = !DILocation(line: 112, column: 16, scope: !367)
!446 = !DILocation(line: 112, column: 2, scope: !367)
!447 = !DILocation(line: 113, column: 10, scope: !367)
!448 = !DILocation(line: 113, column: 2, scope: !367)
!449 = !DILocation(line: 114, column: 9, scope: !367)
!450 = !DILocation(line: 114, column: 2, scope: !367)
!451 = distinct !DISubprogram(name: "str_set", scope: !1, file: !1, line: 117, type: !320, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!452 = !DILocalVariable(name: "dest", arg: 1, scope: !451, file: !1, line: 117, type: !10)
!453 = !DILocation(line: 117, column: 19, scope: !451)
!454 = !DILocalVariable(name: "src", arg: 2, scope: !451, file: !1, line: 117, type: !10)
!455 = !DILocation(line: 117, column: 30, scope: !451)
!456 = !DILocation(line: 119, column: 2, scope: !451)
!457 = !DILocation(line: 119, column: 9, scope: !451)
!458 = !DILocation(line: 119, column: 15, scope: !451)
!459 = !DILocation(line: 119, column: 21, scope: !451)
!460 = !DILocation(line: 119, column: 26, scope: !451)
!461 = !DILocation(line: 119, column: 19, scope: !451)
!462 = !DILocation(line: 119, column: 42, scope: !451)
!463 = !DILocation(line: 119, column: 31, scope: !451)
!464 = distinct !{!464, !456, !465}
!465 = !DILocation(line: 119, column: 46, scope: !451)
!466 = !DILocation(line: 120, column: 9, scope: !451)
!467 = !DILocation(line: 120, column: 15, scope: !451)
!468 = !DILocation(line: 120, column: 18, scope: !451)
!469 = !DILocation(line: 120, column: 23, scope: !451)
!470 = !DILocation(line: 120, column: 26, scope: !451)
!471 = !DILocation(line: 120, column: 31, scope: !451)
!472 = !DILocation(line: 120, column: 2, scope: !451)
!473 = !DILocation(line: 121, column: 14, scope: !451)
!474 = !DILocation(line: 121, column: 19, scope: !451)
!475 = !DILocation(line: 121, column: 2, scope: !451)
!476 = !DILocation(line: 121, column: 8, scope: !451)
!477 = !DILocation(line: 121, column: 12, scope: !451)
!478 = !DILocation(line: 122, column: 1, scope: !451)
!479 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 124, type: !480, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!480 = !DISubroutineType(types: !481)
!481 = !{!94}
!482 = !DILocalVariable(name: "s", scope: !479, file: !1, line: 126, type: !10)
!483 = !DILocation(line: 126, column: 7, scope: !479)
!484 = !DILocation(line: 126, column: 11, scope: !479)
!485 = !DILocalVariable(name: "s2", scope: !479, file: !1, line: 127, type: !10)
!486 = !DILocation(line: 127, column: 7, scope: !479)
!487 = !DILocation(line: 127, column: 12, scope: !479)
!488 = !DILocalVariable(name: "s3", scope: !479, file: !1, line: 128, type: !10)
!489 = !DILocation(line: 128, column: 7, scope: !479)
!490 = !DILocation(line: 128, column: 12, scope: !479)
!491 = !DILocation(line: 130, column: 12, scope: !479)
!492 = !DILocation(line: 130, column: 15, scope: !479)
!493 = !DILocation(line: 130, column: 19, scope: !479)
!494 = !DILocation(line: 130, column: 2, scope: !479)
!495 = !DILocation(line: 131, column: 19, scope: !479)
!496 = !DILocation(line: 131, column: 22, scope: !479)
!497 = !DILocation(line: 131, column: 27, scope: !479)
!498 = !DILocation(line: 131, column: 30, scope: !479)
!499 = !DILocation(line: 131, column: 2, scope: !479)
!500 = !DILocation(line: 133, column: 10, scope: !479)
!501 = !DILocation(line: 133, column: 2, scope: !479)
!502 = !DILocation(line: 134, column: 10, scope: !479)
!503 = !DILocation(line: 134, column: 2, scope: !479)
!504 = !DILocation(line: 135, column: 10, scope: !479)
!505 = !DILocation(line: 135, column: 2, scope: !479)
!506 = !DILocation(line: 137, column: 2, scope: !479)
