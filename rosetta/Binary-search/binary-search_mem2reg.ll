; ModuleID = 'binary-search.ll'
source_filename = "binary-search.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [10 x i32] [i32 -31, i32 0, i32 1, i32 2, i32 2, i32 4, i32 65, i32 83, i32 99, i32 782], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d is at index %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bsearch(i32* %a, i32 %n, i32 %x) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32* %a, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %n, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %x, metadata !15, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 0, metadata !16, metadata !DIExpression()), !dbg !13
  %sub = sub nsw i32 %n, 1, !dbg !17
  call void @llvm.dbg.value(metadata i32 %sub, metadata !18, metadata !DIExpression()), !dbg !13
  br label %while.cond, !dbg !19

while.cond:                                       ; preds = %if.end10, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %i.1, %if.end10 ], !dbg !13
  %j.0 = phi i32 [ %sub, %entry ], [ %j.1, %if.end10 ], !dbg !20
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !18, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !16, metadata !DIExpression()), !dbg !13
  %cmp = icmp sle i32 %i.0, %j.0, !dbg !21
  br i1 %cmp, label %while.body, label %while.end, !dbg !19

while.body:                                       ; preds = %while.cond
  %sub1 = sub nsw i32 %j.0, %i.0, !dbg !22
  %div = sdiv i32 %sub1, 2, !dbg !24
  %add = add nsw i32 %i.0, %div, !dbg !25
  call void @llvm.dbg.value(metadata i32 %add, metadata !26, metadata !DIExpression()), !dbg !27
  %idxprom = sext i32 %add to i64, !dbg !28
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom, !dbg !28
  %0 = load i32, i32* %arrayidx, align 4, !dbg !28
  %cmp2 = icmp eq i32 %0, %x, !dbg !30
  br i1 %cmp2, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %while.body
  br label %return, !dbg !32

if.else:                                          ; preds = %while.body
  %idxprom3 = sext i32 %add to i64, !dbg !34
  %arrayidx4 = getelementptr inbounds i32, i32* %a, i64 %idxprom3, !dbg !34
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !34
  %cmp5 = icmp slt i32 %1, %x, !dbg !36
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !37

if.then6:                                         ; preds = %if.else
  %add7 = add nsw i32 %add, 1, !dbg !38
  call void @llvm.dbg.value(metadata i32 %add7, metadata !16, metadata !DIExpression()), !dbg !13
  br label %if.end, !dbg !40

if.else8:                                         ; preds = %if.else
  %sub9 = sub nsw i32 %add, 1, !dbg !41
  call void @llvm.dbg.value(metadata i32 %sub9, metadata !18, metadata !DIExpression()), !dbg !13
  br label %if.end

if.end:                                           ; preds = %if.else8, %if.then6
  %i.1 = phi i32 [ %add7, %if.then6 ], [ %i.0, %if.else8 ], !dbg !13
  %j.1 = phi i32 [ %j.0, %if.then6 ], [ %sub9, %if.else8 ], !dbg !13
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !18, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !16, metadata !DIExpression()), !dbg !13
  br label %if.end10

if.end10:                                         ; preds = %if.end
  br label %while.cond, !dbg !19, !llvm.loop !43

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !45

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ -1, %while.end ], !dbg !13
  ret i32 %retval.0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bsearch_r(i32* %a, i32 %x, i32 %i, i32 %j) #0 !dbg !47 {
entry:
  call void @llvm.dbg.value(metadata i32* %a, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %x, metadata !52, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %i, metadata !53, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %j, metadata !54, metadata !DIExpression()), !dbg !51
  %cmp = icmp slt i32 %j, %i, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  br label %return, !dbg !58

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 %j, %i, !dbg !60
  %div = sdiv i32 %sub, 2, !dbg !61
  %add = add nsw i32 %i, %div, !dbg !62
  call void @llvm.dbg.value(metadata i32 %add, metadata !63, metadata !DIExpression()), !dbg !51
  %idxprom = sext i32 %add to i64, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom, !dbg !64
  %0 = load i32, i32* %arrayidx, align 4, !dbg !64
  %cmp1 = icmp eq i32 %0, %x, !dbg !66
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !67

if.then2:                                         ; preds = %if.end
  br label %return, !dbg !68

if.else:                                          ; preds = %if.end
  %idxprom3 = sext i32 %add to i64, !dbg !70
  %arrayidx4 = getelementptr inbounds i32, i32* %a, i64 %idxprom3, !dbg !70
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !70
  %cmp5 = icmp slt i32 %1, %x, !dbg !72
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !73

if.then6:                                         ; preds = %if.else
  %add7 = add nsw i32 %add, 1, !dbg !74
  %call = call i32 @bsearch_r(i32* %a, i32 %x, i32 %add7, i32 %j), !dbg !76
  br label %return, !dbg !77

if.else8:                                         ; preds = %if.else
  %sub9 = sub nsw i32 %add, 1, !dbg !78
  %call10 = call i32 @bsearch_r(i32* %a, i32 %x, i32 %i, i32 %sub9), !dbg !80
  br label %return, !dbg !81

