; ModuleID = 'huffman-coding-1.c'
source_filename = "huffman-coding-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.huffcode = type { i32, i32 }
%struct.huffheap = type { i32*, i32, i32, i32, i64* }

@.str = private unnamed_addr constant [40 x i8] c"this is an example for huffman encoding\00", align 1
@test = dso_local global i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@.str.1 = private unnamed_addr constant [12 x i8] c"%c (%d) %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.huffcode** @create_huffman_codes(i64* %freqs) #0 !dbg !15 {
entry:
  %retval = alloca %struct.huffcode**, align 8
  %freqs.addr = alloca i64*, align 8
  %codes = alloca %struct.huffcode**, align 8
  %heap = alloca %struct.huffheap*, align 8
  %efreqs = alloca [512 x i64], align 16
  %preds = alloca [512 x i32], align 16
  %i = alloca i32, align 4
  %extf = alloca i32, align 4
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %bc = alloca i32, align 4
  %bn = alloca i32, align 4
  %ix = alloca i32, align 4
  store i64* %freqs, i64** %freqs.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %freqs.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata %struct.huffcode*** %codes, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct.huffheap** %heap, metadata !32, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [512 x i64]* %efreqs, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [512 x i32]* %preds, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %extf, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 256, i32* %extf, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %r1, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %r2, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 0, !dbg !60
  %0 = bitcast i64* %arraydecay to i8*, !dbg !60
  %1 = load i64*, i64** %freqs.addr, align 8, !dbg !61
  %2 = bitcast i64* %1 to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 8 %2, i64 2048, i1 false), !dbg !60
  %arrayidx = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 256, !dbg !62
  %3 = bitcast i64* %arrayidx to i8*, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 2048, i1 false), !dbg !63
  %arraydecay1 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 0, !dbg !64
  %call = call %struct.huffheap* @_heap_create(i32 512, i64* %arraydecay1), !dbg !65
  store %struct.huffheap* %call, %struct.huffheap** %heap, align 8, !dbg !66
  %4 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !67
  %cmp = icmp eq %struct.huffheap* %4, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70, !cf.info !71

if.then:                                          ; preds = %entry
  store %struct.huffcode** null, %struct.huffcode*** %retval, align 8, !dbg !72
  br label %return, !dbg !72

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !76
  %cmp2 = icmp slt i32 %5, 256, !dbg !78
  br i1 %cmp2, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !80
  %idxprom = sext i32 %6 to i64, !dbg !82
  %arrayidx3 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom, !dbg !82
  %7 = load i64, i64* %arrayidx3, align 8, !dbg !82
  %cmp4 = icmp sgt i64 %7, 0, !dbg !83
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !84, !cf.info !71

if.then5:                                         ; preds = %for.body
  %8 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !85
  %9 = load i32, i32* %i, align 4, !dbg !86
  call void @_heap_add(%struct.huffheap* %8, i32 %9), !dbg !87
  br label %if.end6, !dbg !87

if.end6:                                          ; preds = %if.then5, %for.body
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %if.end6
  %10 = load i32, i32* %i, align 4, !dbg !89
  %inc = add nsw i32 %10, 1, !dbg !89
  store i32 %inc, i32* %i, align 4, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !93

while.cond:                                       ; preds = %while.body, %for.end
  %11 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !94
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %11, i32 0, i32 1, !dbg !95
  %12 = load i32, i32* %n, align 8, !dbg !95
  %cmp7 = icmp sgt i32 %12, 1, !dbg !96
  br i1 %cmp7, label %while.body, label %while.end, !dbg !93

while.body:                                       ; preds = %while.cond
  %13 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !97
  %call8 = call i32 @_heap_remove(%struct.huffheap* %13), !dbg !99
  store i32 %call8, i32* %r1, align 4, !dbg !100
  %14 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !101
  %call9 = call i32 @_heap_remove(%struct.huffheap* %14), !dbg !102
  store i32 %call9, i32* %r2, align 4, !dbg !103
  %15 = load i32, i32* %r1, align 4, !dbg !104
  %idxprom10 = sext i32 %15 to i64, !dbg !105
  %arrayidx11 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom10, !dbg !105
  %16 = load i64, i64* %arrayidx11, align 8, !dbg !105
  %17 = load i32, i32* %r2, align 4, !dbg !106
  %idxprom12 = sext i32 %17 to i64, !dbg !107
  %arrayidx13 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom12, !dbg !107
  %18 = load i64, i64* %arrayidx13, align 8, !dbg !107
  %add = add nsw i64 %16, %18, !dbg !108
  %19 = load i32, i32* %extf, align 4, !dbg !109
  %idxprom14 = sext i32 %19 to i64, !dbg !110
  %arrayidx15 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom14, !dbg !110
  store i64 %add, i64* %arrayidx15, align 8, !dbg !111
  %20 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !112
  %21 = load i32, i32* %extf, align 4, !dbg !113
  call void @_heap_add(%struct.huffheap* %20, i32 %21), !dbg !114
  %22 = load i32, i32* %extf, align 4, !dbg !115
  %23 = load i32, i32* %r1, align 4, !dbg !116
  %idxprom16 = sext i32 %23 to i64, !dbg !117
  %arrayidx17 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom16, !dbg !117
  store i32 %22, i32* %arrayidx17, align 4, !dbg !118
  %24 = load i32, i32* %extf, align 4, !dbg !119
  %sub = sub nsw i32 0, %24, !dbg !120
  %25 = load i32, i32* %r2, align 4, !dbg !121
  %idxprom18 = sext i32 %25 to i64, !dbg !122
  %arrayidx19 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom18, !dbg !122
  store i32 %sub, i32* %arrayidx19, align 4, !dbg !123
  %26 = load i32, i32* %extf, align 4, !dbg !124
  %inc20 = add nsw i32 %26, 1, !dbg !124
  store i32 %inc20, i32* %extf, align 4, !dbg !124
  br label %while.cond, !dbg !93, !llvm.loop !125

while.end:                                        ; preds = %while.cond
  %27 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !127
  %call21 = call i32 @_heap_remove(%struct.huffheap* %27), !dbg !128
  store i32 %call21, i32* %r1, align 4, !dbg !129
  %28 = load i32, i32* %r1, align 4, !dbg !130
  %29 = load i32, i32* %r1, align 4, !dbg !131
  %idxprom22 = sext i32 %29 to i64, !dbg !132
  %arrayidx23 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom22, !dbg !132
  store i32 %28, i32* %arrayidx23, align 4, !dbg !133
  %30 = load %struct.huffheap*, %struct.huffheap** %heap, align 8, !dbg !134
  call void @_heap_destroy(%struct.huffheap* %30), !dbg !135
  %call24 = call noalias i8* @malloc(i64 2048) #6, !dbg !136
  %31 = bitcast i8* %call24 to %struct.huffcode**, !dbg !136
  store %struct.huffcode** %31, %struct.huffcode*** %codes, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %bc, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %bn, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %ix, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond25, !dbg !146

for.cond25:                                       ; preds = %for.inc56, %while.end
  %32 = load i32, i32* %i, align 4, !dbg !147
  %cmp26 = icmp slt i32 %32, 256, !dbg !149
  br i1 %cmp26, label %for.body27, label %for.end58, !dbg !150

for.body27:                                       ; preds = %for.cond25
  store i32 0, i32* %bc, align 4, !dbg !151
  store i32 0, i32* %bn, align 4, !dbg !153
  %33 = load i32, i32* %i, align 4, !dbg !154
  %idxprom28 = sext i32 %33 to i64, !dbg !156
  %arrayidx29 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom28, !dbg !156
  %34 = load i64, i64* %arrayidx29, align 8, !dbg !156
  %cmp30 = icmp eq i64 %34, 0, !dbg !157
  br i1 %cmp30, label %if.then31, label %if.end34, !dbg !158, !cf.info !71

if.then31:                                        ; preds = %for.body27
  %35 = load %struct.huffcode**, %struct.huffcode*** %codes, align 8, !dbg !159
  %36 = load i32, i32* %i, align 4, !dbg !161
  %idxprom32 = sext i32 %36 to i64, !dbg !159
  %arrayidx33 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %35, i64 %idxprom32, !dbg !159
  store %struct.huffcode* null, %struct.huffcode** %arrayidx33, align 8, !dbg !162
  br label %for.inc56, !dbg !163

if.end34:                                         ; preds = %for.body27
  %37 = load i32, i32* %i, align 4, !dbg !164
  store i32 %37, i32* %ix, align 4, !dbg !165
  br label %while.cond35, !dbg !166

