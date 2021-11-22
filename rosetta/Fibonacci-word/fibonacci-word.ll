; ModuleID = 'fibonacci-word.c'
source_filename = "fibonacci-word.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%2s\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c" %10s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Length\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c" %-20s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"Entropy\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c" %-40s\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Word\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c" %-20.18f\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%2d\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c" %10ld\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"...\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"0\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_headings() #0 !dbg !9 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !12
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)), !dbg !13
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0)), !dbg !14
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0)), !dbg !15
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)), !dbg !16
  ret void, !dbg !17
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @calculate_entropy(i32 %ones, i32 %zeros) #0 !dbg !18 {
entry:
  %ones.addr = alloca i32, align 4
  %zeros.addr = alloca i32, align 4
  %result = alloca double, align 8
  %total = alloca i32, align 4
  store i32 %ones, i32* %ones.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ones.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %zeros, i32* %zeros.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %zeros.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata double* %result, metadata !26, metadata !DIExpression()), !dbg !27
  store double 0.000000e+00, double* %result, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %total, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %ones.addr, align 4, !dbg !30
  %1 = load i32, i32* %zeros.addr, align 4, !dbg !31
  %add = add nsw i32 %0, %1, !dbg !32
  store i32 %add, i32* %total, align 4, !dbg !29
  %2 = load i32, i32* %ones.addr, align 4, !dbg !33
  %conv = sitofp i32 %2 to double, !dbg !34
  %3 = load i32, i32* %total, align 4, !dbg !35
  %conv1 = sitofp i32 %3 to double, !dbg !35
  %div = fdiv double %conv, %conv1, !dbg !36
  %4 = load i32, i32* %ones.addr, align 4, !dbg !37
  %conv2 = sitofp i32 %4 to double, !dbg !38
  %5 = load i32, i32* %total, align 4, !dbg !39
  %conv3 = sitofp i32 %5 to double, !dbg !39
  %div4 = fdiv double %conv2, %conv3, !dbg !40
  %call = call double @log2(double %div4) #5, !dbg !41
  %mul = fmul double %div, %call, !dbg !42
  %6 = load double, double* %result, align 8, !dbg !43
  %sub = fsub double %6, %mul, !dbg !43
  store double %sub, double* %result, align 8, !dbg !43
  %7 = load i32, i32* %zeros.addr, align 4, !dbg !44
  %conv5 = sitofp i32 %7 to double, !dbg !45
  %8 = load i32, i32* %total, align 4, !dbg !46
  %conv6 = sitofp i32 %8 to double, !dbg !46
  %div7 = fdiv double %conv5, %conv6, !dbg !47
  %9 = load i32, i32* %zeros.addr, align 4, !dbg !48
  %conv8 = sitofp i32 %9 to double, !dbg !49
  %10 = load i32, i32* %total, align 4, !dbg !50
  %conv9 = sitofp i32 %10 to double, !dbg !50
  %div10 = fdiv double %conv8, %conv9, !dbg !51
  %call11 = call double @log2(double %div10) #5, !dbg !52
  %mul12 = fmul double %div7, %call11, !dbg !53
  %11 = load double, double* %result, align 8, !dbg !54
  %sub13 = fsub double %11, %mul12, !dbg !54
  store double %sub13, double* %result, align 8, !dbg !54
  %12 = load double, double* %result, align 8, !dbg !55
  %13 = load double, double* %result, align 8, !dbg !57
  %cmp = fcmp une double %12, %13, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59, !cf.info !60

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %result, align 8, !dbg !61
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  %14 = load double, double* %result, align 8, !dbg !64
  ret double %14, !dbg !65
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local double @log2(double) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_entropy(i8* %word) #0 !dbg !66 {
entry:
  %word.addr = alloca i8*, align 8
  %ones = alloca i32, align 4
  %zeros = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  %entropy = alloca double, align 8
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %ones, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 0, i32* %ones, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %zeros, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 0, i32* %zeros, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %word.addr, align 8, !dbg !82
  %1 = load i32, i32* %i, align 4, !dbg !84
  %idxprom = sext i32 %1 to i64, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !82
  %2 = load i8, i8* %arrayidx, align 1, !dbg !82
  %tobool = icmp ne i8 %2, 0, !dbg !85
  br i1 %tobool, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8* %c, metadata !86, metadata !DIExpression()), !dbg !88
  %3 = load i8*, i8** %word.addr, align 8, !dbg !89
  %4 = load i32, i32* %i, align 4, !dbg !90
  %idxprom1 = sext i32 %4 to i64, !dbg !89
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %idxprom1, !dbg !89
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !89
  store i8 %5, i8* %c, align 1, !dbg !88
  %6 = load i8, i8* %c, align 1, !dbg !91
  %conv = sext i8 %6 to i32, !dbg !91
  switch i32 %conv, label %sw.epilog [
    i32 48, label %sw.bb
    i32 49, label %sw.bb3
  ], !dbg !92

