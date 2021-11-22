; ModuleID = 'cholesky-decomposition.c'
source_filename = "cholesky-decomposition.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%2.5f \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.m1 = private unnamed_addr constant [9 x double] [double 2.500000e+01, double 1.500000e+01, double -5.000000e+00, double 1.500000e+01, double 1.800000e+01, double 0.000000e+00, double -5.000000e+00, double 0.000000e+00, double 1.100000e+01], align 16
@__const.main.m2 = private unnamed_addr constant [16 x double] [double 1.800000e+01, double 2.200000e+01, double 5.400000e+01, double 4.200000e+01, double 2.200000e+01, double 7.000000e+01, double 8.600000e+01, double 6.200000e+01, double 5.400000e+01, double 8.600000e+01, double 1.740000e+02, double 1.340000e+02, double 4.200000e+01, double 6.200000e+01, double 1.340000e+02, double 1.060000e+02], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local double* @cholesky(double* %A, i32 %n) #0 !dbg !11 {
entry:
  %A.addr = alloca double*, align 8
  %n.addr = alloca i32, align 4
  %L = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %s = alloca double, align 8
  %k = alloca i32, align 4
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata double** %L, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %n.addr, align 4, !dbg !21
  %1 = load i32, i32* %n.addr, align 4, !dbg !22
  %mul = mul nsw i32 %0, %1, !dbg !23
  %conv = sext i32 %mul to i64, !dbg !21
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #6, !dbg !24
  %2 = bitcast i8* %call to double*, !dbg !25
  store double* %2, double** %L, align 8, !dbg !20
  %3 = load double*, double** %L, align 8, !dbg !26
  %cmp = icmp eq double* %3, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29, !cf.info !30

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc44, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !36
  %5 = load i32, i32* %n.addr, align 4, !dbg !38
  %cmp2 = icmp slt i32 %4, %5, !dbg !39
  br i1 %cmp2, label %for.body, label %for.end46, !dbg !40

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %j, align 4, !dbg !43
  br label %for.cond4, !dbg !44

for.cond4:                                        ; preds = %for.inc41, %for.body
  %6 = load i32, i32* %j, align 4, !dbg !45
  %7 = load i32, i32* %i, align 4, !dbg !47
  %add = add nsw i32 %7, 1, !dbg !48
  %cmp5 = icmp slt i32 %6, %add, !dbg !49
  br i1 %cmp5, label %for.body7, label %for.end43, !dbg !50

for.body7:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata double* %s, metadata !51, metadata !DIExpression()), !dbg !53
  store double 0.000000e+00, double* %s, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %k, metadata !54, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %k, align 4, !dbg !56
  br label %for.cond8, !dbg !57

for.cond8:                                        ; preds = %for.inc, %for.body7
  %8 = load i32, i32* %k, align 4, !dbg !58
  %9 = load i32, i32* %j, align 4, !dbg !60
  %cmp9 = icmp slt i32 %8, %9, !dbg !61
  br i1 %cmp9, label %for.body11, label %for.end, !dbg !62

for.body11:                                       ; preds = %for.cond8
  %10 = load double*, double** %L, align 8, !dbg !63
  %11 = load i32, i32* %i, align 4, !dbg !64
  %12 = load i32, i32* %n.addr, align 4, !dbg !65
  %mul12 = mul nsw i32 %11, %12, !dbg !66
  %13 = load i32, i32* %k, align 4, !dbg !67
  %add13 = add nsw i32 %mul12, %13, !dbg !68
  %idxprom = sext i32 %add13 to i64, !dbg !63
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !63
  %14 = load double, double* %arrayidx, align 8, !dbg !63
  %15 = load double*, double** %L, align 8, !dbg !69
  %16 = load i32, i32* %j, align 4, !dbg !70
  %17 = load i32, i32* %n.addr, align 4, !dbg !71
  %mul14 = mul nsw i32 %16, %17, !dbg !72
  %18 = load i32, i32* %k, align 4, !dbg !73
  %add15 = add nsw i32 %mul14, %18, !dbg !74
  %idxprom16 = sext i32 %add15 to i64, !dbg !69
  %arrayidx17 = getelementptr inbounds double, double* %15, i64 %idxprom16, !dbg !69
  %19 = load double, double* %arrayidx17, align 8, !dbg !69
  %mul18 = fmul double %14, %19, !dbg !75
  %20 = load double, double* %s, align 8, !dbg !76
  %add19 = fadd double %20, %mul18, !dbg !76
  store double %add19, double* %s, align 8, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body11
  %21 = load i32, i32* %k, align 4, !dbg !78
  %inc = add nsw i32 %21, 1, !dbg !78
  store i32 %inc, i32* %k, align 4, !dbg !78
  br label %for.cond8, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond8
  %22 = load i32, i32* %i, align 4, !dbg !82
  %23 = load i32, i32* %j, align 4, !dbg !83
  %cmp20 = icmp eq i32 %22, %23, !dbg !84
  br i1 %cmp20, label %cond.true, label %cond.false, !dbg !85

