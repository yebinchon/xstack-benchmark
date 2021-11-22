; ModuleID = 'happy-numbers-2.ll'
source_filename = "happy-numbers-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"The %dth happy number: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dsum(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ], !dbg !16
  %n.addr.0 = phi i32 [ %n, %entry ], [ %div, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !13, metadata !DIExpression()), !dbg !12
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !17
  br i1 %tobool, label %for.body, label %for.end, !dbg !17

for.body:                                         ; preds = %for.cond
  %rem = srem i32 %n.addr.0, 10, !dbg !18
  call void @llvm.dbg.value(metadata i32 %rem, metadata !20, metadata !DIExpression()), !dbg !12
  %mul = mul nsw i32 %rem, %rem, !dbg !21
  %add = add nsw i32 %sum.0, %mul, !dbg !22
  call void @llvm.dbg.value(metadata i32 %add, metadata !13, metadata !DIExpression()), !dbg !12
  br label %for.inc, !dbg !23

for.inc:                                          ; preds = %for.body
  %div = sdiv i32 %n.addr.0, 10, !dbg !24
  call void @llvm.dbg.value(metadata i32 %div, metadata !11, metadata !DIExpression()), !dbg !12
  br label %for.cond, !dbg !25, !llvm.loop !26

for.end:                                          ; preds = %for.cond
  ret i32 %sum.0, !dbg !28
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @happy(i32 %n) #0 !dbg !29 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !30, metadata !DIExpression()), !dbg !31
  br label %while.cond, !dbg !32

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %call, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !30, metadata !DIExpression()), !dbg !31
  %cmp = icmp sgt i32 %n.addr.0, 999, !dbg !33
  br i1 %cmp, label %while.body, label %while.end, !dbg !32

while.body:                                       ; preds = %while.cond
  %call = call i32 @dsum(i32 %n.addr.0), !dbg !34
  call void @llvm.dbg.value(metadata i32 %call, metadata !30, metadata !DIExpression()), !dbg !31
  br label %while.cond, !dbg !32, !llvm.loop !35

while.end:                                        ; preds = %while.cond
  %call1 = call i32 @dsum(i32 %n.addr.0), !dbg !37
  call void @llvm.dbg.value(metadata i32 %call1, metadata !38, metadata !DIExpression()), !dbg !31
  br label %while.cond2, !dbg !39

while.cond2:                                      ; preds = %while.body5, %while.end
  %nn.0 = phi i32 [ %call1, %while.end ], [ %call8, %while.body5 ], !dbg !31
  %n.addr.1 = phi i32 [ %n.addr.0, %while.end ], [ %call6, %while.body5 ]
  call void @llvm.dbg.value(metadata i32 %n.addr.1, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %nn.0, metadata !38, metadata !DIExpression()), !dbg !31
  %cmp3 = icmp ne i32 %nn.0, %n.addr.1, !dbg !40
  br i1 %cmp3, label %land.rhs, label %land.end, !dbg !41

land.rhs:                                         ; preds = %while.cond2
  %cmp4 = icmp ne i32 %nn.0, 1, !dbg !42
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond2
  %0 = phi i1 [ false, %while.cond2 ], [ %cmp4, %land.rhs ], !dbg !31
  br i1 %0, label %while.body5, label %while.end9, !dbg !39

while.body5:                                      ; preds = %land.end
  %call6 = call i32 @dsum(i32 %n.addr.1), !dbg !43
  call void @llvm.dbg.value(metadata i32 %call6, metadata !30, metadata !DIExpression()), !dbg !31
  %call7 = call i32 @dsum(i32 %nn.0), !dbg !44
  %call8 = call i32 @dsum(i32 %call7), !dbg !45
  call void @llvm.dbg.value(metadata i32 %call8, metadata !38, metadata !DIExpression()), !dbg !31
  br label %while.cond2, !dbg !39, !llvm.loop !46

