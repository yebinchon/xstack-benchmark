; ModuleID = 'count-the-coins-1.ll'
source_filename = "count-the-coins-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.i128 = type { [2 x i64] }

@__const.main.us_coins = private unnamed_addr constant [7 x i32] [i32 100, i32 50, i32 25, i32 10, i32 5, i32 1, i32 0], align 16
@__const.main.eu_coins = private unnamed_addr constant [9 x i32] [i32 200, i32 100, i32 50, i32 20, i32 10, i32 5, i32 2, i32 1, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i64 %v.coerce0, i64 %v.coerce1) #0 !dbg !7 {
entry:
  %v = alloca %struct.i128, align 8
  %x = alloca [4 x i32], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %len = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  %c = alloca i64, align 8
  %0 = bitcast %struct.i128* %v to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %v.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %v.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.i128* %v, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [4 x i32]* %x, metadata !24, metadata !DIExpression()), !dbg !31
  %arrayinit.begin = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 0, !dbg !32
  %x1 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !33
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %x1, i64 0, i64 0, !dbg !34
  %3 = load i64, i64* %arrayidx, align 8, !dbg !34
  %conv = trunc i64 %3 to i32, !dbg !34
  store i32 %conv, i32* %arrayinit.begin, align 4, !dbg !32
  %arrayinit.element = getelementptr inbounds i32, i32* %arrayinit.begin, i64 1, !dbg !32
  %x2 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !35
  %arrayidx3 = getelementptr inbounds [2 x i64], [2 x i64]* %x2, i64 0, i64 0, !dbg !36
  %4 = load i64, i64* %arrayidx3, align 8, !dbg !36
  %shr = lshr i64 %4, 32, !dbg !37
  %conv4 = trunc i64 %shr to i32, !dbg !36
  store i32 %conv4, i32* %arrayinit.element, align 4, !dbg !32
  %arrayinit.element5 = getelementptr inbounds i32, i32* %arrayinit.element, i64 1, !dbg !32
  %x6 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !38
  %arrayidx7 = getelementptr inbounds [2 x i64], [2 x i64]* %x6, i64 0, i64 1, !dbg !39
  %5 = load i64, i64* %arrayidx7, align 8, !dbg !39
  %conv8 = trunc i64 %5 to i32, !dbg !39
  store i32 %conv8, i32* %arrayinit.element5, align 4, !dbg !32
  %arrayinit.element9 = getelementptr inbounds i32, i32* %arrayinit.element5, i64 1, !dbg !32
  %x10 = getelementptr inbounds %struct.i128, %struct.i128* %v, i32 0, i32 0, !dbg !40
  %arrayidx11 = getelementptr inbounds [2 x i64], [2 x i64]* %x10, i64 0, i64 1, !dbg !41
  %6 = load i64, i64* %arrayidx11, align 8, !dbg !41
  %shr12 = lshr i64 %6, 32, !dbg !42
  %conv13 = trunc i64 %shr12 to i32, !dbg !41
  store i32 %conv13, i32* %arrayinit.element9, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %j, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 0, i32* %j, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %len, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 4, i32* %len, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %buf, metadata !50, metadata !DIExpression()), !dbg !55
  br label %do.body, !dbg !56

do.body:                                          ; preds = %do.cond, %entry
  call void @llvm.dbg.declare(metadata i64* %c, metadata !57, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %c, align 8, !dbg !59
  %7 = load i32, i32* %len, align 4, !dbg !60
  store i32 %7, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.body, %do.body
  %8 = load i32, i32* %i, align 4, !dbg !64
  %dec = add nsw i32 %8, -1, !dbg !64
  store i32 %dec, i32* %i, align 4, !dbg !64
  %tobool = icmp ne i32 %8, 0, !dbg !66
  br i1 %tobool, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %c, align 8, !dbg !67
  %shl = shl i64 %9, 32, !dbg !69
  %10 = load i32, i32* %i, align 4, !dbg !70
  %idxprom = sext i32 %10 to i64, !dbg !71
  %arrayidx14 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom, !dbg !71
  %11 = load i32, i32* %arrayidx14, align 4, !dbg !71
  %conv15 = zext i32 %11 to i64, !dbg !71
  %add = add i64 %shl, %conv15, !dbg !72
  store i64 %add, i64* %c, align 8, !dbg !73
  %12 = load i64, i64* %c, align 8, !dbg !74
  %div = udiv i64 %12, 10, !dbg !75
  %conv16 = trunc i64 %div to i32, !dbg !74
  %13 = load i32, i32* %i, align 4, !dbg !76
  %idxprom17 = sext i32 %13 to i64, !dbg !77
  %arrayidx18 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom17, !dbg !77
  store i32 %conv16, i32* %arrayidx18, align 4, !dbg !78
  %14 = load i64, i64* %c, align 8, !dbg !79
  %rem = urem i64 %14, 10, !dbg !79
  store i64 %rem, i64* %c, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %15 = load i64, i64* %c, align 8, !dbg !83
  %add19 = add i64 %15, 48, !dbg !84
  %conv20 = trunc i64 %add19 to i8, !dbg !83
  %16 = load i32, i32* %j, align 4, !dbg !85
  %inc = add nsw i32 %16, 1, !dbg !85
  store i32 %inc, i32* %j, align 4, !dbg !85
  %idxprom21 = sext i32 %16 to i64, !dbg !86
  %arrayidx22 = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 %idxprom21, !dbg !86
  store i8 %conv20, i8* %arrayidx22, align 1, !dbg !87
  store i32 4, i32* %len, align 4, !dbg !88
  br label %for.cond23, !dbg !90

for.cond23:                                       ; preds = %for.inc, %for.end
  %17 = load i32, i32* %len, align 4, !dbg !91
  %sub = sub nsw i32 %17, 1, !dbg !93
  %idxprom24 = sext i32 %sub to i64, !dbg !94
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %x, i64 0, i64 %idxprom24, !dbg !94
  %18 = load i32, i32* %arrayidx25, align 4, !dbg !94
  %tobool26 = icmp ne i32 %18, 0, !dbg !95
  %lnot = xor i1 %tobool26, true, !dbg !95
  br i1 %lnot, label %for.body27, label %for.end29, !dbg !96

for.body27:                                       ; preds = %for.cond23
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body27
  %19 = load i32, i32* %len, align 4, !dbg !97
  %dec28 = add nsw i32 %19, -1, !dbg !97
  store i32 %dec28, i32* %len, align 4, !dbg !97
  br label %for.cond23, !dbg !98, !llvm.loop !99

for.end29:                                        ; preds = %for.cond23
  br label %do.cond, !dbg !101

do.cond:                                          ; preds = %for.end29
  %20 = load i32, i32* %len, align 4, !dbg !102
  %tobool30 = icmp ne i32 %20, 0, !dbg !101
  br i1 %tobool30, label %do.body, label %do.end, !dbg !101, !llvm.loop !103

do.end:                                           ; preds = %do.cond
  br label %while.cond, !dbg !105

while.cond:                                       ; preds = %while.body, %do.end
  %21 = load i32, i32* %j, align 4, !dbg !106
  %dec31 = add nsw i32 %21, -1, !dbg !106
  store i32 %dec31, i32* %j, align 4, !dbg !106
  %tobool32 = icmp ne i32 %21, 0, !dbg !105
  br i1 %tobool32, label %while.body, label %while.end, !dbg !105

while.body:                                       ; preds = %while.cond
  %22 = load i32, i32* %j, align 4, !dbg !107
  %idxprom33 = sext i32 %22 to i64, !dbg !108
  %arrayidx34 = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 %idxprom33, !dbg !108
  %23 = load i8, i8* %arrayidx34, align 1, !dbg !108
  %conv35 = sext i8 %23 to i32, !dbg !108
  %call = call i32 @putchar(i32 %conv35), !dbg !109
  br label %while.cond, !dbg !105, !llvm.loop !110

while.end:                                        ; preds = %while.cond
  %call36 = call i32 @putchar(i32 10), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @count(i32 %sum, i32* %coins) #0 !dbg !114 {
entry:
  %retval = alloca %struct.i128, align 8
  %sum.addr = alloca i32, align 4
  %coins.addr = alloca i32*, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %v = alloca %struct.i128**, align 8
  %idx = alloca i32*, align 8
  %.compoundliteral = alloca %struct.i128, align 8
  %c = alloca %struct.i128, align 8
  %p = alloca %struct.i128*, align 8
  store i32 %sum, i32* %sum.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sum.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i32* %coins, i32** %coins.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %coins.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %n, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %k, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 0, i32* %n, align 4, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32*, i32** %coins.addr, align 8, !dbg !131
  %1 = load i32, i32* %n, align 4, !dbg !133
  %idxprom = sext i32 %1 to i64, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !131
  %2 = load i32, i32* %arrayidx, align 4, !dbg !131
  %tobool = icmp ne i32 %2, 0, !dbg !134
  br i1 %tobool, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %n, align 4, !dbg !135
  %inc = add nsw i32 %3, 1, !dbg !135
  store i32 %inc, i32* %n, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.i128*** %v, metadata !139, metadata !DIExpression()), !dbg !142
  %4 = load i32, i32* %n, align 4, !dbg !143
  %conv = sext i32 %4 to i64, !dbg !143
  %mul = mul i64 8, %conv, !dbg !144
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !145
  %5 = bitcast i8* %call to %struct.i128**, !dbg !145
  store %struct.i128** %5, %struct.i128*** %v, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i32** %idx, metadata !146, metadata !DIExpression()), !dbg !147
  %6 = load i32, i32* %n, align 4, !dbg !148
  %conv1 = sext i32 %6 to i64, !dbg !148
  %mul2 = mul i64 4, %conv1, !dbg !149
  %call3 = call noalias i8* @malloc(i64 %mul2) #5, !dbg !150
  %7 = bitcast i8* %call3 to i32*, !dbg !150
  store i32* %7, i32** %idx, align 8, !dbg !147
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond4, !dbg !153

