; ModuleID = 'arbitrary-precision-integers--included--1.bc'
source_filename = "arbitrary-precision-integers--included--1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpz_struct = type { i32, i32, i64* }

@.str = private unnamed_addr constant [22 x i8] c"GMP says size is: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"size really is %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Digits: %.20s...%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [1 x %struct.__mpz_struct], align 16
  %len = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpz_struct]* %a, metadata !11, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %a, i64 0, i64 0, !dbg !27
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 5), !dbg !28
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %a, i64 0, i64 0, !dbg !29
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %a, i64 0, i64 0, !dbg !30
  call void @__gmpz_pow_ui(%struct.__mpz_struct* %arraydecay1, %struct.__mpz_struct* %arraydecay2, i64 262144), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %len, metadata !32, metadata !DIExpression()), !dbg !33
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %a, i64 0, i64 0, !dbg !34
  %call = call i64 @__gmpz_sizeinbase(%struct.__mpz_struct* %arraydecay3, i32 10) #4, !dbg !35
  %conv = trunc i64 %call to i32, !dbg !35
  store i32 %conv, i32* %len, align 4, !dbg !33
  %0 = load i32, i32* %len, align 4, !dbg !36
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !37
  call void @llvm.dbg.declare(metadata i8** %s, metadata !38, metadata !DIExpression()), !dbg !41
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %a, i64 0, i64 0, !dbg !42
  %call6 = call i8* @__gmpz_get_str(i8* null, i32 10, %struct.__mpz_struct* %arraydecay5), !dbg !43
  store i8* %call6, i8** %s, align 8, !dbg !41
  %1 = load i8*, i8** %s, align 8, !dbg !44
  %call7 = call i64 @strlen(i8* %1) #4, !dbg !45
  %conv8 = trunc i64 %call7 to i32, !dbg !45
  store i32 %conv8, i32* %len, align 4, !dbg !46
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %conv8), !dbg !47
  %2 = load i8*, i8** %s, align 8, !dbg !48
  %3 = load i8*, i8** %s, align 8, !dbg !49
  %4 = load i32, i32* %len, align 4, !dbg !50
  %idx.ext = sext i32 %4 to i64, !dbg !51
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %idx.ext, !dbg !51
  %add.ptr10 = getelementptr inbounds i8, i8* %add.ptr, i64 -20, !dbg !52
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i8* %2, i8* %add.ptr10), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #2

declare dso_local void @__gmpz_pow_ui(%struct.__mpz_struct*, %struct.__mpz_struct*, i64) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @__gmpz_sizeinbase(%struct.__mpz_struct*, i32) #3

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i8* @__gmpz_get_str(i8*, i32, %struct.__mpz_struct*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arbitrary-precision-integers--included--1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arbitrary-precision-integers--included-1")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 7, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !13, line: 164, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !24)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !13, line: 158, baseType: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 150, size: 128, elements: !17)
!17 = !{!18, !19, !20}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !16, file: !13, line: 152, baseType: !10, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !16, file: !13, line: 154, baseType: !10, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !16, file: !13, line: 157, baseType: !21, size: 64, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !13, line: 141, baseType: !23)
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !{!25}
!25 = !DISubrange(count: 1)
!26 = !DILocation(line: 7, column: 8, scope: !7)
!27 = !DILocation(line: 8, column: 18, scope: !7)
!28 = !DILocation(line: 8, column: 2, scope: !7)
!29 = !DILocation(line: 9, column: 13, scope: !7)
!30 = !DILocation(line: 9, column: 16, scope: !7)
!31 = !DILocation(line: 9, column: 2, scope: !7)
!32 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 11, type: !10)
!33 = !DILocation(line: 11, column: 6, scope: !7)
!34 = !DILocation(line: 11, column: 27, scope: !7)
!35 = !DILocation(line: 11, column: 12, scope: !7)
!36 = !DILocation(line: 12, column: 35, scope: !7)
!37 = !DILocation(line: 12, column: 2, scope: !7)
!38 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 15, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocation(line: 15, column: 8, scope: !7)
!42 = !DILocation(line: 15, column: 31, scope: !7)
!43 = !DILocation(line: 15, column: 12, scope: !7)
!44 = !DILocation(line: 16, column: 45, scope: !7)
!45 = !DILocation(line: 16, column: 38, scope: !7)
!46 = !DILocation(line: 16, column: 36, scope: !7)
!47 = !DILocation(line: 16, column: 2, scope: !7)
!48 = !DILocation(line: 17, column: 33, scope: !7)
!49 = !DILocation(line: 17, column: 36, scope: !7)
!50 = !DILocation(line: 17, column: 40, scope: !7)
!51 = !DILocation(line: 17, column: 38, scope: !7)
!52 = !DILocation(line: 17, column: 44, scope: !7)
!53 = !DILocation(line: 17, column: 2, scope: !7)
!54 = !DILocation(line: 20, column: 2, scope: !7)
