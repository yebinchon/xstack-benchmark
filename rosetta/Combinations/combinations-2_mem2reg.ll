; ModuleID = 'combinations-2.ll'
source_filename = "combinations-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(i32 %m, i32 %n, i8* %c) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %n, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i8* %c, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !20
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !17, metadata !DIExpression()), !dbg !14
  %cmp = icmp slt i32 %i.0, %n, !dbg !21
  br i1 %cmp, label %for.body, label %for.end, !dbg !23

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %n, %i.0, !dbg !24
  %conv = trunc i32 %sub to i8, !dbg !25
  %idxprom = sext i32 %i.0 to i64, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %c, i64 %idxprom, !dbg !26
  store i8 %conv, i8* %arrayidx, align 1, !dbg !27
  br label %for.inc, !dbg !26

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !28
  call void @llvm.dbg.value(metadata i32 %inc, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !29, !llvm.loop !30

for.end:                                          ; preds = %for.cond
  br label %while.body, !dbg !32

while.body:                                       ; preds = %for.end43, %if.then, %for.end
  call void @llvm.dbg.value(metadata i32 %n, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond1, !dbg !33

for.cond1:                                        ; preds = %for.body2, %while.body
  %i.1 = phi i32 [ %n, %while.body ], [ %dec, %for.body2 ], !dbg !36
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !17, metadata !DIExpression()), !dbg !14
  %dec = add nsw i32 %i.1, -1, !dbg !37
  call void @llvm.dbg.value(metadata i32 %dec, metadata !17, metadata !DIExpression()), !dbg !14
  %tobool = icmp ne i32 %i.1, 0, !dbg !39
  br i1 %tobool, label %for.body2, label %for.end7, !dbg !39

for.body2:                                        ; preds = %for.cond1
  %idxprom3 = sext i32 %dec to i64, !dbg !40
  %arrayidx4 = getelementptr inbounds i8, i8* %c, i64 %idxprom3, !dbg !40
  %0 = load i8, i8* %arrayidx4, align 1, !dbg !40
  %conv5 = zext i8 %0 to i32, !dbg !40
  %tobool6 = icmp ne i32 %dec, 0, !dbg !41
  %1 = zext i1 %tobool6 to i64, !dbg !41
  %cond = select i1 %tobool6, i32 32, i32 10, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %conv5, i32 %cond), !dbg !42
  br label %for.cond1, !dbg !43, !llvm.loop !44

for.end7:                                         ; preds = %for.cond1
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  %idxprom8 = sext i32 0 to i64, !dbg !46
  %arrayidx9 = getelementptr inbounds i8, i8* %c, i64 %idxprom8, !dbg !46
  %2 = load i8, i8* %arrayidx9, align 1, !dbg !48
  %inc10 = add i8 %2, 1, !dbg !48
  store i8 %inc10, i8* %arrayidx9, align 1, !dbg !48
  %conv11 = zext i8 %2 to i32, !dbg !46
  %cmp12 = icmp slt i32 %conv11, %m, !dbg !49
  br i1 %cmp12, label %if.then, label %if.end, !dbg !50, !cf.info !51

if.then:                                          ; preds = %for.end7
  br label %while.body, !dbg !52, !llvm.loop !53

if.end:                                           ; preds = %for.end7
  br label %for.cond14, !dbg !55

for.cond14:                                       ; preds = %if.end26, %if.end
  %i.2 = phi i32 [ 0, %if.end ], [ %inc22, %if.end26 ], !dbg !56
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !17, metadata !DIExpression()), !dbg !14
  %idxprom15 = sext i32 %i.2 to i64, !dbg !57
  %arrayidx16 = getelementptr inbounds i8, i8* %c, i64 %idxprom15, !dbg !57
  %3 = load i8, i8* %arrayidx16, align 1, !dbg !57
  %conv17 = zext i8 %3 to i32, !dbg !57
  %sub18 = sub nsw i32 %m, %i.2, !dbg !60
  %cmp19 = icmp sge i32 %conv17, %sub18, !dbg !61
  br i1 %cmp19, label %for.body21, label %for.end27, !dbg !62

for.body21:                                       ; preds = %for.cond14
  %inc22 = add nsw i32 %i.2, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !17, metadata !DIExpression()), !dbg !14
  %cmp23 = icmp sge i32 %inc22, %n, !dbg !65
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !66, !cf.info !51

if.then25:                                        ; preds = %for.body21
  ret void, !dbg !67

if.end26:                                         ; preds = %for.body21
  br label %for.cond14, !dbg !68, !llvm.loop !69

for.end27:                                        ; preds = %for.cond14
  %idxprom28 = sext i32 %i.2 to i64, !dbg !71
  %arrayidx29 = getelementptr inbounds i8, i8* %c, i64 %idxprom28, !dbg !71
  %4 = load i8, i8* %arrayidx29, align 1, !dbg !73
  %inc30 = add i8 %4, 1, !dbg !73
  store i8 %inc30, i8* %arrayidx29, align 1, !dbg !73
  br label %for.cond31, !dbg !71

for.cond31:                                       ; preds = %for.inc41, %for.end27
  %i.3 = phi i32 [ %i.2, %for.end27 ], [ %dec42, %for.inc41 ], !dbg !56
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !17, metadata !DIExpression()), !dbg !14
  %tobool32 = icmp ne i32 %i.3, 0, !dbg !74
  br i1 %tobool32, label %for.body33, label %for.end43, !dbg !74

