; ModuleID = 'hamming-numbers-2.c'
source_filename = "hamming-numbers-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ham_t = type { [3 x i32], double }
%struct.__mpz_struct = type { i32, i32, i64* }

@n_hams = dso_local global i32 0, align 4, !dbg !0
@idx = dso_local global [3 x i32] zeroinitializer, align 4, !dbg !6
@fac = dso_local global [5 x i32] [i32 2, i32 3, i32 5, i32 7, i32 11], align 16, !dbg !12
@values = dso_local global [3 x %struct.ham_t] zeroinitializer, align 16, !dbg !17
@hams = common dso_local global %struct.ham_t* null, align 8, !dbg !49
@show_ham.das_ham = internal global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !26
@show_ham.tmp = internal global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !47
@.str = private unnamed_addr constant [5 x i8] c"%Zu\0A\00", align 1
@inc = common dso_local global [3 x [1024 x double]] zeroinitializer, align 16, !dbg !52
@.str.1 = private unnamed_addr constant [13 x i8] c"     1,691: \00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c" 1,000,000: \00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"10,000,000: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.ham_t* @get_ham(i32 %n) #0 !dbg !61 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ni = alloca i32, align 4
  %h = alloca %struct.ham_t*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %i, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %ni, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata %struct.ham_t** %h, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i32, i32* %n.addr, align 4, !dbg !72
  %dec = add nsw i32 %0, -1, !dbg !72
  store i32 %dec, i32* %n.addr, align 4, !dbg !72
  br label %while.cond, !dbg !73

while.cond:                                       ; preds = %for.end32, %entry
  %1 = load i32, i32* @n_hams, align 4, !dbg !74
  %2 = load i32, i32* %n.addr, align 4, !dbg !75
  %cmp = icmp slt i32 %1, %2, !dbg !76
  br i1 %cmp, label %while.body, label %while.end, !dbg !73

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %ni, align 4, !dbg !77
  store i32 1, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %while.body
  %3 = load i32, i32* %i, align 4, !dbg !82
  %cmp1 = icmp slt i32 %3, 3, !dbg !84
  br i1 %cmp1, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !86
  %idxprom = sext i32 %4 to i64, !dbg !88
  %arrayidx = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom, !dbg !88
  %v = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx, i32 0, i32 1, !dbg !89
  %5 = load double, double* %v, align 8, !dbg !89
  %6 = load i32, i32* %ni, align 4, !dbg !90
  %idxprom2 = sext i32 %6 to i64, !dbg !91
  %arrayidx3 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom2, !dbg !91
  %v4 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx3, i32 0, i32 1, !dbg !92
  %7 = load double, double* %v4, align 8, !dbg !92
  %cmp5 = fcmp olt double %5, %7, !dbg !93
  br i1 %cmp5, label %if.then, label %if.end, !dbg !94, !cf.info !95

if.then:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !96
  store i32 %8, i32* %ni, align 4, !dbg !97
  br label %if.end, !dbg !98

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !99
  %inc = add nsw i32 %9, 1, !dbg !99
  store i32 %inc, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %10 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !103
  %11 = load i32, i32* @n_hams, align 4, !dbg !104
  %inc6 = add nsw i32 %11, 1, !dbg !104
  store i32 %inc6, i32* @n_hams, align 4, !dbg !104
  %idx.ext = sext i32 %inc6 to i64, !dbg !105
  %add.ptr = getelementptr inbounds %struct.ham_t, %struct.ham_t* %10, i64 %idx.ext, !dbg !105
  store %struct.ham_t* %add.ptr, %struct.ham_t** %h, align 8, !dbg !106
  %12 = load i32, i32* %ni, align 4, !dbg !107
  %idxprom7 = sext i32 %12 to i64, !dbg !108
  %arrayidx8 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom7, !dbg !108
  %13 = bitcast %struct.ham_t* %add.ptr to i8*, !dbg !108
  %14 = bitcast %struct.ham_t* %arrayidx8 to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 24, i1 false), !dbg !108
  store i32 0, i32* %ni, align 4, !dbg !109
  br label %for.cond9, !dbg !111

