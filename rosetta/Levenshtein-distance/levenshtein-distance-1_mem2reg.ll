; ModuleID = 'levenshtein-distance-1.ll'
source_filename = "levenshtein-distance-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"rosettacode\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"raisethysword\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"distance between `%s' and `%s': %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @levenshtein(i8* %s, i32 %ls, i8* %t, i32 %lt) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %ls, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %t, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %lt, metadata !18, metadata !DIExpression()), !dbg !15
  %tobool = icmp ne i32 %ls, 0, !dbg !19
  br i1 %tobool, label %if.end, label %if.then, !dbg !21, !cf.info !22

if.then:                                          ; preds = %entry
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  %tobool1 = icmp ne i32 %lt, 0, !dbg !24
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !26, !cf.info !22

if.then2:                                         ; preds = %if.end
  br label %return, !dbg !27

if.end3:                                          ; preds = %if.end
  %sub = sub nsw i32 %ls, 1, !dbg !28
  %idxprom = sext i32 %sub to i64, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !30
  %0 = load i8, i8* %arrayidx, align 1, !dbg !30
  %conv = sext i8 %0 to i32, !dbg !30
  %sub4 = sub nsw i32 %lt, 1, !dbg !31
  %idxprom5 = sext i32 %sub4 to i64, !dbg !32
  %arrayidx6 = getelementptr inbounds i8, i8* %t, i64 %idxprom5, !dbg !32
  %1 = load i8, i8* %arrayidx6, align 1, !dbg !32
  %conv7 = sext i8 %1 to i32, !dbg !32
  %cmp = icmp eq i32 %conv, %conv7, !dbg !33
  br i1 %cmp, label %if.then9, label %if.end12, !dbg !34, !cf.info !22

if.then9:                                         ; preds = %if.end3
  %sub10 = sub nsw i32 %ls, 1, !dbg !35
  %sub11 = sub nsw i32 %lt, 1, !dbg !36
  %call = call i32 @levenshtein(i8* %s, i32 %sub10, i8* %t, i32 %sub11), !dbg !37
  br label %return, !dbg !38

if.end12:                                         ; preds = %if.end3
  %sub13 = sub nsw i32 %ls, 1, !dbg !39
  %sub14 = sub nsw i32 %lt, 1, !dbg !40
  %call15 = call i32 @levenshtein(i8* %s, i32 %sub13, i8* %t, i32 %sub14), !dbg !41
  call void @llvm.dbg.value(metadata i32 %call15, metadata !42, metadata !DIExpression()), !dbg !15
  %sub16 = sub nsw i32 %lt, 1, !dbg !43
  %call17 = call i32 @levenshtein(i8* %s, i32 %ls, i8* %t, i32 %sub16), !dbg !44
  call void @llvm.dbg.value(metadata i32 %call17, metadata !45, metadata !DIExpression()), !dbg !15
  %sub18 = sub nsw i32 %ls, 1, !dbg !46
  %call19 = call i32 @levenshtein(i8* %s, i32 %sub18, i8* %t, i32 %lt), !dbg !47
  call void @llvm.dbg.value(metadata i32 %call19, metadata !48, metadata !DIExpression()), !dbg !15
  %cmp20 = icmp sgt i32 %call15, %call17, !dbg !49
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !51, !cf.info !22

if.then22:                                        ; preds = %if.end12
  call void @llvm.dbg.value(metadata i32 %call17, metadata !42, metadata !DIExpression()), !dbg !15
  br label %if.end23, !dbg !52

if.end23:                                         ; preds = %if.then22, %if.end12
  %a.0 = phi i32 [ %call17, %if.then22 ], [ %call15, %if.end12 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %a.0, metadata !42, metadata !DIExpression()), !dbg !15
  %cmp24 = icmp sgt i32 %a.0, %call19, !dbg !53
  br i1 %cmp24, label %if.then26, label %if.end27, !dbg !55, !cf.info !22

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.value(metadata i32 %call19, metadata !42, metadata !DIExpression()), !dbg !15
  br label %if.end27, !dbg !56

