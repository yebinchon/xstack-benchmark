; ModuleID = 'hofstadter-q-sequence.c'
source_filename = "hofstadter-q-sequence.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"flips: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %flip = alloca i32, align 4
  %q = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %flip, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32** %q, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias i8* @malloc(i64 400000) #4, !dbg !19
  %0 = bitcast i8* %call to i32*, !dbg !20
  %add.ptr = getelementptr inbounds i32, i32* %0, i64 -1, !dbg !21
  store i32* %add.ptr, i32** %q, align 8, !dbg !18
  %1 = load i32*, i32** %q, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 2, !dbg !22
  store i32 1, i32* %arrayidx, align 4, !dbg !23
  %2 = load i32*, i32** %q, align 8, !dbg !24
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 1, !dbg !24
  store i32 1, i32* %arrayidx1, align 4, !dbg !25
  store i32 3, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !29
  %cmp = icmp sle i32 %3, 100000, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %q, align 8, !dbg !33
  %5 = load i32, i32* %i, align 4, !dbg !34
  %6 = load i32*, i32** %q, align 8, !dbg !35
  %7 = load i32, i32* %i, align 4, !dbg !36
  %sub = sub nsw i32 %7, 1, !dbg !37
  %idxprom = sext i32 %sub to i64, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !35
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !35
  %sub3 = sub nsw i32 %5, %8, !dbg !38
  %idxprom4 = sext i32 %sub3 to i64, !dbg !33
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %idxprom4, !dbg !33
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !33
  %10 = load i32*, i32** %q, align 8, !dbg !39
  %11 = load i32, i32* %i, align 4, !dbg !40
  %12 = load i32*, i32** %q, align 8, !dbg !41
  %13 = load i32, i32* %i, align 4, !dbg !42
  %sub6 = sub nsw i32 %13, 2, !dbg !43
  %idxprom7 = sext i32 %sub6 to i64, !dbg !41
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %idxprom7, !dbg !41
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !41
  %sub9 = sub nsw i32 %11, %14, !dbg !44
  %idxprom10 = sext i32 %sub9 to i64, !dbg !39
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !39
  %15 = load i32, i32* %arrayidx11, align 4, !dbg !39
  %add = add nsw i32 %9, %15, !dbg !45
  %16 = load i32*, i32** %q, align 8, !dbg !46
  %17 = load i32, i32* %i, align 4, !dbg !47
  %idxprom12 = sext i32 %17 to i64, !dbg !46
  %arrayidx13 = getelementptr inbounds i32, i32* %16, i64 %idxprom12, !dbg !46
  store i32 %add, i32* %arrayidx13, align 4, !dbg !48
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %18, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i, align 4, !dbg !53
  br label %for.cond14, !dbg !55

for.cond14:                                       ; preds = %for.inc21, %for.end
  %19 = load i32, i32* %i, align 4, !dbg !56
  %cmp15 = icmp sle i32 %19, 10, !dbg !58
  br i1 %cmp15, label %for.body16, label %for.end23, !dbg !59

for.body16:                                       ; preds = %for.cond14
  %20 = load i32*, i32** %q, align 8, !dbg !60
  %21 = load i32, i32* %i, align 4, !dbg !61
  %idxprom17 = sext i32 %21 to i64, !dbg !60
  %arrayidx18 = getelementptr inbounds i32, i32* %20, i64 %idxprom17, !dbg !60
  %22 = load i32, i32* %arrayidx18, align 4, !dbg !60
  %23 = load i32, i32* %i, align 4, !dbg !62
  %cmp19 = icmp eq i32 %23, 10, !dbg !63
  %24 = zext i1 %cmp19 to i64, !dbg !62
  %cond = select i1 %cmp19, i32 10, i32 32, !dbg !62
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %22, i32 %cond), !dbg !64
  br label %for.inc21, !dbg !64

