; ModuleID = 'huffman-coding-1.ll'
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
  %efreqs = alloca [512 x i64], align 16
  %preds = alloca [512 x i32], align 16
  call void @llvm.dbg.value(metadata i64* %freqs, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [512 x i64]* %efreqs, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [512 x i32]* %preds, metadata !35, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 256, metadata !38, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 0, !dbg !39
  %0 = bitcast i64* %arraydecay to i8*, !dbg !39
  %1 = bitcast i64* %freqs to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 8 %1, i64 2048, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 256, !dbg !40
  %2 = bitcast i64* %arrayidx to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 2048, i1 false), !dbg !41
  %arraydecay1 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 0, !dbg !42
  %call = call %struct.huffheap* @_heap_create(i32 512, i64* %arraydecay1), !dbg !43
  call void @llvm.dbg.value(metadata %struct.huffheap* %call, metadata !44, metadata !DIExpression()), !dbg !29
  %cmp = icmp eq %struct.huffheap* %call, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !57, !cf.info !58

if.then:                                          ; preds = %entry
  br label %return, !dbg !59

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !63
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !60, metadata !DIExpression()), !dbg !29
  %cmp2 = icmp slt i32 %i.0, 256, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !67
  %arrayidx3 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom, !dbg !67
  %3 = load i64, i64* %arrayidx3, align 8, !dbg !67
  %cmp4 = icmp sgt i64 %3, 0, !dbg !69
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !70, !cf.info !58

if.then5:                                         ; preds = %for.body
  call void @_heap_add(%struct.huffheap* %call, i32 %i.0), !dbg !71
  br label %if.end6, !dbg !71

if.end6:                                          ; preds = %if.then5, %for.body
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %if.end6
  %inc = add nsw i32 %i.0, 1, !dbg !73
  call void @llvm.dbg.value(metadata i32 %inc, metadata !60, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !77

while.cond:                                       ; preds = %while.body, %for.end
  %extf.0 = phi i32 [ 256, %for.end ], [ %inc20, %while.body ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %extf.0, metadata !38, metadata !DIExpression()), !dbg !29
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %call, i32 0, i32 1, !dbg !78
  %4 = load i32, i32* %n, align 8, !dbg !78
  %cmp7 = icmp sgt i32 %4, 1, !dbg !79
  br i1 %cmp7, label %while.body, label %while.end, !dbg !77

while.body:                                       ; preds = %while.cond
  %call8 = call i32 @_heap_remove(%struct.huffheap* %call), !dbg !80
  call void @llvm.dbg.value(metadata i32 %call8, metadata !82, metadata !DIExpression()), !dbg !29
  %call9 = call i32 @_heap_remove(%struct.huffheap* %call), !dbg !83
  call void @llvm.dbg.value(metadata i32 %call9, metadata !84, metadata !DIExpression()), !dbg !29
  %idxprom10 = sext i32 %call8 to i64, !dbg !85
  %arrayidx11 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom10, !dbg !85
  %5 = load i64, i64* %arrayidx11, align 8, !dbg !85
  %idxprom12 = sext i32 %call9 to i64, !dbg !86
  %arrayidx13 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom12, !dbg !86
  %6 = load i64, i64* %arrayidx13, align 8, !dbg !86
  %add = add nsw i64 %5, %6, !dbg !87
  %idxprom14 = sext i32 %extf.0 to i64, !dbg !88
  %arrayidx15 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom14, !dbg !88
  store i64 %add, i64* %arrayidx15, align 8, !dbg !89
  call void @_heap_add(%struct.huffheap* %call, i32 %extf.0), !dbg !90
  %idxprom16 = sext i32 %call8 to i64, !dbg !91
  %arrayidx17 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom16, !dbg !91
  store i32 %extf.0, i32* %arrayidx17, align 4, !dbg !92
  %sub = sub nsw i32 0, %extf.0, !dbg !93
  %idxprom18 = sext i32 %call9 to i64, !dbg !94
  %arrayidx19 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom18, !dbg !94
  store i32 %sub, i32* %arrayidx19, align 4, !dbg !95
  %inc20 = add nsw i32 %extf.0, 1, !dbg !96
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !38, metadata !DIExpression()), !dbg !29
  br label %while.cond, !dbg !77, !llvm.loop !97

while.end:                                        ; preds = %while.cond
  %call21 = call i32 @_heap_remove(%struct.huffheap* %call), !dbg !99
  call void @llvm.dbg.value(metadata i32 %call21, metadata !82, metadata !DIExpression()), !dbg !29
  %idxprom22 = sext i32 %call21 to i64, !dbg !100
  %arrayidx23 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom22, !dbg !100
  store i32 %call21, i32* %arrayidx23, align 4, !dbg !101
  call void @_heap_destroy(%struct.huffheap* %call), !dbg !102
  %call24 = call noalias i8* @malloc(i64 2048) #6, !dbg !103
  %7 = bitcast i8* %call24 to %struct.huffcode**, !dbg !103
  call void @llvm.dbg.value(metadata %struct.huffcode** %7, metadata !104, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !29
  br label %for.cond25, !dbg !105

for.cond25:                                       ; preds = %for.inc56, %while.end
  %i.1 = phi i32 [ 0, %while.end ], [ %inc57, %for.inc56 ], !dbg !107
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !60, metadata !DIExpression()), !dbg !29
  %cmp26 = icmp slt i32 %i.1, 256, !dbg !108
  br i1 %cmp26, label %for.body27, label %for.end58, !dbg !110

for.body27:                                       ; preds = %for.cond25
  call void @llvm.dbg.value(metadata i32 0, metadata !111, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 0, metadata !112, metadata !DIExpression()), !dbg !29
  %idxprom28 = sext i32 %i.1 to i64, !dbg !113
  %arrayidx29 = getelementptr inbounds [512 x i64], [512 x i64]* %efreqs, i64 0, i64 %idxprom28, !dbg !113
  %8 = load i64, i64* %arrayidx29, align 8, !dbg !113
  %cmp30 = icmp eq i64 %8, 0, !dbg !116
  br i1 %cmp30, label %if.then31, label %if.end34, !dbg !117, !cf.info !58

if.then31:                                        ; preds = %for.body27
  %idxprom32 = sext i32 %i.1 to i64, !dbg !118
  %arrayidx33 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %7, i64 %idxprom32, !dbg !118
  store %struct.huffcode* null, %struct.huffcode** %arrayidx33, align 8, !dbg !120
  br label %for.inc56, !dbg !121

if.end34:                                         ; preds = %for.body27
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !122, metadata !DIExpression()), !dbg !29
  br label %while.cond35, !dbg !123

