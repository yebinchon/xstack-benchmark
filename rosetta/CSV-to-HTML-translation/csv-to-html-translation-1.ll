; ModuleID = 'csv-to-html-translation-1.bc'
source_filename = "csv-to-html-translation-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [296 x i8] c"Character,Speech\0AThe multitude,The messiah! Show us the messiah!\0ABrians mother,<angry>Now you listen here! He's not the messiah; he's a very naughty boy! Now go away!</angry>\0AThe multitude,Who are you?\0ABrians mother,I'm his mother; that's who!\0AThe multitude,Behold his mother! Behold his mother!\00", align 1
@input = dso_local global i8* getelementptr inbounds ([296 x i8], [296 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@.str.1 = private unnamed_addr constant [17 x i8] c"<table>\0A<tr><td>\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"</td></tr>\0A<tr><td>\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"</td><td>\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"&lt;\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"&gt;\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"&amp;\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"</td></tr>\0A</table>\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !13 {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %s, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !19
  %0 = load i8*, i8** @input, align 8, !dbg !20
  store i8* %0, i8** %s, align 8, !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 8, !dbg !24
  %2 = load i8, i8* %1, align 1, !dbg !26
  %tobool = icmp ne i8 %2, 0, !dbg !27
  br i1 %tobool, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s, align 8, !dbg !28
  %4 = load i8, i8* %3, align 1, !dbg !30
  %conv = sext i8 %4 to i32, !dbg !30
  switch i32 %conv, label %sw.default [
    i32 10, label %sw.bb
    i32 44, label %sw.bb2
    i32 60, label %sw.bb4
    i32 62, label %sw.bb6
    i32 38, label %sw.bb8
  ], !dbg !31

sw.bb:                                            ; preds = %for.body
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)), !dbg !32
  br label %sw.epilog, !dbg !34

sw.bb2:                                           ; preds = %for.body
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0)), !dbg !35
  br label %sw.epilog, !dbg !36

sw.bb4:                                           ; preds = %for.body
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !37
  br label %sw.epilog, !dbg !38

sw.bb6:                                           ; preds = %for.body
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0)), !dbg !39
  br label %sw.epilog, !dbg !40

sw.bb8:                                           ; preds = %for.body
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0)), !dbg !41
  br label %sw.epilog, !dbg !42

sw.default:                                       ; preds = %for.body
  %5 = load i8*, i8** %s, align 8, !dbg !43
  %6 = load i8, i8* %5, align 1, !dbg !44
  %conv10 = sext i8 %6 to i32, !dbg !44
  %call11 = call i32 @putchar(i32 %conv10), !dbg !45
  br label %sw.epilog, !dbg !46

sw.epilog:                                        ; preds = %sw.default, %sw.bb8, %sw.bb6, %sw.bb4, %sw.bb2, %sw.bb
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %sw.epilog
  %7 = load i8*, i8** %s, align 8, !dbg !48
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !48
  store i8* %incdec.ptr, i8** %s, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %call12 = call i32 @puts(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0)), !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

declare dso_local i32 @puts(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "input", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "csv-to-html-translation-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/CSV-to-HTML-translation")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!13 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !14, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "s", scope: !13, file: !3, line: 14, type: !6)
!18 = !DILocation(line: 14, column: 14, scope: !13)
!19 = !DILocation(line: 15, column: 2, scope: !13)
!20 = !DILocation(line: 16, column: 11, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !3, line: 16, column: 2)
!22 = !DILocation(line: 16, column: 9, scope: !21)
!23 = !DILocation(line: 16, column: 7, scope: !21)
!24 = !DILocation(line: 16, column: 19, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !3, line: 16, column: 2)
!26 = !DILocation(line: 16, column: 18, scope: !25)
!27 = !DILocation(line: 16, column: 2, scope: !21)
!28 = !DILocation(line: 17, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !3, line: 16, column: 27)
!30 = !DILocation(line: 17, column: 10, scope: !29)
!31 = !DILocation(line: 17, column: 3, scope: !29)
!32 = !DILocation(line: 18, column: 14, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !3, line: 17, column: 14)
!34 = !DILocation(line: 18, column: 46, scope: !33)
!35 = !DILocation(line: 19, column: 14, scope: !33)
!36 = !DILocation(line: 19, column: 35, scope: !33)
!37 = !DILocation(line: 20, column: 14, scope: !33)
!38 = !DILocation(line: 20, column: 30, scope: !33)
!39 = !DILocation(line: 21, column: 14, scope: !33)
!40 = !DILocation(line: 21, column: 30, scope: !33)
!41 = !DILocation(line: 22, column: 14, scope: !33)
!42 = !DILocation(line: 22, column: 31, scope: !33)
!43 = !DILocation(line: 23, column: 23, scope: !33)
!44 = !DILocation(line: 23, column: 22, scope: !33)
!45 = !DILocation(line: 23, column: 14, scope: !33)
!46 = !DILocation(line: 24, column: 3, scope: !33)
!47 = !DILocation(line: 25, column: 2, scope: !29)
!48 = !DILocation(line: 16, column: 23, scope: !25)
!49 = !DILocation(line: 16, column: 2, scope: !25)
!50 = distinct !{!50, !27, !51}
!51 = !DILocation(line: 25, column: 2, scope: !21)
!52 = !DILocation(line: 26, column: 2, scope: !13)
!53 = !DILocation(line: 28, column: 2, scope: !13)
