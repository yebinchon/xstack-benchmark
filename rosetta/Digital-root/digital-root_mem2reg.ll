; ModuleID = 'digital-root.ll'
source_filename = "digital-root.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.x = private unnamed_addr constant [4 x i64] [i64 627615, i64 39390, i64 588225, i64 393900588225], align 16
@.str = private unnamed_addr constant [24 x i8] c"%lld: pers %d, root %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @droot(i64 %x, i32 %base, i32* %pers) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i64 %x, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %base, metadata !15, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32* %pers, metadata !16, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  %tobool = icmp ne i32* %pers, null, !dbg !18
  br i1 %tobool, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  store i32 0, i32* %pers, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc9, %if.then
  %d.0 = phi i32 [ 0, %if.then ], [ %d.1, %for.inc9 ], !dbg !14
  %x.addr.0 = phi i64 [ %x, %if.then ], [ %conv10, %for.inc9 ]
  call void @llvm.dbg.value(metadata i64 %x.addr.0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %d.0, metadata !17, metadata !DIExpression()), !dbg !14
  %conv = sext i32 %base to i64, !dbg !24
  %cmp = icmp sge i64 %x.addr.0, %conv, !dbg !26
  br i1 %cmp, label %for.body, label %for.end11, !dbg !27

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !14
  br label %for.cond2, !dbg !28

for.cond2:                                        ; preds = %for.inc, %for.body
  %d.1 = phi i32 [ 0, %for.body ], [ %conv7, %for.inc ], !dbg !30
  %x.addr.1 = phi i64 [ %x.addr.0, %for.body ], [ %div, %for.inc ]
  call void @llvm.dbg.value(metadata i64 %x.addr.1, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %d.1, metadata !17, metadata !DIExpression()), !dbg !14
  %tobool3 = icmp ne i64 %x.addr.1, 0, !dbg !31
  br i1 %tobool3, label %for.body4, label %for.end, !dbg !31

for.body4:                                        ; preds = %for.cond2
  br label %for.inc, !dbg !31

for.inc:                                          ; preds = %for.body4
  %conv5 = sext i32 %base to i64, !dbg !32
  %rem = srem i64 %x.addr.1, %conv5, !dbg !34
  %conv6 = sext i32 %d.1 to i64, !dbg !35
  %add = add nsw i64 %conv6, %rem, !dbg !35
  %conv7 = trunc i64 %add to i32, !dbg !35
  call void @llvm.dbg.value(metadata i32 %conv7, metadata !17, metadata !DIExpression()), !dbg !14
  %conv8 = sext i32 %base to i64, !dbg !36
  %div = sdiv i64 %x.addr.1, %conv8, !dbg !37
  call void @llvm.dbg.value(metadata i64 %div, metadata !13, metadata !DIExpression()), !dbg !14
  br label %for.cond2, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond2
  br label %for.inc9, !dbg !40

