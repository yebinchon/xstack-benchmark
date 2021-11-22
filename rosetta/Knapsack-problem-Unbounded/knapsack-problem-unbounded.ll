; ModuleID = 'knapsack-problem-unbounded.c'
source_filename = "knapsack-problem-unbounded.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.item_t = type { i8*, double, double, double }

@.str = private unnamed_addr constant [8 x i8] c"panacea\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"ichor\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"gold\00", align 1
@items = dso_local global [3 x %struct.item_t] [%struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), double 3.000000e+03, double 3.000000e-01, double 2.500000e-02 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), double 1.800000e+03, double 2.000000e-01, double 1.500000e-02 }, %struct.item_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), double 2.500000e+03, double 2.000000e+00, double 2.000000e-03 }], align 16, !dbg !0
@n = dso_local global i32 3, align 4, !dbg !6
@best_value = common dso_local global double 0.000000e+00, align 8, !dbg !14
@count = common dso_local global i32* null, align 8, !dbg !9
@best = common dso_local global i32* null, align 8, !dbg !12
@.str.3 = private unnamed_addr constant [7 x i8] c"%d %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"best value: %.0f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @knapsack(i32 %i, double %value, double %weight, double %volume) #0 !dbg !33 {
entry:
  %i.addr = alloca i32, align 4
  %value.addr = alloca double, align 8
  %weight.addr = alloca double, align 8
  %volume.addr = alloca double, align 8
  %j = alloca i32, align 4
  %m1 = alloca i32, align 4
  %m2 = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !36, metadata !DIExpression()), !dbg !37
  store double %value, double* %value.addr, align 8
  call void @llvm.dbg.declare(metadata double* %value.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store double %weight, double* %weight.addr, align 8
  call void @llvm.dbg.declare(metadata double* %weight.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store double %volume, double* %volume.addr, align 8
  call void @llvm.dbg.declare(metadata double* %volume.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %j, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %m1, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %m2, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %m, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i32, i32* %i.addr, align 4, !dbg !52
  %1 = load i32, i32* @n, align 4, !dbg !54
  %cmp = icmp eq i32 %0, %1, !dbg !55
  br i1 %cmp, label %if.then, label %if.end6, !dbg !56, !cf.info !57

if.then:                                          ; preds = %entry
  %2 = load double, double* %value.addr, align 8, !dbg !58
  %3 = load double, double* @best_value, align 8, !dbg !61
  %cmp1 = fcmp ogt double %2, %3, !dbg !62
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !63, !cf.info !57

if.then2:                                         ; preds = %if.then
  %4 = load double, double* %value.addr, align 8, !dbg !64
  store double %4, double* @best_value, align 8, !dbg !66
  store i32 0, i32* %j, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %j, align 4, !dbg !70
  %6 = load i32, i32* @n, align 4, !dbg !72
  %cmp3 = icmp slt i32 %5, %6, !dbg !73
  br i1 %cmp3, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** @count, align 8, !dbg !75
  %8 = load i32, i32* %j, align 4, !dbg !77
  %idxprom = sext i32 %8 to i64, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !75
  %9 = load i32, i32* %arrayidx, align 4, !dbg !75
  %10 = load i32*, i32** @best, align 8, !dbg !78
  %11 = load i32, i32* %j, align 4, !dbg !79
  %idxprom4 = sext i32 %11 to i64, !dbg !78
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %idxprom4, !dbg !78
  store i32 %9, i32* %arrayidx5, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %j, align 4, !dbg !82
  %inc = add nsw i32 %12, 1, !dbg !82
  store i32 %inc, i32* %j, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !86

if.end:                                           ; preds = %for.end, %if.then
  br label %for.end50, !dbg !87

if.end6:                                          ; preds = %entry
  %13 = load double, double* %weight.addr, align 8, !dbg !88
  %14 = load i32, i32* %i.addr, align 4, !dbg !89
  %idxprom7 = sext i32 %14 to i64, !dbg !90
  %arrayidx8 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom7, !dbg !90
  %weight9 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx8, i32 0, i32 2, !dbg !91
  %15 = load double, double* %weight9, align 16, !dbg !91
  %div = fdiv double %13, %15, !dbg !92
  %conv = fptosi double %div to i32, !dbg !88
  store i32 %conv, i32* %m1, align 4, !dbg !93
  %16 = load double, double* %volume.addr, align 8, !dbg !94
  %17 = load i32, i32* %i.addr, align 4, !dbg !95
  %idxprom10 = sext i32 %17 to i64, !dbg !96
  %arrayidx11 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom10, !dbg !96
  %volume12 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx11, i32 0, i32 3, !dbg !97
  %18 = load double, double* %volume12, align 8, !dbg !97
  %div13 = fdiv double %16, %18, !dbg !98
  %conv14 = fptosi double %div13 to i32, !dbg !94
  store i32 %conv14, i32* %m2, align 4, !dbg !99
  %19 = load i32, i32* %m1, align 4, !dbg !100
  %20 = load i32, i32* %m2, align 4, !dbg !101
  %cmp15 = icmp slt i32 %19, %20, !dbg !102
  br i1 %cmp15, label %cond.true, label %cond.false, !dbg !100

cond.true:                                        ; preds = %if.end6
  %21 = load i32, i32* %m1, align 4, !dbg !103
  br label %cond.end, !dbg !100

cond.false:                                       ; preds = %if.end6
  %22 = load i32, i32* %m2, align 4, !dbg !104
  br label %cond.end, !dbg !100

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %21, %cond.true ], [ %22, %cond.false ], !dbg !100
  store i32 %cond, i32* %m, align 4, !dbg !105
  %23 = load i32, i32* %m, align 4, !dbg !106
  %24 = load i32*, i32** @count, align 8, !dbg !108
  %25 = load i32, i32* %i.addr, align 4, !dbg !109
  %idxprom17 = sext i32 %25 to i64, !dbg !108
  %arrayidx18 = getelementptr inbounds i32, i32* %24, i64 %idxprom17, !dbg !108
  store i32 %23, i32* %arrayidx18, align 4, !dbg !110
  br label %for.cond19, !dbg !108

for.cond19:                                       ; preds = %for.inc47, %cond.end
  %26 = load i32*, i32** @count, align 8, !dbg !111
  %27 = load i32, i32* %i.addr, align 4, !dbg !113
  %idxprom20 = sext i32 %27 to i64, !dbg !111
  %arrayidx21 = getelementptr inbounds i32, i32* %26, i64 %idxprom20, !dbg !111
  %28 = load i32, i32* %arrayidx21, align 4, !dbg !111
  %cmp22 = icmp sge i32 %28, 0, !dbg !114
  br i1 %cmp22, label %for.body24, label %for.end50, !dbg !115

for.body24:                                       ; preds = %for.cond19
  %29 = load i32, i32* %i.addr, align 4, !dbg !116
  %add = add nsw i32 %29, 1, !dbg !118
  %30 = load double, double* %value.addr, align 8, !dbg !119
  %31 = load i32*, i32** @count, align 8, !dbg !120
  %32 = load i32, i32* %i.addr, align 4, !dbg !121
  %idxprom25 = sext i32 %32 to i64, !dbg !120
  %arrayidx26 = getelementptr inbounds i32, i32* %31, i64 %idxprom25, !dbg !120
  %33 = load i32, i32* %arrayidx26, align 4, !dbg !120
  %conv27 = sitofp i32 %33 to double, !dbg !120
  %34 = load i32, i32* %i.addr, align 4, !dbg !122
  %idxprom28 = sext i32 %34 to i64, !dbg !123
  %arrayidx29 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom28, !dbg !123
  %value30 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx29, i32 0, i32 1, !dbg !124
  %35 = load double, double* %value30, align 8, !dbg !124
  %mul = fmul double %conv27, %35, !dbg !125
  %add31 = fadd double %30, %mul, !dbg !126
  %36 = load double, double* %weight.addr, align 8, !dbg !127
  %37 = load i32*, i32** @count, align 8, !dbg !128
  %38 = load i32, i32* %i.addr, align 4, !dbg !129
  %idxprom32 = sext i32 %38 to i64, !dbg !128
  %arrayidx33 = getelementptr inbounds i32, i32* %37, i64 %idxprom32, !dbg !128
  %39 = load i32, i32* %arrayidx33, align 4, !dbg !128
  %conv34 = sitofp i32 %39 to double, !dbg !128
  %40 = load i32, i32* %i.addr, align 4, !dbg !130
  %idxprom35 = sext i32 %40 to i64, !dbg !131
  %arrayidx36 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom35, !dbg !131
  %weight37 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx36, i32 0, i32 2, !dbg !132
  %41 = load double, double* %weight37, align 16, !dbg !132
  %mul38 = fmul double %conv34, %41, !dbg !133
  %sub = fsub double %36, %mul38, !dbg !134
  %42 = load double, double* %volume.addr, align 8, !dbg !135
  %43 = load i32*, i32** @count, align 8, !dbg !136
  %44 = load i32, i32* %i.addr, align 4, !dbg !137
  %idxprom39 = sext i32 %44 to i64, !dbg !136
  %arrayidx40 = getelementptr inbounds i32, i32* %43, i64 %idxprom39, !dbg !136
  %45 = load i32, i32* %arrayidx40, align 4, !dbg !136
  %conv41 = sitofp i32 %45 to double, !dbg !136
  %46 = load i32, i32* %i.addr, align 4, !dbg !138
  %idxprom42 = sext i32 %46 to i64, !dbg !139
  %arrayidx43 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom42, !dbg !139
  %volume44 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx43, i32 0, i32 3, !dbg !140
  %47 = load double, double* %volume44, align 8, !dbg !140
  %mul45 = fmul double %conv41, %47, !dbg !141
  %sub46 = fsub double %42, %mul45, !dbg !142
  call void @knapsack(i32 %add, double %add31, double %sub, double %sub46), !dbg !143
  br label %for.inc47, !dbg !144

for.inc47:                                        ; preds = %for.body24
  %48 = load i32*, i32** @count, align 8, !dbg !145
  %49 = load i32, i32* %i.addr, align 4, !dbg !146
  %idxprom48 = sext i32 %49 to i64, !dbg !145
  %arrayidx49 = getelementptr inbounds i32, i32* %48, i64 %idxprom48, !dbg !145
  %50 = load i32, i32* %arrayidx49, align 4, !dbg !147
  %dec = add nsw i32 %50, -1, !dbg !147
  store i32 %dec, i32* %arrayidx49, align 4, !dbg !147
  br label %for.cond19, !dbg !148, !llvm.loop !149

for.end50:                                        ; preds = %if.end, %for.cond19
  ret void, !dbg !151
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !152 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = load i32, i32* @n, align 4, !dbg !155
  %conv = sext i32 %0 to i64, !dbg !155
  %mul = mul i64 %conv, 4, !dbg !156
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !157
  %1 = bitcast i8* %call to i32*, !dbg !157
  store i32* %1, i32** @count, align 8, !dbg !158
  %2 = load i32, i32* @n, align 4, !dbg !159
  %conv1 = sext i32 %2 to i64, !dbg !159
  %mul2 = mul i64 %conv1, 4, !dbg !160
  %call3 = call noalias i8* @malloc(i64 %mul2) #4, !dbg !161
  %3 = bitcast i8* %call3 to i32*, !dbg !161
  store i32* %3, i32** @best, align 8, !dbg !162
  store double 0.000000e+00, double* @best_value, align 8, !dbg !163
  call void @knapsack(i32 0, double 0.000000e+00, double 2.500000e+01, double 2.500000e-01), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !170
  %5 = load i32, i32* @n, align 4, !dbg !172
  %cmp = icmp slt i32 %4, %5, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** @best, align 8, !dbg !175
  %7 = load i32, i32* %i, align 4, !dbg !177
  %idxprom = sext i32 %7 to i64, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !175
  %8 = load i32, i32* %arrayidx, align 4, !dbg !175
  %9 = load i32, i32* %i, align 4, !dbg !178
  %idxprom5 = sext i32 %9 to i64, !dbg !179
  %arrayidx6 = getelementptr inbounds [3 x %struct.item_t], [3 x %struct.item_t]* @items, i64 0, i64 %idxprom5, !dbg !179
  %name = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx6, i32 0, i32 0, !dbg !180
  %10 = load i8*, i8** %name, align 16, !dbg !180
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %8, i8* %10), !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !183
  %inc = add nsw i32 %11, 1, !dbg !183
  store i32 %inc, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %12 = load double, double* @best_value, align 8, !dbg !187
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), double %12), !dbg !188
  %13 = load i32*, i32** @count, align 8, !dbg !189
  %14 = bitcast i32* %13 to i8*, !dbg !189
  call void @free(i8* %14) #4, !dbg !190
  %15 = load i32*, i32** @best, align 8, !dbg !191
  %16 = bitcast i32* %15 to i8*, !dbg !191
  call void @free(i8* %16) #4, !dbg !192
  ret i32 0, !dbg !193
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "items", scope: !2, file: !3, line: 11, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "knapsack-problem-unbounded.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knapsack-problem-Unbounded")
!4 = !{}
!5 = !{!0, !6, !9, !12, !14}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "n", scope: !2, file: !3, line: 17, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !3, line: 18, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "best", scope: !2, file: !3, line: 19, type: !11, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "best_value", scope: !2, file: !3, line: 20, type: !16, isLocal: false, isDefinition: true)
!16 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 768, elements: !27)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "item_t", file: !3, line: 9, baseType: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 4, size: 256, elements: !20)
!20 = !{!21, !24, !25, !26}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !19, file: !3, line: 5, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !19, file: !3, line: 6, baseType: !16, size: 64, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !19, file: !3, line: 7, baseType: !16, size: 64, offset: 128)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "volume", scope: !19, file: !3, line: 8, baseType: !16, size: 64, offset: 192)
!27 = !{!28}
!28 = !DISubrange(count: 3)
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!33 = distinct !DISubprogram(name: "knapsack", scope: !3, file: !3, line: 22, type: !34, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !8, !16, !16, !16}
!36 = !DILocalVariable(name: "i", arg: 1, scope: !33, file: !3, line: 22, type: !8)
!37 = !DILocation(line: 22, column: 20, scope: !33)
!38 = !DILocalVariable(name: "value", arg: 2, scope: !33, file: !3, line: 22, type: !16)
!39 = !DILocation(line: 22, column: 30, scope: !33)
!40 = !DILocalVariable(name: "weight", arg: 3, scope: !33, file: !3, line: 22, type: !16)
!41 = !DILocation(line: 22, column: 44, scope: !33)
!42 = !DILocalVariable(name: "volume", arg: 4, scope: !33, file: !3, line: 22, type: !16)
!43 = !DILocation(line: 22, column: 59, scope: !33)
!44 = !DILocalVariable(name: "j", scope: !33, file: !3, line: 23, type: !8)
!45 = !DILocation(line: 23, column: 9, scope: !33)
!46 = !DILocalVariable(name: "m1", scope: !33, file: !3, line: 23, type: !8)
!47 = !DILocation(line: 23, column: 12, scope: !33)
!48 = !DILocalVariable(name: "m2", scope: !33, file: !3, line: 23, type: !8)
!49 = !DILocation(line: 23, column: 16, scope: !33)
!50 = !DILocalVariable(name: "m", scope: !33, file: !3, line: 23, type: !8)
!51 = !DILocation(line: 23, column: 20, scope: !33)
!52 = !DILocation(line: 24, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !33, file: !3, line: 24, column: 9)
!54 = !DILocation(line: 24, column: 14, scope: !53)
!55 = !DILocation(line: 24, column: 11, scope: !53)
!56 = !DILocation(line: 24, column: 9, scope: !33)
!57 = !{!"if"}
!58 = !DILocation(line: 25, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !60, file: !3, line: 25, column: 13)
!60 = distinct !DILexicalBlock(scope: !53, file: !3, line: 24, column: 17)
!61 = !DILocation(line: 25, column: 21, scope: !59)
!62 = !DILocation(line: 25, column: 19, scope: !59)
!63 = !DILocation(line: 25, column: 13, scope: !60)
!64 = !DILocation(line: 26, column: 26, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !3, line: 25, column: 33)
!66 = !DILocation(line: 26, column: 24, scope: !65)
!67 = !DILocation(line: 27, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !3, line: 27, column: 13)
!69 = !DILocation(line: 27, column: 18, scope: !68)
!70 = !DILocation(line: 27, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !3, line: 27, column: 13)
!72 = !DILocation(line: 27, column: 29, scope: !71)
!73 = !DILocation(line: 27, column: 27, scope: !71)
!74 = !DILocation(line: 27, column: 13, scope: !68)
!75 = !DILocation(line: 28, column: 27, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 27, column: 37)
!77 = !DILocation(line: 28, column: 33, scope: !76)
!78 = !DILocation(line: 28, column: 17, scope: !76)
!79 = !DILocation(line: 28, column: 22, scope: !76)
!80 = !DILocation(line: 28, column: 25, scope: !76)
!81 = !DILocation(line: 29, column: 13, scope: !76)
!82 = !DILocation(line: 27, column: 33, scope: !71)
!83 = !DILocation(line: 27, column: 13, scope: !71)
!84 = distinct !{!84, !74, !85}
!85 = !DILocation(line: 29, column: 13, scope: !68)
!86 = !DILocation(line: 30, column: 9, scope: !65)
!87 = !DILocation(line: 31, column: 9, scope: !60)
!88 = !DILocation(line: 33, column: 10, scope: !33)
!89 = !DILocation(line: 33, column: 25, scope: !33)
!90 = !DILocation(line: 33, column: 19, scope: !33)
!91 = !DILocation(line: 33, column: 28, scope: !33)
!92 = !DILocation(line: 33, column: 17, scope: !33)
!93 = !DILocation(line: 33, column: 8, scope: !33)
!94 = !DILocation(line: 34, column: 10, scope: !33)
!95 = !DILocation(line: 34, column: 25, scope: !33)
!96 = !DILocation(line: 34, column: 19, scope: !33)
!97 = !DILocation(line: 34, column: 28, scope: !33)
!98 = !DILocation(line: 34, column: 17, scope: !33)
!99 = !DILocation(line: 34, column: 8, scope: !33)
!100 = !DILocation(line: 35, column: 9, scope: !33)
!101 = !DILocation(line: 35, column: 14, scope: !33)
!102 = !DILocation(line: 35, column: 12, scope: !33)
!103 = !DILocation(line: 35, column: 19, scope: !33)
!104 = !DILocation(line: 35, column: 24, scope: !33)
!105 = !DILocation(line: 35, column: 7, scope: !33)
!106 = !DILocation(line: 36, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 5)
!108 = !DILocation(line: 36, column: 10, scope: !107)
!109 = !DILocation(line: 36, column: 16, scope: !107)
!110 = !DILocation(line: 36, column: 19, scope: !107)
!111 = !DILocation(line: 36, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !3, line: 36, column: 5)
!113 = !DILocation(line: 36, column: 30, scope: !112)
!114 = !DILocation(line: 36, column: 33, scope: !112)
!115 = !DILocation(line: 36, column: 5, scope: !107)
!116 = !DILocation(line: 38, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !3, line: 36, column: 51)
!118 = !DILocation(line: 38, column: 15, scope: !117)
!119 = !DILocation(line: 39, column: 13, scope: !117)
!120 = !DILocation(line: 39, column: 21, scope: !117)
!121 = !DILocation(line: 39, column: 27, scope: !117)
!122 = !DILocation(line: 39, column: 38, scope: !117)
!123 = !DILocation(line: 39, column: 32, scope: !117)
!124 = !DILocation(line: 39, column: 41, scope: !117)
!125 = !DILocation(line: 39, column: 30, scope: !117)
!126 = !DILocation(line: 39, column: 19, scope: !117)
!127 = !DILocation(line: 40, column: 13, scope: !117)
!128 = !DILocation(line: 40, column: 22, scope: !117)
!129 = !DILocation(line: 40, column: 28, scope: !117)
!130 = !DILocation(line: 40, column: 39, scope: !117)
!131 = !DILocation(line: 40, column: 33, scope: !117)
!132 = !DILocation(line: 40, column: 42, scope: !117)
!133 = !DILocation(line: 40, column: 31, scope: !117)
!134 = !DILocation(line: 40, column: 20, scope: !117)
!135 = !DILocation(line: 41, column: 13, scope: !117)
!136 = !DILocation(line: 41, column: 22, scope: !117)
!137 = !DILocation(line: 41, column: 28, scope: !117)
!138 = !DILocation(line: 41, column: 39, scope: !117)
!139 = !DILocation(line: 41, column: 33, scope: !117)
!140 = !DILocation(line: 41, column: 42, scope: !117)
!141 = !DILocation(line: 41, column: 31, scope: !117)
!142 = !DILocation(line: 41, column: 20, scope: !117)
!143 = !DILocation(line: 37, column: 9, scope: !117)
!144 = !DILocation(line: 43, column: 5, scope: !117)
!145 = !DILocation(line: 36, column: 39, scope: !112)
!146 = !DILocation(line: 36, column: 45, scope: !112)
!147 = !DILocation(line: 36, column: 47, scope: !112)
!148 = !DILocation(line: 36, column: 5, scope: !112)
!149 = distinct !{!149, !115, !150}
!150 = !DILocation(line: 43, column: 5, scope: !107)
!151 = !DILocation(line: 44, column: 1, scope: !33)
!152 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 46, type: !153, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DISubroutineType(types: !154)
!154 = !{!8}
!155 = !DILocation(line: 47, column: 20, scope: !152)
!156 = !DILocation(line: 47, column: 22, scope: !152)
!157 = !DILocation(line: 47, column: 13, scope: !152)
!158 = !DILocation(line: 47, column: 11, scope: !152)
!159 = !DILocation(line: 48, column: 19, scope: !152)
!160 = !DILocation(line: 48, column: 21, scope: !152)
!161 = !DILocation(line: 48, column: 12, scope: !152)
!162 = !DILocation(line: 48, column: 10, scope: !152)
!163 = !DILocation(line: 49, column: 16, scope: !152)
!164 = !DILocation(line: 50, column: 5, scope: !152)
!165 = !DILocalVariable(name: "i", scope: !152, file: !3, line: 51, type: !8)
!166 = !DILocation(line: 51, column: 9, scope: !152)
!167 = !DILocation(line: 52, column: 12, scope: !168)
!168 = distinct !DILexicalBlock(scope: !152, file: !3, line: 52, column: 5)
!169 = !DILocation(line: 52, column: 10, scope: !168)
!170 = !DILocation(line: 52, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !3, line: 52, column: 5)
!172 = !DILocation(line: 52, column: 21, scope: !171)
!173 = !DILocation(line: 52, column: 19, scope: !171)
!174 = !DILocation(line: 52, column: 5, scope: !168)
!175 = !DILocation(line: 53, column: 27, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !3, line: 52, column: 29)
!177 = !DILocation(line: 53, column: 32, scope: !176)
!178 = !DILocation(line: 53, column: 42, scope: !176)
!179 = !DILocation(line: 53, column: 36, scope: !176)
!180 = !DILocation(line: 53, column: 45, scope: !176)
!181 = !DILocation(line: 53, column: 9, scope: !176)
!182 = !DILocation(line: 54, column: 5, scope: !176)
!183 = !DILocation(line: 52, column: 25, scope: !171)
!184 = !DILocation(line: 52, column: 5, scope: !171)
!185 = distinct !{!185, !174, !186}
!186 = !DILocation(line: 54, column: 5, scope: !168)
!187 = !DILocation(line: 55, column: 34, scope: !152)
!188 = !DILocation(line: 55, column: 5, scope: !152)
!189 = !DILocation(line: 56, column: 10, scope: !152)
!190 = !DILocation(line: 56, column: 5, scope: !152)
!191 = !DILocation(line: 56, column: 23, scope: !152)
!192 = !DILocation(line: 56, column: 18, scope: !152)
!193 = !DILocation(line: 57, column: 5, scope: !152)
