; ModuleID = 'factors-of-an-integer-2.c'
source_filename = "factors-of-an-integer-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.prime_factor = type { i64, i64 }

@bits = common dso_local global [65536 x i8] zeroinitializer, align 16, !dbg !0
@primes = common dso_local global [7000 x i64] zeroinitializer, align 16, !dbg !11
@n_primes = common dso_local global i64 0, align 8, !dbg !16
@__const.main.nums = private unnamed_addr constant [4 x i64] [i64 3, i64 120, i64 1024, i64 3491888400], align 16
@.str = private unnamed_addr constant [5 x i8] c"%lu:\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c" %lu\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sieve() #0 !dbg !26 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %j, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 0), i8 1, i64 65536, i1 false), !dbg !34
  store i8 0, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 1), align 1, !dbg !35
  store i8 0, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 0), align 16, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 256, !dbg !42
  br i1 %cmp, label %for.body, label %for.end7, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %1 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom, !dbg !46
  %2 = load i8, i8* %arrayidx, align 1, !dbg !46
  %tobool = icmp ne i8 %2, 0, !dbg !46
  br i1 %tobool, label %if.then, label %if.end, !dbg !47, !cf.info !48

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !49
  %4 = load i32, i32* %i, align 4, !dbg !51
  %mul = mul nsw i32 %3, %4, !dbg !52
  store i32 %mul, i32* %j, align 4, !dbg !53
  br label %for.cond1, !dbg !54

for.cond1:                                        ; preds = %for.inc, %if.then
  %5 = load i32, i32* %j, align 4, !dbg !55
  %cmp2 = icmp slt i32 %5, 65536, !dbg !57
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !58

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %j, align 4, !dbg !59
  %idxprom4 = sext i32 %6 to i64, !dbg !60
  %arrayidx5 = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom4, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %i, align 4, !dbg !62
  %8 = load i32, i32* %j, align 4, !dbg !63
  %add = add nsw i32 %8, %7, !dbg !63
  store i32 %add, i32* %j, align 4, !dbg !63
  br label %for.cond1, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond1
  br label %if.end, !dbg !66

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc6, !dbg !67

for.inc6:                                         ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %9, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end7:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !72
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond8, !dbg !75

for.cond8:                                        ; preds = %for.inc19, %for.end7
  %10 = load i32, i32* %i, align 4, !dbg !76
  %cmp9 = icmp slt i32 %10, 65536, !dbg !78
  br i1 %cmp9, label %for.body10, label %for.end21, !dbg !79

for.body10:                                       ; preds = %for.cond8
  %11 = load i32, i32* %i, align 4, !dbg !80
  %idxprom11 = sext i32 %11 to i64, !dbg !82
  %arrayidx12 = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom11, !dbg !82
  %12 = load i8, i8* %arrayidx12, align 1, !dbg !82
  %tobool13 = icmp ne i8 %12, 0, !dbg !82
  br i1 %tobool13, label %if.then14, label %if.end18, !dbg !83, !cf.info !48

if.then14:                                        ; preds = %for.body10
  %13 = load i32, i32* %i, align 4, !dbg !84
  %conv = sext i32 %13 to i64, !dbg !84
  %14 = load i32, i32* %j, align 4, !dbg !85
  %inc15 = add nsw i32 %14, 1, !dbg !85
  store i32 %inc15, i32* %j, align 4, !dbg !85
  %idxprom16 = sext i32 %14 to i64, !dbg !86
  %arrayidx17 = getelementptr inbounds [7000 x i64], [7000 x i64]* @primes, i64 0, i64 %idxprom16, !dbg !86
  store i64 %conv, i64* %arrayidx17, align 8, !dbg !87
  br label %if.end18, !dbg !86

if.end18:                                         ; preds = %if.then14, %for.body10
  br label %for.inc19, !dbg !88

for.inc19:                                        ; preds = %if.end18
  %15 = load i32, i32* %i, align 4, !dbg !89
  %inc20 = add nsw i32 %15, 1, !dbg !89
  store i32 %inc20, i32* %i, align 4, !dbg !89
  br label %for.cond8, !dbg !90, !llvm.loop !91

for.end21:                                        ; preds = %for.cond8
  %16 = load i32, i32* %j, align 4, !dbg !93
  %conv22 = sext i32 %16 to i64, !dbg !93
  store i64 %conv22, i64* @n_primes, align 8, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_prime_factors(i64 %n, %struct.prime_factor* %lst) #0 !dbg !96 {
entry:
  %n.addr = alloca i64, align 8
  %lst.addr = alloca %struct.prime_factor*, align 8
  %i = alloca i64, align 8
  %e = alloca i64, align 8
  %p = alloca i64, align 8
  %len = alloca i32, align 4
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store %struct.prime_factor* %lst, %struct.prime_factor** %lst.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.prime_factor** %lst.addr, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %e, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %p, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %len, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %len, align 4, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i64, i64* %i, align 8, !dbg !120
  %1 = load i64, i64* @n_primes, align 8, !dbg !122
  %cmp = icmp ult i64 %0, %1, !dbg !123
  br i1 %cmp, label %for.body, label %for.end15, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [7000 x i64], [7000 x i64]* @primes, i64 0, i64 %2, !dbg !127
  %3 = load i64, i64* %arrayidx, align 8, !dbg !127
  store i64 %3, i64* %p, align 8, !dbg !128
  %4 = load i64, i64* %p, align 8, !dbg !129
  %5 = load i64, i64* %p, align 8, !dbg !131
  %mul = mul i64 %4, %5, !dbg !132
  %6 = load i64, i64* %n.addr, align 8, !dbg !133
  %cmp1 = icmp ugt i64 %mul, %6, !dbg !134
  br i1 %cmp1, label %if.then, label %if.end, !dbg !135, !cf.info !48

