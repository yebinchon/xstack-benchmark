; ModuleID = 'extensible-prime-generator.c'
source_filename = "extensible-prime-generator.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uarray = type { i32*, i32, i32 }

@primes = common dso_local global %struct.uarray zeroinitializer, align 8, !dbg !0
@offset = common dso_local global %struct.uarray zeroinitializer, align 8, !dbg !12
@low = common dso_local global i32 0, align 4, !dbg !23
@field = common dso_local global [8192 x i32] zeroinitializer, align 16, !dbg !6
@.str = private unnamed_addr constant [10 x i8] c"First 20:\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %u\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Between 100 and 150:\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"%u primes between 7700 and 8000\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"%uth prime: %u\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @push(%struct.uarray* %a, i32 %n) #0 !dbg !29 {
entry:
  %a.addr = alloca %struct.uarray*, align 8
  %n.addr = alloca i32, align 4
  store %struct.uarray* %a, %struct.uarray** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uarray** %a.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !37
  %len = getelementptr inbounds %struct.uarray, %struct.uarray* %0, i32 0, i32 2, !dbg !39
  %1 = load i32, i32* %len, align 4, !dbg !39
  %2 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !40
  %cap = getelementptr inbounds %struct.uarray, %struct.uarray* %2, i32 0, i32 1, !dbg !41
  %3 = load i32, i32* %cap, align 8, !dbg !41
  %cmp = icmp uge i32 %1, %3, !dbg !42
  br i1 %cmp, label %if.then, label %if.end7, !dbg !43, !cf.info !44

if.then:                                          ; preds = %entry
  %4 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !45
  %cap1 = getelementptr inbounds %struct.uarray, %struct.uarray* %4, i32 0, i32 1, !dbg !48
  %5 = load i32, i32* %cap1, align 8, !dbg !49
  %mul = mul i32 %5, 2, !dbg !49
  store i32 %mul, i32* %cap1, align 8, !dbg !49
  %tobool = icmp ne i32 %mul, 0, !dbg !49
  br i1 %tobool, label %if.end, label %if.then2, !dbg !50, !cf.info !44

if.then2:                                         ; preds = %if.then
  %6 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !51
  %cap3 = getelementptr inbounds %struct.uarray, %struct.uarray* %6, i32 0, i32 1, !dbg !52
  store i32 16, i32* %cap3, align 8, !dbg !53
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then2, %if.then
  %7 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !54
  %e = getelementptr inbounds %struct.uarray, %struct.uarray* %7, i32 0, i32 0, !dbg !55
  %8 = load i32*, i32** %e, align 8, !dbg !55
  %9 = bitcast i32* %8 to i8*, !dbg !54
  %10 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !56
  %cap4 = getelementptr inbounds %struct.uarray, %struct.uarray* %10, i32 0, i32 1, !dbg !57
  %11 = load i32, i32* %cap4, align 8, !dbg !57
  %conv = zext i32 %11 to i64, !dbg !56
  %mul5 = mul i64 4, %conv, !dbg !58
  %call = call i8* @realloc(i8* %9, i64 %mul5) #5, !dbg !59
  %12 = bitcast i8* %call to i32*, !dbg !59
  %13 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !60
  %e6 = getelementptr inbounds %struct.uarray, %struct.uarray* %13, i32 0, i32 0, !dbg !61
  store i32* %12, i32** %e6, align 8, !dbg !62
  br label %if.end7, !dbg !63

if.end7:                                          ; preds = %if.end, %entry
  %14 = load i32, i32* %n.addr, align 4, !dbg !64
  %15 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !65
  %e8 = getelementptr inbounds %struct.uarray, %struct.uarray* %15, i32 0, i32 0, !dbg !66
  %16 = load i32*, i32** %e8, align 8, !dbg !66
  %17 = load %struct.uarray*, %struct.uarray** %a.addr, align 8, !dbg !67
  %len9 = getelementptr inbounds %struct.uarray, %struct.uarray* %17, i32 0, i32 2, !dbg !68
  %18 = load i32, i32* %len9, align 4, !dbg !69
  %inc = add i32 %18, 1, !dbg !69
  store i32 %inc, i32* %len9, align 4, !dbg !69
  %idxprom = zext i32 %18 to i64, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %16, i64 %idxprom, !dbg !65
  store i32 %14, i32* %arrayidx, align 4, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @init() #0 !dbg !72 {
entry:
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %f = alloca [65536 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %p, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %q, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [65536 x i8]* %f, metadata !79, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %f, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 0, i64 65536, i1 false), !dbg !85
  call void @push(%struct.uarray* @primes, i32 2), !dbg !86
  call void @push(%struct.uarray* @offset, i32 0), !dbg !87
  store i32 3, i32* %p, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %p, align 4, !dbg !91
  %cmp = icmp ult i32 %0, 65536, !dbg !93
  br i1 %cmp, label %for.body, label %for.end9, !dbg !94

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %p, align 4, !dbg !95
  %idxprom = zext i32 %1 to i64, !dbg !98
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* %f, i64 0, i64 %idxprom, !dbg !98
  %2 = load i8, i8* %arrayidx, align 1, !dbg !98
  %tobool = icmp ne i8 %2, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.end, !dbg !99, !cf.info !44

if.then:                                          ; preds = %for.body
  br label %for.inc7, !dbg !100

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* %p, align 4, !dbg !101
  %4 = load i32, i32* %p, align 4, !dbg !103
  %mul = mul i32 %3, %4, !dbg !104
  store i32 %mul, i32* %q, align 4, !dbg !105
  br label %for.cond1, !dbg !106

