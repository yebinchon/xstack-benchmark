; ModuleID = 'cholesky-decomposition.ll'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc44, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !35
  %5 = load i32, i32* %n.addr, align 4, !dbg !37
  %cmp2 = icmp slt i32 %4, %5, !dbg !38
  br i1 %cmp2, label %for.body, label %for.end46, !dbg !39

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !40, metadata !DIExpression()), !dbg !42
  store i32 0, i32* %j, align 4, !dbg !42
  br label %for.cond4, !dbg !43

for.cond4:                                        ; preds = %for.inc41, %for.body
  %6 = load i32, i32* %j, align 4, !dbg !44
  %7 = load i32, i32* %i, align 4, !dbg !46
  %add = add nsw i32 %7, 1, !dbg !47
  %cmp5 = icmp slt i32 %6, %add, !dbg !48
  br i1 %cmp5, label %for.body7, label %for.end43, !dbg !49

for.body7:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata double* %s, metadata !50, metadata !DIExpression()), !dbg !52
  store double 0.000000e+00, double* %s, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %k, metadata !53, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %k, align 4, !dbg !55
  br label %for.cond8, !dbg !56

for.cond8:                                        ; preds = %for.inc, %for.body7
  %8 = load i32, i32* %k, align 4, !dbg !57
  %9 = load i32, i32* %j, align 4, !dbg !59
  %cmp9 = icmp slt i32 %8, %9, !dbg !60
  br i1 %cmp9, label %for.body11, label %for.end, !dbg !61

for.body11:                                       ; preds = %for.cond8
  %10 = load double*, double** %L, align 8, !dbg !62
  %11 = load i32, i32* %i, align 4, !dbg !63
  %12 = load i32, i32* %n.addr, align 4, !dbg !64
  %mul12 = mul nsw i32 %11, %12, !dbg !65
  %13 = load i32, i32* %k, align 4, !dbg !66
  %add13 = add nsw i32 %mul12, %13, !dbg !67
  %idxprom = sext i32 %add13 to i64, !dbg !62
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom, !dbg !62
  %14 = load double, double* %arrayidx, align 8, !dbg !62
  %15 = load double*, double** %L, align 8, !dbg !68
  %16 = load i32, i32* %j, align 4, !dbg !69
  %17 = load i32, i32* %n.addr, align 4, !dbg !70
  %mul14 = mul nsw i32 %16, %17, !dbg !71
  %18 = load i32, i32* %k, align 4, !dbg !72
  %add15 = add nsw i32 %mul14, %18, !dbg !73
  %idxprom16 = sext i32 %add15 to i64, !dbg !68
  %arrayidx17 = getelementptr inbounds double, double* %15, i64 %idxprom16, !dbg !68
  %19 = load double, double* %arrayidx17, align 8, !dbg !68
  %mul18 = fmul double %14, %19, !dbg !74
  %20 = load double, double* %s, align 8, !dbg !75
  %add19 = fadd double %20, %mul18, !dbg !75
  store double %add19, double* %s, align 8, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body11
  %21 = load i32, i32* %k, align 4, !dbg !77
  %inc = add nsw i32 %21, 1, !dbg !77
  store i32 %inc, i32* %k, align 4, !dbg !77
  br label %for.cond8, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond8
  %22 = load i32, i32* %i, align 4, !dbg !81
  %23 = load i32, i32* %j, align 4, !dbg !82
  %cmp20 = icmp eq i32 %22, %23, !dbg !83
  br i1 %cmp20, label %cond.true, label %cond.false, !dbg !84