while.cond35:                                     ; preds = %while.body40, %if.end34
  %38 = load i32, i32* %ix, align 4, !dbg !167
  %idxprom36 = sext i32 %38 to i64, !dbg !168
  %arrayidx37 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom36, !dbg !168
  %39 = load i32, i32* %arrayidx37, align 4, !dbg !168
  %call38 = call i32 @abs(i32 %39) #7, !dbg !169
  %40 = load i32, i32* %ix, align 4, !dbg !170
  %cmp39 = icmp ne i32 %call38, %40, !dbg !171
  br i1 %cmp39, label %while.body40, label %while.end48, !dbg !166

while.body40:                                     ; preds = %while.cond35
  %41 = load i32, i32* %ix, align 4, !dbg !172
  %idxprom41 = sext i32 %41 to i64, !dbg !174
  %arrayidx42 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom41, !dbg !174
  %42 = load i32, i32* %arrayidx42, align 4, !dbg !174
  %cmp43 = icmp sge i32 %42, 0, !dbg !175
  %43 = zext i1 %cmp43 to i64, !dbg !176
  %cond = select i1 %cmp43, i32 1, i32 0, !dbg !176
  %44 = load i32, i32* %bn, align 4, !dbg !177
  %shl = shl i32 %cond, %44, !dbg !178
  %45 = load i32, i32* %bc, align 4, !dbg !179
  %or = or i32 %45, %shl, !dbg !179
  store i32 %or, i32* %bc, align 4, !dbg !179
  %46 = load i32, i32* %ix, align 4, !dbg !180
  %idxprom44 = sext i32 %46 to i64, !dbg !181
  %arrayidx45 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom44, !dbg !181
  %47 = load i32, i32* %arrayidx45, align 4, !dbg !181
  %call46 = call i32 @abs(i32 %47) #7, !dbg !182
  store i32 %call46, i32* %ix, align 4, !dbg !183
  %48 = load i32, i32* %bn, align 4, !dbg !184
  %inc47 = add nsw i32 %48, 1, !dbg !184
  store i32 %inc47, i32* %bn, align 4, !dbg !184
  br label %while.cond35, !dbg !166, !llvm.loop !185

while.end48:                                      ; preds = %while.cond35
  %call49 = call noalias i8* @malloc(i64 8) #6, !dbg !187
  %49 = bitcast i8* %call49 to %struct.huffcode*, !dbg !187
  %50 = load %struct.huffcode**, %struct.huffcode*** %codes, align 8, !dbg !188
  %51 = load i32, i32* %i, align 4, !dbg !189
  %idxprom50 = sext i32 %51 to i64, !dbg !188
  %arrayidx51 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %50, i64 %idxprom50, !dbg !188
  store %struct.huffcode* %49, %struct.huffcode** %arrayidx51, align 8, !dbg !190
  %52 = load i32, i32* %bn, align 4, !dbg !191
  %53 = load %struct.huffcode**, %struct.huffcode*** %codes, align 8, !dbg !192
  %54 = load i32, i32* %i, align 4, !dbg !193
  %idxprom52 = sext i32 %54 to i64, !dbg !192
  %arrayidx53 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %53, i64 %idxprom52, !dbg !192
  %55 = load %struct.huffcode*, %struct.huffcode** %arrayidx53, align 8, !dbg !192
  %nbits = getelementptr inbounds %struct.huffcode, %struct.huffcode* %55, i32 0, i32 0, !dbg !194
  store i32 %52, i32* %nbits, align 4, !dbg !195
  %56 = load i32, i32* %bc, align 4, !dbg !196
  %57 = load %struct.huffcode**, %struct.huffcode*** %codes, align 8, !dbg !197
  %58 = load i32, i32* %i, align 4, !dbg !198
  %idxprom54 = sext i32 %58 to i64, !dbg !197
  %arrayidx55 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %57, i64 %idxprom54, !dbg !197
  %59 = load %struct.huffcode*, %struct.huffcode** %arrayidx55, align 8, !dbg !197
  %code = getelementptr inbounds %struct.huffcode, %struct.huffcode* %59, i32 0, i32 1, !dbg !199
  store i32 %56, i32* %code, align 4, !dbg !200
  br label %for.inc56, !dbg !201

for.inc56:                                        ; preds = %while.end48, %if.then31
  %60 = load i32, i32* %i, align 4, !dbg !202
  %inc57 = add nsw i32 %60, 1, !dbg !202
  store i32 %inc57, i32* %i, align 4, !dbg !202
  br label %for.cond25, !dbg !203, !llvm.loop !204

for.end58:                                        ; preds = %for.cond25
  %61 = load %struct.huffcode**, %struct.huffcode*** %codes, align 8, !dbg !206
  store %struct.huffcode** %61, %struct.huffcode*** %retval, align 8, !dbg !207
  br label %return, !dbg !207

return:                                           ; preds = %for.end58, %if.then
  %62 = load %struct.huffcode**, %struct.huffcode*** %retval, align 8, !dbg !208
  ret %struct.huffcode** %62, !dbg !208
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal %struct.huffheap* @_heap_create(i32 %s, i64* %f) #0 !dbg !209 {
entry:
  %s.addr = alloca i32, align 4
  %f.addr = alloca i64*, align 8
  %h = alloca %struct.huffheap*, align 8
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i64* %f, i64** %f.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %f.addr, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata %struct.huffheap** %h, metadata !216, metadata !DIExpression()), !dbg !217
  %call = call noalias i8* @malloc(i64 32) #6, !dbg !218
  %0 = bitcast i8* %call to %struct.huffheap*, !dbg !218
  store %struct.huffheap* %0, %struct.huffheap** %h, align 8, !dbg !219
  %1 = load i32, i32* %s.addr, align 4, !dbg !220
  %conv = sext i32 %1 to i64, !dbg !220
  %mul = mul i64 4, %conv, !dbg !221
  %call1 = call noalias i8* @malloc(i64 %mul) #6, !dbg !222
  %2 = bitcast i8* %call1 to i32*, !dbg !222
  %3 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !223
  %h2 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %3, i32 0, i32 0, !dbg !224
  store i32* %2, i32** %h2, align 8, !dbg !225
  %4 = load i32, i32* %s.addr, align 4, !dbg !226
  %5 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !227
  %cs = getelementptr inbounds %struct.huffheap, %struct.huffheap* %5, i32 0, i32 3, !dbg !228
  store i32 %4, i32* %cs, align 8, !dbg !229
  %6 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !230
  %s3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %6, i32 0, i32 2, !dbg !231
  store i32 %4, i32* %s3, align 4, !dbg !232
  %7 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !233
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %7, i32 0, i32 1, !dbg !234
  store i32 0, i32* %n, align 8, !dbg !235
  %8 = load i64*, i64** %f.addr, align 8, !dbg !236
  %9 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !237
  %f4 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %9, i32 0, i32 4, !dbg !238
  store i64* %8, i64** %f4, align 8, !dbg !239
  %10 = load %struct.huffheap*, %struct.huffheap** %h, align 8, !dbg !240
  ret %struct.huffheap* %10, !dbg !241
}

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_add(%struct.huffheap* %heap, i32 %c) #0 !dbg !242 {
entry:
  %heap.addr = alloca %struct.huffheap*, align 8
  %c.addr = alloca i32, align 4
  store %struct.huffheap* %heap, %struct.huffheap** %heap.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.huffheap** %heap.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !247, metadata !DIExpression()), !dbg !248
  %0 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !249
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 1, !dbg !251
  %1 = load i32, i32* %n, align 8, !dbg !251
  %add = add nsw i32 %1, 1, !dbg !252
  %2 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !253
  %s = getelementptr inbounds %struct.huffheap, %struct.huffheap* %2, i32 0, i32 2, !dbg !254
  %3 = load i32, i32* %s, align 4, !dbg !254
  %cmp = icmp sgt i32 %add, %3, !dbg !255
  br i1 %cmp, label %if.then, label %if.end, !dbg !256, !cf.info !71

