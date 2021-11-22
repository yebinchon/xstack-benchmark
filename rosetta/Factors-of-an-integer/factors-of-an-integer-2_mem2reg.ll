; ModuleID = 'factors-of-an-integer-2.ll'
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
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 0), i8 1, i64 65536, i1 false), !dbg !29
  store i8 0, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 1), align 1, !dbg !30
  store i8 0, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @bits, i64 0, i64 0), align 16, !dbg !31
  call void @llvm.dbg.value(metadata i32 0, metadata !32, metadata !DIExpression()), !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc6, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc6 ], !dbg !37
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !32, metadata !DIExpression()), !dbg !34
  %cmp = icmp slt i32 %i.0, 256, !dbg !38
  br i1 %cmp, label %for.body, label %for.end7, !dbg !40

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom, !dbg !41
  %0 = load i8, i8* %arrayidx, align 1, !dbg !41
  %tobool = icmp ne i8 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.end, !dbg !43, !cf.info !44

if.then:                                          ; preds = %for.body
  %mul = mul nsw i32 %i.0, %i.0, !dbg !45
  call void @llvm.dbg.value(metadata i32 %mul, metadata !47, metadata !DIExpression()), !dbg !34
  br label %for.cond1, !dbg !48

for.cond1:                                        ; preds = %for.inc, %if.then
  %j.0 = phi i32 [ %mul, %if.then ], [ %add, %for.inc ], !dbg !49
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !47, metadata !DIExpression()), !dbg !34
  %cmp2 = icmp slt i32 %j.0, 65536, !dbg !50
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !52

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %j.0 to i64, !dbg !53
  %arrayidx5 = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom4, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body3
  %add = add nsw i32 %j.0, %i.0, !dbg !55
  call void @llvm.dbg.value(metadata i32 %add, metadata !47, metadata !DIExpression()), !dbg !34
  br label %for.cond1, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond1
  br label %if.end, !dbg !58

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc6, !dbg !59

for.inc6:                                         ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !60
  call void @llvm.dbg.value(metadata i32 %inc, metadata !32, metadata !DIExpression()), !dbg !34
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end7:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !47, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32 0, metadata !32, metadata !DIExpression()), !dbg !34
  br label %for.cond8, !dbg !64

for.cond8:                                        ; preds = %for.inc19, %for.end7
  %j.1 = phi i32 [ 0, %for.end7 ], [ %j.2, %for.inc19 ], !dbg !66
  %i.1 = phi i32 [ 0, %for.end7 ], [ %inc20, %for.inc19 ], !dbg !66
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !47, metadata !DIExpression()), !dbg !34
  %cmp9 = icmp slt i32 %i.1, 65536, !dbg !67
  br i1 %cmp9, label %for.body10, label %for.end21, !dbg !69

for.body10:                                       ; preds = %for.cond8
  %idxprom11 = sext i32 %i.1 to i64, !dbg !70
  %arrayidx12 = getelementptr inbounds [65536 x i8], [65536 x i8]* @bits, i64 0, i64 %idxprom11, !dbg !70
  %1 = load i8, i8* %arrayidx12, align 1, !dbg !70
  %tobool13 = icmp ne i8 %1, 0, !dbg !70
  br i1 %tobool13, label %if.then14, label %if.end18, !dbg !72, !cf.info !44

if.then14:                                        ; preds = %for.body10
  %conv = sext i32 %i.1 to i64, !dbg !73
  %inc15 = add nsw i32 %j.1, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !47, metadata !DIExpression()), !dbg !34
  %idxprom16 = sext i32 %j.1 to i64, !dbg !75
  %arrayidx17 = getelementptr inbounds [7000 x i64], [7000 x i64]* @primes, i64 0, i64 %idxprom16, !dbg !75
  store i64 %conv, i64* %arrayidx17, align 8, !dbg !76
  br label %if.end18, !dbg !75

if.end18:                                         ; preds = %if.then14, %for.body10
  %j.2 = phi i32 [ %inc15, %if.then14 ], [ %j.1, %for.body10 ], !dbg !66
  call void @llvm.dbg.value(metadata i32 %j.2, metadata !47, metadata !DIExpression()), !dbg !34
  br label %for.inc19, !dbg !77

for.inc19:                                        ; preds = %if.end18
  %inc20 = add nsw i32 %i.1, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !32, metadata !DIExpression()), !dbg !34
  br label %for.cond8, !dbg !79, !llvm.loop !80

