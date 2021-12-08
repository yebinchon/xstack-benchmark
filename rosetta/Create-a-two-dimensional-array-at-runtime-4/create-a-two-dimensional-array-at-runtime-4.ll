; ModuleID = 'create-a-two-dimensional-array-at-runtime-4.bc'
source_filename = "create-a-two-dimensional-array-at-runtime-4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Enter size of array:  \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %user1 = alloca i32, align 4
  %space_needed = alloca i32, align 4
  %a1 = alloca i32*, align 8
  %array = alloca i32**, align 8
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %offset = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %user1, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %user1, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %space_needed, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %a1, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %array, metadata !25, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %row, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %col, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !32, metadata !DIExpression()), !dbg !33
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !34
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %user1), !dbg !35
  %0 = load i32, i32* %user1, align 4, !dbg !36
  %add = add nsw i32 %0, 1, !dbg !37
  %1 = load i32, i32* %user1, align 4, !dbg !38
  %mul = mul nsw i32 %add, %1, !dbg !39
  %div = sdiv i32 %mul, 2, !dbg !40
  store i32 %div, i32* %space_needed, align 4, !dbg !41
  %2 = load i32, i32* %space_needed, align 4, !dbg !42
  %conv = sext i32 %2 to i64, !dbg !42
  %mul2 = mul i64 %conv, 4, !dbg !43
  %call3 = call noalias i8* @malloc(i64 %mul2) #4, !dbg !44
  %3 = bitcast i8* %call3 to i32*, !dbg !44
  store i32* %3, i32** %a1, align 8, !dbg !45
  %4 = load i32, i32* %user1, align 4, !dbg !46
  %conv4 = sext i32 %4 to i64, !dbg !46
  %mul5 = mul i64 %conv4, 8, !dbg !47
  %call6 = call noalias i8* @malloc(i64 %mul5) #4, !dbg !48
  %5 = bitcast i8* %call6 to i32**, !dbg !48
  store i32** %5, i32*** %array, align 8, !dbg !49
  store i32 0, i32* %row, align 4, !dbg !50
  store i32 0, i32* %offset, align 4, !dbg !52
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc19, %entry
  %6 = load i32, i32* %row, align 4, !dbg !54
  %7 = load i32, i32* %user1, align 4, !dbg !56
  %cmp = icmp slt i32 %6, %7, !dbg !57
  br i1 %cmp, label %for.body, label %for.end23, !dbg !58

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %a1, align 8, !dbg !59
  %9 = load i32, i32* %offset, align 4, !dbg !61
  %idx.ext = sext i32 %9 to i64, !dbg !62
  %add.ptr = getelementptr inbounds i32, i32* %8, i64 %idx.ext, !dbg !62
  %10 = load i32, i32* %row, align 4, !dbg !63
  %idx.ext8 = sext i32 %10 to i64, !dbg !64
  %idx.neg = sub i64 0, %idx.ext8, !dbg !64
  %add.ptr9 = getelementptr inbounds i32, i32* %add.ptr, i64 %idx.neg, !dbg !64
  %11 = load i32**, i32*** %array, align 8, !dbg !65
  %12 = load i32, i32* %row, align 4, !dbg !66
  %idxprom = sext i32 %12 to i64, !dbg !65
  %arrayidx = getelementptr inbounds i32*, i32** %11, i64 %idxprom, !dbg !65
  store i32* %add.ptr9, i32** %arrayidx, align 8, !dbg !67
  %13 = load i32, i32* %row, align 4, !dbg !68
  store i32 %13, i32* %col, align 4, !dbg !70
  br label %for.cond10, !dbg !71

for.cond10:                                       ; preds = %for.inc, %for.body
  %14 = load i32, i32* %col, align 4, !dbg !72
  %15 = load i32, i32* %user1, align 4, !dbg !74
  %cmp11 = icmp slt i32 %14, %15, !dbg !75
  br i1 %cmp11, label %for.body13, label %for.end, !dbg !76

for.body13:                                       ; preds = %for.cond10
  %16 = load i32, i32* %col, align 4, !dbg !77
  %add14 = add nsw i32 1, %16, !dbg !78
  %17 = load i32, i32* %row, align 4, !dbg !79
  %sub = sub nsw i32 %add14, %17, !dbg !80
  %18 = load i32**, i32*** %array, align 8, !dbg !81
  %19 = load i32, i32* %row, align 4, !dbg !82
  %idxprom15 = sext i32 %19 to i64, !dbg !81
  %arrayidx16 = getelementptr inbounds i32*, i32** %18, i64 %idxprom15, !dbg !81
  %20 = load i32*, i32** %arrayidx16, align 8, !dbg !81
  %21 = load i32, i32* %col, align 4, !dbg !83
  %idxprom17 = sext i32 %21 to i64, !dbg !81
  %arrayidx18 = getelementptr inbounds i32, i32* %20, i64 %idxprom17, !dbg !81
  store i32 %sub, i32* %arrayidx18, align 4, !dbg !84
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body13
  %22 = load i32, i32* %col, align 4, !dbg !85
  %inc = add nsw i32 %22, 1, !dbg !85
  store i32 %inc, i32* %col, align 4, !dbg !85
  br label %for.cond10, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond10
  br label %for.inc19, !dbg !89