for.inc9:                                         ; preds = %for.end
  %conv10 = sext i32 %d.1 to i64, !dbg !41
  call void @llvm.dbg.value(metadata i64 %conv10, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %pers, align 4, !dbg !42
  %inc = add nsw i32 %0, 1, !dbg !42
  store i32 %inc, i32* %pers, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end11:                                        ; preds = %for.cond
  br label %if.end19, !dbg !45

if.else:                                          ; preds = %entry
  %tobool12 = icmp ne i64 %x, 0, !dbg !46
  br i1 %tobool12, label %land.lhs.true, label %if.end, !dbg !48

land.lhs.true:                                    ; preds = %if.else
  %sub = sub nsw i32 %base, 1, !dbg !49
  %conv13 = sext i32 %sub to i64, !dbg !50
  %rem14 = srem i64 %x, %conv13, !dbg !51
  %conv15 = trunc i64 %rem14 to i32, !dbg !52
  call void @llvm.dbg.value(metadata i32 %conv15, metadata !17, metadata !DIExpression()), !dbg !14
  %tobool16 = icmp ne i32 %conv15, 0, !dbg !53
  br i1 %tobool16, label %if.end, label %if.then17, !dbg !54

if.then17:                                        ; preds = %land.lhs.true
  %sub18 = sub nsw i32 %base, 1, !dbg !55
  call void @llvm.dbg.value(metadata i32 %sub18, metadata !17, metadata !DIExpression()), !dbg !14
  br label %if.end, !dbg !56

if.end:                                           ; preds = %if.then17, %land.lhs.true, %if.else
  %d.2 = phi i32 [ %conv15, %land.lhs.true ], [ %sub18, %if.then17 ], [ 0, %if.else ], !dbg !14
  call void @llvm.dbg.value(metadata i32 %d.2, metadata !17, metadata !DIExpression()), !dbg !14
  br label %if.end19

if.end19:                                         ; preds = %if.end, %for.end11
  %d.3 = phi i32 [ %d.0, %for.end11 ], [ %d.2, %if.end ], !dbg !14
  call void @llvm.dbg.value(metadata i32 %d.3, metadata !17, metadata !DIExpression()), !dbg !14
  ret i32 %d.3, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !58 {
entry:
  %pers = alloca i32, align 4
  %x = alloca [4 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %pers, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [4 x i64]* %x, metadata !63, metadata !DIExpression()), !dbg !67
  %0 = bitcast [4 x i64]* %x to i8*, !dbg !67
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i64]* @__const.main.x to i8*), i64 32, i1 false), !dbg !67
  call void @llvm.dbg.value(metadata i32 0, metadata !68, metadata !DIExpression()), !dbg !69
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !72
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !68, metadata !DIExpression()), !dbg !69
  %cmp = icmp slt i32 %i.0, 4, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !76
  %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* %x, i64 0, i64 %idxprom, !dbg !76
  %1 = load i64, i64* %arrayidx, align 8, !dbg !76
  %call = call i32 @droot(i64 %1, i32 10, i32* %pers), !dbg !78
  call void @llvm.dbg.value(metadata i32 %call, metadata !79, metadata !DIExpression()), !dbg !69
  %idxprom1 = sext i32 %i.0 to i64, !dbg !80
  %arrayidx2 = getelementptr inbounds [4 x i64], [4 x i64]* %x, i64 0, i64 %idxprom1, !dbg !80
  %2 = load i64, i64* %arrayidx2, align 8, !dbg !80
  %3 = load i32, i32* %pers, align 4, !dbg !81
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i64 %2, i32 %3, i32 %call), !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !84
  call void @llvm.dbg.value(metadata i32 %inc, metadata !68, metadata !DIExpression()), !dbg !69
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !88
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
!1 = !DIFile(filename: "digital-root.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Digital-root")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "droot", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10, !12}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!13 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 3, type: !11)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "base", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!16 = !DILocalVariable(name: "pers", arg: 3, scope: !7, file: !1, line: 3, type: !12)
!17 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 6, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 6)
!20 = !DILocation(line: 6, column: 6, scope: !7)
!21 = !DILocation(line: 7, column: 14, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 7, column: 3)
!23 = !DILocation(line: 7, column: 8, scope: !22)
!24 = !DILocation(line: 7, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 7, column: 3)
!26 = !DILocation(line: 7, column: 21, scope: !25)
!27 = !DILocation(line: 7, column: 3, scope: !22)
!28 = !DILocation(line: 8, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 8, column: 4)
!30 = !DILocation(line: 0, scope: !29)
!31 = !DILocation(line: 8, column: 4, scope: !29)
!32 = !DILocation(line: 8, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 8, column: 4)
!34 = !DILocation(line: 8, column: 26, scope: !33)
!35 = !DILocation(line: 8, column: 21, scope: !33)
!36 = !DILocation(line: 8, column: 39, scope: !33)
!37 = !DILocation(line: 8, column: 36, scope: !33)
!38 = !DILocation(line: 8, column: 4, scope: !33)
!39 = distinct !{!39, !31, !40}
!40 = !DILocation(line: 8, column: 44, scope: !29)
!41 = !DILocation(line: 7, column: 34, scope: !25)
!42 = !DILocation(line: 7, column: 44, scope: !25)
!43 = !DILocation(line: 7, column: 3, scope: !25)
!44 = distinct !{!44, !27, !45}
!45 = !DILocation(line: 8, column: 44, scope: !22)
!46 = !DILocation(line: 9, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !19, file: !1, line: 9, column: 11)
!48 = !DILocation(line: 9, column: 13, scope: !47)
!49 = !DILocation(line: 9, column: 32, scope: !47)
!50 = !DILocation(line: 9, column: 26, scope: !47)
!51 = !DILocation(line: 9, column: 24, scope: !47)
!52 = !DILocation(line: 9, column: 22, scope: !47)
!53 = !DILocation(line: 9, column: 20, scope: !47)
!54 = !DILocation(line: 9, column: 11, scope: !19)
!55 = !DILocation(line: 10, column: 13, scope: !47)
!56 = !DILocation(line: 10, column: 4, scope: !47)
!57 = !DILocation(line: 12, column: 2, scope: !7)
!58 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !59, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!10}
!61 = !DILocalVariable(name: "pers", scope: !58, file: !1, line: 17, type: !10)
!62 = !DILocation(line: 17, column: 12, scope: !58)
!63 = !DILocalVariable(name: "x", scope: !58, file: !1, line: 18, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 4)
!67 = !DILocation(line: 18, column: 12, scope: !58)
!68 = !DILocalVariable(name: "i", scope: !58, file: !1, line: 17, type: !10)
!69 = !DILocation(line: 0, scope: !58)
!70 = !DILocation(line: 20, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !58, file: !1, line: 20, column: 2)
!72 = !DILocation(line: 0, scope: !71)
!73 = !DILocation(line: 20, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !1, line: 20, column: 2)
!75 = !DILocation(line: 20, column: 2, scope: !71)
!76 = !DILocation(line: 21, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 20, column: 26)
!78 = !DILocation(line: 21, column: 7, scope: !77)
!79 = !DILocalVariable(name: "d", scope: !58, file: !1, line: 17, type: !10)
!80 = !DILocation(line: 22, column: 38, scope: !77)
!81 = !DILocation(line: 22, column: 44, scope: !77)
!82 = !DILocation(line: 22, column: 3, scope: !77)
!83 = !DILocation(line: 23, column: 2, scope: !77)
!84 = !DILocation(line: 20, column: 22, scope: !74)
!85 = !DILocation(line: 20, column: 2, scope: !74)
!86 = distinct !{!86, !75, !87}
!87 = !DILocation(line: 23, column: 2, scope: !71)
!88 = !DILocation(line: 25, column: 2, scope: !58)
