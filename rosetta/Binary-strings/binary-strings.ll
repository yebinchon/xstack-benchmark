; ModuleID = 'binary-strings.bc'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  store i64 8, i64* %len.addr, align 8, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !33
  %3 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !34
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 1, !dbg !35
  store i64 %2, i64* %alloc, align 8, !dbg !36
  %4 = load i64, i64* %len.addr, align 8, !dbg !37
  %call1 = call noalias i8* @malloc(i64 %4) #6, !dbg !38
  %5 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !39
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !40
  store i8* %call1, i8** %s2, align 8, !dbg !41
  %6 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !42
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 0, !dbg !43
  store i64 0, i64* %len3, align 8, !dbg !44
  %7 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !45
  ret %struct.str_t* %7, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_extend(%struct.str_t* %s) #0 !dbg !47 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %ns = alloca i64, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %ns, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !54
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !55
  %1 = load i64, i64* %alloc, align 8, !dbg !55
  %mul = mul i64 %1, 2, !dbg !56
  store i64 %mul, i64* %ns, align 8, !dbg !53
  %2 = load i64, i64* %ns, align 8, !dbg !57
  %3 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !59
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 1, !dbg !60
  %4 = load i64, i64* %alloc1, align 8, !dbg !60
  %sub = sub i64 %2, %4, !dbg !61
  %cmp = icmp ugt i64 %sub, 1024, !dbg !62
  br i1 %cmp, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  %5 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !64
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 1, !dbg !65
  %6 = load i64, i64* %alloc2, align 8, !dbg !65
  %add = add i64 %6, 1024, !dbg !66
  store i64 %add, i64* %ns, align 8, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !69
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !70
  %8 = load i8*, i8** %s3, align 8, !dbg !70
  %9 = load i64, i64* %ns, align 8, !dbg !71
  %call = call i8* @realloc(i8* %8, i64 %9) #6, !dbg !72
  %10 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !73
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 2, !dbg !74
  store i8* %call, i8** %s4, align 8, !dbg !75
  %11 = load i64, i64* %ns, align 8, !dbg !76
  %12 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !77
  %alloc5 = getelementptr inbounds %struct.str_t, %struct.str_t* %12, i32 0, i32 1, !dbg !78
  store i64 %11, i64* %alloc5, align 8, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_del(%struct.str_t* %s) #0 !dbg !81 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !84
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 2, !dbg !85
  %1 = load i8*, i8** %s1, align 8, !dbg !85
  call void @free(i8* %1) #6, !dbg !86
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !87
  %3 = bitcast %struct.str_t* %2 to i8*, !dbg !87
  call void @free(i8* %3) #6, !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @str_cmp(%struct.str_t* %l, %struct.str_t* %r) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %l.addr = alloca %struct.str_t*, align 8
  %r.addr = alloca %struct.str_t*, align 8
  %res = alloca i32, align 4
  %len = alloca i32, align 4
  store %struct.str_t* %l, %struct.str_t** %l.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %l.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store %struct.str_t* %r, %struct.str_t** %r.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %r.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %res, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %len, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !102
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !103
  %1 = load i64, i64* %len1, align 8, !dbg !103
  %conv = trunc i64 %1 to i32, !dbg !102
  store i32 %conv, i32* %len, align 4, !dbg !101
  %2 = load i32, i32* %len, align 4, !dbg !104
  %conv2 = sext i32 %2 to i64, !dbg !104
  %3 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !106
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !107
  %4 = load i64, i64* %len3, align 8, !dbg !107
  %cmp = icmp ugt i64 %conv2, %4, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %5 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !110
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 0, !dbg !111
  %6 = load i64, i64* %len5, align 8, !dbg !111
  %conv6 = trunc i64 %6 to i32, !dbg !110
  store i32 %conv6, i32* %len, align 4, !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !114
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !116
  %8 = load i8*, i8** %s, align 8, !dbg !116
  %9 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !117
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 2, !dbg !118
  %10 = load i8*, i8** %s7, align 8, !dbg !118
  %11 = load i32, i32* %len, align 4, !dbg !119
  %conv8 = sext i32 %11 to i64, !dbg !119
  %call = call i32 @memcmp(i8* %8, i8* %10, i64 %conv8) #7, !dbg !120
  store i32 %call, i32* %res, align 4, !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then9, label %if.end10, !dbg !122

if.then9:                                         ; preds = %if.end
  %12 = load i32, i32* %res, align 4, !dbg !123
  store i32 %12, i32* %retval, align 4, !dbg !124
  br label %return, !dbg !124

if.end10:                                         ; preds = %if.end
  %13 = load %struct.str_t*, %struct.str_t** %l.addr, align 8, !dbg !125
  %len11 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !126
  %14 = load i64, i64* %len11, align 8, !dbg !126
  %15 = load %struct.str_t*, %struct.str_t** %r.addr, align 8, !dbg !127
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %15, i32 0, i32 0, !dbg !128
  %16 = load i64, i64* %len12, align 8, !dbg !128
  %cmp13 = icmp ugt i64 %14, %16, !dbg !129
  %17 = zext i1 %cmp13 to i64, !dbg !125
  %cond = select i1 %cmp13, i32 1, i32 -1, !dbg !125
  store i32 %cond, i32* %retval, align 4, !dbg !130
  br label %return, !dbg !130

return:                                           ; preds = %if.end10, %if.then9
  %18 = load i32, i32* %retval, align 4, !dbg !131
  ret i32 %18, !dbg !131
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_dup(%struct.str_t* %src) #0 !dbg !132 {
entry:
  %src.addr = alloca %struct.str_t*, align 8
  %x = alloca %struct.str_t*, align 8
  store %struct.str_t* %src, %struct.str_t** %src.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %src.addr, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !139
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !140
  %1 = load i64, i64* %len, align 8, !dbg !140
  %call = call %struct.str_t* @str_new(i64 %1), !dbg !141
  store %struct.str_t* %call, %struct.str_t** %x, align 8, !dbg !138
  %2 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !142
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 2, !dbg !143
  %3 = load i8*, i8** %s, align 8, !dbg !143
  %4 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !144
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 2, !dbg !145
  %5 = load i8*, i8** %s1, align 8, !dbg !145
  %6 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !146
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 0, !dbg !147
  %7 = load i64, i64* %len2, align 8, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %5, i64 %7, i1 false), !dbg !148
  %8 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !149
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 0, !dbg !150
  %9 = load i64, i64* %len3, align 8, !dbg !150
  %10 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !151
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 0, !dbg !152
  store i64 %9, i64* %len4, align 8, !dbg !153
  %11 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !154
  ret %struct.str_t* %11, !dbg !155
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_from_chars(i8* %t) #0 !dbg !156 {
entry:
  %retval = alloca %struct.str_t*, align 8
  %t.addr = alloca i8*, align 8
  %l = alloca i64, align 8
  %x = alloca %struct.str_t*, align 8
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i8*, i8** %t.addr, align 8, !dbg !164
  %tobool = icmp ne i8* %0, null, !dbg !164
  br i1 %tobool, label %if.end, label %if.then, !dbg !166

if.then:                                          ; preds = %entry
  %call = call %struct.str_t* @str_new(i64 0), !dbg !167
  store %struct.str_t* %call, %struct.str_t** %retval, align 8, !dbg !168
  br label %return, !dbg !168

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %l, metadata !169, metadata !DIExpression()), !dbg !170
  %1 = load i8*, i8** %t.addr, align 8, !dbg !171
  %call1 = call i64 @strlen(i8* %1) #7, !dbg !172
  store i64 %call1, i64* %l, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !173, metadata !DIExpression()), !dbg !174
  %2 = load i64, i64* %l, align 8, !dbg !175
  %add = add i64 %2, 1, !dbg !176
  %call2 = call %struct.str_t* @str_new(i64 %add), !dbg !177
  store %struct.str_t* %call2, %struct.str_t** %x, align 8, !dbg !174
  %3 = load i64, i64* %l, align 8, !dbg !178
  %4 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !179
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !180
  store i64 %3, i64* %len, align 8, !dbg !181
  %5 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !182
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !183
  %6 = load i8*, i8** %s, align 8, !dbg !183
  %7 = load i8*, i8** %t.addr, align 8, !dbg !184
  %8 = load i64, i64* %l, align 8, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 %8, i1 false), !dbg !186
  %9 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !187
  store %struct.str_t* %9, %struct.str_t** %retval, align 8, !dbg !188
  br label %return, !dbg !188

