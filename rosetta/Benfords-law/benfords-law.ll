; ModuleID = 'benfords-law.c'
source_filename = "benfords-law.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@benford_distribution.prob = internal global [9 x float] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Can't open file\00", align 1
@get_actual_distribution.freq = internal global [9 x float] zeroinitializer, align 16, !dbg !12
@.str.2 = private unnamed_addr constant [23 x i8] c"Usage: benford <file>\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"digit\09actual\09expected\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"%d\09%.3f\09%.3f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local float* @benford_distribution() #0 !dbg !2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !29
  store i32 1, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 10, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !35
  %conv = sitofp i32 %1 to double, !dbg !35
  %div = fdiv double 1.000000e+00, %conv, !dbg !36
  %add = fadd double 1.000000e+00, %div, !dbg !37
  %conv1 = fptrunc double %add to float, !dbg !38
  %call = call float @log10f(float %conv1) #6, !dbg !39
  %2 = load i32, i32* %i, align 4, !dbg !40
  %sub = sub nsw i32 %2, 1, !dbg !41
  %idxprom = sext i32 %sub to i64, !dbg !42
  %arrayidx = getelementptr inbounds [9 x float], [9 x float]* @benford_distribution.prob, i64 0, i64 %idxprom, !dbg !42
  store float %call, float* %arrayidx, align 4, !dbg !43
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %3, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  ret float* getelementptr inbounds ([9 x float], [9 x float]* @benford_distribution.prob, i64 0, i64 0), !dbg !48
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local float @log10f(float) #2

