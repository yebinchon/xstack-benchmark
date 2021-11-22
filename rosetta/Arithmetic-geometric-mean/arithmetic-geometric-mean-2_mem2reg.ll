; ModuleID = 'arithmetic-geometric-mean-2.ll'
source_filename = "arithmetic-geometric-mean-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__mpf_struct = type { i32, i32, i64, i64* }

@.str = private unnamed_addr constant [11 x i8] c"%.20000Ff\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%.20000Ff\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @agm(%struct.__mpf_struct* %in1, %struct.__mpf_struct* %in2, %struct.__mpf_struct* %out1, %struct.__mpf_struct* %out2) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata %struct.__mpf_struct* %in1, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata %struct.__mpf_struct* %in2, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata %struct.__mpf_struct* %out1, metadata !30, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata %struct.__mpf_struct* %out2, metadata !31, metadata !DIExpression()), !dbg !28
  call void @__gmpf_add(%struct.__mpf_struct* %out1, %struct.__mpf_struct* %in1, %struct.__mpf_struct* %in2), !dbg !32
  call void @__gmpf_div_ui(%struct.__mpf_struct* %out1, %struct.__mpf_struct* %out1, i64 2), !dbg !33
  call void @__gmpf_mul(%struct.__mpf_struct* %out2, %struct.__mpf_struct* %in1, %struct.__mpf_struct* %in2), !dbg !34
  call void @__gmpf_sqrt(%struct.__mpf_struct* %out2, %struct.__mpf_struct* %out2), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @__gmpf_add(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_div_ui(%struct.__mpf_struct*, %struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_mul(%struct.__mpf_struct*, %struct.__mpf_struct*, %struct.__mpf_struct*) #2

declare dso_local void @__gmpf_sqrt(%struct.__mpf_struct*, %struct.__mpf_struct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !37 {
entry:
  %x0 = alloca [1 x %struct.__mpf_struct], align 16
  %y0 = alloca [1 x %struct.__mpf_struct], align 16
  %resA = alloca [1 x %struct.__mpf_struct], align 16
  %resB = alloca [1 x %struct.__mpf_struct], align 16
  call void @__gmpf_set_default_prec(i64 65568), !dbg !40
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %x0, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %y0, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resA, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [1 x %struct.__mpf_struct]* %resB, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !53
  call void @__gmpf_init_set_ui(%struct.__mpf_struct* %arraydecay, i64 1), !dbg !54
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !55
  call void @__gmpf_init_set_d(%struct.__mpf_struct* %arraydecay1, double 5.000000e-01), !dbg !56
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !57
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !58
  call void @__gmpf_sqrt(%struct.__mpf_struct* %arraydecay2, %struct.__mpf_struct* %arraydecay3), !dbg !59
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !60
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay4), !dbg !61
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !62
  call void @__gmpf_init(%struct.__mpf_struct* %arraydecay5), !dbg !63
  call void @llvm.dbg.value(metadata i32 0, metadata !64, metadata !DIExpression()), !dbg !66
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !66
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !64, metadata !DIExpression()), !dbg !66
  %cmp = icmp slt i32 %i.0, 7, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !71
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !73
  %arraydecay8 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !74
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !75
  call void @agm(%struct.__mpf_struct* %arraydecay6, %struct.__mpf_struct* %arraydecay7, %struct.__mpf_struct* %arraydecay8, %struct.__mpf_struct* %arraydecay9), !dbg !76
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resA, i64 0, i64 0, !dbg !77
  %arraydecay11 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %resB, i64 0, i64 0, !dbg !78
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !79
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !80
  call void @agm(%struct.__mpf_struct* %arraydecay10, %struct.__mpf_struct* %arraydecay11, %struct.__mpf_struct* %arraydecay12, %struct.__mpf_struct* %arraydecay13), !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !83
  call void @llvm.dbg.value(metadata i32 %inc, metadata !64, metadata !DIExpression()), !dbg !66
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arraydecay14 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %x0, i64 0, i64 0, !dbg !87
  %call = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), %struct.__mpf_struct* %arraydecay14), !dbg !88
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpf_struct], [1 x %struct.__mpf_struct]* %y0, i64 0, i64 0, !dbg !89
  %call16 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), %struct.__mpf_struct* %arraydecay15), !dbg !90
  ret i32 0, !dbg !91
}

declare dso_local void @__gmpf_set_default_prec(i64) #2