while.cond35:                                     ; preds = %while.body40, %if.end34
  %bc.0 = phi i32 [ 0, %if.end34 ], [ %or, %while.body40 ], !dbg !124
  %bn.0 = phi i32 [ 0, %if.end34 ], [ %inc47, %while.body40 ], !dbg !124
  %ix.0 = phi i32 [ %i.1, %if.end34 ], [ %call46, %while.body40 ], !dbg !124
  call void @llvm.dbg.value(metadata i32 %ix.0, metadata !122, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %bn.0, metadata !112, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %bc.0, metadata !111, metadata !DIExpression()), !dbg !29
  %idxprom36 = sext i32 %ix.0 to i64, !dbg !125
  %arrayidx37 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom36, !dbg !125
  %9 = load i32, i32* %arrayidx37, align 4, !dbg !125
  %call38 = call i32 @abs(i32 %9) #7, !dbg !126
  %cmp39 = icmp ne i32 %call38, %ix.0, !dbg !127
  br i1 %cmp39, label %while.body40, label %while.end48, !dbg !123

while.body40:                                     ; preds = %while.cond35
  %idxprom41 = sext i32 %ix.0 to i64, !dbg !128
  %arrayidx42 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom41, !dbg !128
  %10 = load i32, i32* %arrayidx42, align 4, !dbg !128
  %cmp43 = icmp sge i32 %10, 0, !dbg !130
  %11 = zext i1 %cmp43 to i64, !dbg !131
  %cond = select i1 %cmp43, i32 1, i32 0, !dbg !131
  %shl = shl i32 %cond, %bn.0, !dbg !132
  %or = or i32 %bc.0, %shl, !dbg !133
  call void @llvm.dbg.value(metadata i32 %or, metadata !111, metadata !DIExpression()), !dbg !29
  %idxprom44 = sext i32 %ix.0 to i64, !dbg !134
  %arrayidx45 = getelementptr inbounds [512 x i32], [512 x i32]* %preds, i64 0, i64 %idxprom44, !dbg !134
  %12 = load i32, i32* %arrayidx45, align 4, !dbg !134
  %call46 = call i32 @abs(i32 %12) #7, !dbg !135
  call void @llvm.dbg.value(metadata i32 %call46, metadata !122, metadata !DIExpression()), !dbg !29
  %inc47 = add nsw i32 %bn.0, 1, !dbg !136
  call void @llvm.dbg.value(metadata i32 %inc47, metadata !112, metadata !DIExpression()), !dbg !29
  br label %while.cond35, !dbg !123, !llvm.loop !137

while.end48:                                      ; preds = %while.cond35
  %call49 = call noalias i8* @malloc(i64 8) #6, !dbg !139
  %13 = bitcast i8* %call49 to %struct.huffcode*, !dbg !139
  %idxprom50 = sext i32 %i.1 to i64, !dbg !140
  %arrayidx51 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %7, i64 %idxprom50, !dbg !140
  store %struct.huffcode* %13, %struct.huffcode** %arrayidx51, align 8, !dbg !141
  %idxprom52 = sext i32 %i.1 to i64, !dbg !142
  %arrayidx53 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %7, i64 %idxprom52, !dbg !142
  %14 = load %struct.huffcode*, %struct.huffcode** %arrayidx53, align 8, !dbg !142
  %nbits = getelementptr inbounds %struct.huffcode, %struct.huffcode* %14, i32 0, i32 0, !dbg !143
  store i32 %bn.0, i32* %nbits, align 4, !dbg !144
  %idxprom54 = sext i32 %i.1 to i64, !dbg !145
  %arrayidx55 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %7, i64 %idxprom54, !dbg !145
  %15 = load %struct.huffcode*, %struct.huffcode** %arrayidx55, align 8, !dbg !145
  %code = getelementptr inbounds %struct.huffcode, %struct.huffcode* %15, i32 0, i32 1, !dbg !146
  store i32 %bc.0, i32* %code, align 4, !dbg !147
  br label %for.inc56, !dbg !148

for.inc56:                                        ; preds = %while.end48, %if.then31
  %inc57 = add nsw i32 %i.1, 1, !dbg !149
  call void @llvm.dbg.value(metadata i32 %inc57, metadata !60, metadata !DIExpression()), !dbg !29
  br label %for.cond25, !dbg !150, !llvm.loop !151

for.end58:                                        ; preds = %for.cond25
  br label %return, !dbg !153

