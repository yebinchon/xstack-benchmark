; ModuleID = 'hamming-numbers-2.ll'
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
  call void @llvm.dbg.value(metadata i32 %n, metadata !64, metadata !DIExpression()), !dbg !65
  %dec = add nsw i32 %n, -1, !dbg !66
  call void @llvm.dbg.value(metadata i32 %dec, metadata !64, metadata !DIExpression()), !dbg !65
  br label %while.cond, !dbg !67

while.cond:                                       ; preds = %for.end32, %entry
  %0 = load i32, i32* @n_hams, align 4, !dbg !68
  %cmp = icmp slt i32 %0, %dec, !dbg !69
  br i1 %cmp, label %while.body, label %while.end, !dbg !67

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !70, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.value(metadata i32 1, metadata !71, metadata !DIExpression()), !dbg !65
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %while.body
  %ni.0 = phi i32 [ 0, %while.body ], [ %ni.1, %for.inc ], !dbg !75
  %i.0 = phi i32 [ 1, %while.body ], [ %inc, %for.inc ], !dbg !75
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !71, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.value(metadata i32 %ni.0, metadata !70, metadata !DIExpression()), !dbg !65
  %cmp1 = icmp slt i32 %i.0, 3, !dbg !76
  br i1 %cmp1, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !79
  %arrayidx = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom, !dbg !79
  %v = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx, i32 0, i32 1, !dbg !81
  %1 = load double, double* %v, align 8, !dbg !81
  %idxprom2 = sext i32 %ni.0 to i64, !dbg !82
  %arrayidx3 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom2, !dbg !82
  %v4 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx3, i32 0, i32 1, !dbg !83
  %2 = load double, double* %v4, align 8, !dbg !83
  %cmp5 = fcmp olt double %1, %2, !dbg !84
  br i1 %cmp5, label %if.then, label %if.end, !dbg !85, !cf.info !86

if.then:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !70, metadata !DIExpression()), !dbg !65
  br label %if.end, !dbg !87

if.end:                                           ; preds = %if.then, %for.body
  %ni.1 = phi i32 [ %i.0, %if.then ], [ %ni.0, %for.body ], !dbg !75
  call void @llvm.dbg.value(metadata i32 %ni.1, metadata !70, metadata !DIExpression()), !dbg !65
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !88
  call void @llvm.dbg.value(metadata i32 %inc, metadata !71, metadata !DIExpression()), !dbg !65
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %3 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !92
  %4 = load i32, i32* @n_hams, align 4, !dbg !93
  %inc6 = add nsw i32 %4, 1, !dbg !93
  store i32 %inc6, i32* @n_hams, align 4, !dbg !93
  %idx.ext = sext i32 %inc6 to i64, !dbg !94
  %add.ptr = getelementptr inbounds %struct.ham_t, %struct.ham_t* %3, i64 %idx.ext, !dbg !94
  call void @llvm.dbg.value(metadata %struct.ham_t* %add.ptr, metadata !95, metadata !DIExpression()), !dbg !65
  %idxprom7 = sext i32 %ni.0 to i64, !dbg !96
  %arrayidx8 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom7, !dbg !96
  %5 = bitcast %struct.ham_t* %add.ptr to i8*, !dbg !96
  %6 = bitcast %struct.ham_t* %arrayidx8 to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 24, i1 false), !dbg !96
  call void @llvm.dbg.value(metadata i32 0, metadata !70, metadata !DIExpression()), !dbg !65
  br label %for.cond9, !dbg !97

for.cond9:                                        ; preds = %for.inc30, %for.end
  %ni.2 = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ], !dbg !99
  call void @llvm.dbg.value(metadata i32 %ni.2, metadata !70, metadata !DIExpression()), !dbg !65
  %cmp10 = icmp slt i32 %ni.2, 3, !dbg !100
  br i1 %cmp10, label %for.body11, label %for.end32, !dbg !102

for.body11:                                       ; preds = %for.cond9
  %idx.ext12 = sext i32 %ni.2 to i64, !dbg !103
  %add.ptr13 = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext12, !dbg !103
  %call = call i32 @_eq(%struct.ham_t* %add.ptr13, %struct.ham_t* %add.ptr), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.end15, label %if.then14, !dbg !107, !cf.info !86

if.then14:                                        ; preds = %for.body11
  br label %for.inc30, !dbg !108

