; ModuleID = 'binary-strings.ll'
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
  call void @llvm.dbg.value(metadata i64 %len, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias i8* @malloc(i64 24) #6, !dbg !24
  %0 = bitcast i8* %call to %struct.str_t*, !dbg !24
  call void @llvm.dbg.value(metadata %struct.str_t* %0, metadata !25, metadata !DIExpression()), !dbg !23
  %cmp = icmp ult i64 %len, 8, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 8, metadata !22, metadata !DIExpression()), !dbg !23
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %len.addr.0 = phi i64 [ 8, %if.then ], [ %len, %entry ]
  call void @llvm.dbg.value(metadata i64 %len.addr.0, metadata !22, metadata !DIExpression()), !dbg !23
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 1, !dbg !30
  store i64 %len.addr.0, i64* %alloc, align 8, !dbg !31
  %call1 = call noalias i8* @malloc(i64 %len.addr.0) #6, !dbg !32
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 2, !dbg !33
  store i8* %call1, i8** %s2, align 8, !dbg !34
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %0, i32 0, i32 0, !dbg !35
  store i64 0, i64* %len3, align 8, !dbg !36
  ret %struct.str_t* %0, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_extend(%struct.str_t* %s) #0 !dbg !38 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %s, metadata !41, metadata !DIExpression()), !dbg !42
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !43
  %0 = load i64, i64* %alloc, align 8, !dbg !43
  %mul = mul i64 %0, 2, !dbg !44
  call void @llvm.dbg.value(metadata i64 %mul, metadata !45, metadata !DIExpression()), !dbg !42
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !46
  %1 = load i64, i64* %alloc1, align 8, !dbg !46
  %sub = sub i64 %mul, %1, !dbg !48
  %cmp = icmp ugt i64 %sub, 1024, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !51
  %2 = load i64, i64* %alloc2, align 8, !dbg !51
  %add = add i64 %2, 1024, !dbg !52
  call void @llvm.dbg.value(metadata i64 %add, metadata !45, metadata !DIExpression()), !dbg !42
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  %ns.0 = phi i64 [ %add, %if.then ], [ %mul, %entry ], !dbg !42
  call void @llvm.dbg.value(metadata i64 %ns.0, metadata !45, metadata !DIExpression()), !dbg !42
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !54
  %3 = load i8*, i8** %s3, align 8, !dbg !54
  %call = call i8* @realloc(i8* %3, i64 %ns.0) #6, !dbg !55
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !56
  store i8* %call, i8** %s4, align 8, !dbg !57
  %alloc5 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !58
  store i64 %ns.0, i64* %alloc5, align 8, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_del(%struct.str_t* %s) #0 !dbg !61 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %s, metadata !62, metadata !DIExpression()), !dbg !63
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !64
  %0 = load i8*, i8** %s1, align 8, !dbg !64
  call void @free(i8* %0) #6, !dbg !65
  %1 = bitcast %struct.str_t* %s to i8*, !dbg !66
  call void @free(i8* %1) #6, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @str_cmp(%struct.str_t* %l, %struct.str_t* %r) #0 !dbg !69 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %l, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.value(metadata %struct.str_t* %r, metadata !75, metadata !DIExpression()), !dbg !74
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %l, i32 0, i32 0, !dbg !76
  %0 = load i64, i64* %len1, align 8, !dbg !76
  %conv = trunc i64 %0 to i32, !dbg !77
  call void @llvm.dbg.value(metadata i32 %conv, metadata !78, metadata !DIExpression()), !dbg !74
  %conv2 = sext i32 %conv to i64, !dbg !79
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %r, i32 0, i32 0, !dbg !81
  %1 = load i64, i64* %len3, align 8, !dbg !81
  %cmp = icmp ugt i64 %conv2, %1, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %r, i32 0, i32 0, !dbg !84
  %2 = load i64, i64* %len5, align 8, !dbg !84
  %conv6 = trunc i64 %2 to i32, !dbg !85
  call void @llvm.dbg.value(metadata i32 %conv6, metadata !78, metadata !DIExpression()), !dbg !74
  br label %if.end, !dbg !86

if.end:                                           ; preds = %if.then, %entry
  %len.0 = phi i32 [ %conv6, %if.then ], [ %conv, %entry ], !dbg !74
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !78, metadata !DIExpression()), !dbg !74
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %l, i32 0, i32 2, !dbg !87
  %3 = load i8*, i8** %s, align 8, !dbg !87
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %r, i32 0, i32 2, !dbg !89
  %4 = load i8*, i8** %s7, align 8, !dbg !89
  %conv8 = sext i32 %len.0 to i64, !dbg !90
  %call = call i32 @memcmp(i8* %3, i8* %4, i64 %conv8) #7, !dbg !91
  call void @llvm.dbg.value(metadata i32 %call, metadata !92, metadata !DIExpression()), !dbg !74
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then9, label %if.end10, !dbg !94

if.then9:                                         ; preds = %if.end
  br label %return, !dbg !95

if.end10:                                         ; preds = %if.end
  %len11 = getelementptr inbounds %struct.str_t, %struct.str_t* %l, i32 0, i32 0, !dbg !96
  %5 = load i64, i64* %len11, align 8, !dbg !96
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %r, i32 0, i32 0, !dbg !97
  %6 = load i64, i64* %len12, align 8, !dbg !97
  %cmp13 = icmp ugt i64 %5, %6, !dbg !98
  %7 = zext i1 %cmp13 to i64, !dbg !99
  %cond = select i1 %cmp13, i32 1, i32 -1, !dbg !99
  br label %return, !dbg !100