for.inc21:                                        ; preds = %for.body16
  %25 = load i32, i32* %i, align 4, !dbg !65
  %inc22 = add nsw i32 %25, 1, !dbg !65
  store i32 %inc22, i32* %i, align 4, !dbg !65
  br label %for.cond14, !dbg !66, !llvm.loop !67

for.end23:                                        ; preds = %for.cond14
  %26 = load i32*, i32** %q, align 8, !dbg !69
  %arrayidx24 = getelementptr inbounds i32, i32* %26, i64 1000, !dbg !69
  %27 = load i32, i32* %arrayidx24, align 4, !dbg !69
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %27), !dbg !70
  store i32 0, i32* %flip, align 4, !dbg !71
  store i32 1, i32* %i, align 4, !dbg !73
  br label %for.cond26, !dbg !74

for.cond26:                                       ; preds = %for.inc36, %for.end23
  %28 = load i32, i32* %i, align 4, !dbg !75
  %cmp27 = icmp slt i32 %28, 100000, !dbg !77
  br i1 %cmp27, label %for.body28, label %for.end38, !dbg !78

for.body28:                                       ; preds = %for.cond26
  %29 = load i32*, i32** %q, align 8, !dbg !79
  %30 = load i32, i32* %i, align 4, !dbg !80
  %idxprom29 = sext i32 %30 to i64, !dbg !79
  %arrayidx30 = getelementptr inbounds i32, i32* %29, i64 %idxprom29, !dbg !79
  %31 = load i32, i32* %arrayidx30, align 4, !dbg !79
  %32 = load i32*, i32** %q, align 8, !dbg !81
  %33 = load i32, i32* %i, align 4, !dbg !82
  %add31 = add nsw i32 %33, 1, !dbg !83
  %idxprom32 = sext i32 %add31 to i64, !dbg !81
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 %idxprom32, !dbg !81
  %34 = load i32, i32* %arrayidx33, align 4, !dbg !81
  %cmp34 = icmp sgt i32 %31, %34, !dbg !84
  %conv = zext i1 %cmp34 to i32, !dbg !84
  %35 = load i32, i32* %flip, align 4, !dbg !85
  %add35 = add nsw i32 %35, %conv, !dbg !85
  store i32 %add35, i32* %flip, align 4, !dbg !85
  br label %for.inc36, !dbg !86

for.inc36:                                        ; preds = %for.body28
  %36 = load i32, i32* %i, align 4, !dbg !87
  %inc37 = add nsw i32 %36, 1, !dbg !87
  store i32 %inc37, i32* %i, align 4, !dbg !87
  br label %for.cond26, !dbg !88, !llvm.loop !89

