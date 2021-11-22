; ModuleID = 'crc-32-2.c'
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
  %crc.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %rem = alloca i32, align 4
  %octet = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i8*, align 8
  %q = alloca i8*, align 8
  store i32 %crc, i32* %crc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %crc.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %rem, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8* %octet, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %j, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8** %p, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %q, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32, i32* @rc_crc32.have_table, align 4, !dbg !51
  %cmp = icmp eq i32 %0, 0, !dbg !53
  br i1 %cmp, label %if.then, label %if.end10, !dbg !54, !cf.info !55

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc7, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !60
  %cmp1 = icmp slt i32 %1, 256, !dbg !62
  br i1 %cmp1, label %for.body, label %for.end9, !dbg !63

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !64
  store i32 %2, i32* %rem, align 4, !dbg !66
  store i32 0, i32* %j, align 4, !dbg !67
  br label %for.cond2, !dbg !69

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !70
  %cmp3 = icmp slt i32 %3, 8, !dbg !72
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !73

for.body4:                                        ; preds = %for.cond2
  %4 = load i32, i32* %rem, align 4, !dbg !74
  %and = and i32 %4, 1, !dbg !77
  %tobool = icmp ne i32 %and, 0, !dbg !77
  br i1 %tobool, label %if.then5, label %if.else, !dbg !78, !cf.info !55

if.then5:                                         ; preds = %for.body4
  %5 = load i32, i32* %rem, align 4, !dbg !79
  %shr = lshr i32 %5, 1, !dbg !79
  store i32 %shr, i32* %rem, align 4, !dbg !79
  %6 = load i32, i32* %rem, align 4, !dbg !81
  %xor = xor i32 %6, -306674912, !dbg !81
  store i32 %xor, i32* %rem, align 4, !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %for.body4
  %7 = load i32, i32* %rem, align 4, !dbg !83
  %shr6 = lshr i32 %7, 1, !dbg !83
  store i32 %shr6, i32* %rem, align 4, !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %j, align 4, !dbg !85
  %inc = add nsw i32 %8, 1, !dbg !85
  store i32 %inc, i32* %j, align 4, !dbg !85
  br label %for.cond2, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond2
  %9 = load i32, i32* %rem, align 4, !dbg !89
  %10 = load i32, i32* %i, align 4, !dbg !90
  %idxprom = sext i32 %10 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @rc_crc32.table, i64 0, i64 %idxprom, !dbg !91
  store i32 %9, i32* %arrayidx, align 4, !dbg !92
  br label %for.inc7, !dbg !93

for.inc7:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !94
  %inc8 = add nsw i32 %11, 1, !dbg !94
  store i32 %inc8, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end9:                                         ; preds = %for.cond
  store i32 1, i32* @rc_crc32.have_table, align 4, !dbg !98
  br label %if.end10, !dbg !99

if.end10:                                         ; preds = %for.end9, %entry
  %12 = load i32, i32* %crc.addr, align 4, !dbg !100
  %neg = xor i32 %12, -1, !dbg !101
  store i32 %neg, i32* %crc.addr, align 4, !dbg !102
  %13 = load i8*, i8** %buf.addr, align 8, !dbg !103
  %14 = load i64, i64* %len.addr, align 8, !dbg !104
  %add.ptr = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !105
  store i8* %add.ptr, i8** %q, align 8, !dbg !106
  %15 = load i8*, i8** %buf.addr, align 8, !dbg !107
  store i8* %15, i8** %p, align 8, !dbg !109
  br label %for.cond11, !dbg !110

for.cond11:                                       ; preds = %for.inc20, %if.end10
  %16 = load i8*, i8** %p, align 8, !dbg !111
  %17 = load i8*, i8** %q, align 8, !dbg !113
  %cmp12 = icmp ult i8* %16, %17, !dbg !114
  br i1 %cmp12, label %for.body13, label %for.end21, !dbg !115

for.body13:                                       ; preds = %for.cond11
  %18 = load i8*, i8** %p, align 8, !dbg !116
  %19 = load i8, i8* %18, align 1, !dbg !118
  store i8 %19, i8* %octet, align 1, !dbg !119
  %20 = load i32, i32* %crc.addr, align 4, !dbg !120
  %shr14 = lshr i32 %20, 8, !dbg !121
  %21 = load i32, i32* %crc.addr, align 4, !dbg !122
  %and15 = and i32 %21, 255, !dbg !123
  %22 = load i8, i8* %octet, align 1, !dbg !124
  %conv = zext i8 %22 to i32, !dbg !124
  %xor16 = xor i32 %and15, %conv, !dbg !125
  %idxprom17 = zext i32 %xor16 to i64, !dbg !126
  %arrayidx18 = getelementptr inbounds [256 x i32], [256 x i32]* @rc_crc32.table, i64 0, i64 %idxprom17, !dbg !126
  %23 = load i32, i32* %arrayidx18, align 4, !dbg !126
  %xor19 = xor i32 %shr14, %23, !dbg !127
  store i32 %xor19, i32* %crc.addr, align 4, !dbg !128
  br label %for.inc20, !dbg !129

