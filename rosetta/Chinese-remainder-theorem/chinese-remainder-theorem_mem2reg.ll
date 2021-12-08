; ModuleID = 'chinese-remainder-theorem.ll'
source_filename = "chinese-remainder-theorem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.n = private unnamed_addr constant [3 x i32] [i32 3, i32 5, i32 7], align 4
@__const.main.a = private unnamed_addr constant [3 x i32] [i32 2, i32 3, i32 2], align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @mul_inv(i32 %a, i32 %b) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %a, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %b, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %b, metadata !14, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !15, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 1, metadata !16, metadata !DIExpression()), !dbg !12
  %cmp = icmp eq i32 %b, 1, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  br label %return, !dbg !20

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %while.body, %if.end
  %x0.0 = phi i32 [ 0, %if.end ], [ %sub, %while.body ], !dbg !12
  %x1.0 = phi i32 [ 1, %if.end ], [ %x0.0, %while.body ], !dbg !12
  %b.addr.0 = phi i32 [ %b, %if.end ], [ %rem, %while.body ]
  %a.addr.0 = phi i32 [ %a, %if.end ], [ %b.addr.0, %while.body ]
  call void @llvm.dbg.value(metadata i32 %a.addr.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %b.addr.0, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %x1.0, metadata !16, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %x0.0, metadata !15, metadata !DIExpression()), !dbg !12
  %cmp1 = icmp sgt i32 %a.addr.0, 1, !dbg !22
  br i1 %cmp1, label %while.body, label %while.end, !dbg !21

while.body:                                       ; preds = %while.cond
  %div = sdiv i32 %a.addr.0, %b.addr.0, !dbg !23
  call void @llvm.dbg.value(metadata i32 %div, metadata !25, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %b.addr.0, metadata !26, metadata !DIExpression()), !dbg !12
  %rem = srem i32 %a.addr.0, %b.addr.0, !dbg !27
  call void @llvm.dbg.value(metadata i32 %rem, metadata !13, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %b.addr.0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %x0.0, metadata !26, metadata !DIExpression()), !dbg !12
  %mul = mul nsw i32 %div, %x0.0, !dbg !28
  %sub = sub nsw i32 %x1.0, %mul, !dbg !29
  call void @llvm.dbg.value(metadata i32 %sub, metadata !15, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %x0.0, metadata !16, metadata !DIExpression()), !dbg !12
  br label %while.cond, !dbg !21, !llvm.loop !30

while.end:                                        ; preds = %while.cond
  %cmp2 = icmp slt i32 %x1.0, 0, !dbg !32
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !34

if.then3:                                         ; preds = %while.end
  %add = add nsw i32 %x1.0, %b, !dbg !35
  call void @llvm.dbg.value(metadata i32 %add, metadata !16, metadata !DIExpression()), !dbg !12
  br label %if.end4, !dbg !36

if.end4:                                          ; preds = %if.then3, %while.end
  %x1.1 = phi i32 [ %add, %if.then3 ], [ %x1.0, %while.end ], !dbg !12
  call void @llvm.dbg.value(metadata i32 %x1.1, metadata !16, metadata !DIExpression()), !dbg !12
  br label %return, !dbg !37

return:                                           ; preds = %if.end4, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ %x1.1, %if.end4 ], !dbg !12
  ret i32 %retval.0, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @chinese_remainder(i32* %n, i32* %a, i32 %len) #0 !dbg !39 {
