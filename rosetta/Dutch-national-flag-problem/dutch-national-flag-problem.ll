; ModuleID = 'dutch-national-flag-problem.c'
source_filename = "dutch-national-flag-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Accidentally still sorted: \00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"Non-sorted: \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Sorted: \00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Sort failed: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compar(i8* %a, i8* %b) #0 !dbg !12 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8* %c1, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %a.addr, align 8, !dbg !24
  %1 = load i8, i8* %0, align 1, !dbg !25
  store i8 %1, i8* %c1, align 1, !dbg !23
  call void @llvm.dbg.declare(metadata i8* %c2, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = load i8*, i8** %b.addr, align 8, !dbg !28
  %3 = load i8, i8* %2, align 1, !dbg !29
  store i8 %3, i8* %c2, align 1, !dbg !27
  %4 = load i8, i8* %c1, align 1, !dbg !30
  %conv = sext i8 %4 to i32, !dbg !30
  %5 = load i8, i8* %c2, align 1, !dbg !31
  %conv1 = sext i8 %5 to i32, !dbg !31
  %sub = sub nsw i32 %conv, %conv1, !dbg !32
  ret i32 %sub, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @issorted(i8* %balls) #0 !dbg !34 {
entry:
  %retval = alloca i1, align 1
  %balls.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %state = alloca i32, align 4
  store i8* %balls, i8** %balls.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %balls.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %state, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 0, i32* %state, align 4, !dbg !45
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !49
  %cmp = icmp slt i32 %0, 5, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %balls.addr, align 8, !dbg !53
  %2 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %2 to i64, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !53
  %3 = load i8, i8* %arrayidx, align 1, !dbg !53
  %conv = sext i8 %3 to i32, !dbg !53
  %4 = load i32, i32* %state, align 4, !dbg !57
  %cmp1 = icmp slt i32 %conv, %4, !dbg !58
  br i1 %cmp1, label %if.then, label %if.end, !dbg !59, !cf.info !60

if.then:                                          ; preds = %for.body
  store i1 false, i1* %retval, align 1, !dbg !61
  br label %return, !dbg !61

if.end:                                           ; preds = %for.body
  %5 = load i8*, i8** %balls.addr, align 8, !dbg !62
  %6 = load i32, i32* %i, align 4, !dbg !64
  %idxprom3 = sext i32 %6 to i64, !dbg !62
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %idxprom3, !dbg !62
  %7 = load i8, i8* %arrayidx4, align 1, !dbg !62
  %conv5 = sext i8 %7 to i32, !dbg !62
  %8 = load i32, i32* %state, align 4, !dbg !65
  %cmp6 = icmp sgt i32 %conv5, %8, !dbg !66
  br i1 %cmp6, label %if.then8, label %if.end12, !dbg !67, !cf.info !60

if.then8:                                         ; preds = %if.end
  %9 = load i8*, i8** %balls.addr, align 8, !dbg !68
  %10 = load i32, i32* %i, align 4, !dbg !69
  %idxprom9 = sext i32 %10 to i64, !dbg !68
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i64 %idxprom9, !dbg !68
  %11 = load i8, i8* %arrayidx10, align 1, !dbg !68
  %conv11 = sext i8 %11 to i32, !dbg !68
  store i32 %conv11, i32* %state, align 4, !dbg !70
  br label %if.end12, !dbg !71

if.end12:                                         ; preds = %if.then8, %if.end
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %if.end12
  %12 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %12, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  store i1 true, i1* %retval, align 1, !dbg !77
  br label %return, !dbg !77

return:                                           ; preds = %for.end, %if.then
  %13 = load i1, i1* %retval, align 1, !dbg !78
  ret i1 %13, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printout(i8* %balls) #0 !dbg !79 {
entry:
  %balls.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %str = alloca [6 x i8], align 1
  store i8* %balls, i8** %balls.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %balls.addr, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %i, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [6 x i8]* %str, metadata !86, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %i, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 5, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %balls.addr, align 8, !dbg !98
  %2 = load i32, i32* %i, align 4, !dbg !99
  %idxprom = sext i32 %2 to i64, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !98
  %3 = load i8, i8* %arrayidx, align 1, !dbg !98
  %conv = sext i8 %3 to i32, !dbg !98
  %cmp1 = icmp eq i32 %conv, 0, !dbg !100
  br i1 %cmp1, label %cond.true, label %cond.false, !dbg !98

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !98

cond.false:                                       ; preds = %for.body
  %4 = load i8*, i8** %balls.addr, align 8, !dbg !101
  %5 = load i32, i32* %i, align 4, !dbg !102
  %idxprom3 = sext i32 %5 to i64, !dbg !101
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %idxprom3, !dbg !101
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !101
  %conv5 = sext i8 %6 to i32, !dbg !101
  %cmp6 = icmp eq i32 %conv5, 1, !dbg !103
  %7 = zext i1 %cmp6 to i64, !dbg !101
  %cond = select i1 %cmp6, i32 119, i32 98, !dbg !101
  br label %cond.end, !dbg !98

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond8 = phi i32 [ 114, %cond.true ], [ %cond, %cond.false ], !dbg !98
  %conv9 = trunc i32 %cond8 to i8, !dbg !98
  %8 = load i32, i32* %i, align 4, !dbg !104
  %idxprom10 = sext i32 %8 to i64, !dbg !105
  %arrayidx11 = getelementptr inbounds [6 x i8], [6 x i8]* %str, i64 0, i64 %idxprom10, !dbg !105
  store i8 %conv9, i8* %arrayidx11, align 1, !dbg !106
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %cond.end
  %9 = load i32, i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %9, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [6 x i8], [6 x i8]* %str, i64 0, i64 0, !dbg !111
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %arraydecay), !dbg !112
  ret void, !dbg !113
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !114 {
entry:
  %retval = alloca i32, align 4
  %balls = alloca [5 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i8]* %balls, metadata !117, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call i64 @time(i64* null) #4, !dbg !124
  %conv = trunc i64 %call to i32, !dbg !124
  call void @srand(i32 %conv) #4, !dbg !125
  %call1 = call i32 @rand() #4, !dbg !126
  store i32 0, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !130
  %cmp = icmp slt i32 %0, 5, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %call3 = call i32 @rand() #4, !dbg !134
  %conv4 = sitofp i32 %call3 to double, !dbg !135
  %div = fdiv double %conv4, 0x41DFFFFFFFC00000, !dbg !136
  %mul = fmul double %div, 3.000000e+00, !dbg !137
  %conv5 = fptosi double %mul to i8, !dbg !135
  %1 = load i32, i32* %i, align 4, !dbg !138
  %idxprom = sext i32 %1 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 %idxprom, !dbg !139
  store i8 %conv5, i8* %arrayidx, align 1, !dbg !140
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !141
  %inc = add nsw i32 %2, 1, !dbg !141
  store i32 %inc, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !145

while.cond:                                       ; preds = %for.end22, %for.end
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !146
  %call6 = call zeroext i1 @issorted(i8* %arraydecay), !dbg !147
  br i1 %call6, label %while.body, label %while.end, !dbg !145

while.body:                                       ; preds = %while.cond
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0)), !dbg !148
  %arraydecay8 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !150
  call void @printout(i8* %arraydecay8), !dbg !151
  store i32 0, i32* %i, align 4, !dbg !152
  br label %for.cond9, !dbg !154

