; ModuleID = 'combinations-and-permutations.bc'
source_filename = "combinations-and-permutations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [19 x i8] c"P(1000,969) = %Zd\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"C(1000,969) = %Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @perm(%struct.__mpz_struct* %out, i32 %n, i32 %k) #0 !dbg !7 {
entry:
  %out.addr = alloca %struct.__mpz_struct*, align 8
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  store %struct.__mpz_struct* %out, %struct.__mpz_struct** %out.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpz_struct** %out.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !28
  call void @__gmpz_set_ui(%struct.__mpz_struct* %0, i64 1), !dbg !29
  %1 = load i32, i32* %n.addr, align 4, !dbg !30
  %2 = load i32, i32* %k.addr, align 4, !dbg !31
  %sub = sub nsw i32 %1, %2, !dbg !32
  store i32 %sub, i32* %k.addr, align 4, !dbg !33
  br label %while.cond, !dbg !34

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, i32* %n.addr, align 4, !dbg !35
  %4 = load i32, i32* %k.addr, align 4, !dbg !36
  %cmp = icmp sgt i32 %3, %4, !dbg !37
  br i1 %cmp, label %while.body, label %while.end, !dbg !34

while.body:                                       ; preds = %while.cond
  %5 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !38
  %6 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !39
  %7 = load i32, i32* %n.addr, align 4, !dbg !40
  %dec = add nsw i32 %7, -1, !dbg !40
  store i32 %dec, i32* %n.addr, align 4, !dbg !40
  %conv = sext i32 %7 to i64, !dbg !41
  call void @__gmpz_mul_ui(%struct.__mpz_struct* %5, %struct.__mpz_struct* %6, i64 %conv), !dbg !42
  br label %while.cond, !dbg !34, !llvm.loop !43

while.end:                                        ; preds = %while.cond
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpz_set_ui(%struct.__mpz_struct*, i64) #2

declare dso_local void @__gmpz_mul_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(%struct.__mpz_struct* %out, i32 %n, i32 %k) #0 !dbg !46 {
entry:
  %out.addr = alloca %struct.__mpz_struct*, align 8
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  store %struct.__mpz_struct* %out, %struct.__mpz_struct** %out.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpz_struct** %out.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !53
  %1 = load i32, i32* %n.addr, align 4, !dbg !54
  %2 = load i32, i32* %k.addr, align 4, !dbg !55
  call void @perm(%struct.__mpz_struct* %0, i32 %1, i32 %2), !dbg !56
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, i32* %k.addr, align 4, !dbg !58
  %tobool = icmp ne i32 %3, 0, !dbg !57
  br i1 %tobool, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %4 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !59
  %5 = load %struct.__mpz_struct*, %struct.__mpz_struct** %out.addr, align 8, !dbg !60
  %6 = load i32, i32* %k.addr, align 4, !dbg !61
  %dec = add nsw i32 %6, -1, !dbg !61
  store i32 %dec, i32* %k.addr, align 4, !dbg !61
  %conv = sext i32 %6 to i64, !dbg !62
  call void @__gmpz_divexact_ui(%struct.__mpz_struct* %4, %struct.__mpz_struct* %5, i64 %conv), !dbg !63
  br label %while.cond, !dbg !57, !llvm.loop !64

while.end:                                        ; preds = %while.cond
  ret void, !dbg !66
}

declare dso_local void @__gmpz_divexact_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %x = alloca [1 x %struct.__mpz_struct], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %x, metadata !70, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !76
  call void @__gmpz_init(%struct.__mpz_struct* %arraydecay), !dbg !77
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !78
  call void @perm(%struct.__mpz_struct* %arraydecay1, i32 1000, i32 969), !dbg !79
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !80
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), %struct.__mpz_struct* %arraydecay2), !dbg !81
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !82
  call void @comb(%struct.__mpz_struct* %arraydecay3, i32 1000, i32 969), !dbg !83
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %x, i64 0, i64 0, !dbg !84
  %call5 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay4), !dbg !85
  ret i32 0, !dbg !86
}