entry:
  call void @llvm.dbg.value(metadata i32* %n, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32* %a, metadata !45, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %len, metadata !46, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 1, metadata !47, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 0, metadata !48, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 0, metadata !49, metadata !DIExpression()), !dbg !44
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !52
  %prod.0 = phi i32 [ 1, %entry ], [ %mul, %for.inc ], !dbg !44
  call void @llvm.dbg.value(metadata i32 %prod.0, metadata !47, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !49, metadata !DIExpression()), !dbg !44
  %cmp = icmp slt i32 %i.0, %len, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %n, i64 %idxprom, !dbg !56
  %0 = load i32, i32* %arrayidx, align 4, !dbg !56
  %mul = mul nsw i32 %prod.0, %0, !dbg !57
  call void @llvm.dbg.value(metadata i32 %mul, metadata !47, metadata !DIExpression()), !dbg !44
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !59
  call void @llvm.dbg.value(metadata i32 %inc, metadata !49, metadata !DIExpression()), !dbg !44
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !49, metadata !DIExpression()), !dbg !44
  br label %for.cond1, !dbg !63

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !65
  %sum.0 = phi i32 [ 0, %for.end ], [ %add, %for.inc12 ], !dbg !44
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !48, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !49, metadata !DIExpression()), !dbg !44
  %cmp2 = icmp slt i32 %i.1, %len, !dbg !66
  br i1 %cmp2, label %for.body3, label %for.end14, !dbg !68

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64, !dbg !69
  %arrayidx5 = getelementptr inbounds i32, i32* %n, i64 %idxprom4, !dbg !69
  %1 = load i32, i32* %arrayidx5, align 4, !dbg !69
  %div = sdiv i32 %prod.0, %1, !dbg !71
  call void @llvm.dbg.value(metadata i32 %div, metadata !72, metadata !DIExpression()), !dbg !44
  %idxprom6 = sext i32 %i.1 to i64, !dbg !73
  %arrayidx7 = getelementptr inbounds i32, i32* %a, i64 %idxprom6, !dbg !73
  %2 = load i32, i32* %arrayidx7, align 4, !dbg !73
  %idxprom8 = sext i32 %i.1 to i64, !dbg !74
  %arrayidx9 = getelementptr inbounds i32, i32* %n, i64 %idxprom8, !dbg !74
  %3 = load i32, i32* %arrayidx9, align 4, !dbg !74
  %call = call i32 @mul_inv(i32 %div, i32 %3), !dbg !75
  %mul10 = mul nsw i32 %2, %call, !dbg !76
  %mul11 = mul nsw i32 %mul10, %div, !dbg !77
  %add = add nsw i32 %sum.0, %mul11, !dbg !78
  call void @llvm.dbg.value(metadata i32 %add, metadata !48, metadata !DIExpression()), !dbg !44
  br label %for.inc12, !dbg !79

for.inc12:                                        ; preds = %for.body3
  %inc13 = add nsw i32 %i.1, 1, !dbg !80
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !49, metadata !DIExpression()), !dbg !44
  br label %for.cond1, !dbg !81, !llvm.loop !82

