; ModuleID = 'bernoulli-numbers.ll'
source_filename = "bernoulli-numbers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpq_struct = type { %struct.__mpz_struct, %struct.__mpz_struct }
%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [23 x i8] c"B(%-2u) = %44Zd / %Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bernoulli(%struct.__mpq_struct* %rop, i32 %n) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata %struct.__mpq_struct* %rop, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %n, metadata !32, metadata !DIExpression()), !dbg !31
  %add = add i32 %n, 1, !dbg !33
  %conv = zext i32 %add to i64, !dbg !34
  %mul = mul i64 32, %conv, !dbg !35
  %call = call noalias i8* @malloc(i64 %mul) #5, !dbg !36
  %0 = bitcast i8* %call to [1 x %struct.__mpq_struct]*, !dbg !36
  call void @llvm.dbg.value(metadata [1 x %struct.__mpq_struct]* %0, metadata !37, metadata !DIExpression()), !dbg !31
  br label %do.body, !dbg !43

do.body:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 0, metadata !44, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %do.body
  %i.0 = phi i64 [ 0, %do.body ], [ %inc, %for.inc ], !dbg !51
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !44, metadata !DIExpression()), !dbg !48
  %add1 = add i32 %n, 1, !dbg !52
  %conv2 = zext i32 %add1 to i64, !dbg !52
  %cmp = icmp ult i64 %i.0, %conv2, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %i.0, !dbg !52
  %arraydecay = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx, i64 0, i64 0, !dbg !52
  call void @__gmpq_init(%struct.__mpq_struct* %arraydecay), !dbg !52
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata i64 %inc, metadata !44, metadata !DIExpression()), !dbg !48
  br label %for.cond, !dbg !52, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  br label %do.end, !dbg !55

do.end:                                           ; preds = %for.end
  call void @llvm.dbg.value(metadata i32 0, metadata !56, metadata !DIExpression()), !dbg !31
  br label %for.cond4, !dbg !57

for.cond4:                                        ; preds = %for.inc37, %do.end
  %m.0 = phi i32 [ 0, %do.end ], [ %inc38, %for.inc37 ], !dbg !59
  call void @llvm.dbg.value(metadata i32 %m.0, metadata !56, metadata !DIExpression()), !dbg !31
  %cmp5 = icmp ule i32 %m.0, %n, !dbg !60
  br i1 %cmp5, label %for.body7, label %for.end39, !dbg !62

for.body7:                                        ; preds = %for.cond4
  %idxprom = zext i32 %m.0 to i64, !dbg !63
  %arrayidx8 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom, !dbg !63
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx8, i64 0, i64 0, !dbg !63
  %add10 = add i32 %m.0, 1, !dbg !65
  %conv11 = zext i32 %add10 to i64, !dbg !66
  call void @__gmpq_set_ui(%struct.__mpq_struct* %arraydecay9, i64 1, i64 %conv11), !dbg !67
  call void @llvm.dbg.value(metadata i32 %m.0, metadata !68, metadata !DIExpression()), !dbg !31
  br label %for.cond12, !dbg !69

for.cond12:                                       ; preds = %for.inc35, %for.body7
  %j.0 = phi i32 [ %m.0, %for.body7 ], [ %dec, %for.inc35 ], !dbg !71
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !68, metadata !DIExpression()), !dbg !31
  %cmp13 = icmp ugt i32 %j.0, 0, !dbg !72
  br i1 %cmp13, label %for.body15, label %for.end36, !dbg !74