return:                                           ; preds = %for.end58, %if.then
  %retval.0 = phi %struct.huffcode** [ null, %if.then ], [ %7, %for.end58 ], !dbg !29
  ret %struct.huffcode** %retval.0, !dbg !154
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal %struct.huffheap* @_heap_create(i32 %s, i64* %f) #0 !dbg !155 {
entry:
  call void @llvm.dbg.value(metadata i32 %s, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.value(metadata i64* %f, metadata !160, metadata !DIExpression()), !dbg !159
  %call = call noalias i8* @malloc(i64 32) #6, !dbg !161
  %0 = bitcast i8* %call to %struct.huffheap*, !dbg !161
  call void @llvm.dbg.value(metadata %struct.huffheap* %0, metadata !162, metadata !DIExpression()), !dbg !159
  %conv = sext i32 %s to i64, !dbg !163
  %mul = mul i64 4, %conv, !dbg !164
  %call1 = call noalias i8* @malloc(i64 %mul) #6, !dbg !165
  %1 = bitcast i8* %call1 to i32*, !dbg !165
  %h2 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 0, !dbg !166
  store i32* %1, i32** %h2, align 8, !dbg !167
  %cs = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 3, !dbg !168
  store i32 %s, i32* %cs, align 8, !dbg !169
  %s3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 2, !dbg !170
  store i32 %s, i32* %s3, align 4, !dbg !171
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 1, !dbg !172
  store i32 0, i32* %n, align 8, !dbg !173
  %f4 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %0, i32 0, i32 4, !dbg !174
  store i64* %f, i64** %f4, align 8, !dbg !175
  ret %struct.huffheap* %0, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_add(%struct.huffheap* %heap, i32 %c) #0 !dbg !177 {
entry:
  call void @llvm.dbg.value(metadata %struct.huffheap* %heap, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata i32 %c, metadata !182, metadata !DIExpression()), !dbg !181
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !183
  %0 = load i32, i32* %n, align 8, !dbg !183
  %add = add nsw i32 %0, 1, !dbg !185
  %s = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 2, !dbg !186
  %1 = load i32, i32* %s, align 4, !dbg !186
  %cmp = icmp sgt i32 %add, %1, !dbg !187
  br i1 %cmp, label %if.then, label %if.end, !dbg !188, !cf.info !58

if.then:                                          ; preds = %entry
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !189
  %2 = load i32*, i32** %h, align 8, !dbg !189
  %3 = bitcast i32* %2 to i8*, !dbg !191
  %s1 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 2, !dbg !192
  %4 = load i32, i32* %s1, align 4, !dbg !192
  %cs = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 3, !dbg !193
  %5 = load i32, i32* %cs, align 8, !dbg !193
  %add2 = add nsw i32 %4, %5, !dbg !194
  %conv = sext i32 %add2 to i64, !dbg !195
  %call = call i8* @realloc(i8* %3, i64 %conv) #6, !dbg !196
  %6 = bitcast i8* %call to i32*, !dbg !196
  %h3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !197
  store i32* %6, i32** %h3, align 8, !dbg !198
  %cs4 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 3, !dbg !199
  %7 = load i32, i32* %cs4, align 8, !dbg !199
  %s5 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 2, !dbg !200
  %8 = load i32, i32* %s5, align 4, !dbg !201
  %add6 = add nsw i32 %8, %7, !dbg !201
  store i32 %add6, i32* %s5, align 4, !dbg !201
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %entry
  %h7 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !203
  %9 = load i32*, i32** %h7, align 8, !dbg !203
  %n8 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !204
  %10 = load i32, i32* %n8, align 8, !dbg !204
  %idxprom = sext i32 %10 to i64, !dbg !205
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !205
  store i32 %c, i32* %arrayidx, align 4, !dbg !206
  %n9 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !207
  %11 = load i32, i32* %n9, align 8, !dbg !208
  %inc = add nsw i32 %11, 1, !dbg !208
  store i32 %inc, i32* %n9, align 8, !dbg !208
  call void @_heap_sort(%struct.huffheap* %heap), !dbg !209
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_heap_remove(%struct.huffheap* %heap) #0 !dbg !211 {
entry:
  call void @llvm.dbg.value(metadata %struct.huffheap* %heap, metadata !214, metadata !DIExpression()), !dbg !215
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !216
  %0 = load i32, i32* %n, align 8, !dbg !216
  %cmp = icmp sgt i32 %0, 0, !dbg !218
  br i1 %cmp, label %if.then, label %if.end, !dbg !219, !cf.info !58

if.then:                                          ; preds = %entry
  %n1 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !220
  %1 = load i32, i32* %n1, align 8, !dbg !222
  %dec = add nsw i32 %1, -1, !dbg !222
  store i32 %dec, i32* %n1, align 8, !dbg !222
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !223
  %2 = load i32*, i32** %h, align 8, !dbg !223
  %n2 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !224
  %3 = load i32, i32* %n2, align 8, !dbg !224
  %idxprom = sext i32 %3 to i64, !dbg !225
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !225
  %4 = load i32, i32* %arrayidx, align 4, !dbg !225
  br label %return, !dbg !226

if.end:                                           ; preds = %entry
  br label %return, !dbg !227

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %4, %if.then ], [ -1, %if.end ], !dbg !215
  ret i32 %retval.0, !dbg !228
}

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_destroy(%struct.huffheap* %heap) #0 !dbg !229 {
entry:
  call void @llvm.dbg.value(metadata %struct.huffheap* %heap, metadata !232, metadata !DIExpression()), !dbg !233
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !234
  %0 = load i32*, i32** %h, align 8, !dbg !234
  %1 = bitcast i32* %0 to i8*, !dbg !235
  call void @free(i8* %1) #6, !dbg !236
  %2 = bitcast %struct.huffheap* %heap to i8*, !dbg !237
  call void @free(i8* %2) #6, !dbg !238
  ret void, !dbg !239
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_huffman_codes(%struct.huffcode** %c) #0 !dbg !240 {
entry:
  call void @llvm.dbg.value(metadata %struct.huffcode** %c, metadata !243, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.value(metadata i32 0, metadata !245, metadata !DIExpression()), !dbg !244
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !248
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !245, metadata !DIExpression()), !dbg !244
  %cmp = icmp slt i32 %i.0, 256, !dbg !249
  br i1 %cmp, label %for.body, label %for.end, !dbg !251

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !252
  %arrayidx = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %c, i64 %idxprom, !dbg !252
  %0 = load %struct.huffcode*, %struct.huffcode** %arrayidx, align 8, !dbg !252
  %1 = bitcast %struct.huffcode* %0 to i8*, !dbg !252
  call void @free(i8* %1) #6, !dbg !253
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !254
  call void @llvm.dbg.value(metadata i32 %inc, metadata !245, metadata !DIExpression()), !dbg !244
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  %2 = bitcast %struct.huffcode** %c to i8*, !dbg !258
  call void @free(i8* %2) #6, !dbg !259
  ret void, !dbg !260
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @inttobits(i32 %c, i32 %n, i8* %s) #0 !dbg !261 {
entry:
  call void @llvm.dbg.value(metadata i32 %c, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.value(metadata i32 %n, metadata !267, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.value(metadata i8* %s, metadata !268, metadata !DIExpression()), !dbg !266
  %idxprom = sext i32 %n to i64, !dbg !269
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !269
  store i8 0, i8* %arrayidx, align 1, !dbg !270
  br label %while.cond, !dbg !271

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %dec, %while.body ]
  %c.addr.0 = phi i32 [ %c, %entry ], [ %shr, %while.body ]
  call void @llvm.dbg.value(metadata i32 %c.addr.0, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !267, metadata !DIExpression()), !dbg !266
  %cmp = icmp sgt i32 %n.addr.0, 0, !dbg !272
  br i1 %cmp, label %while.body, label %while.end, !dbg !271

while.body:                                       ; preds = %while.cond
  %rem = srem i32 %c.addr.0, 2, !dbg !273
  %add = add nsw i32 %rem, 48, !dbg !275
  %conv = trunc i32 %add to i8, !dbg !276
  %sub = sub nsw i32 %n.addr.0, 1, !dbg !277
  %idxprom1 = sext i32 %sub to i64, !dbg !278
  %arrayidx2 = getelementptr inbounds i8, i8* %s, i64 %idxprom1, !dbg !278
  store i8 %conv, i8* %arrayidx2, align 1, !dbg !279
  %shr = ashr i32 %c.addr.0, 1, !dbg !280
  call void @llvm.dbg.value(metadata i32 %shr, metadata !265, metadata !DIExpression()), !dbg !266
  %dec = add nsw i32 %n.addr.0, -1, !dbg !281
  call void @llvm.dbg.value(metadata i32 %dec, metadata !267, metadata !DIExpression()), !dbg !266
  br label %while.cond, !dbg !271, !llvm.loop !282

while.end:                                        ; preds = %while.cond
  ret void, !dbg !284
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !285 {
entry:
  %strbit = alloca [100 x i8], align 16
  %freqs = alloca [256 x i64], align 16
  call void @llvm.dbg.declare(metadata [100 x i8]* %strbit, metadata !288, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.declare(metadata [256 x i64]* %freqs, metadata !293, metadata !DIExpression()), !dbg !297
  %arraydecay = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 0, !dbg !298
  %0 = bitcast i64* %arraydecay to i8*, !dbg !298
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 2048, i1 false), !dbg !298
  %1 = load i8*, i8** @test, align 8, !dbg !299
  call void @llvm.dbg.value(metadata i8* %1, metadata !300, metadata !DIExpression()), !dbg !301
  br label %while.cond, !dbg !302

while.cond:                                       ; preds = %while.body, %entry
  %p.0 = phi i8* [ %1, %entry ], [ %incdec.ptr, %while.body ], !dbg !301
  call void @llvm.dbg.value(metadata i8* %p.0, metadata !300, metadata !DIExpression()), !dbg !301
  %2 = load i8, i8* %p.0, align 1, !dbg !303
  %conv = sext i8 %2 to i32, !dbg !303
  %cmp = icmp ne i32 %conv, 0, !dbg !304
  br i1 %cmp, label %while.body, label %while.end, !dbg !302

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0, i32 1, !dbg !305
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !300, metadata !DIExpression()), !dbg !301
  %3 = load i8, i8* %p.0, align 1, !dbg !306
  %idxprom = sext i8 %3 to i64, !dbg !307
  %arrayidx = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 %idxprom, !dbg !307
  %4 = load i64, i64* %arrayidx, align 8, !dbg !308
  %inc = add nsw i64 %4, 1, !dbg !308
  store i64 %inc, i64* %arrayidx, align 8, !dbg !308
  br label %while.cond, !dbg !302, !llvm.loop !309

while.end:                                        ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [256 x i64], [256 x i64]* %freqs, i64 0, i64 0, !dbg !310
  %call = call %struct.huffcode** @create_huffman_codes(i64* %arraydecay2), !dbg !311
  call void @llvm.dbg.value(metadata %struct.huffcode** %call, metadata !312, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.value(metadata i32 0, metadata !313, metadata !DIExpression()), !dbg !301
  br label %for.cond, !dbg !314

for.cond:                                         ; preds = %for.inc, %while.end
  %i.0 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc ], !dbg !316
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !313, metadata !DIExpression()), !dbg !301
  %cmp3 = icmp slt i32 %i.0, 256, !dbg !317
  br i1 %cmp3, label %for.body, label %for.end, !dbg !319