for.end14:                                        ; preds = %for.cond1
  %rem = srem i32 %sum.0, %prod.0, !dbg !84
  ret i32 %rem, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !86 {
entry:
  %n = alloca [3 x i32], align 4
  %a = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %n, metadata !89, metadata !DIExpression()), !dbg !93
  %0 = bitcast [3 x i32]* %n to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.n to i8*), i64 12, i1 false), !dbg !93
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !94, metadata !DIExpression()), !dbg !95
  %1 = bitcast [3 x i32]* %a to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %n, i64 0, i64 0, !dbg !96
  %arraydecay1 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !97
  %call = call i32 @chinese_remainder(i32* %arraydecay, i32* %arraydecay1, i32 3), !dbg !98
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !99
  ret i32 0, !dbg !100
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
!1 = !DIFile(filename: "chinese-remainder-theorem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Chinese-remainder-theorem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "mul_inv", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocalVariable(name: "b0", scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocalVariable(name: "x0", scope: !7, file: !1, line: 7, type: !10)
!16 = !DILocalVariable(name: "x1", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocation(line: 8, column: 8, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!19 = !DILocation(line: 8, column: 6, scope: !7)
!20 = !DILocation(line: 8, column: 14, scope: !18)
!21 = !DILocation(line: 9, column: 2, scope: !7)
!22 = !DILocation(line: 9, column: 11, scope: !7)
!23 = !DILocation(line: 10, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 16)
!25 = !DILocalVariable(name: "q", scope: !7, file: !1, line: 6, type: !10)
!26 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 6, type: !10)
!27 = !DILocation(line: 11, column: 16, scope: !24)
!28 = !DILocation(line: 12, column: 23, scope: !24)
!29 = !DILocation(line: 12, column: 19, scope: !24)
!30 = distinct !{!30, !21, !31}
!31 = !DILocation(line: 13, column: 2, scope: !7)
!32 = !DILocation(line: 14, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 6)
!34 = !DILocation(line: 14, column: 6, scope: !7)
!35 = !DILocation(line: 14, column: 17, scope: !33)
!36 = !DILocation(line: 14, column: 14, scope: !33)
!37 = !DILocation(line: 15, column: 2, scope: !7)
!38 = !DILocation(line: 16, column: 1, scope: !7)
!39 = distinct !DISubprogram(name: "chinese_remainder", scope: !1, file: !1, line: 18, type: !40, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!10, !42, !42, !10}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!43 = !DILocalVariable(name: "n", arg: 1, scope: !39, file: !1, line: 18, type: !42)
!44 = !DILocation(line: 0, scope: !39)
!45 = !DILocalVariable(name: "a", arg: 2, scope: !39, file: !1, line: 18, type: !42)
!46 = !DILocalVariable(name: "len", arg: 3, scope: !39, file: !1, line: 18, type: !10)
!47 = !DILocalVariable(name: "prod", scope: !39, file: !1, line: 20, type: !10)
!48 = !DILocalVariable(name: "sum", scope: !39, file: !1, line: 20, type: !10)
!49 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 20, type: !10)
!50 = !DILocation(line: 22, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !39, file: !1, line: 22, column: 2)
!52 = !DILocation(line: 0, scope: !51)
!53 = !DILocation(line: 22, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 22, column: 2)
!55 = !DILocation(line: 22, column: 2, scope: !51)
!56 = !DILocation(line: 22, column: 36, scope: !54)
!57 = !DILocation(line: 22, column: 33, scope: !54)
!58 = !DILocation(line: 22, column: 28, scope: !54)
!59 = !DILocation(line: 22, column: 24, scope: !54)
!60 = !DILocation(line: 22, column: 2, scope: !54)
!61 = distinct !{!61, !55, !62}
!62 = !DILocation(line: 22, column: 39, scope: !51)
!63 = !DILocation(line: 24, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !39, file: !1, line: 24, column: 2)
!65 = !DILocation(line: 0, scope: !64)
!66 = !DILocation(line: 24, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 24, column: 2)
!68 = !DILocation(line: 24, column: 2, scope: !64)
!69 = !DILocation(line: 25, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !1, line: 24, column: 28)
!71 = !DILocation(line: 25, column: 12, scope: !70)
!72 = !DILocalVariable(name: "p", scope: !39, file: !1, line: 20, type: !10)
!73 = !DILocation(line: 26, column: 10, scope: !70)
!74 = !DILocation(line: 26, column: 28, scope: !70)
!75 = !DILocation(line: 26, column: 17, scope: !70)
!76 = !DILocation(line: 26, column: 15, scope: !70)
!77 = !DILocation(line: 26, column: 34, scope: !70)
!78 = !DILocation(line: 26, column: 7, scope: !70)
!79 = !DILocation(line: 27, column: 2, scope: !70)
!80 = !DILocation(line: 24, column: 24, scope: !67)
!81 = !DILocation(line: 24, column: 2, scope: !67)
!82 = distinct !{!82, !68, !83}
!83 = !DILocation(line: 27, column: 2, scope: !64)
!84 = !DILocation(line: 29, column: 13, scope: !39)
!85 = !DILocation(line: 29, column: 2, scope: !39)
!86 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !87, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!10}
!89 = !DILocalVariable(name: "n", scope: !86, file: !1, line: 34, type: !90)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 3)
!93 = !DILocation(line: 34, column: 6, scope: !86)
!94 = !DILocalVariable(name: "a", scope: !86, file: !1, line: 35, type: !90)
!95 = !DILocation(line: 35, column: 6, scope: !86)
!96 = !DILocation(line: 37, column: 35, scope: !86)
!97 = !DILocation(line: 37, column: 38, scope: !86)
!98 = !DILocation(line: 37, column: 17, scope: !86)
!99 = !DILocation(line: 37, column: 2, scope: !86)
!100 = !DILocation(line: 38, column: 2, scope: !86)
