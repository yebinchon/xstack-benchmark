; ModuleID = 'find-largest-left-truncatable-prime-in-a-given-base.c'
source_filename = "find-largest-left-truncatable-prime-in-a-given-base.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpz_struct = type { i32, i32, i64* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@small_primes = dso_local global [25 x i64] [i64 2, i64 3, i64 5, i64 7, i64 11, i64 13, i64 17, i64 19, i64 23, i64 29, i64 31, i64 37, i64 41, i64 43, i64 47, i64 53, i64 59, i64 61, i64 67, i64 71, i64 73, i64 79, i64 83, i64 89, i64 97], align 16, !dbg !0
@base = common dso_local global i64 0, align 8, !dbg !30
@value = common dso_local global [128 x [1 x %struct.__mpz_struct]] zeroinitializer, align 16, !dbg !26
@tens = common dso_local global [128 x [1 x %struct.__mpz_struct]] zeroinitializer, align 16, !dbg !6
@seen_depth = common dso_local global i64 0, align 8, !dbg !33
@answer = common dso_local global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !28
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [21 x i8] c"\09b=%lu d=%2lu | %Zd\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"\09b=%lu digit %lu\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"%d: %Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_digit(i64 %i) #0 !dbg !42 {
entry:
  %i.addr = alloca i64, align 8
  %d = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %i.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %d, metadata !47, metadata !DIExpression()), !dbg !48
  store i64 1, i64* %d, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %d, align 8, !dbg !52
  %1 = load i64, i64* @base, align 8, !dbg !54
  %cmp = icmp ult i64 %0, %1, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %2, !dbg !59
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx, i64 0, i64 0, !dbg !59
  %3 = load i64, i64* %i.addr, align 8, !dbg !60
  %sub = sub i64 %3, 1, !dbg !61
  %arrayidx1 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %sub, !dbg !62
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx1, i64 0, i64 0, !dbg !62
  call void @__gmpz_set(%struct.__mpz_struct* %arraydecay, %struct.__mpz_struct* %arraydecay2), !dbg !63
  %4 = load i64, i64* %i.addr, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %4, !dbg !65
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx3, i64 0, i64 0, !dbg !65
  %5 = load i64, i64* %i.addr, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @tens, i64 0, i64 %5, !dbg !67
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx5, i64 0, i64 0, !dbg !67
  %6 = load i64, i64* %d, align 8, !dbg !68
  call void @__gmpz_addmul_ui(%struct.__mpz_struct* %arraydecay4, %struct.__mpz_struct* %arraydecay6, i64 %6), !dbg !69
  %7 = load i64, i64* %i.addr, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %7, !dbg !72
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx7, i64 0, i64 0, !dbg !72
  %call = call i32 @__gmpz_probab_prime_p(%struct.__mpz_struct* %arraydecay8, i32 1) #4, !dbg !73
  %tobool = icmp ne i32 %call, 0, !dbg !73
  br i1 %tobool, label %if.end, label %if.then, !dbg !74, !cf.info !75

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !76

if.end:                                           ; preds = %for.body
  %8 = load i64, i64* %i.addr, align 8, !dbg !77
  %9 = load i64, i64* @seen_depth, align 8, !dbg !79
  %cmp9 = icmp ugt i64 %8, %9, !dbg !80
  br i1 %cmp9, label %if.then15, label %lor.lhs.false, !dbg !81, !cf.info !75

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i64, i64* %i.addr, align 8, !dbg !82
  %11 = load i64, i64* @seen_depth, align 8, !dbg !83
  %cmp10 = icmp eq i64 %10, %11, !dbg !84
  br i1 %cmp10, label %land.lhs.true, label %if.end25, !dbg !85, !cf.info !75

land.lhs.true:                                    ; preds = %lor.lhs.false
  %12 = load i64, i64* %i.addr, align 8, !dbg !86
  %arrayidx11 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %12, !dbg !87
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx11, i64 0, i64 0, !dbg !87
  %call13 = call i32 @__gmpz_cmp(%struct.__mpz_struct* %arraydecay12, %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0)) #4, !dbg !88
  %cmp14 = icmp eq i32 %call13, 1, !dbg !89
  br i1 %cmp14, label %if.then15, label %if.end25, !dbg !90, !cf.info !75