if.then:                                          ; preds = %for.body
  br label %for.end15, !dbg !136

if.end:                                           ; preds = %for.body
  store i64 0, i64* %e, align 8, !dbg !137
  br label %for.cond2, !dbg !139

for.cond2:                                        ; preds = %for.inc, %if.end
  %7 = load i64, i64* %n.addr, align 8, !dbg !140
  %8 = load i64, i64* %p, align 8, !dbg !142
  %rem = urem i64 %7, %8, !dbg !143
  %tobool = icmp ne i64 %rem, 0, !dbg !144
  %lnot = xor i1 %tobool, true, !dbg !144
  br i1 %lnot, label %for.body3, label %for.end, !dbg !145

for.body3:                                        ; preds = %for.cond2
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body3
  %9 = load i64, i64* %p, align 8, !dbg !146
  %10 = load i64, i64* %n.addr, align 8, !dbg !147
  %div = udiv i64 %10, %9, !dbg !147
  store i64 %div, i64* %n.addr, align 8, !dbg !147
  %11 = load i64, i64* %e, align 8, !dbg !148
  %inc = add i64 %11, 1, !dbg !148
  store i64 %inc, i64* %e, align 8, !dbg !148
  br label %for.cond2, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond2
  %12 = load i64, i64* %e, align 8, !dbg !152
  %tobool4 = icmp ne i64 %12, 0, !dbg !152
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !154, !cf.info !48

if.then5:                                         ; preds = %for.end
  %13 = load i64, i64* %p, align 8, !dbg !155
  %14 = load %struct.prime_factor*, %struct.prime_factor** %lst.addr, align 8, !dbg !157
  %15 = load i32, i32* %len, align 4, !dbg !158
  %idxprom = sext i32 %15 to i64, !dbg !157
  %arrayidx6 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %14, i64 %idxprom, !dbg !157
  %p7 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx6, i32 0, i32 0, !dbg !159
  store i64 %13, i64* %p7, align 8, !dbg !160
  %16 = load i64, i64* %e, align 8, !dbg !161
  %17 = load %struct.prime_factor*, %struct.prime_factor** %lst.addr, align 8, !dbg !162
  %18 = load i32, i32* %len, align 4, !dbg !163
  %inc8 = add nsw i32 %18, 1, !dbg !163
  store i32 %inc8, i32* %len, align 4, !dbg !163
  %idxprom9 = sext i32 %18 to i64, !dbg !162
  %arrayidx10 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %17, i64 %idxprom9, !dbg !162
  %e11 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx10, i32 0, i32 1, !dbg !164
  store i64 %16, i64* %e11, align 8, !dbg !165
  br label %if.end12, !dbg !166

if.end12:                                         ; preds = %if.then5, %for.end
  br label %for.inc13, !dbg !167

for.inc13:                                        ; preds = %if.end12
  %19 = load i64, i64* %i, align 8, !dbg !168
  %inc14 = add i64 %19, 1, !dbg !168
  store i64 %inc14, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end15:                                        ; preds = %if.then, %for.cond
  %20 = load i64, i64* %n.addr, align 8, !dbg !172
  %cmp16 = icmp eq i64 %20, 1, !dbg !173
  br i1 %cmp16, label %cond.true, label %cond.false, !dbg !172

cond.true:                                        ; preds = %for.end15
  %21 = load i32, i32* %len, align 4, !dbg !174
  br label %cond.end, !dbg !172

cond.false:                                       ; preds = %for.end15
  %22 = load i64, i64* %n.addr, align 8, !dbg !175
  %23 = load %struct.prime_factor*, %struct.prime_factor** %lst.addr, align 8, !dbg !176
  %24 = load i32, i32* %len, align 4, !dbg !177
  %idxprom17 = sext i32 %24 to i64, !dbg !176
  %arrayidx18 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %23, i64 %idxprom17, !dbg !176
  %p19 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx18, i32 0, i32 0, !dbg !178
  store i64 %22, i64* %p19, align 8, !dbg !179
  %25 = load %struct.prime_factor*, %struct.prime_factor** %lst.addr, align 8, !dbg !180
  %26 = load i32, i32* %len, align 4, !dbg !181
  %idxprom20 = sext i32 %26 to i64, !dbg !180
  %arrayidx21 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %25, i64 %idxprom20, !dbg !180
  %e22 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx21, i32 0, i32 1, !dbg !182
  store i64 1, i64* %e22, align 8, !dbg !183
  %27 = load i32, i32* %len, align 4, !dbg !184
  %inc23 = add nsw i32 %27, 1, !dbg !184
  store i32 %inc23, i32* %len, align 4, !dbg !184
  br label %cond.end, !dbg !172

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %21, %cond.true ], [ %inc23, %cond.false ], !dbg !172
  ret i32 %cond, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ulong_cmp(i8* %a, i8* %b) #0 !dbg !186 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !191, metadata !DIExpression()), !dbg !192
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !193, metadata !DIExpression()), !dbg !194
  %0 = load i8*, i8** %a.addr, align 8, !dbg !195
  %1 = bitcast i8* %0 to i64*, !dbg !196
  %2 = load i64, i64* %1, align 8, !dbg !197
  %3 = load i8*, i8** %b.addr, align 8, !dbg !198
  %4 = bitcast i8* %3 to i64*, !dbg !199
  %5 = load i64, i64* %4, align 8, !dbg !200
  %cmp = icmp ult i64 %2, %5, !dbg !201
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !197

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !197

