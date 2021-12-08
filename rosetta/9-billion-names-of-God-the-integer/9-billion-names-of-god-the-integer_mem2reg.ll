; ModuleID = '9-billion-names-of-god-the-integer.ll'
source_filename = "9-billion-names-of-god-the-integer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpz_struct = type { i32, i32, i64* }

@p = common dso_local global [100001 x [1 x %struct.__mpz_struct]] zeroinitializer, align 16, !dbg !0
@__const.main.idx = private unnamed_addr constant [10 x i32] [i32 23, i32 123, i32 1234, i32 12345, i32 20000, i32 30000, i32 40000, i32 50000, i32 100000, i32 0], align 16
@.str = private unnamed_addr constant [10 x i8] c"%2d:\09%Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @calc(i32 %n) #0 !dbg !28 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !31, metadata !DIExpression()), !dbg !32
  %idxprom = sext i32 %n to i64, !dbg !33
  %arrayidx = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom, !dbg !33
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx, i64 0, i64 0, !dbg !33
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 0), !dbg !34
  call void @llvm.dbg.value(metadata i32 1, metadata !35, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %k.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !37
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !35, metadata !DIExpression()), !dbg !37
  %cmp = icmp sle i32 %k.0, %n, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 3, %k.0, !dbg !42
  %sub = sub nsw i32 %mul, 1, !dbg !44
  %mul1 = mul nsw i32 %k.0, %sub, !dbg !45
  %div = sdiv i32 %mul1, 2, !dbg !46
  %sub2 = sub nsw i32 %n, %div, !dbg !47
  call void @llvm.dbg.value(metadata i32 %sub2, metadata !48, metadata !DIExpression()), !dbg !49
  %cmp3 = icmp slt i32 %sub2, 0, !dbg !50
  br i1 %cmp3, label %if.then, label %if.end, !dbg !52, !cf.info !53

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !54

if.end:                                           ; preds = %for.body
  %and = and i32 %k.0, 1, !dbg !55
  %tobool = icmp ne i32 %and, 0, !dbg !55
  br i1 %tobool, label %if.then4, label %if.else, !dbg !57, !cf.info !53

if.then4:                                         ; preds = %if.end
  %idxprom5 = sext i32 %n to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom5, !dbg !58
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx6, i64 0, i64 0, !dbg !58
  %idxprom8 = sext i32 %n to i64, !dbg !59
  %arrayidx9 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom8, !dbg !59
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx9, i64 0, i64 0, !dbg !59
  %idxprom11 = sext i32 %sub2 to i64, !dbg !60
  %arrayidx12 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom11, !dbg !60
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx12, i64 0, i64 0, !dbg !60
  call void @__gmpz_add(%struct.__mpz_struct* %arraydecay7, %struct.__mpz_struct* %arraydecay10, %struct.__mpz_struct* %arraydecay13), !dbg !61
  br label %if.end23, !dbg !61

if.else:                                          ; preds = %if.end
  %idxprom14 = sext i32 %n to i64, !dbg !62
  %arrayidx15 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom14, !dbg !62
  %arraydecay16 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx15, i64 0, i64 0, !dbg !62
  %idxprom17 = sext i32 %n to i64, !dbg !63
  %arrayidx18 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom17, !dbg !63
  %arraydecay19 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx18, i64 0, i64 0, !dbg !63
  %idxprom20 = sext i32 %sub2 to i64, !dbg !64
  %arrayidx21 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom20, !dbg !64
  %arraydecay22 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx21, i64 0, i64 0, !dbg !64
  call void @__gmpz_sub(%struct.__mpz_struct* %arraydecay16, %struct.__mpz_struct* %arraydecay19, %struct.__mpz_struct* %arraydecay22), !dbg !65
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.then4
  %sub24 = sub nsw i32 %sub2, %k.0, !dbg !66
  call void @llvm.dbg.value(metadata i32 %sub24, metadata !48, metadata !DIExpression()), !dbg !49
  %cmp25 = icmp slt i32 %sub24, 0, !dbg !67
  br i1 %cmp25, label %if.then26, label %if.end27, !dbg !69, !cf.info !53

