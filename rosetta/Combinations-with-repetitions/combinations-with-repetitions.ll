; ModuleID = 'combinations-with-repetitions.c'
source_filename = "combinations-with-repetitions.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"iced\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"jam\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"plain\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"something completely different\00", align 1
@donuts = dso_local global [4 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0)], align 16, !dbg !0
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\09\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [60 x i8] c"\0AWere there ten donuts, we'd have had %ld choices of three\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @choose(i32* %got, i32 %n_chosen, i32 %len, i32 %at, i32 %max_types) #0 !dbg !16 {
entry:
  %retval = alloca i64, align 8
  %got.addr = alloca i32*, align 8
  %n_chosen.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %at.addr = alloca i32, align 4
  %max_types.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i64, align 8
  store i32* %got, i32** %got.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %got.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %n_chosen, i32* %n_chosen.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n_chosen.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 %at, i32* %at.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %at.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %max_types, i32* %max_types.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_types.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %count, metadata !34, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %count, align 8, !dbg !35
  %0 = load i32, i32* %n_chosen.addr, align 4, !dbg !36
  %1 = load i32, i32* %len.addr, align 4, !dbg !38
  %cmp = icmp eq i32 %0, %1, !dbg !39
  br i1 %cmp, label %if.then, label %if.end6, !dbg !40, !cf.info !41

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %got.addr, align 8, !dbg !42
  %tobool = icmp ne i32* %2, null, !dbg !42
  br i1 %tobool, label %if.end, label %if.then1, !dbg !45, !cf.info !41

if.then1:                                         ; preds = %if.then
  store i64 1, i64* %retval, align 8, !dbg !46
  br label %return, !dbg !46

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !50
  %4 = load i32, i32* %len.addr, align 4, !dbg !52
  %cmp2 = icmp slt i32 %3, %4, !dbg !53
  br i1 %cmp2, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %got.addr, align 8, !dbg !55
  %6 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %6 to i64, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !55
  %7 = load i32, i32* %arrayidx, align 4, !dbg !55
  %idxprom3 = sext i32 %7 to i64, !dbg !57
  %arrayidx4 = getelementptr inbounds [4 x i8*], [4 x i8*]* @donuts, i64 0, i64 %idxprom3, !dbg !57
  %8 = load i8*, i8** %arrayidx4, align 8, !dbg !57
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* %8), !dbg !58
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %9, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !63
  store i64 1, i64* %retval, align 8, !dbg !64
  br label %return, !dbg !64

if.end6:                                          ; preds = %entry
  %10 = load i32, i32* %at.addr, align 4, !dbg !65
  store i32 %10, i32* %i, align 4, !dbg !67
  br label %for.cond7, !dbg !68

for.cond7:                                        ; preds = %for.inc17, %if.end6
  %11 = load i32, i32* %i, align 4, !dbg !69
  %12 = load i32, i32* %max_types.addr, align 4, !dbg !71
  %cmp8 = icmp slt i32 %11, %12, !dbg !72
  br i1 %cmp8, label %for.body9, label %for.end19, !dbg !73

for.body9:                                        ; preds = %for.cond7
  %13 = load i32*, i32** %got.addr, align 8, !dbg !74
  %tobool10 = icmp ne i32* %13, null, !dbg !74
  br i1 %tobool10, label %if.then11, label %if.end14, !dbg !77, !cf.info !41

if.then11:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !78
  %15 = load i32*, i32** %got.addr, align 8, !dbg !79
  %16 = load i32, i32* %n_chosen.addr, align 4, !dbg !80
  %idxprom12 = sext i32 %16 to i64, !dbg !79
  %arrayidx13 = getelementptr inbounds i32, i32* %15, i64 %idxprom12, !dbg !79
  store i32 %14, i32* %arrayidx13, align 4, !dbg !81
  br label %if.end14, !dbg !79