for.inc20:                                        ; preds = %for.body13
  %24 = load i8*, i8** %p, align 8, !dbg !130
  %incdec.ptr = getelementptr inbounds i8, i8* %24, i32 1, !dbg !130
  store i8* %incdec.ptr, i8** %p, align 8, !dbg !130
  br label %for.cond11, !dbg !131, !llvm.loop !132

for.end21:                                        ; preds = %for.cond11
  %25 = load i32, i32* %crc.addr, align 4, !dbg !134
  %neg22 = xor i32 %25, -1, !dbg !135
  ret i32 %neg22, !dbg !136
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !137 {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %s, metadata !140, metadata !DIExpression()), !dbg !141
  store i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i8** %s, align 8, !dbg !141
  %0 = load i8*, i8** %s, align 8, !dbg !142
  %1 = load i8*, i8** %s, align 8, !dbg !143
  %call = call i64 @strlen(i8* %1) #4, !dbg !144
  %call1 = call i32 @rc_crc32(i32 0, i8* %0, i64 %call), !dbg !145
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call1), !dbg !146
  ret i32 0, !dbg !147
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

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
!3 = !DIFile(filename: "crc-32-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/CRC-32")
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
!15 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!16 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, globals: !19, splitDebugInlining: false, nameTableKind: None)
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
!29 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!30 = !DILocalVariable(name: "crc", arg: 1, scope: !2, file: !3, line: 6, type: !6)
!31 = !DILocation(line: 6, column: 19, scope: !2)
!32 = !DILocalVariable(name: "buf", arg: 2, scope: !2, file: !3, line: 6, type: !11)
!33 = !DILocation(line: 6, column: 36, scope: !2)
!34 = !DILocalVariable(name: "len", arg: 3, scope: !2, file: !3, line: 6, type: !14)
!35 = !DILocation(line: 6, column: 48, scope: !2)
!36 = !DILocalVariable(name: "rem", scope: !2, file: !3, line: 10, type: !6)
!37 = !DILocation(line: 10, column: 11, scope: !2)
!38 = !DILocalVariable(name: "octet", scope: !2, file: !3, line: 11, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !7, line: 24, baseType: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !41)
!41 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!42 = !DILocation(line: 11, column: 10, scope: !2)
!43 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 12, type: !22)
!44 = !DILocation(line: 12, column: 6, scope: !2)
!45 = !DILocalVariable(name: "j", scope: !2, file: !3, line: 12, type: !22)
!46 = !DILocation(line: 12, column: 9, scope: !2)
!47 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 13, type: !11)
!48 = !DILocation(line: 13, column: 14, scope: !2)
!49 = !DILocalVariable(name: "q", scope: !2, file: !3, line: 13, type: !11)
!50 = !DILocation(line: 13, column: 18, scope: !2)
!51 = !DILocation(line: 16, column: 6, scope: !52)
!52 = distinct !DILexicalBlock(scope: !2, file: !3, line: 16, column: 6)
!53 = !DILocation(line: 16, column: 17, scope: !52)
!54 = !DILocation(line: 16, column: 6, scope: !2)
!55 = !{!"if"}
!56 = !DILocation(line: 18, column: 10, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !3, line: 18, column: 3)
!58 = distinct !DILexicalBlock(scope: !52, file: !3, line: 16, column: 23)
!59 = !DILocation(line: 18, column: 8, scope: !57)
!60 = !DILocation(line: 18, column: 15, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 18, column: 3)
!62 = !DILocation(line: 18, column: 17, scope: !61)
!63 = !DILocation(line: 18, column: 3, scope: !57)
!64 = !DILocation(line: 19, column: 10, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !3, line: 18, column: 29)
!66 = !DILocation(line: 19, column: 8, scope: !65)
!67 = !DILocation(line: 20, column: 11, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !3, line: 20, column: 4)
!69 = !DILocation(line: 20, column: 9, scope: !68)
!70 = !DILocation(line: 20, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !3, line: 20, column: 4)
!72 = !DILocation(line: 20, column: 18, scope: !71)
!73 = !DILocation(line: 20, column: 4, scope: !68)
!74 = !DILocation(line: 21, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !3, line: 21, column: 9)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 20, column: 28)
!77 = !DILocation(line: 21, column: 13, scope: !75)
!78 = !DILocation(line: 21, column: 9, scope: !76)
!79 = !DILocation(line: 22, column: 10, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 21, column: 18)
!81 = !DILocation(line: 23, column: 10, scope: !80)
!82 = !DILocation(line: 24, column: 5, scope: !80)
!83 = !DILocation(line: 25, column: 10, scope: !75)
!84 = !DILocation(line: 26, column: 4, scope: !76)
!85 = !DILocation(line: 20, column: 24, scope: !71)
!86 = !DILocation(line: 20, column: 4, scope: !71)
!87 = distinct !{!87, !73, !88}
!88 = !DILocation(line: 26, column: 4, scope: !68)
!89 = !DILocation(line: 27, column: 15, scope: !65)
!90 = !DILocation(line: 27, column: 10, scope: !65)
!91 = !DILocation(line: 27, column: 4, scope: !65)
!92 = !DILocation(line: 27, column: 13, scope: !65)
!93 = !DILocation(line: 28, column: 3, scope: !65)
!94 = !DILocation(line: 18, column: 25, scope: !61)
!95 = !DILocation(line: 18, column: 3, scope: !61)
!96 = distinct !{!96, !63, !97}
!97 = !DILocation(line: 28, column: 3, scope: !57)
!98 = !DILocation(line: 29, column: 14, scope: !58)
!99 = !DILocation(line: 30, column: 2, scope: !58)
!100 = !DILocation(line: 32, column: 9, scope: !2)
!101 = !DILocation(line: 32, column: 8, scope: !2)
!102 = !DILocation(line: 32, column: 6, scope: !2)
!103 = !DILocation(line: 33, column: 6, scope: !2)
!104 = !DILocation(line: 33, column: 12, scope: !2)
!105 = !DILocation(line: 33, column: 10, scope: !2)
!106 = !DILocation(line: 33, column: 4, scope: !2)
!107 = !DILocation(line: 34, column: 11, scope: !108)
!108 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 2)
!109 = !DILocation(line: 34, column: 9, scope: !108)
!110 = !DILocation(line: 34, column: 7, scope: !108)
!111 = !DILocation(line: 34, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !3, line: 34, column: 2)
!113 = !DILocation(line: 34, column: 20, scope: !112)
!114 = !DILocation(line: 34, column: 18, scope: !112)
!115 = !DILocation(line: 34, column: 2, scope: !108)
!116 = !DILocation(line: 35, column: 12, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !3, line: 34, column: 28)
!118 = !DILocation(line: 35, column: 11, scope: !117)
!119 = !DILocation(line: 35, column: 9, scope: !117)
!120 = !DILocation(line: 36, column: 10, scope: !117)
!121 = !DILocation(line: 36, column: 14, scope: !117)
!122 = !DILocation(line: 36, column: 29, scope: !117)
!123 = !DILocation(line: 36, column: 33, scope: !117)
!124 = !DILocation(line: 36, column: 43, scope: !117)
!125 = !DILocation(line: 36, column: 41, scope: !117)
!126 = !DILocation(line: 36, column: 22, scope: !117)
!127 = !DILocation(line: 36, column: 20, scope: !117)
!128 = !DILocation(line: 36, column: 7, scope: !117)
!129 = !DILocation(line: 37, column: 2, scope: !117)
!130 = !DILocation(line: 34, column: 24, scope: !112)
!131 = !DILocation(line: 34, column: 2, scope: !112)
!132 = distinct !{!132, !115, !133}
!133 = !DILocation(line: 37, column: 2, scope: !108)
!134 = !DILocation(line: 38, column: 10, scope: !2)
!135 = !DILocation(line: 38, column: 9, scope: !2)
!136 = !DILocation(line: 38, column: 2, scope: !2)
!137 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 42, type: !138, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !18)
!138 = !DISubroutineType(types: !139)
!139 = !{!22}
!140 = !DILocalVariable(name: "s", scope: !137, file: !3, line: 44, type: !11)
!141 = !DILocation(line: 44, column: 14, scope: !137)
!142 = !DILocation(line: 45, column: 38, scope: !137)
!143 = !DILocation(line: 45, column: 48, scope: !137)
!144 = !DILocation(line: 45, column: 41, scope: !137)
!145 = !DILocation(line: 45, column: 26, scope: !137)
!146 = !DILocation(line: 45, column: 2, scope: !137)
!147 = !DILocation(line: 47, column: 2, scope: !137)