for.inc19:                                        ; preds = %for.end
  %23 = load i32, i32* %user1, align 4, !dbg !90
  %24 = load i32, i32* %row, align 4, !dbg !91
  %sub20 = sub nsw i32 %23, %24, !dbg !92
  %25 = load i32, i32* %offset, align 4, !dbg !93
  %add21 = add nsw i32 %25, %sub20, !dbg !93
  store i32 %add21, i32* %offset, align 4, !dbg !93
  %26 = load i32, i32* %row, align 4, !dbg !94
  %inc22 = add nsw i32 %26, 1, !dbg !94
  store i32 %inc22, i32* %row, align 4, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end23:                                        ; preds = %for.cond
  store i32 0, i32* %row, align 4, !dbg !98
  br label %for.cond24, !dbg !100

for.cond24:                                       ; preds = %for.inc34, %for.end23
  %27 = load i32, i32* %row, align 4, !dbg !101
  %28 = load i32, i32* %user1, align 4, !dbg !103
  %cmp25 = icmp slt i32 %27, %28, !dbg !104
  br i1 %cmp25, label %for.body27, label %for.end36, !dbg !105

for.body27:                                       ; preds = %for.cond24
  %29 = load i32**, i32*** %array, align 8, !dbg !106
  %30 = load i32, i32* %row, align 4, !dbg !107
  %idxprom28 = sext i32 %30 to i64, !dbg !106
  %arrayidx29 = getelementptr inbounds i32*, i32** %29, i64 %idxprom28, !dbg !106
  %31 = load i32*, i32** %arrayidx29, align 8, !dbg !106
  %32 = load i32, i32* %user1, align 4, !dbg !108
  %sub30 = sub nsw i32 %32, 1, !dbg !109
  %idxprom31 = sext i32 %sub30 to i64, !dbg !106
  %arrayidx32 = getelementptr inbounds i32, i32* %31, i64 %idxprom31, !dbg !106
  %33 = load i32, i32* %arrayidx32, align 4, !dbg !106
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %33), !dbg !110
  br label %for.inc34, !dbg !110

for.inc34:                                        ; preds = %for.body27
  %34 = load i32, i32* %row, align 4, !dbg !111
  %inc35 = add nsw i32 %34, 1, !dbg !111
  store i32 %inc35, i32* %row, align 4, !dbg !111
  br label %for.cond24, !dbg !112, !llvm.loop !113

for.end36:                                        ; preds = %for.cond24
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  %35 = load i32**, i32*** %array, align 8, !dbg !116
  %36 = bitcast i32** %35 to i8*, !dbg !116
  call void @free(i8* %36) #4, !dbg !117
  %37 = load i32*, i32** %a1, align 8, !dbg !118
  %38 = bitcast i32* %37 to i8*, !dbg !118
  call void @free(i8* %38) #4, !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-two-dimensional-array-at-runtime-4.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-two-dimensional-array-at-runtime-4")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 3, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocation(line: 3, column: 27, scope: !7)
