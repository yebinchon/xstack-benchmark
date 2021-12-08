; ModuleID = 'bernoulli-numbers.bc'
source_filename = "bernoulli-numbers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpq_struct = type { %struct.__mpz_struct, %struct.__mpz_struct }
%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [23 x i8] c"B(%-2u) = %44Zd / %Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bernoulli(%struct.__mpq_struct* %rop, i32 %n) #0 !dbg !9 {
entry:
  %rop.addr = alloca %struct.__mpq_struct*, align 8
  %n.addr = alloca i32, align 4
  %m = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca [1 x %struct.__mpq_struct]*, align 8
  %i = alloca i64, align 8
  %i43 = alloca i64, align 8
  store %struct.__mpq_struct* %rop, %struct.__mpq_struct** %rop.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpq_struct** %rop.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %m, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %j, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpq_struct]** %a, metadata !38, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* %n.addr, align 4, !dbg !45
  %add = add i32 %0, 1, !dbg !46
  %conv = zext i32 %add to i64, !dbg !47
  %mul = mul i64 32, %conv, !dbg !48
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !49
  %1 = bitcast i8* %call to [1 x %struct.__mpq_struct]*, !dbg !49
  store [1 x %struct.__mpq_struct]* %1, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !44
  br label %do.body, !dbg !50

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %do.body
  %2 = load i64, i64* %i, align 8, !dbg !58
  %3 = load i32, i32* %n.addr, align 4, !dbg !58
  %add1 = add i32 %3, 1, !dbg !58
  %conv2 = zext i32 %add1 to i64, !dbg !58
  %cmp = icmp ult i64 %2, %conv2, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !58
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %4, i64 %5, !dbg !58
  %arraydecay = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx, i64 0, i64 0, !dbg !58
  call void @__gmpq_init(%struct.__mpq_struct* %arraydecay), !dbg !58
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %6, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !58, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  br label %do.end, !dbg !55

do.end:                                           ; preds = %for.end
  store i32 0, i32* %m, align 4, !dbg !61
  br label %for.cond4, !dbg !63

for.cond4:                                        ; preds = %for.inc37, %do.end
  %7 = load i32, i32* %m, align 4, !dbg !64
  %8 = load i32, i32* %n.addr, align 4, !dbg !66
  %cmp5 = icmp ule i32 %7, %8, !dbg !67
  br i1 %cmp5, label %for.body7, label %for.end39, !dbg !68

for.body7:                                        ; preds = %for.cond4
  %9 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !69
  %10 = load i32, i32* %m, align 4, !dbg !71
  %idxprom = zext i32 %10 to i64, !dbg !69
  %arrayidx8 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %9, i64 %idxprom, !dbg !69
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx8, i64 0, i64 0, !dbg !69
  %11 = load i32, i32* %m, align 4, !dbg !72
  %add10 = add i32 %11, 1, !dbg !73
  %conv11 = zext i32 %add10 to i64, !dbg !72
  call void @__gmpq_set_ui(%struct.__mpq_struct* %arraydecay9, i64 1, i64 %conv11), !dbg !74
  %12 = load i32, i32* %m, align 4, !dbg !75
  store i32 %12, i32* %j, align 4, !dbg !77
  br label %for.cond12, !dbg !78

for.cond12:                                       ; preds = %for.inc35, %for.body7
  %13 = load i32, i32* %j, align 4, !dbg !79
  %cmp13 = icmp ugt i32 %13, 0, !dbg !81
  br i1 %cmp13, label %for.body15, label %for.end36, !dbg !82