for.end21:                                        ; preds = %for.cond8
  %conv22 = sext i32 %j.1 to i64, !dbg !82
  store i64 %conv22, i64* @n_primes, align 8, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_prime_factors(i64 %n, %struct.prime_factor* %lst) #0 !dbg !85 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata %struct.prime_factor* %lst, metadata !96, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i32 0, metadata !97, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i64 0, metadata !98, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc13, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc14, %for.inc13 ], !dbg !101
  %len.0 = phi i32 [ 0, %entry ], [ %len.1, %for.inc13 ], !dbg !95
  %n.addr.0 = phi i64 [ %n, %entry ], [ %n.addr.1, %for.inc13 ]
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !97, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !98, metadata !DIExpression()), !dbg !95
  %0 = load i64, i64* @n_primes, align 8, !dbg !102
  %cmp = icmp ult i64 %i.0, %0, !dbg !104
  br i1 %cmp, label %for.body, label %for.end15, !dbg !105

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [7000 x i64], [7000 x i64]* @primes, i64 0, i64 %i.0, !dbg !106
  %1 = load i64, i64* %arrayidx, align 8, !dbg !106
  call void @llvm.dbg.value(metadata i64 %1, metadata !108, metadata !DIExpression()), !dbg !95
  %mul = mul i64 %1, %1, !dbg !109
  %cmp1 = icmp ugt i64 %mul, %n.addr.0, !dbg !111
  br i1 %cmp1, label %if.then, label %if.end, !dbg !112, !cf.info !44

if.then:                                          ; preds = %for.body
  br label %for.end15, !dbg !113

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.value(metadata i64 0, metadata !114, metadata !DIExpression()), !dbg !95
  br label %for.cond2, !dbg !115

for.cond2:                                        ; preds = %for.inc, %if.end
  %e.0 = phi i64 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !117
  %n.addr.1 = phi i64 [ %n.addr.0, %if.end ], [ %div, %for.inc ]
  call void @llvm.dbg.value(metadata i64 %n.addr.1, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i64 %e.0, metadata !114, metadata !DIExpression()), !dbg !95
  %rem = urem i64 %n.addr.1, %1, !dbg !118
  %tobool = icmp ne i64 %rem, 0, !dbg !120
  %lnot = xor i1 %tobool, true, !dbg !120
  br i1 %lnot, label %for.body3, label %for.end, !dbg !121

for.body3:                                        ; preds = %for.cond2
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body3
  %div = udiv i64 %n.addr.1, %1, !dbg !122
  call void @llvm.dbg.value(metadata i64 %div, metadata !94, metadata !DIExpression()), !dbg !95
  %inc = add i64 %e.0, 1, !dbg !123
  call void @llvm.dbg.value(metadata i64 %inc, metadata !114, metadata !DIExpression()), !dbg !95
  br label %for.cond2, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond2
  %tobool4 = icmp ne i64 %e.0, 0, !dbg !127
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !129, !cf.info !44

if.then5:                                         ; preds = %for.end
  %idxprom = sext i32 %len.0 to i64, !dbg !130
  %arrayidx6 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %lst, i64 %idxprom, !dbg !130
  %p7 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx6, i32 0, i32 0, !dbg !132
  store i64 %1, i64* %p7, align 8, !dbg !133
  %inc8 = add nsw i32 %len.0, 1, !dbg !134
  call void @llvm.dbg.value(metadata i32 %inc8, metadata !97, metadata !DIExpression()), !dbg !95
  %idxprom9 = sext i32 %len.0 to i64, !dbg !135
  %arrayidx10 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %lst, i64 %idxprom9, !dbg !135
  %e11 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx10, i32 0, i32 1, !dbg !136
  store i64 %e.0, i64* %e11, align 8, !dbg !137
  br label %if.end12, !dbg !138

if.end12:                                         ; preds = %if.then5, %for.end
  %len.1 = phi i32 [ %inc8, %if.then5 ], [ %len.0, %for.end ], !dbg !95
  call void @llvm.dbg.value(metadata i32 %len.1, metadata !97, metadata !DIExpression()), !dbg !95
  br label %for.inc13, !dbg !139

for.inc13:                                        ; preds = %if.end12
  %inc14 = add i64 %i.0, 1, !dbg !140
  call void @llvm.dbg.value(metadata i64 %inc14, metadata !98, metadata !DIExpression()), !dbg !95
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end15:                                        ; preds = %if.then, %for.cond
  %cmp16 = icmp eq i64 %n.addr.0, 1, !dbg !144
  br i1 %cmp16, label %cond.true, label %cond.false, !dbg !145

cond.true:                                        ; preds = %for.end15
  br label %cond.end, !dbg !145

