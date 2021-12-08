; ModuleID = 'benfords-law.ll'
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
  call void @llvm.dbg.value(metadata i32 1, metadata !26, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !26, metadata !DIExpression()), !dbg !29
  %cmp = icmp slt i32 %i.0, 10, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %conv = sitofp i32 %i.0 to double, !dbg !34
  %div = fdiv double 1.000000e+00, %conv, !dbg !35
  %add = fadd double 1.000000e+00, %div, !dbg !36
  %conv1 = fptrunc double %add to float, !dbg !37
  %call = call float @log10f(float %conv1) #6, !dbg !38
  %sub = sub nsw i32 %i.0, 1, !dbg !39
  %idxprom = sext i32 %sub to i64, !dbg !40
  %arrayidx = getelementptr inbounds [9 x float], [9 x float]* @benford_distribution.prob, i64 0, i64 %idxprom, !dbg !40
  store float %call, float* %arrayidx, align 4, !dbg !41
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !42
  call void @llvm.dbg.value(metadata i32 %inc, metadata !26, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  ret float* getelementptr inbounds ([9 x float], [9 x float]* @benford_distribution.prob, i64 0, i64 0), !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local float @log10f(float) #2

; Function Attrs: noinline nounwind uwtable
define dso_local float* @get_actual_distribution(i8* %fn) #0 !dbg !14 {
entry:
  %tally = alloca [9 x i32], align 16
  call void @llvm.dbg.value(metadata i8* %fn, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call %struct._IO_FILE* @fopen(i8* %fn, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !50, metadata !DIExpression()), !dbg !48
  %tobool = icmp ne %struct._IO_FILE* %call, null, !dbg !111
  br i1 %tobool, label %if.end, label %if.then, !dbg !113

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @exit(i32 1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [9 x i32]* %tally, metadata !117, metadata !DIExpression()), !dbg !119
  %0 = bitcast [9 x i32]* %tally to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 36, i1 false), !dbg !119
  call void @llvm.dbg.value(metadata i32 0, metadata !120, metadata !DIExpression()), !dbg !48
  br label %while.cond, !dbg !121

while.cond:                                       ; preds = %while.end26, %if.end
  %total.0 = phi i32 [ 0, %if.end ], [ %inc15, %while.end26 ], !dbg !48
  call void @llvm.dbg.value(metadata i32 %total.0, metadata !120, metadata !DIExpression()), !dbg !48
  %call1 = call i32 @getc(%struct._IO_FILE* %call), !dbg !122
  %conv = trunc i32 %call1 to i8, !dbg !122
  call void @llvm.dbg.value(metadata i8 %conv, metadata !123, metadata !DIExpression()), !dbg !48
  %conv2 = sext i8 %conv to i32, !dbg !124
  %cmp = icmp ne i32 %conv2, -1, !dbg !125
  br i1 %cmp, label %while.body, label %while.end27, !dbg !121

while.body:                                       ; preds = %while.cond
  br label %while.cond4, !dbg !126

while.cond4:                                      ; preds = %while.body11, %while.body
  %c.0 = phi i8 [ %conv, %while.body ], [ %conv13, %while.body11 ], !dbg !48
  call void @llvm.dbg.value(metadata i8 %c.0, metadata !123, metadata !DIExpression()), !dbg !48
  %conv5 = sext i8 %c.0 to i32, !dbg !128
  %cmp6 = icmp slt i32 %conv5, 49, !dbg !129
  br i1 %cmp6, label %lor.end, label %lor.rhs, !dbg !130

lor.rhs:                                          ; preds = %while.cond4
  %conv8 = sext i8 %c.0 to i32, !dbg !131
  %cmp9 = icmp sgt i32 %conv8, 57, !dbg !132
  br label %lor.end, !dbg !130

lor.end:                                          ; preds = %lor.rhs, %while.cond4
  %1 = phi i1 [ true, %while.cond4 ], [ %cmp9, %lor.rhs ]
  br i1 %1, label %while.body11, label %while.end, !dbg !126

while.body11:                                     ; preds = %lor.end
  %call12 = call i32 @getc(%struct._IO_FILE* %call), !dbg !133
  %conv13 = trunc i32 %call12 to i8, !dbg !133
  call void @llvm.dbg.value(metadata i8 %conv13, metadata !123, metadata !DIExpression()), !dbg !48
  br label %while.cond4, !dbg !126, !llvm.loop !134

while.end:                                        ; preds = %lor.end
  %conv14 = sext i8 %c.0 to i32, !dbg !136
  %sub = sub nsw i32 %conv14, 49, !dbg !137
  %idxprom = sext i32 %sub to i64, !dbg !138
  %arrayidx = getelementptr inbounds [9 x i32], [9 x i32]* %tally, i64 0, i64 %idxprom, !dbg !138
  %2 = load i32, i32* %arrayidx, align 4, !dbg !139
  %inc = add nsw i32 %2, 1, !dbg !139
  store i32 %inc, i32* %arrayidx, align 4, !dbg !139
  %inc15 = add nsw i32 %total.0, 1, !dbg !140
  call void @llvm.dbg.value(metadata i32 %inc15, metadata !120, metadata !DIExpression()), !dbg !48
  br label %while.cond16, !dbg !141

while.cond16:                                     ; preds = %while.body25, %while.end
  %call17 = call i32 @getc(%struct._IO_FILE* %call), !dbg !142
  %conv18 = trunc i32 %call17 to i8, !dbg !142
  call void @llvm.dbg.value(metadata i8 %conv18, metadata !123, metadata !DIExpression()), !dbg !48
  %conv19 = sext i8 %conv18 to i32, !dbg !143
  %cmp20 = icmp ne i32 %conv19, 10, !dbg !144
  br i1 %cmp20, label %land.rhs, label %land.end, !dbg !145

land.rhs:                                         ; preds = %while.cond16
  %conv22 = sext i8 %conv18 to i32, !dbg !146
  %cmp23 = icmp ne i32 %conv22, -1, !dbg !147
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond16
  %3 = phi i1 [ false, %while.cond16 ], [ %cmp23, %land.rhs ], !dbg !148
  br i1 %3, label %while.body25, label %while.end26, !dbg !141

while.body25:                                     ; preds = %land.end
  br label %while.cond16, !dbg !141, !llvm.loop !149

while.end26:                                      ; preds = %land.end
  br label %while.cond, !dbg !121, !llvm.loop !151

while.end27:                                      ; preds = %while.cond
  %call28 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !153
  call void @llvm.dbg.value(metadata i32 0, metadata !154, metadata !DIExpression()), !dbg !156
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %while.end27
  %i.0 = phi i32 [ 0, %while.end27 ], [ %inc37, %for.inc ], !dbg !156
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !154, metadata !DIExpression()), !dbg !156
  %cmp29 = icmp slt i32 %i.0, 9, !dbg !158
  br i1 %cmp29, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %idxprom31 = sext i32 %i.0 to i64, !dbg !161
  %arrayidx32 = getelementptr inbounds [9 x i32], [9 x i32]* %tally, i64 0, i64 %idxprom31, !dbg !161
  %4 = load i32, i32* %arrayidx32, align 4, !dbg !161
  %conv33 = sitofp i32 %4 to float, !dbg !161
  %conv34 = sitofp i32 %total.0 to float, !dbg !162
  %div = fdiv float %conv33, %conv34, !dbg !163
  %idxprom35 = sext i32 %i.0 to i64, !dbg !164
  %arrayidx36 = getelementptr inbounds [9 x float], [9 x float]* @get_actual_distribution.freq, i64 0, i64 %idxprom35, !dbg !164
  store float %div, float* %arrayidx36, align 4, !dbg !165
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %inc37 = add nsw i32 %i.0, 1, !dbg !166
  call void @llvm.dbg.value(metadata i32 %inc37, metadata !154, metadata !DIExpression()), !dbg !156
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  ret float* getelementptr inbounds ([9 x float], [9 x float]* @get_actual_distribution.freq, i64 0, i64 0), !dbg !170
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
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !171 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.value(metadata i8** %argv, metadata !177, metadata !DIExpression()), !dbg !176
  %cmp = icmp ne i32 %argc, 2, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0)), !dbg !181
  br label %return, !dbg !183

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !184
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !184
  %call1 = call float* @get_actual_distribution(i8* %0), !dbg !185
  call void @llvm.dbg.value(metadata float* %call1, metadata !186, metadata !DIExpression()), !dbg !176
  %call2 = call float* @benford_distribution(), !dbg !187
  call void @llvm.dbg.value(metadata float* %call2, metadata !188, metadata !DIExpression()), !dbg !176
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0)), !dbg !189
  call void @llvm.dbg.value(metadata i32 0, metadata !190, metadata !DIExpression()), !dbg !192
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !192
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !190, metadata !DIExpression()), !dbg !192
  %cmp4 = icmp slt i32 %i.0, 9, !dbg !194
  br i1 %cmp4, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 1, !dbg !197
  %idxprom = sext i32 %i.0 to i64, !dbg !198
  %arrayidx5 = getelementptr inbounds float, float* %call1, i64 %idxprom, !dbg !198
  %1 = load float, float* %arrayidx5, align 4, !dbg !198
  %conv = fpext float %1 to double, !dbg !198
  %idxprom6 = sext i32 %i.0 to i64, !dbg !199
  %arrayidx7 = getelementptr inbounds float, float* %call2, i64 %idxprom6, !dbg !199
  %2 = load float, float* %arrayidx7, align 4, !dbg !199
  %conv8 = fpext float %2 to double, !dbg !199
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %add, double %conv, double %conv8), !dbg !200
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !201
  call void @llvm.dbg.value(metadata i32 %inc, metadata !190, metadata !DIExpression()), !dbg !192
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !205

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %for.end ], !dbg !176
  ret i32 %retval.0, !dbg !206
}

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @puts(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!8 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, retainedTypes: !10, globals: !11, splitDebugInlining: false, nameTableKind: None)
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
!25 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!26 = !DILocalVariable(name: "i", scope: !27, file: !3, line: 8, type: !28)
!27 = distinct !DILexicalBlock(scope: !2, file: !3, line: 8, column: 5)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 0, scope: !27)
!30 = !DILocation(line: 8, column: 10, scope: !27)
!31 = !DILocation(line: 8, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 8, column: 5)
!33 = !DILocation(line: 8, column: 5, scope: !27)
!34 = !DILocation(line: 9, column: 40, scope: !32)
!35 = !DILocation(line: 9, column: 38, scope: !32)
!36 = !DILocation(line: 9, column: 32, scope: !32)
!37 = !DILocation(line: 9, column: 30, scope: !32)
!38 = !DILocation(line: 9, column: 23, scope: !32)
!39 = !DILocation(line: 9, column: 16, scope: !32)
!40 = !DILocation(line: 9, column: 9, scope: !32)
!41 = !DILocation(line: 9, column: 21, scope: !32)
!42 = !DILocation(line: 8, column: 30, scope: !32)
!43 = !DILocation(line: 8, column: 5, scope: !32)
!44 = distinct !{!44, !33, !45}
!45 = !DILocation(line: 9, column: 41, scope: !27)
!46 = !DILocation(line: 11, column: 5, scope: !2)
!47 = !DILocalVariable(name: "fn", arg: 1, scope: !14, file: !3, line: 14, type: !17)
!48 = !DILocation(line: 0, scope: !14)
!49 = !DILocation(line: 16, column: 19, scope: !14)
!50 = !DILocalVariable(name: "input", scope: !14, file: !3, line: 16, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !53, line: 7, baseType: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !55, line: 49, size: 1728, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!56 = !{!57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !72, !74, !75, !76, !80, !82, !84, !88, !91, !93, !96, !99, !100, !102, !106, !107}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !54, file: !55, line: 51, baseType: !28, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !54, file: !55, line: 54, baseType: !17, size: 64, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !54, file: !55, line: 55, baseType: !17, size: 64, offset: 128)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !54, file: !55, line: 56, baseType: !17, size: 64, offset: 192)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !54, file: !55, line: 57, baseType: !17, size: 64, offset: 256)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !54, file: !55, line: 58, baseType: !17, size: 64, offset: 320)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !54, file: !55, line: 59, baseType: !17, size: 64, offset: 384)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !54, file: !55, line: 60, baseType: !17, size: 64, offset: 448)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !54, file: !55, line: 61, baseType: !17, size: 64, offset: 512)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !54, file: !55, line: 64, baseType: !17, size: 64, offset: 576)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !54, file: !55, line: 65, baseType: !17, size: 64, offset: 640)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !54, file: !55, line: 66, baseType: !17, size: 64, offset: 704)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !54, file: !55, line: 68, baseType: !70, size: 64, offset: 768)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !55, line: 36, flags: DIFlagFwdDecl)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !54, file: !55, line: 70, baseType: !73, size: 64, offset: 832)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !54, file: !55, line: 72, baseType: !28, size: 32, offset: 896)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !54, file: !55, line: 73, baseType: !28, size: 32, offset: 928)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !54, file: !55, line: 74, baseType: !77, size: 64, offset: 960)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !78, line: 152, baseType: !79)
!78 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!79 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !54, file: !55, line: 77, baseType: !81, size: 16, offset: 1024)
!81 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !54, file: !55, line: 78, baseType: !83, size: 8, offset: 1040)
!83 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !54, file: !55, line: 79, baseType: !85, size: 8, offset: 1048)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 1)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !54, file: !55, line: 81, baseType: !89, size: 64, offset: 1088)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !55, line: 43, baseType: null)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !54, file: !55, line: 89, baseType: !92, size: 64, offset: 1152)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !78, line: 153, baseType: !79)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !54, file: !55, line: 91, baseType: !94, size: 64, offset: 1216)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !55, line: 37, flags: DIFlagFwdDecl)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !54, file: !55, line: 92, baseType: !97, size: 64, offset: 1280)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !55, line: 38, flags: DIFlagFwdDecl)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !54, file: !55, line: 93, baseType: !73, size: 64, offset: 1344)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !54, file: !55, line: 94, baseType: !101, size: 64, offset: 1408)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !54, file: !55, line: 95, baseType: !103, size: 64, offset: 1472)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !104, line: 46, baseType: !105)
!104 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!105 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !54, file: !55, line: 96, baseType: !28, size: 32, offset: 1536)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !54, file: !55, line: 98, baseType: !108, size: 160, offset: 1568)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 20)
!111 = !DILocation(line: 17, column: 10, scope: !112)
!112 = distinct !DILexicalBlock(scope: !14, file: !3, line: 17, column: 9)
!113 = !DILocation(line: 17, column: 9, scope: !14)
!114 = !DILocation(line: 19, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 18, column: 5)
!116 = !DILocation(line: 20, column: 9, scope: !115)
!117 = !DILocalVariable(name: "tally", scope: !14, file: !3, line: 23, type: !118)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 288, elements: !20)
!119 = !DILocation(line: 23, column: 9, scope: !14)
!120 = !DILocalVariable(name: "total", scope: !14, file: !3, line: 25, type: !28)
!121 = !DILocation(line: 26, column: 5, scope: !14)
!122 = !DILocation(line: 26, column: 17, scope: !14)
!123 = !DILocalVariable(name: "c", scope: !14, file: !3, line: 24, type: !18)
!124 = !DILocation(line: 26, column: 12, scope: !14)
!125 = !DILocation(line: 26, column: 30, scope: !14)
!126 = !DILocation(line: 29, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !14, file: !3, line: 27, column: 5)
!128 = !DILocation(line: 29, column: 16, scope: !127)
!129 = !DILocation(line: 29, column: 18, scope: !127)
!130 = !DILocation(line: 29, column: 24, scope: !127)
!131 = !DILocation(line: 29, column: 27, scope: !127)
!132 = !DILocation(line: 29, column: 29, scope: !127)
!133 = !DILocation(line: 30, column: 17, scope: !127)
!134 = distinct !{!134, !126, !135}
!135 = !DILocation(line: 30, column: 27, scope: !127)
!136 = !DILocation(line: 32, column: 15, scope: !127)
!137 = !DILocation(line: 32, column: 17, scope: !127)
!138 = !DILocation(line: 32, column: 9, scope: !127)
!139 = !DILocation(line: 32, column: 23, scope: !127)
!140 = !DILocation(line: 33, column: 14, scope: !127)
!141 = !DILocation(line: 36, column: 9, scope: !127)
!142 = !DILocation(line: 36, column: 21, scope: !127)
!143 = !DILocation(line: 36, column: 16, scope: !127)
!144 = !DILocation(line: 36, column: 34, scope: !127)
!145 = !DILocation(line: 36, column: 42, scope: !127)
!146 = !DILocation(line: 36, column: 45, scope: !127)
!147 = !DILocation(line: 36, column: 47, scope: !127)
!148 = !DILocation(line: 0, scope: !127)
!149 = distinct !{!149, !141, !150}
!150 = !DILocation(line: 37, column: 13, scope: !127)
!151 = distinct !{!151, !121, !152}
!152 = !DILocation(line: 38, column: 5, scope: !14)
!153 = !DILocation(line: 39, column: 5, scope: !14)
!154 = !DILocalVariable(name: "i", scope: !155, file: !3, line: 42, type: !28)
!155 = distinct !DILexicalBlock(scope: !14, file: !3, line: 42, column: 5)
!156 = !DILocation(line: 0, scope: !155)
!157 = !DILocation(line: 42, column: 10, scope: !155)
!158 = !DILocation(line: 42, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !3, line: 42, column: 5)
!160 = !DILocation(line: 42, column: 5, scope: !155)
!161 = !DILocation(line: 43, column: 19, scope: !159)
!162 = !DILocation(line: 43, column: 30, scope: !159)
!163 = !DILocation(line: 43, column: 28, scope: !159)
!164 = !DILocation(line: 43, column: 9, scope: !159)
!165 = !DILocation(line: 43, column: 17, scope: !159)
!166 = !DILocation(line: 42, column: 29, scope: !159)
!167 = !DILocation(line: 42, column: 5, scope: !159)
!168 = distinct !{!168, !160, !169}
!169 = !DILocation(line: 43, column: 38, scope: !155)
!170 = !DILocation(line: 45, column: 5, scope: !14)
!171 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 48, type: !172, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!172 = !DISubroutineType(types: !173)
!173 = !{!28, !28, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!175 = !DILocalVariable(name: "argc", arg: 1, scope: !171, file: !3, line: 48, type: !28)
!176 = !DILocation(line: 0, scope: !171)
!177 = !DILocalVariable(name: "argv", arg: 2, scope: !171, file: !3, line: 48, type: !174)
!178 = !DILocation(line: 50, column: 14, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !3, line: 50, column: 9)
!180 = !DILocation(line: 50, column: 9, scope: !171)
!181 = !DILocation(line: 52, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !3, line: 51, column: 5)
!183 = !DILocation(line: 53, column: 9, scope: !182)
!184 = !DILocation(line: 56, column: 45, scope: !171)
!185 = !DILocation(line: 56, column: 21, scope: !171)
!186 = !DILocalVariable(name: "actual", scope: !171, file: !3, line: 56, type: !6)
!187 = !DILocation(line: 57, column: 23, scope: !171)
!188 = !DILocalVariable(name: "expected", scope: !171, file: !3, line: 57, type: !6)
!189 = !DILocation(line: 59, column: 5, scope: !171)
!190 = !DILocalVariable(name: "i", scope: !191, file: !3, line: 60, type: !28)
!191 = distinct !DILexicalBlock(scope: !171, file: !3, line: 60, column: 5)
!192 = !DILocation(line: 0, scope: !191)
!193 = !DILocation(line: 60, column: 10, scope: !191)
!194 = !DILocation(line: 60, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !3, line: 60, column: 5)
!196 = !DILocation(line: 60, column: 5, scope: !191)
!197 = !DILocation(line: 61, column: 38, scope: !195)
!198 = !DILocation(line: 61, column: 43, scope: !195)
!199 = !DILocation(line: 61, column: 54, scope: !195)
!200 = !DILocation(line: 61, column: 9, scope: !195)
!201 = !DILocation(line: 60, column: 29, scope: !195)
!202 = !DILocation(line: 60, column: 5, scope: !195)
!203 = distinct !{!203, !196, !204}
!204 = !DILocation(line: 61, column: 65, scope: !191)
!205 = !DILocation(line: 63, column: 5, scope: !171)
!206 = !DILocation(line: 64, column: 1, scope: !171)
