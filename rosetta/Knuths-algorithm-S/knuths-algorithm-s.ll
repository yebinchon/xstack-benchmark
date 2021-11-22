; ModuleID = 'knuths-algorithm-s.c'
source_filename = "knuths-algorithm-s.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s_env = type { i32, i32, i64, i8* }

@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @s_of_n_init(%struct.s_env* %s_env, i64 %size, i32 %n) #0 !dbg !11 {
entry:
  %s_env.addr = alloca %struct.s_env*, align 8
  %size.addr = alloca i64, align 8
  %n.addr = alloca i32, align 4
  store %struct.s_env* %s_env, %struct.s_env** %s_env.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.s_env** %s_env.addr, metadata !25, metadata !DIExpression()), !dbg !26
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !31
  %i = getelementptr inbounds %struct.s_env, %struct.s_env* %0, i32 0, i32 1, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  %1 = load i32, i32* %n.addr, align 4, !dbg !34
  %2 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !35
  %n1 = getelementptr inbounds %struct.s_env, %struct.s_env* %2, i32 0, i32 0, !dbg !36
  store i32 %1, i32* %n1, align 8, !dbg !37
  %3 = load i64, i64* %size.addr, align 8, !dbg !38
  %4 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !39
  %size2 = getelementptr inbounds %struct.s_env, %struct.s_env* %4, i32 0, i32 2, !dbg !40
  store i64 %3, i64* %size2, align 8, !dbg !41
  %5 = load i32, i32* %n.addr, align 4, !dbg !42
  %conv = zext i32 %5 to i64, !dbg !42
  %6 = load i64, i64* %size.addr, align 8, !dbg !43
  %mul = mul i64 %conv, %6, !dbg !44
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !45
  %7 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !46
  %sample = getelementptr inbounds %struct.s_env, %struct.s_env* %7, i32 0, i32 3, !dbg !47
  store i8* %call, i8** %sample, align 8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @sample_set_i(%struct.s_env* %s_env, i32 %i, i8* %item) #0 !dbg !50 {
entry:
  %s_env.addr = alloca %struct.s_env*, align 8
  %i.addr = alloca i32, align 4
  %item.addr = alloca i8*, align 8
  store %struct.s_env* %s_env, %struct.s_env** %s_env.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.s_env** %s_env.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8* %item, i8** %item.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %item.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !59
  %sample = getelementptr inbounds %struct.s_env, %struct.s_env* %0, i32 0, i32 3, !dbg !60
  %1 = load i8*, i8** %sample, align 8, !dbg !60
  %2 = load i32, i32* %i.addr, align 4, !dbg !61
  %conv = zext i32 %2 to i64, !dbg !61
  %3 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !62
  %size = getelementptr inbounds %struct.s_env, %struct.s_env* %3, i32 0, i32 2, !dbg !63
  %4 = load i64, i64* %size, align 8, !dbg !63
  %mul = mul i64 %conv, %4, !dbg !64
  %add.ptr = getelementptr i8, i8* %1, i64 %mul, !dbg !65
  %5 = load i8*, i8** %item.addr, align 8, !dbg !66
  %6 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !67
  %size1 = getelementptr inbounds %struct.s_env, %struct.s_env* %6, i32 0, i32 2, !dbg !68
  %7 = load i64, i64* %size1, align 8, !dbg !68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %5, i64 %7, i1 false), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @s_of_n(%struct.s_env* %s_env, i8* %item) #0 !dbg !71 {
