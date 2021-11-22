; ModuleID = 'guess-the-number-with-feedback--player--1.c'
source_filename = "guess-the-number-with-feedback--player--1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.bounds = private unnamed_addr constant [2 x i32] [i32 1, i32 100], align 4
@__const.main.input = private unnamed_addr constant [2 x i8] c"  ", align 1
@.str = private unnamed_addr constant [36 x i8] c"Choose a number between %d and %d.\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"\0AAwwwright\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Is the number %d? (Y/H/L) \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%1s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %bounds = alloca [2 x i32], align 4
  %input = alloca [2 x i8], align 1
  %choice = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %bounds, metadata !11, metadata !DIExpression()), !dbg !15
  %0 = bitcast [2 x i32]* %bounds to i8*, !dbg !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([2 x i32]* @__const.main.bounds to i8*), i64 8, i1 false), !dbg !15
  call void @llvm.dbg.declare(metadata [2 x i8]* %input, metadata !16, metadata !DIExpression()), !dbg !19
  %1 = bitcast [2 x i8]* %input to i8*, !dbg !19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([2 x i8], [2 x i8]* @__const.main.input, i32 0, i32 0), i64 2, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %choice, metadata !20, metadata !DIExpression()), !dbg !21
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 0, !dbg !22
  %2 = load i32, i32* %arrayidx, align 4, !dbg !22
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 1, !dbg !23
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !23
  %add = add nsw i32 %2, %3, !dbg !24
  %div = sdiv i32 %add, 2, !dbg !25
  store i32 %div, i32* %choice, align 4, !dbg !21
  %arrayidx2 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 0, !dbg !26
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !26
  %arrayidx3 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 1, !dbg !27
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !27
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i64 0, i64 0), i32 %4, i32 %5), !dbg !28
  br label %do.body, !dbg !29

do.body:                                          ; preds = %do.cond, %entry
  %arrayidx4 = getelementptr inbounds [2 x i8], [2 x i8]* %input, i64 0, i64 0, !dbg !30
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !30
  %conv = sext i8 %6 to i32, !dbg !30
  switch i32 %conv, label %sw.epilog [
    i32 72, label %sw.bb
    i32 76, label %sw.bb6
    i32 89, label %sw.bb8
  ], !dbg !32

sw.bb:                                            ; preds = %do.body
  %7 = load i32, i32* %choice, align 4, !dbg !33
  %arrayidx5 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 1, !dbg !35
  store i32 %7, i32* %arrayidx5, align 4, !dbg !36
  br label %sw.epilog, !dbg !37

sw.bb6:                                           ; preds = %do.body
  %8 = load i32, i32* %choice, align 4, !dbg !38
  %arrayidx7 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 0, !dbg !39
  store i32 %8, i32* %arrayidx7, align 4, !dbg !40
  br label %sw.epilog, !dbg !41

sw.bb8:                                           ; preds = %do.body
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !42
  store i32 0, i32* %retval, align 4, !dbg !43
  br label %return, !dbg !43

sw.epilog:                                        ; preds = %do.body, %sw.bb6, %sw.bb
  %arrayidx10 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 0, !dbg !44
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !44
  %arrayidx11 = getelementptr inbounds [2 x i32], [2 x i32]* %bounds, i64 0, i64 1, !dbg !45
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !45
  %add12 = add nsw i32 %9, %10, !dbg !46
  %div13 = sdiv i32 %add12, 2, !dbg !47
  store i32 %div13, i32* %choice, align 4, !dbg !48
  %11 = load i32, i32* %choice, align 4, !dbg !49
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i32 %11), !dbg !50
  br label %do.cond, !dbg !51

do.cond:                                          ; preds = %sw.epilog
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %input, i64 0, i64 0, !dbg !52
  %call15 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay), !dbg !53
  %cmp = icmp eq i32 %call15, 1, !dbg !54
  br i1 %cmp, label %do.body, label %do.end, !dbg !51, !llvm.loop !55

do.end:                                           ; preds = %do.cond
  store i32 0, i32* %retval, align 4, !dbg !57
  br label %return, !dbg !57

return:                                           ; preds = %do.end, %sw.bb8
  %12 = load i32, i32* %retval, align 4, !dbg !58
  ret i32 %12, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "guess-the-number-with-feedback--player--1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Guess-the-number-With-feedback--player-")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "bounds", scope: !7, file: !1, line: 4, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 64, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 2)
!15 = !DILocation(line: 4, column: 7, scope: !7)
!16 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 5, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 16, elements: !13)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 5, column: 8, scope: !7)
!20 = !DILocalVariable(name: "choice", scope: !7, file: !1, line: 7, type: !10)
!21 = !DILocation(line: 7, column: 7, scope: !7)
!22 = !DILocation(line: 7, column: 17, scope: !7)
!23 = !DILocation(line: 7, column: 31, scope: !7)
!24 = !DILocation(line: 7, column: 29, scope: !7)
!25 = !DILocation(line: 7, column: 44, scope: !7)
!26 = !DILocation(line: 10, column: 51, scope: !7)
!27 = !DILocation(line: 10, column: 64, scope: !7)
!28 = !DILocation(line: 10, column: 3, scope: !7)
!29 = !DILocation(line: 12, column: 3, scope: !7)
!30 = !DILocation(line: 13, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 5)
!32 = !DILocation(line: 13, column: 5, scope: !31)
!33 = !DILocation(line: 15, column: 23, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 25)
!35 = !DILocation(line: 15, column: 9, scope: !34)
!36 = !DILocation(line: 15, column: 21, scope: !34)
!37 = !DILocation(line: 16, column: 9, scope: !34)
!38 = !DILocation(line: 18, column: 23, scope: !34)
!39 = !DILocation(line: 18, column: 9, scope: !34)
!40 = !DILocation(line: 18, column: 21, scope: !34)
!41 = !DILocation(line: 19, column: 9, scope: !34)
!42 = !DILocation(line: 21, column: 9, scope: !34)
!43 = !DILocation(line: 22, column: 9, scope: !34)
!44 = !DILocation(line: 24, column: 15, scope: !31)
!45 = !DILocation(line: 24, column: 29, scope: !31)
!46 = !DILocation(line: 24, column: 27, scope: !31)
!47 = !DILocation(line: 24, column: 42, scope: !31)
!48 = !DILocation(line: 24, column: 12, scope: !31)
!49 = !DILocation(line: 26, column: 43, scope: !31)
!50 = !DILocation(line: 26, column: 5, scope: !31)
!51 = !DILocation(line: 27, column: 3, scope: !31)
!52 = !DILocation(line: 27, column: 25, scope: !7)
!53 = !DILocation(line: 27, column: 11, scope: !7)
!54 = !DILocation(line: 27, column: 33, scope: !7)
!55 = distinct !{!55, !29, !56}
!56 = !DILocation(line: 27, column: 38, scope: !7)
!57 = !DILocation(line: 29, column: 3, scope: !7)
!58 = !DILocation(line: 30, column: 1, scope: !7)