for.body:                                         ; preds = %for.cond
  %idxprom5 = sext i32 %i.0 to i64, !dbg !320
  %arrayidx6 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %call, i64 %idxprom5, !dbg !320
  %5 = load %struct.huffcode*, %struct.huffcode** %arrayidx6, align 8, !dbg !320
  %cmp7 = icmp ne %struct.huffcode* %5, null, !dbg !323
  br i1 %cmp7, label %if.then, label %if.end, !dbg !324, !cf.info !58

if.then:                                          ; preds = %for.body
  %idxprom9 = sext i32 %i.0 to i64, !dbg !325
  %arrayidx10 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %call, i64 %idxprom9, !dbg !325
  %6 = load %struct.huffcode*, %struct.huffcode** %arrayidx10, align 8, !dbg !325
  %code = getelementptr inbounds %struct.huffcode, %struct.huffcode* %6, i32 0, i32 1, !dbg !327
  %7 = load i32, i32* %code, align 4, !dbg !327
  %idxprom11 = sext i32 %i.0 to i64, !dbg !328
  %arrayidx12 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %call, i64 %idxprom11, !dbg !328
  %8 = load %struct.huffcode*, %struct.huffcode** %arrayidx12, align 8, !dbg !328
  %nbits = getelementptr inbounds %struct.huffcode, %struct.huffcode* %8, i32 0, i32 0, !dbg !329
  %9 = load i32, i32* %nbits, align 4, !dbg !329
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %strbit, i64 0, i64 0, !dbg !330
  call void @inttobits(i32 %7, i32 %9, i8* %arraydecay13), !dbg !331
  %idxprom14 = sext i32 %i.0 to i64, !dbg !332
  %arrayidx15 = getelementptr inbounds %struct.huffcode*, %struct.huffcode** %call, i64 %idxprom14, !dbg !332
  %10 = load %struct.huffcode*, %struct.huffcode** %arrayidx15, align 8, !dbg !332
  %code16 = getelementptr inbounds %struct.huffcode, %struct.huffcode* %10, i32 0, i32 1, !dbg !333
  %11 = load i32, i32* %code16, align 4, !dbg !333
  %arraydecay17 = getelementptr inbounds [100 x i8], [100 x i8]* %strbit, i64 0, i64 0, !dbg !334
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %i.0, i32 %11, i8* %arraydecay17), !dbg !335
  br label %if.end, !dbg !336

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !337

for.inc:                                          ; preds = %if.end
  %inc19 = add nsw i32 %i.0, 1, !dbg !338
  call void @llvm.dbg.value(metadata i32 %inc19, metadata !313, metadata !DIExpression()), !dbg !301
  br label %for.cond, !dbg !339, !llvm.loop !340

for.end:                                          ; preds = %for.cond
  call void @free_huffman_codes(%struct.huffcode** %call), !dbg !342
  ret i32 0, !dbg !343
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @_heap_sort(%struct.huffheap* %heap) #0 !dbg !344 {
entry:
  call void @llvm.dbg.value(metadata %struct.huffheap* %heap, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 1, metadata !347, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 2, metadata !348, metadata !DIExpression()), !dbg !346
  %h = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 0, !dbg !349
  %0 = load i32*, i32** %h, align 8, !dbg !349
  call void @llvm.dbg.value(metadata i32* %0, metadata !350, metadata !DIExpression()), !dbg !346
  br label %while.cond, !dbg !351

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %i.1, %if.end ], !dbg !346
  %j.0 = phi i32 [ 2, %entry ], [ %j.2, %if.end ], !dbg !346
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !348, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !347, metadata !DIExpression()), !dbg !346
  %n = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 1, !dbg !352
  %1 = load i32, i32* %n, align 8, !dbg !352
  %cmp = icmp slt i32 %i.0, %1, !dbg !353
  br i1 %cmp, label %while.body, label %while.end, !dbg !351

while.body:                                       ; preds = %while.cond
  %f = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 4, !dbg !354
  %2 = load i64*, i64** %f, align 8, !dbg !354
  %sub = sub nsw i32 %i.0, 1, !dbg !357
  %idxprom = sext i32 %sub to i64, !dbg !358
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !358
  %3 = load i32, i32* %arrayidx, align 4, !dbg !358
  %idxprom1 = sext i32 %3 to i64, !dbg !359
  %arrayidx2 = getelementptr inbounds i64, i64* %2, i64 %idxprom1, !dbg !359
  %4 = load i64, i64* %arrayidx2, align 8, !dbg !359
  %f3 = getelementptr inbounds %struct.huffheap, %struct.huffheap* %heap, i32 0, i32 4, !dbg !360
  %5 = load i64*, i64** %f3, align 8, !dbg !360
  %idxprom4 = sext i32 %i.0 to i64, !dbg !361
  %arrayidx5 = getelementptr inbounds i32, i32* %0, i64 %idxprom4, !dbg !361
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !361
  %idxprom6 = sext i32 %6 to i64, !dbg !362
  %arrayidx7 = getelementptr inbounds i64, i64* %5, i64 %idxprom6, !dbg !362
  %7 = load i64, i64* %arrayidx7, align 8, !dbg !362
  %cmp8 = icmp sge i64 %4, %7, !dbg !363
  br i1 %cmp8, label %if.then, label %if.else, !dbg !364, !cf.info !58