if.end15:                                         ; preds = %for.body11
  %idxprom16 = sext i32 %ni.2 to i64, !dbg !109
  %arrayidx17 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom16, !dbg !109
  %7 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !110
  %idxprom18 = sext i32 %ni.2 to i64, !dbg !111
  %arrayidx19 = getelementptr inbounds [3 x i32], [3 x i32]* @idx, i64 0, i64 %idxprom18, !dbg !111
  %8 = load i32, i32* %arrayidx19, align 4, !dbg !112
  %inc20 = add nsw i32 %8, 1, !dbg !112
  store i32 %inc20, i32* %arrayidx19, align 4, !dbg !112
  %idxprom21 = sext i32 %inc20 to i64, !dbg !110
  %arrayidx22 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %7, i64 %idxprom21, !dbg !110
  %9 = bitcast %struct.ham_t* %arrayidx17 to i8*, !dbg !110
  %10 = bitcast %struct.ham_t* %arrayidx22 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 8 %10, i64 24, i1 false), !dbg !110
  %idxprom23 = sext i32 %ni.2 to i64, !dbg !113
  %arrayidx24 = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom23, !dbg !113
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx24, i32 0, i32 0, !dbg !114
  %idxprom25 = sext i32 %ni.2 to i64, !dbg !113
  %arrayidx26 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom25, !dbg !113
  %11 = load i32, i32* %arrayidx26, align 4, !dbg !115
  %inc27 = add nsw i32 %11, 1, !dbg !115
  store i32 %inc27, i32* %arrayidx26, align 4, !dbg !115
  %idx.ext28 = sext i32 %ni.2 to i64, !dbg !116
  %add.ptr29 = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext28, !dbg !116
  call void @_setv(%struct.ham_t* %add.ptr29), !dbg !117
  br label %for.inc30, !dbg !118

for.inc30:                                        ; preds = %if.end15, %if.then14
  %inc31 = add nsw i32 %ni.2, 1, !dbg !119
  call void @llvm.dbg.value(metadata i32 %inc31, metadata !70, metadata !DIExpression()), !dbg !65
  br label %for.cond9, !dbg !120, !llvm.loop !121

for.end32:                                        ; preds = %for.cond9
  br label %while.cond, !dbg !67, !llvm.loop !123

while.end:                                        ; preds = %while.cond
  %12 = load %struct.ham_t*, %struct.ham_t** @hams, align 8, !dbg !125
  %idx.ext33 = sext i32 %dec to i64, !dbg !126
  %add.ptr34 = getelementptr inbounds %struct.ham_t, %struct.ham_t* %12, i64 %idx.ext33, !dbg !126
  ret %struct.ham_t* %add.ptr34, !dbg !127
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
  call void @llvm.dbg.value(metadata %struct.ham_t* %h, metadata !128, metadata !DIExpression()), !dbg !129
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), i64 1), !dbg !130
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0), i64 1), !dbg !131
  call void @llvm.dbg.value(metadata i32 0, metadata !132, metadata !DIExpression()), !dbg !129
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !135
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !132, metadata !DIExpression()), !dbg !129
  %cmp = icmp slt i32 %i.0, 3, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @fac, i64 0, i64 %idxprom, !dbg !139
  %0 = load i32, i32* %arrayidx, align 4, !dbg !139
  %conv = sext i32 %0 to i64, !dbg !139
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %h, i32 0, i32 0, !dbg !141
  %idxprom1 = sext i32 %i.0 to i64, !dbg !142
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom1, !dbg !142
  %1 = load i32, i32* %arrayidx2, align 4, !dbg !142
  %conv3 = sext i32 %1 to i64, !dbg !142
  call void @__gmpz_ui_pow_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0), i64 %conv, i64 %conv3), !dbg !143
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.tmp, i64 0, i64 0)), !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !146
  call void @llvm.dbg.value(metadata i32 %inc, metadata !132, metadata !DIExpression()), !dbg !129
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @show_ham.das_ham, i64 0, i64 0)), !dbg !150
  ret void, !dbg !151
}

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #3

declare dso_local void @__gmpz_ui_pow_ui(%struct.__mpz_struct*, i64, i64) #3

