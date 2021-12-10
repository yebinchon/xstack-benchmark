; ModuleID = 'josephus-problem.ll'
source_filename = "josephus-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"n = %llu, k = %llu, final survivor: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"n = %llu, k = %llu, three survivors:\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c" %llu\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @jos(i32 %n, i32 %k, i32 %m) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %k, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %m, metadata !14, metadata !DIExpression()), !dbg !12
  %add = add nsw i32 %m, 1, !dbg !15
  call void @llvm.dbg.value(metadata i32 %add, metadata !17, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %m.addr.0 = phi i32 [ %m, %entry ], [ %rem, %for.inc ]
  %a.0 = phi i32 [ %add, %entry ], [ %inc, %for.inc ], !dbg !19
  call void @llvm.dbg.value(metadata i32 %a.0, metadata !17, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %m.addr.0, metadata !14, metadata !DIExpression()), !dbg !12
  %cmp = icmp sle i32 %a.0, %n, !dbg !20
  br i1 %cmp, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %add1 = add nsw i32 %m.addr.0, %k, !dbg !23
  %rem = srem i32 %add1, %a.0, !dbg !24
  call void @llvm.dbg.value(metadata i32 %rem, metadata !14, metadata !DIExpression()), !dbg !12
  br label %for.inc, !dbg !25

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %a.0, 1, !dbg !26
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !27, !llvm.loop !28

for.end:                                          ; preds = %for.cond
  ret i32 %m.addr.0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @jos_large(i64 %n, i64 %k, i64 %m) #0 !dbg !31 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i64 %k, metadata !38, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i64 %m, metadata !39, metadata !DIExpression()), !dbg !37
  %cmp = icmp ule i64 %k, 1, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %sub = sub i64 %n, %m, !dbg !43
  %sub1 = sub i64 %sub, 1, !dbg !44
  br label %return, !dbg !45

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i64 %m, metadata !46, metadata !DIExpression()), !dbg !37
  br label %while.cond, !dbg !47

while.cond:                                       ; preds = %if.end12, %if.end
  %m.addr.0 = phi i64 [ %m, %if.end ], [ %rem, %if.end12 ]
  %a.0 = phi i64 [ %m, %if.end ], [ %add14, %if.end12 ], !dbg !37
  call void @llvm.dbg.value(metadata i64 %a.0, metadata !46, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i64 %m.addr.0, metadata !39, metadata !DIExpression()), !dbg !37
  %cmp2 = icmp ult i64 %a.0, %n, !dbg !48
  br i1 %cmp2, label %while.body, label %while.end, !dbg !47

while.body:                                       ; preds = %while.cond
  %sub3 = sub i64 %a.0, %m.addr.0, !dbg !49
  %add = add i64 %sub3, %k, !dbg !51
  %sub4 = sub i64 %add, 2, !dbg !52
  %sub5 = sub i64 %k, 1, !dbg !53
  %div = udiv i64 %sub4, %sub5, !dbg !54
  call void @llvm.dbg.value(metadata i64 %div, metadata !55, metadata !DIExpression()), !dbg !56
  %add6 = add i64 %a.0, %div, !dbg !57
  %cmp7 = icmp ugt i64 %add6, %n, !dbg !59
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !60

if.then8:                                         ; preds = %while.body
  %sub9 = sub i64 %n, %a.0, !dbg !61
  call void @llvm.dbg.value(metadata i64 %sub9, metadata !55, metadata !DIExpression()), !dbg !56
  br label %if.end12, !dbg !62

if.else:                                          ; preds = %while.body
  %tobool = icmp ne i64 %div, 0, !dbg !63
  br i1 %tobool, label %if.end11, label %if.then10, !dbg !65

if.then10:                                        ; preds = %if.else
  call void @llvm.dbg.value(metadata i64 1, metadata !55, metadata !DIExpression()), !dbg !56
  br label %if.end11, !dbg !66

