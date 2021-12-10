; ModuleID = 'search-a-list.bc'
source_filename = "search-a-list.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"Zig\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"Zag\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Wally\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Ronald\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Bush\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Krusty\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"Charlie\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"Boz\00", align 1
@haystack = dso_local global [11 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* null], align 16, !dbg !0
@.str.8 = private unnamed_addr constant [15 x i8] c"Bush is at %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Washington\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"Washington is not in the haystack\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"First index for Zag: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Last index for Zag: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @search_needle(i8* %needle, i8** %hs) #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %needle.addr = alloca i8*, align 8
  %hs.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i8* %needle, i8** %needle.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %needle.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %hs, i8*** %hs.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %hs.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %i, align 4, !dbg !28
  br label %while.cond, !dbg !29

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i8**, i8*** %hs.addr, align 8, !dbg !30
  %1 = load i32, i32* %i, align 4, !dbg !31
  %idxprom = sext i32 %1 to i64, !dbg !30
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 %idxprom, !dbg !30
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !30
  %cmp = icmp ne i8* %2, null, !dbg !32
  br i1 %cmp, label %while.body, label %while.end, !dbg !29

while.body:                                       ; preds = %while.cond
  %3 = load i8**, i8*** %hs.addr, align 8, !dbg !33
  %4 = load i32, i32* %i, align 4, !dbg !36
  %idxprom1 = sext i32 %4 to i64, !dbg !33
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 %idxprom1, !dbg !33
  %5 = load i8*, i8** %arrayidx2, align 8, !dbg !33
  %6 = load i8*, i8** %needle.addr, align 8, !dbg !37
  %call = call i32 @strcmp(i8* %5, i8* %6) #4, !dbg !38
  %cmp3 = icmp eq i32 %call, 0, !dbg !39
  br i1 %cmp3, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %while.body
  %7 = load i32, i32* %i, align 4, !dbg !41
  store i32 %7, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

if.end:                                           ; preds = %while.body
  %8 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %8, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %while.cond, !dbg !29, !llvm.loop !44

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval, align 4, !dbg !46
  br label %return, !dbg !46

return:                                           ; preds = %while.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %9, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @search_last_needle(i8* %needle, i8** %hs) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %needle.addr = alloca i8*, align 8
  %hs.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %last = alloca i32, align 4
  store i8* %needle, i8** %needle.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %needle.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %hs, i8*** %hs.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %hs.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %last, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %last, align 4, !dbg !56
  %0 = load i8*, i8** %needle.addr, align 8, !dbg !57
  %1 = load i8**, i8*** %hs.addr, align 8, !dbg !58
  %call = call i32 @search_needle(i8* %0, i8** %1), !dbg !59
  store i32 %call, i32* %last, align 4, !dbg !60
  store i32 %call, i32* %i, align 4, !dbg !61
  %2 = load i32, i32* %last, align 4, !dbg !62
  %cmp = icmp slt i32 %2, 0, !dbg !64
  br i1 %cmp, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !66
  br label %return, !dbg !66

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !67

while.cond:                                       ; preds = %if.end7, %if.end
  %3 = load i8**, i8*** %hs.addr, align 8, !dbg !68
  %4 = load i32, i32* %i, align 4, !dbg !69
  %inc = add nsw i32 %4, 1, !dbg !69
  store i32 %inc, i32* %i, align 4, !dbg !69
  %idxprom = sext i32 %inc to i64, !dbg !68
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 %idxprom, !dbg !68
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !68
  %cmp1 = icmp ne i8* %5, null, !dbg !70
  br i1 %cmp1, label %while.body, label %while.end, !dbg !67

while.body:                                       ; preds = %while.cond
  %6 = load i8*, i8** %needle.addr, align 8, !dbg !71
  %7 = load i8**, i8*** %hs.addr, align 8, !dbg !74
  %8 = load i32, i32* %i, align 4, !dbg !75
  %idxprom2 = sext i32 %8 to i64, !dbg !74
  %arrayidx3 = getelementptr inbounds i8*, i8** %7, i64 %idxprom2, !dbg !74
  %9 = load i8*, i8** %arrayidx3, align 8, !dbg !74
  %call4 = call i32 @strcmp(i8* %6, i8* %9) #4, !dbg !76
  %cmp5 = icmp eq i32 %call4, 0, !dbg !77
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !78

if.then6:                                         ; preds = %while.body
  %10 = load i32, i32* %i, align 4, !dbg !79
  store i32 %10, i32* %last, align 4, !dbg !81
  br label %if.end7, !dbg !82

if.end7:                                          ; preds = %if.then6, %while.body
  br label %while.cond, !dbg !67, !llvm.loop !83

while.end:                                        ; preds = %while.cond
  %11 = load i32, i32* %last, align 4, !dbg !85
  store i32 %11, i32* %retval, align 4, !dbg !86
  br label %return, !dbg !86