return:                                           ; preds = %if.end, %if.then
  %10 = load %struct.str_t*, %struct.str_t** %retval, align 8, !dbg !189
  ret %struct.str_t* %10, !dbg !189
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_append(%struct.str_t* %s, i8 zeroext %b) #0 !dbg !190 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %b.addr = alloca i8, align 1
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8 %b, i8* %b.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %b.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !197
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !199
  %1 = load i64, i64* %len, align 8, !dbg !199
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !200
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 1, !dbg !201
  %3 = load i64, i64* %alloc, align 8, !dbg !201
  %cmp = icmp uge i64 %1, %3, !dbg !202
  br i1 %cmp, label %if.then, label %if.end, !dbg !203

if.then:                                          ; preds = %entry
  %4 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !204
  call void @str_extend(%struct.str_t* %4), !dbg !205
  br label %if.end, !dbg !205

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8, i8* %b.addr, align 1, !dbg !206
  %6 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !207
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 2, !dbg !208
  %7 = load i8*, i8** %s1, align 8, !dbg !208
  %8 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !209
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 0, !dbg !210
  %9 = load i64, i64* %len2, align 8, !dbg !211
  %inc = add i64 %9, 1, !dbg !211
  store i64 %inc, i64* %len2, align 8, !dbg !211
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %9, !dbg !207
  store i8 %5, i8* %arrayidx, align 1, !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_substr(%struct.str_t* %s, i32 %from, i32 %to) #0 !dbg !214 {
entry:
  %retval = alloca %struct.str_t*, align 8
  %s.addr = alloca %struct.str_t*, align 8
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %x = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 %from, i32* %from.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %from.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 %to, i32* %to.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %to.addr, metadata !221, metadata !DIExpression()), !dbg !222
  %0 = load i32, i32* %to.addr, align 4, !dbg !223
  %tobool = icmp ne i32 %0, 0, !dbg !223
  br i1 %tobool, label %if.end, label %if.then, !dbg !225

if.then:                                          ; preds = %entry
  %1 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !226
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %1, i32 0, i32 0, !dbg !227
  %2 = load i64, i64* %len, align 8, !dbg !227
  %conv = trunc i64 %2 to i32, !dbg !226
  store i32 %conv, i32* %to.addr, align 4, !dbg !228
  br label %if.end, !dbg !229

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %from.addr, align 4, !dbg !230
  %cmp = icmp slt i32 %3, 0, !dbg !232
  br i1 %cmp, label %if.then2, label %if.end6, !dbg !233

if.then2:                                         ; preds = %if.end
  %4 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !234
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !235
  %5 = load i64, i64* %len3, align 8, !dbg !235
  %6 = load i32, i32* %from.addr, align 4, !dbg !236
  %conv4 = sext i32 %6 to i64, !dbg !236
  %add = add i64 %conv4, %5, !dbg !236
  %conv5 = trunc i64 %add to i32, !dbg !236
  store i32 %conv5, i32* %from.addr, align 4, !dbg !236
  br label %if.end6, !dbg !237

if.end6:                                          ; preds = %if.then2, %if.end
  %7 = load i32, i32* %from.addr, align 4, !dbg !238
  %cmp7 = icmp slt i32 %7, 0, !dbg !240
  br i1 %cmp7, label %if.then13, label %lor.lhs.false, !dbg !241

lor.lhs.false:                                    ; preds = %if.end6
  %8 = load i32, i32* %from.addr, align 4, !dbg !242
  %conv9 = sext i32 %8 to i64, !dbg !242
  %9 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !243
  %len10 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !244
  %10 = load i64, i64* %len10, align 8, !dbg !244
  %cmp11 = icmp uge i64 %conv9, %10, !dbg !245
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !246

if.then13:                                        ; preds = %lor.lhs.false, %if.end6
  store %struct.str_t* null, %struct.str_t** %retval, align 8, !dbg !247
  br label %return, !dbg !247

if.end14:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %to.addr, align 4, !dbg !248
  %12 = load i32, i32* %from.addr, align 4, !dbg !250
  %cmp15 = icmp slt i32 %11, %12, !dbg !251
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !252

if.then17:                                        ; preds = %if.end14
  %13 = load i32, i32* %from.addr, align 4, !dbg !253
  %add18 = add nsw i32 %13, 1, !dbg !254
  store i32 %add18, i32* %to.addr, align 4, !dbg !255
  br label %if.end19, !dbg !256

if.end19:                                         ; preds = %if.then17, %if.end14
  call void @llvm.dbg.declare(metadata %struct.str_t** %x, metadata !257, metadata !DIExpression()), !dbg !258
  %14 = load i32, i32* %to.addr, align 4, !dbg !259
  %15 = load i32, i32* %from.addr, align 4, !dbg !260
  %sub = sub nsw i32 %14, %15, !dbg !261
  %conv20 = sext i32 %sub to i64, !dbg !259
  %call = call %struct.str_t* @str_new(i64 %conv20), !dbg !262
  store %struct.str_t* %call, %struct.str_t** %x, align 8, !dbg !258
  %16 = load i32, i32* %to.addr, align 4, !dbg !263
  %17 = load i32, i32* %from.addr, align 4, !dbg !264
  %sub21 = sub nsw i32 %16, %17, !dbg !265
  %conv22 = sext i32 %sub21 to i64, !dbg !263
  %18 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !266
  %len23 = getelementptr inbounds %struct.str_t, %struct.str_t* %18, i32 0, i32 0, !dbg !267
  store i64 %conv22, i64* %len23, align 8, !dbg !268
  %19 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !269
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %19, i32 0, i32 2, !dbg !270
  %20 = load i8*, i8** %s24, align 8, !dbg !270
  %21 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !271
  %s25 = getelementptr inbounds %struct.str_t, %struct.str_t* %21, i32 0, i32 2, !dbg !272
  %22 = load i8*, i8** %s25, align 8, !dbg !272
  %23 = load i32, i32* %from.addr, align 4, !dbg !273
  %idx.ext = sext i32 %23 to i64, !dbg !274
  %add.ptr = getelementptr inbounds i8, i8* %22, i64 %idx.ext, !dbg !274
  %24 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !275
  %len26 = getelementptr inbounds %struct.str_t, %struct.str_t* %24, i32 0, i32 0, !dbg !276
  %25 = load i64, i64* %len26, align 8, !dbg !276
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %20, i8* align 1 %add.ptr, i64 %25, i1 false), !dbg !277
  %26 = load %struct.str_t*, %struct.str_t** %x, align 8, !dbg !278
  store %struct.str_t* %26, %struct.str_t** %retval, align 8, !dbg !279
  br label %return, !dbg !279

return:                                           ; preds = %if.end19, %if.then13
  %27 = load %struct.str_t*, %struct.str_t** %retval, align 8, !dbg !280
  ret %struct.str_t* %27, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_cat(%struct.str_t* %s, %struct.str_t* %s2) #0 !dbg !281 {
entry:
  %s.addr = alloca %struct.str_t*, align 8
  %s2.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %s, %struct.str_t** %s.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s.addr, metadata !284, metadata !DIExpression()), !dbg !285
  store %struct.str_t* %s2, %struct.str_t** %s2.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %s2.addr, metadata !286, metadata !DIExpression()), !dbg !287
  br label %while.cond, !dbg !288

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !289
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !290
  %1 = load i64, i64* %alloc, align 8, !dbg !290
  %2 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !291
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 0, !dbg !292
  %3 = load i64, i64* %len, align 8, !dbg !292
  %4 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !293
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 0, !dbg !294
  %5 = load i64, i64* %len1, align 8, !dbg !294
  %add = add i64 %3, %5, !dbg !295
  %cmp = icmp ult i64 %1, %add, !dbg !296
  br i1 %cmp, label %while.body, label %while.end, !dbg !288

while.body:                                       ; preds = %while.cond
  %6 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !297
  call void @str_extend(%struct.str_t* %6), !dbg !298
  br label %while.cond, !dbg !288, !llvm.loop !299