cond.false:                                       ; preds = %for.end15
  %idxprom17 = sext i32 %len.0 to i64, !dbg !146
  %arrayidx18 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %lst, i64 %idxprom17, !dbg !146
  %p19 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx18, i32 0, i32 0, !dbg !147
  store i64 %n.addr.0, i64* %p19, align 8, !dbg !148
  %idxprom20 = sext i32 %len.0 to i64, !dbg !149
  %arrayidx21 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %lst, i64 %idxprom20, !dbg !149
  %e22 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx21, i32 0, i32 1, !dbg !150
  store i64 1, i64* %e22, align 8, !dbg !151
  %inc23 = add nsw i32 %len.0, 1, !dbg !152
  call void @llvm.dbg.value(metadata i32 %inc23, metadata !97, metadata !DIExpression()), !dbg !95
  br label %cond.end, !dbg !145

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %len.0, %cond.true ], [ %inc23, %cond.false ], !dbg !145
  ret i32 %cond, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ulong_cmp(i8* %a, i8* %b) #0 !dbg !154 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i8* %b, metadata !161, metadata !DIExpression()), !dbg !160
  %0 = bitcast i8* %a to i64*, !dbg !162
  %1 = load i64, i64* %0, align 8, !dbg !163
  %2 = bitcast i8* %b to i64*, !dbg !164
  %3 = load i64, i64* %2, align 8, !dbg !165
  %cmp = icmp ult i64 %1, %3, !dbg !166
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !163

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !163

cond.false:                                       ; preds = %entry
  %4 = bitcast i8* %a to i64*, !dbg !167
  %5 = load i64, i64* %4, align 8, !dbg !168
  %6 = bitcast i8* %b to i64*, !dbg !169
  %7 = load i64, i64* %6, align 8, !dbg !170
  %cmp1 = icmp ugt i64 %5, %7, !dbg !171
  %conv = zext i1 %cmp1 to i32, !dbg !171
  br label %cond.end, !dbg !163

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv, %cond.false ], !dbg !163
  ret i32 %cond, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_factors(i64 %n, i64* %lst) #0 !dbg !173 {
entry:
  %f = alloca [100 x %struct.prime_factor], align 16
  call void @llvm.dbg.value(metadata i64 %n, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i64* %lst, metadata !179, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [100 x %struct.prime_factor]* %f, metadata !180, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 0, !dbg !185
  %call = call i32 @get_prime_factors(i64 %n, %struct.prime_factor* %arraydecay), !dbg !186
  call void @llvm.dbg.value(metadata i32 %call, metadata !187, metadata !DIExpression()), !dbg !178
  %arrayidx = getelementptr inbounds i64, i64* %lst, i64 0, !dbg !188
  store i64 1, i64* %arrayidx, align 8, !dbg !189
  call void @llvm.dbg.value(metadata i32 1, metadata !190, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 1, metadata !191, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 0, metadata !192, metadata !DIExpression()), !dbg !178
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc29, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc30, %for.inc29 ], !dbg !195
  %len2.0 = phi i32 [ 1, %entry ], [ %len.1, %for.inc29 ], !dbg !178
  %len.0 = phi i32 [ 1, %entry ], [ %len.1, %for.inc29 ], !dbg !196
  call void @llvm.dbg.value(metadata i32 %len.0, metadata !190, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %len2.0, metadata !191, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !192, metadata !DIExpression()), !dbg !178
  %cmp = icmp slt i32 %i.0, %call, !dbg !197
  br i1 %cmp, label %for.body, label %for.end31, !dbg !199

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !200, metadata !DIExpression()), !dbg !178
  %idxprom = sext i32 %i.0 to i64, !dbg !201
  %arrayidx1 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom, !dbg !201
  %p2 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx1, i32 0, i32 0, !dbg !203
  %0 = load i64, i64* %p2, align 16, !dbg !203
  %conv = trunc i64 %0 to i32, !dbg !201
  call void @llvm.dbg.value(metadata i32 %conv, metadata !204, metadata !DIExpression()), !dbg !178
  br label %for.cond3, !dbg !205

for.cond3:                                        ; preds = %for.inc20, %for.body
  %len.1 = phi i32 [ %len.0, %for.body ], [ %len.2, %for.inc20 ], !dbg !196
  %j.0 = phi i32 [ 0, %for.body ], [ %inc21, %for.inc20 ], !dbg !206
  %p.0 = phi i32 [ %conv, %for.body ], [ %conv27, %for.inc20 ], !dbg !206
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !204, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !200, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %len.1, metadata !190, metadata !DIExpression()), !dbg !178
  %conv4 = sext i32 %j.0 to i64, !dbg !207
  %idxprom5 = sext i32 %i.0 to i64, !dbg !209
  %arrayidx6 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom5, !dbg !209
  %e = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx6, i32 0, i32 1, !dbg !210
  %1 = load i64, i64* %e, align 8, !dbg !210
  %cmp7 = icmp ult i64 %conv4, %1, !dbg !211
  br i1 %cmp7, label %for.body9, label %for.end28, !dbg !212