return:                                           ; preds = %if.end10, %if.then9
  %retval.0 = phi i32 [ %call, %if.then9 ], [ %cond, %if.end10 ], !dbg !74
  ret i32 %retval.0, !dbg !101
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_dup(%struct.str_t* %src) #0 !dbg !102 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %src, metadata !105, metadata !DIExpression()), !dbg !106
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !107
  %0 = load i64, i64* %len, align 8, !dbg !107
  %call = call %struct.str_t* @str_new(i64 %0), !dbg !108
  call void @llvm.dbg.value(metadata %struct.str_t* %call, metadata !109, metadata !DIExpression()), !dbg !106
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 2, !dbg !110
  %1 = load i8*, i8** %s, align 8, !dbg !110
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 2, !dbg !111
  %2 = load i8*, i8** %s1, align 8, !dbg !111
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !112
  %3 = load i64, i64* %len2, align 8, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %2, i64 %3, i1 false), !dbg !113
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !114
  %4 = load i64, i64* %len3, align 8, !dbg !114
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 0, !dbg !115
  store i64 %4, i64* %len4, align 8, !dbg !116
  ret %struct.str_t* %call, !dbg !117
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_from_chars(i8* %t) #0 !dbg !118 {
entry:
  call void @llvm.dbg.value(metadata i8* %t, metadata !124, metadata !DIExpression()), !dbg !125
  %tobool = icmp ne i8* %t, null, !dbg !126
  br i1 %tobool, label %if.end, label %if.then, !dbg !128

if.then:                                          ; preds = %entry
  %call = call %struct.str_t* @str_new(i64 0), !dbg !129
  br label %return, !dbg !130

if.end:                                           ; preds = %entry
  %call1 = call i64 @strlen(i8* %t) #7, !dbg !131
  call void @llvm.dbg.value(metadata i64 %call1, metadata !132, metadata !DIExpression()), !dbg !125
  %add = add i64 %call1, 1, !dbg !133
  %call2 = call %struct.str_t* @str_new(i64 %add), !dbg !134
  call void @llvm.dbg.value(metadata %struct.str_t* %call2, metadata !135, metadata !DIExpression()), !dbg !125
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %call2, i32 0, i32 0, !dbg !136
  store i64 %call1, i64* %len, align 8, !dbg !137
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %call2, i32 0, i32 2, !dbg !138
  %0 = load i8*, i8** %s, align 8, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 %t, i64 %call1, i1 false), !dbg !139
  br label %return, !dbg !140

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi %struct.str_t* [ %call2, %if.end ], [ %call, %if.then ], !dbg !125
  ret %struct.str_t* %retval.0, !dbg !141
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_append(%struct.str_t* %s, i8 zeroext %b) #0 !dbg !142 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %s, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i8 %b, metadata !147, metadata !DIExpression()), !dbg !146
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !148
  %0 = load i64, i64* %len, align 8, !dbg !148
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !150
  %1 = load i64, i64* %alloc, align 8, !dbg !150
  %cmp = icmp uge i64 %0, %1, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  call void @str_extend(%struct.str_t* %s), !dbg !153
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  %s1 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !154
  %2 = load i8*, i8** %s1, align 8, !dbg !154
  %len2 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !155
  %3 = load i64, i64* %len2, align 8, !dbg !156
  %inc = add i64 %3, 1, !dbg !156
  store i64 %inc, i64* %len2, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !157
  store i8 %b, i8* %arrayidx, align 1, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_substr(%struct.str_t* %s, i32 %from, i32 %to) #0 !dbg !160 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %s, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.value(metadata i32 %from, metadata !165, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.value(metadata i32 %to, metadata !166, metadata !DIExpression()), !dbg !164
  %tobool = icmp ne i32 %to, 0, !dbg !167
  br i1 %tobool, label %if.end, label %if.then, !dbg !169

if.then:                                          ; preds = %entry
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !170
  %0 = load i64, i64* %len, align 8, !dbg !170
  %conv = trunc i64 %0 to i32, !dbg !171
  call void @llvm.dbg.value(metadata i32 %conv, metadata !166, metadata !DIExpression()), !dbg !164
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  %to.addr.0 = phi i32 [ %to, %entry ], [ %conv, %if.then ]
  call void @llvm.dbg.value(metadata i32 %to.addr.0, metadata !166, metadata !DIExpression()), !dbg !164
  %cmp = icmp slt i32 %from, 0, !dbg !173
  br i1 %cmp, label %if.then2, label %if.end6, !dbg !175

if.then2:                                         ; preds = %if.end
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !176
  %1 = load i64, i64* %len3, align 8, !dbg !176
  %conv4 = sext i32 %from to i64, !dbg !177
  %add = add i64 %conv4, %1, !dbg !177
  %conv5 = trunc i64 %add to i32, !dbg !177
  call void @llvm.dbg.value(metadata i32 %conv5, metadata !165, metadata !DIExpression()), !dbg !164
  br label %if.end6, !dbg !178

if.end6:                                          ; preds = %if.then2, %if.end
  %from.addr.0 = phi i32 [ %conv5, %if.then2 ], [ %from, %if.end ]
  call void @llvm.dbg.value(metadata i32 %from.addr.0, metadata !165, metadata !DIExpression()), !dbg !164
  %cmp7 = icmp slt i32 %from.addr.0, 0, !dbg !179
  br i1 %cmp7, label %if.then13, label %lor.lhs.false, !dbg !181

lor.lhs.false:                                    ; preds = %if.end6
  %conv9 = sext i32 %from.addr.0 to i64, !dbg !182
  %len10 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !183
  %2 = load i64, i64* %len10, align 8, !dbg !183
  %cmp11 = icmp uge i64 %conv9, %2, !dbg !184
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !185

if.then13:                                        ; preds = %lor.lhs.false, %if.end6
  br label %return, !dbg !186

if.end14:                                         ; preds = %lor.lhs.false
  %cmp15 = icmp slt i32 %to.addr.0, %from.addr.0, !dbg !187
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !189

if.then17:                                        ; preds = %if.end14
  %add18 = add nsw i32 %from.addr.0, 1, !dbg !190
  call void @llvm.dbg.value(metadata i32 %add18, metadata !166, metadata !DIExpression()), !dbg !164
  br label %if.end19, !dbg !191

if.end19:                                         ; preds = %if.then17, %if.end14
  %to.addr.1 = phi i32 [ %add18, %if.then17 ], [ %to.addr.0, %if.end14 ]
  call void @llvm.dbg.value(metadata i32 %to.addr.1, metadata !166, metadata !DIExpression()), !dbg !164
  %sub = sub nsw i32 %to.addr.1, %from.addr.0, !dbg !192
  %conv20 = sext i32 %sub to i64, !dbg !193
  %call = call %struct.str_t* @str_new(i64 %conv20), !dbg !194
  call void @llvm.dbg.value(metadata %struct.str_t* %call, metadata !195, metadata !DIExpression()), !dbg !164
  %sub21 = sub nsw i32 %to.addr.1, %from.addr.0, !dbg !196
  %conv22 = sext i32 %sub21 to i64, !dbg !197
  %len23 = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 0, !dbg !198
  store i64 %conv22, i64* %len23, align 8, !dbg !199
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 2, !dbg !200
  %3 = load i8*, i8** %s24, align 8, !dbg !200
  %s25 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !201
  %4 = load i8*, i8** %s25, align 8, !dbg !201
  %idx.ext = sext i32 %from.addr.0 to i64, !dbg !202
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext, !dbg !202
  %len26 = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 0, !dbg !203
  %5 = load i64, i64* %len26, align 8, !dbg !203
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %add.ptr, i64 %5, i1 false), !dbg !204
  br label %return, !dbg !205