if.end11:                                         ; preds = %if.then10, %if.else
  %q.0 = phi i64 [ %div, %if.else ], [ 1, %if.then10 ], !dbg !56
  call void @llvm.dbg.value(metadata i64 %q.0, metadata !55, metadata !DIExpression()), !dbg !56
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then8
  %q.1 = phi i64 [ %sub9, %if.then8 ], [ %q.0, %if.end11 ], !dbg !56
  call void @llvm.dbg.value(metadata i64 %q.1, metadata !55, metadata !DIExpression()), !dbg !56
  %mul = mul i64 %q.1, %k, !dbg !67
  %add13 = add i64 %m.addr.0, %mul, !dbg !68
  %add14 = add i64 %a.0, %q.1, !dbg !69
  call void @llvm.dbg.value(metadata i64 %add14, metadata !46, metadata !DIExpression()), !dbg !37
  %rem = urem i64 %add13, %add14, !dbg !70
  call void @llvm.dbg.value(metadata i64 %rem, metadata !39, metadata !DIExpression()), !dbg !37
  br label %while.cond, !dbg !47, !llvm.loop !71

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !73

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i64 [ %sub1, %if.then ], [ %m.addr.0, %while.end ], !dbg !37
  ret i64 %retval.0, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !75 {
entry:
  call void @llvm.dbg.value(metadata i64 41, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 3, metadata !80, metadata !DIExpression()), !dbg !79
  %conv = trunc i64 41 to i32, !dbg !81
  %conv1 = trunc i64 3 to i32, !dbg !82
  %call = call i32 @jos(i32 %conv, i32 %conv1, i32 0), !dbg !83
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i64 0, i64 0), i64 41, i64 3, i32 %call), !dbg !84
  call void @llvm.dbg.value(metadata i64 -8570200862721897295, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 12031, metadata !80, metadata !DIExpression()), !dbg !79
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i64 0, i64 0), i64 -8570200862721897295, i64 12031), !dbg !85
  call void @llvm.dbg.value(metadata i64 3, metadata !86, metadata !DIExpression()), !dbg !79
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i64 [ 3, %entry ], [ %dec, %for.body ], !dbg !89
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !86, metadata !DIExpression()), !dbg !79
  %dec = add i64 %i.0, -1, !dbg !90
  call void @llvm.dbg.value(metadata i64 %dec, metadata !86, metadata !DIExpression()), !dbg !79
  %tobool = icmp ne i64 %i.0, 0, !dbg !92
  br i1 %tobool, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %call4 = call i64 @jos_large(i64 -8570200862721897295, i64 12031, i64 %dec), !dbg !93
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %call6 = call i32 @putchar(i32 10), !dbg !98
  ret i32 0, !dbg !99
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
!1 = !DIFile(filename: "josephus-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Josephus-problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "jos", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "k", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocalVariable(name: "m", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 6, column: 13, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!17 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 6, column: 7, scope: !16)
!19 = !DILocation(line: 0, scope: !16)
!20 = !DILocation(line: 6, column: 20, scope: !21)
!21 = distinct !DILexicalBlock(scope: !16, file: !1, line: 6, column: 2)
!22 = !DILocation(line: 6, column: 2, scope: !16)
!23 = !DILocation(line: 7, column: 10, scope: !21)
!24 = !DILocation(line: 7, column: 15, scope: !21)
!25 = !DILocation(line: 7, column: 3, scope: !21)
!26 = !DILocation(line: 6, column: 27, scope: !21)
!27 = !DILocation(line: 6, column: 2, scope: !21)
!28 = distinct !{!28, !22, !29}
!29 = !DILocation(line: 7, column: 17, scope: !16)
!30 = !DILocation(line: 8, column: 2, scope: !7)
!31 = distinct !DISubprogram(name: "jos_large", scope: !1, file: !1, line: 14, type: !32, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !34, !34}
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "xint", file: !1, line: 11, baseType: !35)
!35 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocalVariable(name: "n", arg: 1, scope: !31, file: !1, line: 14, type: !34)
!37 = !DILocation(line: 0, scope: !31)
!38 = !DILocalVariable(name: "k", arg: 2, scope: !31, file: !1, line: 14, type: !34)
!39 = !DILocalVariable(name: "m", arg: 3, scope: !31, file: !1, line: 14, type: !34)
!40 = !DILocation(line: 15, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !1, line: 15, column: 6)
!42 = !DILocation(line: 15, column: 6, scope: !31)
!43 = !DILocation(line: 15, column: 23, scope: !41)
!44 = !DILocation(line: 15, column: 27, scope: !41)
!45 = !DILocation(line: 15, column: 14, scope: !41)
!46 = !DILocalVariable(name: "a", scope: !31, file: !1, line: 17, type: !34)
!47 = !DILocation(line: 18, column: 2, scope: !31)
!48 = !DILocation(line: 18, column: 11, scope: !31)
!49 = !DILocation(line: 19, column: 15, scope: !50)
!50 = distinct !DILexicalBlock(scope: !31, file: !1, line: 18, column: 16)
!51 = !DILocation(line: 19, column: 19, scope: !50)
!52 = !DILocation(line: 19, column: 23, scope: !50)
!53 = !DILocation(line: 19, column: 33, scope: !50)
!54 = !DILocation(line: 19, column: 28, scope: !50)
!55 = !DILocalVariable(name: "q", scope: !50, file: !1, line: 19, type: !34)
!56 = !DILocation(line: 0, scope: !50)
!57 = !DILocation(line: 21, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 7)
!59 = !DILocation(line: 21, column: 13, scope: !58)
!60 = !DILocation(line: 21, column: 7, scope: !50)
!61 = !DILocation(line: 21, column: 24, scope: !58)
!62 = !DILocation(line: 21, column: 18, scope: !58)
!63 = !DILocation(line: 22, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 12)
!65 = !DILocation(line: 22, column: 12, scope: !58)
!66 = !DILocation(line: 22, column: 16, scope: !64)
!67 = !DILocation(line: 24, column: 14, scope: !50)
!68 = !DILocation(line: 24, column: 10, scope: !50)
!69 = !DILocation(line: 24, column: 24, scope: !50)
!70 = !DILocation(line: 24, column: 19, scope: !50)
!71 = distinct !{!71, !47, !72}
!72 = !DILocation(line: 25, column: 2, scope: !31)
!73 = !DILocation(line: 27, column: 2, scope: !31)
!74 = !DILocation(line: 28, column: 1, scope: !31)
!75 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 30, type: !76, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!10}
!78 = !DILocalVariable(name: "n", scope: !75, file: !1, line: 31, type: !34)
!79 = !DILocation(line: 0, scope: !75)
!80 = !DILocalVariable(name: "k", scope: !75, file: !1, line: 31, type: !34)
!81 = !DILocation(line: 35, column: 63, scope: !75)
!82 = !DILocation(line: 35, column: 66, scope: !75)
!83 = !DILocation(line: 35, column: 59, scope: !75)
!84 = !DILocation(line: 35, column: 2, scope: !75)
!85 = !DILocation(line: 39, column: 2, scope: !75)
!86 = !DILocalVariable(name: "i", scope: !75, file: !1, line: 31, type: !34)
!87 = !DILocation(line: 41, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !75, file: !1, line: 41, column: 2)
!89 = !DILocation(line: 0, scope: !88)
!90 = !DILocation(line: 41, column: 15, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 41, column: 2)
!92 = !DILocation(line: 41, column: 2, scope: !88)
!93 = !DILocation(line: 42, column: 19, scope: !91)
!94 = !DILocation(line: 42, column: 3, scope: !91)
!95 = !DILocation(line: 41, column: 2, scope: !91)
!96 = distinct !{!96, !92, !97}
!97 = !DILocation(line: 42, column: 37, scope: !88)
!98 = !DILocation(line: 43, column: 2, scope: !75)
!99 = !DILocation(line: 45, column: 2, scope: !75)