cond.true:                                        ; preds = %for.end
  %24 = load double*, double** %A.addr, align 8, !dbg !85
  %25 = load i32, i32* %i, align 4, !dbg !86
  %26 = load i32, i32* %n.addr, align 4, !dbg !87
  %mul22 = mul nsw i32 %25, %26, !dbg !88
  %27 = load i32, i32* %i, align 4, !dbg !89
  %add23 = add nsw i32 %mul22, %27, !dbg !90
  %idxprom24 = sext i32 %add23 to i64, !dbg !85
  %arrayidx25 = getelementptr inbounds double, double* %24, i64 %idxprom24, !dbg !85
  %28 = load double, double* %arrayidx25, align 8, !dbg !85
  %29 = load double, double* %s, align 8, !dbg !91
  %sub = fsub double %28, %29, !dbg !92
  %call26 = call double @sqrt(double %sub) #6, !dbg !93
  br label %cond.end, !dbg !84

cond.false:                                       ; preds = %for.end
  %30 = load double*, double** %L, align 8, !dbg !94
  %31 = load i32, i32* %j, align 4, !dbg !95
  %32 = load i32, i32* %n.addr, align 4, !dbg !96
  %mul27 = mul nsw i32 %31, %32, !dbg !97
  %33 = load i32, i32* %j, align 4, !dbg !98
  %add28 = add nsw i32 %mul27, %33, !dbg !99
  %idxprom29 = sext i32 %add28 to i64, !dbg !94
  %arrayidx30 = getelementptr inbounds double, double* %30, i64 %idxprom29, !dbg !94
  %34 = load double, double* %arrayidx30, align 8, !dbg !94
  %div = fdiv double 1.000000e+00, %34, !dbg !100
  %35 = load double*, double** %A.addr, align 8, !dbg !101
  %36 = load i32, i32* %i, align 4, !dbg !102
  %37 = load i32, i32* %n.addr, align 4, !dbg !103
  %mul31 = mul nsw i32 %36, %37, !dbg !104
  %38 = load i32, i32* %j, align 4, !dbg !105
  %add32 = add nsw i32 %mul31, %38, !dbg !106
  %idxprom33 = sext i32 %add32 to i64, !dbg !101
  %arrayidx34 = getelementptr inbounds double, double* %35, i64 %idxprom33, !dbg !101
  %39 = load double, double* %arrayidx34, align 8, !dbg !101
  %40 = load double, double* %s, align 8, !dbg !107
  %sub35 = fsub double %39, %40, !dbg !108
  %mul36 = fmul double %div, %sub35, !dbg !109
  br label %cond.end, !dbg !84

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %call26, %cond.true ], [ %mul36, %cond.false ], !dbg !84
  %41 = load double*, double** %L, align 8, !dbg !110
  %42 = load i32, i32* %i, align 4, !dbg !111
  %43 = load i32, i32* %n.addr, align 4, !dbg !112
  %mul37 = mul nsw i32 %42, %43, !dbg !113
  %44 = load i32, i32* %j, align 4, !dbg !114
  %add38 = add nsw i32 %mul37, %44, !dbg !115
  %idxprom39 = sext i32 %add38 to i64, !dbg !110
  %arrayidx40 = getelementptr inbounds double, double* %41, i64 %idxprom39, !dbg !110
  store double %cond, double* %arrayidx40, align 8, !dbg !116
  br label %for.inc41, !dbg !117

for.inc41:                                        ; preds = %cond.end
  %45 = load i32, i32* %j, align 4, !dbg !118
  %inc42 = add nsw i32 %45, 1, !dbg !118
  store i32 %inc42, i32* %j, align 4, !dbg !118
  br label %for.cond4, !dbg !119, !llvm.loop !120

for.end43:                                        ; preds = %for.cond4
  br label %for.inc44, !dbg !121