for.body33:                                       ; preds = %for.cond31
  %idxprom34 = sext i32 %i.3 to i64, !dbg !75
  %arrayidx35 = getelementptr inbounds i8, i8* %c, i64 %idxprom34, !dbg !75
  %5 = load i8, i8* %arrayidx35, align 1, !dbg !75
  %conv36 = zext i8 %5 to i32, !dbg !75
  %add = add nsw i32 %conv36, 1, !dbg !77
  %conv37 = trunc i32 %add to i8, !dbg !75
  %sub38 = sub nsw i32 %i.3, 1, !dbg !78
  %idxprom39 = sext i32 %sub38 to i64, !dbg !79
  %arrayidx40 = getelementptr inbounds i8, i8* %c, i64 %idxprom39, !dbg !79
  store i8 %conv37, i8* %arrayidx40, align 1, !dbg !80
  br label %for.inc41, !dbg !79

for.inc41:                                        ; preds = %for.body33
  %dec42 = add nsw i32 %i.3, -1, !dbg !81
  call void @llvm.dbg.value(metadata i32 %dec42, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond31, !dbg !82, !llvm.loop !83

for.end43:                                        ; preds = %for.cond31
  br label %while.body, !dbg !32, !llvm.loop !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !85 {
entry:
  %buf = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [100 x i8]* %buf, metadata !88, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %buf, i64 0, i64 0, !dbg !93
  call void @comb(i32 5, i32 3, i8* %arraydecay), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "combinations-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "comb", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!16 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 6, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 2)
!20 = !DILocation(line: 0, scope: !19)
!21 = !DILocation(line: 6, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 6, column: 2)
!23 = !DILocation(line: 6, column: 2, scope: !19)
!24 = !DILocation(line: 6, column: 35, scope: !22)
!25 = !DILocation(line: 6, column: 33, scope: !22)
!26 = !DILocation(line: 6, column: 26, scope: !22)
!27 = !DILocation(line: 6, column: 31, scope: !22)
!28 = !DILocation(line: 6, column: 22, scope: !22)
!29 = !DILocation(line: 6, column: 2, scope: !22)
!30 = distinct !{!30, !23, !31}
!31 = !DILocation(line: 6, column: 37, scope: !19)
!32 = !DILocation(line: 8, column: 2, scope: !7)
!33 = !DILocation(line: 9, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 9, column: 3)
!35 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 12)
!36 = !DILocation(line: 0, scope: !34)
!37 = !DILocation(line: 9, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 9, column: 3)
!39 = !DILocation(line: 9, column: 3, scope: !34)
!40 = !DILocation(line: 10, column: 19, scope: !38)
!41 = !DILocation(line: 10, column: 25, scope: !38)
!42 = !DILocation(line: 10, column: 4, scope: !38)
!43 = !DILocation(line: 9, column: 3, scope: !38)
!44 = distinct !{!44, !39, !45}
!45 = !DILocation(line: 10, column: 38, scope: !34)
!46 = !DILocation(line: 15, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !35, file: !1, line: 15, column: 7)
!48 = !DILocation(line: 15, column: 11, scope: !47)
!49 = !DILocation(line: 15, column: 14, scope: !47)
!50 = !DILocation(line: 15, column: 7, scope: !35)
!51 = !{!"if"}
!52 = !DILocation(line: 15, column: 19, scope: !47)
!53 = distinct !{!53, !32, !54}
!54 = !DILocation(line: 19, column: 2, scope: !7)
!55 = !DILocation(line: 17, column: 3, scope: !35)
!56 = !DILocation(line: 0, scope: !35)
!57 = !DILocation(line: 17, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 17, column: 3)
!59 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 3)
!60 = !DILocation(line: 17, column: 20, scope: !58)
!61 = !DILocation(line: 17, column: 15, scope: !58)
!62 = !DILocation(line: 17, column: 3, scope: !59)
!63 = !DILocation(line: 17, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 17, column: 30)
!65 = !DILocation(line: 17, column: 34, scope: !64)
!66 = !DILocation(line: 17, column: 30, scope: !58)
!67 = !DILocation(line: 17, column: 40, scope: !64)
!68 = !DILocation(line: 17, column: 3, scope: !58)
!69 = distinct !{!69, !62, !70}
!70 = !DILocation(line: 17, column: 40, scope: !59)
!71 = !DILocation(line: 18, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !35, file: !1, line: 18, column: 3)
!73 = !DILocation(line: 18, column: 12, scope: !72)
!74 = !DILocation(line: 18, column: 3, scope: !72)
!75 = !DILocation(line: 18, column: 33, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 18, column: 3)
!77 = !DILocation(line: 18, column: 38, scope: !76)
!78 = !DILocation(line: 18, column: 27, scope: !76)
!79 = !DILocation(line: 18, column: 24, scope: !76)
!80 = !DILocation(line: 18, column: 31, scope: !76)
!81 = !DILocation(line: 18, column: 20, scope: !76)
!82 = !DILocation(line: 18, column: 3, scope: !76)
!83 = distinct !{!83, !74, !84}
!84 = !DILocation(line: 18, column: 40, scope: !72)
!85 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 22, type: !86, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!10}
!88 = !DILocalVariable(name: "buf", scope: !85, file: !1, line: 24, type: !89)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 100)
!92 = !DILocation(line: 24, column: 16, scope: !85)
!93 = !DILocation(line: 25, column: 13, scope: !85)
!94 = !DILocation(line: 25, column: 2, scope: !85)
!95 = !DILocation(line: 26, column: 2, scope: !85)