cond.false:                                       ; preds = %entry
  %6 = load i8*, i8** %a.addr, align 8, !dbg !202
  %7 = bitcast i8* %6 to i64*, !dbg !203
  %8 = load i64, i64* %7, align 8, !dbg !204
  %9 = load i8*, i8** %b.addr, align 8, !dbg !205
  %10 = bitcast i8* %9 to i64*, !dbg !206
  %11 = load i64, i64* %10, align 8, !dbg !207
  %cmp1 = icmp ugt i64 %8, %11, !dbg !208
  %conv = zext i1 %cmp1 to i32, !dbg !208
  br label %cond.end, !dbg !197

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv, %cond.false ], !dbg !197
  ret i32 %cond, !dbg !209
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_factors(i64 %n, i64* %lst) #0 !dbg !210 {
entry:
  %n.addr = alloca i64, align 8
  %lst.addr = alloca i64*, align 8
  %n_f = alloca i32, align 4
  %len = alloca i32, align 4
  %len2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %p = alloca i32, align 4
  %f = alloca [100 x %struct.prime_factor], align 16
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !214, metadata !DIExpression()), !dbg !215
  store i64* %lst, i64** %lst.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %lst.addr, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %n_f, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i32* %len, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %len2, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata i32* %j, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata i32* %k, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i32* %p, metadata !230, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata [100 x %struct.prime_factor]* %f, metadata !232, metadata !DIExpression()), !dbg !236
  %0 = load i64, i64* %n.addr, align 8, !dbg !237
  %arraydecay = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 0, !dbg !238
  %call = call i32 @get_prime_factors(i64 %0, %struct.prime_factor* %arraydecay), !dbg !239
  store i32 %call, i32* %n_f, align 4, !dbg !240
  %1 = load i64*, i64** %lst.addr, align 8, !dbg !241
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !241
  store i64 1, i64* %arrayidx, align 8, !dbg !242
  store i32 1, i32* %len, align 4, !dbg !243
  store i32 1, i32* %len2, align 4, !dbg !244
  store i32 0, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !247

for.cond:                                         ; preds = %for.inc29, %entry
  %2 = load i32, i32* %i, align 4, !dbg !248
  %3 = load i32, i32* %n_f, align 4, !dbg !250
  %cmp = icmp slt i32 %2, %3, !dbg !251
  br i1 %cmp, label %for.body, label %for.end31, !dbg !252

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !253
  %4 = load i32, i32* %i, align 4, !dbg !255
  %idxprom = sext i32 %4 to i64, !dbg !256
  %arrayidx1 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom, !dbg !256
  %p2 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx1, i32 0, i32 0, !dbg !257
  %5 = load i64, i64* %p2, align 16, !dbg !257
  %conv = trunc i64 %5 to i32, !dbg !256
  store i32 %conv, i32* %p, align 4, !dbg !258
  br label %for.cond3, !dbg !259

for.cond3:                                        ; preds = %for.inc20, %for.body
  %6 = load i32, i32* %j, align 4, !dbg !260
  %conv4 = sext i32 %6 to i64, !dbg !260
  %7 = load i32, i32* %i, align 4, !dbg !262
  %idxprom5 = sext i32 %7 to i64, !dbg !263
  %arrayidx6 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom5, !dbg !263
  %e = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx6, i32 0, i32 1, !dbg !264
  %8 = load i64, i64* %e, align 8, !dbg !264
  %cmp7 = icmp ult i64 %conv4, %8, !dbg !265
  br i1 %cmp7, label %for.body9, label %for.end28, !dbg !266

for.body9:                                        ; preds = %for.cond3
  store i32 0, i32* %k, align 4, !dbg !267
  br label %for.cond10, !dbg !269

for.cond10:                                       ; preds = %for.inc, %for.body9
  %9 = load i32, i32* %k, align 4, !dbg !270
  %10 = load i32, i32* %len2, align 4, !dbg !272
  %cmp11 = icmp slt i32 %9, %10, !dbg !273
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !274

for.body13:                                       ; preds = %for.cond10
  %11 = load i64*, i64** %lst.addr, align 8, !dbg !275
  %12 = load i32, i32* %k, align 4, !dbg !276
  %idxprom14 = sext i32 %12 to i64, !dbg !275
  %arrayidx15 = getelementptr inbounds i64, i64* %11, i64 %idxprom14, !dbg !275
  %13 = load i64, i64* %arrayidx15, align 8, !dbg !275
  %14 = load i32, i32* %p, align 4, !dbg !277
  %conv16 = sext i32 %14 to i64, !dbg !277
  %mul = mul i64 %13, %conv16, !dbg !278
  %15 = load i64*, i64** %lst.addr, align 8, !dbg !279
  %16 = load i32, i32* %len, align 4, !dbg !280
  %inc = add nsw i32 %16, 1, !dbg !280
  store i32 %inc, i32* %len, align 4, !dbg !280
  %idxprom17 = sext i32 %16 to i64, !dbg !279
  %arrayidx18 = getelementptr inbounds i64, i64* %15, i64 %idxprom17, !dbg !279
  store i64 %mul, i64* %arrayidx18, align 8, !dbg !281
  br label %for.inc, !dbg !279