cond.true:                                        ; preds = %for.end
  %24 = load double*, double** %A.addr, align 8, !dbg !86
  %25 = load i32, i32* %i, align 4, !dbg !87
  %26 = load i32, i32* %n.addr, align 4, !dbg !88
  %mul22 = mul nsw i32 %25, %26, !dbg !89
  %27 = load i32, i32* %i, align 4, !dbg !90
  %add23 = add nsw i32 %mul22, %27, !dbg !91
  %idxprom24 = sext i32 %add23 to i64, !dbg !86
  %arrayidx25 = getelementptr inbounds double, double* %24, i64 %idxprom24, !dbg !86
  %28 = load double, double* %arrayidx25, align 8, !dbg !86
  %29 = load double, double* %s, align 8, !dbg !92
  %sub = fsub double %28, %29, !dbg !93
  %call26 = call double @sqrt(double %sub) #6, !dbg !94
  br label %cond.end, !dbg !85

cond.false:                                       ; preds = %for.end
  %30 = load double*, double** %L, align 8, !dbg !95
  %31 = load i32, i32* %j, align 4, !dbg !96
  %32 = load i32, i32* %n.addr, align 4, !dbg !97
  %mul27 = mul nsw i32 %31, %32, !dbg !98
  %33 = load i32, i32* %j, align 4, !dbg !99
  %add28 = add nsw i32 %mul27, %33, !dbg !100
  %idxprom29 = sext i32 %add28 to i64, !dbg !95
  %arrayidx30 = getelementptr inbounds double, double* %30, i64 %idxprom29, !dbg !95
  %34 = load double, double* %arrayidx30, align 8, !dbg !95
  %div = fdiv double 1.000000e+00, %34, !dbg !101
  %35 = load double*, double** %A.addr, align 8, !dbg !102
  %36 = load i32, i32* %i, align 4, !dbg !103
  %37 = load i32, i32* %n.addr, align 4, !dbg !104
  %mul31 = mul nsw i32 %36, %37, !dbg !105
  %38 = load i32, i32* %j, align 4, !dbg !106
  %add32 = add nsw i32 %mul31, %38, !dbg !107
  %idxprom33 = sext i32 %add32 to i64, !dbg !102
  %arrayidx34 = getelementptr inbounds double, double* %35, i64 %idxprom33, !dbg !102
  %39 = load double, double* %arrayidx34, align 8, !dbg !102
  %40 = load double, double* %s, align 8, !dbg !108
  %sub35 = fsub double %39, %40, !dbg !109
  %mul36 = fmul double %div, %sub35, !dbg !110
  br label %cond.end, !dbg !85

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call26, %cond.true ], [ %mul36, %cond.false ], !dbg !85
  %41 = load double*, double** %L, align 8, !dbg !111
  %42 = load i32, i32* %i, align 4, !dbg !112
  %43 = load i32, i32* %n.addr, align 4, !dbg !113
  %mul37 = mul nsw i32 %42, %43, !dbg !114
  %44 = load i32, i32* %j, align 4, !dbg !115
  %add38 = add nsw i32 %mul37, %44, !dbg !116
  %idxprom39 = sext i32 %add38 to i64, !dbg !111
  %arrayidx40 = getelementptr inbounds double, double* %41, i64 %idxprom39, !dbg !111
  store double %cond, double* %arrayidx40, align 8, !dbg !117
  br label %for.inc41, !dbg !118

for.inc41:                                        ; preds = %cond.end
  %45 = load i32, i32* %j, align 4, !dbg !119
  %inc42 = add nsw i32 %45, 1, !dbg !119
  store i32 %inc42, i32* %j, align 4, !dbg !119
  br label %for.cond4, !dbg !120, !llvm.loop !121

