; ModuleID = 'crc-32-2.ll'
source_filename = "crc-32-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@rc_crc32.table = internal global [256 x i32] zeroinitializer, align 16, !dbg !0
@rc_crc32.have_table = internal global i32 0, align 4, !dbg !20
@.str = private unnamed_addr constant [44 x i8] c"The quick brown fox jumps over the lazy dog\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%X\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rc_crc32(i32 %crc, i8* %buf, i64 %len) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i32 %crc, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i8* %buf, metadata !32, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i64 %len, metadata !33, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* @rc_crc32.have_table, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.end10, !dbg !37

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc7, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc8, %for.inc7 ], !dbg !42
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !38, metadata !DIExpression()), !dbg !31
  %cmp1 = icmp slt i32 %i.0, 256, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end9, !dbg !45

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !46, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 0, metadata !47, metadata !DIExpression()), !dbg !31
  br label %for.cond2, !dbg !48

for.cond2:                                        ; preds = %for.inc, %for.body
  %rem.0 = phi i32 [ %i.0, %for.body ], [ %rem.1, %for.inc ], !dbg !51
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !52
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !47, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %rem.0, metadata !46, metadata !DIExpression()), !dbg !31
  %cmp3 = icmp slt i32 %j.0, 8, !dbg !53
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !55

for.body4:                                        ; preds = %for.cond2
  %and = and i32 %rem.0, 1, !dbg !56
  %tobool = icmp ne i32 %and, 0, !dbg !56
  br i1 %tobool, label %if.then5, label %if.else, !dbg !59

if.then5:                                         ; preds = %for.body4
  %shr = lshr i32 %rem.0, 1, !dbg !60
  call void @llvm.dbg.value(metadata i32 %shr, metadata !46, metadata !DIExpression()), !dbg !31
  %xor = xor i32 %shr, -306674912, !dbg !62
  call void @llvm.dbg.value(metadata i32 %xor, metadata !46, metadata !DIExpression()), !dbg !31
  br label %if.end, !dbg !63

if.else:                                          ; preds = %for.body4
  %shr6 = lshr i32 %rem.0, 1, !dbg !64
  call void @llvm.dbg.value(metadata i32 %shr6, metadata !46, metadata !DIExpression()), !dbg !31
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  %rem.1 = phi i32 [ %xor, %if.then5 ], [ %shr6, %if.else ], !dbg !65
  call void @llvm.dbg.value(metadata i32 %rem.1, metadata !46, metadata !DIExpression()), !dbg !31
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %j.0, 1, !dbg !67
  call void @llvm.dbg.value(metadata i32 %inc, metadata !47, metadata !DIExpression()), !dbg !31
  br label %for.cond2, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64, !dbg !71
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @rc_crc32.table, i64 0, i64 %idxprom, !dbg !71
  store i32 %rem.0, i32* %arrayidx, align 4, !dbg !72
  br label %for.inc7, !dbg !73

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %i.0, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %inc8, metadata !38, metadata !DIExpression()), !dbg !31
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end9:                                         ; preds = %for.cond
  store i32 1, i32* @rc_crc32.have_table, align 4, !dbg !78
  br label %if.end10, !dbg !79

if.end10:                                         ; preds = %for.end9, %entry
  %neg = xor i32 %crc, -1, !dbg !80
  call void @llvm.dbg.value(metadata i32 %neg, metadata !30, metadata !DIExpression()), !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %buf, i64 %len, !dbg !81
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !82, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i8* %buf, metadata !83, metadata !DIExpression()), !dbg !31
  br label %for.cond11, !dbg !84