for.inc:                                          ; preds = %for.body13
  %17 = load i32, i32* %k, align 4, !dbg !282
  %inc19 = add nsw i32 %17, 1, !dbg !282
  store i32 %inc19, i32* %k, align 4, !dbg !282
  br label %for.cond10, !dbg !283, !llvm.loop !284

for.end:                                          ; preds = %for.cond10
  br label %for.inc20, !dbg !285

for.inc20:                                        ; preds = %for.end
  %18 = load i32, i32* %j, align 4, !dbg !286
  %inc21 = add nsw i32 %18, 1, !dbg !286
  store i32 %inc21, i32* %j, align 4, !dbg !286
  %19 = load i32, i32* %i, align 4, !dbg !287
  %idxprom22 = sext i32 %19 to i64, !dbg !288
  %arrayidx23 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom22, !dbg !288
  %p24 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx23, i32 0, i32 0, !dbg !289
  %20 = load i64, i64* %p24, align 16, !dbg !289
  %21 = load i32, i32* %p, align 4, !dbg !290
  %conv25 = sext i32 %21 to i64, !dbg !290
  %mul26 = mul i64 %conv25, %20, !dbg !290
  %conv27 = trunc i64 %mul26 to i32, !dbg !290
  store i32 %conv27, i32* %p, align 4, !dbg !290
  br label %for.cond3, !dbg !291, !llvm.loop !292

for.end28:                                        ; preds = %for.cond3
  br label %for.inc29, !dbg !293

for.inc29:                                        ; preds = %for.end28
  %22 = load i32, i32* %i, align 4, !dbg !294
  %inc30 = add nsw i32 %22, 1, !dbg !294
  store i32 %inc30, i32* %i, align 4, !dbg !294
  %23 = load i32, i32* %len, align 4, !dbg !295
  store i32 %23, i32* %len2, align 4, !dbg !296
  br label %for.cond, !dbg !297, !llvm.loop !298

for.end31:                                        ; preds = %for.cond
  %24 = load i64*, i64** %lst.addr, align 8, !dbg !300
  %25 = bitcast i64* %24 to i8*, !dbg !300
  %26 = load i32, i32* %len, align 4, !dbg !301
  %conv32 = sext i32 %26 to i64, !dbg !301
  call void @qsort(i8* %25, i64 %conv32, i64 8, i32 (i8*, i8*)* @ulong_cmp), !dbg !302
  %27 = load i32, i32* %len, align 4, !dbg !303
  ret i32 %27, !dbg !304
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !305 {
entry:
  %retval = alloca i32, align 4
  %fac = alloca [10000 x i64], align 16
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %nums = alloca [4 x i64], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10000 x i64]* %fac, metadata !308, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %len, metadata !313, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32* %i, metadata !315, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata i32* %j, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata [4 x i64]* %nums, metadata !319, metadata !DIExpression()), !dbg !323
  %0 = bitcast [4 x i64]* %nums to i8*, !dbg !323
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i64]* @__const.main.nums to i8*), i64 32, i1 false), !dbg !323
  call void @sieve(), !dbg !324
  store i32 0, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !327

for.cond:                                         ; preds = %for.inc11, %entry
  %1 = load i32, i32* %i, align 4, !dbg !328
  %cmp = icmp slt i32 %1, 4, !dbg !330
  br i1 %cmp, label %for.body, label %for.end13, !dbg !331

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !332
  %idxprom = sext i32 %2 to i64, !dbg !334
  %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* %nums, i64 0, i64 %idxprom, !dbg !334
  %3 = load i64, i64* %arrayidx, align 8, !dbg !334
  %arraydecay = getelementptr inbounds [10000 x i64], [10000 x i64]* %fac, i64 0, i64 0, !dbg !335
  %call = call i32 @get_factors(i64 %3, i64* %arraydecay), !dbg !336
  store i32 %call, i32* %len, align 4, !dbg !337
  %4 = load i32, i32* %i, align 4, !dbg !338
  %idxprom1 = sext i32 %4 to i64, !dbg !339
  %arrayidx2 = getelementptr inbounds [4 x i64], [4 x i64]* %nums, i64 0, i64 %idxprom1, !dbg !339
  %5 = load i64, i64* %arrayidx2, align 8, !dbg !339
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %5), !dbg !340
  store i32 0, i32* %j, align 4, !dbg !341
  br label %for.cond4, !dbg !343

for.cond4:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !dbg !344
  %7 = load i32, i32* %len, align 4, !dbg !346
  %cmp5 = icmp slt i32 %6, %7, !dbg !347
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !348

for.body6:                                        ; preds = %for.cond4
  %8 = load i32, i32* %j, align 4, !dbg !349
  %idxprom7 = sext i32 %8 to i64, !dbg !350
  %arrayidx8 = getelementptr inbounds [10000 x i64], [10000 x i64]* %fac, i64 0, i64 %idxprom7, !dbg !350
  %9 = load i64, i64* %arrayidx8, align 8, !dbg !350
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %9), !dbg !351
  br label %for.inc, !dbg !351

for.inc:                                          ; preds = %for.body6
  %10 = load i32, i32* %j, align 4, !dbg !352
  %inc = add nsw i32 %10, 1, !dbg !352
  store i32 %inc, i32* %j, align 4, !dbg !352
  br label %for.cond4, !dbg !353, !llvm.loop !354

for.end:                                          ; preds = %for.cond4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !356
  br label %for.inc11, !dbg !357

for.inc11:                                        ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !358
  %inc12 = add nsw i32 %11, 1, !dbg !358
  store i32 %inc12, i32* %i, align 4, !dbg !358
  br label %for.cond, !dbg !359, !llvm.loop !360