for.cond4:                                        ; preds = %for.inc17, %for.end
  %8 = load i32, i32* %i, align 4, !dbg !154
  %9 = load i32, i32* %n, align 4, !dbg !156
  %cmp = icmp slt i32 %8, %9, !dbg !157
  br i1 %cmp, label %for.body6, label %for.end19, !dbg !158

for.body6:                                        ; preds = %for.cond4
  %10 = load i32*, i32** %coins.addr, align 8, !dbg !159
  %11 = load i32, i32* %i, align 4, !dbg !161
  %idxprom7 = sext i32 %11 to i64, !dbg !159
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 %idxprom7, !dbg !159
  %12 = load i32, i32* %arrayidx8, align 4, !dbg !159
  %13 = load i32*, i32** %idx, align 8, !dbg !162
  %14 = load i32, i32* %i, align 4, !dbg !163
  %idxprom9 = sext i32 %14 to i64, !dbg !162
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9, !dbg !162
  store i32 %12, i32* %arrayidx10, align 4, !dbg !164
  %15 = load i32*, i32** %coins.addr, align 8, !dbg !165
  %16 = load i32, i32* %i, align 4, !dbg !166
  %idxprom11 = sext i32 %16 to i64, !dbg !165
  %arrayidx12 = getelementptr inbounds i32, i32* %15, i64 %idxprom11, !dbg !165
  %17 = load i32, i32* %arrayidx12, align 4, !dbg !165
  %conv13 = sext i32 %17 to i64, !dbg !165
  %call14 = call noalias i8* @calloc(i64 16, i64 %conv13) #5, !dbg !167
  %18 = bitcast i8* %call14 to %struct.i128*, !dbg !167
  %19 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !168
  %20 = load i32, i32* %i, align 4, !dbg !169
  %idxprom15 = sext i32 %20 to i64, !dbg !168
  %arrayidx16 = getelementptr inbounds %struct.i128*, %struct.i128** %19, i64 %idxprom15, !dbg !168
  store %struct.i128* %18, %struct.i128** %arrayidx16, align 8, !dbg !170
  br label %for.inc17, !dbg !171

for.inc17:                                        ; preds = %for.body6
  %21 = load i32, i32* %i, align 4, !dbg !172
  %inc18 = add nsw i32 %21, 1, !dbg !172
  store i32 %inc18, i32* %i, align 4, !dbg !172
  br label %for.cond4, !dbg !173, !llvm.loop !174

for.end19:                                        ; preds = %for.cond4
  %22 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !176
  %arrayidx20 = getelementptr inbounds %struct.i128*, %struct.i128** %22, i64 0, !dbg !176
  %23 = load %struct.i128*, %struct.i128** %arrayidx20, align 8, !dbg !176
  %24 = load i32*, i32** %coins.addr, align 8, !dbg !177
  %arrayidx21 = getelementptr inbounds i32, i32* %24, i64 0, !dbg !177
  %25 = load i32, i32* %arrayidx21, align 4, !dbg !177
  %sub = sub nsw i32 %25, 1, !dbg !178
  %idxprom22 = sext i32 %sub to i64, !dbg !176
  %arrayidx23 = getelementptr inbounds %struct.i128, %struct.i128* %23, i64 %idxprom22, !dbg !176
  %x = getelementptr inbounds %struct.i128, %struct.i128* %.compoundliteral, i32 0, i32 0, !dbg !179
  %arrayinit.begin = getelementptr inbounds [2 x i64], [2 x i64]* %x, i64 0, i64 0, !dbg !180
  store i64 1, i64* %arrayinit.begin, align 8, !dbg !180
  %arrayinit.element = getelementptr inbounds i64, i64* %arrayinit.begin, i64 1, !dbg !180
  store i64 0, i64* %arrayinit.element, align 8, !dbg !180
  %26 = bitcast %struct.i128* %arrayidx23 to i8*, !dbg !181
  %27 = bitcast %struct.i128* %.compoundliteral to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %26, i8* align 8 %27, i64 16, i1 false), !dbg !181
  store i32 0, i32* %k, align 4, !dbg !182
  br label %for.cond24, !dbg !184

for.cond24:                                       ; preds = %for.inc78, %for.end19
  %28 = load i32, i32* %k, align 4, !dbg !185
  %29 = load i32, i32* %sum.addr, align 4, !dbg !187
  %cmp25 = icmp sle i32 %28, %29, !dbg !188
  br i1 %cmp25, label %for.body27, label %for.end80, !dbg !189

for.body27:                                       ; preds = %for.cond24
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond28, !dbg !193

for.cond28:                                       ; preds = %for.inc40, %for.body27
  %30 = load i32, i32* %i, align 4, !dbg !194
  %31 = load i32, i32* %n, align 4, !dbg !196
  %cmp29 = icmp slt i32 %30, %31, !dbg !197
  br i1 %cmp29, label %for.body31, label %for.end42, !dbg !198

for.body31:                                       ; preds = %for.cond28
  %32 = load i32*, i32** %idx, align 8, !dbg !199
  %33 = load i32, i32* %i, align 4, !dbg !201
  %idxprom32 = sext i32 %33 to i64, !dbg !199
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 %idxprom32, !dbg !199
  %34 = load i32, i32* %arrayidx33, align 4, !dbg !202
  %dec = add nsw i32 %34, -1, !dbg !202
  store i32 %dec, i32* %arrayidx33, align 4, !dbg !202
  %tobool34 = icmp ne i32 %34, 0, !dbg !202
  br i1 %tobool34, label %if.end, label %if.then, !dbg !203