entry:
  %s_env.addr = alloca %struct.s_env*, align 8
  %item.addr = alloca i8*, align 8
  store %struct.s_env* %s_env, %struct.s_env** %s_env.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.s_env** %s_env.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8* %item, i8** %item.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %item.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !78
  %i = getelementptr inbounds %struct.s_env, %struct.s_env* %0, i32 0, i32 1, !dbg !79
  %1 = load i32, i32* %i, align 4, !dbg !80
  %inc = add i32 %1, 1, !dbg !80
  store i32 %inc, i32* %i, align 4, !dbg !80
  %2 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !81
  %i1 = getelementptr inbounds %struct.s_env, %struct.s_env* %2, i32 0, i32 1, !dbg !83
  %3 = load i32, i32* %i1, align 4, !dbg !83
  %4 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !84
  %n = getelementptr inbounds %struct.s_env, %struct.s_env* %4, i32 0, i32 0, !dbg !85
  %5 = load i32, i32* %n, align 8, !dbg !85
  %cmp = icmp ule i32 %3, %5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87, !cf.info !88

if.then:                                          ; preds = %entry
  %6 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !89
  %7 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !90
  %i2 = getelementptr inbounds %struct.s_env, %struct.s_env* %7, i32 0, i32 1, !dbg !91
  %8 = load i32, i32* %i2, align 4, !dbg !91
  %sub = sub i32 %8, 1, !dbg !92
  %9 = load i8*, i8** %item.addr, align 8, !dbg !93
  call void @sample_set_i(%struct.s_env* %6, i32 %sub, i8* %9), !dbg !94
  br label %if.end10, !dbg !94

if.else:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !95
  %10 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !97
  %i3 = getelementptr inbounds %struct.s_env, %struct.s_env* %10, i32 0, i32 1, !dbg !98
  %11 = load i32, i32* %i3, align 4, !dbg !98
  %rem = urem i32 %call, %11, !dbg !99
  %12 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !100
  %n4 = getelementptr inbounds %struct.s_env, %struct.s_env* %12, i32 0, i32 0, !dbg !101
  %13 = load i32, i32* %n4, align 8, !dbg !101
  %cmp5 = icmp ult i32 %rem, %13, !dbg !102
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !103, !cf.info !88