for.cond9:                                        ; preds = %for.inc30, %for.end
  %15 = load i32, i32* %ni, align 4, !dbg !112
  %cmp10 = icmp slt i32 %15, 3, !dbg !114
  br i1 %cmp10, label %for.body11, label %for.end32, !dbg !115

for.body11:                                       ; preds = %for.cond9
  %16 = load i32, i32* %ni, align 4, !dbg !116
  %idx.ext12 = sext i32 %16 to i64, !dbg !119
  %add.ptr13 = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext12, !dbg !119
  %17 = load %struct.ham_t*, %struct.ham_t** %h, align 8, !dbg !120
  %call = call i32 @_eq(%struct.ham_t* %add.ptr13, %struct.ham_t* %17), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.end15, label %if.then14, !dbg !122, !cf.info !95

if.then14:                                        ; preds = %for.body11
  br label %for.inc30, !dbg !123

if.end15:                                         ; preds = %for.body11
  %18 = load i32, i32* %ni, align 4, !dbg !124
  %idxprom16 = sext i32 %18 to i64, !dbg !125
  %arrayidx17 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom16, !dbg !125
  %19 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !126
  %20 = load i32, i32* %ni, align 4, !dbg !127
  %idxprom18 = sext i32 %20 to i64, !dbg !128
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* @idx, i64 0, i64 %idxprom18, !dbg !128
  %21 = load i32, i32* %arrayidx19, align 4, !dbg !129
  %inc20 = add nsw i32 %21, 1, !dbg !129
  store i32 %inc20, i32* %arrayidx19, align 4, !dbg !129
  %idxprom21 = sext i32 %inc20 to i64, !dbg !126
  %arrayidx22 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %19, i64 %idxprom21, !dbg !126
  %22 = bitcast %struct.ham_t* %arrayidx17 to i8*, !dbg !126
  %23 = bitcast %struct.ham_t* %arrayidx22 to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %22, i8* align 8 %23, i64 24, i1 false), !dbg !126
  %24 = load i32, i32* %ni, align 4, !dbg !130
  %idxprom23 = sext i32 %24 to i64, !dbg !131
  %arrayidx24 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom23, !dbg !131
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx24, i32 0, i32 0, !dbg !132
  %25 = load i32, i32* %ni, align 4, !dbg !133
  %idxprom25 = sext i32 %25 to i64, !dbg !131
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom25, !dbg !131
  %26 = load i32, i32* %arrayidx26, align 4, !dbg !134
  %inc27 = add nsw i32 %26, 1, !dbg !134
  store i32 %inc27, i32* %arrayidx26, align 4, !dbg !134
  %27 = load i32, i32* %ni, align 4, !dbg !135
  %idx.ext28 = sext i32 %27 to i64, !dbg !136
  %add.ptr29 = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext28, !dbg !136
  call void @_setv(%struct.ham_t* %add.ptr29), !dbg !137
  br label %for.inc30, !dbg !138

for.inc30:                                        ; preds = %if.end15, %if.then14
  %28 = load i32, i32* %ni, align 4, !dbg !139
  %inc31 = add nsw i32 %28, 1, !dbg !139
  store i32 %inc31, i32* %ni, align 4, !dbg !139
  br label %for.cond9, !dbg !140, !llvm.loop !141

for.end32:                                        ; preds = %for.cond9
  br label %while.cond, !dbg !73, !llvm.loop !143

while.end:                                        ; preds = %while.cond
  %29 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !145
  %30 = load i32, i32* %n.addr, align 4, !dbg !146
  %idx.ext33 = sext i32 %30 to i64, !dbg !147
  %add.ptr34 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %29, i64 %idx.ext33, !dbg !147
  ret %struct.ham_t* %add.ptr34, !dbg !148
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @_eq(%struct.ham_t*, %struct.ham_t*) #3