for.body15:                                       ; preds = %for.cond12
  %14 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !83
  %15 = load i32, i32* %j, align 4, !dbg !85
  %sub = sub i32 %15, 1, !dbg !86
  %idxprom16 = zext i32 %sub to i64, !dbg !83
  %arrayidx17 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %14, i64 %idxprom16, !dbg !83
  %arraydecay18 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx17, i64 0, i64 0, !dbg !83
  %16 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !87
  %17 = load i32, i32* %j, align 4, !dbg !88
  %idxprom19 = zext i32 %17 to i64, !dbg !87
  %arrayidx20 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %16, i64 %idxprom19, !dbg !87
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx20, i64 0, i64 0, !dbg !87
  %18 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !89
  %19 = load i32, i32* %j, align 4, !dbg !90
  %sub22 = sub i32 %19, 1, !dbg !91
  %idxprom23 = zext i32 %sub22 to i64, !dbg !89
  %arrayidx24 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %18, i64 %idxprom23, !dbg !89
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx24, i64 0, i64 0, !dbg !89
  call void @__gmpq_sub(%struct.__mpq_struct* %arraydecay18, %struct.__mpq_struct* %arraydecay21, %struct.__mpq_struct* %arraydecay25), !dbg !92
  %20 = load %struct.__mpq_struct*, %struct.__mpq_struct** %rop.addr, align 8, !dbg !93
  %21 = load i32, i32* %j, align 4, !dbg !94
  %conv26 = zext i32 %21 to i64, !dbg !94
  call void @__gmpq_set_ui(%struct.__mpq_struct* %20, i64 %conv26, i64 1), !dbg !95
  %22 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !96
  %23 = load i32, i32* %j, align 4, !dbg !97
  %sub27 = sub i32 %23, 1, !dbg !98
  %idxprom28 = zext i32 %sub27 to i64, !dbg !96
  %arrayidx29 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %22, i64 %idxprom28, !dbg !96
  %arraydecay30 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx29, i64 0, i64 0, !dbg !96
  %24 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !99
  %25 = load i32, i32* %j, align 4, !dbg !100
  %sub31 = sub i32 %25, 1, !dbg !101
  %idxprom32 = zext i32 %sub31 to i64, !dbg !99
  %arrayidx33 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %24, i64 %idxprom32, !dbg !99
  %arraydecay34 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx33, i64 0, i64 0, !dbg !99
  %26 = load %struct.__mpq_struct*, %struct.__mpq_struct** %rop.addr, align 8, !dbg !102
  call void @__gmpq_mul(%struct.__mpq_struct* %arraydecay30, %struct.__mpq_struct* %arraydecay34, %struct.__mpq_struct* %26), !dbg !103
  br label %for.inc35, !dbg !104

for.inc35:                                        ; preds = %for.body15
  %27 = load i32, i32* %j, align 4, !dbg !105
  %dec = add i32 %27, -1, !dbg !105
  store i32 %dec, i32* %j, align 4, !dbg !105
  br label %for.cond12, !dbg !106, !llvm.loop !107

for.end36:                                        ; preds = %for.cond12
  br label %for.inc37, !dbg !109

for.inc37:                                        ; preds = %for.end36
  %28 = load i32, i32* %m, align 4, !dbg !110
  %inc38 = add i32 %28, 1, !dbg !110
  store i32 %inc38, i32* %m, align 4, !dbg !110
  br label %for.cond4, !dbg !111, !llvm.loop !112

for.end39:                                        ; preds = %for.cond4
  %29 = load %struct.__mpq_struct*, %struct.__mpq_struct** %rop.addr, align 8, !dbg !114
  %30 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !115
  %arrayidx40 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %30, i64 0, !dbg !115
  %arraydecay41 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx40, i64 0, i64 0, !dbg !115
  call void @__gmpq_set(%struct.__mpq_struct* %29, %struct.__mpq_struct* %arraydecay41), !dbg !116
  br label %do.body42, !dbg !117