return:                                           ; preds = %if.end19, %if.then13
  %retval.0 = phi %struct.str_t* [ null, %if.then13 ], [ %call, %if.end19 ], !dbg !164
  ret %struct.str_t* %retval.0, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_cat(%struct.str_t* %s, %struct.str_t* %s2) #0 !dbg !207 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %s, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata %struct.str_t* %s2, metadata !212, metadata !DIExpression()), !dbg !211
  br label %while.cond, !dbg !213

while.cond:                                       ; preds = %while.body, %entry
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 1, !dbg !214
  %0 = load i64, i64* %alloc, align 8, !dbg !214
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !215
  %1 = load i64, i64* %len, align 8, !dbg !215
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %s2, i32 0, i32 0, !dbg !216
  %2 = load i64, i64* %len1, align 8, !dbg !216
  %add = add i64 %1, %2, !dbg !217
  %cmp = icmp ult i64 %0, %add, !dbg !218
  br i1 %cmp, label %while.body, label %while.end, !dbg !213

while.body:                                       ; preds = %while.cond
  call void @str_extend(%struct.str_t* %s), !dbg !219
  br label %while.cond, !dbg !213, !llvm.loop !220

while.end:                                        ; preds = %while.cond
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 2, !dbg !222
  %3 = load i8*, i8** %s3, align 8, !dbg !222
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !223
  %4 = load i64, i64* %len4, align 8, !dbg !223
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !224
  %s5 = getelementptr inbounds %struct.str_t, %struct.str_t* %s2, i32 0, i32 2, !dbg !225
  %5 = load i8*, i8** %s5, align 8, !dbg !225
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %s2, i32 0, i32 0, !dbg !226
  %6 = load i64, i64* %len6, align 8, !dbg !226
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %5, i64 %6, i1 false), !dbg !227
  %len7 = getelementptr inbounds %struct.str_t, %struct.str_t* %s2, i32 0, i32 0, !dbg !228
  %7 = load i64, i64* %len7, align 8, !dbg !228
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %s, i32 0, i32 0, !dbg !229
  %8 = load i64, i64* %len8, align 8, !dbg !230
  %add9 = add i64 %8, %7, !dbg !230
  store i64 %add9, i64* %len8, align 8, !dbg !230
  ret %struct.str_t* %s, !dbg !231
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_swap(%struct.str_t* %a, %struct.str_t* %b) #0 !dbg !232 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %a, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.value(metadata %struct.str_t* %b, metadata !237, metadata !DIExpression()), !dbg !236
  %alloc = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 1, !dbg !238
  %0 = load i64, i64* %alloc, align 8, !dbg !238
  call void @llvm.dbg.value(metadata i64 %0, metadata !239, metadata !DIExpression()), !dbg !236
  %alloc1 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 1, !dbg !240
  %1 = load i64, i64* %alloc1, align 8, !dbg !240
  %alloc2 = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 1, !dbg !241
  store i64 %1, i64* %alloc2, align 8, !dbg !242
  %alloc3 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 1, !dbg !243
  store i64 %0, i64* %alloc3, align 8, !dbg !244
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 0, !dbg !245
  %2 = load i64, i64* %len, align 8, !dbg !245
  call void @llvm.dbg.value(metadata i64 %2, metadata !239, metadata !DIExpression()), !dbg !236
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 0, !dbg !246
  %3 = load i64, i64* %len4, align 8, !dbg !246
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 0, !dbg !247
  store i64 %3, i64* %len5, align 8, !dbg !248
  %len6 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 0, !dbg !249
  store i64 %2, i64* %len6, align 8, !dbg !250
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 2, !dbg !251
  %4 = load i8*, i8** %s, align 8, !dbg !251
  call void @llvm.dbg.value(metadata i8* %4, metadata !252, metadata !DIExpression()), !dbg !236
  %s7 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 2, !dbg !253
  %5 = load i8*, i8** %s7, align 8, !dbg !253
  %s8 = getelementptr inbounds %struct.str_t, %struct.str_t* %a, i32 0, i32 2, !dbg !254
  store i8* %5, i8** %s8, align 8, !dbg !255
  %s9 = getelementptr inbounds %struct.str_t, %struct.str_t* %b, i32 0, i32 2, !dbg !256
  store i8* %4, i8** %s9, align 8, !dbg !257
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.str_t* @str_subst(%struct.str_t* %tgt, %struct.str_t* %pat, %struct.str_t* %repl) #0 !dbg !259 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %tgt, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.value(metadata %struct.str_t* %pat, metadata !264, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.value(metadata %struct.str_t* %repl, metadata !265, metadata !DIExpression()), !dbg !263
  %call = call %struct.str_t* @str_new(i64 0), !dbg !266
  call void @llvm.dbg.value(metadata %struct.str_t* %call, metadata !267, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.value(metadata i32 0, metadata !268, metadata !DIExpression()), !dbg !263
  br label %for.cond, !dbg !269

for.cond:                                         ; preds = %if.end19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %i.2, %if.end19 ], !dbg !271
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !268, metadata !DIExpression()), !dbg !263
  %conv = sext i32 %i.0 to i64, !dbg !272
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %pat, i32 0, i32 0, !dbg !274
  %0 = load i64, i64* %len, align 8, !dbg !274
  %add = add i64 %conv, %0, !dbg !275
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 0, !dbg !276
  %1 = load i64, i64* %len1, align 8, !dbg !276
  %cmp = icmp ule i64 %add, %1, !dbg !277
  br i1 %cmp, label %for.body, label %for.end, !dbg !278

