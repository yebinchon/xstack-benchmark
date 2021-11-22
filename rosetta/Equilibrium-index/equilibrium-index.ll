; ModuleID = 'equilibrium-index.c'
source_filename = "equilibrium-index.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@list = dso_local global [7 x i32] [i32 -7, i32 1, i32 5, i32 2, i32 -4, i32 3, i32 0], align 16, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"Found:\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @eq_idx(i32* %a, i32 %len, i32** %ret) #0 !dbg !14 {
entry:
  %a.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %ret.addr = alloca i32**, align 8
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %s = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i32** %ret, i32*** %ret.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %ret.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %s, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %sum, align 4, !dbg !33
  store i32 0, i32* %s, align 4, !dbg !34
  store i32 0, i32* %cnt, align 4, !dbg !35
  %0 = load i32, i32* %len.addr, align 4, !dbg !36
  %conv = sext i32 %0 to i64, !dbg !36
  %mul = mul i64 4, %conv, !dbg !37
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !38
  %1 = bitcast i8* %call to i32*, !dbg !38
  %2 = load i32**, i32*** %ret.addr, align 8, !dbg !39
  store i32* %1, i32** %2, align 8, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !44
  %4 = load i32, i32* %len.addr, align 4, !dbg !46
  %cmp = icmp slt i32 %3, %4, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %a.addr, align 8, !dbg !49
  %6 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %6 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !49
  %7 = load i32, i32* %arrayidx, align 4, !dbg !49
  %8 = load i32, i32* %sum, align 4, !dbg !51
  %add = add nsw i32 %8, %7, !dbg !51
  store i32 %add, i32* %sum, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %9, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !57
  br label %for.cond2, !dbg !59

for.cond2:                                        ; preds = %for.inc18, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !60
  %11 = load i32, i32* %len.addr, align 4, !dbg !62
  %cmp3 = icmp slt i32 %10, %11, !dbg !63
  br i1 %cmp3, label %for.body5, label %for.end20, !dbg !64

for.body5:                                        ; preds = %for.cond2
  %12 = load i32, i32* %s, align 4, !dbg !65
  %mul6 = mul nsw i32 %12, 2, !dbg !68
  %13 = load i32*, i32** %a.addr, align 8, !dbg !69
  %14 = load i32, i32* %i, align 4, !dbg !70
  %idxprom7 = sext i32 %14 to i64, !dbg !69
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %idxprom7, !dbg !69
  %15 = load i32, i32* %arrayidx8, align 4, !dbg !69
  %add9 = add nsw i32 %mul6, %15, !dbg !71
  %16 = load i32, i32* %sum, align 4, !dbg !72
  %cmp10 = icmp eq i32 %add9, %16, !dbg !73
  br i1 %cmp10, label %if.then, label %if.end, !dbg !74, !cf.info !75

if.then:                                          ; preds = %for.body5
  %17 = load i32, i32* %i, align 4, !dbg !76
  %18 = load i32**, i32*** %ret.addr, align 8, !dbg !78
  %19 = load i32*, i32** %18, align 8, !dbg !79
  %20 = load i32, i32* %cnt, align 4, !dbg !80
  %idxprom12 = sext i32 %20 to i64, !dbg !81
  %arrayidx13 = getelementptr inbounds i32, i32* %19, i64 %idxprom12, !dbg !81
  store i32 %17, i32* %arrayidx13, align 4, !dbg !82
  %21 = load i32, i32* %cnt, align 4, !dbg !83
  %inc14 = add nsw i32 %21, 1, !dbg !83
  store i32 %inc14, i32* %cnt, align 4, !dbg !83
  br label %if.end, !dbg !84

if.end:                                           ; preds = %if.then, %for.body5
  %22 = load i32*, i32** %a.addr, align 8, !dbg !85
  %23 = load i32, i32* %i, align 4, !dbg !86
  %idxprom15 = sext i32 %23 to i64, !dbg !85
  %arrayidx16 = getelementptr inbounds i32, i32* %22, i64 %idxprom15, !dbg !85
  %24 = load i32, i32* %arrayidx16, align 4, !dbg !85
  %25 = load i32, i32* %s, align 4, !dbg !87
  %add17 = add nsw i32 %25, %24, !dbg !87
  store i32 %add17, i32* %s, align 4, !dbg !87
  br label %for.inc18, !dbg !88

for.inc18:                                        ; preds = %if.end
  %26 = load i32, i32* %i, align 4, !dbg !89
  %inc19 = add nsw i32 %26, 1, !dbg !89
  store i32 %inc19, i32* %i, align 4, !dbg !89
  br label %for.cond2, !dbg !90, !llvm.loop !91