while.end:                                        ; preds = %while.cond
  %7 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !301
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !302
  %8 = load i8*, i8** %s3, align 8, !dbg !302
  %9 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !303
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !304
  %10 = load i64, i64* %len4, align 8, !dbg !304
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 %10, !dbg !305
  %11 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !306
  %s5 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 2, !dbg !307
  %12 = load i8*, i8** %s5, align 8, !dbg !307
  %13 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !308
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !309
  %14 = load i64, i64* %len6, align 8, !dbg !309
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %12, i64 %14, i1 false), !dbg !310
  %15 = load %struct.str_t*, %struct.str_t** %s2.addr, align 8, !dbg !311
  %len7 = getelementptr inbounds %struct.str_t, %struct.str_t* %15, i32 0, i32 0, !dbg !312
  %16 = load i64, i64* %len7, align 8, !dbg !312
  %17 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !313
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %17, i32 0, i32 0, !dbg !314
  %18 = load i64, i64* %len8, align 8, !dbg !315
  %add9 = add i64 %18, %16, !dbg !315
  store i64 %add9, i64* %len8, align 8, !dbg !315
  %19 = load %struct.str_t*, %struct.str_t** %s.addr, align 8, !dbg !316
  ret %struct.str_t* %19, !dbg !317
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_swap(%struct.str_t* %a, %struct.str_t* %b) #0 !dbg !318 {
entry:
  %a.addr = alloca %struct.str_t*, align 8
  %b.addr = alloca %struct.str_t*, align 8
  %tz = alloca i64, align 8
  %ts = alloca i8*, align 8
  store %struct.str_t* %a, %struct.str_t** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %a.addr, metadata !321, metadata !DIExpression()), !dbg !322
  store %struct.str_t* %b, %struct.str_t** %b.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %b.addr, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata i64* %tz, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata i8** %ts, metadata !327, metadata !DIExpression()), !dbg !328
  %0 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !329
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !330
  %1 = load i64, i64* %alloc, align 8, !dbg !330
  store i64 %1, i64* %tz, align 8, !dbg !331
  %2 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !332
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 1, !dbg !333
  %3 = load i64, i64* %alloc1, align 8, !dbg !333
  %4 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !334
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %4, i32 0, i32 1, !dbg !335
  store i64 %3, i64* %alloc2, align 8, !dbg !336
  %5 = load i64, i64* %tz, align 8, !dbg !337
  %6 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !338
  %alloc3 = getelementptr inbounds %struct.str_t, %struct.str_t* %6, i32 0, i32 1, !dbg !339
  store i64 %5, i64* %alloc3, align 8, !dbg !340
  %7 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !341
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 0, !dbg !342
  %8 = load i64, i64* %len, align 8, !dbg !342
  store i64 %8, i64* %tz, align 8, !dbg !343
  %9 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !344
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !345
  %10 = load i64, i64* %len4, align 8, !dbg !345
  %11 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !346
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 0, !dbg !347
  store i64 %10, i64* %len5, align 8, !dbg !348
  %12 = load i64, i64* %tz, align 8, !dbg !349
  %13 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !350
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !351
  store i64 %12, i64* %len6, align 8, !dbg !352
  %14 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !353
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %14, i32 0, i32 2, !dbg !354
  %15 = load i8*, i8** %s, align 8, !dbg !354
  store i8* %15, i8** %ts, align 8, !dbg !355
  %16 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !356
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %16, i32 0, i32 2, !dbg !357
  %17 = load i8*, i8** %s7, align 8, !dbg !357
  %18 = load %struct.str_t*, %struct.str_t** %a.addr, align 8, !dbg !358
  %s8 = getelementptr inbounds %struct.str_t, %struct.str_t* %18, i32 0, i32 2, !dbg !359
  store i8* %17, i8** %s8, align 8, !dbg !360
  %19 = load i8*, i8** %ts, align 8, !dbg !361
  %20 = load %struct.str_t*, %struct.str_t** %b.addr, align 8, !dbg !362
  %s9 = getelementptr inbounds %struct.str_t, %struct.str_t* %20, i32 0, i32 2, !dbg !363
  store i8* %19, i8** %s9, align 8, !dbg !364
  ret void, !dbg !365
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_subst(%struct.str_t* %tgt, %struct.str_t* %pat, %struct.str_t* %repl) #0 !dbg !366 {
entry:
  %tgt.addr = alloca %struct.str_t*, align 8
  %pat.addr = alloca %struct.str_t*, align 8
  %repl.addr = alloca %struct.str_t*, align 8
  %tmp = alloca %struct.str_t*, align 8
  %i = alloca i32, align 4
  store %struct.str_t* %tgt, %struct.str_t** %tgt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %tgt.addr, metadata !369, metadata !DIExpression()), !dbg !370
  store %struct.str_t* %pat, %struct.str_t** %pat.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %pat.addr, metadata !371, metadata !DIExpression()), !dbg !372
  store %struct.str_t* %repl, %struct.str_t** %repl.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %repl.addr, metadata !373, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.declare(metadata %struct.str_t** %tmp, metadata !375, metadata !DIExpression()), !dbg !376
  %call = call %struct.str_t* @str_new(i64 0), !dbg !377
  store %struct.str_t* %call, %struct.str_t** %tmp, align 8, !dbg !376
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 0, i32* %i, align 4, !dbg !380
  br label %for.cond, !dbg !382

for.cond:                                         ; preds = %if.end19, %entry
  %0 = load i32, i32* %i, align 4, !dbg !383
  %conv = sext i32 %0 to i64, !dbg !383
  %1 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !385
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %1, i32 0, i32 0, !dbg !386
  %2 = load i64, i64* %len, align 8, !dbg !386
  %add = add i64 %conv, %2, !dbg !387
  %3 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !388
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !389
  %4 = load i64, i64* %len1, align 8, !dbg !389
  %cmp = icmp ule i64 %add, %4, !dbg !390
  br i1 %cmp, label %for.body, label %for.end, !dbg !391

for.body:                                         ; preds = %for.cond
  %5 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !392
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !395
  %6 = load i8*, i8** %s, align 8, !dbg !395
  %7 = load i32, i32* %i, align 4, !dbg !396
  %idx.ext = sext i32 %7 to i64, !dbg !397
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 %idx.ext, !dbg !397
  %8 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !398
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %8, i32 0, i32 2, !dbg !399
  %9 = load i8*, i8** %s3, align 8, !dbg !399
  %10 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !400
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %10, i32 0, i32 0, !dbg !401
  %11 = load i64, i64* %len4, align 8, !dbg !401
  %call5 = call i32 @memcmp(i8* %add.ptr, i8* %9, i64 %11) #7, !dbg !402
  %tobool = icmp ne i32 %call5, 0, !dbg !402
  br i1 %tobool, label %if.then, label %if.else, !dbg !403

if.then:                                          ; preds = %for.body
  %12 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !404
  %13 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !406
  %s6 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 2, !dbg !407
  %14 = load i8*, i8** %s6, align 8, !dbg !407
  %15 = load i32, i32* %i, align 4, !dbg !408
  %idxprom = sext i32 %15 to i64, !dbg !406
  %arrayidx = getelementptr inbounds i8, i8* %14, i64 %idxprom, !dbg !406
  %16 = load i8, i8* %arrayidx, align 1, !dbg !406
  call void @str_append(%struct.str_t* %12, i8 zeroext %16), !dbg !409
  %17 = load i32, i32* %i, align 4, !dbg !410
  %inc = add nsw i32 %17, 1, !dbg !410
  store i32 %inc, i32* %i, align 4, !dbg !410
  br label %if.end19, !dbg !411

