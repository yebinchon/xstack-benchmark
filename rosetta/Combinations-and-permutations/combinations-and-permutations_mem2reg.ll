; ModuleID = 'combinations-and-permutations.ll'
source_filename = "combinations-and-permutations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [19 x i8] c"P(1000,969) = %Zd\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"C(1000,969) = %Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @perm(%struct.__mpz_struct* %out, i32 %n, i32 %k) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata %struct.__mpz_struct* %out, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %n, metadata !24, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %k, metadata !25, metadata !DIExpression()), !dbg !23
  call void @__gmpz_set_ui(%struct.__mpz_struct* %out, i64 1), !dbg !26
  %sub = sub nsw i32 %n, %k, !dbg !27
  call void @llvm.dbg.value(metadata i32 %sub, metadata !25, metadata !DIExpression()), !dbg !23
  br label %while.cond, !dbg !28

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %dec, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !24, metadata !DIExpression()), !dbg !23
  %cmp = icmp sgt i32 %n.addr.0, %sub, !dbg !29
  br i1 %cmp, label %while.body, label %while.end, !dbg !28

while.body:                                       ; preds = %while.cond
  %dec = add nsw i32 %n.addr.0, -1, !dbg !30
  call void @llvm.dbg.value(metadata i32 %dec, metadata !24, metadata !DIExpression()), !dbg !23
  %conv = sext i32 %n.addr.0 to i64, !dbg !31
  call void @__gmpz_mul_ui(%struct.__mpz_struct* %out, %struct.__mpz_struct* %out, i64 %conv), !dbg !32
  br label %while.cond, !dbg !28, !llvm.loop !33

while.end:                                        ; preds = %while.cond
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpz_set_ui(%struct.__mpz_struct*, i64) #2

declare dso_local void @__gmpz_mul_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(%struct.__mpz_struct* %out, i32 %n, i32 %k) #0 !dbg !36 {
entry:
  call void @llvm.dbg.value(metadata %struct.__mpz_struct* %out, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %n, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %k, metadata !40, metadata !DIExpression()), !dbg !38
  call void @perm(%struct.__mpz_struct* %out, i32 %n, i32 %k), !dbg !41
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.body, %entry
  %k.addr.0 = phi i32 [ %k, %entry ], [ %dec, %while.body ]
  call void @llvm.dbg.value(metadata i32 %k.addr.0, metadata !40, metadata !DIExpression()), !dbg !38
  %tobool = icmp ne i32 %k.addr.0, 0, !dbg !42
  br i1 %tobool, label %while.body, label %while.end, !dbg !42

while.body:                                       ; preds = %while.cond
  %dec = add nsw i32 %k.addr.0, -1, !dbg !43
  call void @llvm.dbg.value(metadata i32 %dec, metadata !40, metadata !DIExpression()), !dbg !38
  %conv = sext i32 %k.addr.0 to i64, !dbg !44
  call void @__gmpz_divexact_ui(%struct.__mpz_struct* %out, %struct.__mpz_struct* %out, i64 %conv), !dbg !45
  br label %while.cond, !dbg !42, !llvm.loop !46

while.end:                                        ; preds = %while.cond
  ret void, !dbg !48
}

declare dso_local void @__gmpz_divexact_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !49 {
entry:
  %x = alloca [1 x %struct.__mpz_struct], align 16
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %x, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !58
  call void @__gmpz_init(%struct.__mpz_struct* %arraydecay), !dbg !59
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !60
  call void @perm(%struct.__mpz_struct* %arraydecay1, i32 1000, i32 969), !dbg !61
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !62
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), %struct.__mpz_struct* %arraydecay2), !dbg !63
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !64
  call void @comb(%struct.__mpz_struct* %arraydecay3, i32 1000, i32 969), !dbg !65
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !66
  %call5 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay4), !dbg !67
  ret i32 0, !dbg !68
}

declare dso_local void @__gmpz_init(%struct.__mpz_struct*) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "combinations-and-permutations.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations-and-permutations")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "perm", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !16, !16}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !12, line: 158, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 150, size: 128, elements: !14)
!14 = !{!15, !17, !18}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !13, file: !12, line: 152, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !13, file: !12, line: 154, baseType: !16, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !13, file: !12, line: 157, baseType: !19, size: 64, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !12, line: 141, baseType: !21)
!21 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!22 = !DILocalVariable(name: "out", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!23 = !DILocation(line: 0, scope: !7)
!24 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !16)
!25 = !DILocalVariable(name: "k", arg: 3, scope: !7, file: !1, line: 3, type: !16)
!26 = !DILocation(line: 5, column: 2, scope: !7)
!27 = !DILocation(line: 6, column: 8, scope: !7)
!28 = !DILocation(line: 7, column: 2, scope: !7)
!29 = !DILocation(line: 7, column: 11, scope: !7)
!30 = !DILocation(line: 7, column: 38, scope: !7)
!31 = !DILocation(line: 7, column: 37, scope: !7)
!32 = !DILocation(line: 7, column: 16, scope: !7)
!33 = distinct !{!33, !28, !34}
!34 = !DILocation(line: 7, column: 40, scope: !7)
!35 = !DILocation(line: 8, column: 1, scope: !7)
!36 = distinct !DISubprogram(name: "comb", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "out", arg: 1, scope: !36, file: !1, line: 10, type: !10)
!38 = !DILocation(line: 0, scope: !36)
!39 = !DILocalVariable(name: "n", arg: 2, scope: !36, file: !1, line: 10, type: !16)
!40 = !DILocalVariable(name: "k", arg: 3, scope: !36, file: !1, line: 10, type: !16)
!41 = !DILocation(line: 12, column: 2, scope: !36)
!42 = !DILocation(line: 13, column: 2, scope: !36)
!43 = !DILocation(line: 13, column: 39, scope: !36)
!44 = !DILocation(line: 13, column: 38, scope: !36)
!45 = !DILocation(line: 13, column: 12, scope: !36)
!46 = distinct !{!46, !42, !47}
!47 = !DILocation(line: 13, column: 41, scope: !36)
!48 = !DILocation(line: 14, column: 1, scope: !36)
!49 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !50, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!16}
!52 = !DILocalVariable(name: "x", scope: !49, file: !1, line: 18, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !12, line: 164, baseType: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 1)
!57 = !DILocation(line: 18, column: 8, scope: !49)
!58 = !DILocation(line: 19, column: 11, scope: !49)
!59 = !DILocation(line: 19, column: 2, scope: !49)
!60 = !DILocation(line: 21, column: 7, scope: !49)
!61 = !DILocation(line: 21, column: 2, scope: !49)
!62 = !DILocation(line: 22, column: 36, scope: !49)
!63 = !DILocation(line: 22, column: 2, scope: !49)
!64 = !DILocation(line: 24, column: 7, scope: !49)
!65 = !DILocation(line: 24, column: 2, scope: !49)
!66 = !DILocation(line: 25, column: 36, scope: !49)
!67 = !DILocation(line: 25, column: 2, scope: !49)
!68 = !DILocation(line: 26, column: 2, scope: !49)