declare dso_local void @_setv(%struct.ham_t*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_ham(%struct.ham_t* %h) #0 !dbg !28 {
entry:
  %h.addr = alloca %struct.ham_t*, align 8
  %i = alloca i32, align 4
  store %struct.ham_t* %h, %struct.ham_t** %h.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.ham_t** %h.addr, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %i, metadata !151, metadata !DIExpression()), !dbg !152
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), i64 1), !dbg !153
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0), i64 1), !dbg !154
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !158
  %cmp = icmp slt i32 %0, 3, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !162
  %idxprom = sext i32 %1 to i64, !dbg !164
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @fac, i64 0, i64 %idxprom, !dbg !164
  %2 = load i32, i32* %arrayidx, align 4, !dbg !164
  %conv = sext i32 %2 to i64, !dbg !164
  %3 = load %struct.ham_t*, %struct.ham_t** %h.addr, align 8, !dbg !165
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %3, i32 0, i32 0, !dbg !166
  %4 = load i32, i32* %i, align 4, !dbg !167
  %idxprom1 = sext i32 %4 to i64, !dbg !165
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom1, !dbg !165
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !165
  %conv3 = sext i32 %5 to i64, !dbg !165
  call void @__gmpz_ui_pow_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0), i64 %conv, i64 %conv3), !dbg !168
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0)), !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !171
  %inc = add nsw i32 %6, 1, !dbg !171
  store i32 %inc, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0)), !dbg !175
  ret void, !dbg !176
}

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #3

declare dso_local void @__gmpz_ui_pow_ui(%struct.__mpz_struct*, i64, i64) #3

declare dso_local void @__gmpz_mul(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %j, metadata !182, metadata !DIExpression()), !dbg !183
  %call = call noalias i8* @malloc(i64 402653184) #5, !dbg !184
  %0 = bitcast i8* %call to %struct.ham_t*, !dbg !184
  store %struct.ham_t* %0, %struct.ham_t** @hams, align 8, !dbg !185
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc21, %entry
  %1 = load i32, i32* %i, align 4, !dbg !189
  %cmp = icmp slt i32 %1, 3, !dbg !191
  br i1 %cmp, label %for.body, label %for.end23, !dbg !192

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !193
  %idxprom = sext i32 %2 to i64, !dbg !195
  %arrayidx = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom, !dbg !195
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx, i32 0, i32 0, !dbg !196
  %3 = load i32, i32* %i, align 4, !dbg !197
  %idxprom1 = sext i32 %3 to i64, !dbg !195
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom1, !dbg !195
  store i32 1, i32* %arrayidx2, align 4, !dbg !198
  %4 = load i32, i32* %i, align 4, !dbg !199
  %idxprom3 = sext i32 %4 to i64, !dbg !200
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* @fac, i64 0, i64 %idxprom3, !dbg !200
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !200
  %conv = sitofp i32 %5 to double, !dbg !200
  %call5 = call double @log(double %conv) #5, !dbg !201
  %6 = load i32, i32* %i, align 4, !dbg !202
  %idxprom6 = sext i32 %6 to i64, !dbg !203
  %arrayidx7 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom6, !dbg !203
  %arrayidx8 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx7, i64 0, i64 1, !dbg !203
  store double %call5, double* %arrayidx8, align 8, !dbg !204
  %7 = load i32, i32* %i, align 4, !dbg !205
  %idx.ext = sext i32 %7 to i64, !dbg !206
  %add.ptr = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext, !dbg !206
  call void @_setv(%struct.ham_t* %add.ptr), !dbg !207
  store i32 2, i32* %j, align 4, !dbg !208
  br label %for.cond9, !dbg !210

for.cond9:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %j, align 4, !dbg !211
  %cmp10 = icmp slt i32 %8, 1024, !dbg !213
  br i1 %cmp10, label %for.body12, label %for.end, !dbg !214

