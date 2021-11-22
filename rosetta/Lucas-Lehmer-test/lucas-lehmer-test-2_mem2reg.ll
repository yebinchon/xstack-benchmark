; ModuleID = 'lucas-lehmer-test-2.ll'
source_filename = "lucas-lehmer-test-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c" Mersenne primes:\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c" M%u\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_prime(i32 %p) #0 !dbg !12 {
entry:
  call void @llvm.dbg.value(metadata i32 %p, metadata !18, metadata !DIExpression()), !dbg !19
  %cmp = icmp eq i32 %p, 2, !dbg !20
  br i1 %cmp, label %if.then, label %if.else, !dbg !22, !cf.info !23

if.then:                                          ; preds = %entry
  br label %return, !dbg !24

if.else:                                          ; preds = %entry
  %cmp1 = icmp sle i32 %p, 1, !dbg !25
  br i1 %cmp1, label %if.then3, label %lor.lhs.false, !dbg !27, !cf.info !23

lor.lhs.false:                                    ; preds = %if.else
  %rem = srem i32 %p, 2, !dbg !28
  %cmp2 = icmp eq i32 %rem, 0, !dbg !29
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !30, !cf.info !23

if.then3:                                         ; preds = %lor.lhs.false, %if.else
  br label %return, !dbg !31

if.else4:                                         ; preds = %lor.lhs.false
  call void @llvm.dbg.value(metadata i32 1, metadata !32, metadata !DIExpression()), !dbg !34
  %conv = sitofp i32 %p to double, !dbg !35
  %call = call double @sqrt(double %conv) #4, !dbg !36
  %conv5 = fptosi double %call to i32, !dbg !36
  call void @llvm.dbg.value(metadata i32 %conv5, metadata !37, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32 3, metadata !39, metadata !DIExpression()), !dbg !34
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.else4
  %prime.0 = phi i32 [ 1, %if.else4 ], [ %rem8, %for.inc ], !dbg !34
  %i.0 = phi i32 [ 3, %if.else4 ], [ %add, %for.inc ], !dbg !42
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !39, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata i32 %prime.0, metadata !32, metadata !DIExpression()), !dbg !34
  %cmp6 = icmp sle i32 %i.0, %conv5, !dbg !43
  br i1 %cmp6, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %rem8 = srem i32 %p, %i.0, !dbg !46
  call void @llvm.dbg.value(metadata i32 %rem8, metadata !32, metadata !DIExpression()), !dbg !34
  %tobool = icmp ne i32 %rem8, 0, !dbg !48
  br i1 %tobool, label %if.end, label %if.then9, !dbg !49, !cf.info !23

if.then9:                                         ; preds = %for.body
  br label %for.end, !dbg !50

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %add = add nsw i32 %i.0, 2, !dbg !52
  call void @llvm.dbg.value(metadata i32 %add, metadata !39, metadata !DIExpression()), !dbg !34
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %if.then9, %for.cond
  %prime.1 = phi i32 [ %rem8, %if.then9 ], [ %prime.0, %for.cond ], !dbg !34
  call void @llvm.dbg.value(metadata i32 %prime.1, metadata !32, metadata !DIExpression()), !dbg !34
  br label %return, !dbg !56

return:                                           ; preds = %for.end, %if.then3, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.then3 ], [ %prime.1, %for.end ], !dbg !57
  ret i32 %retval.0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_mersenne_prime(i32 %p) #0 !dbg !59 {
entry:
  call void @llvm.dbg.value(metadata i32 %p, metadata !60, metadata !DIExpression()), !dbg !61
  %cmp = icmp eq i32 %p, 2, !dbg !62
  br i1 %cmp, label %if.then, label %if.else, !dbg !64, !cf.info !23

if.then:                                          ; preds = %entry
  br label %return, !dbg !65