while.end9:                                       ; preds = %land.end
  %cmp10 = icmp eq i32 %n.addr.1, 1, !dbg !48
  %conv = zext i1 %cmp10 to i32, !dbg !48
  ret i32 %conv, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !50 {
entry:
  call void @llvm.dbg.value(metadata i32 8, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 1, metadata !55, metadata !DIExpression()), !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !58
  %cnt.0 = phi i32 [ 8, %entry ], [ %cnt.1, %for.inc ], !dbg !54
  call void @llvm.dbg.value(metadata i32 %cnt.0, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !55, metadata !DIExpression()), !dbg !54
  %tobool = icmp ne i32 %cnt.0, 0, !dbg !59
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !61

lor.rhs:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %tobool1 = icmp ne i32 %call, 0, !dbg !63
  %lnot = xor i1 %tobool1, true, !dbg !63
  br label %lor.end, !dbg !61

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %0 = phi i1 [ true, %for.cond ], [ %lnot, %lor.rhs ]
  br i1 %0, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %lor.end
  %call2 = call i32 @happy(i32 %i.0), !dbg !65
  %tobool3 = icmp ne i32 %call2, 0, !dbg !65
  br i1 %tobool3, label %if.then, label %if.end, !dbg !67, !cf.info !68

if.then:                                          ; preds = %for.body
  %dec = add nsw i32 %cnt.0, -1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %dec, metadata !53, metadata !DIExpression()), !dbg !54
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %i.0), !dbg !70
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %for.body
  %cnt.1 = phi i32 [ %dec, %if.then ], [ %cnt.0, %for.body ], !dbg !54
  call void @llvm.dbg.value(metadata i32 %cnt.1, metadata !53, metadata !DIExpression()), !dbg !54
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !72
  call void @llvm.dbg.value(metadata i32 %inc, metadata !55, metadata !DIExpression()), !dbg !54
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %lor.end
  call void @llvm.dbg.value(metadata i32 1000000, metadata !53, metadata !DIExpression()), !dbg !54
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 1000000), !dbg !76
  call void @llvm.dbg.value(metadata i32 1, metadata !55, metadata !DIExpression()), !dbg !54
  br label %for.cond6, !dbg !77

for.cond6:                                        ; preds = %for.inc19, %for.end
  %i.1 = phi i32 [ 1, %for.end ], [ %inc20, %for.inc19 ], !dbg !79
  %cnt.2 = phi i32 [ 1000000, %for.end ], [ %cnt.3, %for.inc19 ], !dbg !54
  call void @llvm.dbg.value(metadata i32 %cnt.2, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !55, metadata !DIExpression()), !dbg !54
  %tobool7 = icmp ne i32 %cnt.2, 0, !dbg !80
  br i1 %tobool7, label %for.body8, label %for.end21, !dbg !80

for.body8:                                        ; preds = %for.cond6
  %call9 = call i32 @happy(i32 %i.1), !dbg !81
  %tobool10 = icmp ne i32 %call9, 0, !dbg !81
  br i1 %tobool10, label %if.then11, label %if.end18, !dbg !84, !cf.info !68

if.then11:                                        ; preds = %for.body8
  %dec12 = add nsw i32 %cnt.2, -1, !dbg !85
  call void @llvm.dbg.value(metadata i32 %dec12, metadata !53, metadata !DIExpression()), !dbg !54
  %tobool13 = icmp ne i32 %dec12, 0, !dbg !85
  br i1 %tobool13, label %lor.end17, label %lor.rhs14, !dbg !86

lor.rhs14:                                        ; preds = %if.then11
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %i.1), !dbg !87
  %tobool16 = icmp ne i32 %call15, 0, !dbg !86
  br label %lor.end17, !dbg !86

lor.end17:                                        ; preds = %lor.rhs14, %if.then11
  %1 = phi i1 [ true, %if.then11 ], [ %tobool16, %lor.rhs14 ]
  %lor.ext = zext i1 %1 to i32, !dbg !86
  br label %if.end18, !dbg !85

if.end18:                                         ; preds = %lor.end17, %for.body8
  %cnt.3 = phi i32 [ %dec12, %lor.end17 ], [ %cnt.2, %for.body8 ], !dbg !54
  call void @llvm.dbg.value(metadata i32 %cnt.3, metadata !53, metadata !DIExpression()), !dbg !54
  br label %for.inc19, !dbg !88

for.inc19:                                        ; preds = %if.end18
  %inc20 = add nsw i32 %i.1, 1, !dbg !89
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !55, metadata !DIExpression()), !dbg !54
  br label %for.cond6, !dbg !90, !llvm.loop !91