if.end14:                                         ; preds = %if.then11, %for.body9
  %17 = load i32*, i32** %got.addr, align 8, !dbg !82
  %18 = load i32, i32* %n_chosen.addr, align 4, !dbg !83
  %add = add nsw i32 %18, 1, !dbg !84
  %19 = load i32, i32* %len.addr, align 4, !dbg !85
  %20 = load i32, i32* %i, align 4, !dbg !86
  %21 = load i32, i32* %max_types.addr, align 4, !dbg !87
  %call15 = call i64 @choose(i32* %17, i32 %add, i32 %19, i32 %20, i32 %21), !dbg !88
  %22 = load i64, i64* %count, align 8, !dbg !89
  %add16 = add nsw i64 %22, %call15, !dbg !89
  store i64 %add16, i64* %count, align 8, !dbg !89
  br label %for.inc17, !dbg !90

for.inc17:                                        ; preds = %if.end14
  %23 = load i32, i32* %i, align 4, !dbg !91
  %inc18 = add nsw i32 %23, 1, !dbg !91
  store i32 %inc18, i32* %i, align 4, !dbg !91
  br label %for.cond7, !dbg !92, !llvm.loop !93

for.end19:                                        ; preds = %for.cond7
  %24 = load i64, i64* %count, align 8, !dbg !95
  store i64 %24, i64* %retval, align 8, !dbg !96
  br label %return, !dbg !96