; Function Attrs: noinline nounwind uwtable
define dso_local float* @get_actual_distribution(i8* %fn) #0 !dbg !14 {
entry:
  %fn.addr = alloca i8*, align 8
  %input = alloca %struct._IO_FILE*, align 8
  %tally = alloca [9 x i32], align 16
  %c = alloca i8, align 1
  %total = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %fn, i8** %fn.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fn.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %input, metadata !51, metadata !DIExpression()), !dbg !112
  %0 = load i8*, i8** %fn.addr, align 8, !dbg !113
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !114
  store %struct._IO_FILE* %call, %struct._IO_FILE** %input, align 8, !dbg !112
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %input, align 8, !dbg !115
  %tobool = icmp ne %struct._IO_FILE* %1, null, !dbg !115
  br i1 %tobool, label %if.end, label %if.then, !dbg !117, !cf.info !118

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @exit(i32 1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [9 x i32]* %tally, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = bitcast [9 x i32]* %tally to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 36, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i8* %c, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %total, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 0, i32* %total, align 4, !dbg !128
  br label %while.cond, !dbg !129

while.cond:                                       ; preds = %while.end26, %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %input, align 8, !dbg !130
  %call1 = call i32 @getc(%struct._IO_FILE* %3), !dbg !131
  %conv = trunc i32 %call1 to i8, !dbg !131
  store i8 %conv, i8* %c, align 1, !dbg !132
  %conv2 = sext i8 %conv to i32, !dbg !133
  %cmp = icmp ne i32 %conv2, -1, !dbg !134
  br i1 %cmp, label %while.body, label %while.end27, !dbg !129

while.body:                                       ; preds = %while.cond
  br label %while.cond4, !dbg !135

while.cond4:                                      ; preds = %while.body11, %while.body
  %4 = load i8, i8* %c, align 1, !dbg !137
  %conv5 = sext i8 %4 to i32, !dbg !137
  %cmp6 = icmp slt i32 %conv5, 49, !dbg !138
  br i1 %cmp6, label %lor.end, label %lor.rhs, !dbg !139

lor.rhs:                                          ; preds = %while.cond4
  %5 = load i8, i8* %c, align 1, !dbg !140
  %conv8 = sext i8 %5 to i32, !dbg !140
  %cmp9 = icmp sgt i32 %conv8, 57, !dbg !141
  br label %lor.end, !dbg !139

lor.end:                                          ; preds = %lor.rhs, %while.cond4
  %6 = phi i1 [ true, %while.cond4 ], [ %cmp9, %lor.rhs ]
  br i1 %6, label %while.body11, label %while.end, !dbg !135

while.body11:                                     ; preds = %lor.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %input, align 8, !dbg !142
  %call12 = call i32 @getc(%struct._IO_FILE* %7), !dbg !143
  %conv13 = trunc i32 %call12 to i8, !dbg !143
  store i8 %conv13, i8* %c, align 1, !dbg !144
  br label %while.cond4, !dbg !135, !llvm.loop !145

while.end:                                        ; preds = %lor.end
  %8 = load i8, i8* %c, align 1, !dbg !147
  %conv14 = sext i8 %8 to i32, !dbg !147
  %sub = sub nsw i32 %conv14, 49, !dbg !148
  %idxprom = sext i32 %sub to i64, !dbg !149
  %arrayidx = getelementptr inbounds [9 x i32], [9 x i32]* %tally, i64 0, i64 %idxprom, !dbg !149
  %9 = load i32, i32* %arrayidx, align 4, !dbg !150
  %inc = add nsw i32 %9, 1, !dbg !150
  store i32 %inc, i32* %arrayidx, align 4, !dbg !150
  %10 = load i32, i32* %total, align 4, !dbg !151
  %inc15 = add nsw i32 %10, 1, !dbg !151
  store i32 %inc15, i32* %total, align 4, !dbg !151
  br label %while.cond16, !dbg !152

while.cond16:                                     ; preds = %while.body25, %while.end
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %input, align 8, !dbg !153
  %call17 = call i32 @getc(%struct._IO_FILE* %11), !dbg !154
  %conv18 = trunc i32 %call17 to i8, !dbg !154
  store i8 %conv18, i8* %c, align 1, !dbg !155
  %conv19 = sext i8 %conv18 to i32, !dbg !156
  %cmp20 = icmp ne i32 %conv19, 10, !dbg !157
  br i1 %cmp20, label %land.rhs, label %land.end, !dbg !158

land.rhs:                                         ; preds = %while.cond16
  %12 = load i8, i8* %c, align 1, !dbg !159
  %conv22 = sext i8 %12 to i32, !dbg !159
  %cmp23 = icmp ne i32 %conv22, -1, !dbg !160
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond16
  %13 = phi i1 [ false, %while.cond16 ], [ %cmp23, %land.rhs ], !dbg !161
  br i1 %13, label %while.body25, label %while.end26, !dbg !152

while.body25:                                     ; preds = %land.end
  br label %while.cond16, !dbg !152, !llvm.loop !162

while.end26:                                      ; preds = %land.end
  br label %while.cond, !dbg !129, !llvm.loop !164

while.end27:                                      ; preds = %while.cond
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %input, align 8, !dbg !166
  %call28 = call i32 @fclose(%struct._IO_FILE* %14), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !170
  store i32 0, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %while.end27
  %15 = load i32, i32* %i, align 4, !dbg !172
  %cmp29 = icmp slt i32 %15, 9, !dbg !174
  br i1 %cmp29, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !176
  %idxprom31 = sext i32 %16 to i64, !dbg !177
  %arrayidx32 = getelementptr inbounds [9 x i32], [9 x i32]* %tally, i64 0, i64 %idxprom31, !dbg !177
  %17 = load i32, i32* %arrayidx32, align 4, !dbg !177
  %conv33 = sitofp i32 %17 to float, !dbg !177
  %18 = load i32, i32* %total, align 4, !dbg !178
  %conv34 = sitofp i32 %18 to float, !dbg !179
  %div = fdiv float %conv33, %conv34, !dbg !180
  %19 = load i32, i32* %i, align 4, !dbg !181
  %idxprom35 = sext i32 %19 to i64, !dbg !182
  %arrayidx36 = getelementptr inbounds [9 x float], [9 x float]* @get_actual_distribution.freq, i64 0, i64 %idxprom35, !dbg !182
  store float %div, float* %arrayidx36, align 4, !dbg !183
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !184
  %inc37 = add nsw i32 %20, 1, !dbg !184
  store i32 %inc37, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  ret float* getelementptr inbounds ([9 x float], [9 x float]* @get_actual_distribution.freq, i64 0, i64 0), !dbg !188
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local void @perror(i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local i32 @getc(%struct._IO_FILE*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !189 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %actual = alloca float*, align 8
  %expected = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %0 = load i32, i32* %argc.addr, align 4, !dbg !197
  %cmp = icmp ne i32 %0, 2, !dbg !199
  br i1 %cmp, label %if.then, label %if.end, !dbg !200, !cf.info !118

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0)), !dbg !201
  store i32 1, i32* %retval, align 4, !dbg !203
  br label %return, !dbg !203

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata float** %actual, metadata !204, metadata !DIExpression()), !dbg !205
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !206
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !206
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !206
  %call1 = call float* @get_actual_distribution(i8* %2), !dbg !207
  store float* %call1, float** %actual, align 8, !dbg !205
  call void @llvm.dbg.declare(metadata float** %expected, metadata !208, metadata !DIExpression()), !dbg !209
  %call2 = call float* @benford_distribution(), !dbg !210
  store float* %call2, float** %expected, align 8, !dbg !209
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0)), !dbg !211
  call void @llvm.dbg.declare(metadata i32* %i, metadata !212, metadata !DIExpression()), !dbg !214
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !216
  %cmp4 = icmp slt i32 %3, 9, !dbg !218
  br i1 %cmp4, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !220
  %add = add nsw i32 %4, 1, !dbg !221
  %5 = load float*, float** %actual, align 8, !dbg !222
  %6 = load i32, i32* %i, align 4, !dbg !223
  %idxprom = sext i32 %6 to i64, !dbg !222
  %arrayidx5 = getelementptr inbounds float, float* %5, i64 %idxprom, !dbg !222
  %7 = load float, float* %arrayidx5, align 4, !dbg !222
  %conv = fpext float %7 to double, !dbg !222
  %8 = load float*, float** %expected, align 8, !dbg !224
  %9 = load i32, i32* %i, align 4, !dbg !225
  %idxprom6 = sext i32 %9 to i64, !dbg !224
  %arrayidx7 = getelementptr inbounds float, float* %8, i64 %idxprom6, !dbg !224
  %10 = load float, float* %arrayidx7, align 4, !dbg !224
  %conv8 = fpext float %10 to double, !dbg !224
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %add, double %conv, double %conv8), !dbg !226
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !227
  %inc = add nsw i32 %11, 1, !dbg !227
  store i32 %inc, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !231
  br label %return, !dbg !231

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !232
  ret i32 %12, !dbg !232
}

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @puts(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "prob", scope: !2, file: !3, line: 7, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "benford_distribution", scope: !3, file: !3, line: 5, type: !4, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!3 = !DIFile(filename: "benfords-law.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Benfords-law")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!8 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, retainedTypes: !10, globals: !11, splitDebugInlining: false, nameTableKind: None)
!9 = !{}
!10 = !{!7}
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "freq", scope: !14, file: !3, line: 41, type: !19, isLocal: true, isDefinition: true)
!14 = distinct !DISubprogram(name: "get_actual_distribution", scope: !3, file: !3, line: 14, type: !15, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 288, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 9)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!26 = !DILocalVariable(name: "i", scope: !27, file: !3, line: 8, type: !28)
!27 = distinct !DILexicalBlock(scope: !2, file: !3, line: 8, column: 5)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 8, column: 14, scope: !27)
!30 = !DILocation(line: 8, column: 10, scope: !27)
!31 = !DILocation(line: 8, column: 21, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 8, column: 5)
!33 = !DILocation(line: 8, column: 23, scope: !32)
!34 = !DILocation(line: 8, column: 5, scope: !27)
!35 = !DILocation(line: 9, column: 40, scope: !32)
!36 = !DILocation(line: 9, column: 38, scope: !32)
!37 = !DILocation(line: 9, column: 32, scope: !32)
!38 = !DILocation(line: 9, column: 30, scope: !32)
!39 = !DILocation(line: 9, column: 23, scope: !32)
!40 = !DILocation(line: 9, column: 14, scope: !32)
!41 = !DILocation(line: 9, column: 16, scope: !32)
!42 = !DILocation(line: 9, column: 9, scope: !32)
!43 = !DILocation(line: 9, column: 21, scope: !32)
!44 = !DILocation(line: 8, column: 30, scope: !32)
!45 = !DILocation(line: 8, column: 5, scope: !32)
!46 = distinct !{!46, !34, !47}
!47 = !DILocation(line: 9, column: 41, scope: !27)
!48 = !DILocation(line: 11, column: 5, scope: !2)
!49 = !DILocalVariable(name: "fn", arg: 1, scope: !14, file: !3, line: 14, type: !17)
!50 = !DILocation(line: 14, column: 38, scope: !14)
!51 = !DILocalVariable(name: "input", scope: !14, file: !3, line: 16, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !54, line: 7, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !56, line: 49, size: 1728, elements: !57)
!56 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!57 = !{!58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !73, !75, !76, !77, !81, !83, !85, !89, !92, !94, !97, !100, !101, !103, !107, !108}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !55, file: !56, line: 51, baseType: !28, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !55, file: !56, line: 54, baseType: !17, size: 64, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !55, file: !56, line: 55, baseType: !17, size: 64, offset: 128)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !55, file: !56, line: 56, baseType: !17, size: 64, offset: 192)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !55, file: !56, line: 57, baseType: !17, size: 64, offset: 256)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !55, file: !56, line: 58, baseType: !17, size: 64, offset: 320)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !55, file: !56, line: 59, baseType: !17, size: 64, offset: 384)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !55, file: !56, line: 60, baseType: !17, size: 64, offset: 448)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !55, file: !56, line: 61, baseType: !17, size: 64, offset: 512)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !55, file: !56, line: 64, baseType: !17, size: 64, offset: 576)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !55, file: !56, line: 65, baseType: !17, size: 64, offset: 640)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !55, file: !56, line: 66, baseType: !17, size: 64, offset: 704)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !55, file: !56, line: 68, baseType: !71, size: 64, offset: 768)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !56, line: 36, flags: DIFlagFwdDecl)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !55, file: !56, line: 70, baseType: !74, size: 64, offset: 832)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !55, file: !56, line: 72, baseType: !28, size: 32, offset: 896)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !55, file: !56, line: 73, baseType: !28, size: 32, offset: 928)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !55, file: !56, line: 74, baseType: !78, size: 64, offset: 960)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !79, line: 152, baseType: !80)
!79 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!80 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !55, file: !56, line: 77, baseType: !82, size: 16, offset: 1024)
!82 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !55, file: !56, line: 78, baseType: !84, size: 8, offset: 1040)
!84 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !55, file: !56, line: 79, baseType: !86, size: 8, offset: 1048)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 1)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !55, file: !56, line: 81, baseType: !90, size: 64, offset: 1088)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !56, line: 43, baseType: null)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !55, file: !56, line: 89, baseType: !93, size: 64, offset: 1152)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !79, line: 153, baseType: !80)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !55, file: !56, line: 91, baseType: !95, size: 64, offset: 1216)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !56, line: 37, flags: DIFlagFwdDecl)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !55, file: !56, line: 92, baseType: !98, size: 64, offset: 1280)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !56, line: 38, flags: DIFlagFwdDecl)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !55, file: !56, line: 93, baseType: !74, size: 64, offset: 1344)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !55, file: !56, line: 94, baseType: !102, size: 64, offset: 1408)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !55, file: !56, line: 95, baseType: !104, size: 64, offset: 1472)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !105, line: 46, baseType: !106)
!105 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!106 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !55, file: !56, line: 96, baseType: !28, size: 32, offset: 1536)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !55, file: !56, line: 98, baseType: !109, size: 160, offset: 1568)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 20)
!112 = !DILocation(line: 16, column: 11, scope: !14)
!113 = !DILocation(line: 16, column: 25, scope: !14)
!114 = !DILocation(line: 16, column: 19, scope: !14)
!115 = !DILocation(line: 17, column: 10, scope: !116)
!116 = distinct !DILexicalBlock(scope: !14, file: !3, line: 17, column: 9)
!117 = !DILocation(line: 17, column: 9, scope: !14)
!118 = !{!"if"}
!119 = !DILocation(line: 19, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !3, line: 18, column: 5)
!121 = !DILocation(line: 20, column: 9, scope: !120)
!122 = !DILocalVariable(name: "tally", scope: !14, file: !3, line: 23, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 288, elements: !20)
!124 = !DILocation(line: 23, column: 9, scope: !14)
!125 = !DILocalVariable(name: "c", scope: !14, file: !3, line: 24, type: !18)
!126 = !DILocation(line: 24, column: 10, scope: !14)
!127 = !DILocalVariable(name: "total", scope: !14, file: !3, line: 25, type: !28)
!128 = !DILocation(line: 25, column: 9, scope: !14)
!129 = !DILocation(line: 26, column: 5, scope: !14)
!130 = !DILocation(line: 26, column: 22, scope: !14)
!131 = !DILocation(line: 26, column: 17, scope: !14)
!132 = !DILocation(line: 26, column: 15, scope: !14)
!133 = !DILocation(line: 26, column: 12, scope: !14)
!134 = !DILocation(line: 26, column: 30, scope: !14)
!135 = !DILocation(line: 29, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !14, file: !3, line: 27, column: 5)
!137 = !DILocation(line: 29, column: 16, scope: !136)
!138 = !DILocation(line: 29, column: 18, scope: !136)
!139 = !DILocation(line: 29, column: 24, scope: !136)
!140 = !DILocation(line: 29, column: 27, scope: !136)
!141 = !DILocation(line: 29, column: 29, scope: !136)
!142 = !DILocation(line: 30, column: 22, scope: !136)
!143 = !DILocation(line: 30, column: 17, scope: !136)
!144 = !DILocation(line: 30, column: 15, scope: !136)
!145 = distinct !{!145, !135, !146}
!146 = !DILocation(line: 30, column: 27, scope: !136)
!147 = !DILocation(line: 32, column: 15, scope: !136)
!148 = !DILocation(line: 32, column: 17, scope: !136)
!149 = !DILocation(line: 32, column: 9, scope: !136)
!150 = !DILocation(line: 32, column: 23, scope: !136)
!151 = !DILocation(line: 33, column: 14, scope: !136)
!152 = !DILocation(line: 36, column: 9, scope: !136)
!153 = !DILocation(line: 36, column: 26, scope: !136)
!154 = !DILocation(line: 36, column: 21, scope: !136)
!155 = !DILocation(line: 36, column: 19, scope: !136)
!156 = !DILocation(line: 36, column: 16, scope: !136)
!157 = !DILocation(line: 36, column: 34, scope: !136)
!158 = !DILocation(line: 36, column: 42, scope: !136)
!159 = !DILocation(line: 36, column: 45, scope: !136)
!160 = !DILocation(line: 36, column: 47, scope: !136)
!161 = !DILocation(line: 0, scope: !136)
!162 = distinct !{!162, !152, !163}
!163 = !DILocation(line: 37, column: 13, scope: !136)
!164 = distinct !{!164, !129, !165}
!165 = !DILocation(line: 38, column: 5, scope: !14)
!166 = !DILocation(line: 39, column: 12, scope: !14)
!167 = !DILocation(line: 39, column: 5, scope: !14)
!168 = !DILocalVariable(name: "i", scope: !169, file: !3, line: 42, type: !28)
!169 = distinct !DILexicalBlock(scope: !14, file: !3, line: 42, column: 5)
!170 = !DILocation(line: 42, column: 14, scope: !169)
!171 = !DILocation(line: 42, column: 10, scope: !169)
!172 = !DILocation(line: 42, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !3, line: 42, column: 5)
!174 = !DILocation(line: 42, column: 23, scope: !173)
!175 = !DILocation(line: 42, column: 5, scope: !169)
!176 = !DILocation(line: 43, column: 25, scope: !173)
!177 = !DILocation(line: 43, column: 19, scope: !173)
!178 = !DILocation(line: 43, column: 38, scope: !173)
!179 = !DILocation(line: 43, column: 30, scope: !173)
!180 = !DILocation(line: 43, column: 28, scope: !173)
!181 = !DILocation(line: 43, column: 14, scope: !173)
!182 = !DILocation(line: 43, column: 9, scope: !173)
!183 = !DILocation(line: 43, column: 17, scope: !173)
!184 = !DILocation(line: 42, column: 29, scope: !173)
!185 = !DILocation(line: 42, column: 5, scope: !173)
!186 = distinct !{!186, !175, !187}
!187 = !DILocation(line: 43, column: 38, scope: !169)
!188 = !DILocation(line: 45, column: 5, scope: !14)
!189 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 48, type: !190, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!190 = !DISubroutineType(types: !191)
!191 = !{!28, !28, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!193 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !3, line: 48, type: !28)
!194 = !DILocation(line: 48, column: 14, scope: !189)
!195 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !3, line: 48, type: !192)
!196 = !DILocation(line: 48, column: 27, scope: !189)
!197 = !DILocation(line: 50, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !189, file: !3, line: 50, column: 9)
!199 = !DILocation(line: 50, column: 14, scope: !198)
!200 = !DILocation(line: 50, column: 9, scope: !189)
!201 = !DILocation(line: 52, column: 9, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !3, line: 51, column: 5)
!203 = !DILocation(line: 53, column: 9, scope: !202)
!204 = !DILocalVariable(name: "actual", scope: !189, file: !3, line: 56, type: !6)
!205 = !DILocation(line: 56, column: 12, scope: !189)
!206 = !DILocation(line: 56, column: 45, scope: !189)
!207 = !DILocation(line: 56, column: 21, scope: !189)
!208 = !DILocalVariable(name: "expected", scope: !189, file: !3, line: 57, type: !6)
!209 = !DILocation(line: 57, column: 12, scope: !189)
!210 = !DILocation(line: 57, column: 23, scope: !189)
!211 = !DILocation(line: 59, column: 5, scope: !189)
!212 = !DILocalVariable(name: "i", scope: !213, file: !3, line: 60, type: !28)
!213 = distinct !DILexicalBlock(scope: !189, file: !3, line: 60, column: 5)
!214 = !DILocation(line: 60, column: 14, scope: !213)
!215 = !DILocation(line: 60, column: 10, scope: !213)
!216 = !DILocation(line: 60, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !3, line: 60, column: 5)
!218 = !DILocation(line: 60, column: 23, scope: !217)
!219 = !DILocation(line: 60, column: 5, scope: !213)
!220 = !DILocation(line: 61, column: 36, scope: !217)
!221 = !DILocation(line: 61, column: 38, scope: !217)
!222 = !DILocation(line: 61, column: 43, scope: !217)
!223 = !DILocation(line: 61, column: 50, scope: !217)
!224 = !DILocation(line: 61, column: 54, scope: !217)
!225 = !DILocation(line: 61, column: 63, scope: !217)
!226 = !DILocation(line: 61, column: 9, scope: !217)
!227 = !DILocation(line: 60, column: 29, scope: !217)
!228 = !DILocation(line: 60, column: 5, scope: !217)
!229 = distinct !{!229, !219, !230}
!230 = !DILocation(line: 61, column: 65, scope: !213)
!231 = !DILocation(line: 63, column: 5, scope: !189)
!232 = !DILocation(line: 64, column: 1, scope: !189)