for.cond1:                                        ; preds = %for.inc, %if.end
  %5 = load i32, i32* %q, align 4, !dbg !107
  %cmp2 = icmp ult i32 %5, 65536, !dbg !109
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !110

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %q, align 4, !dbg !111
  %idxprom4 = zext i32 %6 to i64, !dbg !112
  %arrayidx5 = getelementptr inbounds [65536 x i8], [65536 x i8]* %f, i64 0, i64 %idxprom4, !dbg !112
  store i8 1, i8* %arrayidx5, align 1, !dbg !113
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %p, align 4, !dbg !114
  %mul6 = mul i32 2, %7, !dbg !115
  %8 = load i32, i32* %q, align 4, !dbg !116
  %add = add i32 %8, %mul6, !dbg !116
  store i32 %add, i32* %q, align 4, !dbg !116
  br label %for.cond1, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond1
  %9 = load i32, i32* %p, align 4, !dbg !120
  call void @push(%struct.uarray* @primes, i32 %9), !dbg !121
  %10 = load i32, i32* %q, align 4, !dbg !122
  call void @push(%struct.uarray* @offset, i32 %10), !dbg !123
  br label %for.inc7, !dbg !124

for.inc7:                                         ; preds = %for.end, %if.then
  %11 = load i32, i32* %p, align 4, !dbg !125
  %add8 = add i32 %11, 2, !dbg !125
  store i32 %add8, i32* %p, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end9:                                         ; preds = %for.cond
  store i32 65536, i32* @low, align 4, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @sieve() #0 !dbg !131 {
entry:
  %i = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %hi = alloca i32, align 4
  %ptop = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %p, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32* %q, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %hi, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %ptop, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = load i32, i32* @low, align 4, !dbg !142
  %tobool = icmp ne i32 %0, 0, !dbg !142
  br i1 %tobool, label %if.end, label %if.then, !dbg !144, !cf.info !44

if.then:                                          ; preds = %entry
  call void @init(), !dbg !145
  br label %if.end, !dbg !145

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([8192 x i32]* @field to i8*), i8 0, i64 32768, i1 false), !dbg !146
  %1 = load i32, i32* @low, align 4, !dbg !147
  %add = add i32 %1, 524288, !dbg !148
  store i32 %add, i32* %hi, align 4, !dbg !149
  %2 = load i32, i32* %hi, align 4, !dbg !150
  %conv = uitofp i32 %2 to double, !dbg !150
  %call = call double @sqrt(double %conv) #5, !dbg !151
  %mul = fmul double %call, 2.000000e+00, !dbg !152
  %add1 = fadd double %mul, 1.000000e+00, !dbg !153
  %conv2 = fptoui double %add1 to i32, !dbg !151
  store i32 %conv2, i32* %ptop, align 4, !dbg !154
  store i32 1, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc18, %if.end
  %3 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !158
  %4 = load i32, i32* %i, align 4, !dbg !160
  %idxprom = zext i32 %4 to i64, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !161
  %5 = load i32, i32* %arrayidx, align 4, !dbg !161
  %mul3 = mul i32 %5, 2, !dbg !162
  store i32 %mul3, i32* %p, align 4, !dbg !163
  %6 = load i32, i32* %ptop, align 4, !dbg !164
  %cmp = icmp ult i32 %mul3, %6, !dbg !165
  br i1 %cmp, label %for.body, label %for.end19, !dbg !166

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @offset, i32 0, i32 0), align 8, !dbg !167
  %8 = load i32, i32* %i, align 4, !dbg !170
  %idxprom5 = zext i32 %8 to i64, !dbg !171
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !171
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !171
  %10 = load i32, i32* @low, align 4, !dbg !172
  %sub = sub i32 %9, %10, !dbg !173
  store i32 %sub, i32* %q, align 4, !dbg !174
  br label %for.cond7, !dbg !175

for.cond7:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %q, align 4, !dbg !176
  %cmp8 = icmp ult i32 %11, 524288, !dbg !178
  br i1 %cmp8, label %for.body10, label %for.end, !dbg !179

for.body10:                                       ; preds = %for.cond7
  %12 = load i32, i32* %q, align 4, !dbg !180
  %shr = lshr i32 %12, 1, !dbg !180
  %and = and i32 %shr, 31, !dbg !180
  %shl = shl i32 1, %and, !dbg !180
  %13 = load i32, i32* %q, align 4, !dbg !180
  %shr11 = lshr i32 %13, 6, !dbg !180
  %idxprom12 = zext i32 %shr11 to i64, !dbg !180
  %arrayidx13 = getelementptr inbounds [8192 x i32], [8192 x i32]* @field, i64 0, i64 %idxprom12, !dbg !180
  %14 = load i32, i32* %arrayidx13, align 4, !dbg !180
  %or = or i32 %14, %shl, !dbg !180
  store i32 %or, i32* %arrayidx13, align 4, !dbg !180
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body10
  %15 = load i32, i32* %p, align 4, !dbg !181
  %16 = load i32, i32* %q, align 4, !dbg !182
  %add14 = add i32 %16, %15, !dbg !182
  store i32 %add14, i32* %q, align 4, !dbg !182
  br label %for.cond7, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond7
  %17 = load i32, i32* %q, align 4, !dbg !186
  %18 = load i32, i32* @low, align 4, !dbg !187
  %add15 = add i32 %17, %18, !dbg !188
  %19 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @offset, i32 0, i32 0), align 8, !dbg !189
  %20 = load i32, i32* %i, align 4, !dbg !190
  %idxprom16 = zext i32 %20 to i64, !dbg !191
  %arrayidx17 = getelementptr inbounds i32, i32* %19, i64 %idxprom16, !dbg !191
  store i32 %add15, i32* %arrayidx17, align 4, !dbg !192
  br label %for.inc18, !dbg !193