return:                                           ; preds = %while.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %12, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @search_needle(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !91
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i64 0, i64 0), i32 %call), !dbg !92
  %call2 = call i32 @search_needle(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !93
  %cmp = icmp eq i32 %call2, -1, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i32 @search_needle(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !98
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i32 %call4), !dbg !99
  %call6 = call i32 @search_last_needle(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !100
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i32 %call6), !dbg !101
  ret i32 0, !dbg !102
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "haystack", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "search-a-list.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Search-a-list")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0}
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 704, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 11)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!18 = distinct !DISubprogram(name: "search_needle", scope: !3, file: !3, line: 9, type: !19, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{!21, !9, !22}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!23 = !DILocalVariable(name: "needle", arg: 1, scope: !18, file: !3, line: 9, type: !9)
!24 = !DILocation(line: 9, column: 31, scope: !18)
!25 = !DILocalVariable(name: "hs", arg: 2, scope: !18, file: !3, line: 9, type: !22)
!26 = !DILocation(line: 9, column: 52, scope: !18)
!27 = !DILocalVariable(name: "i", scope: !18, file: !3, line: 11, type: !21)
!28 = !DILocation(line: 11, column: 7, scope: !18)
!29 = !DILocation(line: 12, column: 3, scope: !18)
!30 = !DILocation(line: 12, column: 10, scope: !18)
!31 = !DILocation(line: 12, column: 13, scope: !18)
!32 = !DILocation(line: 12, column: 16, scope: !18)
!33 = !DILocation(line: 13, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 13, column: 10)
!35 = distinct !DILexicalBlock(scope: !18, file: !3, line: 12, column: 26)
!36 = !DILocation(line: 13, column: 20, scope: !34)
!37 = !DILocation(line: 13, column: 24, scope: !34)
!38 = !DILocation(line: 13, column: 10, scope: !34)
!39 = !DILocation(line: 13, column: 32, scope: !34)
!40 = !DILocation(line: 13, column: 10, scope: !35)
!41 = !DILocation(line: 13, column: 46, scope: !34)
!42 = !DILocation(line: 13, column: 39, scope: !34)
!43 = !DILocation(line: 14, column: 6, scope: !35)
!44 = distinct !{!44, !29, !45}
!45 = !DILocation(line: 15, column: 3, scope: !18)
!46 = !DILocation(line: 16, column: 3, scope: !18)
!47 = !DILocation(line: 17, column: 1, scope: !18)
!48 = distinct !DISubprogram(name: "search_last_needle", scope: !3, file: !3, line: 19, type: !19, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocalVariable(name: "needle", arg: 1, scope: !48, file: !3, line: 19, type: !9)
!50 = !DILocation(line: 19, column: 36, scope: !48)
!51 = !DILocalVariable(name: "hs", arg: 2, scope: !48, file: !3, line: 19, type: !22)
!52 = !DILocation(line: 19, column: 57, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !3, line: 21, type: !21)
!54 = !DILocation(line: 21, column: 7, scope: !48)
!55 = !DILocalVariable(name: "last", scope: !48, file: !3, line: 21, type: !21)
!56 = !DILocation(line: 21, column: 10, scope: !48)
!57 = !DILocation(line: 22, column: 28, scope: !48)
!58 = !DILocation(line: 22, column: 36, scope: !48)
!59 = !DILocation(line: 22, column: 14, scope: !48)
!60 = !DILocation(line: 22, column: 12, scope: !48)
!61 = !DILocation(line: 22, column: 5, scope: !48)
!62 = !DILocation(line: 23, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !48, file: !3, line: 23, column: 8)
!64 = !DILocation(line: 23, column: 13, scope: !63)
!65 = !DILocation(line: 23, column: 8, scope: !48)
!66 = !DILocation(line: 23, column: 19, scope: !63)
!67 = !DILocation(line: 24, column: 3, scope: !48)
!68 = !DILocation(line: 24, column: 10, scope: !48)
!69 = !DILocation(line: 24, column: 13, scope: !48)
!70 = !DILocation(line: 24, column: 18, scope: !48)
!71 = !DILocation(line: 25, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !3, line: 25, column: 10)
!73 = distinct !DILexicalBlock(scope: !48, file: !3, line: 24, column: 28)
!74 = !DILocation(line: 25, column: 25, scope: !72)
!75 = !DILocation(line: 25, column: 28, scope: !72)
!76 = !DILocation(line: 25, column: 10, scope: !72)
!77 = !DILocation(line: 25, column: 32, scope: !72)
!78 = !DILocation(line: 25, column: 10, scope: !73)
!79 = !DILocation(line: 26, column: 14, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !3, line: 25, column: 39)
!81 = !DILocation(line: 26, column: 12, scope: !80)
!82 = !DILocation(line: 27, column: 5, scope: !80)
!83 = distinct !{!83, !67, !84}
!84 = !DILocation(line: 28, column: 3, scope: !48)
!85 = !DILocation(line: 29, column: 10, scope: !48)
!86 = !DILocation(line: 29, column: 3, scope: !48)
!87 = !DILocation(line: 30, column: 1, scope: !48)
!88 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 32, type: !89, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!21}
!91 = !DILocation(line: 34, column: 29, scope: !88)
!92 = !DILocation(line: 34, column: 3, scope: !88)
!93 = !DILocation(line: 35, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !3, line: 35, column: 8)
!95 = !DILocation(line: 35, column: 46, scope: !94)
!96 = !DILocation(line: 35, column: 8, scope: !88)
!97 = !DILocation(line: 36, column: 5, scope: !94)
!98 = !DILocation(line: 37, column: 39, scope: !88)
!99 = !DILocation(line: 37, column: 3, scope: !88)
!100 = !DILocation(line: 38, column: 38, scope: !88)
!101 = !DILocation(line: 38, column: 3, scope: !88)
!102 = !DILocation(line: 39, column: 3, scope: !88)