if.then:                                          ; preds = %entry
  %4 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !257
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %4, i32 0, i32 0, !dbg !259
  %5 = load i32*, i32** %h, align 8, !dbg !259
  %6 = bitcast i32* %5 to i8*, !dbg !257
  %7 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !260
  %s1 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %7, i32 0, i32 2, !dbg !261
  %8 = load i32, i32* %s1, align 4, !dbg !261
  %9 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !262
  %cs = getelementptr inbounds %struct.huffheap, %struct.huffheap* %9, i32 0, i32 3, !dbg !263
  %10 = load i32, i32* %cs, align 8, !dbg !263
  %add2 = add nsw i32 %8, %10, !dbg !264
  %conv = sext i32 %add2 to i64, !dbg !260
  %call = call i8* @realloc(i8* %6, i64 %conv) #6, !dbg !265
  %11 = bitcast i8* %call to i32*, !dbg !265
  %12 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !266
  %h3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %12, i32 0, i32 0, !dbg !267
  store i32* %11, i32** %h3, align 8, !dbg !268
  %13 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !269
  %cs4 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %13, i32 0, i32 3, !dbg !270
  %14 = load i32, i32* %cs4, align 8, !dbg !270
  %15 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !271
  %s5 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %15, i32 0, i32 2, !dbg !272
  %16 = load i32, i32* %s5, align 4, !dbg !273
  %add6 = add nsw i32 %16, %14, !dbg !273
  store i32 %add6, i32* %s5, align 4, !dbg !273
  br label %if.end, !dbg !274

if.end:                                           ; preds = %if.then, %entry
  %17 = load i32, i32* %c.addr, align 4, !dbg !275
  %18 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !276
  %h7 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %18, i32 0, i32 0, !dbg !277
  %19 = load i32*, i32** %h7, align 8, !dbg !277
  %20 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !278
  %n8 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %20, i32 0, i32 1, !dbg !279
  %21 = load i32, i32* %n8, align 8, !dbg !279
  %idxprom = sext i32 %21 to i64, !dbg !276
  %arrayidx = getelementptr inbounds i32, i32* %19, i64 %idxprom, !dbg !276
  store i32 %17, i32* %arrayidx, align 4, !dbg !280
  %22 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !281
  %n9 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %22, i32 0, i32 1, !dbg !282
  %23 = load i32, i32* %n9, align 8, !dbg !283
  %inc = add nsw i32 %23, 1, !dbg !283
  store i32 %inc, i32* %n9, align 8, !dbg !283
  %24 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !284
  call void @_heap_sort(%struct.huffheap* %24), !dbg !285
  ret void, !dbg !286
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_heap_remove(%struct.huffheap* %heap) #0 !dbg !287 {
entry:
  %retval = alloca i32, align 4
  %heap.addr = alloca %struct.huffheap*, align 8
  store %struct.huffheap* %heap, %struct.huffheap** %heap.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.huffheap** %heap.addr, metadata !290, metadata !DIExpression()), !dbg !291
  %0 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !292
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 1, !dbg !294
  %1 = load i32, i32* %n, align 8, !dbg !294
  %cmp = icmp sgt i32 %1, 0, !dbg !295
  br i1 %cmp, label %if.then, label %if.end, !dbg !296, !cf.info !71

if.then:                                          ; preds = %entry
  %2 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !297
  %n1 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %2, i32 0, i32 1, !dbg !299
  %3 = load i32, i32* %n1, align 8, !dbg !300
  %dec = add nsw i32 %3, -1, !dbg !300
  store i32 %dec, i32* %n1, align 8, !dbg !300
  %4 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !301
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %4, i32 0, i32 0, !dbg !302
  %5 = load i32*, i32** %h, align 8, !dbg !302
  %6 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !303
  %n2 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %6, i32 0, i32 1, !dbg !304
  %7 = load i32, i32* %n2, align 8, !dbg !304
  %idxprom = sext i32 %7 to i64, !dbg !301
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !301
  %8 = load i32, i32* %arrayidx, align 4, !dbg !301
  store i32 %8, i32* %retval, align 4, !dbg !305
  br label %return, !dbg !305

if.end:                                           ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !306
  br label %return, !dbg !306

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !307
  ret i32 %9, !dbg !307
}

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_destroy(%struct.huffheap* %heap) #0 !dbg !308 {
entry:
  %heap.addr = alloca %struct.huffheap*, align 8
  store %struct.huffheap* %heap, %struct.huffheap** %heap.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.huffheap** %heap.addr, metadata !311, metadata !DIExpression()), !dbg !312
  %0 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !313
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 0, !dbg !314
  %1 = load i32*, i32** %h, align 8, !dbg !314
  %2 = bitcast i32* %1 to i8*, !dbg !313
  call void @free(i8* %2) #6, !dbg !315
  %3 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !316
  %4 = bitcast %struct.huffheap* %3 to i8*, !dbg !316
  call void @free(i8* %4) #6, !dbg !317
  ret void, !dbg !318
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_huffman_codes(%struct.huffcode** %c) #0 !dbg !319 {
entry:
  %c.addr = alloca %struct.huffcode**, align 8
  %i = alloca i32, align 4
  store %struct.huffcode** %c, %struct.huffcode*** %c.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.huffcode*** %c.addr, metadata !322, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.declare(metadata i32* %i, metadata !324, metadata !DIExpression()), !dbg !325
  store i32 0, i32* %i, align 4, !dbg !326
  br label %for.cond, !dbg !328

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !329
  %cmp = icmp slt i32 %0, 256, !dbg !331
  br i1 %cmp, label %for.body, label %for.end, !dbg !332

for.body:                                         ; preds = %for.cond
  %1 = load %struct.huffcode**, %struct.huffcode*** %c.addr, align 8, !dbg !333
  %2 = load i32, i32* %i, align 4, !dbg !334
  %idxprom = sext i32 %2 to i64, !dbg !333
  %arrayidx = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %1, i64 %idxprom, !dbg !333
  %3 = load %struct.huffcode*, %struct.huffcode** %arrayidx, align 8, !dbg !333
  %4 = bitcast %struct.huffcode* %3 to i8*, !dbg !333
  call void @free(i8* %4) #6, !dbg !335
  br label %for.inc, !dbg !335

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !336
  %inc = add nsw i32 %5, 1, !dbg !336
  store i32 %inc, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !337, !llvm.loop !338

for.end:                                          ; preds = %for.cond
  %6 = load %struct.huffcode**, %struct.huffcode*** %c.addr, align 8, !dbg !340
  %7 = bitcast %struct.huffcode** %6 to i8*, !dbg !340
  call void @free(i8* %7) #6, !dbg !341
  ret void, !dbg !342
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @inttobits(i32 %c, i32 %n, i8* %s) #0 !dbg !343 {
entry:
  %c.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !349, metadata !DIExpression()), !dbg !350
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !351, metadata !DIExpression()), !dbg !352
  %0 = load i8*, i8** %s.addr, align 8, !dbg !353
  %1 = load i32, i32* %n.addr, align 4, !dbg !354
  %idxprom = sext i32 %1 to i64, !dbg !353
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !353
  store i8 0, i8* %arrayidx, align 1, !dbg !355
  br label %while.cond, !dbg !356

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !357
  %cmp = icmp sgt i32 %2, 0, !dbg !358
  br i1 %cmp, label %while.body, label %while.end, !dbg !356

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %c.addr, align 4, !dbg !359
  %rem = srem i32 %3, 2, !dbg !361
  %add = add nsw i32 %rem, 48, !dbg !362
  %conv = trunc i32 %add to i8, !dbg !363
  %4 = load i8*, i8** %s.addr, align 8, !dbg !364
  %5 = load i32, i32* %n.addr, align 4, !dbg !365
  %sub = sub nsw i32 %5, 1, !dbg !366
  %idxprom1 = sext i32 %sub to i64, !dbg !364
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %idxprom1, !dbg !364
  store i8 %conv, i8* %arrayidx2, align 1, !dbg !367
  %6 = load i32, i32* %c.addr, align 4, !dbg !368
  %shr = ashr i32 %6, 1, !dbg !368
  store i32 %shr, i32* %c.addr, align 4, !dbg !368
  %7 = load i32, i32* %n.addr, align 4, !dbg !369
  %dec = add nsw i32 %7, -1, !dbg !369
  store i32 %dec, i32* %n.addr, align 4, !dbg !369
  br label %while.cond, !dbg !356, !llvm.loop !370

