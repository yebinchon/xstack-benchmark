; ModuleID = 'loops-nested.c'
source_filename = "loops-nested.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x [10 x i32]]* %a, metadata !11, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call i64 @time(i64* null) #4, !dbg !20
  %conv = trunc i64 %call to i32, !dbg !20
  call void @srand(i32 %conv) #4, !dbg !21
  store i32 0, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %i, align 4, !dbg !25
  %cmp = icmp slt i32 %0, 10, !dbg !27
  br i1 %cmp, label %for.body, label %for.end11, !dbg !28

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !29
  br label %for.cond2, !dbg !31

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !32
  %cmp3 = icmp slt i32 %1, 10, !dbg !34
  br i1 %cmp3, label %for.body5, label %for.end, !dbg !35

for.body5:                                        ; preds = %for.cond2
  %call6 = call i32 @rand() #4, !dbg !36
  %rem = srem i32 %call6, 20, !dbg !37
  %add = add nsw i32 %rem, 1, !dbg !38
  %2 = load i32, i32* %i, align 4, !dbg !39
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom, !dbg !40
  %3 = load i32, i32* %j, align 4, !dbg !41
  %idxprom7 = sext i32 %3 to i64, !dbg !40
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx, i64 0, i64 %idxprom7, !dbg !40
  store i32 %add, i32* %arrayidx8, align 4, !dbg !42
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body5
  %4 = load i32, i32* %j, align 4, !dbg !43
  %inc = add nsw i32 %4, 1, !dbg !43
  store i32 %inc, i32* %j, align 4, !dbg !43
  br label %for.cond2, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond2
  br label %for.inc9, !dbg !46

for.inc9:                                         ; preds = %for.end
  %5 = load i32, i32* %i, align 4, !dbg !47
  %inc10 = add nsw i32 %5, 1, !dbg !47
  store i32 %inc10, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end11:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond12, !dbg !53

for.cond12:                                       ; preds = %for.inc35, %for.end11
  %6 = load i32, i32* %i, align 4, !dbg !54
  %cmp13 = icmp slt i32 %6, 10, !dbg !56
  br i1 %cmp13, label %for.body15, label %for.end37, !dbg !57

for.body15:                                       ; preds = %for.cond12
  store i32 0, i32* %j, align 4, !dbg !58
  br label %for.cond16, !dbg !61

for.cond16:                                       ; preds = %for.inc31, %for.body15
  %7 = load i32, i32* %j, align 4, !dbg !62
  %cmp17 = icmp slt i32 %7, 10, !dbg !64
  br i1 %cmp17, label %for.body19, label %for.end33, !dbg !65

for.body19:                                       ; preds = %for.cond16
  %8 = load i32, i32* %i, align 4, !dbg !66
  %idxprom20 = sext i32 %8 to i64, !dbg !68
  %arrayidx21 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom20, !dbg !68
  %9 = load i32, i32* %j, align 4, !dbg !69
  %idxprom22 = sext i32 %9 to i64, !dbg !68
  %arrayidx23 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx21, i64 0, i64 %idxprom22, !dbg !68
  %10 = load i32, i32* %arrayidx23, align 4, !dbg !68
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %10), !dbg !70
  %11 = load i32, i32* %i, align 4, !dbg !71
  %idxprom25 = sext i32 %11 to i64, !dbg !73
  %arrayidx26 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom25, !dbg !73
  %12 = load i32, i32* %j, align 4, !dbg !74
  %idxprom27 = sext i32 %12 to i64, !dbg !73
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx26, i64 0, i64 %idxprom27, !dbg !73
  %13 = load i32, i32* %arrayidx28, align 4, !dbg !73
  %cmp29 = icmp eq i32 %13, 20, !dbg !75
  br i1 %cmp29, label %if.then, label %if.end, !dbg !76, !cf.info !77

if.then:                                          ; preds = %for.body19
  br label %Done, !dbg !78

if.end:                                           ; preds = %for.body19
  br label %for.inc31, !dbg !79

for.inc31:                                        ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !80
  %inc32 = add nsw i32 %14, 1, !dbg !80
  store i32 %inc32, i32* %j, align 4, !dbg !80
  br label %for.cond16, !dbg !81, !llvm.loop !82

for.end33:                                        ; preds = %for.cond16
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  br label %for.inc35, !dbg !85

for.inc35:                                        ; preds = %for.end33
  %15 = load i32, i32* %i, align 4, !dbg !86
  %inc36 = add nsw i32 %15, 1, !dbg !86
  store i32 %inc36, i32* %i, align 4, !dbg !86
  br label %for.cond12, !dbg !87, !llvm.loop !88

for.end37:                                        ; preds = %for.cond12
  br label %Done, !dbg !89