for.cond9:                                        ; preds = %for.inc20, %while.body
  %3 = load i32, i32* %i, align 4, !dbg !155
  %cmp10 = icmp slt i32 %3, 5, !dbg !157
  br i1 %cmp10, label %for.body12, label %for.end22, !dbg !158

for.body12:                                       ; preds = %for.cond9
  %call13 = call i32 @rand() #4, !dbg !159
  %conv14 = sitofp i32 %call13 to double, !dbg !160
  %div15 = fdiv double %conv14, 0x41DFFFFFFFC00000, !dbg !161
  %mul16 = fmul double %div15, 3.000000e+00, !dbg !162
  %conv17 = fptosi double %mul16 to i8, !dbg !160
  %4 = load i32, i32* %i, align 4, !dbg !163
  %idxprom18 = sext i32 %4 to i64, !dbg !164
  %arrayidx19 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 %idxprom18, !dbg !164
  store i8 %conv17, i8* %arrayidx19, align 1, !dbg !165
  br label %for.inc20, !dbg !164

for.inc20:                                        ; preds = %for.body12
  %5 = load i32, i32* %i, align 4, !dbg !166
  %inc21 = add nsw i32 %5, 1, !dbg !166
  store i32 %inc21, i32* %i, align 4, !dbg !166
  br label %for.cond9, !dbg !167, !llvm.loop !168