if.then26:                                        ; preds = %if.end23
  br label %for.end, !dbg !70

if.end27:                                         ; preds = %if.end23
  %and28 = and i32 %k.0, 1, !dbg !71
  %tobool29 = icmp ne i32 %and28, 0, !dbg !71
  br i1 %tobool29, label %if.then30, label %if.else40, !dbg !73, !cf.info !53

if.then30:                                        ; preds = %if.end27
  %idxprom31 = sext i32 %n to i64, !dbg !74
  %arrayidx32 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom31, !dbg !74
  %arraydecay33 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx32, i64 0, i64 0, !dbg !74
  %idxprom34 = sext i32 %n to i64, !dbg !75
  %arrayidx35 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom34, !dbg !75
  %arraydecay36 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx35, i64 0, i64 0, !dbg !75
  %idxprom37 = sext i32 %sub24 to i64, !dbg !76
  %arrayidx38 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom37, !dbg !76
  %arraydecay39 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx38, i64 0, i64 0, !dbg !76
  call void @__gmpz_add(%struct.__mpz_struct* %arraydecay33, %struct.__mpz_struct* %arraydecay36, %struct.__mpz_struct* %arraydecay39), !dbg !77
  br label %if.end50, !dbg !77

if.else40:                                        ; preds = %if.end27
  %idxprom41 = sext i32 %n to i64, !dbg !78
  %arrayidx42 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom41, !dbg !78
  %arraydecay43 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx42, i64 0, i64 0, !dbg !78
  %idxprom44 = sext i32 %n to i64, !dbg !79
  %arrayidx45 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom44, !dbg !79
  %arraydecay46 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx45, i64 0, i64 0, !dbg !79
  %idxprom47 = sext i32 %sub24 to i64, !dbg !80
  %arrayidx48 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom47, !dbg !80
  %arraydecay49 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx48, i64 0, i64 0, !dbg !80
  call void @__gmpz_sub(%struct.__mpz_struct* %arraydecay43, %struct.__mpz_struct* %arraydecay46, %struct.__mpz_struct* %arraydecay49), !dbg !81
  br label %if.end50