do.body42:                                        ; preds = %for.end39
  call void @llvm.dbg.declare(metadata i64* %i43, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i43, align 8, !dbg !121
  br label %for.cond44, !dbg !121

for.cond44:                                       ; preds = %for.inc52, %do.body42
  %31 = load i64, i64* %i43, align 8, !dbg !123
  %32 = load i32, i32* %n.addr, align 4, !dbg !123
  %add45 = add i32 %32, 1, !dbg !123
  %conv46 = zext i32 %add45 to i64, !dbg !123
  %cmp47 = icmp ult i64 %31, %conv46, !dbg !123
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !121

for.body49:                                       ; preds = %for.cond44
  %33 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !123
  %34 = load i64, i64* %i43, align 8, !dbg !123
  %arrayidx50 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %33, i64 %34, !dbg !123
  %arraydecay51 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx50, i64 0, i64 0, !dbg !123
  call void @__gmpq_clear(%struct.__mpq_struct* %arraydecay51), !dbg !123
  br label %for.inc52, !dbg !123

for.inc52:                                        ; preds = %for.body49
  %35 = load i64, i64* %i43, align 8, !dbg !123
  %inc53 = add i64 %35, 1, !dbg !123
  store i64 %inc53, i64* %i43, align 8, !dbg !123
  br label %for.cond44, !dbg !123, !llvm.loop !125

for.end54:                                        ; preds = %for.cond44
  br label %do.end55, !dbg !120

do.end55:                                         ; preds = %for.end54
  %36 = load [1 x %struct.__mpq_struct]*, [1 x %struct.__mpq_struct]** %a, align 8, !dbg !126
  %37 = bitcast [1 x %struct.__mpq_struct]* %36 to i8*, !dbg !126
  call void @free(i8* %37) #5, !dbg !127
  ret void, !dbg !128
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local void @__gmpq_init(%struct.__mpq_struct*) #3

declare dso_local void @__gmpq_set_ui(%struct.__mpq_struct*, i64, i64) #3

declare dso_local void @__gmpq_sub(%struct.__mpq_struct*, %struct.__mpq_struct*, %struct.__mpq_struct*) #3

declare dso_local void @__gmpq_mul(%struct.__mpq_struct*, %struct.__mpq_struct*, %struct.__mpq_struct*) #3

declare dso_local void @__gmpq_set(%struct.__mpq_struct*, %struct.__mpq_struct*) #3

declare dso_local void @__gmpq_clear(%struct.__mpq_struct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  %rop = alloca [1 x %struct.__mpq_struct], align 16
  %n = alloca [1 x %struct.__mpz_struct], align 16
  %d = alloca [1 x %struct.__mpz_struct], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpq_struct]* %rop, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %n, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %d, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !140
  call void @__gmpq_init(%struct.__mpq_struct* %arraydecay), !dbg !141
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !142
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !143
  call void (%struct.__mpz_struct*, ...) @__gmpz_inits(%struct.__mpz_struct* %arraydecay1, %struct.__mpz_struct* %arraydecay2, i8* null), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !DIExpression()), !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !150
  %cmp = icmp ule i32 %0, 60, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !154
  %1 = load i32, i32* %i, align 4, !dbg !156
  call void @bernoulli(%struct.__mpq_struct* %arraydecay3, i32 %1), !dbg !157
  br i1 true, label %cond.true, label %cond.false11, !dbg !158

cond.true:                                        ; preds = %for.body
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !159
  %_mp_num = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay4, i32 0, i32 0, !dbg !159
  %_mp_size = getelementptr inbounds %struct.__mpz_struct, %struct.__mpz_struct* %_mp_num, i32 0, i32 1, !dbg !159
  %2 = load i32, i32* %_mp_size, align 4, !dbg !159
  %cmp5 = icmp slt i32 %2, 0, !dbg !159
  br i1 %cmp5, label %cond.true6, label %cond.false, !dbg !159

cond.true6:                                       ; preds = %cond.true
  br i1 true, label %if.then, label %if.end, !dbg !159

cond.false:                                       ; preds = %cond.true
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !159
  %_mp_num8 = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay7, i32 0, i32 0, !dbg !159
  %_mp_size9 = getelementptr inbounds %struct.__mpz_struct, %struct.__mpz_struct* %_mp_num8, i32 0, i32 1, !dbg !159
  %3 = load i32, i32* %_mp_size9, align 4, !dbg !159
  %cmp10 = icmp sgt i32 %3, 0, !dbg !159
  br i1 %cmp10, label %if.then, label %if.end, !dbg !159

cond.false11:                                     ; preds = %for.body
  br i1 false, label %cond.true12, label %cond.false16, !dbg !158

cond.true12:                                      ; preds = %cond.false11
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !159
  %_mp_num14 = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay13, i32 0, i32 0, !dbg !159
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !159
  %_mp_den = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay15, i32 0, i32 1, !dbg !159
  %call = call i32 @__gmpz_cmp(%struct.__mpz_struct* %_mp_num14, %struct.__mpz_struct* %_mp_den) #6, !dbg !159
  %tobool = icmp ne i32 %call, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !159

