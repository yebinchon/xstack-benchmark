; ModuleID = 'almost-prime.ll'
source_filename = "almost-prime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"k = %d:\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @kprime(i32 %n, i32 %k) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %k, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !14, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 2, metadata !15, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !16

for.cond:                                         ; preds = %for.inc, %entry
  %p.0 = phi i32 [ 2, %entry ], [ %inc3, %for.inc ], !dbg !18
  %f.0 = phi i32 [ 0, %entry ], [ %f.1, %for.inc ], !dbg !19
  %n.addr.0 = phi i32 [ %n, %entry ], [ %n.addr.1, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %f.0, metadata !14, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !15, metadata !DIExpression()), !dbg !12
  %cmp = icmp slt i32 %f.0, %k, !dbg !20
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !22

land.rhs:                                         ; preds = %for.cond
  %mul = mul nsw i32 %p.0, %p.0, !dbg !23
  %cmp1 = icmp sle i32 %mul, %n.addr.0, !dbg !24
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ], !dbg !25
  br i1 %0, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %land.end
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %for.body
  %f.1 = phi i32 [ %f.0, %for.body ], [ %inc, %while.body ], !dbg !12
  %n.addr.1 = phi i32 [ %n.addr.0, %for.body ], [ %div, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.1, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %f.1, metadata !14, metadata !DIExpression()), !dbg !12
  %rem = srem i32 %n.addr.1, %p.0, !dbg !28
  %cmp2 = icmp eq i32 0, %rem, !dbg !29
  br i1 %cmp2, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %while.cond
  %div = sdiv i32 %n.addr.1, %p.0, !dbg !30
  call void @llvm.dbg.value(metadata i32 %div, metadata !11, metadata !DIExpression()), !dbg !12
  %inc = add nsw i32 %f.1, 1, !dbg !31
  call void @llvm.dbg.value(metadata i32 %inc, metadata !14, metadata !DIExpression()), !dbg !12
  br label %while.cond, !dbg !27, !llvm.loop !32

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !27

for.inc:                                          ; preds = %while.end
  %inc3 = add nsw i32 %p.0, 1, !dbg !33
  call void @llvm.dbg.value(metadata i32 %inc3, metadata !15, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %land.end
  %cmp4 = icmp sgt i32 %n.addr.0, 1, !dbg !37
  %conv = zext i1 %cmp4 to i32, !dbg !37
  %add = add nsw i32 %f.0, %conv, !dbg !38
  %cmp5 = icmp eq i32 %add, %k, !dbg !39
  %conv6 = zext i1 %cmp5 to i32, !dbg !39
  ret i32 %conv6, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !41 {
entry:
  call void @llvm.dbg.value(metadata i32 1, metadata !44, metadata !DIExpression()), !dbg !45
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc8, %entry
  %k.0 = phi i32 [ 1, %entry ], [ %inc9, %for.inc8 ], !dbg !48
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !44, metadata !DIExpression()), !dbg !45
  %cmp = icmp sle i32 %k.0, 5, !dbg !49
  br i1 %cmp, label %for.body, label %for.end10, !dbg !51

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %k.0), !dbg !52
  call void @llvm.dbg.value(metadata i32 2, metadata !54, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 0, metadata !55, metadata !DIExpression()), !dbg !45
  br label %for.cond1, !dbg !56

for.cond1:                                        ; preds = %for.inc, %for.body
  %c.0 = phi i32 [ 0, %for.body ], [ %c.1, %for.inc ], !dbg !58
  %i.0 = phi i32 [ 2, %for.body ], [ %inc6, %for.inc ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !54, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !55, metadata !DIExpression()), !dbg !45
  %cmp2 = icmp slt i32 %c.0, 10, !dbg !59
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !61

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @kprime(i32 %i.0, i32 %k.0), !dbg !62
  %tobool = icmp ne i32 %call4, 0, !dbg !62
  br i1 %tobool, label %if.then, label %if.end, !dbg !64