declare dso_local void @__gmpz_init(%struct.__mpz_struct*) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

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
!23 = !DILocation(line: 3, column: 17, scope: !7)
!24 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !16)
!25 = !DILocation(line: 3, column: 26, scope: !7)
!26 = !DILocalVariable(name: "k", arg: 3, scope: !7, file: !1, line: 3, type: !16)
!27 = !DILocation(line: 3, column: 33, scope: !7)
!28 = !DILocation(line: 5, column: 13, scope: !7)
!29 = !DILocation(line: 5, column: 2, scope: !7)
!30 = !DILocation(line: 6, column: 6, scope: !7)
!31 = !DILocation(line: 6, column: 10, scope: !7)
!32 = !DILocation(line: 6, column: 8, scope: !7)
!33 = !DILocation(line: 6, column: 4, scope: !7)
!34 = !DILocation(line: 7, column: 2, scope: !7)
!35 = !DILocation(line: 7, column: 9, scope: !7)
!36 = !DILocation(line: 7, column: 13, scope: !7)
!37 = !DILocation(line: 7, column: 11, scope: !7)
!38 = !DILocation(line: 7, column: 27, scope: !7)
!39 = !DILocation(line: 7, column: 32, scope: !7)
!40 = !DILocation(line: 7, column: 38, scope: !7)
!41 = !DILocation(line: 7, column: 37, scope: !7)
!42 = !DILocation(line: 7, column: 16, scope: !7)
!43 = distinct !{!43, !34, !44}
!44 = !DILocation(line: 7, column: 40, scope: !7)
!45 = !DILocation(line: 8, column: 1, scope: !7)
!46 = distinct !DISubprogram(name: "comb", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "out", arg: 1, scope: !46, file: !1, line: 10, type: !10)
!48 = !DILocation(line: 10, column: 17, scope: !46)
!49 = !DILocalVariable(name: "n", arg: 2, scope: !46, file: !1, line: 10, type: !16)
!50 = !DILocation(line: 10, column: 26, scope: !46)
!51 = !DILocalVariable(name: "k", arg: 3, scope: !46, file: !1, line: 10, type: !16)
!52 = !DILocation(line: 10, column: 33, scope: !46)
!53 = !DILocation(line: 12, column: 7, scope: !46)
!54 = !DILocation(line: 12, column: 12, scope: !46)
!55 = !DILocation(line: 12, column: 15, scope: !46)
!56 = !DILocation(line: 12, column: 2, scope: !46)
!57 = !DILocation(line: 13, column: 2, scope: !46)
!58 = !DILocation(line: 13, column: 9, scope: !46)
!59 = !DILocation(line: 13, column: 28, scope: !46)
!60 = !DILocation(line: 13, column: 33, scope: !46)
!61 = !DILocation(line: 13, column: 39, scope: !46)
!62 = !DILocation(line: 13, column: 38, scope: !46)
!63 = !DILocation(line: 13, column: 12, scope: !46)
!64 = distinct !{!64, !57, !65}
!65 = !DILocation(line: 13, column: 41, scope: !46)
!66 = !DILocation(line: 14, column: 1, scope: !46)
!67 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !68, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16}
!70 = !DILocalVariable(name: "x", scope: !67, file: !1, line: 18, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !12, line: 164, baseType: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 1)
!75 = !DILocation(line: 18, column: 8, scope: !67)
!76 = !DILocation(line: 19, column: 11, scope: !67)
!77 = !DILocation(line: 19, column: 2, scope: !67)
!78 = !DILocation(line: 21, column: 7, scope: !67)
!79 = !DILocation(line: 21, column: 2, scope: !67)
!80 = !DILocation(line: 22, column: 36, scope: !67)
!81 = !DILocation(line: 22, column: 2, scope: !67)
!82 = !DILocation(line: 24, column: 7, scope: !67)
!83 = !DILocation(line: 24, column: 2, scope: !67)
!84 = !DILocation(line: 25, column: 36, scope: !67)
!85 = !DILocation(line: 25, column: 2, scope: !67)
!86 = !DILocation(line: 26, column: 2, scope: !67)