if.end50:                                         ; preds = %if.else40, %if.then30
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %if.end50
  %inc = add nsw i32 %k.0, 1, !dbg !83
  call void @llvm.dbg.value(metadata i32 %inc, metadata !35, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %if.then26, %if.then, %for.cond
  ret void, !dbg !87
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #2

declare dso_local void @__gmpz_add(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #2

declare dso_local void @__gmpz_sub(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !88 {
entry:
  %idx = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata [10 x i32]* %idx, metadata !91, metadata !DIExpression()), !dbg !95
  %0 = bitcast [10 x i32]* %idx to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.main.idx to i8*), i64 40, i1 false), !dbg !95
  call void @llvm.dbg.value(metadata i32 0, metadata !96, metadata !DIExpression()), !dbg !97
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* getelementptr inbounds ([100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 0, i64 0), i64 1), !dbg !98
  call void @llvm.dbg.value(metadata i32 1, metadata !99, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %at.0 = phi i32 [ 0, %entry ], [ %at.1, %for.inc ], !dbg !103
  %i.0 = phi i32 [ 1, %entry ], [ %inc5, %for.inc ], !dbg !101
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !99, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.value(metadata i32 %at.0, metadata !96, metadata !DIExpression()), !dbg !97
  %idxprom = sext i32 %at.0 to i64, !dbg !104
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %idx, i64 0, i64 %idxprom, !dbg !104
  %1 = load i32, i32* %arrayidx, align 4, !dbg !104
  %tobool = icmp ne i32 %1, 0, !dbg !106
  br i1 %tobool, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  call void @calc(i32 %i.0), !dbg !107
  %idxprom1 = sext i32 %at.0 to i64, !dbg !109
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %idx, i64 0, i64 %idxprom1, !dbg !109
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !109
  %cmp = icmp ne i32 %i.0, %2, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112, !cf.info !53

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !113

if.end:                                           ; preds = %for.body
  %idxprom3 = sext i32 %i.0 to i64, !dbg !114
  %arrayidx4 = getelementptr inbounds [100001 x [1 x %struct.__mpz_struct]], [100001 x [1 x %struct.__mpz_struct]]* @p, i64 0, i64 %idxprom3, !dbg !114
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %arrayidx4, i64 0, i64 0, !dbg !114
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %i.0, %struct.__mpz_struct* %arraydecay), !dbg !115
  %inc = add nsw i32 %at.0, 1, !dbg !116
  call void @llvm.dbg.value(metadata i32 %inc, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %if.end, %if.then
  %at.1 = phi i32 [ %at.0, %if.then ], [ %inc, %if.end ], !dbg !97
  call void @llvm.dbg.value(metadata i32 %at.1, metadata !96, metadata !DIExpression()), !dbg !97
  %inc5 = add nsw i32 %i.0, 1, !dbg !118
  call void @llvm.dbg.value(metadata i32 %inc5, metadata !99, metadata !DIExpression()), !dbg !101
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !122
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "p", scope: !2, file: !3, line: 5, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "9-billion-names-of-god-the-integer.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/9-billion-names-of-God-the-integer")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 12800128, elements: !22)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !8, line: 164, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128, elements: !20)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !8, line: 158, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !8, line: 150, size: 128, elements: !12)
!12 = !{!13, !15, !16}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !11, file: !8, line: 152, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !11, file: !8, line: 154, baseType: !14, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !11, file: !8, line: 157, baseType: !17, size: 64, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !8, line: 141, baseType: !19)
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !{!21}
!21 = !DISubrange(count: 1)
!22 = !{!23}
!23 = !DISubrange(count: 100001)
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!28 = distinct !DISubprogram(name: "calc", scope: !3, file: !3, line: 7, type: !29, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !14}
!31 = !DILocalVariable(name: "n", arg: 1, scope: !28, file: !3, line: 7, type: !14)
!32 = !DILocation(line: 0, scope: !28)
!33 = !DILocation(line: 9, column: 18, scope: !28)
!34 = !DILocation(line: 9, column: 2, scope: !28)
!35 = !DILocalVariable(name: "k", scope: !36, file: !3, line: 11, type: !14)
!36 = distinct !DILexicalBlock(scope: !28, file: !3, line: 11, column: 2)
!37 = !DILocation(line: 0, scope: !36)
!38 = !DILocation(line: 11, column: 7, scope: !36)
!39 = !DILocation(line: 11, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !3, line: 11, column: 2)
!41 = !DILocation(line: 11, column: 2, scope: !36)
!42 = !DILocation(line: 12, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !3, line: 11, column: 31)
!44 = !DILocation(line: 12, column: 26, scope: !43)
!45 = !DILocation(line: 12, column: 17, scope: !43)
!46 = !DILocation(line: 12, column: 31, scope: !43)
!47 = !DILocation(line: 12, column: 13, scope: !43)
!48 = !DILocalVariable(name: "d", scope: !43, file: !3, line: 12, type: !14)
!49 = !DILocation(line: 0, scope: !43)
!50 = !DILocation(line: 13, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !3, line: 13, column: 7)
!52 = !DILocation(line: 13, column: 7, scope: !43)
!53 = !{!"if"}
!54 = !DILocation(line: 13, column: 14, scope: !51)
!55 = !DILocation(line: 15, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !43, file: !3, line: 15, column: 7)
!57 = !DILocation(line: 15, column: 7, scope: !43)
!58 = !DILocation(line: 15, column: 19, scope: !56)
!59 = !DILocation(line: 15, column: 25, scope: !56)
!60 = !DILocation(line: 15, column: 31, scope: !56)
!61 = !DILocation(line: 15, column: 11, scope: !56)
!62 = !DILocation(line: 16, column: 16, scope: !56)
!63 = !DILocation(line: 16, column: 22, scope: !56)
!64 = !DILocation(line: 16, column: 28, scope: !56)
!65 = !DILocation(line: 16, column: 8, scope: !56)
!66 = !DILocation(line: 18, column: 5, scope: !43)
!67 = !DILocation(line: 19, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !43, file: !3, line: 19, column: 7)
!69 = !DILocation(line: 19, column: 7, scope: !43)
!70 = !DILocation(line: 19, column: 14, scope: !68)
!71 = !DILocation(line: 21, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !43, file: !3, line: 21, column: 7)
!73 = !DILocation(line: 21, column: 7, scope: !43)
!74 = !DILocation(line: 21, column: 19, scope: !72)
!75 = !DILocation(line: 21, column: 25, scope: !72)
!76 = !DILocation(line: 21, column: 31, scope: !72)
!77 = !DILocation(line: 21, column: 11, scope: !72)
!78 = !DILocation(line: 22, column: 16, scope: !72)
!79 = !DILocation(line: 22, column: 22, scope: !72)
!80 = !DILocation(line: 22, column: 28, scope: !72)
!81 = !DILocation(line: 22, column: 8, scope: !72)
!82 = !DILocation(line: 23, column: 2, scope: !43)
!83 = !DILocation(line: 11, column: 27, scope: !40)
!84 = !DILocation(line: 11, column: 2, scope: !40)
!85 = distinct !{!85, !41, !86}
!86 = !DILocation(line: 23, column: 2, scope: !36)
!87 = !DILocation(line: 24, column: 1, scope: !28)
!88 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 26, type: !89, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!14}
!91 = !DILocalVariable(name: "idx", scope: !88, file: !3, line: 28, type: !92)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 10)
!95 = !DILocation(line: 28, column: 6, scope: !88)
!96 = !DILocalVariable(name: "at", scope: !88, file: !3, line: 29, type: !14)
!97 = !DILocation(line: 0, scope: !88)
!98 = !DILocation(line: 31, column: 2, scope: !88)
!99 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 33, type: !14)
!100 = distinct !DILexicalBlock(scope: !88, file: !3, line: 33, column: 2)
!101 = !DILocation(line: 0, scope: !100)
!102 = !DILocation(line: 33, column: 7, scope: !100)
!103 = !DILocation(line: 29, column: 6, scope: !88)
!104 = !DILocation(line: 33, column: 18, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !3, line: 33, column: 2)
!106 = !DILocation(line: 33, column: 2, scope: !100)
!107 = !DILocation(line: 34, column: 3, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 33, column: 32)
!109 = !DILocation(line: 35, column: 12, scope: !110)
!110 = distinct !DILexicalBlock(scope: !108, file: !3, line: 35, column: 7)
!111 = !DILocation(line: 35, column: 9, scope: !110)
!112 = !DILocation(line: 35, column: 7, scope: !108)
!113 = !DILocation(line: 35, column: 21, scope: !110)
!114 = !DILocation(line: 37, column: 32, scope: !108)
!115 = !DILocation(line: 37, column: 3, scope: !108)
!116 = !DILocation(line: 38, column: 5, scope: !108)
!117 = !DILocation(line: 39, column: 2, scope: !108)
!118 = !DILocation(line: 33, column: 28, scope: !105)
!119 = !DILocation(line: 33, column: 2, scope: !105)
!120 = distinct !{!120, !106, !121}
!121 = !DILocation(line: 39, column: 2, scope: !100)
!122 = !DILocation(line: 40, column: 1, scope: !88)