if.then6:                                         ; preds = %if.else
  %14 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !104
  %call7 = call i32 @rand() #5, !dbg !105
  %15 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !106
  %n8 = getelementptr inbounds %struct.s_env, %struct.s_env* %15, i32 0, i32 0, !dbg !107
  %16 = load i32, i32* %n8, align 8, !dbg !107
  %rem9 = urem i32 %call7, %16, !dbg !108
  %17 = load i8*, i8** %item.addr, align 8, !dbg !109
  call void @sample_set_i(%struct.s_env* %14, i32 %rem9, i8* %17), !dbg !110
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then6, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  %18 = load %struct.s_env*, %struct.s_env** %s_env.addr, align 8, !dbg !111
  %sample = getelementptr inbounds %struct.s_env, %struct.s_env* %18, i32 0, i32 3, !dbg !112
  %19 = load i8*, i8** %sample, align 8, !dbg !112
  ret i8* %19, !dbg !113
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @test(i32 %n, i32* %items_set, i32 %num_items) #0 !dbg !114 {
entry:
  %n.addr = alloca i32, align 4
  %items_set.addr = alloca i32*, align 8
  %num_items.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s_env = alloca %struct.s_env, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i32* %items_set, i32** %items_set.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %items_set.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i32 %num_items, i32* %num_items.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_items.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata %struct.s_env* %s_env, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32, i32* %n.addr, align 4, !dbg !127
  call void @s_of_n_init(%struct.s_env* %s_env, i64 4, i32 %0), !dbg !128
  store i32 0, i32* %i, align 4, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !132
  %2 = load i32, i32* %num_items.addr, align 4, !dbg !134
  %cmp = icmp ult i32 %1, %2, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %items_set.addr, align 8, !dbg !137
  %4 = load i32, i32* %i, align 4, !dbg !139
  %idxprom = sext i32 %4 to i64, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !137
  %5 = bitcast i32* %arrayidx to i8*, !dbg !140
  %call = call i8* @s_of_n(%struct.s_env* %s_env, i8* %5), !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !143
  %inc = add nsw i32 %6, 1, !dbg !143
  store i32 %inc, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %sample = getelementptr inbounds %struct.s_env, %struct.s_env* %s_env, i32 0, i32 3, !dbg !147
  %7 = load i8*, i8** %sample, align 8, !dbg !147
  %8 = bitcast i8* %7 to i32*, !dbg !148
  ret i32* %8, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !150 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %num_items = alloca i32, align 4
  %frequencies = alloca i32*, align 8
  %items_set = alloca i32*, align 8
  %res = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i32* %j, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %n, metadata !157, metadata !DIExpression()), !dbg !158
  store i32 3, i32* %n, align 4, !dbg !158
  call void @llvm.dbg.declare(metadata i32* %num_items, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 10, i32* %num_items, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata i32** %frequencies, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32** %items_set, metadata !164, metadata !DIExpression()), !dbg !165
  %call = call i64 @time(i64* null) #5, !dbg !166
  %conv = trunc i64 %call to i32, !dbg !166
  call void @srand(i32 %conv) #5, !dbg !167
  %0 = load i32, i32* %num_items, align 4, !dbg !168
  %conv1 = zext i32 %0 to i64, !dbg !168
  %mul = mul i64 %conv1, 4, !dbg !169
  %call2 = call noalias i8* @malloc(i64 %mul) #5, !dbg !170
  %1 = bitcast i8* %call2 to i32*, !dbg !170
  store i32* %1, i32** %items_set, align 8, !dbg !171
  %2 = load i32, i32* %num_items, align 4, !dbg !172
  %conv3 = zext i32 %2 to i64, !dbg !172
  %mul4 = mul i64 %conv3, 4, !dbg !173
  %call5 = call noalias i8* @malloc(i64 %mul4) #5, !dbg !174
  %3 = bitcast i8* %call5 to i32*, !dbg !174
  store i32* %3, i32** %frequencies, align 8, !dbg !175
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !179
  %5 = load i32, i32* %num_items, align 4, !dbg !181
  %cmp = icmp ult i32 %4, %5, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !184
  %7 = load i32*, i32** %items_set, align 8, !dbg !186
  %8 = load i32, i32* %i, align 4, !dbg !187
  %idxprom = zext i32 %8 to i64, !dbg !186
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !186
  store i32 %6, i32* %arrayidx, align 4, !dbg !188
  %9 = load i32*, i32** %frequencies, align 8, !dbg !189
  %10 = load i32, i32* %i, align 4, !dbg !190
  %idxprom7 = zext i32 %10 to i64, !dbg !189
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 %idxprom7, !dbg !189
  store i32 0, i32* %arrayidx8, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !193
  %inc = add i32 %11, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond9, !dbg !199

for.cond9:                                        ; preds = %for.inc26, %for.end
  %12 = load i32, i32* %i, align 4, !dbg !200
  %cmp10 = icmp ult i32 %12, 100000, !dbg !202
  br i1 %cmp10, label %for.body12, label %for.end28, !dbg !203

for.body12:                                       ; preds = %for.cond9
  call void @llvm.dbg.declare(metadata i32** %res, metadata !204, metadata !DIExpression()), !dbg !206
  %13 = load i32, i32* %n, align 4, !dbg !207
  %14 = load i32*, i32** %items_set, align 8, !dbg !208
  %15 = load i32, i32* %num_items, align 4, !dbg !209
  %call13 = call i32* @test(i32 %13, i32* %14, i32 %15), !dbg !210
  store i32* %call13, i32** %res, align 8, !dbg !206
  store i32 0, i32* %j, align 4, !dbg !211
  br label %for.cond14, !dbg !213

for.cond14:                                       ; preds = %for.inc23, %for.body12
  %16 = load i32, i32* %j, align 4, !dbg !214
  %17 = load i32, i32* %n, align 4, !dbg !216
  %cmp15 = icmp ult i32 %16, %17, !dbg !217
  br i1 %cmp15, label %for.body17, label %for.end25, !dbg !218