if.then15:                                        ; preds = %land.lhs.true, %if.end
  %13 = load i64, i64* %i.addr, align 8, !dbg !91
  %arrayidx16 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %13, !dbg !94
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx16, i64 0, i64 0, !dbg !94
  %call18 = call i32 @__gmpz_probab_prime_p(%struct.__mpz_struct* %arraydecay17, i32 50) #4, !dbg !95
  %tobool19 = icmp ne i32 %call18, 0, !dbg !95
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !96, !cf.info !75

if.then20:                                        ; preds = %if.then15
  br label %for.inc, !dbg !97

if.end21:                                         ; preds = %if.then15
  %14 = load i64, i64* %i.addr, align 8, !dbg !98
  %arrayidx22 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %14, !dbg !99
  %arraydecay23 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx22, i64 0, i64 0, !dbg !99
  call void @__gmpz_set(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0), %struct.__mpz_struct* %arraydecay23), !dbg !100
  %15 = load i64, i64* %i.addr, align 8, !dbg !101
  store i64 %15, i64* @seen_depth, align 8, !dbg !102
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !103
  %17 = load i64, i64* @base, align 8, !dbg !104
  %18 = load i64, i64* %i.addr, align 8, !dbg !105
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @__gmp_fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i64 %17, i64 %18, %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0)), !dbg !106
  br label %if.end25, !dbg !107

if.end25:                                         ; preds = %if.end21, %land.lhs.true, %lor.lhs.false
  %19 = load i64, i64* %i.addr, align 8, !dbg !108
  %add = add i64 %19, 1, !dbg !109
  call void @add_digit(i64 %add), !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %if.end25, %if.then20, %if.then
  %20 = load i64, i64* %d, align 8, !dbg !112
  %inc = add i64 %20, 1, !dbg !112
  store i64 %inc, i64* %d, align 8, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  ret void, !dbg !116
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpz_set(%struct.__mpz_struct*, %struct.__mpz_struct*) #2

declare dso_local void @__gmpz_addmul_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @__gmpz_probab_prime_p(%struct.__mpz_struct*, i32) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @__gmpz_cmp(%struct.__mpz_struct*, %struct.__mpz_struct*) #3

declare dso_local i32 @__gmp_fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_base() #0 !dbg !117 {
entry:
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @__gmpz_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0), i64 0), !dbg !122
  call void @__gmpz_set_ui(%struct.__mpz_struct* getelementptr inbounds ([128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @tens, i64 0, i64 0, i64 0), i64 1), !dbg !123
  store i64 1, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %0, 128, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @tens, i64 0, i64 %1, !dbg !132
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx, i64 0, i64 0, !dbg !132
  %2 = load i64, i64* %i, align 8, !dbg !133
  %sub = sub i64 %2, 1, !dbg !134
  %arrayidx1 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @tens, i64 0, i64 %sub, !dbg !135
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx1, i64 0, i64 0, !dbg !135
  %3 = load i64, i64* @base, align 8, !dbg !136
  call void @__gmpz_mul_ui(%struct.__mpz_struct* %arraydecay, %struct.__mpz_struct* %arraydecay2, i64 %3), !dbg !137
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %4, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  store i64 0, i64* %i, align 8, !dbg !142
  store i64 0, i64* @seen_depth, align 8, !dbg !144
  br label %for.cond3, !dbg !145

for.cond3:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds [25 x i64], [25 x i64]* @small_primes, i64 0, i64 %5, !dbg !148
  %6 = load i64, i64* %arrayidx4, align 8, !dbg !148
  %7 = load i64, i64* @base, align 8, !dbg !149
  %cmp5 = icmp ult i64 %6, %7, !dbg !150
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !151

for.body6:                                        ; preds = %for.cond3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !152
  %9 = load i64, i64* @base, align 8, !dbg !154
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds [25 x i64], [25 x i64]* @small_primes, i64 0, i64 %10, !dbg !156
  %11 = load i64, i64* %arrayidx7, align 8, !dbg !156
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i64 %9, i64 %11), !dbg !157
  %12 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds [25 x i64], [25 x i64]* @small_primes, i64 0, i64 %12, !dbg !159
  %13 = load i64, i64* %arrayidx8, align 8, !dbg !159
  call void @__gmpz_set_ui(%struct.__mpz_struct* getelementptr inbounds ([128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 0, i64 0), i64 %13), !dbg !160
  call void @add_digit(i64 1), !dbg !161
  br label %for.inc9, !dbg !162

for.inc9:                                         ; preds = %for.body6
  %14 = load i64, i64* %i, align 8, !dbg !163
  %inc10 = add i64 %14, 1, !dbg !163
  store i64 %inc10, i64* %i, align 8, !dbg !163
  br label %for.cond3, !dbg !164, !llvm.loop !165

for.end11:                                        ; preds = %for.cond3
  %15 = load i64, i64* @base, align 8, !dbg !167
  %call12 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i64 %15, %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0)), !dbg !168
  ret void, !dbg !169
}

