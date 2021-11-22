; ModuleID = 'knuth-shuffle-2.ll'
source_filename = "knuth-shuffle-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"before:\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"after: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @irand(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !11, metadata !DIExpression()), !dbg !12
  %rem = srem i32 2147483647, %n, !dbg !13
  %sub = sub nsw i32 2147483647, %rem, !dbg !14
  call void @llvm.dbg.value(metadata i32 %sub, metadata !15, metadata !DIExpression()), !dbg !12
  br label %while.cond, !dbg !16

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @rand() #4, !dbg !17
  call void @llvm.dbg.value(metadata i32 %call, metadata !18, metadata !DIExpression()), !dbg !12
  %cmp = icmp sge i32 %call, %sub, !dbg !19
  br i1 %cmp, label %while.body, label %while.end, !dbg !16

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !16, !llvm.loop !20

while.end:                                        ; preds = %while.cond
  %div = sdiv i32 %sub, %n, !dbg !22
  %div1 = sdiv i32 %call, %div, !dbg !23
  ret i32 %div1, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle_int(i32* %list, i64 %len) #0 !dbg !25 {
entry:
  call void @llvm.dbg.value(metadata i32* %list, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i64 %len, metadata !34, metadata !DIExpression()), !dbg !33
  br label %while.cond, !dbg !35

while.cond:                                       ; preds = %if.end, %entry
  %len.addr.0 = phi i64 [ %len, %entry ], [ %dec, %if.end ]
  call void @llvm.dbg.value(metadata i64 %len.addr.0, metadata !34, metadata !DIExpression()), !dbg !33
  %tobool = icmp ne i64 %len.addr.0, 0, !dbg !35
  br i1 %tobool, label %while.body, label %while.end, !dbg !35

while.body:                                       ; preds = %while.cond
  %conv = trunc i64 %len.addr.0 to i32, !dbg !36
  %call = call i32 @irand(i32 %conv), !dbg !36
  call void @llvm.dbg.value(metadata i32 %call, metadata !38, metadata !DIExpression()), !dbg !33
  %conv1 = sext i32 %call to i64, !dbg !39
  %sub = sub i64 %len.addr.0, 1, !dbg !39
  %cmp = icmp ne i64 %conv1, %sub, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !36, !cf.info !41

if.then:                                          ; preds = %while.body
  %idxprom = sext i32 %call to i64, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %list, i64 %idxprom, !dbg !42
  %0 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @llvm.dbg.value(metadata i32 %0, metadata !44, metadata !DIExpression()), !dbg !33
  %sub3 = sub i64 %len.addr.0, 1, !dbg !42
  %arrayidx4 = getelementptr inbounds i32, i32* %list, i64 %sub3, !dbg !42
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !42
  %idxprom5 = sext i32 %call to i64, !dbg !42
  %arrayidx6 = getelementptr inbounds i32, i32* %list, i64 %idxprom5, !dbg !42
  store i32 %1, i32* %arrayidx6, align 4, !dbg !42
  %sub7 = sub i64 %len.addr.0, 1, !dbg !42
  %arrayidx8 = getelementptr inbounds i32, i32* %list, i64 %sub7, !dbg !42
  store i32 %0, i32* %arrayidx8, align 4, !dbg !42
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %while.body
  %dec = add i64 %len.addr.0, -1, !dbg !36
  call void @llvm.dbg.value(metadata i64 %dec, metadata !34, metadata !DIExpression()), !dbg !33
  br label %while.cond, !dbg !35, !llvm.loop !45