cond.false16:                                     ; preds = %cond.false11
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !159
  %call18 = call i32 @__gmpq_cmp_ui(%struct.__mpq_struct* %arraydecay17, i64 0, i64 1) #6, !dbg !159
  %tobool19 = icmp ne i32 %call18, 0, !dbg !159
  br i1 %tobool19, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %cond.false16, %cond.true12, %cond.false, %cond.true6
  %arraydecay20 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !161
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !163
  call void @__gmpq_get_num(%struct.__mpz_struct* %arraydecay20, %struct.__mpq_struct* %arraydecay21), !dbg !164
  %arraydecay22 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !165
  %arraydecay23 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !166
  call void @__gmpq_get_den(%struct.__mpz_struct* %arraydecay22, %struct.__mpq_struct* %arraydecay23), !dbg !167
  %4 = load i32, i32* %i, align 4, !dbg !168
  %arraydecay24 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !169
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !170
  %call26 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %4, %struct.__mpz_struct* %arraydecay24, %struct.__mpz_struct* %arraydecay25), !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %cond.false16, %cond.true12, %cond.false, %cond.true6
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !174
  %inc = add i32 %5, 1, !dbg !174
  store i32 %inc, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arraydecay27 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !178
  %arraydecay28 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !179
  call void (%struct.__mpz_struct*, ...) @__gmpz_clears(%struct.__mpz_struct* %arraydecay27, %struct.__mpz_struct* %arraydecay28, i8* null), !dbg !180
  %arraydecay29 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !181
  call void @__gmpq_clear(%struct.__mpq_struct* %arraydecay29), !dbg !182
  ret i32 0, !dbg !183
}