while.end:                                        ; preds = %while.cond
  ret void, !dbg !372
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !373 {
entry:
  %retval = alloca i32, align 4
  %r = alloca %struct.huffcode**, align 8
  %i = alloca i32, align 4
  %strbit = alloca [100 x i8], align 16
  %p = alloca i8*, align 8
  %freqs = alloca [256 x i64], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.huffcode*** %r, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata [100 x i8]* %strbit, metadata !380, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i8** %p, metadata !385, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.declare(metadata [256 x i64]* %freqs, metadata !387, metadata !DIExpression()), !dbg !391
  %arraydecay = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 0, !dbg !392
  %0 = bitcast i64* %arraydecay to i8*, !dbg !392
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 2048, i1 false), !dbg !392
  %1 = load i8*, i8** @test, align 8, !dbg !393
  store i8* %1, i8** %p, align 8, !dbg !394
  br label %while.cond, !dbg !395

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i8*, i8** %p, align 8, !dbg !396
  %3 = load i8, i8* %2, align 1, !dbg !397
  %conv = sext i8 %3 to i32, !dbg !397
  %cmp = icmp ne i32 %conv, 0, !dbg !398
  br i1 %cmp, label %while.body, label %while.end, !dbg !395

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** %p, align 8, !dbg !399
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !399
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !399
  %5 = load i8, i8* %4, align 1, !dbg !400
  %idxprom = sext i8 %5 to i64, !dbg !401
  %arrayidx = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 %idxprom, !dbg !401
  %6 = load i64, i64* %arrayidx, align 8, !dbg !402
  %inc = add nsw i64 %6, 1, !dbg !402
  store i64 %inc, i64* %arrayidx, align 8, !dbg !402
  br label %while.cond, !dbg !395, !llvm.loop !403

while.end:                                        ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 0, !dbg !404
  %call = call %struct.huffcode** @create_huffman_codes(i64* %arraydecay2), !dbg !405
  store %struct.huffcode** %call, %struct.huffcode*** %r, align 8, !dbg !406
  store i32 0, i32* %i, align 4, !dbg !407
  br label %for.cond, !dbg !409

for.cond:                                         ; preds = %for.inc, %while.end
  %7 = load i32, i32* %i, align 4, !dbg !410
  %cmp3 = icmp slt i32 %7, 256, !dbg !412
  br i1 %cmp3, label %for.body, label %for.end, !dbg !413

for.body:                                         ; preds = %for.cond
  %8 = load %struct.huffcode**, %struct.huffcode*** %r, align 8, !dbg !414
  %9 = load i32, i32* %i, align 4, !dbg !417
  %idxprom5 = sext i32 %9 to i64, !dbg !414
  %arrayidx6 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %8, i64 %idxprom5, !dbg !414
  %10 = load %struct.huffcode*, %struct.huffcode** %arrayidx6, align 8, !dbg !414
  %cmp7 = icmp ne %struct.huffcode* %10, null, !dbg !418
  br i1 %cmp7, label %if.then, label %if.end, !dbg !419, !cf.info !71

if.then:                                          ; preds = %for.body
  %11 = load %struct.huffcode**, %struct.huffcode*** %r, align 8, !dbg !420
  %12 = load i32, i32* %i, align 4, !dbg !422
  %idxprom9 = sext i32 %12 to i64, !dbg !420
  %arrayidx10 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %11, i64 %idxprom9, !dbg !420
  %13 = load %struct.huffcode*, %struct.huffcode** %arrayidx10, align 8, !dbg !420
  %code = getelementptr inbounds %struct.huffcode, %struct.huffcode* %13, i32 0, i32 1, !dbg !423
  %14 = load i32, i32* %code, align 4, !dbg !423
  %15 = load %struct.huffcode**, %struct.huffcode*** %r, align 8, !dbg !424
  %16 = load i32, i32* %i, align 4, !dbg !425
  %idxprom11 = sext i32 %16 to i64, !dbg !424
  %arrayidx12 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %15, i64 %idxprom11, !dbg !424
  %17 = load %struct.huffcode*, %struct.huffcode** %arrayidx12, align 8, !dbg !424
  %nbits = getelementptr inbounds %struct.huffcode, %struct.huffcode* %17, i32 0, i32 0, !dbg !426
  %18 = load i32, i32* %nbits, align 4, !dbg !426
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %strbit, i64 0, i64 0, !dbg !427
  call void @inttobits(i32 %14, i32 %18, i8* %arraydecay13), !dbg !428
  %19 = load i32, i32* %i, align 4, !dbg !429
  %20 = load %struct.huffcode**, %struct.huffcode*** %r, align 8, !dbg !430
  %21 = load i32, i32* %i, align 4, !dbg !431
  %idxprom14 = sext i32 %21 to i64, !dbg !430
  %arrayidx15 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %20, i64 %idxprom14, !dbg !430
  %22 = load %struct.huffcode*, %struct.huffcode** %arrayidx15, align 8, !dbg !430
  %code16 = getelementptr inbounds %struct.huffcode, %struct.huffcode* %22, i32 0, i32 1, !dbg !432
  %23 = load i32, i32* %code16, align 4, !dbg !432
  %arraydecay17 = getelementptr inbounds [100 x i8], [100 x i8]* %strbit, i64 0, i64 0, !dbg !433
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %19, i32 %23, i8* %arraydecay17), !dbg !434
  br label %if.end, !dbg !435

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !436

for.inc:                                          ; preds = %if.end
  %24 = load i32, i32* %i, align 4, !dbg !437
  %inc19 = add nsw i32 %24, 1, !dbg !437
  store i32 %inc19, i32* %i, align 4, !dbg !437
  br label %for.cond, !dbg !438, !llvm.loop !439

for.end:                                          ; preds = %for.cond
  %25 = load %struct.huffcode**, %struct.huffcode*** %r, align 8, !dbg !441
  call void @free_huffman_codes(%struct.huffcode** %25), !dbg !442
  ret i32 0, !dbg !443
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_sort(%struct.huffheap* %heap) #0 !dbg !444 {
entry:
  %heap.addr = alloca %struct.huffheap*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32*, align 8
  %t_ = alloca i32, align 4
  store %struct.huffheap* %heap, %struct.huffheap** %heap.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.huffheap** %heap.addr, metadata !445, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata i32* %i, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 1, i32* %i, align 4, !dbg !448
  call void @llvm.dbg.declare(metadata i32* %j, metadata !449, metadata !DIExpression()), !dbg !450
  store i32 2, i32* %j, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata i32** %a, metadata !451, metadata !DIExpression()), !dbg !452
  %0 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !453
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 0, !dbg !454
  %1 = load i32*, i32** %h, align 8, !dbg !454
  store i32* %1, i32** %a, align 8, !dbg !452
  br label %while.cond, !dbg !455

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, i32* %i, align 4, !dbg !456
  %3 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !457
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %3, i32 0, i32 1, !dbg !458
  %4 = load i32, i32* %n, align 8, !dbg !458
  %cmp = icmp slt i32 %2, %4, !dbg !459
  br i1 %cmp, label %while.body, label %while.end, !dbg !455

while.body:                                       ; preds = %while.cond
  %5 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !460
  %f = getelementptr inbounds %struct.huffheap, %struct.huffheap* %5, i32 0, i32 4, !dbg !463
  %6 = load i64*, i64** %f, align 8, !dbg !463
  %7 = load i32*, i32** %a, align 8, !dbg !464
  %8 = load i32, i32* %i, align 4, !dbg !465
  %sub = sub nsw i32 %8, 1, !dbg !466
  %idxprom = sext i32 %sub to i64, !dbg !464
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !464
  %9 = load i32, i32* %arrayidx, align 4, !dbg !464
  %idxprom1 = sext i32 %9 to i64, !dbg !460
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %idxprom1, !dbg !460
  %10 = load i64, i64* %arrayidx2, align 8, !dbg !460
  %11 = load %struct.huffheap*, %struct.huffheap** %heap.addr, align 8, !dbg !467
  %f3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %11, i32 0, i32 4, !dbg !468
  %12 = load i64*, i64** %f3, align 8, !dbg !468
  %13 = load i32*, i32** %a, align 8, !dbg !469
  %14 = load i32, i32* %i, align 4, !dbg !470
  %idxprom4 = sext i32 %14 to i64, !dbg !469
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 %idxprom4, !dbg !469
  %15 = load i32, i32* %arrayidx5, align 4, !dbg !469
  %idxprom6 = sext i32 %15 to i64, !dbg !467
  %arrayidx7 = getelementptr inbounds i64, i64* %12, i64 %idxprom6, !dbg !467
  %16 = load i64, i64* %arrayidx7, align 8, !dbg !467
  %cmp8 = icmp sge i64 %10, %16, !dbg !471
  br i1 %cmp8, label %if.then, label %if.else, !dbg !472, !cf.info !71

if.then:                                          ; preds = %while.body
  %17 = load i32, i32* %j, align 4, !dbg !473
  store i32 %17, i32* %i, align 4, !dbg !475
  %18 = load i32, i32* %j, align 4, !dbg !476
  %inc = add nsw i32 %18, 1, !dbg !476
  store i32 %inc, i32* %j, align 4, !dbg !476
  br label %if.end, !dbg !477

if.else:                                          ; preds = %while.body
  br label %do.body, !dbg !478