while.end:                                        ; preds = %while.cond
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !46 {
entry:
  %x = alloca [20 x i32], align 16
  call void @llvm.dbg.declare(metadata [20 x i32]* %x, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata i32 0, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !58
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !54, metadata !DIExpression()), !dbg !55
  %cmp = icmp slt i32 %i.0, 20, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !62
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom, !dbg !62
  store i32 %i.0, i32* %arrayidx, align 4, !dbg !63
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !64
  call void @llvm.dbg.value(metadata i32 %inc, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @llvm.dbg.value(metadata i32 0, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond1, !dbg !68

for.cond1:                                        ; preds = %for.inc8, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc9, %for.inc8 ], !dbg !70
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !54, metadata !DIExpression()), !dbg !55
  %cmp2 = icmp slt i32 %i.1, 20, !dbg !71
  br i1 %cmp2, label %lor.end, label %lor.rhs, !dbg !73

lor.rhs:                                          ; preds = %for.cond1
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  %tobool = icmp ne i32 %call3, 0, !dbg !75
  %lnot = xor i1 %tobool, true, !dbg !75
  br label %lor.end, !dbg !73

lor.end:                                          ; preds = %lor.rhs, %for.cond1
  %0 = phi i1 [ true, %for.cond1 ], [ %lnot, %lor.rhs ]
  br i1 %0, label %for.body4, label %for.end10, !dbg !76

for.body4:                                        ; preds = %lor.end
  %idxprom5 = sext i32 %i.1 to i64, !dbg !77
  %arrayidx6 = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom5, !dbg !77
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !77
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %1), !dbg !78
  br label %for.inc8, !dbg !78

for.inc8:                                         ; preds = %for.body4
  %inc9 = add nsw i32 %i.1, 1, !dbg !79
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond1, !dbg !80, !llvm.loop !81

for.end10:                                        ; preds = %lor.end
  %arraydecay = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 0, !dbg !83
  call void @shuffle_int(i32* %arraydecay, i64 20), !dbg !84
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond12, !dbg !85

for.cond12:                                       ; preds = %for.inc23, %for.end10
  %i.2 = phi i32 [ 0, %for.end10 ], [ %inc24, %for.inc23 ], !dbg !87
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !54, metadata !DIExpression()), !dbg !55
  %cmp13 = icmp slt i32 %i.2, 20, !dbg !88
  br i1 %cmp13, label %lor.end18, label %lor.rhs14, !dbg !90

lor.rhs14:                                        ; preds = %for.cond12
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  %tobool16 = icmp ne i32 %call15, 0, !dbg !92
  %lnot17 = xor i1 %tobool16, true, !dbg !92
  br label %lor.end18, !dbg !90

lor.end18:                                        ; preds = %lor.rhs14, %for.cond12
  %2 = phi i1 [ true, %for.cond12 ], [ %lnot17, %lor.rhs14 ]
  br i1 %2, label %for.body19, label %for.end25, !dbg !93

for.body19:                                       ; preds = %lor.end18
  %idxprom20 = sext i32 %i.2 to i64, !dbg !94
  %arrayidx21 = getelementptr inbounds [20 x i32], [20 x i32]* %x, i64 0, i64 %idxprom20, !dbg !94
  %3 = load i32, i32* %arrayidx21, align 4, !dbg !94
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %3), !dbg !95
  br label %for.inc23, !dbg !95