for.body:                                         ; preds = %for.cond
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 2, !dbg !279
  %2 = load i8*, i8** %s, align 8, !dbg !279
  %idx.ext = sext i32 %i.0 to i64, !dbg !282
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !282
  %s3 = getelementptr inbounds %struct.str_t, %struct.str_t* %pat, i32 0, i32 2, !dbg !283
  %3 = load i8*, i8** %s3, align 8, !dbg !283
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %pat, i32 0, i32 0, !dbg !284
  %4 = load i64, i64* %len4, align 8, !dbg !284
  %call5 = call i32 @memcmp(i8* %add.ptr, i8* %3, i64 %4) #7, !dbg !285
  %tobool = icmp ne i32 %call5, 0, !dbg !285
  br i1 %tobool, label %if.then, label %if.else, !dbg !286

if.then:                                          ; preds = %for.body
  %s6 = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 2, !dbg !287
  %5 = load i8*, i8** %s6, align 8, !dbg !287
  %idxprom = sext i32 %i.0 to i64, !dbg !289
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !289
  %6 = load i8, i8* %arrayidx, align 1, !dbg !289
  call void @str_append(%struct.str_t* %call, i8 zeroext %6), !dbg !290
  %inc = add nsw i32 %i.0, 1, !dbg !291
  call void @llvm.dbg.value(metadata i32 %inc, metadata !268, metadata !DIExpression()), !dbg !263
  br label %if.end19, !dbg !292

if.else:                                          ; preds = %for.body
  %call7 = call %struct.str_t* @str_cat(%struct.str_t* %call, %struct.str_t* %repl), !dbg !293
  %len8 = getelementptr inbounds %struct.str_t, %struct.str_t* %pat, i32 0, i32 0, !dbg !295
  %7 = load i64, i64* %len8, align 8, !dbg !295
  %conv9 = sext i32 %i.0 to i64, !dbg !296
  %add10 = add i64 %conv9, %7, !dbg !296
  %conv11 = trunc i64 %add10 to i32, !dbg !296
  call void @llvm.dbg.value(metadata i32 %conv11, metadata !268, metadata !DIExpression()), !dbg !263
  %len12 = getelementptr inbounds %struct.str_t, %struct.str_t* %pat, i32 0, i32 0, !dbg !297
  %8 = load i64, i64* %len12, align 8, !dbg !297
  %tobool13 = icmp ne i64 %8, 0, !dbg !299
  br i1 %tobool13, label %if.end, label %if.then14, !dbg !300

if.then14:                                        ; preds = %if.else
  %s15 = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 2, !dbg !301
  %9 = load i8*, i8** %s15, align 8, !dbg !301
  %inc16 = add nsw i32 %conv11, 1, !dbg !302
  call void @llvm.dbg.value(metadata i32 %inc16, metadata !268, metadata !DIExpression()), !dbg !263
  %idxprom17 = sext i32 %conv11 to i64, !dbg !303
  %arrayidx18 = getelementptr inbounds i8, i8* %9, i64 %idxprom17, !dbg !303
  %10 = load i8, i8* %arrayidx18, align 1, !dbg !303
  call void @str_append(%struct.str_t* %call, i8 zeroext %10), !dbg !304
  br label %if.end, !dbg !304

if.end:                                           ; preds = %if.then14, %if.else
  %i.1 = phi i32 [ %conv11, %if.else ], [ %inc16, %if.then14 ], !dbg !305
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !268, metadata !DIExpression()), !dbg !263
  br label %if.end19

if.end19:                                         ; preds = %if.end, %if.then
  %i.2 = phi i32 [ %inc, %if.then ], [ %i.1, %if.end ], !dbg !306
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !268, metadata !DIExpression()), !dbg !263
  br label %for.cond, !dbg !307, !llvm.loop !308

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !310

while.cond:                                       ; preds = %while.body, %for.end
  %i.3 = phi i32 [ %i.0, %for.end ], [ %inc25, %while.body ], !dbg !263
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !268, metadata !DIExpression()), !dbg !263
  %conv20 = sext i32 %i.3 to i64, !dbg !311
  %len21 = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 0, !dbg !312
  %11 = load i64, i64* %len21, align 8, !dbg !312
  %cmp22 = icmp ult i64 %conv20, %11, !dbg !313
  br i1 %cmp22, label %while.body, label %while.end, !dbg !310

while.body:                                       ; preds = %while.cond
  %s24 = getelementptr inbounds %struct.str_t, %struct.str_t* %tgt, i32 0, i32 2, !dbg !314
  %12 = load i8*, i8** %s24, align 8, !dbg !314
  %inc25 = add nsw i32 %i.3, 1, !dbg !315
  call void @llvm.dbg.value(metadata i32 %inc25, metadata !268, metadata !DIExpression()), !dbg !263
  %idxprom26 = sext i32 %i.3 to i64, !dbg !316
  %arrayidx27 = getelementptr inbounds i8, i8* %12, i64 %idxprom26, !dbg !316
  %13 = load i8, i8* %arrayidx27, align 1, !dbg !316
  call void @str_append(%struct.str_t* %call, i8 zeroext %13), !dbg !317
  br label %while.cond, !dbg !310, !llvm.loop !318