if.then:                                          ; preds = %while.body
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !347, metadata !DIExpression()), !dbg !346
  %inc = add nsw i32 %j.0, 1, !dbg !365
  call void @llvm.dbg.value(metadata i32 %inc, metadata !348, metadata !DIExpression()), !dbg !346
  br label %if.end, !dbg !367

if.else:                                          ; preds = %while.body
  br label %do.body, !dbg !368

do.body:                                          ; preds = %if.else
  %sub9 = sub nsw i32 %i.0, 1, !dbg !370
  %idxprom10 = sext i32 %sub9 to i64, !dbg !370
  %arrayidx11 = getelementptr inbounds i32, i32* %0, i64 %idxprom10, !dbg !370
  %8 = load i32, i32* %arrayidx11, align 4, !dbg !370
  call void @llvm.dbg.value(metadata i32 %8, metadata !372, metadata !DIExpression()), !dbg !373
  %idxprom12 = sext i32 %i.0 to i64, !dbg !370
  %arrayidx13 = getelementptr inbounds i32, i32* %0, i64 %idxprom12, !dbg !370
  %9 = load i32, i32* %arrayidx13, align 4, !dbg !370
  %sub14 = sub nsw i32 %i.0, 1, !dbg !370
  %idxprom15 = sext i32 %sub14 to i64, !dbg !370
  %arrayidx16 = getelementptr inbounds i32, i32* %0, i64 %idxprom15, !dbg !370
  store i32 %9, i32* %arrayidx16, align 4, !dbg !370
  %idxprom17 = sext i32 %i.0 to i64, !dbg !370
  %arrayidx18 = getelementptr inbounds i32, i32* %0, i64 %idxprom17, !dbg !370
  store i32 %8, i32* %arrayidx18, align 4, !dbg !370
  br label %do.end, !dbg !370

do.end:                                           ; preds = %do.body
  %dec = add nsw i32 %i.0, -1, !dbg !374
  call void @llvm.dbg.value(metadata i32 %dec, metadata !347, metadata !DIExpression()), !dbg !346
  %cmp19 = icmp eq i32 %dec, 0, !dbg !375
  br i1 %cmp19, label %cond.true, label %cond.false, !dbg !376

cond.true:                                        ; preds = %do.end
  %inc20 = add nsw i32 %j.0, 1, !dbg !377
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !348, metadata !DIExpression()), !dbg !346
  br label %cond.end, !dbg !376

cond.false:                                       ; preds = %do.end
  br label %cond.end, !dbg !376

cond.end:                                         ; preds = %cond.false, %cond.true
  %j.1 = phi i32 [ %inc20, %cond.true ], [ %j.0, %cond.false ], !dbg !346
  %cond = phi i32 [ %j.0, %cond.true ], [ %dec, %cond.false ], !dbg !376
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !348, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 %cond, metadata !347, metadata !DIExpression()), !dbg !346
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  %i.1 = phi i32 [ %j.0, %if.then ], [ %cond, %cond.end ], !dbg !378
  %j.2 = phi i32 [ %inc, %if.then ], [ %j.1, %cond.end ], !dbg !378
  call void @llvm.dbg.value(metadata i32 %j.2, metadata !348, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !347, metadata !DIExpression()), !dbg !346
  br label %while.cond, !dbg !351, !llvm.loop !379