return:                                           ; preds = %if.else8, %if.then6, %if.then2, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ %add, %if.then2 ], [ %call, %if.then6 ], [ %call10, %if.else8 ], !dbg !51
  ret i32 %retval.0, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !83 {
entry:
  %a = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !86, metadata !DIExpression()), !dbg !90
  %0 = bitcast [10 x i32]* %a to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.main.a to i8*), i64 40, i1 false), !dbg !90
  call void @llvm.dbg.value(metadata i32 10, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.value(metadata i32 2, metadata !93, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !94
  %call = call i32 @bsearch(i32* %arraydecay, i32 10, i32 2), !dbg !95
  call void @llvm.dbg.value(metadata i32 %call, metadata !96, metadata !DIExpression()), !dbg !92
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 2, i32 %call), !dbg !97
  call void @llvm.dbg.value(metadata i32 5, metadata !93, metadata !DIExpression()), !dbg !92
  %arraydecay2 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0, !dbg !98
  %sub = sub nsw i32 10, 1, !dbg !99
  %call3 = call i32 @bsearch_r(i32* %arraydecay2, i32 5, i32 0, i32 %sub), !dbg !100
  call void @llvm.dbg.value(metadata i32 %call3, metadata !96, metadata !DIExpression()), !dbg !92
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 5, i32 %call3), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "binary-search.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Binary-search")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "bsearch", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocalVariable(name: "x", arg: 3, scope: !7, file: !1, line: 3, type: !10)
!16 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 4, type: !10)
!17 = !DILocation(line: 4, column: 22, scope: !7)
!18 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 4, type: !10)
!19 = !DILocation(line: 5, column: 5, scope: !7)
!20 = !DILocation(line: 4, column: 16, scope: !7)
!21 = !DILocation(line: 5, column: 14, scope: !7)
!22 = !DILocation(line: 6, column: 25, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 20)
!24 = !DILocation(line: 6, column: 30, scope: !23)
!25 = !DILocation(line: 6, column: 19, scope: !23)
!26 = !DILocalVariable(name: "k", scope: !23, file: !1, line: 6, type: !10)
!27 = !DILocation(line: 0, scope: !23)
!28 = !DILocation(line: 7, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 7, column: 13)
!30 = !DILocation(line: 7, column: 18, scope: !29)
!31 = !DILocation(line: 7, column: 13, scope: !23)
!32 = !DILocation(line: 8, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 7, column: 24)
!34 = !DILocation(line: 10, column: 18, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10, column: 18)
!36 = !DILocation(line: 10, column: 23, scope: !35)
!37 = !DILocation(line: 10, column: 18, scope: !29)
!38 = !DILocation(line: 11, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 10, column: 28)
!40 = !DILocation(line: 12, column: 9, scope: !39)
!41 = !DILocation(line: 14, column: 19, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !1, line: 13, column: 14)
!43 = distinct !{!43, !19, !44}
!44 = !DILocation(line: 16, column: 5, scope: !7)
!45 = !DILocation(line: 17, column: 5, scope: !7)
!46 = !DILocation(line: 18, column: 1, scope: !7)
!47 = distinct !DISubprogram(name: "bsearch_r", scope: !1, file: !1, line: 20, type: !48, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!10, !11, !10, !10, !10}
!50 = !DILocalVariable(name: "a", arg: 1, scope: !47, file: !1, line: 20, type: !11)
!51 = !DILocation(line: 0, scope: !47)
!52 = !DILocalVariable(name: "x", arg: 2, scope: !47, file: !1, line: 20, type: !10)
!53 = !DILocalVariable(name: "i", arg: 3, scope: !47, file: !1, line: 20, type: !10)
!54 = !DILocalVariable(name: "j", arg: 4, scope: !47, file: !1, line: 20, type: !10)
!55 = !DILocation(line: 21, column: 11, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !1, line: 21, column: 9)
!57 = !DILocation(line: 21, column: 9, scope: !47)
!58 = !DILocation(line: 22, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !1, line: 21, column: 16)
!60 = !DILocation(line: 24, column: 21, scope: !47)
!61 = !DILocation(line: 24, column: 26, scope: !47)
!62 = !DILocation(line: 24, column: 15, scope: !47)
!63 = !DILocalVariable(name: "k", scope: !47, file: !1, line: 24, type: !10)
!64 = !DILocation(line: 25, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !47, file: !1, line: 25, column: 9)
!66 = !DILocation(line: 25, column: 14, scope: !65)
!67 = !DILocation(line: 25, column: 9, scope: !47)
!68 = !DILocation(line: 26, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 25, column: 20)
!70 = !DILocation(line: 28, column: 14, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 28, column: 14)
!72 = !DILocation(line: 28, column: 19, scope: !71)
!73 = !DILocation(line: 28, column: 14, scope: !65)
!74 = !DILocation(line: 29, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 28, column: 24)
!76 = !DILocation(line: 29, column: 16, scope: !75)
!77 = !DILocation(line: 29, column: 9, scope: !75)
!78 = !DILocation(line: 32, column: 37, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !1, line: 31, column: 10)
!80 = !DILocation(line: 32, column: 16, scope: !79)
!81 = !DILocation(line: 32, column: 9, scope: !79)
!82 = !DILocation(line: 34, column: 1, scope: !47)
!83 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 36, type: !84, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10}
!86 = !DILocalVariable(name: "a", scope: !83, file: !1, line: 37, type: !87)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 10)
!90 = !DILocation(line: 37, column: 9, scope: !83)
!91 = !DILocalVariable(name: "n", scope: !83, file: !1, line: 38, type: !10)
!92 = !DILocation(line: 0, scope: !83)
!93 = !DILocalVariable(name: "x", scope: !83, file: !1, line: 39, type: !10)
!94 = !DILocation(line: 40, column: 21, scope: !83)
!95 = !DILocation(line: 40, column: 13, scope: !83)
!96 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 40, type: !10)
!97 = !DILocation(line: 41, column: 5, scope: !83)
!98 = !DILocation(line: 43, column: 19, scope: !83)
!99 = !DILocation(line: 43, column: 30, scope: !83)
!100 = !DILocation(line: 43, column: 9, scope: !83)
!101 = !DILocation(line: 44, column: 5, scope: !83)
!102 = !DILocation(line: 45, column: 5, scope: !83)