for.inc23:                                        ; preds = %for.body19
  %inc24 = add nsw i32 %i.2, 1, !dbg !96
  call void @llvm.dbg.value(metadata i32 %inc24, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.cond12, !dbg !97, !llvm.loop !98

for.end25:                                        ; preds = %lor.end18
  ret i32 0, !dbg !100
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "knuth-shuffle-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knuth-shuffle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "irand", scope: !1, file: !1, line: 26, type: !8, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 26, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 28, column: 41, scope: !7)
!14 = !DILocation(line: 28, column: 29, scope: !7)
!15 = !DILocalVariable(name: "rand_max", scope: !7, file: !1, line: 28, type: !10)
!16 = !DILocation(line: 32, column: 2, scope: !7)
!17 = !DILocation(line: 32, column: 14, scope: !7)
!18 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 28, type: !10)
!19 = !DILocation(line: 32, column: 22, scope: !7)
!20 = distinct !{!20, !16, !21}
!21 = !DILocation(line: 32, column: 34, scope: !7)
!22 = !DILocation(line: 33, column: 23, scope: !7)
!23 = !DILocation(line: 33, column: 11, scope: !7)
!24 = !DILocation(line: 33, column: 2, scope: !7)
!25 = distinct !DISubprogram(name: "shuffle_int", scope: !1, file: !1, line: 37, type: !26, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28, !29}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocalVariable(name: "list", arg: 1, scope: !25, file: !1, line: 37, type: !28)
!33 = !DILocation(line: 0, scope: !25)
!34 = !DILocalVariable(name: "len", arg: 2, scope: !25, file: !1, line: 37, type: !29)
!35 = !DILocation(line: 37, column: 1, scope: !25)
!36 = !DILocation(line: 37, column: 1, scope: !37)
!37 = distinct !DILexicalBlock(scope: !25, file: !1, line: 37, column: 1)
!38 = !DILocalVariable(name: "j", scope: !25, file: !1, line: 37, type: !10)
!39 = !DILocation(line: 37, column: 1, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 37, column: 1)
!41 = !{!"if"}
!42 = !DILocation(line: 37, column: 1, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 37, column: 1)
!44 = !DILocalVariable(name: "tmp", scope: !25, file: !1, line: 37, type: !10)
!45 = distinct !{!45, !35, !35}
!46 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 39, type: !47, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!10}
!49 = !DILocalVariable(name: "x", scope: !46, file: !1, line: 41, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 640, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 20)
!53 = !DILocation(line: 41, column: 9, scope: !46)
!54 = !DILocalVariable(name: "i", scope: !46, file: !1, line: 41, type: !10)
!55 = !DILocation(line: 0, scope: !46)
!56 = !DILocation(line: 43, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !46, file: !1, line: 43, column: 2)
!58 = !DILocation(line: 0, scope: !57)
!59 = !DILocation(line: 43, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !1, line: 43, column: 2)
!61 = !DILocation(line: 43, column: 2, scope: !57)
!62 = !DILocation(line: 43, column: 27, scope: !60)
!63 = !DILocation(line: 43, column: 32, scope: !60)
!64 = !DILocation(line: 43, column: 23, scope: !60)
!65 = !DILocation(line: 43, column: 2, scope: !60)
!66 = distinct !{!66, !61, !67}
!67 = !DILocation(line: 43, column: 34, scope: !57)
!68 = !DILocation(line: 44, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !46, file: !1, line: 44, column: 2)
!70 = !DILocation(line: 0, scope: !69)
!71 = !DILocation(line: 44, column: 35, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !1, line: 44, column: 2)
!73 = !DILocation(line: 44, column: 40, scope: !72)
!74 = !DILocation(line: 44, column: 44, scope: !72)
!75 = !DILocation(line: 44, column: 43, scope: !72)
!76 = !DILocation(line: 44, column: 2, scope: !69)
!77 = !DILocation(line: 45, column: 17, scope: !72)
!78 = !DILocation(line: 45, column: 3, scope: !72)
!79 = !DILocation(line: 44, column: 59, scope: !72)
!80 = !DILocation(line: 44, column: 2, scope: !72)
!81 = distinct !{!81, !76, !82}
!82 = !DILocation(line: 45, column: 21, scope: !69)
!83 = !DILocation(line: 47, column: 14, scope: !46)
!84 = !DILocation(line: 47, column: 2, scope: !46)
!85 = !DILocation(line: 49, column: 7, scope: !86)
!86 = distinct !DILexicalBlock(scope: !46, file: !1, line: 49, column: 2)
!87 = !DILocation(line: 0, scope: !86)
!88 = !DILocation(line: 49, column: 35, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 49, column: 2)
!90 = !DILocation(line: 49, column: 40, scope: !89)
!91 = !DILocation(line: 49, column: 44, scope: !89)
!92 = !DILocation(line: 49, column: 43, scope: !89)
!93 = !DILocation(line: 49, column: 2, scope: !86)
!94 = !DILocation(line: 50, column: 17, scope: !89)
!95 = !DILocation(line: 50, column: 3, scope: !89)
!96 = !DILocation(line: 49, column: 59, scope: !89)
!97 = !DILocation(line: 49, column: 2, scope: !89)
!98 = distinct !{!98, !93, !99}
!99 = !DILocation(line: 50, column: 21, scope: !86)
!100 = !DILocation(line: 51, column: 2, scope: !46)