!18 = !DILocalVariable(name: "user1", scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 8, scope: !7)
!20 = !DILocalVariable(name: "space_needed", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 8, scope: !7)
!22 = !DILocalVariable(name: "a1", scope: !7, file: !1, line: 7, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!24 = !DILocation(line: 7, column: 9, scope: !7)
!25 = !DILocalVariable(name: "array", scope: !7, file: !1, line: 7, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!27 = !DILocation(line: 7, column: 15, scope: !7)
!28 = !DILocalVariable(name: "row", scope: !7, file: !1, line: 8, type: !10)
!29 = !DILocation(line: 8, column: 8, scope: !7)
!30 = !DILocalVariable(name: "col", scope: !7, file: !1, line: 8, type: !10)
!31 = !DILocation(line: 8, column: 13, scope: !7)
!32 = !DILocalVariable(name: "offset", scope: !7, file: !1, line: 8, type: !10)
!33 = !DILocation(line: 8, column: 18, scope: !7)
!34 = !DILocation(line: 10, column: 4, scope: !7)
!35 = !DILocation(line: 11, column: 4, scope: !7)
!36 = !DILocation(line: 13, column: 20, scope: !7)
!37 = !DILocation(line: 13, column: 25, scope: !7)
!38 = !DILocation(line: 13, column: 29, scope: !7)
!39 = !DILocation(line: 13, column: 28, scope: !7)
!40 = !DILocation(line: 13, column: 34, scope: !7)
!41 = !DILocation(line: 13, column: 17, scope: !7)
!42 = !DILocation(line: 14, column: 16, scope: !7)
!43 = !DILocation(line: 14, column: 29, scope: !7)
!44 = !DILocation(line: 14, column: 9, scope: !7)
!45 = !DILocation(line: 14, column: 7, scope: !7)
!46 = !DILocation(line: 15, column: 19, scope: !7)
!47 = !DILocation(line: 15, column: 25, scope: !7)
!48 = !DILocation(line: 15, column: 12, scope: !7)
!49 = !DILocation(line: 15, column: 10, scope: !7)
!50 = !DILocation(line: 16, column: 12, scope: !51)
!51 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 4)
!52 = !DILocation(line: 16, column: 21, scope: !51)
!53 = !DILocation(line: 16, column: 9, scope: !51)
!54 = !DILocation(line: 16, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 16, column: 4)
!56 = !DILocation(line: 16, column: 29, scope: !55)
!57 = !DILocation(line: 16, column: 28, scope: !55)
!58 = !DILocation(line: 16, column: 4, scope: !51)
!59 = !DILocation(line: 17, column: 18, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 16, column: 64)
!61 = !DILocation(line: 17, column: 21, scope: !60)
!62 = !DILocation(line: 17, column: 20, scope: !60)
!63 = !DILocation(line: 17, column: 28, scope: !60)
!64 = !DILocation(line: 17, column: 27, scope: !60)
!65 = !DILocation(line: 17, column: 7, scope: !60)
!66 = !DILocation(line: 17, column: 13, scope: !60)
!67 = !DILocation(line: 17, column: 17, scope: !60)
!68 = !DILocation(line: 18, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !60, file: !1, line: 18, column: 7)
!70 = !DILocation(line: 18, column: 15, scope: !69)
!71 = !DILocation(line: 18, column: 12, scope: !69)
!72 = !DILocation(line: 18, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 18, column: 7)
!74 = !DILocation(line: 18, column: 25, scope: !73)
!75 = !DILocation(line: 18, column: 24, scope: !73)
!76 = !DILocation(line: 18, column: 7, scope: !69)
!77 = !DILocation(line: 19, column: 31, scope: !73)
!78 = !DILocation(line: 19, column: 30, scope: !73)
!79 = !DILocation(line: 19, column: 35, scope: !73)
!80 = !DILocation(line: 19, column: 34, scope: !73)
!81 = !DILocation(line: 19, column: 11, scope: !73)
!82 = !DILocation(line: 19, column: 17, scope: !73)
!83 = !DILocation(line: 19, column: 22, scope: !73)
!84 = !DILocation(line: 19, column: 27, scope: !73)
!85 = !DILocation(line: 18, column: 35, scope: !73)
!86 = !DILocation(line: 18, column: 7, scope: !73)
!87 = distinct !{!87, !76, !88}
!88 = !DILocation(line: 19, column: 35, scope: !69)
!89 = !DILocation(line: 20, column: 4, scope: !60)
!90 = !DILocation(line: 16, column: 45, scope: !55)
!91 = !DILocation(line: 16, column: 51, scope: !55)
!92 = !DILocation(line: 16, column: 50, scope: !55)
!93 = !DILocation(line: 16, column: 42, scope: !55)
!94 = !DILocation(line: 16, column: 60, scope: !55)
!95 = !DILocation(line: 16, column: 4, scope: !55)
!96 = distinct !{!96, !58, !97}
!97 = !DILocation(line: 20, column: 4, scope: !51)
!98 = !DILocation(line: 21, column: 12, scope: !99)
!99 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 4)
!100 = !DILocation(line: 21, column: 9, scope: !99)
!101 = !DILocation(line: 21, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 21, column: 4)
!103 = !DILocation(line: 21, column: 20, scope: !102)
!104 = !DILocation(line: 21, column: 19, scope: !102)
!105 = !DILocation(line: 21, column: 4, scope: !99)
!106 = !DILocation(line: 22, column: 21, scope: !102)
!107 = !DILocation(line: 22, column: 27, scope: !102)
!108 = !DILocation(line: 22, column: 32, scope: !102)
!109 = !DILocation(line: 22, column: 37, scope: !102)
!110 = !DILocation(line: 22, column: 7, scope: !102)
!111 = !DILocation(line: 21, column: 30, scope: !102)
!112 = !DILocation(line: 21, column: 4, scope: !102)
!113 = distinct !{!113, !105, !114}
!114 = !DILocation(line: 22, column: 40, scope: !99)
!115 = !DILocation(line: 23, column: 4, scope: !7)
!116 = !DILocation(line: 25, column: 9, scope: !7)
!117 = !DILocation(line: 25, column: 4, scope: !7)
!118 = !DILocation(line: 26, column: 9, scope: !7)
!119 = !DILocation(line: 26, column: 4, scope: !7)
!120 = !DILocation(line: 27, column: 4, scope: !7)
