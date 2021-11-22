; ModuleID = 'first-class-environments.c'
source_filename = "first-class-environments.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.env_t = type { i32, i32 }

@env = dso_local global [12 x %struct.env_t] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [5 x i8] c"% 4d\00", align 1
@seq = common dso_local global i32* null, align 8, !dbg !6
@cnt = common dso_local global i32* null, align 8, !dbg !10
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"COUNTS:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @hail() #0 !dbg !24 {
entry:
  %0 = load i32*, i32** @seq, align 8, !dbg !27
  %1 = load i32, i32* %0, align 4, !dbg !28
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !29
  %2 = load i32*, i32** @seq, align 8, !dbg !30
  %3 = load i32, i32* %2, align 4, !dbg !32
  %cmp = icmp eq i32 %3, 1, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34, !cf.info !35

if.then:                                          ; preds = %entry
  br label %return, !dbg !36

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** @cnt, align 8, !dbg !37
  %5 = load i32, i32* %4, align 4, !dbg !38
  %inc = add nsw i32 %5, 1, !dbg !38
  store i32 %inc, i32* %4, align 4, !dbg !38
  %6 = load i32*, i32** @seq, align 8, !dbg !39
  %7 = load i32, i32* %6, align 4, !dbg !40
  %and = and i32 %7, 1, !dbg !41
  %tobool = icmp ne i32 %and, 0, !dbg !41
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !42

cond.true:                                        ; preds = %if.end
  %8 = load i32*, i32** @seq, align 8, !dbg !43
  %9 = load i32, i32* %8, align 4, !dbg !44
  %mul = mul nsw i32 3, %9, !dbg !45
  %add = add nsw i32 %mul, 1, !dbg !46
  br label %cond.end, !dbg !42

cond.false:                                       ; preds = %if.end
  %10 = load i32*, i32** @seq, align 8, !dbg !47
  %11 = load i32, i32* %10, align 4, !dbg !48
  %div = sdiv i32 %11, 2, !dbg !49
  br label %cond.end, !dbg !42

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %div, %cond.false ], !dbg !42
  %12 = load i32*, i32** @seq, align 8, !dbg !50
  store i32 %cond, i32* %12, align 4, !dbg !51
  br label %return, !dbg !52

return:                                           ; preds = %cond.end, %if.then
  ret void, !dbg !52
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @switch_to(i32 %id) #0 !dbg !53 {
entry:
  %id.addr = alloca i32, align 4
  store i32 %id, i32* %id.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %id.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* %id.addr, align 4, !dbg !58
  %idxprom = sext i32 %0 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [12 x %struct.env_t], [12 x %struct.env_t]* @env, i64 0, i64 %idxprom, !dbg !59
  %seq = getelementptr inbounds %struct.env_t, %struct.env_t* %arrayidx, i32 0, i32 0, !dbg !60
  store i32* %seq, i32** @seq, align 8, !dbg !61
  %1 = load i32, i32* %id.addr, align 4, !dbg !62
  %idxprom1 = sext i32 %1 to i64, !dbg !63
  %arrayidx2 = getelementptr inbounds [12 x %struct.env_t], [12 x %struct.env_t]* @env, i64 0, i64 %idxprom1, !dbg !63
  %cnt = getelementptr inbounds %struct.env_t, %struct.env_t* %arrayidx2, i32 0, i32 1, !dbg !64
  store i32* %cnt, i32** @cnt, align 8, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  call void @switch_to(i32 0), !dbg !72
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !74
  %cmp = icmp slt i32 %0, 12, !dbg !74
  br i1 %cmp, label %lor.end, label %lor.rhs, !dbg !74