if.then:                                          ; preds = %for.body31
  %35 = load i32*, i32** %coins.addr, align 8, !dbg !204
  %36 = load i32, i32* %i, align 4, !dbg !205
  %idxprom35 = sext i32 %36 to i64, !dbg !204
  %arrayidx36 = getelementptr inbounds i32, i32* %35, i64 %idxprom35, !dbg !204
  %37 = load i32, i32* %arrayidx36, align 4, !dbg !204
  %sub37 = sub nsw i32 %37, 1, !dbg !206
  %38 = load i32*, i32** %idx, align 8, !dbg !207
  %39 = load i32, i32* %i, align 4, !dbg !208
  %idxprom38 = sext i32 %39 to i64, !dbg !207
  %arrayidx39 = getelementptr inbounds i32, i32* %38, i64 %idxprom38, !dbg !207
  store i32 %sub37, i32* %arrayidx39, align 4, !dbg !209
  br label %if.end, !dbg !207

if.end:                                           ; preds = %if.then, %for.body31
  br label %for.inc40, !dbg !202

for.inc40:                                        ; preds = %if.end
  %40 = load i32, i32* %i, align 4, !dbg !210
  %inc41 = add nsw i32 %40, 1, !dbg !210
  store i32 %inc41, i32* %i, align 4, !dbg !210
  br label %for.cond28, !dbg !211, !llvm.loop !212

for.end42:                                        ; preds = %for.cond28
  call void @llvm.dbg.declare(metadata %struct.i128* %c, metadata !214, metadata !DIExpression()), !dbg !215
  %41 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !216
  %arrayidx43 = getelementptr inbounds %struct.i128*, %struct.i128** %41, i64 0, !dbg !216
  %42 = load %struct.i128*, %struct.i128** %arrayidx43, align 8, !dbg !216
  %43 = load i32*, i32** %idx, align 8, !dbg !217
  %arrayidx44 = getelementptr inbounds i32, i32* %43, i64 0, !dbg !217
  %44 = load i32, i32* %arrayidx44, align 4, !dbg !217
  %idxprom45 = sext i32 %44 to i64, !dbg !216
  %arrayidx46 = getelementptr inbounds %struct.i128, %struct.i128* %42, i64 %idxprom45, !dbg !216
  %45 = bitcast %struct.i128* %c to i8*, !dbg !216
  %46 = bitcast %struct.i128* %arrayidx46 to i8*, !dbg !216
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %45, i8* align 8 %46, i64 16, i1 false), !dbg !216
  store i32 1, i32* %i, align 4, !dbg !218
  br label %for.cond47, !dbg !220

for.cond47:                                       ; preds = %for.inc75, %for.end42
  %47 = load i32, i32* %i, align 4, !dbg !221
  %48 = load i32, i32* %n, align 4, !dbg !223
  %cmp48 = icmp slt i32 %47, %48, !dbg !224
  br i1 %cmp48, label %for.body50, label %for.end77, !dbg !225

for.body50:                                       ; preds = %for.cond47
  call void @llvm.dbg.declare(metadata %struct.i128** %p, metadata !226, metadata !DIExpression()), !dbg !228
  %49 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !229
  %50 = load i32, i32* %i, align 4, !dbg !230
  %idxprom51 = sext i32 %50 to i64, !dbg !229
  %arrayidx52 = getelementptr inbounds %struct.i128*, %struct.i128** %49, i64 %idxprom51, !dbg !229
  %51 = load %struct.i128*, %struct.i128** %arrayidx52, align 8, !dbg !229
  %52 = load i32*, i32** %idx, align 8, !dbg !231
  %53 = load i32, i32* %i, align 4, !dbg !232
  %idxprom53 = sext i32 %53 to i64, !dbg !231
  %arrayidx54 = getelementptr inbounds i32, i32* %52, i64 %idxprom53, !dbg !231
  %54 = load i32, i32* %arrayidx54, align 4, !dbg !231
  %idx.ext = sext i32 %54 to i64, !dbg !233
  %add.ptr = getelementptr inbounds %struct.i128, %struct.i128* %51, i64 %idx.ext, !dbg !233
  store %struct.i128* %add.ptr, %struct.i128** %p, align 8, !dbg !228
  %x55 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !234
  %arrayidx56 = getelementptr inbounds [2 x i64], [2 x i64]* %x55, i64 0, i64 0, !dbg !235
  %55 = load i64, i64* %arrayidx56, align 8, !dbg !235
  %56 = load %struct.i128*, %struct.i128** %p, align 8, !dbg !236
  %x57 = getelementptr inbounds %struct.i128, %struct.i128* %56, i32 0, i32 0, !dbg !237
  %arrayidx58 = getelementptr inbounds [2 x i64], [2 x i64]* %x57, i64 0, i64 0, !dbg !236
  %57 = load i64, i64* %arrayidx58, align 8, !dbg !238
  %add = add i64 %57, %55, !dbg !238
  store i64 %add, i64* %arrayidx58, align 8, !dbg !238
  %x59 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !239
  %arrayidx60 = getelementptr inbounds [2 x i64], [2 x i64]* %x59, i64 0, i64 1, !dbg !240
  %58 = load i64, i64* %arrayidx60, align 8, !dbg !240
  %59 = load %struct.i128*, %struct.i128** %p, align 8, !dbg !241
  %x61 = getelementptr inbounds %struct.i128, %struct.i128* %59, i32 0, i32 0, !dbg !242
  %arrayidx62 = getelementptr inbounds [2 x i64], [2 x i64]* %x61, i64 0, i64 1, !dbg !241
  %60 = load i64, i64* %arrayidx62, align 8, !dbg !243
  %add63 = add i64 %60, %58, !dbg !243
  store i64 %add63, i64* %arrayidx62, align 8, !dbg !243
  %61 = load %struct.i128*, %struct.i128** %p, align 8, !dbg !244
  %x64 = getelementptr inbounds %struct.i128, %struct.i128* %61, i32 0, i32 0, !dbg !246
  %arrayidx65 = getelementptr inbounds [2 x i64], [2 x i64]* %x64, i64 0, i64 0, !dbg !244
  %62 = load i64, i64* %arrayidx65, align 8, !dbg !244
  %x66 = getelementptr inbounds %struct.i128, %struct.i128* %c, i32 0, i32 0, !dbg !247
  %arrayidx67 = getelementptr inbounds [2 x i64], [2 x i64]* %x66, i64 0, i64 0, !dbg !248
  %63 = load i64, i64* %arrayidx67, align 8, !dbg !248
  %cmp68 = icmp ult i64 %62, %63, !dbg !249
  br i1 %cmp68, label %if.then70, label %if.end74, !dbg !250

if.then70:                                        ; preds = %for.body50
  %64 = load %struct.i128*, %struct.i128** %p, align 8, !dbg !251
  %x71 = getelementptr inbounds %struct.i128, %struct.i128* %64, i32 0, i32 0, !dbg !252
  %arrayidx72 = getelementptr inbounds [2 x i64], [2 x i64]* %x71, i64 0, i64 1, !dbg !251
  %65 = load i64, i64* %arrayidx72, align 8, !dbg !253
  %inc73 = add i64 %65, 1, !dbg !253
  store i64 %inc73, i64* %arrayidx72, align 8, !dbg !253
  br label %if.end74, !dbg !251

if.end74:                                         ; preds = %if.then70, %for.body50
  %66 = load %struct.i128*, %struct.i128** %p, align 8, !dbg !254
  %67 = bitcast %struct.i128* %c to i8*, !dbg !255
  %68 = bitcast %struct.i128* %66 to i8*, !dbg !255
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %67, i8* align 8 %68, i64 16, i1 false), !dbg !255
  br label %for.inc75, !dbg !256

for.inc75:                                        ; preds = %if.end74
  %69 = load i32, i32* %i, align 4, !dbg !257
  %inc76 = add nsw i32 %69, 1, !dbg !257
  store i32 %inc76, i32* %i, align 4, !dbg !257
  br label %for.cond47, !dbg !258, !llvm.loop !259

for.end77:                                        ; preds = %for.cond47
  br label %for.inc78, !dbg !261