if.then:                                          ; preds = %for.body3
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %i.0), !dbg !65
  %inc = add nsw i32 %c.0, 1, !dbg !67
  call void @llvm.dbg.value(metadata i32 %inc, metadata !55, metadata !DIExpression()), !dbg !45
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %for.body3
  %c.1 = phi i32 [ %inc, %if.then ], [ %c.0, %for.body3 ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %c.1, metadata !55, metadata !DIExpression()), !dbg !45
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %if.end
  %inc6 = add nsw i32 %i.0, 1, !dbg !70
  call void @llvm.dbg.value(metadata i32 %inc6, metadata !54, metadata !DIExpression()), !dbg !45
  br label %for.cond1, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 @putchar(i32 10), !dbg !74
  br label %for.inc8, !dbg !75

for.inc8:                                         ; preds = %for.end
  %inc9 = add nsw i32 %k.0, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !44, metadata !DIExpression()), !dbg !45
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end10:                                        ; preds = %for.cond
  ret i32 0, !dbg !80
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "almost-prime.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Almost-prime")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "kprime", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "k", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 6, column: 7, scope: !17)
!17 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!18 = !DILocation(line: 0, scope: !17)
!19 = !DILocation(line: 5, column: 9, scope: !7)
!20 = !DILocation(line: 6, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !17, file: !1, line: 6, column: 2)
!22 = !DILocation(line: 6, column: 20, scope: !21)
!23 = !DILocation(line: 6, column: 24, scope: !21)
!24 = !DILocation(line: 6, column: 27, scope: !21)
!25 = !DILocation(line: 0, scope: !21)
!26 = !DILocation(line: 6, column: 2, scope: !17)
!27 = !DILocation(line: 7, column: 3, scope: !21)
!28 = !DILocation(line: 7, column: 17, scope: !21)
!29 = !DILocation(line: 7, column: 12, scope: !21)
!30 = !DILocation(line: 8, column: 6, scope: !21)
!31 = !DILocation(line: 8, column: 13, scope: !21)
!32 = distinct !{!32, !27, !31}
!33 = !DILocation(line: 6, column: 34, scope: !21)
!34 = !DILocation(line: 6, column: 2, scope: !21)
!35 = distinct !{!35, !26, !36}
!36 = !DILocation(line: 8, column: 13, scope: !17)
!37 = !DILocation(line: 10, column: 16, scope: !7)
!38 = !DILocation(line: 10, column: 11, scope: !7)
!39 = !DILocation(line: 10, column: 21, scope: !7)
!40 = !DILocation(line: 10, column: 2, scope: !7)
!41 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !42, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!10}
!44 = !DILocalVariable(name: "k", scope: !41, file: !1, line: 15, type: !10)
!45 = !DILocation(line: 0, scope: !41)
!46 = !DILocation(line: 17, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 17, column: 2)
!48 = !DILocation(line: 0, scope: !47)
!49 = !DILocation(line: 17, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 17, column: 2)
!51 = !DILocation(line: 17, column: 2, scope: !47)
!52 = !DILocation(line: 18, column: 3, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 17, column: 27)
!54 = !DILocalVariable(name: "i", scope: !41, file: !1, line: 15, type: !10)
!55 = !DILocalVariable(name: "c", scope: !41, file: !1, line: 15, type: !10)
!56 = !DILocation(line: 20, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 20, column: 3)
!58 = !DILocation(line: 0, scope: !57)
!59 = !DILocation(line: 20, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !1, line: 20, column: 3)
!61 = !DILocation(line: 20, column: 3, scope: !57)
!62 = !DILocation(line: 21, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 21, column: 8)
!64 = !DILocation(line: 21, column: 8, scope: !60)
!65 = !DILocation(line: 22, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 21, column: 22)
!67 = !DILocation(line: 23, column: 6, scope: !66)
!68 = !DILocation(line: 24, column: 4, scope: !66)
!69 = !DILocation(line: 21, column: 19, scope: !63)
!70 = !DILocation(line: 20, column: 31, scope: !60)
!71 = !DILocation(line: 20, column: 3, scope: !60)
!72 = distinct !{!72, !61, !73}
!73 = !DILocation(line: 24, column: 4, scope: !57)
!74 = !DILocation(line: 26, column: 3, scope: !53)
!75 = !DILocation(line: 27, column: 2, scope: !53)
!76 = !DILocation(line: 17, column: 23, scope: !50)
!77 = !DILocation(line: 17, column: 2, scope: !50)
!78 = distinct !{!78, !51, !79}
!79 = !DILocation(line: 27, column: 2, scope: !47)
!80 = !DILocation(line: 29, column: 2, scope: !41)