for.body9:                                        ; preds = %for.cond3
  call void @llvm.dbg.value(metadata i32 0, metadata !213, metadata !DIExpression()), !dbg !178
  br label %for.cond10, !dbg !214

for.cond10:                                       ; preds = %for.inc, %for.body9
  %len.2 = phi i32 [ %len.1, %for.body9 ], [ %inc, %for.inc ], !dbg !178
  %k.0 = phi i32 [ 0, %for.body9 ], [ %inc19, %for.inc ], !dbg !216
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !213, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %len.2, metadata !190, metadata !DIExpression()), !dbg !178
  %cmp11 = icmp slt i32 %k.0, %len2.0, !dbg !217
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !219

for.body13:                                       ; preds = %for.cond10
  %idxprom14 = sext i32 %k.0 to i64, !dbg !220
  %arrayidx15 = getelementptr inbounds i64, i64* %lst, i64 %idxprom14, !dbg !220
  %2 = load i64, i64* %arrayidx15, align 8, !dbg !220
  %conv16 = sext i32 %p.0 to i64, !dbg !221
  %mul = mul i64 %2, %conv16, !dbg !222
  %inc = add nsw i32 %len.2, 1, !dbg !223
  call void @llvm.dbg.value(metadata i32 %inc, metadata !190, metadata !DIExpression()), !dbg !178
  %idxprom17 = sext i32 %len.2 to i64, !dbg !224
  %arrayidx18 = getelementptr inbounds i64, i64* %lst, i64 %idxprom17, !dbg !224
  store i64 %mul, i64* %arrayidx18, align 8, !dbg !225
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body13
  %inc19 = add nsw i32 %k.0, 1, !dbg !226
  call void @llvm.dbg.value(metadata i32 %inc19, metadata !213, metadata !DIExpression()), !dbg !178
  br label %for.cond10, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond10
  br label %for.inc20, !dbg !229

for.inc20:                                        ; preds = %for.end
  %inc21 = add nsw i32 %j.0, 1, !dbg !230
  call void @llvm.dbg.value(metadata i32 %inc21, metadata !200, metadata !DIExpression()), !dbg !178
  %idxprom22 = sext i32 %i.0 to i64, !dbg !231
  %arrayidx23 = getelementptr inbounds [100 x %struct.prime_factor], [100 x %struct.prime_factor]* %f, i64 0, i64 %idxprom22, !dbg !231
  %p24 = getelementptr inbounds %struct.prime_factor, %struct.prime_factor* %arrayidx23, i32 0, i32 0, !dbg !232
  %3 = load i64, i64* %p24, align 16, !dbg !232
  %conv25 = sext i32 %p.0 to i64, !dbg !233
  %mul26 = mul i64 %conv25, %3, !dbg !233
  %conv27 = trunc i64 %mul26 to i32, !dbg !233
  call void @llvm.dbg.value(metadata i32 %conv27, metadata !204, metadata !DIExpression()), !dbg !178
  br label %for.cond3, !dbg !234, !llvm.loop !235

for.end28:                                        ; preds = %for.cond3
  br label %for.inc29, !dbg !236

for.inc29:                                        ; preds = %for.end28
  %inc30 = add nsw i32 %i.0, 1, !dbg !237
  call void @llvm.dbg.value(metadata i32 %inc30, metadata !192, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %len.1, metadata !191, metadata !DIExpression()), !dbg !178
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end31:                                        ; preds = %for.cond
  %4 = bitcast i64* %lst to i8*, !dbg !241
  %conv32 = sext i32 %len.0 to i64, !dbg !242
  call void @qsort(i8* %4, i64 %conv32, i64 8, i32 (i8*, i8*)* @ulong_cmp), !dbg !243
  ret i32 %len.0, !dbg !244
}

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !245 {
entry:
  %fac = alloca [10000 x i64], align 16
  %nums = alloca [4 x i64], align 16
  call void @llvm.dbg.declare(metadata [10000 x i64]* %fac, metadata !248, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata [4 x i64]* %nums, metadata !253, metadata !DIExpression()), !dbg !257
  %0 = bitcast [4 x i64]* %nums to i8*, !dbg !257
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i64]* @__const.main.nums to i8*), i64 32, i1 false), !dbg !257
  call void @sieve(), !dbg !258
  call void @llvm.dbg.value(metadata i32 0, metadata !259, metadata !DIExpression()), !dbg !260
  br label %for.cond, !dbg !261

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !263
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !259, metadata !DIExpression()), !dbg !260
  %cmp = icmp slt i32 %i.0, 4, !dbg !264
  br i1 %cmp, label %for.body, label %for.end13, !dbg !266

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !267
  %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* %nums, i64 0, i64 %idxprom, !dbg !267
  %1 = load i64, i64* %arrayidx, align 8, !dbg !267
  %arraydecay = getelementptr inbounds [10000 x i64], [10000 x i64]* %fac, i64 0, i64 0, !dbg !269
  %call = call i32 @get_factors(i64 %1, i64* %arraydecay), !dbg !270
  call void @llvm.dbg.value(metadata i32 %call, metadata !271, metadata !DIExpression()), !dbg !260
  %idxprom1 = sext i32 %i.0 to i64, !dbg !272
  %arrayidx2 = getelementptr inbounds [4 x i64], [4 x i64]* %nums, i64 0, i64 %idxprom1, !dbg !272
  %2 = load i64, i64* %arrayidx2, align 8, !dbg !272
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !273
  call void @llvm.dbg.value(metadata i32 0, metadata !274, metadata !DIExpression()), !dbg !260
  br label %for.cond4, !dbg !275