lor.rhs:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  %tobool = icmp ne i32 %call, 0, !dbg !74
  %lnot = xor i1 %tobool, true, !dbg !74
  br label %lor.end, !dbg !74

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %1 = phi i1 [ true, %for.cond ], [ %lnot, %lor.rhs ]
  br i1 %1, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %lor.end
  %2 = load i32, i32* %i, align 4, !dbg !76
  %add = add nsw i32 %2, 1, !dbg !78
  %3 = load i32, i32* %i, align 4, !dbg !79
  %idxprom = sext i32 %3 to i64, !dbg !80
  %arrayidx = getelementptr inbounds [12 x %struct.env_t], [12 x %struct.env_t]* @env, i64 0, i64 %idxprom, !dbg !80
  %seq = getelementptr inbounds %struct.env_t, %struct.env_t* %arrayidx, i32 0, i32 0, !dbg !81
  store i32 %add, i32* %seq, align 8, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %4, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  call void @switch_to(i32 %inc), !dbg !74
  br label %for.cond, !dbg !74, !llvm.loop !84

for.end:                                          ; preds = %lor.end
  br label %again, !dbg !85

again:                                            ; preds = %if.then, %for.end
  call void @llvm.dbg.label(metadata !86), !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  call void @switch_to(i32 0), !dbg !88
  br label %for.cond1, !dbg !88

for.cond1:                                        ; preds = %for.inc9, %again
  %5 = load i32, i32* %i, align 4, !dbg !90
  %cmp2 = icmp slt i32 %5, 12, !dbg !90
  br i1 %cmp2, label %lor.end7, label %lor.rhs3, !dbg !90

lor.rhs3:                                         ; preds = %for.cond1
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  %tobool5 = icmp ne i32 %call4, 0, !dbg !90
  %lnot6 = xor i1 %tobool5, true, !dbg !90
  br label %lor.end7, !dbg !90

lor.end7:                                         ; preds = %lor.rhs3, %for.cond1
  %6 = phi i1 [ true, %for.cond1 ], [ %lnot6, %lor.rhs3 ]
  br i1 %6, label %for.body8, label %for.end11, !dbg !88

for.body8:                                        ; preds = %lor.end7
  call void @hail(), !dbg !92
  br label %for.inc9, !dbg !94

for.inc9:                                         ; preds = %for.body8
  %7 = load i32, i32* %i, align 4, !dbg !90
  %inc10 = add nsw i32 %7, 1, !dbg !90
  store i32 %inc10, i32* %i, align 4, !dbg !90
  call void @switch_to(i32 %inc10), !dbg !90
  br label %for.cond1, !dbg !90, !llvm.loop !95

for.end11:                                        ; preds = %lor.end7
  store i32 0, i32* %i, align 4, !dbg !97
  call void @switch_to(i32 0), !dbg !97
  br label %for.cond12, !dbg !97

for.cond12:                                       ; preds = %for.inc21, %for.end11
  %8 = load i32, i32* %i, align 4, !dbg !99
  %cmp13 = icmp slt i32 %8, 12, !dbg !99
  br i1 %cmp13, label %lor.end18, label %lor.rhs14, !dbg !99

lor.rhs14:                                        ; preds = %for.cond12
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  %tobool16 = icmp ne i32 %call15, 0, !dbg !99
  %lnot17 = xor i1 %tobool16, true, !dbg !99
  br label %lor.end18, !dbg !99

lor.end18:                                        ; preds = %lor.rhs14, %for.cond12
  %9 = phi i1 [ true, %for.cond12 ], [ %lnot17, %lor.rhs14 ]
  br i1 %9, label %for.body19, label %for.end23, !dbg !97

for.body19:                                       ; preds = %lor.end18
  %10 = load i32*, i32** @seq, align 8, !dbg !101
  %11 = load i32, i32* %10, align 4, !dbg !104
  %cmp20 = icmp ne i32 1, %11, !dbg !105
  br i1 %cmp20, label %if.then, label %if.end, !dbg !106, !cf.info !35

if.then:                                          ; preds = %for.body19
  br label %again, !dbg !107

if.end:                                           ; preds = %for.body19
  br label %for.inc21, !dbg !108

for.inc21:                                        ; preds = %if.end
  %12 = load i32, i32* %i, align 4, !dbg !99
  %inc22 = add nsw i32 %12, 1, !dbg !99
  store i32 %inc22, i32* %i, align 4, !dbg !99
  call void @switch_to(i32 %inc22), !dbg !99
  br label %for.cond12, !dbg !99, !llvm.loop !109