declare dso_local void @__gmpf_init_set_ui(%struct.__mpf_struct*, i64) #2

declare dso_local void @__gmpf_init_set_d(%struct.__mpf_struct*, double) #2

declare dso_local void @__gmpf_init(%struct.__mpf_struct*) #2

declare dso_local i32 @__gmp_printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-geometric-mean-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-geometric-mean")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!28 = !DILocation(line: 0, scope: !7)
!29 = !DILocalVariable(name: "in2", arg: 2, scope: !7, file: !1, line: 9, type: !10)
!30 = !DILocalVariable(name: "out1", arg: 3, scope: !7, file: !1, line: 9, type: !26)
!31 = !DILocalVariable(name: "out2", arg: 4, scope: !7, file: !1, line: 9, type: !26)
!32 = !DILocation(line: 10, column: 2, scope: !7)
!33 = !DILocation(line: 11, column: 2, scope: !7)
!34 = !DILocation(line: 12, column: 2, scope: !7)
!35 = !DILocation(line: 13, column: 2, scope: !7)
!36 = !DILocation(line: 14, column: 1, scope: !7)
!37 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !38, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!17}
!40 = !DILocation(line: 17, column: 2, scope: !37)
!41 = !DILocalVariable(name: "x0", scope: !37, file: !1, line: 18, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpf_t", file: !13, line: 202, baseType: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 1)
!46 = !DILocation(line: 18, column: 8, scope: !37)
!47 = !DILocalVariable(name: "y0", scope: !37, file: !1, line: 18, type: !42)
!48 = !DILocation(line: 18, column: 12, scope: !37)
!49 = !DILocalVariable(name: "resA", scope: !37, file: !1, line: 18, type: !42)
!50 = !DILocation(line: 18, column: 16, scope: !37)
!51 = !DILocalVariable(name: "resB", scope: !37, file: !1, line: 18, type: !42)
!52 = !DILocation(line: 18, column: 22, scope: !37)
!53 = !DILocation(line: 20, column: 19, scope: !37)
!54 = !DILocation(line: 20, column: 2, scope: !37)
!55 = !DILocation(line: 21, column: 18, scope: !37)
!56 = !DILocation(line: 21, column: 2, scope: !37)
!57 = !DILocation(line: 22, column: 12, scope: !37)
!58 = !DILocation(line: 22, column: 16, scope: !37)
!59 = !DILocation(line: 22, column: 2, scope: !37)
!60 = !DILocation(line: 23, column: 12, scope: !37)
!61 = !DILocation(line: 23, column: 2, scope: !37)
!62 = !DILocation(line: 24, column: 12, scope: !37)
!63 = !DILocation(line: 24, column: 2, scope: !37)
!64 = !DILocalVariable(name: "i", scope: !65, file: !1, line: 26, type: !17)
!65 = distinct !DILexicalBlock(scope: !37, file: !1, line: 26, column: 2)
!66 = !DILocation(line: 0, scope: !65)
!67 = !DILocation(line: 26, column: 6, scope: !65)
!68 = !DILocation(line: 26, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 26, column: 2)
!70 = !DILocation(line: 26, column: 2, scope: !65)
!71 = !DILocation(line: 27, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !1, line: 26, column: 24)
!73 = !DILocation(line: 27, column: 11, scope: !72)
!74 = !DILocation(line: 27, column: 15, scope: !72)
!75 = !DILocation(line: 27, column: 21, scope: !72)
!76 = !DILocation(line: 27, column: 3, scope: !72)
!77 = !DILocation(line: 28, column: 7, scope: !72)
!78 = !DILocation(line: 28, column: 13, scope: !72)
!79 = !DILocation(line: 28, column: 19, scope: !72)
!80 = !DILocation(line: 28, column: 23, scope: !72)
!81 = !DILocation(line: 28, column: 3, scope: !72)
!82 = !DILocation(line: 29, column: 2, scope: !72)
!83 = !DILocation(line: 26, column: 21, scope: !69)
!84 = !DILocation(line: 26, column: 2, scope: !69)
!85 = distinct !{!85, !70, !86}
!86 = !DILocation(line: 29, column: 2, scope: !65)
!87 = !DILocation(line: 30, column: 29, scope: !37)
!88 = !DILocation(line: 30, column: 2, scope: !37)
!89 = !DILocation(line: 31, column: 31, scope: !37)
!90 = !DILocation(line: 31, column: 2, scope: !37)
!91 = !DILocation(line: 33, column: 2, scope: !37)
