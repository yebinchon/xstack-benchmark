; ModuleID = 'combinations-with-repetitions.bc'
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
  br i1 %cmp, label %if.then, label %if.end6, !dbg !40

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %got.addr, align 8, !dbg !41
  %tobool = icmp ne i32* %2, null, !dbg !41
  br i1 %tobool, label %if.end, label %if.then1, !dbg !44

if.then1:                                         ; preds = %if.then
  store i64 1, i64* %retval, align 8, !dbg !45
  br label %return, !dbg !45

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !49
  %4 = load i32, i32* %len.addr, align 4, !dbg !51
  %cmp2 = icmp slt i32 %3, %4, !dbg !52
  br i1 %cmp2, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %got.addr, align 8, !dbg !54
  %6 = load i32, i32* %i, align 4, !dbg !55
  %idxprom = sext i32 %6 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !54
  %7 = load i32, i32* %arrayidx, align 4, !dbg !54
  %idxprom3 = sext i32 %7 to i64, !dbg !56
  %arrayidx4 = getelementptr inbounds [4 x i8*], [4 x i8*]* @donuts, i64 0, i64 %idxprom3, !dbg !56
  %8 = load i8*, i8** %arrayidx4, align 8, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* %8), !dbg !57
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %9, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !62
  store i64 1, i64* %retval, align 8, !dbg !63
  br label %return, !dbg !63

if.end6:                                          ; preds = %entry
  %10 = load i32, i32* %at.addr, align 4, !dbg !64
  store i32 %10, i32* %i, align 4, !dbg !66
  br label %for.cond7, !dbg !67

for.cond7:                                        ; preds = %for.inc17, %if.end6
  %11 = load i32, i32* %i, align 4, !dbg !68
  %12 = load i32, i32* %max_types.addr, align 4, !dbg !70
  %cmp8 = icmp slt i32 %11, %12, !dbg !71
  br i1 %cmp8, label %for.body9, label %for.end19, !dbg !72

for.body9:                                        ; preds = %for.cond7
  %13 = load i32*, i32** %got.addr, align 8, !dbg !73
  %tobool10 = icmp ne i32* %13, null, !dbg !73
  br i1 %tobool10, label %if.then11, label %if.end14, !dbg !76

if.then11:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !77
  %15 = load i32*, i32** %got.addr, align 8, !dbg !78
  %16 = load i32, i32* %n_chosen.addr, align 4, !dbg !79
  %idxprom12 = sext i32 %16 to i64, !dbg !78
  %arrayidx13 = getelementptr inbounds i32, i32* %15, i64 %idxprom12, !dbg !78
  store i32 %14, i32* %arrayidx13, align 4, !dbg !80
  br label %if.end14, !dbg !78

if.end14:                                         ; preds = %if.then11, %for.body9
  %17 = load i32*, i32** %got.addr, align 8, !dbg !81
  %18 = load i32, i32* %n_chosen.addr, align 4, !dbg !82
  %add = add nsw i32 %18, 1, !dbg !83
  %19 = load i32, i32* %len.addr, align 4, !dbg !84
  %20 = load i32, i32* %i, align 4, !dbg !85
  %21 = load i32, i32* %max_types.addr, align 4, !dbg !86
  %call15 = call i64 @choose(i32* %17, i32 %add, i32 %19, i32 %20, i32 %21), !dbg !87
  %22 = load i64, i64* %count, align 8, !dbg !88
  %add16 = add nsw i64 %22, %call15, !dbg !88
  store i64 %add16, i64* %count, align 8, !dbg !88
  br label %for.inc17, !dbg !89

for.inc17:                                        ; preds = %if.end14
  %23 = load i32, i32* %i, align 4, !dbg !90
  %inc18 = add nsw i32 %23, 1, !dbg !90
  store i32 %inc18, i32* %i, align 4, !dbg !90
  br label %for.cond7, !dbg !91, !llvm.loop !92

for.end19:                                        ; preds = %for.cond7
  %24 = load i64, i64* %count, align 8, !dbg !94
  store i64 %24, i64* %retval, align 8, !dbg !95
  br label %return, !dbg !95