for.end43:                                        ; preds = %for.cond4
  br label %for.inc44, !dbg !122

for.inc44:                                        ; preds = %for.end43
  %46 = load i32, i32* %i, align 4, !dbg !123
  %inc45 = add nsw i32 %46, 1, !dbg !123
  store i32 %inc45, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end46:                                        ; preds = %for.cond
  %47 = load double*, double** %L, align 8, !dbg !127
  ret double* %47, !dbg !128
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_matrix(double* %A, i32 %n) #0 !dbg !129 {
entry:
  %A.addr = alloca double*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32* %i, metadata !136, metadata !DIExpression()), !dbg !138
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !140
  %1 = load i32, i32* %n.addr, align 4, !dbg !142
  %cmp = icmp slt i32 %0, %1, !dbg !143
  br i1 %cmp, label %for.body, label %for.end7, !dbg !144

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !145, metadata !DIExpression()), !dbg !148
  store i32 0, i32* %j, align 4, !dbg !148
  br label %for.cond1, !dbg !149

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !150
  %3 = load i32, i32* %n.addr, align 4, !dbg !152
  %cmp2 = icmp slt i32 %2, %3, !dbg !153
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !154

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %A.addr, align 8, !dbg !155
  %5 = load i32, i32* %i, align 4, !dbg !156
  %6 = load i32, i32* %n.addr, align 4, !dbg !157
  %mul = mul nsw i32 %5, %6, !dbg !158
  %7 = load i32, i32* %j, align 4, !dbg !159
  %add = add nsw i32 %mul, %7, !dbg !160
  %idxprom = sext i32 %add to i64, !dbg !155
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom, !dbg !155
  %8 = load double, double* %arrayidx, align 8, !dbg !155
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %8), !dbg !161
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !162
  %inc = add nsw i32 %9, 1, !dbg !162
  store i32 %inc, i32* %j, align 4, !dbg !162
  br label %for.cond1, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond1
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !166
  br label %for.inc5, !dbg !167