for.body15:                                       ; preds = %for.cond12
  %sub = sub i32 %j.0, 1, !dbg !75
  %idxprom16 = zext i32 %sub to i64, !dbg !77
  %arrayidx17 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom16, !dbg !77
  %arraydecay18 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx17, i64 0, i64 0, !dbg !77
  %idxprom19 = zext i32 %j.0 to i64, !dbg !78
  %arrayidx20 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom19, !dbg !78
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx20, i64 0, i64 0, !dbg !78
  %sub22 = sub i32 %j.0, 1, !dbg !79
  %idxprom23 = zext i32 %sub22 to i64, !dbg !80
  %arrayidx24 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom23, !dbg !80
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx24, i64 0, i64 0, !dbg !80
  call void @__gmpq_sub(%struct.__mpq_struct* %arraydecay18, %struct.__mpq_struct* %arraydecay21, %struct.__mpq_struct* %arraydecay25), !dbg !81
  %conv26 = zext i32 %j.0 to i64, !dbg !82
  call void @__gmpq_set_ui(%struct.__mpq_struct* %rop, i64 %conv26, i64 1), !dbg !83
  %sub27 = sub i32 %j.0, 1, !dbg !84
  %idxprom28 = zext i32 %sub27 to i64, !dbg !85
  %arrayidx29 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom28, !dbg !85
  %arraydecay30 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx29, i64 0, i64 0, !dbg !85
  %sub31 = sub i32 %j.0, 1, !dbg !86
  %idxprom32 = zext i32 %sub31 to i64, !dbg !87
  %arrayidx33 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %idxprom32, !dbg !87
  %arraydecay34 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx33, i64 0, i64 0, !dbg !87
  call void @__gmpq_mul(%struct.__mpq_struct* %arraydecay30, %struct.__mpq_struct* %arraydecay34, %struct.__mpq_struct* %rop), !dbg !88
  br label %for.inc35, !dbg !89

for.inc35:                                        ; preds = %for.body15
  %dec = add i32 %j.0, -1, !dbg !90
  call void @llvm.dbg.value(metadata i32 %dec, metadata !68, metadata !DIExpression()), !dbg !31
  br label %for.cond12, !dbg !91, !llvm.loop !92

for.end36:                                        ; preds = %for.cond12
  br label %for.inc37, !dbg !94

for.inc37:                                        ; preds = %for.end36
  %inc38 = add i32 %m.0, 1, !dbg !95
  call void @llvm.dbg.value(metadata i32 %inc38, metadata !56, metadata !DIExpression()), !dbg !31
  br label %for.cond4, !dbg !96, !llvm.loop !97

for.end39:                                        ; preds = %for.cond4
  %arrayidx40 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 0, !dbg !99
  %arraydecay41 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx40, i64 0, i64 0, !dbg !99
  call void @__gmpq_set(%struct.__mpq_struct* %rop, %struct.__mpq_struct* %arraydecay41), !dbg !100
  br label %do.body42, !dbg !101

do.body42:                                        ; preds = %for.end39
  call void @llvm.dbg.value(metadata i64 0, metadata !102, metadata !DIExpression()), !dbg !104
  br label %for.cond44, !dbg !105

for.cond44:                                       ; preds = %for.inc52, %do.body42
  %i43.0 = phi i64 [ 0, %do.body42 ], [ %inc53, %for.inc52 ], !dbg !107
  call void @llvm.dbg.value(metadata i64 %i43.0, metadata !102, metadata !DIExpression()), !dbg !104
  %add45 = add i32 %n, 1, !dbg !108
  %conv46 = zext i32 %add45 to i64, !dbg !108
  %cmp47 = icmp ult i64 %i43.0, %conv46, !dbg !108
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !105

for.body49:                                       ; preds = %for.cond44
  %arrayidx50 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %0, i64 %i43.0, !dbg !108
  %arraydecay51 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %arrayidx50, i64 0, i64 0, !dbg !108
  call void @__gmpq_clear(%struct.__mpq_struct* %arraydecay51), !dbg !108
  br label %for.inc52, !dbg !108

for.inc52:                                        ; preds = %for.body49
  %inc53 = add i64 %i43.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i64 %inc53, metadata !102, metadata !DIExpression()), !dbg !104
  br label %for.cond44, !dbg !108, !llvm.loop !110

for.end54:                                        ; preds = %for.cond44
  br label %do.end55, !dbg !111