sw.bb:                                            ; preds = %for.body
  %7 = load i32, i32* %zeros, align 4, !dbg !93
  %inc = add nsw i32 %7, 1, !dbg !93
  store i32 %inc, i32* %zeros, align 4, !dbg !93
  br label %sw.epilog, !dbg !95

sw.bb3:                                           ; preds = %for.body
  %8 = load i32, i32* %ones, align 4, !dbg !96
  %inc4 = add nsw i32 %8, 1, !dbg !96
  store i32 %inc4, i32* %ones, align 4, !dbg !96
  br label %sw.epilog, !dbg !97

sw.epilog:                                        ; preds = %for.body, %sw.bb3, %sw.bb
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %sw.epilog
  %9 = load i32, i32* %i, align 4, !dbg !99
  %inc5 = add nsw i32 %9, 1, !dbg !99
  store i32 %inc5, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata double* %entropy, metadata !103, metadata !DIExpression()), !dbg !104
  %10 = load i32, i32* %ones, align 4, !dbg !105
  %11 = load i32, i32* %zeros, align 4, !dbg !106
  %call = call double @calculate_entropy(i32 %10, i32 %11), !dbg !107
  store double %call, double* %entropy, align 8, !dbg !104
  %12 = load double, double* %entropy, align 8, !dbg !108
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), double %12), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_word(i32 %n, i8* %word) #0 !dbg !111 {
entry:
  %n.addr = alloca i32, align 4
  %word.addr = alloca i8*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* %n.addr, align 4, !dbg !118
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), i32 %0), !dbg !119
  %1 = load i8*, i8** %word.addr, align 8, !dbg !120
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !121
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i64 0, i64 0), i64 %call1), !dbg !122
  %2 = load i8*, i8** %word.addr, align 8, !dbg !123
  call void @print_entropy(i8* %2), !dbg !124
  %3 = load i32, i32* %n.addr, align 4, !dbg !125
  %cmp = icmp slt i32 %3, 10, !dbg !127
  br i1 %cmp, label %if.then, label %if.else, !dbg !128, !cf.info !60

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %word.addr, align 8, !dbg !129
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* %4), !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !137 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %last_word = alloca i8*, align 8
  %current_word = alloca i8*, align 8
  %i = alloca i32, align 4
  %next_word = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !141, metadata !DIExpression()), !dbg !142
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !143, metadata !DIExpression()), !dbg !144
  call void @print_headings(), !dbg !145
  call void @llvm.dbg.declare(metadata i8** %last_word, metadata !146, metadata !DIExpression()), !dbg !147
  %call = call noalias i8* @malloc(i64 2) #5, !dbg !148
  store i8* %call, i8** %last_word, align 8, !dbg !147
  %0 = load i8*, i8** %last_word, align 8, !dbg !149
  %call1 = call i8* @strcpy(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0)) #5, !dbg !150
  call void @llvm.dbg.declare(metadata i8** %current_word, metadata !151, metadata !DIExpression()), !dbg !152
  %call2 = call noalias i8* @malloc(i64 2) #5, !dbg !153
  store i8* %call2, i8** %current_word, align 8, !dbg !152
  %1 = load i8*, i8** %current_word, align 8, !dbg !154
  %call3 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #5, !dbg !155
  %2 = load i8*, i8** %last_word, align 8, !dbg !156
  call void @print_word(i32 1, i8* %2), !dbg !157
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !159
  store i32 2, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !163
  %cmp = icmp sle i32 %3, 37, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !167
  %5 = load i8*, i8** %current_word, align 8, !dbg !169
  call void @print_word(i32 %4, i8* %5), !dbg !170
  call void @llvm.dbg.declare(metadata i8** %next_word, metadata !171, metadata !DIExpression()), !dbg !172
  %6 = load i8*, i8** %current_word, align 8, !dbg !173
  %call4 = call i64 @strlen(i8* %6) #6, !dbg !174
  %7 = load i8*, i8** %last_word, align 8, !dbg !175
  %call5 = call i64 @strlen(i8* %7) #6, !dbg !176
  %add = add i64 %call4, %call5, !dbg !177
  %add6 = add i64 %add, 1, !dbg !178
  %call7 = call noalias i8* @malloc(i64 %add6) #5, !dbg !179
  store i8* %call7, i8** %next_word, align 8, !dbg !172
  %8 = load i8*, i8** %next_word, align 8, !dbg !180
  %9 = load i8*, i8** %current_word, align 8, !dbg !181
  %call8 = call i8* @strcpy(i8* %8, i8* %9) #5, !dbg !182
  %10 = load i8*, i8** %next_word, align 8, !dbg !183
  %11 = load i8*, i8** %last_word, align 8, !dbg !184
  %call9 = call i8* @strcat(i8* %10, i8* %11) #5, !dbg !185
  %12 = load i8*, i8** %last_word, align 8, !dbg !186
  call void @free(i8* %12) #5, !dbg !187
  %13 = load i8*, i8** %current_word, align 8, !dbg !188
  store i8* %13, i8** %last_word, align 8, !dbg !189
  %14 = load i8*, i8** %next_word, align 8, !dbg !190
  store i8* %14, i8** %current_word, align 8, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %15, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %last_word, align 8, !dbg !197
  call void @free(i8* %16) #5, !dbg !198
  %17 = load i8*, i8** %current_word, align 8, !dbg !199
  call void @free(i8* %17) #5, !dbg !200
  ret i32 0, !dbg !201
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fibonacci-word.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fibonacci-word")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!9 = distinct !DISubprogram(name: "print_headings", scope: !1, file: !1, line: 6, type: !10, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !DILocation(line: 8, column: 2, scope: !9)
!13 = !DILocation(line: 9, column: 2, scope: !9)
!14 = !DILocation(line: 10, column: 2, scope: !9)
!15 = !DILocation(line: 11, column: 2, scope: !9)
!16 = !DILocation(line: 12, column: 2, scope: !9)
!17 = !DILocation(line: 13, column: 1, scope: !9)
!18 = distinct !DISubprogram(name: "calculate_entropy", scope: !1, file: !1, line: 15, type: !19, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4, !21, !21}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "ones", arg: 1, scope: !18, file: !1, line: 15, type: !21)
!23 = !DILocation(line: 15, column: 30, scope: !18)
!24 = !DILocalVariable(name: "zeros", arg: 2, scope: !18, file: !1, line: 15, type: !21)
!25 = !DILocation(line: 15, column: 40, scope: !18)
!26 = !DILocalVariable(name: "result", scope: !18, file: !1, line: 17, type: !4)
!27 = !DILocation(line: 17, column: 9, scope: !18)
!28 = !DILocalVariable(name: "total", scope: !18, file: !1, line: 19, type: !21)
!29 = !DILocation(line: 19, column: 6, scope: !18)
!30 = !DILocation(line: 19, column: 14, scope: !18)
!31 = !DILocation(line: 19, column: 21, scope: !18)
!32 = !DILocation(line: 19, column: 19, scope: !18)
!33 = !DILocation(line: 20, column: 21, scope: !18)
!34 = !DILocation(line: 20, column: 12, scope: !18)
!35 = !DILocation(line: 20, column: 28, scope: !18)
!36 = !DILocation(line: 20, column: 26, scope: !18)
!37 = !DILocation(line: 20, column: 50, scope: !18)
!38 = !DILocation(line: 20, column: 41, scope: !18)
!39 = !DILocation(line: 20, column: 57, scope: !18)
!40 = !DILocation(line: 20, column: 55, scope: !18)
!41 = !DILocation(line: 20, column: 36, scope: !18)
!42 = !DILocation(line: 20, column: 34, scope: !18)
!43 = !DILocation(line: 20, column: 9, scope: !18)
!44 = !DILocation(line: 21, column: 21, scope: !18)
!45 = !DILocation(line: 21, column: 12, scope: !18)
!46 = !DILocation(line: 21, column: 29, scope: !18)
!47 = !DILocation(line: 21, column: 27, scope: !18)
!48 = !DILocation(line: 21, column: 51, scope: !18)
!49 = !DILocation(line: 21, column: 42, scope: !18)
!50 = !DILocation(line: 21, column: 59, scope: !18)
!51 = !DILocation(line: 21, column: 57, scope: !18)
!52 = !DILocation(line: 21, column: 37, scope: !18)
!53 = !DILocation(line: 21, column: 35, scope: !18)
!54 = !DILocation(line: 21, column: 9, scope: !18)
!55 = !DILocation(line: 23, column: 6, scope: !56)
!56 = distinct !DILexicalBlock(scope: !18, file: !1, line: 23, column: 6)
!57 = !DILocation(line: 23, column: 16, scope: !56)
!58 = !DILocation(line: 23, column: 13, scope: !56)
!59 = !DILocation(line: 23, column: 6, scope: !18)
!60 = !{!"if"}
!61 = !DILocation(line: 24, column: 10, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !1, line: 23, column: 24)
!63 = !DILocation(line: 25, column: 2, scope: !62)
!64 = !DILocation(line: 27, column: 9, scope: !18)
!65 = !DILocation(line: 27, column: 2, scope: !18)
!66 = distinct !DISubprogram(name: "print_entropy", scope: !1, file: !1, line: 30, type: !67, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{null, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "word", arg: 1, scope: !66, file: !1, line: 30, type: !69)
!72 = !DILocation(line: 30, column: 26, scope: !66)
!73 = !DILocalVariable(name: "ones", scope: !66, file: !1, line: 32, type: !21)
!74 = !DILocation(line: 32, column: 6, scope: !66)
!75 = !DILocalVariable(name: "zeros", scope: !66, file: !1, line: 33, type: !21)
!76 = !DILocation(line: 33, column: 6, scope: !66)
!77 = !DILocalVariable(name: "i", scope: !66, file: !1, line: 35, type: !21)
!78 = !DILocation(line: 35, column: 6, scope: !66)
!79 = !DILocation(line: 36, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !66, file: !1, line: 36, column: 2)
!81 = !DILocation(line: 36, column: 7, scope: !80)
!82 = !DILocation(line: 36, column: 14, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !1, line: 36, column: 2)
!84 = !DILocation(line: 36, column: 19, scope: !83)
!85 = !DILocation(line: 36, column: 2, scope: !80)
!86 = !DILocalVariable(name: "c", scope: !87, file: !1, line: 37, type: !70)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 36, column: 28)
!88 = !DILocation(line: 37, column: 8, scope: !87)
!89 = !DILocation(line: 37, column: 12, scope: !87)
!90 = !DILocation(line: 37, column: 17, scope: !87)
!91 = !DILocation(line: 39, column: 11, scope: !87)
!92 = !DILocation(line: 39, column: 3, scope: !87)
!93 = !DILocation(line: 41, column: 10, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !1, line: 39, column: 14)
!95 = !DILocation(line: 42, column: 5, scope: !94)
!96 = !DILocation(line: 44, column: 9, scope: !94)
!97 = !DILocation(line: 45, column: 5, scope: !94)
!98 = !DILocation(line: 47, column: 2, scope: !87)
!99 = !DILocation(line: 36, column: 24, scope: !83)
!100 = !DILocation(line: 36, column: 2, scope: !83)
!101 = distinct !{!101, !85, !102}
!102 = !DILocation(line: 47, column: 2, scope: !80)
!103 = !DILocalVariable(name: "entropy", scope: !66, file: !1, line: 49, type: !4)
!104 = !DILocation(line: 49, column: 9, scope: !66)
!105 = !DILocation(line: 49, column: 37, scope: !66)
!106 = !DILocation(line: 49, column: 43, scope: !66)
!107 = !DILocation(line: 49, column: 19, scope: !66)
!108 = !DILocation(line: 50, column: 22, scope: !66)
!109 = !DILocation(line: 50, column: 2, scope: !66)
!110 = !DILocation(line: 51, column: 1, scope: !66)
!111 = distinct !DISubprogram(name: "print_word", scope: !1, file: !1, line: 53, type: !112, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{null, !21, !69}
!114 = !DILocalVariable(name: "n", arg: 1, scope: !111, file: !1, line: 53, type: !21)
!115 = !DILocation(line: 53, column: 21, scope: !111)
!116 = !DILocalVariable(name: "word", arg: 2, scope: !111, file: !1, line: 53, type: !69)
!117 = !DILocation(line: 53, column: 30, scope: !111)
!118 = !DILocation(line: 55, column: 16, scope: !111)
!119 = !DILocation(line: 55, column: 2, scope: !111)
!120 = !DILocation(line: 57, column: 26, scope: !111)
!121 = !DILocation(line: 57, column: 19, scope: !111)
!122 = !DILocation(line: 57, column: 2, scope: !111)
!123 = !DILocation(line: 59, column: 16, scope: !111)
!124 = !DILocation(line: 59, column: 2, scope: !111)
!125 = !DILocation(line: 61, column: 6, scope: !126)
!126 = distinct !DILexicalBlock(scope: !111, file: !1, line: 61, column: 6)
!127 = !DILocation(line: 61, column: 8, scope: !126)
!128 = !DILocation(line: 61, column: 6, scope: !111)
!129 = !DILocation(line: 62, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !1, line: 61, column: 14)
!131 = !DILocation(line: 62, column: 3, scope: !130)
!132 = !DILocation(line: 63, column: 2, scope: !130)
!133 = !DILocation(line: 64, column: 3, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !1, line: 63, column: 9)
!135 = !DILocation(line: 67, column: 2, scope: !111)
!136 = !DILocation(line: 68, column: 1, scope: !111)
!137 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 70, type: !138, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DISubroutineType(types: !139)
!139 = !{!21, !21, !140}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!141 = !DILocalVariable(name: "argc", arg: 1, scope: !137, file: !1, line: 70, type: !21)
!142 = !DILocation(line: 70, column: 14, scope: !137)
!143 = !DILocalVariable(name: "argv", arg: 2, scope: !137, file: !1, line: 70, type: !140)
!144 = !DILocation(line: 70, column: 26, scope: !137)
!145 = !DILocation(line: 72, column: 2, scope: !137)
!146 = !DILocalVariable(name: "last_word", scope: !137, file: !1, line: 74, type: !69)
!147 = !DILocation(line: 74, column: 8, scope: !137)
!148 = !DILocation(line: 74, column: 20, scope: !137)
!149 = !DILocation(line: 75, column: 9, scope: !137)
!150 = !DILocation(line: 75, column: 2, scope: !137)
!151 = !DILocalVariable(name: "current_word", scope: !137, file: !1, line: 77, type: !69)
!152 = !DILocation(line: 77, column: 8, scope: !137)
!153 = !DILocation(line: 77, column: 23, scope: !137)
!154 = !DILocation(line: 78, column: 9, scope: !137)
!155 = !DILocation(line: 78, column: 2, scope: !137)
!156 = !DILocation(line: 80, column: 16, scope: !137)
!157 = !DILocation(line: 80, column: 2, scope: !137)
!158 = !DILocalVariable(name: "i", scope: !137, file: !1, line: 81, type: !21)
!159 = !DILocation(line: 81, column: 6, scope: !137)
!160 = !DILocation(line: 82, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !137, file: !1, line: 82, column: 2)
!162 = !DILocation(line: 82, column: 7, scope: !161)
!163 = !DILocation(line: 82, column: 14, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 82, column: 2)
!165 = !DILocation(line: 82, column: 16, scope: !164)
!166 = !DILocation(line: 82, column: 2, scope: !161)
!167 = !DILocation(line: 83, column: 14, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !1, line: 82, column: 28)
!169 = !DILocation(line: 83, column: 17, scope: !168)
!170 = !DILocation(line: 83, column: 3, scope: !168)
!171 = !DILocalVariable(name: "next_word", scope: !168, file: !1, line: 85, type: !69)
!172 = !DILocation(line: 85, column: 9, scope: !168)
!173 = !DILocation(line: 85, column: 35, scope: !168)
!174 = !DILocation(line: 85, column: 28, scope: !168)
!175 = !DILocation(line: 85, column: 58, scope: !168)
!176 = !DILocation(line: 85, column: 51, scope: !168)
!177 = !DILocation(line: 85, column: 49, scope: !168)
!178 = !DILocation(line: 85, column: 69, scope: !168)
!179 = !DILocation(line: 85, column: 21, scope: !168)
!180 = !DILocation(line: 86, column: 10, scope: !168)
!181 = !DILocation(line: 86, column: 21, scope: !168)
!182 = !DILocation(line: 86, column: 3, scope: !168)
!183 = !DILocation(line: 87, column: 10, scope: !168)
!184 = !DILocation(line: 87, column: 21, scope: !168)
!185 = !DILocation(line: 87, column: 3, scope: !168)
!186 = !DILocation(line: 89, column: 8, scope: !168)
!187 = !DILocation(line: 89, column: 3, scope: !168)
!188 = !DILocation(line: 90, column: 15, scope: !168)
!189 = !DILocation(line: 90, column: 13, scope: !168)
!190 = !DILocation(line: 91, column: 18, scope: !168)
!191 = !DILocation(line: 91, column: 16, scope: !168)
!192 = !DILocation(line: 92, column: 2, scope: !168)
!193 = !DILocation(line: 82, column: 24, scope: !164)
!194 = !DILocation(line: 82, column: 2, scope: !164)
!195 = distinct !{!195, !166, !196}
!196 = !DILocation(line: 92, column: 2, scope: !161)
!197 = !DILocation(line: 94, column: 7, scope: !137)
!198 = !DILocation(line: 94, column: 2, scope: !137)
!199 = !DILocation(line: 95, column: 7, scope: !137)
!200 = !DILocation(line: 95, column: 2, scope: !137)
!201 = !DILocation(line: 96, column: 2, scope: !137)