for.end38:                                        ; preds = %for.cond26
  %37 = load i32, i32* %flip, align 4, !dbg !91
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %37), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "hofstadter-q-sequence.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hofstadter-Q-sequence")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!5}
!13 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 7, type: !5)
!14 = !DILocation(line: 7, column: 6, scope: !10)
!15 = !DILocalVariable(name: "flip", scope: !10, file: !1, line: 7, type: !5)
!16 = !DILocation(line: 7, column: 9, scope: !10)
!17 = !DILocalVariable(name: "q", scope: !10, file: !1, line: 7, type: !4)
!18 = !DILocation(line: 7, column: 16, scope: !10)
!19 = !DILocation(line: 7, column: 26, scope: !10)
!20 = !DILocation(line: 7, column: 20, scope: !10)
!21 = !DILocation(line: 7, column: 50, scope: !10)
!22 = !DILocation(line: 9, column: 9, scope: !10)
!23 = !DILocation(line: 9, column: 14, scope: !10)
!24 = !DILocation(line: 9, column: 2, scope: !10)
!25 = !DILocation(line: 9, column: 7, scope: !10)
!26 = !DILocation(line: 11, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !10, file: !1, line: 11, column: 2)
!28 = !DILocation(line: 11, column: 7, scope: !27)
!29 = !DILocation(line: 11, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 11, column: 2)
!31 = !DILocation(line: 11, column: 16, scope: !30)
!32 = !DILocation(line: 11, column: 2, scope: !27)
!33 = !DILocation(line: 12, column: 10, scope: !30)
!34 = !DILocation(line: 12, column: 12, scope: !30)
!35 = !DILocation(line: 12, column: 16, scope: !30)
!36 = !DILocation(line: 12, column: 18, scope: !30)
!37 = !DILocation(line: 12, column: 20, scope: !30)
!38 = !DILocation(line: 12, column: 14, scope: !30)
!39 = !DILocation(line: 12, column: 28, scope: !30)
!40 = !DILocation(line: 12, column: 30, scope: !30)
!41 = !DILocation(line: 12, column: 34, scope: !30)
!42 = !DILocation(line: 12, column: 36, scope: !30)
!43 = !DILocation(line: 12, column: 38, scope: !30)
!44 = !DILocation(line: 12, column: 32, scope: !30)
!45 = !DILocation(line: 12, column: 26, scope: !30)
!46 = !DILocation(line: 12, column: 3, scope: !30)
!47 = !DILocation(line: 12, column: 5, scope: !30)
!48 = !DILocation(line: 12, column: 8, scope: !30)
!49 = !DILocation(line: 11, column: 23, scope: !30)
!50 = !DILocation(line: 11, column: 2, scope: !30)
!51 = distinct !{!51, !32, !52}
!52 = !DILocation(line: 12, column: 42, scope: !27)
!53 = !DILocation(line: 14, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !10, file: !1, line: 14, column: 2)
!55 = !DILocation(line: 14, column: 7, scope: !54)
!56 = !DILocation(line: 14, column: 14, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 14, column: 2)
!58 = !DILocation(line: 14, column: 16, scope: !57)
!59 = !DILocation(line: 14, column: 2, scope: !54)
!60 = !DILocation(line: 15, column: 18, scope: !57)
!61 = !DILocation(line: 15, column: 20, scope: !57)
!62 = !DILocation(line: 15, column: 24, scope: !57)
!63 = !DILocation(line: 15, column: 26, scope: !57)
!64 = !DILocation(line: 15, column: 3, scope: !57)
!65 = !DILocation(line: 14, column: 24, scope: !57)
!66 = !DILocation(line: 14, column: 2, scope: !57)
!67 = distinct !{!67, !59, !68}
!68 = !DILocation(line: 15, column: 44, scope: !54)
!69 = !DILocation(line: 17, column: 17, scope: !10)
!70 = !DILocation(line: 17, column: 2, scope: !10)
!71 = !DILocation(line: 19, column: 12, scope: !72)
!72 = distinct !DILexicalBlock(scope: !10, file: !1, line: 19, column: 2)
!73 = !DILocation(line: 19, column: 19, scope: !72)
!74 = !DILocation(line: 19, column: 7, scope: !72)
!75 = !DILocation(line: 19, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 19, column: 2)
!77 = !DILocation(line: 19, column: 26, scope: !76)
!78 = !DILocation(line: 19, column: 2, scope: !72)
!79 = !DILocation(line: 20, column: 11, scope: !76)
!80 = !DILocation(line: 20, column: 13, scope: !76)
!81 = !DILocation(line: 20, column: 18, scope: !76)
!82 = !DILocation(line: 20, column: 20, scope: !76)
!83 = !DILocation(line: 20, column: 22, scope: !76)
!84 = !DILocation(line: 20, column: 16, scope: !76)
!85 = !DILocation(line: 20, column: 8, scope: !76)
!86 = !DILocation(line: 20, column: 3, scope: !76)
!87 = !DILocation(line: 19, column: 32, scope: !76)
!88 = !DILocation(line: 19, column: 2, scope: !76)
!89 = distinct !{!89, !78, !90}
!90 = !DILocation(line: 20, column: 25, scope: !72)
!91 = !DILocation(line: 22, column: 24, scope: !10)
!92 = !DILocation(line: 22, column: 2, scope: !10)
!93 = !DILocation(line: 23, column: 2, scope: !10)