declare dso_local void @__gmpz_mul(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !152 {
entry:
  %call = call noalias i8* @malloc(i64 402653184) #5, !dbg !155
  %0 = bitcast i8* %call to %struct.ham_t*, !dbg !155
  store %struct.ham_t* %0, %struct.ham_t** @hams, align 8, !dbg !156
  call void @llvm.dbg.value(metadata i32 0, metadata !157, metadata !DIExpression()), !dbg !158
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc21, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc22, %for.inc21 ], !dbg !161
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !157, metadata !DIExpression()), !dbg !158
  %cmp = icmp slt i32 %i.0, 3, !dbg !162
  br i1 %cmp, label %for.body, label %for.end23, !dbg !164

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 %idxprom, !dbg !165
  %e = getelementptr inbounds %struct.ham_t, %struct.ham_t* %arrayidx, i32 0, i32 0, !dbg !167
  %idxprom1 = sext i32 %i.0 to i64, !dbg !165
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %e, i64 0, i64 %idxprom1, !dbg !165
  store i32 1, i32* %arrayidx2, align 4, !dbg !168
  %idxprom3 = sext i32 %i.0 to i64, !dbg !169
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* @fac, i64 0, i64 %idxprom3, !dbg !169
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !169
  %conv = sitofp i32 %1 to double, !dbg !169
  %call5 = call double @log(double %conv) #5, !dbg !170
  %idxprom6 = sext i32 %i.0 to i64, !dbg !171
  %arrayidx7 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom6, !dbg !171
  %arrayidx8 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx7, i64 0, i64 1, !dbg !171
  store double %call5, double* %arrayidx8, align 8, !dbg !172
  %idx.ext = sext i32 %i.0 to i64, !dbg !173
  %add.ptr = getelementptr inbounds %struct.ham_t, %struct.ham_t* getelementptr inbounds ([3 x %struct.ham_t], [3 x %struct.ham_t]* @values, i64 0, i64 0), i64 %idx.ext, !dbg !173
  call void @_setv(%struct.ham_t* %add.ptr), !dbg !174
  call void @llvm.dbg.value(metadata i32 2, metadata !175, metadata !DIExpression()), !dbg !158
  br label %for.cond9, !dbg !176

for.cond9:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 2, %for.body ], [ %inc, %for.inc ], !dbg !178
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !175, metadata !DIExpression()), !dbg !158
  %cmp10 = icmp slt i32 %j.0, 1024, !dbg !179
  br i1 %cmp10, label %for.body12, label %for.end, !dbg !181