for.body12:                                       ; preds = %for.cond9
  %9 = load i32, i32* %j, align 4, !dbg !215
  %conv13 = sitofp i32 %9 to double, !dbg !215
  %10 = load i32, i32* %i, align 4, !dbg !216
  %idxprom14 = sext i32 %10 to i64, !dbg !217
  %arrayidx15 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom14, !dbg !217
  %arrayidx16 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx15, i64 0, i64 1, !dbg !217
  %11 = load double, double* %arrayidx16, align 8, !dbg !217
  %mul = fmul double %conv13, %11, !dbg !218
  %12 = load i32, i32* %i, align 4, !dbg !219
  %idxprom17 = sext i32 %12 to i64, !dbg !220
  %arrayidx18 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom17, !dbg !220
  %13 = load i32, i32* %j, align 4, !dbg !221
  %idxprom19 = sext i32 %13 to i64, !dbg !220
  %arrayidx20 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx18, i64 0, i64 %idxprom19, !dbg !220
  store double %mul, double* %arrayidx20, align 8, !dbg !222
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body12
  %14 = load i32, i32* %j, align 4, !dbg !223
  %inc = add nsw i32 %14, 1, !dbg !223
  store i32 %inc, i32* %j, align 4, !dbg !223
  br label %for.cond9, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond9
  br label %for.inc21, !dbg !227