for.inc78:                                        ; preds = %for.end77
  %70 = load i32, i32* %k, align 4, !dbg !262
  %inc79 = add nsw i32 %70, 1, !dbg !262
  store i32 %inc79, i32* %k, align 4, !dbg !262
  br label %for.cond24, !dbg !263, !llvm.loop !264

for.end80:                                        ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata %struct.i128* %retval, metadata !266, metadata !DIExpression()), !dbg !267
  %71 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !268
  %72 = load i32, i32* %n, align 4, !dbg !269
  %sub81 = sub nsw i32 %72, 1, !dbg !270
  %idxprom82 = sext i32 %sub81 to i64, !dbg !268
  %arrayidx83 = getelementptr inbounds %struct.i128*, %struct.i128** %71, i64 %idxprom82, !dbg !268
  %73 = load %struct.i128*, %struct.i128** %arrayidx83, align 8, !dbg !268
  %74 = load i32*, i32** %idx, align 8, !dbg !271
  %75 = load i32, i32* %n, align 4, !dbg !272
  %sub84 = sub nsw i32 %75, 1, !dbg !273
  %idxprom85 = sext i32 %sub84 to i64, !dbg !271
  %arrayidx86 = getelementptr inbounds i32, i32* %74, i64 %idxprom85, !dbg !271
  %76 = load i32, i32* %arrayidx86, align 4, !dbg !271
  %idxprom87 = sext i32 %76 to i64, !dbg !268
  %arrayidx88 = getelementptr inbounds %struct.i128, %struct.i128* %73, i64 %idxprom87, !dbg !268
  %77 = bitcast %struct.i128* %retval to i8*, !dbg !268
  %78 = bitcast %struct.i128* %arrayidx88 to i8*, !dbg !268
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %77, i8* align 8 %78, i64 16, i1 false), !dbg !268
  store i32 0, i32* %i, align 4, !dbg !274
  br label %for.cond89, !dbg !276

for.cond89:                                       ; preds = %for.inc95, %for.end80
  %79 = load i32, i32* %i, align 4, !dbg !277
  %80 = load i32, i32* %n, align 4, !dbg !279
  %cmp90 = icmp slt i32 %79, %80, !dbg !280
  br i1 %cmp90, label %for.body92, label %for.end97, !dbg !281

for.body92:                                       ; preds = %for.cond89
  %81 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !282
  %82 = load i32, i32* %i, align 4, !dbg !283
  %idxprom93 = sext i32 %82 to i64, !dbg !282
  %arrayidx94 = getelementptr inbounds %struct.i128*, %struct.i128** %81, i64 %idxprom93, !dbg !282
  %83 = load %struct.i128*, %struct.i128** %arrayidx94, align 8, !dbg !282
  %84 = bitcast %struct.i128* %83 to i8*, !dbg !282
  call void @free(i8* %84) #5, !dbg !284
  br label %for.inc95, !dbg !284

for.inc95:                                        ; preds = %for.body92
  %85 = load i32, i32* %i, align 4, !dbg !285
  %inc96 = add nsw i32 %85, 1, !dbg !285
  store i32 %inc96, i32* %i, align 4, !dbg !285
  br label %for.cond89, !dbg !286, !llvm.loop !287

for.end97:                                        ; preds = %for.cond89
  %86 = load %struct.i128**, %struct.i128*** %v, align 8, !dbg !289
  %87 = bitcast %struct.i128** %86 to i8*, !dbg !289
  call void @free(i8* %87) #5, !dbg !290
  %88 = load i32*, i32** %idx, align 8, !dbg !291
  %89 = bitcast i32* %88 to i8*, !dbg !291
  call void @free(i8* %89) #5, !dbg !292
  %coerce.dive = getelementptr inbounds %struct.i128, %struct.i128* %retval, i32 0, i32 0, !dbg !293
  %90 = bitcast [2 x i64]* %coerce.dive to { i64, i64 }*, !dbg !293
  %91 = load { i64, i64 }, { i64, i64 }* %90, align 8, !dbg !293
  ret { i64, i64 } %91, !dbg !293
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count2(i32 %sum, i32* %coins) #0 !dbg !294 {
entry:
  %retval = alloca i32, align 4
  %sum.addr = alloca i32, align 4
  %coins.addr = alloca i32*, align 8
  store i32 %sum, i32* %sum.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sum.addr, metadata !297, metadata !DIExpression()), !dbg !298
  store i32* %coins, i32** %coins.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %coins.addr, metadata !299, metadata !DIExpression()), !dbg !300
  %0 = load i32*, i32** %coins.addr, align 8, !dbg !301
  %1 = load i32, i32* %0, align 4, !dbg !303
  %tobool = icmp ne i32 %1, 0, !dbg !303
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !304

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %sum.addr, align 4, !dbg !305
  %cmp = icmp slt i32 %2, 0, !dbg !306
  br i1 %cmp, label %if.then, label %if.end, !dbg !307

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4, !dbg !308
  br label %return, !dbg !308

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %sum.addr, align 4, !dbg !309
  %tobool1 = icmp ne i32 %3, 0, !dbg !309
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !311

