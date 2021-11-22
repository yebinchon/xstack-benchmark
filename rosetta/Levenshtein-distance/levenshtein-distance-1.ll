; ModuleID = 'levenshtein-distance-1.c'
source_filename = "levenshtein-distance-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"rosettacode\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"raisethysword\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"distance between `%s' and `%s': %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @levenshtein(i8* %s, i32 %ls, i8* %t, i32 %lt) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %ls.addr = alloca i32, align 4
  %t.addr = alloca i8*, align 8
  %lt.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %ls, i32* %ls.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ls.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8* %t, i8** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %t.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 %lt, i32* %lt.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %lt.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %b, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %c, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %ls.addr, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.end, label %if.then, !dbg !30, !cf.info !31

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %lt.addr, align 4, !dbg !32
  store i32 %1, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %lt.addr, align 4, !dbg !34
  %tobool1 = icmp ne i32 %2, 0, !dbg !34
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !36, !cf.info !31

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %ls.addr, align 4, !dbg !37
  store i32 %3, i32* %retval, align 4, !dbg !38
  br label %return, !dbg !38

if.end3:                                          ; preds = %if.end
  %4 = load i8*, i8** %s.addr, align 8, !dbg !39
  %5 = load i32, i32* %ls.addr, align 4, !dbg !41
  %sub = sub nsw i32 %5, 1, !dbg !42
  %idxprom = sext i32 %sub to i64, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !39
  %6 = load i8, i8* %arrayidx, align 1, !dbg !39
  %conv = sext i8 %6 to i32, !dbg !39
  %7 = load i8*, i8** %t.addr, align 8, !dbg !43
  %8 = load i32, i32* %lt.addr, align 4, !dbg !44
  %sub4 = sub nsw i32 %8, 1, !dbg !45
  %idxprom5 = sext i32 %sub4 to i64, !dbg !43
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %idxprom5, !dbg !43
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !43
  %conv7 = sext i8 %9 to i32, !dbg !43
  %cmp = icmp eq i32 %conv, %conv7, !dbg !46
  br i1 %cmp, label %if.then9, label %if.end12, !dbg !47, !cf.info !31

if.then9:                                         ; preds = %if.end3
  %10 = load i8*, i8** %s.addr, align 8, !dbg !48
  %11 = load i32, i32* %ls.addr, align 4, !dbg !49
  %sub10 = sub nsw i32 %11, 1, !dbg !50
  %12 = load i8*, i8** %t.addr, align 8, !dbg !51
  %13 = load i32, i32* %lt.addr, align 4, !dbg !52
  %sub11 = sub nsw i32 %13, 1, !dbg !53
  %call = call i32 @levenshtein(i8* %10, i32 %sub10, i8* %12, i32 %sub11), !dbg !54
  store i32 %call, i32* %retval, align 4, !dbg !55
  br label %return, !dbg !55

if.end12:                                         ; preds = %if.end3
  %14 = load i8*, i8** %s.addr, align 8, !dbg !56
  %15 = load i32, i32* %ls.addr, align 4, !dbg !57
  %sub13 = sub nsw i32 %15, 1, !dbg !58
  %16 = load i8*, i8** %t.addr, align 8, !dbg !59
  %17 = load i32, i32* %lt.addr, align 4, !dbg !60
  %sub14 = sub nsw i32 %17, 1, !dbg !61
  %call15 = call i32 @levenshtein(i8* %14, i32 %sub13, i8* %16, i32 %sub14), !dbg !62
  store i32 %call15, i32* %a, align 4, !dbg !63
  %18 = load i8*, i8** %s.addr, align 8, !dbg !64
  %19 = load i32, i32* %ls.addr, align 4, !dbg !65
  %20 = load i8*, i8** %t.addr, align 8, !dbg !66
  %21 = load i32, i32* %lt.addr, align 4, !dbg !67
  %sub16 = sub nsw i32 %21, 1, !dbg !68
  %call17 = call i32 @levenshtein(i8* %18, i32 %19, i8* %20, i32 %sub16), !dbg !69
  store i32 %call17, i32* %b, align 4, !dbg !70
  %22 = load i8*, i8** %s.addr, align 8, !dbg !71
  %23 = load i32, i32* %ls.addr, align 4, !dbg !72
  %sub18 = sub nsw i32 %23, 1, !dbg !73
  %24 = load i8*, i8** %t.addr, align 8, !dbg !74
  %25 = load i32, i32* %lt.addr, align 4, !dbg !75
  %call19 = call i32 @levenshtein(i8* %22, i32 %sub18, i8* %24, i32 %25), !dbg !76
  store i32 %call19, i32* %c, align 4, !dbg !77
  %26 = load i32, i32* %a, align 4, !dbg !78
  %27 = load i32, i32* %b, align 4, !dbg !80
  %cmp20 = icmp sgt i32 %26, %27, !dbg !81
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !82, !cf.info !31

