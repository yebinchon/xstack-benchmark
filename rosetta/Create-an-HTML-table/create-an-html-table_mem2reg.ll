; ModuleID = 'create-an-html-table.ll'
source_filename = "create-an-html-table.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [92 x i8] c"<table style=\22text-align:center; border: 1px solid\22><th></th><th>X</th><th>Y</th><th>Z</th>\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"<tr><th>%d</th><td>%d</td><td>%d</td><td>%d</td></tr>\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"</table>\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str, i64 0, i64 0)), !dbg !11
  call void @llvm.dbg.value(metadata i32 0, metadata !12, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !16
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !12, metadata !DIExpression()), !dbg !13
  %cmp = icmp slt i32 %i.0, 4, !dbg !17
  br i1 %cmp, label %for.body, label %for.end, !dbg !19

for.body:                                         ; preds = %for.cond
  %call1 = call i32 @rand() #4, !dbg !20
  %rem = srem i32 %call1, 10000, !dbg !22
  %call2 = call i32 @rand() #4, !dbg !23
  %rem3 = srem i32 %call2, 10000, !dbg !24
  %call4 = call i32 @rand() #4, !dbg !25
  %rem5 = srem i32 %call4, 10000, !dbg !26
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i64 0, i64 0), i32 %i.0, i32 %rem, i32 %rem3, i32 %rem5), !dbg !27
  br label %for.inc, !dbg !28

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !29
  call void @llvm.dbg.value(metadata i32 %inc, metadata !12, metadata !DIExpression()), !dbg !13
  br label %for.cond, !dbg !30, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)), !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-an-html-table.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-an-HTML-table")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 7, column: 2, scope: !7)
!12 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 9, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 2)
!16 = !DILocation(line: 0, scope: !15)
!17 = !DILocation(line: 9, column: 16, scope: !18)
!18 = distinct !DILexicalBlock(scope: !15, file: !1, line: 9, column: 2)
!19 = !DILocation(line: 9, column: 2, scope: !15)
!20 = !DILocation(line: 11, column: 4, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !1, line: 9, column: 26)
!22 = !DILocation(line: 11, column: 11, scope: !21)
!23 = !DILocation(line: 11, column: 20, scope: !21)
!24 = !DILocation(line: 11, column: 27, scope: !21)
!25 = !DILocation(line: 11, column: 36, scope: !21)
!26 = !DILocation(line: 11, column: 43, scope: !21)
!27 = !DILocation(line: 10, column: 3, scope: !21)
!28 = !DILocation(line: 12, column: 2, scope: !21)
!29 = !DILocation(line: 9, column: 22, scope: !18)
!30 = !DILocation(line: 9, column: 2, scope: !18)
!31 = distinct !{!31, !19, !32}
!32 = !DILocation(line: 12, column: 2, scope: !15)
!33 = !DILocation(line: 13, column: 2, scope: !7)
!34 = !DILocation(line: 15, column: 2, scope: !7)