for.inc18:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4, !dbg !194
  %inc = add i32 %21, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end19:                                        ; preds = %for.cond
  store i32 1, i32* %p, align 4, !dbg !198
  br label %for.cond20, !dbg !200

for.cond20:                                       ; preds = %for.inc35, %for.end19
  %22 = load i32, i32* %p, align 4, !dbg !201
  %cmp21 = icmp ult i32 %22, 524288, !dbg !203
  br i1 %cmp21, label %for.body23, label %for.end37, !dbg !204

for.body23:                                       ; preds = %for.cond20
  %23 = load i32, i32* %p, align 4, !dbg !205
  %shr24 = lshr i32 %23, 6, !dbg !205
  %idxprom25 = zext i32 %shr24 to i64, !dbg !205
  %arrayidx26 = getelementptr inbounds [8192 x i32], [8192 x i32]* @field, i64 0, i64 %idxprom25, !dbg !205
  %24 = load i32, i32* %arrayidx26, align 4, !dbg !205
  %25 = load i32, i32* %p, align 4, !dbg !205
  %shr27 = lshr i32 %25, 1, !dbg !205
  %and28 = and i32 %shr27, 31, !dbg !205
  %shl29 = shl i32 1, %and28, !dbg !205
  %and30 = and i32 %24, %shl29, !dbg !205
  %tobool31 = icmp ne i32 %and30, 0, !dbg !205
  br i1 %tobool31, label %if.end34, label %if.then32, !dbg !207, !cf.info !44

if.then32:                                        ; preds = %for.body23
  %26 = load i32, i32* @low, align 4, !dbg !208
  %27 = load i32, i32* %p, align 4, !dbg !209
  %add33 = add i32 %26, %27, !dbg !210
  call void @push(%struct.uarray* @primes, i32 %add33), !dbg !211
  br label %if.end34, !dbg !211

if.end34:                                         ; preds = %if.then32, %for.body23
  br label %for.inc35, !dbg !205

for.inc35:                                        ; preds = %if.end34
  %28 = load i32, i32* %p, align 4, !dbg !212
  %add36 = add i32 %28, 2, !dbg !212
  store i32 %add36, i32* %p, align 4, !dbg !212
  br label %for.cond20, !dbg !213, !llvm.loop !214

for.end37:                                        ; preds = %for.cond20
  %29 = load i32, i32* %hi, align 4, !dbg !216
  store i32 %29, i32* @low, align 4, !dbg !217
  ret void, !dbg !218
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !219 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32* %p, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata i32* %c, metadata !226, metadata !DIExpression()), !dbg !227
  br label %while.cond, !dbg !228

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !229
  %cmp = icmp ult i32 %0, 20, !dbg !230
  br i1 %cmp, label %while.body, label %while.end, !dbg !228

while.body:                                       ; preds = %while.cond
  call void @sieve(), !dbg !231
  br label %while.cond, !dbg !228, !llvm.loop !232

while.end:                                        ; preds = %while.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i32, i32* %i, align 4, !dbg !238
  %cmp1 = icmp ult i32 %1, 20, !dbg !240
  br i1 %cmp1, label %for.body, label %for.end, !dbg !241

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !242
  %3 = load i32, i32* %i, align 4, !dbg !243
  %idxprom = zext i32 %3 to i64, !dbg !244
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !244
  %4 = load i32, i32* %arrayidx, align 4, !dbg !244
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %4), !dbg !245
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !246
  %inc = add i32 %5, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  %call3 = call i32 @putchar(i32 10), !dbg !250
  br label %while.cond4, !dbg !251

while.cond4:                                      ; preds = %while.body8, %for.end
  %6 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !252
  %7 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !253
  %sub = sub i32 %7, 1, !dbg !254
  %idxprom5 = zext i32 %sub to i64, !dbg !255
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 %idxprom5, !dbg !255
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !255
  %cmp7 = icmp ult i32 %8, 150, !dbg !256
  br i1 %cmp7, label %while.body8, label %while.end9, !dbg !251

while.body8:                                      ; preds = %while.cond4
  call void @sieve(), !dbg !257
  br label %while.cond4, !dbg !251, !llvm.loop !258

while.end9:                                       ; preds = %while.cond4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0)), !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond11, !dbg !263

for.cond11:                                       ; preds = %for.inc21, %while.end9
  %9 = load i32, i32* %i, align 4, !dbg !264
  %10 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !266
  %cmp12 = icmp ult i32 %9, %10, !dbg !267
  br i1 %cmp12, label %for.body13, label %for.end23, !dbg !268

for.body13:                                       ; preds = %for.cond11
  %11 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !269
  %12 = load i32, i32* %i, align 4, !dbg !272
  %idxprom14 = zext i32 %12 to i64, !dbg !273
  %arrayidx15 = getelementptr inbounds i32, i32* %11, i64 %idxprom14, !dbg !273
  %13 = load i32, i32* %arrayidx15, align 4, !dbg !273
  store i32 %13, i32* %p, align 4, !dbg !274
  %cmp16 = icmp uge i32 %13, 100, !dbg !275
  br i1 %cmp16, label %land.lhs.true, label %if.end, !dbg !276, !cf.info !44

land.lhs.true:                                    ; preds = %for.body13
  %14 = load i32, i32* %p, align 4, !dbg !277
  %cmp17 = icmp ult i32 %14, 150, !dbg !278
  br i1 %cmp17, label %if.then, label %if.end, !dbg !279, !cf.info !44