declare dso_local void @__gmpz_set_ui(%struct.__mpz_struct*, i64) #2

declare dso_local void @__gmpz_mul_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !170 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !178
  %cmp = icmp ult i64 %0, 128, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @tens, i64 0, i64 %1, !dbg !184
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx, i64 0, i64 0, !dbg !184
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 0), !dbg !185
  %2 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx1 = getelementptr inbounds [128 x [1 x %struct.__mpz_struct]], [128 x [1 x %struct.__mpz_struct]]* @value, i64 0, i64 %2, !dbg !187
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx1, i64 0, i64 0, !dbg !187
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay2, i64 0), !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %3, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @answer, i64 0, i64 0), i64 0), !dbg !194
  store i64 22, i64* @base, align 8, !dbg !195
  br label %for.cond3, !dbg !197

for.cond3:                                        ; preds = %for.inc6, %for.end
  %4 = load i64, i64* @base, align 8, !dbg !198
  %cmp4 = icmp ult i64 %4, 30, !dbg !200
  br i1 %cmp4, label %for.body5, label %for.end8, !dbg !201

for.body5:                                        ; preds = %for.cond3
  call void @do_base(), !dbg !202
  br label %for.inc6, !dbg !202

for.inc6:                                         ; preds = %for.body5
  %5 = load i64, i64* @base, align 8, !dbg !203
  %inc7 = add i64 %5, 1, !dbg !203
  store i64 %inc7, i64* @base, align 8, !dbg !203
  br label %for.cond3, !dbg !204, !llvm.loop !205