for.inc44:                                        ; preds = %for.end43
  %46 = load i32, i32* %i, align 4, !dbg !122
  %inc45 = add nsw i32 %46, 1, !dbg !122
  store i32 %inc45, i32* %i, align 4, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end46:                                        ; preds = %for.cond
  %47 = load double*, double** %L, align 8, !dbg !126
  ret double* %47, !dbg !127
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
define dso_local void @show_matrix(double* %A, i32 %n) #0 !dbg !128 {
entry:
  %A.addr = alloca double*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !139
  %1 = load i32, i32* %n.addr, align 4, !dbg !141
  %cmp = icmp slt i32 %0, %1, !dbg !142
  br i1 %cmp, label %for.body, label %for.end7, !dbg !143

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !144, metadata !DIExpression()), !dbg !147
  store i32 0, i32* %j, align 4, !dbg !147
  br label %for.cond1, !dbg !148

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !149
  %3 = load i32, i32* %n.addr, align 4, !dbg !151
  %cmp2 = icmp slt i32 %2, %3, !dbg !152
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !153

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %A.addr, align 8, !dbg !154
  %5 = load i32, i32* %i, align 4, !dbg !155
  %6 = load i32, i32* %n.addr, align 4, !dbg !156
  %mul = mul nsw i32 %5, %6, !dbg !157
  %7 = load i32, i32* %j, align 4, !dbg !158
  %add = add nsw i32 %mul, %7, !dbg !159
  %idxprom = sext i32 %add to i64, !dbg !154
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom, !dbg !154
  %8 = load double, double* %arrayidx, align 8, !dbg !154
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %8), !dbg !160
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !161
  %inc = add nsw i32 %9, 1, !dbg !161
  store i32 %inc, i32* %j, align 4, !dbg !161
  br label %for.cond1, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond1
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !165
  br label %for.inc5, !dbg !166