for.cond4:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !277
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !274, metadata !DIExpression()), !dbg !260
  %cmp5 = icmp slt i32 %j.0, %call, !dbg !278
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !280

for.body6:                                        ; preds = %for.cond4
  %idxprom7 = sext i32 %j.0 to i64, !dbg !281
  %arrayidx8 = getelementptr inbounds [10000 x i64], [10000 x i64]* %fac, i64 0, i64 %idxprom7, !dbg !281
  %3 = load i64, i64* %arrayidx8, align 8, !dbg !281
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %3), !dbg !282
  br label %for.inc, !dbg !282

for.inc:                                          ; preds = %for.body6
  %inc = add nsw i32 %j.0, 1, !dbg !283
  call void @llvm.dbg.value(metadata i32 %inc, metadata !274, metadata !DIExpression()), !dbg !260
  br label %for.cond4, !dbg !284, !llvm.loop !285

for.end:                                          ; preds = %for.cond4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !287
  br label %for.inc11, !dbg !288

for.inc11:                                        ; preds = %for.end
  %inc12 = add nsw i32 %i.0, 1, !dbg !289
  call void @llvm.dbg.value(metadata i32 %inc12, metadata !259, metadata !DIExpression()), !dbg !260
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end13:                                        ; preds = %for.cond
  ret i32 0, !dbg !293
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!29 = !DILocation(line: 16, column: 2, scope: !26)
!30 = !DILocation(line: 17, column: 20, scope: !26)
!31 = !DILocation(line: 17, column: 10, scope: !26)
!32 = !DILocalVariable(name: "i", scope: !26, file: !3, line: 15, type: !33)
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DILocation(line: 0, scope: !26)
!35 = !DILocation(line: 18, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !3, line: 18, column: 2)
!37 = !DILocation(line: 0, scope: !36)
!38 = !DILocation(line: 18, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !3, line: 18, column: 2)
!40 = !DILocation(line: 18, column: 2, scope: !36)
!41 = !DILocation(line: 19, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 19, column: 7)
!43 = !DILocation(line: 19, column: 7, scope: !39)
!44 = !{!"if"}
!45 = !DILocation(line: 20, column: 15, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 20, column: 4)
!47 = !DILocalVariable(name: "j", scope: !26, file: !3, line: 15, type: !33)
!48 = !DILocation(line: 20, column: 9, scope: !46)
!49 = !DILocation(line: 0, scope: !46)
!50 = !DILocation(line: 20, column: 22, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !3, line: 20, column: 4)
!52 = !DILocation(line: 20, column: 4, scope: !46)
!53 = !DILocation(line: 21, column: 5, scope: !51)
!54 = !DILocation(line: 21, column: 13, scope: !51)
!55 = !DILocation(line: 20, column: 33, scope: !51)
!56 = !DILocation(line: 20, column: 4, scope: !51)
!57 = distinct !{!57, !52, !58}
!58 = !DILocation(line: 21, column: 15, scope: !46)
!59 = !DILocation(line: 19, column: 13, scope: !42)
!60 = !DILocation(line: 18, column: 24, scope: !39)
!61 = !DILocation(line: 18, column: 2, scope: !39)
!62 = distinct !{!62, !40, !63}
!63 = !DILocation(line: 21, column: 15, scope: !36)
!64 = !DILocation(line: 24, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !26, file: !3, line: 24, column: 2)
!66 = !DILocation(line: 0, scope: !65)
!67 = !DILocation(line: 24, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !3, line: 24, column: 2)
!69 = !DILocation(line: 24, column: 2, scope: !65)
!70 = !DILocation(line: 25, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !3, line: 25, column: 7)
!72 = !DILocation(line: 25, column: 7, scope: !68)
!73 = !DILocation(line: 25, column: 30, scope: !71)
!74 = !DILocation(line: 25, column: 24, scope: !71)
!75 = !DILocation(line: 25, column: 16, scope: !71)
!76 = !DILocation(line: 25, column: 28, scope: !71)
!77 = !DILocation(line: 25, column: 13, scope: !71)
!78 = !DILocation(line: 24, column: 30, scope: !68)
!79 = !DILocation(line: 24, column: 2, scope: !68)
!80 = distinct !{!80, !69, !81}
!81 = !DILocation(line: 25, column: 30, scope: !65)
!82 = !DILocation(line: 27, column: 13, scope: !26)
!83 = !DILocation(line: 27, column: 11, scope: !26)
!84 = !DILocation(line: 28, column: 1, scope: !26)
!85 = distinct !DISubprogram(name: "get_prime_factors", scope: !3, file: !3, line: 30, type: !86, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!33, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "prime_factor", file: !3, line: 11, baseType: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 11, size: 128, elements: !91)
!91 = !{!92, !93}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !90, file: !3, line: 11, baseType: !8, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !90, file: !3, line: 11, baseType: !8, size: 64, offset: 64)
!94 = !DILocalVariable(name: "n", arg: 1, scope: !85, file: !3, line: 30, type: !8)
!95 = !DILocation(line: 0, scope: !85)
!96 = !DILocalVariable(name: "lst", arg: 2, scope: !85, file: !3, line: 30, type: !88)
!97 = !DILocalVariable(name: "len", scope: !85, file: !3, line: 33, type: !33)
!98 = !DILocalVariable(name: "i", scope: !85, file: !3, line: 32, type: !8)
!99 = !DILocation(line: 35, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !85, file: !3, line: 35, column: 2)
!101 = !DILocation(line: 0, scope: !100)
!102 = !DILocation(line: 35, column: 18, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 35, column: 2)
!104 = !DILocation(line: 35, column: 16, scope: !103)
!105 = !DILocation(line: 35, column: 2, scope: !100)
!106 = !DILocation(line: 36, column: 7, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !3, line: 35, column: 33)
!108 = !DILocalVariable(name: "p", scope: !85, file: !3, line: 32, type: !8)
!109 = !DILocation(line: 37, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 37, column: 7)
!111 = !DILocation(line: 37, column: 13, scope: !110)
!112 = !DILocation(line: 37, column: 7, scope: !107)
!113 = !DILocation(line: 37, column: 18, scope: !110)
!114 = !DILocalVariable(name: "e", scope: !85, file: !3, line: 32, type: !8)
!115 = !DILocation(line: 38, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !3, line: 38, column: 3)
!117 = !DILocation(line: 0, scope: !116)
!118 = !DILocation(line: 38, column: 19, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !3, line: 38, column: 3)
!120 = !DILocation(line: 38, column: 15, scope: !119)
!121 = !DILocation(line: 38, column: 3, scope: !116)
!122 = !DILocation(line: 38, column: 27, scope: !119)
!123 = !DILocation(line: 38, column: 34, scope: !119)
!124 = !DILocation(line: 38, column: 3, scope: !119)
!125 = distinct !{!125, !121, !126}
!126 = !DILocation(line: 38, column: 37, scope: !116)
!127 = !DILocation(line: 39, column: 7, scope: !128)
!128 = distinct !DILexicalBlock(scope: !107, file: !3, line: 39, column: 7)
!129 = !DILocation(line: 39, column: 7, scope: !107)
!130 = !DILocation(line: 40, column: 4, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !3, line: 39, column: 10)
!132 = !DILocation(line: 40, column: 13, scope: !131)
!133 = !DILocation(line: 40, column: 15, scope: !131)
!134 = !DILocation(line: 41, column: 11, scope: !131)
!135 = !DILocation(line: 41, column: 4, scope: !131)
!136 = !DILocation(line: 41, column: 15, scope: !131)
!137 = !DILocation(line: 41, column: 17, scope: !131)
!138 = !DILocation(line: 42, column: 3, scope: !131)
!139 = !DILocation(line: 43, column: 2, scope: !107)
!140 = !DILocation(line: 35, column: 29, scope: !103)
!141 = !DILocation(line: 35, column: 2, scope: !103)
!142 = distinct !{!142, !105, !143}
!143 = !DILocation(line: 43, column: 2, scope: !100)
!144 = !DILocation(line: 45, column: 11, scope: !85)
!145 = !DILocation(line: 45, column: 9, scope: !85)
!146 = !DILocation(line: 45, column: 25, scope: !85)
!147 = !DILocation(line: 45, column: 34, scope: !85)
!148 = !DILocation(line: 45, column: 36, scope: !85)
!149 = !DILocation(line: 45, column: 41, scope: !85)
!150 = !DILocation(line: 45, column: 50, scope: !85)
!151 = !DILocation(line: 45, column: 52, scope: !85)
!152 = !DILocation(line: 45, column: 57, scope: !85)
!153 = !DILocation(line: 45, column: 2, scope: !85)
!154 = distinct !DISubprogram(name: "ulong_cmp", scope: !3, file: !3, line: 48, type: !155, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DISubroutineType(types: !156)
!156 = !{!33, !157, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!159 = !DILocalVariable(name: "a", arg: 1, scope: !154, file: !3, line: 48, type: !157)
!160 = !DILocation(line: 0, scope: !154)
!161 = !DILocalVariable(name: "b", arg: 2, scope: !154, file: !3, line: 48, type: !157)
!162 = !DILocation(line: 50, column: 10, scope: !154)
!163 = !DILocation(line: 50, column: 9, scope: !154)
!164 = !DILocation(line: 50, column: 29, scope: !154)
!165 = !DILocation(line: 50, column: 28, scope: !154)
!166 = !DILocation(line: 50, column: 26, scope: !154)
!167 = !DILocation(line: 50, column: 53, scope: !154)
!168 = !DILocation(line: 50, column: 52, scope: !154)
!169 = !DILocation(line: 50, column: 72, scope: !154)
!170 = !DILocation(line: 50, column: 71, scope: !154)
!171 = !DILocation(line: 50, column: 69, scope: !154)
!172 = !DILocation(line: 50, column: 2, scope: !154)
!173 = distinct !DISubprogram(name: "get_factors", scope: !3, file: !3, line: 53, type: !174, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!174 = !DISubroutineType(types: !175)
!175 = !{!33, !8, !176}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!177 = !DILocalVariable(name: "n", arg: 1, scope: !173, file: !3, line: 53, type: !8)
!178 = !DILocation(line: 0, scope: !173)
!179 = !DILocalVariable(name: "lst", arg: 2, scope: !173, file: !3, line: 53, type: !176)
!180 = !DILocalVariable(name: "f", scope: !173, file: !3, line: 56, type: !181)
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 12800, elements: !182)
!182 = !{!183}
!183 = !DISubrange(count: 100)
!184 = !DILocation(line: 56, column: 15, scope: !173)
!185 = !DILocation(line: 58, column: 29, scope: !173)
!186 = !DILocation(line: 58, column: 8, scope: !173)
!187 = !DILocalVariable(name: "n_f", scope: !173, file: !3, line: 55, type: !33)
!188 = !DILocation(line: 60, column: 15, scope: !173)
!189 = !DILocation(line: 60, column: 22, scope: !173)
!190 = !DILocalVariable(name: "len", scope: !173, file: !3, line: 55, type: !33)
!191 = !DILocalVariable(name: "len2", scope: !173, file: !3, line: 55, type: !33)
!192 = !DILocalVariable(name: "i", scope: !173, file: !3, line: 55, type: !33)
!193 = !DILocation(line: 62, column: 7, scope: !194)
!194 = distinct !DILexicalBlock(scope: !173, file: !3, line: 62, column: 2)
!195 = !DILocation(line: 0, scope: !194)
!196 = !DILocation(line: 60, column: 13, scope: !173)
!197 = !DILocation(line: 62, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !3, line: 62, column: 2)
!199 = !DILocation(line: 62, column: 2, scope: !194)
!200 = !DILocalVariable(name: "j", scope: !173, file: !3, line: 55, type: !33)
!201 = !DILocation(line: 63, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !3, line: 63, column: 3)
!203 = !DILocation(line: 63, column: 24, scope: !202)
!204 = !DILocalVariable(name: "p", scope: !173, file: !3, line: 55, type: !33)
!205 = !DILocation(line: 63, column: 8, scope: !202)
!206 = !DILocation(line: 0, scope: !202)
!207 = !DILocation(line: 63, column: 27, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !3, line: 63, column: 3)
!209 = !DILocation(line: 63, column: 31, scope: !208)
!210 = !DILocation(line: 63, column: 36, scope: !208)
!211 = !DILocation(line: 63, column: 29, scope: !208)
!212 = !DILocation(line: 63, column: 3, scope: !202)
!213 = !DILocalVariable(name: "k", scope: !173, file: !3, line: 55, type: !33)
!214 = !DILocation(line: 64, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !208, file: !3, line: 64, column: 4)
!216 = !DILocation(line: 0, scope: !215)
!217 = !DILocation(line: 64, column: 18, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !3, line: 64, column: 4)
!219 = !DILocation(line: 64, column: 4, scope: !215)
!220 = !DILocation(line: 65, column: 18, scope: !218)
!221 = !DILocation(line: 65, column: 27, scope: !218)
!222 = !DILocation(line: 65, column: 25, scope: !218)
!223 = !DILocation(line: 65, column: 12, scope: !218)
!224 = !DILocation(line: 65, column: 5, scope: !218)
!225 = !DILocation(line: 65, column: 16, scope: !218)
!226 = !DILocation(line: 64, column: 27, scope: !218)
!227 = !DILocation(line: 64, column: 4, scope: !218)
!228 = distinct !{!228, !219, !229}
!229 = !DILocation(line: 65, column: 27, scope: !215)
!230 = !DILocation(line: 63, column: 40, scope: !208)
!231 = !DILocation(line: 63, column: 49, scope: !208)
!232 = !DILocation(line: 63, column: 54, scope: !208)
!233 = !DILocation(line: 63, column: 46, scope: !208)
!234 = !DILocation(line: 63, column: 3, scope: !208)
!235 = distinct !{!235, !212, !236}
!236 = !DILocation(line: 65, column: 27, scope: !202)
!237 = !DILocation(line: 62, column: 24, scope: !198)
!238 = !DILocation(line: 62, column: 2, scope: !198)
!239 = distinct !{!239, !199, !240}
!240 = !DILocation(line: 65, column: 27, scope: !194)
!241 = !DILocation(line: 67, column: 8, scope: !173)
!242 = !DILocation(line: 67, column: 13, scope: !173)
!243 = !DILocation(line: 67, column: 2, scope: !173)
!244 = !DILocation(line: 68, column: 2, scope: !173)
!245 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !246, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!246 = !DISubroutineType(types: !247)
!247 = !{!33}
!248 = !DILocalVariable(name: "fac", scope: !245, file: !3, line: 73, type: !249)
!249 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 640000, elements: !250)
!250 = !{!251}
!251 = !DISubrange(count: 10000)
!252 = !DILocation(line: 73, column: 8, scope: !245)
!253 = !DILocalVariable(name: "nums", scope: !245, file: !3, line: 75, type: !254)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 256, elements: !255)
!255 = !{!256}
!256 = !DISubrange(count: 4)
!257 = !DILocation(line: 75, column: 8, scope: !245)
!258 = !DILocation(line: 77, column: 2, scope: !245)
!259 = !DILocalVariable(name: "i", scope: !245, file: !3, line: 74, type: !33)
!260 = !DILocation(line: 0, scope: !245)
!261 = !DILocation(line: 79, column: 7, scope: !262)
!262 = distinct !DILexicalBlock(scope: !245, file: !3, line: 79, column: 2)
!263 = !DILocation(line: 0, scope: !262)
!264 = !DILocation(line: 79, column: 16, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !3, line: 79, column: 2)
!266 = !DILocation(line: 79, column: 2, scope: !262)
!267 = !DILocation(line: 80, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !3, line: 79, column: 26)
!269 = !DILocation(line: 80, column: 30, scope: !268)
!270 = !DILocation(line: 80, column: 9, scope: !268)
!271 = !DILocalVariable(name: "len", scope: !245, file: !3, line: 74, type: !33)
!272 = !DILocation(line: 81, column: 18, scope: !268)
!273 = !DILocation(line: 81, column: 3, scope: !268)
!274 = !DILocalVariable(name: "j", scope: !245, file: !3, line: 74, type: !33)
!275 = !DILocation(line: 82, column: 8, scope: !276)
!276 = distinct !DILexicalBlock(scope: !268, file: !3, line: 82, column: 3)
!277 = !DILocation(line: 0, scope: !276)
!278 = !DILocation(line: 82, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !3, line: 82, column: 3)
!280 = !DILocation(line: 82, column: 3, scope: !276)
!281 = !DILocation(line: 83, column: 19, scope: !279)
!282 = !DILocation(line: 83, column: 4, scope: !279)
!283 = !DILocation(line: 82, column: 25, scope: !279)
!284 = !DILocation(line: 82, column: 3, scope: !279)
!285 = distinct !{!285, !280, !286}
!286 = !DILocation(line: 83, column: 25, scope: !276)
!287 = !DILocation(line: 84, column: 3, scope: !268)
!288 = !DILocation(line: 85, column: 2, scope: !268)
!289 = !DILocation(line: 79, column: 22, scope: !265)
!290 = !DILocation(line: 79, column: 2, scope: !265)
!291 = distinct !{!291, !266, !292}
!292 = !DILocation(line: 85, column: 2, scope: !262)
!293 = !DILocation(line: 87, column: 2, scope: !245)