for.end21:                                        ; preds = %for.cond6
  ret i32 0, !dbg !93
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "happy-numbers-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Happy-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "dsum", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 6, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!16 = !DILocation(line: 0, scope: !15)
!17 = !DILocation(line: 6, column: 2, scope: !15)
!18 = !DILocation(line: 6, column: 34, scope: !19)
!19 = distinct !DILexicalBlock(scope: !15, file: !1, line: 6, column: 2)
!20 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 6, column: 49, scope: !19)
!22 = !DILocation(line: 6, column: 44, scope: !19)
!23 = !DILocation(line: 6, column: 28, scope: !19)
!24 = !DILocation(line: 6, column: 21, scope: !19)
!25 = !DILocation(line: 6, column: 2, scope: !19)
!26 = distinct !{!26, !17, !27}
!27 = !DILocation(line: 6, column: 51, scope: !15)
!28 = !DILocation(line: 7, column: 2, scope: !7)
!29 = distinct !DISubprogram(name: "happy", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "n", arg: 1, scope: !29, file: !1, line: 10, type: !10)
!31 = !DILocation(line: 0, scope: !29)
!32 = !DILocation(line: 13, column: 2, scope: !29)
!33 = !DILocation(line: 13, column: 11, scope: !29)
!34 = !DILocation(line: 13, column: 22, scope: !29)
!35 = distinct !{!35, !32, !36}
!36 = !DILocation(line: 13, column: 28, scope: !29)
!37 = !DILocation(line: 14, column: 7, scope: !29)
!38 = !DILocalVariable(name: "nn", scope: !29, file: !1, line: 12, type: !10)
!39 = !DILocation(line: 15, column: 2, scope: !29)
!40 = !DILocation(line: 15, column: 12, scope: !29)
!41 = !DILocation(line: 15, column: 17, scope: !29)
!42 = !DILocation(line: 15, column: 23, scope: !29)
!43 = !DILocation(line: 16, column: 7, scope: !29)
!44 = !DILocation(line: 16, column: 26, scope: !29)
!45 = !DILocation(line: 16, column: 21, scope: !29)
!46 = distinct !{!46, !39, !47}
!47 = !DILocation(line: 16, column: 34, scope: !29)
!48 = !DILocation(line: 17, column: 11, scope: !29)
!49 = !DILocation(line: 17, column: 2, scope: !29)
!50 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !51, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!10}
!53 = !DILocalVariable(name: "cnt", scope: !50, file: !1, line: 22, type: !10)
!54 = !DILocation(line: 0, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !1, line: 22, type: !10)
!56 = !DILocation(line: 23, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 23, column: 2)
!58 = !DILocation(line: 0, scope: !57)
!59 = !DILocation(line: 23, column: 14, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !1, line: 23, column: 2)
!61 = !DILocation(line: 23, column: 18, scope: !60)
!62 = !DILocation(line: 23, column: 22, scope: !60)
!63 = !DILocation(line: 23, column: 21, scope: !60)
!64 = !DILocation(line: 23, column: 2, scope: !57)
!65 = !DILocation(line: 24, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !1, line: 24, column: 7)
!67 = !DILocation(line: 24, column: 7, scope: !60)
!68 = !{!"if"}
!69 = !DILocation(line: 24, column: 17, scope: !66)
!70 = !DILocation(line: 24, column: 24, scope: !66)
!71 = !DILocation(line: 24, column: 14, scope: !66)
!72 = !DILocation(line: 23, column: 37, scope: !60)
!73 = !DILocation(line: 23, column: 2, scope: !60)
!74 = distinct !{!74, !64, !75}
!75 = !DILocation(line: 24, column: 39, scope: !57)
!76 = !DILocation(line: 26, column: 2, scope: !50)
!77 = !DILocation(line: 27, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !50, file: !1, line: 27, column: 2)
!79 = !DILocation(line: 0, scope: !78)
!80 = !DILocation(line: 27, column: 2, scope: !78)
!81 = !DILocation(line: 28, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 28, column: 7)
!83 = distinct !DILexicalBlock(scope: !78, file: !1, line: 27, column: 2)
!84 = !DILocation(line: 28, column: 7, scope: !83)
!85 = !DILocation(line: 28, column: 17, scope: !82)
!86 = !DILocation(line: 28, column: 23, scope: !82)
!87 = !DILocation(line: 28, column: 26, scope: !82)
!88 = !DILocation(line: 28, column: 14, scope: !82)
!89 = !DILocation(line: 27, column: 20, scope: !83)
!90 = !DILocation(line: 27, column: 2, scope: !83)
!91 = distinct !{!91, !80, !92}
!92 = !DILocation(line: 28, column: 42, scope: !78)
!93 = !DILocation(line: 30, column: 2, scope: !50)