declare dso_local void @__gmpz_inits(%struct.__mpz_struct*, ...) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @__gmpz_cmp(%struct.__mpz_struct*, %struct.__mpz_struct*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @__gmpq_cmp_ui(%struct.__mpq_struct*, i64, i64) #4

declare dso_local void @__gmpq_get_num(%struct.__mpz_struct*, %struct.__mpq_struct*) #3

declare dso_local void @__gmpq_get_den(%struct.__mpz_struct*, %struct.__mpq_struct*) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #3

declare dso_local void @__gmpz_clears(%struct.__mpz_struct*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bernoulli-numbers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bernoulli-numbers")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "bernoulli", scope: !1, file: !1, line: 11, type: !10, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !29}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpq_struct", file: !14, line: 183, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !14, line: 179, size: 256, elements: !16)
!16 = !{!17, !28}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_num", scope: !15, file: !14, line: 181, baseType: !18, size: 128)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !14, line: 158, baseType: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !14, line: 150, size: 128, elements: !20)
!20 = !{!21, !23, !24}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !19, file: !14, line: 152, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !19, file: !14, line: 154, baseType: !22, size: 32, offset: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !19, file: !14, line: 157, baseType: !25, size: 64, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !14, line: 141, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_den", scope: !15, file: !14, line: 182, baseType: !18, size: 128, offset: 128)
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DILocalVariable(name: "rop", arg: 1, scope: !9, file: !1, line: 11, type: !12)
!31 = !DILocation(line: 11, column: 22, scope: !9)
!32 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !1, line: 11, type: !29)
!33 = !DILocation(line: 11, column: 40, scope: !9)
!34 = !DILocalVariable(name: "m", scope: !9, file: !1, line: 13, type: !29)
!35 = !DILocation(line: 13, column: 18, scope: !9)
!36 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 13, type: !29)
!37 = !DILocation(line: 13, column: 21, scope: !9)
!38 = !DILocalVariable(name: "a", scope: !9, file: !1, line: 14, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpq_t", file: !14, line: 186, baseType: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 1)
!44 = !DILocation(line: 14, column: 12, scope: !9)
!45 = !DILocation(line: 14, column: 40, scope: !9)
!46 = !DILocation(line: 14, column: 42, scope: !9)
!47 = !DILocation(line: 14, column: 39, scope: !9)
!48 = !DILocation(line: 14, column: 37, scope: !9)
!49 = !DILocation(line: 14, column: 16, scope: !9)
!50 = !DILocation(line: 15, column: 5, scope: !9)
!51 = !DILocalVariable(name: "i", scope: !52, file: !1, line: 15, type: !53)
!52 = distinct !DILexicalBlock(scope: !9, file: !1, line: 15, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !27)
!54 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!55 = !DILocation(line: 15, column: 5, scope: !52)
!56 = !DILocation(line: 15, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !1, line: 15, column: 5)
!58 = !DILocation(line: 15, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !57, file: !1, line: 15, column: 5)
!60 = distinct !{!60, !56, !56}
!61 = !DILocation(line: 17, column: 12, scope: !62)
!62 = distinct !DILexicalBlock(scope: !9, file: !1, line: 17, column: 5)
!63 = !DILocation(line: 17, column: 10, scope: !62)
!64 = !DILocation(line: 17, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 17, column: 5)
!66 = !DILocation(line: 17, column: 22, scope: !65)
!67 = !DILocation(line: 17, column: 19, scope: !65)
!68 = !DILocation(line: 17, column: 5, scope: !62)
!69 = !DILocation(line: 18, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 17, column: 30)
!71 = !DILocation(line: 18, column: 22, scope: !70)
!72 = !DILocation(line: 18, column: 29, scope: !70)
!73 = !DILocation(line: 18, column: 31, scope: !70)
!74 = !DILocation(line: 18, column: 9, scope: !70)
!75 = !DILocation(line: 19, column: 18, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 19, column: 9)
!77 = !DILocation(line: 19, column: 16, scope: !76)
!78 = !DILocation(line: 19, column: 14, scope: !76)
!79 = !DILocation(line: 19, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 19, column: 9)
!81 = !DILocation(line: 19, column: 23, scope: !80)
!82 = !DILocation(line: 19, column: 9, scope: !76)
!83 = !DILocation(line: 20, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 19, column: 33)
!85 = !DILocation(line: 20, column: 23, scope: !84)
!86 = !DILocation(line: 20, column: 24, scope: !84)
!87 = !DILocation(line: 20, column: 29, scope: !84)
!88 = !DILocation(line: 20, column: 31, scope: !84)
!89 = !DILocation(line: 20, column: 35, scope: !84)
!90 = !DILocation(line: 20, column: 37, scope: !84)
!91 = !DILocation(line: 20, column: 38, scope: !84)
!92 = !DILocation(line: 20, column: 13, scope: !84)
!93 = !DILocation(line: 21, column: 24, scope: !84)
!94 = !DILocation(line: 21, column: 29, scope: !84)
!95 = !DILocation(line: 21, column: 13, scope: !84)
!96 = !DILocation(line: 22, column: 21, scope: !84)
!97 = !DILocation(line: 22, column: 23, scope: !84)
!98 = !DILocation(line: 22, column: 24, scope: !84)
!99 = !DILocation(line: 22, column: 29, scope: !84)
!100 = !DILocation(line: 22, column: 31, scope: !84)
!101 = !DILocation(line: 22, column: 32, scope: !84)
!102 = !DILocation(line: 22, column: 37, scope: !84)
!103 = !DILocation(line: 22, column: 13, scope: !84)
!104 = !DILocation(line: 23, column: 9, scope: !84)
!105 = !DILocation(line: 19, column: 28, scope: !80)
!106 = !DILocation(line: 19, column: 9, scope: !80)
!107 = distinct !{!107, !82, !108}
!108 = !DILocation(line: 23, column: 9, scope: !76)
!109 = !DILocation(line: 24, column: 5, scope: !70)
!110 = !DILocation(line: 17, column: 25, scope: !65)
!111 = !DILocation(line: 17, column: 5, scope: !65)
!112 = distinct !{!112, !68, !113}
!113 = !DILocation(line: 24, column: 5, scope: !62)
!114 = !DILocation(line: 26, column: 13, scope: !9)
!115 = !DILocation(line: 26, column: 18, scope: !9)
!116 = !DILocation(line: 26, column: 5, scope: !9)
!117 = !DILocation(line: 27, column: 5, scope: !9)
!118 = !DILocalVariable(name: "i", scope: !119, file: !1, line: 27, type: !53)
!119 = distinct !DILexicalBlock(scope: !9, file: !1, line: 27, column: 5)
!120 = !DILocation(line: 27, column: 5, scope: !119)
!121 = !DILocation(line: 27, column: 5, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !1, line: 27, column: 5)
!123 = !DILocation(line: 27, column: 5, scope: !124)
!124 = distinct !DILexicalBlock(scope: !122, file: !1, line: 27, column: 5)
!125 = distinct !{!125, !121, !121}
!126 = !DILocation(line: 28, column: 10, scope: !9)
!127 = !DILocation(line: 28, column: 5, scope: !9)
!128 = !DILocation(line: 29, column: 1, scope: !9)
!129 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !130, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{!22}
!132 = !DILocalVariable(name: "rop", scope: !129, file: !1, line: 33, type: !40)
!133 = !DILocation(line: 33, column: 11, scope: !129)
!134 = !DILocalVariable(name: "n", scope: !129, file: !1, line: 34, type: !135)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !14, line: 164, baseType: !136)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !42)
!137 = !DILocation(line: 34, column: 11, scope: !129)
!138 = !DILocalVariable(name: "d", scope: !129, file: !1, line: 34, type: !135)
!139 = !DILocation(line: 34, column: 14, scope: !129)
!140 = !DILocation(line: 35, column: 14, scope: !129)
!141 = !DILocation(line: 35, column: 5, scope: !129)
!142 = !DILocation(line: 36, column: 15, scope: !129)
!143 = !DILocation(line: 36, column: 18, scope: !129)
!144 = !DILocation(line: 36, column: 5, scope: !129)
!145 = !DILocalVariable(name: "i", scope: !129, file: !1, line: 38, type: !29)
!146 = !DILocation(line: 38, column: 18, scope: !129)
!147 = !DILocation(line: 39, column: 12, scope: !148)
!148 = distinct !DILexicalBlock(scope: !129, file: !1, line: 39, column: 5)
!149 = !DILocation(line: 39, column: 10, scope: !148)
!150 = !DILocation(line: 39, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !1, line: 39, column: 5)
!152 = !DILocation(line: 39, column: 19, scope: !151)
!153 = !DILocation(line: 39, column: 5, scope: !148)
!154 = !DILocation(line: 40, column: 19, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !1, line: 39, column: 31)
!156 = !DILocation(line: 40, column: 24, scope: !155)
!157 = !DILocation(line: 40, column: 9, scope: !155)
!158 = !DILocation(line: 41, column: 13, scope: !155)
!159 = !DILocation(line: 41, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !1, line: 41, column: 13)
!161 = !DILocation(line: 42, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !160, file: !1, line: 41, column: 36)
!163 = !DILocation(line: 42, column: 28, scope: !162)
!164 = !DILocation(line: 42, column: 13, scope: !162)
!165 = !DILocation(line: 43, column: 25, scope: !162)
!166 = !DILocation(line: 43, column: 28, scope: !162)
!167 = !DILocation(line: 43, column: 13, scope: !162)
!168 = !DILocation(line: 44, column: 51, scope: !162)
!169 = !DILocation(line: 44, column: 54, scope: !162)
!170 = !DILocation(line: 44, column: 57, scope: !162)
!171 = !DILocation(line: 44, column: 13, scope: !162)
!172 = !DILocation(line: 45, column: 9, scope: !162)
!173 = !DILocation(line: 46, column: 5, scope: !155)
!174 = !DILocation(line: 39, column: 26, scope: !151)
!175 = !DILocation(line: 39, column: 5, scope: !151)
!176 = distinct !{!176, !153, !177}
!177 = !DILocation(line: 46, column: 5, scope: !148)
!178 = !DILocation(line: 48, column: 16, scope: !129)
!179 = !DILocation(line: 48, column: 19, scope: !129)
!180 = !DILocation(line: 48, column: 5, scope: !129)
!181 = !DILocation(line: 49, column: 15, scope: !129)
!182 = !DILocation(line: 49, column: 5, scope: !129)
!183 = !DILocation(line: 50, column: 5, scope: !129)