for.inc5:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !168
  %inc6 = add nsw i32 %10, 1, !dbg !168
  store i32 %inc6, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !172
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !173 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %m1 = alloca [9 x double], align 16
  %c1 = alloca double*, align 8
  %m2 = alloca [16 x double], align 16
  %c2 = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !176, metadata !DIExpression()), !dbg !177
  store i32 3, i32* %n, align 4, !dbg !177
  call void @llvm.dbg.declare(metadata [9 x double]* %m1, metadata !178, metadata !DIExpression()), !dbg !182
  %0 = bitcast [9 x double]* %m1 to i8*, !dbg !182
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([9 x double]* @__const.main.m1 to i8*), i64 72, i1 false), !dbg !182
  call void @llvm.dbg.declare(metadata double** %c1, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [9 x double], [9 x double]* %m1, i64 0, i64 0, !dbg !185
  %1 = load i32, i32* %n, align 4, !dbg !186
  %call = call double* @cholesky(double* %arraydecay, i32 %1), !dbg !187
  store double* %call, double** %c1, align 8, !dbg !184
  %2 = load double*, double** %c1, align 8, !dbg !188
  %3 = load i32, i32* %n, align 4, !dbg !189
  call void @show_matrix(double* %2, i32 %3), !dbg !190
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !191
  %4 = load double*, double** %c1, align 8, !dbg !192
  %5 = bitcast double* %4 to i8*, !dbg !192
  call void @free(i8* %5) #6, !dbg !193
  store i32 4, i32* %n, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata [16 x double]* %m2, metadata !195, metadata !DIExpression()), !dbg !199
  %6 = bitcast [16 x double]* %m2 to i8*, !dbg !199
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([16 x double]* @__const.main.m2 to i8*), i64 128, i1 false), !dbg !199
  call void @llvm.dbg.declare(metadata double** %c2, metadata !200, metadata !DIExpression()), !dbg !201
  %arraydecay2 = getelementptr inbounds [16 x double], [16 x double]* %m2, i64 0, i64 0, !dbg !202
  %7 = load i32, i32* %n, align 4, !dbg !203
  %call3 = call double* @cholesky(double* %arraydecay2, i32 %7), !dbg !204
  store double* %call3, double** %c2, align 8, !dbg !201
  %8 = load double*, double** %c2, align 8, !dbg !205
  %9 = load i32, i32* %n, align 4, !dbg !206
  call void @show_matrix(double* %8, i32 %9), !dbg !207
  %10 = load double*, double** %c2, align 8, !dbg !208
  %11 = bitcast double* %10 to i8*, !dbg !208
  call void @free(i8* %11) #6, !dbg !209
  ret i32 0, !dbg !210
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "cholesky-decomposition.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Cholesky-decomposition")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!11 = distinct !DISubprogram(name: "cholesky", scope: !1, file: !1, line: 5, type: !12, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!4, !4, !14}
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "A", arg: 1, scope: !11, file: !1, line: 5, type: !4)
!16 = !DILocation(line: 5, column: 26, scope: !11)
!17 = !DILocalVariable(name: "n", arg: 2, scope: !11, file: !1, line: 5, type: !14)
!18 = !DILocation(line: 5, column: 33, scope: !11)
!19 = !DILocalVariable(name: "L", scope: !11, file: !1, line: 6, type: !4)
!20 = !DILocation(line: 6, column: 13, scope: !11)
!21 = !DILocation(line: 6, column: 33, scope: !11)
!22 = !DILocation(line: 6, column: 37, scope: !11)
!23 = !DILocation(line: 6, column: 35, scope: !11)
!24 = !DILocation(line: 6, column: 26, scope: !11)
!25 = !DILocation(line: 6, column: 17, scope: !11)
!26 = !DILocation(line: 7, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !1, line: 7, column: 9)
!28 = !DILocation(line: 7, column: 11, scope: !27)
!29 = !DILocation(line: 7, column: 9, scope: !11)
!30 = !{!"if"}
!31 = !DILocation(line: 8, column: 9, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 10, type: !14)
!33 = distinct !DILexicalBlock(scope: !11, file: !1, line: 10, column: 5)
!34 = !DILocation(line: 10, column: 14, scope: !33)
!35 = !DILocation(line: 10, column: 10, scope: !33)
!36 = !DILocation(line: 10, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 10, column: 5)
!38 = !DILocation(line: 10, column: 25, scope: !37)
!39 = !DILocation(line: 10, column: 23, scope: !37)
!40 = !DILocation(line: 10, column: 5, scope: !33)
!41 = !DILocalVariable(name: "j", scope: !42, file: !1, line: 11, type: !14)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 11, column: 9)
!43 = !DILocation(line: 11, column: 18, scope: !42)
!44 = !DILocation(line: 11, column: 14, scope: !42)
!45 = !DILocation(line: 11, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 11, column: 9)
!47 = !DILocation(line: 11, column: 30, scope: !46)
!48 = !DILocation(line: 11, column: 31, scope: !46)
!49 = !DILocation(line: 11, column: 27, scope: !46)
!50 = !DILocation(line: 11, column: 9, scope: !42)
!51 = !DILocalVariable(name: "s", scope: !52, file: !1, line: 12, type: !5)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 11, column: 41)
!53 = !DILocation(line: 12, column: 20, scope: !52)
!54 = !DILocalVariable(name: "k", scope: !55, file: !1, line: 13, type: !14)
!55 = distinct !DILexicalBlock(scope: !52, file: !1, line: 13, column: 13)
!56 = !DILocation(line: 13, column: 22, scope: !55)
!57 = !DILocation(line: 13, column: 18, scope: !55)
!58 = !DILocation(line: 13, column: 29, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 13, column: 13)
!60 = !DILocation(line: 13, column: 33, scope: !59)
!61 = !DILocation(line: 13, column: 31, scope: !59)
!62 = !DILocation(line: 13, column: 13, scope: !55)
!63 = !DILocation(line: 14, column: 22, scope: !59)
!64 = !DILocation(line: 14, column: 24, scope: !59)
!65 = !DILocation(line: 14, column: 28, scope: !59)
!66 = !DILocation(line: 14, column: 26, scope: !59)
!67 = !DILocation(line: 14, column: 32, scope: !59)
!68 = !DILocation(line: 14, column: 30, scope: !59)
!69 = !DILocation(line: 14, column: 37, scope: !59)
!70 = !DILocation(line: 14, column: 39, scope: !59)
!71 = !DILocation(line: 14, column: 43, scope: !59)
!72 = !DILocation(line: 14, column: 41, scope: !59)
!73 = !DILocation(line: 14, column: 47, scope: !59)
!74 = !DILocation(line: 14, column: 45, scope: !59)
!75 = !DILocation(line: 14, column: 35, scope: !59)
!76 = !DILocation(line: 14, column: 19, scope: !59)
!77 = !DILocation(line: 14, column: 17, scope: !59)
!78 = !DILocation(line: 13, column: 37, scope: !59)
!79 = !DILocation(line: 13, column: 13, scope: !59)
!80 = distinct !{!80, !62, !81}
!81 = !DILocation(line: 14, column: 48, scope: !55)
!82 = !DILocation(line: 15, column: 29, scope: !52)
!83 = !DILocation(line: 15, column: 34, scope: !52)
!84 = !DILocation(line: 15, column: 31, scope: !52)
!85 = !DILocation(line: 15, column: 28, scope: !52)
!86 = !DILocation(line: 16, column: 33, scope: !52)
!87 = !DILocation(line: 16, column: 35, scope: !52)
!88 = !DILocation(line: 16, column: 39, scope: !52)
!89 = !DILocation(line: 16, column: 37, scope: !52)
!90 = !DILocation(line: 16, column: 43, scope: !52)
!91 = !DILocation(line: 16, column: 41, scope: !52)
!92 = !DILocation(line: 16, column: 48, scope: !52)
!93 = !DILocation(line: 16, column: 46, scope: !52)
!94 = !DILocation(line: 16, column: 28, scope: !52)
!95 = !DILocation(line: 17, column: 35, scope: !52)
!96 = !DILocation(line: 17, column: 37, scope: !52)
!97 = !DILocation(line: 17, column: 41, scope: !52)
!98 = !DILocation(line: 17, column: 39, scope: !52)
!99 = !DILocation(line: 17, column: 45, scope: !52)
!100 = !DILocation(line: 17, column: 43, scope: !52)
!101 = !DILocation(line: 17, column: 33, scope: !52)
!102 = !DILocation(line: 17, column: 51, scope: !52)
!103 = !DILocation(line: 17, column: 53, scope: !52)
!104 = !DILocation(line: 17, column: 57, scope: !52)
!105 = !DILocation(line: 17, column: 55, scope: !52)
!106 = !DILocation(line: 17, column: 61, scope: !52)
!107 = !DILocation(line: 17, column: 59, scope: !52)
!108 = !DILocation(line: 17, column: 66, scope: !52)
!109 = !DILocation(line: 17, column: 64, scope: !52)
!110 = !DILocation(line: 17, column: 48, scope: !52)
!111 = !DILocation(line: 15, column: 13, scope: !52)
!112 = !DILocation(line: 15, column: 15, scope: !52)
!113 = !DILocation(line: 15, column: 19, scope: !52)
!114 = !DILocation(line: 15, column: 17, scope: !52)
!115 = !DILocation(line: 15, column: 23, scope: !52)
!116 = !DILocation(line: 15, column: 21, scope: !52)
!117 = !DILocation(line: 15, column: 26, scope: !52)
!118 = !DILocation(line: 18, column: 9, scope: !52)
!119 = !DILocation(line: 11, column: 37, scope: !46)
!120 = !DILocation(line: 11, column: 9, scope: !46)
!121 = distinct !{!121, !50, !122}
!122 = !DILocation(line: 18, column: 9, scope: !42)
!123 = !DILocation(line: 10, column: 29, scope: !37)
!124 = !DILocation(line: 10, column: 5, scope: !37)
!125 = distinct !{!125, !40, !126}
!126 = !DILocation(line: 18, column: 9, scope: !33)
!127 = !DILocation(line: 20, column: 12, scope: !11)
!128 = !DILocation(line: 20, column: 5, scope: !11)
!129 = distinct !DISubprogram(name: "show_matrix", scope: !1, file: !1, line: 23, type: !130, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{null, !4, !14}
!132 = !DILocalVariable(name: "A", arg: 1, scope: !129, file: !1, line: 23, type: !4)
!133 = !DILocation(line: 23, column: 26, scope: !129)
!134 = !DILocalVariable(name: "n", arg: 2, scope: !129, file: !1, line: 23, type: !14)
!135 = !DILocation(line: 23, column: 33, scope: !129)
!136 = !DILocalVariable(name: "i", scope: !137, file: !1, line: 24, type: !14)
!137 = distinct !DILexicalBlock(scope: !129, file: !1, line: 24, column: 5)
!138 = !DILocation(line: 24, column: 14, scope: !137)
!139 = !DILocation(line: 24, column: 10, scope: !137)
!140 = !DILocation(line: 24, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !1, line: 24, column: 5)
!142 = !DILocation(line: 24, column: 25, scope: !141)
!143 = !DILocation(line: 24, column: 23, scope: !141)
!144 = !DILocation(line: 24, column: 5, scope: !137)
!145 = !DILocalVariable(name: "j", scope: !146, file: !1, line: 25, type: !14)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 25, column: 9)
!147 = distinct !DILexicalBlock(scope: !141, file: !1, line: 24, column: 33)
!148 = !DILocation(line: 25, column: 18, scope: !146)
!149 = !DILocation(line: 25, column: 14, scope: !146)
!150 = !DILocation(line: 25, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !1, line: 25, column: 9)
!152 = !DILocation(line: 25, column: 29, scope: !151)
!153 = !DILocation(line: 25, column: 27, scope: !151)
!154 = !DILocation(line: 25, column: 9, scope: !146)
!155 = !DILocation(line: 26, column: 30, scope: !151)
!156 = !DILocation(line: 26, column: 32, scope: !151)
!157 = !DILocation(line: 26, column: 36, scope: !151)
!158 = !DILocation(line: 26, column: 34, scope: !151)
!159 = !DILocation(line: 26, column: 40, scope: !151)
!160 = !DILocation(line: 26, column: 38, scope: !151)
!161 = !DILocation(line: 26, column: 13, scope: !151)
!162 = !DILocation(line: 25, column: 33, scope: !151)
!163 = !DILocation(line: 25, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165}
!165 = !DILocation(line: 26, column: 42, scope: !146)
!166 = !DILocation(line: 27, column: 9, scope: !147)
!167 = !DILocation(line: 28, column: 5, scope: !147)
!168 = !DILocation(line: 24, column: 29, scope: !141)
!169 = !DILocation(line: 24, column: 5, scope: !141)
!170 = distinct !{!170, !144, !171}
!171 = !DILocation(line: 28, column: 5, scope: !137)
!172 = !DILocation(line: 29, column: 1, scope: !129)
!173 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !174, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DISubroutineType(types: !175)
!175 = !{!14}
!176 = !DILocalVariable(name: "n", scope: !173, file: !1, line: 32, type: !14)
!177 = !DILocation(line: 32, column: 9, scope: !173)
!178 = !DILocalVariable(name: "m1", scope: !173, file: !1, line: 33, type: !179)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 576, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 9)
!182 = !DILocation(line: 33, column: 12, scope: !173)
!183 = !DILocalVariable(name: "c1", scope: !173, file: !1, line: 36, type: !4)
!184 = !DILocation(line: 36, column: 13, scope: !173)
!185 = !DILocation(line: 36, column: 27, scope: !173)
!186 = !DILocation(line: 36, column: 31, scope: !173)
!187 = !DILocation(line: 36, column: 18, scope: !173)
!188 = !DILocation(line: 37, column: 17, scope: !173)
!189 = !DILocation(line: 37, column: 21, scope: !173)
!190 = !DILocation(line: 37, column: 5, scope: !173)
!191 = !DILocation(line: 38, column: 5, scope: !173)
!192 = !DILocation(line: 39, column: 10, scope: !173)
!193 = !DILocation(line: 39, column: 5, scope: !173)
!194 = !DILocation(line: 41, column: 7, scope: !173)
!195 = !DILocalVariable(name: "m2", scope: !173, file: !1, line: 42, type: !196)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 16)
!199 = !DILocation(line: 42, column: 12, scope: !173)
!200 = !DILocalVariable(name: "c2", scope: !173, file: !1, line: 46, type: !4)
!201 = !DILocation(line: 46, column: 13, scope: !173)
!202 = !DILocation(line: 46, column: 27, scope: !173)
!203 = !DILocation(line: 46, column: 31, scope: !173)
!204 = !DILocation(line: 46, column: 18, scope: !173)
!205 = !DILocation(line: 47, column: 17, scope: !173)
!206 = !DILocation(line: 47, column: 21, scope: !173)
!207 = !DILocation(line: 47, column: 5, scope: !173)
!208 = !DILocation(line: 48, column: 10, scope: !173)
!209 = !DILocation(line: 48, column: 5, scope: !173)
!210 = !DILocation(line: 50, column: 5, scope: !173)