do.end55:                                         ; preds = %for.end54
  %1 = bitcast [1 x %struct.__mpq_struct]* %0 to i8*, !dbg !112
  call void @free(i8* %1) #5, !dbg !113
  ret void, !dbg !114
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
define dso_local i32 @main() #0 !dbg !115 {
entry:
  %rop = alloca [1 x %struct.__mpq_struct], align 16
  %n = alloca [1 x %struct.__mpz_struct], align 16
  %d = alloca [1 x %struct.__mpz_struct], align 16
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpq_struct]* %rop, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %n, metadata !120, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %d, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !126
  call void @__gmpq_init(%struct.__mpq_struct* %arraydecay), !dbg !127
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !128
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !129
  call void (%struct.__mpz_struct*, ...) @__gmpz_inits(%struct.__mpz_struct* %arraydecay1, %struct.__mpz_struct* %arraydecay2, i8* null), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !131, metadata !DIExpression()), !dbg !132
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !135
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !131, metadata !DIExpression()), !dbg !132
  %cmp = icmp ule i32 %i.0, 60, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !139
  call void @bernoulli(%struct.__mpq_struct* %arraydecay3, i32 %i.0), !dbg !141
  br i1 true, label %cond.true, label %cond.false11, !dbg !142

cond.true:                                        ; preds = %for.body
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !143
  %_mp_num = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay4, i32 0, i32 0, !dbg !143
  %_mp_size = getelementptr inbounds %struct.__mpz_struct, %struct.__mpz_struct* %_mp_num, i32 0, i32 1, !dbg !143
  %0 = load i32, i32* %_mp_size, align 4, !dbg !143
  %cmp5 = icmp slt i32 %0, 0, !dbg !143
  br i1 %cmp5, label %cond.true6, label %cond.false, !dbg !143

cond.true6:                                       ; preds = %cond.true
  br i1 true, label %if.then, label %if.end, !dbg !143

cond.false:                                       ; preds = %cond.true
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !143
  %_mp_num8 = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay7, i32 0, i32 0, !dbg !143
  %_mp_size9 = getelementptr inbounds %struct.__mpz_struct, %struct.__mpz_struct* %_mp_num8, i32 0, i32 1, !dbg !143
  %1 = load i32, i32* %_mp_size9, align 4, !dbg !143
  %cmp10 = icmp sgt i32 %1, 0, !dbg !143
  br i1 %cmp10, label %if.then, label %if.end, !dbg !143

cond.false11:                                     ; preds = %for.body
  br i1 false, label %cond.true12, label %cond.false16, !dbg !142

cond.true12:                                      ; preds = %cond.false11
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !143
  %_mp_num14 = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay13, i32 0, i32 0, !dbg !143
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !143
  %_mp_den = getelementptr inbounds %struct.__mpq_struct, %struct.__mpq_struct* %arraydecay15, i32 0, i32 1, !dbg !143
  %call = call i32 @__gmpz_cmp(%struct.__mpz_struct* %_mp_num14, %struct.__mpz_struct* %_mp_den) #6, !dbg !143
  %tobool = icmp ne i32 %call, 0, !dbg !143
  br i1 %tobool, label %if.then, label %if.end, !dbg !143