for.end23:                                        ; preds = %lor.end18
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  store i32 0, i32* %i, align 4, !dbg !112
  call void @switch_to(i32 0), !dbg !112
  br label %for.cond25, !dbg !112

for.cond25:                                       ; preds = %for.inc34, %for.end23
  %13 = load i32, i32* %i, align 4, !dbg !114
  %cmp26 = icmp slt i32 %13, 12, !dbg !114
  br i1 %cmp26, label %lor.end31, label %lor.rhs27, !dbg !114

lor.rhs27:                                        ; preds = %for.cond25
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  %tobool29 = icmp ne i32 %call28, 0, !dbg !114
  %lnot30 = xor i1 %tobool29, true, !dbg !114
  br label %lor.end31, !dbg !114

lor.end31:                                        ; preds = %lor.rhs27, %for.cond25
  %14 = phi i1 [ true, %for.cond25 ], [ %lnot30, %lor.rhs27 ]
  br i1 %14, label %for.body32, label %for.end36, !dbg !112

for.body32:                                       ; preds = %lor.end31
  %15 = load i32*, i32** @cnt, align 8, !dbg !116
  %16 = load i32, i32* %15, align 4, !dbg !118
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %16), !dbg !119
  br label %for.inc34, !dbg !120

for.inc34:                                        ; preds = %for.body32
  %17 = load i32, i32* %i, align 4, !dbg !114
  %inc35 = add nsw i32 %17, 1, !dbg !114
  store i32 %inc35, i32* %i, align 4, !dbg !114
  call void @switch_to(i32 %inc35), !dbg !114
  br label %for.cond25, !dbg !114, !llvm.loop !121