for.end22:                                        ; preds = %for.cond9
  br label %while.cond, !dbg !145, !llvm.loop !170

while.end:                                        ; preds = %while.cond
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0)), !dbg !172
  %arraydecay24 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !173
  call void @printout(i8* %arraydecay24), !dbg !174
  %arraydecay25 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !175
  call void @qsort(i8* %arraydecay25, i64 5, i64 1, i32 (i8*, i8*)* @compar), !dbg !176
  %arraydecay26 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !177
  %call27 = call zeroext i1 @issorted(i8* %arraydecay26), !dbg !179
  br i1 %call27, label %if.then, label %if.else, !dbg !180, !cf.info !60

if.then:                                          ; preds = %while.end
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)), !dbg !181
  %arraydecay29 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !183
  call void @printout(i8* %arraydecay29), !dbg !184
  br label %if.end, !dbg !185

if.else:                                          ; preds = %while.end
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0)), !dbg !186
  %arraydecay31 = getelementptr inbounds [5 x i8], [5 x i8]* %balls, i64 0, i64 0, !dbg !188
  call void @printout(i8* %arraydecay31), !dbg !189
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0, !dbg !190
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "dutch-national-flag-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dutch-national-flag-problem")
!2 = !{}
!3 = !{!4, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!12 = distinct !DISubprogram(name: "compar", scope: !1, file: !1, line: 8, type: !13, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !16, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!18 = !DILocalVariable(name: "a", arg: 1, scope: !12, file: !1, line: 8, type: !16)
!19 = !DILocation(line: 8, column: 24, scope: !12)
!20 = !DILocalVariable(name: "b", arg: 2, scope: !12, file: !1, line: 8, type: !16)
!21 = !DILocation(line: 8, column: 39, scope: !12)
!22 = !DILocalVariable(name: "c1", scope: !12, file: !1, line: 9, type: !6)
!23 = !DILocation(line: 9, column: 7, scope: !12)
!24 = !DILocation(line: 9, column: 24, scope: !12)
!25 = !DILocation(line: 9, column: 10, scope: !12)
!26 = !DILocalVariable(name: "c2", scope: !12, file: !1, line: 9, type: !6)
!27 = !DILocation(line: 9, column: 27, scope: !12)
!28 = !DILocation(line: 9, column: 44, scope: !12)
!29 = !DILocation(line: 9, column: 30, scope: !12)
!30 = !DILocation(line: 10, column: 9, scope: !12)
!31 = !DILocation(line: 10, column: 12, scope: !12)
!32 = !DILocation(line: 10, column: 11, scope: !12)
!33 = !DILocation(line: 10, column: 2, scope: !12)
!34 = distinct !DISubprogram(name: "issorted", scope: !1, file: !1, line: 13, type: !35, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !38}
!37 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!39 = !DILocalVariable(name: "balls", arg: 1, scope: !34, file: !1, line: 13, type: !38)
!40 = !DILocation(line: 13, column: 22, scope: !34)
!41 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 14, type: !15)
!42 = !DILocation(line: 14, column: 6, scope: !34)
!43 = !DILocalVariable(name: "state", scope: !34, file: !1, line: 14, type: !15)
!44 = !DILocation(line: 14, column: 8, scope: !34)
!45 = !DILocation(line: 15, column: 7, scope: !34)
!46 = !DILocation(line: 16, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !1, line: 16, column: 2)
!48 = !DILocation(line: 16, column: 6, scope: !47)
!49 = !DILocation(line: 16, column: 10, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 16, column: 2)
!51 = !DILocation(line: 16, column: 11, scope: !50)
!52 = !DILocation(line: 16, column: 2, scope: !47)
!53 = !DILocation(line: 17, column: 6, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 17, column: 6)
!55 = distinct !DILexicalBlock(scope: !50, file: !1, line: 16, column: 25)
!56 = !DILocation(line: 17, column: 12, scope: !54)
!57 = !DILocation(line: 17, column: 15, scope: !54)
!58 = !DILocation(line: 17, column: 14, scope: !54)
!59 = !DILocation(line: 17, column: 6, scope: !55)
!60 = !{!"if"}
!61 = !DILocation(line: 17, column: 21, scope: !54)
!62 = !DILocation(line: 18, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !1, line: 18, column: 6)
!64 = !DILocation(line: 18, column: 12, scope: !63)
!65 = !DILocation(line: 18, column: 15, scope: !63)
!66 = !DILocation(line: 18, column: 14, scope: !63)
!67 = !DILocation(line: 18, column: 6, scope: !55)
!68 = !DILocation(line: 18, column: 27, scope: !63)
!69 = !DILocation(line: 18, column: 33, scope: !63)
!70 = !DILocation(line: 18, column: 26, scope: !63)
!71 = !DILocation(line: 18, column: 21, scope: !63)
!72 = !DILocation(line: 19, column: 2, scope: !55)
!73 = !DILocation(line: 16, column: 22, scope: !50)
!74 = !DILocation(line: 16, column: 2, scope: !50)
!75 = distinct !{!75, !52, !76}
!76 = !DILocation(line: 19, column: 2, scope: !47)
!77 = !DILocation(line: 20, column: 2, scope: !34)
!78 = !DILocation(line: 21, column: 1, scope: !34)
!79 = distinct !DISubprogram(name: "printout", scope: !1, file: !1, line: 23, type: !80, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !38}
!82 = !DILocalVariable(name: "balls", arg: 1, scope: !79, file: !1, line: 23, type: !38)
!83 = !DILocation(line: 23, column: 21, scope: !79)
!84 = !DILocalVariable(name: "i", scope: !79, file: !1, line: 24, type: !15)
!85 = !DILocation(line: 24, column: 6, scope: !79)
!86 = !DILocalVariable(name: "str", scope: !79, file: !1, line: 25, type: !87)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 48, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 6)
!90 = !DILocation(line: 25, column: 7, scope: !79)
!91 = !DILocation(line: 26, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !79, file: !1, line: 26, column: 2)
!93 = !DILocation(line: 26, column: 6, scope: !92)
!94 = !DILocation(line: 26, column: 10, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 26, column: 2)
!96 = !DILocation(line: 26, column: 11, scope: !95)
!97 = !DILocation(line: 26, column: 2, scope: !92)
!98 = !DILocation(line: 26, column: 32, scope: !95)
!99 = !DILocation(line: 26, column: 38, scope: !95)
!100 = !DILocation(line: 26, column: 40, scope: !95)
!101 = !DILocation(line: 26, column: 48, scope: !95)
!102 = !DILocation(line: 26, column: 54, scope: !95)
!103 = !DILocation(line: 26, column: 56, scope: !95)
!104 = !DILocation(line: 26, column: 29, scope: !95)
!105 = !DILocation(line: 26, column: 25, scope: !95)
!106 = !DILocation(line: 26, column: 31, scope: !95)
!107 = !DILocation(line: 26, column: 22, scope: !95)
!108 = !DILocation(line: 26, column: 2, scope: !95)
!109 = distinct !{!109, !97, !110}
!110 = !DILocation(line: 26, column: 64, scope: !92)
!111 = !DILocation(line: 27, column: 16, scope: !79)
!112 = !DILocation(line: 27, column: 2, scope: !79)
!113 = !DILocation(line: 28, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 30, type: !115, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!15}
!117 = !DILocalVariable(name: "balls", scope: !114, file: !1, line: 31, type: !118)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 40, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 5)
!121 = !DILocation(line: 31, column: 7, scope: !114)
!122 = !DILocalVariable(name: "i", scope: !114, file: !1, line: 32, type: !15)
!123 = !DILocation(line: 32, column: 6, scope: !114)
!124 = !DILocation(line: 33, column: 8, scope: !114)
!125 = !DILocation(line: 33, column: 2, scope: !114)
!126 = !DILocation(line: 34, column: 2, scope: !114)
!127 = !DILocation(line: 37, column: 7, scope: !128)
!128 = distinct !DILexicalBlock(scope: !114, file: !1, line: 37, column: 2)
!129 = !DILocation(line: 37, column: 6, scope: !128)
!130 = !DILocation(line: 37, column: 10, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !1, line: 37, column: 2)
!132 = !DILocation(line: 37, column: 11, scope: !131)
!133 = !DILocation(line: 37, column: 2, scope: !128)
!134 = !DILocation(line: 37, column: 42, scope: !131)
!135 = !DILocation(line: 37, column: 34, scope: !131)
!136 = !DILocation(line: 37, column: 48, scope: !131)
!137 = !DILocation(line: 37, column: 57, scope: !131)
!138 = !DILocation(line: 37, column: 31, scope: !131)
!139 = !DILocation(line: 37, column: 25, scope: !131)
!140 = !DILocation(line: 37, column: 33, scope: !131)
!141 = !DILocation(line: 37, column: 22, scope: !131)
!142 = !DILocation(line: 37, column: 2, scope: !131)
!143 = distinct !{!143, !133, !144}
!144 = !DILocation(line: 37, column: 58, scope: !128)
!145 = !DILocation(line: 38, column: 2, scope: !114)
!146 = !DILocation(line: 38, column: 17, scope: !114)
!147 = !DILocation(line: 38, column: 8, scope: !114)
!148 = !DILocation(line: 39, column: 3, scope: !149)
!149 = distinct !DILexicalBlock(scope: !114, file: !1, line: 38, column: 24)
!150 = !DILocation(line: 40, column: 12, scope: !149)
!151 = !DILocation(line: 40, column: 3, scope: !149)
!152 = !DILocation(line: 41, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 41, column: 3)
!154 = !DILocation(line: 41, column: 7, scope: !153)
!155 = !DILocation(line: 41, column: 11, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !1, line: 41, column: 3)
!157 = !DILocation(line: 41, column: 12, scope: !156)
!158 = !DILocation(line: 41, column: 3, scope: !153)
!159 = !DILocation(line: 41, column: 43, scope: !156)
!160 = !DILocation(line: 41, column: 35, scope: !156)
!161 = !DILocation(line: 41, column: 49, scope: !156)
!162 = !DILocation(line: 41, column: 58, scope: !156)
!163 = !DILocation(line: 41, column: 32, scope: !156)
!164 = !DILocation(line: 41, column: 26, scope: !156)
!165 = !DILocation(line: 41, column: 34, scope: !156)
!166 = !DILocation(line: 41, column: 23, scope: !156)
!167 = !DILocation(line: 41, column: 3, scope: !156)
!168 = distinct !{!168, !158, !169}
!169 = !DILocation(line: 41, column: 59, scope: !153)
!170 = distinct !{!170, !145, !171}
!171 = !DILocation(line: 42, column: 2, scope: !114)
!172 = !DILocation(line: 43, column: 2, scope: !114)
!173 = !DILocation(line: 44, column: 11, scope: !114)
!174 = !DILocation(line: 44, column: 2, scope: !114)
!175 = !DILocation(line: 45, column: 8, scope: !114)
!176 = !DILocation(line: 45, column: 2, scope: !114)
!177 = !DILocation(line: 46, column: 14, scope: !178)
!178 = distinct !DILexicalBlock(scope: !114, file: !1, line: 46, column: 5)
!179 = !DILocation(line: 46, column: 5, scope: !178)
!180 = !DILocation(line: 46, column: 5, scope: !114)
!181 = !DILocation(line: 47, column: 3, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !1, line: 46, column: 21)
!183 = !DILocation(line: 48, column: 12, scope: !182)
!184 = !DILocation(line: 48, column: 3, scope: !182)
!185 = !DILocation(line: 49, column: 2, scope: !182)
!186 = !DILocation(line: 50, column: 3, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !1, line: 49, column: 9)
!188 = !DILocation(line: 51, column: 12, scope: !187)
!189 = !DILocation(line: 51, column: 3, scope: !187)
!190 = !DILocation(line: 53, column: 2, scope: !114)