if.else:                                          ; preds = %entry
  %sh_prom = zext i32 %p to i64, !dbg !66
  %shl = shl i64 1, %sh_prom, !dbg !66
  %sub = sub i64 %shl, 1, !dbg !68
  call void @llvm.dbg.value(metadata i64 %sub, metadata !69, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i64 4, metadata !73, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i32 3, metadata !74, metadata !DIExpression()), !dbg !72
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %if.else
  %s.0 = phi i64 [ 4, %if.else ], [ %rem, %for.inc ], !dbg !72
  %i.0 = phi i32 [ 3, %if.else ], [ %inc, %for.inc ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !74, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i64 %s.0, metadata !73, metadata !DIExpression()), !dbg !72
  %cmp1 = icmp sle i32 %i.0, %p, !dbg !78
  br i1 %cmp1, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %mul = mul i64 %s.0, %s.0, !dbg !81
  %sub2 = sub i64 %mul, 2, !dbg !83
  %rem = urem i64 %sub2, %sub, !dbg !84
  call void @llvm.dbg.value(metadata i64 %rem, metadata !73, metadata !DIExpression()), !dbg !72
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !86
  call void @llvm.dbg.value(metadata i32 %inc, metadata !74, metadata !DIExpression()), !dbg !72
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %cmp3 = icmp eq i64 %s.0, 0, !dbg !90
  %conv = zext i1 %cmp3 to i32, !dbg !90
  br label %return, !dbg !91

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ %conv, %for.end ], !dbg !92
  ret i32 %retval.0, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i8** %argv, metadata !102, metadata !DIExpression()), !dbg !101
  %call = call x86_fp80 @log2l(x86_fp80 0xK403EFFFFFFFFFFFFFFFF) #4, !dbg !103
  %div = fdiv x86_fp80 %call, 0xK40008000000000000000, !dbg !104
  %conv = fptosi x86_fp80 %div to i32, !dbg !103
  call void @llvm.dbg.value(metadata i32 %conv, metadata !105, metadata !DIExpression()), !dbg !101
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @llvm.dbg.value(metadata i32 2, metadata !107, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %p.0 = phi i32 [ 2, %entry ], [ %add, %for.inc ], !dbg !110
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !107, metadata !DIExpression()), !dbg !101
  %cmp = icmp sle i32 %p.0, %conv, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %call3 = call i32 @is_prime(i32 %p.0), !dbg !114
  %tobool = icmp ne i32 %call3, 0, !dbg !114
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !117, !cf.info !23

land.lhs.true:                                    ; preds = %for.body
  %call4 = call i32 @is_mersenne_prime(i32 %p.0), !dbg !118
  %tobool5 = icmp ne i32 %call4, 0, !dbg !118
  br i1 %tobool5, label %if.then, label %if.end, !dbg !119, !cf.info !23

if.then:                                          ; preds = %land.lhs.true
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %p.0), !dbg !120
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %if.end
  %add = add nsw i32 %p.0, 1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %add, metadata !107, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local x86_fp80 @log2l(x86_fp80) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "lucas-lehmer-test-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Lucas-Lehmer-test")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !1, line: 6, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7}