if.then:                                          ; preds = %land.lhs.true
  %15 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !280
  %16 = load i32, i32* %i, align 4, !dbg !281
  %idxprom18 = zext i32 %16 to i64, !dbg !282
  %arrayidx19 = getelementptr inbounds i32, i32* %15, i64 %idxprom18, !dbg !282
  %17 = load i32, i32* %arrayidx19, align 4, !dbg !282
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %17), !dbg !283
  br label %if.end, !dbg !283

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body13
  br label %for.inc21, !dbg !284

for.inc21:                                        ; preds = %if.end
  %18 = load i32, i32* %i, align 4, !dbg !285
  %inc22 = add i32 %18, 1, !dbg !285
  store i32 %inc22, i32* %i, align 4, !dbg !285
  br label %for.cond11, !dbg !286, !llvm.loop !287

for.end23:                                        ; preds = %for.cond11
  %call24 = call i32 @putchar(i32 10), !dbg !289
  br label %while.cond25, !dbg !290

while.cond25:                                     ; preds = %while.body30, %for.end23
  %19 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !291
  %20 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !292
  %sub26 = sub i32 %20, 1, !dbg !293
  %idxprom27 = zext i32 %sub26 to i64, !dbg !294
  %arrayidx28 = getelementptr inbounds i32, i32* %19, i64 %idxprom27, !dbg !294
  %21 = load i32, i32* %arrayidx28, align 4, !dbg !294
  %cmp29 = icmp ult i32 %21, 8000, !dbg !295
  br i1 %cmp29, label %while.body30, label %while.end31, !dbg !290

while.body30:                                     ; preds = %while.cond25
  call void @sieve(), !dbg !296
  br label %while.cond25, !dbg !290, !llvm.loop !297

while.end31:                                      ; preds = %while.cond25
  store i32 0, i32* %c, align 4, !dbg !299
  store i32 0, i32* %i, align 4, !dbg !301
  br label %for.cond32, !dbg !302

for.cond32:                                       ; preds = %for.inc43, %while.end31
  %22 = load i32, i32* %i, align 4, !dbg !303
  %23 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !305
  %cmp33 = icmp ult i32 %22, %23, !dbg !306
  br i1 %cmp33, label %for.body34, label %for.end45, !dbg !307

for.body34:                                       ; preds = %for.cond32
  %24 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !308
  %25 = load i32, i32* %i, align 4, !dbg !310
  %idxprom35 = zext i32 %25 to i64, !dbg !311
  %arrayidx36 = getelementptr inbounds i32, i32* %24, i64 %idxprom35, !dbg !311
  %26 = load i32, i32* %arrayidx36, align 4, !dbg !311
  store i32 %26, i32* %p, align 4, !dbg !312
  %cmp37 = icmp uge i32 %26, 7700, !dbg !313
  br i1 %cmp37, label %land.lhs.true38, label %if.end42, !dbg !314, !cf.info !44

land.lhs.true38:                                  ; preds = %for.body34
  %27 = load i32, i32* %p, align 4, !dbg !315
  %cmp39 = icmp ult i32 %27, 8000, !dbg !316
  br i1 %cmp39, label %if.then40, label %if.end42, !dbg !317, !cf.info !44

if.then40:                                        ; preds = %land.lhs.true38
  %28 = load i32, i32* %c, align 4, !dbg !318
  %inc41 = add i32 %28, 1, !dbg !318
  store i32 %inc41, i32* %c, align 4, !dbg !318
  br label %if.end42, !dbg !319

if.end42:                                         ; preds = %if.then40, %land.lhs.true38, %for.body34
  br label %for.inc43, !dbg !320

for.inc43:                                        ; preds = %if.end42
  %29 = load i32, i32* %i, align 4, !dbg !321
  %inc44 = add i32 %29, 1, !dbg !321
  store i32 %inc44, i32* %i, align 4, !dbg !321
  br label %for.cond32, !dbg !322, !llvm.loop !323

for.end45:                                        ; preds = %for.cond32
  %30 = load i32, i32* %c, align 4, !dbg !325
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 %30), !dbg !326
  store i32 10, i32* %c, align 4, !dbg !327
  br label %for.cond47, !dbg !329

for.cond47:                                       ; preds = %for.inc58, %for.end45
  %31 = load i32, i32* %c, align 4, !dbg !330
  %cmp48 = icmp ule i32 %31, 100000000, !dbg !332
  br i1 %cmp48, label %for.body49, label %for.end59, !dbg !333

for.body49:                                       ; preds = %for.cond47
  br label %while.cond50, !dbg !334

while.cond50:                                     ; preds = %while.body52, %for.body49
  %32 = load i32, i32* getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 2), align 4, !dbg !336
  %33 = load i32, i32* %c, align 4, !dbg !337
  %cmp51 = icmp ult i32 %32, %33, !dbg !338
  br i1 %cmp51, label %while.body52, label %while.end53, !dbg !334

while.body52:                                     ; preds = %while.cond50
  call void @sieve(), !dbg !339
  br label %while.cond50, !dbg !334, !llvm.loop !340

while.end53:                                      ; preds = %while.cond50
  %34 = load i32, i32* %c, align 4, !dbg !342
  %35 = load i32*, i32** getelementptr inbounds (%struct.uarray, %struct.uarray* @primes, i32 0, i32 0), align 8, !dbg !343
  %36 = load i32, i32* %c, align 4, !dbg !344
  %sub54 = sub i32 %36, 1, !dbg !345
  %idxprom55 = zext i32 %sub54 to i64, !dbg !346
  %arrayidx56 = getelementptr inbounds i32, i32* %35, i64 %idxprom55, !dbg !346
  %37 = load i32, i32* %arrayidx56, align 4, !dbg !346
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i32 %34, i32 %37), !dbg !347
  br label %for.inc58, !dbg !348