for.end20:                                        ; preds = %for.cond2
  %27 = load i32**, i32*** %ret.addr, align 8, !dbg !93
  %28 = load i32*, i32** %27, align 8, !dbg !94
  %29 = bitcast i32* %28 to i8*, !dbg !94
  %30 = load i32, i32* %cnt, align 4, !dbg !95
  %conv21 = sext i32 %30 to i64, !dbg !95
  %mul22 = mul i64 %conv21, 4, !dbg !96
  %call23 = call i8* @realloc(i8* %29, i64 %mul22) #4, !dbg !97
  %31 = bitcast i8* %call23 to i32*, !dbg !97
  %32 = load i32**, i32*** %ret.addr, align 8, !dbg !98
  store i32* %31, i32** %32, align 8, !dbg !99
  %33 = load i32, i32* %cnt, align 4, !dbg !100
  ret i32 %33, !dbg !101
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %cnt = alloca i32, align 4
  %idx = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %idx, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 @eq_idx(i32* getelementptr inbounds ([7 x i32], [7 x i32]* @list, i64 0, i64 0), i32 7, i32** %idx), !dbg !111
  store i32 %call, i32* %cnt, align 4, !dbg !112
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)), !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !117
  %1 = load i32, i32* %cnt, align 4, !dbg !119
  %cmp = icmp slt i32 %0, %1, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %idx, align 8, !dbg !122
  %3 = load i32, i32* %i, align 4, !dbg !123
  %idxprom = sext i32 %3 to i64, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !122
  %4 = load i32, i32* %arrayidx, align 4, !dbg !122
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %4), !dbg !124
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %5, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "list", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "equilibrium-index.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Equilibrium-index")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 224, elements: !8)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9}
!9 = !DISubrange(count: 7)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!14 = distinct !DISubprogram(name: "eq_idx", scope: !3, file: !3, line: 6, type: !15, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !17, !7, !18}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !14, file: !3, line: 6, type: !17)
!20 = !DILocation(line: 6, column: 17, scope: !14)
!21 = !DILocalVariable(name: "len", arg: 2, scope: !14, file: !3, line: 6, type: !7)
!22 = !DILocation(line: 6, column: 24, scope: !14)
!23 = !DILocalVariable(name: "ret", arg: 3, scope: !14, file: !3, line: 6, type: !18)
!24 = !DILocation(line: 6, column: 35, scope: !14)
!25 = !DILocalVariable(name: "i", scope: !14, file: !3, line: 8, type: !7)
!26 = !DILocation(line: 8, column: 6, scope: !14)
!27 = !DILocalVariable(name: "sum", scope: !14, file: !3, line: 8, type: !7)
!28 = !DILocation(line: 8, column: 9, scope: !14)
!29 = !DILocalVariable(name: "s", scope: !14, file: !3, line: 8, type: !7)
!30 = !DILocation(line: 8, column: 14, scope: !14)
!31 = !DILocalVariable(name: "cnt", scope: !14, file: !3, line: 8, type: !7)
!32 = !DILocation(line: 8, column: 17, scope: !14)
!33 = !DILocation(line: 13, column: 23, scope: !14)
!34 = !DILocation(line: 13, column: 17, scope: !14)
!35 = !DILocation(line: 13, column: 13, scope: !14)
!36 = !DILocation(line: 14, column: 30, scope: !14)
!37 = !DILocation(line: 14, column: 28, scope: !14)
!38 = !DILocation(line: 14, column: 9, scope: !14)
!39 = !DILocation(line: 14, column: 3, scope: !14)
!40 = !DILocation(line: 14, column: 7, scope: !14)
!41 = !DILocation(line: 16, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !14, file: !3, line: 16, column: 2)
!43 = !DILocation(line: 16, column: 7, scope: !42)
!44 = !DILocation(line: 16, column: 14, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 16, column: 2)
!46 = !DILocation(line: 16, column: 18, scope: !45)
!47 = !DILocation(line: 16, column: 16, scope: !45)
!48 = !DILocation(line: 16, column: 2, scope: !42)
!49 = !DILocation(line: 17, column: 24, scope: !45)
!50 = !DILocation(line: 17, column: 26, scope: !45)
!51 = !DILocation(line: 17, column: 21, scope: !45)
!52 = !DILocation(line: 17, column: 17, scope: !45)
!53 = !DILocation(line: 16, column: 24, scope: !45)
!54 = !DILocation(line: 16, column: 2, scope: !45)
!55 = distinct !{!55, !48, !56}
!56 = !DILocation(line: 17, column: 27, scope: !42)
!57 = !DILocation(line: 19, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !14, file: !3, line: 19, column: 2)
!59 = !DILocation(line: 19, column: 7, scope: !58)
!60 = !DILocation(line: 19, column: 14, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !3, line: 19, column: 2)
!62 = !DILocation(line: 19, column: 18, scope: !61)
!63 = !DILocation(line: 19, column: 16, scope: !61)
!64 = !DILocation(line: 19, column: 2, scope: !58)
!65 = !DILocation(line: 20, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !67, file: !3, line: 20, column: 7)
!67 = distinct !DILexicalBlock(scope: !61, file: !3, line: 19, column: 28)
!68 = !DILocation(line: 20, column: 9, scope: !66)
!69 = !DILocation(line: 20, column: 15, scope: !66)
!70 = !DILocation(line: 20, column: 17, scope: !66)
!71 = !DILocation(line: 20, column: 13, scope: !66)
!72 = !DILocation(line: 20, column: 23, scope: !66)
!73 = !DILocation(line: 20, column: 20, scope: !66)
!74 = !DILocation(line: 20, column: 7, scope: !67)
!75 = !{!"if"}
!76 = !DILocation(line: 21, column: 18, scope: !77)
!77 = distinct !DILexicalBlock(scope: !66, file: !3, line: 20, column: 28)
!78 = !DILocation(line: 21, column: 6, scope: !77)
!79 = !DILocation(line: 21, column: 5, scope: !77)
!80 = !DILocation(line: 21, column: 11, scope: !77)
!81 = !DILocation(line: 21, column: 4, scope: !77)
!82 = !DILocation(line: 21, column: 16, scope: !77)
!83 = !DILocation(line: 22, column: 28, scope: !77)
!84 = !DILocation(line: 23, column: 17, scope: !77)
!85 = !DILocation(line: 24, column: 8, scope: !67)
!86 = !DILocation(line: 24, column: 10, scope: !67)
!87 = !DILocation(line: 24, column: 5, scope: !67)
!88 = !DILocation(line: 25, column: 2, scope: !67)
!89 = !DILocation(line: 19, column: 24, scope: !61)
!90 = !DILocation(line: 19, column: 2, scope: !61)
!91 = distinct !{!91, !64, !92}
!92 = !DILocation(line: 25, column: 2, scope: !58)
!93 = !DILocation(line: 28, column: 18, scope: !14)
!94 = !DILocation(line: 28, column: 17, scope: !14)
!95 = !DILocation(line: 28, column: 23, scope: !14)
!96 = !DILocation(line: 28, column: 27, scope: !14)
!97 = !DILocation(line: 28, column: 9, scope: !14)
!98 = !DILocation(line: 28, column: 3, scope: !14)
!99 = !DILocation(line: 28, column: 7, scope: !14)
!100 = !DILocation(line: 30, column: 9, scope: !14)
!101 = !DILocation(line: 30, column: 2, scope: !14)
!102 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 33, type: !103, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DISubroutineType(types: !104)
!104 = !{!7}
!105 = !DILocalVariable(name: "i", scope: !102, file: !3, line: 35, type: !7)
!106 = !DILocation(line: 35, column: 6, scope: !102)
!107 = !DILocalVariable(name: "cnt", scope: !102, file: !3, line: 35, type: !7)
!108 = !DILocation(line: 35, column: 9, scope: !102)
!109 = !DILocalVariable(name: "idx", scope: !102, file: !3, line: 35, type: !17)
!110 = !DILocation(line: 35, column: 15, scope: !102)
!111 = !DILocation(line: 36, column: 8, scope: !102)
!112 = !DILocation(line: 36, column: 6, scope: !102)
!113 = !DILocation(line: 38, column: 2, scope: !102)
!114 = !DILocation(line: 39, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !102, file: !3, line: 39, column: 2)
!116 = !DILocation(line: 39, column: 7, scope: !115)
!117 = !DILocation(line: 39, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !3, line: 39, column: 2)
!119 = !DILocation(line: 39, column: 18, scope: !118)
!120 = !DILocation(line: 39, column: 16, scope: !118)
!121 = !DILocation(line: 39, column: 2, scope: !115)
!122 = !DILocation(line: 40, column: 31, scope: !118)
!123 = !DILocation(line: 40, column: 35, scope: !118)
!124 = !DILocation(line: 40, column: 17, scope: !118)
!125 = !DILocation(line: 39, column: 24, scope: !118)
!126 = !DILocation(line: 39, column: 2, scope: !118)
!127 = distinct !{!127, !121, !128}
!128 = !DILocation(line: 40, column: 37, scope: !115)
!129 = !DILocation(line: 41, column: 2, scope: !102)
!130 = !DILocation(line: 43, column: 2, scope: !102)
