; ModuleID = 'search-a-list.ll'
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
  call void @llvm.dbg.value(metadata i8* %needle, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i8** %hs, metadata !25, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 0, metadata !26, metadata !DIExpression()), !dbg !24
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %if.end ], !dbg !24
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !26, metadata !DIExpression()), !dbg !24
  %idxprom = sext i32 %i.0 to i64, !dbg !28
  %arrayidx = getelementptr inbounds i8*, i8** %hs, i64 %idxprom, !dbg !28
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !28
  %cmp = icmp ne i8* %0, null, !dbg !29
  br i1 %cmp, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %while.cond
  %idxprom1 = sext i32 %i.0 to i64, !dbg !30
  %arrayidx2 = getelementptr inbounds i8*, i8** %hs, i64 %idxprom1, !dbg !30
  %1 = load i8*, i8** %arrayidx2, align 8, !dbg !30
  %call = call i32 @strcmp(i8* %1, i8* %needle) #4, !dbg !33
  %cmp3 = icmp eq i32 %call, 0, !dbg !34
  br i1 %cmp3, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %while.body
  br label %return, !dbg !36

if.end:                                           ; preds = %while.body
  %inc = add nsw i32 %i.0, 1, !dbg !37
  call void @llvm.dbg.value(metadata i32 %inc, metadata !26, metadata !DIExpression()), !dbg !24
  br label %while.cond, !dbg !27, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !40

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i32 [ %i.0, %if.then ], [ -1, %while.end ], !dbg !24
  ret i32 %retval.0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @search_last_needle(i8* %needle, i8** %hs) #0 !dbg !42 {
entry:
  call void @llvm.dbg.value(metadata i8* %needle, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i8** %hs, metadata !45, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 0, metadata !46, metadata !DIExpression()), !dbg !44
  %call = call i32 @search_needle(i8* %needle, i8** %hs), !dbg !47
  call void @llvm.dbg.value(metadata i32 %call, metadata !46, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %call, metadata !48, metadata !DIExpression()), !dbg !44
  %cmp = icmp slt i32 %call, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  br label %return, !dbg !52

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !53

while.cond:                                       ; preds = %if.end7, %if.end
  %i.0 = phi i32 [ %call, %if.end ], [ %inc, %if.end7 ], !dbg !44
  %last.0 = phi i32 [ %call, %if.end ], [ %last.1, %if.end7 ], !dbg !44
  call void @llvm.dbg.value(metadata i32 %last.0, metadata !46, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !48, metadata !DIExpression()), !dbg !44
  %inc = add nsw i32 %i.0, 1, !dbg !54
  call void @llvm.dbg.value(metadata i32 %inc, metadata !48, metadata !DIExpression()), !dbg !44
  %idxprom = sext i32 %inc to i64, !dbg !55
  %arrayidx = getelementptr inbounds i8*, i8** %hs, i64 %idxprom, !dbg !55
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !55
  %cmp1 = icmp ne i8* %0, null, !dbg !56
  br i1 %cmp1, label %while.body, label %while.end, !dbg !53

while.body:                                       ; preds = %while.cond
  %idxprom2 = sext i32 %inc to i64, !dbg !57
  %arrayidx3 = getelementptr inbounds i8*, i8** %hs, i64 %idxprom2, !dbg !57
  %1 = load i8*, i8** %arrayidx3, align 8, !dbg !57
  %call4 = call i32 @strcmp(i8* %needle, i8* %1) #4, !dbg !60
  %cmp5 = icmp eq i32 %call4, 0, !dbg !61
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !62

if.then6:                                         ; preds = %while.body
  call void @llvm.dbg.value(metadata i32 %inc, metadata !46, metadata !DIExpression()), !dbg !44
  br label %if.end7, !dbg !63

if.end7:                                          ; preds = %if.then6, %while.body
  %last.1 = phi i32 [ %inc, %if.then6 ], [ %last.0, %while.body ], !dbg !44
  call void @llvm.dbg.value(metadata i32 %last.1, metadata !46, metadata !DIExpression()), !dbg !44
  br label %while.cond, !dbg !53, !llvm.loop !65

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !67

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ %last.0, %while.end ], !dbg !44
  ret i32 %retval.0, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !69 {
entry:
  %call = call i32 @search_needle(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !72
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i64 0, i64 0), i32 %call), !dbg !73
  %call2 = call i32 @search_needle(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !74
  %cmp = icmp eq i32 %call2, -1, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.10, i64 0, i64 0)), !dbg !78
  br label %if.end, !dbg !78