for.body17:                                       ; preds = %for.cond14
  %18 = load i32*, i32** %frequencies, align 8, !dbg !219
  %19 = load i32*, i32** %res, align 8, !dbg !221
  %20 = load i32, i32* %j, align 4, !dbg !222
  %idxprom18 = zext i32 %20 to i64, !dbg !221
  %arrayidx19 = getelementptr inbounds i32, i32* %19, i64 %idxprom18, !dbg !221
  %21 = load i32, i32* %arrayidx19, align 4, !dbg !221
  %idxprom20 = sext i32 %21 to i64, !dbg !219
  %arrayidx21 = getelementptr inbounds i32, i32* %18, i64 %idxprom20, !dbg !219
  %22 = load i32, i32* %arrayidx21, align 4, !dbg !223
  %inc22 = add i32 %22, 1, !dbg !223
  store i32 %inc22, i32* %arrayidx21, align 4, !dbg !223
  br label %for.inc23, !dbg !224

for.inc23:                                        ; preds = %for.body17
  %23 = load i32, i32* %j, align 4, !dbg !225
  %inc24 = add i32 %23, 1, !dbg !225
  store i32 %inc24, i32* %j, align 4, !dbg !225
  br label %for.cond14, !dbg !226, !llvm.loop !227

for.end25:                                        ; preds = %for.cond14
  %24 = load i32*, i32** %res, align 8, !dbg !229
  %25 = bitcast i32* %24 to i8*, !dbg !229
  call void @free(i8* %25) #5, !dbg !230
  br label %for.inc26, !dbg !231

for.inc26:                                        ; preds = %for.end25
  %26 = load i32, i32* %i, align 4, !dbg !232
  %inc27 = add i32 %26, 1, !dbg !232
  store i32 %inc27, i32* %i, align 4, !dbg !232
  br label %for.cond9, !dbg !233, !llvm.loop !234

for.end28:                                        ; preds = %for.cond9
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond29, !dbg !238

for.cond29:                                       ; preds = %for.inc36, %for.end28
  %27 = load i32, i32* %i, align 4, !dbg !239
  %28 = load i32, i32* %num_items, align 4, !dbg !241
  %cmp30 = icmp ult i32 %27, %28, !dbg !242
  br i1 %cmp30, label %for.body32, label %for.end38, !dbg !243

for.body32:                                       ; preds = %for.cond29
  %29 = load i32*, i32** %frequencies, align 8, !dbg !244
  %30 = load i32, i32* %i, align 4, !dbg !246
  %idxprom33 = zext i32 %30 to i64, !dbg !244
  %arrayidx34 = getelementptr inbounds i32, i32* %29, i64 %idxprom33, !dbg !244
  %31 = load i32, i32* %arrayidx34, align 4, !dbg !244
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %31), !dbg !247
  br label %for.inc36, !dbg !248

for.inc36:                                        ; preds = %for.body32
  %32 = load i32, i32* %i, align 4, !dbg !249
  %inc37 = add i32 %32, 1, !dbg !249
  store i32 %inc37, i32* %i, align 4, !dbg !249
  br label %for.cond29, !dbg !250, !llvm.loop !251

