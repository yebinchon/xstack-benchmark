; ModuleID = 'arithmetic-geometric-mean-2.bc'
source_filename = "arithmetic-geometric-mean-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpf_struct = type { i32, i32, i64, i64* }

@.str = private unnamed_addr constant [11 x i8] c"%.20000Ff\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%.20000Ff\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @agm(%struct.__mpf_struct* %in1, %struct.__mpf_struct* %in2, %struct.__mpf_struct* %out1, %struct.__mpf_struct* %out2) #0 !dbg !7 {
entry:
  %in1.addr = alloca %struct.__mpf_struct*, align 8
  %in2.addr = alloca %struct.__mpf_struct*, align 8
  %out1.addr = alloca %struct.__mpf_struct*, align 8
  %out2.addr = alloca %struct.__mpf_struct*, align 8
  store %struct.__mpf_struct* %in1, %struct.__mpf_struct** %in1.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpf_struct** %in1.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store %struct.__mpf_struct* %in2, %struct.__mpf_struct** %in2.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpf_struct** %in2.addr, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct.__mpf_struct* %out1, %struct.__mpf_struct** %out1.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpf_struct** %out1.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store %struct.__mpf_struct* %out2, %struct.__mpf_struct** %out2.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__mpf_struct** %out2.addr, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out1.addr, align 8, !dbg !35
  %1 = load %struct.__mpf_struct*, %struct.__mpf_struct** %in1.addr, align 8, !dbg !36
  %2 = load %struct.__mpf_struct*, %struct.__mpf_struct** %in2.addr, align 8, !dbg !37
  call void @__gmpf_add(%struct.__mpf_struct* %0, %struct.__mpf_struct* %1, %struct.__mpf_struct* %2), !dbg !38
  %3 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out1.addr, align 8, !dbg !39
  %4 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out1.addr, align 8, !dbg !40
  call void @__gmpf_div_ui(%struct.__mpf_struct* %3, %struct.__mpf_struct* %4, i64 2), !dbg !41
  %5 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out2.addr, align 8, !dbg !42
  %6 = load %struct.__mpf_struct*, %struct.__mpf_struct** %in1.addr, align 8, !dbg !43
  %7 = load %struct.__mpf_struct*, %struct.__mpf_struct** %in2.addr, align 8, !dbg !44
  call void @__gmpf_mul(%struct.__mpf_struct* %5, %struct.__mpf_struct* %6, %struct.__mpf_struct* %7), !dbg !45
  %8 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out2.addr, align 8, !dbg !46
  %9 = load %struct.__mpf_struct*, %struct.__mpf_struct** %out2.addr, align 8, !dbg !47
  call void @__gmpf_sqrt(%struct.__mpf_struct* %8, %struct.__mpf_struct* %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpf_add(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_div_ui(%struct.__mpf_struct*, %struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_mul(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_sqrt(%struct.__mpf_struct*, %struct.__mpf_struct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %x0 = alloca [1 x %struct.__mpf_struct], align 16
  %y0 = alloca [1 x %struct.__mpf_struct], align 16
  %resA = alloca [1 x %struct.__mpf_struct], align 16
  %resB = alloca [1 x %struct.__mpf_struct], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @__gmpf_set_default_prec(i64 65568), !dbg !53
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %x0, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %y0, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resA, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resB, metadata !64, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !66
  call void @__gmpf_init_set_ui(%struct.__mpf_struct* %arraydecay, i64 1), !dbg !67
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !68
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay1, double 5.000000e-01), !dbg !69
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !70
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !71
  call void @__gmpf_sqrt(%struct.__mpf_struct* %arraydecay2, %struct.__mpf_struct* %arraydecay3), !dbg !72
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !73
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay4), !dbg !74
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !75
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay5), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !DIExpression()), !dbg !79
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !81
  %cmp = icmp slt i32 %0, 7, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !85
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !87
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !88
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !89
  call void @agm(%struct.__mpf_struct* %arraydecay6, %struct.__mpf_struct* %arraydecay7, %struct.__mpf_struct* %arraydecay8, %struct.__mpf_struct* %arraydecay9), !dbg !90
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !91
  %arraydecay11 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !92
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !93
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !94
  call void @agm(%struct.__mpf_struct* %arraydecay10, %struct.__mpf_struct* %arraydecay11, %struct.__mpf_struct* %arraydecay12, %struct.__mpf_struct* %arraydecay13), !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !97
  %inc = add nsw i32 %1, 1, !dbg !97
  store i32 %inc, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %arraydecay14 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !101
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), %struct.__mpf_struct* %arraydecay14), !dbg !102
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !103
  %call16 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), %struct.__mpf_struct* %arraydecay15), !dbg !104
  ret i32 0, !dbg !105
}

declare dso_local void @__gmpf_set_default_prec(i64) #2