if.then22:                                        ; preds = %if.end12
  %28 = load i32, i32* %b, align 4, !dbg !83
  store i32 %28, i32* %a, align 4, !dbg !84
  br label %if.end23, !dbg !85

if.end23:                                         ; preds = %if.then22, %if.end12
  %29 = load i32, i32* %a, align 4, !dbg !86
  %30 = load i32, i32* %c, align 4, !dbg !88
  %cmp24 = icmp sgt i32 %29, %30, !dbg !89
  br i1 %cmp24, label %if.then26, label %if.end27, !dbg !90, !cf.info !31

if.then26:                                        ; preds = %if.end23
  %31 = load i32, i32* %c, align 4, !dbg !91
  store i32 %31, i32* %a, align 4, !dbg !92
  br label %if.end27, !dbg !93

if.end27:                                         ; preds = %if.then26, %if.end23
  %32 = load i32, i32* %a, align 4, !dbg !94
  %add = add nsw i32 %32, 1, !dbg !95
  store i32 %add, i32* %retval, align 4, !dbg !96
  br label %return, !dbg !96

return:                                           ; preds = %if.end27, %if.then9, %if.then2, %if.then
  %33 = load i32, i32* %retval, align 4, !dbg !97
  ret i32 %33, !dbg !97
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca i8*, align 8
  %s2 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %s1, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8** %s1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %s2, metadata !103, metadata !DIExpression()), !dbg !104
  store i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i8** %s2, align 8, !dbg !104
  %0 = load i8*, i8** %s1, align 8, !dbg !105
  %1 = load i8*, i8** %s2, align 8, !dbg !106
  %2 = load i8*, i8** %s1, align 8, !dbg !107
  %3 = load i8*, i8** %s1, align 8, !dbg !108
  %call = call i64 @strlen(i8* %3) #4, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !109
  %4 = load i8*, i8** %s2, align 8, !dbg !110
  %5 = load i8*, i8** %s2, align 8, !dbg !111
  %call1 = call i64 @strlen(i8* %5) #4, !dbg !112
  %conv2 = trunc i64 %call1 to i32, !dbg !112
  %call3 = call i32 @levenshtein(i8* %2, i32 %conv, i8* %4, i32 %conv2), !dbg !113
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i8* %0, i8* %1, i32 %call3), !dbg !114
  ret i32 0, !dbg !115
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

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
!15 = !DILocation(line: 5, column: 29, scope: !7)
!16 = !DILocalVariable(name: "ls", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!17 = !DILocation(line: 5, column: 36, scope: !7)
!18 = !DILocalVariable(name: "t", arg: 3, scope: !7, file: !1, line: 5, type: !11)
!19 = !DILocation(line: 5, column: 52, scope: !7)
!20 = !DILocalVariable(name: "lt", arg: 4, scope: !7, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 5, column: 59, scope: !7)
!22 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 13, scope: !7)
!24 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 16, scope: !7)
!26 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 7, type: !10)
!27 = !DILocation(line: 7, column: 19, scope: !7)
!28 = !DILocation(line: 12, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 13)
!30 = !DILocation(line: 12, column: 13, scope: !7)
!31 = !{!"if"}
!32 = !DILocation(line: 12, column: 25, scope: !29)
!33 = !DILocation(line: 12, column: 18, scope: !29)
!34 = !DILocation(line: 13, column: 14, scope: !35)
!35 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 13)
!36 = !DILocation(line: 13, column: 13, scope: !7)
!37 = !DILocation(line: 13, column: 25, scope: !35)
!38 = !DILocation(line: 13, column: 18, scope: !35)
!39 = !DILocation(line: 18, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 13)
!41 = !DILocation(line: 18, column: 15, scope: !40)
!42 = !DILocation(line: 18, column: 18, scope: !40)
!43 = !DILocation(line: 18, column: 26, scope: !40)
!44 = !DILocation(line: 18, column: 28, scope: !40)
!45 = !DILocation(line: 18, column: 31, scope: !40)
!46 = !DILocation(line: 18, column: 23, scope: !40)
!47 = !DILocation(line: 18, column: 13, scope: !7)
!48 = !DILocation(line: 19, column: 36, scope: !40)
!49 = !DILocation(line: 19, column: 39, scope: !40)
!50 = !DILocation(line: 19, column: 42, scope: !40)
!51 = !DILocation(line: 19, column: 47, scope: !40)
!52 = !DILocation(line: 19, column: 50, scope: !40)
!53 = !DILocation(line: 19, column: 53, scope: !40)
!54 = !DILocation(line: 19, column: 24, scope: !40)
!55 = !DILocation(line: 19, column: 17, scope: !40)
!56 = !DILocation(line: 27, column: 25, scope: !7)
!57 = !DILocation(line: 27, column: 28, scope: !7)
!58 = !DILocation(line: 27, column: 31, scope: !7)
!59 = !DILocation(line: 27, column: 36, scope: !7)
!60 = !DILocation(line: 27, column: 39, scope: !7)
!61 = !DILocation(line: 27, column: 42, scope: !7)
!62 = !DILocation(line: 27, column: 13, scope: !7)
!63 = !DILocation(line: 27, column: 11, scope: !7)
!64 = !DILocation(line: 28, column: 25, scope: !7)
!65 = !DILocation(line: 28, column: 28, scope: !7)
!66 = !DILocation(line: 28, column: 36, scope: !7)
!67 = !DILocation(line: 28, column: 39, scope: !7)
!68 = !DILocation(line: 28, column: 42, scope: !7)
!69 = !DILocation(line: 28, column: 13, scope: !7)
!70 = !DILocation(line: 28, column: 11, scope: !7)
!71 = !DILocation(line: 29, column: 25, scope: !7)
!72 = !DILocation(line: 29, column: 28, scope: !7)
!73 = !DILocation(line: 29, column: 31, scope: !7)
!74 = !DILocation(line: 29, column: 36, scope: !7)
!75 = !DILocation(line: 29, column: 39, scope: !7)
!76 = !DILocation(line: 29, column: 13, scope: !7)
!77 = !DILocation(line: 29, column: 11, scope: !7)
!78 = !DILocation(line: 31, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !7, file: !1, line: 31, column: 13)
!80 = !DILocation(line: 31, column: 17, scope: !79)
!81 = !DILocation(line: 31, column: 15, scope: !79)
!82 = !DILocation(line: 31, column: 13, scope: !7)
!83 = !DILocation(line: 31, column: 24, scope: !79)
!84 = !DILocation(line: 31, column: 22, scope: !79)
!85 = !DILocation(line: 31, column: 20, scope: !79)
!86 = !DILocation(line: 32, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !7, file: !1, line: 32, column: 13)
!88 = !DILocation(line: 32, column: 17, scope: !87)
!89 = !DILocation(line: 32, column: 15, scope: !87)
!90 = !DILocation(line: 32, column: 13, scope: !7)
!91 = !DILocation(line: 32, column: 24, scope: !87)
!92 = !DILocation(line: 32, column: 22, scope: !87)
!93 = !DILocation(line: 32, column: 20, scope: !87)
!94 = !DILocation(line: 34, column: 16, scope: !7)
!95 = !DILocation(line: 34, column: 18, scope: !7)
!96 = !DILocation(line: 34, column: 9, scope: !7)
!97 = !DILocation(line: 35, column: 1, scope: !7)
!98 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 37, type: !99, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!10}
!101 = !DILocalVariable(name: "s1", scope: !98, file: !1, line: 39, type: !11)
!102 = !DILocation(line: 39, column: 21, scope: !98)
!103 = !DILocalVariable(name: "s2", scope: !98, file: !1, line: 40, type: !11)
!104 = !DILocation(line: 40, column: 21, scope: !98)
!105 = !DILocation(line: 41, column: 56, scope: !98)
!106 = !DILocation(line: 41, column: 60, scope: !98)
!107 = !DILocation(line: 42, column: 29, scope: !98)
!108 = !DILocation(line: 42, column: 40, scope: !98)
!109 = !DILocation(line: 42, column: 33, scope: !98)
!110 = !DILocation(line: 42, column: 45, scope: !98)
!111 = !DILocation(line: 42, column: 56, scope: !98)
!112 = !DILocation(line: 42, column: 49, scope: !98)
!113 = !DILocation(line: 42, column: 17, scope: !98)
!114 = !DILocation(line: 41, column: 9, scope: !98)
!115 = !DILocation(line: 44, column: 9, scope: !98)
