; ModuleID = 'ackermann-function-1.ll'
source_filename = "ackermann-function-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"A(%d, %d) = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ackermann(i32 %m, i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %n, metadata !13, metadata !DIExpression()), !dbg !12
  %tobool = icmp ne i32 %m, 0, !dbg !14
  br i1 %tobool, label %if.end, label %if.then, !dbg !16

if.then:                                          ; preds = %entry
  %add = add nsw i32 %n, 1, !dbg !17
  br label %return, !dbg !18

if.end:                                           ; preds = %entry
  %tobool1 = icmp ne i32 %n, 0, !dbg !19
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !21

if.then2:                                         ; preds = %if.end
  %sub = sub nsw i32 %m, 1, !dbg !22
  %call = call i32 @ackermann(i32 %sub, i32 1), !dbg !23
  br label %return, !dbg !24

if.end3:                                          ; preds = %if.end
  %sub4 = sub nsw i32 %m, 1, !dbg !25
  %sub5 = sub nsw i32 %n, 1, !dbg !26
  %call6 = call i32 @ackermann(i32 %m, i32 %sub5), !dbg !27
  %call7 = call i32 @ackermann(i32 %sub4, i32 %call6), !dbg !28
  br label %return, !dbg !29

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %retval.0 = phi i32 [ %call7, %if.end3 ], [ %call, %if.then2 ], [ %add, %if.then ], !dbg !12
  ret i32 %retval.0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc5, %entry
  %m.0 = phi i32 [ 0, %entry ], [ %inc6, %for.inc5 ], !dbg !38
  call void @llvm.dbg.value(metadata i32 %m.0, metadata !34, metadata !DIExpression()), !dbg !35
  %cmp = icmp sle i32 %m.0, 4, !dbg !39
  br i1 %cmp, label %for.body, label %for.end7, !dbg !41

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !42, metadata !DIExpression()), !dbg !35
  br label %for.cond1, !dbg !43

for.cond1:                                        ; preds = %for.inc, %for.body
  %n.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !45
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !42, metadata !DIExpression()), !dbg !35
  %sub = sub nsw i32 6, %m.0, !dbg !46
  %cmp2 = icmp slt i32 %n.0, %sub, !dbg !48
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !49

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @ackermann(i32 %m.0, i32 %n.0), !dbg !50
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 %m.0, i32 %n.0, i32 %call), !dbg !51
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %n.0, 1, !dbg !52
  call void @llvm.dbg.value(metadata i32 %inc, metadata !42, metadata !DIExpression()), !dbg !35
  br label %for.cond1, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond1
  br label %for.inc5, !dbg !55

for.inc5:                                         ; preds = %for.end
  %inc6 = add nsw i32 %m.0, 1, !dbg !56
  call void @llvm.dbg.value(metadata i32 %inc6, metadata !34, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end7:                                         ; preds = %for.cond
  ret i32 0, !dbg !60
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
!1 = !DIFile(filename: "ackermann-function-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Ackermann-function-1")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "ackermann", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 5, column: 14, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 13)
!16 = !DILocation(line: 5, column: 13, scope: !7)
!17 = !DILocation(line: 5, column: 26, scope: !15)
!18 = !DILocation(line: 5, column: 17, scope: !15)
!19 = !DILocation(line: 6, column: 14, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 13)
!21 = !DILocation(line: 6, column: 13, scope: !7)
!22 = !DILocation(line: 6, column: 36, scope: !20)
!23 = !DILocation(line: 6, column: 24, scope: !20)
!24 = !DILocation(line: 6, column: 17, scope: !20)
!25 = !DILocation(line: 7, column: 28, scope: !7)
!26 = !DILocation(line: 7, column: 48, scope: !7)
!27 = !DILocation(line: 7, column: 33, scope: !7)
!28 = !DILocation(line: 7, column: 16, scope: !7)
!29 = !DILocation(line: 7, column: 9, scope: !7)
!30 = !DILocation(line: 8, column: 1, scope: !7)
!31 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !32, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!10}
!34 = !DILocalVariable(name: "m", scope: !31, file: !1, line: 12, type: !10)
!35 = !DILocation(line: 0, scope: !31)
!36 = !DILocation(line: 13, column: 14, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 9)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 13, column: 23, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 13, column: 9)
!41 = !DILocation(line: 13, column: 9, scope: !37)
!42 = !DILocalVariable(name: "n", scope: !31, file: !1, line: 12, type: !10)
!43 = !DILocation(line: 14, column: 22, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 14, column: 17)
!45 = !DILocation(line: 0, scope: !44)
!46 = !DILocation(line: 14, column: 35, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 14, column: 17)
!48 = !DILocation(line: 14, column: 31, scope: !47)
!49 = !DILocation(line: 14, column: 17, scope: !44)
!50 = !DILocation(line: 15, column: 58, scope: !47)
!51 = !DILocation(line: 15, column: 25, scope: !47)
!52 = !DILocation(line: 14, column: 41, scope: !47)
!53 = !DILocation(line: 14, column: 17, scope: !47)
!54 = distinct !{!54, !49, !55}
!55 = !DILocation(line: 15, column: 73, scope: !44)
!56 = !DILocation(line: 13, column: 30, scope: !40)
!57 = !DILocation(line: 13, column: 9, scope: !40)
!58 = distinct !{!58, !41, !59}
!59 = !DILocation(line: 15, column: 73, scope: !37)
!60 = !DILocation(line: 17, column: 9, scope: !31)