for.cond11:                                       ; preds = %for.inc20, %if.end10
  %p.0 = phi i8* [ %buf, %if.end10 ], [ %incdec.ptr, %for.inc20 ], !dbg !86
  %crc.addr.0 = phi i32 [ %neg, %if.end10 ], [ %xor19, %for.inc20 ], !dbg !31
  call void @llvm.dbg.value(metadata i32 %crc.addr.0, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i8* %p.0, metadata !83, metadata !DIExpression()), !dbg !31
  %cmp12 = icmp ult i8* %p.0, %add.ptr, !dbg !87
  br i1 %cmp12, label %for.body13, label %for.end21, !dbg !89

for.body13:                                       ; preds = %for.cond11
  %1 = load i8, i8* %p.0, align 1, !dbg !90
  call void @llvm.dbg.value(metadata i8 %1, metadata !92, metadata !DIExpression()), !dbg !31
  %shr14 = lshr i32 %crc.addr.0, 8, !dbg !96
  %and15 = and i32 %crc.addr.0, 255, !dbg !97
  %conv = zext i8 %1 to i32, !dbg !98
  %xor16 = xor i32 %and15, %conv, !dbg !99
  %idxprom17 = zext i32 %xor16 to i64, !dbg !100
  %arrayidx18 = getelementptr inbounds [256 x i32], [256 x i32]* @rc_crc32.table, i64 0, i64 %idxprom17, !dbg !100
  %2 = load i32, i32* %arrayidx18, align 4, !dbg !100
  %xor19 = xor i32 %shr14, %2, !dbg !101
  call void @llvm.dbg.value(metadata i32 %xor19, metadata !30, metadata !DIExpression()), !dbg !31
  br label %for.inc20, !dbg !102

for.inc20:                                        ; preds = %for.body13
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0, i32 1, !dbg !103
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !83, metadata !DIExpression()), !dbg !31
  br label %for.cond11, !dbg !104, !llvm.loop !105