cond.false16:                                     ; preds = %cond.false11
  %arraydecay17 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !143
  %call18 = call i32 @__gmpq_cmp_ui(%struct.__mpq_struct* %arraydecay17, i64 0, i64 1) #6, !dbg !143
  %tobool19 = icmp ne i32 %call18, 0, !dbg !143
  br i1 %tobool19, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %cond.false16, %cond.true12, %cond.false, %cond.true6
  %arraydecay20 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !145
  %arraydecay21 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !147
  call void @__gmpq_get_num(%struct.__mpz_struct* %arraydecay20, %struct.__mpq_struct* %arraydecay21), !dbg !148
  %arraydecay22 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !149
  %arraydecay23 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !150
  call void @__gmpq_get_den(%struct.__mpz_struct* %arraydecay22, %struct.__mpq_struct* %arraydecay23), !dbg !151
  %arraydecay24 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !152
  %arraydecay25 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !153
  %call26 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %i.0, %struct.__mpz_struct* %arraydecay24, %struct.__mpz_struct* %arraydecay25), !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %cond.false16, %cond.true12, %cond.false, %cond.true6
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %if.end
  %inc = add i32 %i.0, 1, !dbg !157
  call void @llvm.dbg.value(metadata i32 %inc, metadata !131, metadata !DIExpression()), !dbg !132
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arraydecay27 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %n, i64 0, i64 0, !dbg !161
  %arraydecay28 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %d, i64 0, i64 0, !dbg !162
  call void (%struct.__mpz_struct*, ...) @__gmpz_clears(%struct.__mpz_struct* %arraydecay27, %struct.__mpz_struct* %arraydecay28, i8* null), !dbg !163
  %arraydecay29 = getelementptr inbounds [1 x %struct.__mpq_struct], [1 x %struct.__mpq_struct]* %rop, i64 0, i64 0, !dbg !164
  call void @__gmpq_clear(%struct.__mpq_struct* %arraydecay29), !dbg !165
  ret i32 0, !dbg !166
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!31 = !DILocation(line: 0, scope: !9)
!32 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !1, line: 11, type: !29)
!33 = !DILocation(line: 14, column: 42, scope: !9)
!34 = !DILocation(line: 14, column: 39, scope: !9)
!35 = !DILocation(line: 14, column: 37, scope: !9)
!36 = !DILocation(line: 14, column: 16, scope: !9)
!37 = !DILocalVariable(name: "a", scope: !9, file: !1, line: 14, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpq_t", file: !14, line: 186, baseType: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 1)
!43 = !DILocation(line: 15, column: 5, scope: !9)
!44 = !DILocalVariable(name: "i", scope: !45, file: !1, line: 15, type: !46)
!45 = distinct !DILexicalBlock(scope: !9, file: !1, line: 15, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !27)
!47 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!48 = !DILocation(line: 0, scope: !45)
!49 = !DILocation(line: 15, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !1, line: 15, column: 5)
!51 = !DILocation(line: 0, scope: !50)
!52 = !DILocation(line: 15, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 15, column: 5)
!54 = distinct !{!54, !49, !49}
!55 = !DILocation(line: 15, column: 5, scope: !45)
!56 = !DILocalVariable(name: "m", scope: !9, file: !1, line: 13, type: !29)
!57 = !DILocation(line: 17, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !9, file: !1, line: 17, column: 5)
!59 = !DILocation(line: 0, scope: !58)
!60 = !DILocation(line: 17, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !1, line: 17, column: 5)
!62 = !DILocation(line: 17, column: 5, scope: !58)
!63 = !DILocation(line: 18, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !1, line: 17, column: 30)
!65 = !DILocation(line: 18, column: 31, scope: !64)
!66 = !DILocation(line: 18, column: 29, scope: !64)
!67 = !DILocation(line: 18, column: 9, scope: !64)
!68 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 13, type: !29)
!69 = !DILocation(line: 19, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !64, file: !1, line: 19, column: 9)
!71 = !DILocation(line: 0, scope: !70)
!72 = !DILocation(line: 19, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !1, line: 19, column: 9)
!74 = !DILocation(line: 19, column: 9, scope: !70)
!75 = !DILocation(line: 20, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 19, column: 33)
!77 = !DILocation(line: 20, column: 21, scope: !76)
!78 = !DILocation(line: 20, column: 29, scope: !76)
!79 = !DILocation(line: 20, column: 38, scope: !76)
!80 = !DILocation(line: 20, column: 35, scope: !76)
!81 = !DILocation(line: 20, column: 13, scope: !76)
!82 = !DILocation(line: 21, column: 29, scope: !76)
!83 = !DILocation(line: 21, column: 13, scope: !76)
!84 = !DILocation(line: 22, column: 24, scope: !76)
!85 = !DILocation(line: 22, column: 21, scope: !76)
!86 = !DILocation(line: 22, column: 32, scope: !76)
!87 = !DILocation(line: 22, column: 29, scope: !76)
!88 = !DILocation(line: 22, column: 13, scope: !76)
!89 = !DILocation(line: 23, column: 9, scope: !76)
!90 = !DILocation(line: 19, column: 28, scope: !73)
!91 = !DILocation(line: 19, column: 9, scope: !73)
!92 = distinct !{!92, !74, !93}
!93 = !DILocation(line: 23, column: 9, scope: !70)
!94 = !DILocation(line: 24, column: 5, scope: !64)
!95 = !DILocation(line: 17, column: 25, scope: !61)
!96 = !DILocation(line: 17, column: 5, scope: !61)
!97 = distinct !{!97, !62, !98}
!98 = !DILocation(line: 24, column: 5, scope: !58)
!99 = !DILocation(line: 26, column: 18, scope: !9)
!100 = !DILocation(line: 26, column: 5, scope: !9)
!101 = !DILocation(line: 27, column: 5, scope: !9)
!102 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 27, type: !46)
!103 = distinct !DILexicalBlock(scope: !9, file: !1, line: 27, column: 5)
!104 = !DILocation(line: 0, scope: !103)
!105 = !DILocation(line: 27, column: 5, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 27, column: 5)
!107 = !DILocation(line: 0, scope: !106)
!108 = !DILocation(line: 27, column: 5, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 27, column: 5)
!110 = distinct !{!110, !105, !105}
!111 = !DILocation(line: 27, column: 5, scope: !103)
!112 = !DILocation(line: 28, column: 10, scope: !9)
!113 = !DILocation(line: 28, column: 5, scope: !9)
!114 = !DILocation(line: 29, column: 1, scope: !9)
!115 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !116, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!22}
!118 = !DILocalVariable(name: "rop", scope: !115, file: !1, line: 33, type: !39)
!119 = !DILocation(line: 33, column: 11, scope: !115)
!120 = !DILocalVariable(name: "n", scope: !115, file: !1, line: 34, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !14, line: 164, baseType: !122)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !41)
!123 = !DILocation(line: 34, column: 11, scope: !115)
!124 = !DILocalVariable(name: "d", scope: !115, file: !1, line: 34, type: !121)
!125 = !DILocation(line: 34, column: 14, scope: !115)
!126 = !DILocation(line: 35, column: 14, scope: !115)
!127 = !DILocation(line: 35, column: 5, scope: !115)
!128 = !DILocation(line: 36, column: 15, scope: !115)
!129 = !DILocation(line: 36, column: 18, scope: !115)
!130 = !DILocation(line: 36, column: 5, scope: !115)
!131 = !DILocalVariable(name: "i", scope: !115, file: !1, line: 38, type: !29)
!132 = !DILocation(line: 0, scope: !115)
!133 = !DILocation(line: 39, column: 10, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !1, line: 39, column: 5)
!135 = !DILocation(line: 0, scope: !134)
!136 = !DILocation(line: 39, column: 19, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !1, line: 39, column: 5)
!138 = !DILocation(line: 39, column: 5, scope: !134)
!139 = !DILocation(line: 40, column: 19, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !1, line: 39, column: 31)
!141 = !DILocation(line: 40, column: 9, scope: !140)
!142 = !DILocation(line: 41, column: 13, scope: !140)
!143 = !DILocation(line: 41, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !1, line: 41, column: 13)
!145 = !DILocation(line: 42, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !144, file: !1, line: 41, column: 36)
!147 = !DILocation(line: 42, column: 28, scope: !146)
!148 = !DILocation(line: 42, column: 13, scope: !146)
!149 = !DILocation(line: 43, column: 25, scope: !146)
!150 = !DILocation(line: 43, column: 28, scope: !146)
!151 = !DILocation(line: 43, column: 13, scope: !146)
!152 = !DILocation(line: 44, column: 54, scope: !146)
!153 = !DILocation(line: 44, column: 57, scope: !146)
!154 = !DILocation(line: 44, column: 13, scope: !146)
!155 = !DILocation(line: 45, column: 9, scope: !146)
!156 = !DILocation(line: 46, column: 5, scope: !140)
!157 = !DILocation(line: 39, column: 26, scope: !137)
!158 = !DILocation(line: 39, column: 5, scope: !137)
!159 = distinct !{!159, !138, !160}
!160 = !DILocation(line: 46, column: 5, scope: !134)
!161 = !DILocation(line: 48, column: 16, scope: !115)
!162 = !DILocation(line: 48, column: 19, scope: !115)
!163 = !DILocation(line: 48, column: 5, scope: !115)
!164 = !DILocation(line: 49, column: 15, scope: !115)
!165 = !DILocation(line: 49, column: 5, scope: !115)
!166 = !DILocation(line: 50, column: 5, scope: !115)