declare dso_local void @__gmpf_init_set_ui(%struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_init_set_d(%struct.__mpf_struct*, double) #2

declare dso_local void @__gmpf_init(%struct.__mpf_struct*) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-geometric-mean-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-geometric-mean-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "agm", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !26, !26}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpf_struct", file: !13, line: 199, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 188, size: 192, elements: !15)
!15 = !{!16, !18, !19, !22}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_prec", scope: !14, file: !13, line: 190, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !14, file: !13, line: 194, baseType: !17, size: 32, offset: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_exp", scope: !14, file: !13, line: 197, baseType: !20, size: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_exp_t", file: !13, line: 176, baseType: !21)
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !14, file: !13, line: 198, baseType: !23, size: 64, offset: 128)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !13, line: 141, baseType: !25)
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!27 = !DILocalVariable(name: "in1", arg: 1, scope: !7, file: !1, line: 9, type: !10)
!28 = !DILocation(line: 9, column: 23, scope: !7)
!29 = !DILocalVariable(name: "in2", arg: 2, scope: !7, file: !1, line: 9, type: !10)
!30 = !DILocation(line: 9, column: 40, scope: !7)
!31 = !DILocalVariable(name: "out1", arg: 3, scope: !7, file: !1, line: 9, type: !26)
!32 = !DILocation(line: 9, column: 51, scope: !7)
!33 = !DILocalVariable(name: "out2", arg: 4, scope: !7, file: !1, line: 9, type: !26)
!34 = !DILocation(line: 9, column: 63, scope: !7)
!35 = !DILocation(line: 10, column: 11, scope: !7)
!36 = !DILocation(line: 10, column: 17, scope: !7)
!37 = !DILocation(line: 10, column: 22, scope: !7)
!38 = !DILocation(line: 10, column: 2, scope: !7)
!39 = !DILocation(line: 11, column: 14, scope: !7)
!40 = !DILocation(line: 11, column: 20, scope: !7)
!41 = !DILocation(line: 11, column: 2, scope: !7)
!42 = !DILocation(line: 12, column: 11, scope: !7)
!43 = !DILocation(line: 12, column: 17, scope: !7)
!44 = !DILocation(line: 12, column: 22, scope: !7)
!45 = !DILocation(line: 12, column: 2, scope: !7)
!46 = !DILocation(line: 13, column: 12, scope: !7)
!47 = !DILocation(line: 13, column: 18, scope: !7)
!48 = !DILocation(line: 13, column: 2, scope: !7)
!49 = !DILocation(line: 14, column: 1, scope: !7)
!50 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !51, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!17}
!53 = !DILocation(line: 17, column: 2, scope: !50)
!54 = !DILocalVariable(name: "x0", scope: !50, file: !1, line: 18, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpf_t", file: !13, line: 202, baseType: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 1)
!59 = !DILocation(line: 18, column: 8, scope: !50)
!60 = !DILocalVariable(name: "y0", scope: !50, file: !1, line: 18, type: !55)
!61 = !DILocation(line: 18, column: 12, scope: !50)
!62 = !DILocalVariable(name: "resA", scope: !50, file: !1, line: 18, type: !55)
!63 = !DILocation(line: 18, column: 16, scope: !50)
!64 = !DILocalVariable(name: "resB", scope: !50, file: !1, line: 18, type: !55)
!65 = !DILocation(line: 18, column: 22, scope: !50)
!66 = !DILocation(line: 20, column: 19, scope: !50)
!67 = !DILocation(line: 20, column: 2, scope: !50)
!68 = !DILocation(line: 21, column: 18, scope: !50)
!69 = !DILocation(line: 21, column: 2, scope: !50)
!70 = !DILocation(line: 22, column: 12, scope: !50)
!71 = !DILocation(line: 22, column: 16, scope: !50)
!72 = !DILocation(line: 22, column: 2, scope: !50)
!73 = !DILocation(line: 23, column: 12, scope: !50)
!74 = !DILocation(line: 23, column: 2, scope: !50)
!75 = !DILocation(line: 24, column: 12, scope: !50)
!76 = !DILocation(line: 24, column: 2, scope: !50)
!77 = !DILocalVariable(name: "i", scope: !78, file: !1, line: 26, type: !17)
!78 = distinct !DILexicalBlock(scope: !50, file: !1, line: 26, column: 2)
!79 = !DILocation(line: 26, column: 10, scope: !78)
!80 = !DILocation(line: 26, column: 6, scope: !78)
!81 = !DILocation(line: 26, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 26, column: 2)
!83 = !DILocation(line: 26, column: 16, scope: !82)
!84 = !DILocation(line: 26, column: 2, scope: !78)
!85 = !DILocation(line: 27, column: 7, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 26, column: 24)
!87 = !DILocation(line: 27, column: 11, scope: !86)
!88 = !DILocation(line: 27, column: 15, scope: !86)
!89 = !DILocation(line: 27, column: 21, scope: !86)
!90 = !DILocation(line: 27, column: 3, scope: !86)
!91 = !DILocation(line: 28, column: 7, scope: !86)
!92 = !DILocation(line: 28, column: 13, scope: !86)
!93 = !DILocation(line: 28, column: 19, scope: !86)
!94 = !DILocation(line: 28, column: 23, scope: !86)
!95 = !DILocation(line: 28, column: 3, scope: !86)
!96 = !DILocation(line: 29, column: 2, scope: !86)
!97 = !DILocation(line: 26, column: 21, scope: !82)
!98 = !DILocation(line: 26, column: 2, scope: !82)
!99 = distinct !{!99, !84, !100}
!100 = !DILocation(line: 29, column: 2, scope: !78)
!101 = !DILocation(line: 30, column: 29, scope: !50)
!102 = !DILocation(line: 30, column: 2, scope: !50)
!103 = !DILocation(line: 31, column: 31, scope: !50)
!104 = !DILocation(line: 31, column: 2, scope: !50)
!105 = !DILocation(line: 33, column: 2, scope: !50)