do.body:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i32* %t_, metadata !480, metadata !DIExpression()), !dbg !482
  %19 = load i32*, i32** %a, align 8, !dbg !482
  %20 = load i32, i32* %i, align 4, !dbg !482
  %sub9 = sub nsw i32 %20, 1, !dbg !482
  %idxprom10 = sext i32 %sub9 to i64, !dbg !482
  %arrayidx11 = getelementptr inbounds i32, i32* %19, i64 %idxprom10, !dbg !482
  %21 = load i32, i32* %arrayidx11, align 4, !dbg !482
  store i32 %21, i32* %t_, align 4, !dbg !482
  %22 = load i32*, i32** %a, align 8, !dbg !482
  %23 = load i32, i32* %i, align 4, !dbg !482
  %idxprom12 = sext i32 %23 to i64, !dbg !482
  %arrayidx13 = getelementptr inbounds i32, i32* %22, i64 %idxprom12, !dbg !482
  %24 = load i32, i32* %arrayidx13, align 4, !dbg !482
  %25 = load i32*, i32** %a, align 8, !dbg !482
  %26 = load i32, i32* %i, align 4, !dbg !482
  %sub14 = sub nsw i32 %26, 1, !dbg !482
  %idxprom15 = sext i32 %sub14 to i64, !dbg !482
  %arrayidx16 = getelementptr inbounds i32, i32* %25, i64 %idxprom15, !dbg !482
  store i32 %24, i32* %arrayidx16, align 4, !dbg !482
  %27 = load i32, i32* %t_, align 4, !dbg !482
  %28 = load i32*, i32** %a, align 8, !dbg !482
  %29 = load i32, i32* %i, align 4, !dbg !482
  %idxprom17 = sext i32 %29 to i64, !dbg !482
  %arrayidx18 = getelementptr inbounds i32, i32* %28, i64 %idxprom17, !dbg !482
  store i32 %27, i32* %arrayidx18, align 4, !dbg !482
  br label %do.end, !dbg !482

do.end:                                           ; preds = %do.body
  %30 = load i32, i32* %i, align 4, !dbg !483
  %dec = add nsw i32 %30, -1, !dbg !483
  store i32 %dec, i32* %i, align 4, !dbg !483
  %31 = load i32, i32* %i, align 4, !dbg !484
  %cmp19 = icmp eq i32 %31, 0, !dbg !485
  br i1 %cmp19, label %cond.true, label %cond.false, !dbg !486

cond.true:                                        ; preds = %do.end
  %32 = load i32, i32* %j, align 4, !dbg !487
  %inc20 = add nsw i32 %32, 1, !dbg !487
  store i32 %inc20, i32* %j, align 4, !dbg !487
  br label %cond.end, !dbg !486

cond.false:                                       ; preds = %do.end
  %33 = load i32, i32* %i, align 4, !dbg !488
  br label %cond.end, !dbg !486

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %32, %cond.true ], [ %33, %cond.false ], !dbg !486
  store i32 %cond, i32* %i, align 4, !dbg !489
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  br label %while.cond, !dbg !455, !llvm.loop !490