for.inc58:                                        ; preds = %while.end53
  %38 = load i32, i32* %c, align 4, !dbg !349
  %mul = mul i32 %38, 10, !dbg !349
  store i32 %mul, i32* %c, align 4, !dbg !349
  br label %for.cond47, !dbg !350, !llvm.loop !351

for.end59:                                        ; preds = %for.cond47
  ret i32 0, !dbg !353
}

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @putchar(i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "primes", scope: !2, file: !3, line: 18, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "extensible-prime-generator.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Extensible-prime-generator")
!4 = !{}
!5 = !{!6, !0, !12, !23}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "field", scope: !2, file: !3, line: 9, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 262144, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 8192)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "offset", scope: !2, file: !3, line: 18, type: !14, isLocal: false, isDefinition: true)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uarray", file: !3, line: 17, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 14, size: 128, elements: !16)
!16 = !{!17, !21, !22}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !15, file: !3, line: 15, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint", file: !3, line: 13, baseType: !20)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "cap", scope: !15, file: !3, line: 16, baseType: !19, size: 32, offset: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !15, file: !3, line: 16, baseType: !19, size: 32, offset: 96)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "low", scope: !2, file: !3, line: 29, type: !19, isLocal: false, isDefinition: true)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!29 = distinct !DISubprogram(name: "push", scope: !3, file: !3, line: 20, type: !30, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32, !19}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !3, line: 20, type: !32)
!34 = !DILocation(line: 20, column: 19, scope: !29)
!35 = !DILocalVariable(name: "n", arg: 2, scope: !29, file: !3, line: 20, type: !19)
!36 = !DILocation(line: 20, column: 27, scope: !29)
!37 = !DILocation(line: 22, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !3, line: 22, column: 13)
!39 = !DILocation(line: 22, column: 16, scope: !38)
!40 = !DILocation(line: 22, column: 23, scope: !38)
!41 = !DILocation(line: 22, column: 26, scope: !38)
!42 = !DILocation(line: 22, column: 20, scope: !38)
!43 = !DILocation(line: 22, column: 13, scope: !29)
!44 = !{!"if"}
!45 = !DILocation(line: 23, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !3, line: 23, column: 21)
!47 = distinct !DILexicalBlock(scope: !38, file: !3, line: 22, column: 31)
!48 = !DILocation(line: 23, column: 26, scope: !46)
!49 = !DILocation(line: 23, column: 30, scope: !46)
!50 = !DILocation(line: 23, column: 21, scope: !47)
!51 = !DILocation(line: 23, column: 37, scope: !46)
!52 = !DILocation(line: 23, column: 40, scope: !46)
!53 = !DILocation(line: 23, column: 44, scope: !46)
!54 = !DILocation(line: 24, column: 32, scope: !47)
!55 = !DILocation(line: 24, column: 35, scope: !47)
!56 = !DILocation(line: 24, column: 53, scope: !47)
!57 = !DILocation(line: 24, column: 56, scope: !47)
!58 = !DILocation(line: 24, column: 51, scope: !47)
!59 = !DILocation(line: 24, column: 24, scope: !47)
!60 = !DILocation(line: 24, column: 17, scope: !47)
!61 = !DILocation(line: 24, column: 20, scope: !47)
!62 = !DILocation(line: 24, column: 22, scope: !47)
!63 = !DILocation(line: 25, column: 9, scope: !47)
!64 = !DILocation(line: 26, column: 26, scope: !29)
!65 = !DILocation(line: 26, column: 9, scope: !29)
!66 = !DILocation(line: 26, column: 12, scope: !29)
!67 = !DILocation(line: 26, column: 14, scope: !29)
!68 = !DILocation(line: 26, column: 17, scope: !29)
!69 = !DILocation(line: 26, column: 20, scope: !29)
!70 = !DILocation(line: 26, column: 24, scope: !29)
!71 = !DILocation(line: 27, column: 1, scope: !29)
!72 = distinct !DISubprogram(name: "init", scope: !3, file: !3, line: 30, type: !73, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{null}
!75 = !DILocalVariable(name: "p", scope: !72, file: !3, line: 32, type: !19)
!76 = !DILocation(line: 32, column: 14, scope: !72)
!77 = !DILocalVariable(name: "q", scope: !72, file: !3, line: 32, type: !19)
!78 = !DILocation(line: 32, column: 17, scope: !72)
!79 = !DILocalVariable(name: "f", scope: !72, file: !3, line: 34, type: !80)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 524288, elements: !82)
!81 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!82 = !{!83}
!83 = !DISubrange(count: 65536)
!84 = !DILocation(line: 34, column: 23, scope: !72)
!85 = !DILocation(line: 35, column: 9, scope: !72)
!86 = !DILocation(line: 36, column: 9, scope: !72)
!87 = !DILocation(line: 37, column: 9, scope: !72)
!88 = !DILocation(line: 38, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !72, file: !3, line: 38, column: 9)
!90 = !DILocation(line: 38, column: 14, scope: !89)
!91 = !DILocation(line: 38, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 38, column: 9)
!93 = !DILocation(line: 38, column: 23, scope: !92)
!94 = !DILocation(line: 38, column: 9, scope: !89)
!95 = !DILocation(line: 39, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !3, line: 39, column: 21)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 38, column: 40)
!98 = !DILocation(line: 39, column: 21, scope: !96)
!99 = !DILocation(line: 39, column: 21, scope: !97)
!100 = !DILocation(line: 39, column: 27, scope: !96)
!101 = !DILocation(line: 40, column: 26, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !3, line: 40, column: 17)
!103 = !DILocation(line: 40, column: 28, scope: !102)
!104 = !DILocation(line: 40, column: 27, scope: !102)
!105 = !DILocation(line: 40, column: 24, scope: !102)
!106 = !DILocation(line: 40, column: 22, scope: !102)
!107 = !DILocation(line: 40, column: 31, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !3, line: 40, column: 17)
!109 = !DILocation(line: 40, column: 33, scope: !108)
!110 = !DILocation(line: 40, column: 17, scope: !102)
!111 = !DILocation(line: 40, column: 54, scope: !108)
!112 = !DILocation(line: 40, column: 52, scope: !108)
!113 = !DILocation(line: 40, column: 57, scope: !108)
!114 = !DILocation(line: 40, column: 49, scope: !108)
!115 = !DILocation(line: 40, column: 48, scope: !108)
!116 = !DILocation(line: 40, column: 44, scope: !108)
!117 = !DILocation(line: 40, column: 17, scope: !108)
!118 = distinct !{!118, !110, !119}
!119 = !DILocation(line: 40, column: 59, scope: !102)
!120 = !DILocation(line: 41, column: 31, scope: !97)
!121 = !DILocation(line: 41, column: 17, scope: !97)
!122 = !DILocation(line: 42, column: 31, scope: !97)
!123 = !DILocation(line: 42, column: 17, scope: !97)
!124 = !DILocation(line: 43, column: 9, scope: !97)
!125 = !DILocation(line: 38, column: 34, scope: !92)
!126 = !DILocation(line: 38, column: 9, scope: !92)
!127 = distinct !{!127, !94, !128}
!128 = !DILocation(line: 43, column: 9, scope: !89)
!129 = !DILocation(line: 44, column: 13, scope: !72)
!130 = !DILocation(line: 45, column: 1, scope: !72)
!131 = distinct !DISubprogram(name: "sieve", scope: !3, file: !3, line: 47, type: !73, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "i", scope: !131, file: !3, line: 49, type: !19)
!133 = !DILocation(line: 49, column: 14, scope: !131)
!134 = !DILocalVariable(name: "p", scope: !131, file: !3, line: 49, type: !19)
!135 = !DILocation(line: 49, column: 17, scope: !131)
!136 = !DILocalVariable(name: "q", scope: !131, file: !3, line: 49, type: !19)
!137 = !DILocation(line: 49, column: 20, scope: !131)
!138 = !DILocalVariable(name: "hi", scope: !131, file: !3, line: 49, type: !19)
!139 = !DILocation(line: 49, column: 23, scope: !131)
!140 = !DILocalVariable(name: "ptop", scope: !131, file: !3, line: 49, type: !19)
!141 = !DILocation(line: 49, column: 27, scope: !131)
!142 = !DILocation(line: 50, column: 14, scope: !143)
!143 = distinct !DILexicalBlock(scope: !131, file: !3, line: 50, column: 13)
!144 = !DILocation(line: 50, column: 13, scope: !131)
!145 = !DILocation(line: 50, column: 19, scope: !143)
!146 = !DILocation(line: 52, column: 9, scope: !131)
!147 = !DILocation(line: 54, column: 14, scope: !131)
!148 = !DILocation(line: 54, column: 18, scope: !131)
!149 = !DILocation(line: 54, column: 12, scope: !131)
!150 = !DILocation(line: 55, column: 21, scope: !131)
!151 = !DILocation(line: 55, column: 16, scope: !131)
!152 = !DILocation(line: 55, column: 25, scope: !131)
!153 = !DILocation(line: 55, column: 29, scope: !131)
!154 = !DILocation(line: 55, column: 14, scope: !131)
!155 = !DILocation(line: 57, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !131, file: !3, line: 57, column: 9)
!157 = !DILocation(line: 57, column: 14, scope: !156)
!158 = !DILocation(line: 57, column: 33, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 57, column: 9)
!160 = !DILocation(line: 57, column: 35, scope: !159)
!161 = !DILocation(line: 57, column: 26, scope: !159)
!162 = !DILocation(line: 57, column: 37, scope: !159)
!163 = !DILocation(line: 57, column: 24, scope: !159)
!164 = !DILocation(line: 57, column: 43, scope: !159)
!165 = !DILocation(line: 57, column: 41, scope: !159)
!166 = !DILocation(line: 57, column: 9, scope: !156)
!167 = !DILocation(line: 58, column: 33, scope: !168)
!168 = distinct !DILexicalBlock(scope: !169, file: !3, line: 58, column: 17)
!169 = distinct !DILexicalBlock(scope: !159, file: !3, line: 57, column: 54)
!170 = !DILocation(line: 58, column: 35, scope: !168)
!171 = !DILocation(line: 58, column: 26, scope: !168)
!172 = !DILocation(line: 58, column: 40, scope: !168)
!173 = !DILocation(line: 58, column: 38, scope: !168)
!174 = !DILocation(line: 58, column: 24, scope: !168)
!175 = !DILocation(line: 58, column: 22, scope: !168)
!176 = !DILocation(line: 58, column: 45, scope: !177)
!177 = distinct !DILexicalBlock(scope: !168, file: !3, line: 58, column: 17)
!178 = !DILocation(line: 58, column: 47, scope: !177)
!179 = !DILocation(line: 58, column: 17, scope: !168)
!180 = !DILocation(line: 59, column: 25, scope: !177)
!181 = !DILocation(line: 58, column: 66, scope: !177)
!182 = !DILocation(line: 58, column: 63, scope: !177)
!183 = !DILocation(line: 58, column: 17, scope: !177)
!184 = distinct !{!184, !179, !185}
!185 = !DILocation(line: 59, column: 25, scope: !168)
!186 = !DILocation(line: 60, column: 31, scope: !169)
!187 = !DILocation(line: 60, column: 35, scope: !169)
!188 = !DILocation(line: 60, column: 33, scope: !169)
!189 = !DILocation(line: 60, column: 24, scope: !169)
!190 = !DILocation(line: 60, column: 26, scope: !169)
!191 = !DILocation(line: 60, column: 17, scope: !169)
!192 = !DILocation(line: 60, column: 29, scope: !169)
!193 = !DILocation(line: 61, column: 9, scope: !169)
!194 = !DILocation(line: 57, column: 50, scope: !159)
!195 = !DILocation(line: 57, column: 9, scope: !159)
!196 = distinct !{!196, !166, !197}
!197 = !DILocation(line: 61, column: 9, scope: !156)
!198 = !DILocation(line: 63, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !131, file: !3, line: 63, column: 9)
!200 = !DILocation(line: 63, column: 14, scope: !199)
!201 = !DILocation(line: 63, column: 21, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !3, line: 63, column: 9)
!203 = !DILocation(line: 63, column: 23, scope: !202)
!204 = !DILocation(line: 63, column: 9, scope: !199)
!205 = !DILocation(line: 64, column: 22, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !3, line: 64, column: 21)
!207 = !DILocation(line: 64, column: 21, scope: !202)
!208 = !DILocation(line: 64, column: 44, scope: !206)
!209 = !DILocation(line: 64, column: 50, scope: !206)
!210 = !DILocation(line: 64, column: 48, scope: !206)
!211 = !DILocation(line: 64, column: 30, scope: !206)
!212 = !DILocation(line: 63, column: 39, scope: !202)
!213 = !DILocation(line: 63, column: 9, scope: !202)
!214 = distinct !{!214, !204, !215}
!215 = !DILocation(line: 64, column: 51, scope: !199)
!216 = !DILocation(line: 66, column: 15, scope: !131)
!217 = !DILocation(line: 66, column: 13, scope: !131)
!218 = !DILocation(line: 67, column: 1, scope: !131)
!219 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 69, type: !220, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!220 = !DISubroutineType(types: !221)
!221 = !{!9}
!222 = !DILocalVariable(name: "i", scope: !219, file: !3, line: 71, type: !19)
!223 = !DILocation(line: 71, column: 14, scope: !219)
!224 = !DILocalVariable(name: "p", scope: !219, file: !3, line: 71, type: !19)
!225 = !DILocation(line: 71, column: 17, scope: !219)
!226 = !DILocalVariable(name: "c", scope: !219, file: !3, line: 71, type: !19)
!227 = !DILocation(line: 71, column: 20, scope: !219)
!228 = !DILocation(line: 73, column: 9, scope: !219)
!229 = !DILocation(line: 73, column: 23, scope: !219)
!230 = !DILocation(line: 73, column: 27, scope: !219)
!231 = !DILocation(line: 73, column: 33, scope: !219)
!232 = distinct !{!232, !228, !233}
!233 = !DILocation(line: 73, column: 39, scope: !219)
!234 = !DILocation(line: 74, column: 9, scope: !219)
!235 = !DILocation(line: 75, column: 16, scope: !236)
!236 = distinct !DILexicalBlock(scope: !219, file: !3, line: 75, column: 9)
!237 = !DILocation(line: 75, column: 14, scope: !236)
!238 = !DILocation(line: 75, column: 21, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !3, line: 75, column: 9)
!240 = !DILocation(line: 75, column: 23, scope: !239)
!241 = !DILocation(line: 75, column: 9, scope: !236)
!242 = !DILocation(line: 76, column: 38, scope: !239)
!243 = !DILocation(line: 76, column: 40, scope: !239)
!244 = !DILocation(line: 76, column: 31, scope: !239)
!245 = !DILocation(line: 76, column: 17, scope: !239)
!246 = !DILocation(line: 75, column: 30, scope: !239)
!247 = !DILocation(line: 75, column: 9, scope: !239)
!248 = distinct !{!248, !241, !249}
!249 = !DILocation(line: 76, column: 42, scope: !236)
!250 = !DILocation(line: 77, column: 9, scope: !219)
!251 = !DILocation(line: 79, column: 9, scope: !219)
!252 = !DILocation(line: 79, column: 23, scope: !219)
!253 = !DILocation(line: 79, column: 32, scope: !219)
!254 = !DILocation(line: 79, column: 35, scope: !219)
!255 = !DILocation(line: 79, column: 16, scope: !219)
!256 = !DILocation(line: 79, column: 39, scope: !219)
!257 = !DILocation(line: 79, column: 46, scope: !219)
!258 = distinct !{!258, !251, !259}
!259 = !DILocation(line: 79, column: 52, scope: !219)
!260 = !DILocation(line: 80, column: 9, scope: !219)
!261 = !DILocation(line: 81, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !219, file: !3, line: 81, column: 9)
!263 = !DILocation(line: 81, column: 14, scope: !262)
!264 = !DILocation(line: 81, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !3, line: 81, column: 9)
!266 = !DILocation(line: 81, column: 32, scope: !265)
!267 = !DILocation(line: 81, column: 23, scope: !265)
!268 = !DILocation(line: 81, column: 9, scope: !262)
!269 = !DILocation(line: 82, column: 33, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !3, line: 82, column: 21)
!271 = distinct !DILexicalBlock(scope: !265, file: !3, line: 81, column: 42)
!272 = !DILocation(line: 82, column: 35, scope: !270)
!273 = !DILocation(line: 82, column: 26, scope: !270)
!274 = !DILocation(line: 82, column: 24, scope: !270)
!275 = !DILocation(line: 82, column: 39, scope: !270)
!276 = !DILocation(line: 82, column: 46, scope: !270)
!277 = !DILocation(line: 82, column: 49, scope: !270)
!278 = !DILocation(line: 82, column: 51, scope: !270)
!279 = !DILocation(line: 82, column: 21, scope: !271)
!280 = !DILocation(line: 83, column: 46, scope: !270)
!281 = !DILocation(line: 83, column: 48, scope: !270)
!282 = !DILocation(line: 83, column: 39, scope: !270)
!283 = !DILocation(line: 83, column: 25, scope: !270)
!284 = !DILocation(line: 84, column: 9, scope: !271)
!285 = !DILocation(line: 81, column: 38, scope: !265)
!286 = !DILocation(line: 81, column: 9, scope: !265)
!287 = distinct !{!287, !268, !288}
!288 = !DILocation(line: 84, column: 9, scope: !262)
!289 = !DILocation(line: 85, column: 9, scope: !219)
!290 = !DILocation(line: 87, column: 9, scope: !219)
!291 = !DILocation(line: 87, column: 23, scope: !219)
!292 = !DILocation(line: 87, column: 32, scope: !219)
!293 = !DILocation(line: 87, column: 35, scope: !219)
!294 = !DILocation(line: 87, column: 16, scope: !219)
!295 = !DILocation(line: 87, column: 39, scope: !219)
!296 = !DILocation(line: 87, column: 47, scope: !219)
!297 = distinct !{!297, !290, !298}
!298 = !DILocation(line: 87, column: 53, scope: !219)
!299 = !DILocation(line: 88, column: 20, scope: !300)
!300 = distinct !DILexicalBlock(scope: !219, file: !3, line: 88, column: 9)
!301 = !DILocation(line: 88, column: 16, scope: !300)
!302 = !DILocation(line: 88, column: 14, scope: !300)
!303 = !DILocation(line: 88, column: 25, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !3, line: 88, column: 9)
!305 = !DILocation(line: 88, column: 36, scope: !304)
!306 = !DILocation(line: 88, column: 27, scope: !304)
!307 = !DILocation(line: 88, column: 9, scope: !300)
!308 = !DILocation(line: 89, column: 33, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !3, line: 89, column: 21)
!310 = !DILocation(line: 89, column: 35, scope: !309)
!311 = !DILocation(line: 89, column: 26, scope: !309)
!312 = !DILocation(line: 89, column: 24, scope: !309)
!313 = !DILocation(line: 89, column: 39, scope: !309)
!314 = !DILocation(line: 89, column: 47, scope: !309)
!315 = !DILocation(line: 89, column: 50, scope: !309)
!316 = !DILocation(line: 89, column: 52, scope: !309)
!317 = !DILocation(line: 89, column: 21, scope: !304)
!318 = !DILocation(line: 89, column: 61, scope: !309)
!319 = !DILocation(line: 89, column: 60, scope: !309)
!320 = !DILocation(line: 89, column: 54, scope: !309)
!321 = !DILocation(line: 88, column: 42, scope: !304)
!322 = !DILocation(line: 88, column: 9, scope: !304)
!323 = distinct !{!323, !307, !324}
!324 = !DILocation(line: 89, column: 61, scope: !300)
!325 = !DILocation(line: 90, column: 53, scope: !219)
!326 = !DILocation(line: 90, column: 9, scope: !219)
!327 = !DILocation(line: 92, column: 16, scope: !328)
!328 = distinct !DILexicalBlock(scope: !219, file: !3, line: 92, column: 9)
!329 = !DILocation(line: 92, column: 14, scope: !328)
!330 = !DILocation(line: 92, column: 22, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !3, line: 92, column: 9)
!332 = !DILocation(line: 92, column: 24, scope: !331)
!333 = !DILocation(line: 92, column: 9, scope: !328)
!334 = !DILocation(line: 93, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !3, line: 92, column: 47)
!336 = !DILocation(line: 93, column: 31, scope: !335)
!337 = !DILocation(line: 93, column: 37, scope: !335)
!338 = !DILocation(line: 93, column: 35, scope: !335)
!339 = !DILocation(line: 93, column: 40, scope: !335)
!340 = distinct !{!340, !334, !341}
!341 = !DILocation(line: 93, column: 46, scope: !335)
!342 = !DILocation(line: 94, column: 44, scope: !335)
!343 = !DILocation(line: 94, column: 54, scope: !335)
!344 = !DILocation(line: 94, column: 56, scope: !335)
!345 = !DILocation(line: 94, column: 57, scope: !335)
!346 = !DILocation(line: 94, column: 47, scope: !335)
!347 = !DILocation(line: 94, column: 17, scope: !335)
!348 = !DILocation(line: 95, column: 9, scope: !335)
!349 = !DILocation(line: 92, column: 40, scope: !331)
!350 = !DILocation(line: 92, column: 9, scope: !331)
!351 = distinct !{!351, !333, !352}
!352 = !DILocation(line: 95, column: 9, scope: !328)
!353 = !DILocation(line: 97, column: 9, scope: !219)