while.end:                                        ; preds = %while.cond
  call void @str_swap(%struct.str_t* %call, %struct.str_t* %tgt), !dbg !320
  call void @str_del(%struct.str_t* %call), !dbg !321
  ret %struct.str_t* %tgt, !dbg !322
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_set(%struct.str_t* %dest, %struct.str_t* %src) #0 !dbg !323 {
entry:
  call void @llvm.dbg.value(metadata %struct.str_t* %dest, metadata !324, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.value(metadata %struct.str_t* %src, metadata !326, metadata !DIExpression()), !dbg !325
  br label %while.cond, !dbg !327

while.cond:                                       ; preds = %while.body, %entry
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %dest, i32 0, i32 0, !dbg !328
  %0 = load i64, i64* %len, align 8, !dbg !328
  %len1 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !329
  %1 = load i64, i64* %len1, align 8, !dbg !329
  %cmp = icmp ult i64 %0, %1, !dbg !330
  br i1 %cmp, label %while.body, label %while.end, !dbg !327

while.body:                                       ; preds = %while.cond
  call void @str_extend(%struct.str_t* %dest), !dbg !331
  br label %while.cond, !dbg !327, !llvm.loop !332

while.end:                                        ; preds = %while.cond
  %s = getelementptr inbounds %struct.str_t, %struct.str_t* %dest, i32 0, i32 2, !dbg !334
  %2 = load i8*, i8** %s, align 8, !dbg !334
  %s2 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 2, !dbg !335
  %3 = load i8*, i8** %s2, align 8, !dbg !335
  %len3 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !336
  %4 = load i64, i64* %len3, align 8, !dbg !336
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %3, i64 %4, i1 false), !dbg !337
  %len4 = getelementptr inbounds %struct.str_t, %struct.str_t* %src, i32 0, i32 0, !dbg !338
  %5 = load i64, i64* %len4, align 8, !dbg !338
  %len5 = getelementptr inbounds %struct.str_t, %struct.str_t* %dest, i32 0, i32 0, !dbg !339
  store i64 %5, i64* %len5, align 8, !dbg !340
  ret void, !dbg !341
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !342 {
entry:
  %call = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !345
  call void @llvm.dbg.value(metadata %struct.str_t* %call, metadata !346, metadata !DIExpression()), !dbg !347
  %call1 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !348
  call void @llvm.dbg.value(metadata %struct.str_t* %call1, metadata !349, metadata !DIExpression()), !dbg !347
  %call2 = call %struct.str_t* @str_from_chars(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0)), !dbg !350
  call void @llvm.dbg.value(metadata %struct.str_t* %call2, metadata !351, metadata !DIExpression()), !dbg !347
  %call3 = call %struct.str_t* @str_subst(%struct.str_t* %call, %struct.str_t* %call2, %struct.str_t* %call1), !dbg !352
  %len = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 0, !dbg !353
  %0 = load i64, i64* %len, align 8, !dbg !353
  %s4 = getelementptr inbounds %struct.str_t, %struct.str_t* %call, i32 0, i32 2, !dbg !354
  %1 = load i8*, i8** %s4, align 8, !dbg !354
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 %0, i8* %1), !dbg !355
  call void @str_del(%struct.str_t* %call), !dbg !356
  call void @str_del(%struct.str_t* %call1), !dbg !357
  call void @str_del(%struct.str_t* %call2), !dbg !358
  ret i32 0, !dbg !359
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!23 = !DILocation(line: 0, scope: !7)
!24 = !DILocation(line: 13, column: 11, scope: !7)
!25 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 13, type: !10)
!26 = !DILocation(line: 14, column: 10, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 6)
!28 = !DILocation(line: 14, column: 6, scope: !7)
!29 = !DILocation(line: 14, column: 15, scope: !27)
!30 = !DILocation(line: 15, column: 5, scope: !7)
!31 = !DILocation(line: 15, column: 11, scope: !7)
!32 = !DILocation(line: 16, column: 9, scope: !7)
!33 = !DILocation(line: 16, column: 5, scope: !7)
!34 = !DILocation(line: 16, column: 7, scope: !7)
!35 = !DILocation(line: 17, column: 5, scope: !7)
!36 = !DILocation(line: 17, column: 9, scope: !7)
!37 = !DILocation(line: 18, column: 2, scope: !7)
!38 = distinct !DISubprogram(name: "str_extend", scope: !1, file: !1, line: 21, type: !39, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !10}
!41 = !DILocalVariable(name: "s", arg: 1, scope: !38, file: !1, line: 21, type: !10)
!42 = !DILocation(line: 0, scope: !38)
!43 = !DILocation(line: 23, column: 17, scope: !38)
!44 = !DILocation(line: 23, column: 23, scope: !38)
!45 = !DILocalVariable(name: "ns", scope: !38, file: !1, line: 23, type: !15)
!46 = !DILocation(line: 24, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !1, line: 24, column: 6)
!48 = !DILocation(line: 24, column: 9, scope: !47)
!49 = !DILocation(line: 24, column: 20, scope: !47)
!50 = !DILocation(line: 24, column: 6, scope: !38)
!51 = !DILocation(line: 24, column: 36, scope: !47)
!52 = !DILocation(line: 24, column: 42, scope: !47)
!53 = !DILocation(line: 24, column: 28, scope: !47)
!54 = !DILocation(line: 25, column: 20, scope: !38)
!55 = !DILocation(line: 25, column: 9, scope: !38)
!56 = !DILocation(line: 25, column: 5, scope: !38)
!57 = !DILocation(line: 25, column: 7, scope: !38)
!58 = !DILocation(line: 26, column: 5, scope: !38)
!59 = !DILocation(line: 26, column: 11, scope: !38)
!60 = !DILocation(line: 27, column: 1, scope: !38)
!61 = distinct !DISubprogram(name: "str_del", scope: !1, file: !1, line: 29, type: !39, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "s", arg: 1, scope: !61, file: !1, line: 29, type: !10)
!63 = !DILocation(line: 0, scope: !61)
!64 = !DILocation(line: 31, column: 10, scope: !61)
!65 = !DILocation(line: 31, column: 2, scope: !61)
!66 = !DILocation(line: 31, column: 19, scope: !61)
!67 = !DILocation(line: 31, column: 14, scope: !61)
!68 = !DILocation(line: 32, column: 1, scope: !61)
!69 = distinct !DISubprogram(name: "str_cmp", scope: !1, file: !1, line: 34, type: !70, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !10, !10}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DILocalVariable(name: "l", arg: 1, scope: !69, file: !1, line: 34, type: !10)
!74 = !DILocation(line: 0, scope: !69)
!75 = !DILocalVariable(name: "r", arg: 2, scope: !69, file: !1, line: 34, type: !10)
!76 = !DILocation(line: 36, column: 20, scope: !69)
!77 = !DILocation(line: 36, column: 17, scope: !69)
!78 = !DILocalVariable(name: "len", scope: !69, file: !1, line: 36, type: !72)
!79 = !DILocation(line: 37, column: 6, scope: !80)
!80 = distinct !DILexicalBlock(scope: !69, file: !1, line: 37, column: 6)
!81 = !DILocation(line: 37, column: 15, scope: !80)
!82 = !DILocation(line: 37, column: 10, scope: !80)
!83 = !DILocation(line: 37, column: 6, scope: !69)
!84 = !DILocation(line: 37, column: 29, scope: !80)
!85 = !DILocation(line: 37, column: 26, scope: !80)
!86 = !DILocation(line: 37, column: 20, scope: !80)
!87 = !DILocation(line: 39, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !69, file: !1, line: 39, column: 6)
!89 = !DILocation(line: 39, column: 29, scope: !88)
!90 = !DILocation(line: 39, column: 32, scope: !88)
!91 = !DILocation(line: 39, column: 13, scope: !88)
!92 = !DILocalVariable(name: "res", scope: !69, file: !1, line: 36, type: !72)
!93 = !DILocation(line: 39, column: 11, scope: !88)
!94 = !DILocation(line: 39, column: 6, scope: !69)
!95 = !DILocation(line: 39, column: 39, scope: !88)
!96 = !DILocation(line: 40, column: 12, scope: !69)
!97 = !DILocation(line: 40, column: 21, scope: !69)
!98 = !DILocation(line: 40, column: 16, scope: !69)
!99 = !DILocation(line: 40, column: 9, scope: !69)
!100 = !DILocation(line: 40, column: 2, scope: !69)
!101 = !DILocation(line: 41, column: 1, scope: !69)
!102 = distinct !DISubprogram(name: "str_dup", scope: !1, file: !1, line: 43, type: !103, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!10, !10}
!105 = !DILocalVariable(name: "src", arg: 1, scope: !102, file: !1, line: 43, type: !10)
!106 = !DILocation(line: 0, scope: !102)
!107 = !DILocation(line: 45, column: 24, scope: !102)
!108 = !DILocation(line: 45, column: 11, scope: !102)
!109 = !DILocalVariable(name: "x", scope: !102, file: !1, line: 45, type: !10)
!110 = !DILocation(line: 46, column: 12, scope: !102)
!111 = !DILocation(line: 46, column: 20, scope: !102)
!112 = !DILocation(line: 46, column: 28, scope: !102)
!113 = !DILocation(line: 46, column: 2, scope: !102)
!114 = !DILocation(line: 47, column: 16, scope: !102)
!115 = !DILocation(line: 47, column: 5, scope: !102)
!116 = !DILocation(line: 47, column: 9, scope: !102)
!117 = !DILocation(line: 48, column: 2, scope: !102)
!118 = distinct !DISubprogram(name: "str_from_chars", scope: !1, file: !1, line: 51, type: !119, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{!10, !121}
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !123)
!123 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!124 = !DILocalVariable(name: "t", arg: 1, scope: !118, file: !1, line: 51, type: !121)
!125 = !DILocation(line: 0, scope: !118)
!126 = !DILocation(line: 53, column: 7, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !1, line: 53, column: 6)
!128 = !DILocation(line: 53, column: 6, scope: !118)
!129 = !DILocation(line: 53, column: 17, scope: !127)
!130 = !DILocation(line: 53, column: 10, scope: !127)
!131 = !DILocation(line: 54, column: 13, scope: !118)
!132 = !DILocalVariable(name: "l", scope: !118, file: !1, line: 54, type: !15)
!133 = !DILocation(line: 55, column: 21, scope: !118)
!134 = !DILocation(line: 55, column: 11, scope: !118)
!135 = !DILocalVariable(name: "x", scope: !118, file: !1, line: 55, type: !10)
!136 = !DILocation(line: 56, column: 5, scope: !118)
!137 = !DILocation(line: 56, column: 9, scope: !118)
!138 = !DILocation(line: 57, column: 12, scope: !118)
!139 = !DILocation(line: 57, column: 2, scope: !118)
!140 = !DILocation(line: 58, column: 2, scope: !118)
!141 = !DILocation(line: 59, column: 1, scope: !118)
!142 = distinct !DISubprogram(name: "str_append", scope: !1, file: !1, line: 61, type: !143, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !10, !21}
!145 = !DILocalVariable(name: "s", arg: 1, scope: !142, file: !1, line: 61, type: !10)
!146 = !DILocation(line: 0, scope: !142)
!147 = !DILocalVariable(name: "b", arg: 2, scope: !142, file: !1, line: 61, type: !21)
!148 = !DILocation(line: 63, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !1, line: 63, column: 6)
!150 = !DILocation(line: 63, column: 19, scope: !149)
!151 = !DILocation(line: 63, column: 13, scope: !149)
!152 = !DILocation(line: 63, column: 6, scope: !142)
!153 = !DILocation(line: 63, column: 26, scope: !149)
!154 = !DILocation(line: 64, column: 5, scope: !142)
!155 = !DILocation(line: 64, column: 10, scope: !142)
!156 = !DILocation(line: 64, column: 13, scope: !142)
!157 = !DILocation(line: 64, column: 2, scope: !142)
!158 = !DILocation(line: 64, column: 17, scope: !142)
!159 = !DILocation(line: 65, column: 1, scope: !142)
!160 = distinct !DISubprogram(name: "str_substr", scope: !1, file: !1, line: 67, type: !161, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DISubroutineType(types: !162)
!162 = !{!10, !10, !72, !72}
!163 = !DILocalVariable(name: "s", arg: 1, scope: !160, file: !1, line: 67, type: !10)
!164 = !DILocation(line: 0, scope: !160)
!165 = !DILocalVariable(name: "from", arg: 2, scope: !160, file: !1, line: 67, type: !72)
!166 = !DILocalVariable(name: "to", arg: 3, scope: !160, file: !1, line: 67, type: !72)
!167 = !DILocation(line: 69, column: 7, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !1, line: 69, column: 6)
!169 = !DILocation(line: 69, column: 6, scope: !160)
!170 = !DILocation(line: 69, column: 19, scope: !168)
!171 = !DILocation(line: 69, column: 16, scope: !168)
!172 = !DILocation(line: 69, column: 11, scope: !168)
!173 = !DILocation(line: 70, column: 11, scope: !174)
!174 = distinct !DILexicalBlock(scope: !160, file: !1, line: 70, column: 6)
!175 = !DILocation(line: 70, column: 6, scope: !160)
!176 = !DILocation(line: 70, column: 27, scope: !174)
!177 = !DILocation(line: 70, column: 21, scope: !174)
!178 = !DILocation(line: 70, column: 16, scope: !174)
!179 = !DILocation(line: 71, column: 11, scope: !180)
!180 = distinct !DILexicalBlock(scope: !160, file: !1, line: 71, column: 6)
!181 = !DILocation(line: 71, column: 15, scope: !180)
!182 = !DILocation(line: 71, column: 18, scope: !180)
!183 = !DILocation(line: 71, column: 29, scope: !180)
!184 = !DILocation(line: 71, column: 23, scope: !180)
!185 = !DILocation(line: 71, column: 6, scope: !160)
!186 = !DILocation(line: 72, column: 3, scope: !180)
!187 = !DILocation(line: 73, column: 9, scope: !188)
!188 = distinct !DILexicalBlock(scope: !160, file: !1, line: 73, column: 6)
!189 = !DILocation(line: 73, column: 6, scope: !160)
!190 = !DILocation(line: 73, column: 27, scope: !188)
!191 = !DILocation(line: 73, column: 17, scope: !188)
!192 = !DILocation(line: 74, column: 22, scope: !160)
!193 = !DILocation(line: 74, column: 19, scope: !160)
!194 = !DILocation(line: 74, column: 11, scope: !160)
!195 = !DILocalVariable(name: "x", scope: !160, file: !1, line: 74, type: !10)
!196 = !DILocation(line: 75, column: 14, scope: !160)
!197 = !DILocation(line: 75, column: 11, scope: !160)
!198 = !DILocation(line: 75, column: 5, scope: !160)
!199 = !DILocation(line: 75, column: 9, scope: !160)
!200 = !DILocation(line: 76, column: 12, scope: !160)
!201 = !DILocation(line: 76, column: 18, scope: !160)
!202 = !DILocation(line: 76, column: 20, scope: !160)
!203 = !DILocation(line: 76, column: 31, scope: !160)
!204 = !DILocation(line: 76, column: 2, scope: !160)
!205 = !DILocation(line: 77, column: 2, scope: !160)
!206 = !DILocation(line: 78, column: 1, scope: !160)
!207 = distinct !DISubprogram(name: "str_cat", scope: !1, file: !1, line: 80, type: !208, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!208 = !DISubroutineType(types: !209)
!209 = !{!10, !10, !10}
!210 = !DILocalVariable(name: "s", arg: 1, scope: !207, file: !1, line: 80, type: !10)
!211 = !DILocation(line: 0, scope: !207)
!212 = !DILocalVariable(name: "s2", arg: 2, scope: !207, file: !1, line: 80, type: !10)
!213 = !DILocation(line: 82, column: 2, scope: !207)
!214 = !DILocation(line: 82, column: 12, scope: !207)
!215 = !DILocation(line: 82, column: 23, scope: !207)
!216 = !DILocation(line: 82, column: 33, scope: !207)
!217 = !DILocation(line: 82, column: 27, scope: !207)
!218 = !DILocation(line: 82, column: 18, scope: !207)
!219 = !DILocation(line: 82, column: 38, scope: !207)
!220 = distinct !{!220, !213, !221}
!221 = !DILocation(line: 82, column: 50, scope: !207)
!222 = !DILocation(line: 83, column: 12, scope: !207)
!223 = !DILocation(line: 83, column: 19, scope: !207)
!224 = !DILocation(line: 83, column: 14, scope: !207)
!225 = !DILocation(line: 83, column: 28, scope: !207)
!226 = !DILocation(line: 83, column: 35, scope: !207)
!227 = !DILocation(line: 83, column: 2, scope: !207)
!228 = !DILocation(line: 84, column: 16, scope: !207)
!229 = !DILocation(line: 84, column: 5, scope: !207)
!230 = !DILocation(line: 84, column: 9, scope: !207)
!231 = !DILocation(line: 85, column: 2, scope: !207)
!232 = distinct !DISubprogram(name: "str_swap", scope: !1, file: !1, line: 88, type: !233, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !10, !10}
!235 = !DILocalVariable(name: "a", arg: 1, scope: !232, file: !1, line: 88, type: !10)
!236 = !DILocation(line: 0, scope: !232)
!237 = !DILocalVariable(name: "b", arg: 2, scope: !232, file: !1, line: 88, type: !10)
!238 = !DILocation(line: 92, column: 10, scope: !232)
!239 = !DILocalVariable(name: "tz", scope: !232, file: !1, line: 90, type: !15)
!240 = !DILocation(line: 92, column: 31, scope: !232)
!241 = !DILocation(line: 92, column: 20, scope: !232)
!242 = !DILocation(line: 92, column: 26, scope: !232)
!243 = !DILocation(line: 92, column: 41, scope: !232)
!244 = !DILocation(line: 92, column: 47, scope: !232)
!245 = !DILocation(line: 93, column: 10, scope: !232)
!246 = !DILocation(line: 93, column: 27, scope: !232)
!247 = !DILocation(line: 93, column: 18, scope: !232)
!248 = !DILocation(line: 93, column: 22, scope: !232)
!249 = !DILocation(line: 93, column: 35, scope: !232)
!250 = !DILocation(line: 93, column: 39, scope: !232)
!251 = !DILocation(line: 94, column: 10, scope: !232)
!252 = !DILocalVariable(name: "ts", scope: !232, file: !1, line: 91, type: !20)
!253 = !DILocation(line: 94, column: 23, scope: !232)
!254 = !DILocation(line: 94, column: 16, scope: !232)
!255 = !DILocation(line: 94, column: 18, scope: !232)
!256 = !DILocation(line: 94, column: 29, scope: !232)
!257 = !DILocation(line: 94, column: 31, scope: !232)
!258 = !DILocation(line: 95, column: 1, scope: !232)
!259 = distinct !DISubprogram(name: "str_subst", scope: !1, file: !1, line: 97, type: !260, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!260 = !DISubroutineType(types: !261)
!261 = !{!10, !10, !10, !10}
!262 = !DILocalVariable(name: "tgt", arg: 1, scope: !259, file: !1, line: 97, type: !10)
!263 = !DILocation(line: 0, scope: !259)
!264 = !DILocalVariable(name: "pat", arg: 2, scope: !259, file: !1, line: 97, type: !10)
!265 = !DILocalVariable(name: "repl", arg: 3, scope: !259, file: !1, line: 97, type: !10)
!266 = !DILocation(line: 99, column: 13, scope: !259)
!267 = !DILocalVariable(name: "tmp", scope: !259, file: !1, line: 99, type: !10)
!268 = !DILocalVariable(name: "i", scope: !259, file: !1, line: 100, type: !72)
!269 = !DILocation(line: 101, column: 7, scope: !270)
!270 = distinct !DILexicalBlock(scope: !259, file: !1, line: 101, column: 2)
!271 = !DILocation(line: 0, scope: !270)
!272 = !DILocation(line: 101, column: 14, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !1, line: 101, column: 2)
!274 = !DILocation(line: 101, column: 23, scope: !273)
!275 = !DILocation(line: 101, column: 16, scope: !273)
!276 = !DILocation(line: 101, column: 35, scope: !273)
!277 = !DILocation(line: 101, column: 27, scope: !273)
!278 = !DILocation(line: 101, column: 2, scope: !270)
!279 = !DILocation(line: 102, column: 19, scope: !280)
!280 = distinct !DILexicalBlock(scope: !281, file: !1, line: 102, column: 7)
!281 = distinct !DILexicalBlock(scope: !273, file: !1, line: 101, column: 41)
!282 = !DILocation(line: 102, column: 21, scope: !280)
!283 = !DILocation(line: 102, column: 31, scope: !280)
!284 = !DILocation(line: 102, column: 39, scope: !280)
!285 = !DILocation(line: 102, column: 7, scope: !280)
!286 = !DILocation(line: 102, column: 7, scope: !281)
!287 = !DILocation(line: 103, column: 25, scope: !288)
!288 = distinct !DILexicalBlock(scope: !280, file: !1, line: 102, column: 45)
!289 = !DILocation(line: 103, column: 20, scope: !288)
!290 = !DILocation(line: 103, column: 4, scope: !288)
!291 = !DILocation(line: 104, column: 5, scope: !288)
!292 = !DILocation(line: 105, column: 3, scope: !288)
!293 = !DILocation(line: 106, column: 4, scope: !294)
!294 = distinct !DILexicalBlock(scope: !280, file: !1, line: 105, column: 10)
!295 = !DILocation(line: 107, column: 14, scope: !294)
!296 = !DILocation(line: 107, column: 6, scope: !294)
!297 = !DILocation(line: 108, column: 14, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !1, line: 108, column: 8)
!299 = !DILocation(line: 108, column: 9, scope: !298)
!300 = !DILocation(line: 108, column: 8, scope: !294)
!301 = !DILocation(line: 108, column: 40, scope: !298)
!302 = !DILocation(line: 108, column: 43, scope: !298)
!303 = !DILocation(line: 108, column: 35, scope: !298)
!304 = !DILocation(line: 108, column: 19, scope: !298)
!305 = !DILocation(line: 0, scope: !294)
!306 = !DILocation(line: 0, scope: !280)
!307 = !DILocation(line: 101, column: 2, scope: !273)
!308 = distinct !{!308, !278, !309}
!309 = !DILocation(line: 110, column: 2, scope: !270)
!310 = !DILocation(line: 111, column: 2, scope: !259)
!311 = !DILocation(line: 111, column: 9, scope: !259)
!312 = !DILocation(line: 111, column: 18, scope: !259)
!313 = !DILocation(line: 111, column: 11, scope: !259)
!314 = !DILocation(line: 111, column: 44, scope: !259)
!315 = !DILocation(line: 111, column: 47, scope: !259)
!316 = !DILocation(line: 111, column: 39, scope: !259)
!317 = !DILocation(line: 111, column: 23, scope: !259)
!318 = distinct !{!318, !310, !319}
!319 = !DILocation(line: 111, column: 50, scope: !259)
!320 = !DILocation(line: 112, column: 2, scope: !259)
!321 = !DILocation(line: 113, column: 2, scope: !259)
!322 = !DILocation(line: 114, column: 2, scope: !259)
!323 = distinct !DISubprogram(name: "str_set", scope: !1, file: !1, line: 117, type: !233, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!324 = !DILocalVariable(name: "dest", arg: 1, scope: !323, file: !1, line: 117, type: !10)
!325 = !DILocation(line: 0, scope: !323)
!326 = !DILocalVariable(name: "src", arg: 2, scope: !323, file: !1, line: 117, type: !10)
!327 = !DILocation(line: 119, column: 2, scope: !323)
!328 = !DILocation(line: 119, column: 15, scope: !323)
!329 = !DILocation(line: 119, column: 26, scope: !323)
!330 = !DILocation(line: 119, column: 19, scope: !323)
!331 = !DILocation(line: 119, column: 31, scope: !323)
!332 = distinct !{!332, !327, !333}
!333 = !DILocation(line: 119, column: 46, scope: !323)
!334 = !DILocation(line: 120, column: 15, scope: !323)
!335 = !DILocation(line: 120, column: 23, scope: !323)
!336 = !DILocation(line: 120, column: 31, scope: !323)
!337 = !DILocation(line: 120, column: 2, scope: !323)
!338 = !DILocation(line: 121, column: 19, scope: !323)
!339 = !DILocation(line: 121, column: 8, scope: !323)
!340 = !DILocation(line: 121, column: 12, scope: !323)
!341 = !DILocation(line: 122, column: 1, scope: !323)
!342 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 124, type: !343, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!343 = !DISubroutineType(types: !344)
!344 = !{!72}
!345 = !DILocation(line: 126, column: 11, scope: !342)
!346 = !DILocalVariable(name: "s", scope: !342, file: !1, line: 126, type: !10)
!347 = !DILocation(line: 0, scope: !342)
!348 = !DILocation(line: 127, column: 12, scope: !342)
!349 = !DILocalVariable(name: "s2", scope: !342, file: !1, line: 127, type: !10)
!350 = !DILocation(line: 128, column: 12, scope: !342)
!351 = !DILocalVariable(name: "s3", scope: !342, file: !1, line: 128, type: !10)
!352 = !DILocation(line: 130, column: 2, scope: !342)
!353 = !DILocation(line: 131, column: 22, scope: !342)
!354 = !DILocation(line: 131, column: 30, scope: !342)
!355 = !DILocation(line: 131, column: 2, scope: !342)
!356 = !DILocation(line: 133, column: 2, scope: !342)
!357 = !DILocation(line: 134, column: 2, scope: !342)
!358 = !DILocation(line: 135, column: 2, scope: !342)
!359 = !DILocation(line: 137, column: 2, scope: !342)