Done:                                             ; preds = %for.end37, %if.then
  call void @llvm.dbg.label(metadata !90), !dbg !91
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "loops-nested.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Loops-Nested")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 6, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !13)
!13 = !{!14, !14}
!14 = !DISubrange(count: 10)
!15 = !DILocation(line: 6, column: 9, scope: !7)
!16 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!17 = !DILocation(line: 6, column: 20, scope: !7)
!18 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 23, scope: !7)
!20 = !DILocation(line: 8, column: 11, scope: !7)
!21 = !DILocation(line: 8, column: 5, scope: !7)
!22 = !DILocation(line: 9, column: 12, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 5)
!24 = !DILocation(line: 9, column: 10, scope: !23)
!25 = !DILocation(line: 9, column: 17, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !1, line: 9, column: 5)
!27 = !DILocation(line: 9, column: 19, scope: !26)
!28 = !DILocation(line: 9, column: 5, scope: !23)
!29 = !DILocation(line: 10, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 10, column: 9)
!31 = !DILocation(line: 10, column: 14, scope: !30)
!32 = !DILocation(line: 10, column: 21, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !1, line: 10, column: 9)
!34 = !DILocation(line: 10, column: 23, scope: !33)
!35 = !DILocation(line: 10, column: 9, scope: !30)
!36 = !DILocation(line: 11, column: 23, scope: !33)
!37 = !DILocation(line: 11, column: 30, scope: !33)
!38 = !DILocation(line: 11, column: 35, scope: !33)
!39 = !DILocation(line: 11, column: 15, scope: !33)
!40 = !DILocation(line: 11, column: 13, scope: !33)
!41 = !DILocation(line: 11, column: 18, scope: !33)
!42 = !DILocation(line: 11, column: 21, scope: !33)
!43 = !DILocation(line: 10, column: 30, scope: !33)
!44 = !DILocation(line: 10, column: 9, scope: !33)
!45 = distinct !{!45, !35, !46}
!46 = !DILocation(line: 11, column: 37, scope: !30)
!47 = !DILocation(line: 9, column: 26, scope: !26)
!48 = !DILocation(line: 9, column: 5, scope: !26)
!49 = distinct !{!49, !28, !50}
!50 = !DILocation(line: 11, column: 37, scope: !23)
!51 = !DILocation(line: 13, column: 12, scope: !52)
!52 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 5)
!53 = !DILocation(line: 13, column: 10, scope: !52)
!54 = !DILocation(line: 13, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !1, line: 13, column: 5)
!56 = !DILocation(line: 13, column: 19, scope: !55)
!57 = !DILocation(line: 13, column: 5, scope: !52)
!58 = !DILocation(line: 14, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 14, column: 9)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 13, column: 30)
!61 = !DILocation(line: 14, column: 14, scope: !59)
!62 = !DILocation(line: 14, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 14, column: 9)
!64 = !DILocation(line: 14, column: 23, scope: !63)
!65 = !DILocation(line: 14, column: 9, scope: !59)
!66 = !DILocation(line: 15, column: 29, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 14, column: 34)
!68 = !DILocation(line: 15, column: 27, scope: !67)
!69 = !DILocation(line: 15, column: 32, scope: !67)
!70 = !DILocation(line: 15, column: 13, scope: !67)
!71 = !DILocation(line: 16, column: 19, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 16, column: 17)
!73 = !DILocation(line: 16, column: 17, scope: !72)
!74 = !DILocation(line: 16, column: 22, scope: !72)
!75 = !DILocation(line: 16, column: 25, scope: !72)
!76 = !DILocation(line: 16, column: 17, scope: !67)
!77 = !{!"if"}
!78 = !DILocation(line: 17, column: 17, scope: !72)
!79 = !DILocation(line: 18, column: 9, scope: !67)
!80 = !DILocation(line: 14, column: 30, scope: !63)
!81 = !DILocation(line: 14, column: 9, scope: !63)
!82 = distinct !{!82, !65, !83}
!83 = !DILocation(line: 18, column: 9, scope: !59)
!84 = !DILocation(line: 19, column: 9, scope: !60)
!85 = !DILocation(line: 20, column: 5, scope: !60)
!86 = !DILocation(line: 13, column: 26, scope: !55)
!87 = !DILocation(line: 13, column: 5, scope: !55)
!88 = distinct !{!88, !57, !89}
!89 = !DILocation(line: 20, column: 5, scope: !52)
!90 = !DILabel(scope: !7, name: "Done", file: !1, line: 21)
!91 = !DILocation(line: 21, column: 1, scope: !7)
!92 = !DILocation(line: 22, column: 5, scope: !7)
!93 = !DILocation(line: 23, column: 5, scope: !7)