while.end:                                        ; preds = %while.cond
  ret void, !dbg !381
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!29 = !DILocation(line: 0, scope: !15)
!30 = !DILocalVariable(name: "efreqs", scope: !15, file: !3, line: 82, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 32768, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 512)
!34 = !DILocation(line: 82, column: 8, scope: !15)
!35 = !DILocalVariable(name: "preds", scope: !15, file: !3, line: 83, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 16384, elements: !32)
!37 = !DILocation(line: 83, column: 7, scope: !15)
!38 = !DILocalVariable(name: "extf", scope: !15, file: !3, line: 84, type: !24)
!39 = !DILocation(line: 87, column: 3, scope: !15)
!40 = !DILocation(line: 88, column: 11, scope: !15)
!41 = !DILocation(line: 88, column: 3, scope: !15)
!42 = !DILocation(line: 90, column: 32, scope: !15)
!43 = !DILocation(line: 90, column: 10, scope: !15)
!44 = !DILocalVariable(name: "heap", scope: !15, file: !3, line: 81, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "heap_t", file: !3, line: 18, baseType: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "huffheap", file: !3, line: 13, size: 256, elements: !48)
!48 = !{!49, !51, !52, !53, !54}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !47, file: !3, line: 14, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !47, file: !3, line: 15, baseType: !24, size: 32, offset: 64)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !47, file: !3, line: 15, baseType: !24, size: 32, offset: 96)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "cs", scope: !47, file: !3, line: 15, baseType: !24, size: 32, offset: 128)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "f", scope: !47, file: !3, line: 16, baseType: !26, size: 64, offset: 192)
!55 = !DILocation(line: 91, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !15, file: !3, line: 91, column: 8)
!57 = !DILocation(line: 91, column: 8, scope: !15)
!58 = !{!"if"}
!59 = !DILocation(line: 91, column: 23, scope: !56)
!60 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 84, type: !24)
!61 = !DILocation(line: 93, column: 7, scope: !62)
!62 = distinct !DILexicalBlock(scope: !15, file: !3, line: 93, column: 3)
!63 = !DILocation(line: 0, scope: !62)
!64 = !DILocation(line: 93, column: 14, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !3, line: 93, column: 3)
!66 = !DILocation(line: 93, column: 3, scope: !62)
!67 = !DILocation(line: 93, column: 33, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !3, line: 93, column: 33)
!69 = !DILocation(line: 93, column: 43, scope: !68)
!70 = !DILocation(line: 93, column: 33, scope: !65)
!71 = !DILocation(line: 93, column: 49, scope: !68)
!72 = !DILocation(line: 93, column: 45, scope: !68)
!73 = !DILocation(line: 93, column: 24, scope: !65)
!74 = !DILocation(line: 93, column: 3, scope: !65)
!75 = distinct !{!75, !66, !76}
!76 = !DILocation(line: 93, column: 66, scope: !62)
!77 = !DILocation(line: 95, column: 3, scope: !15)
!78 = !DILocation(line: 95, column: 16, scope: !15)
!79 = !DILocation(line: 95, column: 18, scope: !15)
!80 = !DILocation(line: 97, column: 10, scope: !81)
!81 = distinct !DILexicalBlock(scope: !15, file: !3, line: 96, column: 3)
!82 = !DILocalVariable(name: "r1", scope: !15, file: !3, line: 85, type: !24)
!83 = !DILocation(line: 98, column: 10, scope: !81)
!84 = !DILocalVariable(name: "r2", scope: !15, file: !3, line: 85, type: !24)
!85 = !DILocation(line: 99, column: 20, scope: !81)
!86 = !DILocation(line: 99, column: 33, scope: !81)
!87 = !DILocation(line: 99, column: 31, scope: !81)
!88 = !DILocation(line: 99, column: 5, scope: !81)
!89 = !DILocation(line: 99, column: 18, scope: !81)
!90 = !DILocation(line: 100, column: 5, scope: !81)
!91 = !DILocation(line: 101, column: 5, scope: !81)
!92 = !DILocation(line: 101, column: 15, scope: !81)
!93 = !DILocation(line: 102, column: 17, scope: !81)
!94 = !DILocation(line: 102, column: 5, scope: !81)
!95 = !DILocation(line: 102, column: 15, scope: !81)
!96 = !DILocation(line: 103, column: 9, scope: !81)
!97 = distinct !{!97, !77, !98}
!98 = !DILocation(line: 104, column: 3, scope: !15)
!99 = !DILocation(line: 105, column: 8, scope: !15)
!100 = !DILocation(line: 106, column: 3, scope: !15)
!101 = !DILocation(line: 106, column: 13, scope: !15)
!102 = !DILocation(line: 107, column: 3, scope: !15)
!103 = !DILocation(line: 109, column: 11, scope: !15)
!104 = !DILocalVariable(name: "codes", scope: !15, file: !3, line: 80, type: !18)
!105 = !DILocation(line: 112, column: 7, scope: !106)
!106 = distinct !DILexicalBlock(scope: !15, file: !3, line: 112, column: 3)
!107 = !DILocation(line: 0, scope: !106)
!108 = !DILocation(line: 112, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 112, column: 3)
!110 = !DILocation(line: 112, column: 3, scope: !106)
!111 = !DILocalVariable(name: "bc", scope: !15, file: !3, line: 111, type: !24)
!112 = !DILocalVariable(name: "bn", scope: !15, file: !3, line: 111, type: !24)
!113 = !DILocation(line: 114, column: 10, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !3, line: 114, column: 10)
!115 = distinct !DILexicalBlock(scope: !109, file: !3, line: 112, column: 28)
!116 = !DILocation(line: 114, column: 20, scope: !114)
!117 = !DILocation(line: 114, column: 10, scope: !115)
!118 = !DILocation(line: 114, column: 29, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !3, line: 114, column: 27)
!120 = !DILocation(line: 114, column: 38, scope: !119)
!121 = !DILocation(line: 114, column: 46, scope: !119)
!122 = !DILocalVariable(name: "ix", scope: !15, file: !3, line: 111, type: !24)
!123 = !DILocation(line: 116, column: 5, scope: !115)
!124 = !DILocation(line: 0, scope: !115)
!125 = !DILocation(line: 116, column: 16, scope: !115)
!126 = !DILocation(line: 116, column: 12, scope: !115)
!127 = !DILocation(line: 116, column: 27, scope: !115)
!128 = !DILocation(line: 117, column: 15, scope: !129)
!129 = distinct !DILexicalBlock(scope: !115, file: !3, line: 116, column: 35)
!130 = !DILocation(line: 117, column: 25, scope: !129)
!131 = !DILocation(line: 117, column: 14, scope: !129)
!132 = !DILocation(line: 117, column: 41, scope: !129)
!133 = !DILocation(line: 117, column: 10, scope: !129)
!134 = !DILocation(line: 118, column: 16, scope: !129)
!135 = !DILocation(line: 118, column: 12, scope: !129)
!136 = !DILocation(line: 119, column: 9, scope: !129)
!137 = distinct !{!137, !123, !138}
!138 = !DILocation(line: 120, column: 5, scope: !115)
!139 = !DILocation(line: 121, column: 16, scope: !115)
!140 = !DILocation(line: 121, column: 5, scope: !115)
!141 = !DILocation(line: 121, column: 14, scope: !115)
!142 = !DILocation(line: 122, column: 5, scope: !115)
!143 = !DILocation(line: 122, column: 15, scope: !115)
!144 = !DILocation(line: 122, column: 21, scope: !115)
!145 = !DILocation(line: 123, column: 5, scope: !115)
!146 = !DILocation(line: 123, column: 15, scope: !115)
!147 = !DILocation(line: 123, column: 20, scope: !115)
!148 = !DILocation(line: 124, column: 3, scope: !115)
!149 = !DILocation(line: 112, column: 24, scope: !109)
!150 = !DILocation(line: 112, column: 3, scope: !109)
!151 = distinct !{!151, !110, !152}
!152 = !DILocation(line: 124, column: 3, scope: !106)
!153 = !DILocation(line: 125, column: 3, scope: !15)
!154 = !DILocation(line: 126, column: 1, scope: !15)
!155 = distinct !DISubprogram(name: "_heap_create", scope: !3, file: !3, line: 21, type: !156, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DISubroutineType(types: !157)
!157 = !{!45, !24, !26}
!158 = !DILocalVariable(name: "s", arg: 1, scope: !155, file: !3, line: 21, type: !24)
!159 = !DILocation(line: 0, scope: !155)
!160 = !DILocalVariable(name: "f", arg: 2, scope: !155, file: !3, line: 21, type: !26)
!161 = !DILocation(line: 24, column: 7, scope: !155)
!162 = !DILocalVariable(name: "h", scope: !155, file: !3, line: 23, type: !45)
!163 = !DILocation(line: 25, column: 29, scope: !155)
!164 = !DILocation(line: 25, column: 28, scope: !155)
!165 = !DILocation(line: 25, column: 10, scope: !155)
!166 = !DILocation(line: 25, column: 6, scope: !155)
!167 = !DILocation(line: 25, column: 8, scope: !155)
!168 = !DILocation(line: 26, column: 13, scope: !155)
!169 = !DILocation(line: 26, column: 16, scope: !155)
!170 = !DILocation(line: 26, column: 6, scope: !155)
!171 = !DILocation(line: 26, column: 8, scope: !155)
!172 = !DILocation(line: 27, column: 6, scope: !155)
!173 = !DILocation(line: 27, column: 8, scope: !155)
!174 = !DILocation(line: 28, column: 6, scope: !155)
!175 = !DILocation(line: 28, column: 8, scope: !155)
!176 = !DILocation(line: 29, column: 3, scope: !155)
!177 = distinct !DISubprogram(name: "_heap_add", scope: !3, file: !3, line: 57, type: !178, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !45, !24}
!180 = !DILocalVariable(name: "heap", arg: 1, scope: !177, file: !3, line: 57, type: !45)
!181 = !DILocation(line: 0, scope: !177)
!182 = !DILocalVariable(name: "c", arg: 2, scope: !177, file: !3, line: 57, type: !24)
!183 = !DILocation(line: 59, column: 15, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !3, line: 59, column: 8)
!185 = !DILocation(line: 59, column: 17, scope: !184)
!186 = !DILocation(line: 59, column: 30, scope: !184)
!187 = !DILocation(line: 59, column: 22, scope: !184)
!188 = !DILocation(line: 59, column: 8, scope: !177)
!189 = !DILocation(line: 60, column: 29, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !3, line: 59, column: 34)
!191 = !DILocation(line: 60, column: 23, scope: !190)
!192 = !DILocation(line: 60, column: 38, scope: !190)
!193 = !DILocation(line: 60, column: 48, scope: !190)
!194 = !DILocation(line: 60, column: 40, scope: !190)
!195 = !DILocation(line: 60, column: 32, scope: !190)
!196 = !DILocation(line: 60, column: 15, scope: !190)
!197 = !DILocation(line: 60, column: 11, scope: !190)
!198 = !DILocation(line: 60, column: 13, scope: !190)
!199 = !DILocation(line: 61, column: 22, scope: !190)
!200 = !DILocation(line: 61, column: 11, scope: !190)
!201 = !DILocation(line: 61, column: 13, scope: !190)
!202 = !DILocation(line: 62, column: 3, scope: !190)
!203 = !DILocation(line: 63, column: 9, scope: !177)
!204 = !DILocation(line: 63, column: 17, scope: !177)
!205 = !DILocation(line: 63, column: 3, scope: !177)
!206 = !DILocation(line: 63, column: 20, scope: !177)
!207 = !DILocation(line: 64, column: 9, scope: !177)
!208 = !DILocation(line: 64, column: 10, scope: !177)
!209 = !DILocation(line: 65, column: 3, scope: !177)
!210 = !DILocation(line: 66, column: 1, scope: !177)
!211 = distinct !DISubprogram(name: "_heap_remove", scope: !3, file: !3, line: 68, type: !212, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!212 = !DISubroutineType(types: !213)
!213 = !{!24, !45}
!214 = !DILocalVariable(name: "heap", arg: 1, scope: !211, file: !3, line: 68, type: !45)
!215 = !DILocation(line: 0, scope: !211)
!216 = !DILocation(line: 70, column: 14, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !3, line: 70, column: 8)
!218 = !DILocation(line: 70, column: 16, scope: !217)
!219 = !DILocation(line: 70, column: 8, scope: !211)
!220 = !DILocation(line: 71, column: 11, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !3, line: 70, column: 22)
!222 = !DILocation(line: 71, column: 12, scope: !221)
!223 = !DILocation(line: 72, column: 18, scope: !221)
!224 = !DILocation(line: 72, column: 26, scope: !221)
!225 = !DILocation(line: 72, column: 12, scope: !221)
!226 = !DILocation(line: 72, column: 5, scope: !221)
!227 = !DILocation(line: 74, column: 3, scope: !211)
!228 = !DILocation(line: 75, column: 1, scope: !211)
!229 = distinct !DISubprogram(name: "_heap_destroy", scope: !3, file: !3, line: 32, type: !230, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!230 = !DISubroutineType(types: !231)
!231 = !{null, !45}
!232 = !DILocalVariable(name: "heap", arg: 1, scope: !229, file: !3, line: 32, type: !45)
!233 = !DILocation(line: 0, scope: !229)
!234 = !DILocation(line: 34, column: 14, scope: !229)
!235 = !DILocation(line: 34, column: 8, scope: !229)
!236 = !DILocation(line: 34, column: 3, scope: !229)
!237 = !DILocation(line: 35, column: 8, scope: !229)
!238 = !DILocation(line: 35, column: 3, scope: !229)
!239 = !DILocation(line: 36, column: 1, scope: !229)
!240 = distinct !DISubprogram(name: "free_huffman_codes", scope: !3, file: !3, line: 128, type: !241, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!241 = !DISubroutineType(types: !242)
!242 = !{null, !18}
!243 = !DILocalVariable(name: "c", arg: 1, scope: !240, file: !3, line: 128, type: !18)
!244 = !DILocation(line: 0, scope: !240)
!245 = !DILocalVariable(name: "i", scope: !240, file: !3, line: 130, type: !24)
!246 = !DILocation(line: 132, column: 7, scope: !247)
!247 = distinct !DILexicalBlock(scope: !240, file: !3, line: 132, column: 3)
!248 = !DILocation(line: 0, scope: !247)
!249 = !DILocation(line: 132, column: 14, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !3, line: 132, column: 3)
!251 = !DILocation(line: 132, column: 3, scope: !247)
!252 = !DILocation(line: 132, column: 33, scope: !250)
!253 = !DILocation(line: 132, column: 28, scope: !250)
!254 = !DILocation(line: 132, column: 24, scope: !250)
!255 = !DILocation(line: 132, column: 3, scope: !250)
!256 = distinct !{!256, !251, !257}
!257 = !DILocation(line: 132, column: 37, scope: !247)
!258 = !DILocation(line: 133, column: 8, scope: !240)
!259 = !DILocation(line: 133, column: 3, scope: !240)
!260 = !DILocation(line: 134, column: 1, scope: !240)
!261 = distinct !DISubprogram(name: "inttobits", scope: !3, file: !3, line: 138, type: !262, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !24, !24, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!265 = !DILocalVariable(name: "c", arg: 1, scope: !261, file: !3, line: 138, type: !24)
!266 = !DILocation(line: 0, scope: !261)
!267 = !DILocalVariable(name: "n", arg: 2, scope: !261, file: !3, line: 138, type: !24)
!268 = !DILocalVariable(name: "s", arg: 3, scope: !261, file: !3, line: 138, type: !264)
!269 = !DILocation(line: 140, column: 3, scope: !261)
!270 = !DILocation(line: 140, column: 8, scope: !261)
!271 = !DILocation(line: 141, column: 3, scope: !261)
!272 = !DILocation(line: 141, column: 11, scope: !261)
!273 = !DILocation(line: 142, column: 16, scope: !274)
!274 = distinct !DILexicalBlock(scope: !261, file: !3, line: 141, column: 16)
!275 = !DILocation(line: 142, column: 20, scope: !274)
!276 = !DILocation(line: 142, column: 14, scope: !274)
!277 = !DILocation(line: 142, column: 8, scope: !274)
!278 = !DILocation(line: 142, column: 5, scope: !274)
!279 = !DILocation(line: 142, column: 12, scope: !274)
!280 = !DILocation(line: 143, column: 7, scope: !274)
!281 = !DILocation(line: 143, column: 15, scope: !274)
!282 = distinct !{!282, !271, !283}
!283 = !DILocation(line: 144, column: 3, scope: !261)
!284 = !DILocation(line: 145, column: 1, scope: !261)
!285 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 149, type: !286, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!286 = !DISubroutineType(types: !287)
!287 = !{!24}
!288 = !DILocalVariable(name: "strbit", scope: !285, file: !3, line: 153, type: !289)
!289 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 800, elements: !290)
!290 = !{!291}
!291 = !DISubrange(count: 100)
!292 = !DILocation(line: 153, column: 8, scope: !285)
!293 = !DILocalVariable(name: "freqs", scope: !285, file: !3, line: 155, type: !294)
!294 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 16384, elements: !295)
!295 = !{!296}
!296 = !DISubrange(count: 256)
!297 = !DILocation(line: 155, column: 8, scope: !285)
!298 = !DILocation(line: 157, column: 3, scope: !285)
!299 = !DILocation(line: 159, column: 7, scope: !285)
!300 = !DILocalVariable(name: "p", scope: !285, file: !3, line: 154, type: !8)
!301 = !DILocation(line: 0, scope: !285)
!302 = !DILocation(line: 160, column: 3, scope: !285)
!303 = !DILocation(line: 160, column: 9, scope: !285)
!304 = !DILocation(line: 160, column: 12, scope: !285)
!305 = !DILocation(line: 160, column: 29, scope: !285)
!306 = !DILocation(line: 160, column: 27, scope: !285)
!307 = !DILocation(line: 160, column: 21, scope: !285)
!308 = !DILocation(line: 160, column: 32, scope: !285)
!309 = distinct !{!309, !302, !308}
!310 = !DILocation(line: 162, column: 28, scope: !285)
!311 = !DILocation(line: 162, column: 7, scope: !285)
!312 = !DILocalVariable(name: "r", scope: !285, file: !3, line: 151, type: !18)
!313 = !DILocalVariable(name: "i", scope: !285, file: !3, line: 152, type: !24)
!314 = !DILocation(line: 164, column: 7, scope: !315)
!315 = distinct !DILexicalBlock(scope: !285, file: !3, line: 164, column: 3)
!316 = !DILocation(line: 0, scope: !315)
!317 = !DILocation(line: 164, column: 14, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !3, line: 164, column: 3)
!319 = !DILocation(line: 164, column: 3, scope: !315)
!320 = !DILocation(line: 165, column: 10, scope: !321)
!321 = distinct !DILexicalBlock(scope: !322, file: !3, line: 165, column: 10)
!322 = distinct !DILexicalBlock(scope: !318, file: !3, line: 164, column: 28)
!323 = !DILocation(line: 165, column: 15, scope: !321)
!324 = !DILocation(line: 165, column: 10, scope: !322)
!325 = !DILocation(line: 166, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !3, line: 165, column: 25)
!327 = !DILocation(line: 166, column: 23, scope: !326)
!328 = !DILocation(line: 166, column: 29, scope: !326)
!329 = !DILocation(line: 166, column: 35, scope: !326)
!330 = !DILocation(line: 166, column: 42, scope: !326)
!331 = !DILocation(line: 166, column: 7, scope: !326)
!332 = !DILocation(line: 167, column: 33, scope: !326)
!333 = !DILocation(line: 167, column: 39, scope: !326)
!334 = !DILocation(line: 167, column: 45, scope: !326)
!335 = !DILocation(line: 167, column: 7, scope: !326)
!336 = !DILocation(line: 168, column: 5, scope: !326)
!337 = !DILocation(line: 169, column: 3, scope: !322)
!338 = !DILocation(line: 164, column: 24, scope: !318)
!339 = !DILocation(line: 164, column: 3, scope: !318)
!340 = distinct !{!340, !319, !341}
!341 = !DILocation(line: 169, column: 3, scope: !315)
!342 = !DILocation(line: 171, column: 3, scope: !285)
!343 = !DILocation(line: 173, column: 3, scope: !285)
!344 = distinct !DISubprogram(name: "_heap_sort", scope: !3, file: !3, line: 40, type: !230, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!345 = !DILocalVariable(name: "heap", arg: 1, scope: !344, file: !3, line: 40, type: !45)
!346 = !DILocation(line: 0, scope: !344)
!347 = !DILocalVariable(name: "i", scope: !344, file: !3, line: 42, type: !24)
!348 = !DILocalVariable(name: "j", scope: !344, file: !3, line: 42, type: !24)
!349 = !DILocation(line: 43, column: 18, scope: !344)
!350 = !DILocalVariable(name: "a", scope: !344, file: !3, line: 43, type: !50)
!351 = !DILocation(line: 45, column: 3, scope: !344)
!352 = !DILocation(line: 45, column: 19, scope: !344)
!353 = !DILocation(line: 45, column: 11, scope: !344)
!354 = !DILocation(line: 46, column: 16, scope: !355)
!355 = distinct !DILexicalBlock(scope: !356, file: !3, line: 46, column: 10)
!356 = distinct !DILexicalBlock(scope: !344, file: !3, line: 45, column: 22)
!357 = !DILocation(line: 46, column: 21, scope: !355)
!358 = !DILocation(line: 46, column: 18, scope: !355)
!359 = !DILocation(line: 46, column: 10, scope: !355)
!360 = !DILocation(line: 46, column: 35, scope: !355)
!361 = !DILocation(line: 46, column: 37, scope: !355)
!362 = !DILocation(line: 46, column: 29, scope: !355)
!363 = !DILocation(line: 46, column: 26, scope: !355)
!364 = !DILocation(line: 46, column: 10, scope: !356)
!365 = !DILocation(line: 47, column: 15, scope: !366)
!366 = distinct !DILexicalBlock(scope: !355, file: !3, line: 46, column: 45)
!367 = !DILocation(line: 48, column: 5, scope: !366)
!368 = !DILocation(line: 49, column: 7, scope: !369)
!369 = distinct !DILexicalBlock(scope: !355, file: !3, line: 48, column: 12)
!370 = !DILocation(line: 49, column: 7, scope: !371)
!371 = distinct !DILexicalBlock(scope: !369, file: !3, line: 49, column: 7)
!372 = !DILocalVariable(name: "t_", scope: !371, file: !3, line: 49, type: !24)
!373 = !DILocation(line: 0, scope: !371)
!374 = !DILocation(line: 50, column: 8, scope: !369)
!375 = !DILocation(line: 51, column: 13, scope: !369)
!376 = !DILocation(line: 51, column: 11, scope: !369)
!377 = !DILocation(line: 51, column: 21, scope: !369)
!378 = !DILocation(line: 0, scope: !355)
!379 = distinct !{!379, !351, !380}
!380 = !DILocation(line: 53, column: 3, scope: !344)
!381 = !DILocation(line: 54, column: 1, scope: !344)