!6 = !DIEnumerator(name: "FALSE", value: 0, isUnsigned: true)
!7 = !DIEnumerator(name: "TRUE", value: 1, isUnsigned: true)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!12 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 8, type: !13, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !16}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "BOOL", file: !1, line: 6, baseType: !3)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{}
!18 = !DILocalVariable(name: "p", arg: 1, scope: !12, file: !1, line: 8, type: !16)
!19 = !DILocation(line: 0, scope: !12)
!20 = !DILocation(line: 9, column: 9, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !1, line: 9, column: 7)
!22 = !DILocation(line: 9, column: 7, scope: !12)
!23 = !{!"if"}
!24 = !DILocation(line: 9, column: 16, scope: !21)
!25 = !DILocation(line: 10, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !21, file: !1, line: 10, column: 12)
!27 = !DILocation(line: 10, column: 19, scope: !26)
!28 = !DILocation(line: 10, column: 24, scope: !26)
!29 = !DILocation(line: 10, column: 28, scope: !26)
!30 = !DILocation(line: 10, column: 12, scope: !21)
!31 = !DILocation(line: 10, column: 35, scope: !26)
!32 = !DILocalVariable(name: "prime", scope: !33, file: !1, line: 12, type: !15)
!33 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 8)
!34 = !DILocation(line: 0, scope: !33)
!35 = !DILocation(line: 13, column: 25, scope: !33)
!36 = !DILocation(line: 13, column: 20, scope: !33)
!37 = !DILocalVariable(name: "to", scope: !33, file: !1, line: 13, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!39 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 14, type: !16)
!40 = !DILocation(line: 15, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !1, line: 15, column: 5)
!42 = !DILocation(line: 0, scope: !41)
!43 = !DILocation(line: 15, column: 18, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 5)
!45 = !DILocation(line: 15, column: 5, scope: !41)
!46 = !DILocation(line: 16, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 16, column: 11)
!48 = !DILocation(line: 16, column: 19, scope: !47)
!49 = !DILocation(line: 16, column: 11, scope: !44)
!50 = !DILocation(line: 16, column: 28, scope: !47)
!51 = !DILocation(line: 16, column: 26, scope: !47)
!52 = !DILocation(line: 15, column: 26, scope: !44)
!53 = !DILocation(line: 15, column: 5, scope: !44)
!54 = distinct !{!54, !45, !55}
!55 = !DILocation(line: 16, column: 28, scope: !41)
!56 = !DILocation(line: 17, column: 5, scope: !33)
!57 = !DILocation(line: 0, scope: !21)
!58 = !DILocation(line: 19, column: 1, scope: !12)
!59 = distinct !DISubprogram(name: "is_mersenne_prime", scope: !1, file: !1, line: 21, type: !13, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocalVariable(name: "p", arg: 1, scope: !59, file: !1, line: 21, type: !16)
!61 = !DILocation(line: 0, scope: !59)
!62 = !DILocation(line: 22, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 22, column: 7)
!64 = !DILocation(line: 22, column: 7, scope: !59)
!65 = !DILocation(line: 22, column: 16, scope: !63)
!66 = !DILocation(line: 24, column: 43, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 23, column: 8)
!68 = !DILocation(line: 24, column: 50, scope: !67)
!69 = !DILocalVariable(name: "m_p", scope: !67, file: !1, line: 24, type: !70)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!71 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocation(line: 0, scope: !67)
!73 = !DILocalVariable(name: "s", scope: !67, file: !1, line: 25, type: !71)
!74 = !DILocalVariable(name: "i", scope: !67, file: !1, line: 26, type: !16)
!75 = !DILocation(line: 27, column: 10, scope: !76)
!76 = distinct !DILexicalBlock(scope: !67, file: !1, line: 27, column: 5)
!77 = !DILocation(line: 0, scope: !76)
!78 = !DILocation(line: 27, column: 19, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 27, column: 5)
!80 = !DILocation(line: 27, column: 5, scope: !76)
!81 = !DILocation(line: 28, column: 14, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 27, column: 29)
!83 = !DILocation(line: 28, column: 18, scope: !82)
!84 = !DILocation(line: 28, column: 23, scope: !82)
!85 = !DILocation(line: 29, column: 5, scope: !82)
!86 = !DILocation(line: 27, column: 26, scope: !79)
!87 = !DILocation(line: 27, column: 5, scope: !79)
!88 = distinct !{!88, !80, !89}
!89 = !DILocation(line: 29, column: 5, scope: !76)
!90 = !DILocation(line: 30, column: 14, scope: !67)
!91 = !DILocation(line: 30, column: 5, scope: !67)
!92 = !DILocation(line: 0, scope: !63)
!93 = !DILocation(line: 32, column: 1, scope: !59)
!94 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 34, type: !95, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!95 = !DISubroutineType(types: !96)
!96 = !{!16, !16, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !1, line: 34, type: !16)
!101 = !DILocation(line: 0, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !1, line: 34, type: !97)
!103 = !DILocation(line: 36, column: 19, scope: !94)
!104 = !DILocation(line: 36, column: 36, scope: !94)
!105 = !DILocalVariable(name: "upb", scope: !94, file: !1, line: 36, type: !38)
!106 = !DILocation(line: 38, column: 3, scope: !94)
!107 = !DILocalVariable(name: "p", scope: !94, file: !1, line: 37, type: !16)
!108 = !DILocation(line: 39, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !94, file: !1, line: 39, column: 3)
!110 = !DILocation(line: 0, scope: !109)
!111 = !DILocation(line: 39, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !1, line: 39, column: 3)
!113 = !DILocation(line: 39, column: 3, scope: !109)
!114 = !DILocation(line: 40, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 40, column: 9)
!116 = distinct !DILexicalBlock(scope: !112, file: !1, line: 39, column: 33)
!117 = !DILocation(line: 40, column: 21, scope: !115)
!118 = !DILocation(line: 40, column: 24, scope: !115)
!119 = !DILocation(line: 40, column: 9, scope: !116)
!120 = !DILocation(line: 41, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !1, line: 40, column: 46)
!122 = !DILocation(line: 42, column: 5, scope: !121)
!123 = !DILocation(line: 43, column: 3, scope: !116)
!124 = !DILocation(line: 39, column: 27, scope: !112)
!125 = !DILocation(line: 39, column: 3, scope: !112)
!126 = distinct !{!126, !113, !127}
!127 = !DILocation(line: 43, column: 3, scope: !109)
!128 = !DILocation(line: 44, column: 3, scope: !94)
!129 = !DILocation(line: 45, column: 1, scope: !94)