if.then2:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !312
  br label %return, !dbg !312

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %sum.addr, align 4, !dbg !313
  %5 = load i32*, i32** %coins.addr, align 8, !dbg !314
  %6 = load i32, i32* %5, align 4, !dbg !315
  %sub = sub nsw i32 %4, %6, !dbg !316
  %7 = load i32*, i32** %coins.addr, align 8, !dbg !317
  %call = call i32 @count2(i32 %sub, i32* %7), !dbg !318
  %8 = load i32, i32* %sum.addr, align 4, !dbg !319
  %9 = load i32*, i32** %coins.addr, align 8, !dbg !320
  %add.ptr = getelementptr inbounds i32, i32* %9, i64 1, !dbg !321
  %call4 = call i32 @count2(i32 %8, i32* %add.ptr), !dbg !322
  %add = add nsw i32 %call, %call4, !dbg !323
  store i32 %add, i32* %retval, align 4, !dbg !324
  br label %return, !dbg !324

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !325
  ret i32 %10, !dbg !325
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !326 {
entry:
  %retval = alloca i32, align 4
  %us_coins = alloca [7 x i32], align 16
  %eu_coins = alloca [9 x i32], align 16
  %agg.tmp = alloca %struct.i128, align 8
  %agg.tmp1 = alloca %struct.i128, align 8
  %agg.tmp5 = alloca %struct.i128, align 8
  %agg.tmp9 = alloca %struct.i128, align 8
  %agg.tmp13 = alloca %struct.i128, align 8
  %agg.tmp18 = alloca %struct.i128, align 8
  %agg.tmp22 = alloca %struct.i128, align 8
  %agg.tmp26 = alloca %struct.i128, align 8
  %agg.tmp30 = alloca %struct.i128, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [7 x i32]* %us_coins, metadata !329, metadata !DIExpression()), !dbg !333
  %0 = bitcast [7 x i32]* %us_coins to i8*, !dbg !333
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([7 x i32]* @__const.main.us_coins to i8*), i64 28, i1 false), !dbg !333
  call void @llvm.dbg.declare(metadata [9 x i32]* %eu_coins, metadata !334, metadata !DIExpression()), !dbg !338
  %1 = bitcast [9 x i32]* %eu_coins to i8*, !dbg !338
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([9 x i32]* @__const.main.eu_coins to i8*), i64 36, i1 false), !dbg !338
  %arraydecay = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !339
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay, i64 2, !dbg !340
  %call = call { i64, i64 } @count(i32 100, i32* %add.ptr), !dbg !341
  %coerce.dive = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp, i32 0, i32 0, !dbg !341
  %2 = bitcast [2 x i64]* %coerce.dive to { i64, i64 }*, !dbg !341
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 0, !dbg !341
  %4 = extractvalue { i64, i64 } %call, 0, !dbg !341
  store i64 %4, i64* %3, align 8, !dbg !341
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 1, !dbg !341
  %6 = extractvalue { i64, i64 } %call, 1, !dbg !341
  store i64 %6, i64* %5, align 8, !dbg !341
  %7 = bitcast %struct.i128* %agg.tmp to { i64, i64 }*, !dbg !342
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 0, !dbg !342
  %9 = load i64, i64* %8, align 8, !dbg !342
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 1, !dbg !342
  %11 = load i64, i64* %10, align 8, !dbg !342
  call void @show(i64 %9, i64 %11), !dbg !342
  %arraydecay2 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !343
  %call3 = call { i64, i64 } @count(i32 1000, i32* %arraydecay2), !dbg !344
  %coerce.dive4 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp1, i32 0, i32 0, !dbg !344
  %12 = bitcast [2 x i64]* %coerce.dive4 to { i64, i64 }*, !dbg !344
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !344
  %14 = extractvalue { i64, i64 } %call3, 0, !dbg !344
  store i64 %14, i64* %13, align 8, !dbg !344
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !344
  %16 = extractvalue { i64, i64 } %call3, 1, !dbg !344
  store i64 %16, i64* %15, align 8, !dbg !344
  %17 = bitcast %struct.i128* %agg.tmp1 to { i64, i64 }*, !dbg !345
  %18 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 0, !dbg !345
  %19 = load i64, i64* %18, align 8, !dbg !345
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 1, !dbg !345
  %21 = load i64, i64* %20, align 8, !dbg !345
  call void @show(i64 %19, i64 %21), !dbg !345
  %arraydecay6 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !346
  %call7 = call { i64, i64 } @count(i32 100000, i32* %arraydecay6), !dbg !347
  %coerce.dive8 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp5, i32 0, i32 0, !dbg !347
  %22 = bitcast [2 x i64]* %coerce.dive8 to { i64, i64 }*, !dbg !347
  %23 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 0, !dbg !347
  %24 = extractvalue { i64, i64 } %call7, 0, !dbg !347
  store i64 %24, i64* %23, align 8, !dbg !347
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 1, !dbg !347
  %26 = extractvalue { i64, i64 } %call7, 1, !dbg !347
  store i64 %26, i64* %25, align 8, !dbg !347
  %27 = bitcast %struct.i128* %agg.tmp5 to { i64, i64 }*, !dbg !348
  %28 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 0, !dbg !348
  %29 = load i64, i64* %28, align 8, !dbg !348
  %30 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 1, !dbg !348
  %31 = load i64, i64* %30, align 8, !dbg !348
  call void @show(i64 %29, i64 %31), !dbg !348
  %arraydecay10 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !349
  %call11 = call { i64, i64 } @count(i32 1000000, i32* %arraydecay10), !dbg !350
  %coerce.dive12 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp9, i32 0, i32 0, !dbg !350
  %32 = bitcast [2 x i64]* %coerce.dive12 to { i64, i64 }*, !dbg !350
  %33 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 0, !dbg !350
  %34 = extractvalue { i64, i64 } %call11, 0, !dbg !350
  store i64 %34, i64* %33, align 8, !dbg !350
  %35 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 1, !dbg !350
  %36 = extractvalue { i64, i64 } %call11, 1, !dbg !350
  store i64 %36, i64* %35, align 8, !dbg !350
  %37 = bitcast %struct.i128* %agg.tmp9 to { i64, i64 }*, !dbg !351
  %38 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i32 0, i32 0, !dbg !351
  %39 = load i64, i64* %38, align 8, !dbg !351
  %40 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i32 0, i32 1, !dbg !351
  %41 = load i64, i64* %40, align 8, !dbg !351
  call void @show(i64 %39, i64 %41), !dbg !351
  %arraydecay14 = getelementptr inbounds [7 x i32], [7 x i32]* %us_coins, i64 0, i64 0, !dbg !352
  %call15 = call { i64, i64 } @count(i32 10000000, i32* %arraydecay14), !dbg !353
  %coerce.dive16 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp13, i32 0, i32 0, !dbg !353
  %42 = bitcast [2 x i64]* %coerce.dive16 to { i64, i64 }*, !dbg !353
  %43 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %42, i32 0, i32 0, !dbg !353
  %44 = extractvalue { i64, i64 } %call15, 0, !dbg !353
  store i64 %44, i64* %43, align 8, !dbg !353
  %45 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %42, i32 0, i32 1, !dbg !353
  %46 = extractvalue { i64, i64 } %call15, 1, !dbg !353
  store i64 %46, i64* %45, align 8, !dbg !353
  %47 = bitcast %struct.i128* %agg.tmp13 to { i64, i64 }*, !dbg !354
  %48 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %47, i32 0, i32 0, !dbg !354
  %49 = load i64, i64* %48, align 8, !dbg !354
  %50 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %47, i32 0, i32 1, !dbg !354
  %51 = load i64, i64* %50, align 8, !dbg !354
  call void @show(i64 %49, i64 %51), !dbg !354
  %call17 = call i32 @putchar(i32 10), !dbg !355
  %arraydecay19 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !356
  %call20 = call { i64, i64 } @count(i32 100, i32* %arraydecay19), !dbg !357
  %coerce.dive21 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp18, i32 0, i32 0, !dbg !357
  %52 = bitcast [2 x i64]* %coerce.dive21 to { i64, i64 }*, !dbg !357
  %53 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 0, !dbg !357
  %54 = extractvalue { i64, i64 } %call20, 0, !dbg !357
  store i64 %54, i64* %53, align 8, !dbg !357
  %55 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %52, i32 0, i32 1, !dbg !357
  %56 = extractvalue { i64, i64 } %call20, 1, !dbg !357
  store i64 %56, i64* %55, align 8, !dbg !357
  %57 = bitcast %struct.i128* %agg.tmp18 to { i64, i64 }*, !dbg !358
  %58 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %57, i32 0, i32 0, !dbg !358
  %59 = load i64, i64* %58, align 8, !dbg !358
  %60 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %57, i32 0, i32 1, !dbg !358
  %61 = load i64, i64* %60, align 8, !dbg !358
  call void @show(i64 %59, i64 %61), !dbg !358
  %arraydecay23 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !359
  %call24 = call { i64, i64 } @count(i32 100000, i32* %arraydecay23), !dbg !360
  %coerce.dive25 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp22, i32 0, i32 0, !dbg !360
  %62 = bitcast [2 x i64]* %coerce.dive25 to { i64, i64 }*, !dbg !360
  %63 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %62, i32 0, i32 0, !dbg !360
  %64 = extractvalue { i64, i64 } %call24, 0, !dbg !360
  store i64 %64, i64* %63, align 8, !dbg !360
  %65 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %62, i32 0, i32 1, !dbg !360
  %66 = extractvalue { i64, i64 } %call24, 1, !dbg !360
  store i64 %66, i64* %65, align 8, !dbg !360
  %67 = bitcast %struct.i128* %agg.tmp22 to { i64, i64 }*, !dbg !361
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 0, !dbg !361
  %69 = load i64, i64* %68, align 8, !dbg !361
  %70 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 1, !dbg !361
  %71 = load i64, i64* %70, align 8, !dbg !361
  call void @show(i64 %69, i64 %71), !dbg !361
  %arraydecay27 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !362
  %call28 = call { i64, i64 } @count(i32 1000000, i32* %arraydecay27), !dbg !363
  %coerce.dive29 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp26, i32 0, i32 0, !dbg !363
  %72 = bitcast [2 x i64]* %coerce.dive29 to { i64, i64 }*, !dbg !363
  %73 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 0, !dbg !363
  %74 = extractvalue { i64, i64 } %call28, 0, !dbg !363
  store i64 %74, i64* %73, align 8, !dbg !363
  %75 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 1, !dbg !363
  %76 = extractvalue { i64, i64 } %call28, 1, !dbg !363
  store i64 %76, i64* %75, align 8, !dbg !363
  %77 = bitcast %struct.i128* %agg.tmp26 to { i64, i64 }*, !dbg !364
  %78 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %77, i32 0, i32 0, !dbg !364
  %79 = load i64, i64* %78, align 8, !dbg !364
  %80 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %77, i32 0, i32 1, !dbg !364
  %81 = load i64, i64* %80, align 8, !dbg !364
  call void @show(i64 %79, i64 %81), !dbg !364
  %arraydecay31 = getelementptr inbounds [9 x i32], [9 x i32]* %eu_coins, i64 0, i64 0, !dbg !365
  %call32 = call { i64, i64 } @count(i32 10000000, i32* %arraydecay31), !dbg !366
  %coerce.dive33 = getelementptr inbounds %struct.i128, %struct.i128* %agg.tmp30, i32 0, i32 0, !dbg !366
  %82 = bitcast [2 x i64]* %coerce.dive33 to { i64, i64 }*, !dbg !366
  %83 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %82, i32 0, i32 0, !dbg !366
  %84 = extractvalue { i64, i64 } %call32, 0, !dbg !366
  store i64 %84, i64* %83, align 8, !dbg !366
  %85 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %82, i32 0, i32 1, !dbg !366
  %86 = extractvalue { i64, i64 } %call32, 1, !dbg !366
  store i64 %86, i64* %85, align 8, !dbg !366
  %87 = bitcast %struct.i128* %agg.tmp30 to { i64, i64 }*, !dbg !367
  %88 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %87, i32 0, i32 0, !dbg !367
  %89 = load i64, i64* %88, align 8, !dbg !367
  %90 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %87, i32 0, i32 1, !dbg !367
  %91 = load i64, i64* %90, align 8, !dbg !367
  call void @show(i64 %89, i64 %91), !dbg !367
  ret i32 0, !dbg !368
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "count-the-coins-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Count-the-coins")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "show", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "i128", file: !1, line: 7, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 7, size: 128, elements: !12)
!12 = !{!13}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !11, file: !1, line: 7, baseType: !14, size: 128)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !20)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !18, line: 45, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !{!21}
!21 = !DISubrange(count: 2)
!22 = !DILocalVariable(name: "v", arg: 1, scope: !7, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 16, scope: !7)
!24 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 11, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 128, elements: !29)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !16, line: 26, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !18, line: 42, baseType: !28)
!28 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!29 = !{!30}
!30 = !DISubrange(count: 4)
!31 = !DILocation(line: 11, column: 11, scope: !7)
!32 = !DILocation(line: 11, column: 18, scope: !7)
!33 = !DILocation(line: 11, column: 21, scope: !7)
!34 = !DILocation(line: 11, column: 19, scope: !7)
!35 = !DILocation(line: 11, column: 29, scope: !7)
!36 = !DILocation(line: 11, column: 27, scope: !7)
!37 = !DILocation(line: 11, column: 34, scope: !7)
!38 = !DILocation(line: 11, column: 43, scope: !7)
!39 = !DILocation(line: 11, column: 41, scope: !7)
!40 = !DILocation(line: 11, column: 51, scope: !7)
!41 = !DILocation(line: 11, column: 49, scope: !7)
!42 = !DILocation(line: 11, column: 56, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 12, type: !44)
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DILocation(line: 12, column: 6, scope: !7)
!46 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 12, type: !44)
!47 = !DILocation(line: 12, column: 9, scope: !7)
!48 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 12, type: !44)
!49 = !DILocation(line: 12, column: 16, scope: !7)
!50 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 13, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 800, elements: !53)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 13, column: 7, scope: !7)
!56 = !DILocation(line: 14, column: 2, scope: !7)
!57 = !DILocalVariable(name: "c", scope: !58, file: !1, line: 15, type: !15)
!58 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 5)
!59 = !DILocation(line: 15, column: 12, scope: !58)
!60 = !DILocation(line: 16, column: 12, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !1, line: 16, column: 3)
!62 = !DILocation(line: 16, column: 10, scope: !61)
!63 = !DILocation(line: 16, column: 8, scope: !61)
!64 = !DILocation(line: 16, column: 18, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 16, column: 3)
!66 = !DILocation(line: 16, column: 3, scope: !61)
!67 = !DILocation(line: 17, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 16, column: 24)
!69 = !DILocation(line: 17, column: 11, scope: !68)
!70 = !DILocation(line: 17, column: 22, scope: !68)
!71 = !DILocation(line: 17, column: 20, scope: !68)
!72 = !DILocation(line: 17, column: 18, scope: !68)
!73 = !DILocation(line: 17, column: 6, scope: !68)
!74 = !DILocation(line: 18, column: 11, scope: !68)
!75 = !DILocation(line: 18, column: 13, scope: !68)
!76 = !DILocation(line: 18, column: 6, scope: !68)
!77 = !DILocation(line: 18, column: 4, scope: !68)
!78 = !DILocation(line: 18, column: 9, scope: !68)
!79 = !DILocation(line: 18, column: 21, scope: !68)
!80 = !DILocation(line: 16, column: 3, scope: !65)
!81 = distinct !{!81, !66, !82}
!82 = !DILocation(line: 19, column: 3, scope: !61)
!83 = !DILocation(line: 21, column: 14, scope: !58)
!84 = !DILocation(line: 21, column: 16, scope: !58)
!85 = !DILocation(line: 21, column: 8, scope: !58)
!86 = !DILocation(line: 21, column: 3, scope: !58)
!87 = !DILocation(line: 21, column: 12, scope: !58)
!88 = !DILocation(line: 22, column: 12, scope: !89)
!89 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 3)
!90 = !DILocation(line: 22, column: 8, scope: !89)
!91 = !DILocation(line: 22, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 22, column: 3)
!93 = !DILocation(line: 22, column: 24, scope: !92)
!94 = !DILocation(line: 22, column: 18, scope: !92)
!95 = !DILocation(line: 22, column: 17, scope: !92)
!96 = !DILocation(line: 22, column: 3, scope: !89)
!97 = !DILocation(line: 22, column: 33, scope: !92)
!98 = !DILocation(line: 22, column: 3, scope: !92)
!99 = distinct !{!99, !96, !100}
!100 = !DILocation(line: 22, column: 36, scope: !89)
!101 = !DILocation(line: 23, column: 2, scope: !58)
!102 = !DILocation(line: 23, column: 11, scope: !7)
!103 = distinct !{!103, !56, !104}
!104 = !DILocation(line: 23, column: 14, scope: !7)
!105 = !DILocation(line: 25, column: 2, scope: !7)
!106 = !DILocation(line: 25, column: 10, scope: !7)
!107 = !DILocation(line: 25, column: 26, scope: !7)
!108 = !DILocation(line: 25, column: 22, scope: !7)
!109 = !DILocation(line: 25, column: 14, scope: !7)
!110 = distinct !{!110, !105, !111}
!111 = !DILocation(line: 25, column: 28, scope: !7)
!112 = !DILocation(line: 26, column: 2, scope: !7)
!113 = !DILocation(line: 27, column: 1, scope: !7)
!114 = distinct !DISubprogram(name: "count", scope: !1, file: !1, line: 29, type: !115, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!10, !44, !117}
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!118 = !DILocalVariable(name: "sum", arg: 1, scope: !114, file: !1, line: 29, type: !44)
!119 = !DILocation(line: 29, column: 16, scope: !114)
!120 = !DILocalVariable(name: "coins", arg: 2, scope: !114, file: !1, line: 29, type: !117)
!121 = !DILocation(line: 29, column: 26, scope: !114)
!122 = !DILocalVariable(name: "n", scope: !114, file: !1, line: 31, type: !44)
!123 = !DILocation(line: 31, column: 6, scope: !114)
!124 = !DILocalVariable(name: "i", scope: !114, file: !1, line: 31, type: !44)
!125 = !DILocation(line: 31, column: 9, scope: !114)
!126 = !DILocalVariable(name: "k", scope: !114, file: !1, line: 31, type: !44)
!127 = !DILocation(line: 31, column: 12, scope: !114)
!128 = !DILocation(line: 32, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !114, file: !1, line: 32, column: 2)
!130 = !DILocation(line: 32, column: 7, scope: !129)
!131 = !DILocation(line: 32, column: 14, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !1, line: 32, column: 2)
!133 = !DILocation(line: 32, column: 20, scope: !132)
!134 = !DILocation(line: 32, column: 2, scope: !129)
!135 = !DILocation(line: 32, column: 25, scope: !132)
!136 = !DILocation(line: 32, column: 2, scope: !132)
!137 = distinct !{!137, !134, !138}
!138 = !DILocation(line: 32, column: 28, scope: !129)
!139 = !DILocalVariable(name: "v", scope: !114, file: !1, line: 34, type: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!142 = !DILocation(line: 34, column: 9, scope: !114)
!143 = !DILocation(line: 34, column: 35, scope: !114)
!144 = !DILocation(line: 34, column: 33, scope: !114)
!145 = !DILocation(line: 34, column: 13, scope: !114)
!146 = !DILocalVariable(name: "idx", scope: !114, file: !1, line: 35, type: !117)
!147 = !DILocation(line: 35, column: 7, scope: !114)
!148 = !DILocation(line: 35, column: 34, scope: !114)
!149 = !DILocation(line: 35, column: 32, scope: !114)
!150 = !DILocation(line: 35, column: 13, scope: !114)
!151 = !DILocation(line: 37, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !114, file: !1, line: 37, column: 2)
!153 = !DILocation(line: 37, column: 7, scope: !152)
!154 = !DILocation(line: 37, column: 14, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 37, column: 2)
!156 = !DILocation(line: 37, column: 18, scope: !155)
!157 = !DILocation(line: 37, column: 16, scope: !155)
!158 = !DILocation(line: 37, column: 2, scope: !152)
!159 = !DILocation(line: 38, column: 12, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !1, line: 37, column: 26)
!161 = !DILocation(line: 38, column: 18, scope: !160)
!162 = !DILocation(line: 38, column: 3, scope: !160)
!163 = !DILocation(line: 38, column: 7, scope: !160)
!164 = !DILocation(line: 38, column: 10, scope: !160)
!165 = !DILocation(line: 40, column: 31, scope: !160)
!166 = !DILocation(line: 40, column: 37, scope: !160)
!167 = !DILocation(line: 40, column: 10, scope: !160)
!168 = !DILocation(line: 40, column: 3, scope: !160)
!169 = !DILocation(line: 40, column: 5, scope: !160)
!170 = !DILocation(line: 40, column: 8, scope: !160)
!171 = !DILocation(line: 41, column: 2, scope: !160)
!172 = !DILocation(line: 37, column: 22, scope: !155)
!173 = !DILocation(line: 37, column: 2, scope: !155)
!174 = distinct !{!174, !158, !175}
!175 = !DILocation(line: 41, column: 2, scope: !152)
!176 = !DILocation(line: 43, column: 2, scope: !114)
!177 = !DILocation(line: 43, column: 7, scope: !114)
!178 = !DILocation(line: 43, column: 16, scope: !114)
!179 = !DILocation(line: 43, column: 30, scope: !114)
!180 = !DILocation(line: 43, column: 31, scope: !114)
!181 = !DILocation(line: 43, column: 23, scope: !114)
!182 = !DILocation(line: 45, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !114, file: !1, line: 45, column: 2)
!184 = !DILocation(line: 45, column: 7, scope: !183)
!185 = !DILocation(line: 45, column: 14, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !1, line: 45, column: 2)
!187 = !DILocation(line: 45, column: 19, scope: !186)
!188 = !DILocation(line: 45, column: 16, scope: !186)
!189 = !DILocation(line: 45, column: 2, scope: !183)
!190 = !DILocation(line: 46, column: 10, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !1, line: 46, column: 3)
!192 = distinct !DILexicalBlock(scope: !186, file: !1, line: 45, column: 29)
!193 = !DILocation(line: 46, column: 8, scope: !191)
!194 = !DILocation(line: 46, column: 15, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !1, line: 46, column: 3)
!196 = !DILocation(line: 46, column: 19, scope: !195)
!197 = !DILocation(line: 46, column: 17, scope: !195)
!198 = !DILocation(line: 46, column: 3, scope: !191)
!199 = !DILocation(line: 47, column: 9, scope: !200)
!200 = distinct !DILexicalBlock(scope: !195, file: !1, line: 47, column: 8)
!201 = !DILocation(line: 47, column: 13, scope: !200)
!202 = !DILocation(line: 47, column: 15, scope: !200)
!203 = !DILocation(line: 47, column: 8, scope: !195)
!204 = !DILocation(line: 47, column: 28, scope: !200)
!205 = !DILocation(line: 47, column: 34, scope: !200)
!206 = !DILocation(line: 47, column: 37, scope: !200)
!207 = !DILocation(line: 47, column: 19, scope: !200)
!208 = !DILocation(line: 47, column: 23, scope: !200)
!209 = !DILocation(line: 47, column: 26, scope: !200)
!210 = !DILocation(line: 46, column: 23, scope: !195)
!211 = !DILocation(line: 46, column: 3, scope: !195)
!212 = distinct !{!212, !198, !213}
!213 = !DILocation(line: 47, column: 39, scope: !191)
!214 = !DILocalVariable(name: "c", scope: !192, file: !1, line: 49, type: !10)
!215 = !DILocation(line: 49, column: 8, scope: !192)
!216 = !DILocation(line: 49, column: 12, scope: !192)
!217 = !DILocation(line: 49, column: 18, scope: !192)
!218 = !DILocation(line: 51, column: 10, scope: !219)
!219 = distinct !DILexicalBlock(scope: !192, file: !1, line: 51, column: 3)
!220 = !DILocation(line: 51, column: 8, scope: !219)
!221 = !DILocation(line: 51, column: 15, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !1, line: 51, column: 3)
!223 = !DILocation(line: 51, column: 19, scope: !222)
!224 = !DILocation(line: 51, column: 17, scope: !222)
!225 = !DILocation(line: 51, column: 3, scope: !219)
!226 = !DILocalVariable(name: "p", scope: !227, file: !1, line: 52, type: !141)
!227 = distinct !DILexicalBlock(scope: !222, file: !1, line: 51, column: 27)
!228 = !DILocation(line: 52, column: 10, scope: !227)
!229 = !DILocation(line: 52, column: 14, scope: !227)
!230 = !DILocation(line: 52, column: 16, scope: !227)
!231 = !DILocation(line: 52, column: 21, scope: !227)
!232 = !DILocation(line: 52, column: 25, scope: !227)
!233 = !DILocation(line: 52, column: 19, scope: !227)
!234 = !DILocation(line: 55, column: 17, scope: !227)
!235 = !DILocation(line: 55, column: 15, scope: !227)
!236 = !DILocation(line: 55, column: 4, scope: !227)
!237 = !DILocation(line: 55, column: 7, scope: !227)
!238 = !DILocation(line: 55, column: 12, scope: !227)
!239 = !DILocation(line: 56, column: 17, scope: !227)
!240 = !DILocation(line: 56, column: 15, scope: !227)
!241 = !DILocation(line: 56, column: 4, scope: !227)
!242 = !DILocation(line: 56, column: 7, scope: !227)
!243 = !DILocation(line: 56, column: 12, scope: !227)
!244 = !DILocation(line: 57, column: 8, scope: !245)
!245 = distinct !DILexicalBlock(scope: !227, file: !1, line: 57, column: 8)
!246 = !DILocation(line: 57, column: 11, scope: !245)
!247 = !DILocation(line: 57, column: 20, scope: !245)
!248 = !DILocation(line: 57, column: 18, scope: !245)
!249 = !DILocation(line: 57, column: 16, scope: !245)
!250 = !DILocation(line: 57, column: 8, scope: !227)
!251 = !DILocation(line: 58, column: 5, scope: !245)
!252 = !DILocation(line: 58, column: 8, scope: !245)
!253 = !DILocation(line: 58, column: 13, scope: !245)
!254 = !DILocation(line: 59, column: 9, scope: !227)
!255 = !DILocation(line: 59, column: 8, scope: !227)
!256 = !DILocation(line: 60, column: 3, scope: !227)
!257 = !DILocation(line: 51, column: 23, scope: !222)
!258 = !DILocation(line: 51, column: 3, scope: !222)
!259 = distinct !{!259, !225, !260}
!260 = !DILocation(line: 60, column: 3, scope: !219)
!261 = !DILocation(line: 61, column: 2, scope: !192)
!262 = !DILocation(line: 45, column: 25, scope: !186)
!263 = !DILocation(line: 45, column: 2, scope: !186)
!264 = distinct !{!264, !189, !265}
!265 = !DILocation(line: 61, column: 2, scope: !183)
!266 = !DILocalVariable(name: "r", scope: !114, file: !1, line: 63, type: !10)
!267 = !DILocation(line: 63, column: 7, scope: !114)
!268 = !DILocation(line: 63, column: 11, scope: !114)
!269 = !DILocation(line: 63, column: 13, scope: !114)
!270 = !DILocation(line: 63, column: 15, scope: !114)
!271 = !DILocation(line: 63, column: 20, scope: !114)
!272 = !DILocation(line: 63, column: 24, scope: !114)
!273 = !DILocation(line: 63, column: 25, scope: !114)
!274 = !DILocation(line: 65, column: 9, scope: !275)
!275 = distinct !DILexicalBlock(scope: !114, file: !1, line: 65, column: 2)
!276 = !DILocation(line: 65, column: 7, scope: !275)
!277 = !DILocation(line: 65, column: 14, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !1, line: 65, column: 2)
!279 = !DILocation(line: 65, column: 18, scope: !278)
!280 = !DILocation(line: 65, column: 16, scope: !278)
!281 = !DILocation(line: 65, column: 2, scope: !275)
!282 = !DILocation(line: 65, column: 31, scope: !278)
!283 = !DILocation(line: 65, column: 33, scope: !278)
!284 = !DILocation(line: 65, column: 26, scope: !278)
!285 = !DILocation(line: 65, column: 22, scope: !278)
!286 = !DILocation(line: 65, column: 2, scope: !278)
!287 = distinct !{!287, !281, !288}
!288 = !DILocation(line: 65, column: 35, scope: !275)
!289 = !DILocation(line: 66, column: 7, scope: !114)
!290 = !DILocation(line: 66, column: 2, scope: !114)
!291 = !DILocation(line: 67, column: 7, scope: !114)
!292 = !DILocation(line: 67, column: 2, scope: !114)
!293 = !DILocation(line: 69, column: 2, scope: !114)
!294 = distinct !DISubprogram(name: "count2", scope: !1, file: !1, line: 73, type: !295, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!295 = !DISubroutineType(types: !296)
!296 = !{!44, !44, !117}
!297 = !DILocalVariable(name: "sum", arg: 1, scope: !294, file: !1, line: 73, type: !44)
!298 = !DILocation(line: 73, column: 16, scope: !294)
!299 = !DILocalVariable(name: "coins", arg: 2, scope: !294, file: !1, line: 73, type: !117)
!300 = !DILocation(line: 73, column: 26, scope: !294)
!301 = !DILocation(line: 75, column: 8, scope: !302)
!302 = distinct !DILexicalBlock(scope: !294, file: !1, line: 75, column: 6)
!303 = !DILocation(line: 75, column: 7, scope: !302)
!304 = !DILocation(line: 75, column: 14, scope: !302)
!305 = !DILocation(line: 75, column: 17, scope: !302)
!306 = !DILocation(line: 75, column: 21, scope: !302)
!307 = !DILocation(line: 75, column: 6, scope: !294)
!308 = !DILocation(line: 75, column: 26, scope: !302)
!309 = !DILocation(line: 76, column: 7, scope: !310)
!310 = distinct !DILexicalBlock(scope: !294, file: !1, line: 76, column: 6)
!311 = !DILocation(line: 76, column: 6, scope: !294)
!312 = !DILocation(line: 76, column: 12, scope: !310)
!313 = !DILocation(line: 77, column: 16, scope: !294)
!314 = !DILocation(line: 77, column: 23, scope: !294)
!315 = !DILocation(line: 77, column: 22, scope: !294)
!316 = !DILocation(line: 77, column: 20, scope: !294)
!317 = !DILocation(line: 77, column: 30, scope: !294)
!318 = !DILocation(line: 77, column: 9, scope: !294)
!319 = !DILocation(line: 77, column: 46, scope: !294)
!320 = !DILocation(line: 77, column: 51, scope: !294)
!321 = !DILocation(line: 77, column: 57, scope: !294)
!322 = !DILocation(line: 77, column: 39, scope: !294)
!323 = !DILocation(line: 77, column: 37, scope: !294)
!324 = !DILocation(line: 77, column: 2, scope: !294)
!325 = !DILocation(line: 78, column: 1, scope: !294)
!326 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 80, type: !327, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!327 = !DISubroutineType(types: !328)
!328 = !{!44}
!329 = !DILocalVariable(name: "us_coins", scope: !326, file: !1, line: 82, type: !330)
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 224, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 7)
!333 = !DILocation(line: 82, column: 6, scope: !326)
!334 = !DILocalVariable(name: "eu_coins", scope: !326, file: !1, line: 83, type: !335)
!335 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 288, elements: !336)
!336 = !{!337}
!337 = !DISubrange(count: 9)
!338 = !DILocation(line: 83, column: 6, scope: !326)
!339 = !DILocation(line: 85, column: 21, scope: !326)
!340 = !DILocation(line: 85, column: 30, scope: !326)
!341 = !DILocation(line: 85, column: 7, scope: !326)
!342 = !DILocation(line: 85, column: 2, scope: !326)
!343 = !DILocation(line: 86, column: 21, scope: !326)
!344 = !DILocation(line: 86, column: 7, scope: !326)
!345 = !DILocation(line: 86, column: 2, scope: !326)
!346 = !DILocation(line: 88, column: 27, scope: !326)
!347 = !DILocation(line: 88, column: 7, scope: !326)
!348 = !DILocation(line: 88, column: 2, scope: !326)
!349 = !DILocation(line: 89, column: 27, scope: !326)
!350 = !DILocation(line: 89, column: 7, scope: !326)
!351 = !DILocation(line: 89, column: 2, scope: !326)
!352 = !DILocation(line: 90, column: 27, scope: !326)
!353 = !DILocation(line: 90, column: 7, scope: !326)
!354 = !DILocation(line: 90, column: 2, scope: !326)
!355 = !DILocation(line: 92, column: 2, scope: !326)
!356 = !DILocation(line: 94, column: 27, scope: !326)
!357 = !DILocation(line: 94, column: 7, scope: !326)
!358 = !DILocation(line: 94, column: 2, scope: !326)
!359 = !DILocation(line: 95, column: 27, scope: !326)
!360 = !DILocation(line: 95, column: 7, scope: !326)
!361 = !DILocation(line: 95, column: 2, scope: !326)
!362 = !DILocation(line: 96, column: 27, scope: !326)
!363 = !DILocation(line: 96, column: 7, scope: !326)
!364 = !DILocation(line: 96, column: 2, scope: !326)
!365 = !DILocation(line: 97, column: 27, scope: !326)
!366 = !DILocation(line: 97, column: 7, scope: !326)
!367 = !DILocation(line: 97, column: 2, scope: !326)
!368 = !DILocation(line: 99, column: 2, scope: !326)