if.end:                                           ; preds = %if.then, %entry
  %call4 = call i32 @search_needle(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !79
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i32 %call4), !dbg !80
  %call6 = call i32 @search_last_needle(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([11 x i8*], [11 x i8*]* @haystack, i64 0, i64 0)), !dbg !81
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i32 %call6), !dbg !82
  ret i32 0, !dbg !83
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!24 = !DILocation(line: 0, scope: !18)
!25 = !DILocalVariable(name: "hs", arg: 2, scope: !18, file: !3, line: 9, type: !22)
!26 = !DILocalVariable(name: "i", scope: !18, file: !3, line: 11, type: !21)
!27 = !DILocation(line: 12, column: 3, scope: !18)
!28 = !DILocation(line: 12, column: 10, scope: !18)
!29 = !DILocation(line: 12, column: 16, scope: !18)
!30 = !DILocation(line: 13, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 13, column: 10)
!32 = distinct !DILexicalBlock(scope: !18, file: !3, line: 12, column: 26)
!33 = !DILocation(line: 13, column: 10, scope: !31)
!34 = !DILocation(line: 13, column: 32, scope: !31)
!35 = !DILocation(line: 13, column: 10, scope: !32)
!36 = !DILocation(line: 13, column: 39, scope: !31)
!37 = !DILocation(line: 14, column: 6, scope: !32)
!38 = distinct !{!38, !27, !39}
!39 = !DILocation(line: 15, column: 3, scope: !18)
!40 = !DILocation(line: 16, column: 3, scope: !18)
!41 = !DILocation(line: 17, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "search_last_needle", scope: !3, file: !3, line: 19, type: !19, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocalVariable(name: "needle", arg: 1, scope: !42, file: !3, line: 19, type: !9)
!44 = !DILocation(line: 0, scope: !42)
!45 = !DILocalVariable(name: "hs", arg: 2, scope: !42, file: !3, line: 19, type: !22)
!46 = !DILocalVariable(name: "last", scope: !42, file: !3, line: 21, type: !21)
!47 = !DILocation(line: 22, column: 14, scope: !42)
!48 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 21, type: !21)
!49 = !DILocation(line: 23, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !3, line: 23, column: 8)
!51 = !DILocation(line: 23, column: 8, scope: !42)
!52 = !DILocation(line: 23, column: 19, scope: !50)
!53 = !DILocation(line: 24, column: 3, scope: !42)
!54 = !DILocation(line: 24, column: 13, scope: !42)
!55 = !DILocation(line: 24, column: 10, scope: !42)
!56 = !DILocation(line: 24, column: 18, scope: !42)
!57 = !DILocation(line: 25, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !3, line: 25, column: 10)
!59 = distinct !DILexicalBlock(scope: !42, file: !3, line: 24, column: 28)
!60 = !DILocation(line: 25, column: 10, scope: !58)
!61 = !DILocation(line: 25, column: 32, scope: !58)
!62 = !DILocation(line: 25, column: 10, scope: !59)
!63 = !DILocation(line: 27, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !3, line: 25, column: 39)
!65 = distinct !{!65, !53, !66}
!66 = !DILocation(line: 28, column: 3, scope: !42)
!67 = !DILocation(line: 29, column: 3, scope: !42)
!68 = !DILocation(line: 30, column: 1, scope: !42)
!69 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 32, type: !70, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!21}
!72 = !DILocation(line: 34, column: 29, scope: !69)
!73 = !DILocation(line: 34, column: 3, scope: !69)
!74 = !DILocation(line: 35, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 35, column: 8)
!76 = !DILocation(line: 35, column: 46, scope: !75)
!77 = !DILocation(line: 35, column: 8, scope: !69)
!78 = !DILocation(line: 36, column: 5, scope: !75)
!79 = !DILocation(line: 37, column: 39, scope: !69)
!80 = !DILocation(line: 37, column: 3, scope: !69)
!81 = !DILocation(line: 38, column: 38, scope: !69)
!82 = !DILocation(line: 38, column: 3, scope: !69)
!83 = !DILocation(line: 39, column: 3, scope: !69)