for.end38:                                        ; preds = %for.cond29
  %call39 = call i32 @puts(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)), !dbg !253
  ret i32 0, !dbg !254
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @puts(i8*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "knuths-algorithm-s.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knuths-algorithm-S")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!11 = distinct !DISubprogram(name: "s_of_n_init", scope: !1, file: !1, line: 12, type: !12, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{null, !14, !21, !18}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "s_env", file: !1, line: 6, size: 192, elements: !16)
!16 = !{!17, !19, !20, !24}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !15, file: !1, line: 7, baseType: !18, size: 32)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "i", scope: !15, file: !1, line: 7, baseType: !18, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !15, file: !1, line: 8, baseType: !21, size: 64, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !15, file: !1, line: 9, baseType: !4, size: 64, offset: 128)
!25 = !DILocalVariable(name: "s_env", arg: 1, scope: !11, file: !1, line: 12, type: !14)
!26 = !DILocation(line: 12, column: 32, scope: !11)
!27 = !DILocalVariable(name: "size", arg: 2, scope: !11, file: !1, line: 12, type: !21)
!28 = !DILocation(line: 12, column: 46, scope: !11)
!29 = !DILocalVariable(name: "n", arg: 3, scope: !11, file: !1, line: 12, type: !18)
!30 = !DILocation(line: 12, column: 65, scope: !11)
!31 = !DILocation(line: 14, column: 5, scope: !11)
!32 = !DILocation(line: 14, column: 12, scope: !11)
!33 = !DILocation(line: 14, column: 14, scope: !11)
!34 = !DILocation(line: 15, column: 16, scope: !11)
!35 = !DILocation(line: 15, column: 5, scope: !11)
!36 = !DILocation(line: 15, column: 12, scope: !11)
!37 = !DILocation(line: 15, column: 14, scope: !11)
!38 = !DILocation(line: 16, column: 19, scope: !11)
!39 = !DILocation(line: 16, column: 5, scope: !11)
!40 = !DILocation(line: 16, column: 12, scope: !11)
!41 = !DILocation(line: 16, column: 17, scope: !11)
!42 = !DILocation(line: 17, column: 28, scope: !11)
!43 = !DILocation(line: 17, column: 32, scope: !11)
!44 = !DILocation(line: 17, column: 30, scope: !11)
!45 = !DILocation(line: 17, column: 21, scope: !11)
!46 = !DILocation(line: 17, column: 5, scope: !11)
!47 = !DILocation(line: 17, column: 12, scope: !11)
!48 = !DILocation(line: 17, column: 19, scope: !11)
!49 = !DILocation(line: 18, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "sample_set_i", scope: !1, file: !1, line: 20, type: !51, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !14, !18, !4}
!53 = !DILocalVariable(name: "s_env", arg: 1, scope: !50, file: !1, line: 20, type: !14)
!54 = !DILocation(line: 20, column: 33, scope: !50)
!55 = !DILocalVariable(name: "i", arg: 2, scope: !50, file: !1, line: 20, type: !18)
!56 = !DILocation(line: 20, column: 53, scope: !50)
!57 = !DILocalVariable(name: "item", arg: 3, scope: !50, file: !1, line: 20, type: !4)
!58 = !DILocation(line: 20, column: 62, scope: !50)
!59 = !DILocation(line: 22, column: 12, scope: !50)
!60 = !DILocation(line: 22, column: 19, scope: !50)
!61 = !DILocation(line: 22, column: 28, scope: !50)
!62 = !DILocation(line: 22, column: 32, scope: !50)
!63 = !DILocation(line: 22, column: 39, scope: !50)
!64 = !DILocation(line: 22, column: 30, scope: !50)
!65 = !DILocation(line: 22, column: 26, scope: !50)
!66 = !DILocation(line: 22, column: 45, scope: !50)
!67 = !DILocation(line: 22, column: 51, scope: !50)
!68 = !DILocation(line: 22, column: 58, scope: !50)
!69 = !DILocation(line: 22, column: 5, scope: !50)
!70 = !DILocation(line: 23, column: 1, scope: !50)
!71 = distinct !DISubprogram(name: "s_of_n", scope: !1, file: !1, line: 25, type: !72, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!4, !14, !4}
!74 = !DILocalVariable(name: "s_env", arg: 1, scope: !71, file: !1, line: 25, type: !14)
!75 = !DILocation(line: 25, column: 28, scope: !71)
!76 = !DILocalVariable(name: "item", arg: 2, scope: !71, file: !1, line: 25, type: !4)
!77 = !DILocation(line: 25, column: 41, scope: !71)
!78 = !DILocation(line: 27, column: 5, scope: !71)
!79 = !DILocation(line: 27, column: 12, scope: !71)
!80 = !DILocation(line: 27, column: 13, scope: !71)
!81 = !DILocation(line: 28, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !71, file: !1, line: 28, column: 9)
!83 = !DILocation(line: 28, column: 16, scope: !82)
!84 = !DILocation(line: 28, column: 21, scope: !82)
!85 = !DILocation(line: 28, column: 28, scope: !82)
!86 = !DILocation(line: 28, column: 18, scope: !82)
!87 = !DILocation(line: 28, column: 9, scope: !71)
!88 = !{!"if"}
!89 = !DILocation(line: 29, column: 22, scope: !82)
!90 = !DILocation(line: 29, column: 29, scope: !82)
!91 = !DILocation(line: 29, column: 36, scope: !82)
!92 = !DILocation(line: 29, column: 38, scope: !82)
!93 = !DILocation(line: 29, column: 43, scope: !82)
!94 = !DILocation(line: 29, column: 9, scope: !82)
!95 = !DILocation(line: 30, column: 15, scope: !96)
!96 = distinct !DILexicalBlock(scope: !82, file: !1, line: 30, column: 14)
!97 = !DILocation(line: 30, column: 24, scope: !96)
!98 = !DILocation(line: 30, column: 31, scope: !96)
!99 = !DILocation(line: 30, column: 22, scope: !96)
!100 = !DILocation(line: 30, column: 36, scope: !96)
!101 = !DILocation(line: 30, column: 43, scope: !96)
!102 = !DILocation(line: 30, column: 34, scope: !96)
!103 = !DILocation(line: 30, column: 14, scope: !82)
!104 = !DILocation(line: 31, column: 22, scope: !96)
!105 = !DILocation(line: 31, column: 29, scope: !96)
!106 = !DILocation(line: 31, column: 38, scope: !96)
!107 = !DILocation(line: 31, column: 45, scope: !96)
!108 = !DILocation(line: 31, column: 36, scope: !96)
!109 = !DILocation(line: 31, column: 48, scope: !96)
!110 = !DILocation(line: 31, column: 9, scope: !96)
!111 = !DILocation(line: 32, column: 12, scope: !71)
!112 = !DILocation(line: 32, column: 19, scope: !71)
!113 = !DILocation(line: 32, column: 5, scope: !71)
!114 = distinct !DISubprogram(name: "test", scope: !1, file: !1, line: 35, type: !115, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!5, !18, !5, !18}
!117 = !DILocalVariable(name: "n", arg: 1, scope: !114, file: !1, line: 35, type: !18)
!118 = !DILocation(line: 35, column: 24, scope: !114)
!119 = !DILocalVariable(name: "items_set", arg: 2, scope: !114, file: !1, line: 35, type: !5)
!120 = !DILocation(line: 35, column: 32, scope: !114)
!121 = !DILocalVariable(name: "num_items", arg: 3, scope: !114, file: !1, line: 35, type: !18)
!122 = !DILocation(line: 35, column: 56, scope: !114)
!123 = !DILocalVariable(name: "i", scope: !114, file: !1, line: 37, type: !6)
!124 = !DILocation(line: 37, column: 9, scope: !114)
!125 = !DILocalVariable(name: "s_env", scope: !114, file: !1, line: 38, type: !15)
!126 = !DILocation(line: 38, column: 18, scope: !114)
!127 = !DILocation(line: 39, column: 47, scope: !114)
!128 = !DILocation(line: 39, column: 5, scope: !114)
!129 = !DILocation(line: 40, column: 12, scope: !130)
!130 = distinct !DILexicalBlock(scope: !114, file: !1, line: 40, column: 5)
!131 = !DILocation(line: 40, column: 10, scope: !130)
!132 = !DILocation(line: 40, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !1, line: 40, column: 5)
!134 = !DILocation(line: 40, column: 21, scope: !133)
!135 = !DILocation(line: 40, column: 19, scope: !133)
!136 = !DILocation(line: 40, column: 5, scope: !130)
!137 = !DILocation(line: 41, column: 34, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !1, line: 40, column: 37)
!139 = !DILocation(line: 41, column: 44, scope: !138)
!140 = !DILocation(line: 41, column: 24, scope: !138)
!141 = !DILocation(line: 41, column: 9, scope: !138)
!142 = !DILocation(line: 42, column: 5, scope: !138)
!143 = !DILocation(line: 40, column: 33, scope: !133)
!144 = !DILocation(line: 40, column: 5, scope: !133)
!145 = distinct !{!145, !136, !146}
!146 = !DILocation(line: 42, column: 5, scope: !130)
!147 = !DILocation(line: 43, column: 25, scope: !114)
!148 = !DILocation(line: 43, column: 12, scope: !114)
!149 = !DILocation(line: 43, column: 5, scope: !114)
!150 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 46, type: !151, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DISubroutineType(types: !152)
!152 = !{!6}
!153 = !DILocalVariable(name: "i", scope: !150, file: !1, line: 48, type: !18)
!154 = !DILocation(line: 48, column: 18, scope: !150)
!155 = !DILocalVariable(name: "j", scope: !150, file: !1, line: 48, type: !18)
!156 = !DILocation(line: 48, column: 21, scope: !150)
!157 = !DILocalVariable(name: "n", scope: !150, file: !1, line: 49, type: !18)
!158 = !DILocation(line: 49, column: 18, scope: !150)
!159 = !DILocalVariable(name: "num_items", scope: !150, file: !1, line: 50, type: !18)
!160 = !DILocation(line: 50, column: 18, scope: !150)
!161 = !DILocalVariable(name: "frequencies", scope: !150, file: !1, line: 51, type: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!163 = !DILocation(line: 51, column: 19, scope: !150)
!164 = !DILocalVariable(name: "items_set", scope: !150, file: !1, line: 52, type: !5)
!165 = !DILocation(line: 52, column: 10, scope: !150)
!166 = !DILocation(line: 53, column: 11, scope: !150)
!167 = !DILocation(line: 53, column: 5, scope: !150)
!168 = !DILocation(line: 54, column: 24, scope: !150)
!169 = !DILocation(line: 54, column: 34, scope: !150)
!170 = !DILocation(line: 54, column: 17, scope: !150)
!171 = !DILocation(line: 54, column: 15, scope: !150)
!172 = !DILocation(line: 55, column: 26, scope: !150)
!173 = !DILocation(line: 55, column: 36, scope: !150)
!174 = !DILocation(line: 55, column: 19, scope: !150)
!175 = !DILocation(line: 55, column: 17, scope: !150)
!176 = !DILocation(line: 56, column: 12, scope: !177)
!177 = distinct !DILexicalBlock(scope: !150, file: !1, line: 56, column: 5)
!178 = !DILocation(line: 56, column: 10, scope: !177)
!179 = !DILocation(line: 56, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !1, line: 56, column: 5)
!181 = !DILocation(line: 56, column: 21, scope: !180)
!182 = !DILocation(line: 56, column: 19, scope: !180)
!183 = !DILocation(line: 56, column: 5, scope: !177)
!184 = !DILocation(line: 57, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !1, line: 56, column: 37)
!186 = !DILocation(line: 57, column: 9, scope: !185)
!187 = !DILocation(line: 57, column: 19, scope: !185)
!188 = !DILocation(line: 57, column: 22, scope: !185)
!189 = !DILocation(line: 58, column: 9, scope: !185)
!190 = !DILocation(line: 58, column: 21, scope: !185)
!191 = !DILocation(line: 58, column: 24, scope: !185)
!192 = !DILocation(line: 59, column: 5, scope: !185)
!193 = !DILocation(line: 56, column: 33, scope: !180)
!194 = !DILocation(line: 56, column: 5, scope: !180)
!195 = distinct !{!195, !183, !196}
!196 = !DILocation(line: 59, column: 5, scope: !177)
!197 = !DILocation(line: 60, column: 12, scope: !198)
!198 = distinct !DILexicalBlock(scope: !150, file: !1, line: 60, column: 5)
!199 = !DILocation(line: 60, column: 10, scope: !198)
!200 = !DILocation(line: 60, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !1, line: 60, column: 5)
!202 = !DILocation(line: 60, column: 19, scope: !201)
!203 = !DILocation(line: 60, column: 5, scope: !198)
!204 = !DILocalVariable(name: "res", scope: !205, file: !1, line: 61, type: !5)
!205 = distinct !DILexicalBlock(scope: !201, file: !1, line: 60, column: 34)
!206 = !DILocation(line: 61, column: 14, scope: !205)
!207 = !DILocation(line: 61, column: 25, scope: !205)
!208 = !DILocation(line: 61, column: 28, scope: !205)
!209 = !DILocation(line: 61, column: 39, scope: !205)
!210 = !DILocation(line: 61, column: 20, scope: !205)
!211 = !DILocation(line: 62, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !205, file: !1, line: 62, column: 9)
!213 = !DILocation(line: 62, column: 14, scope: !212)
!214 = !DILocation(line: 62, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !1, line: 62, column: 9)
!216 = !DILocation(line: 62, column: 25, scope: !215)
!217 = !DILocation(line: 62, column: 23, scope: !215)
!218 = !DILocation(line: 62, column: 9, scope: !212)
!219 = !DILocation(line: 63, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !1, line: 62, column: 33)
!221 = !DILocation(line: 63, column: 25, scope: !220)
!222 = !DILocation(line: 63, column: 29, scope: !220)
!223 = !DILocation(line: 63, column: 32, scope: !220)
!224 = !DILocation(line: 64, column: 9, scope: !220)
!225 = !DILocation(line: 62, column: 29, scope: !215)
!226 = !DILocation(line: 62, column: 9, scope: !215)
!227 = distinct !{!227, !218, !228}
!228 = !DILocation(line: 64, column: 9, scope: !212)
!229 = !DILocation(line: 65, column: 7, scope: !205)
!230 = !DILocation(line: 65, column: 2, scope: !205)
!231 = !DILocation(line: 66, column: 5, scope: !205)
!232 = !DILocation(line: 60, column: 30, scope: !201)
!233 = !DILocation(line: 60, column: 5, scope: !201)
!234 = distinct !{!234, !203, !235}
!235 = !DILocation(line: 66, column: 5, scope: !198)
!236 = !DILocation(line: 67, column: 12, scope: !237)
!237 = distinct !DILexicalBlock(scope: !150, file: !1, line: 67, column: 5)
!238 = !DILocation(line: 67, column: 10, scope: !237)
!239 = !DILocation(line: 67, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !1, line: 67, column: 5)
!241 = !DILocation(line: 67, column: 21, scope: !240)
!242 = !DILocation(line: 67, column: 19, scope: !240)
!243 = !DILocation(line: 67, column: 5, scope: !237)
!244 = !DILocation(line: 68, column: 23, scope: !245)
!245 = distinct !DILexicalBlock(scope: !240, file: !1, line: 67, column: 37)
!246 = !DILocation(line: 68, column: 35, scope: !245)
!247 = !DILocation(line: 68, column: 9, scope: !245)
!248 = !DILocation(line: 69, column: 5, scope: !245)
!249 = !DILocation(line: 67, column: 33, scope: !240)
!250 = !DILocation(line: 67, column: 5, scope: !240)
!251 = distinct !{!251, !243, !252}
!252 = !DILocation(line: 69, column: 5, scope: !237)
!253 = !DILocation(line: 70, column: 5, scope: !150)
!254 = !DILocation(line: 71, column: 5, scope: !150)