for.end36:                                        ; preds = %lor.end31
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "env", scope: !2, file: !3, line: 7, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "first-class-environments.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/First-class-environments")
!4 = !{}
!5 = !{!0, !6, !10}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "seq", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "cnt", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 768, elements: !18)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "env_t", file: !3, line: 5, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 5, size: 64, elements: !15)
!15 = !{!16, !17}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !14, file: !3, line: 5, baseType: !9, size: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "cnt", scope: !14, file: !3, line: 5, baseType: !9, size: 32, offset: 32)
!18 = !{!19}
!19 = !DISubrange(count: 12)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!24 = distinct !DISubprogram(name: "hail", scope: !3, file: !3, line: 10, type: !25, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocation(line: 12, column: 18, scope: !24)
!28 = !DILocation(line: 12, column: 17, scope: !24)
!29 = !DILocation(line: 12, column: 2, scope: !24)
!30 = !DILocation(line: 13, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !3, line: 13, column: 6)
!32 = !DILocation(line: 13, column: 6, scope: !31)
!33 = !DILocation(line: 13, column: 11, scope: !31)
!34 = !DILocation(line: 13, column: 6, scope: !24)
!35 = !{!"if"}
!36 = !DILocation(line: 13, column: 17, scope: !31)
!37 = !DILocation(line: 14, column: 5, scope: !24)
!38 = !DILocation(line: 14, column: 2, scope: !24)
!39 = !DILocation(line: 15, column: 11, scope: !24)
!40 = !DILocation(line: 15, column: 10, scope: !24)
!41 = !DILocation(line: 15, column: 15, scope: !24)
!42 = !DILocation(line: 15, column: 9, scope: !24)
!43 = !DILocation(line: 15, column: 27, scope: !24)
!44 = !DILocation(line: 15, column: 26, scope: !24)
!45 = !DILocation(line: 15, column: 24, scope: !24)
!46 = !DILocation(line: 15, column: 31, scope: !24)
!47 = !DILocation(line: 15, column: 38, scope: !24)
!48 = !DILocation(line: 15, column: 37, scope: !24)
!49 = !DILocation(line: 15, column: 42, scope: !24)
!50 = !DILocation(line: 15, column: 3, scope: !24)
!51 = !DILocation(line: 15, column: 7, scope: !24)
!52 = !DILocation(line: 16, column: 1, scope: !24)
!53 = distinct !DISubprogram(name: "switch_to", scope: !3, file: !3, line: 18, type: !54, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !9}
!56 = !DILocalVariable(name: "id", arg: 1, scope: !53, file: !3, line: 18, type: !9)
!57 = !DILocation(line: 18, column: 20, scope: !53)
!58 = !DILocation(line: 20, column: 13, scope: !53)
!59 = !DILocation(line: 20, column: 9, scope: !53)
!60 = !DILocation(line: 20, column: 17, scope: !53)
!61 = !DILocation(line: 20, column: 6, scope: !53)
!62 = !DILocation(line: 21, column: 13, scope: !53)
!63 = !DILocation(line: 21, column: 9, scope: !53)
!64 = !DILocation(line: 21, column: 17, scope: !53)
!65 = !DILocation(line: 21, column: 6, scope: !53)
!66 = !DILocation(line: 22, column: 1, scope: !53)
!67 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 24, type: !68, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!9}
!70 = !DILocalVariable(name: "i", scope: !67, file: !3, line: 26, type: !9)
!71 = !DILocation(line: 26, column: 6, scope: !67)
!72 = !DILocation(line: 27, column: 2, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !3, line: 27, column: 2)
!74 = !DILocation(line: 27, column: 2, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !3, line: 27, column: 2)
!76 = !DILocation(line: 27, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !75, file: !3, line: 27, column: 10)
!78 = !DILocation(line: 27, column: 27, scope: !77)
!79 = !DILocation(line: 27, column: 16, scope: !77)
!80 = !DILocation(line: 27, column: 12, scope: !77)
!81 = !DILocation(line: 27, column: 19, scope: !77)
!82 = !DILocation(line: 27, column: 23, scope: !77)
!83 = !DILocation(line: 27, column: 32, scope: !77)
!84 = distinct !{!84, !72, !85}
!85 = !DILocation(line: 27, column: 32, scope: !73)
!86 = !DILabel(scope: !67, name: "again", file: !3, line: 29)
!87 = !DILocation(line: 29, column: 1, scope: !67)
!88 = !DILocation(line: 29, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !67, file: !3, line: 29, column: 8)
!90 = !DILocation(line: 29, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !89, file: !3, line: 29, column: 8)
!92 = !DILocation(line: 29, column: 18, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !3, line: 29, column: 16)
!94 = !DILocation(line: 29, column: 26, scope: !93)
!95 = distinct !{!95, !88, !96}
!96 = !DILocation(line: 29, column: 26, scope: !89)
!97 = !DILocation(line: 30, column: 2, scope: !98)
!98 = distinct !DILexicalBlock(scope: !67, file: !3, line: 30, column: 2)
!99 = !DILocation(line: 30, column: 2, scope: !100)
!100 = distinct !DILexicalBlock(scope: !98, file: !3, line: 30, column: 2)
!101 = !DILocation(line: 30, column: 22, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !3, line: 30, column: 16)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 30, column: 10)
!104 = !DILocation(line: 30, column: 21, scope: !102)
!105 = !DILocation(line: 30, column: 18, scope: !102)
!106 = !DILocation(line: 30, column: 16, scope: !103)
!107 = !DILocation(line: 30, column: 27, scope: !102)
!108 = !DILocation(line: 30, column: 39, scope: !103)
!109 = distinct !{!109, !97, !110}
!110 = !DILocation(line: 30, column: 39, scope: !98)
!111 = !DILocation(line: 32, column: 2, scope: !67)
!112 = !DILocation(line: 33, column: 2, scope: !113)
!113 = distinct !DILexicalBlock(scope: !67, file: !3, line: 33, column: 2)
!114 = !DILocation(line: 33, column: 2, scope: !115)
!115 = distinct !DILexicalBlock(scope: !113, file: !3, line: 33, column: 2)
!116 = !DILocation(line: 33, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !115, file: !3, line: 33, column: 10)
!118 = !DILocation(line: 33, column: 27, scope: !117)
!119 = !DILocation(line: 33, column: 12, scope: !117)
!120 = !DILocation(line: 33, column: 34, scope: !117)
!121 = distinct !{!121, !112, !122}
!122 = !DILocation(line: 33, column: 34, scope: !113)
!123 = !DILocation(line: 35, column: 2, scope: !67)