return:                                           ; preds = %for.end19, %for.end, %if.then1
  %25 = load i64, i64* %retval, align 8, !dbg !96
  ret i64 %25, !dbg !96
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %chosen = alloca [3 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %chosen, metadata !100, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %chosen, i64 0, i64 0, !dbg !105
  %call = call i64 @choose(i32* %arraydecay, i32 0, i32 2, i32 0, i32 3), !dbg !106
  %call1 = call i64 @choose(i32* null, i32 0, i32 3, i32 0, i32 10), !dbg !107
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.6, i64 0, i64 0), i64 %call1), !dbg !108
  ret i32 0, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "donuts", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!15 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!41 = !DILocation(line: 9, column: 22, scope: !42)
!42 = distinct !DILexicalBlock(scope: !43, file: !3, line: 9, column: 21)
!43 = distinct !DILexicalBlock(scope: !37, file: !3, line: 8, column: 30)
!44 = !DILocation(line: 9, column: 21, scope: !43)
!45 = !DILocation(line: 9, column: 27, scope: !42)
!46 = !DILocation(line: 11, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 11, column: 17)
!48 = !DILocation(line: 11, column: 22, scope: !47)
!49 = !DILocation(line: 11, column: 29, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !3, line: 11, column: 17)
!51 = !DILocation(line: 11, column: 33, scope: !50)
!52 = !DILocation(line: 11, column: 31, scope: !50)
!53 = !DILocation(line: 11, column: 17, scope: !47)
!54 = !DILocation(line: 12, column: 47, scope: !50)
!55 = !DILocation(line: 12, column: 51, scope: !50)
!56 = !DILocation(line: 12, column: 40, scope: !50)
!57 = !DILocation(line: 12, column: 25, scope: !50)
!58 = !DILocation(line: 11, column: 39, scope: !50)
!59 = !DILocation(line: 11, column: 17, scope: !50)
!60 = distinct !{!60, !53, !61}
!61 = !DILocation(line: 12, column: 54, scope: !47)
!62 = !DILocation(line: 13, column: 17, scope: !43)
!63 = !DILocation(line: 14, column: 17, scope: !43)
!64 = !DILocation(line: 17, column: 18, scope: !65)
!65 = distinct !DILexicalBlock(scope: !16, file: !3, line: 17, column: 9)
!66 = !DILocation(line: 17, column: 16, scope: !65)
!67 = !DILocation(line: 17, column: 14, scope: !65)
!68 = !DILocation(line: 17, column: 22, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !3, line: 17, column: 9)
!70 = !DILocation(line: 17, column: 26, scope: !69)
!71 = !DILocation(line: 17, column: 24, scope: !69)
!72 = !DILocation(line: 17, column: 9, scope: !65)
!73 = !DILocation(line: 18, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !3, line: 18, column: 21)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 17, column: 42)
!76 = !DILocation(line: 18, column: 21, scope: !75)
!77 = !DILocation(line: 18, column: 42, scope: !74)
!78 = !DILocation(line: 18, column: 26, scope: !74)
!79 = !DILocation(line: 18, column: 30, scope: !74)
!80 = !DILocation(line: 18, column: 40, scope: !74)
!81 = !DILocation(line: 19, column: 33, scope: !75)
!82 = !DILocation(line: 19, column: 38, scope: !75)
!83 = !DILocation(line: 19, column: 47, scope: !75)
!84 = !DILocation(line: 19, column: 52, scope: !75)
!85 = !DILocation(line: 19, column: 57, scope: !75)
!86 = !DILocation(line: 19, column: 60, scope: !75)
!87 = !DILocation(line: 19, column: 26, scope: !75)
!88 = !DILocation(line: 19, column: 23, scope: !75)
!89 = !DILocation(line: 20, column: 9, scope: !75)
!90 = !DILocation(line: 17, column: 38, scope: !69)
!91 = !DILocation(line: 17, column: 9, scope: !69)
!92 = distinct !{!92, !72, !93}
!93 = !DILocation(line: 20, column: 9, scope: !65)
!94 = !DILocation(line: 21, column: 16, scope: !16)
!95 = !DILocation(line: 21, column: 9, scope: !16)
!96 = !DILocation(line: 22, column: 1, scope: !16)
!97 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 24, type: !98, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!21}
!100 = !DILocalVariable(name: "chosen", scope: !97, file: !3, line: 26, type: !101)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 96, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 3)
!104 = !DILocation(line: 26, column: 13, scope: !97)
!105 = !DILocation(line: 27, column: 16, scope: !97)
!106 = !DILocation(line: 27, column: 9, scope: !97)
!107 = !DILocation(line: 30, column: 17, scope: !97)
!108 = !DILocation(line: 29, column: 9, scope: !97)
!109 = !DILocation(line: 31, column: 9, scope: !97)