for.body12:                                       ; preds = %for.cond9
  %conv13 = sitofp i32 %j.0 to double, !dbg !182
  %idxprom14 = sext i32 %i.0 to i64, !dbg !183
  %arrayidx15 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom14, !dbg !183
  %arrayidx16 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx15, i64 0, i64 1, !dbg !183
  %2 = load double, double* %arrayidx16, align 8, !dbg !183
  %mul = fmul double %conv13, %2, !dbg !184
  %idxprom17 = sext i32 %i.0 to i64, !dbg !185
  %arrayidx18 = getelementptr inbounds [3 x [1024 x double]], [3 x [1024 x double]]* @inc, i64 0, i64 %idxprom17, !dbg !185
  %idxprom19 = sext i32 %j.0 to i64, !dbg !185
  %arrayidx20 = getelementptr inbounds [1024 x double], [1024 x double]* %arrayidx18, i64 0, i64 %idxprom19, !dbg !185
  store double %mul, double* %arrayidx20, align 8, !dbg !186
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body12
  %inc = add nsw i32 %j.0, 1, !dbg !187
  call void @llvm.dbg.value(metadata i32 %inc, metadata !175, metadata !DIExpression()), !dbg !158
  br label %for.cond9, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond9
  br label %for.inc21, !dbg !191

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %i.0, 1, !dbg !192
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !157, metadata !DIExpression()), !dbg !158
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end23:                                        ; preds = %for.cond
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0)), !dbg !196
  %call25 = call %struct.ham_t* @get_ham(i32 1691), !dbg !197
  call void @show_ham(%struct.ham_t* %call25), !dbg !198
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !199
  %call27 = call %struct.ham_t* @get_ham(i32 1000000), !dbg !200
  call void @show_ham(%struct.ham_t* %call27), !dbg !201
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  %call29 = call %struct.ham_t* @get_ham(i32 10000000), !dbg !203
  call void @show_ham(%struct.ham_t* %call29), !dbg !204
  ret i32 0, !dbg !205
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local double @log(double) #4

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!65 = !DILocation(line: 0, scope: !61)
!66 = !DILocation(line: 45, column: 3, scope: !61)
!67 = !DILocation(line: 46, column: 2, scope: !61)
!68 = !DILocation(line: 46, column: 9, scope: !61)
!69 = !DILocation(line: 46, column: 16, scope: !61)
!70 = !DILocalVariable(name: "ni", scope: !61, file: !3, line: 42, type: !9)
!71 = !DILocalVariable(name: "i", scope: !61, file: !3, line: 42, type: !9)
!72 = !DILocation(line: 47, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !3, line: 47, column: 3)
!74 = distinct !DILexicalBlock(scope: !61, file: !3, line: 46, column: 21)
!75 = !DILocation(line: 0, scope: !73)
!76 = !DILocation(line: 47, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !3, line: 47, column: 3)
!78 = !DILocation(line: 47, column: 3, scope: !73)
!79 = !DILocation(line: 48, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 48, column: 8)
!81 = !DILocation(line: 48, column: 18, scope: !80)
!82 = !DILocation(line: 48, column: 22, scope: !80)
!83 = !DILocation(line: 48, column: 33, scope: !80)
!84 = !DILocation(line: 48, column: 20, scope: !80)
!85 = !DILocation(line: 48, column: 8, scope: !77)
!86 = !{!"if"}
!87 = !DILocation(line: 49, column: 5, scope: !80)
!88 = !DILocation(line: 47, column: 32, scope: !77)
!89 = !DILocation(line: 47, column: 3, scope: !77)
!90 = distinct !{!90, !78, !91}
!91 = !DILocation(line: 49, column: 10, scope: !73)
!92 = !DILocation(line: 51, column: 9, scope: !74)
!93 = !DILocation(line: 51, column: 16, scope: !74)
!94 = !DILocation(line: 51, column: 14, scope: !74)
!95 = !DILocalVariable(name: "h", scope: !61, file: !3, line: 43, type: !31)
!96 = !DILocation(line: 51, column: 28, scope: !74)
!97 = !DILocation(line: 53, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !74, file: !3, line: 53, column: 3)
!99 = !DILocation(line: 0, scope: !98)
!100 = !DILocation(line: 53, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !3, line: 53, column: 3)
!102 = !DILocation(line: 53, column: 3, scope: !98)
!103 = !DILocation(line: 54, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !3, line: 54, column: 8)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 53, column: 31)
!106 = !DILocation(line: 54, column: 10, scope: !104)
!107 = !DILocation(line: 54, column: 8, scope: !105)
!108 = !DILocation(line: 54, column: 31, scope: !104)
!109 = !DILocation(line: 55, column: 4, scope: !105)
!110 = !DILocation(line: 55, column: 17, scope: !105)
!111 = !DILocation(line: 55, column: 24, scope: !105)
!112 = !DILocation(line: 55, column: 22, scope: !105)
!113 = !DILocation(line: 56, column: 4, scope: !105)
!114 = !DILocation(line: 56, column: 15, scope: !105)
!115 = !DILocation(line: 56, column: 20, scope: !105)
!116 = !DILocation(line: 57, column: 17, scope: !105)
!117 = !DILocation(line: 57, column: 4, scope: !105)
!118 = !DILocation(line: 58, column: 3, scope: !105)
!119 = !DILocation(line: 53, column: 27, scope: !101)
!120 = !DILocation(line: 53, column: 3, scope: !101)
!121 = distinct !{!121, !102, !122}
!122 = !DILocation(line: 58, column: 3, scope: !98)
!123 = distinct !{!123, !67, !124}
!124 = !DILocation(line: 59, column: 2, scope: !61)
!125 = !DILocation(line: 61, column: 9, scope: !61)
!126 = !DILocation(line: 61, column: 14, scope: !61)
!127 = !DILocation(line: 61, column: 2, scope: !61)
!128 = !DILocalVariable(name: "h", arg: 1, scope: !28, file: !3, line: 64, type: !31)
!129 = !DILocation(line: 0, scope: !28)
!130 = !DILocation(line: 69, column: 3, scope: !28)
!131 = !DILocation(line: 70, column: 2, scope: !28)
!132 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 67, type: !9)
!133 = !DILocation(line: 71, column: 7, scope: !134)
!134 = distinct !DILexicalBlock(scope: !28, file: !3, line: 71, column: 2)
!135 = !DILocation(line: 0, scope: !134)
!136 = !DILocation(line: 71, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !3, line: 71, column: 2)
!138 = !DILocation(line: 71, column: 2, scope: !134)
!139 = !DILocation(line: 72, column: 22, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !3, line: 71, column: 27)
!141 = !DILocation(line: 72, column: 33, scope: !140)
!142 = !DILocation(line: 72, column: 30, scope: !140)
!143 = !DILocation(line: 72, column: 3, scope: !140)
!144 = !DILocation(line: 73, column: 3, scope: !140)
!145 = !DILocation(line: 74, column: 2, scope: !140)
!146 = !DILocation(line: 71, column: 23, scope: !137)
!147 = !DILocation(line: 71, column: 2, scope: !137)
!148 = distinct !{!148, !138, !149}
!149 = !DILocation(line: 74, column: 2, scope: !134)
!150 = !DILocation(line: 75, column: 2, scope: !28)
!151 = !DILocation(line: 76, column: 1, scope: !28)
!152 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 78, type: !153, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DISubroutineType(types: !154)
!154 = !{!9}
!155 = !DILocation(line: 81, column: 9, scope: !152)
!156 = !DILocation(line: 81, column: 7, scope: !152)
!157 = !DILocalVariable(name: "i", scope: !152, file: !3, line: 80, type: !9)
!158 = !DILocation(line: 0, scope: !152)
!159 = !DILocation(line: 83, column: 7, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !3, line: 83, column: 2)
!161 = !DILocation(line: 0, scope: !160)
!162 = !DILocation(line: 83, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !3, line: 83, column: 2)
!164 = !DILocation(line: 83, column: 2, scope: !160)
!165 = !DILocation(line: 84, column: 3, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 83, column: 27)
!167 = !DILocation(line: 84, column: 13, scope: !166)
!168 = !DILocation(line: 84, column: 18, scope: !166)
!169 = !DILocation(line: 85, column: 19, scope: !166)
!170 = !DILocation(line: 85, column: 15, scope: !166)
!171 = !DILocation(line: 85, column: 3, scope: !166)
!172 = !DILocation(line: 85, column: 13, scope: !166)
!173 = !DILocation(line: 86, column: 16, scope: !166)
!174 = !DILocation(line: 86, column: 3, scope: !166)
!175 = !DILocalVariable(name: "j", scope: !152, file: !3, line: 80, type: !9)
!176 = !DILocation(line: 88, column: 8, scope: !177)
!177 = distinct !DILexicalBlock(scope: !166, file: !3, line: 88, column: 3)
!178 = !DILocation(line: 0, scope: !177)
!179 = !DILocation(line: 88, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !3, line: 88, column: 3)
!181 = !DILocation(line: 88, column: 3, scope: !177)
!182 = !DILocation(line: 89, column: 16, scope: !180)
!183 = !DILocation(line: 89, column: 20, scope: !180)
!184 = !DILocation(line: 89, column: 18, scope: !180)
!185 = !DILocation(line: 89, column: 4, scope: !180)
!186 = !DILocation(line: 89, column: 14, scope: !180)
!187 = !DILocation(line: 88, column: 29, scope: !180)
!188 = !DILocation(line: 88, column: 3, scope: !180)
!189 = distinct !{!189, !181, !190}
!190 = !DILocation(line: 89, column: 28, scope: !177)
!191 = !DILocation(line: 90, column: 2, scope: !166)
!192 = !DILocation(line: 83, column: 23, scope: !163)
!193 = !DILocation(line: 83, column: 2, scope: !163)
!194 = distinct !{!194, !164, !195}
!195 = !DILocation(line: 90, column: 2, scope: !160)
!196 = !DILocation(line: 92, column: 2, scope: !152)
!197 = !DILocation(line: 92, column: 35, scope: !152)
!198 = !DILocation(line: 92, column: 26, scope: !152)
!199 = !DILocation(line: 93, column: 2, scope: !152)
!200 = !DILocation(line: 93, column: 35, scope: !152)
!201 = !DILocation(line: 93, column: 26, scope: !152)
!202 = !DILocation(line: 94, column: 2, scope: !152)
!203 = !DILocation(line: 94, column: 35, scope: !152)
!204 = !DILocation(line: 94, column: 26, scope: !152)
!205 = !DILocation(line: 95, column: 2, scope: !152)