while.end:                                        ; preds = %while.cond
  ret void, !dbg !492
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "test", scope: !2, file: !3, line: 147, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "huffman-coding-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Huffman-coding")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "create_huffman_codes", scope: !3, file: !3, line: 78, type: !16, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !26}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "huffcode_t", file: !3, line: 11, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "huffcode", file: !3, line: 7, size: 64, elements: !22)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "nbits", scope: !21, file: !3, line: 8, baseType: !24, size: 32)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !21, file: !3, line: 9, baseType: !24, size: 32, offset: 32)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!28 = !DILocalVariable(name: "freqs", arg: 1, scope: !15, file: !3, line: 78, type: !26)
!29 = !DILocation(line: 78, column: 41, scope: !15)
!30 = !DILocalVariable(name: "codes", scope: !15, file: !3, line: 80, type: !18)
!31 = !DILocation(line: 80, column: 16, scope: !15)
!32 = !DILocalVariable(name: "heap", scope: !15, file: !3, line: 81, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "heap_t", file: !3, line: 18, baseType: !35)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "huffheap", file: !3, line: 13, size: 256, elements: !36)
!36 = !{!37, !39, !40, !41, !42}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !35, file: !3, line: 14, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !35, file: !3, line: 15, baseType: !24, size: 32, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !35, file: !3, line: 15, baseType: !24, size: 32, offset: 96)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "cs", scope: !35, file: !3, line: 15, baseType: !24, size: 32, offset: 128)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "f", scope: !35, file: !3, line: 16, baseType: !26, size: 64, offset: 192)
!43 = !DILocation(line: 81, column: 11, scope: !15)
!44 = !DILocalVariable(name: "efreqs", scope: !15, file: !3, line: 82, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 32768, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 512)
!48 = !DILocation(line: 82, column: 8, scope: !15)
!49 = !DILocalVariable(name: "preds", scope: !15, file: !3, line: 83, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 16384, elements: !46)
!51 = !DILocation(line: 83, column: 7, scope: !15)
!52 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 84, type: !24)
!53 = !DILocation(line: 84, column: 7, scope: !15)
!54 = !DILocalVariable(name: "extf", scope: !15, file: !3, line: 84, type: !24)
!55 = !DILocation(line: 84, column: 10, scope: !15)
!56 = !DILocalVariable(name: "r1", scope: !15, file: !3, line: 85, type: !24)
!57 = !DILocation(line: 85, column: 7, scope: !15)
!58 = !DILocalVariable(name: "r2", scope: !15, file: !3, line: 85, type: !24)
!59 = !DILocation(line: 85, column: 11, scope: !15)
!60 = !DILocation(line: 87, column: 3, scope: !15)
!61 = !DILocation(line: 87, column: 18, scope: !15)
!62 = !DILocation(line: 88, column: 11, scope: !15)
!63 = !DILocation(line: 88, column: 3, scope: !15)
!64 = !DILocation(line: 90, column: 32, scope: !15)
!65 = !DILocation(line: 90, column: 10, scope: !15)
!66 = !DILocation(line: 90, column: 8, scope: !15)
!67 = !DILocation(line: 91, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !15, file: !3, line: 91, column: 8)
!69 = !DILocation(line: 91, column: 13, scope: !68)
!70 = !DILocation(line: 91, column: 8, scope: !15)
!71 = !{!"if"}
!72 = !DILocation(line: 91, column: 23, scope: !68)
!73 = !DILocation(line: 93, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !15, file: !3, line: 93, column: 3)
!75 = !DILocation(line: 93, column: 7, scope: !74)
!76 = !DILocation(line: 93, column: 12, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !3, line: 93, column: 3)
!78 = !DILocation(line: 93, column: 14, scope: !77)
!79 = !DILocation(line: 93, column: 3, scope: !74)
!80 = !DILocation(line: 93, column: 40, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 93, column: 33)
!82 = !DILocation(line: 93, column: 33, scope: !81)
!83 = !DILocation(line: 93, column: 43, scope: !81)
!84 = !DILocation(line: 93, column: 33, scope: !77)
!85 = !DILocation(line: 93, column: 59, scope: !81)
!86 = !DILocation(line: 93, column: 65, scope: !81)
!87 = !DILocation(line: 93, column: 49, scope: !81)
!88 = !DILocation(line: 93, column: 45, scope: !81)
!89 = !DILocation(line: 93, column: 24, scope: !77)
!90 = !DILocation(line: 93, column: 3, scope: !77)
!91 = distinct !{!91, !79, !92}
!92 = !DILocation(line: 93, column: 66, scope: !74)
!93 = !DILocation(line: 95, column: 3, scope: !15)
!94 = !DILocation(line: 95, column: 10, scope: !15)
!95 = !DILocation(line: 95, column: 16, scope: !15)
!96 = !DILocation(line: 95, column: 18, scope: !15)
!97 = !DILocation(line: 97, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !15, file: !3, line: 96, column: 3)
!99 = !DILocation(line: 97, column: 10, scope: !98)
!100 = !DILocation(line: 97, column: 8, scope: !98)
!101 = !DILocation(line: 98, column: 23, scope: !98)
!102 = !DILocation(line: 98, column: 10, scope: !98)
!103 = !DILocation(line: 98, column: 8, scope: !98)
!104 = !DILocation(line: 99, column: 27, scope: !98)
!105 = !DILocation(line: 99, column: 20, scope: !98)
!106 = !DILocation(line: 99, column: 40, scope: !98)
!107 = !DILocation(line: 99, column: 33, scope: !98)
!108 = !DILocation(line: 99, column: 31, scope: !98)
!109 = !DILocation(line: 99, column: 12, scope: !98)
!110 = !DILocation(line: 99, column: 5, scope: !98)
!111 = !DILocation(line: 99, column: 18, scope: !98)
!112 = !DILocation(line: 100, column: 15, scope: !98)
!113 = !DILocation(line: 100, column: 21, scope: !98)
!114 = !DILocation(line: 100, column: 5, scope: !98)
!115 = !DILocation(line: 101, column: 17, scope: !98)
!116 = !DILocation(line: 101, column: 11, scope: !98)
!117 = !DILocation(line: 101, column: 5, scope: !98)
!118 = !DILocation(line: 101, column: 15, scope: !98)
!119 = !DILocation(line: 102, column: 18, scope: !98)
!120 = !DILocation(line: 102, column: 17, scope: !98)
!121 = !DILocation(line: 102, column: 11, scope: !98)
!122 = !DILocation(line: 102, column: 5, scope: !98)
!123 = !DILocation(line: 102, column: 15, scope: !98)
!124 = !DILocation(line: 103, column: 9, scope: !98)
!125 = distinct !{!125, !93, !126}
!126 = !DILocation(line: 104, column: 3, scope: !15)
!127 = !DILocation(line: 105, column: 21, scope: !15)
!128 = !DILocation(line: 105, column: 8, scope: !15)
!129 = !DILocation(line: 105, column: 6, scope: !15)
!130 = !DILocation(line: 106, column: 15, scope: !15)
!131 = !DILocation(line: 106, column: 9, scope: !15)
!132 = !DILocation(line: 106, column: 3, scope: !15)
!133 = !DILocation(line: 106, column: 13, scope: !15)
!134 = !DILocation(line: 107, column: 17, scope: !15)
!135 = !DILocation(line: 107, column: 3, scope: !15)
!136 = !DILocation(line: 109, column: 11, scope: !15)
!137 = !DILocation(line: 109, column: 9, scope: !15)
!138 = !DILocalVariable(name: "bc", scope: !15, file: !3, line: 111, type: !24)
!139 = !DILocation(line: 111, column: 7, scope: !15)
!140 = !DILocalVariable(name: "bn", scope: !15, file: !3, line: 111, type: !24)
!141 = !DILocation(line: 111, column: 11, scope: !15)
!142 = !DILocalVariable(name: "ix", scope: !15, file: !3, line: 111, type: !24)
!143 = !DILocation(line: 111, column: 15, scope: !15)
!144 = !DILocation(line: 112, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !15, file: !3, line: 112, column: 3)
!146 = !DILocation(line: 112, column: 7, scope: !145)
!147 = !DILocation(line: 112, column: 12, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 112, column: 3)
!149 = !DILocation(line: 112, column: 14, scope: !148)
!150 = !DILocation(line: 112, column: 3, scope: !145)
!151 = !DILocation(line: 113, column: 7, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 112, column: 28)
!153 = !DILocation(line: 113, column: 13, scope: !152)
!154 = !DILocation(line: 114, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !3, line: 114, column: 10)
!156 = !DILocation(line: 114, column: 10, scope: !155)
!157 = !DILocation(line: 114, column: 20, scope: !155)
!158 = !DILocation(line: 114, column: 10, scope: !152)
!159 = !DILocation(line: 114, column: 29, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !3, line: 114, column: 27)
!161 = !DILocation(line: 114, column: 35, scope: !160)
!162 = !DILocation(line: 114, column: 38, scope: !160)
!163 = !DILocation(line: 114, column: 46, scope: !160)
!164 = !DILocation(line: 115, column: 10, scope: !152)
!165 = !DILocation(line: 115, column: 8, scope: !152)
!166 = !DILocation(line: 116, column: 5, scope: !152)
!167 = !DILocation(line: 116, column: 22, scope: !152)
!168 = !DILocation(line: 116, column: 16, scope: !152)
!169 = !DILocation(line: 116, column: 12, scope: !152)
!170 = !DILocation(line: 116, column: 30, scope: !152)
!171 = !DILocation(line: 116, column: 27, scope: !152)
!172 = !DILocation(line: 117, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !152, file: !3, line: 116, column: 35)
!174 = !DILocation(line: 117, column: 15, scope: !173)
!175 = !DILocation(line: 117, column: 25, scope: !173)
!176 = !DILocation(line: 117, column: 14, scope: !173)
!177 = !DILocation(line: 117, column: 44, scope: !173)
!178 = !DILocation(line: 117, column: 41, scope: !173)
!179 = !DILocation(line: 117, column: 10, scope: !173)
!180 = !DILocation(line: 118, column: 22, scope: !173)
!181 = !DILocation(line: 118, column: 16, scope: !173)
!182 = !DILocation(line: 118, column: 12, scope: !173)
!183 = !DILocation(line: 118, column: 10, scope: !173)
!184 = !DILocation(line: 119, column: 9, scope: !173)
!185 = distinct !{!185, !166, !186}
!186 = !DILocation(line: 120, column: 5, scope: !152)
!187 = !DILocation(line: 121, column: 16, scope: !152)
!188 = !DILocation(line: 121, column: 5, scope: !152)
!189 = !DILocation(line: 121, column: 11, scope: !152)
!190 = !DILocation(line: 121, column: 14, scope: !152)
!191 = !DILocation(line: 122, column: 23, scope: !152)
!192 = !DILocation(line: 122, column: 5, scope: !152)
!193 = !DILocation(line: 122, column: 11, scope: !152)
!194 = !DILocation(line: 122, column: 15, scope: !152)
!195 = !DILocation(line: 122, column: 21, scope: !152)
!196 = !DILocation(line: 123, column: 22, scope: !152)
!197 = !DILocation(line: 123, column: 5, scope: !152)
!198 = !DILocation(line: 123, column: 11, scope: !152)
!199 = !DILocation(line: 123, column: 15, scope: !152)
!200 = !DILocation(line: 123, column: 20, scope: !152)
!201 = !DILocation(line: 124, column: 3, scope: !152)
!202 = !DILocation(line: 112, column: 24, scope: !148)
!203 = !DILocation(line: 112, column: 3, scope: !148)
!204 = distinct !{!204, !150, !205}
!205 = !DILocation(line: 124, column: 3, scope: !145)
!206 = !DILocation(line: 125, column: 10, scope: !15)
!207 = !DILocation(line: 125, column: 3, scope: !15)
!208 = !DILocation(line: 126, column: 1, scope: !15)
!209 = distinct !DISubprogram(name: "_heap_create", scope: !3, file: !3, line: 21, type: !210, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!210 = !DISubroutineType(types: !211)
!211 = !{!33, !24, !26}
!212 = !DILocalVariable(name: "s", arg: 1, scope: !209, file: !3, line: 21, type: !24)
!213 = !DILocation(line: 21, column: 33, scope: !209)
!214 = !DILocalVariable(name: "f", arg: 2, scope: !209, file: !3, line: 21, type: !26)
!215 = !DILocation(line: 21, column: 42, scope: !209)
!216 = !DILocalVariable(name: "h", scope: !209, file: !3, line: 23, type: !33)
!217 = !DILocation(line: 23, column: 11, scope: !209)
!218 = !DILocation(line: 24, column: 7, scope: !209)
!219 = !DILocation(line: 24, column: 5, scope: !209)
!220 = !DILocation(line: 25, column: 29, scope: !209)
!221 = !DILocation(line: 25, column: 28, scope: !209)
!222 = !DILocation(line: 25, column: 10, scope: !209)
!223 = !DILocation(line: 25, column: 3, scope: !209)
!224 = !DILocation(line: 25, column: 6, scope: !209)
!225 = !DILocation(line: 25, column: 8, scope: !209)
!226 = !DILocation(line: 26, column: 18, scope: !209)
!227 = !DILocation(line: 26, column: 10, scope: !209)
!228 = !DILocation(line: 26, column: 13, scope: !209)
!229 = !DILocation(line: 26, column: 16, scope: !209)
!230 = !DILocation(line: 26, column: 3, scope: !209)
!231 = !DILocation(line: 26, column: 6, scope: !209)
!232 = !DILocation(line: 26, column: 8, scope: !209)
!233 = !DILocation(line: 27, column: 3, scope: !209)
!234 = !DILocation(line: 27, column: 6, scope: !209)
!235 = !DILocation(line: 27, column: 8, scope: !209)
!236 = !DILocation(line: 28, column: 10, scope: !209)
!237 = !DILocation(line: 28, column: 3, scope: !209)
!238 = !DILocation(line: 28, column: 6, scope: !209)
!239 = !DILocation(line: 28, column: 8, scope: !209)
!240 = !DILocation(line: 29, column: 10, scope: !209)
!241 = !DILocation(line: 29, column: 3, scope: !209)
!242 = distinct !DISubprogram(name: "_heap_add", scope: !3, file: !3, line: 57, type: !243, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!243 = !DISubroutineType(types: !244)
!244 = !{null, !33, !24}
!245 = !DILocalVariable(name: "heap", arg: 1, scope: !242, file: !3, line: 57, type: !33)
!246 = !DILocation(line: 57, column: 31, scope: !242)
!247 = !DILocalVariable(name: "c", arg: 2, scope: !242, file: !3, line: 57, type: !24)
!248 = !DILocation(line: 57, column: 41, scope: !242)
!249 = !DILocation(line: 59, column: 9, scope: !250)
!250 = distinct !DILexicalBlock(scope: !242, file: !3, line: 59, column: 8)
!251 = !DILocation(line: 59, column: 15, scope: !250)
!252 = !DILocation(line: 59, column: 17, scope: !250)
!253 = !DILocation(line: 59, column: 24, scope: !250)
!254 = !DILocation(line: 59, column: 30, scope: !250)
!255 = !DILocation(line: 59, column: 22, scope: !250)
!256 = !DILocation(line: 59, column: 8, scope: !242)
!257 = !DILocation(line: 60, column: 23, scope: !258)
!258 = distinct !DILexicalBlock(scope: !250, file: !3, line: 59, column: 34)
!259 = !DILocation(line: 60, column: 29, scope: !258)
!260 = !DILocation(line: 60, column: 32, scope: !258)
!261 = !DILocation(line: 60, column: 38, scope: !258)
!262 = !DILocation(line: 60, column: 42, scope: !258)
!263 = !DILocation(line: 60, column: 48, scope: !258)
!264 = !DILocation(line: 60, column: 40, scope: !258)
!265 = !DILocation(line: 60, column: 15, scope: !258)
!266 = !DILocation(line: 60, column: 5, scope: !258)
!267 = !DILocation(line: 60, column: 11, scope: !258)
!268 = !DILocation(line: 60, column: 13, scope: !258)
!269 = !DILocation(line: 61, column: 16, scope: !258)
!270 = !DILocation(line: 61, column: 22, scope: !258)
!271 = !DILocation(line: 61, column: 5, scope: !258)
!272 = !DILocation(line: 61, column: 11, scope: !258)
!273 = !DILocation(line: 61, column: 13, scope: !258)
!274 = !DILocation(line: 62, column: 3, scope: !258)
!275 = !DILocation(line: 63, column: 22, scope: !242)
!276 = !DILocation(line: 63, column: 3, scope: !242)
!277 = !DILocation(line: 63, column: 9, scope: !242)
!278 = !DILocation(line: 63, column: 11, scope: !242)
!279 = !DILocation(line: 63, column: 17, scope: !242)
!280 = !DILocation(line: 63, column: 20, scope: !242)
!281 = !DILocation(line: 64, column: 3, scope: !242)
!282 = !DILocation(line: 64, column: 9, scope: !242)
!283 = !DILocation(line: 64, column: 10, scope: !242)
!284 = !DILocation(line: 65, column: 14, scope: !242)
!285 = !DILocation(line: 65, column: 3, scope: !242)
!286 = !DILocation(line: 66, column: 1, scope: !242)
!287 = distinct !DISubprogram(name: "_heap_remove", scope: !3, file: !3, line: 68, type: !288, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!288 = !DISubroutineType(types: !289)
!289 = !{!24, !33}
!290 = !DILocalVariable(name: "heap", arg: 1, scope: !287, file: !3, line: 68, type: !33)
!291 = !DILocation(line: 68, column: 33, scope: !287)
!292 = !DILocation(line: 70, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !3, line: 70, column: 8)
!294 = !DILocation(line: 70, column: 14, scope: !293)
!295 = !DILocation(line: 70, column: 16, scope: !293)
!296 = !DILocation(line: 70, column: 8, scope: !287)
!297 = !DILocation(line: 71, column: 5, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !3, line: 70, column: 22)
!299 = !DILocation(line: 71, column: 11, scope: !298)
!300 = !DILocation(line: 71, column: 12, scope: !298)
!301 = !DILocation(line: 72, column: 12, scope: !298)
!302 = !DILocation(line: 72, column: 18, scope: !298)
!303 = !DILocation(line: 72, column: 20, scope: !298)
!304 = !DILocation(line: 72, column: 26, scope: !298)
!305 = !DILocation(line: 72, column: 5, scope: !298)
!306 = !DILocation(line: 74, column: 3, scope: !287)
!307 = !DILocation(line: 75, column: 1, scope: !287)
!308 = distinct !DISubprogram(name: "_heap_destroy", scope: !3, file: !3, line: 32, type: !309, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !33}
!311 = !DILocalVariable(name: "heap", arg: 1, scope: !308, file: !3, line: 32, type: !33)
!312 = !DILocation(line: 32, column: 35, scope: !308)
!313 = !DILocation(line: 34, column: 8, scope: !308)
!314 = !DILocation(line: 34, column: 14, scope: !308)
!315 = !DILocation(line: 34, column: 3, scope: !308)
!316 = !DILocation(line: 35, column: 8, scope: !308)
!317 = !DILocation(line: 35, column: 3, scope: !308)
!318 = !DILocation(line: 36, column: 1, scope: !308)
!319 = distinct !DISubprogram(name: "free_huffman_codes", scope: !3, file: !3, line: 128, type: !320, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !18}
!322 = !DILocalVariable(name: "c", arg: 1, scope: !319, file: !3, line: 128, type: !18)
!323 = !DILocation(line: 128, column: 38, scope: !319)
!324 = !DILocalVariable(name: "i", scope: !319, file: !3, line: 130, type: !24)
!325 = !DILocation(line: 130, column: 7, scope: !319)
!326 = !DILocation(line: 132, column: 8, scope: !327)
!327 = distinct !DILexicalBlock(scope: !319, file: !3, line: 132, column: 3)
!328 = !DILocation(line: 132, column: 7, scope: !327)
!329 = !DILocation(line: 132, column: 12, scope: !330)
!330 = distinct !DILexicalBlock(scope: !327, file: !3, line: 132, column: 3)
!331 = !DILocation(line: 132, column: 14, scope: !330)
!332 = !DILocation(line: 132, column: 3, scope: !327)
!333 = !DILocation(line: 132, column: 33, scope: !330)
!334 = !DILocation(line: 132, column: 35, scope: !330)
!335 = !DILocation(line: 132, column: 28, scope: !330)
!336 = !DILocation(line: 132, column: 24, scope: !330)
!337 = !DILocation(line: 132, column: 3, scope: !330)
!338 = distinct !{!338, !332, !339}
!339 = !DILocation(line: 132, column: 37, scope: !327)
!340 = !DILocation(line: 133, column: 8, scope: !319)
!341 = !DILocation(line: 133, column: 3, scope: !319)
!342 = !DILocation(line: 134, column: 1, scope: !319)
!343 = distinct !DISubprogram(name: "inttobits", scope: !3, file: !3, line: 138, type: !344, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!344 = !DISubroutineType(types: !345)
!345 = !{null, !24, !24, !346}
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!347 = !DILocalVariable(name: "c", arg: 1, scope: !343, file: !3, line: 138, type: !24)
!348 = !DILocation(line: 138, column: 20, scope: !343)
!349 = !DILocalVariable(name: "n", arg: 2, scope: !343, file: !3, line: 138, type: !24)
!350 = !DILocation(line: 138, column: 27, scope: !343)
!351 = !DILocalVariable(name: "s", arg: 3, scope: !343, file: !3, line: 138, type: !346)
!352 = !DILocation(line: 138, column: 36, scope: !343)
!353 = !DILocation(line: 140, column: 3, scope: !343)
!354 = !DILocation(line: 140, column: 5, scope: !343)
!355 = !DILocation(line: 140, column: 8, scope: !343)
!356 = !DILocation(line: 141, column: 3, scope: !343)
!357 = !DILocation(line: 141, column: 9, scope: !343)
!358 = !DILocation(line: 141, column: 11, scope: !343)
!359 = !DILocation(line: 142, column: 15, scope: !360)
!360 = distinct !DILexicalBlock(scope: !343, file: !3, line: 141, column: 16)
!361 = !DILocation(line: 142, column: 16, scope: !360)
!362 = !DILocation(line: 142, column: 20, scope: !360)
!363 = !DILocation(line: 142, column: 14, scope: !360)
!364 = !DILocation(line: 142, column: 5, scope: !360)
!365 = !DILocation(line: 142, column: 7, scope: !360)
!366 = !DILocation(line: 142, column: 8, scope: !360)
!367 = !DILocation(line: 142, column: 12, scope: !360)
!368 = !DILocation(line: 143, column: 7, scope: !360)
!369 = !DILocation(line: 143, column: 15, scope: !360)
!370 = distinct !{!370, !356, !371}
!371 = !DILocation(line: 144, column: 3, scope: !343)
!372 = !DILocation(line: 145, column: 1, scope: !343)
!373 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 149, type: !374, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!374 = !DISubroutineType(types: !375)
!375 = !{!24}
!376 = !DILocalVariable(name: "r", scope: !373, file: !3, line: 151, type: !18)
!377 = !DILocation(line: 151, column: 16, scope: !373)
!378 = !DILocalVariable(name: "i", scope: !373, file: !3, line: 152, type: !24)
!379 = !DILocation(line: 152, column: 7, scope: !373)
!380 = !DILocalVariable(name: "strbit", scope: !373, file: !3, line: 153, type: !381)
!381 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 800, elements: !382)
!382 = !{!383}
!383 = !DISubrange(count: 100)
!384 = !DILocation(line: 153, column: 8, scope: !373)
!385 = !DILocalVariable(name: "p", scope: !373, file: !3, line: 154, type: !8)
!386 = !DILocation(line: 154, column: 15, scope: !373)
!387 = !DILocalVariable(name: "freqs", scope: !373, file: !3, line: 155, type: !388)
!388 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 16384, elements: !389)
!389 = !{!390}
!390 = !DISubrange(count: 256)
!391 = !DILocation(line: 155, column: 8, scope: !373)
!392 = !DILocation(line: 157, column: 3, scope: !373)
!393 = !DILocation(line: 159, column: 7, scope: !373)
!394 = !DILocation(line: 159, column: 5, scope: !373)
!395 = !DILocation(line: 160, column: 3, scope: !373)
!396 = !DILocation(line: 160, column: 10, scope: !373)
!397 = !DILocation(line: 160, column: 9, scope: !373)
!398 = !DILocation(line: 160, column: 12, scope: !373)
!399 = !DILocation(line: 160, column: 29, scope: !373)
!400 = !DILocation(line: 160, column: 27, scope: !373)
!401 = !DILocation(line: 160, column: 21, scope: !373)
!402 = !DILocation(line: 160, column: 32, scope: !373)
!403 = distinct !{!403, !395, !402}
!404 = !DILocation(line: 162, column: 28, scope: !373)
!405 = !DILocation(line: 162, column: 7, scope: !373)
!406 = !DILocation(line: 162, column: 5, scope: !373)
!407 = !DILocation(line: 164, column: 8, scope: !408)
!408 = distinct !DILexicalBlock(scope: !373, file: !3, line: 164, column: 3)
!409 = !DILocation(line: 164, column: 7, scope: !408)
!410 = !DILocation(line: 164, column: 12, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !3, line: 164, column: 3)
!412 = !DILocation(line: 164, column: 14, scope: !411)
!413 = !DILocation(line: 164, column: 3, scope: !408)
!414 = !DILocation(line: 165, column: 10, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 165, column: 10)
!416 = distinct !DILexicalBlock(scope: !411, file: !3, line: 164, column: 28)
!417 = !DILocation(line: 165, column: 12, scope: !415)
!418 = !DILocation(line: 165, column: 15, scope: !415)
!419 = !DILocation(line: 165, column: 10, scope: !416)
!420 = !DILocation(line: 166, column: 17, scope: !421)
!421 = distinct !DILexicalBlock(scope: !415, file: !3, line: 165, column: 25)
!422 = !DILocation(line: 166, column: 19, scope: !421)
!423 = !DILocation(line: 166, column: 23, scope: !421)
!424 = !DILocation(line: 166, column: 29, scope: !421)
!425 = !DILocation(line: 166, column: 31, scope: !421)
!426 = !DILocation(line: 166, column: 35, scope: !421)
!427 = !DILocation(line: 166, column: 42, scope: !421)
!428 = !DILocation(line: 166, column: 7, scope: !421)
!429 = !DILocation(line: 167, column: 30, scope: !421)
!430 = !DILocation(line: 167, column: 33, scope: !421)
!431 = !DILocation(line: 167, column: 35, scope: !421)
!432 = !DILocation(line: 167, column: 39, scope: !421)
!433 = !DILocation(line: 167, column: 45, scope: !421)
!434 = !DILocation(line: 167, column: 7, scope: !421)
!435 = !DILocation(line: 168, column: 5, scope: !421)
!436 = !DILocation(line: 169, column: 3, scope: !416)
!437 = !DILocation(line: 164, column: 24, scope: !411)
!438 = !DILocation(line: 164, column: 3, scope: !411)
!439 = distinct !{!439, !413, !440}
!440 = !DILocation(line: 169, column: 3, scope: !408)
!441 = !DILocation(line: 171, column: 22, scope: !373)
!442 = !DILocation(line: 171, column: 3, scope: !373)
!443 = !DILocation(line: 173, column: 3, scope: !373)
!444 = distinct !DISubprogram(name: "_heap_sort", scope: !3, file: !3, line: 40, type: !309, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!445 = !DILocalVariable(name: "heap", arg: 1, scope: !444, file: !3, line: 40, type: !33)
!446 = !DILocation(line: 40, column: 32, scope: !444)
!447 = !DILocalVariable(name: "i", scope: !444, file: !3, line: 42, type: !24)
!448 = !DILocation(line: 42, column: 7, scope: !444)
!449 = !DILocalVariable(name: "j", scope: !444, file: !3, line: 42, type: !24)
!450 = !DILocation(line: 42, column: 12, scope: !444)
!451 = !DILocalVariable(name: "a", scope: !444, file: !3, line: 43, type: !38)
!452 = !DILocation(line: 43, column: 8, scope: !444)
!453 = !DILocation(line: 43, column: 12, scope: !444)
!454 = !DILocation(line: 43, column: 18, scope: !444)
!455 = !DILocation(line: 45, column: 3, scope: !444)
!456 = !DILocation(line: 45, column: 9, scope: !444)
!457 = !DILocation(line: 45, column: 13, scope: !444)
!458 = !DILocation(line: 45, column: 19, scope: !444)
!459 = !DILocation(line: 45, column: 11, scope: !444)
!460 = !DILocation(line: 46, column: 10, scope: !461)
!461 = distinct !DILexicalBlock(scope: !462, file: !3, line: 46, column: 10)
!462 = distinct !DILexicalBlock(scope: !444, file: !3, line: 45, column: 22)
!463 = !DILocation(line: 46, column: 16, scope: !461)
!464 = !DILocation(line: 46, column: 18, scope: !461)
!465 = !DILocation(line: 46, column: 20, scope: !461)
!466 = !DILocation(line: 46, column: 21, scope: !461)
!467 = !DILocation(line: 46, column: 29, scope: !461)
!468 = !DILocation(line: 46, column: 35, scope: !461)
!469 = !DILocation(line: 46, column: 37, scope: !461)
!470 = !DILocation(line: 46, column: 39, scope: !461)
!471 = !DILocation(line: 46, column: 26, scope: !461)
!472 = !DILocation(line: 46, column: 10, scope: !462)
!473 = !DILocation(line: 47, column: 11, scope: !474)
!474 = distinct !DILexicalBlock(scope: !461, file: !3, line: 46, column: 45)
!475 = !DILocation(line: 47, column: 9, scope: !474)
!476 = !DILocation(line: 47, column: 15, scope: !474)
!477 = !DILocation(line: 48, column: 5, scope: !474)
!478 = !DILocation(line: 49, column: 7, scope: !479)
!479 = distinct !DILexicalBlock(scope: !461, file: !3, line: 48, column: 12)
!480 = !DILocalVariable(name: "t_", scope: !481, file: !3, line: 49, type: !24)
!481 = distinct !DILexicalBlock(scope: !479, file: !3, line: 49, column: 7)
!482 = !DILocation(line: 49, column: 7, scope: !481)
!483 = !DILocation(line: 50, column: 8, scope: !479)
!484 = !DILocation(line: 51, column: 12, scope: !479)
!485 = !DILocation(line: 51, column: 13, scope: !479)
!486 = !DILocation(line: 51, column: 11, scope: !479)
!487 = !DILocation(line: 51, column: 21, scope: !479)
!488 = !DILocation(line: 51, column: 26, scope: !479)
!489 = !DILocation(line: 51, column: 9, scope: !479)
!490 = distinct !{!490, !455, !491}
!491 = !DILocation(line: 53, column: 3, scope: !444)
!492 = !DILocation(line: 54, column: 1, scope: !444)