for.end8:                                         ; preds = %for.cond3
  ret i32 0, !dbg !207
}

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "small_primes", scope: !2, file: !3, line: 6, type: !35, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "find-largest-left-truncatable-prime-in-a-given-base.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Find-largest-left-truncatable-prime-in-a-given-base")
!4 = !{}
!5 = !{!0, !6, !26, !28, !30, !33}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "tens", scope: !2, file: !3, line: 10, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 16384, elements: !24)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !10, line: 164, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !22)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !10, line: 158, baseType: !13)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 150, size: 128, elements: !14)
!14 = !{!15, !17, !18}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !13, file: !10, line: 152, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !13, file: !10, line: 154, baseType: !16, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !13, file: !10, line: 157, baseType: !19, size: 64, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !10, line: 141, baseType: !21)
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !{!23}
!23 = !DISubrange(count: 1)
!24 = !{!25}
!25 = !DISubrange(count: 128)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "value", scope: !2, file: !3, line: 10, type: !8, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "answer", scope: !2, file: !3, line: 10, type: !9, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !3, line: 12, type: !32, isLocal: false, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "ulong", file: !3, line: 4, baseType: !21)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "seen_depth", scope: !2, file: !3, line: 12, type: !32, isLocal: false, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 1600, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 25)
!38 = !{i32 7, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!42 = distinct !DISubprogram(name: "add_digit", scope: !3, file: !3, line: 14, type: !43, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !32}
!45 = !DILocalVariable(name: "i", arg: 1, scope: !42, file: !3, line: 14, type: !32)
!46 = !DILocation(line: 14, column: 22, scope: !42)
!47 = !DILocalVariable(name: "d", scope: !42, file: !3, line: 16, type: !32)
!48 = !DILocation(line: 16, column: 8, scope: !42)
!49 = !DILocation(line: 17, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !3, line: 17, column: 2)
!51 = !DILocation(line: 17, column: 7, scope: !50)
!52 = !DILocation(line: 17, column: 14, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !3, line: 17, column: 2)
!54 = !DILocation(line: 17, column: 18, scope: !53)
!55 = !DILocation(line: 17, column: 16, scope: !53)
!56 = !DILocation(line: 17, column: 2, scope: !50)
!57 = !DILocation(line: 18, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 17, column: 29)
!59 = !DILocation(line: 18, column: 11, scope: !58)
!60 = !DILocation(line: 18, column: 27, scope: !58)
!61 = !DILocation(line: 18, column: 28, scope: !58)
!62 = !DILocation(line: 18, column: 21, scope: !58)
!63 = !DILocation(line: 18, column: 3, scope: !58)
!64 = !DILocation(line: 19, column: 23, scope: !58)
!65 = !DILocation(line: 19, column: 17, scope: !58)
!66 = !DILocation(line: 19, column: 32, scope: !58)
!67 = !DILocation(line: 19, column: 27, scope: !58)
!68 = !DILocation(line: 19, column: 36, scope: !58)
!69 = !DILocation(line: 19, column: 3, scope: !58)
!70 = !DILocation(line: 20, column: 33, scope: !71)
!71 = distinct !DILexicalBlock(scope: !58, file: !3, line: 20, column: 7)
!72 = !DILocation(line: 20, column: 27, scope: !71)
!73 = !DILocation(line: 20, column: 8, scope: !71)
!74 = !DILocation(line: 20, column: 7, scope: !58)
!75 = !{!"if"}
!76 = !DILocation(line: 20, column: 41, scope: !71)
!77 = !DILocation(line: 22, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !58, file: !3, line: 22, column: 7)
!79 = !DILocation(line: 22, column: 11, scope: !78)
!80 = !DILocation(line: 22, column: 9, scope: !78)
!81 = !DILocation(line: 22, column: 22, scope: !78)
!82 = !DILocation(line: 23, column: 5, scope: !78)
!83 = !DILocation(line: 23, column: 10, scope: !78)
!84 = !DILocation(line: 23, column: 7, scope: !78)
!85 = !DILocation(line: 23, column: 21, scope: !78)
!86 = !DILocation(line: 23, column: 38, scope: !78)
!87 = !DILocation(line: 23, column: 32, scope: !78)
!88 = !DILocation(line: 23, column: 24, scope: !78)
!89 = !DILocation(line: 23, column: 50, scope: !78)
!90 = !DILocation(line: 22, column: 7, scope: !58)
!91 = !DILocation(line: 25, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 25, column: 8)
!93 = distinct !DILexicalBlock(scope: !78, file: !3, line: 24, column: 3)
!94 = !DILocation(line: 25, column: 28, scope: !92)
!95 = !DILocation(line: 25, column: 9, scope: !92)
!96 = !DILocation(line: 25, column: 8, scope: !93)
!97 = !DILocation(line: 25, column: 43, scope: !92)
!98 = !DILocation(line: 27, column: 26, scope: !93)
!99 = !DILocation(line: 27, column: 20, scope: !93)
!100 = !DILocation(line: 27, column: 4, scope: !93)
!101 = !DILocation(line: 28, column: 17, scope: !93)
!102 = !DILocation(line: 28, column: 15, scope: !93)
!103 = !DILocation(line: 29, column: 16, scope: !93)
!104 = !DILocation(line: 29, column: 50, scope: !93)
!105 = !DILocation(line: 29, column: 56, scope: !93)
!106 = !DILocation(line: 29, column: 4, scope: !93)
!107 = !DILocation(line: 30, column: 3, scope: !93)
!108 = !DILocation(line: 32, column: 13, scope: !58)
!109 = !DILocation(line: 32, column: 14, scope: !58)
!110 = !DILocation(line: 32, column: 3, scope: !58)
!111 = !DILocation(line: 33, column: 2, scope: !58)
!112 = !DILocation(line: 17, column: 25, scope: !53)
!113 = !DILocation(line: 17, column: 2, scope: !53)
!114 = distinct !{!114, !56, !115}
!115 = !DILocation(line: 33, column: 2, scope: !50)
!116 = !DILocation(line: 34, column: 1, scope: !42)
!117 = distinct !DISubprogram(name: "do_base", scope: !3, file: !3, line: 36, type: !118, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DISubroutineType(types: !119)
!119 = !{null}
!120 = !DILocalVariable(name: "i", scope: !117, file: !3, line: 38, type: !32)
!121 = !DILocation(line: 38, column: 8, scope: !117)
!122 = !DILocation(line: 39, column: 2, scope: !117)
!123 = !DILocation(line: 40, column: 2, scope: !117)
!124 = !DILocation(line: 41, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !3, line: 41, column: 2)
!126 = !DILocation(line: 41, column: 7, scope: !125)
!127 = !DILocation(line: 41, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !3, line: 41, column: 2)
!129 = !DILocation(line: 41, column: 16, scope: !128)
!130 = !DILocation(line: 41, column: 2, scope: !125)
!131 = !DILocation(line: 42, column: 19, scope: !128)
!132 = !DILocation(line: 42, column: 14, scope: !128)
!133 = !DILocation(line: 42, column: 28, scope: !128)
!134 = !DILocation(line: 42, column: 29, scope: !128)
!135 = !DILocation(line: 42, column: 23, scope: !128)
!136 = !DILocation(line: 42, column: 34, scope: !128)
!137 = !DILocation(line: 42, column: 3, scope: !128)
!138 = !DILocation(line: 41, column: 30, scope: !128)
!139 = !DILocation(line: 41, column: 2, scope: !128)
!140 = distinct !{!140, !130, !141}
!141 = !DILocation(line: 42, column: 38, scope: !125)
!142 = !DILocation(line: 44, column: 22, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !3, line: 44, column: 2)
!144 = !DILocation(line: 44, column: 18, scope: !143)
!145 = !DILocation(line: 44, column: 7, scope: !143)
!146 = !DILocation(line: 44, column: 40, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !3, line: 44, column: 2)
!148 = !DILocation(line: 44, column: 27, scope: !147)
!149 = !DILocation(line: 44, column: 45, scope: !147)
!150 = !DILocation(line: 44, column: 43, scope: !147)
!151 = !DILocation(line: 44, column: 2, scope: !143)
!152 = !DILocation(line: 45, column: 11, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !3, line: 44, column: 56)
!154 = !DILocation(line: 45, column: 42, scope: !153)
!155 = !DILocation(line: 45, column: 61, scope: !153)
!156 = !DILocation(line: 45, column: 48, scope: !153)
!157 = !DILocation(line: 45, column: 3, scope: !153)
!158 = !DILocation(line: 46, column: 37, scope: !153)
!159 = !DILocation(line: 46, column: 24, scope: !153)
!160 = !DILocation(line: 46, column: 3, scope: !153)
!161 = !DILocation(line: 47, column: 3, scope: !153)
!162 = !DILocation(line: 48, column: 2, scope: !153)
!163 = !DILocation(line: 44, column: 52, scope: !147)
!164 = !DILocation(line: 44, column: 2, scope: !147)
!165 = distinct !{!165, !151, !166}
!166 = !DILocation(line: 48, column: 2, scope: !143)
!167 = !DILocation(line: 49, column: 26, scope: !117)
!168 = !DILocation(line: 49, column: 2, scope: !117)
!169 = !DILocation(line: 50, column: 1, scope: !117)
!170 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 52, type: !171, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DISubroutineType(types: !172)
!172 = !{!16}
!173 = !DILocalVariable(name: "i", scope: !170, file: !3, line: 54, type: !32)
!174 = !DILocation(line: 54, column: 8, scope: !170)
!175 = !DILocation(line: 55, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !3, line: 55, column: 2)
!177 = !DILocation(line: 55, column: 7, scope: !176)
!178 = !DILocation(line: 55, column: 14, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 55, column: 2)
!180 = !DILocation(line: 55, column: 16, scope: !179)
!181 = !DILocation(line: 55, column: 2, scope: !176)
!182 = !DILocation(line: 56, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !3, line: 55, column: 34)
!184 = !DILocation(line: 56, column: 19, scope: !183)
!185 = !DILocation(line: 56, column: 3, scope: !183)
!186 = !DILocation(line: 57, column: 25, scope: !183)
!187 = !DILocation(line: 57, column: 19, scope: !183)
!188 = !DILocation(line: 57, column: 3, scope: !183)
!189 = !DILocation(line: 58, column: 2, scope: !183)
!190 = !DILocation(line: 55, column: 30, scope: !179)
!191 = !DILocation(line: 55, column: 2, scope: !179)
!192 = distinct !{!192, !181, !193}
!193 = !DILocation(line: 58, column: 2, scope: !176)
!194 = !DILocation(line: 59, column: 2, scope: !170)
!195 = !DILocation(line: 61, column: 12, scope: !196)
!196 = distinct !DILexicalBlock(scope: !170, file: !3, line: 61, column: 2)
!197 = !DILocation(line: 61, column: 7, scope: !196)
!198 = !DILocation(line: 61, column: 18, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !3, line: 61, column: 2)
!200 = !DILocation(line: 61, column: 23, scope: !199)
!201 = !DILocation(line: 61, column: 2, scope: !196)
!202 = !DILocation(line: 61, column: 37, scope: !199)
!203 = !DILocation(line: 61, column: 33, scope: !199)
!204 = !DILocation(line: 61, column: 2, scope: !199)
!205 = distinct !{!205, !201, !206}
!206 = !DILocation(line: 61, column: 45, scope: !196)
!207 = !DILocation(line: 63, column: 2, scope: !170)