for.inc5:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !167
  %inc6 = add nsw i32 %10, 1, !dbg !167
  store i32 %inc6, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !171
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !172 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %m1 = alloca [9 x double], align 16
  %c1 = alloca double*, align 8
  %m2 = alloca [16 x double], align 16
  %c2 = alloca double*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !175, metadata !DIExpression()), !dbg !176
  store i32 3, i32* %n, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata [9 x double]* %m1, metadata !177, metadata !DIExpression()), !dbg !181
  %0 = bitcast [9 x double]* %m1 to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([9 x double]* @__const.main.m1 to i8*), i64 72, i1 false), !dbg !181
  call void @llvm.dbg.declare(metadata double** %c1, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [9 x double], [9 x double]* %m1, i64 0, i64 0, !dbg !184
  %1 = load i32, i32* %n, align 4, !dbg !185
  %call = call double* @cholesky(double* %arraydecay, i32 %1), !dbg !186
  store double* %call, double** %c1, align 8, !dbg !183
  %2 = load double*, double** %c1, align 8, !dbg !187
  %3 = load i32, i32* %n, align 4, !dbg !188
  call void @show_matrix(double* %2, i32 %3), !dbg !189
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !190
  %4 = load double*, double** %c1, align 8, !dbg !191
  %5 = bitcast double* %4 to i8*, !dbg !191
  call void @free(i8* %5) #6, !dbg !192
  store i32 4, i32* %n, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata [16 x double]* %m2, metadata !194, metadata !DIExpression()), !dbg !198
  %6 = bitcast [16 x double]* %m2 to i8*, !dbg !198
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([16 x double]* @__const.main.m2 to i8*), i64 128, i1 false), !dbg !198
  call void @llvm.dbg.declare(metadata double** %c2, metadata !199, metadata !DIExpression()), !dbg !200
  %arraydecay2 = getelementptr inbounds [16 x double], [16 x double]* %m2, i64 0, i64 0, !dbg !201
  %7 = load i32, i32* %n, align 4, !dbg !202
  %call3 = call double* @cholesky(double* %arraydecay2, i32 %7), !dbg !203
  store double* %call3, double** %c2, align 8, !dbg !200
  %8 = load double*, double** %c2, align 8, !dbg !204
  %9 = load i32, i32* %n, align 4, !dbg !205
  call void @show_matrix(double* %8, i32 %9), !dbg !206
  %10 = load double*, double** %c2, align 8, !dbg !207
  %11 = bitcast double* %10 to i8*, !dbg !207
  call void @free(i8* %11) #6, !dbg !208
  ret i32 0, !dbg !209
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "cholesky-decomposition.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Cholesky-decomposition")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!30 = !DILocation(line: 8, column: 9, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 10, type: !14)
!32 = distinct !DILexicalBlock(scope: !11, file: !1, line: 10, column: 5)
!33 = !DILocation(line: 10, column: 14, scope: !32)
!34 = !DILocation(line: 10, column: 10, scope: !32)
!35 = !DILocation(line: 10, column: 21, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !1, line: 10, column: 5)
!37 = !DILocation(line: 10, column: 25, scope: !36)
!38 = !DILocation(line: 10, column: 23, scope: !36)
!39 = !DILocation(line: 10, column: 5, scope: !32)
!40 = !DILocalVariable(name: "j", scope: !41, file: !1, line: 11, type: !14)
!41 = distinct !DILexicalBlock(scope: !36, file: !1, line: 11, column: 9)
!42 = !DILocation(line: 11, column: 18, scope: !41)
!43 = !DILocation(line: 11, column: 14, scope: !41)
!44 = !DILocation(line: 11, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 11, column: 9)
!46 = !DILocation(line: 11, column: 30, scope: !45)
!47 = !DILocation(line: 11, column: 31, scope: !45)
!48 = !DILocation(line: 11, column: 27, scope: !45)
!49 = !DILocation(line: 11, column: 9, scope: !41)
!50 = !DILocalVariable(name: "s", scope: !51, file: !1, line: 12, type: !5)
!51 = distinct !DILexicalBlock(scope: !45, file: !1, line: 11, column: 41)
!52 = !DILocation(line: 12, column: 20, scope: !51)
!53 = !DILocalVariable(name: "k", scope: !54, file: !1, line: 13, type: !14)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 13, column: 13)
!55 = !DILocation(line: 13, column: 22, scope: !54)
!56 = !DILocation(line: 13, column: 18, scope: !54)
!57 = !DILocation(line: 13, column: 29, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 13, column: 13)
!59 = !DILocation(line: 13, column: 33, scope: !58)
!60 = !DILocation(line: 13, column: 31, scope: !58)
!61 = !DILocation(line: 13, column: 13, scope: !54)
!62 = !DILocation(line: 14, column: 22, scope: !58)
!63 = !DILocation(line: 14, column: 24, scope: !58)
!64 = !DILocation(line: 14, column: 28, scope: !58)
!65 = !DILocation(line: 14, column: 26, scope: !58)
!66 = !DILocation(line: 14, column: 32, scope: !58)
!67 = !DILocation(line: 14, column: 30, scope: !58)
!68 = !DILocation(line: 14, column: 37, scope: !58)
!69 = !DILocation(line: 14, column: 39, scope: !58)
!70 = !DILocation(line: 14, column: 43, scope: !58)
!71 = !DILocation(line: 14, column: 41, scope: !58)
!72 = !DILocation(line: 14, column: 47, scope: !58)
!73 = !DILocation(line: 14, column: 45, scope: !58)
!74 = !DILocation(line: 14, column: 35, scope: !58)
!75 = !DILocation(line: 14, column: 19, scope: !58)
!76 = !DILocation(line: 14, column: 17, scope: !58)
!77 = !DILocation(line: 13, column: 37, scope: !58)
!78 = !DILocation(line: 13, column: 13, scope: !58)
!79 = distinct !{!79, !61, !80}
!80 = !DILocation(line: 14, column: 48, scope: !54)
!81 = !DILocation(line: 15, column: 29, scope: !51)
!82 = !DILocation(line: 15, column: 34, scope: !51)
!83 = !DILocation(line: 15, column: 31, scope: !51)
!84 = !DILocation(line: 15, column: 28, scope: !51)
!85 = !DILocation(line: 16, column: 33, scope: !51)
!86 = !DILocation(line: 16, column: 35, scope: !51)
!87 = !DILocation(line: 16, column: 39, scope: !51)
!88 = !DILocation(line: 16, column: 37, scope: !51)
!89 = !DILocation(line: 16, column: 43, scope: !51)
!90 = !DILocation(line: 16, column: 41, scope: !51)
!91 = !DILocation(line: 16, column: 48, scope: !51)
!92 = !DILocation(line: 16, column: 46, scope: !51)
!93 = !DILocation(line: 16, column: 28, scope: !51)
!94 = !DILocation(line: 17, column: 35, scope: !51)
!95 = !DILocation(line: 17, column: 37, scope: !51)
!96 = !DILocation(line: 17, column: 41, scope: !51)
!97 = !DILocation(line: 17, column: 39, scope: !51)
!98 = !DILocation(line: 17, column: 45, scope: !51)
!99 = !DILocation(line: 17, column: 43, scope: !51)
!100 = !DILocation(line: 17, column: 33, scope: !51)
!101 = !DILocation(line: 17, column: 51, scope: !51)
!102 = !DILocation(line: 17, column: 53, scope: !51)
!103 = !DILocation(line: 17, column: 57, scope: !51)
!104 = !DILocation(line: 17, column: 55, scope: !51)
!105 = !DILocation(line: 17, column: 61, scope: !51)
!106 = !DILocation(line: 17, column: 59, scope: !51)
!107 = !DILocation(line: 17, column: 66, scope: !51)
!108 = !DILocation(line: 17, column: 64, scope: !51)
!109 = !DILocation(line: 17, column: 48, scope: !51)
!110 = !DILocation(line: 15, column: 13, scope: !51)
!111 = !DILocation(line: 15, column: 15, scope: !51)
!112 = !DILocation(line: 15, column: 19, scope: !51)
!113 = !DILocation(line: 15, column: 17, scope: !51)
!114 = !DILocation(line: 15, column: 23, scope: !51)
!115 = !DILocation(line: 15, column: 21, scope: !51)
!116 = !DILocation(line: 15, column: 26, scope: !51)
!117 = !DILocation(line: 18, column: 9, scope: !51)
!118 = !DILocation(line: 11, column: 37, scope: !45)
!119 = !DILocation(line: 11, column: 9, scope: !45)
!120 = distinct !{!120, !49, !121}
!121 = !DILocation(line: 18, column: 9, scope: !41)
!122 = !DILocation(line: 10, column: 29, scope: !36)
!123 = !DILocation(line: 10, column: 5, scope: !36)
!124 = distinct !{!124, !39, !125}
!125 = !DILocation(line: 18, column: 9, scope: !32)
!126 = !DILocation(line: 20, column: 12, scope: !11)
!127 = !DILocation(line: 20, column: 5, scope: !11)
!128 = distinct !DISubprogram(name: "show_matrix", scope: !1, file: !1, line: 23, type: !129, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DISubroutineType(types: !130)
!130 = !{null, !4, !14}
!131 = !DILocalVariable(name: "A", arg: 1, scope: !128, file: !1, line: 23, type: !4)
!132 = !DILocation(line: 23, column: 26, scope: !128)
!133 = !DILocalVariable(name: "n", arg: 2, scope: !128, file: !1, line: 23, type: !14)
!134 = !DILocation(line: 23, column: 33, scope: !128)
!135 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 24, type: !14)
!136 = distinct !DILexicalBlock(scope: !128, file: !1, line: 24, column: 5)
!137 = !DILocation(line: 24, column: 14, scope: !136)
!138 = !DILocation(line: 24, column: 10, scope: !136)
!139 = !DILocation(line: 24, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 24, column: 5)
!141 = !DILocation(line: 24, column: 25, scope: !140)
!142 = !DILocation(line: 24, column: 23, scope: !140)
!143 = !DILocation(line: 24, column: 5, scope: !136)
!144 = !DILocalVariable(name: "j", scope: !145, file: !1, line: 25, type: !14)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 25, column: 9)
!146 = distinct !DILexicalBlock(scope: !140, file: !1, line: 24, column: 33)
!147 = !DILocation(line: 25, column: 18, scope: !145)
!148 = !DILocation(line: 25, column: 14, scope: !145)
!149 = !DILocation(line: 25, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !1, line: 25, column: 9)
!151 = !DILocation(line: 25, column: 29, scope: !150)
!152 = !DILocation(line: 25, column: 27, scope: !150)
!153 = !DILocation(line: 25, column: 9, scope: !145)
!154 = !DILocation(line: 26, column: 30, scope: !150)
!155 = !DILocation(line: 26, column: 32, scope: !150)
!156 = !DILocation(line: 26, column: 36, scope: !150)
!157 = !DILocation(line: 26, column: 34, scope: !150)
!158 = !DILocation(line: 26, column: 40, scope: !150)
!159 = !DILocation(line: 26, column: 38, scope: !150)
!160 = !DILocation(line: 26, column: 13, scope: !150)
!161 = !DILocation(line: 25, column: 33, scope: !150)
!162 = !DILocation(line: 25, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164}
!164 = !DILocation(line: 26, column: 42, scope: !145)
!165 = !DILocation(line: 27, column: 9, scope: !146)
!166 = !DILocation(line: 28, column: 5, scope: !146)
!167 = !DILocation(line: 24, column: 29, scope: !140)
!168 = !DILocation(line: 24, column: 5, scope: !140)
!169 = distinct !{!169, !143, !170}
!170 = !DILocation(line: 28, column: 5, scope: !136)
!171 = !DILocation(line: 29, column: 1, scope: !128)
!172 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !173, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!173 = !DISubroutineType(types: !174)
!174 = !{!14}
!175 = !DILocalVariable(name: "n", scope: !172, file: !1, line: 32, type: !14)
!176 = !DILocation(line: 32, column: 9, scope: !172)
!177 = !DILocalVariable(name: "m1", scope: !172, file: !1, line: 33, type: !178)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 576, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 9)
!181 = !DILocation(line: 33, column: 12, scope: !172)
!182 = !DILocalVariable(name: "c1", scope: !172, file: !1, line: 36, type: !4)
!183 = !DILocation(line: 36, column: 13, scope: !172)
!184 = !DILocation(line: 36, column: 27, scope: !172)
!185 = !DILocation(line: 36, column: 31, scope: !172)
!186 = !DILocation(line: 36, column: 18, scope: !172)
!187 = !DILocation(line: 37, column: 17, scope: !172)
!188 = !DILocation(line: 37, column: 21, scope: !172)
!189 = !DILocation(line: 37, column: 5, scope: !172)
!190 = !DILocation(line: 38, column: 5, scope: !172)
!191 = !DILocation(line: 39, column: 10, scope: !172)
!192 = !DILocation(line: 39, column: 5, scope: !172)
!193 = !DILocation(line: 41, column: 7, scope: !172)
!194 = !DILocalVariable(name: "m2", scope: !172, file: !1, line: 42, type: !195)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 16)
!198 = !DILocation(line: 42, column: 12, scope: !172)
!199 = !DILocalVariable(name: "c2", scope: !172, file: !1, line: 46, type: !4)
!200 = !DILocation(line: 46, column: 13, scope: !172)
!201 = !DILocation(line: 46, column: 27, scope: !172)
!202 = !DILocation(line: 46, column: 31, scope: !172)
!203 = !DILocation(line: 46, column: 18, scope: !172)
!204 = !DILocation(line: 47, column: 17, scope: !172)
!205 = !DILocation(line: 47, column: 21, scope: !172)
!206 = !DILocation(line: 47, column: 5, scope: !172)
!207 = !DILocation(line: 48, column: 10, scope: !172)
!208 = !DILocation(line: 48, column: 5, scope: !172)
!209 = !DILocation(line: 50, column: 5, scope: !172)