if.else:                                          ; preds = %for.body
  %18 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !412
  %19 = load %struct.str_t*, %struct.str_t** %repl.addr, align 8, !dbg !414
  %call7 = call %struct.str_t* @str_cat(%struct.str_t* %18, %struct.str_t* %19), !dbg !415
  %20 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !416
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %20, i32 0, i32 0, !dbg !417
  %21 = load i64, i64* %len8, align 8, !dbg !417
  %22 = load i32, i32* %i, align 4, !dbg !418
  %conv9 = sext i32 %22 to i64, !dbg !418
  %add10 = add i64 %conv9, %21, !dbg !418
  %conv11 = trunc i64 %add10 to i32, !dbg !418
  store i32 %conv11, i32* %i, align 4, !dbg !418
  %23 = load %struct.str_t*, %struct.str_t** %pat.addr, align 8, !dbg !419
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %23, i32 0, i32 0, !dbg !421
  %24 = load i64, i64* %len12, align 8, !dbg !421
  %tobool13 = icmp ne i64 %24, 0, !dbg !419
  br i1 %tobool13, label %if.end, label %if.then14, !dbg !422

if.then14:                                        ; preds = %if.else
  %25 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !423
  %26 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !424
  %s15 = getelementptr inbounds %struct.str_t, %struct.str_t* %26, i32 0, i32 2, !dbg !425
  %27 = load i8*, i8** %s15, align 8, !dbg !425
  %28 = load i32, i32* %i, align 4, !dbg !426
  %inc16 = add nsw i32 %28, 1, !dbg !426
  store i32 %inc16, i32* %i, align 4, !dbg !426
  %idxprom17 = sext i32 %28 to i64, !dbg !424
  %arrayidx18 = getelementptr inbounds i8, i8* %27, i64 %idxprom17, !dbg !424
  %29 = load i8, i8* %arrayidx18, align 1, !dbg !424
  call void @str_append(%struct.str_t* %25, i8 zeroext %29), !dbg !427
  br label %if.end, !dbg !427

if.end:                                           ; preds = %if.then14, %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  br label %for.cond, !dbg !428, !llvm.loop !429

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !431

while.cond:                                       ; preds = %while.body, %for.end
  %30 = load i32, i32* %i, align 4, !dbg !432
  %conv20 = sext i32 %30 to i64, !dbg !432
  %31 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !433
  %len21 = getelementptr inbounds %struct.str_t, %struct.str_t* %31, i32 0, i32 0, !dbg !434
  %32 = load i64, i64* %len21, align 8, !dbg !434
  %cmp22 = icmp ult i64 %conv20, %32, !dbg !435
  br i1 %cmp22, label %while.body, label %while.end, !dbg !431

while.body:                                       ; preds = %while.cond
  %33 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !436
  %34 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !437
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %34, i32 0, i32 2, !dbg !438
  %35 = load i8*, i8** %s24, align 8, !dbg !438
  %36 = load i32, i32* %i, align 4, !dbg !439
  %inc25 = add nsw i32 %36, 1, !dbg !439
  store i32 %inc25, i32* %i, align 4, !dbg !439
  %idxprom26 = sext i32 %36 to i64, !dbg !437
  %arrayidx27 = getelementptr inbounds i8, i8* %35, i64 %idxprom26, !dbg !437
  %37 = load i8, i8* %arrayidx27, align 1, !dbg !437
  call void @str_append(%struct.str_t* %33, i8 zeroext %37), !dbg !440
  br label %while.cond, !dbg !431, !llvm.loop !441

while.end:                                        ; preds = %while.cond
  %38 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !443
  %39 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !444
  call void @str_swap(%struct.str_t* %38, %struct.str_t* %39), !dbg !445
  %40 = load %struct.str_t*, %struct.str_t** %tmp, align 8, !dbg !446
  call void @str_del(%struct.str_t* %40), !dbg !447
  %41 = load %struct.str_t*, %struct.str_t** %tgt.addr, align 8, !dbg !448
  ret %struct.str_t* %41, !dbg !449
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_set(%struct.str_t* %dest, %struct.str_t* %src) #0 !dbg !450 {
entry:
  %dest.addr = alloca %struct.str_t*, align 8
  %src.addr = alloca %struct.str_t*, align 8
  store %struct.str_t* %dest, %struct.str_t** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %dest.addr, metadata !451, metadata !DIExpression()), !dbg !452
  store %struct.str_t* %src, %struct.str_t** %src.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.str_t** %src.addr, metadata !453, metadata !DIExpression()), !dbg !454
  br label %while.cond, !dbg !455

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !456
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !457
  %1 = load i64, i64* %len, align 8, !dbg !457
  %2 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !458
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %2, i32 0, i32 0, !dbg !459
  %3 = load i64, i64* %len1, align 8, !dbg !459
  %cmp = icmp ult i64 %1, %3, !dbg !460
  br i1 %cmp, label %while.body, label %while.end, !dbg !455

while.body:                                       ; preds = %while.cond
  %4 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !461
  call void @str_extend(%struct.str_t* %4), !dbg !462
  br label %while.cond, !dbg !455, !llvm.loop !463