for.end21:                                        ; preds = %for.cond11
  %neg22 = xor i32 %crc.addr.0, -1, !dbg !107
  ret i32 %neg22, !dbg !108
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !109 {
entry:
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @strlen(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0)) #4, !dbg !114
  %call1 = call i32 @rc_crc32(i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i64 %call), !dbg !115
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call1), !dbg !116
  ret i32 0, !dbg !117
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "table", scope: !2, file: !3, line: 8, type: !23, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "rc_crc32", scope: !3, file: !3, line: 6, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !18)
!3 = !DIFile(filename: "crc-32-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/CRC-32-2")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !11, !14}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 26, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !16)
!15 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!16 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, globals: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !{}
!19 = !{!0, !20}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "have_table", scope: !2, file: !3, line: 9, type: !22, isLocal: true, isDefinition: true)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 256)
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!30 = !DILocalVariable(name: "crc", arg: 1, scope: !2, file: !3, line: 6, type: !6)
!31 = !DILocation(line: 0, scope: !2)
!32 = !DILocalVariable(name: "buf", arg: 2, scope: !2, file: !3, line: 6, type: !11)
!33 = !DILocalVariable(name: "len", arg: 3, scope: !2, file: !3, line: 6, type: !14)
!34 = !DILocation(line: 16, column: 6, scope: !35)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 16, column: 6)
!36 = !DILocation(line: 16, column: 17, scope: !35)
!37 = !DILocation(line: 16, column: 6, scope: !2)
!38 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 12, type: !22)
!39 = !DILocation(line: 18, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !3, line: 18, column: 3)
!41 = distinct !DILexicalBlock(scope: !35, file: !3, line: 16, column: 23)
!42 = !DILocation(line: 0, scope: !40)
!43 = !DILocation(line: 18, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !3, line: 18, column: 3)
!45 = !DILocation(line: 18, column: 3, scope: !40)
!46 = !DILocalVariable(name: "rem", scope: !2, file: !3, line: 10, type: !6)
!47 = !DILocalVariable(name: "j", scope: !2, file: !3, line: 12, type: !22)
!48 = !DILocation(line: 20, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !3, line: 20, column: 4)
!50 = distinct !DILexicalBlock(scope: !44, file: !3, line: 18, column: 29)
!51 = !DILocation(line: 0, scope: !50)
!52 = !DILocation(line: 0, scope: !49)
!53 = !DILocation(line: 20, column: 18, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !3, line: 20, column: 4)
!55 = !DILocation(line: 20, column: 4, scope: !49)
!56 = !DILocation(line: 21, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !3, line: 21, column: 9)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 20, column: 28)
!59 = !DILocation(line: 21, column: 9, scope: !58)
!60 = !DILocation(line: 22, column: 10, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 21, column: 18)
!62 = !DILocation(line: 23, column: 10, scope: !61)
!63 = !DILocation(line: 24, column: 5, scope: !61)
!64 = !DILocation(line: 25, column: 10, scope: !57)
!65 = !DILocation(line: 0, scope: !57)
!66 = !DILocation(line: 26, column: 4, scope: !58)
!67 = !DILocation(line: 20, column: 24, scope: !54)
!68 = !DILocation(line: 20, column: 4, scope: !54)
!69 = distinct !{!69, !55, !70}
!70 = !DILocation(line: 26, column: 4, scope: !49)
!71 = !DILocation(line: 27, column: 4, scope: !50)
!72 = !DILocation(line: 27, column: 13, scope: !50)
!73 = !DILocation(line: 28, column: 3, scope: !50)
!74 = !DILocation(line: 18, column: 25, scope: !44)
!75 = !DILocation(line: 18, column: 3, scope: !44)
!76 = distinct !{!76, !45, !77}
!77 = !DILocation(line: 28, column: 3, scope: !40)
!78 = !DILocation(line: 29, column: 14, scope: !41)
!79 = !DILocation(line: 30, column: 2, scope: !41)
!80 = !DILocation(line: 32, column: 8, scope: !2)
!81 = !DILocation(line: 33, column: 10, scope: !2)
!82 = !DILocalVariable(name: "q", scope: !2, file: !3, line: 13, type: !11)
!83 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 13, type: !11)
!84 = !DILocation(line: 34, column: 7, scope: !85)
!85 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 2)
!86 = !DILocation(line: 0, scope: !85)
!87 = !DILocation(line: 34, column: 18, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 34, column: 2)
!89 = !DILocation(line: 34, column: 2, scope: !85)
!90 = !DILocation(line: 35, column: 11, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !3, line: 34, column: 28)
!92 = !DILocalVariable(name: "octet", scope: !2, file: !3, line: 11, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !95)
!95 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!96 = !DILocation(line: 36, column: 14, scope: !91)
!97 = !DILocation(line: 36, column: 33, scope: !91)
!98 = !DILocation(line: 36, column: 43, scope: !91)
!99 = !DILocation(line: 36, column: 41, scope: !91)
!100 = !DILocation(line: 36, column: 22, scope: !91)
!101 = !DILocation(line: 36, column: 20, scope: !91)
!102 = !DILocation(line: 37, column: 2, scope: !91)
!103 = !DILocation(line: 34, column: 24, scope: !88)
!104 = !DILocation(line: 34, column: 2, scope: !88)
!105 = distinct !{!105, !89, !106}
!106 = !DILocation(line: 37, column: 2, scope: !85)
!107 = !DILocation(line: 38, column: 9, scope: !2)
!108 = !DILocation(line: 38, column: 2, scope: !2)
!109 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 42, type: !110, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !18)
!110 = !DISubroutineType(types: !111)
!111 = !{!22}
!112 = !DILocalVariable(name: "s", scope: !109, file: !3, line: 44, type: !11)
!113 = !DILocation(line: 0, scope: !109)
!114 = !DILocation(line: 45, column: 41, scope: !109)
!115 = !DILocation(line: 45, column: 26, scope: !109)
!116 = !DILocation(line: 45, column: 2, scope: !109)
!117 = !DILocation(line: 47, column: 2, scope: !109)