for.end13:                                        ; preds = %for.cond
  ret i32 0, !dbg !362
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bits", scope: !2, file: !3, line: 6, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "factors-of-an-integer-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Factors-of-an-integer")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "ulong", file: !3, line: 8, baseType: !9)
!9 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!10 = !{!0, !11, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "primes", scope: !2, file: !3, line: 9, type: !13, isLocal: false, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 448000, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 7000)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "n_primes", scope: !2, file: !3, line: 9, type: !8, isLocal: false, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 524288, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 65536)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!26 = distinct !DISubprogram(name: "sieve", scope: !3, file: !3, line: 13, type: !27, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "i", scope: !26, file: !3, line: 15, type: !30)
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 15, column: 6, scope: !26)
!32 = !DILocalVariable(name: "j", scope: !26, file: !3, line: 15, type: !30)
!33 = !DILocation(line: 15, column: 9, scope: !26)
!34 = !DILocation(line: 16, column: 2, scope: !26)
!35 = !DILocation(line: 17, column: 20, scope: !26)
!36 = !DILocation(line: 17, column: 10, scope: !26)
!37 = !DILocation(line: 18, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !26, file: !3, line: 18, column: 2)
!39 = !DILocation(line: 18, column: 7, scope: !38)
!40 = !DILocation(line: 18, column: 14, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 18, column: 2)
!42 = !DILocation(line: 18, column: 16, scope: !41)
!43 = !DILocation(line: 18, column: 2, scope: !38)
!44 = !DILocation(line: 19, column: 12, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !3, line: 19, column: 7)
!46 = !DILocation(line: 19, column: 7, scope: !45)
!47 = !DILocation(line: 19, column: 7, scope: !41)
!48 = !{!"if"}
!49 = !DILocation(line: 20, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !3, line: 20, column: 4)
!51 = !DILocation(line: 20, column: 17, scope: !50)
!52 = !DILocation(line: 20, column: 15, scope: !50)
!53 = !DILocation(line: 20, column: 11, scope: !50)
!54 = !DILocation(line: 20, column: 9, scope: !50)
!55 = !DILocation(line: 20, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !3, line: 20, column: 4)
!57 = !DILocation(line: 20, column: 22, scope: !56)
!58 = !DILocation(line: 20, column: 4, scope: !50)
!59 = !DILocation(line: 21, column: 10, scope: !56)
!60 = !DILocation(line: 21, column: 5, scope: !56)
!61 = !DILocation(line: 21, column: 13, scope: !56)
!62 = !DILocation(line: 20, column: 36, scope: !56)
!63 = !DILocation(line: 20, column: 33, scope: !56)
!64 = !DILocation(line: 20, column: 4, scope: !56)
!65 = distinct !{!65, !58, !66}
!66 = !DILocation(line: 21, column: 15, scope: !50)
!67 = !DILocation(line: 19, column: 13, scope: !45)
!68 = !DILocation(line: 18, column: 24, scope: !41)
!69 = !DILocation(line: 18, column: 2, scope: !41)
!70 = distinct !{!70, !43, !71}
!71 = !DILocation(line: 21, column: 15, scope: !38)
!72 = !DILocation(line: 24, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !26, file: !3, line: 24, column: 2)
!74 = !DILocation(line: 24, column: 9, scope: !73)
!75 = !DILocation(line: 24, column: 7, scope: !73)
!76 = !DILocation(line: 24, column: 18, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !3, line: 24, column: 2)
!78 = !DILocation(line: 24, column: 20, scope: !77)
!79 = !DILocation(line: 24, column: 2, scope: !73)
!80 = !DILocation(line: 25, column: 12, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 25, column: 7)
!82 = !DILocation(line: 25, column: 7, scope: !81)
!83 = !DILocation(line: 25, column: 7, scope: !77)
!84 = !DILocation(line: 25, column: 30, scope: !81)
!85 = !DILocation(line: 25, column: 24, scope: !81)
!86 = !DILocation(line: 25, column: 16, scope: !81)
!87 = !DILocation(line: 25, column: 28, scope: !81)
!88 = !DILocation(line: 25, column: 13, scope: !81)
!89 = !DILocation(line: 24, column: 30, scope: !77)
!90 = !DILocation(line: 24, column: 2, scope: !77)
!91 = distinct !{!91, !79, !92}
!92 = !DILocation(line: 25, column: 30, scope: !73)
!93 = !DILocation(line: 27, column: 13, scope: !26)
!94 = !DILocation(line: 27, column: 11, scope: !26)
!95 = !DILocation(line: 28, column: 1, scope: !26)
!96 = distinct !DISubprogram(name: "get_prime_factors", scope: !3, file: !3, line: 30, type: !97, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{!30, !8, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "prime_factor", file: !3, line: 11, baseType: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 11, size: 128, elements: !102)
!102 = !{!103, !104}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !101, file: !3, line: 11, baseType: !8, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !101, file: !3, line: 11, baseType: !8, size: 64, offset: 64)
!105 = !DILocalVariable(name: "n", arg: 1, scope: !96, file: !3, line: 30, type: !8)
!106 = !DILocation(line: 30, column: 29, scope: !96)
!107 = !DILocalVariable(name: "lst", arg: 2, scope: !96, file: !3, line: 30, type: !99)
!108 = !DILocation(line: 30, column: 46, scope: !96)
!109 = !DILocalVariable(name: "i", scope: !96, file: !3, line: 32, type: !8)
!110 = !DILocation(line: 32, column: 8, scope: !96)
!111 = !DILocalVariable(name: "e", scope: !96, file: !3, line: 32, type: !8)
!112 = !DILocation(line: 32, column: 11, scope: !96)
!113 = !DILocalVariable(name: "p", scope: !96, file: !3, line: 32, type: !8)
!114 = !DILocation(line: 32, column: 14, scope: !96)
!115 = !DILocalVariable(name: "len", scope: !96, file: !3, line: 33, type: !30)
!116 = !DILocation(line: 33, column: 6, scope: !96)
!117 = !DILocation(line: 35, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !96, file: !3, line: 35, column: 2)
!119 = !DILocation(line: 35, column: 7, scope: !118)
!120 = !DILocation(line: 35, column: 14, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 35, column: 2)
!122 = !DILocation(line: 35, column: 18, scope: !121)
!123 = !DILocation(line: 35, column: 16, scope: !121)
!124 = !DILocation(line: 35, column: 2, scope: !118)
!125 = !DILocation(line: 36, column: 14, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 35, column: 33)
!127 = !DILocation(line: 36, column: 7, scope: !126)
!128 = !DILocation(line: 36, column: 5, scope: !126)
!129 = !DILocation(line: 37, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 37, column: 7)
!131 = !DILocation(line: 37, column: 11, scope: !130)
!132 = !DILocation(line: 37, column: 9, scope: !130)
!133 = !DILocation(line: 37, column: 15, scope: !130)
!134 = !DILocation(line: 37, column: 13, scope: !130)
!135 = !DILocation(line: 37, column: 7, scope: !126)
!136 = !DILocation(line: 37, column: 18, scope: !130)
!137 = !DILocation(line: 38, column: 10, scope: !138)
!138 = distinct !DILexicalBlock(scope: !126, file: !3, line: 38, column: 3)
!139 = !DILocation(line: 38, column: 8, scope: !138)
!140 = !DILocation(line: 38, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !3, line: 38, column: 3)
!142 = !DILocation(line: 38, column: 21, scope: !141)
!143 = !DILocation(line: 38, column: 19, scope: !141)
!144 = !DILocation(line: 38, column: 15, scope: !141)
!145 = !DILocation(line: 38, column: 3, scope: !138)
!146 = !DILocation(line: 38, column: 30, scope: !141)
!147 = !DILocation(line: 38, column: 27, scope: !141)
!148 = !DILocation(line: 38, column: 34, scope: !141)
!149 = !DILocation(line: 38, column: 3, scope: !141)
!150 = distinct !{!150, !145, !151}
!151 = !DILocation(line: 38, column: 37, scope: !138)
!152 = !DILocation(line: 39, column: 7, scope: !153)
!153 = distinct !DILexicalBlock(scope: !126, file: !3, line: 39, column: 7)
!154 = !DILocation(line: 39, column: 7, scope: !126)
!155 = !DILocation(line: 40, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !3, line: 39, column: 10)
!157 = !DILocation(line: 40, column: 4, scope: !156)
!158 = !DILocation(line: 40, column: 8, scope: !156)
!159 = !DILocation(line: 40, column: 13, scope: !156)
!160 = !DILocation(line: 40, column: 15, scope: !156)
!161 = !DILocation(line: 41, column: 19, scope: !156)
!162 = !DILocation(line: 41, column: 4, scope: !156)
!163 = !DILocation(line: 41, column: 11, scope: !156)
!164 = !DILocation(line: 41, column: 15, scope: !156)
!165 = !DILocation(line: 41, column: 17, scope: !156)
!166 = !DILocation(line: 42, column: 3, scope: !156)
!167 = !DILocation(line: 43, column: 2, scope: !126)
!168 = !DILocation(line: 35, column: 29, scope: !121)
!169 = !DILocation(line: 35, column: 2, scope: !121)
!170 = distinct !{!170, !124, !171}
!171 = !DILocation(line: 43, column: 2, scope: !118)
!172 = !DILocation(line: 45, column: 9, scope: !96)
!173 = !DILocation(line: 45, column: 11, scope: !96)
!174 = !DILocation(line: 45, column: 18, scope: !96)
!175 = !DILocation(line: 45, column: 38, scope: !96)
!176 = !DILocation(line: 45, column: 25, scope: !96)
!177 = !DILocation(line: 45, column: 29, scope: !96)
!178 = !DILocation(line: 45, column: 34, scope: !96)
!179 = !DILocation(line: 45, column: 36, scope: !96)
!180 = !DILocation(line: 45, column: 41, scope: !96)
!181 = !DILocation(line: 45, column: 45, scope: !96)
!182 = !DILocation(line: 45, column: 50, scope: !96)
!183 = !DILocation(line: 45, column: 52, scope: !96)
!184 = !DILocation(line: 45, column: 57, scope: !96)
!185 = !DILocation(line: 45, column: 2, scope: !96)
!186 = distinct !DISubprogram(name: "ulong_cmp", scope: !3, file: !3, line: 48, type: !187, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!187 = !DISubroutineType(types: !188)
!188 = !{!30, !189, !189}
!189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64)
!190 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!191 = !DILocalVariable(name: "a", arg: 1, scope: !186, file: !3, line: 48, type: !189)
!192 = !DILocation(line: 48, column: 27, scope: !186)
!193 = !DILocalVariable(name: "b", arg: 2, scope: !186, file: !3, line: 48, type: !189)
!194 = !DILocation(line: 48, column: 42, scope: !186)
!195 = !DILocation(line: 50, column: 24, scope: !186)
!196 = !DILocation(line: 50, column: 10, scope: !186)
!197 = !DILocation(line: 50, column: 9, scope: !186)
!198 = !DILocation(line: 50, column: 43, scope: !186)
!199 = !DILocation(line: 50, column: 29, scope: !186)
!200 = !DILocation(line: 50, column: 28, scope: !186)
!201 = !DILocation(line: 50, column: 26, scope: !186)
!202 = !DILocation(line: 50, column: 67, scope: !186)
!203 = !DILocation(line: 50, column: 53, scope: !186)
!204 = !DILocation(line: 50, column: 52, scope: !186)
!205 = !DILocation(line: 50, column: 86, scope: !186)
!206 = !DILocation(line: 50, column: 72, scope: !186)
!207 = !DILocation(line: 50, column: 71, scope: !186)
!208 = !DILocation(line: 50, column: 69, scope: !186)
!209 = !DILocation(line: 50, column: 2, scope: !186)
!210 = distinct !DISubprogram(name: "get_factors", scope: !3, file: !3, line: 53, type: !211, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!211 = !DISubroutineType(types: !212)
!212 = !{!30, !8, !213}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!214 = !DILocalVariable(name: "n", arg: 1, scope: !210, file: !3, line: 53, type: !8)
!215 = !DILocation(line: 53, column: 23, scope: !210)
!216 = !DILocalVariable(name: "lst", arg: 2, scope: !210, file: !3, line: 53, type: !213)
!217 = !DILocation(line: 53, column: 33, scope: !210)
!218 = !DILocalVariable(name: "n_f", scope: !210, file: !3, line: 55, type: !30)
!219 = !DILocation(line: 55, column: 6, scope: !210)
!220 = !DILocalVariable(name: "len", scope: !210, file: !3, line: 55, type: !30)
!221 = !DILocation(line: 55, column: 11, scope: !210)
!222 = !DILocalVariable(name: "len2", scope: !210, file: !3, line: 55, type: !30)
!223 = !DILocation(line: 55, column: 16, scope: !210)
!224 = !DILocalVariable(name: "i", scope: !210, file: !3, line: 55, type: !30)
!225 = !DILocation(line: 55, column: 22, scope: !210)
!226 = !DILocalVariable(name: "j", scope: !210, file: !3, line: 55, type: !30)
!227 = !DILocation(line: 55, column: 25, scope: !210)
!228 = !DILocalVariable(name: "k", scope: !210, file: !3, line: 55, type: !30)
!229 = !DILocation(line: 55, column: 28, scope: !210)
!230 = !DILocalVariable(name: "p", scope: !210, file: !3, line: 55, type: !30)
!231 = !DILocation(line: 55, column: 31, scope: !210)
!232 = !DILocalVariable(name: "f", scope: !210, file: !3, line: 56, type: !233)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 12800, elements: !234)
!234 = !{!235}
!235 = !DISubrange(count: 100)
!236 = !DILocation(line: 56, column: 15, scope: !210)
!237 = !DILocation(line: 58, column: 26, scope: !210)
!238 = !DILocation(line: 58, column: 29, scope: !210)
!239 = !DILocation(line: 58, column: 8, scope: !210)
!240 = !DILocation(line: 58, column: 6, scope: !210)
!241 = !DILocation(line: 60, column: 15, scope: !210)
!242 = !DILocation(line: 60, column: 22, scope: !210)
!243 = !DILocation(line: 60, column: 13, scope: !210)
!244 = !DILocation(line: 60, column: 7, scope: !210)
!245 = !DILocation(line: 62, column: 9, scope: !246)
!246 = distinct !DILexicalBlock(scope: !210, file: !3, line: 62, column: 2)
!247 = !DILocation(line: 62, column: 7, scope: !246)
!248 = !DILocation(line: 62, column: 14, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !3, line: 62, column: 2)
!250 = !DILocation(line: 62, column: 18, scope: !249)
!251 = !DILocation(line: 62, column: 16, scope: !249)
!252 = !DILocation(line: 62, column: 2, scope: !246)
!253 = !DILocation(line: 63, column: 10, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !3, line: 63, column: 3)
!255 = !DILocation(line: 63, column: 21, scope: !254)
!256 = !DILocation(line: 63, column: 19, scope: !254)
!257 = !DILocation(line: 63, column: 24, scope: !254)
!258 = !DILocation(line: 63, column: 17, scope: !254)
!259 = !DILocation(line: 63, column: 8, scope: !254)
!260 = !DILocation(line: 63, column: 27, scope: !261)
!261 = distinct !DILexicalBlock(scope: !254, file: !3, line: 63, column: 3)
!262 = !DILocation(line: 63, column: 33, scope: !261)
!263 = !DILocation(line: 63, column: 31, scope: !261)
!264 = !DILocation(line: 63, column: 36, scope: !261)
!265 = !DILocation(line: 63, column: 29, scope: !261)
!266 = !DILocation(line: 63, column: 3, scope: !254)
!267 = !DILocation(line: 64, column: 11, scope: !268)
!268 = distinct !DILexicalBlock(scope: !261, file: !3, line: 64, column: 4)
!269 = !DILocation(line: 64, column: 9, scope: !268)
!270 = !DILocation(line: 64, column: 16, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !3, line: 64, column: 4)
!272 = !DILocation(line: 64, column: 20, scope: !271)
!273 = !DILocation(line: 64, column: 18, scope: !271)
!274 = !DILocation(line: 64, column: 4, scope: !268)
!275 = !DILocation(line: 65, column: 18, scope: !271)
!276 = !DILocation(line: 65, column: 22, scope: !271)
!277 = !DILocation(line: 65, column: 27, scope: !271)
!278 = !DILocation(line: 65, column: 25, scope: !271)
!279 = !DILocation(line: 65, column: 5, scope: !271)
!280 = !DILocation(line: 65, column: 12, scope: !271)
!281 = !DILocation(line: 65, column: 16, scope: !271)
!282 = !DILocation(line: 64, column: 27, scope: !271)
!283 = !DILocation(line: 64, column: 4, scope: !271)
!284 = distinct !{!284, !274, !285}
!285 = !DILocation(line: 65, column: 27, scope: !268)
!286 = !DILocation(line: 63, column: 40, scope: !261)
!287 = !DILocation(line: 63, column: 51, scope: !261)
!288 = !DILocation(line: 63, column: 49, scope: !261)
!289 = !DILocation(line: 63, column: 54, scope: !261)
!290 = !DILocation(line: 63, column: 46, scope: !261)
!291 = !DILocation(line: 63, column: 3, scope: !261)
!292 = distinct !{!292, !266, !293}
!293 = !DILocation(line: 65, column: 27, scope: !254)
!294 = !DILocation(line: 62, column: 24, scope: !249)
!295 = !DILocation(line: 62, column: 35, scope: !249)
!296 = !DILocation(line: 62, column: 33, scope: !249)
!297 = !DILocation(line: 62, column: 2, scope: !249)
!298 = distinct !{!298, !252, !299}
!299 = !DILocation(line: 65, column: 27, scope: !246)
!300 = !DILocation(line: 67, column: 8, scope: !210)
!301 = !DILocation(line: 67, column: 13, scope: !210)
!302 = !DILocation(line: 67, column: 2, scope: !210)
!303 = !DILocation(line: 68, column: 9, scope: !210)
!304 = !DILocation(line: 68, column: 2, scope: !210)
!305 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !306, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!306 = !DISubroutineType(types: !307)
!307 = !{!30}
!308 = !DILocalVariable(name: "fac", scope: !305, file: !3, line: 73, type: !309)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 640000, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 10000)
!312 = !DILocation(line: 73, column: 8, scope: !305)
!313 = !DILocalVariable(name: "len", scope: !305, file: !3, line: 74, type: !30)
!314 = !DILocation(line: 74, column: 6, scope: !305)
!315 = !DILocalVariable(name: "i", scope: !305, file: !3, line: 74, type: !30)
!316 = !DILocation(line: 74, column: 11, scope: !305)
!317 = !DILocalVariable(name: "j", scope: !305, file: !3, line: 74, type: !30)
!318 = !DILocation(line: 74, column: 14, scope: !305)
!319 = !DILocalVariable(name: "nums", scope: !305, file: !3, line: 75, type: !320)
!320 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 256, elements: !321)
!321 = !{!322}
!322 = !DISubrange(count: 4)
!323 = !DILocation(line: 75, column: 8, scope: !305)
!324 = !DILocation(line: 77, column: 2, scope: !305)
!325 = !DILocation(line: 79, column: 9, scope: !326)
!326 = distinct !DILexicalBlock(scope: !305, file: !3, line: 79, column: 2)
!327 = !DILocation(line: 79, column: 7, scope: !326)
!328 = !DILocation(line: 79, column: 14, scope: !329)
!329 = distinct !DILexicalBlock(scope: !326, file: !3, line: 79, column: 2)
!330 = !DILocation(line: 79, column: 16, scope: !329)
!331 = !DILocation(line: 79, column: 2, scope: !326)
!332 = !DILocation(line: 80, column: 26, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !3, line: 79, column: 26)
!334 = !DILocation(line: 80, column: 21, scope: !333)
!335 = !DILocation(line: 80, column: 30, scope: !333)
!336 = !DILocation(line: 80, column: 9, scope: !333)
!337 = !DILocation(line: 80, column: 7, scope: !333)
!338 = !DILocation(line: 81, column: 23, scope: !333)
!339 = !DILocation(line: 81, column: 18, scope: !333)
!340 = !DILocation(line: 81, column: 3, scope: !333)
!341 = !DILocation(line: 82, column: 10, scope: !342)
!342 = distinct !DILexicalBlock(scope: !333, file: !3, line: 82, column: 3)
!343 = !DILocation(line: 82, column: 8, scope: !342)
!344 = !DILocation(line: 82, column: 15, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !3, line: 82, column: 3)
!346 = !DILocation(line: 82, column: 19, scope: !345)
!347 = !DILocation(line: 82, column: 17, scope: !345)
!348 = !DILocation(line: 82, column: 3, scope: !342)
!349 = !DILocation(line: 83, column: 23, scope: !345)
!350 = !DILocation(line: 83, column: 19, scope: !345)
!351 = !DILocation(line: 83, column: 4, scope: !345)
!352 = !DILocation(line: 82, column: 25, scope: !345)
!353 = !DILocation(line: 82, column: 3, scope: !345)
!354 = distinct !{!354, !348, !355}
!355 = !DILocation(line: 83, column: 25, scope: !342)
!356 = !DILocation(line: 84, column: 3, scope: !333)
!357 = !DILocation(line: 85, column: 2, scope: !333)
!358 = !DILocation(line: 79, column: 22, scope: !329)
!359 = !DILocation(line: 79, column: 2, scope: !329)
!360 = distinct !{!360, !331, !361}
!361 = !DILocation(line: 85, column: 2, scope: !326)
!362 = !DILocation(line: 87, column: 2, scope: !305)
