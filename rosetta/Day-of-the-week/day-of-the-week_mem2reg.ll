; ModuleID = 'day-of-the-week.ll'
source_filename = "day-of-the-week.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%04d-12-25\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @wday(i32 %year, i32 %month, i32 %day) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %year, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %month, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %day, metadata !14, metadata !DIExpression()), !dbg !12
  %sub = sub nsw i32 14, %month, !dbg !15
  %div = sdiv i32 %sub, 12, !dbg !16
  call void @llvm.dbg.value(metadata i32 %div, metadata !17, metadata !DIExpression()), !dbg !12
  %mul = mul nsw i32 12, %div, !dbg !18
  %add = add nsw i32 %month, %mul, !dbg !19
  %sub1 = sub nsw i32 %add, 2, !dbg !20
  call void @llvm.dbg.value(metadata i32 %sub1, metadata !21, metadata !DIExpression()), !dbg !12
  %sub2 = sub nsw i32 %year, %div, !dbg !22
  call void @llvm.dbg.value(metadata i32 %sub2, metadata !23, metadata !DIExpression()), !dbg !12
  %mul3 = mul nsw i32 13, %sub1, !dbg !24
  %sub4 = sub nsw i32 %mul3, 1, !dbg !25
  %div5 = sdiv i32 %sub4, 5, !dbg !26
  %add6 = add nsw i32 %day, %div5, !dbg !27
  %add7 = add nsw i32 %add6, %sub2, !dbg !28
  %div8 = sdiv i32 %sub2, 4, !dbg !29
  %add9 = add nsw i32 %add7, %div8, !dbg !30
  %div10 = sdiv i32 %sub2, 100, !dbg !31
  %sub11 = sub nsw i32 %add9, %div10, !dbg !32
  %div12 = sdiv i32 %sub2, 400, !dbg !33
  %add13 = add nsw i32 %sub11, %div12, !dbg !34
  %rem = srem i32 %add13, 7, !dbg !35
  ret i32 %rem, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !37 {
entry:
  call void @llvm.dbg.value(metadata i32 2008, metadata !40, metadata !DIExpression()), !dbg !41
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %y.0 = phi i32 [ 2008, %entry ], [ %inc, %for.inc ], !dbg !44
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !40, metadata !DIExpression()), !dbg !41
  %cmp = icmp sle i32 %y.0, 2121, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %call = call i32 @wday(i32 %y.0, i32 12, i32 25), !dbg !48
  %cmp1 = icmp eq i32 %call, 0, !dbg !51
  br i1 %cmp1, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %for.body
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %y.0), !dbg !53
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %y.0, 1, !dbg !55
  call void @llvm.dbg.value(metadata i32 %inc, metadata !40, metadata !DIExpression()), !dbg !41
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !59
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "day-of-the-week.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Day-of-the-week")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "wday", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "year", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "month", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocalVariable(name: "day", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 8, column: 19, scope: !7)
!16 = !DILocation(line: 8, column: 28, scope: !7)
!17 = !DILocalVariable(name: "adjustment", scope: !7, file: !1, line: 6, type: !10)
!18 = !DILocation(line: 9, column: 18, scope: !7)
!19 = !DILocation(line: 9, column: 13, scope: !7)
!20 = !DILocation(line: 9, column: 31, scope: !7)
!21 = !DILocalVariable(name: "mm", scope: !7, file: !1, line: 6, type: !10)
!22 = !DILocation(line: 10, column: 12, scope: !7)
!23 = !DILocalVariable(name: "yy", scope: !7, file: !1, line: 6, type: !10)
!24 = !DILocation(line: 11, column: 20, scope: !7)
!25 = !DILocation(line: 11, column: 25, scope: !7)
!26 = !DILocation(line: 11, column: 30, scope: !7)
!27 = !DILocation(line: 11, column: 14, scope: !7)
!28 = !DILocation(line: 11, column: 34, scope: !7)
!29 = !DILocation(line: 12, column: 11, scope: !7)
!30 = !DILocation(line: 12, column: 6, scope: !7)
!31 = !DILocation(line: 12, column: 20, scope: !7)
!32 = !DILocation(line: 12, column: 15, scope: !7)
!33 = !DILocation(line: 12, column: 31, scope: !7)
!34 = !DILocation(line: 12, column: 26, scope: !7)
!35 = !DILocation(line: 12, column: 38, scope: !7)
!36 = !DILocation(line: 11, column: 2, scope: !7)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !38, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!10}
!40 = !DILocalVariable(name: "y", scope: !37, file: !1, line: 17, type: !10)
!41 = !DILocation(line: 0, scope: !37)
!42 = !DILocation(line: 19, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 19, column: 2)
!44 = !DILocation(line: 0, scope: !43)
!45 = !DILocation(line: 19, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 19, column: 2)
!47 = !DILocation(line: 19, column: 2, scope: !43)
!48 = !DILocation(line: 20, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 20, column: 7)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 19, column: 33)
!51 = !DILocation(line: 20, column: 23, scope: !49)
!52 = !DILocation(line: 20, column: 7, scope: !50)
!53 = !DILocation(line: 20, column: 29, scope: !49)
!54 = !DILocation(line: 21, column: 2, scope: !50)
!55 = !DILocation(line: 19, column: 29, scope: !46)
!56 = !DILocation(line: 19, column: 2, scope: !46)
!57 = distinct !{!57, !47, !58}
!58 = !DILocation(line: 21, column: 2, scope: !43)
!59 = !DILocation(line: 23, column: 2, scope: !37)