while.end:                                        ; preds = %while.cond
  %5 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !465
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !466
  %6 = load i8*, i8** %s, align 8, !dbg !466
  %7 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !467
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %7, i32 0, i32 2, !dbg !468
  %8 = load i8*, i8** %s2, align 8, !dbg !468
  %9 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !469
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %9, i32 0, i32 0, !dbg !470
  %10 = load i64, i64* %len3, align 8, !dbg !470
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %8, i64 %10, i1 false), !dbg !471
  %11 = load %struct.str_t*, %struct.str_t** %src.addr, align 8, !dbg !472
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %11, i32 0, i32 0, !dbg !473
  %12 = load i64, i64* %len4, align 8, !dbg !473
  %13 = load %struct.str_t*, %struct.str_t** %dest.addr, align 8, !dbg !474
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %13, i32 0, i32 0, !dbg !475
  store i64 %12, i64* %len5, align 8, !dbg !476
  ret void, !dbg !477
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !478 {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.str_t*, align 8
  %s2 = alloca %struct.str_t*, align 8
  %s3 = alloca %struct.str_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.str_t** %s, metadata !481, metadata !DIExpression()), !dbg !482
  %call = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !483
  store %struct.str_t* %call, %struct.str_t** %s, align 8, !dbg !482
  call void @llvm.dbg.declare(metadata %struct.str_t** %s2, metadata !484, metadata !DIExpression()), !dbg !485
  %call1 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !486
  store %struct.str_t* %call1, %struct.str_t** %s2, align 8, !dbg !485
  call void @llvm.dbg.declare(metadata %struct.str_t** %s3, metadata !487, metadata !DIExpression()), !dbg !488
  %call2 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0)), !dbg !489
  store %struct.str_t* %call2, %struct.str_t** %s3, align 8, !dbg !488
  %0 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !490
  %1 = load %struct.str_t*, %struct.str_t** %s3, align 8, !dbg !491
  %2 = load %struct.str_t*, %struct.str_t** %s2, align 8, !dbg !492
  %call3 = call %struct.str_t* @str_subst(%struct.str_t* %0, %struct.str_t* %1, %struct.str_t* %2), !dbg !493
  %3 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !494
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %3, i32 0, i32 0, !dbg !495
  %4 = load i64, i64* %len, align 8, !dbg !495
  %5 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !496
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %5, i32 0, i32 2, !dbg !497
  %6 = load i8*, i8** %s4, align 8, !dbg !497
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %4, i8* %6), !dbg !498
  %7 = load %struct.str_t*, %struct.str_t** %s, align 8, !dbg !499
  call void @str_del(%struct.str_t* %7), !dbg !500
  %8 = load %struct.str_t*, %struct.str_t** %s2, align 8, !dbg !501
  call void @str_del(%struct.str_t* %8), !dbg !502
  %9 = load %struct.str_t*, %struct.str_t** %s3, align 8, !dbg !503
  call void @str_del(%struct.str_t* %9), !dbg !504
  ret i32 0, !dbg !505
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-strings.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-strings")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "str_new", scope: !1, file: !1, line: 11, type: !8, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !15}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "bstr", file: !1, line: 8, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "str_t", file: !1, line: 5, size: 192, elements: !13)
!13 = !{!14, !18, !19}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !12, file: !1, line: 6, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
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
!31 = !DILocation(line: 14, column: 19, scope: !28)
!32 = !DILocation(line: 14, column: 15, scope: !28)
!33 = !DILocation(line: 15, column: 13, scope: !7)
!34 = !DILocation(line: 15, column: 2, scope: !7)
!35 = !DILocation(line: 15, column: 5, scope: !7)
!36 = !DILocation(line: 15, column: 11, scope: !7)
!37 = !DILocation(line: 16, column: 16, scope: !7)
!38 = !DILocation(line: 16, column: 9, scope: !7)
!39 = !DILocation(line: 16, column: 2, scope: !7)
!40 = !DILocation(line: 16, column: 5, scope: !7)
!41 = !DILocation(line: 16, column: 7, scope: !7)
!42 = !DILocation(line: 17, column: 2, scope: !7)
!43 = !DILocation(line: 17, column: 5, scope: !7)
!44 = !DILocation(line: 17, column: 9, scope: !7)
!45 = !DILocation(line: 18, column: 9, scope: !7)
!46 = !DILocation(line: 18, column: 2, scope: !7)
!47 = distinct !DISubprogram(name: "str_extend", scope: !1, file: !1, line: 21, type: !48, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !10}
!50 = !DILocalVariable(name: "s", arg: 1, scope: !47, file: !1, line: 21, type: !10)
!51 = !DILocation(line: 21, column: 22, scope: !47)
!52 = !DILocalVariable(name: "ns", scope: !47, file: !1, line: 23, type: !15)
!53 = !DILocation(line: 23, column: 9, scope: !47)
!54 = !DILocation(line: 23, column: 14, scope: !47)
!55 = !DILocation(line: 23, column: 17, scope: !47)
!56 = !DILocation(line: 23, column: 23, scope: !47)
!57 = !DILocation(line: 24, column: 6, scope: !58)
!58 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 6)
!59 = !DILocation(line: 24, column: 11, scope: !58)
!60 = !DILocation(line: 24, column: 14, scope: !58)
!61 = !DILocation(line: 24, column: 9, scope: !58)
!62 = !DILocation(line: 24, column: 20, scope: !58)
!63 = !DILocation(line: 24, column: 6, scope: !47)
!64 = !DILocation(line: 24, column: 33, scope: !58)
!65 = !DILocation(line: 24, column: 36, scope: !58)
!66 = !DILocation(line: 24, column: 42, scope: !58)
!67 = !DILocation(line: 24, column: 31, scope: !58)
!68 = !DILocation(line: 24, column: 28, scope: !58)
!69 = !DILocation(line: 25, column: 17, scope: !47)
!70 = !DILocation(line: 25, column: 20, scope: !47)
!71 = !DILocation(line: 25, column: 23, scope: !47)
!72 = !DILocation(line: 25, column: 9, scope: !47)
!73 = !DILocation(line: 25, column: 2, scope: !47)
!74 = !DILocation(line: 25, column: 5, scope: !47)
!75 = !DILocation(line: 25, column: 7, scope: !47)
!76 = !DILocation(line: 26, column: 13, scope: !47)
!77 = !DILocation(line: 26, column: 2, scope: !47)
!78 = !DILocation(line: 26, column: 5, scope: !47)
!79 = !DILocation(line: 26, column: 11, scope: !47)
!80 = !DILocation(line: 27, column: 1, scope: !47)
!81 = distinct !DISubprogram(name: "str_del", scope: !1, file: !1, line: 29, type: !48, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "s", arg: 1, scope: !81, file: !1, line: 29, type: !10)
!83 = !DILocation(line: 29, column: 19, scope: !81)
!84 = !DILocation(line: 31, column: 7, scope: !81)
!85 = !DILocation(line: 31, column: 10, scope: !81)
!86 = !DILocation(line: 31, column: 2, scope: !81)
!87 = !DILocation(line: 31, column: 19, scope: !81)
!88 = !DILocation(line: 31, column: 14, scope: !81)
!89 = !DILocation(line: 32, column: 1, scope: !81)
!90 = distinct !DISubprogram(name: "str_cmp", scope: !1, file: !1, line: 34, type: !91, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !10, !10}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DILocalVariable(name: "l", arg: 1, scope: !90, file: !1, line: 34, type: !10)
!95 = !DILocation(line: 34, column: 18, scope: !90)
!96 = !DILocalVariable(name: "r", arg: 2, scope: !90, file: !1, line: 34, type: !10)
!97 = !DILocation(line: 34, column: 26, scope: !90)
!98 = !DILocalVariable(name: "res", scope: !90, file: !1, line: 36, type: !93)
!99 = !DILocation(line: 36, column: 6, scope: !90)
!100 = !DILocalVariable(name: "len", scope: !90, file: !1, line: 36, type: !93)
!101 = !DILocation(line: 36, column: 11, scope: !90)
!102 = !DILocation(line: 36, column: 17, scope: !90)
!103 = !DILocation(line: 36, column: 20, scope: !90)
!104 = !DILocation(line: 37, column: 6, scope: !105)
!105 = distinct !DILexicalBlock(scope: !90, file: !1, line: 37, column: 6)
!106 = !DILocation(line: 37, column: 12, scope: !105)
!107 = !DILocation(line: 37, column: 15, scope: !105)
!108 = !DILocation(line: 37, column: 10, scope: !105)
!109 = !DILocation(line: 37, column: 6, scope: !90)
!110 = !DILocation(line: 37, column: 26, scope: !105)
!111 = !DILocation(line: 37, column: 29, scope: !105)
!112 = !DILocation(line: 37, column: 24, scope: !105)
!113 = !DILocation(line: 37, column: 20, scope: !105)
!114 = !DILocation(line: 39, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !90, file: !1, line: 39, column: 6)
!116 = !DILocation(line: 39, column: 23, scope: !115)
!117 = !DILocation(line: 39, column: 26, scope: !115)
!118 = !DILocation(line: 39, column: 29, scope: !115)
!119 = !DILocation(line: 39, column: 32, scope: !115)
!120 = !DILocation(line: 39, column: 13, scope: !115)
!121 = !DILocation(line: 39, column: 11, scope: !115)
!122 = !DILocation(line: 39, column: 6, scope: !90)
!123 = !DILocation(line: 39, column: 46, scope: !115)
!124 = !DILocation(line: 39, column: 39, scope: !115)
!125 = !DILocation(line: 40, column: 9, scope: !90)
!126 = !DILocation(line: 40, column: 12, scope: !90)
!127 = !DILocation(line: 40, column: 18, scope: !90)
!128 = !DILocation(line: 40, column: 21, scope: !90)
!129 = !DILocation(line: 40, column: 16, scope: !90)
!130 = !DILocation(line: 40, column: 2, scope: !90)
!131 = !DILocation(line: 41, column: 1, scope: !90)
!132 = distinct !DISubprogram(name: "str_dup", scope: !1, file: !1, line: 43, type: !133, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DISubroutineType(types: !134)
!134 = !{!10, !10}
!135 = !DILocalVariable(name: "src", arg: 1, scope: !132, file: !1, line: 43, type: !10)
!136 = !DILocation(line: 43, column: 19, scope: !132)
!137 = !DILocalVariable(name: "x", scope: !132, file: !1, line: 45, type: !10)
!138 = !DILocation(line: 45, column: 7, scope: !132)
!139 = !DILocation(line: 45, column: 19, scope: !132)
!140 = !DILocation(line: 45, column: 24, scope: !132)
!141 = !DILocation(line: 45, column: 11, scope: !132)
!142 = !DILocation(line: 46, column: 9, scope: !132)
!143 = !DILocation(line: 46, column: 12, scope: !132)
!144 = !DILocation(line: 46, column: 15, scope: !132)
!145 = !DILocation(line: 46, column: 20, scope: !132)
!146 = !DILocation(line: 46, column: 23, scope: !132)
!147 = !DILocation(line: 46, column: 28, scope: !132)
!148 = !DILocation(line: 46, column: 2, scope: !132)
!149 = !DILocation(line: 47, column: 11, scope: !132)
!150 = !DILocation(line: 47, column: 16, scope: !132)
!151 = !DILocation(line: 47, column: 2, scope: !132)
!152 = !DILocation(line: 47, column: 5, scope: !132)
!153 = !DILocation(line: 47, column: 9, scope: !132)
!154 = !DILocation(line: 48, column: 9, scope: !132)
!155 = !DILocation(line: 48, column: 2, scope: !132)
!156 = distinct !DISubprogram(name: "str_from_chars", scope: !1, file: !1, line: 51, type: !157, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DISubroutineType(types: !158)
!158 = !{!10, !159}
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !161)
!161 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!162 = !DILocalVariable(name: "t", arg: 1, scope: !156, file: !1, line: 51, type: !159)
!163 = !DILocation(line: 51, column: 33, scope: !156)
!164 = !DILocation(line: 53, column: 7, scope: !165)
!165 = distinct !DILexicalBlock(scope: !156, file: !1, line: 53, column: 6)
!166 = !DILocation(line: 53, column: 6, scope: !156)
!167 = !DILocation(line: 53, column: 17, scope: !165)
!168 = !DILocation(line: 53, column: 10, scope: !165)
!169 = !DILocalVariable(name: "l", scope: !156, file: !1, line: 54, type: !15)
!170 = !DILocation(line: 54, column: 9, scope: !156)
!171 = !DILocation(line: 54, column: 20, scope: !156)
!172 = !DILocation(line: 54, column: 13, scope: !156)
!173 = !DILocalVariable(name: "x", scope: !156, file: !1, line: 55, type: !10)
!174 = !DILocation(line: 55, column: 7, scope: !156)
!175 = !DILocation(line: 55, column: 19, scope: !156)
!176 = !DILocation(line: 55, column: 21, scope: !156)
!177 = !DILocation(line: 55, column: 11, scope: !156)
!178 = !DILocation(line: 56, column: 11, scope: !156)
!179 = !DILocation(line: 56, column: 2, scope: !156)
!180 = !DILocation(line: 56, column: 5, scope: !156)
!181 = !DILocation(line: 56, column: 9, scope: !156)
!182 = !DILocation(line: 57, column: 9, scope: !156)
!183 = !DILocation(line: 57, column: 12, scope: !156)
!184 = !DILocation(line: 57, column: 15, scope: !156)
!185 = !DILocation(line: 57, column: 18, scope: !156)
!186 = !DILocation(line: 57, column: 2, scope: !156)
!187 = !DILocation(line: 58, column: 9, scope: !156)
!188 = !DILocation(line: 58, column: 2, scope: !156)
!189 = !DILocation(line: 59, column: 1, scope: !156)
!190 = distinct !DISubprogram(name: "str_append", scope: !1, file: !1, line: 61, type: !191, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!191 = !DISubroutineType(types: !192)
!192 = !{null, !10, !21}
!193 = !DILocalVariable(name: "s", arg: 1, scope: !190, file: !1, line: 61, type: !10)
!194 = !DILocation(line: 61, column: 22, scope: !190)
!195 = !DILocalVariable(name: "b", arg: 2, scope: !190, file: !1, line: 61, type: !21)
!196 = !DILocation(line: 61, column: 39, scope: !190)
!197 = !DILocation(line: 63, column: 6, scope: !198)
!198 = distinct !DILexicalBlock(scope: !190, file: !1, line: 63, column: 6)
!199 = !DILocation(line: 63, column: 9, scope: !198)
!200 = !DILocation(line: 63, column: 16, scope: !198)
!201 = !DILocation(line: 63, column: 19, scope: !198)
!202 = !DILocation(line: 63, column: 13, scope: !198)
!203 = !DILocation(line: 63, column: 6, scope: !190)
!204 = !DILocation(line: 63, column: 37, scope: !198)
!205 = !DILocation(line: 63, column: 26, scope: !198)
!206 = !DILocation(line: 64, column: 19, scope: !190)
!207 = !DILocation(line: 64, column: 2, scope: !190)
!208 = !DILocation(line: 64, column: 5, scope: !190)
!209 = !DILocation(line: 64, column: 7, scope: !190)
!210 = !DILocation(line: 64, column: 10, scope: !190)
!211 = !DILocation(line: 64, column: 13, scope: !190)
!212 = !DILocation(line: 64, column: 17, scope: !190)
!213 = !DILocation(line: 65, column: 1, scope: !190)
!214 = distinct !DISubprogram(name: "str_substr", scope: !1, file: !1, line: 67, type: !215, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!215 = !DISubroutineType(types: !216)
!216 = !{!10, !10, !93, !93}
!217 = !DILocalVariable(name: "s", arg: 1, scope: !214, file: !1, line: 67, type: !10)
!218 = !DILocation(line: 67, column: 22, scope: !214)
!219 = !DILocalVariable(name: "from", arg: 2, scope: !214, file: !1, line: 67, type: !93)
!220 = !DILocation(line: 67, column: 29, scope: !214)
!221 = !DILocalVariable(name: "to", arg: 3, scope: !214, file: !1, line: 67, type: !93)
!222 = !DILocation(line: 67, column: 39, scope: !214)
!223 = !DILocation(line: 69, column: 7, scope: !224)
!224 = distinct !DILexicalBlock(scope: !214, file: !1, line: 69, column: 6)
!225 = !DILocation(line: 69, column: 6, scope: !214)
!226 = !DILocation(line: 69, column: 16, scope: !224)
!227 = !DILocation(line: 69, column: 19, scope: !224)
!228 = !DILocation(line: 69, column: 14, scope: !224)
!229 = !DILocation(line: 69, column: 11, scope: !224)
!230 = !DILocation(line: 70, column: 6, scope: !231)
!231 = distinct !DILexicalBlock(scope: !214, file: !1, line: 70, column: 6)
!232 = !DILocation(line: 70, column: 11, scope: !231)
!233 = !DILocation(line: 70, column: 6, scope: !214)
!234 = !DILocation(line: 70, column: 24, scope: !231)
!235 = !DILocation(line: 70, column: 27, scope: !231)
!236 = !DILocation(line: 70, column: 21, scope: !231)
!237 = !DILocation(line: 70, column: 16, scope: !231)
!238 = !DILocation(line: 71, column: 6, scope: !239)
!239 = distinct !DILexicalBlock(scope: !214, file: !1, line: 71, column: 6)
!240 = !DILocation(line: 71, column: 11, scope: !239)
!241 = !DILocation(line: 71, column: 15, scope: !239)
!242 = !DILocation(line: 71, column: 18, scope: !239)
!243 = !DILocation(line: 71, column: 26, scope: !239)
!244 = !DILocation(line: 71, column: 29, scope: !239)
!245 = !DILocation(line: 71, column: 23, scope: !239)
!246 = !DILocation(line: 71, column: 6, scope: !214)
!247 = !DILocation(line: 72, column: 3, scope: !239)
!248 = !DILocation(line: 73, column: 6, scope: !249)
!249 = distinct !DILexicalBlock(scope: !214, file: !1, line: 73, column: 6)
!250 = !DILocation(line: 73, column: 11, scope: !249)
!251 = !DILocation(line: 73, column: 9, scope: !249)
!252 = !DILocation(line: 73, column: 6, scope: !214)
!253 = !DILocation(line: 73, column: 22, scope: !249)
!254 = !DILocation(line: 73, column: 27, scope: !249)
!255 = !DILocation(line: 73, column: 20, scope: !249)
!256 = !DILocation(line: 73, column: 17, scope: !249)
!257 = !DILocalVariable(name: "x", scope: !214, file: !1, line: 74, type: !10)
!258 = !DILocation(line: 74, column: 7, scope: !214)
!259 = !DILocation(line: 74, column: 19, scope: !214)
!260 = !DILocation(line: 74, column: 24, scope: !214)
!261 = !DILocation(line: 74, column: 22, scope: !214)
!262 = !DILocation(line: 74, column: 11, scope: !214)
!263 = !DILocation(line: 75, column: 11, scope: !214)
!264 = !DILocation(line: 75, column: 16, scope: !214)
!265 = !DILocation(line: 75, column: 14, scope: !214)
!266 = !DILocation(line: 75, column: 2, scope: !214)
!267 = !DILocation(line: 75, column: 5, scope: !214)
!268 = !DILocation(line: 75, column: 9, scope: !214)
!269 = !DILocation(line: 76, column: 9, scope: !214)
!270 = !DILocation(line: 76, column: 12, scope: !214)
!271 = !DILocation(line: 76, column: 15, scope: !214)
!272 = !DILocation(line: 76, column: 18, scope: !214)
!273 = !DILocation(line: 76, column: 22, scope: !214)
!274 = !DILocation(line: 76, column: 20, scope: !214)
!275 = !DILocation(line: 76, column: 28, scope: !214)
!276 = !DILocation(line: 76, column: 31, scope: !214)
!277 = !DILocation(line: 76, column: 2, scope: !214)
!278 = !DILocation(line: 77, column: 9, scope: !214)
!279 = !DILocation(line: 77, column: 2, scope: !214)
!280 = !DILocation(line: 78, column: 1, scope: !214)
!281 = distinct !DISubprogram(name: "str_cat", scope: !1, file: !1, line: 80, type: !282, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!282 = !DISubroutineType(types: !283)
!283 = !{!10, !10, !10}
!284 = !DILocalVariable(name: "s", arg: 1, scope: !281, file: !1, line: 80, type: !10)
!285 = !DILocation(line: 80, column: 19, scope: !281)
!286 = !DILocalVariable(name: "s2", arg: 2, scope: !281, file: !1, line: 80, type: !10)
!287 = !DILocation(line: 80, column: 27, scope: !281)
!288 = !DILocation(line: 82, column: 2, scope: !281)
!289 = !DILocation(line: 82, column: 9, scope: !281)
!290 = !DILocation(line: 82, column: 12, scope: !281)
!291 = !DILocation(line: 82, column: 20, scope: !281)
!292 = !DILocation(line: 82, column: 23, scope: !281)
!293 = !DILocation(line: 82, column: 29, scope: !281)
!294 = !DILocation(line: 82, column: 33, scope: !281)
!295 = !DILocation(line: 82, column: 27, scope: !281)
!296 = !DILocation(line: 82, column: 18, scope: !281)
!297 = !DILocation(line: 82, column: 49, scope: !281)
!298 = !DILocation(line: 82, column: 38, scope: !281)
!299 = distinct !{!299, !288, !300}
!300 = !DILocation(line: 82, column: 50, scope: !281)
!301 = !DILocation(line: 83, column: 9, scope: !281)
!302 = !DILocation(line: 83, column: 12, scope: !281)
!303 = !DILocation(line: 83, column: 16, scope: !281)
!304 = !DILocation(line: 83, column: 19, scope: !281)
!305 = !DILocation(line: 83, column: 14, scope: !281)
!306 = !DILocation(line: 83, column: 24, scope: !281)
!307 = !DILocation(line: 83, column: 28, scope: !281)
!308 = !DILocation(line: 83, column: 31, scope: !281)
!309 = !DILocation(line: 83, column: 35, scope: !281)
!310 = !DILocation(line: 83, column: 2, scope: !281)
!311 = !DILocation(line: 84, column: 12, scope: !281)
!312 = !DILocation(line: 84, column: 16, scope: !281)
!313 = !DILocation(line: 84, column: 2, scope: !281)
!314 = !DILocation(line: 84, column: 5, scope: !281)
!315 = !DILocation(line: 84, column: 9, scope: !281)
!316 = !DILocation(line: 85, column: 9, scope: !281)
!317 = !DILocation(line: 85, column: 2, scope: !281)
!318 = distinct !DISubprogram(name: "str_swap", scope: !1, file: !1, line: 88, type: !319, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!319 = !DISubroutineType(types: !320)
!320 = !{null, !10, !10}
!321 = !DILocalVariable(name: "a", arg: 1, scope: !318, file: !1, line: 88, type: !10)
!322 = !DILocation(line: 88, column: 20, scope: !318)
!323 = !DILocalVariable(name: "b", arg: 2, scope: !318, file: !1, line: 88, type: !10)
!324 = !DILocation(line: 88, column: 28, scope: !318)
!325 = !DILocalVariable(name: "tz", scope: !318, file: !1, line: 90, type: !15)
!326 = !DILocation(line: 90, column: 9, scope: !318)
!327 = !DILocalVariable(name: "ts", scope: !318, file: !1, line: 91, type: !20)
!328 = !DILocation(line: 91, column: 17, scope: !318)
!329 = !DILocation(line: 92, column: 7, scope: !318)
!330 = !DILocation(line: 92, column: 10, scope: !318)
!331 = !DILocation(line: 92, column: 5, scope: !318)
!332 = !DILocation(line: 92, column: 28, scope: !318)
!333 = !DILocation(line: 92, column: 31, scope: !318)
!334 = !DILocation(line: 92, column: 17, scope: !318)
!335 = !DILocation(line: 92, column: 20, scope: !318)
!336 = !DILocation(line: 92, column: 26, scope: !318)
!337 = !DILocation(line: 92, column: 49, scope: !318)
!338 = !DILocation(line: 92, column: 38, scope: !318)
!339 = !DILocation(line: 92, column: 41, scope: !318)
!340 = !DILocation(line: 92, column: 47, scope: !318)
!341 = !DILocation(line: 93, column: 7, scope: !318)
!342 = !DILocation(line: 93, column: 10, scope: !318)
!343 = !DILocation(line: 93, column: 5, scope: !318)
!344 = !DILocation(line: 93, column: 24, scope: !318)
!345 = !DILocation(line: 93, column: 27, scope: !318)
!346 = !DILocation(line: 93, column: 15, scope: !318)
!347 = !DILocation(line: 93, column: 18, scope: !318)
!348 = !DILocation(line: 93, column: 22, scope: !318)
!349 = !DILocation(line: 93, column: 41, scope: !318)
!350 = !DILocation(line: 93, column: 32, scope: !318)
!351 = !DILocation(line: 93, column: 35, scope: !318)
!352 = !DILocation(line: 93, column: 39, scope: !318)
!353 = !DILocation(line: 94, column: 7, scope: !318)
!354 = !DILocation(line: 94, column: 10, scope: !318)
!355 = !DILocation(line: 94, column: 5, scope: !318)
!356 = !DILocation(line: 94, column: 20, scope: !318)
!357 = !DILocation(line: 94, column: 23, scope: !318)
!358 = !DILocation(line: 94, column: 13, scope: !318)
!359 = !DILocation(line: 94, column: 16, scope: !318)
!360 = !DILocation(line: 94, column: 18, scope: !318)
!361 = !DILocation(line: 94, column: 33, scope: !318)
!362 = !DILocation(line: 94, column: 26, scope: !318)
!363 = !DILocation(line: 94, column: 29, scope: !318)
!364 = !DILocation(line: 94, column: 31, scope: !318)
!365 = !DILocation(line: 95, column: 1, scope: !318)
!366 = distinct !DISubprogram(name: "str_subst", scope: !1, file: !1, line: 97, type: !367, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!367 = !DISubroutineType(types: !368)
!368 = !{!10, !10, !10, !10}
!369 = !DILocalVariable(name: "tgt", arg: 1, scope: !366, file: !1, line: 97, type: !10)
!370 = !DILocation(line: 97, column: 21, scope: !366)
!371 = !DILocalVariable(name: "pat", arg: 2, scope: !366, file: !1, line: 97, type: !10)
!372 = !DILocation(line: 97, column: 31, scope: !366)
!373 = !DILocalVariable(name: "repl", arg: 3, scope: !366, file: !1, line: 97, type: !10)
!374 = !DILocation(line: 97, column: 41, scope: !366)
!375 = !DILocalVariable(name: "tmp", scope: !366, file: !1, line: 99, type: !10)
!376 = !DILocation(line: 99, column: 7, scope: !366)
!377 = !DILocation(line: 99, column: 13, scope: !366)
!378 = !DILocalVariable(name: "i", scope: !366, file: !1, line: 100, type: !93)
!379 = !DILocation(line: 100, column: 6, scope: !366)
!380 = !DILocation(line: 101, column: 9, scope: !381)
!381 = distinct !DILexicalBlock(scope: !366, file: !1, line: 101, column: 2)
!382 = !DILocation(line: 101, column: 7, scope: !381)
!383 = !DILocation(line: 101, column: 14, scope: !384)
!384 = distinct !DILexicalBlock(scope: !381, file: !1, line: 101, column: 2)
!385 = !DILocation(line: 101, column: 18, scope: !384)
!386 = !DILocation(line: 101, column: 23, scope: !384)
!387 = !DILocation(line: 101, column: 16, scope: !384)
!388 = !DILocation(line: 101, column: 30, scope: !384)
!389 = !DILocation(line: 101, column: 35, scope: !384)
!390 = !DILocation(line: 101, column: 27, scope: !384)
!391 = !DILocation(line: 101, column: 2, scope: !381)
!392 = !DILocation(line: 102, column: 14, scope: !393)
!393 = distinct !DILexicalBlock(scope: !394, file: !1, line: 102, column: 7)
!394 = distinct !DILexicalBlock(scope: !384, file: !1, line: 101, column: 41)
!395 = !DILocation(line: 102, column: 19, scope: !393)
!396 = !DILocation(line: 102, column: 23, scope: !393)
!397 = !DILocation(line: 102, column: 21, scope: !393)
!398 = !DILocation(line: 102, column: 26, scope: !393)
!399 = !DILocation(line: 102, column: 31, scope: !393)
!400 = !DILocation(line: 102, column: 34, scope: !393)
!401 = !DILocation(line: 102, column: 39, scope: !393)
!402 = !DILocation(line: 102, column: 7, scope: !393)
!403 = !DILocation(line: 102, column: 7, scope: !394)
!404 = !DILocation(line: 103, column: 15, scope: !405)
!405 = distinct !DILexicalBlock(scope: !393, file: !1, line: 102, column: 45)
!406 = !DILocation(line: 103, column: 20, scope: !405)
!407 = !DILocation(line: 103, column: 25, scope: !405)
!408 = !DILocation(line: 103, column: 27, scope: !405)
!409 = !DILocation(line: 103, column: 4, scope: !405)
!410 = !DILocation(line: 104, column: 5, scope: !405)
!411 = !DILocation(line: 105, column: 3, scope: !405)
!412 = !DILocation(line: 106, column: 12, scope: !413)
!413 = distinct !DILexicalBlock(scope: !393, file: !1, line: 105, column: 10)
!414 = !DILocation(line: 106, column: 17, scope: !413)
!415 = !DILocation(line: 106, column: 4, scope: !413)
!416 = !DILocation(line: 107, column: 9, scope: !413)
!417 = !DILocation(line: 107, column: 14, scope: !413)
!418 = !DILocation(line: 107, column: 6, scope: !413)
!419 = !DILocation(line: 108, column: 9, scope: !420)
!420 = distinct !DILexicalBlock(scope: !413, file: !1, line: 108, column: 8)
!421 = !DILocation(line: 108, column: 14, scope: !420)
!422 = !DILocation(line: 108, column: 8, scope: !413)
!423 = !DILocation(line: 108, column: 30, scope: !420)
!424 = !DILocation(line: 108, column: 35, scope: !420)
!425 = !DILocation(line: 108, column: 40, scope: !420)
!426 = !DILocation(line: 108, column: 43, scope: !420)
!427 = !DILocation(line: 108, column: 19, scope: !420)
!428 = !DILocation(line: 101, column: 2, scope: !384)
!429 = distinct !{!429, !391, !430}
!430 = !DILocation(line: 110, column: 2, scope: !381)
!431 = !DILocation(line: 111, column: 2, scope: !366)
!432 = !DILocation(line: 111, column: 9, scope: !366)
!433 = !DILocation(line: 111, column: 13, scope: !366)
!434 = !DILocation(line: 111, column: 18, scope: !366)
!435 = !DILocation(line: 111, column: 11, scope: !366)
!436 = !DILocation(line: 111, column: 34, scope: !366)
!437 = !DILocation(line: 111, column: 39, scope: !366)
!438 = !DILocation(line: 111, column: 44, scope: !366)
!439 = !DILocation(line: 111, column: 47, scope: !366)
!440 = !DILocation(line: 111, column: 23, scope: !366)
!441 = distinct !{!441, !431, !442}
!442 = !DILocation(line: 111, column: 50, scope: !366)
!443 = !DILocation(line: 112, column: 11, scope: !366)
!444 = !DILocation(line: 112, column: 16, scope: !366)
!445 = !DILocation(line: 112, column: 2, scope: !366)
!446 = !DILocation(line: 113, column: 10, scope: !366)
!447 = !DILocation(line: 113, column: 2, scope: !366)
!448 = !DILocation(line: 114, column: 9, scope: !366)
!449 = !DILocation(line: 114, column: 2, scope: !366)
!450 = distinct !DISubprogram(name: "str_set", scope: !1, file: !1, line: 117, type: !319, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!451 = !DILocalVariable(name: "dest", arg: 1, scope: !450, file: !1, line: 117, type: !10)
!452 = !DILocation(line: 117, column: 19, scope: !450)
!453 = !DILocalVariable(name: "src", arg: 2, scope: !450, file: !1, line: 117, type: !10)
!454 = !DILocation(line: 117, column: 30, scope: !450)
!455 = !DILocation(line: 119, column: 2, scope: !450)
!456 = !DILocation(line: 119, column: 9, scope: !450)
!457 = !DILocation(line: 119, column: 15, scope: !450)
!458 = !DILocation(line: 119, column: 21, scope: !450)
!459 = !DILocation(line: 119, column: 26, scope: !450)
!460 = !DILocation(line: 119, column: 19, scope: !450)
!461 = !DILocation(line: 119, column: 42, scope: !450)
!462 = !DILocation(line: 119, column: 31, scope: !450)
!463 = distinct !{!463, !455, !464}
!464 = !DILocation(line: 119, column: 46, scope: !450)
!465 = !DILocation(line: 120, column: 9, scope: !450)
!466 = !DILocation(line: 120, column: 15, scope: !450)
!467 = !DILocation(line: 120, column: 18, scope: !450)
!468 = !DILocation(line: 120, column: 23, scope: !450)
!469 = !DILocation(line: 120, column: 26, scope: !450)
!470 = !DILocation(line: 120, column: 31, scope: !450)
!471 = !DILocation(line: 120, column: 2, scope: !450)
!472 = !DILocation(line: 121, column: 14, scope: !450)
!473 = !DILocation(line: 121, column: 19, scope: !450)
!474 = !DILocation(line: 121, column: 2, scope: !450)
!475 = !DILocation(line: 121, column: 8, scope: !450)
!476 = !DILocation(line: 121, column: 12, scope: !450)
!477 = !DILocation(line: 122, column: 1, scope: !450)
!478 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 124, type: !479, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!479 = !DISubroutineType(types: !480)
!480 = !{!93}
!481 = !DILocalVariable(name: "s", scope: !478, file: !1, line: 126, type: !10)
!482 = !DILocation(line: 126, column: 7, scope: !478)
!483 = !DILocation(line: 126, column: 11, scope: !478)
!484 = !DILocalVariable(name: "s2", scope: !478, file: !1, line: 127, type: !10)
!485 = !DILocation(line: 127, column: 7, scope: !478)
!486 = !DILocation(line: 127, column: 12, scope: !478)
!487 = !DILocalVariable(name: "s3", scope: !478, file: !1, line: 128, type: !10)
!488 = !DILocation(line: 128, column: 7, scope: !478)
!489 = !DILocation(line: 128, column: 12, scope: !478)
!490 = !DILocation(line: 130, column: 12, scope: !478)
!491 = !DILocation(line: 130, column: 15, scope: !478)
!492 = !DILocation(line: 130, column: 19, scope: !478)
!493 = !DILocation(line: 130, column: 2, scope: !478)
!494 = !DILocation(line: 131, column: 19, scope: !478)
!495 = !DILocation(line: 131, column: 22, scope: !478)
!496 = !DILocation(line: 131, column: 27, scope: !478)
!497 = !DILocation(line: 131, column: 30, scope: !478)
!498 = !DILocation(line: 131, column: 2, scope: !478)
!499 = !DILocation(line: 133, column: 10, scope: !478)
!500 = !DILocation(line: 133, column: 2, scope: !478)
!501 = !DILocation(line: 134, column: 10, scope: !478)
!502 = !DILocation(line: 134, column: 2, scope: !478)
!503 = !DILocation(line: 135, column: 10, scope: !478)
!504 = !DILocation(line: 135, column: 2, scope: !478)
!505 = !DILocation(line: 137, column: 2, scope: !478)