return:                                           ; preds = %for.end19, %for.end, %if.then1
  %25 = load i64, i64* %retval, align 8, !dbg !97
  ret i64 %25, !dbg !97
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %chosen = alloca [3 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %chosen, metadata !101, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %chosen, i64 0, i64 0, !dbg !106
  %call = call i64 @choose(i32* %arraydecay, i32 0, i32 2, i32 0, i32 3), !dbg !107
  %call1 = call i64 @choose(i32* null, i32 0, i32 3, i32 0, i32 10), !dbg !108
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.6, i64 0, i64 0), i64 %call1), !dbg !109
  ret i32 0, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "donuts", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "combinations-with-repetitions.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations-with-repetitions")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !10)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!16 = distinct !DISubprogram(name: "choose", scope: !3, file: !3, line: 4, type: !17, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!19, !20, !21, !21, !21, !21}
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocalVariable(name: "got", arg: 1, scope: !16, file: !3, line: 4, type: !20)
!23 = !DILocation(line: 4, column: 19, scope: !16)
!24 = !DILocalVariable(name: "n_chosen", arg: 2, scope: !16, file: !3, line: 4, type: !21)
!25 = !DILocation(line: 4, column: 28, scope: !16)
!26 = !DILocalVariable(name: "len", arg: 3, scope: !16, file: !3, line: 4, type: !21)
!27 = !DILocation(line: 4, column: 42, scope: !16)
!28 = !DILocalVariable(name: "at", arg: 4, scope: !16, file: !3, line: 4, type: !21)
!29 = !DILocation(line: 4, column: 51, scope: !16)
!30 = !DILocalVariable(name: "max_types", arg: 5, scope: !16, file: !3, line: 4, type: !21)
!31 = !DILocation(line: 4, column: 59, scope: !16)
!32 = !DILocalVariable(name: "i", scope: !16, file: !3, line: 6, type: !21)
!33 = !DILocation(line: 6, column: 13, scope: !16)
!34 = !DILocalVariable(name: "count", scope: !16, file: !3, line: 7, type: !19)
!35 = !DILocation(line: 7, column: 14, scope: !16)
!36 = !DILocation(line: 8, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !16, file: !3, line: 8, column: 13)
!38 = !DILocation(line: 8, column: 25, scope: !37)
!39 = !DILocation(line: 8, column: 22, scope: !37)
!40 = !DILocation(line: 8, column: 13, scope: !16)
!41 = !{!"if"}
!42 = !DILocation(line: 9, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !3, line: 9, column: 21)
!44 = distinct !DILexicalBlock(scope: !37, file: !3, line: 8, column: 30)
!45 = !DILocation(line: 9, column: 21, scope: !44)
!46 = !DILocation(line: 9, column: 27, scope: !43)
!47 = !DILocation(line: 11, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 11, column: 17)
!49 = !DILocation(line: 11, column: 22, scope: !48)
!50 = !DILocation(line: 11, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !3, line: 11, column: 17)
!52 = !DILocation(line: 11, column: 33, scope: !51)
!53 = !DILocation(line: 11, column: 31, scope: !51)
!54 = !DILocation(line: 11, column: 17, scope: !48)
!55 = !DILocation(line: 12, column: 47, scope: !51)
!56 = !DILocation(line: 12, column: 51, scope: !51)
!57 = !DILocation(line: 12, column: 40, scope: !51)
!58 = !DILocation(line: 12, column: 25, scope: !51)
!59 = !DILocation(line: 11, column: 39, scope: !51)
!60 = !DILocation(line: 11, column: 17, scope: !51)
!61 = distinct !{!61, !54, !62}
!62 = !DILocation(line: 12, column: 54, scope: !48)
!63 = !DILocation(line: 13, column: 17, scope: !44)
!64 = !DILocation(line: 14, column: 17, scope: !44)
!65 = !DILocation(line: 17, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !16, file: !3, line: 17, column: 9)
!67 = !DILocation(line: 17, column: 16, scope: !66)
!68 = !DILocation(line: 17, column: 14, scope: !66)
!69 = !DILocation(line: 17, column: 22, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 17, column: 9)
!71 = !DILocation(line: 17, column: 26, scope: !70)
!72 = !DILocation(line: 17, column: 24, scope: !70)
!73 = !DILocation(line: 17, column: 9, scope: !66)
!74 = !DILocation(line: 18, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !3, line: 18, column: 21)
!76 = distinct !DILexicalBlock(scope: !70, file: !3, line: 17, column: 42)
!77 = !DILocation(line: 18, column: 21, scope: !76)
!78 = !DILocation(line: 18, column: 42, scope: !75)
!79 = !DILocation(line: 18, column: 26, scope: !75)
!80 = !DILocation(line: 18, column: 30, scope: !75)
!81 = !DILocation(line: 18, column: 40, scope: !75)
!82 = !DILocation(line: 19, column: 33, scope: !76)
!83 = !DILocation(line: 19, column: 38, scope: !76)
!84 = !DILocation(line: 19, column: 47, scope: !76)
!85 = !DILocation(line: 19, column: 52, scope: !76)
!86 = !DILocation(line: 19, column: 57, scope: !76)
!87 = !DILocation(line: 19, column: 60, scope: !76)
!88 = !DILocation(line: 19, column: 26, scope: !76)
!89 = !DILocation(line: 19, column: 23, scope: !76)
!90 = !DILocation(line: 20, column: 9, scope: !76)
!91 = !DILocation(line: 17, column: 38, scope: !70)
!92 = !DILocation(line: 17, column: 9, scope: !70)
!93 = distinct !{!93, !73, !94}
!94 = !DILocation(line: 20, column: 9, scope: !66)
!95 = !DILocation(line: 21, column: 16, scope: !16)
!96 = !DILocation(line: 21, column: 9, scope: !16)
!97 = !DILocation(line: 22, column: 1, scope: !16)
!98 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 24, type: !99, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{!21}
!101 = !DILocalVariable(name: "chosen", scope: !98, file: !3, line: 26, type: !102)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 96, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 3)
!105 = !DILocation(line: 26, column: 13, scope: !98)
!106 = !DILocation(line: 27, column: 16, scope: !98)
!107 = !DILocation(line: 27, column: 9, scope: !98)
!108 = !DILocation(line: 30, column: 17, scope: !98)
!109 = !DILocation(line: 29, column: 9, scope: !98)
!110 = !DILocation(line: 31, column: 9, scope: !98)