if.end27:                                         ; preds = %if.then26, %if.end23
  %a.1 = phi i32 [ %call19, %if.then26 ], [ %a.0, %if.end23 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %a.1, metadata !42, metadata !DIExpression()), !dbg !15
  %add = add nsw i32 %a.1, 1, !dbg !57
  br label %return, !dbg !58

return:                                           ; preds = %if.end27, %if.then9, %if.then2, %if.then
  %retval.0 = phi i32 [ %call, %if.then9 ], [ %add, %if.end27 ], [ %ls, %if.then2 ], [ %lt, %if.then ], !dbg !15
  ret i32 %retval.0, !dbg !59
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !60 {
entry:
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), metadata !65, metadata !DIExpression()), !dbg !64
  %call = call i64 @strlen(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0)) #4, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !66
  %call1 = call i64 @strlen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !67
  %conv2 = trunc i64 %call1 to i32, !dbg !67
  %call3 = call i32 @levenshtein(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %conv, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %conv2), !dbg !68
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %call3), !dbg !69
  ret i32 0, !dbg !70
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "levenshtein-distance-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Levenshtein-distance")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "levenshtein", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, !11, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "s", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "ls", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!17 = !DILocalVariable(name: "t", arg: 3, scope: !7, file: !1, line: 5, type: !11)
!18 = !DILocalVariable(name: "lt", arg: 4, scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 12, column: 14, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 13)
!21 = !DILocation(line: 12, column: 13, scope: !7)
!22 = !{!"if"}
!23 = !DILocation(line: 12, column: 18, scope: !20)
!24 = !DILocation(line: 13, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 13)
!26 = !DILocation(line: 13, column: 13, scope: !7)
!27 = !DILocation(line: 13, column: 18, scope: !25)
!28 = !DILocation(line: 18, column: 18, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 13)
!30 = !DILocation(line: 18, column: 13, scope: !29)
!31 = !DILocation(line: 18, column: 31, scope: !29)
!32 = !DILocation(line: 18, column: 26, scope: !29)
!33 = !DILocation(line: 18, column: 23, scope: !29)
!34 = !DILocation(line: 18, column: 13, scope: !7)
!35 = !DILocation(line: 19, column: 42, scope: !29)
!36 = !DILocation(line: 19, column: 53, scope: !29)
!37 = !DILocation(line: 19, column: 24, scope: !29)
!38 = !DILocation(line: 19, column: 17, scope: !29)
!39 = !DILocation(line: 27, column: 31, scope: !7)
!40 = !DILocation(line: 27, column: 42, scope: !7)
!41 = !DILocation(line: 27, column: 13, scope: !7)
!42 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 7, type: !10)
!43 = !DILocation(line: 28, column: 42, scope: !7)
!44 = !DILocation(line: 28, column: 13, scope: !7)
!45 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 7, type: !10)
!46 = !DILocation(line: 29, column: 31, scope: !7)
!47 = !DILocation(line: 29, column: 13, scope: !7)
!48 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 7, type: !10)
!49 = !DILocation(line: 31, column: 15, scope: !50)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 31, column: 13)
!51 = !DILocation(line: 31, column: 13, scope: !7)
!52 = !DILocation(line: 31, column: 20, scope: !50)
!53 = !DILocation(line: 32, column: 15, scope: !54)
!54 = distinct !DILexicalBlock(scope: !7, file: !1, line: 32, column: 13)
!55 = !DILocation(line: 32, column: 13, scope: !7)
!56 = !DILocation(line: 32, column: 20, scope: !54)
!57 = !DILocation(line: 34, column: 18, scope: !7)
!58 = !DILocation(line: 34, column: 9, scope: !7)
!59 = !DILocation(line: 35, column: 1, scope: !7)
!60 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 37, type: !61, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!10}
!63 = !DILocalVariable(name: "s1", scope: !60, file: !1, line: 39, type: !11)
!64 = !DILocation(line: 0, scope: !60)
!65 = !DILocalVariable(name: "s2", scope: !60, file: !1, line: 40, type: !11)
!66 = !DILocation(line: 42, column: 33, scope: !60)
!67 = !DILocation(line: 42, column: 49, scope: !60)
!68 = !DILocation(line: 42, column: 17, scope: !60)
!69 = !DILocation(line: 41, column: 9, scope: !60)
!70 = !DILocation(line: 44, column: 9, scope: !60)