for.inc21:                                        ; preds = %for.end
  %15 = load i32, i32* %i, align 4, !dbg !228
  %inc22 = add nsw i32 %15, 1, !dbg !228
  store i32 %inc22, i32* %i, align 4, !dbg !228
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end23:                                        ; preds = %for.cond
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0)), !dbg !232
  %call25 = call %struct.ham_t* @get_ham(i32 1691), !dbg !233
  call void @show_ham(%struct.ham_t* %call25), !dbg !234
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !235
  %call27 = call %struct.ham_t* @get_ham(i32 1000000), !dbg !236
  call void @show_ham(%struct.ham_t* %call27), !dbg !237
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0)), !dbg !238
  %call29 = call %struct.ham_t* @get_ham(i32 10000000), !dbg !239
  call void @show_ham(%struct.ham_t* %call29), !dbg !240
  ret i32 0, !dbg !241
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local double @log(double) #4

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "n_hams", scope: !2, file: !3, line: 11, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hamming-numbers-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hamming-numbers")
!4 = !{}
!5 = !{!0, !6, !12, !17, !26, !47, !49, !52}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "idx", scope: !2, file: !3, line: 11, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 96, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "fac", scope: !2, file: !3, line: 11, type: !14, isLocal: false, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 160, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 5)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "values", scope: !2, file: !3, line: 20, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 576, elements: !10)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "ham_t", file: !3, line: 18, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 15, size: 192, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !21, file: !3, line: 16, baseType: !8, size: 96)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !21, file: !3, line: 17, baseType: !25, size: 64, offset: 128)
!25 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "das_ham", scope: !28, file: !3, line: 66, type: !33, isLocal: true, isDefinition: true)
!28 = distinct !DISubprogram(name: "show_ham", scope: !3, file: !3, line: 64, type: !29, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "ham", file: !3, line: 18, baseType: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !34, line: 164, baseType: !35)
!34 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 128, elements: !45)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !34, line: 158, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 150, size: 128, elements: !38)
!38 = !{!39, !40, !41}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !37, file: !34, line: 152, baseType: !9, size: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !37, file: !34, line: 154, baseType: !9, size: 32, offset: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !37, file: !34, line: 157, baseType: !42, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !34, line: 141, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !{!46}
!46 = !DISubrange(count: 1)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "tmp", scope: !28, file: !3, line: 66, type: !33, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "hams", scope: !2, file: !3, line: 20, type: !51, isLocal: false, isDefinition: true)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "inc", scope: !2, file: !3, line: 21, type: !54, isLocal: false, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 196608, elements: !55)
!55 = !{!11, !56}
!56 = !DISubrange(count: 1024)
!57 = !{i32 7, !"Dwarf Version", i32 4}
!58 = !{i32 2, !"Debug Info Version", i32 3}
!59 = !{i32 1, !"wchar_size", i32 4}
!60 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!61 = distinct !DISubprogram(name: "get_ham", scope: !3, file: !3, line: 40, type: !62, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!31, !9}
!64 = !DILocalVariable(name: "n", arg: 1, scope: !61, file: !3, line: 40, type: !9)
!65 = !DILocation(line: 40, column: 17, scope: !61)
!66 = !DILocalVariable(name: "i", scope: !61, file: !3, line: 42, type: !9)
!67 = !DILocation(line: 42, column: 6, scope: !61)
!68 = !DILocalVariable(name: "ni", scope: !61, file: !3, line: 42, type: !9)
!69 = !DILocation(line: 42, column: 9, scope: !61)
!70 = !DILocalVariable(name: "h", scope: !61, file: !3, line: 43, type: !31)
!71 = !DILocation(line: 43, column: 6, scope: !61)
!72 = !DILocation(line: 45, column: 3, scope: !61)
!73 = !DILocation(line: 46, column: 2, scope: !61)
!74 = !DILocation(line: 46, column: 9, scope: !61)
!75 = !DILocation(line: 46, column: 18, scope: !61)
!76 = !DILocation(line: 46, column: 16, scope: !61)
!77 = !DILocation(line: 47, column: 11, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !3, line: 47, column: 3)
!79 = distinct !DILexicalBlock(scope: !61, file: !3, line: 46, column: 21)
!80 = !DILocation(line: 47, column: 18, scope: !78)
!81 = !DILocation(line: 47, column: 8, scope: !78)
!82 = !DILocation(line: 47, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !3, line: 47, column: 3)
!84 = !DILocation(line: 47, column: 25, scope: !83)
!85 = !DILocation(line: 47, column: 3, scope: !78)
!86 = !DILocation(line: 48, column: 15, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !3, line: 48, column: 8)
!88 = !DILocation(line: 48, column: 8, scope: !87)
!89 = !DILocation(line: 48, column: 18, scope: !87)
!90 = !DILocation(line: 48, column: 29, scope: !87)
!91 = !DILocation(line: 48, column: 22, scope: !87)
!92 = !DILocation(line: 48, column: 33, scope: !87)
!93 = !DILocation(line: 48, column: 20, scope: !87)
!94 = !DILocation(line: 48, column: 8, scope: !83)
!95 = !{!"if"}
!96 = !DILocation(line: 49, column: 10, scope: !87)
!97 = !DILocation(line: 49, column: 8, scope: !87)
!98 = !DILocation(line: 49, column: 5, scope: !87)
!99 = !DILocation(line: 47, column: 32, scope: !83)
!100 = !DILocation(line: 47, column: 3, scope: !83)
!101 = distinct !{!101, !85, !102}
!102 = !DILocation(line: 49, column: 10, scope: !78)
!103 = !DILocation(line: 51, column: 9, scope: !79)
!104 = !DILocation(line: 51, column: 16, scope: !79)
!105 = !DILocation(line: 51, column: 14, scope: !79)
!106 = !DILocation(line: 51, column: 7, scope: !79)
!107 = !DILocation(line: 51, column: 35, scope: !79)
!108 = !DILocation(line: 51, column: 28, scope: !79)
!109 = !DILocation(line: 53, column: 11, scope: !110)
!110 = distinct !DILexicalBlock(scope: !79, file: !3, line: 53, column: 3)
!111 = !DILocation(line: 53, column: 8, scope: !110)
!112 = !DILocation(line: 53, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !3, line: 53, column: 3)
!114 = !DILocation(line: 53, column: 19, scope: !113)
!115 = !DILocation(line: 53, column: 3, scope: !110)
!116 = !DILocation(line: 54, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !3, line: 54, column: 8)
!118 = distinct !DILexicalBlock(scope: !113, file: !3, line: 53, column: 31)
!119 = !DILocation(line: 54, column: 21, scope: !117)
!120 = !DILocation(line: 54, column: 27, scope: !117)
!121 = !DILocation(line: 54, column: 10, scope: !117)
!122 = !DILocation(line: 54, column: 8, scope: !118)
!123 = !DILocation(line: 54, column: 31, scope: !117)
!124 = !DILocation(line: 55, column: 11, scope: !118)
!125 = !DILocation(line: 55, column: 4, scope: !118)
!126 = !DILocation(line: 55, column: 17, scope: !118)
!127 = !DILocation(line: 55, column: 28, scope: !118)
!128 = !DILocation(line: 55, column: 24, scope: !118)
!129 = !DILocation(line: 55, column: 22, scope: !118)
!130 = !DILocation(line: 56, column: 11, scope: !118)
!131 = !DILocation(line: 56, column: 4, scope: !118)
!132 = !DILocation(line: 56, column: 15, scope: !118)
!133 = !DILocation(line: 56, column: 17, scope: !118)
!134 = !DILocation(line: 56, column: 20, scope: !118)
!135 = !DILocation(line: 57, column: 19, scope: !118)
!136 = !DILocation(line: 57, column: 17, scope: !118)
!137 = !DILocation(line: 57, column: 4, scope: !118)
!138 = !DILocation(line: 58, column: 3, scope: !118)
!139 = !DILocation(line: 53, column: 27, scope: !113)
!140 = !DILocation(line: 53, column: 3, scope: !113)
!141 = distinct !{!141, !115, !142}
!142 = !DILocation(line: 58, column: 3, scope: !110)
!143 = distinct !{!143, !73, !144}
!144 = !DILocation(line: 59, column: 2, scope: !61)
!145 = !DILocation(line: 61, column: 9, scope: !61)
!146 = !DILocation(line: 61, column: 16, scope: !61)
!147 = !DILocation(line: 61, column: 14, scope: !61)
!148 = !DILocation(line: 61, column: 2, scope: !61)
!149 = !DILocalVariable(name: "h", arg: 1, scope: !28, file: !3, line: 64, type: !31)
!150 = !DILocation(line: 64, column: 19, scope: !28)
!151 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 67, type: !9)
!152 = !DILocation(line: 67, column: 6, scope: !28)
!153 = !DILocation(line: 69, column: 3, scope: !28)
!154 = !DILocation(line: 70, column: 2, scope: !28)
!155 = !DILocation(line: 71, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !28, file: !3, line: 71, column: 2)
!157 = !DILocation(line: 71, column: 7, scope: !156)
!158 = !DILocation(line: 71, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 71, column: 2)
!160 = !DILocation(line: 71, column: 16, scope: !159)
!161 = !DILocation(line: 71, column: 2, scope: !156)
!162 = !DILocation(line: 72, column: 26, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !3, line: 71, column: 27)
!164 = !DILocation(line: 72, column: 22, scope: !163)
!165 = !DILocation(line: 72, column: 30, scope: !163)
!166 = !DILocation(line: 72, column: 33, scope: !163)
!167 = !DILocation(line: 72, column: 35, scope: !163)
!168 = !DILocation(line: 72, column: 3, scope: !163)
!169 = !DILocation(line: 73, column: 3, scope: !163)
!170 = !DILocation(line: 74, column: 2, scope: !163)
!171 = !DILocation(line: 71, column: 23, scope: !159)
!172 = !DILocation(line: 71, column: 2, scope: !159)
!173 = distinct !{!173, !161, !174}
!174 = !DILocation(line: 74, column: 2, scope: !156)
!175 = !DILocation(line: 75, column: 2, scope: !28)
!176 = !DILocation(line: 76, column: 1, scope: !28)
!177 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 78, type: !178, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DISubroutineType(types: !179)
!179 = !{!9}
!180 = !DILocalVariable(name: "i", scope: !177, file: !3, line: 80, type: !9)
!181 = !DILocation(line: 80, column: 6, scope: !177)
!182 = !DILocalVariable(name: "j", scope: !177, file: !3, line: 80, type: !9)
!183 = !DILocation(line: 80, column: 9, scope: !177)
!184 = !DILocation(line: 81, column: 9, scope: !177)
!185 = !DILocation(line: 81, column: 7, scope: !177)
!186 = !DILocation(line: 83, column: 9, scope: !187)
!187 = distinct !DILexicalBlock(scope: !177, file: !3, line: 83, column: 2)
!188 = !DILocation(line: 83, column: 7, scope: !187)
!189 = !DILocation(line: 83, column: 14, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !3, line: 83, column: 2)
!191 = !DILocation(line: 83, column: 16, scope: !190)
!192 = !DILocation(line: 83, column: 2, scope: !187)
!193 = !DILocation(line: 84, column: 10, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !3, line: 83, column: 27)
!195 = !DILocation(line: 84, column: 3, scope: !194)
!196 = !DILocation(line: 84, column: 13, scope: !194)
!197 = !DILocation(line: 84, column: 15, scope: !194)
!198 = !DILocation(line: 84, column: 18, scope: !194)
!199 = !DILocation(line: 85, column: 23, scope: !194)
!200 = !DILocation(line: 85, column: 19, scope: !194)
!201 = !DILocation(line: 85, column: 15, scope: !194)
!202 = !DILocation(line: 85, column: 7, scope: !194)
!203 = !DILocation(line: 85, column: 3, scope: !194)
!204 = !DILocation(line: 85, column: 13, scope: !194)
!205 = !DILocation(line: 86, column: 18, scope: !194)
!206 = !DILocation(line: 86, column: 16, scope: !194)
!207 = !DILocation(line: 86, column: 3, scope: !194)
!208 = !DILocation(line: 88, column: 10, scope: !209)
!209 = distinct !DILexicalBlock(scope: !194, file: !3, line: 88, column: 3)
!210 = !DILocation(line: 88, column: 8, scope: !209)
!211 = !DILocation(line: 88, column: 15, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !3, line: 88, column: 3)
!213 = !DILocation(line: 88, column: 17, scope: !212)
!214 = !DILocation(line: 88, column: 3, scope: !209)
!215 = !DILocation(line: 89, column: 16, scope: !212)
!216 = !DILocation(line: 89, column: 24, scope: !212)
!217 = !DILocation(line: 89, column: 20, scope: !212)
!218 = !DILocation(line: 89, column: 18, scope: !212)
!219 = !DILocation(line: 89, column: 8, scope: !212)
!220 = !DILocation(line: 89, column: 4, scope: !212)
!221 = !DILocation(line: 89, column: 11, scope: !212)
!222 = !DILocation(line: 89, column: 14, scope: !212)
!223 = !DILocation(line: 88, column: 29, scope: !212)
!224 = !DILocation(line: 88, column: 3, scope: !212)
!225 = distinct !{!225, !214, !226}
!226 = !DILocation(line: 89, column: 28, scope: !209)
!227 = !DILocation(line: 90, column: 2, scope: !194)
!228 = !DILocation(line: 83, column: 23, scope: !190)
!229 = !DILocation(line: 83, column: 2, scope: !190)
!230 = distinct !{!230, !192, !231}
!231 = !DILocation(line: 90, column: 2, scope: !187)
!232 = !DILocation(line: 92, column: 2, scope: !177)
!233 = !DILocation(line: 92, column: 35, scope: !177)
!234 = !DILocation(line: 92, column: 26, scope: !177)
!235 = !DILocation(line: 93, column: 2, scope: !177)
!236 = !DILocation(line: 93, column: 35, scope: !177)
!237 = !DILocation(line: 93, column: 26, scope: !177)
!238 = !DILocation(line: 94, column: 2, scope: !177)
!239 = !DILocation(line: 94, column: 35, scope: !177)
!240 = !DILocation(line: 94, column: 26, scope: !177)
!241 = !DILocation(line: 95, column: 2, scope: !177)
